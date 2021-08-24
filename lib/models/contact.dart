class Contact {
  final int? id;
  final String fullName;
  final int accountNumber;

  Contact({required this.accountNumber, required this.fullName, this.id});

  @override
  String toString() {
    return 'Contact{id: $id, name: $fullName, accountNumber: $accountNumber}';
  }
}
