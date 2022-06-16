class User {
    User({
        required this.id,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.currentTeamId,
        required this.profilePhotoPath,
        required this.alamat,
        required this.telepon,
        required this.roles,
        required this.createdAt,
        required this.updatedAt,
        required this.profilePhotoUrl,
    });

    int id;
    String name;
    String email;
    dynamic emailVerifiedAt;
    dynamic currentTeamId;
    dynamic profilePhotoPath;
    String alamat;
    String telepon;
    String roles;
    int createdAt;
    int updatedAt;
    String profilePhotoUrl;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        currentTeamId: json["current_team_id"],
        profilePhotoPath: json["profile_photo_path"],
        alamat: json["alamat"],
        telepon: json["telepon"],
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
        "alamat": alamat,
        "telepon": telepon,
        "roles": roles,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "profile_photo_url": profilePhotoUrl,
    };
}