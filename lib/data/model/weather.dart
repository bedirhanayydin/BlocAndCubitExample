// ignore_for_file: public_member_api_docs, sort_constructors_first

class Weather {
  final String cityName;
  final double temperatureCelcius;
  Weather({
    required this.cityName,
    required this.temperatureCelcius,
  });

  Weather copyWith({
    String? cityName,
    double? temperatureCelcius,
  }) {
    return Weather(
      cityName: cityName ?? this.cityName,
      temperatureCelcius: temperatureCelcius ?? this.temperatureCelcius,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'cityName': cityName,
      'temperatureCelcius': temperatureCelcius,
    };
  }

  factory Weather.fromJson(Map<String, dynamic> map) {
    return Weather(
      cityName: map['cityName'] as String,
      temperatureCelcius: map['temperatureCelcius'] as double,
    );
  }

  @override
  String toString() => 'Weather(cityName: $cityName, temperatureCelcius: $temperatureCelcius)';

  @override
  bool operator ==(covariant Weather other) {
    if (identical(this, other)) return true;

    return other.cityName == cityName && other.temperatureCelcius == temperatureCelcius;
  }

  @override
  int get hashCode => cityName.hashCode ^ temperatureCelcius.hashCode;
}
