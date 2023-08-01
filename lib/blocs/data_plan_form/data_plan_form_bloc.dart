
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/data_plan_form_model.dart';
import '../../services/transaction_service.dart';

part 'data_plan_form_event.dart';
part 'data_plan_form_state.dart';

class DataPlanFormBloc extends Bloc<DataPlanFormEvent, DataPlanFormState> {
  DataPlanFormBloc() : super(DataPlanFormInitial()) {
    on<DataPlanFormEvent>((event, emit) async {
      if (event is DataPlanFormPost) {
        try {
          emit(DataPlanFormLoading());

          await TransactionService().dataPlan(event.data);

          emit(DataPlanFormSuccess());
        } catch (e) {
          print(e);
          emit(DataPlanFormFailed(e.toString()));
        }
      }
    });
  }
}
