class Role {
  final String name;
  final String icon;

  Role(this.name, this.icon);

  Role.fromJson(Map<String, dynamic> json) : name = json['name'], icon = json['icon'];
}
