/*
Title: Sisdeve 1.0                                                               
Description: Service relacionado à tabela [BANCO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2022 - Sisdeve                                          
                                                                                
Permission is hereby granted, free of charge, to any person                     
obtaining a copy of this software and associated documentation                  
files (the "Software"), to deal in the Software without                         
restriction, including without limitation the rights to use,                    
copy, modify, merge, publish, distribute, sublicense, and/or sell               
copies of the Software, and to permit persons to whom the                       
Software is furnished to do so, subject to the following                        
conditions:                                                                     
                                                                                
The above copyright notice and this permission notice shall be                  
included in all copies or substantial portions of the Software.                 
                                                                                
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,                 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES                 
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND                        
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT                     
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,                    
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING                    
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR                   
OTHER DEALINGS IN THE SOFTWARE.                                                 
                                                                                
       The author may be contacted at:                                          
           devjuniorhanun@gmail.com
                                                                                
@author Winston Hanun Júnior (devjuniorhanun@gmail.com)                    
@version 1.0.0
*******************************************************************************/
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' show Client;

import '../service_base.dart';
import '../../model/filtro.dart';
import '../../model/model.dart';

/// classe responsável por requisições ao servidor REST
class BancoService extends ServiceBase {
  var clienteHTTP = Client();

  Future<List<Banco>?> consultarLista({Filtro? filtro}) async {
    List<Banco> listaBanco = [];

    try {
      //tratarFiltro(filtro, '/banco/');

      final response = await clienteHTTP.get(
        Uri.tryParse('$endpoint/banco/')!,
      );

      if (response.statusCode == 200) {
        if (response.headers["content-type"]!.contains("html")) {
          //tratarRetornoErro(response.body, response.headers);
          return null;
        } else {
          var parsed = json.decode(response.body) as List<dynamic>;
          for (var banco in parsed) {
            listaBanco.add(Banco.fromJson(banco));
          }
          return listaBanco;
        }
      } else {
        //tratarRetornoErro(response.body, response.headers);
        return null;
      }
    } on Exception catch (e) {
      //tratarRetornoErro(null, null, exception: e);
    }
    return null;
  }

  Future<Banco?> consultarObjeto(int id) async {
    try {
      final response = await clienteHTTP.get(
        Uri.tryParse('$endpoint/banco/$id')!,
      );

      if (response.statusCode == 200) {
        if (response.headers["content-type"]!.contains("html")) {
          //tratarRetornoErro(response.body, response.headers);
          return null;
        } else {
          var bancoJson = json.decode(response.body);
          return Banco.fromJson(bancoJson);
        }
      } else {
        //tratarRetornoErro(response.body, response.headers);
        return null;
      }
    } on Exception catch (e) {
      //tratarRetornoErro(null, null, exception: e);
    }
    return null;
  }

  Future<Banco?> inserir(Banco banco) async {
    try {
      final response = await clienteHTTP.post(
        Uri.tryParse('$endpoint/banco')!,
        headers: ServiceBase.cabecalhoRequisicao,
        body: banco.objetoEncodeJson(banco),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.headers["content-type"]!.contains("html")) {
          //tratarRetornoErro(response.body, response.headers);
          return null;
        } else {
          var bancoJson = json.decode(response.body);
          return Banco.fromJson(bancoJson);
        }
      } else {
        //tratarRetornoErro(response.body, response.headers);
        return null;
      }
    } on Exception catch (e) {
      //tratarRetornoErro(null, null, exception: e);
    }
    return null;
  }

  Future<Banco?> alterar(Banco banco) async {
    try {
      var id = banco.id;
      final response = await clienteHTTP.put(
        Uri.tryParse('$endpoint/banco/$id')!,
        headers: ServiceBase.cabecalhoRequisicao,
        body: banco.objetoEncodeJson(banco),
      );

      if (response.statusCode == 200) {
        if (response.headers["content-type"]!.contains("html")) {
          //tratarRetornoErro(response.body, response.headers);
          return null;
        } else {
          var bancoJson = json.decode(response.body);
          return Banco.fromJson(bancoJson);
        }
      } else {
        //tratarRetornoErro(response.body, response.headers);
        return null;
      }
    } on Exception catch (e) {
      //tratarRetornoErro(null, null, exception: e);
    }
    return null;
  }

  Future<bool?> excluir(int id) async {
    try {
      final response = await clienteHTTP.delete(
        Uri.tryParse('$endpoint/banco/$id')!,
        headers: ServiceBase.cabecalhoRequisicao,
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        //tratarRetornoErro(response.body, response.headers);
        return null;
      }
    } on Exception catch (e) {
      //tratarRetornoErro(null, null, exception: e);
    }
    return null;
  }
}
