import 'package:flutter/material.dart';

import '/core/widgets/loading_widget.dart';

class CtrlFutureBuilder<T> extends StatefulWidget {
  const CtrlFutureBuilder(
      {Key? key, required this.future, required this.builder})
      : super(key: key);
  final Future<T> future;
  final Widget Function(T data) builder;

  @override
  _CtrlFutureBuilderState<T> createState() => _CtrlFutureBuilderState<T>();
}

class _CtrlFutureBuilderState<T> extends State<CtrlFutureBuilder<T>> {
  late final Future<T> initFuture;
  @override
  void initState() {
    super.initState();
    initFuture = widget.future;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initFuture,
      builder: (context, AsyncSnapshot<T> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return LoadingWidget();
        }
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        if (snapshot.hasData) {
          return widget.builder(snapshot.data!);
        }
        return Center(child: Text('Boş'));
      },
    );
  }
}
