import 'dart:convert';

import 'package:equatable/equatable.dart';

class PaymentInvoiceEntity extends Equatable {
  const PaymentInvoiceEntity({
    required this.id,
    required this.externalId,
    required this.userId,
    required this.status,
    required this.merchantName,
    required this.merchantProfilePictureUrl,
    required this.locale,
    required this.amount,
    required this.payerEmail,
    required this.description,
    required this.expiryDate,
    required this.invoiceUrl,
    required this.availableBanks,
    required this.shouldExcludeCreditCard,
    required this.shouldSendEmail,
    required this.created,
    required this.updated,
    required this.currency,
    required this.items,
  });

  final String id;
  final String externalId;
  final String userId;
  final String status;
  final String merchantName;
  final String merchantProfilePictureUrl;
  final String locale;
  final int amount;
  final String payerEmail;
  final String description;
  final String expiryDate;
  final String invoiceUrl;
  final List<AvailableBank> availableBanks;
  final bool shouldExcludeCreditCard;
  final bool shouldSendEmail;
  final String created;
  final String updated;
  final String currency;
  final List<Item> items;

  @override
  List<Object> get props => [
        id,
        externalId,
        userId,
        status,
        merchantName,
        merchantProfilePictureUrl,
        locale,
        amount,
        payerEmail,
        description,
        expiryDate,
        invoiceUrl,
        availableBanks,
        shouldExcludeCreditCard,
        shouldSendEmail,
        created,
        updated,
        currency,
        items,
      ];
}

class AvailableBank extends Equatable {
  final String bankCode;
  final String collectionType;
  final int transferAmount;
  final String bankBranch;
  final String accountHolderName;
  final int identityAmount;

  const AvailableBank({
    required this.bankCode,
    required this.collectionType,
    required this.transferAmount,
    required this.bankBranch,
    required this.accountHolderName,
    required this.identityAmount,
  });

  @override
  List<Object> get props {
    return [
      bankCode,
      collectionType,
      transferAmount,
      bankBranch,
      accountHolderName,
      identityAmount,
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      'bank_code': bankCode,
      'collection_type': collectionType,
      'transfer_amount': transferAmount,
      'bank_branch': bankBranch,
      'account_holder_name': accountHolderName,
      'identity_amount': identityAmount,
    };
  }

  factory AvailableBank.fromJson(Map<String, dynamic> map) {
    return AvailableBank(
      bankCode: map['bank_code'] ?? '',
      collectionType: map['collection_type'] ?? '',
      transferAmount: map['transfer_amount']?.toInt() ?? 0,
      bankBranch: map['bank_branch'] ?? '',
      accountHolderName: map['account_holder_name'] ?? '',
      identityAmount: map['identity_amount']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'AvailableBank(bankCode: $bankCode, collectionType: $collectionType, transferAmount: $transferAmount, bankBranch: $bankBranch, accountHolderName: $accountHolderName, identityAmount: $identityAmount)';
  }
}

class Item extends Equatable {
  final String name;
  final int quantity;
  final int price;
  final String category;

  const Item({
    required this.name,
    required this.quantity,
    required this.price,
    required this.category,
  });

  @override
  List<Object> get props => [name, quantity, price, category];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
      'category': category,
    };
  }

  factory Item.fromJson(Map<String, dynamic> map) {
    return Item(
      name: map['name'] ?? '',
      quantity: map['quantity']?.toInt() ?? 0,
      price: map['price']?.toInt() ?? 0,
      category: map['category'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Item(name: $name, quantity: $quantity, price: $price, category: $category)';
  }
}
