import 'package:flutter/material.dart';


class CashierPage extends StatefulWidget {
  const CashierPage({super.key});

  @override
  State<CashierPage> createState() => _CashierPageState();
}

class _CashierPageState extends State<CashierPage> {
  List<Map<String, dynamic>> products = [
    {
      "name": "Minyak Goreng",
      "stock": 10,
      "price": 18000,
      "image": "assets/images/minyak.png",
      "quantity": 0,
    },
    {
      "name": "saos",
      "stock": 20,
      "price": 12000,
      "image": "assets/images/saos.png",
      "quantity": 0,
    },
    {
      "name": "Kecap",
      "stock": 15,
      "price": 7000,
      "image": "assets/images/kecap.png",
      "quantity": 0,
    },
    {
      "name": "Mie Goreng",
      "stock": 10,
      "price": 5000,
      "image": "assets/images/mie.png",
      "quantity": 0,
    },
  ];
  int totalItems = 0;
  int totalPrice = 0;

  Future<void> tambahItemKeranjang(int index) async {
    setState(() {
      products[index]["stock"]--;
      products[index]["quantity"] = (products[index]["quantity"]) + 1;
      totalItems++;
      totalPrice += products[index]["price"] as int;
    });
  }

  Future<void> kurangItemKeranjang(int index) async {
    setState(() {
      products[index]["stock"]++;
      products[index]["quantity"] = (products[index]["quantity"]) - 1;
      totalItems--;
      totalPrice -= products[index]["price"] as int;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cashier App',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      'Semoga Harimu Menyenangkan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        labelText: 'search',
                        labelStyle: TextStyle(color: Colors.grey[400]),
                        hintText: 'search',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 75),
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 15);
                      },
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "${products[index]['image']}",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${products[index]['name']}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),

                                        Text(
                                          "Rp. ${products[index]['price']}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),

                                        Text(
                                          "Stock: ${products[index]['stock']}",
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (products[index]["quantity"] > 0) {
                                          kurangItemKeranjang(index);
                                        }
                                      },
                                      child: Visibility(
                                        visible:
                                            products[index]["quantity"] > 0,
                                        child: Icon(
                                          Icons.remove_circle_outline,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 40,
                                      child: Center(
                                        child: Visibility(
                                          visible:
                                              products[index]["quantity"] > 0,
                                          child: Text(
                                            "${products[index]['quantity']}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (products[index]["stock"] > 0) {
                                          tambahItemKeranjang(index);
                                        }
                                      },
                                      child: Visibility(
                                        visible: true,
                                        child: Icon(
                                          Icons.add_circle_outline,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 55,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total item: $totalItems Item, Rp. $totalPrice",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      Icons.shopping_cart_checkout_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
