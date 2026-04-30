import 'package:flutter/material.dart';

class FreelanceJobWidget extends StatelessWidget {
  final Map<String, dynamic> job;
  final VoidCallback onTap;

  const FreelanceJobWidget({super.key, required this.job, required this.onTap});

  @override
  Widget build(BuildContext context) {
    bool isTaken = job['isTaken'] ?? false;
    
    return InkWell(
      onTap: isTaken ? null : onTap,
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
                  Text(
                    job['title'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
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
                  Text(
                    "Payment: ${job['payment']}",
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  )
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