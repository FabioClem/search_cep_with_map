import 'package:flutter_application_clean/core/errors/response_errors.dart';
import 'package:flutter_application_clean/data/datasources/cep_datasource.dart';
import 'package:flutter_application_clean/data/models/cep_model.dart';
import 'package:flutter_application_clean/domain/repository/cep_repository.dart';

class CepRepositoryImpl implements CepRepository {
  final CepDataSource cepDataSource;

  CepRepositoryImpl(this.cepDataSource);

  @override
  Future<(CepModel?, ResponseError?)> getCep(int cep) async {
    try {
      final cepResponse = await cepDataSource.getCep(cep);
      return (cepResponse, null);
    } catch (e) {
      return (null, ResponseError(e.toString()));
    }
  }
}
