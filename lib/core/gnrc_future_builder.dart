import 'package:flutter/material.dart';
import 'package:kopgit_basic/core/widgets/loading_widget.dart';

class GenericFutureBuilder<T> extends StatefulWidget {
  final Future<T> future;
  final Widget Function(T data) builder;
  const GenericFutureBuilder(
      {Key? key, required this.future, required this.builder})
      : super(key: key);

  @override
  _GenericFutureBuilderState<T> createState() =>
      _GenericFutureBuilderState<T>();
}

class _GenericFutureBuilderState<T> extends State<GenericFutureBuilder<T>> {
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
          return const LoadingWidget();
        }

        if (snapshot.hasError) {
          // Bunun yerine üstten gelen hata oluştu kısmını ekleyebiliriz
          return Text(snapshot.error.toString());
        }

        if (snapshot.hasData) {
          return widget.builder(snapshot.data!);
        }

        return const Center(
          child: Text('Unexpected Results'),
        );
      },
    );
  }
}
