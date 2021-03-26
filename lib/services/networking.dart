import 'package:http/http.dart' as http;
import 'dart:convert';

class NetWorkHelper {
  NetWorkHelper(this.url);
  final String url;

  Future getData() async {
    http.Response response = await http.get(url);
    // print(response.body);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
