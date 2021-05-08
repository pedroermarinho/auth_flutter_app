import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'register_controller.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState
    extends ModularState<RegisterPage, RegisterController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Cadastro"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Observer(
                  builder: (_) => TextField(
                    decoration: InputDecoration(
                      labelText: "Nome",
                      errorText: controller.isValidName,
                    ),
                    onChanged: controller.setName,
                  ),
                ),
                Observer(
                  builder: (_) => TextField(
                    decoration: InputDecoration(
                      labelText: "Nome de Usuario",
                      errorText: controller.isValidUsername,
                    ),
                    onChanged: controller.setUsername,
                  ),
                ),
                Observer(
                  builder: (_) => TextField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      errorText: controller.isValidEmail,
                    ),
                    onChanged: controller.setEmail,
                  ),
                ),
                Observer(
                  builder: (_) => TextField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      errorText: controller.isValidPassword,
                    ),
                    onChanged: controller.setPassword,
                  ),
                ),
                Observer(
                  builder: (_) => TextField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: "Digite a senha novamente",
                      errorText: controller.isValidPassword2,
                    ),
                    onChanged: controller.setPassword2,
                  ),
                ),
                SizedBox(height: 40),
                TextButton(
                  onPressed: controller.onRegister,
                  child: Text("CADASTRE-SE"),
                ),
              ],
            ),
          ),
        ),
      );
}
