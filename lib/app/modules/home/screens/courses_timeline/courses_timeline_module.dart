import 'package:flutter_modular/flutter_modular.dart';

import '../course_description/course_description_screen.dart';
import 'courses_timeline_screen.dart';

class CoursesTimelineModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => CoursesTimelineScreen()),
        Router(
          '/course',
          child: (_, args) => CourseDescriptionScreen(
            lesson: args.data,
          ),
        ),
      ];

  static Inject get to => Inject<CoursesTimelineModule>.of();
}
