part of 'index.dart';

class User {
  final int id;
  final String email;
  final String username;
  final String password;
  final String phone;
  final NameModel name;
  final AddressModel address;
  final int v;

  User({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.phone,
    required this.name,
    required this.address,
    required this.v,
  });

  User copyWith({
    int? id,
    String? email,
    String? username,
    String? password,
    String? phone,
    NameModel? name,
    AddressModel? address,
    int? v,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      address: address ?? this.address,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'username': username,
      'password': password,
      'phone': phone,
      'name': name.toMap(),
      'address': address.toMap(),
      '__v': v,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      email: map['email'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
      phone: map['phone'] as String,
      name: NameModel.fromMap(map['name'] as Map<String, dynamic>),
      address: AddressModel.fromMap(map['address'] as Map<String, dynamic>),
      v: map['__v'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, name: $name, phone: $phone, address: $address)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.username == username &&
        other.password == password &&
        other.phone == phone &&
        other.name == name &&
        other.address == address &&
        other.v == v;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        username.hashCode ^
        password.hashCode ^
        phone.hashCode ^
        name.hashCode ^
        address.hashCode ^
        v.hashCode;
  }
}

class NameModel {
  final String firstname;
  final String lastname;

  NameModel({required this.firstname, required this.lastname});

  Map<String, dynamic> toMap() => {
    'firstname': firstname,
    'lastname': lastname,
  };

  factory NameModel.fromMap(Map<String, dynamic> map) {
    return NameModel(
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
    );
  }
}

class AddressModel {
  final GeoLocationModel geolocation;
  final String city;
  final String street;
  final int number;
  final String zipcode;

  AddressModel({
    required this.geolocation,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });

  Map<String, dynamic> toMap() => {
    'geolocation': geolocation.toMap(),
    'city': city,
    'street': street,
    'number': number,
    'zipcode': zipcode,
  };

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      geolocation: GeoLocationModel.fromMap(
        map['geolocation'] as Map<String, dynamic>,
      ),
      city: map['city'] as String,
      street: map['street'] as String,
      number: map['number'] as int,
      zipcode: map['zipcode'] as String,
    );
  }
}

class GeoLocationModel {
  final String lat;
  final String long;

  GeoLocationModel({required this.lat, required this.long});

  Map<String, dynamic> toMap() => {'lat': lat, 'long': long};

  factory GeoLocationModel.fromMap(Map<String, dynamic> map) {
    return GeoLocationModel(
      lat: map['lat'] as String,
      long: map['long'] as String,
    );
  }
}
