class UserData {
  final String phoneNumber;
  final String email;
  final String firstName;
  final String lastName;
  final String amount;
  final String mobilepin;

  UserData({
    required this.phoneNumber,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.amount,
    required this.mobilepin
  });

  Map<String, dynamic> toJson() => {
        'phoneNumber': phoneNumber,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'amount': amount,
        'mobilepin': mobilepin,
      };
}
