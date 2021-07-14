enum ServicePathEnum { BASE_URL, POST ,GET, PUT , DELETE}

extension ServicePathEnumExtension on ServicePathEnum {
  String get rawValue {
    switch (this) {
      case ServicePathEnum.BASE_URL:
        return 'https://crudcrud.com/api/5381f39ad7f540fbb607c5911741a6d6';

      case ServicePathEnum.POST:
        return '/unicorns';

      case ServicePathEnum.GET:
        return '/unicorns';

      case ServicePathEnum.DELETE:
        return '/unicorns';

      case ServicePathEnum.PUT:
        return '/unicorns/';

      default:
        throw Exception('Not found path');
    }
  }
}
