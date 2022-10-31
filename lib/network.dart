import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {


  Future<dynamic> getRandomData() async {
    var url = 'https://62b7f6b5f4cb8d63df56ee35.mockapi.io/api/v1/user';
    http.Response response = await http.get(Uri.parse(url));
    return jsonDecode(response.body);



  //   for (int i = 0; i < 100; i++) {
  //     names?.add(data[i]['name']);
  //   }
  //   setState(() {
  //     names;
  //   });
  //   print(names);
  }
}