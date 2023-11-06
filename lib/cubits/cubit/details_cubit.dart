import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/contact.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());
  Contact? _contact;
  Contact? get contact => _contact;

  void setContact(Contact? cont) {
    _contact = cont;
  }

  void editContact(Contact cont) {
    _contact!.name = cont.name;
    _contact!.phone = cont.phone;
   emit(DetailsUpdated());
  }
}
