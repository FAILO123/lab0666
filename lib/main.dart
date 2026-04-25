import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: CalendarioMaster(), debugShowCheckedModeBanner: false));

class Evento {
  final String titulo;
  final int dia; 
  final double top;
  final double height;
  final Color color;
  Evento(this.titulo, this.dia, this.top, this.height, this.color);
}

class CalendarioMaster extends StatefulWidget {
  const CalendarioMaster({super.key});
  @override
  State<CalendarioMaster> createState() => _CalendarioMasterState();
}

class _CalendarioMasterState extends State<CalendarioMaster> {
  final List<Evento> todosLosEventos = [
    Evento("Reunión Coord.", 0, 60, 50, Colors.green),
    Evento("Daily Smart", 0, 120, 40, Colors.blue),
    Evento("Daily Smart", 1, 120, 40, Colors.blue),
    Evento("Diseño UX", 1, 200, 70, Colors.orange),
    Evento("Base de Datos", 2, 80, 100, Colors.red),
    Evento("Feriado Militar", 2, 0, 40, Colors.green),
    Evento("Daily Smart", 3, 120, 40, Colors.blue),
    Evento("Ética Prof.", 3, 300, 60, Colors.teal),
    Evento("Lab. Móviles", 4, 180, 90, Colors.deepPurple),
    Evento("Proyecto Final", 4, 400, 100, Colors.pink),
    Evento("Ciberseguridad", 5, 100, 80, Colors.blueGrey),
  ];

  List<Evento> eventosFiltrados = [];
  String query = "";

  @override
  void initState() {
    eventosFiltrados = todosLosEventos;
    super.initState();
  }

  void filtrarBusqueda(String texto) {
    setState(() {
      query = texto;
      eventosFiltrados = todosLosEventos
          .where((e) => e.titulo.toLowerCase().contains(texto.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: TextField(
          decoration: const InputDecoration(
            hintText: "Buscar curso...",
            border: InputBorder.none,
            icon: Icon(Icons.search, color: Colors.indigo),
          ),
          onChanged: filtrarBusqueda, 
        ),
      ),
      body: Column(
        children: [
          const CabeceraDias(),
          Expanded(
            child: SingleChildScrollView(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ColumnaHoras(),
                  ...List.generate(7, (i) => DayColumn(dayIndex: i, eventos: eventosFiltrados.where((e) => e.dia == i).toList())),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class CabeceraDias extends StatelessWidget {
  const CabeceraDias({super.key});
  @override
  Widget build(BuildContext context) {
    final dias = ['Lun 22', 'Mar 23', 'Mié 24', 'Jue 25', 'Vie 26', 'Sáb 27', 'Dom 28'];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(children: [
        const SizedBox(width: 60),
        ...dias.map((d) => Expanded(child: Center(child: Text(d, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12))))),
      ]),
    );
  }
}

class ColumnaHoras extends StatelessWidget {
  const ColumnaHoras({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(children: List.generate(12, (i) => Container(
      height: 60, width: 60, alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 5),
      child: Text('${i + 8}:00', style: const TextStyle(fontSize: 10, color: Colors.grey)),
    )));
  }
}

class DayColumn extends StatelessWidget {
  final int dayIndex;
  final List<Evento> eventos;
  const DayColumn({super.key, required this.dayIndex, required this.eventos});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.grey.shade200))),
        child: Stack(children: [
          Column(children: List.generate(12, (i) => Container(height: 60, decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade100)))))),
          ...eventos.map((e) => EventCard(evento: e)).toList(),
        ]),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final Evento evento;
  const EventCard({super.key, required this.evento});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: evento.top, left: 2, right: 2, height: evento.height,
      child: Container(
        decoration: BoxDecoration(
          color: evento.color.withOpacity(0.15),
          borderRadius: BorderRadius.circular(4),
          border: Border(left: BorderSide(color: evento.color, width: 4)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(evento.titulo, style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: evento.color.withAlpha(200))),
        ),
      ),
    );
  }
}