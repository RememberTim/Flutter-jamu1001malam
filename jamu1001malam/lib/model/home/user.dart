class User {
    int id;
    String name;
    String email;
    dynamic emailVerifiedAt;
    dynamic currentTeamId;
    dynamic profilePhotoPath;
    String address;
    String houseNumber;
    String phoneNumber;
    String city;
    String roles;
    int createdAt;
    int updatedAt;
    String profilePhotoUrl;
    User({
        required this.id,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.currentTeamId,
        required this.profilePhotoPath,
        required this.address,
        required this.houseNumber,
        required this.phoneNumber,
        required this.city,
        required this.roles,
        required this.createdAt,
        required this.updatedAt,
        required this.profilePhotoUrl,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        currentTeamId: json["current_team_id"],
        profilePhotoPath: json["profile_photo_path"],
        address: json["address"],
        houseNumber: json["houseNumber"],
        phoneNumber: json["phoneNumber"],
        city: json["city"],
        roles: json["roles"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        profilePhotoUrl: json["profile_photo_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "current_team_id": currentTeamId,
        "profile_photo_path": profilePhotoPath,
        "address": address,
        "houseNumber": houseNumber,
        "phoneNumber": phoneNumber,
        "city": city,
        "roles": roles,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "profile_photo_url": profilePhotoUrl,
    };
}