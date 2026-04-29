import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _levelController = TextEditingController();
  final TextEditingController _rankController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          
          key: _formKey,
          child: Column(
            children: [
              Text("Login"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  
                  controller: _nameController,
                  decoration: InputDecoration(
                    
                    hint: Text("Masukan Nama..."),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)
                    ),
                     focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2)
                    ), errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent, width: 2)
                    ), focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2)
                    
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Nama harus di isi";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  
                  controller: _levelController,
                  decoration: InputDecoration(
                    
                    hint: Text("Masukan Level..."),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)
                    ),
                     focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2)
                    ), errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent, width: 2)
                    ), focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2)
                    
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "level harus di isi";
                    } 
                    // if (value is! int) {
                    //   return "level harus nomber";
                    // }
                    
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  
                  controller: _rankController,
                  decoration: InputDecoration(
                    
                    hint: Text("Masukan Rank..."),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)
                    ),
                     focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2)
                    ), errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent, width: 2)
                    ), focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2)
                    
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Rank harus di isi";
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  
                  controller: _jobController,
                  decoration: InputDecoration(
                    
                    hint: Text("Masukan Job..."),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)
                    ),
                     focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2)
                    ), errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent, width: 2)
                    ), focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2)
                    
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Job harus di isi";
                    }

                   

                    return null;
                  },
                ),
              ),
        
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(context, "/", arguments: {
                        "name" : _nameController.text,
                        "level" : _levelController.text,
                        "rank" : _rankController.text,
                        "job" : _jobController.text,
                      });
                    }
                  },
                  child: Text("Login"),
                ),
              ),
            ],
          ),
        ),
      ),
     
    );
  }
}
