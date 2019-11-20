import 'package:choco_tea/models/tea.dart';
import 'package:choco_tea/screens/home/settings_form.dart';
import 'package:choco_tea/screens/home/tea_list.dart';
import 'package:choco_tea/services/auth.dart';
import 'package:choco_tea/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();
  
  @override
  Widget build(BuildContext context) {
    
    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }
  
    return StreamProvider<List<Tea>>.value(
      value: DatabaseService().teas,
        child: Scaffold(
        appBar: AppBar(
          title: Text('ChocoTea'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('settings'),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: TeaList(),
      ),
    );
  }
}