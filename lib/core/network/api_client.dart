import 'dart:io';

import 'package:fullstackoauth/core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiClient {
  ApiClient({required this.client, required this.baseUrl});

  final http.Client client;
  final String baseUrl;

  Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl$endpoint'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == HttpStatus.ok) {
        return json.decode(response.body);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw NetworkException();
    }
  }

  Future<Map<String, dynamic>> post(String endpoint,
      {required Map<String, dynamic> body}) async {
    try {
      final response = await client.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );
      if (response.statusCode == HttpStatus.created) {
        return json.decode(response.body);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw NetworkException();
    }
  }
}
