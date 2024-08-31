import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:leranflutter/bloc/weather_bloc_event.dart' as e;
import 'package:leranflutter/bloc/weather_bloc_state.dart';
import 'package:leranflutter/data/my_data.dart';
import 'package:weather/weather.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';
import 'weather_bloc_event.dart';


class WeatherBlocBloc extends Bloc<e.WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWeather> ((event,emit) async {
      emit(WeatherBlocLoading());
      try{
        WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);

        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude,
            event.position.longitude
        );
        print(weather);
        emit(WeatherBlocSuccess(weather));

      }
      catch(e){
        emit(WeatherBlocFailure());
      }
    }

    );
  }
}