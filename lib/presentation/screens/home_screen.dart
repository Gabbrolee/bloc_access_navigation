import 'package:bloc_access_navigation/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubit/counter_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title, this.color}) : super(key: key);

  final String title;
  final Color? color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
      BlocConsumer<CounterCubit, CounterState>(
        listener: (context, state) {
          if(state.wasIncremented == true){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Incremented'),
                duration: Duration(milliseconds: 6),),);
          } else if(state.wasIncremented == false){
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Decremented"),
                  duration: Duration(milliseconds: 6),)
            );
          }
        },
        builder: (context, state){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('You have pushed the button this many times: '),
                Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 20,),
                ///builder takes another name of a context or use _, so it
                ///won't take the context of the initial screen
                ///when passing data with bloc, the format can be followed
                MaterialButton(
                  onPressed: (){
                    Navigator.of(context).pushNamed('/second-screen');
                  },
                  color: widget.color,
                  child: const Text('Go to SecondScreen'),
                ),
                const SizedBox(height: 20,),
                MaterialButton(
                  onPressed: (){
                    Navigator.of(context).pushNamed('/third-screen');
                  },
                  color: widget.color,
                  child: const Text('Go to ThirdScreen'),
                ),
              ],
            ),
          );
        },
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (){
              BlocProvider.of<CounterCubit>(context).increment();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10,),
          FloatingActionButton(
            onPressed: (){
              BlocProvider.of<CounterCubit>(context).decrement();
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

///Bloc Consumer is use to replace bloclistener and blocbuilder
///in the code, since it encompasses them.
