// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/main/home/data/repositories/recipe_repository.dart'
    as _i776;
import '../../features/main/home/presentation/bloc/home_bloc.dart' as _i897;
import '../database/api/api_consumer.dart' as _i558;
import '../database/api/dio_consumer.dart' as _i58;
import '../services/network/generator_client.dart' as _i902;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.factory<_i776.RecipeRepository>(() => _i776.RecipeRepository());
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.factory<_i897.HomeBloc>(
      () => _i897.HomeBloc(gh<_i776.RecipeRepository>()),
    );
    gh.lazySingleton<_i902.GeneratorClient>(
      () => dioModule.generatorClient(gh<_i361.Dio>()),
    );
    gh.factory<_i558.ApiConsumer>(() => _i58.DioConsumer(dio: gh<_i361.Dio>()));
    return this;
  }
}

class _$DioModule extends _i902.DioModule {}
