import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

class AgendamentoScreen extends StatelessWidget {

TextEditingController _nomeController = TextEditingController();
TextEditingController _atendimentoController = TextEditingController();
TextEditingController _dataController = TextEditingController();


  Future main() async {
    // Open a connection (testdb should already exist)
    final conn = await MySqlConnection.connect(new ConnectionSettings(
        host: 'sql289.main-hosting.eu', port: 3306, user: 'u803615858_gxfisio', password: 'gxfisio', db: 'u803615858_gxfisio'));

    // Create a table
    /*await conn.query(
        'CREATE TABLE users (id int NOT NULL AUTO_INCREMENT PRIMARY KEY, '
            'name varchar(255), email varchar(255), age int)');*/
// INSERT INTO `agendamentos`( `idpaciente`, `tipoAtendimento`,  `dataInicio`) VALUES ((select idpaciente FROM pacientes WHERE nome = 'Danilo'), 'Consulta', '2019-12-12');
    // Insert some data
    var result = await conn.query(
        'insert into agendamentos (idpaciente, tipoAtendimento, dataInicio) values ((select idpaciente FROM pacientes WHERE nome = ?), ?, ?)',
        [_nomeController.text, _atendimentoController.text, _dataController.text]);
    print("Inserted row id=${result.insertId}");

    /*
    // Query the database using a parameterized query
    var results = await conn
        .query('select name, email from users where id = ?', [result.insertId]);
    for (var row in results) {
      print('Name: ${row[0]}, email: ${row[1]}');
    }
*/
    // Finally, close the connection
    await conn.close();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Agendamento Paciente'),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Form(

          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: <Widget>[
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person),
                  hintText: 'Digite o Nome do Paciente',
                  labelText: 'Nome',
                ),
              ),
              TextFormField(
                controller: _atendimentoController,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.content_copy),
                  hintText: 'Digite o Tipo do Atendimento',
                  labelText: 'Atendimento',
                ),
              ),
              TextFormField(
                controller: _dataController,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.calendar_today),
                  hintText: 'Data da consulta',
                  labelText: 'Data',
                ),

              ),

              Container(
                padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                child: RaisedButton(
                  child: Text('Enviar'),
                  onPressed: (){

                    main();

                  },
                ),
              )
            ],
          ),
        ),
      ),
    );

  }
}
