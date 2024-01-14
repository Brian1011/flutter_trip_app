import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app_riverpod/features/trip/domain/entities/trip.dart';
import 'package:travel_app_riverpod/features/trip/presentation/providers/trip_provider.dart';

class AddTripScreen extends ConsumerWidget {
  final formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController(text: "City");
  final _descController = TextEditingController(text: "Best city event");
  final _locationController = TextEditingController(text: "Paris");
  final _pictureController = TextEditingController(
      text:
          "https://unsplash.com/photos/a-person-swimming-in-the-ocean-with-a-camera-NhWxAIs61MM");
  List<String> pictures = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _titleController,
            decoration: const InputDecoration(label: Text('Title')),
          ),
          TextFormField(
            controller: _descController,
            decoration: const InputDecoration(label: Text('Description')),
          ),
          TextFormField(
            controller: _locationController,
            decoration: const InputDecoration(label: Text('Location')),
          ),
          TextFormField(
            controller: _pictureController,
            decoration: const InputDecoration(label: Text('Photo')),
          ),
          ElevatedButton(
              onPressed: () {
                pictures.add(_pictureController.text);
                if (formKey.currentState!.validate()) {
                  final newTrip = Trip(
                      title: _titleController.text,
                      photos: pictures,
                      description: _descController.text,
                      date: DateTime.now(),
                      location: _locationController.text);
                  ref
                      .read(tripListNotifierProvider.notifier)
                      .addNewTrip(newTrip);
                  ref.watch(tripListNotifierProvider.notifier).loadTrips();
                }
              },
              child: Text("Add trip"))
        ],
      ),
    );
  }
}
