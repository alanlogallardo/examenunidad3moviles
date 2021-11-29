import 'dart:convert';
import 'package:http/http.dart' as http;
import 'User.dart';

Future<List<Usuario>> getUser() async {
  final response = await http.get(Uri.parse('http://192.168.0.11:3002/users'));
  if (response.statusCode == 200) {
    final List t = json.decode(response.body);
    final List<Usuario> portasAbertasList =
        t.map((item) => Usuario.fromJson(item)).toList();
    return portasAbertasList;
  } else {
    throw Exception('Failed to get user');
  }
}

Future<http.Response> createUser(String nombre, String categoria) async {
  return http.post(
    Uri.parse('http://192.168.0.11:3002/users'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{'nombre': nombre, 'categoria': categoria},
    ),
  );
}
