

import 'package:get/get.dart';

class Locales extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    "en_US" : {
      "change_username" : "Change Username",
      "diary" : "Diary",
      "username" : "Username",
      "add" : "Add"
    },
    "ru_RU" : {
      "change_username" : "Изменение имени пользователя",
      "diary" : "дневник",
      "username" : "имя пользователя",
      "add" : "добавлять"
    },
    "esp_ESP" : {
      "change_username" : "Cambie el nombre de usario",
      "diary" : "Diario",
      "username" : "Nombre De Usario ",
      "add" : "Agregar"
    }
  };

}