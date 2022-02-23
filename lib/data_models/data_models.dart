import 'dart:convert';

List<Indexes> indexesFromJson(String str) => List<Indexes>.from(json.decode(str).map((x) => Indexes.fromJson(x)));

String indexesToJson(List<Indexes> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Indexes {
  Indexes({
    this.id,
    this.name,
    this.tag,
    this.color,
    this.criteria,
  });

  int? id;
  String? name;
  String? tag;
  String? color;
  List<Criterion>? criteria;

  factory Indexes.fromJson(Map<String, dynamic> json) => Indexes(
        id: json["id"],
        name: json["name"],
        tag: json["tag"],
        color: json["color"],
        criteria: List<Criterion>.from(json["criteria"].map((x) => Criterion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tag": tag,
        "color": color,
        "criteria": List<dynamic>.from(criteria!.map((x) => x.toJson())),
      };
}

class Criterion {
  Criterion({
    this.type,
    this.text,
    this.variable,
  });

  String? type;
  String? text;
  Variable? variable;

  factory Criterion.fromJson(Map<String, dynamic> json) => Criterion(
        type: json["type"],
        text: json["text"],
        variable: json["variable"] == null ? null : Variable.fromJson(json["variable"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "text": text,
        "variable": variable == null ? null : variable!.toJson(),
      };
}

class Variable {
  Variable({
    this.the1,
    this.the2,
    this.the3,
    this.the4,
  });

  The1? the1;
  The1? the2;
  The1? the3;
  The1? the4;

  factory Variable.fromJson(Map<String, dynamic> json) => Variable(
        the1: json["\u00241"] == null ? null : The1.fromJson(json["\u00241"]),
        the2: json["\u00242"] == null ? null : The1.fromJson(json["\u00242"]),
        the3: json["\u00243"] == null ? null : The1.fromJson(json["\u00243"]),
        the4: json["\u00244"] == null ? null : The1.fromJson(json["\u00244"]),
      );

  Map<String, dynamic> toJson() => {
        "\u00241": the1 == null ? null : the1!.toJson(),
        "\u00242": the2 == null ? null : the2!.toJson(),
        "\u00243": the3 == null ? null : the3!.toJson(),
        "\u00244": the4 == null ? null : the4!.toJson(),
      };
}

class The1 {
  The1({
    this.type,
    this.values,
    this.studyType,
    this.parameterName,
    this.minValue,
    this.maxValue,
    this.defaultValue,
  });

  String? type;
  List<int>? values;
  String? studyType;
  String? parameterName;
  int? minValue;
  int? maxValue;
  int? defaultValue;

  factory The1.fromJson(Map<String, dynamic> json) => The1(
        type: json["type"],
        values: json["values"] == null ? null : List<int>.from(json["values"].map((x) => x)),
        studyType: json["study_type"],
        parameterName: json["parameter_name"],
        minValue: json["min_value"],
        maxValue: json["max_value"],
        defaultValue: json["default_value"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "values": values == null ? null : List<dynamic>.from(values!.map((x) => x)),
        "study_type": studyType,
        "parameter_name": parameterName,
        "min_value": minValue,
        "max_value": maxValue,
        "default_value": defaultValue,
      };
}

class The2 {
  The2({
    this.type,
    this.values,
  });

  String? type;
  List<double>? values;

  factory The2.fromJson(Map<String, dynamic> json) => The2(
        type: json["type"],
        values: List<double>.from(json["values"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "values": List<dynamic>.from(values!.map((x) => x)),
      };
}
