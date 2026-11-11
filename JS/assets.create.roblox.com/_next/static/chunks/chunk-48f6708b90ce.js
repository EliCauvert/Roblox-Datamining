;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "2074ca67-8fcd-3b46-c501-dd619ff55754")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 644746, 35701, 756392, 987047, e => {
    "use strict";
    var r = e.i(805290),
        t = e.i(415858),
        i = function(e, r) {
            return (i = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, r) {
                e.__proto__ = r
            } || function(e, r) {
                for (var t in r) Object.prototype.hasOwnProperty.call(r, t) && (e[t] = r[t])
            })(e, r)
        };

    function n(e, r) {
        if ("function" != typeof r && null !== r) throw TypeError("Class extends value " + String(r) + " is not a constructor or null");

        function t() {
            this.constructor = e
        }
        i(e, r), e.prototype = null === r ? Object.create(r) : (t.prototype = r.prototype, new t)
    }

    function o(e, r, t, i) {
        return new(t || (t = Promise))(function(n, o) {
            function s(e) {
                try {
                    a(i.next(e))
                } catch (e) {
                    o(e)
                }
            }

            function u(e) {
                try {
                    a(i.throw(e))
                } catch (e) {
                    o(e)
                }
            }

            function a(e) {
                var r;
                e.done ? n(e.value) : ((r = e.value) instanceof t ? r : new t(function(e) {
                    e(r)
                })).then(s, u)
            }
            a((i = i.apply(e, r || [])).next())
        })
    }

    function s(e, r) {
        var t, i, n, o = {
                label: 0,
                sent: function() {
                    if (1 & n[0]) throw n[1];
                    return n[1]
                },
                trys: [],
                ops: []
            },
            s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return s.next = u(0), s.throw = u(1), s.return = u(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
            return this
        }), s;

        function u(u) {
            return function(a) {
                var c = [u, a];
                if (t) throw TypeError("Generator is already executing.");
                for (; s && (s = 0, c[0] && (o = 0)), o;) try {
                    if (t = 1, i && (n = 2 & c[0] ? i.return : c[0] ? i.throw || ((n = i.return) && n.call(i), 0) : i.next) && !(n = n.call(i, c[1])).done) return n;
                    switch (i = 0, n && (c = [2 & c[0], n.value]), c[0]) {
                        case 0:
                        case 1:
                            n = c;
                            break;
                        case 4:
                            return o.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            o.label++, i = c[1], c = [0];
                            continue;
                        case 7:
                            c = o.ops.pop(), o.trys.pop();
                            continue;
                        default:
                            if (!(n = (n = o.trys).length > 0 && n[n.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === c[0] && (!n || c[1] > n[0] && c[1] < n[3])) {
                                o.label = c[1];
                                break
                            }
                            if (6 === c[0] && o.label < n[1]) {
                                o.label = n[1], n = c;
                                break
                            }
                            if (n && o.label < n[2]) {
                                o.label = n[2], o.ops.push(c);
                                break
                            }
                            n[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    c = r.call(e, o)
                } catch (e) {
                    c = [6, e], i = 0
                } finally {
                    t = n = 0
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
    var u = t._;

    function a() {
        return null !== u && u.apply(this, arguments) || this
    }
    n(a, u), a.prototype.veriffVerificationGetVerificationStatusRaw = function(e, r) {
        return o(this, void 0, void 0, function() {
            var i, n, o;
            return s(this, function(s) {
                switch (s.label) {
                    case 0:
                        return i = {}, void 0 !== e.token && (i.token = e.token), n = {}, [4, this.request({
                            path: "/v1/veriff-id-verification/verified-status",
                            schemaPath: "/v1/veriff-id-verification/verified-status",
                            method: "GET",
                            headers: n,
                            query: i
                        }, r)];
                    case 1:
                        return o = s.sent(), [2, new t.V(o)]
                }
            })
        })
    }, a.prototype.veriffVerificationGetVerificationStatus = function() {
        return o(this, arguments, void 0, function(e, r) {
            return void 0 === e && (e = {}), s(this, function(t) {
                switch (t.label) {
                    case 0:
                        return [4, this.veriffVerificationGetVerificationStatusRaw(e, r)];
                    case 1:
                        return t.sent(), [2]
                }
            })
        })
    }, a.prototype.veriffVerificationStartVerificationRaw = function(e, r) {
        return o(this, void 0, void 0, function() {
            var i, n, o;
            return s(this, function(s) {
                switch (s.label) {
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
                        }, r)];
                    case 1:
                        return o = s.sent(), [2, new t.V(o)]
                }
            })
        })
    }, a.prototype.veriffVerificationStartVerification = function() {
        return o(this, arguments, void 0, function(e, r) {
            return void 0 === e && (e = {}), s(this, function(t) {
                switch (t.label) {
                    case 0:
                        return [4, this.veriffVerificationStartVerificationRaw(e, r)];
                    case 1:
                        return t.sent(), [2]
                }
            })
        })
    }, a.prototype.veriffVerificationUpdateVerificationRaw = function(e, r) {
        return o(this, void 0, void 0, function() {
            var i, n, o;
            return s(this, function(s) {
                switch (s.label) {
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
                        }, r)];
                    case 1:
                        return o = s.sent(), [2, new t.V(o)]
                }
            })
        })
    }, a.prototype.veriffVerificationUpdateVerification = function() {
        return o(this, arguments, void 0, function(e, r) {
            return void 0 === e && (e = {}), s(this, function(t) {
                switch (t.label) {
                    case 0:
                        return [4, this.veriffVerificationUpdateVerificationRaw(e, r)];
                    case 1:
                        return t.sent(), [2]
                }
            })
        })
    }, a.prototype.veriffVerificationUpdateVerificationActionRaw = function(e, r) {
        return o(this, void 0, void 0, function() {
            var i, n, o;
            return s(this, function(s) {
                switch (s.label) {
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
                        }, r)];
                    case 1:
                        return o = s.sent(), [2, new t.V(o)]
                }
            })
        })
    }, a.prototype.veriffVerificationUpdateVerificationAction = function() {
        return o(this, arguments, void 0, function(e, r) {
            return void 0 === e && (e = {}), s(this, function(t) {
                switch (t.label) {
                    case 0:
                        return [4, this.veriffVerificationUpdateVerificationActionRaw(e, r)];
                    case 1:
                        return t.sent(), [2]
                }
            })
        })
    };
    var c = function(e) {
            function r() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(r, e), r.prototype.verifiedAgeGetRealIDHashForUserRaw = function(e, r) {
                return o(this, void 0, void 0, function() {
                    var i, n, o;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return i = {}, void 0 !== e.userId && (i.userId = e.userId), n = {}, [4, this.request({
                                    path: "/v1/age-verification/realid-hash-for-user",
                                    schemaPath: "/v1/age-verification/realid-hash-for-user",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, r)];
                            case 1:
                                return o = s.sent(), [2, new t.H(o, function(e) {
                                    var r, i, n;
                                    return null == e ? e : {
                                        realIdHash: (0, t.u)(e, "realIdHash") ? null == (r = e.realIdHash) ? r : {
                                            value: (0, t.u)(r, "value") ? r.value : void 0,
                                            type: (0, t.u)(r, "type") ? null == (i = r.type) ? i : {
                                                nativeType: (0, t.u)(i, "nativeType") ? null == (n = i.nativeType) ? n : {
                                                    name: (0, t.u)(n, "name") ? n.name : void 0
                                                } : void 0,
                                                name: (0, t.u)(i, "name") ? i.name : void 0
                                            } : void 0
                                        } : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.verifiedAgeGetRealIDHashForUser = function() {
                return o(this, arguments, void 0, function(e, r) {
                    return void 0 === e && (e = {}), s(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.verifiedAgeGetRealIDHashForUserRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, r.prototype.verifiedAgeGetSessionUrlRaw = function(e, r) {
                return o(this, void 0, void 0, function() {
                    var i, n, o;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return i = {}, void 0 !== e.identifier && (i.identifier = e.identifier), n = {}, [4, this.request({
                                    path: "/v1/age-verification/session-url",
                                    schemaPath: "/v1/age-verification/session-url",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, r)];
                            case 1:
                                return o = s.sent(), [2, new t.V(o)]
                        }
                    })
                })
            }, r.prototype.verifiedAgeGetSessionUrl = function() {
                return o(this, arguments, void 0, function(e, r) {
                    return void 0 === e && (e = {}), s(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.verifiedAgeGetSessionUrlRaw(e, r)];
                            case 1:
                                return t.sent(), [2]
                        }
                    })
                })
            }, r.prototype.verifiedAgeGetUsersForRealIDHashRaw = function(e, r) {
                return o(this, void 0, void 0, function() {
                    var i, n, o;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return i = {}, void 0 !== e.hash && (i.hash = e.hash), void 0 !== e.limit && (i.Limit = e.limit), void 0 !== e.cursor && (i.Cursor = e.cursor), n = {}, [4, this.request({
                                    path: "/v1/age-verification/users-for-realid-hash",
                                    schemaPath: "/v1/age-verification/users-for-realid-hash",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, r)];
                            case 1:
                                return o = s.sent(), [2, new t.H(o, function(e) {
                                    return null == e ? e : {
                                        userIds: (0, t.u)(e, "userIds") ? e.userIds : void 0,
                                        nextCursor: (0, t.u)(e, "nextCursor") ? e.nextCursor : void 0,
                                        previousCursor: (0, t.u)(e, "previousCursor") ? e.previousCursor : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.verifiedAgeGetUsersForRealIDHash = function() {
                return o(this, arguments, void 0, function(e, r) {
                    return void 0 === e && (e = {}), s(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.verifiedAgeGetUsersForRealIDHashRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, r.prototype.verifiedAgeGetVerifiedAgeRaw = function(e) {
                return o(this, void 0, void 0, function() {
                    var r, i, n;
                    return s(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return r = {}, i = {}, [4, this.request({
                                    path: "/v1/age-verification/verified-age",
                                    schemaPath: "/v1/age-verification/verified-age",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, e)];
                            case 1:
                                return n = o.sent(), [2, new t.H(n, function(e) {
                                    return null == e ? e : {
                                        isVerified: (0, t.u)(e, "isVerified") ? e.isVerified : void 0,
                                        verifiedAge: (0, t.u)(e, "verifiedAge") ? e.verifiedAge : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.verifiedAgeGetVerifiedAge = function(e) {
                return o(this, void 0, void 0, function() {
                    return s(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.verifiedAgeGetVerifiedAgeRaw(e)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r
        }(t._),
        d = e.i(272593);
    let l = new class {
        isUserAgeVerified() {
            return this.ageVerificationApi.verifiedAgeGetVerifiedAge()
        }
        constructor() {
            (0, r._)(this, "ageVerificationApi", void 0), this.ageVerificationApi = new c((0, d.f)("age-verification-service", "bedev2"))
        }
    };
    e.s(["f", 0, l], 644746);
    var p = function(e, r) {
        return (p = Object.setPrototypeOf || ({
            __proto__: []
        }) instanceof Array && function(e, r) {
            e.__proto__ = r
        } || function(e, r) {
            for (var t in r) Object.prototype.hasOwnProperty.call(r, t) && (e[t] = r[t])
        })(e, r)
    };

    function f(e, r) {
        if ("function" != typeof r && null !== r) throw TypeError("Class extends value " + String(r) + " is not a constructor or null");

        function t() {
            this.constructor = e
        }
        p(e, r), e.prototype = null === r ? Object.create(r) : (t.prototype = r.prototype, new t)
    }

    function v(e, r, t, i) {
        return new(t || (t = Promise))(function(n, o) {
            function s(e) {
                try {
                    a(i.next(e))
                } catch (e) {
                    o(e)
                }
            }

            function u(e) {
                try {
                    a(i.throw(e))
                } catch (e) {
                    o(e)
                }
            }

            function a(e) {
                var r;
                e.done ? n(e.value) : ((r = e.value) instanceof t ? r : new t(function(e) {
                    e(r)
                })).then(s, u)
            }
            a((i = i.apply(e, r || [])).next())
        })
    }

    function h(e, r) {
        var t, i, n, o = {
                label: 0,
                sent: function() {
                    if (1 & n[0]) throw n[1];
                    return n[1]
                },
                trys: [],
                ops: []
            },
            s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return s.next = u(0), s.throw = u(1), s.return = u(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
            return this
        }), s;

        function u(u) {
            return function(a) {
                var c = [u, a];
                if (t) throw TypeError("Generator is already executing.");
                for (; s && (s = 0, c[0] && (o = 0)), o;) try {
                    if (t = 1, i && (n = 2 & c[0] ? i.return : c[0] ? i.throw || ((n = i.return) && n.call(i), 0) : i.next) && !(n = n.call(i, c[1])).done) return n;
                    switch (i = 0, n && (c = [2 & c[0], n.value]), c[0]) {
                        case 0:
                        case 1:
                            n = c;
                            break;
                        case 4:
                            return o.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            o.label++, i = c[1], c = [0];
                            continue;
                        case 7:
                            c = o.ops.pop(), o.trys.pop();
                            continue;
                        default:
                            if (!(n = (n = o.trys).length > 0 && n[n.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === c[0] && (!n || c[1] > n[0] && c[1] < n[3])) {
                                o.label = c[1];
                                break
                            }
                            if (6 === c[0] && o.label < n[1]) {
                                o.label = n[1], n = c;
                                break
                            }
                            if (n && o.label < n[2]) {
                                o.label = n[2], o.ops.push(c);
                                break
                            }
                            n[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    c = r.call(e, o)
                } catch (e) {
                    c = [6, e], i = 0
                } finally {
                    t = n = 0
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
    var b = t._;

    function y() {
        return null !== b && b.apply(this, arguments) || this
    }
    f(y, b), y.prototype.v1ProductsGetRaw = function(e, r) {
        return v(this, void 0, void 0, function() {
            var i, n, o;
            return h(this, function(s) {
                switch (s.label) {
                    case 0:
                        return i = {}, void 0 !== e.typeName && (i.typeName = e.typeName), void 0 !== e.flowTypeName && (i.flowTypeName = e.flowTypeName), void 0 !== e.skipPremiumUserCheck && (i.skipPremiumUserCheck = e.skipPremiumUserCheck), n = {}, [4, this.request({
                            path: "/v1/products",
                            schemaPath: "/v1/products",
                            method: "GET",
                            headers: n,
                            query: i
                        }, r)];
                    case 1:
                        return o = s.sent(), [2, new t.V(o)]
                }
            })
        })
    }, y.prototype.v1ProductsGet = function() {
        return v(this, arguments, void 0, function(e, r) {
            return void 0 === e && (e = {}), h(this, function(t) {
                switch (t.label) {
                    case 0:
                        return [4, this.v1ProductsGetRaw(e, r)];
                    case 1:
                        return t.sent(), [2]
                }
            })
        })
    };
    var P = function(e) {
        function r() {
            return null !== e && e.apply(this, arguments) || this
        }
        return f(r, e), r.prototype.v1UsersUserIdPremiumUpsellPrecheckGetRaw = function(e, r) {
            return v(this, void 0, void 0, function() {
                var i, n, o;
                return h(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.w("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdPremiumUpsellPrecheckGet.");
                            if (null === e.universeId || void 0 === e.universeId) throw new t.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UsersUserIdPremiumUpsellPrecheckGet.");
                            if (null === e.placeId || void 0 === e.placeId) throw new t.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v1UsersUserIdPremiumUpsellPrecheckGet.");
                            return i = {}, void 0 !== e.universeId && (i.universeId = e.universeId), void 0 !== e.placeId && (i.placeId = e.placeId), n = {}, [4, this.request({
                                path: "/v1/users/{userId}/premium-upsell-precheck".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v1/users/{userId}/premium-upsell-precheck",
                                method: "GET",
                                headers: n,
                                query: i
                            }, r)];
                        case 1:
                            return o = s.sent(), [2, new t.V(o)]
                    }
                })
            })
        }, r.prototype.v1UsersUserIdPremiumUpsellPrecheckGet = function(e, r) {
            return v(this, void 0, void 0, function() {
                return h(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1UsersUserIdPremiumUpsellPrecheckGetRaw(e, r)];
                        case 1:
                            return t.sent(), [2]
                    }
                })
            })
        }, r.prototype.v1UsersUserIdSubscriptionsCancelPostRaw = function(e, r) {
            return v(this, void 0, void 0, function() {
                var i, n, o;
                return h(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.w("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdSubscriptionsCancelPost.");
                            return i = {}, n = {}, [4, this.request({
                                path: "/v1/users/{userId}/subscriptions/cancel".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v1/users/{userId}/subscriptions/cancel",
                                method: "POST",
                                headers: n,
                                query: i
                            }, r)];
                        case 1:
                            return o = s.sent(), [2, new t.V(o)]
                    }
                })
            })
        }, r.prototype.v1UsersUserIdSubscriptionsCancelPost = function(e, r) {
            return v(this, void 0, void 0, function() {
                return h(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1UsersUserIdSubscriptionsCancelPostRaw(e, r)];
                        case 1:
                            return t.sent(), [2]
                    }
                })
            })
        }, r.prototype.v1UsersUserIdSubscriptionsDetailsGetRaw = function(e, r) {
            return v(this, void 0, void 0, function() {
                var i, n, o;
                return h(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.w("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdSubscriptionsDetailsGet.");
                            return i = {}, n = {}, [4, this.request({
                                path: "/v1/users/{userId}/subscriptions/details".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v1/users/{userId}/subscriptions/details",
                                method: "GET",
                                headers: n,
                                query: i
                            }, r)];
                        case 1:
                            return o = s.sent(), [2, new t.V(o)]
                    }
                })
            })
        }, r.prototype.v1UsersUserIdSubscriptionsDetailsGet = function(e, r) {
            return v(this, void 0, void 0, function() {
                return h(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1UsersUserIdSubscriptionsDetailsGetRaw(e, r)];
                        case 1:
                            return t.sent(), [2]
                    }
                })
            })
        }, r.prototype.v1UsersUserIdSubscriptionsGetRaw = function(e, r) {
            return v(this, void 0, void 0, function() {
                var i, n, o;
                return h(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.w("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdSubscriptionsGet.");
                            return i = {}, n = {}, [4, this.request({
                                path: "/v1/users/{userId}/subscriptions".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v1/users/{userId}/subscriptions",
                                method: "GET",
                                headers: n,
                                query: i
                            }, r)];
                        case 1:
                            return o = s.sent(), [2, new t.H(o, function(e) {
                                var r;
                                return null == e ? e : {
                                    subscriptionProductModel: (0, t.u)(e, "subscriptionProductModel") ? null == (r = e.subscriptionProductModel) ? r : {
                                        premiumFeatureId: (0, t.u)(r, "premiumFeatureId") ? r.premiumFeatureId : void 0,
                                        subscriptionTypeName: (0, t.u)(r, "subscriptionTypeName") ? r.subscriptionTypeName : void 0,
                                        robuxStipendAmount: (0, t.u)(r, "robuxStipendAmount") ? r.robuxStipendAmount : void 0,
                                        isLifetime: (0, t.u)(r, "isLifetime") ? r.isLifetime : void 0,
                                        expiration: (0, t.u)(r, "expiration") ? new Date(r.expiration) : void 0,
                                        renewal: (0, t.u)(r, "renewal") ? new Date(r.renewal) : void 0,
                                        renewedSince: (0, t.u)(r, "renewedSince") ? new Date(r.renewedSince) : void 0,
                                        created: (0, t.u)(r, "created") ? new Date(r.created) : void 0,
                                        purchasePlatform: (0, t.u)(r, "purchasePlatform") ? r.purchasePlatform : void 0,
                                        subscriptionName: (0, t.u)(r, "subscriptionName") ? r.subscriptionName : void 0
                                    } : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.v1UsersUserIdSubscriptionsGet = function(e, r) {
            return v(this, void 0, void 0, function() {
                return h(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1UsersUserIdSubscriptionsGetRaw(e, r)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, r.prototype.v1UsersUserIdSubscriptionsMetadataGetRaw = function(e, r) {
            return v(this, void 0, void 0, function() {
                var i, n, o;
                return h(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.w("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdSubscriptionsMetadataGet.");
                            return i = {}, n = {}, [4, this.request({
                                path: "/v1/users/{userId}/subscriptions/metadata".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v1/users/{userId}/subscriptions/metadata",
                                method: "GET",
                                headers: n,
                                query: i
                            }, r)];
                        case 1:
                            return o = s.sent(), [2, new t.H(o, function(e) {
                                return null == e ? e : {
                                    expiration: (0, t.u)(e, "Expiration") ? new Date(e.Expiration) : void 0,
                                    computerSubscriptionRenewal: (0, t.u)(e, "ComputerSubscriptionRenewal") ? new Date(e.ComputerSubscriptionRenewal) : void 0,
                                    appleSubscriptionRenewal: (0, t.u)(e, "AppleSubscriptionRenewal") ? new Date(e.AppleSubscriptionRenewal) : void 0,
                                    googleSubscriptionRenewal: (0, t.u)(e, "GoogleSubscriptionRenewal") ? new Date(e.GoogleSubscriptionRenewal) : void 0,
                                    numRobuxText: (0, t.u)(e, "NumRobuxText") ? e.NumRobuxText : void 0,
                                    membershipName: (0, t.u)(e, "MembershipName") ? e.MembershipName : void 0,
                                    membershipDuration: (0, t.u)(e, "MembershipDuration") ? e.MembershipDuration : void 0,
                                    premiumFeatureId: (0, t.u)(e, "PremiumFeatureId") ? e.PremiumFeatureId : void 0,
                                    stipendFrequency: (0, t.u)(e, "StipendFrequency") ? e.StipendFrequency : void 0,
                                    appleCancellationDirectionsUrl: (0, t.u)(e, "AppleCancellationDirectionsUrl") ? e.AppleCancellationDirectionsUrl : void 0,
                                    googleCancellationDirectionsUrl: (0, t.u)(e, "GoogleCancellationDirectionsUrl") ? e.GoogleCancellationDirectionsUrl : void 0,
                                    robuxEarnedFromSales: (0, t.u)(e, "RobuxEarnedFromSales") ? e.RobuxEarnedFromSales : void 0,
                                    salesEarningsVisible: (0, t.u)(e, "SalesEarningsVisible") ? e.SalesEarningsVisible : void 0,
                                    robuxEarningsVisible: (0, t.u)(e, "RobuxEarningsVisible") ? e.RobuxEarningsVisible : void 0,
                                    userIsSubscribedToAccountProduct: (0, t.u)(e, "UserIsSubscribedToAccountProduct") ? e.UserIsSubscribedToAccountProduct : void 0,
                                    userIsInPromotionNoCancelWindow: (0, t.u)(e, "UserIsInPromotionNoCancelWindow") ? e.UserIsInPromotionNoCancelWindow : void 0,
                                    promotionNoCancelTerm: (0, t.u)(e, "PromotionNoCancelTerm") ? e.PromotionNoCancelTerm : void 0,
                                    userRenewalIsProcessing: (0, t.u)(e, "UserRenewalIsProcessing") ? e.UserRenewalIsProcessing : void 0,
                                    userHasMultipleActiveSubscriptions: (0, t.u)(e, "UserHasMultipleActiveSubscriptions") ? e.UserHasMultipleActiveSubscriptions : void 0,
                                    userHasComputerSubscription: (0, t.u)(e, "UserHasComputerSubscription") ? e.UserHasComputerSubscription : void 0,
                                    userHasAppleAppStoreSubscription: (0, t.u)(e, "UserHasAppleAppStoreSubscription") ? e.UserHasAppleAppStoreSubscription : void 0,
                                    userHasGooglePlayStoreSubscription: (0, t.u)(e, "UserHasGooglePlayStoreSubscription") ? e.UserHasGooglePlayStoreSubscription : void 0,
                                    robloxSupportUrl: (0, t.u)(e, "RobloxSupportUrl") ? e.RobloxSupportUrl : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.v1UsersUserIdSubscriptionsMetadataGet = function(e, r) {
            return v(this, void 0, void 0, function() {
                return h(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1UsersUserIdSubscriptionsMetadataGetRaw(e, r)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, r.prototype.v1UsersUserIdValidateMembershipGetRaw = function(e, r) {
            return v(this, void 0, void 0, function() {
                var i, n, o;
                return h(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.w("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdValidateMembershipGet.");
                            return i = {}, n = {}, [4, this.request({
                                path: "/v1/users/{userId}/validate-membership".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v1/users/{userId}/validate-membership",
                                method: "GET",
                                headers: n,
                                query: i
                            }, r)];
                        case 1:
                            return o = s.sent(), [2, new t.V(o)]
                    }
                })
            })
        }, r.prototype.v1UsersUserIdValidateMembershipGet = function(e, r) {
            return v(this, void 0, void 0, function() {
                return h(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1UsersUserIdValidateMembershipGetRaw(e, r)];
                        case 1:
                            return t.sent(), [2]
                    }
                })
            })
        }, r.prototype.v1UsersUserIdValidateMembershipRccGetRaw = function(e, r) {
            return v(this, void 0, void 0, function() {
                var i, n, o;
                return h(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.w("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdValidateMembershipRccGet.");
                            return i = {}, n = {}, [4, this.request({
                                path: "/v1/users/{userId}/validate-membership-rcc".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v1/users/{userId}/validate-membership-rcc",
                                method: "GET",
                                headers: n,
                                query: i
                            }, r)];
                        case 1:
                            return o = s.sent(), [2, new t.V(o)]
                    }
                })
            })
        }, r.prototype.v1UsersUserIdValidateMembershipRccGet = function(e, r) {
            return v(this, void 0, void 0, function() {
                return h(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1UsersUserIdValidateMembershipRccGetRaw(e, r)];
                        case 1:
                            return t.sent(), [2]
                    }
                })
            })
        }, r
    }(t._);
    let m = new class {
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
            (0, r._)(this, "premiumFeaturesUsersApi", void 0), this.premiumFeaturesUsersApi = new P((0, d.f)("premiumfeatures", "bedev1"))
        }
    };
    e.s(["f", 0, m], 35701);
    var w = function(e, r) {
        return (w = Object.setPrototypeOf || ({
            __proto__: []
        }) instanceof Array && function(e, r) {
            e.__proto__ = r
        } || function(e, r) {
            for (var t in r) Object.prototype.hasOwnProperty.call(r, t) && (e[t] = r[t])
        })(e, r)
    };

    function I(e, r, t, i) {
        return new(t || (t = Promise))(function(n, o) {
            function s(e) {
                try {
                    a(i.next(e))
                } catch (e) {
                    o(e)
                }
            }

            function u(e) {
                try {
                    a(i.throw(e))
                } catch (e) {
                    o(e)
                }
            }

            function a(e) {
                var r;
                e.done ? n(e.value) : ((r = e.value) instanceof t ? r : new t(function(e) {
                    e(r)
                })).then(s, u)
            }
            a((i = i.apply(e, r || [])).next())
        })
    }

    function S(e, r) {
        var t, i, n, o = {
                label: 0,
                sent: function() {
                    if (1 & n[0]) throw n[1];
                    return n[1]
                },
                trys: [],
                ops: []
            },
            s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return s.next = u(0), s.throw = u(1), s.return = u(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
            return this
        }), s;

        function u(u) {
            return function(a) {
                var c = [u, a];
                if (t) throw TypeError("Generator is already executing.");
                for (; s && (s = 0, c[0] && (o = 0)), o;) try {
                    if (t = 1, i && (n = 2 & c[0] ? i.return : c[0] ? i.throw || ((n = i.return) && n.call(i), 0) : i.next) && !(n = n.call(i, c[1])).done) return n;
                    switch (i = 0, n && (c = [2 & c[0], n.value]), c[0]) {
                        case 0:
                        case 1:
                            n = c;
                            break;
                        case 4:
                            return o.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            o.label++, i = c[1], c = [0];
                            continue;
                        case 7:
                            c = o.ops.pop(), o.trys.pop();
                            continue;
                        default:
                            if (!(n = (n = o.trys).length > 0 && n[n.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === c[0] && (!n || c[1] > n[0] && c[1] < n[3])) {
                                o.label = c[1];
                                break
                            }
                            if (6 === c[0] && o.label < n[1]) {
                                o.label = n[1], n = c;
                                break
                            }
                            if (n && o.label < n[2]) {
                                o.label = n[2], o.ops.push(c);
                                break
                            }
                            n[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    c = r.call(e, o)
                } catch (e) {
                    c = [6, e], i = 0
                } finally {
                    t = n = 0
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

    function T(e, r) {
        return null == e ? e : {
            currencyCode: e.currencyCode,
            units: e.units,
            nanos: e.nanos
        }
    }

    function U(e) {
        return e
    }

    function R(e) {
        var r, i;
        return null == (r = e) ? r : {
            offerType: (0, t.u)(r, "offerType") ? r.offerType : void 0,
            freeTrialOffer: (0, t.u)(r, "freeTrialOffer") ? null == (i = r.freeTrialOffer) ? i : {
                periodType: i.periodType,
                duration: i.duration,
                estimatedTrialEndDate: (0, t.u)(i, "estimatedTrialEndDate") ? null === i.estimatedTrialEndDate ? null : new Date(i.estimatedTrialEndDate) : void 0
            } : void 0
        }
    }

    function V(e) {
        var r;
        return null == (r = e) ? r : {
            type: r.type,
            id: r.id
        }
    }

    function q(e) {
        var r;
        return null == (r = e) ? r : {
            tierId: r.tierId,
            periodIndex: r.periodIndex,
            discountPercent: r.discountPercent
        }
    }

    function G(e) {
        var r, i, n, o, s, u, a;
        return null == (r = e) ? r : {
            productKey: V(r.productKey),
            periodType: r.periodType,
            periodCount: r.periodCount,
            localizedPrice: T(r.localizedPrice),
            localizedPriceDisplayString: r.localizedPriceDisplayString,
            localizedStrikethroughPrice: T(r.localizedStrikethroughPrice),
            localizedStrikethroughPriceDisplayString: r.localizedStrikethroughPriceDisplayString,
            productTypeDetails: null == (i = r.productTypeDetails) ? i : {
                currencySubscriptionProductDetails: (0, t.u)(i, "currencySubscriptionProductDetails") ? null == (n = i.currencySubscriptionProductDetails) ? n : {
                    currencyType: n.currencyType,
                    entitledAmountMicros: n.entitledAmountMicros
                } : void 0,
                developerSubscriptionProductDetails: (0, t.u)(i, "developerSubscriptionProductDetails") ? null == (o = i.developerSubscriptionProductDetails) ? o : {
                    universeId: o.universeId,
                    imageAssetId: o.imageAssetId,
                    localizedName: o.localizedName,
                    localizedDescription: o.localizedDescription
                } : void 0,
                robloxSubscriptionProductDetails: (0, t.u)(i, "robloxSubscriptionProductDetails") ? null == (s = i.robloxSubscriptionProductDetails) ? s : {
                    featureConfig: null == (u = s.featureConfig) ? u : {
                        virtualTransactionDiscounts: null === u.virtualTransactionDiscounts ? null : u.virtualTransactionDiscounts.map(q),
                        isRobuxTransferEnabled: u.isRobuxTransferEnabled,
                        isTradingEnabled: u.isTradingEnabled,
                        isUgcPublishingEnabled: u.isUgcPublishingEnabled,
                        privateServerDiscounts: null === u.privateServerDiscounts ? null : u.privateServerDiscounts.map(q),
                        currencySubscriptionConfig: null == (a = u.currencySubscriptionConfig) ? a : {
                            currencyType: a.currencyType,
                            entitledAmountMicros: a.entitledAmountMicros
                        }
                    }
                } : void 0
            },
            eligibleOffers: r.eligibleOffers.map(R)
        }
    }

    function A(e) {
        var r, i, n, o, s, u, a;
        return null == (r = e) ? r : {
            productKey: V(r.productKey),
            periodType: r.periodType,
            displayPrice: T(r.displayPrice),
            activationTimestampMs: r.activationTimestampMs,
            expirationTimestampMs: r.expirationTimestampMs,
            nextRenewalTimestampMs: r.nextRenewalTimestampMs,
            paymentProvider: U(r.paymentProvider),
            purchasePlatform: r.purchasePlatform,
            paymentProfile: null == (i = r.paymentProfile) ? i : {
                id: i.id,
                cardInfo: null == (n = i.cardInfo) ? n : {
                    cardNetwork: n.cardNetwork,
                    lastFourDigits: n.lastFourDigits,
                    expirationMonth: n.expirationMonth,
                    expirationYear: n.expirationYear
                }
            },
            activeOffers: r.activeOffers.map(R),
            productTypeMembershipDetails: null == (o = r.productTypeMembershipDetails) ? o : {
                robloxSubscriptionMembershipDetails: (0, t.u)(o, "robloxSubscriptionMembershipDetails") ? null == (s = o.robloxSubscriptionMembershipDetails) ? s : {
                    features: null == (u = s.features) ? u : {
                        productType: u.productType,
                        virtualTransactionDiscountTierId: u.virtualTransactionDiscountTierId,
                        isRobuxTransferEnabled: u.isRobuxTransferEnabled,
                        isTradingEnabled: u.isTradingEnabled,
                        isUgcPublishingEnabled: u.isUgcPublishingEnabled,
                        privateServerDiscountTierId: u.privateServerDiscountTierId
                    },
                    currencySubscriptionBenefit: null == (a = s.currencySubscriptionBenefit) ? a : {
                        currencyType: a.currencyType,
                        entitledAmountMicrosPerGrantingPeriod: a.entitledAmountMicrosPerGrantingPeriod,
                        grantingPeriodType: a.grantingPeriodType
                    }
                } : void 0
            },
            productInfo: G(r.productInfo)
        }
    }
    var x = function(e) {
        function r() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, r) {
            if ("function" != typeof r && null !== r) throw TypeError("Class extends value " + String(r) + " is not a constructor or null");

            function t() {
                this.constructor = e
            }
            w(e, r), e.prototype = null === r ? Object.create(r) : (t.prototype = r.prototype, new t)
        }(r, e), r.prototype.subscriptionsV2GetProductDisplayPriceRaw = function(e, r) {
            return I(this, void 0, void 0, function() {
                var i, n, o;
                return S(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new t.w("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetProductDisplayPrice.");
                            if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new t.w("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetProductDisplayPrice.");
                            return i = {}, n = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (n["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/display-price".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/display-price",
                                method: "GET",
                                headers: n,
                                query: i
                            }, r)];
                        case 1:
                            return o = s.sent(), [2, new t.H(o, function(e) {
                                return null == e ? e : {
                                    displayPrice: T(e.displayPrice)
                                }
                            })]
                    }
                })
            })
        }, r.prototype.subscriptionsV2GetProductDisplayPrice = function(e, r) {
            return I(this, void 0, void 0, function() {
                return S(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.subscriptionsV2GetProductDisplayPriceRaw(e, r)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, r.prototype.subscriptionsV2GetProductPaymentMetadataRaw = function(e, r) {
            return I(this, void 0, void 0, function() {
                var i, n, o;
                return S(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new t.w("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetProductPaymentMetadata.");
                            if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new t.w("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetProductPaymentMetadata.");
                            return i = {}, n = {}, [4, this.request({
                                path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/payment-metadata".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/payment-metadata",
                                method: "GET",
                                headers: n,
                                query: i
                            }, r)];
                        case 1:
                            return o = s.sent(), [2, new t.H(o, function(e) {
                                return null == e ? e : {
                                    paymentMethods: e.paymentMethods.map(g),
                                    paymentProviders: e.paymentProviders.map(U)
                                }
                            })]
                    }
                })
            })
        }, r.prototype.subscriptionsV2GetProductPaymentMetadata = function(e, r) {
            return I(this, void 0, void 0, function() {
                return S(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.subscriptionsV2GetProductPaymentMetadataRaw(e, r)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, r.prototype.subscriptionsV2GetSubscriptionProductInfoRaw = function(e, r) {
            return I(this, void 0, void 0, function() {
                var i, n, o;
                return S(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new t.w("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetSubscriptionProductInfo.");
                            if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new t.w("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetSubscriptionProductInfo.");
                            return i = {}, n = {}, [4, this.request({
                                path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}",
                                method: "GET",
                                headers: n,
                                query: i
                            }, r)];
                        case 1:
                            return o = s.sent(), [2, new t.H(o, function(e) {
                                return null == e ? e : {
                                    subscriptionProductInfo: G(e.subscriptionProductInfo)
                                }
                            })]
                    }
                })
            })
        }, r.prototype.subscriptionsV2GetSubscriptionProductInfo = function(e, r) {
            return I(this, void 0, void 0, function() {
                return S(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.subscriptionsV2GetSubscriptionProductInfoRaw(e, r)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, r.prototype.subscriptionsV2ListAvailableSubscriptionProductsRaw = function(e, r) {
            return I(this, void 0, void 0, function() {
                var i, n, o;
                return S(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return i = {}, void 0 !== e.productType && (i.ProductType = e.productType), void 0 !== e.includePurchased && (i.IncludePurchased = e.includePurchased), void 0 !== e.includeBundles && (i.IncludeBundles = e.includeBundles), void 0 !== e.purchasePlatform && (i.PurchasePlatform = e.purchasePlatform), void 0 !== e.skipEligibilityCheck && (i.SkipEligibilityCheck = e.skipEligibilityCheck), void 0 !== e.grantType && (i.GrantType = e.grantType), void 0 !== e.paymentProvider && (i.PaymentProvider = e.paymentProvider), n = {}, [4, this.request({
                                path: "/v2/products",
                                schemaPath: "/v2/products",
                                method: "GET",
                                headers: n,
                                query: i
                            }, r)];
                        case 1:
                            return o = s.sent(), [2, new t.H(o, function(e) {
                                return null == e ? e : {
                                    productKeys: e.productKeys.map(V),
                                    products: e.products.map(G)
                                }
                            })]
                    }
                })
            })
        }, r.prototype.subscriptionsV2ListAvailableSubscriptionProducts = function() {
            return I(this, arguments, void 0, function(e, r) {
                return void 0 === e && (e = {}), S(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.subscriptionsV2ListAvailableSubscriptionProductsRaw(e, r)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, r.prototype.subscriptionsV2ListSubscriptionsRaw = function(e, r) {
            return I(this, void 0, void 0, function() {
                var i, n, o;
                return S(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return i = {}, void 0 !== e.productType && (i.ProductType = e.productType), void 0 !== e.expirationTimestampMsStart && (i.ExpirationTimestampMsStart = e.expirationTimestampMsStart), void 0 !== e.expirationTimestampMsEnd && (i.ExpirationTimestampMsEnd = e.expirationTimestampMsEnd), void 0 !== e.cursor && (i.Cursor = e.cursor), void 0 !== e.resultsPerPage && (i.ResultsPerPage = e.resultsPerPage), n = {}, [4, this.request({
                                path: "/v2/user/subscriptions",
                                schemaPath: "/v2/user/subscriptions",
                                method: "GET",
                                headers: n,
                                query: i
                            }, r)];
                        case 1:
                            return o = s.sent(), [2, new t.H(o, function(e) {
                                return null == e ? e : {
                                    subscriptions: e.subscriptions.map(A),
                                    hasMore: e.hasMore,
                                    cursor: e.cursor
                                }
                            })]
                    }
                })
            })
        }, r.prototype.subscriptionsV2ListSubscriptions = function() {
            return I(this, arguments, void 0, function(e, r) {
                return void 0 === e && (e = {}), S(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.subscriptionsV2ListSubscriptionsRaw(e, r)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, r.prototype.subscriptionsV2PreparePurchaseV2Raw = function(e, r) {
            return I(this, void 0, void 0, function() {
                var i, n, o;
                return S(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new t.w("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2PreparePurchaseV2.");
                            if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new t.w("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2PreparePurchaseV2.");
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
                            }, r)];
                        case 1:
                            return o = s.sent(), [2, new t.H(o, function(e) {
                                var r, i, n, o, s, u;
                                return null == e ? e : {
                                    paymentProvider: U(e.paymentProvider),
                                    providerPurchasePayload: null == (r = e.providerPurchasePayload) ? r : {
                                        stripePurchasePayload: (0, t.u)(r, "stripePurchasePayload") ? null == (i = r.stripePurchasePayload) ? i : {
                                            checkoutUrl: i.checkoutUrl
                                        } : void 0,
                                        appleAppStorePurchasePayload: (0, t.u)(r, "appleAppStorePurchasePayload") ? null == (n = r.appleAppStorePurchasePayload) ? n : {
                                            appAccountToken: n.appAccountToken,
                                            partnerBillingJwtToken: n.partnerBillingJwtToken,
                                            partnerBillingGenericProductId: n.partnerBillingGenericProductId
                                        } : void 0,
                                        googlePlayStorePurchasePayload: (0, t.u)(r, "googlePlayStorePurchasePayload") ? null == (o = r.googlePlayStorePurchasePayload) ? o : {
                                            providerProductId: o.providerProductId,
                                            providerProductType: o.providerProductType,
                                            chargeRequestId: o.chargeRequestId,
                                            offerId: (0, t.u)(o, "offerId") ? o.offerId : void 0
                                        } : void 0,
                                        creditBalancePurchasePayload: (0, t.u)(r, "creditBalancePurchasePayload") ? null == (s = r.creditBalancePurchasePayload) ? s : {
                                            checkoutUrl: s.checkoutUrl
                                        } : void 0,
                                        braintreePurchasePayload: (0, t.u)(r, "braintreePurchasePayload") ? null == (u = r.braintreePurchasePayload) ? u : {
                                            productToken: u.productToken,
                                            price: u.price,
                                            currencyCode: u.currencyCode,
                                            clientAuthorizationToken: u.clientAuthorizationToken
                                        } : void 0
                                    },
                                    nativeProviderPurchasePayloadString: e.nativeProviderPurchasePayloadString
                                }
                            })]
                    }
                })
            })
        }, r.prototype.subscriptionsV2PreparePurchaseV2 = function(e, r) {
            return I(this, void 0, void 0, function() {
                return S(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.subscriptionsV2PreparePurchaseV2Raw(e, r)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, r
    }(t._);
    e.s(["V", 0, {
        DeveloperSubscription: "DeveloperSubscription",
        CurrencySubscription: "CurrencySubscription",
        Blackbird: "Blackbird"
    }, "$", 0, x], 756392);
    let C = new x((0, d.f)("subscriptions", "bedev2"));
    e.s(["f", 0, {
        listSubscriptions: e => C.subscriptionsV2ListSubscriptions(e)
    }], 987047)
}, 109543, e => {
    "use strict";
    let r = (0, e.i(643766).createContext)({
        ageBracket: void 0,
        verifiedAgeData: void 0,
        creationAccessMetadata: void 0,
        userSubscription: void 0,
        blackbirdSubscription: void 0
    });
    r.displayName = "VerificationMetadata", e.s(["U", 0, r, "t", 0, function(e) {
        try {
            var r, t;
            if (!e) return !1;
            let i = null == (t = e.userSubscription) || null == (r = t.subscriptionProductModel) ? void 0 : r.robuxStipendAmount;
            return null != e.blackbirdSubscription || null != i && i >= 1e3
        } catch (e) {
            return !1
        }
    }, "l", 0, function(e) {
        var r, t;
        return !!e && (null == (r = e.ageBracket) ? void 0 : r.ageBracket) !== 1 && (null == (t = e.verifiedAgeData) ? void 0 : t.isVerified) === !0
    }])
}, 675330, e => {
    "use strict";
    var r = e.i(785517),
        t = e.i(643766),
        i = e.i(463146),
        n = e.i(910272),
        o = e.i(814975),
        s = e.i(644746),
        u = e.i(28918),
        a = e.i(35701),
        c = e.i(987047),
        d = e.i(756392),
        l = e.i(790806),
        p = e.i(109543);
    e.s(["f", 0, e => {
        let {
            children: f
        } = e, {
            status: v,
            user: h
        } = (0, o.f)(), b = "success" === v ? null == h ? void 0 : h.id : void 0, {
            data: y
        } = (0, n.f)({
            queryKey: ["creations", "creationAccess", b],
            queryFn: () => u.f.checkCreationAccess(),
            enabled: null != b
        }), {
            data: P
        } = (0, n.f)({
            queryKey: ["creations", "verifiedAge", b],
            queryFn: () => s.f.isUserAgeVerified(),
            enabled: null != b
        }), {
            data: m
        } = (0, n.f)({
            queryKey: ["creations", "ageBracket", b],
            queryFn: () => l.U.getAgeBracket(),
            enabled: null != b
        }), {
            data: w
        } = (0, n.f)({
            queryKey: ["creations", "userSubscription", b],
            queryFn: null != b ? () => a.f.getUserSubscription(b) : i.V
        }), {
            data: I
        } = (0, n.f)({
            queryKey: ["creations", "blackbirdSubscription", b],
            queryFn: async () => {
                var e, r;
                let t = await c.f.listSubscriptions({
                    productType: d.V.Blackbird,
                    expirationTimestampMsStart: Date.now(),
                    resultsPerPage: 1
                });
                return null != (e = null == t || null == (r = t.subscriptions) ? void 0 : r[0]) ? e : void 0
            },
            enabled: null != b
        }), S = (0, t.useMemo)(() => ({
            ageBracket: m,
            verifiedAgeData: P,
            creationAccessMetadata: y,
            userSubscription: w,
            blackbirdSubscription: I
        }), [m, P, y, w, I]);
        return (0, r.jsx)(p.U.Provider, {
            value: S,
            children: f
        })
    }])
}]);

//# debugId=2074ca67-8fcd-3b46-c501-dd619ff55754
//# sourceMappingURL=2fojl8xtu02kh.js.map