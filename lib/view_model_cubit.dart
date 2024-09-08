import 'package:bloc/bloc.dart';

import 'main.dart';

part 'view_model_state.dart';

class ViewModelCubit extends Cubit<ViewModelState> {
  ViewModelCubit() : super(ViewModelInitial());

  List<ModelDrop>list=ModelDrop.getList();
  ModelDrop? selectedValue;
  initValue(){
    selectedValue =list[0];
  }
  changeData(ModelDrop? value){
    selectedValue=value;
    emit(ViewModelUpdate());
  }
}
