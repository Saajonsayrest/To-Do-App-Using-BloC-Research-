import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app_bloc/counter/bloc/brightness_cubit.dart';

import 'counter/bloc/bloc_imports.dart';
import 'counter/counter_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => BrightnessCubit(),
        ),
      ],
      child: BlocBuilder<BrightnessCubit, Brightness>(
        builder: (context, brightness) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(brightness: brightness),
            home: CounterScreen(),
          );
        },
      ),
    );
  }
}
