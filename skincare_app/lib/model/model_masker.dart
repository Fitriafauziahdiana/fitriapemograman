class ModelMasker {
  int? id;
  String? name;
  String? text;
  String? penjelasan;
  String? lanjutan;

  ModelMasker(this.id, this.name, this.text, this.penjelasan, this.lanjutan);

  ModelMasker.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    text = json['text'];
    penjelasan = json['penjelasan'];
    lanjutan = json['lanjutan'];
  }
}
