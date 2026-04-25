import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: CalendarioCursos(),
      debugShowCheckedModeBanner: false,
    ));

class CalEvent {
  final String title;
  final String subtitle;
  final String time;
  final double startHour; // hora decimal, e.g. 9.0 = 9:00, 9.5 = 9:30
  final double durationH;
  final Color color;
  final IconData icon;
  final String? location;
  final String? description;

  const CalEvent({
    required this.title,
    this.subtitle = '',
    required this.time,
    required this.startHour,
    required this.durationH,
    required this.color,
    required this.icon,
    this.location,
    this.description,
  });
}

final Map<int, List<CalEvent>> weekEvents = {
  0: [
    CalEvent(title: 'Reunión de Coordinación', subtitle: 'Gerencia', time: '08:00 – 09:00', startHour: 8, durationH: 1, color: Colors.green, icon: Icons.groups, location: 'Sala A', description: 'Reunión semanal del equipo con revisión de KPIs.'),
    CalEvent(title: 'Base de Datos II', subtitle: 'Curso – Prof. Mamani', time: '09:00 – 10:30', startHour: 9, durationH: 1.5, color: Colors.indigo, icon: Icons.storage, location: 'Lab 204', description: 'Normalización y modelado relacional avanzado.'),
    CalEvent(title: 'Daily Proyecto Smart', subtitle: 'Stand-up', time: '10:30 – 11:00', startHour: 10.5, durationH: 0.5, color: Colors.blue, icon: Icons.bolt, location: 'Virtual', description: 'Revisión de tareas del sprint actual.'),
    CalEvent(title: 'Revisión BD360', subtitle: 'Microsoft', time: '14:00 – 15:00', startHour: 14, durationH: 1, color: Colors.purple, icon: Icons.cloud, location: 'Online', description: 'Revisión de entorno cloud BD360.'),
    CalEvent(title: 'Proyecto Final – Avance', subtitle: 'Entrega parcial', time: '16:00 – 17:30', startHour: 16, durationH: 1.5, color: Colors.pink, icon: Icons.assignment_turned_in, description: 'Presentación del avance del módulo 3.'),
  ],
  1: [
    CalEvent(title: 'Daily Proyecto Smart', subtitle: 'Stand-up', time: '09:00 – 09:30', startHour: 9, durationH: 0.5, color: Colors.blue, icon: Icons.bolt, location: 'Virtual'),
    CalEvent(title: 'Diseño UX/UI', subtitle: 'Curso – Prof. Quispe', time: '10:00 – 12:00', startHour: 10, durationH: 2, color: Colors.orange, icon: Icons.design_services, location: 'Aula 302', description: 'Prototipado con Figma y principios de usabilidad.'),
    CalEvent(title: 'Inglés Técnico', subtitle: 'Curso – Nivel B2', time: '14:00 – 15:30', startHour: 14, durationH: 1.5, color: Colors.teal, icon: Icons.translate, location: 'Aula 105', description: 'Reading comprehension y vocabulario técnico.'),
    CalEvent(title: 'Revisión BD360', subtitle: 'Micro', time: '17:00 – 18:00', startHour: 17, durationH: 1, color: Colors.purple, icon: Icons.cloud, location: 'Online'),
  ],
  2: [
    CalEvent(title: 'Temas de Investigación', subtitle: 'Seminario', time: '09:00 – 10:00', startHour: 9, durationH: 1, color: Colors.indigo, icon: Icons.science, location: 'Sala B', description: 'Metodología de investigación aplicada a TI.'),
    CalEvent(title: 'Ciberseguridad', subtitle: 'Curso – Prof. Torres', time: '10:30 – 12:30', startHour: 10.5, durationH: 2, color: Colors.blueGrey, icon: Icons.security, location: 'Lab 101', description: 'Ethical hacking y análisis de vulnerabilidades.'),
    CalEvent(title: 'WIC Daily WIC050', subtitle: 'Revisión', time: '15:00 – 16:00', startHour: 15, durationH: 1, color: Colors.deepOrange, icon: Icons.work_outline, location: 'Online'),
    CalEvent(title: 'Revisión Arquitectura ERP', subtitle: 'Microsoft Teams', time: '17:00 – 18:00', startHour: 17, durationH: 1, color: Colors.cyan, icon: Icons.account_tree, location: 'Virtual', description: 'Revisión de arquitectura de unión Sistemas ERP.'),
  ],
  3: [
    CalEvent(title: 'Daily Proyecto Smart', subtitle: 'Stand-up', time: '09:00 – 09:30', startHour: 9, durationH: 0.5, color: Colors.blue, icon: Icons.bolt, location: 'Virtual'),
    CalEvent(title: 'Ética Profesional', subtitle: 'Curso – Prof. Vargas', time: '11:00 – 12:30', startHour: 11, durationH: 1.5, color: Colors.amber, icon: Icons.balance, location: 'Aula 201', description: 'Casos prácticos de dilemas éticos en TI.'),
    CalEvent(title: 'WIC Daily WIC050', subtitle: 'Revisión', time: '15:00 – 16:00', startHour: 15, durationH: 1, color: Colors.deepOrange, icon: Icons.work_outline, location: 'Online'),
    CalEvent(title: 'Estructuras de Datos', subtitle: 'Curso – Prof. Lima', time: '16:00 – 18:00', startHour: 16, durationH: 2, color: Colors.red, icon: Icons.account_tree, location: 'Lab 203', description: 'Árboles, grafos y algoritmos de búsqueda.'),
  ],
  4: [
    CalEvent(title: 'Daily Proyecto Smart', subtitle: 'Stand-up', time: '09:00 – 09:30', startHour: 9, durationH: 0.5, color: Colors.blue, icon: Icons.bolt, location: 'Virtual'),
    CalEvent(title: 'Lab. Aplicaciones Móviles', subtitle: 'Curso – Flutter', time: '10:00 – 12:30', startHour: 10, durationH: 2.5, color: Colors.deepPurple, icon: Icons.phone_android, location: 'Lab 105', description: 'Desarrollo de apps con Flutter y Dart. Proyecto final de semestre.'),
    CalEvent(title: 'Reunión Interna Gerencia', subtitle: 'lun.torrijon@gmail.com', time: '12:00 – 13:00', startHour: 12, durationH: 1, color: Colors.green, icon: Icons.meeting_room, location: 'Sala de Gerencia'),
    CalEvent(title: 'Proyecto Final – Entrega', subtitle: 'Multiplatforma', time: '16:00 – 18:00', startHour: 16, durationH: 2, color: Colors.pink, icon: Icons.assignment_turned_in, location: 'Lab 105', description: 'Entrega final del proyecto de Aplicaciones Móviles.'),
  ],
  5: [
    CalEvent(title: 'TEO. [410] Lab Sabado', subtitle: 'H. TORRICO', time: '08:00 – 10:00', startHour: 8, durationH: 2, color: Colors.indigo, icon: Icons.school, location: 'Aula 410', description: 'Sesión teórica presencial de recuperación.'),
    CalEvent(title: 'Daily Proyecto Smart', subtitle: 'Stand-up', time: '09:00 – 09:30', startHour: 9, durationH: 0.5, color: Colors.blue, icon: Icons.bolt),
    CalEvent(title: 'Desarrollo App – Avanzado', subtitle: 'Cisco Webex', time: '11:00 – 13:00', startHour: 11, durationH: 2, color: Colors.deepPurple, icon: Icons.phone_android, location: 'Online', description: 'Sesión avanzada de desarrollo de aplicaciones multiplataforma.'),
  ],
  6: [
    CalEvent(title: 'Daily Proyecto Smart', subtitle: 'Stand-up', time: '09:00 – 09:30', startHour: 9, durationH: 0.5, color: Colors.blue, icon: Icons.bolt),
    CalEvent(title: 'Revisión BD360 Microsoft', subtitle: 'Semana cierre', time: '10:00 – 11:30', startHour: 10, durationH: 1.5, color: Colors.purple, icon: Icons.cloud, location: 'Online', description: 'Cierre semanal de revisión BD360.'),
  ],
};

