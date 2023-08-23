/// Environment variables and shared app constants.
abstract class Constants {
  static const String stytchProjectId = String.fromEnvironment(
    'STYTCH_PROJECT_ID',
    defaultValue: '',
  );

  static const String stytchSecret = String.fromEnvironment(
    'STYTCH_SECRET',
    defaultValue: '',
  );
}
