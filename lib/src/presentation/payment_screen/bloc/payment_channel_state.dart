part of 'payment_channel_bloc.dart';

abstract class PaymentChannelState extends Equatable {
  const PaymentChannelState();

  @override
  List<Object> get props => [];
}

class PaymentChannelInitial extends PaymentChannelState {}

class PaymentChannelLoadInProgress extends PaymentChannelState {}

class PaymentChannelLoadComplete extends PaymentChannelState {
  final List<PaymentChannelEntity> paymentChannels;

  const PaymentChannelLoadComplete(this.paymentChannels);

  @override
  List<Object> get props => [paymentChannels];
}

class PaymentChannelLoadFailure extends PaymentChannelState {}
