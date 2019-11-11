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
  teas.forEach((tea) {
    print(tea.name);
    print(tea.type);
    print(tea.count);
  });

    return Container(
      
    );
  }
}