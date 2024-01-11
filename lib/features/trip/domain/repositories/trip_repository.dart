import '../entities/trip.dart';

abstract class TripRepository {
  Future<Trip> getTrips();
  Future<void> addTrip();
  Future<void> deleteTrip();
}
