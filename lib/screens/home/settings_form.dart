import 'package:choco_tea/models/user.dart';
import 'package:choco_tea/services/database.dart';
import 'package:choco_tea/shared/constants.dart';
import 'package:choco_tea/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> types = ['Chocolate', 'Elaichi', 'Ginger', 'Rose'];

  // form values
  String _currentName;
  String _currentTypes;
  int _currentCount;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){

          UserData userData = snapshot.data;

          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  'Update your tea settings.',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: userData.name,
                  decoration: textInputDecoration,
                  validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                  onChanged: (val) => setState(() => _currentName = val),
                ),
                SizedBox(height: 10.0),
                DropdownButtonFormField(
                  //value: _currentTypes ?? userData.type,
                  decoration: textInputDecoration,
                  items: types.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text('$type Tea'),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _currentTypes = val ),
                ),
               
                // Container(
                //   child: Center(
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       children: <Widget>[
                //         IconButton(
                //           icon: new Icon(Icons.remove),
                //           onPressed: () => setState(() => _currentCount-- )
                //         ),
                //         Text((_currentCount ?? userData.count).toString()),
                //         IconButton(
                //           icon: new Icon(Icons.add),
                //           onPressed: () => setState(() => _currentCount++ )
                //           ),
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(height: 10.0),
                RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    print(_currentName);
                    print(_currentTypes);
                    print(_currentCount);
                  }
                ),
              ],
            ),
        );
        } else {
          return Loading();
        }
        
      }
    );
  }
}