import 'package:ctoslauncher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FechaYHora extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
      stream:
          Stream.periodic(const Duration(seconds: 1), (i) => DateTime.now()),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const TextoBorde(label: "Cargando...");
        }
        final dateTime = snapshot.data!;
        final formattedDate =
            DateFormat("d 'de' MMMM 'del' y,    HH:mm:ss").format(dateTime);

        return TextoBorde(label: "${formattedDate}");
      },
    );
  }
}
