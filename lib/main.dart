import 'dart:ui';
import 'package:inicial/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      home: Jogo(),
    );
  }
}

//frases do dia usando stateful

class Frases extends StatefulWidget {
  const Frases({Key? key}) : super(key: key);

  @override
  State<Frases> createState() => _FrasesState();
}

void msg() {
  print("ola");
}

class _FrasesState extends State<Frases> {
  List<String> frases = [
    "Toda ação humana, quer se torne positiva ou negativa, precisa depender de motivação.",
    "Lute. Acredite. Conquiste. Perca. Deseje. Espere. Alcance. Invada. Caia. Seja tudo o quiser ser, mas, acima de tudo, seja você sempre.",
    "Tudo o que um sonho precisa para ser realizado é alguém que acredite que ele possa ser realizado.",
    "O insucesso é apenas uma oportunidade para recomeçar com mais inteligência.",
  ];

  String fraseGerada = "Clique Abaixo Para Gerar uma Frase";

  void gerar() {
    int escolha = Random().nextInt(frases.length);
    print(frases[escolha]);

    setState(() {
      fraseGerada = frases[escolha];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Frases do dia",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.amber),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Image.network(
                "https://cdn.w600.comps.canstockphoto.com.br/escrit%C3%B3rio-%C3%ADcone-estante-de-livros-vetor-eps_csp38664146.jpg"),
            Text(
              fraseGerada,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text(
                "Nova Frase",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: gerar,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

//2a tela Jo-Ken-Po

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var padrao = NetworkImage("https://img.icons8.com/ios/500/circled.png");
  var mensagem = "Escolha uma opcao abaixo";

  void opcaoSelecionada(String escolhaUser) {
    var op = ["pedra", "tesoura", "papel"];
    var numero = Random().nextInt(3);
    var escolhaApp = op[numero];

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          padrao = NetworkImage(
              "https://cdn-icons-png.flaticon.com/512/231/231640.png");
        });
        break;
      case "tesoura":
        setState(() {
          padrao = NetworkImage(
              "https://cdn-icons-png.flaticon.com/512/2821/2821023.png");
        });
        break;
      case "papel":
        setState(() {
          padrao = NetworkImage(
              "https://cdn-icons-png.flaticon.com/512/482/482658.png");
        });
        break;
      default:
    }

    //validacao
    if (escolhaUser == "pedra") {
      if (escolhaApp == "papel") {
        setState(() {
          mensagem = "perdeu :(";
        });
      } else if (escolhaApp == "pedra") {
        setState(() {
          mensagem = "empate :|";
        });
      } else {
        setState(() {
          mensagem = "ganhou :)";
        });
      }
    } else if (escolhaUser == "tesoura") {
      if (escolhaApp == "pedra") {
        setState(() {
          mensagem = "perdeu :(";
        });
      } else if (escolhaApp == "papel") {
        setState(() {
          mensagem = "ganhou :)";
        });
      } else {
        setState(() {
          mensagem = "empate :|";
        });
      }
    } else {
      if (escolhaApp == "pedra") {
        setState(() {
          mensagem = "ganhou :)";
        });
      } else if (escolhaApp == "tesoura") {
        setState(() {
          mensagem = "perdeu :(";
        });
      } else {
        setState(() {
          mensagem = "empate :|";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JoKenPo Game"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "Escolha do App",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Image(
              image: padrao,
              height: 160,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              mensagem,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 200,
                ),
                GestureDetector(
                  onTap: () => opcaoSelecionada("pedra"),
                  child: Image.network(
                    "https://cdn-icons-png.flaticon.com/512/231/231640.png",
                    height: 60,
                  ),
                ),
                GestureDetector(
                  onTap: () => opcaoSelecionada("tesoura"),
                  child: Image.network(
                    "https://cdn-icons-png.flaticon.com/512/2821/2821023.png",
                    height: 60,
                  ),
                ),
                GestureDetector(
                  onTap: () => opcaoSelecionada("papel"),
                  child: Image.network(
                    "https://cdn-icons-png.flaticon.com/512/482/482658.png",
                    height: 60,
                  ),
                ),
                /*
                Image.network(
                  "https://cdn-icons.flaticon.com/png/512/3562/premium/3562188.png?token=exp=1657221216~hmac=ed4ebc143ea2101ae4cf1f7193fa4c21",
                  height: 60,
                ),
                Image.network(
                  "https://cdn-icons-png.flaticon.com/512/2821/2821023.png",
                  height: 60,
                ),
                Image.network(
                  "https://cdn-icons-png.flaticon.com/512/482/482658.png",
                  height: 60,
                ),
                */
              ],
            ),
          ],
        ),
      ),
    );
  }
}
