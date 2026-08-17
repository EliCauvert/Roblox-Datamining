;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "7f816484-c6a1-db80-e365-5689697fa45b")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 644746, 35701, 160312, 987047, e => {
    "use strict";
    var t = e.i(721281),
        r = e.i(677753),
        i = function(e, t) {
            return (i = Object.setPrototypeOf || ({
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
        i(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
    }

    function s(e, t, r, i) {
        return new(r || (r = Promise))(function(n, s) {
            function o(e) {
                try {
                    u(i.next(e))
                } catch (e) {
                    s(e)
                }
            }

            function a(e) {
                try {
                    u(i.throw(e))
                } catch (e) {
                    s(e)
                }
            }

            function u(e) {
                var t;
                e.done ? n(e.value) : ((t = e.value) instanceof r ? t : new r(function(e) {
                    e(t)
                })).then(o, a)
            }
            u((i = i.apply(e, t || [])).next())
        })
    }

    function o(e, t) {
        var r, i, n, s = {
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
                var c = [a, u];
                if (r) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, c[0] && (s = 0)), s;) try {
                    if (r = 1, i && (n = 2 & c[0] ? i.return : c[0] ? i.throw || ((n = i.return) && n.call(i), 0) : i.next) && !(n = n.call(i, c[1])).done) return n;
                    switch (i = 0, n && (c = [2 & c[0], n.value]), c[0]) {
                        case 0:
                        case 1:
                            n = c;
                            break;
                        case 4:
                            return s.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            s.label++, i = c[1], c = [0];
                            continue;
                        case 7:
                            c = s.ops.pop(), s.trys.pop();
                            continue;
                        default:
                            if (!(n = (n = s.trys).length > 0 && n[n.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                s = 0;
                                continue
                            }
                            if (3 === c[0] && (!n || c[1] > n[0] && c[1] < n[3])) {
                                s.label = c[1];
                                break
                            }
                            if (6 === c[0] && s.label < n[1]) {
                                s.label = n[1], n = c;
                                break
                            }
                            if (n && s.label < n[2]) {
                                s.label = n[2], s.ops.push(c);
                                break
                            }
                            n[2] && s.ops.pop(), s.trys.pop();
                            continue
                    }
                    c = t.call(e, s)
                } catch (e) {
                    c = [6, e], i = 0
                } finally {
                    r = n = 0
                }
                if (5 & c[0]) throw c[1];
                return {
                    value: c[0] ? c[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;
    var a = r.BaseAPI;

    function u() {
        return null !== a && a.apply(this, arguments) || this
    }
    n(u, a), u.prototype.veriffVerificationGetVerificationStatusRaw = function(e, t) {
        return s(this, void 0, void 0, function() {
            var i, n, s;
            return o(this, function(o) {
                switch (o.label) {
                    case 0:
                        return i = {}, void 0 !== e.token && (i.token = e.token), n = {}, [4, this.request({
                            path: "/v1/veriff-id-verification/verified-status",
                            schemaPath: "/v1/veriff-id-verification/verified-status",
                            method: "GET",
                            headers: n,
                            query: i
                        }, t)];
                    case 1:
                        return s = o.sent(), [2, new r.VoidApiResponse(s)]
                }
            })
        })
    }, u.prototype.veriffVerificationGetVerificationStatus = function() {
        return s(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), o(this, function(r) {
                switch (r.label) {
                    case 0:
                        return [4, this.veriffVerificationGetVerificationStatusRaw(e, t)];
                    case 1:
                        return r.sent(), [2]
                }
            })
        })
    }, u.prototype.veriffVerificationStartVerificationRaw = function(e, t) {
        return s(this, void 0, void 0, function() {
            var i, n, s;
            return o(this, function(o) {
                switch (o.label) {
                    case 0:
                        return i = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                            path: "/v1/veriff-id-verification/start-verification",
                            schemaPath: "/v1/veriff-id-verification/start-verification",
                            method: "POST",
                            headers: n,
                            query: i,
                            body: function(e) {
                                if (void 0 !== e) return null === e ? null : {
                                    sendEmail: e.sendEmail,
                                    generateLink: e.generateLink
                                }
                            }(e.startVerificationRequest)
                        }, t)];
                    case 1:
                        return s = o.sent(), [2, new r.VoidApiResponse(s)]
                }
            })
        })
    }, u.prototype.veriffVerificationStartVerification = function() {
        return s(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), o(this, function(r) {
                switch (r.label) {
                    case 0:
                        return [4, this.veriffVerificationStartVerificationRaw(e, t)];
                    case 1:
                        return r.sent(), [2]
                }
            })
        })
    }, u.prototype.veriffVerificationUpdateVerificationRaw = function(e, t) {
        return s(this, void 0, void 0, function() {
            var i, n, s;
            return o(this, function(o) {
                switch (o.label) {
                    case 0:
                        return i = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                            path: "/v1/veriff-id-verification/update-verification",
                            schemaPath: "/v1/veriff-id-verification/update-verification",
                            method: "POST",
                            headers: n,
                            query: i,
                            body: function(e) {
                                if (void 0 !== e) return null === e ? null : {
                                    status: e.status,
                                    verification: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            id: e.id,
                                            code: e.code,
                                            person: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    firstName: e.firstName,
                                                    lastName: e.lastName,
                                                    dateOfBirth: e.dateOfBirth
                                                }
                                            }(e.person),
                                            reasonCode: e.reasonCode,
                                            status: e.status,
                                            document: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    type: e.type,
                                                    number: e.number,
                                                    country: e.country
                                                }
                                            }(e.document),
                                            vendorData: e.vendorData
                                        }
                                    }(e.verification)
                                }
                            }(e.veriffDecisionCallbackRequest)
                        }, t)];
                    case 1:
                        return s = o.sent(), [2, new r.VoidApiResponse(s)]
                }
            })
        })
    }, u.prototype.veriffVerificationUpdateVerification = function() {
        return s(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), o(this, function(r) {
                switch (r.label) {
                    case 0:
                        return [4, this.veriffVerificationUpdateVerificationRaw(e, t)];
                    case 1:
                        return r.sent(), [2]
                }
            })
        })
    }, u.prototype.veriffVerificationUpdateVerificationActionRaw = function(e, t) {
        return s(this, void 0, void 0, function() {
            var i, n, s;
            return o(this, function(o) {
                switch (o.label) {
                    case 0:
                        return i = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                            path: "/v1/veriff-id-verification/update-verification-action",
                            schemaPath: "/v1/veriff-id-verification/update-verification-action",
                            method: "POST",
                            headers: n,
                            query: i,
                            body: function(e) {
                                if (void 0 !== e) return null === e ? null : {
                                    id: e.id,
                                    attemptId: e.attemptId,
                                    code: e.code,
                                    vendorData: e.vendorData
                                }
                            }(e.veriffActionCallbackRequest)
                        }, t)];
                    case 1:
                        return s = o.sent(), [2, new r.VoidApiResponse(s)]
                }
            })
        })
    }, u.prototype.veriffVerificationUpdateVerificationAction = function() {
        return s(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), o(this, function(r) {
                switch (r.label) {
                    case 0:
                        return [4, this.veriffVerificationUpdateVerificationActionRaw(e, t)];
                    case 1:
                        return r.sent(), [2]
                }
            })
        })
    };
    var c = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(t, e), t.prototype.verifiedAgeGetRealIDHashForUserRaw = function(e, t) {
                return s(this, void 0, void 0, function() {
                    var i, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return i = {}, void 0 !== e.userId && (i.userId = e.userId), n = {}, [4, this.request({
                                    path: "/v1/age-verification/realid-hash-for-user",
                                    schemaPath: "/v1/age-verification/realid-hash-for-user",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new r.JSONApiResponse(s, function(e) {
                                    var t, i, n;
                                    return null == e ? e : {
                                        realIdHash: (0, r.exists)(e, "realIdHash") ? null == (t = e.realIdHash) ? t : {
                                            value: (0, r.exists)(t, "value") ? t.value : void 0,
                                            type: (0, r.exists)(t, "type") ? null == (i = t.type) ? i : {
                                                nativeType: (0, r.exists)(i, "nativeType") ? null == (n = i.nativeType) ? n : {
                                                    name: (0, r.exists)(n, "name") ? n.name : void 0
                                                } : void 0,
                                                name: (0, r.exists)(i, "name") ? i.name : void 0
                                            } : void 0
                                        } : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.verifiedAgeGetRealIDHashForUser = function() {
                return s(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.verifiedAgeGetRealIDHashForUserRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.verifiedAgeGetSessionUrlRaw = function(e, t) {
                return s(this, void 0, void 0, function() {
                    var i, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return i = {}, void 0 !== e.identifier && (i.identifier = e.identifier), n = {}, [4, this.request({
                                    path: "/v1/age-verification/session-url",
                                    schemaPath: "/v1/age-verification/session-url",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new r.VoidApiResponse(s)]
                        }
                    })
                })
            }, t.prototype.verifiedAgeGetSessionUrl = function() {
                return s(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.verifiedAgeGetSessionUrlRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, t.prototype.verifiedAgeGetUsersForRealIDHashRaw = function(e, t) {
                return s(this, void 0, void 0, function() {
                    var i, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return i = {}, void 0 !== e.hash && (i.hash = e.hash), void 0 !== e.limit && (i.Limit = e.limit), void 0 !== e.cursor && (i.Cursor = e.cursor), n = {}, [4, this.request({
                                    path: "/v1/age-verification/users-for-realid-hash",
                                    schemaPath: "/v1/age-verification/users-for-realid-hash",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new r.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        userIds: (0, r.exists)(e, "userIds") ? e.userIds : void 0,
                                        nextCursor: (0, r.exists)(e, "nextCursor") ? e.nextCursor : void 0,
                                        previousCursor: (0, r.exists)(e, "previousCursor") ? e.previousCursor : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.verifiedAgeGetUsersForRealIDHash = function() {
                return s(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.verifiedAgeGetUsersForRealIDHashRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.verifiedAgeGetVerifiedAgeRaw = function(e) {
                return s(this, void 0, void 0, function() {
                    var t, i, n;
                    return o(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return t = {}, i = {}, [4, this.request({
                                    path: "/v1/age-verification/verified-age",
                                    schemaPath: "/v1/age-verification/verified-age",
                                    method: "GET",
                                    headers: i,
                                    query: t
                                }, e)];
                            case 1:
                                return n = s.sent(), [2, new r.JSONApiResponse(n, function(e) {
                                    return null == e ? e : {
                                        isVerified: (0, r.exists)(e, "isVerified") ? e.isVerified : void 0,
                                        verifiedAge: (0, r.exists)(e, "verifiedAge") ? e.verifiedAge : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.verifiedAgeGetVerifiedAge = function(e) {
                return s(this, void 0, void 0, function() {
                    return o(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.verifiedAgeGetVerifiedAgeRaw(e)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t
        }(r.BaseAPI),
        l = e.i(272593);
    let d = new class {
        isUserAgeVerified() {
            return this.ageVerificationApi.verifiedAgeGetVerifiedAge()
        }
        constructor() {
            (0, t._)(this, "ageVerificationApi", void 0), this.ageVerificationApi = new c((0, l.createClientConfiguration)("age-verification-service", "bedev2"))
        }
    };
    e.s(["default", 0, d], 644746);
    var p = function(e, t) {
        return (p = Object.setPrototypeOf || ({
            __proto__: []
        }) instanceof Array && function(e, t) {
            e.__proto__ = t
        } || function(e, t) {
            for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
        })(e, t)
    };

    function f(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function r() {
            this.constructor = e
        }
        p(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
    }

    function v(e, t, r, i) {
        return new(r || (r = Promise))(function(n, s) {
            function o(e) {
                try {
                    u(i.next(e))
                } catch (e) {
                    s(e)
                }
            }

            function a(e) {
                try {
                    u(i.throw(e))
                } catch (e) {
                    s(e)
                }
            }

            function u(e) {
                var t;
                e.done ? n(e.value) : ((t = e.value) instanceof r ? t : new r(function(e) {
                    e(t)
                })).then(o, a)
            }
            u((i = i.apply(e, t || [])).next())
        })
    }

    function h(e, t) {
        var r, i, n, s = {
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
                var c = [a, u];
                if (r) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, c[0] && (s = 0)), s;) try {
                    if (r = 1, i && (n = 2 & c[0] ? i.return : c[0] ? i.throw || ((n = i.return) && n.call(i), 0) : i.next) && !(n = n.call(i, c[1])).done) return n;
                    switch (i = 0, n && (c = [2 & c[0], n.value]), c[0]) {
                        case 0:
                        case 1:
                            n = c;
                            break;
                        case 4:
                            return s.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            s.label++, i = c[1], c = [0];
                            continue;
                        case 7:
                            c = s.ops.pop(), s.trys.pop();
                            continue;
                        default:
                            if (!(n = (n = s.trys).length > 0 && n[n.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                s = 0;
                                continue
                            }
                            if (3 === c[0] && (!n || c[1] > n[0] && c[1] < n[3])) {
                                s.label = c[1];
                                break
                            }
                            if (6 === c[0] && s.label < n[1]) {
                                s.label = n[1], n = c;
                                break
                            }
                            if (n && s.label < n[2]) {
                                s.label = n[2], s.ops.push(c);
                                break
                            }
                            n[2] && s.ops.pop(), s.trys.pop();
                            continue
                    }
                    c = t.call(e, s)
                } catch (e) {
                    c = [6, e], i = 0
                } finally {
                    r = n = 0
                }
                if (5 & c[0]) throw c[1];
                return {
                    value: c[0] ? c[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;
    var m = r.BaseAPI;

    function b() {
        return null !== m && m.apply(this, arguments) || this
    }
    f(b, m), b.prototype.v1ProductsGetRaw = function(e, t) {
        return v(this, void 0, void 0, function() {
            var i, n, s;
            return h(this, function(o) {
                switch (o.label) {
                    case 0:
                        return i = {}, void 0 !== e.typeName && (i.typeName = e.typeName), void 0 !== e.flowTypeName && (i.flowTypeName = e.flowTypeName), void 0 !== e.skipPremiumUserCheck && (i.skipPremiumUserCheck = e.skipPremiumUserCheck), n = {}, [4, this.request({
                            path: "/v1/products",
                            schemaPath: "/v1/products",
                            method: "GET",
                            headers: n,
                            query: i
                        }, t)];
                    case 1:
                        return s = o.sent(), [2, new r.VoidApiResponse(s)]
                }
            })
        })
    }, b.prototype.v1ProductsGet = function() {
        return v(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), h(this, function(r) {
                switch (r.label) {
                    case 0:
                        return [4, this.v1ProductsGetRaw(e, t)];
                    case 1:
                        return r.sent(), [2]
                }
            })
        })
    };
    var I = function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        return f(t, e), t.prototype.v1UsersUserIdPremiumUpsellPrecheckGetRaw = function(e, t) {
            return v(this, void 0, void 0, function() {
                var i, n, s;
                return h(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdPremiumUpsellPrecheckGet.");
                            if (null === e.universeId || void 0 === e.universeId) throw new r.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UsersUserIdPremiumUpsellPrecheckGet.");
                            if (null === e.placeId || void 0 === e.placeId) throw new r.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v1UsersUserIdPremiumUpsellPrecheckGet.");
                            return i = {}, void 0 !== e.universeId && (i.universeId = e.universeId), void 0 !== e.placeId && (i.placeId = e.placeId), n = {}, [4, this.request({
                                path: "/v1/users/{userId}/premium-upsell-precheck".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v1/users/{userId}/premium-upsell-precheck",
                                method: "GET",
                                headers: n,
                                query: i
                            }, t)];
                        case 1:
                            return s = o.sent(), [2, new r.VoidApiResponse(s)]
                    }
                })
            })
        }, t.prototype.v1UsersUserIdPremiumUpsellPrecheckGet = function(e, t) {
            return v(this, void 0, void 0, function() {
                return h(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1UsersUserIdPremiumUpsellPrecheckGetRaw(e, t)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, t.prototype.v1UsersUserIdSubscriptionsCancelPostRaw = function(e, t) {
            return v(this, void 0, void 0, function() {
                var i, n, s;
                return h(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdSubscriptionsCancelPost.");
                            return i = {}, n = {}, [4, this.request({
                                path: "/v1/users/{userId}/subscriptions/cancel".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v1/users/{userId}/subscriptions/cancel",
                                method: "POST",
                                headers: n,
                                query: i
                            }, t)];
                        case 1:
                            return s = o.sent(), [2, new r.VoidApiResponse(s)]
                    }
                })
            })
        }, t.prototype.v1UsersUserIdSubscriptionsCancelPost = function(e, t) {
            return v(this, void 0, void 0, function() {
                return h(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1UsersUserIdSubscriptionsCancelPostRaw(e, t)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, t.prototype.v1UsersUserIdSubscriptionsDetailsGetRaw = function(e, t) {
            return v(this, void 0, void 0, function() {
                var i, n, s;
                return h(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdSubscriptionsDetailsGet.");
                            return i = {}, n = {}, [4, this.request({
                                path: "/v1/users/{userId}/subscriptions/details".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v1/users/{userId}/subscriptions/details",
                                method: "GET",
                                headers: n,
                                query: i
                            }, t)];
                        case 1:
                            return s = o.sent(), [2, new r.VoidApiResponse(s)]
                    }
                })
            })
        }, t.prototype.v1UsersUserIdSubscriptionsDetailsGet = function(e, t) {
            return v(this, void 0, void 0, function() {
                return h(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1UsersUserIdSubscriptionsDetailsGetRaw(e, t)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, t.prototype.v1UsersUserIdSubscriptionsGetRaw = function(e, t) {
            return v(this, void 0, void 0, function() {
                var i, n, s;
                return h(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdSubscriptionsGet.");
                            return i = {}, n = {}, [4, this.request({
                                path: "/v1/users/{userId}/subscriptions".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v1/users/{userId}/subscriptions",
                                method: "GET",
                                headers: n,
                                query: i
                            }, t)];
                        case 1:
                            return s = o.sent(), [2, new r.JSONApiResponse(s, function(e) {
                                var t;
                                return null == e ? e : {
                                    subscriptionProductModel: (0, r.exists)(e, "subscriptionProductModel") ? null == (t = e.subscriptionProductModel) ? t : {
                                        premiumFeatureId: (0, r.exists)(t, "premiumFeatureId") ? t.premiumFeatureId : void 0,
                                        subscriptionTypeName: (0, r.exists)(t, "subscriptionTypeName") ? t.subscriptionTypeName : void 0,
                                        robuxStipendAmount: (0, r.exists)(t, "robuxStipendAmount") ? t.robuxStipendAmount : void 0,
                                        isLifetime: (0, r.exists)(t, "isLifetime") ? t.isLifetime : void 0,
                                        expiration: (0, r.exists)(t, "expiration") ? new Date(t.expiration) : void 0,
                                        renewal: (0, r.exists)(t, "renewal") ? new Date(t.renewal) : void 0,
                                        renewedSince: (0, r.exists)(t, "renewedSince") ? new Date(t.renewedSince) : void 0,
                                        created: (0, r.exists)(t, "created") ? new Date(t.created) : void 0,
                                        purchasePlatform: (0, r.exists)(t, "purchasePlatform") ? t.purchasePlatform : void 0,
                                        subscriptionName: (0, r.exists)(t, "subscriptionName") ? t.subscriptionName : void 0
                                    } : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1UsersUserIdSubscriptionsGet = function(e, t) {
            return v(this, void 0, void 0, function() {
                return h(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1UsersUserIdSubscriptionsGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.v1UsersUserIdSubscriptionsMetadataGetRaw = function(e, t) {
            return v(this, void 0, void 0, function() {
                var i, n, s;
                return h(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdSubscriptionsMetadataGet.");
                            return i = {}, n = {}, [4, this.request({
                                path: "/v1/users/{userId}/subscriptions/metadata".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v1/users/{userId}/subscriptions/metadata",
                                method: "GET",
                                headers: n,
                                query: i
                            }, t)];
                        case 1:
                            return s = o.sent(), [2, new r.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    expiration: (0, r.exists)(e, "Expiration") ? new Date(e.Expiration) : void 0,
                                    computerSubscriptionRenewal: (0, r.exists)(e, "ComputerSubscriptionRenewal") ? new Date(e.ComputerSubscriptionRenewal) : void 0,
                                    appleSubscriptionRenewal: (0, r.exists)(e, "AppleSubscriptionRenewal") ? new Date(e.AppleSubscriptionRenewal) : void 0,
                                    googleSubscriptionRenewal: (0, r.exists)(e, "GoogleSubscriptionRenewal") ? new Date(e.GoogleSubscriptionRenewal) : void 0,
                                    numRobuxText: (0, r.exists)(e, "NumRobuxText") ? e.NumRobuxText : void 0,
                                    membershipName: (0, r.exists)(e, "MembershipName") ? e.MembershipName : void 0,
                                    membershipDuration: (0, r.exists)(e, "MembershipDuration") ? e.MembershipDuration : void 0,
                                    premiumFeatureId: (0, r.exists)(e, "PremiumFeatureId") ? e.PremiumFeatureId : void 0,
                                    stipendFrequency: (0, r.exists)(e, "StipendFrequency") ? e.StipendFrequency : void 0,
                                    appleCancellationDirectionsUrl: (0, r.exists)(e, "AppleCancellationDirectionsUrl") ? e.AppleCancellationDirectionsUrl : void 0,
                                    googleCancellationDirectionsUrl: (0, r.exists)(e, "GoogleCancellationDirectionsUrl") ? e.GoogleCancellationDirectionsUrl : void 0,
                                    robuxEarnedFromSales: (0, r.exists)(e, "RobuxEarnedFromSales") ? e.RobuxEarnedFromSales : void 0,
                                    salesEarningsVisible: (0, r.exists)(e, "SalesEarningsVisible") ? e.SalesEarningsVisible : void 0,
                                    robuxEarningsVisible: (0, r.exists)(e, "RobuxEarningsVisible") ? e.RobuxEarningsVisible : void 0,
                                    userIsSubscribedToAccountProduct: (0, r.exists)(e, "UserIsSubscribedToAccountProduct") ? e.UserIsSubscribedToAccountProduct : void 0,
                                    userIsInPromotionNoCancelWindow: (0, r.exists)(e, "UserIsInPromotionNoCancelWindow") ? e.UserIsInPromotionNoCancelWindow : void 0,
                                    promotionNoCancelTerm: (0, r.exists)(e, "PromotionNoCancelTerm") ? e.PromotionNoCancelTerm : void 0,
                                    userRenewalIsProcessing: (0, r.exists)(e, "UserRenewalIsProcessing") ? e.UserRenewalIsProcessing : void 0,
                                    userHasMultipleActiveSubscriptions: (0, r.exists)(e, "UserHasMultipleActiveSubscriptions") ? e.UserHasMultipleActiveSubscriptions : void 0,
                                    userHasComputerSubscription: (0, r.exists)(e, "UserHasComputerSubscription") ? e.UserHasComputerSubscription : void 0,
                                    userHasAppleAppStoreSubscription: (0, r.exists)(e, "UserHasAppleAppStoreSubscription") ? e.UserHasAppleAppStoreSubscription : void 0,
                                    userHasGooglePlayStoreSubscription: (0, r.exists)(e, "UserHasGooglePlayStoreSubscription") ? e.UserHasGooglePlayStoreSubscription : void 0,
                                    robloxSupportUrl: (0, r.exists)(e, "RobloxSupportUrl") ? e.RobloxSupportUrl : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1UsersUserIdSubscriptionsMetadataGet = function(e, t) {
            return v(this, void 0, void 0, function() {
                return h(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1UsersUserIdSubscriptionsMetadataGetRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.v1UsersUserIdValidateMembershipGetRaw = function(e, t) {
            return v(this, void 0, void 0, function() {
                var i, n, s;
                return h(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdValidateMembershipGet.");
                            return i = {}, n = {}, [4, this.request({
                                path: "/v1/users/{userId}/validate-membership".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v1/users/{userId}/validate-membership",
                                method: "GET",
                                headers: n,
                                query: i
                            }, t)];
                        case 1:
                            return s = o.sent(), [2, new r.VoidApiResponse(s)]
                    }
                })
            })
        }, t.prototype.v1UsersUserIdValidateMembershipGet = function(e, t) {
            return v(this, void 0, void 0, function() {
                return h(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1UsersUserIdValidateMembershipGetRaw(e, t)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, t.prototype.v1UsersUserIdValidateMembershipRccGetRaw = function(e, t) {
            return v(this, void 0, void 0, function() {
                var i, n, s;
                return h(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdValidateMembershipRccGet.");
                            return i = {}, n = {}, [4, this.request({
                                path: "/v1/users/{userId}/validate-membership-rcc".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v1/users/{userId}/validate-membership-rcc",
                                method: "GET",
                                headers: n,
                                query: i
                            }, t)];
                        case 1:
                            return s = o.sent(), [2, new r.VoidApiResponse(s)]
                    }
                })
            })
        }, t.prototype.v1UsersUserIdValidateMembershipRccGet = function(e, t) {
            return v(this, void 0, void 0, function() {
                return h(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1UsersUserIdValidateMembershipRccGetRaw(e, t)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, t
    }(r.BaseAPI);
    let P = new class {
        getUserSubscription(e) {
            return this.premiumFeaturesUsersApi.v1UsersUserIdSubscriptionsGet({
                userId: e
            })
        }
        getUserSubscriptionMetadata(e) {
            return this.premiumFeaturesUsersApi.v1UsersUserIdSubscriptionsMetadataGet({
                userId: e
            })
        }
        constructor() {
            (0, t._)(this, "premiumFeaturesUsersApi", void 0), this.premiumFeaturesUsersApi = new I((0, l.createClientConfiguration)("premiumfeatures", "bedev1"))
        }
    };
    e.s(["default", 0, P], 35701);
    var y = function(e, t) {
        return (y = Object.setPrototypeOf || ({
            __proto__: []
        }) instanceof Array && function(e, t) {
            e.__proto__ = t
        } || function(e, t) {
            for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
        })(e, t)
    };

    function w(e, t, r, i) {
        return new(r || (r = Promise))(function(n, s) {
            function o(e) {
                try {
                    u(i.next(e))
                } catch (e) {
                    s(e)
                }
            }

            function a(e) {
                try {
                    u(i.throw(e))
                } catch (e) {
                    s(e)
                }
            }

            function u(e) {
                var t;
                e.done ? n(e.value) : ((t = e.value) instanceof r ? t : new r(function(e) {
                    e(t)
                })).then(o, a)
            }
            u((i = i.apply(e, t || [])).next())
        })
    }

    function S(e, t) {
        var r, i, n, s = {
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
                var c = [a, u];
                if (r) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, c[0] && (s = 0)), s;) try {
                    if (r = 1, i && (n = 2 & c[0] ? i.return : c[0] ? i.throw || ((n = i.return) && n.call(i), 0) : i.next) && !(n = n.call(i, c[1])).done) return n;
                    switch (i = 0, n && (c = [2 & c[0], n.value]), c[0]) {
                        case 0:
                        case 1:
                            n = c;
                            break;
                        case 4:
                            return s.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            s.label++, i = c[1], c = [0];
                            continue;
                        case 7:
                            c = s.ops.pop(), s.trys.pop();
                            continue;
                        default:
                            if (!(n = (n = s.trys).length > 0 && n[n.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                s = 0;
                                continue
                            }
                            if (3 === c[0] && (!n || c[1] > n[0] && c[1] < n[3])) {
                                s.label = c[1];
                                break
                            }
                            if (6 === c[0] && s.label < n[1]) {
                                s.label = n[1], n = c;
                                break
                            }
                            if (n && s.label < n[2]) {
                                s.label = n[2], s.ops.push(c);
                                break
                            }
                            n[2] && s.ops.pop(), s.trys.pop();
                            continue
                    }
                    c = t.call(e, s)
                } catch (e) {
                    c = [6, e], i = 0
                } finally {
                    r = n = 0
                }
                if (5 & c[0]) throw c[1];
                return {
                    value: c[0] ? c[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function g(e) {
        return e
    }
    "function" == typeof SuppressedError && SuppressedError;

    function R(e, t) {
        return null == e ? e : {
            currencyCode: e.currencyCode,
            units: e.units,
            nanos: e.nanos
        }
    }

    function x(e) {
        return e
    }

    function T(e) {
        var t, i;
        return null == (t = e) ? t : {
            offerType: (0, r.exists)(t, "offerType") ? t.offerType : void 0,
            freeTrialOffer: (0, r.exists)(t, "freeTrialOffer") ? null == (i = t.freeTrialOffer) ? i : {
                periodType: i.periodType,
                duration: i.duration,
                estimatedTrialEndDate: (0, r.exists)(i, "estimatedTrialEndDate") ? null === i.estimatedTrialEndDate ? null : new Date(i.estimatedTrialEndDate) : void 0
            } : void 0
        }
    }

    function q(e) {
        var t;
        return null == (t = e) ? t : {
            type: t.type,
            id: t.id
        }
    }

    function U(e) {
        var t;
        return null == (t = e) ? t : {
            tierId: t.tierId,
            periodIndex: t.periodIndex,
            discountPercent: t.discountPercent
        }
    }

    function k(e) {
        var t, i, n, s, o, a, u;
        return null == (t = e) ? t : {
            productKey: q(t.productKey),
            periodType: t.periodType,
            periodCount: t.periodCount,
            localizedPrice: R(t.localizedPrice),
            localizedPriceDisplayString: t.localizedPriceDisplayString,
            localizedStrikethroughPrice: R(t.localizedStrikethroughPrice),
            localizedStrikethroughPriceDisplayString: t.localizedStrikethroughPriceDisplayString,
            productTypeDetails: null == (i = t.productTypeDetails) ? i : {
                currencySubscriptionProductDetails: (0, r.exists)(i, "currencySubscriptionProductDetails") ? null == (n = i.currencySubscriptionProductDetails) ? n : {
                    currencyType: n.currencyType,
                    entitledAmountMicros: n.entitledAmountMicros
                } : void 0,
                developerSubscriptionProductDetails: (0, r.exists)(i, "developerSubscriptionProductDetails") ? null == (s = i.developerSubscriptionProductDetails) ? s : {
                    universeId: s.universeId,
                    imageAssetId: s.imageAssetId,
                    localizedName: s.localizedName,
                    localizedDescription: s.localizedDescription
                } : void 0,
                robloxSubscriptionProductDetails: (0, r.exists)(i, "robloxSubscriptionProductDetails") ? null == (o = i.robloxSubscriptionProductDetails) ? o : {
                    featureConfig: null == (a = o.featureConfig) ? a : {
                        virtualTransactionDiscounts: null === a.virtualTransactionDiscounts ? null : a.virtualTransactionDiscounts.map(U),
                        isRobuxTransferEnabled: a.isRobuxTransferEnabled,
                        isTradingEnabled: a.isTradingEnabled,
                        isUgcPublishingEnabled: a.isUgcPublishingEnabled,
                        privateServerDiscounts: null === a.privateServerDiscounts ? null : a.privateServerDiscounts.map(U),
                        currencySubscriptionConfig: null == (u = a.currencySubscriptionConfig) ? u : {
                            currencyType: u.currencyType,
                            entitledAmountMicros: u.entitledAmountMicros
                        }
                    }
                } : void 0
            },
            eligibleOffers: t.eligibleOffers.map(T)
        }
    }

    function C(e) {
        var t, i, n, s, o, a, u;
        return null == (t = e) ? t : {
            productKey: q(t.productKey),
            periodType: t.periodType,
            displayPrice: R(t.displayPrice),
            activationTimestampMs: t.activationTimestampMs,
            expirationTimestampMs: t.expirationTimestampMs,
            nextRenewalTimestampMs: t.nextRenewalTimestampMs,
            paymentProvider: x(t.paymentProvider),
            purchasePlatform: t.purchasePlatform,
            paymentProfile: null == (i = t.paymentProfile) ? i : {
                id: i.id,
                cardInfo: null == (n = i.cardInfo) ? n : {
                    cardNetwork: n.cardNetwork,
                    lastFourDigits: n.lastFourDigits,
                    expirationMonth: n.expirationMonth,
                    expirationYear: n.expirationYear
                }
            },
            activeOffers: t.activeOffers.map(T),
            productTypeMembershipDetails: null == (s = t.productTypeMembershipDetails) ? s : {
                robloxSubscriptionMembershipDetails: (0, r.exists)(s, "robloxSubscriptionMembershipDetails") ? null == (o = s.robloxSubscriptionMembershipDetails) ? o : {
                    features: null == (a = o.features) ? a : {
                        productType: a.productType,
                        virtualTransactionDiscountTierId: a.virtualTransactionDiscountTierId,
                        isRobuxTransferEnabled: a.isRobuxTransferEnabled,
                        isTradingEnabled: a.isTradingEnabled,
                        isUgcPublishingEnabled: a.isUgcPublishingEnabled,
                        privateServerDiscountTierId: a.privateServerDiscountTierId
                    },
                    currencySubscriptionBenefit: null == (u = o.currencySubscriptionBenefit) ? u : {
                        currencyType: u.currencyType,
                        entitledAmountMicrosPerGrantingPeriod: u.entitledAmountMicrosPerGrantingPeriod,
                        grantingPeriodType: u.grantingPeriodType
                    }
                } : void 0
            },
            productInfo: k(t.productInfo)
        }
    }
    var A = function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function r() {
                this.constructor = e
            }
            y(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
        }(t, e), t.prototype.subscriptionsV2GetProductDisplayPriceRaw = function(e, t) {
            return w(this, void 0, void 0, function() {
                var i, n, s;
                return S(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new r.RequiredError("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetProductDisplayPrice.");
                            if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new r.RequiredError("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetProductDisplayPrice.");
                            return i = {}, n = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (n["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/display-price".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/display-price",
                                method: "GET",
                                headers: n,
                                query: i
                            }, t)];
                        case 1:
                            return s = o.sent(), [2, new r.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    displayPrice: R(e.displayPrice)
                                }
                            })]
                    }
                })
            })
        }, t.prototype.subscriptionsV2GetProductDisplayPrice = function(e, t) {
            return w(this, void 0, void 0, function() {
                return S(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.subscriptionsV2GetProductDisplayPriceRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.subscriptionsV2GetProductPaymentMetadataRaw = function(e, t) {
            return w(this, void 0, void 0, function() {
                var i, n, s;
                return S(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new r.RequiredError("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetProductPaymentMetadata.");
                            if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new r.RequiredError("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetProductPaymentMetadata.");
                            return i = {}, n = {}, [4, this.request({
                                path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/payment-metadata".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/payment-metadata",
                                method: "GET",
                                headers: n,
                                query: i
                            }, t)];
                        case 1:
                            return s = o.sent(), [2, new r.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    paymentMethods: e.paymentMethods.map(g),
                                    paymentProviders: e.paymentProviders.map(x)
                                }
                            })]
                    }
                })
            })
        }, t.prototype.subscriptionsV2GetProductPaymentMetadata = function(e, t) {
            return w(this, void 0, void 0, function() {
                return S(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.subscriptionsV2GetProductPaymentMetadataRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.subscriptionsV2GetSubscriptionProductInfoRaw = function(e, t) {
            return w(this, void 0, void 0, function() {
                var i, n, s;
                return S(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new r.RequiredError("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetSubscriptionProductInfo.");
                            if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new r.RequiredError("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetSubscriptionProductInfo.");
                            return i = {}, n = {}, [4, this.request({
                                path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}",
                                method: "GET",
                                headers: n,
                                query: i
                            }, t)];
                        case 1:
                            return s = o.sent(), [2, new r.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    subscriptionProductInfo: k(e.subscriptionProductInfo)
                                }
                            })]
                    }
                })
            })
        }, t.prototype.subscriptionsV2GetSubscriptionProductInfo = function(e, t) {
            return w(this, void 0, void 0, function() {
                return S(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.subscriptionsV2GetSubscriptionProductInfoRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.subscriptionsV2ListAvailableSubscriptionProductsRaw = function(e, t) {
            return w(this, void 0, void 0, function() {
                var i, n, s;
                return S(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return i = {}, void 0 !== e.productType && (i.ProductType = e.productType), void 0 !== e.includePurchased && (i.IncludePurchased = e.includePurchased), void 0 !== e.includeBundles && (i.IncludeBundles = e.includeBundles), void 0 !== e.purchasePlatform && (i.PurchasePlatform = e.purchasePlatform), void 0 !== e.skipEligibilityCheck && (i.SkipEligibilityCheck = e.skipEligibilityCheck), void 0 !== e.grantType && (i.GrantType = e.grantType), void 0 !== e.paymentProvider && (i.PaymentProvider = e.paymentProvider), n = {}, [4, this.request({
                                path: "/v2/products",
                                schemaPath: "/v2/products",
                                method: "GET",
                                headers: n,
                                query: i
                            }, t)];
                        case 1:
                            return s = o.sent(), [2, new r.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    productKeys: e.productKeys.map(q),
                                    products: e.products.map(k)
                                }
                            })]
                    }
                })
            })
        }, t.prototype.subscriptionsV2ListAvailableSubscriptionProducts = function() {
            return w(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), S(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.subscriptionsV2ListAvailableSubscriptionProductsRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.subscriptionsV2ListSubscriptionsRaw = function(e, t) {
            return w(this, void 0, void 0, function() {
                var i, n, s;
                return S(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return i = {}, void 0 !== e.productType && (i.ProductType = e.productType), void 0 !== e.expirationTimestampMsStart && (i.ExpirationTimestampMsStart = e.expirationTimestampMsStart), void 0 !== e.expirationTimestampMsEnd && (i.ExpirationTimestampMsEnd = e.expirationTimestampMsEnd), void 0 !== e.cursor && (i.Cursor = e.cursor), void 0 !== e.resultsPerPage && (i.ResultsPerPage = e.resultsPerPage), n = {}, [4, this.request({
                                path: "/v2/user/subscriptions",
                                schemaPath: "/v2/user/subscriptions",
                                method: "GET",
                                headers: n,
                                query: i
                            }, t)];
                        case 1:
                            return s = o.sent(), [2, new r.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    subscriptions: e.subscriptions.map(C),
                                    hasMore: e.hasMore,
                                    cursor: e.cursor
                                }
                            })]
                    }
                })
            })
        }, t.prototype.subscriptionsV2ListSubscriptions = function() {
            return w(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), S(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.subscriptionsV2ListSubscriptionsRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.subscriptionsV2PreparePurchaseV2Raw = function(e, t) {
            return w(this, void 0, void 0, function() {
                var i, n, s;
                return S(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new r.RequiredError("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2PreparePurchaseV2.");
                            if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new r.RequiredError("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2PreparePurchaseV2.");
                            return i = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxUniverseId && null !== e.robloxUniverseId && (n["Roblox-Universe-Id"] = String(e.robloxUniverseId)), [4, this.request({
                                path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/prepare-purchase".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/prepare-purchase",
                                method: "POST",
                                headers: n,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        paymentProvider: e.paymentProvider,
                                        universeId: e.universeId,
                                        paymentProviderPurchaseOptions: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                stripePurchaseOptions: function(e) {
                                                    if (void 0 !== e) return null === e ? null : {
                                                        cancelUrlPathName: e.cancelUrlPathName,
                                                        successUrlPathName: e.successUrlPathName
                                                    }
                                                }(e.stripePurchaseOptions),
                                                appleAppStorePurchaseOptions: function(e) {
                                                    if (void 0 !== e) return null === e ? null : {
                                                        providerCountryCode: e.providerCountryCode
                                                    }
                                                }(e.appleAppStorePurchaseOptions),
                                                braintreePurchaseOptions: function(e) {
                                                    if (void 0 !== e) return null === e ? null : {
                                                        paymentMethod: e.paymentMethod
                                                    }
                                                }(e.braintreePurchaseOptions)
                                            }
                                        }(e.paymentProviderPurchaseOptions),
                                        paymentSessionId: e.paymentSessionId
                                    }
                                }(e.preparePurchaseV2Request)
                            }, t)];
                        case 1:
                            return s = o.sent(), [2, new r.JSONApiResponse(s, function(e) {
                                var t, i, n, s, o, a;
                                return null == e ? e : {
                                    paymentProvider: x(e.paymentProvider),
                                    providerPurchasePayload: null == (t = e.providerPurchasePayload) ? t : {
                                        stripePurchasePayload: (0, r.exists)(t, "stripePurchasePayload") ? null == (i = t.stripePurchasePayload) ? i : {
                                            checkoutUrl: i.checkoutUrl
                                        } : void 0,
                                        appleAppStorePurchasePayload: (0, r.exists)(t, "appleAppStorePurchasePayload") ? null == (n = t.appleAppStorePurchasePayload) ? n : {
                                            appAccountToken: n.appAccountToken,
                                            partnerBillingJwtToken: n.partnerBillingJwtToken,
                                            partnerBillingGenericProductId: n.partnerBillingGenericProductId
                                        } : void 0,
                                        googlePlayStorePurchasePayload: (0, r.exists)(t, "googlePlayStorePurchasePayload") ? null == (s = t.googlePlayStorePurchasePayload) ? s : {
                                            providerProductId: s.providerProductId,
                                            providerProductType: s.providerProductType,
                                            chargeRequestId: s.chargeRequestId,
                                            offerId: (0, r.exists)(s, "offerId") ? s.offerId : void 0
                                        } : void 0,
                                        creditBalancePurchasePayload: (0, r.exists)(t, "creditBalancePurchasePayload") ? null == (o = t.creditBalancePurchasePayload) ? o : {
                                            checkoutUrl: o.checkoutUrl
                                        } : void 0,
                                        braintreePurchasePayload: (0, r.exists)(t, "braintreePurchasePayload") ? null == (a = t.braintreePurchasePayload) ? a : {
                                            productToken: a.productToken,
                                            price: a.price,
                                            currencyCode: a.currencyCode,
                                            clientAuthorizationToken: a.clientAuthorizationToken
                                        } : void 0
                                    },
                                    nativeProviderPurchasePayloadString: e.nativeProviderPurchasePayloadString
                                }
                            })]
                    }
                })
            })
        }, t.prototype.subscriptionsV2PreparePurchaseV2 = function(e, t) {
            return w(this, void 0, void 0, function() {
                return S(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.subscriptionsV2PreparePurchaseV2Raw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t
    }(r.BaseAPI);
    e.s(["ProductType", 0, {
        DeveloperSubscription: "DeveloperSubscription",
        CurrencySubscription: "CurrencySubscription",
        Blackbird: "Blackbird"
    }, "SubscriptionsV2Api", 0, A], 160312);
    let G = new A((0, l.createClientConfiguration)("subscriptions", "bedev2"));
    e.s(["default", 0, {
        listSubscriptions: e => G.subscriptionsV2ListSubscriptions(e)
    }], 987047)
}, 28918, e => {
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

    function i(e, t, r, i) {
        return new(r || (r = Promise))(function(n, s) {
            function o(e) {
                try {
                    u(i.next(e))
                } catch (e) {
                    s(e)
                }
            }

            function a(e) {
                try {
                    u(i.throw(e))
                } catch (e) {
                    s(e)
                }
            }

            function u(e) {
                var t;
                e.done ? n(e.value) : ((t = e.value) instanceof r ? t : new r(function(e) {
                    e(t)
                })).then(o, a)
            }
            u((i = i.apply(e, t || [])).next())
        })
    }

    function n(e, t) {
        var r, i, n, s = {
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
                var c = [a, u];
                if (r) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, c[0] && (s = 0)), s;) try {
                    if (r = 1, i && (n = 2 & c[0] ? i.return : c[0] ? i.throw || ((n = i.return) && n.call(i), 0) : i.next) && !(n = n.call(i, c[1])).done) return n;
                    switch (i = 0, n && (c = [2 & c[0], n.value]), c[0]) {
                        case 0:
                        case 1:
                            n = c;
                            break;
                        case 4:
                            return s.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            s.label++, i = c[1], c = [0];
                            continue;
                        case 7:
                            c = s.ops.pop(), s.trys.pop();
                            continue;
                        default:
                            if (!(n = (n = s.trys).length > 0 && n[n.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                s = 0;
                                continue
                            }
                            if (3 === c[0] && (!n || c[1] > n[0] && c[1] < n[3])) {
                                s.label = c[1];
                                break
                            }
                            if (6 === c[0] && s.label < n[1]) {
                                s.label = n[1], n = c;
                                break
                            }
                            if (n && s.label < n[2]) {
                                s.label = n[2], s.ops.push(c);
                                break
                            }
                            n[2] && s.ops.pop(), s.trys.pop();
                            continue
                    }
                    c = t.call(e, s)
                } catch (e) {
                    c = [6, e], i = 0
                } finally {
                    r = n = 0
                }
                if (5 & c[0]) throw c[1];
                return {
                    value: c[0] ? c[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function s(e) {
        var r, i;
        return null == (r = e) ? r : {
            collectibleItemInstanceId: (0, t.exists)(r, "collectibleItemInstanceId") ? r.collectibleItemInstanceId : void 0,
            renter: (0, t.exists)(r, "renter") ? null == (i = r.renter) ? i : {
                id: (0, t.exists)(i, "id") ? i.id : void 0,
                name: (0, t.exists)(i, "name") ? i.name : void 0
            } : void 0,
            timeRemainingInSeconds: (0, t.exists)(r, "timeRemainingInSeconds") ? r.timeRemainingInSeconds : void 0
        }
    }

    function o(e) {
        var r;
        return null == (r = e) ? r : {
            offerId: (0, t.exists)(r, "offerId") ? r.offerId : void 0,
            localizedDescription: (0, t.exists)(r, "localizedDescription") ? r.localizedDescription : void 0,
            selected: (0, t.exists)(r, "selected") ? r.selected : void 0
        }
    }

    function a(e) {
        var r;
        return null == (r = e) ? r : {
            message: (0, t.exists)(r, "message") ? r.message : void 0,
            code: (0, t.exists)(r, "code") ? r.code : void 0
        }
    }

    function u(e) {
        var r;
        return null == (r = e) ? r : {
            robuxDiscountAmount: (0, t.exists)(r, "robuxDiscountAmount") ? r.robuxDiscountAmount : void 0,
            robuxDiscountPercentage: (0, t.exists)(r, "robuxDiscountPercentage") ? r.robuxDiscountPercentage : void 0,
            discountCampaign: (0, t.exists)(r, "discountCampaign") ? r.discountCampaign : void 0,
            localizedDiscountAttribution: (0, t.exists)(r, "localizedDiscountAttribution") ? r.localizedDiscountAttribution : void 0,
            discountType: (0, t.exists)(r, "discountType") ? r.discountType : void 0,
            discountId: (0, t.exists)(r, "discountId") ? r.discountId : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function c(e, r) {
        return null == e ? e : {
            originalPrice: (0, t.exists)(e, "originalPrice") ? e.originalPrice : void 0,
            totalDiscountPercentage: (0, t.exists)(e, "totalDiscountPercentage") ? e.totalDiscountPercentage : void 0,
            totalDiscountAmount: (0, t.exists)(e, "totalDiscountAmount") ? e.totalDiscountAmount : void 0,
            discounts: (0, t.exists)(e, "discounts") ? null === e.discounts ? null : e.discounts.map(u) : void 0
        }
    }

    function l(e) {
        var r;
        return null == (r = e) ? r : {
            collectibleItemId: (0, t.exists)(r, "collectibleItemId") ? r.collectibleItemId : void 0,
            priceInRobux: (0, t.exists)(r, "priceInRobux") ? r.priceInRobux : void 0,
            regularPriceInRobux: (0, t.exists)(r, "regularPriceInRobux") ? r.regularPriceInRobux : void 0,
            discountInformation: (0, t.exists)(r, "discountInformation") ? c(r.discountInformation) : void 0
        }
    }

    function d(e) {
        if (void 0 !== e) return null === e ? null : {
            collectibleItemId: e.collectibleItemId,
            isPermanent: e.isPermanent,
            rentalDays: e.rentalDays
        }
    }

    function p(e) {
        var r, i;
        return null == (r = e) ? r : {
            icon: (0, t.exists)(r, "icon") ? r.icon : void 0,
            localizedText: (0, t.exists)(r, "localizedText") ? r.localizedText : void 0,
            offerId: (0, t.exists)(r, "offerId") ? r.offerId : void 0,
            offerStatus: (0, t.exists)(r, "offerStatus") ? r.offerStatus : void 0,
            modal: (0, t.exists)(r, "modal") ? null == (i = r.modal) ? i : {
                modalHeroIcon: (0, t.exists)(i, "modalHeroIcon") ? i.modalHeroIcon : void 0,
                modalTitle: (0, t.exists)(i, "modalTitle") ? i.modalTitle : void 0,
                offerBodyLinkText: (0, t.exists)(i, "offerBodyLinkText") ? i.offerBodyLinkText : void 0,
                termsModalTitle: (0, t.exists)(i, "termsModalTitle") ? i.termsModalTitle : void 0,
                termsBody: (0, t.exists)(i, "termsBody") ? i.termsBody : void 0
            } : void 0
        }
    }

    function f(e) {
        var r;
        return null == (r = e) ? r : {
            collectibleItemId: (0, t.exists)(r, "collectibleItemId") ? r.collectibleItemId : void 0,
            collectibleProductId: (0, t.exists)(r, "collectibleProductId") ? r.collectibleProductId : void 0,
            targetId: (0, t.exists)(r, "targetId") ? r.targetId : void 0,
            targetType: (0, t.exists)(r, "targetType") ? r.targetType : void 0,
            universeId: (0, t.exists)(r, "universeId") ? r.universeId : void 0,
            status: (0, t.exists)(r, "status") ? r.status : void 0
        }
    }

    function v(e) {
        var r;
        return null == (r = e) ? r : {
            collectibleInstanceId: (0, t.exists)(r, "collectibleInstanceId") ? r.collectibleInstanceId : void 0,
            collectibleItemId: (0, t.exists)(r, "collectibleItemId") ? r.collectibleItemId : void 0,
            collectibleProductId: (0, t.exists)(r, "collectibleProductId") ? r.collectibleProductId : void 0,
            serialNumber: (0, t.exists)(r, "serialNumber") ? r.serialNumber : void 0,
            isHeld: (0, t.exists)(r, "isHeld") ? r.isHeld : void 0,
            saleState: (0, t.exists)(r, "saleState") ? r.saleState : void 0,
            price: (0, t.exists)(r, "price") ? r.price : void 0,
            discountInformation: (0, t.exists)(r, "discountInformation") ? c(r.discountInformation) : void 0
        }
    }

    function h(e) {
        var r;
        return null == (r = e) ? r : {
            priceFloor: (0, t.exists)(r, "priceFloor") ? r.priceFloor : void 0
        }
    }

    function m(e) {
        var r;
        return null == (r = e) ? r : {
            value: (0, t.exists)(r, "value") ? r.value : void 0,
            date: (0, t.exists)(r, "date") ? new Date(r.date) : void 0
        }
    }

    function b(e) {
        var r;
        return null == (r = e) ? r : {
            rentalDays: (0, t.exists)(r, "rentalDays") ? r.rentalDays : void 0,
            priceInRobux: (0, t.exists)(r, "priceInRobux") ? r.priceInRobux : void 0,
            discountInformation: (0, t.exists)(r, "discountInformation") ? c(r.discountInformation) : void 0
        }
    }

    function I(e) {
        var r, i;
        return null == (r = e) ? r : {
            collectibleProductId: (0, t.exists)(r, "collectibleProductId") ? r.collectibleProductId : void 0,
            collectibleItemInstanceId: (0, t.exists)(r, "collectibleItemInstanceId") ? r.collectibleItemInstanceId : void 0,
            seller: (0, t.exists)(r, "seller") ? null == (i = r.seller) ? i : {
                hasVerifiedBadge: (0, t.exists)(i, "hasVerifiedBadge") ? i.hasVerifiedBadge : void 0,
                sellerId: (0, t.exists)(i, "sellerId") ? i.sellerId : void 0,
                sellerType: (0, t.exists)(i, "sellerType") ? i.sellerType : void 0,
                name: (0, t.exists)(i, "name") ? i.name : void 0
            } : void 0,
            price: (0, t.exists)(r, "price") ? r.price : void 0,
            serialNumber: (0, t.exists)(r, "serialNumber") ? r.serialNumber : void 0,
            errorMessage: (0, t.exists)(r, "errorMessage") ? r.errorMessage : void 0,
            discountInformation: (0, t.exists)(r, "discountInformation") ? c(r.discountInformation) : void 0,
            rentalOptions: (0, t.exists)(r, "rentalOptions") ? null === r.rentalOptions ? null : r.rentalOptions.map(b) : void 0
        }
    }

    function P(e, r) {
        return null == e ? e : {
            purchaseResult: (0, t.exists)(e, "purchaseResult") ? e.purchaseResult : void 0,
            purchased: (0, t.exists)(e, "purchased") ? e.purchased : void 0,
            pending: (0, t.exists)(e, "pending") ? e.pending : void 0,
            errorMessage: (0, t.exists)(e, "errorMessage") ? e.errorMessage : void 0,
            reason: (0, t.exists)(e, "reason") ? e.reason : void 0
        }
    }
    let y = new(function(e) {
        function u() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function i() {
                this.constructor = e
            }
            r(e, t), e.prototype = null === t ? Object.create(t) : (i.prototype = t.prototype, new i)
        }(u, e), u.prototype.marketplaceSalesCheckCreationAccessRaw = function(e) {
            return i(this, void 0, void 0, function() {
                var r, i, s;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return r = {}, i = {}, [4, this.request({
                                path: "/v1/item/check-creation-access",
                                schemaPath: "/v1/item/check-creation-access",
                                method: "GET",
                                headers: i,
                                query: r
                            }, e)];
                        case 1:
                            return s = n.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    accessAllowed: (0, t.exists)(e, "accessAllowed") ? e.accessAllowed : void 0,
                                    daysToUnblock: (0, t.exists)(e, "daysToUnblock") ? e.daysToUnblock : void 0
                                }
                            })]
                    }
                })
            })
        }, u.prototype.marketplaceSalesCheckCreationAccess = function(e) {
            return i(this, void 0, void 0, function() {
                return n(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.marketplaceSalesCheckCreationAccessRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, u.prototype.marketplaceSalesGeneratePurchaseAuthTokenRaw = function(e, r) {
            return i(this, void 0, void 0, function() {
                var i, s, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.itemId || void 0 === e.itemId) throw new t.RequiredError("itemId", "Required parameter requestParameters.itemId was null or undefined when calling marketplaceSalesGeneratePurchaseAuthToken.");
                            if (null === e.marketplaceSalesGeneratePurchaseAuthTokenRequest || void 0 === e.marketplaceSalesGeneratePurchaseAuthTokenRequest) throw new t.RequiredError("marketplaceSalesGeneratePurchaseAuthTokenRequest", "Required parameter requestParameters.marketplaceSalesGeneratePurchaseAuthTokenRequest was null or undefined when calling marketplaceSalesGeneratePurchaseAuthToken.");
                            return i = {}, (s = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (s["Roblox-Place-Id"] = String(e.robloxPlaceId)), void 0 !== e.robloxGameId && null !== e.robloxGameId && (s["Roblox-Game-Id"] = String(e.robloxGameId)), [4, this.request({
                                path: "/v1/item/{itemId}/generate-purchase-auth-token".replace("{".concat("itemId", "}"), encodeURIComponent(String(e.itemId))),
                                schemaPath: "/v1/item/{itemId}/generate-purchase-auth-token",
                                method: "POST",
                                headers: s,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        purchaserId: e.purchaserId,
                                        purchaserType: e.purchaserType,
                                        idempotencyKey: e.idempotencyKey,
                                        collectibleProductId: e.collectibleProductId
                                    }
                                }(e.marketplaceSalesGeneratePurchaseAuthTokenRequest)
                            }, r)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    purchaseAuthToken: (0, t.exists)(e, "purchaseAuthToken") ? e.purchaseAuthToken : void 0
                                }
                            })]
                    }
                })
            })
        }, u.prototype.marketplaceSalesGeneratePurchaseAuthToken = function(e, t) {
            return i(this, void 0, void 0, function() {
                return n(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.marketplaceSalesGeneratePurchaseAuthTokenRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, u.prototype.marketplaceSalesGetCartPricingRaw = function(e, r) {
            return i(this, void 0, void 0, function() {
                var i, s, u;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.marketplaceSalesGetCartPricingRequest || void 0 === e.marketplaceSalesGetCartPricingRequest) throw new t.RequiredError("marketplaceSalesGetCartPricingRequest", "Required parameter requestParameters.marketplaceSalesGetCartPricingRequest was null or undefined when calling marketplaceSalesGetCartPricing.");
                            return i = {}, (s = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/cart-pricing",
                                schemaPath: "/v1/cart-pricing",
                                method: "POST",
                                headers: s,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        items: e.items.map(d),
                                        featureKey: e.featureKey,
                                        unselectedOffers: e.unselectedOffers
                                    }
                                }(e.marketplaceSalesGetCartPricingRequest)
                            }, r)];
                        case 1:
                            return u = n.sent(), [2, new t.JSONApiResponse(u, function(e) {
                                return null == e ? e : {
                                    items: (0, t.exists)(e, "items") ? null === e.items ? null : e.items.map(l) : void 0,
                                    savingsSummary: (0, t.exists)(e, "savingsSummary") ? e.savingsSummary : void 0,
                                    availableOffers: (0, t.exists)(e, "availableOffers") ? null === e.availableOffers ? null : e.availableOffers.map(o) : void 0,
                                    errors: (0, t.exists)(e, "errors") ? null === e.errors ? null : e.errors.map(a) : void 0
                                }
                            })]
                    }
                })
            })
        }, u.prototype.marketplaceSalesGetCartPricing = function(e, t) {
            return i(this, void 0, void 0, function() {
                return n(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.marketplaceSalesGetCartPricingRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, u.prototype.marketplaceSalesGetItemResaleDataRaw = function(e, r) {
            return i(this, void 0, void 0, function() {
                var i, s, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.itemId || void 0 === e.itemId) throw new t.RequiredError("itemId", "Required parameter requestParameters.itemId was null or undefined when calling marketplaceSalesGetItemResaleData.");
                            return i = {}, s = {}, [4, this.request({
                                path: "/v1/item/{itemId}/resale-data".replace("{".concat("itemId", "}"), encodeURIComponent(String(e.itemId))),
                                schemaPath: "/v1/item/{itemId}/resale-data",
                                method: "GET",
                                headers: s,
                                query: i
                            }, r)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    priceDataPoints: (0, t.exists)(e, "priceDataPoints") ? null === e.priceDataPoints ? null : e.priceDataPoints.map(m) : void 0,
                                    volumeDataPoints: (0, t.exists)(e, "volumeDataPoints") ? null === e.volumeDataPoints ? null : e.volumeDataPoints.map(m) : void 0,
                                    recentAveragePrice: (0, t.exists)(e, "recentAveragePrice") ? e.recentAveragePrice : void 0
                                }
                            })]
                    }
                })
            })
        }, u.prototype.marketplaceSalesGetItemResaleData = function(e, t) {
            return i(this, void 0, void 0, function() {
                return n(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.marketplaceSalesGetItemResaleDataRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, u.prototype.marketplaceSalesGetItemResellableInstancesRaw = function(e, r) {
            return i(this, void 0, void 0, function() {
                var i, s, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.itemId || void 0 === e.itemId) throw new t.RequiredError("itemId", "Required parameter requestParameters.itemId was null or undefined when calling marketplaceSalesGetItemResellableInstances.");
                            return i = {}, void 0 !== e.ownerId && (i.OwnerId = e.ownerId), void 0 !== e.ownerType && (i.OwnerType = e.ownerType), void 0 !== e.cursor && (i.Cursor = e.cursor), void 0 !== e.limit && (i.Limit = e.limit), s = {}, [4, this.request({
                                path: "/v1/item/{itemId}/resellable-instances".replace("{".concat("itemId", "}"), encodeURIComponent(String(e.itemId))),
                                schemaPath: "/v1/item/{itemId}/resellable-instances",
                                method: "GET",
                                headers: s,
                                query: i
                            }, r)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    itemInstances: (0, t.exists)(e, "itemInstances") ? null === e.itemInstances ? null : e.itemInstances.map(v) : void 0,
                                    previousPageCursor: (0, t.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                    nextPageCursor: (0, t.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0
                                }
                            })]
                    }
                })
            })
        }, u.prototype.marketplaceSalesGetItemResellableInstances = function(e, t) {
            return i(this, void 0, void 0, function() {
                return n(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.marketplaceSalesGetItemResellableInstancesRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, u.prototype.marketplaceSalesGetItemResellersRaw = function(e, r) {
            return i(this, void 0, void 0, function() {
                var i, s, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.itemId || void 0 === e.itemId) throw new t.RequiredError("itemId", "Required parameter requestParameters.itemId was null or undefined when calling marketplaceSalesGetItemResellers.");
                            return i = {}, void 0 !== e.cursor && (i.Cursor = e.cursor), void 0 !== e.limit && (i.Limit = e.limit), s = {}, [4, this.request({
                                path: "/v1/item/{itemId}/resellers".replace("{".concat("itemId", "}"), encodeURIComponent(String(e.itemId))),
                                schemaPath: "/v1/item/{itemId}/resellers",
                                method: "GET",
                                headers: s,
                                query: i
                            }, r)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    data: (0, t.exists)(e, "data") ? null === e.data ? null : e.data.map(I) : void 0,
                                    previousPageCursor: (0, t.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                    nextPageCursor: (0, t.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0
                                }
                            })]
                    }
                })
            })
        }, u.prototype.marketplaceSalesGetItemResellers = function(e, t) {
            return i(this, void 0, void 0, function() {
                return n(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.marketplaceSalesGetItemResellersRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, u.prototype.marketplaceSalesGetOffersForUserRaw = function(e, r) {
            return i(this, void 0, void 0, function() {
                var i, s, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling marketplaceSalesGetOffersForUser.");
                            if (null === e.featureKey || void 0 === e.featureKey) throw new t.RequiredError("featureKey", "Required parameter requestParameters.featureKey was null or undefined when calling marketplaceSalesGetOffersForUser.");
                            return i = {}, void 0 !== e.userId && (i.userId = e.userId), void 0 !== e.featureKey && (i.featureKey = e.featureKey), void 0 !== e.offerId && (i.offerId = e.offerId), s = {}, [4, this.request({
                                path: "/v1/offers",
                                schemaPath: "/v1/offers",
                                method: "GET",
                                headers: s,
                                query: i
                            }, r)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    offers: (0, t.exists)(e, "offers") ? null === e.offers ? null : e.offers.map(p) : void 0
                                }
                            })]
                    }
                })
            })
        }, u.prototype.marketplaceSalesGetOffersForUser = function(e, t) {
            return i(this, void 0, void 0, function() {
                return n(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.marketplaceSalesGetOffersForUserRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, u.prototype.marketplaceSalesGetResaleParametersRaw = function(e, r) {
            return i(this, void 0, void 0, function() {
                var i, s, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.itemId || void 0 === e.itemId) throw new t.RequiredError("itemId", "Required parameter requestParameters.itemId was null or undefined when calling marketplaceSalesGetResaleParameters.");
                            return i = {}, s = {}, [4, this.request({
                                path: "/v1/item/{itemId}/get-resale-parameters".replace("{".concat("itemId", "}"), encodeURIComponent(String(e.itemId))),
                                schemaPath: "/v1/item/{itemId}/get-resale-parameters",
                                method: "GET",
                                headers: s,
                                query: i
                            }, r)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    resalePercentageFee: (0, t.exists)(e, "resalePercentageFee") ? e.resalePercentageFee : void 0,
                                    minimumFee: (0, t.exists)(e, "minimumFee") ? e.minimumFee : void 0,
                                    resellableLimitedItemPriceFloors: (0, t.exists)(e, "resellableLimitedItemPriceFloors") ? null === e.resellableLimitedItemPriceFloors ? null : (0, t.mapValues)(e.resellableLimitedItemPriceFloors, h) : void 0,
                                    priceFloor: (0, t.exists)(e, "priceFloor") ? e.priceFloor : void 0
                                }
                            })]
                    }
                })
            })
        }, u.prototype.marketplaceSalesGetResaleParameters = function(e, t) {
            return i(this, void 0, void 0, function() {
                return n(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.marketplaceSalesGetResaleParametersRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, u.prototype.marketplaceSalesGetResellerRentalStatusRaw = function(e, r) {
            return i(this, void 0, void 0, function() {
                var i, o, a;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.itemId || void 0 === e.itemId) throw new t.RequiredError("itemId", "Required parameter requestParameters.itemId was null or undefined when calling marketplaceSalesGetResellerRentalStatus.");
                            return i = {}, o = {}, [4, this.request({
                                path: "/v1/item/{itemId}/reseller-rental-status".replace("{".concat("itemId", "}"), encodeURIComponent(String(e.itemId))),
                                schemaPath: "/v1/item/{itemId}/reseller-rental-status",
                                method: "GET",
                                headers: o,
                                query: i
                            }, r)];
                        case 1:
                            return a = n.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    data: (0, t.exists)(e, "data") ? null === e.data ? null : e.data.map(s) : void 0
                                }
                            })]
                    }
                })
            })
        }, u.prototype.marketplaceSalesGetResellerRentalStatus = function(e, t) {
            return i(this, void 0, void 0, function() {
                return n(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.marketplaceSalesGetResellerRentalStatusRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, u.prototype.marketplaceSalesGetUniverseProductConfigurationRaw = function(e, r) {
            return i(this, void 0, void 0, function() {
                var i, s, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling marketplaceSalesGetUniverseProductConfiguration.");
                            if (null === e.targetType || void 0 === e.targetType) throw new t.RequiredError("targetType", "Required parameter requestParameters.targetType was null or undefined when calling marketplaceSalesGetUniverseProductConfiguration.");
                            if (null === e.targetId || void 0 === e.targetId) throw new t.RequiredError("targetId", "Required parameter requestParameters.targetId was null or undefined when calling marketplaceSalesGetUniverseProductConfiguration.");
                            return i = {}, s = {}, [4, this.request({
                                path: "/v1/universe/{universeId}/targetType/{targetType}/targets/{targetId}/universe-product-configuration".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("targetType", "}"), encodeURIComponent(String(e.targetType))).replace("{".concat("targetId", "}"), encodeURIComponent(String(e.targetId))),
                                schemaPath: "/v1/universe/{universeId}/targetType/{targetType}/targets/{targetId}/universe-product-configuration",
                                method: "GET",
                                headers: s,
                                query: i
                            }, r)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    _configuration: (0, t.exists)(e, "configuration") ? f(e.configuration) : void 0
                                }
                            })]
                    }
                })
            })
        }, u.prototype.marketplaceSalesGetUniverseProductConfiguration = function(e, t) {
            return i(this, void 0, void 0, function() {
                return n(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.marketplaceSalesGetUniverseProductConfigurationRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, u.prototype.marketplaceSalesListUniverseProductConfigurationsRaw = function(e, r) {
            return i(this, void 0, void 0, function() {
                var i, s, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling marketplaceSalesListUniverseProductConfigurations.");
                            if (null === e.status || void 0 === e.status) throw new t.RequiredError("status", "Required parameter requestParameters.status was null or undefined when calling marketplaceSalesListUniverseProductConfigurations.");
                            return i = {}, void 0 !== e.cursor && (i.Cursor = e.cursor), void 0 !== e.limit && (i.Limit = e.limit), s = {}, [4, this.request({
                                path: "/v1/universe/{universeId}/status/{status}/universe-product-configurations".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("status", "}"), encodeURIComponent(String(e.status))),
                                schemaPath: "/v1/universe/{universeId}/status/{status}/universe-product-configurations",
                                method: "GET",
                                headers: s,
                                query: i
                            }, r)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    data: (0, t.exists)(e, "data") ? null === e.data ? null : e.data.map(f) : void 0,
                                    previousPageCursor: (0, t.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                    nextPageCursor: (0, t.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                    hasMore: (0, t.exists)(e, "hasMore") ? e.hasMore : void 0
                                }
                            })]
                    }
                })
            })
        }, u.prototype.marketplaceSalesListUniverseProductConfigurations = function(e, t) {
            return i(this, void 0, void 0, function() {
                return n(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.marketplaceSalesListUniverseProductConfigurationsRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, u.prototype.marketplaceSalesPurchaseItemRaw = function(e, r) {
            return i(this, void 0, void 0, function() {
                var i, s, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.itemId || void 0 === e.itemId) throw new t.RequiredError("itemId", "Required parameter requestParameters.itemId was null or undefined when calling marketplaceSalesPurchaseItem.");
                            if (null === e.marketplaceSalesPurchaseItemRequest || void 0 === e.marketplaceSalesPurchaseItemRequest) throw new t.RequiredError("marketplaceSalesPurchaseItemRequest", "Required parameter requestParameters.marketplaceSalesPurchaseItemRequest was null or undefined when calling marketplaceSalesPurchaseItem.");
                            return i = {}, (s = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (s["Roblox-Place-Id"] = String(e.robloxPlaceId)), void 0 !== e.robloxGameId && null !== e.robloxGameId && (s["Roblox-Game-Id"] = String(e.robloxGameId)), [4, this.request({
                                path: "/v1/item/{itemId}/purchase-item".replace("{".concat("itemId", "}"), encodeURIComponent(String(e.itemId))),
                                schemaPath: "/v1/item/{itemId}/purchase-item",
                                method: "POST",
                                headers: s,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        expectedCurrency: e.expectedCurrency,
                                        expectedPrice: e.expectedPrice,
                                        expectedPurchaserId: e.expectedPurchaserId,
                                        expectedPurchaserType: e.expectedPurchaserType,
                                        collectibleProductId: e.collectibleProductId,
                                        placeId: e.placeId,
                                        idempotencyKey: e.idempotencyKey,
                                        purchaseAuthToken: e.purchaseAuthToken,
                                        rentalOptionDays: e.rentalOptionDays,
                                        offerIds: e.offerIds
                                    }
                                }(e.marketplaceSalesPurchaseItemRequest)
                            }, r)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return P(e)
                            })]
                    }
                })
            })
        }, u.prototype.marketplaceSalesPurchaseItem = function(e, t) {
            return i(this, void 0, void 0, function() {
                return n(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.marketplaceSalesPurchaseItemRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, u.prototype.marketplaceSalesPurchaseResaleRaw = function(e, r) {
            return i(this, void 0, void 0, function() {
                var i, s, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.itemId || void 0 === e.itemId) throw new t.RequiredError("itemId", "Required parameter requestParameters.itemId was null or undefined when calling marketplaceSalesPurchaseResale.");
                            if (null === e.marketplaceSalesPurchaseResaleRequest || void 0 === e.marketplaceSalesPurchaseResaleRequest) throw new t.RequiredError("marketplaceSalesPurchaseResaleRequest", "Required parameter requestParameters.marketplaceSalesPurchaseResaleRequest was null or undefined when calling marketplaceSalesPurchaseResale.");
                            return i = {}, (s = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (s["Roblox-Place-Id"] = String(e.robloxPlaceId)), void 0 !== e.robloxGameId && null !== e.robloxGameId && (s["Roblox-Game-Id"] = String(e.robloxGameId)), [4, this.request({
                                path: "/v1/item/{itemId}/purchase-resale".replace("{".concat("itemId", "}"), encodeURIComponent(String(e.itemId))),
                                schemaPath: "/v1/item/{itemId}/purchase-resale",
                                method: "POST",
                                headers: s,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        expectedCurrency: e.expectedCurrency,
                                        expectedPrice: e.expectedPrice,
                                        expectedPurchaserId: e.expectedPurchaserId,
                                        expectedPurchaserType: e.expectedPurchaserType,
                                        collectibleProductId: e.collectibleProductId,
                                        collectibleItemInstanceId: e.collectibleItemInstanceId,
                                        idempotencyKey: e.idempotencyKey,
                                        purchaseAuthToken: e.purchaseAuthToken,
                                        rentalDays: e.rentalDays
                                    }
                                }(e.marketplaceSalesPurchaseResaleRequest)
                            }, r)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return P(e)
                            })]
                    }
                })
            })
        }, u.prototype.marketplaceSalesPurchaseResale = function(e, t) {
            return i(this, void 0, void 0, function() {
                return n(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.marketplaceSalesPurchaseResaleRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, u.prototype.marketplaceSalesUpdateSaleRaw = function(e, r) {
            return i(this, void 0, void 0, function() {
                var i, s, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.itemId || void 0 === e.itemId) throw new t.RequiredError("itemId", "Required parameter requestParameters.itemId was null or undefined when calling marketplaceSalesUpdateSale.");
                            if (null === e.itemInstanceId || void 0 === e.itemInstanceId) throw new t.RequiredError("itemInstanceId", "Required parameter requestParameters.itemInstanceId was null or undefined when calling marketplaceSalesUpdateSale.");
                            if (null === e.marketplaceSalesUpdateSaleRequest || void 0 === e.marketplaceSalesUpdateSaleRequest) throw new t.RequiredError("marketplaceSalesUpdateSaleRequest", "Required parameter requestParameters.marketplaceSalesUpdateSaleRequest was null or undefined when calling marketplaceSalesUpdateSale.");
                            return i = {}, (s = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/item/{itemId}/instance/{itemInstanceId}/resale".replace("{".concat("itemId", "}"), encodeURIComponent(String(e.itemId))).replace("{".concat("itemInstanceId", "}"), encodeURIComponent(String(e.itemInstanceId))),
                                schemaPath: "/v1/item/{itemId}/instance/{itemInstanceId}/resale",
                                method: "PATCH",
                                headers: s,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        price: e.price,
                                        sellerId: e.sellerId,
                                        sellerType: e.sellerType,
                                        isOnSale: e.isOnSale,
                                        collectibleProductId: e.collectibleProductId,
                                        isRentalOptIn: e.isRentalOptIn
                                    }
                                }(e.marketplaceSalesUpdateSaleRequest)
                            }, r)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    updateSaleResult: (0, t.exists)(e, "updateSaleResult") ? e.updateSaleResult : void 0
                                }
                            })]
                    }
                })
            })
        }, u.prototype.marketplaceSalesUpdateSale = function(e, t) {
            return i(this, void 0, void 0, function() {
                return n(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.marketplaceSalesUpdateSaleRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, u.prototype.marketplaceSalesUpdateUniverseProductConfigurationRaw = function(e, r) {
            return i(this, void 0, void 0, function() {
                var i, s, o;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.marketplaceSalesUpdateUniverseProductConfigurationRequest || void 0 === e.marketplaceSalesUpdateUniverseProductConfigurationRequest) throw new t.RequiredError("marketplaceSalesUpdateUniverseProductConfigurationRequest", "Required parameter requestParameters.marketplaceSalesUpdateUniverseProductConfigurationRequest was null or undefined when calling marketplaceSalesUpdateUniverseProductConfiguration.");
                            return i = {}, (s = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/universe-product-configuration",
                                schemaPath: "/v1/universe-product-configuration",
                                method: "POST",
                                headers: s,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        configuration: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                collectibleItemId: e.collectibleItemId,
                                                collectibleProductId: e.collectibleProductId,
                                                targetId: e.targetId,
                                                targetType: e.targetType,
                                                universeId: e.universeId,
                                                status: e.status
                                            }
                                        }(e._configuration)
                                    }
                                }(e.marketplaceSalesUpdateUniverseProductConfigurationRequest)
                            }, r)];
                        case 1:
                            return o = n.sent(), [2, new t.JSONApiResponse(o)]
                    }
                })
            })
        }, u.prototype.marketplaceSalesUpdateUniverseProductConfiguration = function(e, t) {
            return i(this, void 0, void 0, function() {
                return n(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.marketplaceSalesUpdateUniverseProductConfigurationRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, u
    }(t.BaseAPI))((0, e.i(272593).createClientConfiguration)("marketplace-sales", "bedev2"));
    e.s(["default", 0, {
        getUniverseProductConfiguration: async function(e, t) {
            let r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "Asset";
            return y.marketplaceSalesGetUniverseProductConfiguration({
                universeId: e,
                targetId: t,
                targetType: r
            })
        },
        listUniverseProductConfigurations: async (e, t, r, i) => y.marketplaceSalesListUniverseProductConfigurations({
            universeId: e,
            status: t,
            limit: null != r ? r : 0,
            cursor: i
        }),
        checkCreationAccess: async () => y.marketplaceSalesCheckCreationAccess(),
        updateUniverseProductConfiguration: async function(e, t, r, i, n) {
            let s = arguments.length > 5 && void 0 !== arguments[5] ? arguments[5] : "Asset";
            await y.marketplaceSalesUpdateUniverseProductConfiguration({
                marketplaceSalesUpdateUniverseProductConfigurationRequest: {
                    _configuration: {
                        universeId: e,
                        targetType: s,
                        targetId: t,
                        status: r,
                        collectibleItemId: i,
                        collectibleProductId: n
                    }
                }
            })
        }
    }], 28918)
}, 109543, e => {
    "use strict";
    let t = (0, e.i(416340).createContext)({
        ageBracket: void 0,
        verifiedAgeData: void 0,
        creationAccessMetadata: void 0,
        userSubscription: void 0,
        blackbirdSubscription: void 0
    });
    t.displayName = "VerificationMetadata", e.s(["default", 0, t, "hasPremiumSubscription", 0, function(e) {
        try {
            var t, r;
            if (!e) return !1;
            let i = null == (r = e.userSubscription) || null == (t = r.subscriptionProductModel) ? void 0 : t.robuxStipendAmount;
            return null != e.blackbirdSubscription || null != i && i >= 1e3
        } catch (e) {
            return !1
        }
    }, "isUserAgeVerified", 0, function(e) {
        var t, r;
        return !!e && (null == (t = e.ageBracket) ? void 0 : t.ageBracket) !== 1 && (null == (r = e.verifiedAgeData) ? void 0 : r.isVerified) === !0
    }])
}, 675330, e => {
    "use strict";
    var t = e.i(221628),
        r = e.i(416340),
        i = e.i(711367),
        n = e.i(157310),
        s = e.i(814975),
        o = e.i(644746),
        a = e.i(28918),
        u = e.i(35701),
        c = e.i(987047),
        l = e.i(160312),
        d = e.i(790806),
        p = e.i(109543);
    e.s(["default", 0, e => {
        let {
            children: f
        } = e, {
            user: v
        } = (0, s.useAuthentication)(), {
            data: h
        } = (0, n.useQuery)({
            queryKey: ["creations", "creationAccess"],
            queryFn: () => a.default.checkCreationAccess()
        }), {
            data: m
        } = (0, n.useQuery)({
            queryKey: ["creations", "verifiedAge"],
            queryFn: () => o.default.isUserAgeVerified()
        }), {
            data: b
        } = (0, n.useQuery)({
            queryKey: ["creations", "ageBracket"],
            queryFn: () => d.default.getAgeBracket()
        }), {
            data: I
        } = (0, n.useQuery)({
            queryKey: ["creations", "userSubscription", null == v ? void 0 : v.id],
            queryFn: (null == v ? void 0 : v.id) != null ? () => u.default.getUserSubscription(v.id) : i.skipToken
        }), {
            data: P
        } = (0, n.useQuery)({
            queryKey: ["creations", "blackbirdSubscription"],
            queryFn: async () => {
                var e, t;
                let r = await c.default.listSubscriptions({
                    productType: l.ProductType.Blackbird,
                    expirationTimestampMsStart: Date.now(),
                    resultsPerPage: 1
                });
                return null != (e = null == r || null == (t = r.subscriptions) ? void 0 : t[0]) ? e : void 0
            }
        }), y = (0, r.useMemo)(() => ({
            ageBracket: b,
            verifiedAgeData: m,
            creationAccessMetadata: h,
            userSubscription: I,
            blackbirdSubscription: P
        }), [b, m, h, I, P]);
        return (0, t.jsx)(p.default.Provider, {
            value: y,
            children: f
        })
    }])
}]);

//# debugId=7f816484-c6a1-db80-e365-5689697fa45b
//# sourceMappingURL=0cwb_67clygxr.js.map