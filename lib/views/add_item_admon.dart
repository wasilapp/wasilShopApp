import 'dart:convert';
import 'package:http/http.dart'as http
;
import '../config/custom_package.dart';

class CategorySubAdminList extends StatefulWidget {
  @override
  _CategorySubAdminListState createState() => _CategorySubAdminListState();
}

class _CategorySubAdminListState extends State<CategorySubAdminList> {


  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var headers = {
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZmE5ODdkOTE1MTkwMmUzNzIxNjlmM2UwYjRlMDVkYWYyM2I2OTcxZThkYjc4YWI5MzdhMWRhOTFmMTVjYmY2YzMzZDJmMzRiYTllNTEwZmMiLCJpYXQiOjE2OTk4NjY2MTIuNTIzNzcsIm5iZiI6MTY5OTg2NjYxMi41MjM3NzMsImV4cCI6MTczMTQ4OTAxMi41MjI2MTMsInN1YiI6IjQiLCJzY29wZXMiOltdfQ.xSYdmibJ1s7Ea5zH0Kucx01hANlHSE32TcuxjQmgktdlWvSlRgvASyFkoNSn7kDJXQSF_h7ogRmPYI9dVejxUPrkD2mcdhO_YCcDTlFWNsGNNkw6IFvMnoCcSf637EBUzHSCfN3iWdxEWrPg3GCNkSXPSID7Y6lcoUnJmKrepkggcsJXhHkYLydutw1Y3RiIxlrfnGWAi2-4cN07_uRM73USSE3h0TUpUAUUACPLvcNN9nfjUQfRpYSpPXYct6FNS9-sLkTXYSKdWWUphrBxoNHvFszG9qTGUq76W7mw954vxn1v5IFcOwBfg8U3nvMPiV-bKkwphT0DngEgEXD6PogIy_FvkPqfp7nLcONrPddd1Pdyy6kxxKLU5WMrWnFpQBVSworGFu2QhQ93ztlvOYGZJRw7pq-eXGEpL-gp0ouZIvgIZ7X9WU4jsKNoLBn3wKirDV2A1gYEEAjET9Z4ToADHYyZCgHHio265pyPCQPT08YX8FUuhOcAbYCBa-0__-W9JwNb-v8GDYUZPoWpSsOfJP3IFIk-WEI4gZwi7tEuexkfRYz4IqlE0KraEV8g-pXrY0wG7DMDS7ZfxrME4D29IMZaSCkP5hu57dCdoy4FMlB3Z5z71DUlMxw4KPTbvkc6ERYfPvUFhK7yoWkH07Ly9_Whp2ucZZko2ww0WAM'
    };
    var request = http.Request('GET', Uri.parse('https://news.wasiljo.com/public/api/v1/manager/categories'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Text('s');

  }
}