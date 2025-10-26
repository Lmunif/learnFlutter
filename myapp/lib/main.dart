import 'package:flutter/material.dart';
import 'package:myapp/product_cart.dart'; // pastikan path sesuai struktur proyekmu
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: firstColor,
          title: const Text(
            "My Shop",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ChangeNotifierProvider<ProductState>(
          create: (context) => ProductState(),
          child: Container(
            margin: const EdgeInsets.all(20),
            alignment: Alignment.topCenter,
            child: Consumer<ProductState>(
              builder: (context, ProductState, _) => ProductCart(
                imageURL:
                    "assets/pictures/fufufa.png", // ubah dari ImageURL ke imageURL
                name: "Fruits Mix 1 Kg",
                price: "Rp 25.000",
                quantity: ProductState.quantity,
                notification: (ProductState.quantity > 5) ? "Diskon 10%" : "",
                onAddCartTap: () {
                  debugPrint("Produk ditambahkan ke keranjang!");
                },
                onIncTap: () {
                  ProductState.quantity++;
                },
                onDecTap: () {
                  ProductState.quantity--;

                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductState with ChangeNotifier {
  int _quantity = 0;

  int get quantity => _quantity;
  set quantity(int newValue) {
    _quantity = newValue;
    notifyListeners();
  }
}
