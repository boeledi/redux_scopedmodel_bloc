import 'package:flutter/widgets.dart';

typedef BlocBuilder<T> = T Function();
typedef BlocDisposer<T> = Function(T);

abstract class BlocBase {
  void dispose();
}

class BlocProvider<T extends BlocBase> extends StatefulWidget {
  const BlocProvider({
    super.key,
    required this.child,
    required this.blocBuilder,
    this.blocDispose,
  });

  final Widget child;
  final BlocBuilder<T> blocBuilder;
  final BlocDisposer<T>? blocDispose;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T? of<T extends BlocBase>(BuildContext context) {
    final InheritedElement? inheritedElement = context
        .getElementForInheritedWidgetOfExactType<_BlocProviderInherited<T>>();
    if (inheritedElement == null) {
      return null;
    }

    final _BlocProviderInherited<T>? provider =
        inheritedElement.widget as _BlocProviderInherited<T>?;

    return provider?.bloc;
  }
}

class _BlocProviderState<T extends BlocBase> extends State<BlocProvider<T>> {
  late T bloc;

  @override
  void initState() {
    super.initState();
    bloc = widget.blocBuilder();
  }

  @override
  void dispose() {
    if (widget.blocDispose != null) {
      widget.blocDispose?.call(bloc);
    } else {
      bloc.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _BlocProviderInherited<T>(
      bloc: bloc,
      child: widget.child,
    );
  }
}

class _BlocProviderInherited<T extends BlocBase> extends InheritedWidget {
  const _BlocProviderInherited({
    Key? key,
    required Widget child,
    required this.bloc,
  }) : super(key: key, child: child);

  final T bloc;

  @override
  bool updateShouldNotify(_BlocProviderInherited<T> oldWidget) => false;
}
