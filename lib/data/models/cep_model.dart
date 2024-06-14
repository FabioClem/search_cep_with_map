import 'package:flutter_application_clean/domain/entities/cep_entity.dart';

class CepModel extends CepEntity {
  CepModel(
      {required super.cep,
      required super.state,
      required super.city,
      required super.neighborhood,
      required super.street,
      required super.service,
      required super.location});

  factory CepModel.fromJson(Map<String, dynamic> json) => CepModel(
        cep: json['cep'],
        state: json['state'],
        city: json['city'],
        neighborhood: json['neighborhood'],
        street: json['street'],
        service: json['service'],
        location: LocationModel.fromJson(json['location']),
      );
}

class LocationModel extends LocationEntity {
  LocationModel({required super.type, required super.coordinates});

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        type: json['type'],
        coordinates: CoordinatesModel.fromJson(json['coordinates']),
      );
}

class CoordinatesModel extends CoordinatesEntity {
  CoordinatesModel({required super.latitude, required super.longitude});

  factory CoordinatesModel.fromJson(Map<String, dynamic> json) =>
      CoordinatesModel(
        latitude: json['latitude'],
        longitude: json['longitude'],
      );
}
