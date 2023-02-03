class UserModel {
  final String id;
  final int typeId; // 1 , 2
  final String typeName; // Customer, Admin
  final String username;
  final String emailAddress;
  final String phoneNumber;
  final String accountCreationDate;
  final String? profilePicturePath;

  const UserModel({
      required this.id,
      required this.typeId,
      required this.typeName,
      required this.username,
      required this.emailAddress,
      required this.phoneNumber,
      required this.accountCreationDate,
      this.profilePicturePath
    });

  toJson(){
    return{
      "id": id,
      "typeId": typeId,
      "typeName": typeName,
      "username": username,
      "emailAddress": emailAddress,
      "phoneNumber": phoneNumber,
      "phoneNumber": phoneNumber
    };
  }
}
