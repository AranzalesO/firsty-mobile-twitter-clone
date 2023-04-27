import 'package:firsty/models/post.dart';
import 'package:firsty/constants/colors.dart';
import 'package:firsty/models/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final Post post;
  final onPostChange;
  final deletePostItem;

  const PostItem(
      {Key? key,
      required this.post,
      required this.onPostChange,
      required this.deletePostItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: ListTile(
          visualDensity: VisualDensity.compact,
          onTap: () {
            print("Clicked");
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: EdgeInsets.symmetric(
              horizontal: 17,
              vertical: 17), //Posicion del content en el recuadro blanco
          tileColor: Colors.white, // COLOR de recuadro blanco
          title: Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: SizedBox(
                      height: 40,
                      width: 40,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Icon(
                            Icons.person,
                            color: Colors.black,
                          ))),
                  title: Text(post.user!),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        post.likes.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: post.isFav
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : Icon(Icons.favorite_border, color: Colors.red),
                        onPressed: () {
                          onPostChange(post);
                        },
                      ),
                    ],
                  ),
                  subtitle: Text(
                    post.date!,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                    maxLines: 2,
                  ),
                  onTap: () {
                    //logic
                  },
                ),
                /*  Stack(
                  children: [
                    /* ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: AspectRatio(
                        aspectRatio: 16 /
                            9, // Establece la relación de aspecto de la imagen
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/bob.jpg'),
                        ),
                      ),
                    ), */
                    if (post.image != '')
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          fit: BoxFit.contain,
                          image: AssetImage('assets/images/bob.jpg'),
                        ),
                      ),
                    Container(
                      child: Text("oa"),
                    ),
                    Positioned(
                      right: 15,
                      top: 15,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: IconButton(
                          icon: post.isFav
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : Icon(Icons.favorite_border, color: Colors.red),
                          onPressed: () {
                            onPostChange(post);
                          },
                        ),
                      ),
                    )
                  ],
                ),
 */

                /* ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: AspectRatio(
                        aspectRatio: 16 /
                            9, // Establece la relación de aspecto de la imagen
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/bob.jpg'),
                        ),
                      ),
                    ), */
                if (post.image != '')
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/images/bob.jpg'),
                    ),
                  ),
                SizedBox(
                  height: 10,
                ),
                /*----------------------------------- DESCRIPTIO------------------------ */
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        post.description!,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          color: tdBlack,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          //logic
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 3, 116, 208)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.comment_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5),
                            Text('Comment',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          //logic
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 3, 116, 208)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.share_outlined, color: Colors.white),
                            SizedBox(width: 5),
                            Text(
                              'Share',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          /* Text(
            post.description!,
            style: TextStyle(
                fontSize: 16,
                color: tdBlack,
                decoration: post.isDone ? TextDecoration.lineThrough : null),
          ), */
          //-----------------------------BOTON DELETE-----------------------
          /* trailing: Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.symmetric(vertical: 12),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(5)),
            child: IconButton(
              color: Colors.white,
              iconSize: 18,
              icon: Icon(Icons.delete),
              onPressed: () {
                print("clicked on delete");
                deletePostItem(post.id);
              },
            ),
          ), */
        ));
  }
}
