import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_team_assembler_flutter/models/composition.dart';
import 'package:random_team_assembler_flutter/widgets/composition_result.dart';
import 'package:random_team_assembler_flutter/widgets/settings.dart';

import '../models/role.dart';

class AssemblePage extends StatefulWidget {
  const AssemblePage({Key? key}) : super(key: key);

  @override
  State<AssemblePage> createState() => _AssemblePageState();
}

class _AssemblePageState extends State<AssemblePage> {
  final Random random = Random();

  List<String> _players = [];
  List<Composition> _compositions = [];

  getCompositionList() async {
    final String response = await rootBundle.loadString('assets/config.json');
    final data = await jsonDecode(response);
    int mapCount = data['mapsCount'];

    var roleList = data['roles'] as List;
    List<Role> roles = roleList.map((e) => Role.fromJson(e)).toList();

    var playerList = data['players'] as List;
    List<String> players = [];
    playerList.forEach((element) {
      players.add(element);
    });

    _players = players;

    List<Composition> compositions = [];

    for (int i = 0; i < mapCount; i++) {
      List<String> remainingPlayers = [];
      for (var value in players) {
        remainingPlayers.add(value);
      }

      Map<String, Role> playersByRole = {};

      for (int j = 0; j < roles.length; j++) {
        int playerId = random.nextInt(remainingPlayers.length);
        playersByRole.putIfAbsent(remainingPlayers[playerId], () => roles[j]);
        remainingPlayers.removeAt(playerId);
      }

      compositions.add(Composition(i, playersByRole));
    }

    _compositions = compositions;

    /*
    _compositions.forEach((element) {
      print(element.mapId.toString());
      element.roles.forEach((key, value) {
        print(key + " - " + value.name);
      });
    });

     */
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF282c34),
      child: Column(
        children: [
          Expanded(
            child: _compositions.isNotEmpty
                ? CompositionList(
                    compositions: _compositions, players: _players)
                : Container(
                    color: const Color(0xFF282c34),
                  ),
          ),
          Container(
            height: 84.0,
            width: double.infinity,
            color: const Color(0xFF101010),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsMenu()));
                    setState(() {

                    });
                  },
                  child: Image.asset(
                    'assets/images/settings.png',
                    width: 200,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      getCompositionList();
                    });
                  },
                  child: Image.asset(
                    'assets/images/letsgo.png',
                    width: 200,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}