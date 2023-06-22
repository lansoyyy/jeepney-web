import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../widgets/text_widget.dart';
import 'package:intl/intl.dart' show DateFormat, toBeginningOfSentenceCase;

class PassengersTab extends StatefulWidget {
  const PassengersTab({Key? key}) : super(key: key);

  @override
  State<PassengersTab> createState() => _PassengersTabState();
}

class _PassengersTabState extends State<PassengersTab> {
  late String filter = '';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 3,
                child: Container(
                  height: 40,
                  width: 400,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(100)),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        filter = value;
                      });
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Search passenger name',
                      hintStyle: TextStyle(fontFamily: 'QRegular'),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Users')
                      .where('usertype', isEqualTo: 'User')
                      .where('isActive', isEqualTo: true)
                      .where('name',
                          isGreaterThanOrEqualTo:
                              toBeginningOfSentenceCase(filter))
                      .where('name',
                          isLessThan: '${toBeginningOfSentenceCase(filter)}z')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      print(snapshot.error);
                      return const Center(child: Text('Error'));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Center(
                            child: CircularProgressIndicator(
                          color: Colors.black,
                        )),
                      );
                    }

                    final data = snapshot.requireData;
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 1,
                      width: MediaQuery.of(context).size.width * 1,
                      child: GridView.builder(
                          itemCount: data.docs.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4),
                          itemBuilder: ((context, index) {
                            return Card(
                              elevation: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue[100],
                                  borderRadius: BorderRadius.circular(7.5),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const CircleAvatar(
                                      minRadius: 50,
                                      maxRadius: 50,
                                      backgroundImage: AssetImage(
                                          'assets/images/profile.png'),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextRegular(
                                            text:
                                                'Name: ${data.docs[index]['name']}',
                                            fontSize: 14,
                                            color: Colors.black),
                                        TextRegular(
                                            text:
                                                'Email: ${data.docs[index]['email']}',
                                            fontSize: 14,
                                            color: Colors.black),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        TextRegular(
                                            text:
                                                'Latitude: ${data.docs[index]['location']['lat']}',
                                            fontSize: 14,
                                            color: Colors.black),
                                        TextRegular(
                                            text:
                                                'Longitude: ${data.docs[index]['location']['long']}',
                                            fontSize: 14,
                                            color: Colors.black),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
