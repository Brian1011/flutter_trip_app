import '../repositories/trip_repository.dart';

class DeleteTrip {
  final TripRepository repository;

  DeleteTrip(this.repository);

  Future<void> call({required int index}) {
    return repository.deleteTrip(index: index);
  }
}
