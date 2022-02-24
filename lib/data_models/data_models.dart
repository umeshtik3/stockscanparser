import 'dart:convert';

const String dbID = "id";
const String dbName = "name";
const String dbTag = "tag";
const String dbColor = "color";
const String dbCriteria = "criteria";
const String dbType = "type";
const String dbText = "text";
const String dbVariable = "variable";
const String dbDollor1 = "\u00241";
const String dbDollor2 = "\u00242";
const String dbDollor3 = "\u00243";
const String dbDollor4 = "\u00244";
const String dbStudyType = "study_type";
const String dbValues = "values";
const String dbDefaultValue = "default_value";
const String dbParameterName = "parameter_name";
const String dbMinValue = "min_value";
const String dbMaxValue = "max_value";

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
        id: json[dbID],
        name: json[dbName],
        tag: json[dbTag],
        color: json[dbColor],
        criteria: List<Criterion>.from(json[dbCriteria].map((x) => Criterion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        dbID: id,
        dbName: name,
        dbTag: tag,
        dbColor: color,
        dbCriteria: List<dynamic>.from(criteria!.map((x) => x.toJson())),
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
        type: json[dbType],
        text: json[dbText],
        variable: json[dbVariable] == null ? null : Variable.fromJson(json["variable"]),
      );

  Map<String, dynamic> toJson() => {
        dbType: type,
        dbText: text,
        dbVariable: variable == null ? null : variable!.toJson(),
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
        the1: json[dbDollor1] == null ? null : The1.fromJson(json[dbDollor1]),
        the2: json[dbDollor2] == null ? null : The1.fromJson(json[dbDollor2]),
        the3: json[dbDollor3] == null ? null : The1.fromJson(json[dbDollor3]),
        the4: json[dbDollor4] == null ? null : The1.fromJson(json[dbDollor4]),
      );

  Map<String, dynamic> toJson() => {
        dbDollor1: the1 == null ? null : the1!.toJson(),
        dbDollor2: the2 == null ? null : the2!.toJson(),
        dbDollor3: the3 == null ? null : the3!.toJson(),
        dbDollor4: the4 == null ? null : the4!.toJson(),
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
  List<dynamic>? values;
  String? studyType;
  String? parameterName;
  dynamic minValue;
  dynamic maxValue;
  dynamic defaultValue;

  factory The1.fromJson(Map<String, dynamic> json) => The1(
        type: json[dbType],
        values: json[dbValues] == null ? null : List<dynamic>.from(json[dbValues].map((x) => x)),
        studyType: json[dbStudyType],
        parameterName: json[dbParameterName],
        minValue: json[dbMinValue],
        maxValue: json[dbMaxValue],
        defaultValue: json[dbDefaultValue],
      );

  Map<String, dynamic> toJson() => {
        dbType: type,
        dbValues: values == null ? null : List<dynamic>.from(values!.map((x) => x)),
        dbStudyType: studyType,
        dbParameterName: parameterName,
        dbMinValue: minValue,
        dbMaxValue: maxValue,
        dbDefaultValue: defaultValue,
      };
}
