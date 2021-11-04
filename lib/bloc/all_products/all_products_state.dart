part of 'all_products_bloc.dart';

@freezed
class AllProductsState with _$AllProductsState {
  const factory AllProductsState.intial() = _intial;
  const factory AllProductsState.loadInProgress() = _loadInProgress;
  const factory AllProductsState.loadSuccess(ProductModal productsData) =
      _loadSuccess;
  const factory AllProductsState.loadFailure() = _LoadFailure;

  const factory AllProductsState.empty() = _Empty;
}
