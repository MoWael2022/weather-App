import 'package:bloc/bloc.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/weather_cubit/weather_state.dart';


class WeatherCubit extends Cubit<WeatherState>{
  WeatherCubit(this.weatherService) : super(WeatherInitial());

  WeatherService weatherService;
  String? cityname;
  WeatherModel? weatherModel;

  void getstate ({required String namecity}) async{
    emit(WeatherLoading());
    try{
      weatherModel = await weatherService.getWeather(cityName: namecity);
       emit(WeatherSuccess());
    }on Exception catch(e){
      emit(WeatherFaliure());
    }
  }


}