class FlavorConfig {
  final String apiUrl;

  FlavorConfig._({required this.apiUrl});

  static FlavorConfig? _instance;

  static void initialize(String flavor) {
    switch (flavor) {
      case 'dev':
        _instance = FlavorConfig._(apiUrl: "https://api.dev.example.com");
        break;
      case 'qa':
        _instance = FlavorConfig._(apiUrl: "https://api.qa.example.com");
        break;
      case 'uat':
        _instance = FlavorConfig._(apiUrl: "https://api.uat.example.com");
        break;
      default:
        throw Exception("Unknown flavor: $flavor");
    }
  }

  static FlavorConfig get instance => _instance!;
}
