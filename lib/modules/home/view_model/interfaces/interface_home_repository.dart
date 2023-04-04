import 'package:dartz/dartz.dart';

import '../../models/models.dart';

abstract class IHomeRepository{
  Future<Either<Exception, List<MovieModel>>> getListMovies ();
}
