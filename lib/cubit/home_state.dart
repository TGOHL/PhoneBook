part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeContactModeChanged extends HomeState {}
final class HomeContactsInit extends HomeState {}
final class HomeContactAdded extends HomeState {}
final class HomeContactEdited extends HomeState {}
final class HomeContactRemoved extends HomeState {}
final class HomeContactSearched extends HomeState {}
