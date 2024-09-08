import 'package:drop_down_menu/view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ViewModelCubit viewModelCubit = ViewModelCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ViewModelCubit, ViewModelState>(
              bloc: viewModelCubit..initValue(),
              builder: (context, state) {
                return DropdownButtonFormField(
                  items: viewModelCubit.list.map(
                    (e) {
                      return DropdownMenuItem<ModelDrop>(
                          value: e,

                          /// todo: this value use this in onChange this object
                          child: Text(e.text));
                    },
                  ).toList(),
                  onChanged: (ModelDrop? value) {
                    viewModelCubit.changeData(value);
                  },

                  /// todo:this take value update selectedValue to show him
                  value: viewModelCubit.selectedValue,

                  /// todo:this take value from DropdownMenuItem value
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class ModelDrop {
  String id;
  String text;

  ModelDrop({required this.id, required this.text});

  static List<ModelDrop> getList() {
    return [
      ModelDrop(id: "1", text: "mohamed"),
      ModelDrop(id: "2", text: "ahmed"),
      ModelDrop(id: "3", text: "zaid"),
      ModelDrop(id: "4", text: "abdo"),
      ModelDrop(id: "5", text: "salma"),
      ModelDrop(id: "6", text: "amira"),
    ];
  }
}
