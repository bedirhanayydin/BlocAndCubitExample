// ignore_for_file: public_member_api_docs, sort_constructors_first

class Cat {
  String? description;
  String? imageUrl;
  int? statusCode;
  Cat({
    this.description,
    this.imageUrl,
    this.statusCode,
  });

  Cat copyWith({
    String? description,
    String? imageUrl,
    int? statusCode,
  }) {
    return Cat(
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      statusCode: statusCode ?? this.statusCode,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'description': description,
      'imageUrl': imageUrl,
      'statusCode': statusCode,
    };
  }

  factory Cat.fromJson(Map<String, dynamic> map) {
    return Cat(
      description: map['description'] != null ? map['description'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      statusCode: map['statusCode'] != null ? map['statusCode'] as int : null,
    );
  }

  @override
  String toString() => 'Cat(description: $description, imageUrl: $imageUrl, statusCode: $statusCode)';

  @override
  bool operator ==(covariant Cat other) {
    if (identical(this, other)) return true;

    return other.description == description && other.imageUrl == imageUrl && other.statusCode == statusCode;
  }

  @override
  int get hashCode => description.hashCode ^ imageUrl.hashCode ^ statusCode.hashCode;
}
