import 'package:flutter/material.dart';
import 'package:myapp/cart_kepsy.dart';
import 'package:myapp/money_kepsy.dart';
import 'package:provider/provider.dart';
import 'application_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<MoneyKepsy>(
            create: (context) => MoneyKepsy(),
          ),
          ChangeNotifierProvider<CartKepsy>(
            create: (context) => CartKepsy(),
          ),
        ],
        child: Scaffold(
          floatingActionButton: Consumer<MoneyKepsy>(
            builder: (context, money, _) => Consumer<CartKepsy>(
              builder: (context, cart, _) => FloatingActionButton(
                onPressed: () {            
                  if (money.balance >= 500){
                    cart.quantity += 1;
                    money.balance -= 500;
                  }
                },
                child: Icon(Icons.add_shopping_cart),
                backgroundColor: Colors.pink,
              ),
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: Text("Multi Provider"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Balance"),
                    Container(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Consumer<MoneyKepsy>(
                          builder: (context,MoneyKepsy, _) => Text(
                            MoneyKepsy.balance.toString(),
                            style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      height: 30,
                      width: 150,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.purple[100],
                          border: Border.all(color: Colors.purple, width: 2)),
                    )
                  ],
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Consumer<CartKepsy>(builder: (context,CartKepsy, _) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Apple (500) X " + CartKepsy.quantity.toString(),
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            (500 * CartKepsy.quantity).toString(),
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  ),
                  height: 30,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black, width: 2)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
