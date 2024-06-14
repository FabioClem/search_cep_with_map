import 'package:flutter_application_clean/core/errors/response_errors.dart';
import 'package:flutter_application_clean/data/models/cep_model.dart';

abstract interface class CepRepository {
  Future<(CepModel?, ResponseError?)> getCep(int cep);
}
