import 'package:flutter/material.dart';
import 'package:database/core/book_service.dart';
import 'package:database/models/book_model.dart';

class BookViewModel extends ChangeNotifier{
  final BookService _bookService = BookService();

  List<Book> _books = [];
  bool isLoading = false;

  List<Book> get books => _books;

  Future<void> loadBooks() async{
    isLoading = true;
    notifyListeners();

    try {
      _books = await _bookService.fetchBooksForCurrentUser();
    } catch (e) {
      print('Errore caricamento dei libri $e');
    }
    
    isLoading = false;
    notifyListeners();
  }

  Future<void> addBook(Book book) async{
    try {
      await _bookService.createdBook(book);
      _books.insert(0, book);
      notifyListeners();
    } catch (e) {
      print('errore nella creazione del libro $e');
    }
  }

  Future<void> updateBook(Book updateBook) async{
    try {
      await _bookService.updateBook(updateBook);
      final index = _books.indexWhere((b) => b.id == updateBook.id);
      if (index != -1) {
        _books[index] = updateBook;
        notifyListeners();
      }
    } catch (e) {
        print("errore nell'aggiornamento del libro $e");
    }
  }

  Future<void> deleteBook(String bookId) async{
    try {
      await _bookService.deleteBook(bookId);
      _books.removeWhere((b) => b.id == bookId);
      notifyListeners();
    } catch (e) {
        print('errore nella cancellazione del libro $e');
    }
  }
}