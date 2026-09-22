/// Model untuk menyimpan data pengguna.
class UserModel {
  final int? id;
  final String email;
  final String nama;
  final String hobi;
  final String password;

  /// Membuat objek UserModel.
  UserModel({
    this.id,
    required this.email,
    required this.nama,
    required this.hobi,
    required this.password,
  });

  /// Mengubah data UserModel menjadi Map untuk SQLite.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'nama': nama,
      'hobi': hobi,
      'password': password,
    };
  }

  /// Membuat UserModel dari data Map SQLite.
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      nama: map['nama'],
      hobi: map['hobi'],
      password: map['password'],
    );
  }
}