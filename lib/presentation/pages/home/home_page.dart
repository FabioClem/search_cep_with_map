import 'package:flutter/material.dart';
import 'package:flutter_application_clean/presentation/pages/home/bloc/get_cep_bloc.dart';
import 'package:flutter_application_clean/presentation/widgets/address_card_widget.dart';
import 'package:flutter_application_clean/presentation/widgets/map_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final cepTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCepBloc, GetCepState>(
      builder: (context, state) => Scaffold(
        key: _scaffoldKey,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SwitchListTile(
                value: state.isDarkTheme,
                title: Text(
                    'Trocar tema -> ${state.isDarkTheme ? 'Dark' : 'Light'}'),
                onChanged: (value) {
                  context.read<GetCepBloc>().add(
                        ChangeThemeEvent(context: context, isDarkTheme: value),
                      );
                },
              ),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Form(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Buscar CEP',
                                style: TextStyle(
                                  fontSize: 42,
                                ),
                              ),
                              TextFormField(
                                controller: cepTextController,
                                decoration: const InputDecoration(
                                  labelText: 'Digite um CEP',
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Digite um CEP';
                                  }
                                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                    return 'Digite apenas números';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<GetCepBloc>().add(
                                            FetchCepEvent(
                                                cep: cepTextController.text),
                                          );
                                    }
                                  },
                                  child: const Text('Buscar'), // 83091206
                                ),
                              ),
                              const SizedBox(height: 20),
                              if (state is GetCepLoadingState) ...[
                                const CircularProgressIndicator(),
                              ] else if (state is GetCepSuccessState) ...[
                                const Divider(),
                                const SizedBox(height: 20),
                                const Text(
                                  'Resultado:',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                AddressCardWidget(cepModel: state.cepModel!),
                                const SizedBox(height: 20),
                                if (state.cepModel!.location.coordinates
                                            .latitude !=
                                        null &&
                                    state.cepModel!.location.coordinates
                                            .longitude !=
                                        null) ...[
                                  const Text(
                                    'Localização:',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 350,
                                    child: MapWidget(
                                      latitude: double.parse(state.cepModel!
                                          .location.coordinates.latitude!),
                                      longitude: double.parse(state.cepModel!
                                          .location.coordinates.longitude!),
                                      zoom: 10,
                                    ),
                                  ),
                                ],
                              ] else if (state is GetCepErrorState) ...[
                                SizedBox(
                                  width: double.infinity,
                                  height: 100,
                                  child: Card(
                                    child: Center(
                                      child: Text(
                                        state.error.message,
                                        style: const TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ] else ...[
                                const SizedBox.shrink(),
                              ]
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
