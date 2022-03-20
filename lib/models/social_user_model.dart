class SocialUserModel{
  late String name;
  String? email;
  late String phone;
  String? uId;
  String? image;
  String? cover;
  late String bio;
  bool? isEmailVerified;
  SocialUserModel({
    required this.name,
    this.email,
    required this.phone,
    this.uId,
    this.image,
    this.cover,
    required this.bio,
    this.isEmailVerified,
});
  SocialUserModel.fromJson(Map<String, dynamic>? json){
    name = json!['name'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
    image = json['image'];
    cover = json['cover'];
    bio = json['bio'];
    isEmailVerified = json['isEmailVerified'];
  }
  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'image': image,
      'cover': cover,
      'bio': bio,
      'isEmailVerified': isEmailVerified,
    };
  }
}