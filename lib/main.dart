import 'package:bloc_access_navigation/presentation/router/app_router.dart';
import 'package:bloc_access_navigation/presentation/screens/home_screen.dart';
import 'package:bloc_access_navigation/presentation/screens/second_screen.dart';
import 'package:bloc_access_navigation/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/cubit/counter_cubit.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // final CounterCubit _counterCubit = CounterCubit();
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
        create: (context) => CounterCubit(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: _appRouter.onGenerateRoute,

          /// this has been created in the app_router class
          // routes:
          // {
          //   '/': (context) => BlocProvider.value(
          //     value: _counterCubit,
          //     child: (
          //        HomeScreen( title: 'Home Screen', color: Colors.redAccent,)
          //     ),
          //   ),
          //   '/second-screen': (context) =>
          //       BlocProvider.value(
          //         value: _counterCubit,
          //         child: SecondScreen( title: 'Second Screen',  color: Colors.lightBlueAccent,),
          //       ),
          //   '/third-screen': (context) =>
          //       BlocProvider.value(
          //         value: _counterCubit,
          //         child: ThirdScreen( title: 'Third Screen', color: Colors.grey,),
          //       ),
          // },
        )
    );
  }
// @override
// void dispose() {
//   _counterCubit.close();
//   super.dispose();
// }

}
