/*
Title: Sisdeve 1.0
Description: Model relacionado à tabela[BANCO] 
                                                                                
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

class Banco {
  int? id;
  String? codigo;
  String? nome;
  String? url;
  String? uuid;

  Banco({
    id,
    codigo,
    nome,
    url,
    uuid,
  });

  static List<String> campos = <String>[
    'id',
    'codigo',
    'nome',
    'url',
  ];

  static List<String> colunas = <String>[
    'Id',
    'Código',
    'Nome',
    'URL',
  ];

  Banco.fromJson(Map<String, dynamic> jsonDados) {
    id = jsonDados['id'];
    codigo = jsonDados['codigo'];
    nome = jsonDados['nome'];
    url = jsonDados['url'];
    uuid = jsonDados['uuid'];
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonDados = <String, dynamic>{};

    jsonDados['id'] = id ?? 0;
    jsonDados['codigo'] = codigo;
    jsonDados['nome'] = nome;
    jsonDados['url'] = url;
    jsonDados['uuid'] = uuid;

    return jsonDados;
  }

  String objetoEncodeJson(Banco objeto) {
    final jsonDados = objeto.toJson;
    return json.encode(jsonDados);
  }
}
