import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String name;
  final String skill;
  final String level;

  const HeaderWidget({
    super.key,
    required this.name,
    required this.skill,
    required this.level,
  });

  IconData _getSkillIcon(String skillName) {
    final lowerSkill = skillName.toLowerCase();
    if (lowerSkill.contains('frontend') || lowerSkill.contains('web')) return Icons.web;
    if (lowerSkill.contains('backend') || lowerSkill.contains('api')) return Icons.dns;
    if (lowerSkill.contains('ui') || lowerSkill.contains('ux') || lowerSkill.contains('design')) return Icons.design_services;
    if (lowerSkill.contains('mobile') || lowerSkill.contains('app')) return Icons.phone_android;
    return Icons.code;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.blueAccent, Colors.lightBlueAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withAlpha(50),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              const CircleAvatar(
                radius: 36,
                backgroundImage: NetworkImage(
                  "https://alamahul.github.io/assets/images/Alamahul_Bayan.jpg",
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.greenAccent,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      )
                    ]
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 12),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome Back,",
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  "Level $level",
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(50),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    "Freelancer",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(60),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _getSkillIcon(skill), 
                  color: Colors.white, 
                  size: 28,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                skill,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

