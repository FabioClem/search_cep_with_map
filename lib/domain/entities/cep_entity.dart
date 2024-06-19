class CepEntity {
  final String cep;
  final String state;
  final String city;
  final String neighborhood;
  final String street;
  final String service;
  final LocationEntity location;

  CepEntity(
      {required this.cep,
      required this.state,
      required this.city,
      required this.neighborhood,
      required this.street,
      required this.service,
      required this.location});
}

class LocationEntity {
  final String type;
  final CoordinatesEntity coordinates;

  LocationEntity({required this.type, required this.coordinates});
}

class CoordinatesEntity {
  final String? latitude;
  final String? longitude;

  CoordinatesEntity({ this.latitude,  this.longitude});
}
