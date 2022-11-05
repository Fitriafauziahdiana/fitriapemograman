class basic_skin {
  int? id;
  String? name;
  String? text;
  String? penjelasan;
  String? lanjutan;

  basic_skin(this.id, this.name, this.text, this.penjelasan, this.lanjutan);

  basic_skin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    text = json['text'];
    penjelasan = json['penjelasan'];
    lanjutan = json['lanjutan'];
  }
}
