import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:job_app/LoginPage/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( const MyApp());
}

class MyApp extends StatefulWidget {


  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder:(context,snapshot)
      {
        if (snapshot.connectionState == ConnectionState.waiting)
        {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('job hub app is being initialized',
                  style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          );
        }
        else if(snapshot.hasError)
        {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('An error has been occurred',
                  style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Signatra'
                  ),
                ),
              ),
            ),
          );
        }
        return MaterialApp(
          debugShowCheckedModeBanner:false ,
          title: 'job hub app',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            primarySwatch: Colors.blue,
          ),
          home: Login(),
        );
      }
    );
  }
}

 