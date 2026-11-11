;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "760c2c75-cb08-c3f3-3f0d-76b675c123f6")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 764967, e => {
    "use strict";
    var t = e.i(415858),
        n = function(e, t) {
            return (n = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function r(e, t, n, r) {
        return new(n || (n = Promise))(function(i, a) {
            function o(e) {
                try {
                    u(r.next(e))
                } catch (e) {
                    a(e)
                }
            }

            function l(e) {
                try {
                    u(r.throw(e))
                } catch (e) {
                    a(e)
                }
            }

            function u(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(o, l)
            }
            u((r = r.apply(e, t || [])).next())
        })
    }

    function i(e, t) {
        var n, r, i, a = {
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
                if (n) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, s[0] && (a = 0)), a;) try {
                    if (n = 1, r && (i = 2 & s[0] ? r.return : s[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, s[1])).done) return i;
                    switch (r = 0, i && (s = [2 & s[0], i.value]), s[0]) {
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
                            a.label++, r = s[1], s = [0];
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
                    s = [6, e], r = 0
                } finally {
                    n = i = 0
                }
                if (5 & s[0]) throw s[1];
                return {
                    value: s[0] ? s[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function a(e) {
        if (void 0 !== e) return null === e ? null : {
            userId: e.userId,
            groupId: e.groupId
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function o(e, n) {
        return null == e ? e : {
            accountType: (0, t.u)(e, "accountType") ? e.accountType : void 0,
            acceptedTermsVersion: (0, t.u)(e, "acceptedTermsVersion") ? e.acceptedTermsVersion : void 0,
            termsAcceptedTime: (0, t.u)(e, "termsAcceptedTime") ? new Date(e.termsAcceptedTime) : void 0
        }
    }

    function l(e) {
        if (void 0 !== e) return null === e ? null : {
            creatorWalletId: a(e.creatorWalletId),
            status: e.status
        }
    }

    function u(e, n) {
        return null == e ? e : {
            acknowledgedStatus: (0, t.u)(e, "acknowledgedStatus") ? e.acknowledgedStatus : void 0
        }
    }

    function s(e, n) {
        return null == e ? e : {
            currency: (0, t.u)(e, "currency") ? e.currency : void 0,
            units: (0, t.u)(e, "units") ? e.units : void 0,
            attos: (0, t.u)(e, "attos") ? e.attos : void 0
        }
    }

    function d(e) {
        var n;
        return null == (n = e) ? n : {
            currency: (0, t.u)(n, "currency") ? n.currency : void 0,
            availableAmount: (0, t.u)(n, "availableAmount") ? s(n.availableAmount) : void 0,
            pendingAmount: (0, t.u)(n, "pendingAmount") ? s(n.pendingAmount) : void 0
        }
    }

    function c(e, n) {
        return null == e ? e : {
            status: (0, t.u)(e, "status") ? e.status : void 0,
            canLaunchProvider: (0, t.u)(e, "canLaunchProvider") ? e.canLaunchProvider : void 0,
            isRescreen: (0, t.u)(e, "isRescreen") ? e.isRescreen : void 0
        }
    }

    function f(e, n) {
        return null == e ? e : {
            notVerified: (0, t.u)(e, "notVerified") ? e.notVerified : void 0,
            verifiedEmail: (0, t.u)(e, "verifiedEmail") ? e.verifiedEmail : void 0
        }
    }

    function v(e) {
        var n, r, i, a, l, u, s, d, c, v;
        return null == (n = e) ? n : {
            eligibility: (0, t.u)(n, "eligibility") ? null == (r = n.eligibility) ? r : {
                authenticatedUserId: (0, t.u)(r, "authenticatedUserId") ? r.authenticatedUserId : void 0,
                eligible: (0, t.u)(r, "eligible") ? null == (i = r.eligible) ? i : {
                    canStartKyc: (0, t.u)(i, "canStartKyc") ? i.canStartKyc : void 0,
                    ageGroup: (0, t.u)(i, "ageGroup") ? i.ageGroup : void 0,
                    emailVerificationStatus: (0, t.u)(i, "emailVerificationStatus") ? f(i.emailVerificationStatus) : void 0
                } : void 0,
                ineligible: (0, t.u)(r, "ineligible") ? r.ineligible : void 0
            } : void 0,
            onboardingState: (0, t.u)(n, "onboardingState") ? null == (a = n.onboardingState) ? a : {
                initiatingUserId: (0, t.u)(a, "initiatingUserId") ? a.initiatingUserId : void 0,
                creatorWalletId: (0, t.u)(a, "creatorWalletId") ? null == (l = a.creatorWalletId) ? l : {
                    userId: (0, t.u)(l, "userId") ? l.userId : void 0,
                    groupId: (0, t.u)(l, "groupId") ? l.groupId : void 0
                } : void 0,
                notStarted: (0, t.u)(a, "notStarted") ? a.notStarted : void 0,
                accountOnboardingInitiated: (0, t.u)(a, "accountOnboardingInitiated") ? a.accountOnboardingInitiated : void 0,
                underReview: (0, t.u)(a, "underReview") ? a.underReview : void 0,
                requestedForInformation: (0, t.u)(a, "requestedForInformation") ? null == (u = a.requestedForInformation) ? u : {
                    rfiType: (0, t.u)(u, "rfiType") ? u.rfiType : void 0
                } : void 0,
                accountCreated: (0, t.u)(a, "accountCreated") ? a.accountCreated : void 0,
                rejected: (0, t.u)(a, "rejected") ? a.rejected : void 0,
                verified: (0, t.u)(a, "verified") ? a.verified : void 0,
                bankingGatewayProfile: (0, t.u)(a, "bankingGatewayProfile") ? null == (s = a.bankingGatewayProfile) ? s : {
                    financialIdentityId: (0, t.u)(s, "financialIdentityId") ? null == (d = s.financialIdentityId) ? d : {
                        value: (0, t.u)(d, "value") ? d.value : void 0
                    } : void 0,
                    walletAccountId: (0, t.u)(s, "walletAccountId") ? null == (c = s.walletAccountId) ? c : {
                        value: (0, t.u)(c, "value") ? c.value : void 0
                    } : void 0
                } : void 0,
                primaryContactEmail: (0, t.u)(a, "primaryContactEmail") ? a.primaryContactEmail : void 0,
                sanctionsScreeningProgress: (0, t.u)(a, "sanctionsScreeningProgress") ? null == (v = a.sanctionsScreeningProgress) ? v : {
                    status: (0, t.u)(v, "status") ? v.status : void 0,
                    updatedTime: (0, t.u)(v, "updatedTime") ? new Date(v.updatedTime) : void 0
                } : void 0
            } : void 0,
            onboardingDraft: (0, t.u)(n, "onboardingDraft") ? o(n.onboardingDraft) : void 0,
            acknowledgedStatus: (0, t.u)(n, "acknowledgedStatus") ? n.acknowledgedStatus : void 0
        }
    }

    function p(e, n) {
        return null == e ? e : {
            balances: (0, t.u)(e, "balances") ? e.balances.map(d) : void 0
        }
    }

    function I(e, n) {
        return null == e ? e : {
            grossAmount: (0, t.u)(e, "grossAmount") ? s(e.grossAmount) : void 0,
            estimatedWithheldAmount: (0, t.u)(e, "estimatedWithheldAmount") ? s(e.estimatedWithheldAmount) : void 0,
            estimatedPostTaxAmount: (0, t.u)(e, "estimatedPostTaxAmount") ? s(e.estimatedPostTaxAmount) : void 0,
            estimatedArrivalTime: (0, t.u)(e, "estimatedArrivalTime") ? new Date(e.estimatedArrivalTime) : void 0,
            estimatedArrivalUnavailableReason: (0, t.u)(e, "estimatedArrivalUnavailableReason") ? e.estimatedArrivalUnavailableReason : void 0
        }
    }

    function R(e) {
        if (void 0 !== e) return null === e ? null : {
            creatorWalletId: a(e.creatorWalletId),
            codeChallenge: e.codeChallenge
        }
    }

    function h(e, n) {
        return null == e ? e : {
            clientId: (0, t.u)(e, "clientId") ? e.clientId : void 0,
            authCode: (0, t.u)(e, "authCode") ? e.authCode : void 0
        }
    }

    function C(e) {
        if (void 0 !== e) return null === e ? null : {
            creatorWalletId: a(e.creatorWalletId),
            codeChallenge: e.codeChallenge
        }
    }

    function g(e, n) {
        return null == e ? e : {
            clientId: (0, t.u)(e, "clientId") ? e.clientId : void 0,
            authCode: (0, t.u)(e, "authCode") ? e.authCode : void 0
        }
    }

    function E(e) {
        if (void 0 !== e) return null === e ? null : {
            creatorWalletId: a(e.creatorWalletId),
            codeChallenge: e.codeChallenge
        }
    }

    function b(e, n) {
        return null == e ? e : {
            clientId: (0, t.u)(e, "clientId") ? e.clientId : void 0,
            authCode: (0, t.u)(e, "authCode") ? e.authCode : void 0
        }
    }

    function m(e) {
        var n;
        return null == (n = e) ? n : {
            beneficiaryId: (0, t.u)(n, "beneficiaryId") ? n.beneficiaryId : void 0,
            nickname: (0, t.u)(n, "nickname") ? n.nickname : void 0,
            isDefault: (0, t.u)(n, "isDefault") ? n.isDefault : void 0,
            status: (0, t.u)(n, "status") ? n.status : void 0,
            transferMethod: (0, t.u)(n, "transferMethod") ? n.transferMethod : void 0,
            transferFee: (0, t.u)(n, "transferFee") ? s(n.transferFee) : void 0
        }
    }

    function y(e, n) {
        return null == e ? e : {
            beneficiaries: (0, t.u)(e, "beneficiaries") ? e.beneficiaries.map(m) : void 0
        }
    }

    function S(e) {
        if (void 0 !== e) return null === e ? null : {
            creatorWalletId: a(e.creatorWalletId),
            beneficiaryId: e.beneficiaryId,
            nickname: e.nickname,
            isDefault: e.isDefault
        }
    }

    function w(e, n) {
        return null == e ? e : {
            beneficiary: (0, t.u)(e, "beneficiary") ? m(e.beneficiary) : void 0
        }
    }
    var W = function(e) {
        function s() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function r() {
                this.constructor = e
            }
            n(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
        }(s, e), s.prototype.getTaxFormDeliveryPreferenceRaw = function(e) {
            return r(this, void 0, void 0, function() {
                var n, r, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/self/tax/form-delivery-preference",
                                schemaPath: "/v1/self/tax/form-delivery-preference",
                                method: "GET",
                                headers: r,
                                query: n
                            }, e)];
                        case 1:
                            return a = i.sent(), [2, new t.H(a, function(e) {
                                return null == e ? e : {
                                    mailingPreference: (0, t.u)(e, "mailingPreference") ? e.mailingPreference : void 0,
                                    updatedTime: (0, t.u)(e, "updatedTime") ? new Date(e.updatedTime) : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.getTaxFormDeliveryPreference = function(e) {
            return r(this, void 0, void 0, function() {
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
        }, s.prototype.signElectronicTaxFormDeliveryRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/self/tax/electronic-form-delivery:sign",
                                schemaPath: "/v1/self/tax/electronic-form-delivery:sign",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        clientIdempotencyKey: e.clientIdempotencyKey
                                    }
                                }(e.signElectronicTaxFormDeliveryRequest)
                            }, n)];
                        case 1:
                            return o = i.sent(), [2, new t.H(o, function(e) {
                                return null == e ? e : {
                                    mailingPreference: (0, t.u)(e, "mailingPreference") ? e.mailingPreference : void 0,
                                    updatedTime: (0, t.u)(e, "updatedTime") ? new Date(e.updatedTime) : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.signElectronicTaxFormDelivery = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.signElectronicTaxFormDeliveryRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s.prototype.v1GroupCreatorWalletIdGroupIdOnboardingKycEmbeddinginitializePostRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.creatorWalletIdGroupId || void 0 === e.creatorWalletIdGroupId) throw new t.w("creatorWalletIdGroupId", "Required parameter requestParameters.creatorWalletIdGroupId was null or undefined when calling v1GroupCreatorWalletIdGroupIdOnboardingKycEmbeddinginitializePost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/group/{creatorWalletId.groupId}/onboarding/kyc-embedding:initialize".replace("{".concat("creatorWalletId.groupId", "}"), encodeURIComponent(String(e.creatorWalletIdGroupId))),
                                schemaPath: "/v1/group/{creatorWalletId.groupId}/onboarding/kyc-embedding:initialize",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: C(e.initializeKycEmbeddingRequest)
                            }, n)];
                        case 1:
                            return o = i.sent(), [2, new t.H(o, function(e) {
                                return g(e)
                            })]
                    }
                })
            })
        }, s.prototype.v1GroupCreatorWalletIdGroupIdOnboardingKycEmbeddinginitializePost = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1GroupCreatorWalletIdGroupIdOnboardingKycEmbeddinginitializePostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s.prototype.v1GroupCreatorWalletIdGroupIdOnboardingKycRfiEmbeddinginitializePostRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.creatorWalletIdGroupId || void 0 === e.creatorWalletIdGroupId) throw new t.w("creatorWalletIdGroupId", "Required parameter requestParameters.creatorWalletIdGroupId was null or undefined when calling v1GroupCreatorWalletIdGroupIdOnboardingKycRfiEmbeddinginitializePost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/group/{creatorWalletId.groupId}/onboarding/kyc-rfi-embedding:initialize".replace("{".concat("creatorWalletId.groupId", "}"), encodeURIComponent(String(e.creatorWalletIdGroupId))),
                                schemaPath: "/v1/group/{creatorWalletId.groupId}/onboarding/kyc-rfi-embedding:initialize",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: E(e.initializeKycRfiEmbeddingRequest)
                            }, n)];
                        case 1:
                            return o = i.sent(), [2, new t.H(o, function(e) {
                                return b(e)
                            })]
                    }
                })
            })
        }, s.prototype.v1GroupCreatorWalletIdGroupIdOnboardingKycRfiEmbeddinginitializePost = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1GroupCreatorWalletIdGroupIdOnboardingKycRfiEmbeddinginitializePostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s.prototype.v1GroupCreatorWalletIdGroupIdOnboardingStateGetRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.creatorWalletIdGroupId || void 0 === e.creatorWalletIdGroupId) throw new t.w("creatorWalletIdGroupId", "Required parameter requestParameters.creatorWalletIdGroupId was null or undefined when calling v1GroupCreatorWalletIdGroupIdOnboardingStateGet.");
                            return r = {}, void 0 !== e.creatorWalletIdUserId && (r["creatorWalletId.userId"] = e.creatorWalletIdUserId), a = {}, [4, this.request({
                                path: "/v1/group/{creatorWalletId.groupId}/onboarding/state".replace("{".concat("creatorWalletId.groupId", "}"), encodeURIComponent(String(e.creatorWalletIdGroupId))),
                                schemaPath: "/v1/group/{creatorWalletId.groupId}/onboarding/state",
                                method: "GET",
                                headers: a,
                                query: r
                            }, n)];
                        case 1:
                            return o = i.sent(), [2, new t.H(o, function(e) {
                                return v(e)
                            })]
                    }
                })
            })
        }, s.prototype.v1GroupCreatorWalletIdGroupIdOnboardingStateGet = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1GroupCreatorWalletIdGroupIdOnboardingStateGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s.prototype.v1GroupCreatorWalletIdGroupIdOnboardingStatusacknowledgePostRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.creatorWalletIdGroupId || void 0 === e.creatorWalletIdGroupId) throw new t.w("creatorWalletIdGroupId", "Required parameter requestParameters.creatorWalletIdGroupId was null or undefined when calling v1GroupCreatorWalletIdGroupIdOnboardingStatusacknowledgePost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/group/{creatorWalletId.groupId}/onboarding/status:acknowledge".replace("{".concat("creatorWalletId.groupId", "}"), encodeURIComponent(String(e.creatorWalletIdGroupId))),
                                schemaPath: "/v1/group/{creatorWalletId.groupId}/onboarding/status:acknowledge",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: l(e.acknowledgeOnboardingStatusRequest)
                            }, n)];
                        case 1:
                            return o = i.sent(), [2, new t.H(o, function(e) {
                                return u(e)
                            })]
                    }
                })
            })
        }, s.prototype.v1GroupCreatorWalletIdGroupIdOnboardingStatusacknowledgePost = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1GroupCreatorWalletIdGroupIdOnboardingStatusacknowledgePostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s.prototype.v1GroupCreatorWalletIdGroupIdWalletBalanceGetRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.creatorWalletIdGroupId || void 0 === e.creatorWalletIdGroupId) throw new t.w("creatorWalletIdGroupId", "Required parameter requestParameters.creatorWalletIdGroupId was null or undefined when calling v1GroupCreatorWalletIdGroupIdWalletBalanceGet.");
                            return r = {}, void 0 !== e.creatorWalletIdUserId && (r["creatorWalletId.userId"] = e.creatorWalletIdUserId), a = {}, [4, this.request({
                                path: "/v1/group/{creatorWalletId.groupId}/wallet/balance".replace("{".concat("creatorWalletId.groupId", "}"), encodeURIComponent(String(e.creatorWalletIdGroupId))),
                                schemaPath: "/v1/group/{creatorWalletId.groupId}/wallet/balance",
                                method: "GET",
                                headers: a,
                                query: r
                            }, n)];
                        case 1:
                            return o = i.sent(), [2, new t.H(o, function(e) {
                                return p(e)
                            })]
                    }
                })
            })
        }, s.prototype.v1GroupCreatorWalletIdGroupIdWalletBalanceGet = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1GroupCreatorWalletIdGroupIdWalletBalanceGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s.prototype.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesBeneficiaryIdDeleteRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.creatorWalletIdGroupId || void 0 === e.creatorWalletIdGroupId) throw new t.w("creatorWalletIdGroupId", "Required parameter requestParameters.creatorWalletIdGroupId was null or undefined when calling v1GroupCreatorWalletIdGroupIdWalletBeneficiariesBeneficiaryIdDelete.");
                            if (null === e.beneficiaryId || void 0 === e.beneficiaryId) throw new t.w("beneficiaryId", "Required parameter requestParameters.beneficiaryId was null or undefined when calling v1GroupCreatorWalletIdGroupIdWalletBeneficiariesBeneficiaryIdDelete.");
                            return r = {}, void 0 !== e.creatorWalletIdUserId && (r["creatorWalletId.userId"] = e.creatorWalletIdUserId), a = {}, [4, this.request({
                                path: "/v1/group/{creatorWalletId.groupId}/wallet/beneficiaries/{beneficiaryId}".replace("{".concat("creatorWalletId.groupId", "}"), encodeURIComponent(String(e.creatorWalletIdGroupId))).replace("{".concat("beneficiaryId", "}"), encodeURIComponent(String(e.beneficiaryId))),
                                schemaPath: "/v1/group/{creatorWalletId.groupId}/wallet/beneficiaries/{beneficiaryId}",
                                method: "DELETE",
                                headers: a,
                                query: r
                            }, n)];
                        case 1:
                            return o = i.sent(), [2, new t.H(o)]
                    }
                })
            })
        }, s.prototype.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesBeneficiaryIdDelete = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesBeneficiaryIdDeleteRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s.prototype.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesGetRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.creatorWalletIdGroupId || void 0 === e.creatorWalletIdGroupId) throw new t.w("creatorWalletIdGroupId", "Required parameter requestParameters.creatorWalletIdGroupId was null or undefined when calling v1GroupCreatorWalletIdGroupIdWalletBeneficiariesGet.");
                            return r = {}, void 0 !== e.creatorWalletIdUserId && (r["creatorWalletId.userId"] = e.creatorWalletIdUserId), void 0 !== e.includeArchived && (r.includeArchived = e.includeArchived), a = {}, [4, this.request({
                                path: "/v1/group/{creatorWalletId.groupId}/wallet/beneficiaries".replace("{".concat("creatorWalletId.groupId", "}"), encodeURIComponent(String(e.creatorWalletIdGroupId))),
                                schemaPath: "/v1/group/{creatorWalletId.groupId}/wallet/beneficiaries",
                                method: "GET",
                                headers: a,
                                query: r
                            }, n)];
                        case 1:
                            return o = i.sent(), [2, new t.H(o, function(e) {
                                return y(e)
                            })]
                    }
                })
            })
        }, s.prototype.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesGet = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s.prototype.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesPostRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.creatorWalletIdGroupId || void 0 === e.creatorWalletIdGroupId) throw new t.w("creatorWalletIdGroupId", "Required parameter requestParameters.creatorWalletIdGroupId was null or undefined when calling v1GroupCreatorWalletIdGroupIdWalletBeneficiariesPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/group/{creatorWalletId.groupId}/wallet/beneficiaries".replace("{".concat("creatorWalletId.groupId", "}"), encodeURIComponent(String(e.creatorWalletIdGroupId))),
                                schemaPath: "/v1/group/{creatorWalletId.groupId}/wallet/beneficiaries",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: S(e.saveBeneficiaryRequest)
                            }, n)];
                        case 1:
                            return o = i.sent(), [2, new t.H(o, function(e) {
                                return w(e)
                            })]
                    }
                })
            })
        }, s.prototype.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesPost = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s.prototype.v1GroupCreatorWalletIdGroupIdWalletBeneficiaryEmbeddinginitializePostRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.creatorWalletIdGroupId || void 0 === e.creatorWalletIdGroupId) throw new t.w("creatorWalletIdGroupId", "Required parameter requestParameters.creatorWalletIdGroupId was null or undefined when calling v1GroupCreatorWalletIdGroupIdWalletBeneficiaryEmbeddinginitializePost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/group/{creatorWalletId.groupId}/wallet/beneficiary-embedding:initialize".replace("{".concat("creatorWalletId.groupId", "}"), encodeURIComponent(String(e.creatorWalletIdGroupId))),
                                schemaPath: "/v1/group/{creatorWalletId.groupId}/wallet/beneficiary-embedding:initialize",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: R(e.initializeBeneficiaryEmbeddingRequest)
                            }, n)];
                        case 1:
                            return o = i.sent(), [2, new t.H(o, function(e) {
                                return h(e)
                            })]
                    }
                })
            })
        }, s.prototype.v1GroupCreatorWalletIdGroupIdWalletBeneficiaryEmbeddinginitializePost = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1GroupCreatorWalletIdGroupIdWalletBeneficiaryEmbeddinginitializePostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s.prototype.v1GroupCreatorWalletIdGroupIdWalletEarningsEstimateGetRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.creatorWalletIdGroupId || void 0 === e.creatorWalletIdGroupId) throw new t.w("creatorWalletIdGroupId", "Required parameter requestParameters.creatorWalletIdGroupId was null or undefined when calling v1GroupCreatorWalletIdGroupIdWalletEarningsEstimateGet.");
                            return r = {}, void 0 !== e.creatorWalletIdUserId && (r["creatorWalletId.userId"] = e.creatorWalletIdUserId), a = {}, [4, this.request({
                                path: "/v1/group/{creatorWalletId.groupId}/wallet/earnings-estimate".replace("{".concat("creatorWalletId.groupId", "}"), encodeURIComponent(String(e.creatorWalletIdGroupId))),
                                schemaPath: "/v1/group/{creatorWalletId.groupId}/wallet/earnings-estimate",
                                method: "GET",
                                headers: a,
                                query: r
                            }, n)];
                        case 1:
                            return o = i.sent(), [2, new t.H(o, function(e) {
                                return I(e)
                            })]
                    }
                })
            })
        }, s.prototype.v1GroupCreatorWalletIdGroupIdWalletEarningsEstimateGet = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1GroupCreatorWalletIdGroupIdWalletEarningsEstimateGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s.prototype.v1SelfEnhancedProtectionRequirementsGetRaw = function(e) {
            return r(this, void 0, void 0, function() {
                var n, r, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/self/enhanced-protection/requirements",
                                schemaPath: "/v1/self/enhanced-protection/requirements",
                                method: "GET",
                                headers: r,
                                query: n
                            }, e)];
                        case 1:
                            return a = i.sent(), [2, new t.H(a, function(e) {
                                return null == e ? e : {
                                    passkeyStatus: (0, t.u)(e, "passkeyStatus") ? e.passkeyStatus : void 0,
                                    verifiedEmailStatus: (0, t.u)(e, "verifiedEmailStatus") ? e.verifiedEmailStatus : void 0,
                                    verifiedPhoneStatus: (0, t.u)(e, "verifiedPhoneStatus") ? e.verifiedPhoneStatus : void 0,
                                    recoveryCodesStatus: (0, t.u)(e, "recoveryCodesStatus") ? e.recoveryCodesStatus : void 0,
                                    maskedEmail: (0, t.u)(e, "maskedEmail") ? e.maskedEmail : void 0,
                                    maskedPhone: (0, t.u)(e, "maskedPhone") ? e.maskedPhone : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.v1SelfEnhancedProtectionRequirementsGet = function(e) {
            return r(this, void 0, void 0, function() {
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
        }, s.prototype.v1SelfOnboardingAccountTypeselectPostRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, l, u;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, (l = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/self/onboarding/account-type:select",
                                schemaPath: "/v1/self/onboarding/account-type:select",
                                method: "POST",
                                headers: l,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        creatorWalletId: a(e.creatorWalletId),
                                        accountType: e.accountType
                                    }
                                }(e.selectOnboardingAccountTypeRequest)
                            }, n)];
                        case 1:
                            return u = i.sent(), [2, new t.H(u, function(e) {
                                return null == e ? e : {
                                    onboardingDraft: (0, t.u)(e, "onboardingDraft") ? o(e.onboardingDraft) : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.v1SelfOnboardingAccountTypeselectPost = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1SelfOnboardingAccountTypeselectPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s.prototype.v1SelfOnboardingDraftDeleteRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, void 0 !== e.creatorWalletIdUserId && (r["creatorWalletId.userId"] = e.creatorWalletIdUserId), void 0 !== e.creatorWalletIdGroupId && (r["creatorWalletId.groupId"] = e.creatorWalletIdGroupId), a = {}, [4, this.request({
                                path: "/v1/self/onboarding/draft",
                                schemaPath: "/v1/self/onboarding/draft",
                                method: "DELETE",
                                headers: a,
                                query: r
                            }, n)];
                        case 1:
                            return o = i.sent(), [2, new t.H(o)]
                    }
                })
            })
        }, s.prototype.v1SelfOnboardingDraftDelete = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1SelfOnboardingDraftDeleteRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s.prototype.v1SelfOnboardingKycEmbeddinginitializePostRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/self/onboarding/kyc-embedding:initialize",
                                schemaPath: "/v1/self/onboarding/kyc-embedding:initialize",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: C(e.initializeKycEmbeddingRequest)
                            }, n)];
                        case 1:
                            return o = i.sent(), [2, new t.H(o, function(e) {
                                return g(e)
                            })]
                    }
                })
            })
        }, s.prototype.v1SelfOnboardingKycEmbeddinginitializePost = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1SelfOnboardingKycEmbeddinginitializePostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s.prototype.v1SelfOnboardingKycRfiEmbeddinginitializePostRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/self/onboarding/kyc-rfi-embedding:initialize",
                                schemaPath: "/v1/self/onboarding/kyc-rfi-embedding:initialize",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: E(e.initializeKycRfiEmbeddingRequest)
                            }, n)];
                        case 1:
                            return o = i.sent(), [2, new t.H(o, function(e) {
                                return b(e)
                            })]
                    }
                })
            })
        }, s.prototype.v1SelfOnboardingKycRfiEmbeddinginitializePost = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1SelfOnboardingKycRfiEmbeddinginitializePostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s.prototype.v1SelfOnboardingRequirementsGetRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, void 0 !== e.creatorWalletIdUserId && (r["creatorWalletId.userId"] = e.creatorWalletIdUserId), void 0 !== e.creatorWalletIdGroupId && (r["creatorWalletId.groupId"] = e.creatorWalletIdGroupId), a = {}, [4, this.request({
                                path: "/v1/self/onboarding/requirements",
                                schemaPath: "/v1/self/onboarding/requirements",
                                method: "GET",
                                headers: a,
                                query: r
                            }, n)];
                        case 1:
                            return o = i.sent(), [2, new t.H(o, function(e) {
                                var n;
                                return null == e ? e : {
                                    requirements: (0, t.u)(e, "requirements") ? null == (n = e.requirements) ? n : {
                                        birthdateStatus: (0, t.u)(n, "birthdateStatus") ? n.birthdateStatus : void 0,
                                        birthdate: (0, t.u)(n, "birthdate") ? new Date(n.birthdate) : void 0,
                                        emailVerificationStatus: (0, t.u)(n, "emailVerificationStatus") ? f(n.emailVerificationStatus) : void 0,
                                        sanctionsScreening: (0, t.u)(n, "sanctionsScreening") ? c(n.sanctionsScreening) : void 0
                                    } : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.v1SelfOnboardingRequirementsGet = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1SelfOnboardingRequirementsGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s.prototype.v1SelfOnboardingSanctionsScreeningEmbeddinginitializePostRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, o, l;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, (o = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/self/onboarding/sanctions-screening-embedding:initialize",
                                schemaPath: "/v1/self/onboarding/sanctions-screening-embedding:initialize",
                                method: "POST",
                                headers: o,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        creatorWalletId: a(e.creatorWalletId)
                                    }
                                }(e.initializeSanctionsScreeningEmbeddingRequest)
                            }, n)];
                        case 1:
                            return l = i.sent(), [2, new t.H(l, function(e) {
                                return null == e ? e : {
                                    inquiryId: (0, t.u)(e, "inquiryId") ? e.inquiryId : void 0,
                                    sessionToken: (0, t.u)(e, "sessionToken") ? e.sessionToken : void 0,
                                    sessionTokenExpirationTime: (0, t.u)(e, "sessionTokenExpirationTime") ? new Date(e.sessionTokenExpirationTime) : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.v1SelfOnboardingSanctionsScreeningEmbeddinginitializePost = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1SelfOnboardingSanctionsScreeningEmbeddinginitializePostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s.prototype.v1SelfOnboardingSanctionsScreeningGetRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, void 0 !== e.creatorWalletIdUserId && (r["creatorWalletId.userId"] = e.creatorWalletIdUserId), void 0 !== e.creatorWalletIdGroupId && (r["creatorWalletId.groupId"] = e.creatorWalletIdGroupId), a = {}, [4, this.request({
                                path: "/v1/self/onboarding/sanctions-screening",
                                schemaPath: "/v1/self/onboarding/sanctions-screening",
                                method: "GET",
                                headers: a,
                                query: r
                            }, n)];
                        case 1:
                            return o = i.sent(), [2, new t.H(o, function(e) {
                                return null == e ? e : {
                                    sanctionsScreening: (0, t.u)(e, "sanctionsScreening") ? c(e.sanctionsScreening) : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.v1SelfOnboardingSanctionsScreeningGet = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1SelfOnboardingSanctionsScreeningGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s.prototype.v1SelfOnboardingSanctionsScreeningstartPostRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, o, l;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, (o = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/self/onboarding/sanctions-screening:start",
                                schemaPath: "/v1/self/onboarding/sanctions-screening:start",
                                method: "POST",
                                headers: o,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        creatorWalletId: a(e.creatorWalletId)
                                    }
                                }(e.startSanctionsScreeningRequest)
                            }, n)];
                        case 1:
                            return l = i.sent(), [2, new t.H(l, function(e) {
                                return null == e ? e : {
                                    sanctionsScreening: (0, t.u)(e, "sanctionsScreening") ? c(e.sanctionsScreening) : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.v1SelfOnboardingSanctionsScreeningstartPost = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1SelfOnboardingSanctionsScreeningstartPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s.prototype.v1SelfOnboardingStateGetRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, void 0 !== e.creatorWalletIdUserId && (r["creatorWalletId.userId"] = e.creatorWalletIdUserId), void 0 !== e.creatorWalletIdGroupId && (r["creatorWalletId.groupId"] = e.creatorWalletIdGroupId), a = {}, [4, this.request({
                                path: "/v1/self/onboarding/state",
                                schemaPath: "/v1/self/onboarding/state",
                                method: "GET",
                                headers: a,
                                query: r
                            }, n)];
                        case 1:
                            return o = i.sent(), [2, new t.H(o, function(e) {
                                return v(e)
                            })]
                    }
                })
            })
        }, s.prototype.v1SelfOnboardingStateGet = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1SelfOnboardingStateGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s.prototype.v1SelfOnboardingStatusacknowledgePostRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/self/onboarding/status:acknowledge",
                                schemaPath: "/v1/self/onboarding/status:acknowledge",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: l(e.acknowledgeOnboardingStatusRequest)
                            }, n)];
                        case 1:
                            return o = i.sent(), [2, new t.H(o, function(e) {
                                return u(e)
                            })]
                    }
                })
            })
        }, s.prototype.v1SelfOnboardingStatusacknowledgePost = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1SelfOnboardingStatusacknowledgePostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s.prototype.v1SelfOnboardingTermsacceptPostRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, l, u;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, (l = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/self/onboarding/terms:accept",
                                schemaPath: "/v1/self/onboarding/terms:accept",
                                method: "POST",
                                headers: l,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        creatorWalletId: a(e.creatorWalletId),
                                        creatorWalletTermsVersion: e.creatorWalletTermsVersion,
                                        airwallexConnectedAccountAgreementVersion: e.airwallexConnectedAccountAgreementVersion
                                    }
                                }(e.acceptOnboardingTermsRequest)
                            }, n)];
                        case 1:
                            return u = i.sent(), [2, new t.H(u, function(e) {
                                return null == e ? e : {
                                    onboardingDraft: (0, t.u)(e, "onboardingDraft") ? o(e.onboardingDraft) : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.v1SelfOnboardingTermsacceptPost = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1SelfOnboardingTermsacceptPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s.prototype.v1SelfTaxOnboardingResultGetRaw = function(e) {
            return r(this, void 0, void 0, function() {
                var n, r, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/self/tax/onboarding/result",
                                schemaPath: "/v1/self/tax/onboarding/result",
                                method: "GET",
                                headers: r,
                                query: n
                            }, e)];
                        case 1:
                            return a = i.sent(), [2, new t.H(a, function(e) {
                                return null == e ? e : {
                                    sdkToken: (0, t.u)(e, "sdkToken") ? e.sdkToken : void 0,
                                    tokenExpiryTime: (0, t.u)(e, "tokenExpiryTime") ? new Date(e.tokenExpiryTime) : void 0,
                                    tokenBlockedReason: (0, t.u)(e, "tokenBlockedReason") ? e.tokenBlockedReason : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.v1SelfTaxOnboardingResultGet = function(e) {
            return r(this, void 0, void 0, function() {
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
        }, s.prototype.v1SelfTaxOnboardingstartPostRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/self/tax/onboarding:start",
                                schemaPath: "/v1/self/tax/onboarding:start",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: e.body
                            }, n)];
                        case 1:
                            return o = i.sent(), [2, new t.H(o, function(e) {
                                return null == e ? e : {
                                    accepted: (0, t.u)(e, "accepted") ? e.accepted : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.v1SelfTaxOnboardingstartPost = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1SelfTaxOnboardingstartPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s.prototype.v1SelfTaxWithholdingRateGetRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, void 0 !== e.paymentType && (r.paymentType = e.paymentType), a = {}, [4, this.request({
                                path: "/v1/self/tax/withholding-rate",
                                schemaPath: "/v1/self/tax/withholding-rate",
                                method: "GET",
                                headers: a,
                                query: r
                            }, n)];
                        case 1:
                            return o = i.sent(), [2, new t.H(o, function(e) {
                                var n, r;
                                return null == e ? e : {
                                    rate: (0, t.u)(e, "rate") ? null == (n = e.rate) ? n : {
                                        withholdingRateBps: (0, t.u)(n, "withholdingRateBps") ? n.withholdingRateBps : void 0,
                                        treatyCountryCode: (0, t.u)(n, "treatyCountryCode") ? n.treatyCountryCode : void 0,
                                        certificationId: (0, t.u)(n, "certificationId") ? n.certificationId : void 0,
                                        basis: (0, t.u)(n, "basis") ? n.basis : void 0
                                    } : void 0,
                                    reason: (0, t.u)(e, "reason") ? null == (r = e.reason) ? r : {
                                        reason: (0, t.u)(r, "reason") ? r.reason : void 0
                                    } : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.v1SelfTaxWithholdingRateGet = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1SelfTaxWithholdingRateGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s.prototype.v1SelfWalletBalanceGetRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, void 0 !== e.creatorWalletIdUserId && (r["creatorWalletId.userId"] = e.creatorWalletIdUserId), void 0 !== e.creatorWalletIdGroupId && (r["creatorWalletId.groupId"] = e.creatorWalletIdGroupId), a = {}, [4, this.request({
                                path: "/v1/self/wallet/balance",
                                schemaPath: "/v1/self/wallet/balance",
                                method: "GET",
                                headers: a,
                                query: r
                            }, n)];
                        case 1:
                            return o = i.sent(), [2, new t.H(o, function(e) {
                                return p(e)
                            })]
                    }
                })
            })
        }, s.prototype.v1SelfWalletBalanceGet = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1SelfWalletBalanceGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s.prototype.v1SelfWalletBeneficiariesBeneficiaryIdDeleteRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.beneficiaryId || void 0 === e.beneficiaryId) throw new t.w("beneficiaryId", "Required parameter requestParameters.beneficiaryId was null or undefined when calling v1SelfWalletBeneficiariesBeneficiaryIdDelete.");
                            return r = {}, void 0 !== e.creatorWalletIdUserId && (r["creatorWalletId.userId"] = e.creatorWalletIdUserId), void 0 !== e.creatorWalletIdGroupId && (r["creatorWalletId.groupId"] = e.creatorWalletIdGroupId), a = {}, [4, this.request({
                                path: "/v1/self/wallet/beneficiaries/{beneficiaryId}".replace("{".concat("beneficiaryId", "}"), encodeURIComponent(String(e.beneficiaryId))),
                                schemaPath: "/v1/self/wallet/beneficiaries/{beneficiaryId}",
                                method: "DELETE",
                                headers: a,
                                query: r
                            }, n)];
                        case 1:
                            return o = i.sent(), [2, new t.H(o)]
                    }
                })
            })
        }, s.prototype.v1SelfWalletBeneficiariesBeneficiaryIdDelete = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1SelfWalletBeneficiariesBeneficiaryIdDeleteRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s.prototype.v1SelfWalletBeneficiariesGetRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, void 0 !== e.creatorWalletIdUserId && (r["creatorWalletId.userId"] = e.creatorWalletIdUserId), void 0 !== e.creatorWalletIdGroupId && (r["creatorWalletId.groupId"] = e.creatorWalletIdGroupId), void 0 !== e.includeArchived && (r.includeArchived = e.includeArchived), a = {}, [4, this.request({
                                path: "/v1/self/wallet/beneficiaries",
                                schemaPath: "/v1/self/wallet/beneficiaries",
                                method: "GET",
                                headers: a,
                                query: r
                            }, n)];
                        case 1:
                            return o = i.sent(), [2, new t.H(o, function(e) {
                                return y(e)
                            })]
                    }
                })
            })
        }, s.prototype.v1SelfWalletBeneficiariesGet = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1SelfWalletBeneficiariesGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s.prototype.v1SelfWalletBeneficiariesPostRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/self/wallet/beneficiaries",
                                schemaPath: "/v1/self/wallet/beneficiaries",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: S(e.saveBeneficiaryRequest)
                            }, n)];
                        case 1:
                            return o = i.sent(), [2, new t.H(o, function(e) {
                                return w(e)
                            })]
                    }
                })
            })
        }, s.prototype.v1SelfWalletBeneficiariesPost = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1SelfWalletBeneficiariesPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s.prototype.v1SelfWalletBeneficiaryEmbeddinginitializePostRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/self/wallet/beneficiary-embedding:initialize",
                                schemaPath: "/v1/self/wallet/beneficiary-embedding:initialize",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: R(e.initializeBeneficiaryEmbeddingRequest)
                            }, n)];
                        case 1:
                            return o = i.sent(), [2, new t.H(o, function(e) {
                                return h(e)
                            })]
                    }
                })
            })
        }, s.prototype.v1SelfWalletBeneficiaryEmbeddinginitializePost = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1SelfWalletBeneficiaryEmbeddinginitializePostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s.prototype.v1SelfWalletEarningsEstimateGetRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, void 0 !== e.creatorWalletIdUserId && (r["creatorWalletId.userId"] = e.creatorWalletIdUserId), void 0 !== e.creatorWalletIdGroupId && (r["creatorWalletId.groupId"] = e.creatorWalletIdGroupId), a = {}, [4, this.request({
                                path: "/v1/self/wallet/earnings-estimate",
                                schemaPath: "/v1/self/wallet/earnings-estimate",
                                method: "GET",
                                headers: a,
                                query: r
                            }, n)];
                        case 1:
                            return o = i.sent(), [2, new t.H(o, function(e) {
                                return I(e)
                            })]
                    }
                })
            })
        }, s.prototype.v1SelfWalletEarningsEstimateGet = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1SelfWalletEarningsEstimateGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s.prototype.v1WalletWithdrawalsPostRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, o, l;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, (o = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wallet/withdrawals",
                                schemaPath: "/v1/wallet/withdrawals",
                                method: "POST",
                                headers: o,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        creatorWalletId: a(e.creatorWalletId),
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
                            }, n)];
                        case 1:
                            return l = i.sent(), [2, new t.H(l, function(e) {
                                return null == e ? e : {
                                    moneyMovementIntentId: (0, t.u)(e, "moneyMovementIntentId") ? e.moneyMovementIntentId : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.v1WalletWithdrawalsPost = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1WalletWithdrawalsPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, s
    }(t._);
    e.s(["D", 0, {
        Invalid: "AGE_GROUP_INVALID",
        NotVerified: "AGE_GROUP_NOT_VERIFIED",
        Adult: "AGE_GROUP_ADULT",
        Minor: "AGE_GROUP_MINOR",
        Child: "AGE_GROUP_CHILD"
    }, "X", 0, {
        Invalid: "ANNOUNCED_ONBOARDING_OUTCOME_INVALID",
        RequestedForInformation: "ANNOUNCED_ONBOARDING_OUTCOME_REQUESTED_FOR_INFORMATION",
        WalletOpen: "ANNOUNCED_ONBOARDING_OUTCOME_WALLET_OPEN",
        Rejected: "ANNOUNCED_ONBOARDING_OUTCOME_REJECTED"
    }, "F", 0, {
        Invalid: "BIRTHDATE_REQUIREMENT_STATUS_INVALID",
        Missing: "BIRTHDATE_REQUIREMENT_STATUS_MISSING",
        Under18: "BIRTHDATE_REQUIREMENT_STATUS_UNDER_18",
        EligibleEditable: "BIRTHDATE_REQUIREMENT_STATUS_ELIGIBLE_EDITABLE",
        EligibleLocked: "BIRTHDATE_REQUIREMENT_STATUS_ELIGIBLE_LOCKED"
    }, "A", 0, {
        Invalid: "CREATOR_WALLET_SANCTIONS_SCREENING_STATUS_INVALID",
        NotStarted: "CREATOR_WALLET_SANCTIONS_SCREENING_STATUS_NOT_STARTED",
        Starting: "CREATOR_WALLET_SANCTIONS_SCREENING_STATUS_STARTING",
        ActionRequired: "CREATOR_WALLET_SANCTIONS_SCREENING_STATUS_ACTION_REQUIRED",
        InReview: "CREATOR_WALLET_SANCTIONS_SCREENING_STATUS_IN_REVIEW",
        Clear: "CREATOR_WALLET_SANCTIONS_SCREENING_STATUS_CLEAR",
        Blocked: "CREATOR_WALLET_SANCTIONS_SCREENING_STATUS_BLOCKED",
        Expired: "CREATOR_WALLET_SANCTIONS_SCREENING_STATUS_EXPIRED"
    }, "N", 0, W, "g", 0, {
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
    }, "_", 0, {
        Invalid: "ESTIMATED_ARRIVAL_UNAVAILABLE_REASON_INVALID",
        PayoutsPaused: "ESTIMATED_ARRIVAL_UNAVAILABLE_REASON_PAYOUTS_PAUSED"
    }, "Y", 0, v, "P", 0, {
        Invalid: "KYC_PREREQUISITE_INVALID",
        GroupWallet: "KYC_PREREQUISITE_GROUP_WALLET",
        AccountType: "KYC_PREREQUISITE_ACCOUNT_TYPE",
        Age: "KYC_PREREQUISITE_AGE",
        Email: "KYC_PREREQUISITE_EMAIL",
        Terms: "KYC_PREREQUISITE_TERMS",
        SanctionsScreening: "KYC_PREREQUISITE_SANCTIONS_SCREENING"
    }, "m", 0, {
        Invalid: "ONBOARDING_ACCOUNT_TYPE_INVALID",
        SoleProprietor: "ONBOARDING_ACCOUNT_TYPE_SOLE_PROPRIETOR",
        IncorporatedCompany: "ONBOARDING_ACCOUNT_TYPE_INCORPORATED_COMPANY"
    }])
}, 428993, e => {
    "use strict";
    var t = e.i(157700);
    let n = (0, t.e)({
            namespace: "creator-business",
            name: "isRevenueShareAgreementsEnabled",
            defaultValue: !1
        }),
        r = (0, t.e)({
            namespace: "creator-business",
            name: "enableVirtualTransactionsTab",
            defaultValue: !0
        }),
        i = (0, t.e)({
            namespace: "creator-business",
            name: "newCreatorWallets",
            defaultValue: !1
        }),
        a = (0, t.e)({
            namespace: "creator-business",
            name: "newTransactionsFlag",
            defaultValue: !1
        });
    e.s(["O", 0, r, "p", 0, n, "E", 0, i, "K", 0, a])
}, 92174, e => {
    "use strict";
    var t = e.i(157700);
    let n = (0, t.e)({
            namespace: "devex",
            name: "shouldUseWatermarkFiatCalculation",
            defaultValue: !1
        }),
        r = (0, t.e)({
            namespace: "devex",
            name: "isTaxDocumentationEnabled",
            defaultValue: !1
        });
    e.s(["A", 0, r, "P", 0, n])
}, 426173, e => {
    "use strict";
    var t = e.i(157700);
    let n = (0, t.e)({
            namespace: "financial-platform",
            name: "ShowDevExWithholdingAmount",
            defaultValue: 100
        }),
        r = (0, t.e)({
            namespace: "financial-platform",
            name: "ShowOct20ShutoffBanner",
            defaultValue: !1
        }),
        i = (0, t.e)({
            namespace: "financial-platform",
            name: "isTaxDocumentationOpenToDevexEligible",
            defaultValue: !1
        }),
        a = (0, t.e)({
            namespace: "financial-platform",
            name: "isTaxFormDeliveryConsentEnabled",
            defaultValue: !1
        }),
        o = (0, t.e)({
            namespace: "financial-platform",
            name: "taxFormDeliveryConsentRolloutPercentage",
            defaultValue: 100
        }),
        l = (0, t.e)({
            namespace: "financial-platform",
            name: "devexFinancialPolicyRolloutPercentage",
            defaultValue: 0
        });
    e.s(["d", 0, l, "p", 0, i, "u", 0, a, "b", 0, n, "h", 0, r, "f", 0, o])
}, 380866, e => {
    "use strict";
    var t = e.i(60584),
        n = e.i(228096),
        r = e.i(910272),
        i = e.i(785517),
        a = e.i(643766);
    let o = (0, a.createContext)(null);

    function l() {
        let e = (0, a.useContext)(o);
        if (!e) throw Error("No Creator Wallets client found. Wrap this tree in <CreatorWalletsProvider client={createCreatorWalletsClient(...)}>.");
        return e
    }

    function u(e, t) {
        return async function() {
            for (var n = arguments.length, r = Array(n), i = 0; i < n; i++) r[i] = arguments[i];
            await e(), await (null == t ? void 0 : t(...r))
        }
    }
    let s = {
        all: ["creatorWallets"],
        onboardingState: e => ["creatorWallets", "onboardingState", null != e ? e : "self"],
        onboardingRequirements: () => ["creatorWallets", "onboardingRequirements", "self"],
        sanctionsScreening: () => ["creatorWallets", "sanctionsScreening", "self"],
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
            children: n
        } = e;
        return (0, i.jsx)(o.Provider, {
            value: t,
            children: n
        })
    }, "a", 0, function(e) {
        let r = l(),
            i = (0, n.d)();
        return (0, t.f)({
            ...e,
            mutationFn: e => r.acceptOnboardingTerms(e),
            onSuccess: u(() => i.invalidateQueries({
                queryKey: s.onboardingState()
            }), null == e ? void 0 : e.onSuccess)
        })
    }, "b", 0, function(e, r) {
        let i = l(),
            a = (0, n.d)(),
            o = null == e ? void 0 : e.groupId;
        return (0, t.f)({
            ...r,
            mutationFn: e => i.acknowledgeOnboardingStatus(e, o),
            onSuccess: u(() => a.invalidateQueries({
                queryKey: s.all
            }), null == r ? void 0 : r.onSuccess)
        })
    }, "c", 0, s, "d", 0, function(e, r) {
        let i = l(),
            a = (0, n.d)(),
            o = null == e ? void 0 : e.groupId;
        return (0, t.f)({
            ...r,
            mutationFn: e => i.archiveBeneficiary(e, o),
            onSuccess: u(() => a.invalidateQueries({
                queryKey: s.beneficiaries(o)
            }), null == r ? void 0 : r.onSuccess)
        })
    }, "e", 0, function(e, t) {
        let n = l(),
            i = null == e ? void 0 : e.groupId;
        return (0, r.f)({
            queryKey: s.beneficiaries(i),
            queryFn: e => {
                let {
                    signal: t
                } = e;
                return n.listBeneficiaries(i, {
                    signal: t
                })
            },
            ...t
        })
    }, "f", 0, function(e) {
        let r = l(),
            i = (0, n.d)();
        return (0, t.f)({
            ...e,
            mutationFn: () => r.deleteOnboardingDraft(),
            onSuccess: u(() => i.invalidateQueries({
                queryKey: s.onboardingState()
            }), null == e ? void 0 : e.onSuccess)
        })
    }, "g", 0, function(e, n) {
        let r = l(),
            i = null == e ? void 0 : e.groupId;
        return (0, t.f)({
            mutationFn: e => r.initializeBeneficiaryEmbedding(e, i),
            ...n
        })
    }, "h", 0, function(e, n) {
        let r = l(),
            i = null == e ? void 0 : e.groupId;
        return (0, t.f)({
            mutationFn: e => r.initializeKycEmbedding(e, i),
            ...n
        })
    }, "i", 0, function(e, n) {
        let r = l(),
            i = null == e ? void 0 : e.groupId;
        return (0, t.f)({
            mutationFn: e => r.initializeKycRfiEmbedding(e, i),
            ...n
        })
    }, "j", 0, function(e, r) {
        let i = l(),
            a = (0, n.d)(),
            o = null == e ? void 0 : e.groupId;
        return (0, t.f)({
            ...r,
            mutationFn: e => i.initiateWithdrawal(e, o),
            onSuccess: u(() => a.invalidateQueries({
                queryKey: s.walletBalance(o)
            }), null == r ? void 0 : r.onSuccess)
        })
    }, "k", 0, function(e) {
        let t = l();
        return (0, r.f)({
            queryKey: s.onboardingRequirements(),
            queryFn: e => {
                let {
                    signal: n
                } = e;
                return t.getOnboardingRequirements({
                    signal: n
                })
            },
            ...e
        })
    }, "l", 0, function(e, t) {
        let n = l(),
            i = null == e ? void 0 : e.groupId;
        return (0, r.f)({
            queryKey: s.onboardingState(i),
            queryFn: e => {
                let {
                    signal: t
                } = e;
                return n.getOnboardingState(i, {
                    signal: t
                })
            },
            ...t
        })
    }, "m", 0, function(e, r) {
        let i = l(),
            a = (0, n.d)(),
            o = null == e ? void 0 : e.groupId;
        return (0, t.f)({
            ...r,
            mutationFn: e => i.saveBeneficiary(e, o),
            onSuccess: u(() => a.invalidateQueries({
                queryKey: s.beneficiaries(o)
            }), null == r ? void 0 : r.onSuccess)
        })
    }, "n", 0, function(e) {
        let r = l(),
            i = (0, n.d)();
        return (0, t.f)({
            ...e,
            mutationFn: e => r.selectOnboardingAccountType(e),
            onSuccess: u(() => i.invalidateQueries({
                queryKey: s.onboardingState()
            }), null == e ? void 0 : e.onSuccess)
        })
    }, "o", 0, function(e, t) {
        let n = l(),
            i = null == e ? void 0 : e.groupId;
        return (0, r.f)({
            queryKey: s.walletBalance(i),
            queryFn: e => {
                let {
                    signal: t
                } = e;
                return n.getWalletBalance(i, {
                    signal: t
                })
            },
            ...t
        })
    }, "p", 0, function(e) {
        var t, n;
        return null != (t = null != (n = e.isPending) ? n : e.isLoading) && t
    }, "q", 0, function(e) {
        let n = l();
        return (0, t.f)({
            mutationFn: () => n.initializeSanctionsScreeningEmbedding(),
            ...e
        })
    }, "r", 0, function(e) {
        let t = l();
        return (0, r.f)({
            queryKey: s.sanctionsScreening(),
            queryFn: e => {
                let {
                    signal: n
                } = e;
                return t.getSanctionsScreening({
                    signal: n
                })
            },
            ...e
        })
    }, "s", 0, function(e) {
        let r = l(),
            i = (0, n.d)();
        return (0, t.f)({
            ...e,
            mutationFn: () => r.startSanctionsScreening(),
            onSuccess: u(() => Promise.all([i.invalidateQueries({
                queryKey: s.sanctionsScreening()
            }), i.invalidateQueries({
                queryKey: s.onboardingRequirements()
            })]), null == e ? void 0 : e.onSuccess)
        })
    }])
}]);

//# debugId=760c2c75-cb08-c3f3-3f0d-76b675c123f6
//# sourceMappingURL=00m-rl6v7y7wp.js.map