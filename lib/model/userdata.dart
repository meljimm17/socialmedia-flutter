import 'package:socialmedia/model/account.dart';
import 'package:socialmedia/model/friend.dart';
import 'package:socialmedia/model/usercomment.dart';
import 'package:socialmedia/model/userpost.dart';

class Userdata{
  List<Userpost> userList =[

    Userpost(
      userImg: 'assets/person1',
      userName: 'Yami Sukehiro',
      time: '2 hrs ago',
      postContent: 'Had a great day at the beach!',
      posting: 'assets/beach.jpg',
      numComments: "24",
      numShare: '5',
      isLiked: true, 

    ),

    Userpost(
      userImg: 'assets/person2.jfif',
      userName: 'Asta',
      time: '2 hrs ago',
      postContent: 'Woahh beach is awesome!',
      posting: 'assets/beachAsta.jfif',
      numComments: "20",
      numShare: '3',
      isLiked: true, 

    ),

    Userpost(
      userImg: 'assets/person3.jpg',
      userName: 'Luck',
      time: '2 hrs ago',
      postContent: 'Lets Fight!',
      posting: 'assets/beachLuck.jfif',
      numComments: "19",
      numShare: '1',
      isLiked: true, 

    ),

    Userpost(
      userImg: 'assets/person4.jfif',
      userName: 'Magma',
      time: '2 hrs ago',
      postContent: 'Waahhh beach!',
      posting: 'assets/beachMagma.jfif',
      numComments: "24",
      numShare: '5',
      isLiked: true, 

    ),

    Userpost(
      userImg: 'assets/person5.jfif',
      userName: 'Noelle',
      time: '2 hrs ago',
      postContent: 'Beach with Asta!',
      posting: 'assets/beachMagma.jfif',
      numComments: "21",
      numShare: '5',
      isLiked: true, 

    ),

    Userpost(
      userImg: 'assets/person6.jfif',
      userName: 'Vanessa',
      time: '2 hrs ago',
      postContent: 'With BlackBulls!',
      posting: 'assets/beachbulls.png',
      numComments: "24",
      numShare: '5',
      isLiked: true, 

    ),

  ];

  List<Friend> friendList = [

    Friend(img: 'assets/person1', name: "Yami Sukehiro"),
    Friend(img: 'assets/person2.jfif', name: "Asta"),
    Friend(img: 'assets/person3.jpg', name: "Luck"),
    Friend(img: 'assets/person4.jfif', name: "Magma"),
    Friend(img: 'assets/person5.jfif', name: "Noelle"),
    Friend(img: 'assets/person6.jfif', name: "Vanessa"),
  ];

  List<Usercomment> commentList = [
    Usercomment(commenterImg: 'assets/person2.jfif',
                commenterName: "Asta",
                commenterTime: '1 hr', 
                commenterContent: "woahhh let's goo backk!"),
    Usercomment(commenterImg: 'assets/person3.jfif',
                commenterName: "Magma",
                commenterTime: '1 hr', 
                commenterContent: "madadaaaaaaaaaa!"),
    Usercomment(commenterImg: 'assets/person3.jpg',
                commenterName: "Asta",
                commenterTime: '1 hr', 
                commenterContent: "FIGHT FIGHT FIGHT!"),
  ];

    Account myUserAccount = Account (name: "Asta",
                                    email: "asta@gmail.com",
                                    img: "assests/person2.jfif",
                                    numFollowers: "99",
                                    numPosts: "1",
                                    numFollowing: "10",
                                    numFriends: "10",
                                    );


  
}