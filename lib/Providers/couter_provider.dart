// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterState {
  int wor = 0;
  int gro = 0;
  int dail = 0;
  int pro = 0;

  CounterState copyWith({
    bool? isLoading,
  }) {
    return CounterState();
  }
}

class SignupNotifier extends Notifier<CounterState> {
  void setIsLoading() {
    //final isloading = state.isLoading;
    state = state.copyWith(isLoading: false);
  }

  void getCategoryCounts() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot works = await firestore
        .collection('Tasks')
        .where('taskCategory', isEqualTo: 'work')
        .get();
    CounterState().wor = works.size;

    QuerySnapshot projects = await firestore
        .collection('Tasks')
        .where('taskCategory', isEqualTo: 'projects')
        .get();
    CounterState().pro = projects.size;

    QuerySnapshot dailytask = await firestore
        .collection('Tasks')
        .where('taskCategory', isEqualTo: 'dailytasks')
        .get();
    CounterState().dail = dailytask.size;

    QuerySnapshot groceries = await firestore
        .collection('Tasks')
        .where('taskCategory', isEqualTo: 'groceries')
        .get();
    CounterState().gro = groceries.size;
  }

  @override
  CounterState build() {
    throw UnimplementedError();
  }
}

final counterprovider =
    NotifierProvider<SignupNotifier, CounterState>(SignupNotifier.new);
