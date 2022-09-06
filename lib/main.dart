import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro_mina_task/view/styles/theme.dart';
import 'package:pro_mina_task/view_model/home/home_cubit.dart';
import 'package:pro_mina_task/view_model/task/task_cubit.dart';
import 'view/screens/create_task/create_new_task_screen.dart';
import 'view/screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()..getWeekDays()),
        BlocProvider(create: (context) => TaskCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 760),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, widgets) => MaterialApp(
          title: 'ProMINA',
          routes: {
            '/': (BuildContext context) => const HomeScreen(),
            'createNewTask': (BuildContext context) =>  const CreateNewTaskScreen(),
          },
          builder: (context, widget) {
            return MediaQuery(
              //Setting font does not change with system font size
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: widget!,
              ),
            );
          },
          //This to Hide Debugger Banner in UI.
          debugShowCheckedModeBanner: false,
          //Here The Theme.
          theme: getApplicationTheme(),
          initialRoute: '/',
        ),
      ),
    );
  }
}
