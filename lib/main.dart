import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';
import 'package:projeto_perguntas/resultado.dart';

void main() => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;
  void _responder() {
    if (_exibirPergunta) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  final List<Map<String, dynamic>> _perguntas = const [
    {
      "pergunta": 'Qual sua cor favorida?',
      "respostas": ['Preto', 'Vermelho', 'Verde', 'Branco'],
    },
    {
      "pergunta": 'Qual seu animal favorito?',
      "respostas": ['Coelho', 'Cobra', 'Elefante', 'Leão'],
    },
  ];

  bool get _exibirPergunta {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> respostas = _exibirPergunta
        ? _perguntas[_perguntaSelecionada]['respostas']
            .map<Widget>((resposta) => Resposta(resposta, _responder))
            .toList()
        : [];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          centerTitle: true,
          title: const Text('Perguntas'),
        ),
        body: _exibirPergunta
            ? Column(
                children: [
                  Questao(_perguntas[_perguntaSelecionada]['pergunta']),
                  ...respostas,
                  // Resposta('Resposta 1', () {
                  //   setState(() {
                  //     _perguntaSelecionada++;
                  //   });
                  // }),
                  // Resposta('Resposta 2', () => _responder()),
                  // Resposta('Resposta 3', _responder),
                ],
              )
            : const Resultado(),
      ),
    );
  }
}
