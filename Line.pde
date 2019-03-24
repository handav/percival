class Line {
  int lineNum;
  String[] taggedLine;
  String lineText;
  HashMap<String, Integer> hm = new HashMap<String, Integer>();

  Line(String tempString, int _i) {
    lineText = tempString;
    taggedLine = RiTa.getPosTags(tempString);
  }

  void playNotes(String tag) {
    if ((match(tag, "dt")!= null) || (match(tag, "in")!= null) || (match(tag, "cc")!= null)) {
      PianoC3.trigger();
    } else if (match(tag, "nn")!= null) {
      PianoEb3.trigger();
    } else if (match(tag, "vb")!= null) {
      PianoAb2.trigger();
    } else if (match(tag, "rb")!= null) {
      PianoD3.trigger();
    } else if (match(tag, "jj")!= null) {
      PianoG3.trigger();
    } else if (tag.equals(".")) {
      PianoC2.trigger();
    } else {
      //println("no tag:");
      //println(taggedLine);
      //println(RiTa.getPosTagsInline(lineText));
      //println(tag);
    }
  }
}
