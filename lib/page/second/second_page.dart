import 'package:flutter/material.dart';
import 'package:using_riverpod/atom/base.dart';
import 'package:using_riverpod/atom/button.dart';
import 'package:using_riverpod/page/top/top_page.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Base(
      body: Container(
        child: Button(
          '遷移',
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) {
                  return TopPage();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
