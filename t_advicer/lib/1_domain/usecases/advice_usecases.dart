import 'package:dartz/dartz.dart';
import 'package:t_advicer/1_domain/entities/advice_entity.dart';
import 'package:t_advicer/1_domain/failures/failures.dart';

class AdviceUseUsecases {
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    //call a repository to get data (failuer or data)
    //proceed with bisuness logic(manipulate the data)
    await Future.delayed(const Duration(seconds: 3), () {});
    //call to repo went good: -> return data not failure
    // return right(AdviceEntity(advice: 'advice to test', id: 1));
    //call to repo went bad or logic had an error -> return failure (left side)
    return left(CasheFailure());
  }
}
