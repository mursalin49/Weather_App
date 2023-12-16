import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:hasan/model/weather_model.dart';
import 'package:intl/intl.dart';

class TodaysWeather extends StatelessWidget {
  final WeatherModel? weatherModel;

  const TodaysWeather({Key? key, this.weatherModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WeatherBg(
            weatherType: WeatherType.sunnyNight,
            width: double.infinity,
            height: 300),
        SizedBox(
          width: double.infinity,
          //padding: EdgeInsets.all(8),
          height: 300,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    color: Colors.white10,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(10))),
                child: Column(
                  children: [
                    Text(
                      weatherModel?.location?.name ?? "",
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                          //foreground: Paint()..shader = shader,
                          ),
                    ),
                    Text(
                        DateFormat.yMMMMEEEEd().format(DateTime.parse(
                            weatherModel?.current?.lastUpdated.toString() ??
                                "")),
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                            //foreground: Paint()..shader = shader,
                            )),
                  ],
                ),
              ),
              Row(
                children: [
                  Image.network(
                      "https:${weatherModel?.current?.condition?.icon ?? ""}"),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
