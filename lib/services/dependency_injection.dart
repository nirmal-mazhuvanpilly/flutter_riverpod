import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/services/api_services.dart';

final baseServicesProvider = Provider<BaseServices>((ref) => ApiServices());
