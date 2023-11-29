import 'package:flutter/material.dart';
import 'invoice.dart';
import 'main.dart';
class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder(
          future: MainPage.invoices,
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              List<Invoice>? invs = snapshot.data;
              return Text(invs![MainPage.index].customerName);
            } else if(snapshot.hasError){
              return Text('error: ${snapshot.error}');
            } else {
              return CircularProgressIndicator();
            }

          },
        ),
      ),
      body: FutureBuilder(
        future: MainPage.invoices,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            List<Invoice>? invs = snapshot.data;
            return Text(invs![MainPage.index].toString(),
              style: const TextStyle(fontSize: 25),);
          } else if(snapshot.hasError){
            return Text('error: ${snapshot.error}');
          } else {
            return CircularProgressIndicator();
          }

        },
      ),
    );
  }
}

