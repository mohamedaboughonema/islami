class RadioResponse {
final List<Radios>? radios;
const RadioResponse({this.radios });
RadioResponse copyWith({List<Radios>? radios}){
return RadioResponse(
            radios:radios ?? this.radios
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'radios': radios?.map<Map<String,dynamic>>((data)=> data.toJson()).toList()
    };
}

static RadioResponse fromJson(Map<String , Object?> json){
    return RadioResponse(
            radios:json['radios'] == null ? null : (json['radios'] as List).map<Radios>((data)=> Radios.fromJson(data  as Map<String,Object?>)).toList()
    );
}

@override
String toString(){
    return '''RadioResponse(
                radios:${radios.toString()}
    ) ''';
}

@override
bool operator ==(Object other){
    return other is RadioResponse && 
        other.runtimeType == runtimeType &&
        other.radios == radios;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                radios
    );
}
    
}
      
      
class Radios {
final int? id;
final String? name;
final String? url;
final String? recentDate;
const Radios({this.id , this.name , this.url , this.recentDate });
Radios copyWith({int? id, String? name, String? url, String? recentDate}){
return Radios(
            id:id ?? this.id,
name:name ?? this.name,
url:url ?? this.url,
recentDate:recentDate ?? this.recentDate
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'id': id,
'name': name,
'url': url,
'recent_date': recentDate
    };
}

static Radios fromJson(Map<String , Object?> json){
    return Radios(
            id:json['id'] == null ? null : json['id'] as int,
name:json['name'] == null ? null : json['name'] as String,
url:json['url'] == null ? null : json['url'] as String,
recentDate:json['recent_date'] == null ? null : json['recent_date'] as String
    );
}

@override
String toString(){
    return '''Radios(
                id:$id,
name:$name,
url:$url,
recentDate:$recentDate
    ) ''';
}

@override
bool operator ==(Object other){
    return other is Radios && 
        other.runtimeType == runtimeType &&
        other.id == id && 
other.name == name && 
other.url == url && 
other.recentDate == recentDate;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                id, 
name, 
url, 
recentDate
    );
}
    
}
      
      
  
     