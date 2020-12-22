import 'package:gallery_app/constants.dart';
import 'package:flutter/material.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> locate = ['North', 'South', 'East', 'West', 'Overseas'];

  // form values
  String _currentDesc;
  String _currentLocation;
  String _currentTime;
  String _currentFolderName;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Update your brew settings.',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val) =>
                val.isEmpty ? 'Please enter a description' : null,
            onChanged: (val) => setState(() => _currentDesc = val),
          ),
          SizedBox(height: 10.0),
          DropdownButtonFormField(
            value: _currentLocation ?? '0',
            decoration: textInputDecoration,
            items: locate.map((locate) {
              return DropdownMenuItem(
                value: locate,
                child: Text('$locate'),
              );
            }).toList(),
            onChanged: (val) => setState(() => _currentLocation = val),
          ),
          SizedBox(height: 10.0),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val) => val.isEmpty ? 'Please enter time' : null,
            onChanged: (val) => setState(() => _currentTime = val),
          ),
          SizedBox(height: 10.0),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val) =>
                val.isEmpty ? 'Please enter latest folder name' : null,
            onChanged: (val) => setState(() => _currentFolderName = val),
          ),
          RaisedButton(
              color: Colors.pink[400],
              child: Text(
                'Update',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                print(_currentDesc);
                print(_currentLocation);
                print(_currentTime);
                print(_currentFolderName);
              }),
        ],
      ),
    );
  }
}
