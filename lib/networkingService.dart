import 'dart:convert';
import 'User.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

Future<List<User>> networkingService(String endpoint) async {
    final response =
        await http.get(endpoint);
    
    var usersResponse = json.decode(response.body);
    List<User> users = [];
    
    if (response.statusCode == 200) {
      for (var i = 0; i < usersResponse.length; i++) {
        var user = User.fromJson(usersResponse[i]);
        users.add(user);
      }
    } else {
      throw Exception('Failed to load User');
    }
    
    return users;
  }