import 'package:firsty/constants/colors.dart';
import 'package:firsty/models/post.dart';
import 'package:firsty/widgets/post__item.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final postList = Post.PostList();
  final _postController = TextEditingController();
  List<Post> _foundPost = [];

  @override
  void initState() {
    _foundPost = postList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  searchBox(),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          // -------------------TEXTO DE POST-----------
                          margin: EdgeInsets.only(top: 27, bottom: 20),
                          child: Text(
                            "Posts",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500),
                          ),
                        ),
                        // -------------------POSTS-------------------
                        for (Post posts in _foundPost.reversed)
                          PostItem(
                            post: posts,
                            onPostChange: _handleToDoChange,
                            deletePostItem: _deletePostItem,
                          ),
                        SizedBox(
                          height: 90,
                        ),
                      ],
                    ),
                  )
                ],
              )),
          //_________________________________________________________________________
          //                              INPUT CREATE POST                       /
          //========================================================================
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(bottom: 20, right: 10, left: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 10.0,
                            spreadRadius: 0.0),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: _postController,
                    decoration: InputDecoration(
                        hintText: 'Add a new post', border: InputBorder.none),
                  ),
                )),
                //_________________________________________________________________________
                //                               BUTTON ADD IMAGE                        /
                //========================================================================
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 10),
                  child: ElevatedButton(
                    child: Icon(Icons.add_photo_alternate_outlined,
                        color: Colors.white, size: 30),
                    onPressed: () {
                      // add method addImageToPost
                    },
                    style: ElevatedButton.styleFrom(
                      primary: tdBlue,
                      minimumSize: Size(10, 60),
                      elevation: 10,
                    ),
                  ),
                ),
                //_________________________________________________________________________
                //                               BUTTON ADD POST                         /
                //========================================================================
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 40),
                    ),
                    onPressed: () {
                      _addPostItem(_postController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: tdBlue,
                      minimumSize: Size(60, 60),
                      elevation: 10,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

//_________________________________________________________________________
//                                Handle to change                        /
//========================================================================
  void _handleToDoChange(Post post) {
    setState(() {
      post.isFav = !post.isFav;
      if (post.isFav == true) {
        post.likes = post.likes! + 1;
      } else {
        post.likes = post.likes! - 1;
      }
    });
  }

//_________________________________________________________________________
//                                Delete post                             /
//========================================================================
  void _deletePostItem(String id) {
    setState(() {
      postList.removeWhere((item) => item.id == id);
    });
  }

//_________________________________________________________________________
//                                Create post                             /
//========================================================================
  void _addPostItem(String description) {
    setState(() {
      postList.add(Post(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          description: description,
          date: '1 min',
          imageUser: '',
          user: 'juan'));
    });
    _postController.clear();
  }

//_________________________________________________________________________
//                              Search input                             /
//========================================================================
  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(Icons.search, color: tdBlack, size: 20),
            prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey)),
      ),
    );
  }

//_________________________________________________________________________
//                              Find posts                             /
//========================================================================
  void _runFilter(String enteredKeyword) {
    List<Post> results = [];
    if (enteredKeyword.isEmpty) {
      results = postList;
    } else {
      results = postList
          .where((item) => item.description!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundPost = results;
    });
  }

//_________________________________________________________________________
//                                H3AD POST                             /
//========================================================================
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0, // Elimina la sombra del Header
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            color: tdBlack,
            size: 30,
          ),
          Container(
            child:
                Text("Fisrty", style: TextStyle(color: tdBlack, fontSize: 27)),
          ),
          Container(
              height: 40,
              width: 40,
              child: Icon(
                Icons.person,
                color: Colors.black,
              ))
        ],
      ),
    );
  }
}
