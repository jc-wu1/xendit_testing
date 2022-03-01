package com.example.xendit_testing


//flutter MethodChannel relatives

import android.util.Log
import android.widget.Toast
import com.midtrans.sdk.corekit.callback.CheckoutCallback
import com.midtrans.sdk.corekit.callback.TransactionCallback
import com.midtrans.sdk.corekit.core.MidtransSDK
import com.midtrans.sdk.corekit.core.SdkCoreFlowBuilder
import com.midtrans.sdk.corekit.models.TransactionResponse
import com.midtrans.sdk.corekit.models.snap.Token
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


//midtrans_sdk CoreKit


class MainActivity: FlutterActivity() {
    private val CHANNNEL = "co.id.portocustomer/paymentchannel"
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNNEL).setMethodCallHandler {
            call, result ->
            when (call.method) {
                "paymentMethodA" -> {
                    val transRes = payWithPaymentMethodA()
                    result.success(transRes)
                }
                "init" -> {
                    init()
                }
                "testPayment" -> {
                    val token = testPayment()
                    result.success(token)
                }
            }
        }
    }

    private fun payWithPaymentMethodA(): String {
        return "Success";
    }

    private fun init() {
        SdkCoreFlowBuilder.init()
                .setContext(this)
                .setClientKey(BuildConfig.CLIENT_KEY)
                .setMerchantBaseUrl(BuildConfig.BASE_URL)
                .enableLog(true)
                .buildSDK()
    }

    private fun testPayment() {
        MidtransSDK.getInstance().transactionRequest = CustomerDetail.transactionRequest("01", 200.0, 1, "Test")
        MidtransSDK.getInstance().checkout(object : CheckoutCallback {
            override fun onSuccess(token: Token) {
                // Checkout token will be used to charge the transaction later
                val checkoutToken = token.tokenId
                // Action when succeded

                MidtransSDK.getInstance().paymentUsingBankTransferBCA(checkoutToken, "test@gmail.com", object: TransactionCallback {
                    override fun onError(p0: Throwable?) {
                        Log.d("midtrans", "error")
                    }

                    override fun onSuccess(p0: TransactionResponse?) {
                        Log.d("midtrans", "success")
                        if (p0 != null) {
                            Log.d("midtrans", p0.bcaVaNumber)
                        }
                    }

                    override fun onFailure(p0: TransactionResponse?, p1: String?) {
                        Log.d("midtrans", "failure")
                    }

                })
            }

            override fun onFailure(token: Token?, reason: String?) {
            }

            override fun onError(error: Throwable) {
            }
        })
    }
}

