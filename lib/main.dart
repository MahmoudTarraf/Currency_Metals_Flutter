import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/data/cubit/currency_cubit.dart';
import 'package:homework/data/cubit/metals_cubit.dart';
import 'package:homework/data/cubit/state_change_cubit.dart';
import 'package:homework/view/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

/*
  محمود مازن طراف
*/
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MetalsCubit()..fetchMetalPrices(),
        ),
        BlocProvider(
          create: (context) => StateChangeCubit(),
        ),
        BlocProvider(
          create: (context) => CurrencyCubit()..fetchData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Currency Convertor',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple, brightness: Brightness.dark),
            useMaterial3: true,
            fontFamily: 'Lato'),
        home: const HomePage(),
      ),
    );
  }
}
