import 'package:exportamais/app/app_bloc.dart';
import 'package:exportamais/app/modules/home/screens/lesson/lesson_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:exportamais/app/app_widget.dart';
import 'package:exportamais/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppBloc()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: HomeModule()),
        Router('/lesson', child: (_, args) => LessonScreen()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
