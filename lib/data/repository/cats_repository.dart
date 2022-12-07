// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../model/cat.dart';

abstract class CatsRepository {
  Future<List<Cat>> getCats();
}

class SampleCatsRepository implements CatsRepository {
  final baseUrl = "https://hwasampleapi.firebaseio.com/http.json";
  @override
  Future<List<Cat>> getCats() async {
    final response = await http.get(Uri.parse(baseUrl));
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonBody = jsonDecode(response.body) as List;
        return jsonBody.map((e) => Cat.fromJson(e)).toList();

      default:
        throw NetworkError(response.statusCode.toString(), response.body);
    }
  }
}

class NetworkError implements Exception {
  final String statusCode;
  final String message;

  NetworkError(this.message, this.statusCode);
}
