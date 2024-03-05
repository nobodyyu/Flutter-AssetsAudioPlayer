import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/widgets.dart';

enum PlayingBuilderType {
  isPlaying,
  volume,
  currentPosition,
  playSpeed,
  forwardRewindSpeed,
  current,
  loopMode,
  isBuffering,
  realtimePlayingInfos,
  playerState,
}

typedef PlayingWidgetBuilder = Widget Function(
    BuildContext context, bool isPlaying);
typedef LoopModeWidgetBuilder = Widget Function(
    BuildContext context, LoopMode loopMode);
typedef VolumeWidgetBuilder = Widget Function(
    BuildContext context, double volume);
typedef PlaySpeedWidgetBuilder = Widget Function(
    BuildContext context, double playSpeed);
typedef ForwardRewindSpeedWidgetBuilder = Widget Function(
    BuildContext context, double playSpeed);
typedef PositionWidgetBuilder = Widget Function(
    BuildContext context, Duration position);
typedef CurrentWidgetBuilder = Widget Function(
    BuildContext context, Playing playing);
typedef IsBufferingWidgetBuilder = Widget Function(
    BuildContext context, bool isBuffering);
typedef RealtimeWidgetBuilder = Widget Function(
    BuildContext context, RealtimePlayingInfos realtimePlayingInfos);
typedef PlayerStateBuilder = Widget Function(
    BuildContext context, PlayerState playerState);

class PlayerBuilder extends StatefulWidget {
  final AssetsAudioPlayer player;
  final dynamic builder;
  final PlayingBuilderType builderType;

  const PlayerBuilder.isPlaying(
      {Key? key,
      required this.player,
      required PlayingWidgetBuilder this.builder})
      : builderType = PlayingBuilderType.isPlaying,
        super(key: key);

  const PlayerBuilder.isBuffering(
      {Key? key,
      required this.player,
      required PlayingWidgetBuilder this.builder})
      : builderType = PlayingBuilderType.isBuffering,
        super(key: key);

  const PlayerBuilder.loopMode(
      {Key? key,
      required this.player,
      required LoopModeWidgetBuilder this.builder})
      : builderType = PlayingBuilderType.loopMode,
        super(key: key);

  const PlayerBuilder.realtimePlayingInfos(
      {Key? key,
      required this.player,
      required RealtimeWidgetBuilder this.builder})
      : builderType = PlayingBuilderType.realtimePlayingInfos,
        super(key: key);

  const PlayerBuilder.volume(
      {Key? key,
      required this.player,
      required VolumeWidgetBuilder this.builder})
      : builderType = PlayingBuilderType.volume,
        super(key: key);

  const PlayerBuilder.playSpeed(
      {Key? key,
      required this.player,
      required PlaySpeedWidgetBuilder this.builder})
      : builderType = PlayingBuilderType.playSpeed,
        super(key: key);

  const PlayerBuilder.currentPosition(
      {Key? key,
      required this.player,
      required PositionWidgetBuilder this.builder})
      : builderType = PlayingBuilderType.currentPosition,
        super(key: key);

  const PlayerBuilder.forwardRewindSpeed(
      {Key? key,
      required this.player,
      ForwardRewindSpeedWidgetBuilder? this.builder})
      : builderType = PlayingBuilderType.forwardRewindSpeed,
        super(key: key);

  const PlayerBuilder.current(
      {Key? key,
      required this.player,
      required CurrentWidgetBuilder this.builder})
      : builderType = PlayingBuilderType.current,
        super(key: key);

  const PlayerBuilder.playerState(
      {Key? key,
      required this.player,
      required PlayerStateBuilder this.builder})
      : builderType = PlayingBuilderType.playerState,
        super(key: key);

  @override
  PlayerBuilderState createState() => PlayerBuilderState();
}

