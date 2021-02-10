import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

enum ServerStatus { Online, Offline, Connecting }

class SocketSetvice with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket _socket;

  ServerStatus get serverStatus => this._serverStatus;
  IO.Socket get socket => this._socket;

  SocketSetvice() {
    _initConfing();
  }

  void _initConfing() {
    try {
      this._socket = IO.io('https://flutter-socket-io-server.herokuapp.com/', {
        'transports': ['websocket'],
        'autoConnect': false,
      });

      this._socket.connect();

      this._socket.on('connect', (_) {
        print('connect');
        this._serverStatus = ServerStatus.Online;
        notifyListeners();
      });

      socket.on('disconnect', (_) {
        print('disconnect');
        this._serverStatus = ServerStatus.Offline;
        notifyListeners();
      });

      socket.on('nuevo-mensaje', (payload) {
        print('nuevo-mensaje: $payload');
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