final List<DateTime> weekStarts = [
  DateTime(2025, 9, 22),
  DateTime(2025, 9, 29),
  DateTime(2025, 10, 6),
  DateTime(2025, 10, 13),
];

class CalendarioCursos extends StatefulWidget {
  const CalendarioCursos({super.key});
  @override
  State<CalendarioCursos> createState() => _CalendarioCursosState();
}

class _CalendarioCursosState extends State<CalendarioCursos> {
  int _weekIndex = 0;
  String _view = 'Semana';
  final double _hourH = 64.0; // px por hora
  final double _startHour = 7.0;
  final ScrollController _scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scroll.jumpTo((_startHour - 6) * _hourH);
    });
  }

  DateTime get _weekStart => weekStarts[_weekIndex];

  String get _rangeLabel {
    final end = _weekStart.add(const Duration(days: 6));
    const months = ['', 'Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'];
    if (_weekStart.month == end.month) {
      return '${_weekStart.day} – ${end.day} de ${months[_weekStart.month]} de ${_weekStart.year}';
    }
    return '${_weekStart.day} ${months[_weekStart.month]} – ${end.day} ${months[end.month]} ${end.year}';
  }

  void _prev() => setState(() => _weekIndex = (_weekIndex - 1).clamp(0, weekStarts.length - 1));
  void _next() => setState(() => _weekIndex = (_weekIndex + 1).clamp(0, weekStarts.length - 1));
  void _today() => setState(() => _weekIndex = 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F2F1),
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildToolbar(),
          _buildDaysHeader(),
          const Divider(height: 1, thickness: 0.5, color: Color(0xFFDDDDDD)),
          Expanded(child: _buildScrollableGrid()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () => _showAddEventDialog(),
        child: const Icon(Icons.add, color: Colors.white),
        tooltip: 'Nuevo evento',
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(48),
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Padding(
          padding: const EdgeInsets.all(12),
          child: Icon(Icons.calendar_month, color: Colors.indigo.shade700, size: 22),
        ),
        title: const Text(
          'Calendario de Cursos',
          style: TextStyle(color: Color(0xFF202020), fontSize: 15, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search, color: Color(0xFF666666), size: 20), onPressed: () {}),
          IconButton(icon: const Icon(Icons.tune, color: Color(0xFF666666), size: 20), onPressed: () {}),
          IconButton(icon: const Icon(Icons.settings_outlined, color: Color(0xFF666666), size: 20), onPressed: () {}),
          const SizedBox(width: 4),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.indigo.shade100,
              child: Text('HT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.indigo.shade800)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToolbar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        children: [
          _toolBtn('Hoy', onTap: _today, filled: true),
          const SizedBox(width: 4),
          InkWell(onTap: _prev, child: const Icon(Icons.chevron_left, color: Color(0xFF555555), size: 22)),
          InkWell(onTap: _next, child: const Icon(Icons.chevron_right, color: Color(0xFF555555), size: 22)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(_rangeLabel,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF1a1a1a))),
          ),
          for (final v in ['Día', 'Semana', 'Mes'])
            _viewTab(v),
          const SizedBox(width: 8),
          const Icon(Icons.print_outlined, color: Color(0xFF888888), size: 18),
          const SizedBox(width: 4),
          const Icon(Icons.share_outlined, color: Color(0xFF888888), size: 18),
        ],
      ),
    );
  }

  Widget _toolBtn(String label, {VoidCallback? onTap, bool filled = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
          color: filled ? Colors.indigo.shade50 : Colors.transparent,
          border: Border.all(color: filled ? Colors.indigo.shade300 : Colors.transparent, width: 0.8),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(label, style: TextStyle(fontSize: 12, color: Colors.indigo.shade700, fontWeight: FontWeight.w600)),
      ),
    );
  }

  Widget _viewTab(String label) {
    final active = _view == label;
    return GestureDetector(
      onTap: () => setState(() => _view = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(
            color: active ? Colors.indigo : Colors.transparent,
            width: 2,
          )),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: active ? FontWeight.w700 : FontWeight.w400,
            color: active ? Colors.indigo : const Color(0xFF555555),
          ),
        ),
      ),
    );
  }

  Widget _buildDaysHeader() {
    const days = ['Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb', 'Dom'];
    final today = DateTime.now();

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          const SizedBox(width: 50),
          ...List.generate(7, (i) {
            final date = _weekStart.add(Duration(days: i));
            final isToday = date.year == today.year && date.month == today.month && date.day == today.day;
            final hasEvents = (weekEvents[i] ?? []).isNotEmpty;
            return Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 4),
                  isToday
                      ? Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(color: Colors.indigo, borderRadius: BorderRadius.circular(17)),
                          alignment: Alignment.center,
                          child: Text('${date.day}',
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                        )
                      : Text('${date.day}',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: i >= 5 ? Colors.red.shade300 : const Color(0xFF1a1a1a))),
                  Text(days[i],
                      style: TextStyle(
                          fontSize: 11,
                          color: isToday ? Colors.indigo : i >= 5 ? Colors.red.shade300 : Colors.grey)),
                  const SizedBox(height: 2),
                  if (hasEvents)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 5, height: 5,
                          decoration: BoxDecoration(color: Colors.indigo.shade300, borderRadius: BorderRadius.circular(3)),
                        ),
                      ],
                    ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildScrollableGrid() {
    const totalHours = 16; // 6:00 – 22:00
    const startH = 6;

    return SingleChildScrollView(
      controller: _scroll,
      child: SizedBox(
        height: totalHours * _hourH,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 50,
              child: Column(
                children: List.generate(totalHours, (i) {
                  final h = startH + i;
                  return Container(
                    height: _hourH,
                    alignment: Alignment.topRight,
                    padding: const EdgeInsets.only(right: 8, top: 4),
                    child: Text(
                      h == 0 ? '' : '${h.toString().padLeft(2, '0')}:00',
                      style: const TextStyle(fontSize: 10, color: Color(0xFF999999)),
                    ),
                  );
                }),
              ),
            ),
            ...List.generate(7, (dia) => Expanded(
              child: Stack(
                children: [
                  Column(
                    children: List.generate(totalHours, (i) => Container(
                      height: _hourH,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey.shade200, width: 0.7),
                          left: BorderSide(color: Colors.grey.shade200, width: 0.7),
                        ),
                        color: dia >= 5 ? const Color(0xFFFAFAFA) : Colors.white,
                      ),
                    )),
                  ),
                  // Eventos
                  ...(weekEvents[dia] ?? []).map((ev) => _buildEvent(ev, startH)),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildEvent(CalEvent ev, int startH) {
    final top = (ev.startHour - startH) * _hourH;
    final height = (ev.durationH * _hourH) - 3;

    return Positioned(
      top: top,
      left: 2,
      right: 2,
      height: height.clamp(22.0, double.infinity),
      child: GestureDetector(
        onTap: () => _showEventDetail(ev),
        child: Container(
          padding: const EdgeInsets.only(left: 6, top: 3, right: 4, bottom: 2),
          decoration: BoxDecoration(
            color: ev.color.withOpacity(0.10),
            borderRadius: BorderRadius.circular(4),
            border: Border(left: BorderSide(color: ev.color, width: 3.5)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(ev.icon, size: 9, color: ev.color.withOpacity(0.85)),
                  const SizedBox(width: 3),
                  Expanded(
                    child: Text(
                      ev.title,
                      style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: ev.color.withAlpha(220)),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              if (height > 28 && ev.subtitle.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Text(
                    ev.subtitle,
                    style: TextStyle(fontSize: 8, color: ev.color.withOpacity(0.7)),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              if (height > 42)
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Text(
                    ev.time,
                    style: TextStyle(fontSize: 8, color: ev.color.withOpacity(0.6)),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showEventDetail(CalEvent ev) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (_) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: ev.color.withOpacity(0.12), borderRadius: BorderRadius.circular(10)),
                  child: Icon(ev.icon, color: ev.color, size: 24),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(ev.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      if (ev.subtitle.isNotEmpty)
                        Text(ev.subtitle, style: const TextStyle(fontSize: 13, color: Color(0xFF666666))),
                    ],
                  ),
                ),
                IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context)),
              ],
            ),
            const Divider(height: 24),
            _detailRow(Icons.access_time, ev.time),
            if (ev.location != null) _detailRow(Icons.location_on_outlined, ev.location!),
            if (ev.description != null) _detailRow(Icons.notes, ev.description!),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.edit_outlined, size: 16),
                    label: const Text('Editar'),
                    style: OutlinedButton.styleFrom(foregroundColor: Colors.indigo),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.check, size: 16),
                    label: const Text('Confirmar'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo, foregroundColor: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: Colors.grey),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 13, color: Color(0xFF333333)))),
        ],
      ),
    );
  }

  void _showAddEventDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text('Nuevo Evento', style: TextStyle(fontSize: 16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(decoration: const InputDecoration(labelText: 'Título', prefixIcon: Icon(Icons.title))),
            const SizedBox(height: 8),
            TextField(decoration: const InputDecoration(labelText: 'Descripción', prefixIcon: Icon(Icons.notes))),
            const SizedBox(height: 8),
            TextField(decoration: const InputDecoration(labelText: 'Ubicación', prefixIcon: Icon(Icons.location_on))),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo, foregroundColor: Colors.white),
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }
}