import '../../data/repositories/local_preferences.dart';

class Authentication {
  final _sharedPreferences = LocalPreferences();

  Future<bool> get init async =>
      await _sharedPreferences.retrieveData<bool>('logged') ?? false;

  Future<bool> login(user, password) async {

    if (user == await _sharedPreferences.retrieveData<String>('user') && password == await _sharedPreferences.retrieveData<String>('password')) {
      await _sharedPreferences.storeData<bool>('logged', true);
      return Future.value(true);
    }

    return Future.value(false);
  }

  Future<bool> signup(user, password) async {
    // almancenar user y password
    await _sharedPreferences.storeData<String>('user', user);
    await _sharedPreferences.storeData<String>('password', password);
    return true;
  }

  void logout() async {
    // cambiar loggeed
    await _sharedPreferences.storeData<bool>('logged', false);
  }
}
