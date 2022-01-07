import 'package:atoday/app.dart';
import 'package:atoday/service_locator.dart';
import 'package:flutter/material.dart';

// void main() => runZonedGuarded(
//       () {
//         registerServices();
//         runApp(const App());
//       },
//       l.e,
//     );

void main() {
  registerServices();
  runApp(const App());
}
