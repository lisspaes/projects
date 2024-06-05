import 'package:flutter/material.dart';
import 'package:flutter_demostration/presentation/provider/counter_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CounterScreen extends ConsumerWidget {

  static const name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //.watch lee el contenido del provider
    final int counterClick = ref.watch(counterProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Screen"),
      ),
      body: Center(
        child: Text("Valor: $counterClick"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          // ref.read(counterProvider.notifier).update((state) => state++);
          ref.read(counterProvider.notifier).state++;
        }),
    );
  }
}

