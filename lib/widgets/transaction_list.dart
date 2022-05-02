import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import "../models/transaction.dart";

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionList(this.transactions, this.deleteTransaction);

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
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: FittedBox(
                              child: Text('\$${transactions[index].amount}')),
                        ),
                      ), // at the start
                      title: Text(
                        '${transactions[index].title}',
                        style: Theme.of(context).appBarTheme.titleTextStyle,
                      ),
                      subtitle: Text(
                          DateFormat.yMMMMd().format(transactions[index].date)),
                      trailing: IconButton(
                          color: Theme.of(context).errorColor,
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            deleteTransaction(transactions[index].id);
                          }),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
