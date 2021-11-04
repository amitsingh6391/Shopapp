import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/repository/product_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
// import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'all_products_event.dart';
part 'all_products_state.dart';
part 'all_products_bloc.freezed.dart';

@injectable
class AllProductsBloc extends Bloc<AllProductsEvent, AllProductsState> {
  final ProductRepository productRepository;

  int page = 1;
  bool isFetching = false;

  AllProductsBloc({required this.productRepository})
      : super(const AllProductsState.intial());

  @override
  Stream<AllProductsState> mapEventToState(
    AllProductsEvent event,
  ) async* {
    yield* event.map(
      getAllProductsData: (e) async* {
        yield const AllProductsState.loadInProgress();

        try {
          final response = await productRepository.getAllProducts(page);

          print("i m in serviexs and data is ${response.data}");
          // print(response.data);
          print("this is data modal lenght ${response.data.length}");

          ProductModal productData = ProductModal.fromJson(response.data);
          yield AllProductsState.loadSuccess(productData);

          // page++;
        } catch (e) {
          print(e);
          yield const AllProductsState.loadFailure();
        }
      },
      getNextProductsData: (e) async* {
        yield const AllProductsState.loadInProgress();

        try {
          final response = await productRepository.getAllProducts(e.pageNo);

          // print("i m in serviexs");

          ProductModal productData = ProductModal.fromJson(response.data);
          yield AllProductsState.loadSuccess(productData);

          // page++;
        } catch (e) {
          print(e);
          yield const AllProductsState.loadFailure();
        }
      },
    );
  }
}
