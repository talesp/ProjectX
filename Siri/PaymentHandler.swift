//
//  PaymentHandler.swift
//  Projeto X
//
//  Created by Tales Pinheiro De Andrade on 12/10/16.
//  Copyright © 2016 Tales Pinheiro De Andrade. All rights reserved.
//

import Intents

class PaymentHandler: NSObject, INSendPaymentIntentHandling, INRequestPaymentIntentHandling {
    
    func handle(sendPayment intent: INSendPaymentIntent, completion: @escaping (INSendPaymentIntentResponse) -> Void) {
        debugPrint("\(#line): intent: \(intent)")
        let userActivity = NSUserActivity(activityType: String(describing: INSendPaymentIntent.self))
        let response = INSendPaymentIntentResponse(code: .ready, userActivity: userActivity)
        completion(response)
    }
    
    func confirm(sendPayment intent: INSendPaymentIntent, completion: @escaping (INSendPaymentIntentResponse) -> Void) {
        dump(intent)
        
        let userActivity = NSUserActivity(activityType: String(describing: INSendPaymentIntent.self))
        
        // Ppossiveis valores para code abaixo:
//        unspecified
//        ready
//        inProgress
//        success
//        failure
//        failureRequiringAppLaunch
//        failureCredentialsUnverified
//        failurePaymentsAmountBelowMinimum
//        failurePaymentsAmountAboveMaximum
//        failurePaymentsCurrencyUnsupported
//        failureInsufficientFunds
//        failureNoBankAccount
        //referencia: https://developer.apple.com/reference/intents/insendpaymentintentresponsecode
        
        let response = INSendPaymentIntentResponse(code: .ready, userActivity: userActivity)
        completion(response)
    }
    
    func resolvePayee(forSendPayment intent: INSendPaymentIntent, with completion: @escaping (INPersonResolutionResult) -> Void) {
        
        guard let payee = intent.payee else {
            completion(INPersonResolutionResult.needsValue())
            return
        }
        completion(INPersonResolutionResult.success(with: payee))
        
    }
    
    
    func resolveCurrencyAmount(forSendPayment intent: INSendPaymentIntent, with completion: @escaping (INCurrencyAmountResolutionResult) -> Void) {
        
        guard let amount = intent.currencyAmount else {
            completion(INCurrencyAmountResolutionResult.needsValue())
            return
        }
        completion(INCurrencyAmountResolutionResult.success(with: amount))
    }
    
    
    func resolveNote(forSendPayment intent: INSendPaymentIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        
        guard let note = intent.note else {
            completion(INStringResolutionResult.needsValue())
            return
        }
        completion(INStringResolutionResult.success(with: note))
    }
    
    //MARK: - request payment
    func handle(requestPayment intent: INRequestPaymentIntent, completion: @escaping (INRequestPaymentIntentResponse) -> Void) {
        dump(intent)
    }
    
    func confirm(requestPayment intent: INRequestPaymentIntent, completion: @escaping (INRequestPaymentIntentResponse) -> Void) {
        dump(intent)
    }
}
