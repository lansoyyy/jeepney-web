import 'package:flutter/material.dart';

import '../../widgets/text_widget.dart';

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
              SizedBox(
                height: MediaQuery.of(context).size.height * 1,
                width: MediaQuery.of(context).size.width * 1,
                child: GridView.builder(
                    itemCount: 100,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5),
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
                                backgroundImage:
                                    AssetImage('assets/images/profile.png'),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextRegular(
                                      text: 'Name: Name',
                                      fontSize: 12,
                                      color: Colors.black),
                                  TextRegular(
                                      text: 'Address: Address',
                                      fontSize: 12,
                                      color: Colors.black),
                                  TextRegular(
                                      text: 'Contact #: Contact No.',
                                      fontSize: 12,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
