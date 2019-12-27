import 'package:flutter/material.dart';

import '../dto/balance.dart';
import '../services/bitkub_service.dart';

class SecureApiPage extends StatefulWidget{
     @override
     _NonSecureApiState createState() => _NonSecureApiState();
}

class _NonSecureApiState extends State<SecureApiPage>{

     Future fetchCoinBalances() async {
          return await BitkubService().getCoinsBalance();
     }

     @override
     Widget build(BuildContext context) {
          return Scaffold(
               appBar: AppBar(
                    title: Text("Secure API"),
               ),
               body: FutureBuilder(
                    future: fetchCoinBalances(),
                    builder: (BuildContext contex, AsyncSnapshot balanceSnap) {
                         switch (balanceSnap.connectionState) {
                              case ConnectionState.none:
                                   return new Text('Input a URL to start');
                              case ConnectionState.waiting:
                                   return new Center(child: new CircularProgressIndicator());
                              case ConnectionState.active:
                                   return new Text('');
                              case ConnectionState.done:
                                   if (balanceSnap.hasError) {
                                        return new Text(
                                             '${balanceSnap.error}',
                                             style: TextStyle(color: Colors.red),
                                        );
                                   } else {
                                        return ListView.builder(
                                             itemCount: (balanceSnap.data == null) ? 0 : balanceSnap.data.length,
                                             itemBuilder: (contex, index) {
                                                  Balance ticker = balanceSnap.data[index];
                                                  return Column(
                                                       children: <Widget>[
                                                            ListTile(
                                                                 leading: Icon(Icons.monetization_on),
                                                                 title: Text(ticker.key),
                                                                 subtitle: Text(ticker.available.toString()),
                                                            ),
                                                       ],
                                                  );
                                             },
                                        );
                                   }
                                   break;
                              default:
                                   return Container();
                         }
                    },
               ),
          );
     }

}