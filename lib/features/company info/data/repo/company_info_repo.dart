import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:space_x/core/networking/api_service.dart';
import 'package:space_x/core/networking/server_failure.dart';
import 'package:space_x/features/company%20info/data/models/company_info_model.dart';

class CompanyInfoRepo {
  final ApiService apiService;

  CompanyInfoRepo(this.apiService);

  Future<Either<Failure, CompanyInfoModel>> getCompanyInfo() async {
    try {
      final companyInfo = await apiService.getCompanyInfo();
      return Right(companyInfo);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
