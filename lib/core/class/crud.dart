
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../function/checkinternet.dart';
import 'api_keys.dart';
import 'statuscode.dart';

Map<String, String> myheaders = {
  'Authorization': "Bearer ${ApiKeys.stripSecreteKey}"
};

class Crud {
  final Dio dio = Dio();
  // Future<Either<StatusRequest, Map>> getData(String url, Map data) async {
  //   try {
  //     if (await checkInternetConnection()) {
  //       var response = await http.get(Uri.parse(url));
  //       if (response.statusCode == 200) {
  //         Map responsebody = jsonDecode(response.body);
  //         return right(responsebody);
  //       } else {
  //         return left(StatusRequest.serverFailure);
  //       }
  //     } else {
  //       return left(StatusRequest.offlineFailure);
  //     }
  //   } catch (e) {
  //     return left(StatusRequest.serverFailure);
  //   }
  // }

  Future<Either<StatusRequest, Map>> postData(
      {required String url, required data, String? contentType}) async {
    try {
      if (await checkInternetConnection()) {
        var response = await dio.post(url,
            data: data,
            options: Options(contentType: contentType, headers: myheaders));

        if (response.statusCode == 200) {
          var responsebody = response.data;
          return right(responsebody);
        } else {
          return left(StatusRequest.serverFailure);
        }
      } else {
        return left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      return left(StatusRequest.exceptionFailure);
    }
  }
}
