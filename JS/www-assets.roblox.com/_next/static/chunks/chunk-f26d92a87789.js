;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "522bf1ec-af71-9b51-94d1-7d23cc797a8f")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 951605, e => {
    "use strict";
    let t = {
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
        a = {
            U13PaymentModal: "U13PaymentModal",
            U13MonthlyThreshold1Modal: "U13MonthlyThreshold1Modal",
            U13MonthlyThreshold2Modal: "U13MonthlyThreshold2Modal",
            ParentalConsentWarningPaymentModal13To17: "ParentalConsentWarningPaymentModal13To17",
            RequireEmailVerification: "RequireEmailVerification",
            ...t,
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
        };
    e.s(["ASSET_TYPE", 0, {
        GAME_PASS: "Game Pass",
        PRIVATE_SERVER: "Private Server",
        BUNDLE: "Bundle",
        PACKAGE: "Package",
        PLACE: "Place",
        DEVELOPER_PRODUCT: "Product",
        SUBSCRIPTION: "Subscription"
    }, "COOKIE_NAME", 0, "RBXPaymentsFlowContext", "COOKIE_TIMESPAN", 0, 600, "CUSTOM_EVENT", 0, {
        FLOW_CONTINUE: "payment-user-journey:continue",
        FLOW_REFERRER_VALID: "payment-user-journey:referrer-valid"
    }, "EVENT_NAME", 0, {
        USER_PURCHASE_FLOW: "UserPurchaseFlow",
        USER_PURCHASE_STATUS: "UserPurchaseStatus"
    }, "PURCHASE_EVENT_TYPE", 0, {
        VIEW_SHOWN: "ViewShown",
        USER_INPUT: "UserInput"
    }, "PURCHASE_STATUS", 0, {
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
    }, "TRIGGERING_CONTEXT", 0, {
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
    }, "UserPurchaseSettingFailureReason", 0, t, "VIEW_MESSAGE", 0, a, "VIEW_NAME", 0, {
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
        NATIVE_PURCHASE_UI_SHOWN_TIME: "NativePurchaseUiShownTime",
        EARLY_CLICK: "EarlyClick",
        BUY_ROBUX_HYDRATION: "BuyRobuxHydration"
    }])
}, 934045, e => {
    "use strict";
    var t = e.i(951605);
    let a = "robuxEarlyClick",
        s = "robuxearlyclick",
        E = "data-early-click",
        r = "data-hydrated",
        _ = "data-pending",
        i = {
            stateKey: a,
            expiredKey: "robuxEarlyClickExpired",
            discardedKey: "robuxEarlyClickDiscarded",
            eventName: s,
            rowAttr: E,
            rowSelector: "[data-early-click]",
            hydratedAttr: r,
            pendingAttr: _,
            timeoutMs: 6e4,
            beaconFlowAttr: "data-early-click-flow",
            beaconContextAttr: "data-early-click-context",
            beaconEndpointAttr: "data-early-click-endpoint",
            beaconTarget: "www",
            beaconEventType: t.EVENT_NAME.USER_PURCHASE_FLOW,
            beaconViewName: t.VIEW_NAME.EARLY_CLICK,
            beaconPurchaseEventType: t.PURCHASE_EVENT_TYPE.USER_INPUT,
            beaconSource: "inlineScript",
            beaconWebStack: "nextjs",
            beaconRefUrlMaxLength: 200,
            reactReadyKey: "robuxEarlyClickReactReady",
            noTapReportedKey: "robuxEarlyClickNoTapReported"
        };
    (function(e) {
        let t = window,
            {
                stateKey: a,
                expiredKey: s,
                discardedKey: E,
                eventName: r,
                rowAttr: _,
                rowSelector: i,
                hydratedAttr: o,
                pendingAttr: n,
                timeoutMs: c,
                beaconFlowAttr: u,
                beaconContextAttr: R,
                beaconEndpointAttr: P,
                beaconTarget: l,
                beaconEventType: d,
                beaconViewName: T,
                beaconPurchaseEventType: A,
                beaconSource: S,
                beaconWebStack: O,
                beaconRefUrlMaxLength: C,
                reactReadyKey: U,
                noTapReportedKey: h
            } = e;
        if (t.__robuxEarlyClickCaptureInstalled) return;
        t.__robuxEarlyClickCaptureInstalled = !0;
        let I = () => {
                try {
                    window.dispatchEvent(new Event(r))
                } catch {}
            },
            L = () => {
                let e = document.querySelector(`[${n}]`);
                e && (e.removeAttribute(n), e.removeAttribute("aria-busy"))
            },
            N = (e, a) => {
                if (!e || e.isOutcomeReported) return;
                let s = t[E] ?? [];
                s.push({
                    key: e.key,
                    taps: e.taps,
                    waitMs: Math.max(0, Math.round(performance.now() - e.startedAt)),
                    isHeldReported: !!e.isHeldReported,
                    waitingFor: e.waitingFor,
                    reason: a
                }), t[E] = s
            },
            m = e => {
                let E = e.getAttribute(_);
                if (null == E) return;
                let r = t[a];
                if (r && r.key === E) {
                    r.taps += 1;
                    return
                }
                r && (clearTimeout(r.timer), L(), N(r, "replaced")), e.setAttribute(n, ""), e.setAttribute("aria-busy", "true");
                let i = {
                    key: E,
                    startedAt: performance.now(),
                    taps: 1,
                    timer: 0
                };
                i.timer = window.setTimeout(() => {
                    if (t[a] === i && delete t.robuxEarlyClick, e.setAttribute(o, ""), e.removeAttribute(n), e.removeAttribute("aria-busy"), !i.isOutcomeReported) {
                        let e = t[s] ?? [];
                        e.push({
                            key: i.key,
                            taps: i.taps,
                            waitMs: Math.max(0, Math.round(performance.now() - i.startedAt)),
                            isHeldReported: !!i.isHeldReported,
                            waitingFor: i.waitingFor
                        }), t[s] = e
                    }
                    I()
                }, c), t[a] = i, I()
            },
            p = e => {
                for (let t of document.querySelectorAll(i))
                    if (t.getAttribute(_) === e) return t.querySelector("a:not([href])") ? "redirectUrl" : "hydration";
                return "hydration"
            },
            M = (e, t, a, s, E, r, _, i, o) => {
                let n = JSON.stringify({
                        outcome: e,
                        kind: t.kind,
                        productId: t.productId,
                        waitingFor: a,
                        waitMs: String(s),
                        taps: String(E),
                        source: S,
                        webStack: O,
                        eventTransport: o
                    }),
                    c = i.endsWith("/") ? i.slice(0, -1) : i,
                    u = new URL(`${c}/e.png`);
                return u.searchParams.append("t", l), u.searchParams.append("evt", d), u.searchParams.append("ctx", _), u.searchParams.append("lt", new Date().toISOString()), u.searchParams.append("url", window.location.href), u.searchParams.append("purchase_flow_uuid", r), u.searchParams.append("view_name", T), u.searchParams.append("purchase_event_type", A), u.searchParams.append("refurl", (() => {
                    let e = document.referrer;
                    try {
                        let t = window.top?.document.referrer;
                        t && (e = e || t)
                    } catch {}
                    return e.slice(0, C)
                })()), u.searchParams.append("event_metadata", n), u.href
            },
            D = (e, t) => {
                try {
                    if (t) return void window.fetch(e, {
                        mode: "cors",
                        credentials: "include",
                        keepalive: !0
                    }).then(() => void 0, () => void 0);
                    new Image().src = e
                } catch {}
            },
            b = () => {
                try {
                    if (t[U]) return;
                    let e = (() => {
                        let e = document.querySelector(`[${u}]`);
                        if (!e) return;
                        let t = e.getAttribute(u),
                            a = e.getAttribute(R),
                            s = e.getAttribute(P);
                        if (t && a && s) return {
                            flowId: t,
                            context: a,
                            endpoint: s
                        }
                    })();
                    if (!e) return;
                    let r = "function" == typeof window.fetch,
                        _ = r ? "fetch" : "img",
                        i = (t, a, s, E, r) => M(t, (e => {
                            let t = e.indexOf(":");
                            if (-1 === t) return {
                                kind: "product",
                                productId: e
                            };
                            let a = "subscription" === e.slice(0, t) ? "subscription" : "product",
                                s = e.slice(t + 1),
                                E = "product" === a ? s.lastIndexOf("|") : -1;
                            return {
                                kind: a,
                                productId: -1 === E ? s : s.slice(0, E)
                            }
                        })(a), s, E, r, e.flowId, e.context, e.endpoint, _),
                        o = t[a],
                        n = t[s] ?? [],
                        c = t[E] ?? [],
                        l = !!(o && !o.isHeldReported && !o.isOutcomeReported),
                        d = n.length > 0 || c.length > 0;
                    if (!o && !d) {
                        if (t[h]) return;
                        let a = "";
                        try {
                            a = M("noTap", {
                                kind: "none",
                                productId: ""
                            }, "hydration", Math.max(0, Math.round(performance.now())), 0, e.flowId, e.context, e.endpoint, _)
                        } catch {
                            return
                        }
                        t[h] = !0, D(a, r);
                        return
                    }
                    let T = [];
                    try {
                        let e = (e, t) => {
                            for (let a of e) {
                                let e = a.waitingFor ?? p(a.key);
                                a.isHeldReported || T.push(i("held", a.key, e, a.waitMs, a.taps)), T.push(i(t(a), a.key, e, a.waitMs, a.taps))
                            }
                        };
                        if (e(c, e => "reason" in e ? e.reason : "dropped"), e(n, () => "expired"), o && l) {
                            let e = p(o.key),
                                t = Math.max(0, Math.round(performance.now() - o.startedAt));
                            T.push(i("held", o.key, e, t, o.taps)), T.push(i("abandoned", o.key, e, t, o.taps))
                        }
                    } catch {
                        return
                    }
                    if (0 === T.length) return;
                    for (let e of (o && l && (o.isHeldReported = !0, o.waitingFor = p(o.key), o.isOutcomeReported = !0), delete t.robuxEarlyClickExpired, delete t.robuxEarlyClickDiscarded, t[h] = !0, T)) D(e, r)
                } catch {}
            };
        document.addEventListener("click", e => {
            let {
                target: s
            } = e;
            if (!(s instanceof Element)) return;
            let E = s.closest("button, a");
            if (!E) return;
            let r = E.closest(i),
                _ = "A" === E.tagName && E.hasAttribute("href") && (e.metaKey || e.ctrlKey || e.shiftKey || e.altKey || 0 !== e.button);
            if (!r || r.hasAttribute(o) || _) {
                let e;
                t[a] && (e = t[a]) && (clearTimeout(e.timer), L(), N(e, "dropped"), delete t.robuxEarlyClick, I());
                return
            }
            e.stopImmediatePropagation(), e.preventDefault(), m(r)
        }, !0), document.addEventListener("keydown", e => {
            if ("Enter" !== e.key && " " !== e.key || e.metaKey || e.ctrlKey || e.altKey || e.shiftKey) return;
            let {
                target: t
            } = e;
            if (!(t instanceof HTMLAnchorElement) || t.hasAttribute("href")) return;
            let a = t.closest(i);
            !a || a.hasAttribute(o) || (e.preventDefault(), e.stopImmediatePropagation(), m(a))
        }, !0), window.addEventListener("visibilitychange", () => {
            "hidden" === document.visibilityState && b()
        }, !0), window.addEventListener("pagehide", () => {
            b()
        }, !0)
    }).toString(), JSON.stringify(i), e.s(["EARLY_CLICK_CTA_SELECTOR", 0, "button, a", "EARLY_CLICK_EVENT", 0, s, "EARLY_CLICK_HYDRATED_ATTR", 0, r, "EARLY_CLICK_HYDRATION_BAR_ID", 0, "robux-hydration-bar", "EARLY_CLICK_PENDING_ATTR", 0, _, "EARLY_CLICK_ROW_ATTR", 0, E, "EARLY_CLICK_STATE_KEY", 0, a], 934045)
}, 24216, e => {
    "use strict";
    var t = e.i(809804),
        a = e.i(371847),
        s = e.i(934045);
    e.s(["HydrationBar", 0, function() {
        let [e, E] = (0, a.useState)(!1);
        return (0, a.useEffect)(() => {
            E(!0)
        }, []), e ? null : (0, t.jsx)("div", {
            id: s.EARLY_CLICK_HYDRATION_BAR_ID,
            "aria-hidden": "true"
        })
    }])
}, 599449, e => {
    e.v(t => Promise.all(["static/chunks/0pjyl6c3gcagb.js", "static/chunks/0._jimugudf8l.js", "static/chunks/0.i_soj33je94.js", "static/chunks/02lr0.1gwcewp.js", "static/chunks/0reztmvfrrlvn.js", "static/chunks/102gmo6bxrvyq.js", "static/chunks/13es3doq.vrfg.js", "static/chunks/06---k7jged-..js", "static/chunks/011nhkfkz9lce.js", "static/chunks/0-3q4ehn~z4fr.js", "static/chunks/0so5ccm.zsrmm.js", "static/chunks/0~6~s.zr45poq.js", "static/chunks/0d0.wac07md2..js", "static/chunks/0d_aqu71vgji3.js", "static/chunks/0w-kmj8ofkghi.js", "static/chunks/0_styu9br~~t_.js", "static/chunks/13vs1zmiave2t.css", "static/chunks/10xecnm1g-ejt.css", "static/chunks/00gbpmvkvhrik.css", "static/chunks/16-xuoxmnixcs.css"].map(t => e.l(t))).then(() => t(427118)))
}, 31611, e => {
    e.v(t => Promise.all(["static/chunks/0ofj5xunuemqv.js"].map(t => e.l(t))).then(() => t(358424)))
}, 389897, e => {
    e.v(t => Promise.all(["static/chunks/1478gm~l8tgh6.js"].map(t => e.l(t))).then(() => t(63400)))
}, 339834, e => {
    e.v(t => Promise.all(["static/chunks/09qvj~f16ccl-.js", "static/chunks/0okfep67z8j3v.js"].map(t => e.l(t))).then(() => t(105584)))
}, 802269, e => {
    e.v(t => Promise.all(["static/chunks/0._jimugudf8l.js", "static/chunks/007e~-bdgi-i7.js", "static/chunks/0s7dbmd3_0pid.js", "static/chunks/0d_aqu71vgji3.js", "static/chunks/0qe5~-xgqlpbe.js", "static/chunks/069hd7fee9nj0.js", "static/chunks/102gmo6bxrvyq.js", "static/chunks/0co-njph7elwc.js", "static/chunks/0spjditrazqft.css", "static/chunks/0e5rg92xwrete.css", "static/chunks/0cyha8..52g-g.css", "static/chunks/15-y_xcw1unyt.css", "static/chunks/0~8u1qetdn18y.css"].map(t => e.l(t))).then(() => t(412516)))
}, 957562, e => {
    e.v(t => Promise.all(["static/chunks/0._jimugudf8l.js", "static/chunks/0fe7ufckfsj3u.js", "static/chunks/10pv8q2~6z_x8.js", "static/chunks/049cddvgnzs5b.js", "static/chunks/0nn_t4b1hi9gt.js", "static/chunks/16f2iedf0qn75.js", "static/chunks/15oht.wrycyta.js", "static/chunks/0q0i1rk7ttnu9.js", "static/chunks/09yj7_olw-sya.css", "static/chunks/17vmrl5m9n8mv.css", "static/chunks/06ujly2-qvyev.css", "static/chunks/0sihxg3e~hpnv.css", "static/chunks/0vbigq52zp0b8.css"].map(t => e.l(t))).then(() => t(379068)))
}, 705367, e => {
    e.v(t => Promise.all(["static/chunks/0ta73_eb_4hs1.css", "static/chunks/107c~o6j~moo..css", "static/chunks/0h5svwhrhn_4h.js", "static/chunks/0._jimugudf8l.js", "static/chunks/0a2am08~~8ax~.js", "static/chunks/0z5jya8d.omrn.js", "static/chunks/15vzi-nlilmkg.js"].map(t => e.l(t))).then(() => t(618391)))
}, 123968, e => {
    e.v(t => Promise.all(["static/chunks/0_nfrwa5g7rnp.css", "static/chunks/13vs1zmiave2t.css", "static/chunks/10xecnm1g-ejt.css", "static/chunks/0i30r7t-t1fbs.js", "static/chunks/0ov1vsdzvtml-.js", "static/chunks/0._jimugudf8l.js", "static/chunks/0ok~p96fqutez.js"].map(t => e.l(t))).then(() => t(83371)))
}, 780837, e => {
    e.v(t => Promise.all(["static/chunks/17nilk0xgd73f.js", "static/chunks/0y-.eiuc9zecy.css"].map(t => e.l(t))).then(() => t(815582)))
}, 593401, e => {
    e.v(t => Promise.all(["static/chunks/0he-8vz~r-35x.js", "static/chunks/0-aex2xkulq2j.css", "static/chunks/17vmrl5m9n8mv.css", "static/chunks/11efysudh-4ao.css"].map(t => e.l(t))).then(() => t(518661)))
}, 715216, e => {
    e.v(t => Promise.all(["static/chunks/0oixte1kvdxef.js"].map(t => e.l(t))).then(() => t(142742)))
}, 932954, e => {
    e.v(t => Promise.all(["static/chunks/0ef3mkfmq9_a4.js"].map(t => e.l(t))).then(() => t(233080)))
}, 373322, e => {
    e.v(t => Promise.all(["static/chunks/0brtkacadpov~.js", "static/chunks/0-6e1jfl0mx-r.js", "static/chunks/0a2am08~~8ax~.js", "static/chunks/0~d2f1qzp47hs.css"].map(t => e.l(t))).then(() => t(775300)))
}]);

//# debugId=522bf1ec-af71-9b51-94d1-7d23cc797a8f
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0nt.0x3nn7buu.js.map