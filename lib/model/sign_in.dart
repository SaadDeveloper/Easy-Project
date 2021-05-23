class SignIn {
  SignIn({
    this.badge,
  });

  String badge;
  String username;
  String password;


  factory SignIn.fromJson(Map<String, dynamic> json) => SignIn(
        badge: json["badge"],
      );

  Map<String, dynamic> toJson() => {
        "badge": badge,
      };
}
