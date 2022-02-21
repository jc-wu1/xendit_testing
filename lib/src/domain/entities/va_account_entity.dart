import 'package:equatable/equatable.dart';

class VaAccountEntity extends Equatable {
  final String id;
  final String externalId;
  final String ownerId;
  final String bankCode;
  final String merchantCode;
  final String accountNumber;
  final String name;
  final String currency;
  final bool isSingleUse;
  final bool isClosed;
  final num expectedAmount;
  final String expirationDate;
  final String status;

  const VaAccountEntity({
    required this.id,
    required this.externalId,
    required this.ownerId,
    required this.bankCode,
    required this.merchantCode,
    required this.accountNumber,
    required this.name,
    required this.currency,
    required this.isSingleUse,
    required this.isClosed,
    required this.expectedAmount,
    required this.expirationDate,
    required this.status,
  });

  @override
  List<Object?> get props => [
        id,
        externalId,
        ownerId,
        bankCode,
        merchantCode,
        accountNumber,
        name,
        currency,
        isSingleUse,
        isClosed,
        expectedAmount,
        expirationDate,
        status,
      ];
}
