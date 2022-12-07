// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bloc_sample_project/data/model/cat.dart';
import 'package:flutter/foundation.dart';

abstract class CatsState {
  const CatsState();
}

class CatsInitial extends CatsState {
  const CatsInitial();
}

class CatsLoading extends CatsState {
  const CatsLoading();
}

class CatsCompleted extends CatsState {
  final List<Cat> response;

  CatsCompleted(this.response);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CatsCompleted && listEquals(o.response, response);
  }

  @override
  int get hashCode => response.hashCode;
}

class CatsError extends CatsState {
  final String message;
  const CatsError(this.message);
}
