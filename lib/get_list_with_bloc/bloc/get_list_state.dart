part of 'get_list_bloc.dart';

abstract class GetListState extends Equatable {
  const GetListState();
  @override
  List<Object> get props => [];
}

class GetListInitial extends GetListState {}

class GettingListState extends GetListState {}

class GotListState extends GetListState {
  final bool isReachedMax;
  final List<Post> posts;

  GotListState({required this.posts, this.isReachedMax = false});

  GotListState copyWith({required List<Post> newPosts, bool? isReachedMax}) {
    return GotListState(
        posts: posts + newPosts,
        isReachedMax: isReachedMax ?? this.isReachedMax);
  }
}

class GetListFailedState extends GetListState {}
