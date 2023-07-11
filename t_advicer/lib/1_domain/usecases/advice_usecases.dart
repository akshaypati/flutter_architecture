import 'package:dartz/dartz.dart';
import 'package:t_advicer/0_data/repositories/advice_repo_impl.dart';
import 'package:t_advicer/1_domain/entities/advice_entity.dart';
import 'package:t_advicer/1_domain/failures/failures.dart';
import 'package:t_advicer/1_domain/repositories/advice_repo.dart';

class AdviceUseUsecases {
  AdviceUseUsecases({required this.adviceRepo});
  final AdviceRepo adviceRepo;
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    return adviceRepo.getAdviceFromDatasource();
    //space for business logic
  }
}
