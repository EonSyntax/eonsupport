/// Abstract placeholder for remote input injection (touch/keyboard) service.
/// Will be implemented natively and wired through platform channels later.
abstract class RemoteInputService {
  /// Send a tap event to the remote device at (x,y).
  Future<void> sendTap(double x, double y);

  /// Send a key event (text) to the remote device.
  Future<void> sendText(String text);

  /// Clear any injected input state.
  Future<void> resetInputState();
}
