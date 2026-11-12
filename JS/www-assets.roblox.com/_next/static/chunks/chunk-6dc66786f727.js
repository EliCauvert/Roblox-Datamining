;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "6df8bdd0-9c4f-251c-6dab-7423c4363265")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 144674, 951605, 248951, e => {
    "use strict";
    var t = e.i(868275),
        r = e.i(357355),
        a = e.i(932598),
        n = e.i(341332),
        o = e.i(245837),
        l = e.i(181759),
        i = e.i(545819),
        s = e.i(682259);
    let d = "RBXPaymentsFlowContext",
        u = {
            USER_PURCHASE_FLOW: "UserPurchaseFlow",
            USER_PURCHASE_STATUS: "UserPurchaseStatus"
        },
        E = {
            WEB_ROBUX_PURCHASE: "WebRobuxPurchase",
            MOBILE_WEB_ROBUX_PURCHASE: "MobileWebRobuxPurchase",
            MOBILE_WEB_PREMIUM_PURCHASE: "MobileWebPremiumPurchase",
            WEB_PREMIUM_PURCHASE: "WebPremiumPurchase",
            WEB_CATALOG_ROBUX_UPSELL: "WebCatalogRobuxUpsell",
            WEB_CATALOG_PREMIUM_UPSELL: "WebCatalogPremiumUpsell",
            WEB_CATALOG_COLLECTIVE_ITEM_ROBUX_UPSELL: "WebCatalogCollectiveItemRobuxUpsell",
            WEB_CATALOG_BUNDLE_ITEM_ROBUX_UPSELL: "WebCatalogBundleItemRobuxUpsell",
            WEB_PAID_GAME_ROBUX_UPSELL: "WebPaidGameRobuxUpsell",
            WEB_GAME_PASS_ROBUX_UPSELL: "WebGamePassRobuxUpsell",
            WEB_DEVELOPER_PRODUCT_ROBUX_UPSELL: "WebDeveloperProductRobuxUpsell",
            WEB_PRIVATE_SERVER_ROBUX_UPSELL: "WebPrivateServerRobuxUpsell",
            WEB_CATALOG_CART_ROBUX_UPSELL: "WebCatalogCartRobuxUpsell",
            WEBVIEW_ROBUX_PURCHASE: "WebViewRobuxPurchase",
            WEBVIEW_PREMIUM_PURCHASE: "WebViewPremiumPurchase",
            WEB_ROBUX_GIFT_PURCHASE: "WebRobuxGiftPurchase",
            WEB_ROBUX_GIFT_POST_CHECKOUT: "WebRobuxGiftPostCheckout",
            WEB_GIFT_CARD_PURCHASE: "WebGiftCardPurchase",
            WEB_REDEEM_PAGE: "WebRedeemPage",
            WEB_PAYMENT_METHODS_SETTING: "WebPaymentMethodsSetting",
            WEB_ROBLOX_PLUS_PURCHASE: "WebRobloxPlusPurchase",
            MOBILE_WEB_ROBLOX_PLUS_PURCHASE: "MobileWebRobloxPlusPurchase",
            WEBVIEW_ROBLOX_PLUS_PURCHASE: "WebViewRobloxPlusPurchase",
            WEB_CATALOG_SINGLE_ITEM_PLUS_UPSELL: "WebCatalogSingleItemPlusUpsell",
            WEB_CATALOG_RESALE_ITEM_PLUS_UPSELL: "WebCatalogResaleItemPlusUpsell",
            WEB_CATALOG_BUNDLE_ITEM_PLUS_UPSELL: "WebCatalogBundleItemPlusUpsell",
            WEB_DEVELOPER_SUBSCRIPTION_PLUS_UPSELL: "WebDeveloperSubscriptionPlusUpsell",
            WEB_GAME_PASS_PLUS_UPSELL: "WebGamePassPlusUpsell",
            WEB_DEVELOPER_PRODUCT_PLUS_UPSELL: "WebDeveloperProductPlusUpsell",
            WEB_PRIVATE_SERVER_PLUS_UPSELL: "WebPrivateServerPlusUpsell",
            WEB_APP_THEME_PLUS_UPSELL: "WebAppThemePlusUpsell",
            WEB_PROFILE_FRAME_PLUS_UPSELL: "WebProfileFramePlusUpsell"
        },
        c = {
            ROBUX_UPSELL: "RobuxUpsell",
            ROBUX_UPSELL_EXCEED_LARGEST_PACKAGE: "RobuxUpsellExceedLargestPackage",
            PURCHASE_WARNING: "PurchaseWarning",
            LEAVE_ROBLOX_WARNING: "LeaveRobloxWarning",
            PREMIUM_DISCLOSURES: "PremiumDisclosures",
            PRODUCT_PURCHASE: "ProductPurchase",
            PRODUCT_PURCHASE_IMPRESSION: "ProductPurchaseImpression",
            PRODUCT_PURCHASE_LOADING: "ProductPurchaseLoading",
            PRODUCT_PURCHASE_QUICK_PAY: "ProductPurchaseQuickPay",
            QUICK_PAY_3DS: "QuickPay3DS",
            PREMIUM_PURCHASE: "PremiumPurchase",
            MEMBERSHIP: "Membership",
            MEMBERSHIP_ANGULAR: "MembershipAngular",
            PREMIUM_UPSELL: "PremiumUpsell",
            PAYMENT_METHOD: "PaymentMethod",
            MOBILE_PAYMENT_METHOD: "MobilePaymentMethod",
            MOBILE_PAYMENT_METHOD_SAMSUNG_PAY: "MobilePaymentMethodSamsungPay",
            MOBILE_PAYMENT_METHOD_REDEEM_CREDIT: "MobilePaymentMethodRedeemCredit",
            NAVIGATION_MENU: "NavigationMenu",
            PREPARE_PAYMENT_ERROR_OCCURRED: "PreparePaymentErrorOccured",
            XSOLLA: "Xsolla",
            XSOLLA_OTHER: "Xsolla Other",
            XSOLLA_SAVED_PAYMENT_METHOD: "Xsolla SavedCard",
            PAYPAL_POST_PROCESS: "Paypal Post Process",
            BRAINTREE_POST_PROCESS: "Braintree Post Process",
            BRAINTREE_PAYPAL_SAVED_PAYMENT: "Braintree PayPal Checkout With Saved Profile",
            ROBLOX_CREDIT: "Roblox Credit",
            ROBLOX_CREDIT_CHECKOUT: "Roblox Credit Checkout",
            ROBLOX_CREDIT_CHECKOUT_WITH_TAX: "Roblox Credit Checkout With Tax",
            ROBLOX_CREDIT_CHECKOUT_WITHOUT_TAX: "Roblox Credit Checkout Without Tax",
            ROBLOX_CREDIT_CAPTCHA: "Roblox Credit Captcha",
            LOADING: "Loading",
            CHECKOUT_SUCCESS: "Checkout Success",
            MOBILE_WEB_CHECKOUT_SUCCESS: "MobileWebCheckoutSuccess",
            SUCCESS: "Success",
            ERROR: "Error",
            NAVIGATION_ROBUX_TEXT: "NavigationRobuxText",
            NAVIGATION_DROPDOWN_MENU: "NavigationDropdownMenu",
            LEFT_NAVIGATION_BAR: "LeftNavigationBar",
            TRANSACTION_PAGE: "TransactionPage",
            CATALOG_LIST_PAGE: "CatalogListPage",
            ROBLOX_CREDIT_SETTING_BILLING_PAGE: "RobloxCreditBillingPage",
            REDEEM_ROBLOX_CARD_PAGE: "RedeemRobloxCardPage",
            PURCHASE_VPC_MODAL: "PurchaseVpcModal",
            OPTIMIZED_PURCHASE_VPC_MODAL: "OptimizedPurchaseVpcModal",
            ROBUX_GIFT_LANDING_PAGE: "RobuxGiftLandingPage",
            ROBUX_GIFT_BUNDLE_MESSAGE_PAGE: "RobuxGiftBundleMessagePage",
            ROBUX_GIFT_PRODUCT_SELECTION: "RobuxGiftProductSelection",
            ROBUX_GIFT_MESSAGE_SELECTION: "RobuxGiftMessageSelection",
            ROBUX_GIFT_PHONE_SUBMISSION: "RobuxGiftPhoneSubmission",
            ROBUX_GIFT_PHONE_AUTHENTICATION: "RobuxGiftPhoneAuthentication",
            ROBUX_GIFT_POST_CHECKOUT_SUCCESS: "RobuxGiftPostCheckoutSuccess",
            ROBUX_GIFT_POST_CHECKOUT_FAILURE: "RobuxGiftPostCheckoutFailure",
            ROBUX_GIFT_REQUEST_BANNER: "WebRobuxGiftRequestBanner",
            GIFT_CARD: "GiftCard",
            SHOP_GIFT_CARDS: "ShopGiftCards",
            ECONOMIC_RESTRICTION_ERROR: "EconomicRestrictionError",
            CREDIT_PACKAGE_PURCHASE_MODAL_WITH_TAX: "CreditPackagePurchaseModalWithTax",
            CREDIT_PACKAGE_PURCHASE_MODAL_WITHOUT_TAX: "CreditPackagePurchaseModalWithoutTax",
            CREDIT_CONVERSION_MODAL_WITH_TAX: "CreditConversionModalWithTax",
            CREDIT_CONVERSION_MODAL_WITHOUT_TAX: "CreditConversionModalWithoutTax",
            CREDIT_BALANCE_BIILLING_ADDRESS_FORM: "CreditBalanceBillingAddressForm",
            ROBUX_REDIRECT_BANNER: "RobuxRedirectBanner",
            NUVEI_REDIRECTED_TO_EXTERNAL_PAYMENT_PAGE: "NuveiRedirectedToExternalPaymentPage",
            NUVEI_SIMPLY_CONNECT_LOADED: "NuveiSimplyConnectLoaded",
            NUVEI_TRANSACTION_APPROVED: "NuveiTransactionApproved",
            NUVEI_TRANSACTION_DECLINED: "NuveiTransactionDeclined",
            NUVEI_TRANSACTION_PENDING: "NuveiTransactionPending",
            NUVEI_SESSION_TIMED_OUT: "NuveiSessionTimedOut",
            NUVEI: "Nuvei",
            ROBUX_GIFT: "RobuxGift",
            ROBUX_GIFT_MODAL: "RobuxGiftModal",
            POST_PURCHASE: "PostPurchase",
            FIRST_TIME_PURCHASE_CONSENT_MODAL: "FirstTimePurchaseConsentModal",
            ROBLOX_PLUS_LANDING: "RobloxPlusLanding",
            ROBLOX_PLUS_UPSELL_BANNER: "RobloxPlusUpsellBanner",
            ROBLOX_PLUS_BUY_ROBUX: "RobloxPlusBuyRobux",
            ROBUX_SEND_TRANSFERS: "RobuxSendTransfers",
            ROBUX_PENDING_TRANSFERS: "RobuxPendingTransfers",
            REDEEM_CREDIT_FOOTER: "RedeemCreditFooter",
            REDEEM_CREDIT_GET_PLUS_MODAL: "RedeemCreditGetPlusModal",
            IOS_PURCHASE_RESTART_ALERT: "IosPurchaseRestartAlert",
            NATIVE_PURCHASE_UI_SHOWN_TIME: "NativePurchaseUiShownTime"
        },
        _ = {
            VIEW_SHOWN: "ViewShown",
            USER_INPUT: "UserInput"
        },
        m = {
            FraudPaymentAuthorizationAttempt: "FraudPaymentAuthorizationAttempt",
            FraudVirtualEconomyAbuse: "FraudVirtualEconomyAbuse",
            FraudAbuseOfAffiliateSystem: "FraudAbuseOfAffiliateSystem",
            FraudAttemptedUnauthorizedPaymentMethodUse: "FraudAttemptedUnauthorizedPaymentMethodUse",
            FraudRepeatedRefundRequests: "FraudRepeatedRefundRequests",
            FraudSuspiciousRefundRequests: "FraudSuspiciousRefundRequests",
            FraudUnauthorizedPurchase: "FraudUnauthorizedPurchase",
            FraudUseOfUnauthorizedOffPlatformTransactions: "FraudUseOfUnauthorizedOffPlatformTransactions",
            FraudUseOfUnauthorizedPaymentMethod: "FraudUseOfUnauthorizedPaymentMethod",
            FraudSuspiciousAccountPatterns: "FraudSuspiciousAccountPatterns",
            FraudChargeback: "FraudChargeback",
            None: "None",
            PurchaseNotEnabled: "PurchaseNotEnabled",
            SpendLimitExceeded: "SpendLimitExceeded"
        },
        p = {
            U13PaymentModal: "U13PaymentModal",
            U13MonthlyThreshold1Modal: "U13MonthlyThreshold1Modal",
            U13MonthlyThreshold2Modal: "U13MonthlyThreshold2Modal",
            ParentalConsentWarningPaymentModal13To17: "ParentalConsentWarningPaymentModal13To17",
            RequireEmailVerification: "RequireEmailVerification",
            ...m,
            SUBMIT_ORDER: "Submit Order",
            REDEEM: "Redeem",
            BUY_ROBUX: "Buy Robux",
            BUY_ROBUX_AND_ITEM: "Buy Robux and Item",
            BUY_GIFT_CARD: "Buy Gift Card",
            CONTINUE_TO_CASHSTAR: "Continue to Cashstar",
            CONTINUE_TO_VNG: "Continue to Vng",
            EXTERNAL_LINK_MODAL: "External Link Modal",
            CANCEL: "Cancel",
            CLOSE: "Close",
            CONTINUE: "Continue",
            BACK: "Back",
            CARD_NUMBER_FORM: "Card Number Form",
            PAY_NOW: "Pay Now",
            PROCEED_TO_CHECKOUT: "Proceed to Checkout",
            SEND_RECEIPT_TO_EMAIL: "Send receipt to email",
            OPEN_EXTERNAL_LINK: "External Link",
            PAYMENT_METHOD_LIST: "Other payment method list",
            GIFT_CARD: "Gift Card",
            OK: "OK",
            PREMIUM: "Premium",
            GET_PREMIUM: "Get Premium",
            GO_TO_ROBUX_STORE: "Go To Robux Store",
            U13_PAYMENT_MODAL: "U13PaymentModal",
            U13_PARENTAL_CONSENT_WARNING: "U13ParentalConsentWarning",
            PAYMENT_MODAL_13_TO_17: "PaymentModal13To17",
            U13_MONTHLY_THRESHOLD_1_MODAL: "U13MonthlyThreshold1Modal",
            U13_MONTHLY_THRESHOLD_2_MODAL: "U13MonthlyThreshold2Modal",
            REQUIRE_EMAIL_VERIFICATION: "RequireEmailVerification",
            PURCHASE: "PURCHASE",
            REQUIRE_TWO_STEP_VERIFICATION: "RequireTwoStepVerification",
            ROBUX_ICON: "Robux Icon",
            PAGE_REFRESHED: "PageRefreshed",
            BACK_FORWARD_DETECTED: "Back/Forward Triggered",
            PAGE_LOADED_FROM_BACK_FORWARD_CACHE: "Back/Forward Triggered & Loaded From Cache",
            GO_TO_ROBUX_PURCHASE_PAGE: "Go to Robux Purchase Page",
            BILLING_EMAIL_NOT_PREFILLED: "Billing Email Not Prefilled",
            CREDIT_CONVERSION: "Credit Conversion",
            GO_TO_SETTINGS: "Go to Settings",
            PREPARE_PAYMENT_REQUEST_FETCH_FAILED: "PreparePaymentRequestFetchFailed",
            PREPARE_PAYMENT_REQUEST_FLOOD_CHECKED: "PreparePaymentRequestFloodChecked",
            PREPARE_PAYMENT_REQUEST_REDIRECTED: "PreparePaymentRequestRedirected",
            PAYMENT_METHOD_DROPDOWN: "Payment Method Dropdown",
            USE_DIFFERENT_PAYMENT_METHOD: "Use Different Payment Method",
            SAMSUNG_PAY_SELECTED: "Samsung Pay Selected",
            REDEEM_CREDIT_SELECTED: "Redeem Credit Selected",
            GIFT_NOW: "Gift now",
            CHECKOUT: "Checkout",
            VERIFY: "Verify",
            REQUEST_ROBUX: "Request Robux",
            BUY_NOW: "Buy Now",
            ADD_TO_CART: "Add to Cart",
            GIFT_CARD_AMOUNT_BUTTON: "GiftCardAmountButton",
            GIFT_CARD_TYPE_BUTTON: "GiftCardTypeButton",
            GIFT_CARD_RECIPIENT_TYPE_BUTTON: "GiftCardRecipientTypeButton",
            JOIN: "Join",
            BUY_REDIRECT: "Buy (redirect)",
            RETURN_TO_APP: "Return to app",
            SHOW_MORE: "Show more",
            SHOW_LESS: "Show less",
            TOGGLE_ON: "Toggle (on)",
            TOGGLE_OFF: "Toggle (off)",
            BUY: "Buy",
            PURCHASE_SUCCESS: "Purchase Success",
            CONFIRM: "Confirm",
            ROBLOX_PLUS_FREE_TRIAL: "RobloxPlusFreeTrial",
            ROBLOX_PLUS_SUBSCRIBE: "RobloxPlusSubscribe",
            ROBLOX_PLUS_BUNDLE_SHEET_OPENED: "RobloxPlusBundleSheetOpened",
            ROBLOX_PLUS_BUNDLE_TIER_SELECTED: "RobloxPlusBundleTierSelected",
            ROBLOX_PLUS_BILLING_PERIOD_SHEET_OPENED: "RobloxPlusBillingPeriodSheetOpened",
            ROBLOX_PLUS_BILLING_PERIOD_SELECTED: "RobloxPlusBillingPeriodSelected",
            ROBLOX_PLUS_BILLING_PERIOD_SHEET_DISMISSED: "RobloxPlusBillingPeriodSheetDismissed",
            ROBLOX_PLUS_LEARN_MORE: "RobloxPlusLearnMore",
            TRANSFER_SEND_BUTTON: "TransferSendButton",
            TRANSFER_SEND_SHEET: "TransferSendSheet",
            TRANSFER_SEND_USER_SELECTED: "TransferSendUserSelected",
            TRANSFER_PENDING_BUTTON: "TransferPendingButton",
            TRANSFER_PENDING_SHEET: "TransferPendingSheet",
            TRANSFER_PENDING_ACCEPT_CLICK: "TransferPendingAcceptClick",
            GET_PLUS_CLICKED: "GetPlusClicked",
            GET_ROBUX_CLICKED: "GetRobuxClicked",
            TIER_SELECTED: "TierSelected",
            SUBSCRIBE_CLICKED: "SubscribeClicked"
        },
        P = {
            ABANDONED: "Abandoned",
            FAILED_PREPARE_PAYMENT_REQUEST: "FailedPreparePaymentRequest",
            PASSED_PREPARE_PAYMENT_REQUEST: "PassedPreparePaymentRequest",
            PASSED_PREPARE_PAYMENT_REQUEST_WITH_TAX: "PassedPreparePaymentRequestWithTax",
            FAILED_UPDATE_ADDRESS_FOR_CHECKOUT_SESSION: "FailedUpdateAddressForCheckoutSession",
            PASSED_UPDATE_ADDRESS_FOR_CHECKOUT_SESSION: "PassedUpdateAddressForCheckoutSession",
            FAILED_GET_APPROXIMATE_USER_LOCATION: "FailedGetApproximateUserLocation",
            PASSED_GET_APPROXIMATE_USER_LOCATION: "PassedGetApproximateUserLocation",
            FAILED_PROCESS_PAYMENT: "FailedProcessPayment",
            PASSED_PROCESS_PAYMENT: "PassedProcessPayment",
            FAILED_GET_NEXT_PURCHASABLE_METADATA: "FailedGetNextPurchasableMetadata",
            PASSED_GET_NEXT_PURCHASABLE_METADATA: "PassedGetNextPurchasableMetadata",
            REDIRECTED_TO_PREMIUM_PAGE: "RedirectedToPremiumPage",
            EXISTING_FLOW_OVERWRITTEN_BY: "ExistingFlowOverwrittenBy",
            PAYMENT_FLOW_STARTED: "PaymentFlowStarted",
            BROWSER_PAGE_CHANGED: "BrowserPageChanged",
            CAPTCHA: "Captcha",
            SUCCESS: "Success",
            ERROR: "Error",
            CONTINUE: "Continue",
            CANCEL: "Cancel",
            PAYMENT_FLOW_ENDED: "PaymentFlowEnded"
        },
        S = {
            GAME_PASS: "Game Pass",
            PRIVATE_SERVER: "Private Server",
            BUNDLE: "Bundle",
            PACKAGE: "Package",
            PLACE: "Place",
            DEVELOPER_PRODUCT: "Product",
            SUBSCRIPTION: "Subscription"
        },
        R = {
            FLOW_CONTINUE: "payment-user-journey:continue",
            FLOW_REFERRER_VALID: "payment-user-journey:referrer-valid"
        };
    e.s(["ASSET_TYPE", 0, S, "COOKIE_NAME", 0, d, "COOKIE_TIMESPAN", 0, 600, "CUSTOM_EVENT", 0, R, "EVENT_NAME", 0, u, "PURCHASE_EVENT_TYPE", 0, _, "PURCHASE_STATUS", 0, P, "TRIGGERING_CONTEXT", 0, E, "UserPurchaseSettingFailureReason", 0, m, "VIEW_MESSAGE", 0, p, "VIEW_NAME", 0, c], 951605);
    let h = () => null != r.window && null != r.document,
        f = () => ({
            domain: `.${o.default.domain}`,
            maxAge: 600
        });
    class C {
        save() {
            if (!h()) return;
            let e = `${this.purchaseFlowUuid??""},${this.triggeringContext??""}`,
                {
                    domain: t,
                    maxAge: r
                } = f();
            (0, i.set)(d, e, {
                domain: t,
                maxAge: r
            })
        }
        static stop() {
            if (!h()) return;
            let {
                domain: e
            } = f();
            (0, i.delete)(d, {
                domain: e
            })
        }
        static loadFromCookie() {
            if (!h()) return null;
            let e = (0, i.get)(d);
            if (null == e || "" === e.value) return null;
            let [t, r] = e.value.split(",");
            return new C("" === t ? void 0 : t, null != r && (0, s.isStringEnum)(E, r) ? r : void 0)
        }
        constructor(e, r) {
            (0, t._)(this, "purchaseFlowUuid", void 0), (0, t._)(this, "triggeringContext", void 0), this.purchaseFlowUuid = e, this.triggeringContext = r
        }
    }
    var T = e.i(9701),
        g = e.i(333982);
    let U = (e, t) => {
        r.window?.Sentry?.captureException(e, t ? {
            tags: t
        } : void 0)
    };
    e.s(["captureException", 0, U], 248951);
    let A = {
            featureName: "PaymentsFlowAnalytics",
            team: "Economy > Payments & Fraud",
            features: {
                PaymentFlow: {
                    counters: ["UserPaymentFlowMidPurchaseStepTriggeredWithoutCtx", "UserPaymentFlowFlowEnded"],
                    errors: ["UserPaymentFlowWrongUsageOfMethod", "UserPaymentFlowSendEventWithoutUuidOrCtx", "UserPaymentFlowLoadPreExistingCtxError", "UserPaymentFlowSendStatusEventError", "UserPaymentFlowSendUserEventError", "UserPaymentFlowStartFlowError", "UserPaymentFlowFlowEndedWithoutTriggerContext"]
                }
            }
        },
        O = (0, g.createFireTelemetryCounter)(A.featureName),
        {
            trackCounter: x,
            trackError: L
        } = (0, T.createTrackers)(A, {
            publish: O,
            captureException: U,
            featureName: A.featureName
        }),
        w = "__rbxPaymentsFlowListenersAttached",
        v = e => {
            let {
                currentTarget: t
            } = e;
            return null != t && "innerText" in t && "string" == typeof t.innerText ? t.innerText : ""
        },
        I = function() {
            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
            for (let e of t)
                if (null != e && "" !== e) return e;
            return ""
        },
        y = "__rbxPaymentsFlowUuid",
        N = [{
            web: E.WEB_ROBUX_PURCHASE,
            webview: E.WEBVIEW_ROBUX_PURCHASE,
            mobileWeb: E.MOBILE_WEB_ROBUX_PURCHASE
        }, {
            web: E.WEB_PREMIUM_PURCHASE,
            webview: E.WEBVIEW_PREMIUM_PURCHASE,
            mobileWeb: E.MOBILE_WEB_PREMIUM_PURCHASE
        }, {
            web: E.WEB_ROBLOX_PLUS_PURCHASE,
            webview: E.WEBVIEW_ROBLOX_PLUS_PURCHASE,
            mobileWeb: E.MOBILE_WEB_ROBLOX_PLUS_PURCHASE
        }],
        M = new l.Tracker(new l.Configuration({
            baseUrl: `https://ecsv2.${o.default.domain}/www`
        }));
    class b {
        loadOrStartPaymentFlow() {
            if (null != r.window) try {
                if (this.purchaseFlowUuid || this.tryLoadPreExistingCtx(), this.purchaseFlowUuid || this.adoptSharedFlowUuid(), !this.purchaseFlowUuid) {
                    let e = b.getUrlAnalyticId();
                    this.purchaseFlowUuid = e ?? (0, a.generateRandomUuid)(), this.writePaymentFlowContextIntoCookie()
                }
                this.publishSharedFlowUuid()
            } catch (e) {
                L("UserPaymentFlowStartFlowError", null, e)
            }
        }
        getPaymentFlowUuid() {
            return this.adoptSharedFlowUuid(), this.purchaseFlowUuid
        }
        setPaymentFlowUuid(e) {
            this.purchaseFlowUuid = e, this.publishSharedFlowUuid(), this.writePaymentFlowContextIntoCookie()
        }
        setWebStack(e) {
            h() && (this.webStack = e)
        }
        startRobuxUpsellFlow(e) {
            let {
                assetType: t,
                isReseller: r = !1,
                itemId: a = ""
            } = e;
            this.eventMetadata.item_type = t, this.eventMetadata.item_id = a, t === S.GAME_PASS ? this.triggerContext = E.WEB_GAME_PASS_ROBUX_UPSELL : t === S.DEVELOPER_PRODUCT ? this.triggerContext = E.WEB_DEVELOPER_PRODUCT_ROBUX_UPSELL : t === S.PLACE ? this.triggerContext = E.WEB_PAID_GAME_ROBUX_UPSELL : t === S.PRIVATE_SERVER ? this.triggerContext = E.WEB_PRIVATE_SERVER_ROBUX_UPSELL : t === S.BUNDLE || t === S.PACKAGE ? this.triggerContext = E.WEB_CATALOG_BUNDLE_ITEM_ROBUX_UPSELL : r ? this.triggerContext = E.WEB_CATALOG_COLLECTIVE_ITEM_ROBUX_UPSELL : this.triggerContext = E.WEB_CATALOG_ROBUX_UPSELL, this.writePaymentFlowContextIntoCookie()
        }
        startRobloxPlusUpsellFlow(e) {
            let {
                assetType: t,
                isReseller: r = !1,
                itemId: a = ""
            } = e;
            if (this.eventMetadata.item_type = t, this.eventMetadata.item_id = a, r) this.triggerContext = E.WEB_CATALOG_RESALE_ITEM_PLUS_UPSELL;
            else switch (t) {
                case S.GAME_PASS:
                    this.triggerContext = E.WEB_GAME_PASS_PLUS_UPSELL;
                    break;
                case S.DEVELOPER_PRODUCT:
                    this.triggerContext = E.WEB_DEVELOPER_PRODUCT_PLUS_UPSELL;
                    break;
                case S.PRIVATE_SERVER:
                    this.triggerContext = E.WEB_PRIVATE_SERVER_PLUS_UPSELL;
                    break;
                case S.BUNDLE:
                case S.PACKAGE:
                    this.triggerContext = E.WEB_CATALOG_BUNDLE_ITEM_PLUS_UPSELL;
                    break;
                case S.SUBSCRIPTION:
                    this.triggerContext = E.WEB_DEVELOPER_SUBSCRIPTION_PLUS_UPSELL;
                    break;
                default:
                    this.triggerContext = E.WEB_CATALOG_SINGLE_ITEM_PLUS_UPSELL
            }
            this.writePaymentFlowContextIntoCookie()
        }
        sendUserPurchaseFlowEvent(e) {
            let {
                triggerContext: t,
                isMidPurchaseStep: r,
                viewName: a,
                purchaseEventType: n,
                viewMessage: o,
                eventMetadata: l = {},
                isTerminalView: i = !1
            } = e;
            if (h()) try {
                let e = b.reclassifyPlatformTriggeringContext({
                    triggerContext: t
                });
                if (this.eventMetadata = {
                        ...this.eventMetadata,
                        ...l
                    }, !a && !n && !o) return void L("UserPaymentFlowWrongUsageOfMethod");
                this.adoptSharedTriggerContext(), !this.triggerContext && (this.triggerContext = e, this.writePaymentFlowContextIntoCookie(), r && x("UserPaymentFlowMidPurchaseStepTriggeredWithoutCtx")), this.sendEvent({
                    eventName: u.USER_PURCHASE_FLOW,
                    viewName: a,
                    purchaseEventType: n,
                    viewMessage: o
                }), i && this.handleTerminalPage()
            } catch (e) {
                L("UserPaymentFlowSendUserEventError", null, e)
            }
        }
        sendUserPurchaseStatusEvent(e) {
            let {
                triggerContext: t,
                status: r,
                viewMessage: a,
                viewName: n
            } = e;
            if (h()) try {
                let e = b.reclassifyPlatformTriggeringContext({
                    triggerContext: t
                });
                if (!r && !a && !n) return void L("UserPaymentFlowWrongUsageOfMethod");
                this.adoptSharedTriggerContext(), this.triggerContext || (this.triggerContext = e, this.writePaymentFlowContextIntoCookie()), this.sendEvent({
                    eventName: u.USER_PURCHASE_STATUS,
                    viewName: n,
                    viewMessage: a,
                    status: r
                }), b.isTerminalView(n) && this.handleTerminalPage()
            } catch (e) {
                L("UserPaymentFlowSendStatusEventError", null, e)
            }
        }
        adoptSharedTriggerContext() {
            if (this.triggerContext) return;
            this.adoptSharedFlowUuid();
            let e = C.loadFromCookie();
            e?.triggeringContext != null && e.purchaseFlowUuid === this.purchaseFlowUuid && (this.triggerContext = e.triggeringContext)
        }
        adoptSharedFlowUuid() {
            let e = r.window;
            if (null == e || !(y in e)) return;
            let t = e[y];
            "string" == typeof t && "" !== t && (this.purchaseFlowUuid = t)
        }
        publishSharedFlowUuid() {
            let e = r.window;
            null != e && this.purchaseFlowUuid && Object.assign(e, {
                [y]: this.purchaseFlowUuid
            })
        }
        writePaymentFlowContextIntoCookie() {
            this.adoptSharedFlowUuid(), new C(this.purchaseFlowUuid, this.triggerContext).save()
        }
        sendEvent(e) {
            let {
                eventName: t,
                viewName: a,
                purchaseEventType: n,
                viewMessage: o,
                status: l
            } = e;
            if (this.adoptSharedFlowUuid(), !this.purchaseFlowUuid || !this.triggerContext) return void L("UserPaymentFlowSendEventWithoutUuidOrCtx");
            let i = r.window;
            if (null == i) return;
            let s = b.getReferralUrl(),
                d = b.extractView(s),
                u = b.extractView(i.location.href),
                E = JSON.stringify({
                    ...this.eventMetadata,
                    ...void 0 === this.webStack ? {} : {
                        webStack: this.webStack
                    }
                });
            M.sendEventViaImg({
                target: "www",
                localTime: new Date,
                eventType: t,
                context: this.triggerContext,
                additionalProperties: {
                    purchase_flow_uuid: this.purchaseFlowUuid,
                    view_name: a,
                    purchase_event_type: n,
                    view_message: o,
                    status: l,
                    refurl: s.substring(0, 200),
                    prev_view_path: d,
                    current_view_path: u,
                    event_metadata: E
                }
            })
        }
        tryLoadPreExistingCtx() {
            let e = r.document,
                t = r.window;
            if (null != e && null != t) try {
                let {
                    referrer: r
                } = e, a = r && new URL(r).hostname.endsWith(o.default.domain), n = t.performance.getEntriesByType("navigation")[0], l = (e => {
                    if (null != e && "type" in e && "string" == typeof e.type) return e.type
                })(n);
                if (!a && "back_forward" !== l && "reload" !== l) return;
                let i = C.loadFromCookie();
                i && (i.purchaseFlowUuid && (this.purchaseFlowUuid = i.purchaseFlowUuid), i.triggeringContext && (this.triggerContext = i.triggeringContext))
            } catch (e) {
                L("UserPaymentFlowLoadPreExistingCtxError", null, e)
            }
        }
        static extractView(e) {
            if (!e) return "";
            let t = new URL(e);
            return t.hostname.endsWith(`.${o.default.domain}`) ? t.pathname : "External"
        }
        handleTerminalPage() {
            if (this.purchaseFlowUuid) {
                if (!this.triggerContext) return void L("UserPaymentFlowFlowEndedWithoutTriggerContext");
                C.stop(), this.sendUserPurchaseStatusEvent({
                    triggerContext: this.triggerContext,
                    status: P.PAYMENT_FLOW_ENDED
                }), x("UserPaymentFlowFlowEnded")
            }
        }
        static isTerminalView(e) {
            return e === c.CHECKOUT_SUCCESS
        }
        static getReferralUrl() {
            let e = r.document,
                t = r.window;
            if (null == e) return "";
            try {
                return I(e.referrer, t?.frames.top?.document.referrer)
            } catch {
                return e.referrer
            }
        }
        static getUrlAnalyticId() {
            let e = r.window;
            return null == e ? null : new URLSearchParams(e.location.search).get("analyticId")
        }
        static reclassifyPlatformTriggeringContext(e) {
            let {
                triggerContext: t
            } = e, r = (0, n.getDeviceMeta)(), a = [r?.isAmazonApp, r?.isUWPApp, r?.isIosApp, r?.isAndroidApp].some(e => !0 === e);
            for (let {
                    web: e,
                    webview: r,
                    mobileWeb: n
                }
                of N) {
                if (t === e || t === r) return a ? r : e;
                if (t === n) return a ? r : n
            }
            return t
        }
        constructor() {
            if ((0, t._)(this, "purchaseFlowUuid", ""), (0, t._)(this, "triggerContext", void 0), (0, t._)(this, "ENUM_TRIGGERING_CONTEXT", E), (0, t._)(this, "ENUM_VIEW_NAME", c), (0, t._)(this, "ENUM_PURCHASE_EVENT_TYPE", _), (0, t._)(this, "ENUM_VIEW_MESSAGE", p), (0, t._)(this, "ENUM_PURCHASE_STATUS", P), (0, t._)(this, "ENUM_CUSTOM_EVENT", R), (0, t._)(this, "eventMetadata", {}), (0, t._)(this, "webStack", void 0), !h()) return;
            this.loadOrStartPaymentFlow()
        }
    }
    let B = new b;
    (e => {
        let t, a = r.document;
        if (null == a || null != (t = r.window) && (!0 === Reflect.get(t, w) || (Object.assign(t, {
                [w]: !0
            }), 0))) return;
        let n = () => {
            r.document?.querySelector("#header li a.robux-menu-btn")?.addEventListener("click", t => {
                e.sendUserPurchaseFlowEvent({
                    triggerContext: E.WEB_ROBUX_PURCHASE,
                    isMidPurchaseStep: !1,
                    viewName: c.NAVIGATION_MENU,
                    purchaseEventType: _.USER_INPUT,
                    viewMessage: v(t)
                })
            }), r.document?.getElementById("display-price-container") == null && (r.document?.querySelector("#item-details #upgrade-button")?.addEventListener("click", () => {
                e.sendUserPurchaseFlowEvent({
                    triggerContext: E.WEB_PREMIUM_PURCHASE,
                    isMidPurchaseStep: !1,
                    viewName: c.PREMIUM_UPSELL,
                    purchaseEventType: _.USER_INPUT,
                    viewMessage: p.GET_PREMIUM
                })
            }), r.document?.querySelector("#item-details .premium-prompt a")?.addEventListener("click", t => {
                e.sendUserPurchaseFlowEvent({
                    triggerContext: E.WEB_PREMIUM_PURCHASE,
                    isMidPurchaseStep: !1,
                    viewName: c.PREMIUM_UPSELL,
                    purchaseEventType: _.USER_INPUT,
                    viewMessage: v(t)
                })
            }))
        };
        "loading" === a.readyState ? a.addEventListener("DOMContentLoaded", n) : n()
    })(B), e.s(["paymentFlowAnalyticsService", 0, B], 144674)
}, 215941, e => {
    "use strict";
    var t = e.i(420482),
        r = e.i(706888),
        a = e.i(422957),
        n = e.i(434205),
        o = e.i(19836),
        l = t.forwardRef((e, t) => {
            let {
                children: r,
                width: a = 10,
                height: l = 5,
                ...i
            } = e;
            return (0, o.jsx)(n.Primitive.svg, {
                ...i,
                ref: t,
                width: a,
                height: l,
                viewBox: "0 0 30 10",
                preserveAspectRatio: "none",
                children: e.asChild ? r : (0, o.jsx)("polygon", {
                    points: "0,0 30,0 15,10"
                })
            })
        });
    l.displayName = "Arrow";
    var i = e.i(539181),
        s = e.i(734988),
        d = e.i(823499),
        u = e.i(13522),
        E = e.i(189192),
        c = "Popper",
        [_, m] = (0, s.createContextScope)(c),
        [p, P] = _(c),
        S = e => {
            let {
                __scopePopper: r,
                children: a
            } = e, [n, l] = t.useState(null);
            return (0, o.jsx)(p, {
                scope: r,
                anchor: n,
                onAnchorChange: l,
                children: a
            })
        };
    S.displayName = c;
    var R = "PopperAnchor",
        h = t.forwardRef((e, r) => {
            let {
                __scopePopper: a,
                virtualRef: l,
                ...s
            } = e, d = P(R, a), u = t.useRef(null), E = (0, i.useComposedRefs)(r, u);
            return t.useEffect(() => {
                d.onAnchorChange(l?.current || u.current)
            }), l ? null : (0, o.jsx)(n.Primitive.div, {
                ...s,
                ref: E
            })
        });
    h.displayName = R;
    var f = "PopperContent",
        [C, T] = _(f),
        g = t.forwardRef((e, l) => {
            let {
                __scopePopper: s,
                side: c = "bottom",
                sideOffset: _ = 0,
                align: m = "center",
                alignOffset: p = 0,
                arrowPadding: S = 0,
                avoidCollisions: R = !0,
                collisionBoundary: h = [],
                collisionPadding: T = 0,
                sticky: g = "partial",
                hideWhenDetached: U = !1,
                updatePositionStrategy: A = "optimized",
                onPlaced: O,
                ...v
            } = e, I = P(f, s), [y, N] = t.useState(null), M = (0, i.useComposedRefs)(l, e => N(e)), [b, B] = t.useState(null), D = (0, E.useSize)(b), F = D?.width ?? 0, W = D?.height ?? 0, G = "number" == typeof T ? T : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...T
            }, H = Array.isArray(h) ? h : [h], X = H.length > 0, k = {
                padding: G,
                boundary: H.filter(x),
                altBoundary: X
            }, {
                refs: V,
                floatingStyles: j,
                placement: Y,
                isPositioned: K,
                middlewareData: z
            } = (0, r.useFloating)({
                strategy: "fixed",
                placement: c + ("center" !== m ? "-" + m : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return (0, a.autoUpdate)(...t, {
                        animationFrame: "always" === A
                    })
                },
                elements: {
                    reference: I.anchor
                },
                middleware: [(0, r.offset)({
                    mainAxis: _ + W,
                    alignmentAxis: p
                }), R && (0, r.shift)({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === g ? (0, r.limitShift)() : void 0,
                    ...k
                }), R && (0, r.flip)({
                    ...k
                }), (0, r.size)({
                    ...k,
                    apply: e => {
                        let {
                            elements: t,
                            rects: r,
                            availableWidth: a,
                            availableHeight: n
                        } = e, {
                            width: o,
                            height: l
                        } = r.reference, i = t.floating.style;
                        i.setProperty("--radix-popper-available-width", `${a}px`), i.setProperty("--radix-popper-available-height", `${n}px`), i.setProperty("--radix-popper-anchor-width", `${o}px`), i.setProperty("--radix-popper-anchor-height", `${l}px`)
                    }
                }), b && (0, r.arrow)({
                    element: b,
                    padding: S
                }), L({
                    arrowWidth: F,
                    arrowHeight: W
                }), U && (0, r.hide)({
                    strategy: "referenceHidden",
                    ...k
                })]
            }), [q, $] = w(Y), Q = (0, d.useCallbackRef)(O);
            (0, u.useLayoutEffect)(() => {
                K && Q?.()
            }, [K, Q]);
            let J = z.arrow?.x,
                Z = z.arrow?.y,
                ee = z.arrow?.centerOffset !== 0,
                [et, er] = t.useState();
            return (0, u.useLayoutEffect)(() => {
                y && er(window.getComputedStyle(y).zIndex)
            }, [y]), (0, o.jsx)("div", {
                ref: V.setFloating,
                "data-radix-popper-content-wrapper": "",
                style: {
                    ...j,
                    transform: K ? j.transform : "translate(0, -200%)",
                    minWidth: "max-content",
                    zIndex: et,
                    "--radix-popper-transform-origin": [z.transformOrigin?.x, z.transformOrigin?.y].join(" "),
                    ...z.hide?.referenceHidden && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, o.jsx)(C, {
                    scope: s,
                    placedSide: q,
                    onArrowChange: B,
                    arrowX: J,
                    arrowY: Z,
                    shouldHideArrow: ee,
                    children: (0, o.jsx)(n.Primitive.div, {
                        "data-side": q,
                        "data-align": $,
                        ...v,
                        ref: M,
                        style: {
                            ...v.style,
                            animation: K ? void 0 : "none"
                        }
                    })
                })
            })
        });
    g.displayName = f;
    var U = "PopperArrow",
        A = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        O = t.forwardRef(function(e, t) {
            let {
                __scopePopper: r,
                ...a
            } = e, n = T(U, r), i = A[n.placedSide];
            return (0, o.jsx)("span", {
                ref: n.onArrowChange,
                style: {
                    position: "absolute",
                    left: n.arrowX,
                    top: n.arrowY,
                    [i]: 0,
                    transformOrigin: {
                        top: "",
                        right: "0 0",
                        bottom: "center 0",
                        left: "100% 0"
                    } [n.placedSide],
                    transform: {
                        top: "translateY(100%)",
                        right: "translateY(50%) rotate(90deg) translateX(-50%)",
                        bottom: "rotate(180deg)",
                        left: "translateY(50%) rotate(-90deg) translateX(50%)"
                    } [n.placedSide],
                    visibility: n.shouldHideArrow ? "hidden" : void 0
                },
                children: (0, o.jsx)(l, {
                    ...a,
                    ref: t,
                    style: {
                        ...a.style,
                        display: "block"
                    }
                })
            })
        });

    function x(e) {
        return null !== e
    }
    O.displayName = U;
    var L = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            let {
                placement: r,
                rects: a,
                middlewareData: n
            } = t, o = n.arrow?.centerOffset !== 0, l = o ? 0 : e.arrowWidth, i = o ? 0 : e.arrowHeight, [s, d] = w(r), u = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [d], E = (n.arrow?.x ?? 0) + l / 2, c = (n.arrow?.y ?? 0) + i / 2, _ = "", m = "";
            return "bottom" === s ? (_ = o ? u : `${E}px`, m = `${-i}px`) : "top" === s ? (_ = o ? u : `${E}px`, m = `${a.floating.height+i}px`) : "right" === s ? (_ = `${-i}px`, m = o ? u : `${c}px`) : "left" === s && (_ = `${a.floating.width+i}px`, m = o ? u : `${c}px`), {
                data: {
                    x: _,
                    y: m
                }
            }
        }
    });

    function w(e) {
        let [t, r = "center"] = e.split("-");
        return [t, r]
    }
    e.s(["Anchor", 0, h, "Arrow", 0, O, "Content", 0, g, "Root", 0, S, "createPopperScope", 0, m], 215941)
}, 986377, e => {
    "use strict";
    var t = e.i(420482),
        r = e.i(734988),
        a = e.i(539181),
        n = e.i(354981),
        o = e.i(19836);
    e.s(["createCollection", 0, function(e) {
        let l = e + "CollectionProvider",
            [i, s] = (0, r.createContextScope)(l),
            [d, u] = i(l, {
                collectionRef: {
                    current: null
                },
                itemMap: new Map
            }),
            E = e => {
                let {
                    scope: r,
                    children: a
                } = e, n = t.default.useRef(null), l = t.default.useRef(new Map).current;
                return (0, o.jsx)(d, {
                    scope: r,
                    itemMap: l,
                    collectionRef: n,
                    children: a
                })
            };
        E.displayName = l;
        let c = e + "CollectionSlot",
            _ = (0, n.createSlot)(c),
            m = t.default.forwardRef((e, t) => {
                let {
                    scope: r,
                    children: n
                } = e, l = u(c, r), i = (0, a.useComposedRefs)(t, l.collectionRef);
                return (0, o.jsx)(_, {
                    ref: i,
                    children: n
                })
            });
        m.displayName = c;
        let p = e + "CollectionItemSlot",
            P = "data-radix-collection-item",
            S = (0, n.createSlot)(p),
            R = t.default.forwardRef((e, r) => {
                let {
                    scope: n,
                    children: l,
                    ...i
                } = e, s = t.default.useRef(null), d = (0, a.useComposedRefs)(r, s), E = u(p, n);
                return t.default.useEffect(() => (E.itemMap.set(s, {
                    ref: s,
                    ...i
                }), () => void E.itemMap.delete(s))), (0, o.jsx)(S, {
                    ...{
                        [P]: ""
                    },
                    ref: d,
                    children: l
                })
            });
        return R.displayName = p, [{
            Provider: E,
            Slot: m,
            ItemSlot: R
        }, function(r) {
            let a = u(e + "CollectionConsumer", r);
            return t.default.useCallback(() => {
                let e = a.collectionRef.current;
                if (!e) return [];
                let t = Array.from(e.querySelectorAll(`[${P}]`));
                return Array.from(a.itemMap.values()).sort((e, r) => t.indexOf(e.ref.current) - t.indexOf(r.ref.current))
            }, [a.collectionRef, a.itemMap])
        }, s]
    }])
}, 559170, 255447, e => {
    "use strict";
    var t = e.i(941918),
        r = e.i(520250),
        a = e.i(847749),
        n = e.i(556010),
        o = e.i(7284),
        l = e.i(420482),
        i = e.i(301775),
        s = e.i(527069),
        d = e.i(775453),
        u = e.i(986377),
        E = e.i(539181),
        c = e.i(734988),
        _ = e.i(274879),
        m = e.i(430781),
        p = e.i(653279),
        P = e.i(5872),
        S = e.i(481010),
        R = e.i(215941),
        h = e.i(337537),
        f = e.i(434205),
        C = e.i(354981),
        T = e.i(823499),
        g = e.i(494334),
        U = e.i(13522),
        A = e.i(183901),
        O = e.i(19836),
        x = l.forwardRef((e, t) => (0, O.jsx)(f.Primitive.span, {
            ...e,
            ref: t,
            style: {
                position: "absolute",
                border: 0,
                width: 1,
                height: 1,
                padding: 0,
                margin: -1,
                overflow: "hidden",
                clip: "rect(0, 0, 0, 0)",
                whiteSpace: "nowrap",
                wordWrap: "normal",
                ...e.style
            }
        }));
    x.displayName = "VisuallyHidden";
    var L = e.i(73772),
        w = e.i(641501),
        v = [" ", "Enter", "ArrowUp", "ArrowDown"],
        I = [" ", "Enter"],
        y = "Select",
        [N, M, b] = (0, u.createCollection)(y),
        [B, D] = (0, c.createContextScope)(y, [b, R.createPopperScope]),
        F = (0, R.createPopperScope)(),
        [W, G] = B(y),
        [H, X] = B(y),
        k = e => {
            let {
                __scopeSelect: t,
                children: r,
                open: a,
                defaultOpen: n,
                onOpenChange: o,
                value: i,
                defaultValue: s,
                onValueChange: d,
                dir: u,
                name: E,
                autoComplete: c,
                disabled: m,
                required: p,
                form: P
            } = e, h = F(t), [f, C] = l.useState(null), [T, U] = l.useState(null), [A, x] = l.useState(!1), L = (0, _.useDirection)(u), [w = !1, v] = (0, g.useControllableState)({
                prop: a,
                defaultProp: n,
                onChange: o
            }), [I, y] = (0, g.useControllableState)({
                prop: i,
                defaultProp: s,
                onChange: d
            }), M = l.useRef(null), b = !f || P || !!f.closest("form"), [B, D] = l.useState(new Set), G = Array.from(B).map(e => e.props.value).join(";");
            return (0, O.jsx)(R.Root, {
                ...h,
                children: (0, O.jsxs)(W, {
                    required: p,
                    scope: t,
                    trigger: f,
                    onTriggerChange: C,
                    valueNode: T,
                    onValueNodeChange: U,
                    valueNodeHasChildren: A,
                    onValueNodeHasChildrenChange: x,
                    contentId: (0, S.useId)(),
                    value: I,
                    onValueChange: y,
                    open: w,
                    onOpenChange: v,
                    dir: L,
                    triggerPointerDownPosRef: M,
                    disabled: m,
                    children: [(0, O.jsx)(N.Provider, {
                        scope: t,
                        children: (0, O.jsx)(H, {
                            scope: e.__scopeSelect,
                            onNativeOptionAdd: l.useCallback(e => {
                                D(t => new Set(t).add(e))
                            }, []),
                            onNativeOptionRemove: l.useCallback(e => {
                                D(t => {
                                    let r = new Set(t);
                                    return r.delete(e), r
                                })
                            }, []),
                            children: r
                        })
                    }), b ? (0, O.jsxs)(eU, {
                        "aria-hidden": !0,
                        required: p,
                        tabIndex: -1,
                        name: E,
                        autoComplete: c,
                        value: I,
                        onChange: e => y(e.target.value),
                        disabled: m,
                        form: P,
                        children: [void 0 === I ? (0, O.jsx)("option", {
                            value: ""
                        }) : null, Array.from(B)]
                    }, G) : null]
                })
            })
        };
    k.displayName = y;
    var V = "SelectTrigger",
        j = l.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                disabled: a = !1,
                ...n
            } = e, o = F(r), i = G(V, r), s = i.disabled || a, u = (0, E.useComposedRefs)(t, i.onTriggerChange), c = M(r), _ = l.useRef("touch"), [m, p, P] = eA(e => {
                let t = c().filter(e => !e.disabled),
                    r = t.find(e => e.value === i.value),
                    a = eO(t, e, r);
                void 0 !== a && i.onValueChange(a.value)
            }), S = e => {
                s || (i.onOpenChange(!0), P()), e && (i.triggerPointerDownPosRef.current = {
                    x: Math.round(e.pageX),
                    y: Math.round(e.pageY)
                })
            };
            return (0, O.jsx)(R.Anchor, {
                asChild: !0,
                ...o,
                children: (0, O.jsx)(f.Primitive.button, {
                    type: "button",
                    role: "combobox",
                    "aria-controls": i.contentId,
                    "aria-expanded": i.open,
                    "aria-required": i.required,
                    "aria-autocomplete": "none",
                    dir: i.dir,
                    "data-state": i.open ? "open" : "closed",
                    disabled: s,
                    "data-disabled": s ? "" : void 0,
                    "data-placeholder": eg(i.value) ? "" : void 0,
                    ...n,
                    ref: u,
                    onClick: (0, d.composeEventHandlers)(n.onClick, e => {
                        e.currentTarget.focus(), "mouse" !== _.current && S(e)
                    }),
                    onPointerDown: (0, d.composeEventHandlers)(n.onPointerDown, e => {
                        _.current = e.pointerType;
                        let t = e.target;
                        t.hasPointerCapture(e.pointerId) && t.releasePointerCapture(e.pointerId), 0 === e.button && !1 === e.ctrlKey && "mouse" === e.pointerType && (S(e), e.preventDefault())
                    }),
                    onKeyDown: (0, d.composeEventHandlers)(n.onKeyDown, e => {
                        let t = "" !== m.current;
                        e.ctrlKey || e.altKey || e.metaKey || 1 !== e.key.length || p(e.key), (!t || " " !== e.key) && v.includes(e.key) && (S(), e.preventDefault())
                    })
                })
            })
        });
    j.displayName = V;
    var Y = "SelectValue",
        K = l.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                className: a,
                style: n,
                children: o,
                placeholder: l = "",
                ...i
            } = e, s = G(Y, r), {
                onValueNodeHasChildrenChange: d
            } = s, u = void 0 !== o, c = (0, E.useComposedRefs)(t, s.onValueNodeChange);
            return (0, U.useLayoutEffect)(() => {
                d(u)
            }, [d, u]), (0, O.jsx)(f.Primitive.span, {
                ...i,
                ref: c,
                style: {
                    pointerEvents: "none"
                },
                children: eg(s.value) ? (0, O.jsx)(O.Fragment, {
                    children: l
                }) : o
            })
        });
    K.displayName = Y;
    var z = l.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            children: a,
            ...n
        } = e;
        return (0, O.jsx)(f.Primitive.span, {
            "aria-hidden": !0,
            ...n,
            ref: t,
            children: a || "▼"
        })
    });
    z.displayName = "SelectIcon";
    var q = e => (0, O.jsx)(h.Portal, {
        asChild: !0,
        ...e
    });
    q.displayName = "SelectPortal";
    var $ = "SelectContent",
        Q = l.forwardRef((e, t) => {
            let r = G($, e.__scopeSelect),
                [a, n] = l.useState();
            return ((0, U.useLayoutEffect)(() => {
                n(new DocumentFragment)
            }, []), r.open) ? (0, O.jsx)(et, {
                ...e,
                ref: t
            }) : a ? i.createPortal((0, O.jsx)(J, {
                scope: e.__scopeSelect,
                children: (0, O.jsx)(N.Slot, {
                    scope: e.__scopeSelect,
                    children: (0, O.jsx)("div", {
                        children: e.children
                    })
                })
            }), a) : null
        });
    Q.displayName = $;
    var [J, Z] = B($), ee = (0, C.createSlot)("SelectContent.RemoveScroll"), et = l.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            position: a = "item-aligned",
            onCloseAutoFocus: n,
            onEscapeKeyDown: o,
            onPointerDownOutside: i,
            side: s,
            sideOffset: u,
            align: c,
            alignOffset: _,
            arrowPadding: S,
            collisionBoundary: R,
            collisionPadding: h,
            sticky: f,
            hideWhenDetached: C,
            avoidCollisions: T,
            ...g
        } = e, U = G($, r), [A, x] = l.useState(null), [v, I] = l.useState(null), y = (0, E.useComposedRefs)(t, e => x(e)), [N, b] = l.useState(null), [B, D] = l.useState(null), F = M(r), [W, H] = l.useState(!1), X = l.useRef(!1);
        l.useEffect(() => {
            if (A) return (0, L.hideOthers)(A)
        }, [A]), (0, p.useFocusGuards)();
        let k = l.useCallback(e => {
                let [t, ...r] = F().map(e => e.ref.current), [a] = r.slice(-1), n = document.activeElement;
                for (let r of e)
                    if (r === n || (r?.scrollIntoView({
                            block: "nearest"
                        }), r === t && v && (v.scrollTop = 0), r === a && v && (v.scrollTop = v.scrollHeight), r?.focus(), document.activeElement !== n)) return
            }, [F, v]),
            V = l.useCallback(() => k([N, A]), [k, N, A]);
        l.useEffect(() => {
            W && V()
        }, [W, V]);
        let {
            onOpenChange: j,
            triggerPointerDownPosRef: Y
        } = U;
        l.useEffect(() => {
            if (A) {
                let e = {
                        x: 0,
                        y: 0
                    },
                    t = t => {
                        e = {
                            x: Math.abs(Math.round(t.pageX) - (Y.current?.x ?? 0)),
                            y: Math.abs(Math.round(t.pageY) - (Y.current?.y ?? 0))
                        }
                    },
                    r = r => {
                        e.x <= 10 && e.y <= 10 ? r.preventDefault() : A.contains(r.target) || j(!1), document.removeEventListener("pointermove", t), Y.current = null
                    };
                return null !== Y.current && (document.addEventListener("pointermove", t), document.addEventListener("pointerup", r, {
                    capture: !0,
                    once: !0
                })), () => {
                    document.removeEventListener("pointermove", t), document.removeEventListener("pointerup", r, {
                        capture: !0
                    })
                }
            }
        }, [A, j, Y]), l.useEffect(() => {
            let e = () => j(!1);
            return window.addEventListener("blur", e), window.addEventListener("resize", e), () => {
                window.removeEventListener("blur", e), window.removeEventListener("resize", e)
            }
        }, [j]);
        let [K, z] = eA(e => {
            let t = F().filter(e => !e.disabled),
                r = t.find(e => e.ref.current === document.activeElement),
                a = eO(t, e, r);
            a && setTimeout(() => a.ref.current.focus())
        }), q = l.useCallback((e, t, r) => {
            let a = !X.current && !r;
            (void 0 !== U.value && U.value === t || a) && (b(e), a && (X.current = !0))
        }, [U.value]), Q = l.useCallback(() => A?.focus(), [A]), Z = l.useCallback((e, t, r) => {
            let a = !X.current && !r;
            (void 0 !== U.value && U.value === t || a) && D(e)
        }, [U.value]), et = "popper" === a ? ea : er, en = et === ea ? {
            side: s,
            sideOffset: u,
            align: c,
            alignOffset: _,
            arrowPadding: S,
            collisionBoundary: R,
            collisionPadding: h,
            sticky: f,
            hideWhenDetached: C,
            avoidCollisions: T
        } : {};
        return (0, O.jsx)(J, {
            scope: r,
            content: A,
            viewport: v,
            onViewportChange: I,
            itemRefCallback: q,
            selectedItem: N,
            onItemLeave: Q,
            itemTextRefCallback: Z,
            focusSelectedItem: V,
            selectedItemText: B,
            position: a,
            isPositioned: W,
            searchRef: K,
            children: (0, O.jsx)(w.RemoveScroll, {
                as: ee,
                allowPinchZoom: !0,
                children: (0, O.jsx)(P.FocusScope, {
                    asChild: !0,
                    trapped: U.open,
                    onMountAutoFocus: e => {
                        e.preventDefault()
                    },
                    onUnmountAutoFocus: (0, d.composeEventHandlers)(n, e => {
                        U.trigger?.focus({
                            preventScroll: !0
                        }), e.preventDefault()
                    }),
                    children: (0, O.jsx)(m.DismissableLayer, {
                        asChild: !0,
                        disableOutsidePointerEvents: !0,
                        onEscapeKeyDown: o,
                        onPointerDownOutside: i,
                        onFocusOutside: e => e.preventDefault(),
                        onDismiss: () => U.onOpenChange(!1),
                        children: (0, O.jsx)(et, {
                            role: "listbox",
                            id: U.contentId,
                            "data-state": U.open ? "open" : "closed",
                            dir: U.dir,
                            onContextMenu: e => e.preventDefault(),
                            ...g,
                            ...en,
                            onPlaced: () => H(!0),
                            ref: y,
                            style: {
                                display: "flex",
                                flexDirection: "column",
                                outline: "none",
                                ...g.style
                            },
                            onKeyDown: (0, d.composeEventHandlers)(g.onKeyDown, e => {
                                let t = e.ctrlKey || e.altKey || e.metaKey;
                                if ("Tab" === e.key && e.preventDefault(), t || 1 !== e.key.length || z(e.key), ["ArrowUp", "ArrowDown", "Home", "End"].includes(e.key)) {
                                    let t = F().filter(e => !e.disabled).map(e => e.ref.current);
                                    if (["ArrowUp", "End"].includes(e.key) && (t = t.slice().reverse()), ["ArrowUp", "ArrowDown"].includes(e.key)) {
                                        let r = e.target,
                                            a = t.indexOf(r);
                                        t = t.slice(a + 1)
                                    }
                                    setTimeout(() => k(t)), e.preventDefault()
                                }
                            })
                        })
                    })
                })
            })
        })
    });
    et.displayName = "SelectContentImpl";
    var er = l.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            onPlaced: a,
            ...n
        } = e, o = G($, r), i = Z($, r), [d, u] = l.useState(null), [c, _] = l.useState(null), m = (0, E.useComposedRefs)(t, e => _(e)), p = M(r), P = l.useRef(!1), S = l.useRef(!0), {
            viewport: R,
            selectedItem: h,
            selectedItemText: C,
            focusSelectedItem: T
        } = i, g = l.useCallback(() => {
            if (o.trigger && o.valueNode && d && c && R && h && C) {
                let e = o.trigger.getBoundingClientRect(),
                    t = c.getBoundingClientRect(),
                    r = o.valueNode.getBoundingClientRect(),
                    n = C.getBoundingClientRect();
                if ("rtl" !== o.dir) {
                    let a = n.left - t.left,
                        o = r.left - a,
                        l = e.left - o,
                        i = e.width + l,
                        u = Math.max(i, t.width),
                        E = window.innerWidth - 10,
                        c = (0, s.clamp)(o, [10, Math.max(10, E - u)]);
                    d.style.minWidth = i + "px", d.style.left = c + "px"
                } else {
                    let a = t.right - n.right,
                        o = window.innerWidth - r.right - a,
                        l = window.innerWidth - e.right - o,
                        i = e.width + l,
                        u = Math.max(i, t.width),
                        E = window.innerWidth - 10,
                        c = (0, s.clamp)(o, [10, Math.max(10, E - u)]);
                    d.style.minWidth = i + "px", d.style.right = c + "px"
                }
                let l = p(),
                    i = window.innerHeight - 20,
                    u = R.scrollHeight,
                    E = window.getComputedStyle(c),
                    _ = parseInt(E.borderTopWidth, 10),
                    m = parseInt(E.paddingTop, 10),
                    S = parseInt(E.borderBottomWidth, 10),
                    f = _ + m + u + parseInt(E.paddingBottom, 10) + S,
                    T = Math.min(5 * h.offsetHeight, f),
                    g = window.getComputedStyle(R),
                    U = parseInt(g.paddingTop, 10),
                    A = parseInt(g.paddingBottom, 10),
                    O = e.top + e.height / 2 - 10,
                    x = h.offsetHeight / 2,
                    L = _ + m + (h.offsetTop + x);
                if (L <= O) {
                    let e = l.length > 0 && h === l[l.length - 1].ref.current;
                    d.style.bottom = "0px";
                    let t = Math.max(i - O, x + (e ? A : 0) + (c.clientHeight - R.offsetTop - R.offsetHeight) + S);
                    d.style.height = L + t + "px"
                } else {
                    let e = l.length > 0 && h === l[0].ref.current;
                    d.style.top = "0px";
                    let t = Math.max(O, _ + R.offsetTop + (e ? U : 0) + x);
                    d.style.height = t + (f - L) + "px", R.scrollTop = L - O + R.offsetTop
                }
                d.style.margin = "10px 0", d.style.minHeight = T + "px", d.style.maxHeight = i + "px", a?.(), requestAnimationFrame(() => P.current = !0)
            }
        }, [p, o.trigger, o.valueNode, d, c, R, h, C, o.dir, a]);
        (0, U.useLayoutEffect)(() => g(), [g]);
        let [A, x] = l.useState();
        (0, U.useLayoutEffect)(() => {
            c && x(window.getComputedStyle(c).zIndex)
        }, [c]);
        let L = l.useCallback(e => {
            e && !0 === S.current && (g(), T?.(), S.current = !1)
        }, [g, T]);
        return (0, O.jsx)(en, {
            scope: r,
            contentWrapper: d,
            shouldExpandOnScrollRef: P,
            onScrollButtonChange: L,
            children: (0, O.jsx)("div", {
                ref: u,
                style: {
                    display: "flex",
                    flexDirection: "column",
                    position: "fixed",
                    zIndex: A
                },
                children: (0, O.jsx)(f.Primitive.div, {
                    ...n,
                    ref: m,
                    style: {
                        boxSizing: "border-box",
                        maxHeight: "100%",
                        ...n.style
                    }
                })
            })
        })
    });
    er.displayName = "SelectItemAlignedPosition";
    var ea = l.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            align: a = "start",
            collisionPadding: n = 10,
            ...o
        } = e, l = F(r);
        return (0, O.jsx)(R.Content, {
            ...l,
            ...o,
            ref: t,
            align: a,
            collisionPadding: n,
            style: {
                boxSizing: "border-box",
                ...o.style,
                "--radix-select-content-transform-origin": "var(--radix-popper-transform-origin)",
                "--radix-select-content-available-width": "var(--radix-popper-available-width)",
                "--radix-select-content-available-height": "var(--radix-popper-available-height)",
                "--radix-select-trigger-width": "var(--radix-popper-anchor-width)",
                "--radix-select-trigger-height": "var(--radix-popper-anchor-height)"
            }
        })
    });
    ea.displayName = "SelectPopperPosition";
    var [en, eo] = B($, {}), el = "SelectViewport", ei = l.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            nonce: a,
            ...n
        } = e, o = Z(el, r), i = eo(el, r), s = (0, E.useComposedRefs)(t, o.onViewportChange), u = l.useRef(0);
        return (0, O.jsxs)(O.Fragment, {
            children: [(0, O.jsx)("style", {
                dangerouslySetInnerHTML: {
                    __html: "[data-radix-select-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-select-viewport]::-webkit-scrollbar{display:none}"
                },
                nonce: a
            }), (0, O.jsx)(N.Slot, {
                scope: r,
                children: (0, O.jsx)(f.Primitive.div, {
                    "data-radix-select-viewport": "",
                    role: "presentation",
                    ...n,
                    ref: s,
                    style: {
                        position: "relative",
                        flex: 1,
                        overflow: "hidden auto",
                        ...n.style
                    },
                    onScroll: (0, d.composeEventHandlers)(n.onScroll, e => {
                        let t = e.currentTarget,
                            {
                                contentWrapper: r,
                                shouldExpandOnScrollRef: a
                            } = i;
                        if (a?.current && r) {
                            let e = Math.abs(u.current - t.scrollTop);
                            if (e > 0) {
                                let a = window.innerHeight - 20,
                                    n = Math.max(parseFloat(r.style.minHeight), parseFloat(r.style.height));
                                if (n < a) {
                                    let o = n + e,
                                        l = Math.min(a, o),
                                        i = o - l;
                                    r.style.height = l + "px", "0px" === r.style.bottom && (t.scrollTop = i > 0 ? i : 0, r.style.justifyContent = "flex-end")
                                }
                            }
                        }
                        u.current = t.scrollTop
                    })
                })
            })]
        })
    });
    ei.displayName = el;
    var es = "SelectGroup",
        [ed, eu] = B(es);
    l.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...a
        } = e, n = (0, S.useId)();
        return (0, O.jsx)(ed, {
            scope: r,
            id: n,
            children: (0, O.jsx)(f.Primitive.div, {
                role: "group",
                "aria-labelledby": n,
                ...a,
                ref: t
            })
        })
    }).displayName = es;
    var eE = "SelectLabel";
    l.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...a
        } = e, n = eu(eE, r);
        return (0, O.jsx)(f.Primitive.div, {
            id: n.id,
            ...a,
            ref: t
        })
    }).displayName = eE;
    var ec = "SelectItem",
        [e_, em] = B(ec),
        ep = l.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                value: a,
                disabled: n = !1,
                textValue: o,
                ...i
            } = e, s = G(ec, r), u = Z(ec, r), c = s.value === a, [_, m] = l.useState(o ?? ""), [p, P] = l.useState(!1), R = (0, E.useComposedRefs)(t, e => u.itemRefCallback?.(e, a, n)), h = (0, S.useId)(), C = l.useRef("touch"), T = () => {
                n || (s.onValueChange(a), s.onOpenChange(!1))
            };
            if ("" === a) throw Error("A <Select.Item /> must have a value prop that is not an empty string. This is because the Select value can be set to an empty string to clear the selection and show the placeholder.");
            return (0, O.jsx)(e_, {
                scope: r,
                value: a,
                disabled: n,
                textId: h,
                isSelected: c,
                onItemTextChange: l.useCallback(e => {
                    m(t => t || (e?.textContent ?? "").trim())
                }, []),
                children: (0, O.jsx)(N.ItemSlot, {
                    scope: r,
                    value: a,
                    disabled: n,
                    textValue: _,
                    children: (0, O.jsx)(f.Primitive.div, {
                        role: "option",
                        "aria-labelledby": h,
                        "data-highlighted": p ? "" : void 0,
                        "aria-selected": c && p,
                        "data-state": c ? "checked" : "unchecked",
                        "aria-disabled": n || void 0,
                        "data-disabled": n ? "" : void 0,
                        tabIndex: n ? void 0 : -1,
                        ...i,
                        ref: R,
                        onFocus: (0, d.composeEventHandlers)(i.onFocus, () => P(!0)),
                        onBlur: (0, d.composeEventHandlers)(i.onBlur, () => P(!1)),
                        onClick: (0, d.composeEventHandlers)(i.onClick, () => {
                            "mouse" !== C.current && T()
                        }),
                        onPointerUp: (0, d.composeEventHandlers)(i.onPointerUp, () => {
                            "mouse" === C.current && T()
                        }),
                        onPointerDown: (0, d.composeEventHandlers)(i.onPointerDown, e => {
                            C.current = e.pointerType
                        }),
                        onPointerMove: (0, d.composeEventHandlers)(i.onPointerMove, e => {
                            C.current = e.pointerType, n ? u.onItemLeave?.() : "mouse" === C.current && e.currentTarget.focus({
                                preventScroll: !0
                            })
                        }),
                        onPointerLeave: (0, d.composeEventHandlers)(i.onPointerLeave, e => {
                            e.currentTarget === document.activeElement && u.onItemLeave?.()
                        }),
                        onKeyDown: (0, d.composeEventHandlers)(i.onKeyDown, e => {
                            (u.searchRef?.current === "" || " " !== e.key) && (I.includes(e.key) && T(), " " === e.key && e.preventDefault())
                        })
                    })
                })
            })
        });
    ep.displayName = ec;
    var eP = "SelectItemText",
        eS = l.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                className: a,
                style: n,
                ...o
            } = e, s = G(eP, r), d = Z(eP, r), u = em(eP, r), c = X(eP, r), [_, m] = l.useState(null), p = (0, E.useComposedRefs)(t, e => m(e), u.onItemTextChange, e => d.itemTextRefCallback?.(e, u.value, u.disabled)), P = _?.textContent, S = l.useMemo(() => (0, O.jsx)("option", {
                value: u.value,
                disabled: u.disabled,
                children: P
            }, u.value), [u.disabled, u.value, P]), {
                onNativeOptionAdd: R,
                onNativeOptionRemove: h
            } = c;
            return (0, U.useLayoutEffect)(() => (R(S), () => h(S)), [R, h, S]), (0, O.jsxs)(O.Fragment, {
                children: [(0, O.jsx)(f.Primitive.span, {
                    id: u.textId,
                    ...o,
                    ref: p
                }), u.isSelected && s.valueNode && !s.valueNodeHasChildren ? i.createPortal(o.children, s.valueNode) : null]
            })
        });
    eS.displayName = eP;
    var eR = "SelectItemIndicator";
    l.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...a
        } = e;
        return em(eR, r).isSelected ? (0, O.jsx)(f.Primitive.span, {
            "aria-hidden": !0,
            ...a,
            ref: t
        }) : null
    }).displayName = eR;
    var eh = "SelectScrollUpButton";
    l.forwardRef((e, t) => {
        let r = Z(eh, e.__scopeSelect),
            a = eo(eh, e.__scopeSelect),
            [n, o] = l.useState(!1),
            i = (0, E.useComposedRefs)(t, a.onScrollButtonChange);
        return (0, U.useLayoutEffect)(() => {
            if (r.viewport && r.isPositioned) {
                let e = function() {
                        o(t.scrollTop > 0)
                    },
                    t = r.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [r.viewport, r.isPositioned]), n ? (0, O.jsx)(eC, {
            ...e,
            ref: i,
            onAutoScroll: () => {
                let {
                    viewport: e,
                    selectedItem: t
                } = r;
                e && t && (e.scrollTop = e.scrollTop - t.offsetHeight)
            }
        }) : null
    }).displayName = eh;
    var ef = "SelectScrollDownButton";
    l.forwardRef((e, t) => {
        let r = Z(ef, e.__scopeSelect),
            a = eo(ef, e.__scopeSelect),
            [n, o] = l.useState(!1),
            i = (0, E.useComposedRefs)(t, a.onScrollButtonChange);
        return (0, U.useLayoutEffect)(() => {
            if (r.viewport && r.isPositioned) {
                let e = function() {
                        let e = t.scrollHeight - t.clientHeight;
                        o(Math.ceil(t.scrollTop) < e)
                    },
                    t = r.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [r.viewport, r.isPositioned]), n ? (0, O.jsx)(eC, {
            ...e,
            ref: i,
            onAutoScroll: () => {
                let {
                    viewport: e,
                    selectedItem: t
                } = r;
                e && t && (e.scrollTop = e.scrollTop + t.offsetHeight)
            }
        }) : null
    }).displayName = ef;
    var eC = l.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            onAutoScroll: a,
            ...n
        } = e, o = Z("SelectScrollButton", r), i = l.useRef(null), s = M(r), u = l.useCallback(() => {
            null !== i.current && (window.clearInterval(i.current), i.current = null)
        }, []);
        return l.useEffect(() => () => u(), [u]), (0, U.useLayoutEffect)(() => {
            let e = s().find(e => e.ref.current === document.activeElement);
            e?.ref.current?.scrollIntoView({
                block: "nearest"
            })
        }, [s]), (0, O.jsx)(f.Primitive.div, {
            "aria-hidden": !0,
            ...n,
            ref: t,
            style: {
                flexShrink: 0,
                ...n.style
            },
            onPointerDown: (0, d.composeEventHandlers)(n.onPointerDown, () => {
                null === i.current && (i.current = window.setInterval(a, 50))
            }),
            onPointerMove: (0, d.composeEventHandlers)(n.onPointerMove, () => {
                o.onItemLeave?.(), null === i.current && (i.current = window.setInterval(a, 50))
            }),
            onPointerLeave: (0, d.composeEventHandlers)(n.onPointerLeave, () => {
                u()
            })
        })
    });
    l.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...a
        } = e;
        return (0, O.jsx)(f.Primitive.div, {
            "aria-hidden": !0,
            ...a,
            ref: t
        })
    }).displayName = "SelectSeparator";
    var eT = "SelectArrow";

    function eg(e) {
        return "" === e || void 0 === e
    }
    l.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...a
        } = e, n = F(r), o = G(eT, r), l = Z(eT, r);
        return o.open && "popper" === l.position ? (0, O.jsx)(R.Arrow, {
            ...n,
            ...a,
            ref: t
        }) : null
    }).displayName = eT;
    var eU = l.forwardRef((e, t) => {
        let {
            value: r,
            ...a
        } = e, n = l.useRef(null), o = (0, E.useComposedRefs)(t, n), i = (0, A.usePrevious)(r);
        return l.useEffect(() => {
            let e = n.current,
                t = Object.getOwnPropertyDescriptor(window.HTMLSelectElement.prototype, "value").set;
            if (i !== r && t) {
                let a = new Event("change", {
                    bubbles: !0
                });
                t.call(e, r), e.dispatchEvent(a)
            }
        }, [i, r]), (0, O.jsx)(x, {
            asChild: !0,
            children: (0, O.jsx)("select", {
                ...a,
                ref: o,
                defaultValue: r
            })
        })
    });

    function eA(e) {
        let t = (0, T.useCallbackRef)(e),
            r = l.useRef(""),
            a = l.useRef(0),
            n = l.useCallback(e => {
                let n = r.current + e;
                t(n),
                    function e(t) {
                        r.current = t, window.clearTimeout(a.current), "" !== t && (a.current = window.setTimeout(() => e(""), 1e3))
                    }(n)
            }, [t]),
            o = l.useCallback(() => {
                r.current = "", window.clearTimeout(a.current)
            }, []);
        return l.useEffect(() => () => window.clearTimeout(a.current), []), [r, n, o]
    }

    function eO(e, t, r) {
        var a, n;
        let o = t.length > 1 && Array.from(t).every(e => e === t[0]) ? t[0] : t,
            l = r ? e.indexOf(r) : -1,
            i = (a = e, n = Math.max(l, 0), a.map((e, t) => a[(n + t) % a.length]));
        1 === o.length && (i = i.filter(e => e !== r));
        let s = i.find(e => e.textValue.toLowerCase().startsWith(o.toLowerCase()));
        return s !== r ? s : void 0
    }
    eU.displayName = "BubbleSelect";
    let ex = (0, l.createContext)(null),
        eL = {
            XSmall: "size-300",
            Small: "size-400",
            Medium: "size-500",
            Large: "size-600"
        },
        ew = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        ev = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium",
            Large: "text-title-large"
        },
        eI = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        ey = {
            XSmall: "gap-xsmall",
            Small: "gap-small",
            Medium: "gap-small",
            Large: "gap-small"
        },
        eN = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        eM = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        eb = (0, l.forwardRef)((e, i) => {
            let {
                label: s,
                labelTooltip: d,
                ariaLabelledBy: u,
                ariaLabel: E,
                className: c,
                size: _,
                variant: m = "Standard",
                value: p,
                placeholder: P,
                isDisabled: S,
                hasError: R,
                hint: h,
                onValueChange: f,
                onOpenChange: C,
                children: T
            } = e, g = (0, r.default)(), U = (0, l.useMemo)(() => ({
                size: _
            }), [_]), A = s ? l.default.createElement("span", {
                id: g,
                className: (0, o.default)(ev[_], "content-emphasis")
            }, s) : null;
            return l.default.createElement(ex.Provider, {
                value: U
            }, l.default.createElement("div", {
                className: (0, o.default)("flex flex-col", S && ["opacity-[0.5]", "pointer-events-none"], ey[_], c)
            }, A && (d ? l.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, A, l.default.createElement(a.LabelTooltip, d)) : A), l.default.createElement(k, {
                value: p,
                disabled: S,
                onValueChange: f,
                onOpenChange: C
            }, l.default.createElement(j, {
                className: (0, o.default)("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", n.INPUT_BACKGROUND_BY_VARIANT[m], n.INPUT_STROKE_BY_VARIANT[m], eN[_], eM[_], ew[_], eI[_], R ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", void 0 === p ? "content-muted" : "content-default"),
                ref: i,
                "aria-labelledby": s ? g : u,
                "aria-label": E
            }, l.default.createElement(t.StateLayer, null), l.default.createElement("div", {
                className: "grow-1 text-truncate-split text-align-x-left"
            }, l.default.createElement(K, {
                placeholder: P
            })), l.default.createElement(z, {
                className: (0, o.default)(eL[_], "icon icon-regular-chevron-large-down content-default")
            })), l.default.createElement(q, null, l.default.createElement(Q, {
                position: "popper",
                className: "padding-y-small foundation-web-portal-zindex",
                style: {
                    maxHeight: "var(--radix-select-content-available-height)"
                }
            }, T))), h && l.default.createElement("span", {
                className: (0, o.default)("text-caption-small", {
                    "content-system-alert": R,
                    "content-default": !R
                })
            }, h)))
        });
    eb.displayName = "Dropdown", e.s(["Dropdown", 0, eb, "DropdownContext", 0, ex], 255447);
    var eB = e.i(919403),
        eD = e.i(206983);
    let eF = {
            XSmall: "radius-medium",
            Small: "radius-large",
            Medium: "radius-large",
            Large: "radius-large"
        },
        eW = {
            XSmall: "padding-xsmall",
            Small: "padding-small",
            Medium: "padding-small",
            Large: "padding-small"
        },
        eG = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        eH = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-small",
            Large: "padding-y-medium"
        },
        eX = {
            XSmall: "gap-x-medium",
            Small: "gap-x-medium",
            Medium: "gap-x-medium",
            Large: "gap-x-large"
        },
        ek = {
            XSmall: "gap-y-xxsmall",
            Small: "gap-y-xxsmall",
            Medium: "gap-y-xsmall",
            Large: "gap-y-xsmall"
        },
        eV = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        ej = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        eY = (0, l.createContext)(null),
        eK = () => {
            let e = (0, l.useContext)(eY);
            if (!e) throw Error("Menu components must be used within a Menu");
            return e
        };
    e.s(["Menu", 0, e => {
        let {
            children: t,
            className: r,
            size: a
        } = e, n = (0, l.useContext)(ex), i = n ? "dropdown" : "standalone", s = a ?? n?.size ?? "Medium", d = (0, l.useMemo)(() => ({
            size: s,
            mode: i
        }), [s, i]), u = (0, o.default)("foundation-web-menu bg-surface-100 stroke-standard stroke-default shadow-transient-high", eF[s], r), E = "standalone" === i ? l.default.createElement(eD.Root, {
            asChild: !0,
            orientation: "vertical",
            loop: !0
        }, l.default.createElement("div", {
            role: "menu",
            tabIndex: -1,
            className: u
        }, t)) : l.default.createElement("div", {
            className: u
        }, t);
        return l.default.createElement(eY.Provider, {
            value: d
        }, "dropdown" === i ? l.default.createElement(ei, {
            asChild: !0,
            style: {
                width: "var(--radix-popper-anchor-width)"
            }
        }, E) : E)
    }, "MenuItem", 0, e => {
        let r, {
                value: a,
                leading: n,
                title: i,
                description: s,
                trailing: d,
                disabled: u,
                className: E,
                onSelect: c,
                asChild: _,
                children: m,
                ...p
            } = e,
            {
                size: P,
                mode: S
            } = eK(),
            R = (0, o.default)(t.interactable, "foundation-web-menu-item flex items-center content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full", eV[P], eG[P], eH[P], eX[P], ej[P], u && "opacity-[0.5]", u && "pointer-events-none", E),
            h = l.default.createElement("span", {
                className: "foundation-web-menu-item-title text-no-wrap text-truncate-split content-emphasis"
            }, i);
        switch (S) {
            case "dropdown":
                h = l.default.createElement(eS, {
                    asChild: !0
                }, h);
                break;
            case "standalone":
                break;
            default:
                console.error("Invalid menu mode:", S)
        }
        let f = l.default.createElement(l.default.Fragment, null, !u && l.default.createElement(t.StateLayer, null), n, l.default.createElement("div", {
            className: (0, o.default)("grow-1 text-truncate-split flex flex-col", ek[P])
        }, h, s && l.default.createElement("div", {
            className: "foundation-web-menu-item-description content-muted"
        }, s)), d);
        if (_) {
            let {
                as: e,
                ...a
            } = p, n = l.default.Children.only(m), o = void 0 === i && n.props.children;
            r = l.default.createElement(eB.Slot, {
                ...a,
                role: "standalone" === S ? "menuitem" : void 0,
                "aria-disabled": u || void 0,
                className: R,
                style: {
                    outlineOffset: 0
                },
                onClick: u ? void 0 : c
            }, o ? l.default.cloneElement(n, {}, l.default.createElement(l.default.Fragment, null, !u && l.default.createElement(t.StateLayer, null), n.props.children)) : l.default.cloneElement(n, {}, f))
        } else if ("a" === p.as) {
            let {
                as: e,
                href: t,
                ...a
            } = p;
            r = l.default.createElement("a", {
                ...a,
                role: "standalone" === S ? "menuitem" : void 0,
                "aria-disabled": u,
                href: u ? void 0 : t,
                className: R,
                style: {
                    outlineOffset: 0,
                    textDecoration: "none"
                },
                onClick: u ? void 0 : c
            }, f)
        } else {
            let {
                as: e,
                ...t
            } = p;
            r = l.default.createElement("button", {
                type: "button",
                ...t,
                role: "standalone" === S ? "menuitem" : void 0,
                "aria-disabled": u,
                className: R,
                style: {
                    outlineOffset: 0
                },
                onClick: u ? void 0 : c
            }, f)
        }
        return "dropdown" === S ? l.default.createElement(ep, {
            value: a,
            disabled: u,
            asChild: !0
        }, r) : l.default.createElement(eD.Item, {
            asChild: !0,
            focusable: !0,
            tabStopId: a
        }, r)
    }, "MenuLabel", 0, e => {
        let {
            title: t,
            description: r,
            leading: a,
            trailing: n,
            disabled: i,
            className: s
        } = e, {
            size: d
        } = eK(), u = (0, o.default)("foundation-web-menu-label flex items-center content-default text-truncate-split text-align-x-left width-full", eV[d], eG[d], eH[d], eX[d], i && "opacity-[0.5]", s);
        return l.default.createElement("div", {
            role: "none",
            className: u
        }, a, l.default.createElement("div", {
            className: (0, o.default)("grow-1 text-truncate-split flex flex-col", ek[d])
        }, l.default.createElement("span", {
            className: "foundation-web-menu-label-title text-no-wrap text-truncate-split content-emphasis"
        }, t), r && l.default.createElement("div", {
            className: "foundation-web-menu-label-description content-muted"
        }, r)), n)
    }, "MenuSection", 0, e => {
        let {
            children: t,
            className: r
        } = e, {
            size: a
        } = eK();
        return l.default.createElement("div", {
            role: "group",
            className: (0, o.default)(eW[a], r)
        }, t)
    }, "MenuSeparator", 0, e => {
        let {
            className: t
        } = e;
        return l.default.createElement("div", {
            role: "separator",
            className: (0, o.default)("foundation-web-menu-separator", t)
        })
    }], 559170)
}, 380688, e => {
    "use strict";
    var t = e.i(19836),
        r = e.i(420482);
    let a = "__FN_nvfToKPAOuiV__",
        n = RegExp(`${a}(\\d+)\\|`);
    e.s(["translateHtml", 0, (e, o, l, i) => {
        let s = {
                ...i
            },
            d = {};
        l?.forEach((e, t) => {
            let r = t.toString(),
                n = `${a}${r}|`,
                o = `__FN_END_nvfToKPAOuiV__${r}|`;
            s[e.opening] = n, s[e.closing] = o, d[r] = {
                start: n,
                end: o,
                render: e.render,
                used: !1
            }
        });
        let u = e(o, s),
            E = e => {
                let t = [],
                    r = n.exec(e);
                if (!r) return [e];
                r.index > 0 && t.push(e.slice(0, r.index));
                let a = r[1] && d[r[1]];
                if (!a) return console.warn("Unexpected malformed segment", o), [];
                a.used = !0;
                let l = e.indexOf(a.end);
                if (-1 === l) return console.warn("Unexpected malformed segment", o), [];
                let i = e.slice(r.index + r[0].length, l),
                    s = a.render(E(i));
                Array.isArray(s) ? t.push(...s) : t.push(s);
                let u = e.slice(l + a.end.length);
                return u.length > 0 && t.push(...E(u)), t
            },
            c = E(u).filter(e => "" !== e);
        return Object.values(d).some(e => !e.used) ? (console.warn("Unused segments found", o), []) : c.map((e, a) => (0, t.jsx)(r.Fragment, {
            children: e
        }, a))
    }], 380688)
}]);

//# debugId=6df8bdd0-9c4f-251c-6dab-7423c4363265
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/03bett6623jno.js.map