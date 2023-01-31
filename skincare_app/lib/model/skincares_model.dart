// To parse this JSON data, do
//
//     final skincaresModel = skincaresModelFromJson(jsonString);

//import 'dart:convert';

//SkincaresModel skincaresModelFromJson(String str) =>
//  SkincaresModel.fromJson(json.decode(str));

//String skincaresModelToJson(SkincaresModel data) => json.encode(data.toJson());

class SkincaresModel {
  SkincaresModel({
    required this.data,
    required this.meta,
  });

  List<Skincares> data;
  Meta meta;

  factory SkincaresModel.fromJson(Map<String, dynamic> json) => SkincaresModel(
        data: List<Skincares>.from(
            json["data"].map((x) => Skincares.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}

class Skincares {
  Skincares({
    required this.id,
    required this.attributes,
  });

  int id;
  Attributes attributes;

  factory Skincares.fromJson(Map<String, dynamic> json) => Skincares(
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class Attributes {
  Attributes({
    required this.name,
    required this.price,
    required this.deskripsi,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
  });

  String name;
  int price;
  String deskripsi;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime publishedAt;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        name: json["name"],
        price: json["price"],
        deskripsi: json["deskripsi"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "deskripsi": deskripsi,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
      };
}

class Meta {
  Meta({
    required this.pagination,
  });

  Pagination pagination;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination.toJson(),
      };
}

class Pagination {
  Pagination({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });

  int page;
  int pageSize;
  int pageCount;
  int total;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
      };
}
