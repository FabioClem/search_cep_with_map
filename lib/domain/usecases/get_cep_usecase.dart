import 'package:flutter_application_clean/core/errors/response_errors.dart';
import 'package:flutter_application_clean/data/models/cep_model.dart';
import 'package:flutter_application_clean/domain/repository/cep_repository.dart';

class GetCepUsecase {
  final CepRepository repository;

  GetCepUsecase(this.repository);

  Future<(CepModel?, ResponseError?)> call(int cep) async {
    return await repository.getCep(cep);
  }
}
