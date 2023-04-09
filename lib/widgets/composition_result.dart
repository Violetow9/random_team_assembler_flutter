import 'package:flutter/material.dart';
import 'package:random_team_assembler_flutter/models/role.dart';

import '../models/composition.dart';

class CompositionList extends StatelessWidget {
  final List<String> players;
  final List<Composition> compositions;

  const CompositionList(
      {super.key, required this.compositions, required this.players});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 150),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: players.map((e) {
                return Text(
                  e,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                );
              }).toList(),
            ),
          ),
          Table(
            border: TableBorder.all(),
            columnWidths: const <int, TableColumnWidth>{
              0: FixedColumnWidth(150),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: compositions.map((comp) {
              return TableRow(
                decoration: const BoxDecoration(
                  color: Color(0xFF303443),
                ),
                children: [
                  Container(
                    padding: const EdgeInsets.all(30),
                    height: 100,
                    width: 200,
                    color: const Color(0xFF282c34),
                    child: Text(
                      'Map: ${comp.mapId + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: players.map((player) {
                      Role? role = comp.roles[player];
                      if (role != null) {
                        return Container(
                          child: Image.asset(
                            role.icon,
                            width: 100,
                            height: 100,
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }).toList()
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
