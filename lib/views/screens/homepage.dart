import 'package:flutter/material.dart';

import '../../global.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        title: Text('Firebase'),
        backgroundColor: Color(0xff03111C),
      ),
      body: Container(
        color: Color(0xff03111C),
        child: SafeArea(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                           Column(
                               children: [
                                 Text("Only Admin",style: TextStyle(
                                   color: Colors.white,
                                   fontSize: 20,
                                 ),),
                                 Container(
                                   child: ElevatedButton(onPressed: (){
                                     Navigator.of(context).pushNamed('admin1');
                                     setState(() {
                                       Global.all=Global.admin;
                                     });
                                   }, child: Text("Admin"),),
                                 ),
                               ],
                             ),
                           Column(
                             children: [
                               Text("Only Manager",style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 20,
                               ),),
                               ElevatedButton(onPressed: (){
                                 Navigator.of(context).pushNamed('manager1');
                                 setState(() {
                                   Global.all=Global.manager;
                                 });
                               }, child: Text("Manager"),),
                             ],
                           ),
                           Column(
                             children: [
                               Text("Only Clerk",style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 20,
                               ),),
                               ElevatedButton(onPressed: (){
                                 Navigator.of(context).pushNamed('clerk1');
                                 setState(() {
                                   Global.all=Global.clerk;
                                 });
                               }, child: Text("Clerk"),),
                             ],
                           ),
                           Column(
                             children: [
                               Text("Only Employe",style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 20,
                               ),),
                               ElevatedButton(onPressed: (){
                                 Navigator.of(context).pushNamed('employee1');
                                 setState(() {
                                   Global.all=Global.employee;
                                 });
                               }, child: Text("Employe"),),
                             ],
                           ),
                ],
              ),
            ),),
      ),
    );
  }
}
