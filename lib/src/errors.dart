import 'assets_audio_player.dart';
import 'player_group.dart';

enum AssetsAudioPlayerErrorType { network, player }

class ErrorHandler {
  final AssetsAudioPlayerError error;
  final AssetsAudioPlayer player;
  final Duration? currentPosition;
  final Playlist? playlist;
  final int? playlistIndex;

  const ErrorHandler({
    required this.error,
    required this.player,
    this.currentPosition,
    this.playlist,
    this.playlistIndex,
  });
}

typedef AssetsAudioPlayerErrorHandler = Function(ErrorHandler errorHandler);
typedef AssetsAudioPlayerGroupErrorHandler = Function(
    AssetsAudioPlayerGroup group, ErrorHandler errorHandler);

AssetsAudioPlayerErrorType parseAssetsAudioPlayerErrorType(String type) {
  switch (type) {
    case 'network':
      return AssetsAudioPlayerErrorType.network;
    default:
      return AssetsAudioPlayerErrorType.player;
  }
}

class AssetsAudioPlayerError {
  final AssetsAudioPlayerErrorType errorType;
  final String message;

  const AssetsAudioPlayerError({
    required this.errorType,
    required this.message,
  });

  @override
  String toString() {
    return 'AssetsAudioPlayerError{errorType: $errorType, message: $message}';
  }
}
