import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:using_riverpod/util/stream_util.dart';

class LoadingEvent extends StreamEvent {
  LoadingEvent(bool isLoading) : super(isLoading);
}

class SnackbarEvent extends StreamEvent {
  SnackbarEvent(SnackBar snackBar) : super(snackBar);
}

class BaseController {
  // controller
  final _controller = StreamController<StreamEvent>.broadcast();

  // 出力
  Stream<StreamEvent> get output => this._controller.stream;

  // loading処理
  void onStartLoading() {
    this._controller.sink.add(LoadingEvent(true));
  }

  // loading処理
  void onEndLoading() {
    this._controller.sink.add(LoadingEvent(false));
  }

  // snackbar表示
  void onSnackbar(SnackBar snackBar) {
    this._controller.sink.add(SnackbarEvent(snackBar));
  }

  void dispose() {
    this._controller.close();
  }
}

class Base extends StatefulWidget {
  final Widget body;
  final BaseController controller;

  Base({this.body, BaseController controller})
      : this.controller = controller ?? BaseController();

  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  @override
  void initState() {
    super.initState();
    this.widget.controller.output.listen((event) {
      if (event is SnackbarEvent) {
        ScaffoldMessenger.of(context)
            .showSnackBar(event.returnValue<SnackbarEvent>());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // カーソルをはずす処理
        final FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: StreamBuilder<StreamEvent>(
            stream: this.widget.controller.output,
            builder: (context, snapshot) {
              return Stack(
                children: [
                  this.widget.body,
                  if (snapshot.data?.returnValue<LoadingEvent>() ?? false)
                    Stack(
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints.expand(),
                          child: Container(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
