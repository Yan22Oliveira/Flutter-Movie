class HomeException implements Exception {}

class ServeErroException extends HomeException {
  final String erro;
  ServeErroException({required this.erro});
}

class NotFoundException extends HomeException {}