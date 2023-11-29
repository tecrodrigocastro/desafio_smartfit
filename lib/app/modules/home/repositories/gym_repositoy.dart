import 'dart:async';

import 'package:desafio_smartfit/app/modules/home/models/gym_model.dart';
import 'package:desafio_smartfit/core/utils/constants.dart';
import 'package:dio/dio.dart';

class GymRepository {
  Future<List<GymModel>> getGyms() async {
    final response = await Dio().get(Constants.apiUrl);
    final gyms = (response.data['locations'] as List)
        .map((item) => GymModel.fromMap(item))
        .toList();

    return gyms;
  }
}
