import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Где-то здесь нужны провайдеры
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  @override
  void initState() {
    // Тут важно помнить, что сначала отключение от прослушивания
    // После этого идёт инициализация количества банкнот
    // Решил, что количество банкнот будет в сущности Limits и
    // Просчитываться из Map
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(); // Тут будет сама страница
  }
}
