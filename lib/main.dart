import 'package:desktop_window/desktop_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:random_team_assembler_flutter/widgets/assemble.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DesktopWindow.setMinWindowSize(const Size(1280, 720));
  await DesktopWindow.setMaxWindowSize(const Size(1280, 720));
  runApp(const WinApp());
}

class WinApp extends StatelessWidget {
  const WinApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FluentApp(
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      title: 'Random Team Assembler by violetow9',
      home: AssemblePage(),
    );
  }
}