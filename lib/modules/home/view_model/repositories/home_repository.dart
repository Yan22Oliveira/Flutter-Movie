import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../models/models.dart';
import '../exceptions/exceptions.dart';
import '../interfaces/interfaces.dart';

class HomeRepository implements IHomeRepository {

  final Dio dio;
  HomeRepository(this.dio);

  @override
  Future<Either<Exception, List<MovieModel>>> getListMovies() async {

    try{

      var baseUrl = 'https://api.themoviedb.org/3/';
      var apiKey = 'fdffa5c31d1d7b7a182d682641c65ace';
      var backendRout = '${baseUrl}movie/popular?api_key=$apiKey&language=pt-BR&page=1';

      final response = await dio.get(backendRout);

      if (response.statusCode == 200) {
        var lisMovies = _convertJsonToListMovies(response.data['results']);
        return Right(lisMovies);
      }

      return Left(NotFoundException());

    } on DioError catch (e) {

      if(e.response?.statusCode == 401){
        return Left(NotFoundException());
      }else if(e.response?.statusCode == 500){
        return Left(ServeErroException(erro: e.error));
      }

      return Left(ServeErroException(erro: e.error));

    }catch(e){
      return Left(ServeErroException(erro: e.toString()));
    }

  }

  List<MovieModel> _convertJsonToListMovies(List lisMovies){
    return lisMovies.map((coupon) => MovieModel.fromJson(coupon)).toList();
  }

}