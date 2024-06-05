import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {

  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons Screen"),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        heroTag: 1,
        child: const Icon(Icons.arrow_back_ios_new_outlined),
        onPressed: (){
          context.pop();
        }),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    // Icon icon = Icon(Icons.dangerous);
    final color = Theme.of(context).colorScheme;
    return SizedBox(
      child: Wrap(
        // direction: Axis.vertical,
        
        spacing: 10,
        alignment: WrapAlignment.center,
        children: [
          ElevatedButton(
            onPressed: (){}, 
            child: const
                Text("Botón Elevated Activo"),
          ),
          
          const ElevatedButton(
            onPressed: null, 
            child: Text("Botón Elevated Inactivo")
          ),

          ElevatedButton.icon(
            onPressed: (){
              // setState{
              //   icon = Icon(Icons.add_home_rounded);
              // }
            }, 
            icon: const Icon(Icons.access_alarm),
            label: const Text("Elevated Icon"),
          ),
          FloatingActionButton.extended(
            heroTag: 2,
            onPressed: (){}, 
            label: const Text("FAB")
          ),
          FilledButton(
            onPressed: (){}, 
            child: const Text("Filled button")
          ),
          FilledButton.icon(
            onPressed: (){}, 
            icon: const Icon(Icons.access_alarm), 
            label: const Text("Filled Icon button")
          ),
          OutlinedButton(
            onPressed: (){}, 
            child: const Text("Outlined Icon")
          ),
          OutlinedButton.icon(
            onPressed: (){}, 
            icon: const Icon(Icons.accessibility), 
            label: const Text("Outlined Icon Button")
          ),
          TextButton(
            onPressed: (){}, 
            child: const Text("Text Button")
          ),
          TextButton.icon(
            onPressed: (){}, 
            icon: const Icon(Icons.account_balance_wallet), 
            label: const Text("Text Icon Button")
          ),

          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.add_box_outlined)
          ),
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.add_box),
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(color.primary),
              iconColor: const WidgetStatePropertyAll(Colors.white),
            ),
          ),

          const CustomButton(),




        ],
      ),

    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: color.primary,
        child: InkWell(
          onTap: (){},
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Custmo Button", style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
}