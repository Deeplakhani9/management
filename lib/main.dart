import 'package:deep/views/screens/admin.dart';
import 'package:deep/views/screens/admin1.dart';
import 'package:deep/views/screens/clerk.dart';
import 'package:deep/views/screens/clerk1.dart';
import 'package:deep/views/screens/editpage.dart';
import 'package:deep/views/screens/employee.dart';
import 'package:deep/views/screens/employee1.dart';
import 'package:deep/views/screens/homepage.dart';
import 'package:deep/views/screens/manager.dart';
import 'package:deep/views/screens/manager1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>homepage(),
        '1':(context)=>admin(),
        'admin1':(context)=>admin1(),
        '2':(context)=>manager(),
        'manager1':(context)=>manager1(),
        '3':(context)=>clerk(),
        'clerk1':(context)=>clerk1(),
        '4':(context)=>employee(),
        'employee1':(context)=>employee1(),
        "editNotePage":(context)=>editpage(),
      },
    );
  }
}

