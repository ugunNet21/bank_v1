
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/transaction_model.dart';
import '../../services/transaction_service.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {
    on<TransactionEvent>((event, emit) async {
      try {
        emit(TransactionLoading());

        final transactions = await TransactionService().getTransactions();

        emit(TransactionSuccess(transactions));
      } catch (e) {
        print(e);
        emit(TransactionFailed(e.toString()));
      }
    });
  }
}
