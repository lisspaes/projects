import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showSnackbar(BuildContext context){

    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(
        label: 'OK', 
        onPressed: (){}
      ),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context){
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: const Text("¿Estás seguro?"),
        content: const Text("Este es el cuerpo del diálogo"),
        actions: [
          TextButton(onPressed: ()=> context.pop(), child: const Text('Cancelar')),
          FilledButton(onPressed: ()=> context.pop(), child: const Text('Aceptar'))
        ],
      )
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y diálogos'),
      ),
      body: Center(
        child: Column(
          children: [
            FilledButton.tonal(
              onPressed: ()=>openDialog(context), 
              child: const Text("Mostrar diálogo")
            ),
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Text("Esto es un widget extra")
                  ]  
                );
              }, 
              child: const Text("Liencias usadas")
            )

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()=>showSnackbar(context), 
        label: const Text("Mostrar snackbar"),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}