import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class TeaList extends StatefulWidget {
  @override
  _TeaListState createState() => _TeaListState();
}

class _TeaListState extends State<TeaList> {
  @override
  Widget build(BuildContext context) {

    final teas = Provider.of<QuerySnapshot>(context);
    //print(teas.documents);
  for (var doc in teas.documents) {
    print(doc.data);
  }
    return Container(
      
    );
  }
}