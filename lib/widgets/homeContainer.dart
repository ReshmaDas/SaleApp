import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sale/widgets/gridViewModel.dart';
import 'package:sale/widgets/listData.dart';

class HomeContainer extends StatelessWidget {
  HomeContainer({super.key});
  final CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 239, 249),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.white),
              width: width,
              height: 100, // Give GridView a fixed height
              child: GridView.count(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                crossAxisCount: 1,
                children: List.generate(4, (index) {
                  final QuickLink data = quickLink[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 33,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: const Color.fromARGB(255, 120, 205, 248),
                        ),
                      ),
                      Text(data.name!),
                    ],
                  );
                }),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
              ),
              child: const Row(
                children: [
                  Icon(Icons.search),
                  // Wrap TextField in an Expanded widget to constrain its width
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Search here', // Add a placeholder text
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.filter_alt_outlined,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: products.snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot productSnapShort =
                          snapshot.data!.docs[index];
                      final Map<String, dynamic> items =
                          productSnapShort['items'];

                      return Card(
                        margin: EdgeInsets.all(10),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Customer: ${productSnapShort['name_customer']}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    '#23-12-0115',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 194, 243, 219),
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    height: 28,
                                    width: 50,
                                    child: Center(
                                      child: Text('SALE',
                                          style: TextStyle(
                                              color: const Color.fromARGB(
                                                  255, 62, 196, 131))),
                                    ),
                                  ),
                                  Text(
                                    '23 Aug 24',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Total',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        '${productSnapShort['total_amout']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Balance',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        '100',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  Icon(Icons.print_sharp),
                                  Icon(Icons.share),
                                  Icon(Icons.more_vert)
                                ],
                              ),

                              // Text(
                              //   'Item Details:',
                              //   style: TextStyle(
                              //     fontWeight: FontWeight.bold,
                              //     fontSize: 16,
                              //   ),
                              // ),
                              // Text('Item Name: ${items['item_name']}'),
                              // Text('Quantity: ${items['qnty']} ${items['unit']}'),
                              // Text('Rate: ${items['rate']}'),
                              // Text(
                              //     'Total Amount: ${productSnapShort['total_amout']}'),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
