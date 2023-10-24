import 'package:flutter/material.dart';



class RegistroPage extends StatefulWidget {
  const RegistroPage({Key? key}) : super(key: key);

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final controllerNome = TextEditingController();
  final controllerData = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerSenha = TextEditingController();
  final controllerConfSenha = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    //ao sair da tela eu removo esses controlladores
    controllerNome.dispose();
    controllerData.dispose();
    controllerEmail.dispose();
    controllerSenha.dispose();
    controllerConfSenha.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        //cor da app bar
        backgroundColor: Colors.white,
        //cor dos componentes dela
        iconTheme: IconThemeData(
          color: Colors.black, // Define a cor desejada para o ícone de voltar
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Image.asset(
              //   'real.jpg',
              //   height: 100,
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image.network(
                  'https://cdn-icons-png.flaticon.com/512/35/35714.png?w=740&t=st=1685061991~exp=1685062591~hmac=71f917dac973ff4fa07dcacbd2127ebf2ae0ab50f7b2d97ce3cd1c329cf62ae5',
                  height: 75,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Fale sobre você',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        controller: controllerNome,
                        decoration: InputDecoration(
                          labelText: 'Nome',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (nome) {
                          if (nome == null || nome.isEmpty) {
                            return 'Digite seu nome';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        controller: controllerData,
                        decoration: InputDecoration(
                          labelText: 'Data de Nascimento',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (data) {
                          if (data == null || data.isEmpty) {
                            return 'Digite sua data de nascimento';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        controller: controllerEmail,
                        decoration: InputDecoration(
                          labelText: 'E-mail',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Digite seu e-mail';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        controller: controllerSenha,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (senha) {
                          if (senha == null || senha.isEmpty) {
                            if (senha != controllerConfSenha.text) {
                              return 'As senhas não coincidem';
                            }
                            return 'Digite sua senha';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        controller: controllerConfSenha,
                        decoration: InputDecoration(
                          labelText: 'Confirmar senha',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (confsenha) {
                          if (confsenha == null || confsenha.isEmpty) {
                            if (confsenha != controllerSenha.text) {
                              return 'As senhas não coincidem';
                            }
                            return 'Digite sua senha';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10), // Define o raio de borda desejado
                    ),
                  ), // Define a largura e a cor da borda,
                  padding:
                      MaterialStateProperty.resolveWith<EdgeInsetsGeometry?>(
                          (Set<MaterialState> states) {
                    return EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 100); // Padding padrão do botão
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    return Colors.amber; // Cor padrão do botão
                  }),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    //nevega para a tela login
                    Navigator.of(context).pushNamed('/');
                  }
                },
                child: Text('Cadastrar',style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
