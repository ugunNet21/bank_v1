import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/tips_model.dart';
import 'auth_service.dart';

class TipsService {
  final String baseUrl = 'https://bwabank.tech/api';

  Future<List<TipsModel>> getTips() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/tips'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (res.statusCode == 200) {
        List<TipsModel> tips = List<TipsModel>.from(
          jsonDecode(res.body)['data'].map(
            (tip) => TipsModel.fromJson(tip),
          ),
        ).toList();

        return tips;
      }

      return throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
