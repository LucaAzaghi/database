class BookImage {
  final String id;
  final String bookId;
  final String imageUrl;

  BookImage({required this.id, required this.bookId, required this.imageUrl});

  Map<String, dynamic> toMap() {
    return {
      'book_id': bookId,
      'image_url': imageUrl,
    };
  }

  factory BookImage.fromMap(Map<String, dynamic> map) {
    return BookImage(
      id: map['id'],
      bookId: map['book_id'],
      imageUrl: map['image_url'],
    );
  }
}
