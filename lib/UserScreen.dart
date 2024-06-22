// ignore_for_file: prefer_const_constructors, file_names, prefer_typing_uninitialized_variables, unnecessary_new, avoid_print, prefer_const_literals_to_create_immutables
import 'package:attendeasemandroid/DartClasses/ApiRequests.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  var loginData;
  String token = "";
  int matricula = 0;
  var teste2;
  List teste = [];

  apiDados(matricula, funcao, token) async {
    ApiRequests apiRequests = new ApiRequests(matricula);
    var resultadoFinal = await apiRequests.dataRequest(funcao, token);
    return resultadoFinal;
  }

  @override
  Widget build(BuildContext context) {
    loginData = ModalRoute.of(context)?.settings.arguments;


    token = loginData['token'];
    matricula = loginData['matricula'];
    var funcao = loginData['funcao'];
    print(token);
    print(funcao);

    return new Scaffold(
        body: FutureBuilder(
            future: apiDados(matricula, funcao, token),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Map data = snapshot.data as Map<dynamic, dynamic>;
                    var argumentosQR = {
                    "funcao":loginData["funcao"],
                    "token":loginData["token"],
                    "matricula":data['matricula'],
                    "nome":data['nome'],
                    "serie":data['serie']
                     };




                print(data['nome']);
                return Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage('./assets/images/Fundo-2.png'),
                  fit: BoxFit.cover)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                              child: Padding(padding: EdgeInsets.all(20),child:Text(
                            "Perfil",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 25),
                          
                              )
                            )
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "http://192.168.1.50:80/img/${matricula}.jpg"),
                              radius: 70,
                            ),
                          )
                        ],
                      ),
                      Container(
                      width: 350,
                      margin: EdgeInsets.only(left: 30),
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: const Color.fromARGB(255, 129, 129, 129)))),
                      child:Row(   
                        children: [                         
                          Container(
                            margin: EdgeInsets.only(left: 5, top: 20),
                            width: 40,
                            height: 40,
                            child: Image(
                                image: AssetImage(
                                    './assets/images/User-simbol.png')),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30, left: 10, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 50,
                                      child: Text(
                                        "Nome:",
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 148, 148, 148),
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data['nome'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                      ],
                    )),
                    Container(
                          width: 350,
                          margin: EdgeInsets.only(left: 30),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 129, 129, 129)))),
                          child: Row(children: [
                            Container(
                                margin: EdgeInsets.only(left: 15, top: 20),
                                width: 40,
                                height: 40,
                                child: Text("Nº",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 17,
                                        color: const Color.fromARGB(
                                            255, 175, 175, 175)))),
                            Container(
                              margin: EdgeInsets.only(top: 30, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 70,
                                        child: Text(
                                          "Matricula:",
                                          style: TextStyle(
                                              color: const Color.fromARGB(
                                                  255, 148, 148, 148),
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                      data['matricula'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ])),
                                              Container(
                          width: 350,
                          margin: EdgeInsets.only(left: 30),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 129, 129, 129)))),
                          child: Row(children: [
                            Container(
                                margin: EdgeInsets.only(left: 5, top: 20),
                                width: 40,
                                height: 40,
                                child: Image(image: AssetImage('./assets/images/User-class.png'))),
                            Container(
                              margin: EdgeInsets.only(top: 30, bottom: 10, left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 70,
                                        child: Text(
                                          "Classe:",
                                          style: TextStyle(
                                              color: const Color.fromARGB(
                                                  255, 148, 148, 148),
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                      data['classe'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ])),
                                                                        Container(
                          width: 350,
                          margin: EdgeInsets.only(left: 30),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 129, 129, 129)))),
                          child: Row(children: [
                            Container(
                                margin: EdgeInsets.only(left: 5, top: 20),
                                width: 40,
                                height: 40,
                                child: Image(image: AssetImage('./assets/images/User-class.png'))),
                            Container(
                              margin: EdgeInsets.only(top: 30, bottom: 10, left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 70,
                                        child: Text(
                                          "Série:",
                                          style: TextStyle(
                                              color: const Color.fromARGB(
                                                  255, 148, 148, 148),
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                      data['serie'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ])),
                          Container(
                          width: 350,
                          margin: EdgeInsets.only(left: 30),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 129, 129, 129)))),
                          child: Row(children: [
                            Container(
                                margin: EdgeInsets.only(left: 15, top: 20),
                                width: 40,
                                height: 40,
                                child: Text("@",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 17,
                                        color: const Color.fromARGB(
                                            255, 175, 175, 175)))),
                            Container(
                              margin: EdgeInsets.only(top: 30, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 70,
                                        child: Text(
                                          "Email:",
                                          style: TextStyle(
                                              color: const Color.fromARGB(
                                                  255, 148, 148, 148),
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                      data['email'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ])),
                          ElevatedButton(onPressed: ()=>{
                            Navigator.pushNamed(context, "/scan", arguments: argumentosQR)

                          }, child: Text("Ler QR Code"))




        ],



                  ),
                );
              } else if (snapshot.hasError) {
                throw Text("Errou");
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
