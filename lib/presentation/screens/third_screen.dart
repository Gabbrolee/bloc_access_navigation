import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubit/counter_cubit.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key, required this.title, this.color}) : super(key: key);

  final String title;
  final Color? color;

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {


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
                MaterialButton(
                  onPressed: (){
                    Navigator.of(context).pushNamed('/second-screen');
                  },
                  color: widget.color,
                  child: const Text('Go to SecondScreen'),
                )
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
