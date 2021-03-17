class StreamEvent {
  final Object _object;

  StreamEvent(this._object);

  Object returnValue<T>() {
    if (this is T) {
      return this._object;
    }
    return null;
  }
}
