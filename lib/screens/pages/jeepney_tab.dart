import 'package:flutter/material.dart';

import '../../widgets/text_widget.dart';

class JeepneyTab extends StatefulWidget {
  const JeepneyTab({Key? key}) : super(key: key);

  @override
  State<JeepneyTab> createState() => _JeepneyTabState();
}

class _JeepneyTabState extends State<JeepneyTab> {
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
                      hintText: 'Search plate number',
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
                            crossAxisCount: 3),
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
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                ),
                                height: 100,
                                width: 150,
                                child: Image.network(
                                    'https://th.bing.com/th/id/OIP.ET1Rhsd7HaQTZpPx3rZtzAHaFt?pid=ImgDet&rs=1',
                                    fit: BoxFit.cover),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextRegular(
                                      text: 'Jeepney Model',
                                      fontSize: 14,
                                      color: Colors.black),
                                  TextRegular(
                                      text: 'Color: Jeepney Color',
                                      fontSize: 14,
                                      color: Colors.black),
                                  TextRegular(
                                      text: 'Plate #: Plate Number',
                                      fontSize: 14,
                                      color: Colors.black),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextRegular(
                                      text: 'Driver: Name of Driver',
                                      fontSize: 14,
                                      color: Colors.black),
                                  TextRegular(
                                      text: 'Contact #: Contact No. of Driver',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
