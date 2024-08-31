import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:leranflutter/bloc/weather_bloc_bloc.dart';
//part of 'weather_bloc_bloc';

sealed class WeatherBlocEvent extends Equatable{
  const WeatherBlocEvent();
  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherBlocEvent{

  final Position position;

  const FetchWeather(this.position);

  @override
  List<Object> get props => [position];

}