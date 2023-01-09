// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import 'package:test_project/utils/routes.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();


  moveToHome(BuildContext context) async {
      if(_formKey.currentState!.validate()){
      setState(() {
          changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
      changeButton = false;
      });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"), automaticallyImplyLeading: false,),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/login_image.png", fit: BoxFit.cover,),
              SizedBox(height: 20.0,),
              Text("Welcome $name", 
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold
              ),),
              
              Padding(padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                validator: (String? value) {
                  if(value!.isEmpty){
                     return "Username cannot be empty";
                  }else{
                    return null;
                  }
                },
                onChanged: (value) {
                  name = value;
                  setState(() {});
                },
                decoration: InputDecoration(
                  hintText: "Enter username",
                  labelText: "UserName"
                ),
              ),
               TextFormField(
                validator: (String? value) {
                  if(value!.isEmpty){
                     return "Password cannot be empty";
                  }else{
                    return null;
                  }
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter password",
                  labelText: "Password",
                ),
              ),
              SizedBox(height: 40,),
        
              Material(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                child: InkWell(
                  splashColor: Colors.red,
                  onTap: () => moveToHome(context),
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: changeButton ? 50 : 150,
                    height: 50,
                    alignment: Alignment.center,
                    // ignore: sort_child_properties_last
                    child: changeButton ? Icon(Icons.done, color: Colors.white,) : Text("Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                    ),
                    // decoration: BoxDecoration(
                    //   color: Colors.deepPurple,
                    //   // shape: changeButton ? BoxShape.circle : BoxShape.rectangle,
                    //   borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                    // )
                  ),
                ),
              )
        
              // ElevatedButton(
              // onPressed: () {
              //   Navigator.pushNamed(context, "/home");
              // }, 
              // style: TextButton.styleFrom(minimumSize: Size(150, 40)),
              // child: Text("login"))
                ],
              ),)
            ],
          ),
        ),
      )
    );
  }
}