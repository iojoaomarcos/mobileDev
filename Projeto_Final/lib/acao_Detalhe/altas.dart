



import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


const request = "https://api.hgbrasil.com/finance/stock_price?key=23cf857d&symbol=get-high";


Future<Map> getData() async {
  var requestFocusAction = RequestFocusAction;
    http.Response response = await http.get(requestFocusAction);
  return json.decode(response.body);
}
  
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
  
  
}

class _HomeState extends State<Home> 
   {
  @override
  Widget build(BuildContext context) {
    

  
var simbolo;
var nome;
var regiao;
var ocorrencia;
var open;
var close;
var timezone;
var cap;
var preco;
var porcentagem;
var atualizacao;




  


  

         
    Scaffold(
    body :  FutureBuilder<Map>(
              future: getData(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(
                        child: Text(
                      "Loading...",
                      style: TextStyle(color: Colors.blueAccent, fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ));
                  default:
                    if (snapshot.hasError) {
                      return Center(
                          child: Text(
                        "Error loading data :( ",
                        style: TextStyle(color: Colors.blueAccent, fontSize: 20.0),
                        textAlign: TextAlign.center,
                      ));
                    } else {
                       simbolo = snapshot.data["results"]["HTMX11"]["symbol"];
                        nome =snapshot.data["results"]["HTMX11"]["name"];
                         regiao = snapshot.data["results"]["HTMX11"]["region"];
                       ocorrencia =snapshot.data["results"]["HTMX11"]["currency"];
                       open =snapshot.data["results"]["HTMX11"]["market_time"]["open"];
                       close =snapshot.data["results"]["HTMX11"]["market_time"]["close"];
                       timezone =snapshot.data["results"]["HTMX11"]["market_time"]["timezone"];
                       cap =snapshot.data["results"]["market_cap"];
                       preco =snapshot.data["results"]["price"];
                       porcentagem =snapshot.data["results"]["change_percent"];
                       atualizacao =snapshot.data["results"]["updated_at"];


                                     return SingleChildScrollView(
                                        padding: EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Text(
                                                "$simbolo, sigla",
                                              style:
                                                    TextStyle(color: Colors.grey, fontSize: 20.0),
                                              ),
                                            ),Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Text(
                                                "$nome, nome",
                                              style:
                                                    TextStyle(color: Colors.grey, fontSize: 20.0),
                                              ),
                                            ),Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Text(
                                                "$regiao, regiao",
                                              style:
                                                    TextStyle(color: Colors.grey, fontSize: 20.0),
                                              ),
                                            ),Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Text(
                                                "$ocorrencia, ocorrencia",
                                              style:
                                                    TextStyle(color: Colors.grey, fontSize: 20.0),
                                              ),
                                            ),Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Text(
                                                "$open, abaertura",
                                              style:
                                                    TextStyle(color: Colors.grey, fontSize: 20.0),
                                              ),
                                            ),Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Text(
                                                "$close, fecha",
                                              style:
                                                    TextStyle(color: Colors.grey, fontSize: 20.0),
                                              ),
                                            ),Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Text(
                                                "$cap, cap",
                                              style:
                                                    TextStyle(color: Colors.grey, fontSize: 20.0),
                                              ),
                                            ),Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Text(
                                                "$preco, preço",
                                              style:
                                                    TextStyle(color: Colors.grey, fontSize: 20.0),
                                              ),
                                            ),Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Text(
                                                "$timezone, tempo",
                                              style:
                                                    TextStyle(color: Colors.grey, fontSize: 20.0),
                                              ),
                                            ),Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Text(
                                                "$porcentagem, porcentagem",
                                              style:
                                                    TextStyle(color: Colors.grey, fontSize: 20.0),
                                              ),
                                            ),Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Text(
                                                "$atualizacao, atualizacao",
                                              style:
                                                    TextStyle(color: Colors.grey, fontSize: 20.0),
                                              ),
                                            ),
                   ],
                ),
          );
        
      }                   
    } 
              }
     )
    );

  
  }
  }

 