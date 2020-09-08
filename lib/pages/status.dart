import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:band_name/services/socket_service.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);
    // socketService.socket.emit('event')
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SERVER STATUS: ${socketService.serverStatus}',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          socketService.emit('emitir-mensaje',{
            'mensaje': 'Mensaje desde flutter'
          });
        },
        child: Icon(Icons.message),
      ),
    );
  }
}
