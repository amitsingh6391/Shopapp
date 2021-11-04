part of 'all_products_bloc.dart';

@freezed
class AllProductsEvent with _$AllProductsEvent {
  const factory AllProductsEvent.getAllProductsData() = _getAllProductsData;
  const factory AllProductsEvent.getNextProductsData(int pageNo) =
      _getNextProductsData;
}
