import 'package:redux_scopedmodel_bloc/case1/redux/application_state.dart';

class ReduxPageViewModel {
  final ApplicationState state;
  final void Function(dynamic action) dispatchAction;

  ReduxPageViewModel({
    this.state,
    this.dispatchAction,
  });
}