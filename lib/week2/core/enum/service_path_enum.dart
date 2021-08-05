enum ServicePathEnum { BASE_URL, POST ,GET, PUT , DELETE}

extension ServicePathEnumExtension on ServicePathEnum {
  String get rawValue {
    switch (this) {
      case ServicePathEnum.BASE_URL:
        return 'https://crudcrud.com/api/dd88e200c2f64b0fb6dae7d9253c88bd';

      case ServicePathEnum.POST:
        return '/temp';

      case ServicePathEnum.GET:
        return '/temp';

      case ServicePathEnum.DELETE:
        return '/temp';

      case ServicePathEnum.PUT:
        return '/temp';

      default:
        throw Exception('Not found path');
    }
  }
}
