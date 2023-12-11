class AppStrings {
  static const List<String> breedTypes = [
    'Random image by breed',
    'Images list by breed',
    'Random image by breed and sub breed',
    'Images list by breed and sub breed'
  ];

  static const dashboard = "DashBoard";
  static const breedImg = "Breed Image";
  static const breedImgList = "Breed Image List";
  static const breedImgBySubBreed = "Breed Image By Sub-Breed";
  static const breedImgListBySubBreed = "Breed Image List By Sub-Breed";
  static const String connectionMsg =
      'Unable to connect. Check your internet connectivity.';
  static const breedSelect = "Select Breed";
  static const breedMsg = "Please select breed type";

  static const Map<String, dynamic> networkErrorRes = <String, dynamic>{
    "success": false,
    "message": connectionMsg
  };

  // API end points

  static const String baseURL = 'https://dog.ceo/api/';
  static const String breedList = 'breeds/list/all';
  static String singleBreedImg(String? breedName) => 'breed/$breedName/images/random';
  static String singleBreedImgList(String? breedName) => 'breed/$breedName/images/random/8';
  static String singleSubBreedImg(String? breedName,String subBreedName) => 'breed/$breedName/$subBreedName/images/random';
  static String singleSubBreedImgList(String? breedName,String subBreedName) => 'breed/$breedName/$subBreedName/images/random/8';
}
