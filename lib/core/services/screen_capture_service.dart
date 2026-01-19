/// Abstract placeholder for screen capture functionality.
/// Native implementation (Android) will be provided later and exposed
/// to Flutter via platform channels. Keep this interface lightweight
/// and focused on intent; do not implement native logic here.
abstract class ScreenCaptureService {
  /// Start capturing the remote screen. Returns true if started.
  Future<bool> startCapture();

  /// Stop capturing the remote screen.
  Future<void> stopCapture();

  /// Whether a capture session is active.
  bool get isCapturing;
}
