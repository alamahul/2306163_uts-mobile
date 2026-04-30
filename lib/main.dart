import 'package:flutter/material.dart';
import 'package:itg_mobile_pertemuan_5/pages/login_page.dart';
import 'package:itg_mobile_pertemuan_5/pages/detail_job_page.dart';
import 'package:itg_mobile_pertemuan_5/widgets/quest_widget.dart';
import './widgets/header.widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FreelanceHub',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        fontFamily: 'Inter',
      ),
      initialRoute: "/",
      onGenerateRoute: (datas) {
        if (datas.name == "/") {
          if (datas.arguments == null || datas.arguments is! Map) {
            return MaterialPageRoute(builder: (context) => const LoginPage());
          }

          final args = Map<String, dynamic>.from(datas.arguments as Map);
          return MaterialPageRoute(builder: (context) => HomePage(userData: args));
        } 
        return null;
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  final Map<String, dynamic> userData;

  const HomePage({
    super.key,
    required this.userData
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Dummy Data
  final List<Map<String, dynamic>> freelanceJobs = [
    {
      "id": "1",
      "title": "Build Landing Page",
      "client": "Startup XYZ",
      "difficulty": "Easy",
      "payment": "Rp500.000",
      "description": "Membuat landing page responsive menggunakan Flutter Web.",
      "image": "https://images.unsplash.com/photo-1522542550221-31fd19575a2d?auto=format&fit=crop&q=80&w=400",
      "skill": "Frontend",
      "isTaken": false,
      "isFavorite": false,
    },
    {
      "id": "2",
      "title": "Design Mobile UI",
      "client": "Creative Studio",
      "difficulty": "Medium",
      "payment": "Rp1.200.000",
      "description": "Mendesain UI aplikasi mobile modern yang menarik dan user-friendly.",
      "image": "https://images.unsplash.com/photo-1561070791-2526d30994b5?auto=format&fit=crop&q=80&w=400",
      "skill": "UI/UX",
      "isTaken": false,
      "isFavorite": true,
    },
    {
      "id": "3",
      "title": "Backend API for E-Commerce",
      "client": "TechCorp",
      "difficulty": "Hard",
      "payment": "Rp3.500.000",
      "description": "Membangun RESTful API menggunakan Node.js untuk aplikasi E-Commerce skala besar.",
      "image": "https://images.unsplash.com/photo-1555066931-4365d14bab8c?auto=format&fit=crop&q=80&w=400",
      "skill": "Backend",
      "isTaken": false,
      "isFavorite": false,
    }
  ];

  final List<String> skills = ["All", "Frontend", "Backend", "UI/UX", "Mobile"];
  String selectedSkill = "All";
  String searchQuery = "";

  void _takeJob(int index) {
    setState(() {
      freelanceJobs[index]['isTaken'] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String name = widget.userData['name'];
    final String level = widget.userData['level'];
    final String skill = widget.userData['skill'];

    int completedProjects = freelanceJobs.where((job) => job['isTaken']).length;
    double progress = completedProjects / freelanceJobs.length;

    List<Map<String, dynamic>> filteredJobs = freelanceJobs.where((job) {
      final matchSkill = selectedSkill == "All" || job['skill'] == selectedSkill;
      final matchSearch = job['title'].toString().toLowerCase().contains(searchQuery.toLowerCase());
      return matchSkill && matchSearch;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FreelanceHub",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            tooltip: 'Logout',
            onPressed: () {
              // Navigasi kembali ke halaman login tanpa argumen untuk menghapus sesi
              Navigator.pushReplacementNamed(context, "/");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(name: name, level: level, skill: skill),
            const SizedBox(height: 20),
            
            // Progress Pekerjaan
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(10),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Job Progress", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text("$completedProjects/${freelanceJobs.length} Completed", style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey.shade200,
                    color: Colors.blueAccent,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Search Bar
            TextField(
              onChanged: (value) => setState(() => searchQuery = value),
              decoration: InputDecoration(
                hintText: "Search freelance job...",
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Filter berdasarkan skill
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: skills.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedSkill == skills[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(skills[index]),
                      selected: isSelected,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            selectedSkill = skills[index];
                          });
                        }
                      },
                      selectedColor: Colors.blueAccent,
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.black87,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                      backgroundColor: Colors.white,
                    ),
                  );
                },
              ),
            ),
            
            const SizedBox(height: 24),
            const Text(
              "Available Projects",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            filteredJobs.isEmpty 
              ? const Center(child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text("No jobs found matching your criteria."),
                ))
              : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredJobs.length,
              itemBuilder: (context, index) {
                final job = filteredJobs[index];
                // Find the original index to update state correctly
                final originalIndex = freelanceJobs.indexWhere((j) => j['id'] == job['id']);
                
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: FreelanceJobWidget(
                    job: job,
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailJobPage(job: job),
                        ),
                      );
                      if (result == true) {
                        _takeJob(originalIndex);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Project '${job['title']}' added to your active projects!"),
                            backgroundColor: Colors.green,
                          )
                        );
                      }
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

