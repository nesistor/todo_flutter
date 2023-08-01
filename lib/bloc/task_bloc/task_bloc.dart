/*import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo_flutter/model/task_model.dart';
import 'package:todo_flutter/bloc/task_bloc/repository/task_repository.dart';

part 'task_event.dart';
part 'task_event.dart';

class TaskpageBloc extends Bloc<TaskpageEvent, TaskpageState> {
  late TaskPageModel data;
  final TaskPageRepo homePageRepo;
  String ?errorMessage;

  TaskpageBloc(this.homePageRepo) : super(TaskpageInitial()) {
    on<TaskpageEvent>((event, emit) async {
      if (event is SendData) {
        emit(TaskpageLoading());
        try {
          data = await homePageRepo.fetchDetails(
            event.id,
            event.title,
            event.description,
            event.sharedTo,
          );
          emit(TaskpageLoaded(data));
        } catch (e, stackTrace) {
          print(stackTrace);
          if (e.toString().contains("400")) {
            errorMessage = '400';
          } else if (e.toString().contains("401")) {
            errorMessage = '401';
          } else if (e.toString().contains("422")) {
            errorMessage = '422';
          } else {
            errorMessage = 'An error occurred. Please try again.';
          }
        }
        emit(TaskpageError(errorMessage!));

      }
    });
  }
}*/
