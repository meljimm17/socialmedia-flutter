import 'package:flutter/material.dart';
import 'package:socialmedia/model/friend.dart';
import 'package:socialmedia/model/userdata.dart';

 class Friendlist extends StatelessWidget {
  Friendlist({super.key, required this.userdata});

  final Userdata userdata;

  static const TextStyle followTxtStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  Widget friend(Friend friend) => Card(
    clipBehavior: Clip.antiAlias,
    child: Column(
      children: [
        SizedBox(
          height: 120,
          width: double.infinity,
          child: Image.asset(
            friend.img,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(friend.name),
        ),
      ],
    ),
  );

  Widget friendListGrid() => GridView.builder(
    shrinkWrap: true,
    physics: const BouncingScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      mainAxisExtent: 170,
    ),
      itemCount: userdata.friendList.length,
      itemBuilder: (BuildContext ctx, index) {
        return friend(userdata.friendList[index]);
      },
  );
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Row(
            children: [
              Text("Friends ", style: followTxtStyle)],
          ),
        ),
        Padding(padding: const EdgeInsets.only(left: 8.0),
        child: Row(children: [
          Text('${userdata.friendList.length} Friend')
        ],
        ),
        ),
        const SizedBox(height: 10),
        SizedBox(height: 380, child: friendListGrid()),
        SizedBox(height: 10, child: Container(color: Colors.grey)),
      ],
    );
  }
}