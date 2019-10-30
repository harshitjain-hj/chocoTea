//Checks whether to send user to home or auth page

import 'package:choco_tea/models/user.dart';
import 'package:choco_tea/screens/authenticate/authenticate.dart';
import 'package:choco_tea/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
    
    // return either home or authenticate widget
    if(user == null) {
      return Authenticate();
    } else {
      return Home();
    }

  }
}