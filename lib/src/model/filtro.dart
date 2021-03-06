/*
Title: Sisdeve 1.0
Description: Classe transiente para enviar os dados do filtro para o servidor
                                                                                
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
                                                                                
@author Winston Hanun J??nior (devjuniorhanun@gmail.com)                    
@version 1.0.0
*******************************************************************************/
import 'dart:convert';

class Filtro {
  String? campo;
  String? valor;
  String? dataInicial;
  String? dataFinal;
  String? condicao;
  String?
      where; // ser?? utilizado quando o filtro for m??ltiplo, ou seja, quando mais de um filtro for enviado para o servidor

  Filtro({campo, valor, dataInicial, dataFinal});

  Filtro.fromJson(Map<String, dynamic> jsonDados) {
    campo = jsonDados['campo'];
    valor = jsonDados['valor'];
    dataInicial = jsonDados['dataInicial'];
    dataFinal = jsonDados['dataFinal'];
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonDados = <String, dynamic>{};
    jsonDados['campo'] = campo;
    jsonDados['valor'] = valor;
    jsonDados['dataInicial'] = dataInicial;
    jsonDados['dataFinal'] = dataFinal;
    return jsonDados;
  }
}

String filtroEncodeJson(Filtro filtro) {
  final jsonDados = filtro.toJson;
  return json.encode(jsonDados);
}
