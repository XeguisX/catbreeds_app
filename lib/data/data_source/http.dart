import 'package:http/http.dart' as http;

const String _xApiKey = '8399d594c0aba6f33d31a04d6c74cc63';
const String _apiUrl = 'api.thecatapi.com';

Future<String> httpGet(String endpoint) async {
  final url = Uri.https(_apiUrl, endpoint);

  final response = await http.get(
    url,
    headers: {'x-api-key': _xApiKey},
  );

  if (response.statusCode != 200) {
    throw Exception('Error al obtener datos: ${response.statusCode}');
  }

  return response.body;
}

Future<bool> existsUrl(String url) async {
  final response = await http.get(Uri.parse(url));

  return response.statusCode == 200;
}
