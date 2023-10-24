import 'package:flutter/material.dart';

class DrawerHome extends StatefulWidget {
  const DrawerHome({Key? key}) : super(key: key);

  @override
  State<DrawerHome> createState() => _DrawerHomeState();
}

//classe do menu latreal
class _DrawerHomeState extends State<DrawerHome> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          //adcionando um espaço no começo do drawer
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.amber
            ),
            accountName: Text('Nome do Usuário',style: TextStyle(
              color: Colors.black
            ),),
            accountEmail: Text('email@example.com',style: TextStyle(
                color: Colors.black
            ),),
            //avatar
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.person,color: Colors.black),
            ),
          ),
          //botão para voltar a tela de login
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Sair'),
            onTap: () {
              // Ação ao clicar no item do Drawer
              Navigator.of(context).pushNamed('/');
            },
          ),
          // Restante dos itens do Drawer
        ],
      ),
    );
  }
}
