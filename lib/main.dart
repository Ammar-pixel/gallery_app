import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/gallery.dart';
import 'package:gallery_app/services/passcode_screen.dart';
import 'package:local_auth/local_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final LocalAuthentication localAuth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gallery Demo',
      home: Material(
        child: Center(
          child: Builder(builder: (context) {
            return RaisedButton(
              onPressed: () async {
                bool weCanCheckBiometrics = await localAuth.canCheckBiometrics;
                if (weCanCheckBiometrics) {
                  bool authenticated =
                      await localAuth.authenticateWithBiometrics(
                    localizedReason: "Authenticate to see gallery.",
                  );
                  if (authenticated) {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => Gallery()),
                    );
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => PassCodeScreen(
                              title: 'PassCodeScreen',
                            )));
                  }
                }
              },
              child: Text('Open Gallery'),
            );
          }),
        ),
      ),
    );
  }
}
