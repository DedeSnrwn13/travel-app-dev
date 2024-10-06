import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:travel_app/core/error/exceptions.dart';
import 'package:travel_app/core/error/failures.dart';
import 'package:travel_app/core/platform/network_info.dart';
import 'package:travel_app/features/destination/data/datasource/destination_local_datasource.dart';
import 'package:travel_app/features/destination/data/datasource/destination_remote_datasource.dart';
import 'package:travel_app/features/destination/domain/entities/destination_entity.dart';
import 'package:travel_app/features/destination/domain/repositories/destination_repository.dart';

class DestinationRepositoryImpl implements DestinationRepository {
  final NetworkInfo networkInfo;
  final DestinationLocalDataSource localDatasource;
  final DestinationRemoteDataSource remoteDatasource;

  DestinationRepositoryImpl({
    required this.networkInfo,
    required this.localDatasource,
    required this.remoteDatasource,
  });

  @override
  Future<Either<Failure, List<DestinationEntity>>> all() async {
    bool online = await networkInfo.isConnected();
    print('Online: $online');

    if (online) {
      try {
        final result = await remoteDatasource.all();
        await localDatasource.cacheAll(result);
        return Right(result.map((e) => e.toEntity).toList());
      } on TimeoutException {
        return const Left(TimeoutFailure(message: 'Timeout. No Response'));
      } on NotFoundException {
        return const Left(NotFoundFailure(message: 'Data Not Found'));
      } on ServerException {
        return const Left(ServerFailure(message: 'Server Error'));
      }
    } else {
      try {
        final result = await localDatasource.getAll();
        return Right(result.map((e) => e.toEntity).toList());
      } on CachedException {
        return const Left(CachedFailure(message: 'Data is note Present'));
      }
    }
  }

  @override
  Future<Either<Failure, List<DestinationEntity>>> search(String query) async {
    try {
      final result = await remoteDatasource.search(query);
      return Right(result.map((e) => e.toEntity).toList());
    } on TimeoutException {
      return const Left(TimeoutFailure(message: 'Timeout. No Response'));
    } on NotFoundException {
      return const Left(NotFoundFailure(message: 'Data Not Found'));
    } on ServerException {
      return const Left(ServerFailure(message: 'Server Error'));
    } on SocketException {
      return const Left(ConnectionFailure(message: 'Failed Connect to the Network'));
    }
  }

  @override
  Future<Either<Failure, List<DestinationEntity>>> top() async {
    try {
      final result = await remoteDatasource.top();
      return Right(result.map((e) => e.toEntity).toList());
    } on TimeoutException {
      return const Left(TimeoutFailure(message: 'Timeout. No Response'));
    } on NotFoundException {
      return const Left(NotFoundFailure(message: 'Data Not Found'));
    } on ServerException {
      return const Left(ServerFailure(message: 'Server Error'));
    } on SocketException {
      return const Left(ConnectionFailure(message: 'Failed Connect to the Network'));
    }
  }
}
