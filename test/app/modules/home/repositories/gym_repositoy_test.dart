import 'package:desafio_smartfit/app/modules/home/models/gym_model.dart';
import 'package:desafio_smartfit/app/modules/home/repositories/gym_repositoy.dart';
import 'package:desafio_smartfit/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDio extends Mock implements Dio {}

void main() {
  final mockDio = MockDio();

  test('getGyms returns a list of gyms', () async {
    // Mock response from the API
    when(mockDio.get(Constants.apiUrl)).thenAnswer((_) async => Response(data: {
          'locations': [
            {
              "id": 10998878976097,
              "title": "Dom Severino",
              "content":
                  "\n<p>Av. Dom Severino, 1733 &#8211; Fátima<br>Teresina, PI</p>\n",
              "opened": true,
              "mask": "required",
              "towel": "required",
              "fountain": "partial",
              "locker_room": "allowed",
              "schedules": [
                {"weekdays": "Seg. à Sex.", "hour": "06h às 22h"},
                {"weekdays": "Sáb.", "hour": "Fechada"},
                {"weekdays": "Dom.", "hour": "Fechada"}
              ]
            },
          ]
        }, statusCode: 200, requestOptions: RequestOptions()));

    final repository = GymRepository();
    final gyms = await repository.getGyms();

    expect(gyms, isA<List<GymModel>>());
    //expect(gyms.length, 2);
    expect(gyms[0].name, 'Dom Severino');
    expect(gyms[0].content,
        '\n<p>Av. Dom Severino, 1733 &#8211; Fátima<br>Teresina, PI</p>\n');
  });
}
