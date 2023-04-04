import 'package:flutter_modular/flutter_modular.dart';

import './home.dart';

class HomeModule extends Module {

  @override
  List<Bind> binds = [
    Bind.singleton<IHomeRepository>((i) => HomeRepository(i(),)),
    Bind.singleton<HomeCubit>((i) => HomeCubit(i(),)),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => HomeView(),
    ),
  ];

}