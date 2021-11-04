import 'package:ecommerce_app/res/string_constants.dart';
import 'package:ecommerce_app/ui/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'app_injector.dart';
import 'bloc/all_products/all_products_bloc.dart';
import 'repository/product_repository.dart';
import 'res/app_theme.dart';

void main() {
  Bloc.observer = AllProductsBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  runApp(EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringsConstants.title,
      theme: AppTheme.appTheme(),
      debugShowCheckedModeBanner: false,
      // home: ProductScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => ProductScreen(),
      },
    );
  }
}

class AllProductsBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    print(change);
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
