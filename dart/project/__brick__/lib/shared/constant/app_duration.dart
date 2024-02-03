/// Standard durations used across the app
class AppDuration {
  AppDuration._();

  /// 80 milliseconds
  static const xs = 80;

  /// 150 milliseconds
  static const s = 150;

  /// 300 milliseconds
  static const m = 300;

  /// 500 milliseconds
  static const l = 500;

  /// 1000 milliseconds
  static const xl = 1000;
}

/// Custom constructor for a [Duration] instance using [AppDuration.xs]
class ExtraShortDuration extends Duration {
  /// Construct a [Duration] instance with [AppDuration.xs] milliseconds
  const ExtraShortDuration() : super(milliseconds: AppDuration.xs);
}

/// Custom constructor for a [Duration] instance using [Durations.s]
class ShortDuration extends Duration {
  /// Construct a [Duration] instance with [Durations.s] milliseconds
  const ShortDuration() : super(milliseconds: AppDuration.s);
}

/// Custom constructor for a [Duration] instance using [Durations.m]
class MediumDuration extends Duration {
  /// Construct a [Duration] instance with [Durations.m] milliseconds
  const MediumDuration() : super(milliseconds: AppDuration.m);
}

/// Custom constructor for a [Duration] instance using [Durations.l]
class LongDuration extends Duration {
  /// Construct a [Duration] instance with [Durations.l] milliseconds
  const LongDuration() : super(milliseconds: AppDuration.l);
}

/// Custom constructor for a [Duration] instance using [Durations.xl]
class ExtraLongDuration extends Duration {
  /// Construct a [Duration] instance with [Durations.xl] milliseconds
  const ExtraLongDuration() : super(milliseconds: AppDuration.xl);
}
