import 'package:choco_tea/screens/home/tea_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:choco_tea/models/tea.dart';

class TeaList extends StatefulWidget {
  @override
  _TeaListState createState() => _TeaListState();
}

class _TeaListState extends State<TeaList> {
  @override
  Widget build(BuildContext context) {

    final teas = Provider.of<List<Tea>>(context);

    return ListView.builder(
      itemCount: teas.length,
      itemBuilder: (context, index) {
        return TeaTile(tea: teas[index]);
      },
    );
  }
}