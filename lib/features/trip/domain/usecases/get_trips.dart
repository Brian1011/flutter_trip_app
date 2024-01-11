import '../entities/trip.dart';
import '../repositories/trip_repository.dart';

class GetTrips {
  final TripRepository repository;

  GetTrips(this.repository);

  Future<Trip> call() {
    return repository.getTrips();
  }
}
