import 'package:fake_store_app/models/index.dart';

final mockUser = User(
  id: 1,
  email: 'john@gmail.com',
  username: 'johnd',
  password: 'm38rmF\$',
  phone: '1-570-236-7033',
  name: NameModel(
    firstname: 'john',
    lastname: 'doe',
  ),
  address: AddressModel(
    geolocation: GeoLocationModel(
      lat: '-37.3159',
      long: '81.1496',
    ),
    city: 'kilcoole',
    street: 'new road',
    number: 7682,
    zipcode: '12926-3874',
  ),
  v: 0,
);
