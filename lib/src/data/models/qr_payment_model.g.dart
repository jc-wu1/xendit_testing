// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QrPaymentModel _$QrPaymentModelFromJson(Map<String, dynamic> json) =>
    QrPaymentModel(
      id: json['id'] as String,
      externalId: json['external_id'] as String,
      amount: json['amount'] as num,
      qrString: json['qr_string'] as String,
      callbackUrl: json['callback_url'] as String,
      type: json['type'] as String,
      status: json['status'] as String,
      created: json['created'] as String,
      updated: json['updated'] as String,
    );

Map<String, dynamic> _$QrPaymentModelToJson(QrPaymentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'external_id': instance.externalId,
      'amount': instance.amount,
      'qr_string': instance.qrString,
      'callback_url': instance.callbackUrl,
      'type': instance.type,
      'status': instance.status,
      'created': instance.created,
      'updated': instance.updated,
    };
