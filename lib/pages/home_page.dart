import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learn_firebase_g9/models/car_model.dart';
import 'package:learn_firebase_g9/services/cloud_firestore_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  List<QueryDocumentSnapshot<Map<String, dynamic>>> list = [];

  Future<void> read() async {
    list = await CFSService.readAllData(collectionPath: "car");
    isLoading = true;
    setState(() {});
  }

  Future<void> create() async {
    // Car car = Car(name: "Cobalt", color: "white", cost: 13000, speed: 210, madeYear: 2023, type: "Petrol");
    await CFSService.createCollection(
        collectionPath: "car", data: {"memory": "128", "model": "iPhone 9", "name":"qwerty"});
  }

  @override
  void initState() {
    read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: isLoading
          ? Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return MaterialButton(
                          onPressed: () {},
                          child: ListTile(
                            title: Text(list[index].data()["name"]),
                          ),
                        );
                      },
                    ),
                  ),
                  MaterialButton(
                    color: Colors.blueGrey,
                    onPressed: () async {
                      await create();
                      await read();
                    },
                    child: const Text("Create"),
                  )
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
