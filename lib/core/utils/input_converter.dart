import 'package:dartz/dartz.dart';
import 'package:fullstackoauth/core/error/failures.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInteger(String str) {
    try {
      final integer = int.parse(str);
      if (integer < 0) throw const FormatException();
      return Right(integer);
    } catch (e) {
      return Left(InvalidInputFailure());
    }
  }
}
