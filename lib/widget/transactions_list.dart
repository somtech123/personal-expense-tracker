import 'package:flutter/material.dart';
import 'package:empty_widget/empty_widget.dart';
import '../model/transactions.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deletetx;

  TransactionList(this.transaction, this.deletetx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transaction.isEmpty
          ? EmptyWidget(
              packageImage: PackageImage.Image_1,
              title: 'We are soory',
              subTitle: 'no current transaction now!',
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => deletetx(transaction[index].id),
                      color: Theme.of(context).errorColor,
                    ),
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: FittedBox(
                            child: Text('\$${transaction[index].amount}')),
                      ),
                    ),
                    title: Text(
                      transaction[index].title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transaction[index].date)),
                  ),
                );
              },
              itemCount: transaction.length,
            ),
    );
  }
}
