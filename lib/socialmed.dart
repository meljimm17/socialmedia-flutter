import 'package:flutter/material.dart';
import 'package:socialmedia/model/userdata.dart';
import 'package:socialmedia/views/friendlist.dart';
import 'package:socialmedia/views/infoheader.dart';
import 'package:socialmedia/views/mainheader.dart';
import 'package:socialmedia/views/postlist.dart';

class Socialmedia extends StatefulWidget {
  const Socialmedia({super.key});

  @override
  State<Socialmedia> createState() => _SocialmediaState();
}

class _SocialmediaState extends State<Socialmedia> {
  final Userdata userdata = Userdata();

  static const TextStyle followTxtStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Mainheader(userdata: userdata),
          Infoheader(userdata: userdata),
          Friendlist(userdata: userdata),
          Postlist(userdata: userdata),
        ],
      ),
    );
  }
}