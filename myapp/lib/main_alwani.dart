import 'package:flutter/material.dart';
import 'package:myapp/cartAlwani.dart';
import 'package:myapp/moneyAlwani.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<Moneyalwani>(
            create: (context) => Moneyalwani(),
          ),
          ChangeNotifierProvider<Cartalwani>(
            create: (context) => Cartalwani(),
          )
        ],
        child: Scaffold(
          floatingActionButton: Row(
            children: [
              Text(".       "),
              Consumer<Moneyalwani>(
                builder: (context, money, _) => Consumer<Cartalwani>(
                  builder: (context, cart, _) => FloatingActionButton(
                    onPressed: () {
                      if (money.balance >= 500) {
                        cart.quantity += 1;
                        money.balance -= 500;
                      }
                    },
                    child: Icon(Icons.add_shopping_cart),
                    backgroundColor: Colors.purple,
                  ),
                ),
              ),
              Text(".       "),
              Consumer<Moneyalwani>(
                builder: (context, money, _) => Consumer<Cartalwani>(
                  builder: (context, cart, _) => FloatingActionButton(
                    onPressed: () {
                      if (cart.quantity != 0) {
                        cart.quantity -= 1;
                        money.balance += 500;
                      }
                    },
                    child: Icon(Icons.delete_forever_sharp),
                    backgroundColor: Colors.purple,
                  ),
                ),
              ),
            ],
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
                        child: Consumer<Moneyalwani>(
                          builder: (context, Moneyalwani, _) => Text(
                            Moneyalwani.balance.toString(),
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
                    ),
                  ],
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Consumer<Cartalwani>(
                      builder: (context, Cartalwani, _) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Apple (500) X" + Cartalwani.quantity.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            (500 * Cartalwani.quantity).toString(),
                            style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.w500),
                          ),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
