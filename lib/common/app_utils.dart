import 'package:logger/logger.dart';

Logger getLogger() {
  return Logger(
    printer: PrettyPrinter(
      printEmojis: true,
      lineLength: 90,
      colors: true,
      methodCount: 1,
      errorMethodCount: 5,
    ),
  );
}
