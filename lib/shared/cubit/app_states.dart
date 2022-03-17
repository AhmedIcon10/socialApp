abstract class AppStates{}
class InitialAppState extends AppStates{}
class GetUserLoadingState extends AppStates{}
class GetUserSuccessState extends AppStates{}
class GetUserErrorState extends AppStates{
  final String error;
  GetUserErrorState(this.error);
}