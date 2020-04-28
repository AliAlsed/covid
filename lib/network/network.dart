
import 'dart:convert';

import 'package:http/http.dart' as http;
class  Network{

  Future<dynamic> fetch() async {
   http.Response response = await http.get('https://coronavirus-monitor.p.rapidapi.com/coronavirus/cases_by_country.php',
   headers:{
     'x-rapidapi-host':'coronavirus-monitor.p.rapidapi.com',
     'x-rapidapi-key':'3cd436ed17msh8988e63262b1ad3p1fe9d6jsn3a43cb9460aa'
   }
   ) ;
  //  print(response.body);
   return json.decode(response.body);
  }
  
}