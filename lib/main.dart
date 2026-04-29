import 'package:flutter/material.dart';
import 'package:itg_mobile_pertemuan_5/pages/login_page.dart';
import 'package:itg_mobile_pertemuan_5/widgets/chips.widget.dart';
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
      title: 'Pertemuan 6 - Adventure Guild',
      initialRoute: "/",
      onGenerateRoute: (datas) {
        if (datas.name == "/") {
            if (datas.arguments == null || datas.arguments is! Map) {
              return MaterialPageRoute(builder: (context) => const LoginPage());
            }

            final args = Map<String, dynamic>.from(datas.arguments as Map);
            return MaterialPageRoute(builder: (context) => HomePage(userData: args),);

        } 
        return null;
      },
      
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
  @override
  Widget build(BuildContext context) {
    final String name = widget.userData['name'];
    final int level = int.parse(widget.userData['level']);
    final String rank = widget.userData['rank'];
    final String job = widget.userData['job'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Out Sourcing",
          style: TextStyle(fontWeight: .bold, color: Colors.white),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(children: [
          
          HeaderWidget(name: name, level: level, role: job, rank: rank),
          SizedBox(height: 6,),
          Row(
            spacing: 10,
            children: [        
                ChipsWidget(color: Colors.red, icon: Icons.favorite, label: "Skills", value: "Weng Dev", bg: Colors.black),
                ChipsWidget(color: Colors.yellow, icon: Icons.start, label: "Status", value: "Student", bg: Colors.red),
                ChipsWidget(color: Colors.blue, icon: Icons.numbers, label: "Semester", value: "6", bg: Colors.yellow)
              ]
    
          ),
          SizedBox(height: 8,),
          Text("Quest List"),
          SizedBox(height: 8,),
          Column(
            spacing: 10,
            children: [
            QuestWidget(quest: "Bug fixing", cost: "Rp. 500.000", icon: Icons.task_alt, textColor: Colors.black38,),
            QuestWidget(quest: "Programming", cost: "Rp. 500.000", icon: Icons.task_alt, textColor: Colors.black38),
            QuestWidget(quest: "Design Database", cost: "Rp. 1.000.000", icon: Icons.task_alt, textColor: Colors.black38)
    
            ],
          )
          ],
        ),
      ),
    );
  }
}
