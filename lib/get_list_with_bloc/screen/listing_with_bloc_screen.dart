import 'package:api_integration/get_list_with_bloc/bloc/get_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model.dart';

class ListingWithBlocScreen extends StatefulWidget {
  const ListingWithBlocScreen({Key? key}) : super(key: key);

  @override
  _ListingWithBlocScreenState createState() => _ListingWithBlocScreenState();
}

class _ListingWithBlocScreenState extends State<ListingWithBlocScreen> {
  @override
  void initState() {
    BlocProvider.of<GetListBloc>(context).add(GetListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: BlocBuilder<GetListBloc, GetListState>(builder: (context, state) {
        if (state is GotListState) {
          return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                return PostItem(post: state.posts[index]);
              });
        }
        return Center(child: CircularProgressIndicator());
      }),
    );
  }
}

class PostItem extends StatelessWidget {
  final Post post;
  const PostItem({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: Colors.grey.shade400),  
            borderRadius: BorderRadius.circular(8)),
        child: Column(children: [
          Text('${post.title}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          Divider(
            height: 20,
            thickness: 1,
            color: Colors.orange,
          ),
          Text('${post.body}',
              style: TextStyle(
                  fontWeight: FontWeight.w400, color: Colors.grey[700]))
        ]));
  }
}
