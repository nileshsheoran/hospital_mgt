class Category{
  int id;
  String category;
  Category({required this.id,required this.category
  });
  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'Category': category,
    };
  }

  static Category fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['Id'],
      category: map['Category'],
    );
  }
}