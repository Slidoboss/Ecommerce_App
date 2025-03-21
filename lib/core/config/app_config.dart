class AppConfig {
  
 const AppConfig({
    required this.apikeyAndroid,
    required this.apikeyIos,
    required this.androidAppId,
    required this.iosAppID,
    required this.messagingSenderId,
    required this.projectId,
    required this.storageBucket,
    required this.iosBundleId,
  });

  final String apikeyAndroid;
  final String apikeyIos;
  final String androidAppId;
  final String iosAppID;
  final String messagingSenderId;
  final String projectId;
  final String storageBucket;
  final String iosBundleId;
}
