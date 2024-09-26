import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            alignment: Alignment.center,
            child: const Text(
              'JULIANNE RUTH PAMPLONA',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 238, 229, 229)),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 212, 142, 224),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildProfileSection(),
              const SizedBox(height: 24),
              buildInfoSection(),
              const SizedBox(height: 24),
              buildBiographySection(),
              const SizedBox(height: 24),
              buildTableSection(),
              const SizedBox(height: 24),
              buildGridViewSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileSection() => sectionWrapper(
        Row(
          children: [
            const CircleAvatar(radius: 40, backgroundImage: AssetImage('assets/profile.png')),
            const SizedBox(width: 18),
            const Text('Julianne Ruth Pamplona', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.black)),
            const Spacer(),
          ],
        ),
      );

  Widget buildInfoSection() => sectionWrapper(
        Column(
          children: [
            buildInfoRow(Icons.cake, 'Birthday', 'November 03, 2003', const Color.fromARGB(255, 201, 112, 142)),
            buildInfoRow(Icons.house, 'Address', 'Leon, Iloilo, Philippines', const Color.fromARGB(255, 88, 192, 135)),
            buildInfoRow(Icons.email, 'Email', 'julianneruth.pamplona@email.com', const Color.fromARGB(255, 209, 108, 108)),
            buildInfoRow(Icons.phone, 'Phone', '09876543211', const Color.fromARGB(255, 209, 168, 130)),
            buildInfoRow(Icons.school, 'Education', 'West Visayas State University', const Color.fromARGB(255, 102, 166, 209)),
            buildInfoRow(Icons.brush, 'Hobbies', 'Sleeping, Reading Books', const Color.fromARGB(255, 209, 120, 209)),
          ].expand((widget) => [widget, const SizedBox(height: 14)]).toList(),
        ),
      );

  Widget buildBiographySection() => sectionWrapper(
        const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Biography', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 52, 64, 131))),
            SizedBox(height: 8),
            Text(
              'I’m Julianne Ruth Pamplona, a 20-year-old BSIT student in my third year at West Visayas State University in Leon, Iloilo. I love spending my free time listening to music, reading, and catching up on sleep. Taking care of my cats and dogs brings me joy, and I also enjoy helping stray animals I come across. I am determined to harness my passion for technology and my love for animals to create lasting change in my community, proving that compassion and innovation can transform lives. ',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      );

  Widget buildTableSection() => Table(
        border: TableBorder.all(),
        children: const [
          TableRow(children: [
            TextCell('Course', Color.fromARGB(255, 212, 142, 224)), 
            TextCell('Grade', Color.fromARGB(255, 212, 142, 224)), 
          ]),
          TableRow(children: [
            TextCell('CC 206', Colors.white), 
            TextCell('1.0', Colors.white), 
          ]),
        ],
      );

  Widget buildGridViewSection() => Container(
        height: 500,
        width: 500,
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(1, (index) => buildGridItem()),
        ),
      );

  Widget buildGridItem() => Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 52, 64, 131),
          borderRadius: BorderRadius.circular(50),
          boxShadow: [buildBoxShadow()],
        ),
        child: const Center(
          child: Icon(Icons.face_3, size: 200, color: Color.fromARGB(255, 255, 255, 255)),
        ),
      );

  Widget buildInfoRow(IconData icon, String title, String data, Color iconColor) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 28, color: iconColor),
          const SizedBox(width: 15),
          Expanded(child: Text(title, style: const TextStyle(fontSize: 18, color: Colors.black87))),
          const SizedBox(width: 8),
          Expanded(flex: 7, child: Text(data, style: const TextStyle(fontSize: 16, color: Colors.black54))),
        ],
      );

  BoxDecoration boxDecoration() => BoxDecoration(
        color: const Color.fromARGB(255, 201, 214, 235),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [buildBoxShadow()],
      );

  BoxShadow buildBoxShadow() => BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 5,
        offset: const Offset(0, 3),
      );

  Widget sectionWrapper(Widget child) => Container(
        padding: const EdgeInsets.all(16),
        decoration: boxDecoration(),
        child: child,
      );
}

class TextCell extends StatelessWidget {
  final String text;
  final Color color;

  const TextCell(this.text, this.color, {super.key});

  @override
  Widget build(BuildContext context) => Container(
        color: color, 
        padding: const EdgeInsets.all(8.0),
        child: Text(text),
      );
}