import 'package:json_annotation/json_annotation.dart';
import 'package:xendit_testing/src/domain/entities/qr_payment_entity.dart';

part 'qr_payment_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class QrPaymentModel extends QrPaymentEntity {
  const QrPaymentModel({
    required String id,
    required String externalId,
    required num amount,
    required String qrString,
    required String callbackUrl,
    required String type,
    required String status,
    required String created,
    required String updated,
  }) : super(
          id: id,
          externalId: externalId,
          amount: amount,
          qrString: qrString,
          callbackUrl: callbackUrl,
          type: type,
          status: status,
          created: created,
          updated: updated,
        );

  factory QrPaymentModel.fromJson(Map<String, dynamic> json) {
    return _$QrPaymentModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$QrPaymentModelToJson(this);
}
