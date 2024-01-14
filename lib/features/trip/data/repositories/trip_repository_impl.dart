import 'package:dartz/dartz.dart';
import 'package:travel_app_riverpod/core/error/failures.dart';
import 'package:travel_app_riverpod/features/trip/domain/entities/trip.dart';

import '../../domain/repositories/trip_repository.dart';
import '../datasources/trip_local_datasource.dart';
import '../models/trip_model.dart';

class TripRepositoryImpl implements TripRepository {
  final TripLocalDataSource localDataSource;

  TripRepositoryImpl({required this.localDataSource});

  @override
  Future<void> addTrip({required Trip trip}) async {
    final tripModel = TripModel.fromEntity(trip);
    localDataSource.addTrip(trip: tripModel);
  }

  @override
  Future<void> deleteTrip({required int index}) async {
    localDataSource.deleteTrip(index);
  }

  @override
  Future<Either<Failure, List<Trip>>> getTrips() async {
    try {
      final tripModels = localDataSource.getTrips();
      List<Trip> trips = tripModels.map((model) => model.toEntity()).toList();
      return Right(trips);
    } catch (err) {
      return Left(SomeSpecificError(err.toString()));
    }
  }
}
