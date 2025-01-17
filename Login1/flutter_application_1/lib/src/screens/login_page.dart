import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/connection/server_controller.dart';
//import 'package:flutter_modulo1_fake_backend/user.dart';

class LoginPage extends StatefulWidget {
//  ServerController serverController;
//  BuildContext context;

//  LoginPage(this.serverController, this.context, {Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _loading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String userName = '';
  String password = '';

  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Stack: nos permite apilar un widget sobre otro
      body: Form(
        key: _formKey,
        child: Stack(
          children: <Widget>[
            Container(
              //double.infinity: para que ocupe todo el ancho que pueda.
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 50),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.cyan[300]!,
                    Colors.cyan[800]!,
                  ],
                ),
              ),
              child: Image.asset(
                'assets/logo.jpeg',
                height: 200,
              ),
            ),
            Center(
              //SingleChildScrollView: para que nos permita deslizar el card para visualizar las opciones
              child: SingleChildScrollView(
                child: Card(
                  elevation: 2,
                  //shape: nos permite cambiar el borde de la card
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 260, bottom: 20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 10),
                    child: Column(
                      //mainAxisSize: MainAxisSize.min: Para que el card no ocupe todo el espacio disponible
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Usuario:',
                          ),
                          onSaved: (value) {
                            userName = value!;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Este campo es obligatorio';
                            }
                          },
                        ),
                        SizedBox(height: 40),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Contraseña:'),
                          //obscureText: true: para ocultar el texto
                          obscureText: true,
                          onSaved: (value) {
                            password = value!;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Este campo es obligatorio';
                            }
                          },
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Theme(
                          data: Theme.of(context)
                              .copyWith(accentColor: Colors.white),
                          child: RaisedButton(
                            color: Theme.of(context).primaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            textColor: Colors.white,
                            onPressed: () => _login(context),
                            child: Row(
                              //Para que el texto se centre
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Iniciar sesión'),
                                //Si la variable _loading es verdadero, se ejecuta la instrucción
                                if (_loading)
                                  Container(
                                    height: 20,
                                    width: 20,
                                    margin: const EdgeInsets.only(left: 20),
                                    //CircularProgressIndicator(): para que muestre un circulo de cargando
                                    child: CircularProgressIndicator(),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        if (_errorMessage.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              _errorMessage,
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('¿No estas registrado?'),
                            FlatButton(
                              textColor: Theme.of(context).primaryColor,
                              child: Text('Registrarse'),
                              onPressed: () => _showRegister(context),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Al hacer click en el botón el loading cambiara a true
  //si la variable _loading es falso, lo convertira a verdadero cuando se haga click en el boton
  void _login(BuildContext context) async {
    if (!_loading) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        setState(() {
          _loading = true;
          _errorMessage = '';
        });
//      User user = await widget.serverController.login(userName, password);
        /*if (user != null) {
        Navigator.of(context).pushReplacementNamed('/home', arguments: user);
      } else {
        setState(() {
          _errorMessage = 'Usuario o contraseña incorrecta';
          _loading = false;
        });
      }*/
      }
    }
  }

  _showRegister(BuildContext context) {
    Navigator.of(context).pushNamed('/registrar');
  }

  @override
  void initState() {
    super.initState();
    //  widget.serverController.init(widget.context);
  }
}
