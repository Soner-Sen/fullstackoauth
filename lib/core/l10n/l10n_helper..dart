import 'package:flutter/material.dart';
import 'package:fullstackoauth/core/l10n/generated/l10n.dart';

extension L10nHelper on BuildContext {
  S get l10n => S.of(this);
}
/*
            Text(S.of(context).greeting('Flutter')),
            Text(S.of(context).itemCount(0)),
            Text(S.of(context).itemCount(1)),
            Text(S.of(context).itemCount(5)),
 */