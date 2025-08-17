import 'package:cubitbloc/ui/page/page_not_found.dart';
import 'package:cubitbloc/ui/page/page_todo_list.dart';
import 'package:go_router/go_router.dart';

import '../ui/page/page_add_todo.dart';
import 'app_router_constant.dart';

class MyAppRouter {

  GoRouter router = GoRouter(
      routes: [
        GoRoute(
            name: RouterConst.landingPage,
            path: RouterConst.landingPagePath,
            builder: (context, state) => const TodoListScreen()
        ),

        GoRoute(
            name: RouterConst.addTodo,
            path: RouterConst.addTodoPath,
            builder: (context, state) => const AddTodoScreen()
        ),
      ],
    errorBuilder: (context, routerState) => const PageNotFound()
  );

}