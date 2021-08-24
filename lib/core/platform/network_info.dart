
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl extends NetworkInfo {
  @override
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImpl ({this.connectionChecker});

  Future<bool> get isConnected => connectionChecker.hasConnection;

}