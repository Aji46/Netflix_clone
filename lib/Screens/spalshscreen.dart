import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/widgets/bottom_nav_bar.dart';
import 'package:lottie/lottie.dart';

class spalshscreen extends StatefulWidget {
  const spalshscreen({super.key});

  @override
  State<spalshscreen> createState() => _spalshscreenState();
}

class _spalshscreenState extends State<spalshscreen> {


     @override
  void initState() {

    super.initState();
    Timer(Duration(seconds:3), () { 
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNavBar()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
       child: Lottie.asset("assets/netflix.json"),
    );
  }
}