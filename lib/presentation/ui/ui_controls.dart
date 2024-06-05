import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  const UiControlsScreen({super.key});
  static const name = 'ui_controls';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UI Controls"),
      ),
      body: _UiControlsView(),
    );
  }
}

enum Transport{car, plane, boat, submarine}

class _UiControlsView extends StatefulWidget {

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

class _UiControlsViewState extends State<_UiControlsView> {
  bool developer = true;

  Transport selectTransport = Transport.car;

  bool breakfast = false;

  bool lunch = false;

  bool dinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles'),
          value: developer, 
          onChanged: (value) => setState(() {
            developer = !developer;
          }),
        ),
        ExpansionTile(
          title: const Text('Transporte'),
          subtitle: const Text('Viaje'),
          children: [
            RadioListTile(
              title: const Text('Carro'),
              subtitle: const Text('Viajar en carro'),
              value: Transport.car, 
              groupValue: selectTransport, 
              onChanged: (value) => setState(() {
                selectTransport = Transport.car;
              })
            ),
            RadioListTile(
              title: const Text('Bote'),
              subtitle: const Text('Viajar en bote'),
              value: Transport.boat, 
              groupValue: selectTransport, 
              onChanged: (value) => setState(() {
                selectTransport = Transport.boat;
              })
            ),
            RadioListTile(
              title: const Text('Avión'),
              subtitle: const Text('Viajar en avión'),
              value: Transport.plane, 
              groupValue: selectTransport, 
              onChanged: (value) => setState(() {
                selectTransport = Transport.plane;
              })
            ),
            RadioListTile(
              title: const Text('Submarino'),
              subtitle: const Text('Viajar en submarino'),
              value: Transport.submarine, 
              groupValue: selectTransport, 
              onChanged: (value) => setState(() {
                selectTransport = Transport.submarine;
              })
            ),
            
          ],
        ),
        CheckboxListTile(
          title: const Text('Desayuno'),
          subtitle: const Text('Desayuno incluido'),
          value: breakfast, 
          onChanged: ((value) => setState(() {
            breakfast = !breakfast;
          })
        )
        ),
        CheckboxListTile(
          title: const Text('Lunch'),
          subtitle: const Text('Lunch incluido'),
          value: lunch, 
          onChanged: ((value) => setState(() {
            lunch = !lunch;
          })
        )
        ),
        CheckboxListTile(
          title: const Text('Cena'),
          subtitle: const Text('Cena incluida'),
          value: dinner, 
          onChanged: ((value) => setState(() {
            dinner = !dinner;
          })
        )
        ),
      ],
    );
  }
}