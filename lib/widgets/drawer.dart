import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_declarations
    final imageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFX7kuwGdBPgeNp4Fk84B5QOke2-1lVdLvaw&usqp=CAU";

    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
           padding: EdgeInsets.zero,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              // ignore: prefer_const_constructors
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                // decoration: BoxDecoration(
                //   color: Colors.red
                // ),
                // ignore: prefer_const_constructors
                accountName: Text("Abhishek Pandit"),
                // ignore: prefer_const_constructors
                accountEmail: Text("abhishekpanditoff@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
             ),
             // ignore: prefer_const_constructors
             ListTile(
              // ignore: prefer_const_constructors
              leading: Icon(
                CupertinoIcons.home,color: Colors.white,
              ),
              // ignore: prefer_const_constructors
              title: Text("Home",
              textScaleFactor: 1.2,
              // ignore: prefer_const_constructors
              style: TextStyle(
                color: Colors.white
              ),
              ),
             ),

                          // ignore: prefer_const_constructors
             ListTile(
              // ignore: prefer_const_constructors
              leading: Icon(
                CupertinoIcons.profile_circled,color: Colors.white,
              ),
              // ignore: prefer_const_constructors
              title: Text("Profile",
              textScaleFactor: 1.2,
              // ignore: prefer_const_constructors
              style: TextStyle(
                color: Colors.white
              ),
              ),
             ),

                         // ignore: prefer_const_constructors
             ListTile(
              // ignore: prefer_const_constructors
              leading: Icon(
                CupertinoIcons.mail,color: Colors.white,
              ),
              // ignore: prefer_const_constructors
              title: Text("Mail",
              textScaleFactor: 1.2,
              // ignore: prefer_const_constructors
              style: TextStyle(
                color: Colors.white
              ),
              ),
             ),
          ],
        ),
      ),
    );
  }
}