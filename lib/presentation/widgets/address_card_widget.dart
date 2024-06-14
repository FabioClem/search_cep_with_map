import 'package:flutter/material.dart';
import 'package:flutter_application_clean/data/models/cep_model.dart';

class AddressCardWidget extends StatelessWidget {
  final CepModel cepModel;

  const AddressCardWidget({super.key, required this.cepModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Bairro: ${cepModel.neighborhood}'),
                Text('Rua: ${cepModel.street}'),
                Text('Estado: ${cepModel.state}'),
                Text('Cidade: ${cepModel.city}'),
                const Divider(),
                Row(
                  children: [
                    Text('Latitude: ${cepModel.location.coordinates.latitude}'),
                    const SizedBox(width: 10),
                    Text(
                        'Longitude: ${cepModel.location.coordinates.longitude}'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
