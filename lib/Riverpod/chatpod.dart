// ignore_for_file: unused_element, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ChatTextProvider=Provider((ref){
     TextEditingController _textEditingController= TextEditingController(); 
      return _textEditingController;   
  
});