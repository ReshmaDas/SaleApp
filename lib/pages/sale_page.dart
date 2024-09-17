// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sale/controller.dart/home_controller.dart';
// import 'package:sale/pages/add_new.dart';

// import '../modelclass.dart';
// import '../widgets/custumTextField.dart';

// class SalePage extends StatelessWidget {
//   final itemName;

//   final itemQantity;
//   final unit;
//   final rate;
//   final taxName;

//   SalePage(
//       {super.key,
//       this.itemName,
//       this.itemQantity,
//       this.unit,
//       this.rate,
//       this.taxName});
//   TextEditingController customerName = TextEditingController();
//   TextEditingController phnNumber = TextEditingController();
//   TextEditingController billingAddress = TextEditingController();
//   final CollectionReference products =
//       FirebaseFirestore.instance.collection('products');

//   void addSale(Product product) {
//     // Convert the Product object to a Map and add to Firestore
//     products.add(product.toMap()).then((value) {
//       print("Sale added successfully");
//     }).catchError((error) {
//       print("Failed to add sale: $error");
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     double width = size.width;
//     double height = size.height;
//     final homeController = Get.put(HomeController());
//     return Scaffold(
//       body: Container(
//         height: height,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               decoration: const BoxDecoration(color: Colors.greenAccent),
//               margin: const EdgeInsets.all(4),
//               child: Column(
//                 children: [
//                   CustomTextField(
//                     controller: customerName,
//                     labelText: 'Customer',
//                     onSave: (val) {},
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Billing Name(Optional)';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   CustomTextField(
//                     controller: billingAddress,
//                     labelText: 'Billing Name(Optional)',
//                     onSave: (val) {},
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return '';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   CustomTextField(
//                     controller: phnNumber,
//                     labelText: 'Phone Number',
//                     onSave: (val) {},
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return '';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(),
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       height: 50,
//                       child: InkWell(
//                         onTap: () {
//                           Get.to(AddNewPage());
//                         },
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Container(
//                                 decoration: BoxDecoration(
//                                     color: Colors.blueAccent,
//                                     borderRadius: BorderRadius.circular(50)),
//                                 child: const Padding(
//                                   padding: EdgeInsets.all(3.0),
//                                   child: Icon(
//                                     Icons.add,
//                                     color: Colors.white,
//                                   ),
//                                 )),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             Text('Add Items')
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Total Amount',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   Obx(() {
//                     final vl = homeController.taxAmount.value;
//                     return Text(
//                       vl == 0.0 ? '.................' : vl.toString(),
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     );
//                   })
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   height: 50,
//                   width: width / 2 - 10,
//                   decoration: BoxDecoration(color: Colors.white),
//                   child: Center(child: Text('Save & New')),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     // Example of adding a sale
//                     final newSale = Product(
//                       address: billingAddress.text,
//                       items: ItemDetails(
//                         itemName: itemName,
//                         quantity: itemQantity,
//                         rate: rate,
//                         unit: unit,
//                       ),
//                       nameCustomer: customerName.text,
//                       phoneNumber: phnNumber.text,
//                       totalAmount: homeController.taxAmount.value.toString(),
//                       // date: DateTime.now(),  // Ensure current date is added
//                     );

//                     addSale(newSale);
//                   },
//                   child: Container(
//                     height: 50,
//                     width: width / 2 - 10,
//                     decoration: BoxDecoration(color: Colors.red),
//                     child: Center(
//                       child: Text(
//                         'Save',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale/controller.dart/home_controller.dart';
import 'package:sale/pages/add_new.dart';
import 'package:sale/pages/homepage.dart';
import '../modelclass.dart';
import '../widgets/custumTextField.dart';

class SalePage extends StatelessWidget {
  final customerName;
  final String? itemName;
  final int? itemQantity;
  final String? unit;
  final double? rate;
  final String? taxName;

  SalePage(
      {super.key,
      this.itemName,
      this.itemQantity,
      this.unit,
      this.rate,
      this.taxName,
      this.customerName});

  final CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  void addSale(Product product) {
    products.add(product.toMap()).then((value) {
      print("Sale added successfully");
      Get.snackbar(
        'Success',
        "Sale added successfully",
        colorText: Colors.white,
        backgroundColor: Colors.lightBlue,
        icon: const Icon(Icons.add_alert),
      );

      Get.to(HomePage());
    }).catchError((error) {
      print("Failed to add sale: $error");
    });
  }

  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 218, 218),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90.0), // here the desired height
          child: AppBar(
              elevation: 4,
              backgroundColor: Colors.white,
              title: Text('Sale'),
              actions: [
                Icon(Icons.settings),
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(140),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: width / 2,
                          child: Column(
                            children: [
                              Text('Invoice No.'),
                              Obx(() => Text(
                                    '${homeController.randomNumber}',
                                    style: TextStyle(fontSize: 18),
                                  )),
                            ],
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.black,
                          thickness: 2,
                        ),
                        Container(
                          child: Column(
                            children: [
                              Text('Date'),
                              Obx(() {
                                return Text(
                                  '${homeController.selectedDate.value.toLocal().toString().substring(0, 10)}',
                                  style: TextStyle(fontSize: 16),
                                );
                              }),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )

              // ...
              )),
      body: Container(
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                height: 30,
                width: width,
                child: Text('Firm Name: '),
              ),
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              margin: const EdgeInsets.all(4),
              child: Column(
                children: [
                  CustomTextField(
                    controller: homeController.customerName,
                    labelText: 'Customer',
                    onSave: (val) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Customer name is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: homeController.billingAddress,
                    labelText: 'Billing Address',
                    onSave: (val) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Billing Address is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: homeController.phnNumber,
                    labelText: 'Phone Number',
                    onSave: (val) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone Number is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      height: 50,
                      child: InkWell(
                        onTap: () {
                          Get.to(AddNewPage());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(50)),
                                child: const Padding(
                                  padding: EdgeInsets.all(3.0),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                )),
                            const SizedBox(width: 5),
                            Text('Add Items')
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Amount',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Obx(() {
                    final vl = homeController.taxAmount.value;
                    return Text(
                      vl == 0.0 ? '.................' : vl.toString(),
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    );
                  }),
                ],
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: width / 2 - 10,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Center(child: Text('Save & New')),
                ),
                InkWell(
                  onTap: () {
                    final newSale = Product(
                      address: homeController.billingAddress.text,
                      items: ItemDetails(
                        itemName: itemName ?? '',
                        quantity: itemQantity ?? 0,
                        rate: rate?.toString() ?? '',
                        unit: unit ?? '',
                      ),
                      nameCustomer: homeController.customerName.text,
                      phoneNumber: homeController.phnNumber.text,
                      totalAmount: homeController.taxAmount.value.toString(),
                      date: DateTime.now(),
                    );

                    addSale(newSale);
                  },
                  child: Container(
                    height: 50,
                    width: width / 2 - 10,
                    decoration: BoxDecoration(color: Colors.red),
                    child: Center(
                      child:
                          Text('Save', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
