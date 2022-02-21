import 'package:equatable/equatable.dart';

class QrPaymentEntity extends Equatable {
  final String id;
  final String externalId;
  final num amount;
  final String qrString;
  final String callbackUrl;
  final String type;
  final String status;
  final String created;
  final String updated;

  const QrPaymentEntity({
    required this.id,
    required this.externalId,
    required this.amount,
    required this.qrString,
    required this.callbackUrl,
    required this.type,
    required this.status,
    required this.created,
    required this.updated,
  });

  @override
  List<Object?> get props => [
        id,
        externalId,
        amount,
        qrString,
        callbackUrl,
        type,
        status,
        created,
        updated,
      ];
}
