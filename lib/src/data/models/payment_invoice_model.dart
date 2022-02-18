import 'package:xendit_testing/src/domain/entities/payment_invoice_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_invoice_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PaymentInvoiceModel extends PaymentInvoiceEntity {
  const PaymentInvoiceModel({
    required String id,
    required String externalId,
    required String userId,
    required String status,
    required String merchantName,
    required String merchantProfilePictureUrl,
    required String locale,
    required int amount,
    required String payerEmail,
    required String description,
    required String expiryDate,
    required String invoiceUrl,
    required List<AvailableBank> availableBanks,
    required bool shouldExcludeCreditCard,
    required bool shouldSendEmail,
    required String created,
    required String updated,
    required String currency,
    required List<Item> items,
  }) : super(
          id: id,
          externalId: externalId,
          userId: userId,
          status: status,
          merchantName: merchantName,
          merchantProfilePictureUrl: merchantProfilePictureUrl,
          locale: locale,
          amount: amount,
          payerEmail: payerEmail,
          description: description,
          expiryDate: expiryDate,
          invoiceUrl: invoiceUrl,
          availableBanks: availableBanks,
          shouldExcludeCreditCard: shouldExcludeCreditCard,
          shouldSendEmail: shouldSendEmail,
          created: created,
          updated: updated,
          currency: currency,
          items: items,
        );

  factory PaymentInvoiceModel.fromJson(Map<String, dynamic> json) {
    return _$PaymentInvoiceModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaymentInvoiceModelToJson(this);
}
