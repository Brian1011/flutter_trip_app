import '../entities/trip.dart';

abstract class TripRepository {
  Future<List<Trip>> getTrips();
  Future<void> addTrip({required Trip trip});
  Future<void> deleteTrip({required int index});
}