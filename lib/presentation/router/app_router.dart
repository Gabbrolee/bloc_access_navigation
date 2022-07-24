
import 'package:bloc_access_navigation/presentation/screens/home_screen.dart';
import 'package:bloc_access_navigation/presentation/screens/second_screen.dart';
import 'package:bloc_access_navigation/presentation/screens/third_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';

class AppRouter {
 final CounterCubit _counterCubit = CounterCubit();

  Route onGenerateRoute( RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
         return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterCubit,
                child:  const HomeScreen(title: "Home Screen", color: Colors.blue,)
            ));


      case '/second-screen':
         return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterCubit,
                child: const SecondScreen(title: "SecondScreen", color: Colors.teal,))
        );


      case '/third-screen':
         return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterCubit,
                child: const ThirdScreen(title: "ThirdScreen", color: Colors.yellow,))
        );


      default:
        return _errorRoute();
    }
    return _errorRoute();
  }
  void dispose(){
    _counterCubit.close();
  }

  Route _errorRoute(){
    return MaterialPageRoute(
        builder: (_){
          return Scaffold(
            appBar: AppBar(
              title: const Text("Error"),
            ),
            body: const Center(
              child:  Text("Error"),
            ),
          );
        }
    );
  }
}