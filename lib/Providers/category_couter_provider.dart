// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryCounts {
  int? work = 0;
  int? projects = 0;
  int? dailyTasks = 0;
  int? groceries = 0;

  CategoryCounts({
    this.work,
    this.projects,
    this.dailyTasks,
    this.groceries,
  });

  @override
  String toString() {
    return 'CategoryCounts(work: $work, projects: $projects, dailyTasks: $dailyTasks, groceries: $groceries)';
  }

  CategoryCounts copyWith({
    int? work,
    int? projects,
    int? dailyTasks,
    int? groceries,
  }) {
    return CategoryCounts(
      work: work ?? this.work,
      projects: projects ?? this.projects,
      dailyTasks: dailyTasks ?? this.dailyTasks,
      groceries: groceries ?? this.groceries,
    );
  }
}

class CategoryCountsNotifier extends StateNotifier<CategoryCounts> {
  CategoryCountsNotifier()
      : super(
            CategoryCounts(work: 0, projects: 0, dailyTasks: 0, groceries: 0));

  void updateCategoryCountsFromFirestore() {
    FirebaseFirestore.instance
        .collection('Tasks')
        .snapshots()
        .listen((snapshot) {
      int workCount = 0;
      int projectCount = 0;
      int dailyTaskCount = 0;
      int groceriesCount = 0;

      snapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data();
        String category = data['taskCategory'];

        switch (category) {
          case 'work':
            workCount++;

            break;
          case 'projects':
            projectCount++;
            break;
          case 'dailytasks':
            dailyTaskCount++;
            break;
          case 'groceries':
            groceriesCount++;
            break;
        }
      });

      state = CategoryCounts(
        work: workCount,
        projects: projectCount,
        dailyTasks: dailyTaskCount,
        groceries: groceriesCount,
      );
    });
  }
}

final categoryCountsProvider =
    StateNotifierProvider<CategoryCountsNotifier, CategoryCounts>((ref) {
  return CategoryCountsNotifier();
});
