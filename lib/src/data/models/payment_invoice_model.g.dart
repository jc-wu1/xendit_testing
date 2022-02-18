// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_invoice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentInvoiceModel _$PaymentInvoiceModelFromJson(Map<String, dynamic> json) =>
    PaymentInvoiceModel(
      id: json['id'] as String,
      externalId: json['external_id'] as String,
      userId: json['user_id'] as String,
      status: json['status'] as String,
      merchantName: json['merchant_name'] as String,
      merchantProfilePictureUrl: json['merchant_profile_picture_url'] as String,
      locale: json['locale'] as String,
      amount: json['amount'] as int,
      payerEmail: json['payer_email'] as String,
      description: json['description'] as String,
      expiryDate: json['expiry_date'] as String,
      invoiceUrl: json['invoice_url'] as String,
      availableBanks: (json['available_banks'] as List<dynamic>)
          .map((e) => AvailableBank.fromJson(e as Map<String, dynamic>))
          .toList(),
      shouldExcludeCreditCard: json['should_exclude_credit_card'] as bool,
      shouldSendEmail: json['should_send_email'] as bool,
      created: json['created'] as String,
      updated: json['updated'] as String,
      currency: json['currency'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaymentInvoiceModelToJson(
        PaymentInvoiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'external_id': instance.externalId,
      'user_id': instance.userId,
      'status': instance.status,
      'merchant_name': instance.merchantName,
      'merchant_profile_picture_url': instance.merchantProfilePictureUrl,
      'locale': instance.locale,
      'amount': instance.amount,
      'payer_email': instance.payerEmail,
      'description': instance.description,
      'expiry_date': instance.expiryDate,
      'invoice_url': instance.invoiceUrl,
      'available_banks': instance.availableBanks,
      'should_exclude_credit_card': instance.shouldExcludeCreditCard,
      'should_send_email': instance.shouldSendEmail,
      'created': instance.created,
      'updated': instance.updated,
      'currency': instance.currency,
      'items': instance.items,
    };
