import 'package:exportamais/app/modules/home/home_bloc.dart';
import 'package:exportamais/app/modules/home/screens/course_description/course_description_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:exportamais/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeBloc()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        Router('/course', child: (_, args) => CourseDescriptionScreen(lesson: args.data,))
      ];

  static Inject get to => Inject<HomeModule>.of();
}
