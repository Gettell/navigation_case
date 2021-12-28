import 'package:flutter/material.dart';

void main() {
  runApp(const NavigationDemo());
}
class NavigationDemo extends StatefulWidget {
  const NavigationDemo({Key? key}) : super(key: key);

  @override
  _NavigationDemoState createState() => _NavigationDemoState();
}

class _NavigationDemoState extends State<NavigationDemo> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context)=> const MainScreen(),
        '/settings': (context) => const SecondScreen(),
        '/contacts': (context) => const ThirdScreen(),
      },
    );
  }
}

Widget navDrawer (context)=> Drawer(
  child: ListView(padding: EdgeInsets.zero,
    children: [
      DrawerHeader(
        decoration: BoxDecoration(color: Colors.blue),
        child: Container(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100.00,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0)),
                child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/1920px-Google-flutter-logo.svg.png'),
              ),
              const Text('Навигация в Pages'),
            ],
          ),
        ),
      ),
      ListTile(
        leading: const Icon (Icons.home),
        title: const Text ('Главная'),
        onTap: () {
          Navigator.pushNamed(context, '/');
        },
      ),
      ListTile(
        leading: const Icon (Icons.settings),
        title: const Text ('Настройки'),
        onTap: () {
          Navigator.pushNamed(context, '/settings');
        },
      ),
      Divider(),
      ListTile(
        leading: const Icon (Icons.contact_mail),
        title: const Text ('Контакты'),
        onTap: () {
          Navigator.pushNamed(context, '/contacts');
        },
      )
    ],),
);

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text ('Pages '),
      actions: [
        IconButton(onPressed: (){}, icon: const Icon (Icons.qr_code_scanner), tooltip: 'Сканировать',),
        IconButton(onPressed: (){}, icon: const Icon (Icons.chat), tooltip: 'Написать',),
        TextButton(onPressed: () {}, style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white)),
            child: Row(
              children: const [
                Icon(Icons.search),
                Text('Поиск'),
              ],
            ))
      ],),
      drawer: navDrawer(context),
      body: const Center(
        child: Text ('Главная страница'),
      ),
      bottomNavigationBar: BottomNavigationBar(onTap: (val){},items:
        const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.motorcycle),
            label: 'Мотоцикл',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental),
            label: 'Автомобиль',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.train),
            label: 'Поезд',
          ),]
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text ('Настройки'),),
      drawer: navDrawer(context),
      body:  Center(
        child: Column(
          children: const [
            SizedBox(height: 20,),
           Text ('Настройки', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            ListTile(
              leading: Icon(Icons.surround_sound),
              title: Text ('Уведомления и звук'),
            ),
            Divider(),
            ListTile(
              leading: Icon (Icons.language),
              title: Text ('Язык')
              ),
          ],
        ),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text ('Контакты'),),
      drawer: navDrawer(context),
      body: const Center(
        child: Text ('Контакты'),
      ),
    );
  }
}

