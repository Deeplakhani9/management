import 'package:flutter/material.dart';

import '../../helpers/fireStore_helper.dart';

class clerk1 extends StatefulWidget {
  const clerk1({Key? key}) : super(key: key);

  @override
  State<clerk1> createState() => _clerk1State();
}

class _clerk1State extends State<clerk1> {
  List data = [];
//  Map<Object, Object> editValue = {};

  String? title;
  String? subTitle;

  final GlobalKey<FormState> notesKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController subTitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Clerk Add uers imformation",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontFamily: "Poppins",
          ),
        ),
        backgroundColor: const Color(0xff03111C),
        elevation: 0,
      ),
      body: Center(
        child: StreamBuilder(
          stream: FireStoreHelper.fireStoreHelper.getuers(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error :- ${snapshot.error} ",style: TextStyle(
                    color: Colors.white
                ),),
              );
            } else if (snapshot.hasData) {
              data = snapshot.data!.docs;

              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, i) {
                  print("=======================================");

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.of(context)
                                .pushNamed('editNotePage', arguments: data[i]);
                          });
                        },
                        onLongPress: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text(
                                    "Are You Sure?",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff03111C),
                                    ),
                                  ),
                                  content: Text(
                                    "You Are About Delete This Note.",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        "No",
                                        style: TextStyle(
                                            color: Color(0xff03111C),
                                            fontSize: 15),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        FireStoreHelper.fireStoreHelper
                                            .removeuersiom(id: data[i]['id']);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xff03111C),
                                      ),
                                      child: const Text(
                                        "Yes",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    )
                                  ],
                                  backgroundColor: Colors.white,
                                );
                              });
                        },
                        child: Ink(
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            margin: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey.shade500,
                                width: 1,
                              ),
                            ),
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data[i]['title'],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                                Text(
                                  data[i]['subtitle'],
                                  style: TextStyle(color: Colors.grey.shade500),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data[i]['date'],
                                      style: TextStyle(color: Colors.grey.shade500),
                                    ),
                                    Text(
                                      data[i]['time'],
                                      style: TextStyle(color: Colors.grey.shade500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
      backgroundColor: const Color(0xff03111C),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.of(context).pushNamed('3');
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
