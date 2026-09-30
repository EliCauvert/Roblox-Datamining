;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "9ca6191b-c22e-1081-da1e-58adcea6de23")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 199475, e => {
    "use strict";
    var t = e.i(721281),
        r = e.i(677753),
        s = function(e, t) {
            return (s = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
            })(e, t)
        };

    function n(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function r() {
            this.constructor = e
        }
        s(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
    }

    function i(e, t, r, s) {
        return new(r || (r = Promise))(function(n, i) {
            function o(e) {
                try {
                    u(s.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function a(e) {
                try {
                    u(s.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function u(e) {
                var t;
                e.done ? n(e.value) : ((t = e.value) instanceof r ? t : new r(function(e) {
                    e(t)
                })).then(o, a)
            }
            u((s = s.apply(e, t || [])).next())
        })
    }

    function o(e, t) {
        var r, s, n, i = {
                label: 0,
                sent: function() {
                    if (1 & n[0]) throw n[1];
                    return n[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = a(0), o.throw = a(1), o.return = a(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function a(a) {
            return function(u) {
                var d = [a, u];
                if (r) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, d[0] && (i = 0)), i;) try {
                    if (r = 1, s && (n = 2 & d[0] ? s.return : d[0] ? s.throw || ((n = s.return) && n.call(s), 0) : s.next) && !(n = n.call(s, d[1])).done) return n;
                    switch (s = 0, n && (d = [2 & d[0], n.value]), d[0]) {
                        case 0:
                        case 1:
                            n = d;
                            break;
                        case 4:
                            return i.label++, {
                                value: d[1],
                                done: !1
                            };
                        case 5:
                            i.label++, s = d[1], d = [0];
                            continue;
                        case 7:
                            d = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(n = (n = i.trys).length > 0 && n[n.length - 1]) && (6 === d[0] || 2 === d[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === d[0] && (!n || d[1] > n[0] && d[1] < n[3])) {
                                i.label = d[1];
                                break
                            }
                            if (6 === d[0] && i.label < n[1]) {
                                i.label = n[1], n = d;
                                break
                            }
                            if (n && i.label < n[2]) {
                                i.label = n[2], i.ops.push(d);
                                break
                            }
                            n[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    d = t.call(e, i)
                } catch (e) {
                    d = [6, e], s = 0
                } finally {
                    r = n = 0
                }
                if (5 & d[0]) throw d[1];
                return {
                    value: d[0] ? d[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function a(e) {
        var t;
        return null == (t = e) ? t : {
            value: (0, r.exists)(t, "value") ? t.value : void 0,
            date: (0, r.exists)(t, "date") ? new Date(t.date) : void 0
        }
    }

    function u(e) {
        var t;
        return null == (t = e) ? t : {
            amount: (0, r.exists)(t, "amount") ? t.amount : void 0,
            conversionRatePer10KRobux: (0, r.exists)(t, "conversionRatePer10KRobux") ? t.conversionRatePer10KRobux : void 0,
            balanceType: (0, r.exists)(t, "balanceType") ? t.balanceType : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function d(e, t) {
        return null == e ? e : {
            watermarks: (0, r.exists)(e, "watermarks") ? e.watermarks.map(u) : void 0,
            shouldDisplayEffectiveO18Robux: (0, r.exists)(e, "shouldDisplayEffectiveO18Robux") ? e.shouldDisplayEffectiveO18Robux : void 0
        }
    }

    function c(e, t) {
        return null == e ? e : {
            premiumDiscountPercentage: (0, r.exists)(e, "premiumDiscountPercentage") ? e.premiumDiscountPercentage : void 0,
            premiumPriceInRobux: (0, r.exists)(e, "premiumPriceInRobux") ? e.premiumPriceInRobux : void 0
        }
    }

    function l(e) {
        var t, s;
        return null == (t = e) ? t : {
            userAssetId: (0, r.exists)(t, "userAssetId") ? t.userAssetId : void 0,
            seller: (0, r.exists)(t, "seller") ? null == (s = t.seller) ? s : {
                id: (0, r.exists)(s, "id") ? s.id : void 0,
                type: (0, r.exists)(s, "type") ? s.type : void 0,
                name: (0, r.exists)(s, "name") ? s.name : void 0
            } : void 0,
            price: (0, r.exists)(t, "price") ? t.price : void 0,
            serialNumber: (0, r.exists)(t, "serialNumber") ? t.serialNumber : void 0
        }
    }

    function p(e, t) {
        return null == e ? e : {
            robux: (0, r.exists)(e, "robux") ? e.robux : void 0
        }
    }
    var v = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(t, e), t.prototype.v1DeveloperExchangeHelpGetRaw = function(e) {
                return i(this, void 0, void 0, function() {
                    var t, s, n;
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return t = {}, s = {}, [4, this.request({
                                    path: "/v1/developer-exchange/help",
                                    schemaPath: "/v1/developer-exchange/help",
                                    method: "GET",
                                    headers: s,
                                    query: t
                                }, e)];
                            case 1:
                                return n = i.sent(), [2, new r.JSONApiResponse(n)]
                        }
                    })
                })
            }, t.prototype.v1DeveloperExchangeHelpGet = function(e) {
                return i(this, void 0, void 0, function() {
                    return o(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1DeveloperExchangeHelpGetRaw(e)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1DeveloperExchangeInfoGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var s, n, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return s = {}, void 0 !== e.fromDevExPage && (s.fromDevExPage = e.fromDevExPage), n = {}, [4, this.request({
                                    path: "/v1/developer-exchange/info",
                                    schemaPath: "/v1/developer-exchange/info",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, t)];
                            case 1:
                                return i = o.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        hasCurrencyOperationError: (0, r.exists)(e, "hasCurrencyOperationError") ? e.hasCurrencyOperationError : void 0,
                                        currencyOperationErrorMessage: (0, r.exists)(e, "currencyOperationErrorMessage") ? e.currencyOperationErrorMessage : void 0,
                                        showOnlyExchangeRates: (0, r.exists)(e, "showOnlyExchangeRates") ? e.showOnlyExchangeRates : void 0,
                                        emailIsVerified: (0, r.exists)(e, "emailIsVerified") ? e.emailIsVerified : void 0,
                                        isImbursementBlacklistUser: (0, r.exists)(e, "isImbursementBlacklistUser") ? e.isImbursementBlacklistUser : void 0,
                                        canProceedToCashout: (0, r.exists)(e, "canProceedToCashout") ? e.canProceedToCashout : void 0,
                                        isDevExSuspended: (0, r.exists)(e, "isDevExSuspended") ? e.isDevExSuspended : void 0,
                                        isAtRiskOfSuspension: (0, r.exists)(e, "isAtRiskOfSuspension") ? e.isAtRiskOfSuspension : void 0,
                                        devExSuspensionEndTimeUtc: (0, r.exists)(e, "devExSuspensionEndTimeUtc") ? new Date(e.devExSuspensionEndTimeUtc) : void 0,
                                        showProgressBar: (0, r.exists)(e, "showProgressBar") ? e.showProgressBar : void 0,
                                        percentRobux: (0, r.exists)(e, "percentRobux") ? e.percentRobux : void 0,
                                        minRobuxToCashOut: (0, r.exists)(e, "minRobuxToCashOut") ? e.minRobuxToCashOut : void 0,
                                        maxRobuxCanCashOut: (0, r.exists)(e, "maxRobuxCanCashOut") ? e.maxRobuxCanCashOut : void 0,
                                        lastImbursementStatus: (0, r.exists)(e, "lastImbursementStatus") ? e.lastImbursementStatus : void 0,
                                        lastImbursementSubmissionDate: (0, r.exists)(e, "lastImbursementSubmissionDate") ? new Date(e.lastImbursementSubmissionDate) : void 0,
                                        conversionPercent: (0, r.exists)(e, "conversionPercent") ? e.conversionPercent : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1DeveloperExchangeInfoGet = function() {
                return i(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1DeveloperExchangeInfoGetRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.v1DeveloperExchangeSubmitPostRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var s, n, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.requestModel || void 0 === e.requestModel) throw new r.RequiredError("requestModel", "Required parameter requestParameters.requestModel was null or undefined when calling v1DeveloperExchangeSubmitPost.");
                                return s = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/developer-exchange/submit",
                                    schemaPath: "/v1/developer-exchange/submit",
                                    method: "POST",
                                    headers: n,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            password: e.password,
                                            paypalEmail: e.paypalEmail,
                                            firstName: e.firstName,
                                            lastName: e.lastName,
                                            country: e.country,
                                            robux: e.robux
                                        }
                                    }(e.requestModel)
                                }, t)];
                            case 1:
                                return i = o.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        submitted: (0, r.exists)(e, "submitted") ? e.submitted : void 0,
                                        cashOutAbility: (0, r.exists)(e, "cashOutAbility") ? null == (t = e.cashOutAbility) ? t : {
                                            canCashOut: (0, r.exists)(t, "canCashOut") ? t.canCashOut : void 0,
                                            meetsPremiumRequirement: (0, r.exists)(t, "meetsPremiumRequirement") ? t.meetsPremiumRequirement : void 0,
                                            hasVerifiedEmail: (0, r.exists)(t, "hasVerifiedEmail") ? t.hasVerifiedEmail : void 0,
                                            isUserBlackListed: (0, r.exists)(t, "isUserBlackListed") ? t.isUserBlackListed : void 0,
                                            meetsMinimumCashOutBalance: (0, r.exists)(t, "meetsMinimumCashOutBalance") ? t.meetsMinimumCashOutBalance : void 0,
                                            hasCashedOutThisMonth: (0, r.exists)(t, "hasCashedOutThisMonth") ? t.hasCashedOutThisMonth : void 0,
                                            lastImbursementStatusIsValid: (0, r.exists)(t, "lastImbursementStatusIsValid") ? t.lastImbursementStatusIsValid : void 0
                                        } : void 0,
                                        errors: (0, r.exists)(e, "errors") ? e.errors : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1DeveloperExchangeSubmitPost = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1DeveloperExchangeSubmitPostRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t
        }(r.BaseAPI),
        h = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(t, e), t.prototype.v1GroupsGroupIdAddfundsAllowedGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var s, n, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdAddfundsAllowedGet.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/addfunds/allowed".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/addfunds/allowed",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, t)];
                            case 1:
                                return i = o.sent(), this.isJsonMime(i.headers.get("content-type")) ? [2, new r.JSONApiResponse(i)] : [2, new r.TextApiResponse(i)]
                        }
                    })
                })
            }, t.prototype.v1GroupsGroupIdAddfundsAllowedGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdAddfundsAllowedGetRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.v1GroupsGroupIdAddfundsLatestGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var s, n, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdAddfundsLatestGet.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/addfunds/latest".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/addfunds/latest",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, t)];
                            case 1:
                                return i = o.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        transactionDate: (0, r.exists)(e, "transactionDate") ? e.transactionDate : void 0,
                                        rateLimitInDays: (0, r.exists)(e, "rateLimitInDays") ? e.rateLimitInDays : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1GroupsGroupIdAddfundsLatestGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdAddfundsLatestGetRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.v1GroupsGroupIdAddfundsPostRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var s, n, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdAddfundsPost.");
                                if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1GroupsGroupIdAddfundsPost.");
                                return s = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/groups/{groupId}/addfunds".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/addfunds",
                                    method: "POST",
                                    headers: n,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            robuxAmount: e.robuxAmount
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return i = o.sent(), [2, new r.VoidApiResponse(i)]
                        }
                    })
                })
            }, t.prototype.v1GroupsGroupIdAddfundsPost = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdAddfundsPostRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, t.prototype.v1GroupsGroupIdCurrencyGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var s, n, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdCurrencyGet.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/currency".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/currency",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, t)];
                            case 1:
                                return i = o.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return p(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1GroupsGroupIdCurrencyGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdCurrencyGetRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.v1GroupsGroupIdDevExWatermarksGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var s, n, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdDevExWatermarksGet.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/devExWatermarks".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/devExWatermarks",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, t)];
                            case 1:
                                return i = o.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return d(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1GroupsGroupIdDevExWatermarksGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdDevExWatermarksGetRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.v1UserCurrencyGetRaw = function(e) {
                return i(this, void 0, void 0, function() {
                    var t, s, n;
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return t = {}, s = {}, [4, this.request({
                                    path: "/v1/user/currency",
                                    schemaPath: "/v1/user/currency",
                                    method: "GET",
                                    headers: s,
                                    query: t
                                }, e)];
                            case 1:
                                return n = i.sent(), [2, new r.JSONApiResponse(n, function(e) {
                                    return p(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UserCurrencyGet = function(e) {
                return i(this, void 0, void 0, function() {
                    return o(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1UserCurrencyGetRaw(e)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1UsersUserIdCurrencyGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var s, n, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdCurrencyGet.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/users/{userId}/currency".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/users/{userId}/currency",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, t)];
                            case 1:
                                return i = o.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return p(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UsersUserIdCurrencyGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1UsersUserIdCurrencyGetRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.v1UsersUserIdDevExWatermarksGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var s, n, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdDevExWatermarksGet.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/users/{userId}/devExWatermarks".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/users/{userId}/devExWatermarks",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, t)];
                            case 1:
                                return i = o.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return d(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UsersUserIdDevExWatermarksGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1UsersUserIdDevExWatermarksGetRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t
        }(r.BaseAPI),
        m = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(t, e), t.prototype.v1GroupsGroupIdSnapshotRobuxGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var s, n, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdSnapshotRobuxGet.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/snapshot-robux".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/snapshot-robux",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, t)];
                            case 1:
                                return i = o.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        robuxAt35: (0, r.exists)(e, "robuxAt35") ? e.robuxAt35 : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1GroupsGroupIdSnapshotRobuxGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdSnapshotRobuxGetRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.v1GroupsGroupIdUsersPayoutEligibilityGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var s, n, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdUsersPayoutEligibilityGet.");
                                if (null === e.userIds || void 0 === e.userIds) throw new r.RequiredError("userIds", "Required parameter requestParameters.userIds was null or undefined when calling v1GroupsGroupIdUsersPayoutEligibilityGet.");
                                return s = {}, e.userIds && (s.userIds = e.userIds), n = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/users-payout-eligibility".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/users-payout-eligibility",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, t)];
                            case 1:
                                return i = o.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        usersGroupPayoutEligibility: (0, r.exists)(e, "usersGroupPayoutEligibility") ? e.usersGroupPayoutEligibility : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1GroupsGroupIdUsersPayoutEligibilityGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdUsersPayoutEligibilityGetRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t
        }(r.BaseAPI),
        f = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(t, e), t.prototype.v1ProductsProductIdGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var s, n, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.productId || void 0 === e.productId) throw new r.RequiredError("productId", "Required parameter requestParameters.productId was null or undefined when calling v1ProductsProductIdGet.");
                                return s = {}, void 0 !== e.showPurchasable && (s.showPurchasable = e.showPurchasable), n = {}, [4, this.request({
                                    path: "/v1/products/{productId}".replace("{".concat("productId", "}"), encodeURIComponent(String(e.productId))),
                                    schemaPath: "/v1/products/{productId}",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, t)];
                            case 1:
                                return i = o.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        purchasable: (0, r.exists)(e, "purchasable") ? e.purchasable : void 0,
                                        reason: (0, r.exists)(e, "reason") ? e.reason : void 0,
                                        productId: (0, r.exists)(e, "productId") ? e.productId : void 0,
                                        statusCode: (0, r.exists)(e, "statusCode") ? e.statusCode : void 0,
                                        title: (0, r.exists)(e, "title") ? e.title : void 0,
                                        errorMsg: (0, r.exists)(e, "errorMsg") ? e.errorMsg : void 0,
                                        showDivId: (0, r.exists)(e, "showDivId") ? e.showDivId : void 0,
                                        shortfallPrice: (0, r.exists)(e, "shortfallPrice") ? e.shortfallPrice : void 0,
                                        balanceAfterSale: (0, r.exists)(e, "balanceAfterSale") ? e.balanceAfterSale : void 0,
                                        expectedPrice: (0, r.exists)(e, "expectedPrice") ? e.expectedPrice : void 0,
                                        currency: (0, r.exists)(e, "currency") ? e.currency : void 0,
                                        price: (0, r.exists)(e, "price") ? e.price : void 0,
                                        assetId: (0, r.exists)(e, "assetId") ? e.assetId : void 0,
                                        assetName: (0, r.exists)(e, "assetName") ? e.assetName : void 0,
                                        assetType: (0, r.exists)(e, "assetType") ? e.assetType : void 0,
                                        assetTypeDisplayName: (0, r.exists)(e, "assetTypeDisplayName") ? e.assetTypeDisplayName : void 0,
                                        assetIsWearable: (0, r.exists)(e, "assetIsWearable") ? e.assetIsWearable : void 0,
                                        sellerName: (0, r.exists)(e, "sellerName") ? e.sellerName : void 0,
                                        transactionVerb: (0, r.exists)(e, "transactionVerb") ? e.transactionVerb : void 0,
                                        isMultiPrivateSale: (0, r.exists)(e, "isMultiPrivateSale") ? e.isMultiPrivateSale : void 0,
                                        premiumPricing: (0, r.exists)(e, "premiumPricing") ? c(e.premiumPricing) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1ProductsProductIdGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1ProductsProductIdGetRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.v1PurchasesProductsProductIdPostRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var s, n, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.productId || void 0 === e.productId) throw new r.RequiredError("productId", "Required parameter requestParameters.productId was null or undefined when calling v1PurchasesProductsProductIdPost.");
                                if (null === e.purchaseDetail || void 0 === e.purchaseDetail) throw new r.RequiredError("purchaseDetail", "Required parameter requestParameters.purchaseDetail was null or undefined when calling v1PurchasesProductsProductIdPost.");
                                return s = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/purchases/products/{productId}".replace("{".concat("productId", "}"), encodeURIComponent(String(e.productId))),
                                    schemaPath: "/v1/purchases/products/{productId}",
                                    method: "POST",
                                    headers: n,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            expectedCurrency: e.expectedCurrency,
                                            expectedPrice: e.expectedPrice,
                                            expectedSellerId: e.expectedSellerId,
                                            expectedPromoId: e.expectedPromoId,
                                            userAssetId: e.userAssetId,
                                            saleLocationType: e.saleLocationType,
                                            saleLocationId: e.saleLocationId
                                        }
                                    }(e.purchaseDetail)
                                }, t)];
                            case 1:
                                return i = o.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        purchased: (0, r.exists)(e, "purchased") ? e.purchased : void 0,
                                        reason: (0, r.exists)(e, "reason") ? e.reason : void 0,
                                        productId: (0, r.exists)(e, "productId") ? e.productId : void 0,
                                        statusCode: (0, r.exists)(e, "statusCode") ? e.statusCode : void 0,
                                        title: (0, r.exists)(e, "title") ? e.title : void 0,
                                        errorMsg: (0, r.exists)(e, "errorMsg") ? e.errorMsg : void 0,
                                        showDivId: (0, r.exists)(e, "showDivId") ? e.showDivId : void 0,
                                        shortfallPrice: (0, r.exists)(e, "shortfallPrice") ? e.shortfallPrice : void 0,
                                        balanceAfterSale: (0, r.exists)(e, "balanceAfterSale") ? e.balanceAfterSale : void 0,
                                        expectedPrice: (0, r.exists)(e, "expectedPrice") ? e.expectedPrice : void 0,
                                        currency: (0, r.exists)(e, "currency") ? e.currency : void 0,
                                        price: (0, r.exists)(e, "price") ? e.price : void 0,
                                        assetId: (0, r.exists)(e, "assetId") ? e.assetId : void 0,
                                        assetName: (0, r.exists)(e, "assetName") ? e.assetName : void 0,
                                        assetType: (0, r.exists)(e, "assetType") ? e.assetType : void 0,
                                        assetTypeDisplayName: (0, r.exists)(e, "assetTypeDisplayName") ? e.assetTypeDisplayName : void 0,
                                        assetIsWearable: (0, r.exists)(e, "assetIsWearable") ? e.assetIsWearable : void 0,
                                        sellerName: (0, r.exists)(e, "sellerName") ? e.sellerName : void 0,
                                        transactionVerb: (0, r.exists)(e, "transactionVerb") ? e.transactionVerb : void 0,
                                        isMultiPrivateSale: (0, r.exists)(e, "isMultiPrivateSale") ? e.isMultiPrivateSale : void 0,
                                        premiumPricing: (0, r.exists)(e, "premiumPricing") ? c(e.premiumPricing) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PurchasesProductsProductIdPost = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1PurchasesProductsProductIdPostRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t
        }(r.BaseAPI);
    (function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        n(t, e), t.prototype.v1AssetsAssetIdResaleDataGetRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var s, n, i;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.assetId || void 0 === e.assetId) throw new r.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdResaleDataGet.");
                            return s = {}, n = {}, [4, this.request({
                                path: "/v1/assets/{assetId}/resale-data".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                schemaPath: "/v1/assets/{assetId}/resale-data",
                                method: "GET",
                                headers: n,
                                query: s
                            }, t)];
                        case 1:
                            return i = o.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                return null == e ? e : {
                                    assetStock: (0, r.exists)(e, "assetStock") ? e.assetStock : void 0,
                                    sales: (0, r.exists)(e, "sales") ? e.sales : void 0,
                                    numberRemaining: (0, r.exists)(e, "numberRemaining") ? e.numberRemaining : void 0,
                                    recentAveragePrice: (0, r.exists)(e, "recentAveragePrice") ? e.recentAveragePrice : void 0,
                                    originalPrice: (0, r.exists)(e, "originalPrice") ? e.originalPrice : void 0,
                                    priceDataPoints: (0, r.exists)(e, "priceDataPoints") ? e.priceDataPoints.map(a) : void 0,
                                    volumeDataPoints: (0, r.exists)(e, "volumeDataPoints") ? e.volumeDataPoints.map(a) : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1AssetsAssetIdResaleDataGet = function(e, t) {
            return i(this, void 0, void 0, function() {
                return o(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1AssetsAssetIdResaleDataGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.v1AssetsAssetIdResellableCopiesUserAssetIdPatchRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var s, n, i;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.assetId || void 0 === e.assetId) throw new r.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdResellableCopiesUserAssetIdPatch.");
                            if (null === e.userAssetId || void 0 === e.userAssetId) throw new r.RequiredError("userAssetId", "Required parameter requestParameters.userAssetId was null or undefined when calling v1AssetsAssetIdResellableCopiesUserAssetIdPatch.");
                            if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1AssetsAssetIdResellableCopiesUserAssetIdPatch.");
                            return s = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/assets/{assetId}/resellable-copies/{userAssetId}".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))).replace("{".concat("userAssetId", "}"), encodeURIComponent(String(e.userAssetId))),
                                schemaPath: "/v1/assets/{assetId}/resellable-copies/{userAssetId}",
                                method: "PATCH",
                                headers: n,
                                query: s,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        price: e.price
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = o.sent(), [2, new r.JSONApiResponse(i)]
                    }
                })
            })
        }, t.prototype.v1AssetsAssetIdResellableCopiesUserAssetIdPatch = function(e, t) {
            return i(this, void 0, void 0, function() {
                return o(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1AssetsAssetIdResellableCopiesUserAssetIdPatchRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.v1AssetsAssetIdResellersGetRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var s, n, i;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.assetId || void 0 === e.assetId) throw new r.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdResellersGet.");
                            return s = {}, void 0 !== e.limit && (s.limit = e.limit), void 0 !== e.cursor && (s.cursor = e.cursor), n = {}, [4, this.request({
                                path: "/v1/assets/{assetId}/resellers".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                schemaPath: "/v1/assets/{assetId}/resellers",
                                method: "GET",
                                headers: n,
                                query: s
                            }, t)];
                        case 1:
                            return i = o.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                return null == e ? e : {
                                    previousPageCursor: (0, r.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                    nextPageCursor: (0, r.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                    data: (0, r.exists)(e, "data") ? e.data.map(l) : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1AssetsAssetIdResellersGet = function(e, t) {
            return i(this, void 0, void 0, function() {
                return o(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1AssetsAssetIdResellersGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.v1AssetsAssetIdUsersUserIdResellableCopiesGetRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var s, n, i;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1AssetsAssetIdUsersUserIdResellableCopiesGet.");
                            if (null === e.assetId || void 0 === e.assetId) throw new r.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdUsersUserIdResellableCopiesGet.");
                            return s = {}, n = {}, [4, this.request({
                                path: "/v1/assets/{assetId}/users/{userId}/resellable-copies".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))).replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                schemaPath: "/v1/assets/{assetId}/users/{userId}/resellable-copies",
                                method: "GET",
                                headers: n,
                                query: s
                            }, t)];
                        case 1:
                            return i = o.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                return null == e ? e : {
                                    data: (0, r.exists)(e, "data") ? e.data.map(l) : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1AssetsAssetIdUsersUserIdResellableCopiesGet = function(e, t) {
            return i(this, void 0, void 0, function() {
                return o(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1AssetsAssetIdUsersUserIdResellableCopiesGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.v1ResaleTaxRateGetRaw = function(e) {
            return i(this, void 0, void 0, function() {
                var t, s, n;
                return o(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, s = {}, [4, this.request({
                                path: "/v1/resale-tax-rate",
                                schemaPath: "/v1/resale-tax-rate",
                                method: "GET",
                                headers: s,
                                query: t
                            }, e)];
                        case 1:
                            return n = i.sent(), [2, new r.JSONApiResponse(n, function(e) {
                                return null == e ? e : {
                                    taxRate: (0, r.exists)(e, "taxRate") ? e.taxRate : void 0,
                                    minimumFee: (0, r.exists)(e, "minimumFee") ? e.minimumFee : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1ResaleTaxRateGet = function(e) {
            return i(this, void 0, void 0, function() {
                return o(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1ResaleTaxRateGetRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }
    })(r.BaseAPI),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        n(t, e), t.prototype.v1GroupsGroupIdRevenueSummaryTimeFrameGetRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var s, n, i;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new r.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdRevenueSummaryTimeFrameGet.");
                            if (null === e.timeFrame || void 0 === e.timeFrame) throw new r.RequiredError("timeFrame", "Required parameter requestParameters.timeFrame was null or undefined when calling v1GroupsGroupIdRevenueSummaryTimeFrameGet.");
                            return s = {}, n = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/revenue/summary/{timeFrame}".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))).replace("{".concat("timeFrame", "}"), encodeURIComponent(String(e.timeFrame))),
                                schemaPath: "/v1/groups/{groupId}/revenue/summary/{timeFrame}",
                                method: "GET",
                                headers: n,
                                query: s
                            }, t)];
                        case 1:
                            return i = o.sent(), [2, new r.JSONApiResponse(i, function(e) {
                                return null == e ? e : {
                                    recurringRobuxStipend: (0, r.exists)(e, "recurringRobuxStipend") ? e.recurringRobuxStipend : void 0,
                                    itemSaleRobux: (0, r.exists)(e, "itemSaleRobux") ? e.itemSaleRobux : void 0,
                                    purchasedRobux: (0, r.exists)(e, "purchasedRobux") ? e.purchasedRobux : void 0,
                                    tradeSystemRobux: (0, r.exists)(e, "tradeSystemRobux") ? e.tradeSystemRobux : void 0,
                                    pendingRobux: (0, r.exists)(e, "pendingRobux") ? e.pendingRobux : void 0,
                                    groupPayoutRobux: (0, r.exists)(e, "groupPayoutRobux") ? e.groupPayoutRobux : void 0,
                                    individualToGroupRobux: (0, r.exists)(e, "individualToGroupRobux") ? e.individualToGroupRobux : void 0,
                                    premiumPayouts: (0, r.exists)(e, "premiumPayouts") ? e.premiumPayouts : void 0,
                                    groupPremiumPayouts: (0, r.exists)(e, "groupPremiumPayouts") ? e.groupPremiumPayouts : void 0,
                                    adjustmentRobux: (0, r.exists)(e, "adjustmentRobux") ? e.adjustmentRobux : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1GroupsGroupIdRevenueSummaryTimeFrameGet = function(e, t) {
            return i(this, void 0, void 0, function() {
                return o(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1GroupsGroupIdRevenueSummaryTimeFrameGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }
    }(r.BaseAPI);
    var I = e.i(272593);
    let b = new class {
        getUserCurrency(e) {
            return this.currencyApi.v1UsersUserIdCurrencyGet({
                userId: e
            })
        }
        getGroupCurrency(e) {
            return this.currencyApi.v1GroupsGroupIdCurrencyGet({
                groupId: e
            })
        }
        async getDeveloperExchangeInfo(e) {
            return this.cashoutApi.v1DeveloperExchangeInfoGet({
                fromDevExPage: e
            })
        }
        getGroupUserPayoutEligibility(e, t) {
            return this.groupPayoutsApi.v1GroupsGroupIdUsersPayoutEligibilityGet({
                userIds: t,
                groupId: e
            })
        }
        getGroupSnapshotRobux(e) {
            return this.groupPayoutsApi.v1GroupsGroupIdSnapshotRobuxGet({
                groupId: e
            })
        }
        getGroupDevExWatermarks(e) {
            return this.currencyApi.v1GroupsGroupIdDevExWatermarksGet({
                groupId: e
            })
        }
        constructor() {
            (0, t._)(this, "currencyApi", void 0), (0, t._)(this, "cashoutApi", void 0), (0, t._)(this, "productApi", void 0), (0, t._)(this, "groupPayoutsApi", void 0);
            const e = (0, I.createClientConfiguration)("economy", "bedev1");
            this.currencyApi = new h(e), this.cashoutApi = new v(e), this.productApi = new f(e), this.groupPayoutsApi = new m(e)
        }
    };
    e.s(["default", 0, b], 199475)
}, 486736, 429246, e => {
    "use strict";
    var t, r = e.i(221628),
        s = e.i(416340),
        n = e.i(639102),
        i = e.i(199475),
        o = ((t = {}).enableActivityFeedLocation = "enableActivityFeedLocation", t.enableEnvironments = "enableEnvironments", t.enableYourPlaceCreationExperimentDate = "enableYourPlaceCreationExperimentDate", t.unratedExperienceBannerLink = "unratedExperienceBannerLink", t.enableRentables = "enableRentables", t.enableImageTranslationEnrollment = "enableImageTranslationEnrollment", t.enableImageTranslationListingTab = "enableImageTranslationListingTab", t.enableSharedTranslationListComponents = "enableSharedTranslationListComponents", t.enableIpPlatformConditionalOffers = "enableIpPlatformConditionalOffers", t.enableGroupModerationPage = "enableGroupModerationPage", t.isHdEnabled = "isHdEnabled", t.enableReducedMarketplaceVisibilityBanner = "enableReducedMarketplaceVisibilityBanner", t.enableCoreContentGatedBanner = "enableCoreContentGatedBanner", t.enableAudioUploadRevamp = "enableAudioUploadRevamp", t.enableRtbfSetting = "enableRtbfSetting", t.rtbfSettingAllowlist = "rtbfSettingAllowlist", t.enable2D3DUnificationBanner = "enable2D3DUnificationBanner", t.unification2D3DBannerLearnMoreUrl = "unification2D3DBannerLearnMoreUrl", t.enableIpPlatformMatchesTableEsIndexImprovements = "enableIpPlatformMatchesTableEsIndexImprovements", t);
    let a = {
        enableActivityFeedLocation: !1,
        enableEnvironments: !1,
        enableYourPlaceCreationExperimentDate: new Date("2025-09-23").toISOString(),
        unratedExperienceBannerLink: "",
        enableRentables: !1,
        enableImageTranslationEnrollment: !1,
        enableImageTranslationListingTab: !1,
        enableSharedTranslationListComponents: !1,
        enableIpPlatformConditionalOffers: !1,
        enableGroupModerationPage: !1,
        isHdEnabled: !1,
        enableReducedMarketplaceVisibilityBanner: !1,
        enableCoreContentGatedBanner: !1,
        enableAudioUploadRevamp: !1,
        enableRtbfSetting: !1,
        rtbfSettingAllowlist: "",
        enable2D3DUnificationBanner: !1,
        unification2D3DBannerLearnMoreUrl: "",
        enableIpPlatformMatchesTableEsIndexImprovements: !1
    };
    e.s(["FeatureFlagName", () => o, "featureFlagDefaults", 0, a], 429246);
    let u = Object.keys(a).reduce((e, t) => ({
            ...e,
            [t]: a[t]
        }), {}),
        d = {
            isUserEligibleForDevEx: !1
        },
        c = {
            ...u,
            ...d,
            isExperienceCreatedByCurrentUserOrGroup: !1
        },
        l = async () => {
            try {
                let {
                    applicationSettings: e = {}
                } = await n.settingsClient.getApplicationSettings(), t = {};
                return Object.entries(e).forEach(e => {
                    let [r, s] = e;
                    try {
                        let e = typeof u[r];
                        t[r] = "boolean" === e || "number" === e ? JSON.parse(s) : s
                    } catch (e) {
                        console.error(e)
                    }
                }), t
            } catch (e) {
                return u
            }
        }, p = async () => {
            try {
                return await i.default.getDeveloperExchangeInfo(), {
                    isUserEligibleForDevEx: !0
                }
            } catch (e) {
                return d
            }
        }, v = (0, s.createContext)({
            settings: {
                ...c
            },
            status: "initial",
            isFetched: !1
        });
    e.s(["SettingsProvider", 0, e => {
        let {
            children: t
        } = e, [n, i] = (0, s.useState)(() => ({
            settings: {
                ...c
            },
            status: "initial",
            isFetched: !1
        }));
        return (0, s.useEffect)(() => {
            (async () => {
                let e = await Promise.allSettled([l(), p()]);
                i({
                    settings: e.reduce((e, t) => ({
                        ...e,
                        ..."fulfilled" === t.status ? t.value : {}
                    }), c),
                    isFetched: !0,
                    status: e.find(e => "rejected" === e.status) ? "error" : "success"
                })
            })()
        }, []), (0, r.jsx)(v.Provider, {
            value: n,
            children: t
        })
    }, "useSettings", 0, () => {
        let {
            settings: e,
            status: t,
            isFetched: r
        } = (0, s.useContext)(v), n = (0, s.useRef)(e);
        return {
            settings: (0, s.useMemo)(() => {
                let t = n.current;
                return Object.keys(e).some(r => e[r] !== t[r]) && (n.current = e), n.current
            }, [e]),
            status: t,
            isFetched: r
        }
    }], 486736)
}]);

//# debugId=9ca6191b-c22e-1081-da1e-58adcea6de23
//# sourceMappingURL=40m_snjmrx3bc.js.map