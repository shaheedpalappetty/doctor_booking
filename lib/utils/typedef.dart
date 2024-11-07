
import 'package:astha_agent/utils/app_exception.dart';
import 'package:either_dart/either.dart';

typedef EitherResponse<T> = Future<Either<AppException, T>>;

