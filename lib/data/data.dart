import 'package:memory_game/model/tile_model.dart';

int points = 0;
bool selected = false;
String selectedImageAssetPath = "";
int selectedTileIndex;

List<TileModel> visiblePairs = new List<TileModel>();
List<TileModel> pairs = new List<TileModel>();

List<TileModel> getPairs(){
  List<TileModel> pairs = new List<TileModel>();

  //1
  TileModel tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/fox.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  //2
  tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/hippo.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  //3
  tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/horse.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  //4
  tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/monkey.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  //5
  tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/panda.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  //6
  tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/parrot.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  //7
  tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/rabbit.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  //8
  tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/zoo.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  return pairs;
  
}

List<TileModel> getQuestionPairs(){
  List<TileModel> pairs = new List<TileModel>();

  //1
  TileModel tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  //2
  tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  //3
  tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  //4
  tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  //5
  tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  //6
  tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  //7
  tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  //8
  tileModel = new TileModel();

  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  return pairs;
  
}