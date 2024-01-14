import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/trip_provider.dart';

class MyTripScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripsList = ref.watch(tripListNotifierProvider);
    print('trip : $tripsList');
    return ListView.builder(
        itemCount: tripsList.length,
        itemBuilder: (context, index) {
          final trip = tripsList[index];
          return Text(trip.title);
        });
  }
}
