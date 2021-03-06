import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import "../models/transaction.dart";

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Text(
                    "No New Transactions added yet!",
                    style: Theme.of(context).appBarTheme.titleTextStyle,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    height: 400,
                    child: Image.asset(
                      'assets/image/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              // itemBuilder is a must have
              itemBuilder: (ctx, index) {
// provides 2 argument ctx and index
                return Card(
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 10,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(10),
                              right: Radius.circular(10)),
                          border: Border.all(
                              color: Theme.of(context).primaryColorLight,
                              width: 2)),
                      margin: const EdgeInsets.only(
                          bottom: 10, top: 10, right: 20, left: 30),
                      child: Text(
                        '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                        style: TextStyle(
                            color: Theme.of(context).secondaryHeaderColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(transactions[index].title,
                              style:
                                  Theme.of(context).appBarTheme.titleTextStyle),
                        ),
                        Text(
                          DateFormat('dd-MM-yyyy-EE')
                              .format(transactions[index].date),
                          style: TextStyle(
                              color: Theme.of(context).secondaryHeaderColor),
                        ),
                      ],
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 60),
                        child: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.delete)))
                  ]),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
