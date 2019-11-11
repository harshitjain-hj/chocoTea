import 'package:choco_tea/models/tea.dart';
import 'package:flutter/material.dart';

class TeaTile extends StatelessWidget {
  
  final Tea tea;
  TeaTile({ this.tea });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[300],
            child: Text(tea.count.toString()),
          ),
          title: Text(tea.name),
          subtitle: Text(tea.type),
        ),
      ),
    );
  }
}