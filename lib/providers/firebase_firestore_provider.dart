import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseFirestoreProvider = Provider((ref) {
  return FirebaseFirestore.instance;
});
