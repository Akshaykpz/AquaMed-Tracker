import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ihydrate_application/models/category/data_base.dart';
import 'package:ihydrate_application/provider/medicine.dart';
import 'package:ihydrate_application/provider/water.dart';
import 'package:ihydrate_application/views/pages/onbord_screen.dart';
import 'package:ihydrate_application/views/pages/splash_screen.dart';
import 'package:ihydrate_application/views/widgets/notification.dart';

import 'package:path_provider/path_provider.dart';

import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isviewed;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();

  var directory = await getApplicationDocumentsDirectory();

  Hive.init(directory.path);

  Hive.registerAdapter(WaterModelAdapter());
  await Hive.openBox<WaterModel>('category');

  Hive.registerAdapter(MedicineModelAdapter());
  await Hive.openBox<MedicineModel>('medines');

  Hive.registerAdapter(MedicineCopyModelAdapter());
  await Hive.openBox<MedicineCopyModel>('medinescopy');

  Hive.registerAdapter(WaterGoalAdapter());
  await Hive.openBox<WaterGoal>('goalbox');

  Hive.registerAdapter(ProgressValueAdapter());
  await Hive.openBox<ProgressValue>('progressvalue');

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WaterProivder(),
        ),
        ChangeNotifierProvider(
          create: (context) => MedcineProivder(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            // primarySwatch: Colors.blue,
            ),
        home: isviewed != 0 ? const OnBoard() : const SplashScreen(),
      ),
    );
  }
}
