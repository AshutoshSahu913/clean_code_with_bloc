import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/post_item_model.dart';

class PostRepository {
  Future<List<PostModel>> fetchPost() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'))
          .timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        // Ensure the content type is JSON
        final List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList.map((json) => PostModel.fromJson(json)).toList();
      } else {
        // Throw instead of print
        throw HttpException(
          'Failed to fetch posts. Status code: ${response.statusCode}',
        );
      }
    } on SocketException {
      throw Exception('No Internet connection');
    } on TimeoutException {
      throw Exception('Request timed out');
    } on FormatException catch (e) {
      throw Exception('Invalid JSON format: ${e.message}');
    }
  }
}
