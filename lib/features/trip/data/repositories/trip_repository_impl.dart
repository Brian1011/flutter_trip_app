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
  Future<List<Trip>> getTrips() async {
    final tripModels = localDataSource.getTrips();
    List<Trip> trips = tripModels.map((model) => model.toEntity()).toList();
    return trips;
  }
}
