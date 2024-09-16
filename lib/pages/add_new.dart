// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sale/controller.dart/home_controller.dart';
// import 'package:sale/pages/sale_page.dart';
// import 'package:sale/widgets/custumTextField.dart';

// class AddNewPage extends StatelessWidget {
//   AddNewPage({super.key});
//   final homeController = Get.put(HomeController());

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     double width = size.width;
//     double height = size.height;
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 232, 230, 230),
//       appBar: AppBar(
//         title: Padding(
//           padding: const EdgeInsets.only(right: 10),
//           child: Text('Add Items to Sale'),
//         ),
//         actions: [Icon(Icons.settings)],
//       ),
//       body: Container(
//         height: height,
//         child: Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(color: Colors.white),
//               margin: EdgeInsets.all(4),
//               child: Column(
//                 children: [
//                   CustomTextField(
//                     controller: homeController.itemName,
//                     labelText: 'Item Name',
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
//                   Row(
//                     children: [
//                       Container(
//                         width: width / 2,
//                         child: CustomTextField(
//                           controller: homeController.quantity,
//                           labelText: 'Quantity',
//                           onSave: (val) {},
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return '';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                       Obx(() => Container(
//                             width: width / 2 - 10,
//                             decoration: BoxDecoration(
//                                 border: Border.all(),
//                                 borderRadius: BorderRadius.circular(10)),
//                             child: Padding(
//                               padding: const EdgeInsets.all(3.0),
//                               child: DropdownButton(
//                                 isExpanded: true,
//                                 hint: Text(
//                                   'Book Type',
//                                 ),
//                                 onChanged: (newValue) {
//                                   homeController.setSelected(newValue!);
//                                 },
//                                 value: homeController.selected.value,
//                                 items:
//                                     homeController.listType.map((selectedType) {
//                                   return DropdownMenuItem(
//                                     child: new Text(
//                                       selectedType,
//                                     ),
//                                     value: selectedType,
//                                   );
//                                 }).toList(),
//                               ),
//                             ),
//                           )),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         width: width / 2,
//                         child: CustomTextField(
//                           controller: homeController.rate,
//                           labelText: 'Rate (Price/Unit)',
//                           onSave: (val) {},
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return '';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                       Obx(() => Container(
//                             width: width / 2 - 10,
//                             decoration: BoxDecoration(
//                                 border: Border.all(),
//                                 borderRadius: BorderRadius.circular(10)),
//                             child: Padding(
//                               padding: const EdgeInsets.all(3.0),
//                               child: DropdownButton(
//                                 isExpanded: true,
//                                 hint: Text(
//                                   'Book Type',
//                                 ),
//                                 onChanged: (newValue) {
//                                   homeController.setSelected(newValue!);
//                                 },
//                                 value: homeController.selected.value,
//                                 items:
//                                     homeController.listType.map((selectedType) {
//                                   return DropdownMenuItem(
//                                     child: new Text(
//                                       selectedType,
//                                     ),
//                                     value: selectedType,
//                                   );
//                                 }).toList(),
//                               ),
//                             ),
//                           )),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Spacer(
//               flex: 2,
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
//                     homeController
//                         .calculateTax(double.parse(homeController.rate.text));
//                     homeController.update();
//                     Get.to(SalePage());
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
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale/controller.dart/home_controller.dart';
import 'package:sale/pages/sale_page.dart';
import 'package:sale/widgets/custumTextField.dart';

class AddNewPage extends StatelessWidget {
  AddNewPage({super.key});
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 230, 230),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Text('Add Items to Sale'),
        ),
        actions: [Icon(Icons.settings)],
      ),
      body: Container(
        height: height,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white),
              margin: EdgeInsets.all(4),
              child: Column(
                children: [
                  CustomTextField(
                    controller: homeController.itemName,
                    labelText: 'Item Name',
                    onSave: (val) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter item name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        width: width / 2,
                        child: CustomTextField(
                          controller: homeController.quantity,
                          labelText: 'Quantity',
                          onSave: (val) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter quantity';
                            }
                            return null;
                          },
                        ),
                      ),
                      Obx(() => Container(
                            width: width / 2 - 10,
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: DropdownButton(
                                isExpanded: true,
                                hint: Text(''),
                                onChanged: (newValue) {
                                  homeController.setSelected(newValue!);
                                },
                                value: homeController.selected.value,
                                items:
                                    homeController.unitType.map((selectedType) {
                                  return DropdownMenuItem(
                                    child: Text(selectedType),
                                    value: selectedType,
                                  );
                                }).toList(),
                              ),
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        width: width / 2,
                        child: CustomTextField(
                          controller: homeController.rate,
                          labelText: 'Rate (Price/Unit)',
                          onSave: (val) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter rate';
                            }
                            return null;
                          },
                        ),
                      ),
                      Obx(() => Container(
                            width: width / 2 - 10,
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: DropdownButton(
                                isExpanded: true,
                                hint: Text(''),
                                onChanged: (newValue) {
                                  homeController.setSelected2(newValue!);
                                },
                                value: homeController.selected2.value,
                                items:
                                    homeController.taxModel.map((selectedType) {
                                  return DropdownMenuItem(
                                    child: Text(selectedType),
                                    value: selectedType,
                                  );
                                }).toList(),
                              ),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(flex: 2),
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
                    homeController
                        .calculateTax(double.parse(homeController.rate.text));
                    homeController.update();
                    Get.to(SalePage(
                      itemName: homeController.itemName.text,
                      itemQantity:
                          int.tryParse(homeController.quantity.text) ?? 0,
                      unit: homeController.selected.value,
                      rate: double.tryParse(homeController.rate.text) ?? 0.0,
                      taxName: homeController.taxAmount.value.toString(),
                    ));
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
