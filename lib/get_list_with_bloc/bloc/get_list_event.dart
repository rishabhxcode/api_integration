part of 'get_list_bloc.dart';

class GetListEvent extends Equatable {
  final bool isReset;

  GetListEvent({this.isReset = false});
  @override
  List<Object> get props => [false];
}
