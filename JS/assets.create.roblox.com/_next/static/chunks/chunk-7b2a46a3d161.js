;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "84c7df33-ce88-9fc3-b690-95e54473b425")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 428993, e => {
    "use strict";
    var t = e.i(157700);
    let r = (0, t.defineFlag)({
            namespace: "creator-business",
            name: "isRevenueShareAgreementsEnabled",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "creator-business",
            name: "enableVirtualTransactionsTab",
            defaultValue: !0
        }),
        i = (0, t.defineFlag)({
            namespace: "creator-business",
            name: "newCreatorWallets",
            defaultValue: !1
        }),
        a = (0, t.defineFlag)({
            namespace: "creator-business",
            name: "creatorWalletsOverviewPreview",
            defaultValue: !1
        }),
        o = (0, t.defineFlag)({
            namespace: "creator-business",
            name: "newTransactionsFlag",
            defaultValue: !1
        });
    e.s(["creatorWalletsOverviewPreview", 0, a, "enableVirtualTransactionsTab", 0, n, "isRevenueShareAgreementsEnabled", 0, r, "newCreatorWallets", 0, i, "newTransactionsFlag", 0, o])
}, 92174, e => {
    "use strict";
    var t = e.i(157700);
    let r = (0, t.defineFlag)({
            namespace: "devex",
            name: "shouldUseWatermarkFiatCalculation",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "devex",
            name: "isTaxDocumentationEnabled",
            defaultValue: !1
        });
    e.s(["isTaxDocumentationEnabled", 0, n, "shouldUseWatermarkFiatCalculation", 0, r])
}, 426173, e => {
    "use strict";
    var t = e.i(157700);
    let r = (0, t.defineFlag)({
            namespace: "financial-platform",
            name: "isTaxDocumentationOpenToDevexEligible",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "financial-platform",
            name: "isTaxFormDeliveryConsentEnabled",
            defaultValue: !1
        });
    e.s(["isTaxDocumentationOpenToDevexEligible", 0, r, "isTaxFormDeliveryConsentEnabled", 0, n])
}, 938158, e => {
    "use strict";
    var t = e.i(677753),
        r = function(e, t) {
            return (r = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
            })(e, t)
        };

    function n(e, t, r, n) {
        return new(r || (r = Promise))(function(i, a) {
            function o(e) {
                try {
                    u(n.next(e))
                } catch (e) {
                    a(e)
                }
            }

            function l(e) {
                try {
                    u(n.throw(e))
                } catch (e) {
                    a(e)
                }
            }

            function u(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof r ? t : new r(function(e) {
                    e(t)
                })).then(o, l)
            }
            u((n = n.apply(e, t || [])).next())
        })
    }

    function i(e, t) {
        var r, n, i, a = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = l(0), o.throw = l(1), o.return = l(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function l(l) {
            return function(u) {
                var s = [l, u];
                if (r) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, s[0] && (a = 0)), a;) try {
                    if (r = 1, n && (i = 2 & s[0] ? n.return : s[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, s[1])).done) return i;
                    switch (n = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                        case 0:
                        case 1:
                            i = s;
                            break;
                        case 4:
                            return a.label++, {
                                value: s[1],
                                done: !1
                            };
                        case 5:
                            a.label++, n = s[1], s = [0];
                            continue;
                        case 7:
                            s = a.ops.pop(), a.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                a = 0;
                                continue
                            }
                            if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                a.label = s[1];
                                break
                            }
                            if (6 === s[0] && a.label < i[1]) {
                                a.label = i[1], i = s;
                                break
                            }
                            if (i && a.label < i[2]) {
                                a.label = i[2], a.ops.push(s);
                                break
                            }
                            i[2] && a.ops.pop(), a.trys.pop();
                            continue
                    }
                    s = t.call(e, a)
                } catch (e) {
                    s = [6, e], n = 0
                } finally {
                    r = i = 0
                }
                if (5 & s[0]) throw s[1];
                return {
                    value: s[0] ? s[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function a(e, r) {
        return null == e ? e : {
            currency: (0, t.exists)(e, "currency") ? e.currency : void 0,
            units: (0, t.exists)(e, "units") ? e.units : void 0,
            attos: (0, t.exists)(e, "attos") ? e.attos : void 0
        }
    }

    function o(e) {
        var r;
        return null == (r = e) ? r : {
            currency: (0, t.exists)(r, "currency") ? r.currency : void 0,
            availableAmount: (0, t.exists)(r, "availableAmount") ? a(r.availableAmount) : void 0,
            pendingAmount: (0, t.exists)(r, "pendingAmount") ? a(r.pendingAmount) : void 0
        }
    }

    function l(e) {
        if (void 0 !== e) return null === e ? null : {
            userId: e.userId,
            groupId: e.groupId
        }
    }

    function u(e, r) {
        var n, i, a, o, l, u, s, d, c;
        return null == e ? e : {
            eligibility: (0, t.exists)(e, "eligibility") ? null == (n = e.eligibility) ? n : {
                authenticatedUserId: (0, t.exists)(n, "authenticatedUserId") ? n.authenticatedUserId : void 0,
                eligible: (0, t.exists)(n, "eligible") ? null == (i = n.eligible) ? i : {
                    canStartKyc: (0, t.exists)(i, "canStartKyc") ? i.canStartKyc : void 0,
                    ageGroup: (0, t.exists)(i, "ageGroup") ? i.ageGroup : void 0,
                    emailVerificationStatus: (0, t.exists)(i, "emailVerificationStatus") ? null == (a = i.emailVerificationStatus) ? a : {
                        notVerified: (0, t.exists)(a, "notVerified") ? a.notVerified : void 0,
                        verifiedEmail: (0, t.exists)(a, "verifiedEmail") ? a.verifiedEmail : void 0
                    } : void 0
                } : void 0,
                ineligible: (0, t.exists)(n, "ineligible") ? n.ineligible : void 0
            } : void 0,
            onboardingState: (0, t.exists)(e, "onboardingState") ? null == (o = e.onboardingState) ? o : {
                initiatingUserId: (0, t.exists)(o, "initiatingUserId") ? o.initiatingUserId : void 0,
                creatorWalletId: (0, t.exists)(o, "creatorWalletId") ? null == (l = o.creatorWalletId) ? l : {
                    userId: (0, t.exists)(l, "userId") ? l.userId : void 0,
                    groupId: (0, t.exists)(l, "groupId") ? l.groupId : void 0
                } : void 0,
                notStarted: (0, t.exists)(o, "notStarted") ? o.notStarted : void 0,
                accountOnboardingInitiated: (0, t.exists)(o, "accountOnboardingInitiated") ? o.accountOnboardingInitiated : void 0,
                underReview: (0, t.exists)(o, "underReview") ? o.underReview : void 0,
                requestedForInformation: (0, t.exists)(o, "requestedForInformation") ? null == (u = o.requestedForInformation) ? u : {
                    rfiType: (0, t.exists)(u, "rfiType") ? u.rfiType : void 0
                } : void 0,
                accountCreated: (0, t.exists)(o, "accountCreated") ? o.accountCreated : void 0,
                rejected: (0, t.exists)(o, "rejected") ? o.rejected : void 0,
                bankingGatewayProfile: (0, t.exists)(o, "bankingGatewayProfile") ? null == (s = o.bankingGatewayProfile) ? s : {
                    financialIdentityId: (0, t.exists)(s, "financialIdentityId") ? null == (d = s.financialIdentityId) ? d : {
                        value: (0, t.exists)(d, "value") ? d.value : void 0
                    } : void 0,
                    walletAccountId: (0, t.exists)(s, "walletAccountId") ? null == (c = s.walletAccountId) ? c : {
                        value: (0, t.exists)(c, "value") ? c.value : void 0
                    } : void 0
                } : void 0,
                primaryContactEmail: (0, t.exists)(o, "primaryContactEmail") ? o.primaryContactEmail : void 0
            } : void 0
        }
    }

    function s(e, r) {
        return null == e ? e : {
            balances: (0, t.exists)(e, "balances") ? e.balances.map(o) : void 0
        }
    }

    function d(e) {
        if (void 0 !== e) return null === e ? null : {
            creatorWalletId: l(e.creatorWalletId),
            codeChallenge: e.codeChallenge
        }
    }

    function c(e, r) {
        return null == e ? e : {
            clientId: (0, t.exists)(e, "clientId") ? e.clientId : void 0,
            authCode: (0, t.exists)(e, "authCode") ? e.authCode : void 0
        }
    }

    function f(e) {
        if (void 0 !== e) return null === e ? null : {
            creatorWalletId: l(e.creatorWalletId),
            codeChallenge: e.codeChallenge
        }
    }

    function p(e, r) {
        return null == e ? e : {
            clientId: (0, t.exists)(e, "clientId") ? e.clientId : void 0,
            authCode: (0, t.exists)(e, "authCode") ? e.authCode : void 0
        }
    }

    function v(e) {
        if (void 0 !== e) return null === e ? null : {
            creatorWalletId: l(e.creatorWalletId),
            codeChallenge: e.codeChallenge
        }
    }

    function h(e, r) {
        return null == e ? e : {
            clientId: (0, t.exists)(e, "clientId") ? e.clientId : void 0,
            authCode: (0, t.exists)(e, "authCode") ? e.authCode : void 0
        }
    }

    function I(e) {
        var r;
        return null == (r = e) ? r : {
            beneficiaryId: (0, t.exists)(r, "beneficiaryId") ? r.beneficiaryId : void 0,
            nickname: (0, t.exists)(r, "nickname") ? r.nickname : void 0,
            isDefault: (0, t.exists)(r, "isDefault") ? r.isDefault : void 0,
            status: (0, t.exists)(r, "status") ? r.status : void 0,
            transferMethod: (0, t.exists)(r, "transferMethod") ? r.transferMethod : void 0,
            transferFee: (0, t.exists)(r, "transferFee") ? a(r.transferFee) : void 0
        }
    }

    function y(e, r) {
        return null == e ? e : {
            beneficiaries: (0, t.exists)(e, "beneficiaries") ? e.beneficiaries.map(I) : void 0
        }
    }

    function b(e) {
        if (void 0 !== e) return null === e ? null : {
            creatorWalletId: l(e.creatorWalletId),
            beneficiaryId: e.beneficiaryId,
            nickname: e.nickname,
            isDefault: e.isDefault
        }
    }

    function g(e, r) {
        return null == e ? e : {
            beneficiary: (0, t.exists)(e, "beneficiary") ? I(e.beneficiary) : void 0
        }
    }
    var m = function(e) {
        function a() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function n() {
                this.constructor = e
            }
            r(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
        }(a, e), a.prototype.getTaxFormDeliveryPreferenceRaw = function(e) {
            return n(this, void 0, void 0, function() {
                var r, n, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, n = {}, [4, this.request({
                                path: "/v1/self/tax/form-delivery-preference",
                                schemaPath: "/v1/self/tax/form-delivery-preference",
                                method: "GET",
                                headers: n,
                                query: r
                            }, e)];
                        case 1:
                            return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    mailingPreference: (0, t.exists)(e, "mailingPreference") ? e.mailingPreference : void 0,
                                    updatedTime: (0, t.exists)(e, "updatedTime") ? new Date(e.updatedTime) : void 0
                                }
                            })]
                    }
                })
            })
        }, a.prototype.getTaxFormDeliveryPreference = function(e) {
            return n(this, void 0, void 0, function() {
                return i(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.getTaxFormDeliveryPreferenceRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, a.prototype.signElectronicTaxFormDeliveryRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/self/tax/electronic-form-delivery:sign",
                                schemaPath: "/v1/self/tax/electronic-form-delivery:sign",
                                method: "POST",
                                headers: a,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        clientIdempotencyKey: e.clientIdempotencyKey
                                    }
                                }(e.signElectronicTaxFormDeliveryRequest)
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    mailingPreference: (0, t.exists)(e, "mailingPreference") ? e.mailingPreference : void 0,
                                    updatedTime: (0, t.exists)(e, "updatedTime") ? new Date(e.updatedTime) : void 0
                                }
                            })]
                    }
                })
            })
        }, a.prototype.signElectronicTaxFormDelivery = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.signElectronicTaxFormDeliveryRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, a.prototype.v1GroupCreatorWalletIdGroupIdOnboardingKycEmbeddinginitializePostRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.creatorWalletIdGroupId || void 0 === e.creatorWalletIdGroupId) throw new t.RequiredError("creatorWalletIdGroupId", "Required parameter requestParameters.creatorWalletIdGroupId was null or undefined when calling v1GroupCreatorWalletIdGroupIdOnboardingKycEmbeddinginitializePost.");
                            return n = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/group/{creatorWalletId.groupId}/onboarding/kyc-embedding:initialize".replace("{".concat("creatorWalletId.groupId", "}"), encodeURIComponent(String(e.creatorWalletIdGroupId))),
                                schemaPath: "/v1/group/{creatorWalletId.groupId}/onboarding/kyc-embedding:initialize",
                                method: "POST",
                                headers: a,
                                query: n,
                                body: f(e.initializeKycEmbeddingRequest)
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return p(e)
                            })]
                    }
                })
            })
        }, a.prototype.v1GroupCreatorWalletIdGroupIdOnboardingKycEmbeddinginitializePost = function(e, t) {
            return n(this, void 0, void 0, function() {
                return i(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1GroupCreatorWalletIdGroupIdOnboardingKycEmbeddinginitializePostRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, a.prototype.v1GroupCreatorWalletIdGroupIdOnboardingKycRfiEmbeddinginitializePostRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.creatorWalletIdGroupId || void 0 === e.creatorWalletIdGroupId) throw new t.RequiredError("creatorWalletIdGroupId", "Required parameter requestParameters.creatorWalletIdGroupId was null or undefined when calling v1GroupCreatorWalletIdGroupIdOnboardingKycRfiEmbeddinginitializePost.");
                            return n = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/group/{creatorWalletId.groupId}/onboarding/kyc-rfi-embedding:initialize".replace("{".concat("creatorWalletId.groupId", "}"), encodeURIComponent(String(e.creatorWalletIdGroupId))),
                                schemaPath: "/v1/group/{creatorWalletId.groupId}/onboarding/kyc-rfi-embedding:initialize",
                                method: "POST",
                                headers: a,
                                query: n,
                                body: v(e.initializeKycRfiEmbeddingRequest)
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return h(e)
                            })]
                    }
                })
            })
        }, a.prototype.v1GroupCreatorWalletIdGroupIdOnboardingKycRfiEmbeddinginitializePost = function(e, t) {
            return n(this, void 0, void 0, function() {
                return i(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1GroupCreatorWalletIdGroupIdOnboardingKycRfiEmbeddinginitializePostRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, a.prototype.v1GroupCreatorWalletIdGroupIdOnboardingStateGetRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.creatorWalletIdGroupId || void 0 === e.creatorWalletIdGroupId) throw new t.RequiredError("creatorWalletIdGroupId", "Required parameter requestParameters.creatorWalletIdGroupId was null or undefined when calling v1GroupCreatorWalletIdGroupIdOnboardingStateGet.");
                            return n = {}, void 0 !== e.creatorWalletIdUserId && (n["creatorWalletId.userId"] = e.creatorWalletIdUserId), a = {}, [4, this.request({
                                path: "/v1/group/{creatorWalletId.groupId}/onboarding/state".replace("{".concat("creatorWalletId.groupId", "}"), encodeURIComponent(String(e.creatorWalletIdGroupId))),
                                schemaPath: "/v1/group/{creatorWalletId.groupId}/onboarding/state",
                                method: "GET",
                                headers: a,
                                query: n
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return u(e)
                            })]
                    }
                })
            })
        }, a.prototype.v1GroupCreatorWalletIdGroupIdOnboardingStateGet = function(e, t) {
            return n(this, void 0, void 0, function() {
                return i(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1GroupCreatorWalletIdGroupIdOnboardingStateGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, a.prototype.v1GroupCreatorWalletIdGroupIdWalletBalanceGetRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.creatorWalletIdGroupId || void 0 === e.creatorWalletIdGroupId) throw new t.RequiredError("creatorWalletIdGroupId", "Required parameter requestParameters.creatorWalletIdGroupId was null or undefined when calling v1GroupCreatorWalletIdGroupIdWalletBalanceGet.");
                            return n = {}, void 0 !== e.creatorWalletIdUserId && (n["creatorWalletId.userId"] = e.creatorWalletIdUserId), a = {}, [4, this.request({
                                path: "/v1/group/{creatorWalletId.groupId}/wallet/balance".replace("{".concat("creatorWalletId.groupId", "}"), encodeURIComponent(String(e.creatorWalletIdGroupId))),
                                schemaPath: "/v1/group/{creatorWalletId.groupId}/wallet/balance",
                                method: "GET",
                                headers: a,
                                query: n
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return s(e)
                            })]
                    }
                })
            })
        }, a.prototype.v1GroupCreatorWalletIdGroupIdWalletBalanceGet = function(e, t) {
            return n(this, void 0, void 0, function() {
                return i(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1GroupCreatorWalletIdGroupIdWalletBalanceGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, a.prototype.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesBeneficiaryIdDeleteRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.creatorWalletIdGroupId || void 0 === e.creatorWalletIdGroupId) throw new t.RequiredError("creatorWalletIdGroupId", "Required parameter requestParameters.creatorWalletIdGroupId was null or undefined when calling v1GroupCreatorWalletIdGroupIdWalletBeneficiariesBeneficiaryIdDelete.");
                            if (null === e.beneficiaryId || void 0 === e.beneficiaryId) throw new t.RequiredError("beneficiaryId", "Required parameter requestParameters.beneficiaryId was null or undefined when calling v1GroupCreatorWalletIdGroupIdWalletBeneficiariesBeneficiaryIdDelete.");
                            return n = {}, void 0 !== e.creatorWalletIdUserId && (n["creatorWalletId.userId"] = e.creatorWalletIdUserId), a = {}, [4, this.request({
                                path: "/v1/group/{creatorWalletId.groupId}/wallet/beneficiaries/{beneficiaryId}".replace("{".concat("creatorWalletId.groupId", "}"), encodeURIComponent(String(e.creatorWalletIdGroupId))).replace("{".concat("beneficiaryId", "}"), encodeURIComponent(String(e.beneficiaryId))),
                                schemaPath: "/v1/group/{creatorWalletId.groupId}/wallet/beneficiaries/{beneficiaryId}",
                                method: "DELETE",
                                headers: a,
                                query: n
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o)]
                    }
                })
            })
        }, a.prototype.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesBeneficiaryIdDelete = function(e, t) {
            return n(this, void 0, void 0, function() {
                return i(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesBeneficiaryIdDeleteRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, a.prototype.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesGetRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.creatorWalletIdGroupId || void 0 === e.creatorWalletIdGroupId) throw new t.RequiredError("creatorWalletIdGroupId", "Required parameter requestParameters.creatorWalletIdGroupId was null or undefined when calling v1GroupCreatorWalletIdGroupIdWalletBeneficiariesGet.");
                            return n = {}, void 0 !== e.creatorWalletIdUserId && (n["creatorWalletId.userId"] = e.creatorWalletIdUserId), a = {}, [4, this.request({
                                path: "/v1/group/{creatorWalletId.groupId}/wallet/beneficiaries".replace("{".concat("creatorWalletId.groupId", "}"), encodeURIComponent(String(e.creatorWalletIdGroupId))),
                                schemaPath: "/v1/group/{creatorWalletId.groupId}/wallet/beneficiaries",
                                method: "GET",
                                headers: a,
                                query: n
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return y(e)
                            })]
                    }
                })
            })
        }, a.prototype.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesGet = function(e, t) {
            return n(this, void 0, void 0, function() {
                return i(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, a.prototype.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesPostRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.creatorWalletIdGroupId || void 0 === e.creatorWalletIdGroupId) throw new t.RequiredError("creatorWalletIdGroupId", "Required parameter requestParameters.creatorWalletIdGroupId was null or undefined when calling v1GroupCreatorWalletIdGroupIdWalletBeneficiariesPost.");
                            return n = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/group/{creatorWalletId.groupId}/wallet/beneficiaries".replace("{".concat("creatorWalletId.groupId", "}"), encodeURIComponent(String(e.creatorWalletIdGroupId))),
                                schemaPath: "/v1/group/{creatorWalletId.groupId}/wallet/beneficiaries",
                                method: "POST",
                                headers: a,
                                query: n,
                                body: b(e.saveBeneficiaryRequest)
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return g(e)
                            })]
                    }
                })
            })
        }, a.prototype.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesPost = function(e, t) {
            return n(this, void 0, void 0, function() {
                return i(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesPostRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, a.prototype.v1GroupCreatorWalletIdGroupIdWalletBeneficiaryEmbeddinginitializePostRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.creatorWalletIdGroupId || void 0 === e.creatorWalletIdGroupId) throw new t.RequiredError("creatorWalletIdGroupId", "Required parameter requestParameters.creatorWalletIdGroupId was null or undefined when calling v1GroupCreatorWalletIdGroupIdWalletBeneficiaryEmbeddinginitializePost.");
                            return n = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/group/{creatorWalletId.groupId}/wallet/beneficiary-embedding:initialize".replace("{".concat("creatorWalletId.groupId", "}"), encodeURIComponent(String(e.creatorWalletIdGroupId))),
                                schemaPath: "/v1/group/{creatorWalletId.groupId}/wallet/beneficiary-embedding:initialize",
                                method: "POST",
                                headers: a,
                                query: n,
                                body: d(e.initializeBeneficiaryEmbeddingRequest)
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return c(e)
                            })]
                    }
                })
            })
        }, a.prototype.v1GroupCreatorWalletIdGroupIdWalletBeneficiaryEmbeddinginitializePost = function(e, t) {
            return n(this, void 0, void 0, function() {
                return i(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1GroupCreatorWalletIdGroupIdWalletBeneficiaryEmbeddinginitializePostRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, a.prototype.v1SelfEnhancedProtectionRequirementsGetRaw = function(e) {
            return n(this, void 0, void 0, function() {
                var r, n, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, n = {}, [4, this.request({
                                path: "/v1/self/enhanced-protection/requirements",
                                schemaPath: "/v1/self/enhanced-protection/requirements",
                                method: "GET",
                                headers: n,
                                query: r
                            }, e)];
                        case 1:
                            return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    passkeyStatus: (0, t.exists)(e, "passkeyStatus") ? e.passkeyStatus : void 0,
                                    verifiedEmailStatus: (0, t.exists)(e, "verifiedEmailStatus") ? e.verifiedEmailStatus : void 0,
                                    verifiedPhoneStatus: (0, t.exists)(e, "verifiedPhoneStatus") ? e.verifiedPhoneStatus : void 0,
                                    recoveryCodesStatus: (0, t.exists)(e, "recoveryCodesStatus") ? e.recoveryCodesStatus : void 0,
                                    maskedEmail: (0, t.exists)(e, "maskedEmail") ? e.maskedEmail : void 0,
                                    maskedPhone: (0, t.exists)(e, "maskedPhone") ? e.maskedPhone : void 0
                                }
                            })]
                    }
                })
            })
        }, a.prototype.v1SelfEnhancedProtectionRequirementsGet = function(e) {
            return n(this, void 0, void 0, function() {
                return i(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1SelfEnhancedProtectionRequirementsGetRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, a.prototype.v1SelfOnboardingKycEmbeddinginitializePostRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/self/onboarding/kyc-embedding:initialize",
                                schemaPath: "/v1/self/onboarding/kyc-embedding:initialize",
                                method: "POST",
                                headers: a,
                                query: n,
                                body: f(e.initializeKycEmbeddingRequest)
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return p(e)
                            })]
                    }
                })
            })
        }, a.prototype.v1SelfOnboardingKycEmbeddinginitializePost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1SelfOnboardingKycEmbeddinginitializePostRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, a.prototype.v1SelfOnboardingKycRfiEmbeddinginitializePostRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/self/onboarding/kyc-rfi-embedding:initialize",
                                schemaPath: "/v1/self/onboarding/kyc-rfi-embedding:initialize",
                                method: "POST",
                                headers: a,
                                query: n,
                                body: v(e.initializeKycRfiEmbeddingRequest)
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return h(e)
                            })]
                    }
                })
            })
        }, a.prototype.v1SelfOnboardingKycRfiEmbeddinginitializePost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1SelfOnboardingKycRfiEmbeddinginitializePostRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, a.prototype.v1SelfOnboardingStateGetRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, void 0 !== e.creatorWalletIdUserId && (n["creatorWalletId.userId"] = e.creatorWalletIdUserId), void 0 !== e.creatorWalletIdGroupId && (n["creatorWalletId.groupId"] = e.creatorWalletIdGroupId), a = {}, [4, this.request({
                                path: "/v1/self/onboarding/state",
                                schemaPath: "/v1/self/onboarding/state",
                                method: "GET",
                                headers: a,
                                query: n
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return u(e)
                            })]
                    }
                })
            })
        }, a.prototype.v1SelfOnboardingStateGet = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1SelfOnboardingStateGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, a.prototype.v1SelfTaxOnboardingResultGetRaw = function(e) {
            return n(this, void 0, void 0, function() {
                var r, n, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, n = {}, [4, this.request({
                                path: "/v1/self/tax/onboarding/result",
                                schemaPath: "/v1/self/tax/onboarding/result",
                                method: "GET",
                                headers: n,
                                query: r
                            }, e)];
                        case 1:
                            return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    sdkToken: (0, t.exists)(e, "sdkToken") ? e.sdkToken : void 0,
                                    tokenExpiryTime: (0, t.exists)(e, "tokenExpiryTime") ? new Date(e.tokenExpiryTime) : void 0,
                                    tokenBlockedReason: (0, t.exists)(e, "tokenBlockedReason") ? e.tokenBlockedReason : void 0
                                }
                            })]
                    }
                })
            })
        }, a.prototype.v1SelfTaxOnboardingResultGet = function(e) {
            return n(this, void 0, void 0, function() {
                return i(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1SelfTaxOnboardingResultGetRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, a.prototype.v1SelfTaxOnboardingstartPostRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/self/tax/onboarding:start",
                                schemaPath: "/v1/self/tax/onboarding:start",
                                method: "POST",
                                headers: a,
                                query: n,
                                body: e.body
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    accepted: (0, t.exists)(e, "accepted") ? e.accepted : void 0
                                }
                            })]
                    }
                })
            })
        }, a.prototype.v1SelfTaxOnboardingstartPost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1SelfTaxOnboardingstartPostRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, a.prototype.v1SelfTaxWithholdingRateGetRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, void 0 !== e.paymentType && (n.paymentType = e.paymentType), a = {}, [4, this.request({
                                path: "/v1/self/tax/withholding-rate",
                                schemaPath: "/v1/self/tax/withholding-rate",
                                method: "GET",
                                headers: a,
                                query: n
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                var r, n;
                                return null == e ? e : {
                                    rate: (0, t.exists)(e, "rate") ? null == (r = e.rate) ? r : {
                                        withholdingRateBps: (0, t.exists)(r, "withholdingRateBps") ? r.withholdingRateBps : void 0,
                                        treatyCountryCode: (0, t.exists)(r, "treatyCountryCode") ? r.treatyCountryCode : void 0,
                                        certificationId: (0, t.exists)(r, "certificationId") ? r.certificationId : void 0,
                                        basis: (0, t.exists)(r, "basis") ? r.basis : void 0
                                    } : void 0,
                                    reason: (0, t.exists)(e, "reason") ? null == (n = e.reason) ? n : {
                                        reason: (0, t.exists)(n, "reason") ? n.reason : void 0
                                    } : void 0
                                }
                            })]
                    }
                })
            })
        }, a.prototype.v1SelfTaxWithholdingRateGet = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1SelfTaxWithholdingRateGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, a.prototype.v1SelfWalletBalanceGetRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, void 0 !== e.creatorWalletIdUserId && (n["creatorWalletId.userId"] = e.creatorWalletIdUserId), void 0 !== e.creatorWalletIdGroupId && (n["creatorWalletId.groupId"] = e.creatorWalletIdGroupId), a = {}, [4, this.request({
                                path: "/v1/self/wallet/balance",
                                schemaPath: "/v1/self/wallet/balance",
                                method: "GET",
                                headers: a,
                                query: n
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return s(e)
                            })]
                    }
                })
            })
        }, a.prototype.v1SelfWalletBalanceGet = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1SelfWalletBalanceGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, a.prototype.v1SelfWalletBeneficiariesBeneficiaryIdDeleteRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.beneficiaryId || void 0 === e.beneficiaryId) throw new t.RequiredError("beneficiaryId", "Required parameter requestParameters.beneficiaryId was null or undefined when calling v1SelfWalletBeneficiariesBeneficiaryIdDelete.");
                            return n = {}, void 0 !== e.creatorWalletIdUserId && (n["creatorWalletId.userId"] = e.creatorWalletIdUserId), void 0 !== e.creatorWalletIdGroupId && (n["creatorWalletId.groupId"] = e.creatorWalletIdGroupId), a = {}, [4, this.request({
                                path: "/v1/self/wallet/beneficiaries/{beneficiaryId}".replace("{".concat("beneficiaryId", "}"), encodeURIComponent(String(e.beneficiaryId))),
                                schemaPath: "/v1/self/wallet/beneficiaries/{beneficiaryId}",
                                method: "DELETE",
                                headers: a,
                                query: n
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o)]
                    }
                })
            })
        }, a.prototype.v1SelfWalletBeneficiariesBeneficiaryIdDelete = function(e, t) {
            return n(this, void 0, void 0, function() {
                return i(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1SelfWalletBeneficiariesBeneficiaryIdDeleteRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, a.prototype.v1SelfWalletBeneficiariesGetRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, void 0 !== e.creatorWalletIdUserId && (n["creatorWalletId.userId"] = e.creatorWalletIdUserId), void 0 !== e.creatorWalletIdGroupId && (n["creatorWalletId.groupId"] = e.creatorWalletIdGroupId), a = {}, [4, this.request({
                                path: "/v1/self/wallet/beneficiaries",
                                schemaPath: "/v1/self/wallet/beneficiaries",
                                method: "GET",
                                headers: a,
                                query: n
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return y(e)
                            })]
                    }
                })
            })
        }, a.prototype.v1SelfWalletBeneficiariesGet = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1SelfWalletBeneficiariesGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, a.prototype.v1SelfWalletBeneficiariesPostRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/self/wallet/beneficiaries",
                                schemaPath: "/v1/self/wallet/beneficiaries",
                                method: "POST",
                                headers: a,
                                query: n,
                                body: b(e.saveBeneficiaryRequest)
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return g(e)
                            })]
                    }
                })
            })
        }, a.prototype.v1SelfWalletBeneficiariesPost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1SelfWalletBeneficiariesPostRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, a.prototype.v1SelfWalletBeneficiaryEmbeddinginitializePostRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/self/wallet/beneficiary-embedding:initialize",
                                schemaPath: "/v1/self/wallet/beneficiary-embedding:initialize",
                                method: "POST",
                                headers: a,
                                query: n,
                                body: d(e.initializeBeneficiaryEmbeddingRequest)
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return c(e)
                            })]
                    }
                })
            })
        }, a.prototype.v1SelfWalletBeneficiaryEmbeddinginitializePost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1SelfWalletBeneficiaryEmbeddinginitializePostRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, a.prototype.v1WalletWithdrawalsPostRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wallet/withdrawals",
                                schemaPath: "/v1/wallet/withdrawals",
                                method: "POST",
                                headers: a,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        creatorWalletId: l(e.creatorWalletId),
                                        clientIdempotencyKey: e.clientIdempotencyKey,
                                        beneficiaryId: e.beneficiaryId,
                                        amountAttos: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                currency: e.currency,
                                                units: e.units,
                                                attos: e.attos
                                            }
                                        }(e.amountAttos)
                                    }
                                }(e.initiateWithdrawalRequest)
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    moneyMovementIntentId: (0, t.exists)(e, "moneyMovementIntentId") ? e.moneyMovementIntentId : void 0
                                }
                            })]
                    }
                })
            })
        }, a.prototype.v1WalletWithdrawalsPost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1WalletWithdrawalsPostRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, a
    }(t.BaseAPI);
    e.s(["AgeGroup", 0, {
        Invalid: "AGE_GROUP_INVALID",
        NotVerified: "AGE_GROUP_NOT_VERIFIED",
        Adult: "AGE_GROUP_ADULT",
        Minor: "AGE_GROUP_MINOR",
        Child: "AGE_GROUP_CHILD"
    }, "CreatorWalletsAPIApi", 0, m])
}, 685949, e => {
    "use strict";
    var t = e.i(182012),
        r = e.i(795621),
        n = e.i(157310),
        i = e.i(221628),
        a = e.i(416340);
    let o = (0, a.createContext)(null);

    function l() {
        let e = (0, a.useContext)(o);
        if (!e) throw Error("No Creator Wallets client found. Wrap this tree in <CreatorWalletsProvider client={createCreatorWalletsClient(...)}>.");
        return e
    }

    function u(e, t) {
        return async function() {
            for (var r = arguments.length, n = Array(r), i = 0; i < r; i++) n[i] = arguments[i];
            await e(), await (null == t ? void 0 : t(...n))
        }
    }
    let s = {
        all: ["creatorWallets"],
        onboardingState: e => ["creatorWallets", "onboardingState", null != e ? e : "self"],
        walletBalance: e => ["creatorWallets", "walletBalance", null != e ? e : "self"],
        robuxBalance: (e, t) => ["creatorWallets", "robuxBalance", e, t],
        beneficiaries: e => ["creatorWallets", "beneficiaries", null != e ? e : "self"]
    };
    e.s(["C", 0, function(e) {
        let {
            client: t,
            children: r
        } = e;
        return (0, i.jsx)(o.Provider, {
            value: t,
            children: r
        })
    }, "a", 0, function(e, n) {
        let i = l(),
            a = (0, r.useQueryClient)(),
            o = null == e ? void 0 : e.groupId;
        return (0, t.useMutation)({
            ...n,
            mutationFn: e => i.archiveBeneficiary(e, o),
            onSuccess: u(() => a.invalidateQueries({
                queryKey: s.beneficiaries(o)
            }), null == n ? void 0 : n.onSuccess)
        })
    }, "b", 0, function(e, t) {
        let r = l(),
            i = null == e ? void 0 : e.groupId;
        return (0, n.useQuery)({
            queryKey: s.beneficiaries(i),
            queryFn: e => {
                let {
                    signal: t
                } = e;
                return r.listBeneficiaries(i, {
                    signal: t
                })
            },
            ...t
        })
    }, "c", 0, s, "d", 0, function(e, r) {
        let n = l(),
            i = null == e ? void 0 : e.groupId;
        return (0, t.useMutation)({
            mutationFn: e => n.initializeBeneficiaryEmbedding(e, i),
            ...r
        })
    }, "e", 0, function(e, r) {
        let n = l(),
            i = null == e ? void 0 : e.groupId;
        return (0, t.useMutation)({
            mutationFn: e => n.initializeKycEmbedding(e, i),
            ...r
        })
    }, "f", 0, function(e, r) {
        let n = l(),
            i = null == e ? void 0 : e.groupId;
        return (0, t.useMutation)({
            mutationFn: e => n.initializeKycRfiEmbedding(e, i),
            ...r
        })
    }, "g", 0, function(e, n) {
        let i = l(),
            a = (0, r.useQueryClient)(),
            o = null == e ? void 0 : e.groupId;
        return (0, t.useMutation)({
            ...n,
            mutationFn: e => i.initiateWithdrawal(e, o),
            onSuccess: u(() => a.invalidateQueries({
                queryKey: s.walletBalance(o)
            }), null == n ? void 0 : n.onSuccess)
        })
    }, "h", 0, function(e, t) {
        let r = l(),
            i = null == e ? void 0 : e.groupId;
        return (0, n.useQuery)({
            queryKey: s.onboardingState(i),
            queryFn: e => {
                let {
                    signal: t
                } = e;
                return r.getOnboardingState(i, {
                    signal: t
                })
            },
            ...t
        })
    }, "i", 0, function(e, n) {
        let i = l(),
            a = (0, r.useQueryClient)(),
            o = null == e ? void 0 : e.groupId;
        return (0, t.useMutation)({
            ...n,
            mutationFn: e => i.saveBeneficiary(e, o),
            onSuccess: u(() => a.invalidateQueries({
                queryKey: s.beneficiaries(o)
            }), null == n ? void 0 : n.onSuccess)
        })
    }, "j", 0, function(e, t) {
        let r = l(),
            i = null == e ? void 0 : e.groupId;
        return (0, n.useQuery)({
            queryKey: s.walletBalance(i),
            queryFn: e => {
                let {
                    signal: t
                } = e;
                return r.getWalletBalance(i, {
                    signal: t
                })
            },
            ...t
        })
    }, "k", 0, function(e) {
        var t, r;
        return null != (t = null != (r = e.isPending) ? r : e.isLoading) && t
    }])
}]);

//# debugId=84c7df33-ce88-9fc3-b690-95e54473b425
//# sourceMappingURL=12ola2x65ybk8.js.map