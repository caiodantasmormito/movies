import 'package:get/get.dart';

class RestClient extends GetConnect {
  RestClient() {
    httpClient.baseUrl = 'https://api.themoviedb.org/3';
  }
}

class TokenDB {
  String token = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwMTkyNTEzNWM4ZDliYjdmZjBhZTg4YTRkNTViNzE3OCIsIm5iZiI6MTczMjI5OTk1NS42NzMzNzAxLCJzdWIiOiI2MWU5ZWI3Zjk0NGE1NzAwNDM1N2RhMTQiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.lrIY4jhQkAoGZ2Wuhn9rlJC65fN0kdE1FpDSOJkubI4';
}
