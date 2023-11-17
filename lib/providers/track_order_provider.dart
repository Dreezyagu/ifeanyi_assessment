import 'package:ably_flutter/ably_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TrackOrderProvider extends StateNotifier<int> {
  TrackOrderProvider(super.state);

  setUpAbly(VoidCallback refresh) {
    final clientOptions = ClientOptions(
        key: 'zZgLiw.TgBwTw:9m1QhhlD1AgAjhnFA8BA-CpfM0ZX6gvDAvlhUzmkSAw');
    Realtime realtime = Realtime(options: clientOptions);
    realtime.connection
        .on(ConnectionEvent.connected)
        .listen((ConnectionStateChange stateChange) async {
      final channel = realtime.channels.get("eden_ifeanyi");

      final messageStream = channel.subscribe();
      messageStream.listen((Message event) {
        late int? newIndex;
        try {
          newIndex = int.parse(event.data.toString());
        } catch (e) {
          newIndex = null;
        }
        if (newIndex != null && (newIndex - 1) == state) {
          state = newIndex;
        }
      });

      // Handle connection state change events
    });
  }
}

final trackOrderProvider =
    StateNotifierProvider<TrackOrderProvider, int>((ref) {
  return TrackOrderProvider(0);
});
