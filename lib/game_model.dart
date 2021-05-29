class GameModel {
  static const SLIDER_CONST = 50;
  static const SCORE_START = 0;
  static const ROUND_START = 0;

  GameModel(this.target,
      [this.current = SLIDER_CONST,
      this.totalScore = SCORE_START,
      this.round = ROUND_START]);

  late int target;
  late int current;
  late int totalScore;
  late int round;
}
