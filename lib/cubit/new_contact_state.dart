part of 'new_contact_cubit.dart';

@immutable
sealed class NewContactState {}

final class NewContactInitial extends NewContactState {}
final class NewContactSaved extends NewContactState {}
