import 'package:flutter/material.dart';
import 'package:mbs/custom_icons_icons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Title(color: Colors.white, child: Text("My Profile")),
          profilePicAndName,
          manageAccount,
          AppBar(

            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.home)),
              IconButton(onPressed: (){}, icon: Icon(CustomIcons.ticket)),
              IconButton(onPressed: (){}, icon: Icon(CustomIcons.cinema)),
              IconButton(onPressed: (){}, icon: Icon(Icons.person))
              // TextButton(onPressed: (){}, child: Image.asset('assets/movie_ticket.png')),
            ],
          )
        ],
      ),
    );
  }
}

Widget profilePicAndName = Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Icon(Icons.person),
    Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text("Hello,\n" + "Tom!"),
        ),
        Text('tbrown@ttu.edu'),
      ],
    )
  ],
);

Widget manageAccount = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('Manage account'),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.purple,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.person), Text('Personal information')],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.video_camera_back), Text('My cinema')]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.payment), Text('Saved payment accounts')],
            ),
          ],
        ),
      ),
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.exit_to_app),
        Text('Sign out')
      ],
    )
  ],
);
