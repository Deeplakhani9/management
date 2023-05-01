import 'package:flutter/material.dart';

import '../../helpers/fireStore_helper.dart';

class manager extends StatefulWidget {
  const manager({Key? key}) : super(key: key);

  @override
  State<manager> createState() => _managerState();
}

class _managerState extends State<manager> {
  DateTime date = DateTime.now();
  DateTime time = DateTime.now();

  String currentDate = "";
  String currentTime = "";

  String? title;
  String? subtitle;

  final GlobalKey<FormState> notesKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController subTitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              if (notesKey.currentState!.validate()) {
                notesKey.currentState!.save();

                await FireStoreHelper.fireStoreHelper.adduers(
                    adduers: title!,
                    uersimf: subtitle!,
                    date: currentDate,
                    time: currentTime);

                Navigator.of(context).pop();

                titleController.clear();
                subTitleController.clear();

                setState(() {
                  title = null;
                  subtitle = null;
                });
              }
            },
            icon: const Icon(
              Icons.done,
              color: Colors.white,
            ),
          )
        ],
        backgroundColor: const Color(0xff03111C),
        elevation: 0,
        title: const Text(""),
      ),
      backgroundColor: const Color(0xff03111C),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: notesKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    currentDate = "${date.day}/${date.month}/${date.year}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const Text(
                    " - ",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    currentTime = "${date.hour} : ${date.minute}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: titleController,
                onSaved: (val) {
                  title = val;
                },
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
                textInputAction: TextInputAction.next,
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Add Uers",
                  hintStyle: TextStyle(
                    fontSize: 30,
                    color: Color(
                      0xff8F9398,
                    ),
                  ),
                ),
              ),
              TextFormField(
                controller: subTitleController,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "please enter notes";
                  }
                },
                onSaved: (val) {
                  subtitle = val;
                },
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                cursorColor: Colors.white,
                maxLines: null,
                // expands: true,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  hintText: "User Imformation...",
                  hintStyle: TextStyle(
                    fontSize: 25,
                    color: Color(
                      0xff8F9398,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
