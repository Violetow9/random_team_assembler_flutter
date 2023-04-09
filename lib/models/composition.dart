import 'package:random_team_assembler_flutter/models/role.dart';

class Composition {
  final int mapId;
  final Map<String, Role> roles;

  Composition(this.mapId, this.roles);
}