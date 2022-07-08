import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'Pets';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: MainPage(title: title),
      );
}


class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
              widget.title,
              style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 30,
          ),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => eventos()),
                );
              },
              child: const Text('Eventos'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => logar()),
                );
              },
              child: const Text('Logar'),
            ),
            IconButton(
              icon: Icon(Icons.chat_bubble_outline_rounded),
              tooltip: 'Chat',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => chat()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Pesquisar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Bucando')));
              },
            ),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.all(10),
          children: [
            buildImageInteractionDog(),
            buildImageInteractionCat(),
            buildImageInteractionPig(),
          ],
        ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => cadastroPet()),
        );
      },
      child: const Icon(Icons.add),
    ),
      );



  Widget buildImageInteractionCat() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1327&q=80',
                  ),
                  height: 500,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    'Tom',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'O Tom tem 1 aninho e foi encontrado em frente de casa, já é vacinado e busca um novo lar.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                FlatButton(
                  child: Text('Chat'),
                  onPressed: () {},
                ),

              ],
            )
          ],
        ),
      );
  Widget buildImageInteractionDog() => Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        Stack(
          children: [
            Ink.image(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1561037404-61cd46aa615b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
              ),
              height: 500,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 16,
              right: 16,
              left: 16,
              child: Text(
                'Arnold',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(16).copyWith(bottom: 0),
          child: Text(
            'Arnald já é vacinado e castrado, foi feita a vermifugação e agora esta em busca de novas companhias.',
            style: TextStyle(fontSize: 16),
          ),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.start,
          children: [
            FlatButton(
              child: Text('Chat'),
              onPressed: () {},
            ),

          ],
        )
      ],
    ),
  );
  Widget buildImageInteractionPig() => Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        Stack(
          children: [
            Ink.image(
              image: NetworkImage(
                'https://crematoriodosanimais.com.br/wp-content/uploads/2019/10/mini-porco-1.jpg',
              ),
              height: 500,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 16,
              right: 16,
              left: 16,
              child: Text(
                'Ágata',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(16).copyWith(bottom: 0),
          child: Text(
            'Ágata é uma espécie exótica de animal de estimação, o mini-porco, e vai levar alegria para dentro de sua casa',
            style: TextStyle(fontSize: 16),
          ),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.start,
          children: [
            FlatButton(
              child: Text('Chat'),
              onPressed: () {},
            ),

          ],
        )
      ],
    ),
  );

}

class cadastroPet extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
        title: Text("Cadatre seu PET!"),
    ),
    body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Tipo de PET',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Nome',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Raça (se possuir)',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Porte (Tamanho)',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Idade',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {

              },
              child: const Text('Cadastrar'),
            ),
          ),
        ],
      ),
    )
    );
  }
}

class logar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Controle de Acesso"),
    ),
    body: Center(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
    TextFormField(
    decoration: const InputDecoration(
    hintText: 'Login',
    ),
    ),
    TextFormField(
    decoration: const InputDecoration(
    hintText: 'Senha',
    ),
    ),
    Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: ElevatedButton(
    onPressed: () {

    },
    child: const Text('Logar'),
    ),
    ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => registro()),
            );
          },
          child: const Text('Cadastrar-se'),
        ),
      ),
    ],
    ),
    ));

  }
}

class registro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Registrar-se!"),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Nome',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Senha',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Repitir senha',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {

                  },
                  child: const Text('Concluir'),
                ),
              ),
            ],
          ),
        ));

  }
}

class eventos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Eventos"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              child: Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    debugPrint('Card tapped.');
                  },
                  child: SizedBox(
                    width: 400,
                    height: 300,

                    child: Column (children: [
                      Expanded(
                        child: Text('Titulo do evento' ,
                          style: TextStyle(fontSize: 35),
                          textAlign: TextAlign.center,),
                      ),
                      Expanded(
                        child: Text('Morbi id egestas est, eget viverra massa. Donec pharetra tempor elit eget consequat. Fusce non lectus tortor. Duis pulvinar et lacus et pharetra.' ,
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,),
                      ),
                    ],),
                  ),
                ),
              ),
            ),
            Container(
              child: Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    debugPrint('Card tapped.');
                  },
                  child: SizedBox(
                    width: 400,
                    height: 300,

                    child: Column (children: [
                      Expanded(
                        child: Text('Titulo do evento' ,
                          style: TextStyle(fontSize: 35),
                          textAlign: TextAlign.center,),
                      ),
                      Expanded(
                        child: Text('Cras quis tellus a erat porta commodo. Nam pulvinar leo aliquet urna gravida ullamcorper. ' ,
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,),
                      ),
                    ],),
                  ),
                ),
              ),
            ),
            Container(
              child: Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    debugPrint('Card tapped.');
                  },
                  child: SizedBox(
                    width: 400,
                    height: 300,

                    child: Column (children: [
                      Expanded(
                        child: Text('Titulo do evento' ,
                          style: TextStyle(fontSize: 35),
                          textAlign: TextAlign.center,),
                      ),
                      Expanded(
                        child: Text('Morbi id egestas est, eget viverra massa. Donec pharetra tempor elit eget consequat. Fusce non lectus tortor. Duis pulvinar et lacus et pharetra.' ,
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,),
                      ),
                    ],),
                  ),
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}

class chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bate-Papo"),
      ),
      body: Center(

      ),
    );
  }
}



