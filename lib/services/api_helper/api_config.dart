class ApiConfig {
  final String BASE_URl = 'http://bees.az/api/pad/?lang=ru&action=';

  String LOGIN(String login, String password) =>
      '${BASE_URl}login&login=${login}&pass=${password}';

  String ORDER_LIST(String token, String time, String id) => time == null
      ? '${BASE_URl}orderlist&token=${token}'
      : '${BASE_URl}orderlist&token=${token}&time=${time}&approve=${id}';

  String CHANGE_STATUS(String token, String id) =>
      '${BASE_URl}orderlist&token=${token}&change=${id}';

  //on off restourant
  String ON_OFF(String token) => '${BASE_URl}onoff&token=${token}';

  //report
  String REPORT(String token) => '${BASE_URl}report&token=${token}';

  //stopList
  String STOP_LIST(String token) => '${BASE_URl}stoplist&token=${token}';

  //stopList on off items
  String STOP_LIST_ONOFF(String fid, String token) =>
      '${BASE_URl}stoplistonoff&fid=${fid}&token=${token}';
}
