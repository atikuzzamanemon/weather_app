import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:leranflutter/bloc/weather_bloc_bloc.dart';
import 'package:leranflutter/bloc/weather_bloc_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Widget getWeatherIcon(int code){
    switch(code) {
      case >=200 && < 300:
        return Image.asset('assets/a1.png'
        );
      case >= 300 && < 400:
        return Image.asset('assets/a2.png'
        );
      case >=500 && < 600:
        return Image.asset('assets/a3.png'
        );
      case >=600 && < 700:
        return Image.asset('assets/a4.png'
        );
      case >=700 && < 800:
        return Image.asset('assets/a5.png'
        );
      case == 800:
        return Image.asset('assets/a6.png'
        );
      case >800 && <= 804:
        return Image.asset('assets/a7.png'
        );
        //break;
        default:
          return Image.asset(
            Image.asset('assets/a8.png') as String
    );

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2*kToolbarHeight,40,20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(1.2,-0.1),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.2,-0.1),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0,-1.2),
                child: Container(
                  height: 400,
                  width: 600,
                  decoration: BoxDecoration(

                    color: Color(0xFFFFAB40),
                  ),
                ),
              ),
              BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100.0,sigmaY: 100.0),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.transparent),
                  ),
              ),
              BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                builder: (context, state) {
                  if(state is WeatherBlocSuccess){
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${state.weather.areaName}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                        const SizedBox(height: 8,),
                        const Text(
                          "Happy Day",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        getWeatherIcon(state.weather.weatherConditionCode!),
                        Center(
                          child: Text(
                            '${state.weather.temperature!.celsius!.round()} C',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 55,
                            fontWeight: FontWeight.w600
                          ),
                          ),

                        ),
                        Center(
                          child: Text(
                          state.weather.weatherMain!.toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w500
                            ),
                          ),

                        ),
                        const SizedBox(height: 5,),
                        Center(
                          child: Text(
                            DateFormat('EEEE dd - ').add_jm().format(state.weather.date!),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w300
                            ),
                          ),

                        ),
                        const SizedBox(height: 60,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/a1.png',
                                  scale: 2,
                                ),
                                const SizedBox(width: 5,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Sunrise',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,

                                      ),
                                    ),
                                    SizedBox(height: 3,),
                                    Text(
                                      DateFormat().add_jm().format(state.weather.sunrise!),

                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/a5.png',
                                  scale: 2,
                                ),
                                const SizedBox(width: 5,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Sunset',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,

                                      ),
                                    ),
                                    SizedBox(height: 3,),
                                    Text(
                                      DateFormat().add_jm().format(state.weather.sunset!),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),


                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 30),
                          child: Divider(
                            color: Colors.grey,
                          ),

                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/a1.png',
                                  scale: 2,
                                ),
                                const SizedBox(width: 5,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Temp Max',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,

                                      ),
                                    ),
                                    SizedBox(height: 3,),
                                    Text(
                                      "${state.weather.tempMax!.celsius!.round().toString()} C",

                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/a5.png',
                                  scale: 2,
                                ),
                                const SizedBox(width: 5,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Temp Min',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,

                                      ),
                                    ),
                                    SizedBox(height: 3,),
                                    Text(
                                        "${state.weather.tempMin!.celsius!.round().toString()} C",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),


                          ],
                        )
                      ],
                    ),
                  );}
                  else{
                    return Container(

                    );
                  }
                }
              )
            ],
          ),
        ),

      ),
    );
  }
}
