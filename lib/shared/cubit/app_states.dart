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
// profileImage picked states
class SocialProfileImagePickedSuccessState extends AppStates{}
class SocialProfileImagePickedErrorState extends AppStates{}
// coverImage picked states
class SocialCoverImagePickedSuccessState extends AppStates{}
class SocialCoverImagePickedErrorState extends AppStates{}
// profileImage upload states
class SocialUploadProfileImageSuccessState extends AppStates{}
class SocialUploadProfileImageErrorState extends AppStates{}
// coverImage upload states
class SocialUploadCoverImageSuccessState extends AppStates{}
class SocialUploadCoverImageErrorState extends AppStates{}
class SocialUserUpdateErrorState extends AppStates{}
