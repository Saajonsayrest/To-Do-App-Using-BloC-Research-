import 'dart:ui';

import 'package:meta/meta.dart';

import 'bloc_imports.dart';

part 'brightness_state.dart';

class BrightnessCubit extends HydratedCubit<Brightness> {
  BrightnessCubit() : super(Brightness.light);

  void toggleBrightness() {
    emit(state == Brightness.light ? Brightness.dark : Brightness.light);
  }

  @override
  Brightness? fromJson(Map<String, dynamic> json) {
    return Brightness.values[json['brightness'] as int];
  }

  @override
  Map<String, dynamic>? toJson(Brightness state) {
   return <String, dynamic>{'brightness': state.index};
  }


}
