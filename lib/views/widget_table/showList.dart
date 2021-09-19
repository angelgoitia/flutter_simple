import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';

class ShowList extends StatelessWidget {
  const ShowList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left: 10, right: 10),
      shrinkWrap: true,
      children: [
        Row(
          children: [
            row("1", 1),
            row("Tco JS MM", 2),
            row("Moreno Moreno, Miguel", 3),
            row("47", 4),
            row("1,76", 5),
            row("71", 6),
            row("32", 7),
            row("13,8", 7),
            row("13,8", 7),
            row("17", 7),
            row("15", 7),
            row("30", 7),
            row("12\'32\'\'", 7),
            row("18,4", 7),
            row("36,8", 7),
            row("0\'34\'\'", 7),
            row("16", 7),
            row("32", 7),
            row("112,6", 8),
            row("16,8", 8),
            row("Aprobado", 9),
          ],
        ),
      ],
    );
  }

  Widget row(text, index){
    return Container(
      alignment: Alignment.center,
      width: index == 1 || index == 5? 44 : index == 2? 86 : index == 3? 114 : index == 4? 29 : index == 6? 37 : index == 7? 60.7 : index == 8? 76 : 74,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        )
      ),
      child: AutoSizeText(
        text,
        textAlign: TextAlign.center,
        maxFontSize: 12,
        minFontSize: 12,
      ),
    );
  }
}