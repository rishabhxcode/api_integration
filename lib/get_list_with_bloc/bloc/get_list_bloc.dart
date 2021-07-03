import 'dart:async';

import 'package:api_integration/get_list_with_bloc/model.dart';
import 'package:api_integration/get_list_with_bloc/nw_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_list_event.dart';
part 'get_list_state.dart';

class GetListBloc extends Bloc<GetListEvent, GetListState> {
  GetListBloc() : super(GetListInitial());
  NwRepository repo = NwRepository();

  @override
  Stream<GetListState> mapEventToState(
    GetListEvent event,
  ) async* {
    if (event is GetListEvent) {
      try {
        if (!event.isReset) {
          
        }
      } catch (e) {
        yield GetListFailedState();
      }
    }
  }
}
