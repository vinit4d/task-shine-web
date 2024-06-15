extension ImagePath on String{
  String get toPng =>"assets/images/png/$this.png";
  String get toSvg =>"assets/images/svg/$this.svg";
  String get toLottie =>"assets/lottie/$this.json";

}