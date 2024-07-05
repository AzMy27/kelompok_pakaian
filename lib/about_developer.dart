import 'package:flutter/material.dart';

class AboutDeveloper extends StatelessWidget {
  final List<String> fileName = ['images/azmi.jpg', 'images/logo_polbeng.png'];

  AboutDeveloper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Developer'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30.0,
              ),
              Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(fileName[0]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                'Muhammad Azmi',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              const Text(
                'Bidang Minat : Flutter',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              const Text(
                'email : azmi.bengkalis@gmail.com',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Image.asset(
                fileName[1],
                height: 200.0,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                'Politeknik Negeri Bengkalis',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              const Text(
                'Jurusan : Teknik Informatika',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              const Text(
                'Prodi : D4 Rekayasa Perangkat Lunak',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
