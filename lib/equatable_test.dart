import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String name;
  const Book({required this.name});
  @override
  List<Object?> get props => [name];
}

void func() {
  Book b = Book(name: "akshay");
  Book b1 = Book(name: "aksha");
  print(b == b1);
}
