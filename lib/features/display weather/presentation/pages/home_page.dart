import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../bloc/display_weather_bloc.dart';
import '../widgets/customCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController enterCityName = TextEditingController();
  List<String> favoriteLocations = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'WEATHER APP',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            color: const Color.fromARGB(255, 255, 74, 61),
            icon: const Icon(Icons.favorite),
            onPressed: () {
              _showFavoritesDialog();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: enterCityName,
              decoration: InputDecoration(
                labelText: 'Enter city name',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    BlocProvider.of<DisplayWeatherBloc>(context).add(
                      DisplayWeather(cityName: enterCityName.text),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            BlocBuilder<DisplayWeatherBloc, DisplayWeatherState>(
              builder: (context, state) {
                if (state.status == DisplayWeatherStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.status == DisplayWeatherStatus.success) {
                  return CustomCard(
                    currentstate: state.currentstate,
                    cityName: enterCityName.text,
                  );
                } else if (state.status == DisplayWeatherStatus.failed) {
                  return Center(
                    child: Text(
                      'Error: ${state.errorMessage}',
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _addToFavorites(enterCityName.text);
              },
              child: const Text('Add to Favorites'),
            ),
          ],
        ),
      ),
    );
  }

  void _addToFavorites(String cityName) {
    setState(() {
      favoriteLocations.add(cityName);
    });

    Fluttertoast.showToast(
        msg: ' $cityName added to Favorites',
        backgroundColor: const Color.fromARGB(255, 86, 203, 90));
  }

  void _showFavoritesDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Favorite Locations'),
          content: Column(
            children: [
              if (favoriteLocations.isEmpty)
                const Text('No favorite locations yet.'),
              for (var location in favoriteLocations)
                ListTile(
                  title: Text(location),
                  // Add more customization or actions as needed
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
