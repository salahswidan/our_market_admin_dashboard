part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class GetProductsLoading extends ProductState {}
final class GetProductsSuccess extends ProductState {}
final class GetProductsError extends ProductState {}
