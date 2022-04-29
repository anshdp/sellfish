part of 'loader_bloc.dart';

@immutable
abstract class LoaderState {}

class LoaderInitial extends LoaderState {}

class NavigateToSeller extends LoaderState {}

class NavigateToCustomer extends LoaderState {}

class NavigationFailed extends LoaderState {}
