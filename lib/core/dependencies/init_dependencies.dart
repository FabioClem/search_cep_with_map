import 'package:flutter_application_clean/data/datasources/cep_datasource.dart';
import 'package:flutter_application_clean/data/repository/cep_repository.dart';
import 'package:flutter_application_clean/domain/repository/cep_repository.dart';
import 'package:flutter_application_clean/domain/usecases/get_cep_usecase.dart';
import 'package:get_it/get_it.dart';

final instanceGetIt = GetIt.instance;
void init() {
  _initDatasources(instanceGetIt);
  _initRepositories(instanceGetIt);
  _initUseCases(instanceGetIt);
}

void _initDatasources(GetIt instance) {
  instance.registerFactory<CepDataSource>(
    () => CepDataSourceImpl(),
  );
}

void _initRepositories(GetIt instance) {
  instance.registerFactory<CepRepository>(
    () => CepRepositoryImpl(instance()),
  );
}

void _initUseCases(GetIt instance) {
  instance.registerFactory(
    () => GetCepUsecase(instance()),
  );
}
