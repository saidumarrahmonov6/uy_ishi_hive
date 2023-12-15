import 'package:hive/hive.dart';
part 'maxsulot.g.dart';
@HiveType(typeId: 0)
class Maxsulot {
  @HiveField(0)
  String nomi;
  @HiveField(1)
  int soni;

  Maxsulot(this.nomi , this.soni);
}