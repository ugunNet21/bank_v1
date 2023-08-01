
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/user_model.dart';
import '../../services/user_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is UserGetByUsername) {
        try {
          emit(UserLoading());

          final res = await UserService().getUsersByUsername(event.username);

          emit(UserSuccess(res));
        } catch (e) {
          print(e);

          emit(UserFailed(e.toString()));
        }
      }

      if (event is UserGetRecent) {
        try {
          emit(UserLoading());

          final res = await UserService().getRecentUsers();

          emit(UserSuccess(res));
        } catch (e) {
          print(e);
          emit(UserFailed(e.toString()));
        }
      }
    });
  }
}
