


import '../model/DataForm.dart';

class FormDataController{

  List<DataForm> listaRegistros = [];
  
  void adicionaPet(DataForm dataForm){
    listaRegistros.add(dataForm);
  }
}