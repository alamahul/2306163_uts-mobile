import 'package:flutter/material.dart';

class QuestWidget extends StatelessWidget {
    final String quest;
    final String cost;
    final Color textColor;
    final IconData icon;

    const QuestWidget({super.key, required this.quest, required this.cost, required this.textColor, required this.icon});

  @override

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      borderRadius: BorderRadius.circular(14),
      child: Ink(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.withAlpha(14),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.black.withAlpha(20)),
          boxShadow: [
              BoxShadow(
              color: Colors.black.withAlpha(10),
              blurRadius: 10,
              offset: const Offset(0, 4)
              )
            ]
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.purpleAccent.withAlpha(12),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Icon(icon, color: Colors.purpleAccent),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(quest, style: TextStyle(color: textColor),),
                    SizedBox(height: 2,),
                    Text(cost)
                  ],
                )
              )
            ],
          ),
        ),
    );

  }
}