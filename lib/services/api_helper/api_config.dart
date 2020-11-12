class ApiConfig {
  final String BASE_URl = 'http://bees.az/api/pad/?lang=ru&action=';

  String LOGIN(String login, String password) =>
      '${BASE_URl}+login&login=${login}&pass=${password}';
}
