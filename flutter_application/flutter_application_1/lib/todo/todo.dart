import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "TO-DO",
        home: Scaffold(
            backgroundColor: Color.fromARGB(255, 236, 236, 235),
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.white,
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                )
              ],
              title: Text(
                "TO-DO",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              leading: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 40),
                  child: Text(
                    "All TO-DO Tasks",
                    style: TextStyle(
                      color: const Color.fromARGB(224, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 233, 183, 47),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(
                          8.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "You have to return the chemistry book to the Central Library at 9.00 am",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(height: 10),
                            Divider(
                              color: Color.fromARGB(255, 39, 21, 21),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.edit,
                                    color: Colors.greenAccent,
                                  ),
                                  Icon(
                                    Icons.delete,
                                    color:
                                        const Color.fromARGB(255, 228, 244, 54),
                                  ),
                                  Icon(
                                    Icons.done,
                                    color: Colors.blueGrey,
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                ),
              ],
            )));
  }
}