class PlayerBuilderState extends State<PlayerBuilder> {
  @override
  Widget build(BuildContext context) {
    switch (widget.builderType) {
      case PlayingBuilderType.isPlaying:
        return StreamBuilder(
          stream: widget.player.isPlaying,
          initialData: false,
          builder: (context, snap) {
            return widget.builder(context, snap.data);
          },
        );
      case PlayingBuilderType.isBuffering:
        return StreamBuilder(
          stream: widget.player.isBuffering,
          initialData: false,
          builder: (context, snap) {
            if (snap.hasData) {
              return widget.builder(context, snap.data)!;
            } else {
              return const SizedBox();
            }
          },
        );
      case PlayingBuilderType.loopMode:
        return StreamBuilder(
          stream: widget.player.loopMode,
          initialData: LoopMode.none,
          builder: (context, snap) {
            if (snap.hasData) {
              return widget.builder(context, snap.data)!;
            } else {
              return const SizedBox();
            }
          },
        );
      case PlayingBuilderType.volume:
        return StreamBuilder(
          stream: widget.player.volume,
          initialData: AssetsAudioPlayer.defaultVolume,
          builder: (context, snap) {
            if (snap.hasData) {
              return widget.builder(context, snap.data)!;
            } else {
              return const SizedBox();
            }
          },
        );
      case PlayingBuilderType.currentPosition:
        return StreamBuilder(
          stream: widget.player.currentPosition,
          initialData: Duration.zero,
          builder: (context, snap) {
            if (snap.hasData) {
              return widget.builder(context, snap.data)!;
            } else {
              return const SizedBox();
            }
          },
        );
      case PlayingBuilderType.playSpeed:
        return StreamBuilder(
          stream: widget.player.playSpeed,
          initialData: AssetsAudioPlayer.defaultPlaySpeed,
          builder: (context, snap) {
            if (snap.hasData) {
              return widget.builder(context, snap.data)!;
            } else {
              return const SizedBox();
            }
          },
        );
      case PlayingBuilderType.forwardRewindSpeed:
        return StreamBuilder(
          stream: widget.player.forwardRewindSpeed,
          builder: (context, snap) {
            if (snap.hasData) {
              return widget.builder(context, snap.data)!;
            } else {
              return const SizedBox();
            }
          },
        );
      case PlayingBuilderType.current:
        return StreamBuilder(
          stream: widget.player.current,
          builder: (context, snap) {
            if (snap.hasData) {
              return widget.builder(context, snap.data)!;
            } else {
              return const SizedBox();
            }
          },
        );
      case PlayingBuilderType.realtimePlayingInfos:
        return StreamBuilder(
          stream: widget.player.realtimePlayingInfos,
          builder: (context, snap) {
            if (snap.hasData) {
              return widget.builder(context, snap.data)!;
            } else {
              return const SizedBox();
            }
          },
        );
      case PlayingBuilderType.playerState:
        return StreamBuilder(
          stream: widget.player.playerState,
          initialData: PlayerState.stop,
          builder: (context, snap) {
            if (snap.hasData) {
              return widget.builder(context, snap.data)!;
            } else {
              return const SizedBox();
            }
          },
        );
    }
  }
}

class PlayerGroupBuilder extends StatefulWidget {
  final AssetsAudioPlayerGroup player;
  final dynamic builder;
  final PlayingBuilderType builderType;

  const PlayerGroupBuilder.isPlaying(
      {Key? key,
      required this.player,
      required PlayingWidgetBuilder this.builder})
      : builderType = PlayingBuilderType.isPlaying,
        super(key: key);

  @override
  PlayerBuilderGroupState createState() => PlayerBuilderGroupState();
}

class PlayerBuilderGroupState extends State<PlayerGroupBuilder> {
  @override
  Widget build(BuildContext context) {
    switch (widget.builderType) {
      case PlayingBuilderType.isPlaying:
        return StreamBuilder(
          stream: widget.player.isPlaying,
          initialData: false,
          builder: (context, snap) {
            return widget.builder(context, snap.data);
          },
        );
      default: /* do nothing */
    }
    return const SizedBox();
  }
}
