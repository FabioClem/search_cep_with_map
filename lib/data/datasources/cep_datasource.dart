import 'dart:convert';

import 'package:flutter_application_clean/core/errors/response_errors.dart';
import 'package:flutter_application_clean/data/models/cep_model.dart';
import 'package:http/http.dart' as http;

abstract class CepDataSource {
  Future<CepModel> getCep(int cep);
}

class CepDataSourceImpl implements CepDataSource {
  CepDataSourceImpl();

  @override
  Future<CepModel> getCep(int cep) async {
    try {
      final response = await http
          .get(Uri.parse('https://brasilapi.com.br/api/cep/v2/{$cep}'));
      if (response.statusCode == 200) {
        return CepModel.fromJson(jsonDecode(response.body));
      } else {
        throw ResponseError('Erro ao buscar CEP');
      }
    } catch (e) {
      throw ResponseError(e.toString());
    }
  }
}
