import 'package:counter_bloc/counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, counter) =>  SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: (){
                  context.read<CounterCubit>().increment();
                },
                child: const Text("Increment")
              ),
              Text(counter.toString()),
              ElevatedButton(
                onPressed: (){
                  context.read<CounterCubit>().decrement();
                },
                child: const Text("Decrement")
              )
            ],
          ),
        ),
      ),
    );
  }
}