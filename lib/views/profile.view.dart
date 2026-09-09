import 'package:flutter/material.dart';
import 'package:socialmedia/model/usercomment.dart';
import 'package:socialmedia/model/userdata.dart';
import 'package:socialmedia/model/userpost.dart';

class ProfileView extends StatelessWidget {
  ProfileView({
    super.key,
    required this.userPost,
  });

  final Userpost userPost;

  final Userdata userData = Userdata();

  // Text styles
  static const TextStyle nameTxtStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle boldTxtStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );

  static const TextStyle boldTxtStyle1 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  // ------------------------------------------------------------
  // COMMENT BUTTONS
  // ------------------------------------------------------------

  Widget commentBtn(Usercomment userComment) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(userComment.commenterTime),
            const SizedBox(width: 15),
            const Text('Like'),
            const SizedBox(width: 15),
            const Text('Reply'),
          ],
        ),
      );

  // ------------------------------------------------------------
  // COMMENT DESCRIPTION
  // ------------------------------------------------------------

  Widget commentDesc(Usercomment userComment) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userComment.commenterName,
              style: boldTxtStyle,
            ),

            const SizedBox(height: 5),

            Row(
              children: [
                Text(userComment.commenterContent),
              ],
            ),
          ],
        ),
      );

  // ------------------------------------------------------------
  // COMMENT SPACE
  // ------------------------------------------------------------

  Widget commentSpace(Usercomment userComment) => Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: commentDesc(userComment),
      );

  // ------------------------------------------------------------
  // COMMENTER PICTURE
  // ------------------------------------------------------------

  Widget commenterPic(Usercomment userComment) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: CircleAvatar(
          backgroundImage: AssetImage(
            userComment.commenterImg,
          ),
          radius: 20,
        ),
      );

  // ------------------------------------------------------------
  // COMMENTER LINE
  // ------------------------------------------------------------

  Widget userCommenterLine(
    Userpost userPost,
    Usercomment userComment,
  ) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          commenterPic(userComment),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commentSpace(userComment),
              commentBtn(userComment),
            ],
          ),
        ],
      );

  // ------------------------------------------------------------
  // USER POST DETAILS
  // ------------------------------------------------------------

  Widget userPostDetails(
    Userpost userPost,
    Usercomment userComment,
  ) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 15),

          userCommenterLine(
            userPost,
            userComment,
          ),
        ],
      );

  // ------------------------------------------------------------
  // COMMENTS SECTION
  // ------------------------------------------------------------

  Widget commenters(Userpost userPost) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Divider(
            color: Colors.grey,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              children: [
                Text(
                  userPost.numShare,
                  style: boldTxtStyle,
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              children: [
                Text(
                  'All comments',
                  style: boldTxtStyle1,
                ),
                const Icon(
                  Icons.arrow_drop_down,
                ),
              ],
            ),
          ),
        ],
      );

  // ------------------------------------------------------------
  // POST BUTTONS
  // ------------------------------------------------------------

  Widget buttons(Userpost userPost) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Divider(
            color: Colors.grey,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor:
                        userPost.isLiked ? Colors.grey : Colors.blue,
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.thumb_up,
                    size: 20,
                  ),
                  label: const Text('Like'),
                ),

                TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey,
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.chat_bubble,
                    size: 20,
                  ),
                  label: const Text('Comment'),
                ),

                TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey,
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    size: 20,
                  ),
                  label: const Text('Share'),
                ),
              ],
            ),
          ),
        ],
      );

  // ------------------------------------------------------------
  // USER LINE
  // ------------------------------------------------------------

  Widget userLine(Userpost userPost) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                userPost.userImg,
              ),
              radius: 20,
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userPost.userName,
                style: nameTxtStyle,
              ),

              const SizedBox(height: 5),

              Row(
                children: [
                  Text(userPost.time),
                  const Text(' • '),
                  const Icon(
                    Icons.group,
                    size: 15,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ],
      );

  // ------------------------------------------------------------
  // POST IMAGE
  // ------------------------------------------------------------

  Widget postImage(Userpost userPost) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(userPost.postContent),
              ],
            ),

            const SizedBox(height: 15),

            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                userPost.posting,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      );

  // ------------------------------------------------------------
  // BUILD
  // ------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        padding: EdgeInsets.zero,
        children: [
          userLine(userPost),
          postImage(userPost),
          buttons(userPost),
          commenters(userPost),
          ...userData.commentList.map(
            (userComment) => userPostDetails(userPost, userComment),
          ),
        ],
      ),
    );
  }
}

