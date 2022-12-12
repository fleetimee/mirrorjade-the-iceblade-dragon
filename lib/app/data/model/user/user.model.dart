// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

List<Users> usersFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  Users({
    this.id,
    this.email,
    this.phoneNumber,
    this.displayName,
    this.photoUrl,
    this.createdAt,
    this.roles,
    this.debiturs,
    this.createdBy,
    this.updatedBy,
  });

  String? id;
  String? email;
  String? phoneNumber;
  String? displayName;
  String? photoUrl;
  DateTime? createdAt;
  List<dynamic>? roles;
  List<Debitur>? debiturs;
  dynamic createdBy;
  dynamic updatedBy;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        displayName: json["displayName"],
        photoUrl: json["photoURL"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        roles: json["roles"] == null
            ? null
            : List<dynamic>.from(json["roles"].map((x) => x)),
        debiturs: json["debiturs"] == null
            ? null
            : List<Debitur>.from(
                json["debiturs"].map((x) => Debitur.fromJson(x))),
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "phoneNumber": phoneNumber,
        "displayName": displayName,
        "photoURL": photoUrl,
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
        "roles":
            roles == null ? null : List<dynamic>.from(roles!.map((x) => x)),
        "debiturs": debiturs == null
            ? null
            : List<dynamic>.from(debiturs!.map((x) => x.toJson())),
        "createdBy": createdBy,
        "updatedBy": updatedBy,
      };
}

class Debitur {
  Debitur({
    this.id,
    this.noDebitur,
    this.peminjam1,
    this.ktp1,
    this.peminjam2,
    this.ktp2,
    this.peminjam3,
    this.peminjam4,
    this.pemilikAgunan1,
    this.noKtp1,
    this.pemilikAgunan2,
    this.noKtp2,
    this.alamat1,
    this.alamat2,
    this.alamat3,
    this.alamat4,
    this.tempatLahir,
    this.tanggalLahir,
    this.noHp,
    this.umur,
    this.npwp,
    this.statusKeluarga,
    this.jumlahTanggungan,
    this.lamanyaBerusaha,
    this.lokasiUsaha,
    this.jumlahKaryawan,
    this.jenisUsaha,
    this.bidangUsaha,
    this.pendidikan,
    this.pekerjaan1,
    this.pekerjaan2,
    this.noSkpk,
    this.tglSekarang,
    this.deskripsiDebitur,
    this.progress,
    this.userId,
  });

  int? id;
  String? noDebitur;
  String? peminjam1;
  String? ktp1;
  String? peminjam2;
  String? ktp2;
  String? peminjam3;
  String? peminjam4;
  String? pemilikAgunan1;
  String? noKtp1;
  String? pemilikAgunan2;
  String? noKtp2;
  String? alamat1;
  String? alamat2;
  String? alamat3;
  String? alamat4;
  String? tempatLahir;
  DateTime? tanggalLahir;
  String? noHp;
  int? umur;
  String? npwp;
  String? statusKeluarga;
  int? jumlahTanggungan;
  int? lamanyaBerusaha;
  String? lokasiUsaha;
  int? jumlahKaryawan;
  String? jenisUsaha;
  String? bidangUsaha;
  String? pendidikan;
  String? pekerjaan1;
  String? pekerjaan2;
  String? noSkpk;
  DateTime? tglSekarang;
  String? deskripsiDebitur;
  String? progress;
  String? userId;

  factory Debitur.fromJson(Map<String, dynamic> json) => Debitur(
        id: json["id"],
        noDebitur: json["no_debitur"],
        peminjam1: json["peminjam1"],
        ktp1: json["ktp1"],
        peminjam2: json["peminjam2"],
        ktp2: json["ktp2"],
        peminjam3: json["peminjam3"],
        peminjam4: json["peminjam4"],
        pemilikAgunan1: json["pemilik_agunan_1"],
        noKtp1: json["no_ktp1"],
        pemilikAgunan2: json["pemilik_agunan_2"],
        noKtp2: json["no_ktp2"],
        alamat1: json["alamat_1"],
        alamat2: json["alamat_2"],
        alamat3: json["alamat_3"],
        alamat4: json["alamat_4"],
        tempatLahir: json["tempat_lahir"],
        tanggalLahir: json["tanggal_lahir"] == null
            ? null
            : DateTime.parse(json["tanggal_lahir"]),
        noHp: json["no_hp"],
        umur: json["umur"],
        npwp: json["npwp"],
        statusKeluarga: json["status_keluarga"],
        jumlahTanggungan: json["jumlah_tanggungan"],
        lamanyaBerusaha: json["lamanya_berusaha"],
        lokasiUsaha: json["lokasi_usaha"],
        jumlahKaryawan: json["jumlah_karyawan"],
        jenisUsaha: json["jenis_usaha"],
        bidangUsaha: json["bidang_usaha"],
        pendidikan: json["pendidikan"],
        pekerjaan1: json["pekerjaan1"],
        pekerjaan2: json["pekerjaan2"],
        noSkpk: json["no_skpk"],
        tglSekarang: json["tgl_sekarang"] == null
            ? null
            : DateTime.parse(json["tgl_sekarang"]),
        deskripsiDebitur: json["deskripsi_debitur"],
        progress: json["progress"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "no_debitur": noDebitur,
        "peminjam1": peminjam1,
        "ktp1": ktp1,
        "peminjam2": peminjam2,
        "ktp2": ktp2,
        "peminjam3": peminjam3,
        "peminjam4": peminjam4,
        "pemilik_agunan_1": pemilikAgunan1,
        "no_ktp1": noKtp1,
        "pemilik_agunan_2": pemilikAgunan2,
        "no_ktp2": noKtp2,
        "alamat_1": alamat1,
        "alamat_2": alamat2,
        "alamat_3": alamat3,
        "alamat_4": alamat4,
        "tempat_lahir": tempatLahir,
        "tanggal_lahir": tanggalLahir == null
            ? null
            : "${tanggalLahir?.year.toString().padLeft(4, '0')}-${tanggalLahir?.month.toString().padLeft(2, '0')}-${tanggalLahir?.day.toString().padLeft(2, '0')}",
        "no_hp": noHp,
        "umur": umur,
        "npwp": npwp,
        "status_keluarga": statusKeluarga,
        "jumlah_tanggungan": jumlahTanggungan,
        "lamanya_berusaha": lamanyaBerusaha,
        "lokasi_usaha": lokasiUsaha,
        "jumlah_karyawan": jumlahKaryawan,
        "jenis_usaha": jenisUsaha,
        "bidang_usaha": bidangUsaha,
        "pendidikan": pendidikan,
        "pekerjaan1": pekerjaan1,
        "pekerjaan2": pekerjaan2,
        "no_skpk": noSkpk,
        "tgl_sekarang": tglSekarang == null
            ? null
            : "${tglSekarang?.year.toString().padLeft(4, '0')}-${tglSekarang?.month.toString().padLeft(2, '0')}-${tglSekarang?.day.toString().padLeft(2, '0')}",
        "deskripsi_debitur": deskripsiDebitur,
        "progress": progress,
        "userId": userId,
      };
}
