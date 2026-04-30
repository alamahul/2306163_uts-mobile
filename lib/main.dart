import 'package:flutter/material.dart';
import 'package:uts_mobile/pages/login_page.dart';
import 'package:uts_mobile/pages/detail_job_page.dart';
import 'package:uts_mobile/widgets/quest_widget.dart';
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
          return MaterialPageRoute(
            builder: (context) => HomePage(userData: args),
          );
        }
        return null;
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  final Map<String, dynamic> userData;

  const HomePage({super.key, required this.userData});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  
  // Pagination variables
  int _homeItemsCount = 10;
  int _myJobsItemsCount = 10;

  // Dummy Data
  late List<Map<String, dynamic>> freelanceJobs;

  @override
  void initState() {
    super.initState();
    
    final frontendTitles = ["Build Landing Page", "React Dashboard UI", "Vue.js E-Commerce UI", "Portfolio Website", "Angular Admin Panel"];
    final backendTitles = ["REST API for Mobile App", "GraphQL Server Setup", "Payment Gateway Integration", "Database Optimization", "Microservices Architecture"];
    final uiuxTitles = ["Mobile App Wireframing", "Web App Redesign", "Landing Page Prototyping", "User Research & Testing", "Dashboard Design System"];
    final mobileTitles = ["Flutter E-Commerce App", "React Native Chat App", "iOS Swift Utility", "Android Kotlin POS", "Cross-platform Game UI"];
    final clients = ["TechNova", "Creative Studio", "Startup XYZ", "Global Industries", "EduTech Inc", "HealthApp Solutions", "FinTech Group", "Green Energy Co"];

    freelanceJobs = List.generate(50, (index) {
      final skillsList = ["Frontend", "Backend", "UI/UX", "Mobile"];
      final difficulties = ["Easy", "Medium", "Hard"];
      
      final skill = skillsList[index % skillsList.length];
      final difficulty = difficulties[index % difficulties.length];
      int reqLvl = difficulty == "Easy" ? 1 : (difficulty == "Medium" ? 2 : 4);
      
      String title = "";
      if (skill == "Frontend") title = frontendTitles[index % frontendTitles.length];
      if (skill == "Backend") title = backendTitles[index % backendTitles.length];
      if (skill == "UI/UX") title = uiuxTitles[index % uiuxTitles.length];
      if (skill == "Mobile") title = mobileTitles[index % mobileTitles.length];

      final client = clients[index % clients.length];
      
      // Some variance in payment
      int paymentValue = ((index % 10) + 1) * 500;
      
      return {
        "id": "${index + 1}",
        "title": title,
        "client": client,
        "difficulty": difficulty,
        "payment": "Rp$paymentValue.000",
        "description": "Dibutuhkan keahlian $skill untuk menyelesaikan proyek $title. Klien kami $client mencari freelancer yang dapat memberikan hasil berkualitas tinggi.",
        "image": "https://images.unsplash.com/photo-1522542550221-31fd19575a2d?auto=format&fit=crop&q=80&w=400",
        "skill": skill,
        "reqLevel": reqLvl,
        "isTaken": false,
        "isFavorite": index % 7 == 0, // Randomly favorite some items
      };
    });
  }

  final List<String> skills = ["All", "Frontend", "Backend", "UI/UX", "Mobile"];
  String selectedSkill = "All";
  String searchQuery = "";

  void _takeJob(int index) {
    setState(() {
      freelanceJobs[index]['isTaken'] = true;
    });
  }

  Widget _buildHomeView() {
    final String name = widget.userData['name'];
    final String level = widget.userData['level'];
    final String skill = widget.userData['skill'];

    int completedProjects = freelanceJobs.where((job) => job['isTaken']).length;
    double progress = completedProjects / freelanceJobs.length;

    List<Map<String, dynamic>> filteredJobs = freelanceJobs.where((job) {
      final matchSkill =
          selectedSkill == "All" || job['skill'] == selectedSkill;
      final matchSearch = job['title'].toString().toLowerCase().contains(
        searchQuery.toLowerCase(),
      );
      return matchSkill && matchSearch;
    }).toList();

    List<Map<String, dynamic>> paginatedJobs = filteredJobs.take(_homeItemsCount).toList();

    return SingleChildScrollView(
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
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Job Progress",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "$completedProjects/${freelanceJobs.length} Completed",
                      style: const TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                    avatar: isSelected ? const Icon(Icons.check, color: Colors.white, size: 16) : null,
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
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                    backgroundColor: Colors.white,
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Available Projects",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.filter_list, color: Colors.grey.shade600),
            ],
          ),
          const SizedBox(height: 12),
          filteredJobs.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: const [
                        Icon(Icons.search_off, size: 48, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("No jobs found matching your criteria.", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: paginatedJobs.length,
                  itemBuilder: (context, index) {
                    final job = paginatedJobs[index];
                    // Find the original index to update state correctly
                    final originalIndex = freelanceJobs.indexWhere(
                      (j) => j['id'] == job['id'],
                    );

                    int parsedLevel = int.tryParse(widget.userData['level'].toString()) ?? 1;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: FreelanceJobWidget(
                        job: job,
                        userLevel: parsedLevel,
                        onTap: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailJobPage(job: job, userLevel: parsedLevel),
                            ),
                          );
                          setState((){}); // Update the UI in case favorite was toggled
                          if (result == true) {
                            _takeJob(originalIndex);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Row(
                                  children: [
                                    const Icon(Icons.check_circle, color: Colors.white),
                                    const SizedBox(width: 8),
                                    Expanded(child: Text("Project '${job['title']}' added to your active projects!")),
                                  ],
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        },
                      ),
                    );
                  },
                ),
          if (filteredJobs.length > _homeItemsCount)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: TextButton.icon(
                  onPressed: () {
                    setState(() {
                      _homeItemsCount += 10;
                    });
                  },
                  icon: const Icon(Icons.expand_more),
                  label: const Text("Load More"),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMyJobsView() {
    List<Map<String, dynamic>> takenJobs = freelanceJobs.where((job) => job['isTaken']).toList();
    List<Map<String, dynamic>> paginatedJobs = takenJobs.take(_myJobsItemsCount).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Active Projects",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            "Here are the projects you are currently working on.",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24),
          takenJobs.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Column(
                      children: const [
                        Icon(Icons.work_off, size: 64, color: Colors.grey),
                        SizedBox(height: 16),
                        Text("You haven't taken any projects yet.", style: TextStyle(color: Colors.grey, fontSize: 16)),
                      ],
                    ),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: paginatedJobs.length,
                  itemBuilder: (context, index) {
                    final job = paginatedJobs[index];
                    int parsedLevel = int.tryParse(widget.userData['level'].toString()) ?? 1;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: FreelanceJobWidget(
                        job: job,
                        userLevel: parsedLevel,
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailJobPage(job: job, userLevel: parsedLevel),
                            ),
                          );
                          setState((){}); // Update the UI in case favorite was toggled
                        },
                      ),
                    );
                  },
                ),
          if (takenJobs.length > _myJobsItemsCount)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: TextButton.icon(
                  onPressed: () {
                    setState(() {
                      _myJobsItemsCount += 10;
                    });
                  },
                  icon: const Icon(Icons.expand_more),
                  label: const Text("Load More"),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildProfileView() {
    final String name = widget.userData['name'];
    final String level = widget.userData['level'];
    final String skill = widget.userData['skill'];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          HeaderWidget(name: name, level: level, skill: skill),
          const SizedBox(height: 32),
          Container(
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
              children: [
                ListTile(
                  leading: const Icon(Icons.person, color: Colors.blueAccent),
                  title: const Text("Account Settings"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    final nameController = TextEditingController(text: name);
                    final levelController = TextEditingController(text: level);
                    final skillController = TextEditingController(text: skill);
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Edit Profile"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: nameController,
                              decoration: const InputDecoration(labelText: "Nama"),
                            ),
                            TextField(
                              controller: levelController,
                              decoration: const InputDecoration(labelText: "Level"),
                              keyboardType: TextInputType.number,
                            ),
                            TextField(
                              controller: skillController,
                              decoration: const InputDecoration(labelText: "Skill Freelancer"),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Batal"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                widget.userData['name'] = nameController.text;
                                widget.userData['level'] = levelController.text;
                                widget.userData['skill'] = skillController.text;
                              });
                              Navigator.pop(context);
                            },
                            child: const Text("Simpan"),
                          )
                        ],
                      )
                    );
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.payment, color: Colors.blueAccent),
                  title: const Text("Payment Methods"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (context) => Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Metode Pembayaran", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 16),
                            ListTile(
                              leading: const Icon(Icons.account_balance, color: Colors.green),
                              title: const Text("Transfer Bank"),
                              subtitle: const Text("BCA, Mandiri, BNI"),
                              onTap: () => Navigator.pop(context),
                            ),
                            ListTile(
                              leading: const Icon(Icons.account_balance_wallet, color: Colors.blue),
                              title: const Text("E-Wallet"),
                              subtitle: const Text("GoPay, OVO, Dana"),
                              onTap: () => Navigator.pop(context),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.add),
                                label: const Text("Tambah Metode Baru", style: TextStyle(color: Colors.white)),
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                              ),
                            )
                          ],
                        ),
                      )
                    );
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.help_outline, color: Colors.blueAccent),
                  title: const Text("Help & Support"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Cara Penggunaan"),
                        content: const Text("1. Cari project freelance di tab Home.\n2. Cek apakah level Anda memenuhi syarat.\n3. Tekan 'Take Project' untuk mengambil pekerjaan.\n4. Pantau progress Anda di tab My Jobs."),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Mengerti"),
                          )
                        ],
                      )
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent.withAlpha(20),
                foregroundColor: Colors.redAccent,
                padding: const EdgeInsets.symmetric(vertical: 16),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )
              ),
              icon: const Icon(Icons.logout),
              label: const Text("Log Out", style: TextStyle(fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/");
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String appBarTitle = "FreelanceHub";
    if (_currentIndex == 1) appBarTitle = "My Jobs";
    if (_currentIndex == 2) appBarTitle = "Profile";

    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBarTitle,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _buildHomeView(),
          _buildMyJobsView(),
          _buildProfileView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline),
            label: 'My Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
