
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/operator_card_model.dart';
import '../../services/transaction_service.dart';

part 'operator_card_event.dart';
part 'operator_card_state.dart';

class OperatorCardBloc extends Bloc<OperatorCardEvent, OperatorCardState> {
  OperatorCardBloc() : super(OperatorCardInitial()) {
    on<OperatorCardEvent>((event, emit) async {
      if (event is OperatorCardGet) {
        try {
          emit(OperatorCardLoading());

          final operators = await TransactionService().getOperatorCards();

          emit(OperatorCardSuccess(operators));
        } catch (e) {
          emit(OperatorCardFailed(e.toString()));
        }
      }
    });
  }
}
