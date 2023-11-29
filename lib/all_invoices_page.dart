import 'package:flutter/material.dart';
import 'package:invoice_app_2/invoice.dart';
import 'main.dart';
class AllInvoicesPage extends StatelessWidget {
  const AllInvoicesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Customers'),
      ),
      body: FutureBuilder(
        future: MainPage.invoices,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            List<Invoice>? invs = snapshot.data;
            return ListView.builder(
              itemCount: invs?.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: () {
                    MainPage.index = index;
                    Navigator.pushNamed(context,'/details_page');
                  },
                  child: Container(
                    color: Colors.lightBlueAccent,
                    child: Text(invs![index].customerName,
                      style: const TextStyle(fontSize: 25),),
                  ),
                ),
              ),
            );
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
