part of 'add_admin_cubit.dart';

@immutable
sealed class AddAdminState {}

final class AddAdminInitial extends AddAdminState {}

final class AddAdminLoading extends AddAdminState {}
final class AddAdminSuccess extends AddAdminState {}
final class AddAdminError  extends AddAdminState {
  final String masError;
  AddAdminError({required this.masError});
}
