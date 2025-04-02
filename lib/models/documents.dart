class Documents {
  final int? id;
  final String title;
  final String description;
  final String directory;

  Documents({
    this.id,
    required this.title,
    required this.description,
    required this.directory,
  });

  factory Documents.fromMap(Map<String, dynamic> map) {
    return Documents(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      directory: map['directory'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'directory': directory,
    };
  }
}
