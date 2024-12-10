import 'dart:io';
import 'dart:convert';
import 'dart:async';
void main() async{
  //setup and task 1
  final file = File("Input_1.txt");
  Stream<String> lines = file.openRead()
  .transform(utf8.decoder)
  .transform(LineSplitter());
  final leftList = List.empty(growable: true);
  final rightList = List.empty(growable: true);
  num totalDistance = 0;
  await for (var line in lines)
  {
    var splitted = line.split('   ');
    leftList.add(num. parse(splitted[0]));
    rightList.add(num. parse(splitted[1]));
  }
  leftList.sort();
  rightList.sort();

  for (int i = 0; i < leftList.length; i++)
  {
    totalDistance = totalDistance + (leftList[i] - rightList[i]).abs();
  }
  print('Total Distance is: \n');
  print(totalDistance);
  //task 2 with similarity score below
  num similarityScore = 0;
  for (int i = 0; i < leftList.length; i++)
  {
    num occurences = 0;
    for (int j = 0; j < rightList.length; j++)
    {
      if(leftList[i] == rightList[j]) {occurences += 1;}
    }
    similarityScore = similarityScore + (leftList[i]*occurences);  
  }
  print('SimilarityScore is: \n');
  print(similarityScore);
 
}
