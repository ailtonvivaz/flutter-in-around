
class Group {
  String id;
  String name;
  String shortDescription;
  String longDescription;

  Group({this.id, this.name, this.shortDescription, this.longDescription});

  Group.fromMap(String id, Map<String, dynamic> data)
  : this(
    id: id,
    name: data['name'],
    shortDescription: data['short_description'] ?? '',
    longDescription: data['long_description'] ?? ''
  );

}