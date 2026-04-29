import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HeaderWidget  extends StatelessWidget {
  final String name;
  final String role;
  final int level;
  final String rank;


  const HeaderWidget ({super.key, required this.name, required this.role, required this.level, required this.rank});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
       gradient: LinearGradient(
        colors: [
          Colors.green,
          Colors.greenAccent,
        ],
        begin: .topStart,
        end: .bottomEnd
       ),
       borderRadius: BorderRadius.circular(16)
      ),
      padding: EdgeInsets.all(34),
      child: Row(
        children: [
            Stack(
              children: [
                
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage("https://media.istockphoto.com/id/2228661068/photo/isolated-google-logo-symbolizing-internet-search-and-technology.webp?a=1&b=1&s=612x612&w=0&k=20&c=711C2QCJ2SLkaDr9rZJm3l1TJlqErNAnS3fe0rgcRIg="),
                ),
                Positioned(
                  right: 3,
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(99),
                      color: Colors.blue
                    ),
                    child: Text("Google", style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: .bold,
                    )),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(name, style: TextStyle(
                    color: Colors.black,
                    fontWeight: .bold,
                    fontSize: 18,
                    backgroundColor: Colors.amberAccent
                  ),
                  
                  ),
                  Text("$level - $role", style: TextStyle(
                    color: Colors.white,
                    fontWeight: .bold,
                    fontSize: 15,
                    backgroundColor: Colors.redAccent
                  ),),
                ],
              ) 
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.blue.withAlpha(32),
                borderRadius: BorderRadius.circular(4)
              ),
              child: Text(rank, style: GoogleFonts.bubblegumSans(
                textStyle: TextStyle(
                  color: Colors.red,
                  fontSize: 36,
                  fontWeight: .bold
                )
              ),),
            )
        ],
      ),
    );
  }
}