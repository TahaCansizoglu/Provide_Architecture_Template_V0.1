import 'init/graphql/graphql_client.dart';
import 'init/provider/provider_manager.dart';
import 'ui/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

import 'init/localdatabase/local_database_service.dart';
import 'init/navigation/navigation_route.dart';
import 'init/navigation/navigation_service.dart';

Future<void> main() async {
  Provider.debugCheckInvalidValueType = null;
  await GraphQLService.instance.connectGraphql();
  await LocalDatabaseService.instance.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...ProviderManager.instance.singleProvider],
      child: GraphQLProvider(
        client: GraphQLService.instance.client,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: NavigationRoute.instance.generateRoute,
          navigatorKey: NavigationService.instance.navigatorKey,
        ),
      ),
    );
  }
}
