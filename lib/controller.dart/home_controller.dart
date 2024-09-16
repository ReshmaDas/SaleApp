import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class HomeController extends GetxController {
  TextEditingController itemName = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController rate = TextEditingController();
  TextEditingController customerName = TextEditingController();
  TextEditingController phnNumber = TextEditingController();
  TextEditingController billingAddress = TextEditingController();
  var selectedDate = DateTime.now().obs;

  void updateDate(DateTime newDate) {
    selectedDate.value = newDate;
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate.value) {
      updateDate(picked);
    }
  }

  @override
  void onInit() {
    itemName = TextEditingController();
    quantity = TextEditingController();
    rate = TextEditingController();
    customerName = TextEditingController();
    phnNumber = TextEditingController();
    billingAddress = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  RxInt selecteddIndex = 0.obs;
  List<String> unitType = ['Kg'];
  List<String> taxModel = ['With Tax', 'Without Tax'];

  void selectedBottomNavindex(int index) {
    selecteddIndex.value = index;
  }

  // It is mandatory initialize with one value from listType
  final selected = "Kg".obs;
  final selected2 = "With Tax".obs;

  void setSelected(String value) {
    selected.value = value;
  }

  void setSelected2(String value) {
    selected2.value = value;
  }

  final taxAmount = 0.0.obs;

  calculateTax(amount) {
    var GSTAmount = (18 / 100) * amount;
    var AmountWithGst = amount + GSTAmount;
    print("The Tax gst : ${GSTAmount}");
    print("The gst_Amount : ${AmountWithGst}");
    taxAmount.value = AmountWithGst;
    print("The Tax Amount : ${taxAmount.value}");
  }
}
