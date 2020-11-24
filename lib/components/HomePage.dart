import 'package:weather_test/delegates/SearchDelegate.dart';
import 'package:weather_test/events/WeatherEvent.dart';
import 'package:weather_test/states/WeatherState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_test/bloc/WeatherBloc.dart';
import 'package:weather_test/components/MainScreenWrapper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool hours_or_days = false;
  changeview(){
    hours_or_days =! hours_or_days;
  }
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => WeatherBloc(),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          print(state);
          if (state is WeatherLoadSuccess) {
            var dropdownValue = 'View';
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Color.fromARGB(255, 79, 104, 157),//Color.fromRGBO(255, 137, 181,221),
                leading: DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.remove_red_eye_rounded,color: Colors.black,),
                  iconSize: 24,
                  elevation: 16,
                  isDense: false,
                  isExpanded: true,
                  style: TextStyle(color: Colors.black),
                  onChanged:(newValue) {
                    if(newValue == 'by hours') {
                      setState(() {
                        dropdownValue = newValue;
                        hours_or_days = true;
                        //changeview();
                        print(newValue);
                        print(hours_or_days);
                      });
                    }
                    if(newValue == 'by days'){
                      setState(() {
                        dropdownValue = newValue;
                        hours_or_days = false;
                        //changeview();
                        print(newValue);
                        print(hours_or_days);
                      });
                    }
                  },

                  items: <String>['View', 'by days', 'by hours']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.my_location),
                    onPressed: () {
                      BlocProvider.of<WeatherBloc>(context).add(WeatherCurrentPositionRequested());
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      showSearch(
                          context: context, delegate: MySearchDelegate((query) {
                        BlocProvider.of<WeatherBloc>(context).add(WeatherRequested(city: query));
                      }));
                    },
                  )
                ],
              ),
              body:


              Container(
                color: Color.fromARGB(255, 150, 185, 215),
                padding: EdgeInsets.only(top: 64),
                child: MainScreenWrapper(
                  weather: state.weather, hourlyWeather: state.hourlyWeather, dailyWeather: state.dailyWeather, hours_or_days: hours_or_days,),
              ),
            );
          }
          return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                actions: [
                  IconButton(
                    icon: Icon(Icons.my_location),
                    onPressed: () {
                      BlocProvider.of<WeatherBloc>(context).add(WeatherCurrentPositionRequested());
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      showSearch(
                          context: context, delegate: MySearchDelegate((query) {
                        BlocProvider.of<WeatherBloc>(context).add(WeatherRequested(city: query,));
                      }));
                    },
                  )
                ],
              ),
              body: Center(
                child: CircularProgressIndicator(),
              )
          );
        },
      ),
    );
  }
}