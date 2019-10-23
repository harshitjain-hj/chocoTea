//Checks whether to send user to home or auth page

import 'package:choco_tea/screens/authenticate/authenticate.dart';
import 'package:choco_tea/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    // return either home or authenticate widget
    return Authenticate();
  }
}