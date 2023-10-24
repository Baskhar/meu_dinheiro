import 'package:flutter/material.dart';




//Tela de logib
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    //controladores de texto, varáveis que vão armazenar o que o usuário digitar
    final controllerEmail = TextEditingController();
    final controllerSenha = TextEditingController();

    //chave de validação dos campos(TextFormField)
    final _formKey = GlobalKey<FormState>();
    //scafold(classe) carrega váris componentes da minha página
    //ex. app bar, botão flutuante, menu lateral, menu em baixo da tela botões e etc..
    return Scaffold(
      //widget resposável por permitir a rolagem
      body: SingleChildScrollView(
        //widget repostável por permitir a validação dos campos
        child: Form(
          //chave de validação
          key: _formKey,
          child: Column(
            children: [
              // Image.asset(
              //   'real.jpg',
              //   height: 100,
              // ),
              //Image.asset('real.jpg'),
              //Widgets que regula a posição dos outros Widgets na tela
              Padding(
                //definindo um espaço de 50 pra cima
                padding: const EdgeInsets.only(top: 50),
                //imagem da net
                child: Image.network(
                  'https://cdn-icons-png.flaticon.com/512/35/35714.png?w=740&t=st=1685061991~exp=1685062591~hmac=71f917dac973ff4fa07dcacbd2127ebf2ae0ab50f7b2d97ce3cd1c329cf62ae5',
                  height: 75,
                ),
              ),
              //wiget que da espaçamento
              SizedBox(
                height: 10,
              ),
              //widget de texto
              Text(
                'Bem vindo!',
                //estilizando o texto
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //widget container, repostável por modelar outros widgets
              Container(
                //distancias laterais
                padding: EdgeInsets.only(left: 50, right: 50),
                child: Column(
                  children: [
                    Container(
                      //colocando cor no Container
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      //campo de texto
                      child: TextFormField(
                        //passando o controller
                        controller: controllerEmail,
                        //definindo o estilo do input do campo
                        decoration: InputDecoration(

                          //nome padrão do campo
                          hintText: 'E-mail',
                          //personalizando borda
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        //validando pra vê se ele está preenchido
                        validator: (Email) {
                          if (Email == null || Email.isEmpty) {
                            return 'Digite seu Email';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        controller: controllerSenha,
                        decoration: InputDecoration(
                          hintText: 'Senha',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (senha) {
                          if (senha == null || senha.isEmpty) {
                            return 'Digite sua Senha';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //botão de acessar
              ElevatedButton(
                //personalizando o botão
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
                    //cor do botao
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      return Colors.amber; // Cor padrão do botão
                    }),
                  ),
                  //ao pressionar o botao
                  onPressed: () {
                    //ele vai validar se todos as validações estão corretas se sim ele vai navegar para a página home
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).pushNamed('/home');
                    }
                  },
                  //texto
                  child: Text(
                    'Acessar',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  )),

              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(bottom: 20),
                child: TextButton(
                  //se o botão for pressionado ele vai pra página de registro
                  onPressed: () {
                    Navigator.of(context).pushNamed('/registro');
                  },
                  child: Text(
                    'Não possuo cadastro',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
