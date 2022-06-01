/*
Title: Sisdeve 1.0
Description: Configuração base para os serviços REST
                                                                                
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

class ServiceBase {
  // Servidor ERP
  static const String _porta = '8000'; // Porta do Servidor
  static const String _enderecoServidor =
      'http://localhost'; // Endereço do servidor
  static const String _endpoint = _enderecoServidor + ':' + _porta;

  get endpoint => _endpoint;

  /// define o cabeçalho enviado em todas as requisições que segue com o Token JWT
  static Map<String, String> cabecalhoRequisicao = {
    "content-type": "application/json",
    // "authentication": "Bearer " + Sessao.tokenJWT
  };
}
