import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  static GraphQLService _instance = GraphQLService._init();
  static GraphQLService get instance => _instance;
  GraphQLService._init();
  ValueNotifier<GraphQLClient>? client;
  GraphQLClient? service;
  final httpLink = HttpLink('http://93.89.73.249:8080/v1/graphql');
  Future<void> connectGraphql() async {
    await initHiveForFlutter();
    client = ValueNotifier(
        GraphQLClient(cache: GraphQLCache(store: HiveStore()), link: httpLink));
    service = client!.value;
  }
}
