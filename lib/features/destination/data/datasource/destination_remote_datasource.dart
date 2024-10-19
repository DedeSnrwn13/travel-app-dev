import 'dart:convert';

import 'package:travel_app/api/urls.dart';
import 'package:travel_app/core/error/exceptions.dart';
import 'package:travel_app/features/destination/data/models/destionation_model.dart';
import 'package:http/http.dart' as http;

abstract class DestinationRemoteDataSource {
  Future<List<DestinationModel>> all();

  Future<List<DestinationModel>> top();

  Future<List<DestinationModel>> search(String query);
}

class DestionationRemoteDataSourceImpl implements DestinationRemoteDataSource {
  final http.Client client;

  DestionationRemoteDataSourceImpl(this.client);

  @override
  Future<List<DestinationModel>> all() async {
    Uri url = Uri.parse('${URLs.base}/destination/all.php');
    final response = await client.get(url).timeout(const Duration(seconds: 3));

    if (response.statusCode == 200) {
      List list = jsonDecode(response.body);
      return list.map((json) => DestinationModel.fromJson(json)).toList();
    } else if (response.statusCode == 404) {
      Map body = jsonDecode(response.body);
      throw NotFoundException(body['message']);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<DestinationModel>> search(String query) async {
    Uri url = Uri.parse('${URLs.base}/destination/search.php');
    final response = await client.post(url, body: {
      'query': query,
    }).timeout(const Duration(seconds: 3));

    if (response.statusCode == 200) {
      List list = jsonDecode(response.body);
      return list.map((json) => DestinationModel.fromJson(json)).toList();
    } else if (response.statusCode == 404) {
      Map body = jsonDecode(response.body);
      throw NotFoundException(body['message']);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<DestinationModel>> top() async {
    Uri url = Uri.parse('${URLs.base}/destination/top.php');
    final response = await client.get(url).timeout(const Duration(seconds: 3));

    if (response.statusCode == 200) {
      List list = jsonDecode(response.body);
      return list.map((json) => DestinationModel.fromJson(json)).toList();
    } else if (response.statusCode == 404) {
      Map body = jsonDecode(response.body);
      throw NotFoundException(body['message']);
    } else {
      throw ServerException();
    }
  }
}
