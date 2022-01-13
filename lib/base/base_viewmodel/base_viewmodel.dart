import 'dart:async';

import '../../init/graphql/graphql_client.dart';
import '../../init/localdatabase/local_database_service.dart';
import '../../init/navigation/navigation_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract class BaseViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool _isDisposed = false;
  bool _isInitializeDone = false;
  BuildContext? context;
  NavigationService navigation = NavigationService.instance;
  GraphQLClient? service = GraphQLService.instance.service;
  LocalDatabaseService localDatabase = LocalDatabaseService.instance;
  FutureOr<void> _initState;

  BaseViewModel() {
    _init();
  }

  FutureOr<void> init();

  void _init() async {
    print(context);
    isLoading = true;
    _initState = init();
    await _initState;
    _isInitializeDone = true;
    isLoading = false;
  }

  void setContext(BuildContext context);

  void changeStatus() => isLoading = !isLoading;

  void reloadState() {
    if (!isLoading) notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  //Getters
  FutureOr<void> get initState => _initState;

  bool get isLoading => _isLoading;
  bool get isDisposed => _isDisposed;
  bool get isInitialized => _isInitializeDone;

  //Setters
  set isLoading(bool value) {
    _isLoading = value;
    scheduleMicrotask(() {
      if (!_isDisposed) notifyListeners();
    });
  }
}
