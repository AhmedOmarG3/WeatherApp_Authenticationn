class Weathermodel {
  final DateTime date;
  final String cityName;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String image;
  final String weatherState;

  Weathermodel( 
      {required this.cityName,required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.image,
      required this.weatherState});

  factory Weathermodel.fromJson(json) {
    return Weathermodel(cityName: json['location']['name'],
        date: DateTime.parse(json['current']['last_updated']),
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        weatherState: json['forecast']['forecastday'][0]['day']['condition']['text'],
            
        image: json['forecast']['forecastday'][0]['day']['condition']['icon']);
  }
}
