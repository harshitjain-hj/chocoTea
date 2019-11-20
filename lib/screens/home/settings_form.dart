import 'package:choco_tea/shared/constants.dart';
import 'package:flutter/material.dart';

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
            decoration: textInputDecoration,
            validator: (val) => val.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(height: 10.0),
          DropdownButtonFormField(
            //value: _currentTypes ?? '0',
            decoration: textInputDecoration,
            items: types.map((type) {
              return DropdownMenuItem(
                value: type,
                child: Text('$type Tea'),
              );
            }).toList(),
            onChanged: (val) => setState(() => _currentTypes = val ),
          ),
          Slider(
            value: (_currentCount ?? 100 ).toDouble(),
            activeColor: Colors.brown[_currentCount ?? 100],
            inactiveColor: Colors.brown[_currentCount ?? 100],
            min: 100.0,
            max: 900.0,
            divisions: 8,
            onChanged: (val) => setState(() => _currentCount = val.round()),            
          ),
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
  }
}