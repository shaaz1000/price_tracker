import "package:flutter/material.dart";

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addTransaction;
  NewTransaction(this.addTransaction);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) return;
    addTransaction(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                autocorrect: false,
                decoration: InputDecoration(labelText: "Title"),
                controller: titleController,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: "Amount"),
                controller: amountController,
                onSubmitted: (_) => submitData(),
              ),
              TextButton(onPressed: submitData, child: Text("Add Transaction"))
            ],
          )),
    );
  }
}
