import 'package:flutter/foundation.dart';

printError(msg) {
  debugPrint('\x1B[95mError:$msg\x1B[0m');
}

printInfo(msg) {
  debugPrint('\x1B[92mInfo$msg\x1B[0m');
}

printSuccess(String msg) {
  debugPrint('\x1B[92m $msg \x1B[0m');
}

printWarning(String msg) {
  debugPrint('\x1B[92m $msg \x1B[0m');
}
