import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const CalcolaCostiScreen(),
    );
  }
}

class CalcolaCostiScreen extends StatefulWidget {
  const CalcolaCostiScreen({super.key});

  @override
  State<CalcolaCostiScreen> createState() => _CalcolaCostiScreenState();
}

class _CalcolaCostiScreenState extends State<CalcolaCostiScreen> {
  String tipoPercorso = 'Urbano';
  String messaggio = '';

  final TextEditingController chilometriController = TextEditingController();

  final List<String> tipiPercorso = ['Urbano', 'Extraurbano', 'Misto'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: const Text(
        'Calcola costo del viaggio',
        style: TextStyle(color: Colors.white),
      )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextField(
            controller: chilometriController,
            keyboardType: TextInputType.number,
            style: TextStyle(fontSize: 20, color: Colors.grey[800]),
            decoration: InputDecoration(
                hintText: 'Inserisci il numero di Km',
                hintStyle: TextStyle(fontSize: 18)),
          ),
          const Spacer(),
          DropdownButton<String>(
              value: tipoPercorso,
              items: tipiPercorso.map((String value) {
                return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 20, color: Colors.grey[800]),
                    ));
              }).toList(),
              onChanged: (String? nuovoValore) {
                setState(() {
                  tipoPercorso = nuovoValore!;
                });
              }),
          const Spacer(
            flex: 2,
          ),
          ElevatedButton(
              onPressed: () {
                print('chilometri ${chilometriController.text}');
                print('tipo percorso ${tipoPercorso}');
                calcolaCosto();
              },
              child: const Text(
                'Calcola costo',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
          const Spacer(
            flex: 2,
          ),
          Text(
            messaggio,
            style: TextStyle(fontSize: 24, color: Colors.grey[800]),
          )
        ]),
      ),
    );
  }

  void calcolaCosto () {
    const costoLitroCarburante = 1.8;
    double numeroChilometri = double.tryParse(chilometriController.text) ?? 0; // Provo a convertire il testo del TextEditingController in double, se non ci riesco utilizza 0
    double chilometriTipoPercorso;
    double costo;

    if (tipoPercorso == tipiPercorso[0]) {
      chilometriTipoPercorso = 14;
    } else if (tipoPercorso == tipiPercorso[1]) {
      chilometriTipoPercorso = 18;
    } else {
      chilometriTipoPercorso = 16;
    }

    costo = numeroChilometri * costoLitroCarburante / chilometriTipoPercorso;

    setState(() {
      messaggio = 'Il costo previsto per il tuo viaggio sarà  di ${costo.toString()}';
    });
  }
}



class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}