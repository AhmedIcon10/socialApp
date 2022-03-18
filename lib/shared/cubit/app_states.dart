abstract class AppStates{}
class InitialAppState extends AppStates{}
// get user states
class GetUserLoadingState extends AppStates{}
class GetUserSuccessState extends AppStates{}
class GetUserErrorState extends AppStates{
  final String error;
  GetUserErrorState(this.error);
}
// change bottom nav bar state
class ChangeBottomNavBarState extends AppStates{}
// create user states