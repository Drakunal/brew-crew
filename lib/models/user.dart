class MUser {
  final String uId;
  MUser({required this.uId});
}

class UserData {
  final String uId;
  final String name;
  final String sugar;
  final int strength;

  UserData(
      {required this.uId,
      required this.name,
      required this.sugar,
      required this.strength});
}
