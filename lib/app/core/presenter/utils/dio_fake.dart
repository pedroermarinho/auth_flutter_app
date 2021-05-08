import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'dio_fake.mocks.dart';

// ignore: avoid_classes_with_only_static_members
@GenerateMocks([Dio])
class DioFake {
  static Dio get instance {
    final jsonResponse = """ 
    {
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9"
    }
    """;
    final dio = MockDio();
    when(dio.post(any, data: anyNamed('data'))).thenAnswer(
      (_) async => Response(
        data: json.decode(jsonResponse),
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      ),
    );
    return dio;
  }
}
