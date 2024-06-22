// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:attendeasemandroid/DartClasses/ApiRequests.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formUser = new GlobalKey<FormState>();
  final valor = TextEditingController();
  final formSenha = new GlobalKey<FormState>();
  final valorSenha = TextEditingController();
  String resposta = "Seja Bem-Vindo";
  var token;


  Future<Map<dynamic, dynamic>>logar()async{
    int matricula = int.tryParse(valor.text) ?? 0;
    String senha = valorSenha.text.toString();

    print(matricula);
    print(senha);


    ApiRequests apiRequests = new ApiRequests(matricula);
    var respostareq = await apiRequests.loginHandle(senha);

    return respostareq;
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'AttendEasee',
          style: TextStyle(fontSize: 45, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFD9D9D9),
      ),
      body: Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('./assets/images/Fundo-1.png'),
                  fit: BoxFit.cover)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Container(
                      margin: EdgeInsets.only(top: 55, left: 20),
                      child: Text(
                        
                        "${resposta}",
                        style: TextStyle(
                            fontSize: 45, fontWeight: FontWeight.w900),
                      ))
                ]),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 60),
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  
                                  width:
                                      MediaQuery.sizeOf(context).width / 1.10,
                                  child: Form(
                                    key: formUser,
                                    child: TextFormField(
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                      controller: valor,
                                      decoration: InputDecoration(
                                      label: Text("Matricula", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            topLeft: Radius.circular(10)),
                                      ),
                                      focusColor:
                                          Color.fromRGBO(0, 225, 255, 0.612),
                                    ),
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                  )),
                                )
                              ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 10),
                                  width:MediaQuery.sizeOf(context).width / 1.10,
                                  child: Form(
                                    key: formSenha,
                                    child: TextFormField(
                                      // obscureText: true,
                                      // enableSuggestions: false,
                                      // autocorrect: false,
                                      controller: valorSenha,
                                      decoration: InputDecoration(
                                        label: Text("Senha", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10)),
                                        ),
                                        focusColor:
                                            Color.fromRGBO(0, 225, 255, 0.612),
                                      ),
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                  ))
                            ],
                          ),
                          Row(
                            
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                width:MediaQuery.sizeOf(context).width / 1.10,
                                child: ElevatedButton(onPressed: ()async {
                                  try {
                                  var mapResposta = await logar();
                                  token = mapResposta['token'];
                                    if(token == null){
                                      setState(() {
                                        resposta = "Usuário ou senha incorretos";
                                      });
                                    }
                                    else{
                                     Navigator.of(context).pushNamedAndRemoveUntil("/user", (route) => false, arguments: mapResposta);
                                    }
                                
                                 
                                } catch (e) {
                                  
                                  // Trate o erro, se necessário
                                }
                                },child:Row() ,),


                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ])),
    );
  }
}
