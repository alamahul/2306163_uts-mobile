import 'package:flutter/material.dart';

class FreelanceJobWidget extends StatelessWidget {
  final Map<String, dynamic> job;
  final VoidCallback onTap;
  final int userLevel;

  const FreelanceJobWidget({
    super.key, 
    required this.job, 
    required this.onTap,
    required this.userLevel,
  });

  @override
  Widget build(BuildContext context) {
    bool isTaken = job['isTaken'] ?? false;
    int reqLevel = job['reqLevel'] ?? 1;
    bool isRecommended = userLevel >= reqLevel;
    
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.withAlpha(50)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(10),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ]
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: isTaken ? Colors.green.withAlpha(30) : Colors.blue.withAlpha(30),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isTaken ? Icons.check_circle : Icons.work_outline,
                color: isTaken ? Colors.green : Colors.blueAccent,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          job['title'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      if (job['isFavorite'] == true)
                        const Icon(Icons.favorite, color: Colors.redAccent, size: 18),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Client: ${job['client']}",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.monetization_on, size: 16, color: Colors.green),
                      const SizedBox(width: 4),
                      Text(
                        "${job['payment']}",
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent.withAlpha(20),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          "Lvl $reqLevel+",
                          style: const TextStyle(color: Colors.blueAccent, fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        isRecommended ? Icons.thumb_up : Icons.warning_amber_rounded,
                        size: 14,
                        color: isRecommended ? Colors.blue : Colors.orange,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          isRecommended ? "Rekomendasi untuk Anda" : "Level Anda di bawah syarat",
                          style: TextStyle(
                            fontSize: 11,
                            color: isRecommended ? Colors.blue : Colors.orange,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ),
            if (isTaken)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "Taken",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              )
            else
              const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}