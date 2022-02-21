// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'va_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VaAccountModel _$VaAccountModelFromJson(Map<String, dynamic> json) =>
    VaAccountModel(
      id: json['id'] as String,
      externalId: json['external_id'] as String,
      ownerId: json['owner_id'] as String,
      bankCode: json['bank_code'] as String,
      merchantCode: json['merchant_code'] as String,
      accountNumber: json['account_number'] as String,
      name: json['name'] as String,
      currency: json['currency'] as String,
      isSingleUse: json['is_single_use'] as bool,
      isClosed: json['is_closed'] as bool,
      expectedAmount: json['expected_amount'] as num,
      expirationDate: json['expiration_date'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$VaAccountModelToJson(VaAccountModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'external_id': instance.externalId,
      'owner_id': instance.ownerId,
      'bank_code': instance.bankCode,
      'merchant_code': instance.merchantCode,
      'account_number': instance.accountNumber,
      'name': instance.name,
      'currency': instance.currency,
      'is_single_use': instance.isSingleUse,
      'is_closed': instance.isClosed,
      'expected_amount': instance.expectedAmount,
      'expiration_date': instance.expirationDate,
      'status': instance.status,
    };
