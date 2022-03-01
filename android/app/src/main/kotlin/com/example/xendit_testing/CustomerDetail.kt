package com.example.xendit_testing

import com.midtrans.sdk.corekit.core.TransactionRequest
import com.midtrans.sdk.corekit.models.CustomerDetails
import com.midtrans.sdk.corekit.models.TransactionDetails

object CustomerDetail {
    val NAME = "Testing"
    val PHONE = "087777142321"
    val EMAIL = "test@gmail.com"

    fun customerDetail(): CustomerDetails {
        val cd = CustomerDetails()
        cd.firstName = NAME
        cd.phone = PHONE
        cd.email = EMAIL
        return cd
    }

    fun transactionRequest(id: String, price: Double, qty: Int, name: String): TransactionRequest {
        val req = TransactionRequest(System.currentTimeMillis().toString(), 2000.0, "")
        req.setCustomerDetails(customerDetail())
        return req
    }
}