import 'package:json_annotation/json_annotation.dart';
import 'package:xendit_testing/src/domain/entities/va_account_entity.dart';

part 'va_account_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class VaAccountModel extends VaAccountEntity {
  const VaAccountModel({
    required String id,
    required String externalId,
    required String ownerId,
    required String bankCode,
    required String merchantCode,
    required String accountNumber,
    required String name,
    required String currency,
    required bool isSingleUse,
    required bool isClosed,
    required num expectedAmount,
    required String expirationDate,
    required String status,
  }) : super(
            id: id,
            externalId: externalId,
            ownerId: ownerId,
            bankCode: bankCode,
            merchantCode: merchantCode,
            accountNumber: accountNumber,
            name: name,
            currency: currency,
            isSingleUse: isSingleUse,
            isClosed: isClosed,
            expectedAmount: expectedAmount,
            expirationDate: expirationDate,
            status: status);

  factory VaAccountModel.fromJson(Map<String, dynamic> json) {
    return _$VaAccountModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VaAccountModelToJson(this);
}
