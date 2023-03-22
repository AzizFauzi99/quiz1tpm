import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Teknologi Mobile',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    DataDiri(),
    Segitiga(),
    LayangLayang()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Data Diri',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_tree_sharp),
            label: 'Segitiga',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit_outlined),
            label: 'Layang-Layang',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class DataDiri extends StatelessWidget {
  final String nama = "Aziz Fatih Fauzi";
  final int nim = 123200070;
  final String kelas = "IF-A";
  final String hobby = "Nonton Orang Ngoding";
  final String imageUrl =
      "https://media.licdn.com/dms/image/D5603AQERg2hCFqemzg/profile-displayphoto-shrink_200_200/0/1665727788766?e=1684368000&v=beta&t=_B-xxkvYfvL5PZd5QnAR8p3uVmqZYgaINs-tk28BuUs";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biodata'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 90,
              backgroundImage: NetworkImage(imageUrl),
            ),
            SizedBox(height: 20),
            Text(
              nama,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'NIM: $nim',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Kelas: $kelas',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Hobby: $hobby',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class Segitiga extends StatefulWidget {
  const Segitiga({Key? key}) : super(key: key);

  @override
  State<Segitiga> createState() => _SegitigaState();
}

class _SegitigaState extends State<Segitiga> {
  TextEditingController sisi1Controller = TextEditingController();
  TextEditingController sisi2Controller = TextEditingController();
  TextEditingController sisi3Controller = TextEditingController();
  TextEditingController alasController = TextEditingController();
  TextEditingController tinggiController = TextEditingController();
  double luas = 0;
  double keliling = 0;

  void hitungKeliling() {
    double sisi1 = double.parse(sisi1Controller.text);
    double sisi2 = double.parse(sisi2Controller.text);
    double sisi3 = double.parse(sisi3Controller.text);
    keliling = sisi1 + sisi2 + sisi3;
  }

  void hitungLuas() {
    double alas = double.parse(alasController.text);
    double tinggi = double.parse(tinggiController.text);
    luas = (alas * tinggi) / 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Segitiga'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Keliling Segitiga",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: sisi1Controller,
              decoration: const InputDecoration(labelText: 'Sisi 1'),
            ),
            TextFormField(
              controller: sisi2Controller,
              decoration: const InputDecoration(labelText: 'Sisi 2'),
            ),
            TextFormField(
              controller: sisi3Controller,
              decoration: const InputDecoration(labelText: 'Sisi 3'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  hitungKeliling();
                });
              },
              child: const Text('Hitung Keliling'),
            ),
            const SizedBox(height: 20),
            Text('Keliling: $keliling'),
            const Divider(
              thickness: 5,
            ),
            Container(
              margin: EdgeInsets.all(5),
            ),
            Text(
              "Luas Segitiga",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: alasController,
              decoration: const InputDecoration(labelText: 'Alas'),
            ),
            TextFormField(
              controller: tinggiController,
              decoration: const InputDecoration(labelText: 'Tinggi'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  hitungLuas();
                });
              },
              child: const Text('Hitung Luas'),
            ),
            const SizedBox(height: 20),
            Text('Luas: $luas'),
          ],
        ),
      ),
    );
  }
}

class LayangLayang extends StatefulWidget {
  const LayangLayang({Key? key}) : super(key: key);

  @override
  State<LayangLayang> createState() => _LayangLayangState();
}

class _LayangLayangState extends State<LayangLayang> {
  TextEditingController diagonal1Controller = TextEditingController();
  TextEditingController diagonal2Controller = TextEditingController();
  TextEditingController sisiAtasController = TextEditingController();
  TextEditingController sisiBawahController = TextEditingController();
  double luas = 0;
  double keliling = 0;

  void hitungKeliling() {
    double sisi1 = double.parse(sisiAtasController.text);
    double sisi2 = double.parse(sisiBawahController.text);
    keliling = 2 * (sisi1 + sisi2);
  }

  void hitungLuas() {
    double diagonal1 = double.parse(diagonal1Controller.text);
    double diagonal2 = double.parse(diagonal2Controller.text);
    luas = (diagonal1 * diagonal2) / 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layang-Layang'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Keliling Layang-Layang",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: sisiAtasController,
              decoration: const InputDecoration(labelText: 'Sisi Atas'),
            ),
            TextFormField(
              controller: sisiBawahController,
              decoration: const InputDecoration(labelText: 'Sisi Bawah'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  hitungKeliling();
                });
              },
              child: const Text('Hitung Keliling'),
            ),
            const SizedBox(height: 20),
            Text('Keliling: $keliling'),
            const Divider(
              thickness: 5,
            ),
            Container(
              margin: EdgeInsets.all(5),
            ),
            Text(
              "Luas Layang-Layang",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: diagonal1Controller,
              decoration: const InputDecoration(labelText: 'Diagonal 1'),
            ),
            TextFormField(
              controller: diagonal2Controller,
              decoration: const InputDecoration(labelText: 'Diagonal 2'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  hitungLuas();
                });
              },
              child: const Text('Hitung Luas'),
            ),
            const SizedBox(height: 20),
            Text('Luas: $luas'),
          ],
        ),
      ),
    );
  }
}
