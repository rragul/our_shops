import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:our_shops/model/shopModel.dart';

import 'login_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Shops> shopsDetails = [];

  @override
  void initState() {
    super.initState();
    fetchShopDetails();
  }

  void fetchShopDetails() async {
    var details = await FirebaseFirestore.instance.collection('shops').get();
    mapRecords(details);
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  mapRecords(QuerySnapshot<Map<String, dynamic>> details) {
    var _list = details.docs
        .map(
          (shop) => Shops(
            image: shop['image'],
            name: shop['name'],
            location: shop['location'],
          ),
        )
        .toList();

    setState(() {
      shopsDetails = _list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Shops'),
        leading: GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    scrollable: true,
                    title: const Text('Are you sure you want to logout?'),
                    actions: [
                      ElevatedButton(
                          child: const Text("Logout"),
                          onPressed: () {
                            FirebaseAuth.instance.signOut().then((value) =>
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage())));
                          })
                    ],
                  );
                });
          },
          child: const Icon(Icons.menu),
        ),
        actions: const <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: null,
          )
        ],
      ),
      body: shopsDetails.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: shopsDetails.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: shopsDetails[index].image != ''
                              ? DecorationImage(
                                  image:
                                      NetworkImage(shopsDetails[index].image),
                                  fit: BoxFit.cover)
                              : const DecorationImage(
                                  image: AssetImage('images/img.jpg'),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                shopsDetails[index].name,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Location: ${shopsDetails[index].location}',
                                style: const TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                              InkWell(
                                onTap: null,
                                child: Row(
                                  children: const [
                                    Icon(Icons.accessible_forward),
                                    Text('Tab to view Products'),
                                  ],
                                ),
                              ),
                              Row(
                                children: const [
                                  Icon(Icons.delivery_dining),
                                  Text('Between 2 to 4 days'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
