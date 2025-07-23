import 'package:flutter/material.dart';
import 'package:neura_ai_2/providers/chat_provider.dart';
import 'package:neura_ai_2/providers/settings_provider.dart';
import 'package:neura_ai_2/screens/home_screen.dart';
import 'package:neura_ai_2/themes/my_theme.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ChatProvider.initHive();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ChatProvider()),
      ChangeNotifierProvider(create: (context) => SettingsProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    setTheme();
    super.initState();
  }

  void setTheme() {
    final settingsProvider = context.read<SettingsProvider>();
    settingsProvider.getSavedSettings();
  }

  @override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Neura AI',
    theme: context.watch<SettingsProvider>().isDarkMode ? darkTheme : lightTheme,
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 450), // Mobile width
          child: const HomeScreen(),
        ),
      ),
    ),
  );
}


}
