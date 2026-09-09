import 'package:flutter/material.dart';
import 'package:socialmedia/model/userdata.dart';
import 'package:socialmedia/model/userpost.dart';
import 'package:socialmedia/views/profile.view.dart';

class Postlist extends StatefulWidget {
  const Postlist({super.key, required this.userdata});

  final Userdata userdata;

  @override
  State<Postlist> createState() => _PostlistState();
}

class _PostlistState extends State<Postlist> {
  static const TextStyle nametxtStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  void gotoPage(BuildContext context, dynamic page) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  Widget buttons(Userpost userPost) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: userPost.isLiked ? Colors.grey : Colors.blue,
            ),
            onPressed: () {
              setState(() {
                userPost.isLiked = !userPost.isLiked;
              });
            },
            icon: const Icon(Icons.thumb_up),
            label: const Text('Like'),
          ),
          TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey,
            ),
            onPressed: () {},
            icon: const Icon(Icons.chat_bubble),
            label: const Text('Comment'),
          ),
          TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey,
            ),
            onPressed: () {},
            icon: const Icon(Icons.share),
            label: const Text('Share'),
          ),
        ],
      );

  Widget postCount(Userpost userPost) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('${userPost.numComments} Comments'),
          const SizedBox(width: 20),
          Text('${userPost.numShare} Shares'),
        ],
      );

  Widget postImage(Userpost userPost) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 350,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(userPost.posting),
              fit: BoxFit.fill,
            ),
          ),
        ),
      );

  Widget postHeader(Userpost userPost) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(userPost.userImg),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userPost.userName,
                style: nametxtStyle,
              ),
              Row(
                children: [
                  Text(userPost.time),
                  const Text(' • '),
                  const Icon(
                    Icons.people,
                    size: 18,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ],
      );

  Widget showPost(Userpost userPost) => Column(
        children: [
          postHeader(userPost),
          Container(
            margin: const EdgeInsets.all(8),
            child: Row(
              children: [
                Text(
                  userPost.postContent,
                  style: nametxtStyle,
                ),
              ],
            ),
          ),
          postImage(userPost),
          postCount(userPost),
          const Divider(),
          buttons(userPost),
          SizedBox(
            height: 15,
            child: Container(color: Colors.grey),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0, top: 12.0, bottom: 8.0),
          child: Text(
            'Posts',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: widget.userdata.userList.map((userPost) {
              return InkWell(
                onTap: () {
                  gotoPage(context, ProfileView(userPost: userPost));
                },
                child: showPost(userPost),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
