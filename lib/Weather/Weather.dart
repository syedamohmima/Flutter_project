import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({Key? key}) : super(key: key);

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  late final WeatherFactory _wf;
  Weather? _weather;
  List<Weather> _forecast = [];
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _wf = WeatherFactory('0006cfc2b3e0a12c46a2c815a76d3fb0'); // Replace with your API key
    _fetchWeatherData("Dhaka");
  }

  Future<void> _fetchWeatherData(String city) async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      Weather weather = await _wf.currentWeatherByCityName(city);
      List<Weather> forecast = await _wf.fiveDayForecastByCityName(city); // Fetch 5-day forecast

      setState(() {
        _weather = weather;
        _forecast = forecast;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Error fetching weather data: $e';
      });
    }
  }

  void _refreshWeatherData() {
    if (_searchController.text.isNotEmpty) {
      _fetchWeatherData(_searchController.text);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a city name')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Weather App'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: _refreshWeatherData,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Enter city name',
              suffixIcon: IconButton(
                onPressed: _refreshWeatherData,
                icon: const Icon(Icons.search),
              ),
            ),
            onSubmitted: (value) => _fetchWeatherData(value),
          ),
          const SizedBox(height: 20),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            )
          else if (_errorMessage.isNotEmpty)
            Center(
              child: Text(
                _errorMessage,
                style: const TextStyle(color: Colors.white),
              ),
            )
          else if (_weather != null)
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      _weather!.areaName ?? "",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${_weather!.temperature?.celsius?.toStringAsFixed(0)}° C",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _weather!.weatherDescription ?? "",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _infoCard(
                          'Max Temp',
                          '${_weather!.tempMax?.celsius?.toStringAsFixed(0)}° C',
                        ),
                        _infoCard(
                          'Min Temp',
                          '${_weather!.tempMin?.celsius?.toStringAsFixed(0)}° C',
                        ),
                        _infoCard(
                          'Humidity',
                          '${_weather!.humidity?.toStringAsFixed(0)}%',
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _infoCard(
                          'Wind Speed',
                          '${_weather!.windSpeed?.toStringAsFixed(0)} m/s',
                        ),
                        _infoCard(
                          'Pressure',
                          '${_weather!.pressure?.toStringAsFixed(0)} hPa',
                        ),
                        _infoCard(
                          'Precipitation',
                          '${_weather!.rainLastHour?.toStringAsFixed(1)} mm',
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _buildForecastUI(),
                  ],
                ),
              ),
            )
          else
            const Center(
              child: Text(
                'No weather data available',
                style: TextStyle(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildForecastUI() {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          '5-Day Weather Forecast',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _forecast.length,
            itemBuilder: (context, index) {
              final weather = _forecast[index];
              return _forecastCard(weather);
            },
          ),
        ),
      ],
    );
  }

  Widget _forecastCard(Weather weather) {
    return Card(
      color: Colors.white.withOpacity(0.8),
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${weather.date?.day}/${weather.date?.month}/${weather.date?.year}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "${weather.temperature?.celsius?.toStringAsFixed(0)}° C",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              weather.weatherDescription ?? "",
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Max: ${weather.tempMax?.celsius?.toStringAsFixed(0)}° C',
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            Text(
              'Min: ${weather.tempMin?.celsius?.toStringAsFixed(0)}° C',
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(String title, String value) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: WeatherWidget(),
  ));
}