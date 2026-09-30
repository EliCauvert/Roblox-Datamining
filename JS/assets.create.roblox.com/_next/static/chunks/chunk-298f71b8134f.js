;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "4137694f-5345-8ddd-19c7-a8f4c67f7740")
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
}, 92174, 426173, e => {
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
    e.s(["isTaxDocumentationEnabled", 0, n, "shouldUseWatermarkFiatCalculation", 0, r], 92174);
    let i = (0, t.defineFlag)({
            namespace: "financial-platform",
            name: "isTaxDocumentationOpenToDevexEligible",
            defaultValue: !1
        }),
        a = (0, t.defineFlag)({
            namespace: "financial-platform",
            name: "isTaxFormDeliveryConsentEnabled",
            defaultValue: !1
        }),
        o = (0, t.defineFlag)({
            namespace: "financial-platform",
            name: "taxFormDeliveryConsentRolloutPercentage",
            defaultValue: 100
        });
    e.s(["isTaxDocumentationOpenToDevexEligible", 0, i, "isTaxFormDeliveryConsentEnabled", 0, a, "taxFormDeliveryConsentRolloutPercentage", 0, o], 426173)
}, 137521, e => {
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
                    s(n.next(e))
                } catch (e) {
                    a(e)
                }
            }

            function l(e) {
                try {
                    s(n.throw(e))
                } catch (e) {
                    a(e)
                }
            }

            function s(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof r ? t : new r(function(e) {
                    e(t)
                })).then(o, l)
            }
            s((n = n.apply(e, t || [])).next())
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
            return function(s) {
                var u = [l, s];
                if (r) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, u[0] && (a = 0)), a;) try {
                    if (r = 1, n && (i = 2 & u[0] ? n.return : u[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, u[1])).done) return i;
                    switch (n = 0, i && (u = [2 & u[0], i.value]), u[0]) {
                        case 0:
                        case 1:
                            i = u;
                            break;
                        case 4:
                            return a.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            a.label++, n = u[1], u = [0];
                            continue;
                        case 7:
                            u = a.ops.pop(), a.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                a = 0;
                                continue
                            }
                            if (3 === u[0] && (!i || u[1] > i[0] && u[1] < i[3])) {
                                a.label = u[1];
                                break
                            }
                            if (6 === u[0] && a.label < i[1]) {
                                a.label = i[1], i = u;
                                break
                            }
                            if (i && a.label < i[2]) {
                                a.label = i[2], a.ops.push(u);
                                break
                            }
                            i[2] && a.ops.pop(), a.trys.pop();
                            continue
                    }
                    u = t.call(e, a)
                } catch (e) {
                    u = [6, e], n = 0
                } finally {
                    r = i = 0
                }
                if (5 & u[0]) throw u[1];
                return {
                    value: u[0] ? u[1] : void 0,
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

    function s(e, r) {
        var n, i, a, o, l, s, u, d, c;
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
                requestedForInformation: (0, t.exists)(o, "requestedForInformation") ? null == (s = o.requestedForInformation) ? s : {
                    rfiType: (0, t.exists)(s, "rfiType") ? s.rfiType : void 0
                } : void 0,
                accountCreated: (0, t.exists)(o, "accountCreated") ? o.accountCreated : void 0,
                rejected: (0, t.exists)(o, "rejected") ? o.rejected : void 0,
                bankingGatewayProfile: (0, t.exists)(o, "bankingGatewayProfile") ? null == (u = o.bankingGatewayProfile) ? u : {
                    financialIdentityId: (0, t.exists)(u, "financialIdentityId") ? null == (d = u.financialIdentityId) ? d : {
                        value: (0, t.exists)(d, "value") ? d.value : void 0
                    } : void 0,
                    walletAccountId: (0, t.exists)(u, "walletAccountId") ? null == (c = u.walletAccountId) ? c : {
                        value: (0, t.exists)(c, "value") ? c.value : void 0
                    } : void 0
                } : void 0,
                primaryContactEmail: (0, t.exists)(o, "primaryContactEmail") ? o.primaryContactEmail : void 0
            } : void 0
        }
    }

    function u(e, r) {
        return null == e ? e : {
            balances: (0, t.exists)(e, "balances") ? e.balances.map(o) : void 0
        }
    }

    function d(e, r) {
        return null == e ? e : {
            grossAmount: (0, t.exists)(e, "grossAmount") ? a(e.grossAmount) : void 0,
            estimatedWithheldAmount: (0, t.exists)(e, "estimatedWithheldAmount") ? a(e.estimatedWithheldAmount) : void 0,
            estimatedPostTaxAmount: (0, t.exists)(e, "estimatedPostTaxAmount") ? a(e.estimatedPostTaxAmount) : void 0
        }
    }

    function c(e) {
        if (void 0 !== e) return null === e ? null : {
            creatorWalletId: l(e.creatorWalletId),
            codeChallenge: e.codeChallenge
        }
    }

    function f(e, r) {
        return null == e ? e : {
            clientId: (0, t.exists)(e, "clientId") ? e.clientId : void 0,
            authCode: (0, t.exists)(e, "authCode") ? e.authCode : void 0
        }
    }

    function p(e) {
        if (void 0 !== e) return null === e ? null : {
            creatorWalletId: l(e.creatorWalletId),
            codeChallenge: e.codeChallenge
        }
    }

    function R(e, r) {
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

    function C(e, r) {
        return null == e ? e : {
            clientId: (0, t.exists)(e, "clientId") ? e.clientId : void 0,
            authCode: (0, t.exists)(e, "authCode") ? e.authCode : void 0
        }
    }

    function h(e) {
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

    function I(e, r) {
        return null == e ? e : {
            beneficiaries: (0, t.exists)(e, "beneficiaries") ? e.beneficiaries.map(h) : void 0
        }
    }

    function y(e) {
        if (void 0 !== e) return null === e ? null : {
            creatorWalletId: l(e.creatorWalletId),
            beneficiaryId: e.beneficiaryId,
            nickname: e.nickname,
            isDefault: e.isDefault
        }
    }

    function E(e, r) {
        return null == e ? e : {
            beneficiary: (0, t.exists)(e, "beneficiary") ? h(e.beneficiary) : void 0
        }
    }
    var g = function(e) {
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
                                body: p(e.initializeKycEmbeddingRequest)
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return R(e)
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
                                return C(e)
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
                                return s(e)
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
                                return u(e)
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
                            return n = {}, void 0 !== e.creatorWalletIdUserId && (n["creatorWalletId.userId"] = e.creatorWalletIdUserId), void 0 !== e.includeArchived && (n.includeArchived = e.includeArchived), a = {}, [4, this.request({
                                path: "/v1/group/{creatorWalletId.groupId}/wallet/beneficiaries".replace("{".concat("creatorWalletId.groupId", "}"), encodeURIComponent(String(e.creatorWalletIdGroupId))),
                                schemaPath: "/v1/group/{creatorWalletId.groupId}/wallet/beneficiaries",
                                method: "GET",
                                headers: a,
                                query: n
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return I(e)
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
                                body: y(e.saveBeneficiaryRequest)
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return E(e)
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
                                body: c(e.initializeBeneficiaryEmbeddingRequest)
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return f(e)
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
        }, a.prototype.v1GroupCreatorWalletIdGroupIdWalletEarningsEstimateGetRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.creatorWalletIdGroupId || void 0 === e.creatorWalletIdGroupId) throw new t.RequiredError("creatorWalletIdGroupId", "Required parameter requestParameters.creatorWalletIdGroupId was null or undefined when calling v1GroupCreatorWalletIdGroupIdWalletEarningsEstimateGet.");
                            return n = {}, void 0 !== e.creatorWalletIdUserId && (n["creatorWalletId.userId"] = e.creatorWalletIdUserId), a = {}, [4, this.request({
                                path: "/v1/group/{creatorWalletId.groupId}/wallet/earnings-estimate".replace("{".concat("creatorWalletId.groupId", "}"), encodeURIComponent(String(e.creatorWalletIdGroupId))),
                                schemaPath: "/v1/group/{creatorWalletId.groupId}/wallet/earnings-estimate",
                                method: "GET",
                                headers: a,
                                query: n
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return d(e)
                            })]
                    }
                })
            })
        }, a.prototype.v1GroupCreatorWalletIdGroupIdWalletEarningsEstimateGet = function(e, t) {
            return n(this, void 0, void 0, function() {
                return i(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1GroupCreatorWalletIdGroupIdWalletEarningsEstimateGetRaw(e, t)];
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
                                body: p(e.initializeKycEmbeddingRequest)
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return R(e)
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
                                return C(e)
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
                                return s(e)
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
                                return u(e)
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
                            return n = {}, void 0 !== e.creatorWalletIdUserId && (n["creatorWalletId.userId"] = e.creatorWalletIdUserId), void 0 !== e.creatorWalletIdGroupId && (n["creatorWalletId.groupId"] = e.creatorWalletIdGroupId), void 0 !== e.includeArchived && (n.includeArchived = e.includeArchived), a = {}, [4, this.request({
                                path: "/v1/self/wallet/beneficiaries",
                                schemaPath: "/v1/self/wallet/beneficiaries",
                                method: "GET",
                                headers: a,
                                query: n
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return I(e)
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
                                body: y(e.saveBeneficiaryRequest)
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return E(e)
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
                                body: c(e.initializeBeneficiaryEmbeddingRequest)
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return f(e)
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
        }, a.prototype.v1SelfWalletEarningsEstimateGetRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, void 0 !== e.creatorWalletIdUserId && (n["creatorWalletId.userId"] = e.creatorWalletIdUserId), void 0 !== e.creatorWalletIdGroupId && (n["creatorWalletId.groupId"] = e.creatorWalletIdGroupId), a = {}, [4, this.request({
                                path: "/v1/self/wallet/earnings-estimate",
                                schemaPath: "/v1/self/wallet/earnings-estimate",
                                method: "GET",
                                headers: a,
                                query: n
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return d(e)
                            })]
                    }
                })
            })
        }, a.prototype.v1SelfWalletEarningsEstimateGet = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1SelfWalletEarningsEstimateGetRaw(e, t)];
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
    }, "CreatorWalletsAPIApi", 0, g, "Currency", 0, {
        Invalid: "CURRENCY_INVALID",
        Aed: "CURRENCY_AED",
        Afn: "CURRENCY_AFN",
        All: "CURRENCY_ALL",
        Amd: "CURRENCY_AMD",
        Ang: "CURRENCY_ANG",
        Aoa: "CURRENCY_AOA",
        Ars: "CURRENCY_ARS",
        Aud: "CURRENCY_AUD",
        Awg: "CURRENCY_AWG",
        Azn: "CURRENCY_AZN",
        Bam: "CURRENCY_BAM",
        Bbd: "CURRENCY_BBD",
        Bdt: "CURRENCY_BDT",
        Bes: "CURRENCY_BES",
        Bgn: "CURRENCY_BGN",
        Bhd: "CURRENCY_BHD",
        Bif: "CURRENCY_BIF",
        Bmd: "CURRENCY_BMD",
        Bnd: "CURRENCY_BND",
        Bob: "CURRENCY_BOB",
        Bov: "CURRENCY_BOV",
        Brl: "CURRENCY_BRL",
        Bsd: "CURRENCY_BSD",
        Btn: "CURRENCY_BTN",
        Bwp: "CURRENCY_BWP",
        Byn: "CURRENCY_BYN",
        Bzd: "CURRENCY_BZD",
        Cad: "CURRENCY_CAD",
        Cdf: "CURRENCY_CDF",
        Chf: "CURRENCY_CHF",
        Clp: "CURRENCY_CLP",
        Cny: "CURRENCY_CNY",
        Cop: "CURRENCY_COP",
        Crc: "CURRENCY_CRC",
        Cup: "CURRENCY_CUP",
        Cve: "CURRENCY_CVE",
        Czk: "CURRENCY_CZK",
        Djf: "CURRENCY_DJF",
        Dkk: "CURRENCY_DKK",
        Dop: "CURRENCY_DOP",
        Dzd: "CURRENCY_DZD",
        Egp: "CURRENCY_EGP",
        Ern: "CURRENCY_ERN",
        Etb: "CURRENCY_ETB",
        Eur: "CURRENCY_EUR",
        Fjd: "CURRENCY_FJD",
        Fkp: "CURRENCY_FKP",
        Gbp: "CURRENCY_GBP",
        Gel: "CURRENCY_GEL",
        Ghs: "CURRENCY_GHS",
        Gip: "CURRENCY_GIP",
        Gmd: "CURRENCY_GMD",
        Gnf: "CURRENCY_GNF",
        Gtq: "CURRENCY_GTQ",
        Gyd: "CURRENCY_GYD",
        Hkd: "CURRENCY_HKD",
        Hnl: "CURRENCY_HNL",
        Hrk: "CURRENCY_HRK",
        Htg: "CURRENCY_HTG",
        Huf: "CURRENCY_HUF",
        Idr: "CURRENCY_IDR",
        Ils: "CURRENCY_ILS",
        Inr: "CURRENCY_INR",
        Iqd: "CURRENCY_IQD",
        Irr: "CURRENCY_IRR",
        Isk: "CURRENCY_ISK",
        Jmd: "CURRENCY_JMD",
        Jod: "CURRENCY_JOD",
        Jpy: "CURRENCY_JPY",
        Kes: "CURRENCY_KES",
        Kgs: "CURRENCY_KGS",
        Khr: "CURRENCY_KHR",
        Kmf: "CURRENCY_KMF",
        Kpw: "CURRENCY_KPW",
        Krw: "CURRENCY_KRW",
        Kwd: "CURRENCY_KWD",
        Kyd: "CURRENCY_KYD",
        Kzt: "CURRENCY_KZT",
        Lak: "CURRENCY_LAK",
        Lbp: "CURRENCY_LBP",
        Lkr: "CURRENCY_LKR",
        Lrd: "CURRENCY_LRD",
        Lsl: "CURRENCY_LSL",
        Lyd: "CURRENCY_LYD",
        Mad: "CURRENCY_MAD",
        Mdl: "CURRENCY_MDL",
        Mga: "CURRENCY_MGA",
        Mkd: "CURRENCY_MKD",
        Mmk: "CURRENCY_MMK",
        Mnt: "CURRENCY_MNT",
        Mop: "CURRENCY_MOP",
        Mru: "CURRENCY_MRU",
        Mur: "CURRENCY_MUR",
        Mvr: "CURRENCY_MVR",
        Mwk: "CURRENCY_MWK",
        Mxn: "CURRENCY_MXN",
        Mxv: "CURRENCY_MXV",
        Myr: "CURRENCY_MYR",
        Mzn: "CURRENCY_MZN",
        Nad: "CURRENCY_NAD",
        Ngn: "CURRENCY_NGN",
        Nio: "CURRENCY_NIO",
        Nok: "CURRENCY_NOK",
        Npr: "CURRENCY_NPR",
        Nzd: "CURRENCY_NZD",
        Omr: "CURRENCY_OMR",
        Pab: "CURRENCY_PAB",
        Pen: "CURRENCY_PEN",
        Pgk: "CURRENCY_PGK",
        Php: "CURRENCY_PHP",
        Pkr: "CURRENCY_PKR",
        Pln: "CURRENCY_PLN",
        Pyg: "CURRENCY_PYG",
        Qar: "CURRENCY_QAR",
        Ron: "CURRENCY_RON",
        Rsd: "CURRENCY_RSD",
        Rub: "CURRENCY_RUB",
        Rwf: "CURRENCY_RWF",
        Sar: "CURRENCY_SAR",
        Sbd: "CURRENCY_SBD",
        Scr: "CURRENCY_SCR",
        Sdg: "CURRENCY_SDG",
        Sek: "CURRENCY_SEK",
        Sgd: "CURRENCY_SGD",
        Shp: "CURRENCY_SHP",
        Sll: "CURRENCY_SLL",
        Sos: "CURRENCY_SOS",
        Srd: "CURRENCY_SRD",
        Ssp: "CURRENCY_SSP",
        Stn: "CURRENCY_STN",
        Svc: "CURRENCY_SVC",
        Syp: "CURRENCY_SYP",
        Szl: "CURRENCY_SZL",
        Thb: "CURRENCY_THB",
        Tjs: "CURRENCY_TJS",
        Tmt: "CURRENCY_TMT",
        Tnd: "CURRENCY_TND",
        Top: "CURRENCY_TOP",
        Try: "CURRENCY_TRY",
        Ttd: "CURRENCY_TTD",
        Twd: "CURRENCY_TWD",
        Tzs: "CURRENCY_TZS",
        Uah: "CURRENCY_UAH",
        Ugx: "CURRENCY_UGX",
        Usd: "CURRENCY_USD",
        Uyu: "CURRENCY_UYU",
        Uzs: "CURRENCY_UZS",
        Vef: "CURRENCY_VEF",
        Ves: "CURRENCY_VES",
        Vnd: "CURRENCY_VND",
        Vuv: "CURRENCY_VUV",
        Wst: "CURRENCY_WST",
        Xaf: "CURRENCY_XAF",
        Xcd: "CURRENCY_XCD",
        Xof: "CURRENCY_XOF",
        Xpf: "CURRENCY_XPF",
        Yer: "CURRENCY_YER",
        Zar: "CURRENCY_ZAR",
        Zmw: "CURRENCY_ZMW",
        Zwl: "CURRENCY_ZWL",
        Robux: "CURRENCY_ROBUX",
        Offer: "CURRENCY_OFFER"
    }])
}, 568599, e => {
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

    function s(e, t) {
        return async function() {
            for (var r = arguments.length, n = Array(r), i = 0; i < r; i++) n[i] = arguments[i];
            await e(), await (null == t ? void 0 : t(...n))
        }
    }
    let u = {
        all: ["creatorWallets"],
        onboardingState: e => ["creatorWallets", "onboardingState", null != e ? e : "self"],
        walletBalance: e => ["creatorWallets", "walletBalance", null != e ? e : "self"],
        walletEarningsEstimate: e => ["creatorWallets", "walletEarningsEstimate", null != e ? e : "self"],
        robuxBalance: (e, t) => ["creatorWallets", "robuxBalance", e, t],
        beneficiaries: function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
            return t ? ["creatorWallets", "beneficiaries", null != e ? e : "self", "includeArchived"] : ["creatorWallets", "beneficiaries", null != e ? e : "self"]
        }
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
            onSuccess: s(() => a.invalidateQueries({
                queryKey: u.beneficiaries(o)
            }), null == n ? void 0 : n.onSuccess)
        })
    }, "b", 0, function(e, t) {
        let r = l(),
            i = null == e ? void 0 : e.groupId;
        return (0, n.useQuery)({
            queryKey: u.beneficiaries(i),
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
    }, "c", 0, u, "d", 0, function(e, r) {
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
            onSuccess: s(() => a.invalidateQueries({
                queryKey: u.walletBalance(o)
            }), null == n ? void 0 : n.onSuccess)
        })
    }, "h", 0, function(e, t) {
        let r = l(),
            i = null == e ? void 0 : e.groupId;
        return (0, n.useQuery)({
            queryKey: u.onboardingState(i),
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
            onSuccess: s(() => a.invalidateQueries({
                queryKey: u.beneficiaries(o)
            }), null == n ? void 0 : n.onSuccess)
        })
    }, "j", 0, function(e, t) {
        let r = l(),
            i = null == e ? void 0 : e.groupId;
        return (0, n.useQuery)({
            queryKey: u.walletBalance(i),
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

//# debugId=4137694f-5345-8ddd-19c7-a8f4c67f7740
//# sourceMappingURL=2fslqifvhq-zm.js.map