import 'package:ari_pad/services/api_helper/api_config.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ApiConfig useApiConfig() {
  return useMemoized(() => new ApiConfig(), []);
}
