import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String? address;
  final ItemDetails? items;
  final String? nameCustomer;
  final String? phoneNumber;
  final String? totalAmount;
  final DateTime? date;

  Product({
    this.address,
    this.items,
    this.nameCustomer,
    this.phoneNumber,
    this.totalAmount,
    this.date,
  });

  // Factory constructor to create a Product instance from Firestore
  factory Product.fromFirestore(Map<String, dynamic> data) {
    return Product(
      address: data['address'] as String? ?? '',
      items: data['items'] != null
          ? ItemDetails.fromMap(data['items'] as Map<String, dynamic>)
          : null,
      nameCustomer: data['name_customer'] as String? ?? '',
      phoneNumber: data['phn_no'] as String? ?? '',
      totalAmount: data['total_amout'] as String? ?? '',
      date: (data['date'] != null)
          ? (data['date'] as Timestamp).toDate()
          : DateTime.now(),
    );
  }

  // Convert Product instance to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'address': address ?? '',
      'items': items?.toMap(), // Handle nullable items
      'name_customer': nameCustomer ?? '',
      'phn_no': phoneNumber ?? '',
      'total_amout': totalAmount ?? '',
      'date': date != null
          ? Timestamp.fromDate(date!)
          : null, // Handle nullable date
    };
  }
}

class ItemDetails {
  final String? itemName;
  final int? quantity;
  final String? rate;
  final String? unit;

  ItemDetails({
    this.itemName,
    this.quantity,
    this.rate,
    this.unit,
  });

  // Factory constructor to create an ItemDetails instance from a map
  factory ItemDetails.fromMap(Map<String, dynamic> data) {
    return ItemDetails(
      itemName: data['item_name'] as String? ?? '',
      quantity: data['qnty'] as int? ?? 0,
      rate: data['rate'] as String? ?? '',
      unit: data['unit'] as String? ?? '',
    );
  }

  // Convert ItemDetails instance to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'item_name': itemName,
      'qnty': quantity,
      'rate': rate,
      'unit': unit,
    };
  }
}
