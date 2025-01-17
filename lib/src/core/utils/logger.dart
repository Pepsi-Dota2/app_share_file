import 'package:logger/logger.dart';

class LoggerService {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2, // Number of method calls to include in the log (stack trace)
      errorMethodCount: 8, // Number of method calls for errors
      lineLength: 120, // Width of the output
      colors: true, // Enable or disable colored logs
      printEmojis: true, // Enable or disable emojis
      printTime: true, // Enable or disable time in logs
    ),
  );

  /// Log a message at the "debug" level
  static void debug(String message) => _logger.d(message);

  /// Log a message at the "info" level
  static void info(String message) => _logger.i(message);

  /// Log a message at the "warning" level
  static void warning(String message) => _logger.w(message);

  /// Log a message at the "error" level
  static void error(String message, [dynamic error, StackTrace? stackTrace]) =>
      _logger.e(message, error: error, stackTrace: stackTrace);
}
