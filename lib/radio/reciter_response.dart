class ReciterResponse {
  final List<Reciters>? reciters;
  const ReciterResponse({this.reciters});
  ReciterResponse copyWith({List<Reciters>? reciters}) {
    return ReciterResponse(reciters: reciters ?? this.reciters);
  }

  Map<String, Object?> toJson() {
    return {
      'reciters':
          reciters?.map<Map<String, dynamic>>((data) => data.toJson()).toList()
    };
  }

  static ReciterResponse fromJson(Map<String, Object?> json) {
    return ReciterResponse(
        reciters: json['reciters'] == null
            ? null
            : (json['reciters'] as List)
                .map<Reciters>(
                    (data) => Reciters.fromJson(data as Map<String, Object?>))
                .toList());
  }

  @override
  String toString() {
    return '''GeneratedDataModel(
                reciters:${reciters.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is ReciterResponse &&
        other.runtimeType == runtimeType &&
        other.reciters == reciters;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, reciters);
  }
}

class Reciters {
  final int? id;
  final String? name;
  final String? letter;
  final String? date;
  final List<Moshaf>? moshaf;
  const Reciters({this.id, this.name, this.letter, this.date, this.moshaf});
  Reciters copyWith(
      {int? id,
      String? name,
      String? letter,
      String? date,
      List<Moshaf>? moshaf}) {
    return Reciters(
        id: id ?? this.id,
        name: name ?? this.name,
        letter: letter ?? this.letter,
        date: date ?? this.date,
        moshaf: moshaf ?? this.moshaf);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'letter': letter,
      'date': date,
      'moshaf':
          moshaf?.map<Map<String, dynamic>>((data) => data.toJson()).toList()
    };
  }

  static Reciters fromJson(Map<String, Object?> json) {
    return Reciters(
        id: json['id'] == null ? null : json['id'] as int,
        name: json['name'] == null ? null : json['name'] as String,
        letter: json['letter'] == null ? null : json['letter'] as String,
        date: json['date'] == null ? null : json['date'] as String,
        moshaf: json['moshaf'] == null
            ? null
            : (json['moshaf'] as List)
                .map<Moshaf>(
                    (data) => Moshaf.fromJson(data as Map<String, Object?>))
                .toList());
  }

  @override
  String toString() {
    return '''Reciters(
                id:$id,
name:$name,
letter:$letter,
date:$date,
moshaf:${moshaf.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Reciters &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.name == name &&
        other.letter == letter &&
        other.date == date &&
        other.moshaf == moshaf;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, letter, date, moshaf);
  }
}

class Moshaf {
  final int? id;
  final String? name;
  final String? server;
  final int? surahTotal;
  final int? moshafType;
  final String? surahList;
  const Moshaf(
      {this.id,
      this.name,
      this.server,
      this.surahTotal,
      this.moshafType,
      this.surahList});
  Moshaf copyWith(
      {int? id,
      String? name,
      String? server,
      int? surahTotal,
      int? moshafType,
      String? surahList}) {
    return Moshaf(
        id: id ?? this.id,
        name: name ?? this.name,
        server: server ?? this.server,
        surahTotal: surahTotal ?? this.surahTotal,
        moshafType: moshafType ?? this.moshafType,
        surahList: surahList ?? this.surahList);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'server': server,
      'surah_total': surahTotal,
      'moshaf_type': moshafType,
      'surah_list': surahList
    };
  }

  static Moshaf fromJson(Map<String, Object?> json) {
    return Moshaf(
        id: json['id'] == null ? null : json['id'] as int,
        name: json['name'] == null ? null : json['name'] as String,
        server: json['server'] == null ? null : json['server'] as String,
        surahTotal:
            json['surah_total'] == null ? null : json['surah_total'] as int,
        moshafType:
            json['moshaf_type'] == null ? null : json['moshaf_type'] as int,
        surahList:
            json['surah_list'] == null ? null : json['surah_list'] as String);
  }

  @override
  String toString() {
    return '''Moshaf(
                id:$id,
name:$name,
server:$server,
surahTotal:$surahTotal,
moshafType:$moshafType,
surahList:$surahList
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Moshaf &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.name == name &&
        other.server == server &&
        other.surahTotal == surahTotal &&
        other.moshafType == moshafType &&
        other.surahList == surahList;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, id, name, server, surahTotal, moshafType, surahList);
  }
}
