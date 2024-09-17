import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale/controller.dart/home_controller.dart';
import 'package:sale/pages/sale_page.dart';
import 'package:sale/widgets/homeContainer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final homeController = Get.put(HomeController());

  // List<Widget> widgets = [
  //   const Text('Home'),
  //   const Text('DASHBOARD'),
  //   const Text('ITEMS'),
  //   const Text('MENU'),
  //   const Text('GET PREMIUM'),
  // ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 106, 159, 202),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0), // here the desired height
          child: AppBar(
              elevation: 4,
              backgroundColor: Colors.white,
              title: const Row(
                children: [
                  Icon(
                    Icons.home_filled,
                    color: Color.fromARGB(255, 109, 155, 233),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('xianinfotech LLP'),
                ],
              ),
              actions: [
                Icon(Icons.notifications),
                SizedBox(
                  width: 15,
                ),
                Icon(Icons.settings),
                SizedBox(
                  width: 15,
                ),
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 38,
                      width: width / 2 - 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.red),
                        color: Color.fromARGB(255, 239, 191, 188),
                      ),
                      child: Center(
                        child: Text(
                          'Transaction Details',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 38,
                      width: width / 2 - 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.grey),
                        // color: Color.fromARGB(255, 239, 191, 188),
                      ),
                      child: const Center(
                        child: Text(
                          'Party Details',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              )

              // ...
              )),
      body: Stack(children: [
        Obx(() {
          return IndexedStack(
            index: homeController.selecteddIndex.value,
            children: [
              HomeContainer(),
              const Text('DASHBOARD'),
              const Text('ITEMS'),
              const Text('MENU'),
              const Text('GET PREMIUM'), // Profile Screen
            ],
          );
        }),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
              ),
              child: Container(
                height: 50,
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40), color: Colors.red),
                child: FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: () {
                    Get.to(SalePage());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.currency_rupee,
                        color: Colors.white,
                      ),
                      Text(
                        'Add New Sale',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ]),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: homeController.selecteddIndex.value,
          onTap: (index) {
            homeController.selecteddIndex.value = index; // Update index
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "DASHBOARD"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "ITEMS"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "MENU"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "GET PREMIUM"),
          ],
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
        );
      }),
    );
  }
}
