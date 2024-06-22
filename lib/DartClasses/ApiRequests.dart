import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiRequests{
  int matricula = 0;
  String password = "";
  ApiRequests(int matricula){
    this.matricula = matricula;
  }
  //Rota que ldia com login de usuário
  FutureOr<Map<dynamic, dynamic>>loginHandle(String password)async {
    var bodyLogin = {
      'matricula': this.matricula.toString(),
      'password': password
    };
    var cliente = http.Client();
    var response = await cliente.post(Uri.http('192.168.1.50:9010', '/loginHandle'), body: bodyLogin);
    var decodedResponse = jsonDecode(response.body) as Map;
    
    return decodedResponse;
  }

  FutureOr<Map<dynamic, dynamic>>dataRequest(String funcaous, token)async{
    var bodyLogin = {
      'matricula': this.matricula.toString(),
      'funcaous': funcaous
    };
    var cliente = http.Client();
    try{
        var response = await cliente.post(Uri.http('192.168.1.50:9010', '/dataFind'), body: bodyLogin, headers: {"x-auth-token":token});
        var dataResult = jsonDecode(response.body) as Map;
        print(dataResult['nome']);
        return dataResult;
    }
    catch(e){
      throw e;
    }
  }


  FutureOr<Map<dynamic, dynamic>>presenceConfirm(String funcaous,token,nome,classe, String serie)async{
    var bodyLogin = {
      'matricula': this.matricula.toString(),
      'funcaous': funcaous,
      'nome': nome,
      'classe':classe,
      'serie':serie

    };
    print(classe);
    var cliente = http.Client();
    try{
        var response = await cliente.post(Uri.http('192.168.1.50:9010', '/presenceConfirm'), body: bodyLogin, headers: {"x-auth-token":token});
        print(response.body);
        var dataResult = jsonDecode(response.body) as Map;
        print(dataResult);
        return dataResult;
    }
    catch(e){
      print(e);
      throw e;
    }
  }























}