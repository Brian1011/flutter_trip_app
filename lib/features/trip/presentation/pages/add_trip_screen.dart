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
          "https://images.unsplash.com/photo-1510074232337-05d50fa189ba?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
  List<String> pictures = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.all(15),
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
              child: const Text("Add trip"),
            )
          ],
        ),
      ),
    );
  }
}
