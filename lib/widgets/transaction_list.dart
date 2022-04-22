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
      child: ListView.builder(
        // itemBuilder is a must have
        itemBuilder: (ctx, index) {
// provides 2 argument ctx and index
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 10,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(10), right: Radius.circular(10)),
                    border: Border.all(color: Colors.blue, width: 2)),
                margin: const EdgeInsets.only(
                    bottom: 10, top: 10, right: 20, left: 30),
                child: Text(
                  '\$ ${transactions[index].amount}',
                  style: const TextStyle(
                      color: Colors.deepOrange,
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
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  Text(DateFormat('dd-MM-yyyy-EE')
                      .format(transactions[index].date)),
                ],
              )
            ]),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
