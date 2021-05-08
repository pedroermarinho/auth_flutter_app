import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import '../../domain/errors/storege_errors.dart';
import '../../infra/drivers/storage_driver.dart';
import '../../presenter/utils/constants.dart';

class HiveStorageDriver implements StorageDriver {
  late Box _box;

  @override
  Future<Either<StorageFailure, Unit>> clear() async {
    try {
      _box.clear();
      return Right(unit);
    } on Exception catch (e) {
      print(e);
      return Left(ErrorClearStorage(message: "Error ao limpar os dados"));
    }
  }

  HiveStorageDriver() {
    _box = Hive.box(Constants.keyBox);
  }

  @override
  Future<Either<StorageFailure, bool>> containsKey(String key) async {
    try {
      final result = _box.containsKey(key);

      return Right(result);
    } on Exception catch (e) {
      print(e);
      return Left(
          ErrorContainsKeyStorage(message: "Error ao Procurar a chave"));
    }
  }

  @override
  Future<Either<StorageFailure, String>> get(String key) async {
    try {
      final String? result = _box.get(key);
      if (result != null) {
        return Right(result);
      }
      return Left(
          ErrorContainsKeyStorage(message: "Error ao Procurar a chave"));
    } on Exception catch (e) {
      print(e);
      return Left(
          ErrorContainsKeyStorage(message: "Error ao Procurar a chave"));
    }
  }

  @override
  Future<Either<StorageFailure, Unit>> put(String key, dynamic value) async {
    try {
      _box.put(key, value);
      return Right(unit);
    } on Exception catch (e) {
      print(e);
      return Left(ErrorPutStorage(message: "Error ao inserir os dados"));
    }
  }

  @override
  Future<Either<StorageFailure, Unit>> remove(String key) async {
    try {
      _box.delete(key);
      return Right(unit);
    } on Exception catch (e) {
      print(e);
      return Left(
          ErrorRemoveStorage(message: "Error ao remover os dados da chave"));
    }
  }
}
