;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "dc88dfc0-7dc5-0ec2-3b70-d537002b2a75")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 796701, (e, t, a) => {
    ! function() {
        "use strict";
        var e = {
                294: function(e) {
                    var t, a = "object" == typeof Reflect ? Reflect : null,
                        n = a && "function" == typeof a.apply ? a.apply : function(e, t, a) {
                            return Function.prototype.apply.call(e, t, a)
                        };
                    t = a && "function" == typeof a.ownKeys ? a.ownKeys : Object.getOwnPropertySymbols ? function(e) {
                        return Object.getOwnPropertyNames(e).concat(Object.getOwnPropertySymbols(e))
                    } : function(e) {
                        return Object.getOwnPropertyNames(e)
                    };
                    var i = Number.isNaN || function(e) {
                        return e != e
                    };

                    function r() {
                        r.init.call(this)
                    }
                    e.exports = r, e.exports.once = function(e, t) {
                        return new Promise(function(a, n) {
                            var i, r, s;

                            function o(a) {
                                e.removeListener(t, l), n(a)
                            }

                            function l() {
                                "function" == typeof e.removeListener && e.removeListener("error", o), a([].slice.call(arguments))
                            }
                            v(e, t, l, {
                                once: !0
                            }), "error" !== t && (i = e, r = o, s = {
                                once: !0
                            }, "function" == typeof i.on && v(i, "error", r, s))
                        })
                    }, r.EventEmitter = r, r.prototype._events = void 0, r.prototype._eventsCount = 0, r.prototype._maxListeners = void 0;
                    var s = 10;

                    function o(e) {
                        if ("function" != typeof e) throw TypeError('The "listener" argument must be of type Function. Received type ' + typeof e)
                    }

                    function l(e) {
                        return void 0 === e._maxListeners ? r.defaultMaxListeners : e._maxListeners
                    }

                    function u(e, t, a, n) {
                        if (o(a), void 0 === (r = e._events) ? (r = e._events = Object.create(null), e._eventsCount = 0) : (void 0 !== r.newListener && (e.emit("newListener", t, a.listener ? a.listener : a), r = e._events), s = r[t]), void 0 === s) s = r[t] = a, ++e._eventsCount;
                        else if ("function" == typeof s ? s = r[t] = n ? [a, s] : [s, a] : n ? s.unshift(a) : s.push(a), (i = l(e)) > 0 && s.length > i && !s.warned) {
                            s.warned = !0;
                            var i, r, s, u = Error("Possible EventEmitter memory leak detected. " + s.length + " " + String(t) + " listeners added. Use emitter.setMaxListeners() to increase limit");
                            u.name = "MaxListenersExceededWarning", u.emitter = e, u.type = t, u.count = s.length, console && console.warn && console.warn(u)
                        }
                        return e
                    }

                    function c() {
                        if (!this.fired) return (this.target.removeListener(this.type, this.wrapFn), this.fired = !0, 0 == arguments.length) ? this.listener.call(this.target) : this.listener.apply(this.target, arguments)
                    }

                    function d(e, t, a) {
                        var n = {
                                fired: !1,
                                wrapFn: void 0,
                                target: e,
                                type: t,
                                listener: a
                            },
                            i = c.bind(n);
                        return i.listener = a, n.wrapFn = i, i
                    }

                    function p(e, t, a) {
                        var n = e._events;
                        if (void 0 === n) return [];
                        var i = n[t];
                        return void 0 === i ? [] : "function" == typeof i ? a ? [i.listener || i] : [i] : a ? function(e) {
                            for (var t = Array(e.length), a = 0; a < t.length; ++a) t[a] = e[a].listener || e[a];
                            return t
                        }(i) : m(i, i.length)
                    }

                    function f(e) {
                        var t = this._events;
                        if (void 0 !== t) {
                            var a = t[e];
                            if ("function" == typeof a) return 1;
                            if (void 0 !== a) return a.length
                        }
                        return 0
                    }

                    function m(e, t) {
                        for (var a = Array(t), n = 0; n < t; ++n) a[n] = e[n];
                        return a
                    }

                    function v(e, t, a, n) {
                        if ("function" == typeof e.on) n.once ? e.once(t, a) : e.on(t, a);
                        else if ("function" == typeof e.addEventListener) e.addEventListener(t, function i(r) {
                            n.once && e.removeEventListener(t, i), a(r)
                        });
                        else throw TypeError('The "emitter" argument must be of type EventEmitter. Received type ' + typeof e)
                    }
                    Object.defineProperty(r, "defaultMaxListeners", {
                        enumerable: !0,
                        get: function() {
                            return s
                        },
                        set: function(e) {
                            if ("number" != typeof e || e < 0 || i(e)) throw RangeError('The value of "defaultMaxListeners" is out of range. It must be a non-negative number. Received ' + e + ".");
                            s = e
                        }
                    }), r.init = function() {
                        (void 0 === this._events || this._events === Object.getPrototypeOf(this)._events) && (this._events = Object.create(null), this._eventsCount = 0), this._maxListeners = this._maxListeners || void 0
                    }, r.prototype.setMaxListeners = function(e) {
                        if ("number" != typeof e || e < 0 || i(e)) throw RangeError('The value of "n" is out of range. It must be a non-negative number. Received ' + e + ".");
                        return this._maxListeners = e, this
                    }, r.prototype.getMaxListeners = function() {
                        return l(this)
                    }, r.prototype.emit = function(e) {
                        for (var t = [], a = 1; a < arguments.length; a++) t.push(arguments[a]);
                        var i = "error" === e,
                            r = this._events;
                        if (void 0 !== r) i = i && void 0 === r.error;
                        else if (!i) return !1;
                        if (i) {
                            if (t.length > 0 && (s = t[0]), s instanceof Error) throw s;
                            var s, o = Error("Unhandled error." + (s ? " (" + s.message + ")" : ""));
                            throw o.context = s, o
                        }
                        var l = r[e];
                        if (void 0 === l) return !1;
                        if ("function" == typeof l) n(l, this, t);
                        else
                            for (var u = l.length, c = m(l, u), a = 0; a < u; ++a) n(c[a], this, t);
                        return !0
                    }, r.prototype.addListener = function(e, t) {
                        return u(this, e, t, !1)
                    }, r.prototype.on = r.prototype.addListener, r.prototype.prependListener = function(e, t) {
                        return u(this, e, t, !0)
                    }, r.prototype.once = function(e, t) {
                        return o(t), this.on(e, d(this, e, t)), this
                    }, r.prototype.prependOnceListener = function(e, t) {
                        return o(t), this.prependListener(e, d(this, e, t)), this
                    }, r.prototype.removeListener = function(e, t) {
                        var a, n, i, r, s;
                        if (o(t), void 0 === (n = this._events) || void 0 === (a = n[e])) return this;
                        if (a === t || a.listener === t) 0 == --this._eventsCount ? this._events = Object.create(null) : (delete n[e], n.removeListener && this.emit("removeListener", e, a.listener || t));
                        else if ("function" != typeof a) {
                            for (i = -1, r = a.length - 1; r >= 0; r--)
                                if (a[r] === t || a[r].listener === t) {
                                    s = a[r].listener, i = r;
                                    break
                                } if (i < 0) return this;
                            0 === i ? a.shift() : function(e, t) {
                                for (; t + 1 < e.length; t++) e[t] = e[t + 1];
                                e.pop()
                            }(a, i), 1 === a.length && (n[e] = a[0]), void 0 !== n.removeListener && this.emit("removeListener", e, s || t)
                        }
                        return this
                    }, r.prototype.off = r.prototype.removeListener, r.prototype.removeAllListeners = function(e) {
                        var t, a, n;
                        if (void 0 === (a = this._events)) return this;
                        if (void 0 === a.removeListener) return 0 == arguments.length ? (this._events = Object.create(null), this._eventsCount = 0) : void 0 !== a[e] && (0 == --this._eventsCount ? this._events = Object.create(null) : delete a[e]), this;
                        if (0 == arguments.length) {
                            var i, r = Object.keys(a);
                            for (n = 0; n < r.length; ++n) "removeListener" !== (i = r[n]) && this.removeAllListeners(i);
                            return this.removeAllListeners("removeListener"), this._events = Object.create(null), this._eventsCount = 0, this
                        }
                        if ("function" == typeof(t = a[e])) this.removeListener(e, t);
                        else if (void 0 !== t)
                            for (n = t.length - 1; n >= 0; n--) this.removeListener(e, t[n]);
                        return this
                    }, r.prototype.listeners = function(e) {
                        return p(this, e, !0)
                    }, r.prototype.rawListeners = function(e) {
                        return p(this, e, !1)
                    }, r.listenerCount = function(e, t) {
                        return "function" == typeof e.listenerCount ? e.listenerCount(t) : f.call(e, t)
                    }, r.prototype.listenerCount = f, r.prototype.eventNames = function() {
                        return this._eventsCount > 0 ? t(this._events) : []
                    }
                }
            },
            a = {};

        function n(t) {
            var i = a[t];
            if (void 0 !== i) return i.exports;
            var r = a[t] = {
                    exports: {}
                },
                s = !0;
            try {
                e[t](r, r.exports, n), s = !1
            } finally {
                s && delete a[t]
            }
            return r.exports
        }
        n.ab = "/ROOT/links/@/next/16.4.5/0de1122c89b9724448b83052600528d4b1dce37d3127900fabdf5af34275552d/node_modules/next/dist/compiled/events/", t.exports = n(294)
    }()
}, 623127, e => {
    "use strict";
    var t = e.i(415858),
        a = function(e, t) {
            return (a = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var a in t) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a])
            })(e, t)
        };

    function n(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        a(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }

    function i(e, t, a, n) {
        return new(a || (a = Promise))(function(i, r) {
            function s(e) {
                try {
                    l(n.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function o(e) {
                try {
                    l(n.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function l(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof a ? t : new a(function(e) {
                    e(t)
                })).then(s, o)
            }
            l((n = n.apply(e, t || [])).next())
        })
    }

    function r(e, t) {
        var a, n, i, r = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return s.next = o(0), s.throw = o(1), s.return = o(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
            return this
        }), s;

        function o(o) {
            return function(l) {
                var u = [o, l];
                if (a) throw TypeError("Generator is already executing.");
                for (; s && (s = 0, u[0] && (r = 0)), r;) try {
                    if (a = 1, n && (i = 2 & u[0] ? n.return : u[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, u[1])).done) return i;
                    switch (n = 0, i && (u = [2 & u[0], i.value]), u[0]) {
                        case 0:
                        case 1:
                            i = u;
                            break;
                        case 4:
                            return r.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            r.label++, n = u[1], u = [0];
                            continue;
                        case 7:
                            u = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = r.trys).length > 0 && i[i.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === u[0] && (!i || u[1] > i[0] && u[1] < i[3])) {
                                r.label = u[1];
                                break
                            }
                            if (6 === u[0] && r.label < i[1]) {
                                r.label = i[1], i = u;
                                break
                            }
                            if (i && r.label < i[2]) {
                                r.label = i[2], r.ops.push(u);
                                break
                            }
                            i[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    u = t.call(e, r)
                } catch (e) {
                    u = [6, e], n = 0
                } finally {
                    a = i = 0
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

    function s(e) {
        var t, a;
        return null == (t = e) ? t : {
            agreement: null == (a = t.agreement) ? a : {
                id: a.id,
                version: a.version,
                agreementType: a.agreementType,
                clientType: a.clientType,
                regulationType: a.regulationType,
                displayUrl: a.displayUrl,
                archiveUrl: a.archiveUrl,
                createdDateTime: new Date(a.createdDateTime)
            },
            acceptedDatetime: new Date(t.acceptedDatetime)
        }
    }

    function o(e) {
        var a;
        return null == (a = e) ? a : {
            id: a.id,
            agreementType: a.agreementType,
            clientType: a.clientType,
            regulationType: a.regulationType,
            displayUrl: a.displayUrl,
            agreementBodyText: (0, t.u)(a, "agreementBodyText") ? a.agreementBodyText : void 0
        }
    }

    function l(e) {
        if (void 0 !== e) return null === e ? null : {
            agreementId: e.agreementId
        }
    }

    function u(e) {
        if (void 0 !== e) return null === e ? null : {
            acceptances: e.acceptances.map(l)
        }
    }

    function c(e) {
        var a;
        return null == (a = e) ? a : {
            errorCode: (0, t.u)(a, "errorCode") ? a.errorCode : void 0,
            message: (0, t.u)(a, "message") ? a.message : void 0,
            agreementId: a.agreementId
        }
    }

    function d(e, a) {
        return null == e ? e : {
            results: (0, t.u)(e, "results") ? null === e.results ? null : e.results.map(c) : void 0
        }
    }
    var p = function(e) {
            function a() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(a, e), a.prototype.acceptanceDeleteRaw = function(e, a) {
                return i(this, void 0, void 0, function() {
                    var n, i, s;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/acceptances",
                                    schemaPath: "/v1/acceptances",
                                    method: "DELETE",
                                    headers: i,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            userId: e.userId,
                                            agreementId: e.agreementId
                                        }
                                    }(e.acceptanceRequest)
                                }, a)];
                            case 1:
                                return s = r.sent(), [2, new t.H(s, function(e) {
                                    return null == e ? e : {
                                        errorCode: (0, t.u)(e, "errorCode") ? e.errorCode : void 0,
                                        message: (0, t.u)(e, "message") ? e.message : void 0
                                    }
                                })]
                        }
                    })
                })
            }, a.prototype.acceptanceDelete = function() {
                return i(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), r(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.acceptanceDeleteRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, a.prototype.acceptanceGetByUserIdRaw = function(e, a) {
                return i(this, void 0, void 0, function() {
                    var n, i, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new t.w("userId", "Required parameter requestParameters.userId was null or undefined when calling acceptanceGetByUserId.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/acceptances/{userId}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/acceptances/{userId}",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, a)];
                            case 1:
                                return o = r.sent(), [2, new t.H(o, function(e) {
                                    return null == e ? e : {
                                        results: (0, t.u)(e, "results") ? null === e.results ? null : e.results.map(s) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, a.prototype.acceptanceGetByUserId = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return r(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.acceptanceGetByUserIdRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, a.prototype.acceptanceInsertRaw = function(e, a) {
                return i(this, void 0, void 0, function() {
                    var n, i, s;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/acceptances",
                                    schemaPath: "/v1/acceptances",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: u(e.insertAcceptancesRequest)
                                }, a)];
                            case 1:
                                return s = r.sent(), [2, new t.H(s, function(e) {
                                    return d(e)
                                })]
                        }
                    })
                })
            }, a.prototype.acceptanceInsert = function() {
                return i(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), r(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.acceptanceInsertRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, a.prototype.acceptanceInsertByUserIdRaw = function(e, a) {
                return i(this, void 0, void 0, function() {
                    var n, i, s;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new t.w("userId", "Required parameter requestParameters.userId was null or undefined when calling acceptanceInsertByUserId.");
                                return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/acceptances/{userId}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/acceptances/{userId}",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: u(e.insertAcceptancesRequest)
                                }, a)];
                            case 1:
                                return s = r.sent(), [2, new t.H(s, function(e) {
                                    return d(e)
                                })]
                        }
                    })
                })
            }, a.prototype.acceptanceInsertByUserId = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return r(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.acceptanceInsertByUserIdRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, a
        }(t._),
        f = function(e) {
            function a() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(a, e), a.prototype.agreementResolutionGetByContextRaw = function(e, a) {
                return i(this, void 0, void 0, function() {
                    var n, i, s;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.clientType || void 0 === e.clientType) throw new t.w("clientType", "Required parameter requestParameters.clientType was null or undefined when calling agreementResolutionGetByContext.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/agreements-resolution/{clientType}".replace("{".concat("clientType", "}"), encodeURIComponent(String(e.clientType))),
                                    schemaPath: "/v1/agreements-resolution/{clientType}",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, a)];
                            case 1:
                                return s = r.sent(), [2, new t.H(s, function(e) {
                                    return e.map(o)
                                })]
                        }
                    })
                })
            }, a.prototype.agreementResolutionGetByContext = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return r(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.agreementResolutionGetByContextRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, a
        }(t._);
    e.s(["b", 0, p, "g", 0, f, "Q", 0, {
        TermsOfService: "TermsOfService",
        PrivacyPolicy: "PrivacyPolicy",
        RiderTerms: "RiderTerms",
        ChildrenPrivacyPolicy: "ChildrenPrivacyPolicy",
        ConsentFlow: "ConsentFlow",
        RefundTerms: "RefundTerms",
        LuobuThirdPartyDataUse: "LuobuThirdPartyDataUse",
        PersonalInformationPolicy: "PersonalInformationPolicy"
    }, "m", 0, {
        Web: "Web",
        App: "App",
        Studio: "Studio",
        TalentHub: "TalentHub",
        None: "None",
        CreatorDashboardAnalytics: "CreatorDashboardAnalytics",
        ImmersiveAds: "ImmersiveAds",
        CreatorAiAssistant: "CreatorAIAssistant",
        CreatorStore: "CreatorStore",
        AudioDistribution: "AudioDistribution",
        AffiliateProgram: "AffiliateProgram",
        Commerce: "Commerce",
        ExtendedServices: "ExtendedServices"
    }, "z", 0, {
        Global: "Global",
        Luobu: "Luobu",
        Europe: "Europe",
        SouthKorea: "SouthKorea"
    }])
}, 549856, e => {
    "use strict";
    var t = e.i(154570),
        a = e.i(661736),
        n = e.i(609454),
        i = e.i(882057),
        r = e.i(497698),
        s = e.i(335020),
        o = e.i(643766);
    let l = {
            Info: "icon-filled-circle-i",
            Warning: "icon-filled-triangle-exclamation",
            Success: "icon-filled-circle-check",
            Error: "icon-filled-circle-x"
        },
        u = {
            Info: "var(--color-system-emphasis)",
            Warning: "var(--color-system-warning)",
            Success: "var(--color-extended-green-700, var(--color-system-success))",
            Error: "var(--color-action-alert-foreground)"
        },
        c = {
            Info: "stroke-emphasis",
            Warning: "stroke-system-warning",
            Success: "stroke-emphasis",
            Error: "stroke-system-alert"
        },
        d = {
            Info: "rgb(from var(--color-system-neutral) r g b / 0.1)",
            Warning: "rgb(from var(--color-system-warning) r g b / 0.16)",
            Success: "rgb(from var(--color-system-success) r g b / 0.1)",
            Error: "rgb(from var(--color-system-alert) r g b / 0.16)"
        },
        p = e => {
            let {
                label: t,
                href: n,
                linkTarget: i,
                onAction: r,
                variant: s
            } = e;
            return i ? o.default.createElement(a.f, {
                asChild: !0,
                size: "Small",
                variant: s,
                onClick: r
            }, o.default.cloneElement(i, {}, t)) : n ? o.default.createElement(a.f, {
                as: "a",
                href: n,
                size: "Small",
                variant: s,
                onClick: r
            }, t) : o.default.createElement(a.f, {
                size: "Small",
                variant: s,
                onClick: r
            }, t)
        },
        f = e => {
            let {
                label: t,
                href: a,
                linkTarget: n,
                onAction: r
            } = e;
            return n ? o.default.createElement(i.f, {
                asChild: !0,
                onClick: r,
                size: "Medium",
                variant: "Standalone",
                underline: "always"
            }, o.default.cloneElement(n, {}, t)) : a ? o.default.createElement(i.f, {
                href: a,
                onClick: r,
                size: "Medium",
                variant: "Standalone",
                underline: "always"
            }, t) : o.default.createElement(i.f, {
                as: "button",
                onClick: r,
                size: "Medium",
                variant: "Standalone",
                underline: "always"
            }, t)
        },
        m = (0, o.forwardRef)((e, a) => {
            let {
                children: i,
                variant: m = "System",
                severity: v = "Info",
                primaryActionLabel: y,
                primaryActionHref: h,
                primaryActionLinkTarget: g,
                onPrimaryAction: b,
                secondaryActionLabel: T,
                secondaryActionHref: w,
                secondaryActionLinkTarget: E,
                onSecondaryAction: S,
                hasCloseAffordance: I = !0,
                closeLabel: C = "Dismiss alert",
                onDismiss: x,
                className: P,
                style: A,
                ..._
            } = e, R = (0, n.f)("foundation-web-alert-message-"), O = !!y, V = !!T, U = !!(I && x), N = "Feedback" === m && (O || V || U), k = "Warning" === v || "Error" === v ? "alert" : "status", L = null;
            O && (L = V ? o.default.createElement(p, {
                label: y || "",
                href: h,
                linkTarget: g,
                onAction: b,
                variant: "Standard"
            }) : o.default.createElement(f, {
                label: y || "",
                href: h,
                linkTarget: g,
                onAction: b
            }));
            let G = V ? o.default.createElement(p, {
                label: T || "",
                href: w,
                linkTarget: E,
                onAction: S,
                variant: "Utility"
            }) : null;
            return o.default.createElement("div", {
                ref: a,
                role: N ? "region" : k,
                "aria-labelledby": N ? R : void 0,
                className: (0, s.U)("foundation-web-alert relative width-full stroke-standard", "System" === m ? "[border-left-width:0] [border-right-width:0]" : "radius-medium", c[v], P),
                ..._
            }, o.default.createElement("div", {
                "aria-hidden": "true",
                className: (0, s.U)("absolute inset-[0] pointer-events-none", "Feedback" === m && "radius-medium"),
                style: {
                    backgroundColor: d[v]
                }
            }), o.default.createElement("div", {
                className: "relative flex items-start gap-x-medium padding-x-large padding-y-small min-width-0"
            }, o.default.createElement("div", {
                className: "flex items-start padding-y-xsmall self-stretch shrink-0"
            }, o.default.createElement("div", {
                className: "relative flex items-start padding-y-xxsmall"
            }, "Warning" !== v && o.default.createElement("span", {
                "aria-hidden": "true",
                className: "absolute width-[10px] height-[14px] top-[5px]",
                style: {
                    left: "50%",
                    transform: "translateX(-50%)",
                    backgroundColor: "var(--dark-mode-content-emphasis)"
                }
            }), o.default.createElement(t.f, {
                "aria-hidden": "true",
                name: l[v],
                size: "Medium",
                className: "relative",
                style: {
                    color: u[v]
                }
            }))), o.default.createElement("div", {
                className: (0, s.U)("flex grow-1 basis-0 min-width-0 items-start gap-x-medium gap-y-small", V ? "flex-col" : "wrap")
            }, o.default.createElement("div", {
                id: N ? R : void 0,
                role: N ? k : void 0,
                className: (0, s.U)("flex items-center padding-top-[var(--size-150)] text-body-medium text-wrap content-emphasis [overflow-wrap:anywhere]", V ? "width-full min-width-0" : "grow-1 basis-0 min-width-[min(200px,100%)]")
            }, i), (L || G) && o.default.createElement("div", {
                className: (0, s.U)("flex items-center gap-small wrap shrink-0", !V && "padding-y-[var(--size-150)]")
            }, L, G)), U && o.default.createElement(r.f, {
                variant: "Utility",
                size: "Medium",
                isCircular: !0,
                className: "content-emphasis shrink-0 padding-[var(--size-150)]",
                "aria-label": C,
                onClick: x
            })))
        });
    e.s(["f", 0, m])
}, 221849, e => {
    "use strict";
    var t = e.i(335020),
        a = e.i(643766);
    let n = "text-label-medium",
        i = a.default.forwardRef((e, i) => {
            let {
                className: r,
                variant: s = "Determinate",
                value: o = 0,
                minValue: l,
                maxValue: u,
                valuesLocation: c = "None",
                ariaLabel: d,
                ...p
            } = e, f = "Determinate" === s, m = Math.min(100, Math.max(0, o)), v = f && void 0 !== l && "None" !== c, y = f && void 0 !== u && "None" !== c, h = "Sides" === c, g = a.default.createElement("div", {
                className: (0, t.U)("relative height-100 radius-circle bg-shift-200", h ? "grow-1 shrink-1 min-width-0" : "block width-full"),
                style: h ? {
                    flexBasis: 0
                } : void 0
            }, f ? a.default.createElement("div", {
                className: "absolute top-0 left-0 height-100 radius-circle transition-all duration-300 ease-out",
                style: {
                    width: "".concat(m, "%"),
                    backgroundColor: "var(--fui-future-alpha-color-system-progress)"
                }
            }) : a.default.createElement("div", {
                className: "foundation-web-progress-bar-indeterminate absolute top-0 height-100 radius-circle"
            })), b = v && a.default.createElement("span", {
                className: (0, t.U)("content-emphasis flex-shrink-0", n),
                "aria-hidden": "true"
            }, l), T = y && a.default.createElement("span", {
                className: (0, t.U)("content-emphasis flex-shrink-0", n),
                "aria-hidden": "true"
            }, u), w = (v || y) && a.default.createElement("div", {
                className: "flex justify-between width-full gap-xsmall"
            }, v ? b : a.default.createElement("span", null), y ? T : a.default.createElement("span", null));
            return a.default.createElement("div", {
                ref: i,
                className: (0, t.U)("block width-full", r),
                role: "progressbar",
                "aria-label": d,
                "aria-valuemin": f ? 0 : void 0,
                "aria-valuemax": f ? 100 : void 0,
                "aria-valuenow": f ? m : void 0,
                ...p
            }, h ? a.default.createElement("div", {
                className: "flex items-center gap-small width-full"
            }, b, g, T) : a.default.createElement("div", {
                className: "flex flex-col gap-small width-full"
            }, "Top" === c && w, g, "Bottom" === c && w))
        });
    i.displayName = "ProgressBar", e.s(["f", 0, i])
}, 735807, e => {
    "use strict";
    var t = e.i(433659),
        a = e.i(179183),
        n = e.i(643766),
        i = e.i(365434),
        r = e.i(677484),
        s = e.i(785517),
        o = e.i(422166),
        l = e.i(268953);

    function u(e) {
        return (0, t.g)("MuiDialogContentText", e)
    }(0, r.g)("MuiDialogContentText", ["root"]);
    let c = ["children", "className"],
        d = (0, i.s)(o.T, {
            shouldForwardProp: e => (0, i.r)(e) || "classes" === e,
            name: "MuiDialogContentText",
            slot: "Root",
            overridesResolver: (e, t) => t.root
        })({}),
        p = n.forwardRef(function(e, n) {
            let r = (0, l.u)({
                    props: e,
                    name: "MuiDialogContentText"
                }),
                {
                    className: o
                } = r,
                p = (0, t._)(r, c),
                f = (e => {
                    let {
                        classes: t
                    } = e, n = (0, i.a)({
                        root: ["root"]
                    }, u, t);
                    return (0, a._)({}, t, n)
                })(p);
            return (0, s.jsx)(d, (0, a._)({
                component: "p",
                variant: "body1",
                color: "text.secondary",
                ref: n,
                ownerState: p,
                className: (0, i.c)(f.root, o)
            }, r, {
                classes: f
            }))
        });
    e.s(["D", 0, p])
}, 407031, e => {
    "use strict";
    var t = e.i(225226),
        a = e.i(643766),
        n = e.i(246481);
    e.i(785517), e.i(860663);
    var i = (0, a.createContext)({
        ref: {
            current: null
        },
        configure: function() {
            throw Error("useDialog was invoked without DialogProvider")
        },
        open: function() {
            throw Error("useDialog was invoked without DialogProvider")
        },
        close: function() {
            throw Error("useDialog was invoked without DialogProvider")
        }
    });
    e.s(["U", 0, function(e) {
        var r = e.children,
            s = (0, t.a)(e, ["children"]),
            o = (0, a.useRef)(null),
            l = (0, a.useState)({
                props: {},
                children: void 0
            }),
            u = l[0],
            c = l[1],
            d = (0, a.useState)(!1),
            p = d[0],
            f = d[1],
            m = (0, a.useCallback)(function() {
                f(!0)
            }, [f]),
            v = (0, a.useCallback)(function() {
                f(!1)
            }, [f]),
            y = (0, a.useCallback)(function(e, t) {
                void 0 === t && (t = {}), c({
                    props: t,
                    children: e
                })
            }, [c]),
            h = (0, a.useMemo)(function() {
                return {
                    ref: o,
                    open: m,
                    close: v,
                    configure: y
                }
            }, [v, y, m]);
        return a.default.createElement(a.default.Fragment, null, a.default.createElement(i.Provider, {
            value: h
        }, r), a.default.createElement(n.f, (0, t._)({}, u.props, s, {
            "aria-labelledby": u.props.id,
            "aria-describedby": "dialog-content-text-describe-id",
            open: p,
            onClose: v,
            ref: o
        }), u.children))
    }, "C", 0, function() {
        var e = (0, a.useContext)(i);
        return {
            ref: e.ref,
            open: e.open,
            close: e.close,
            configure: e.configure
        }
    }])
}, 491278, e => {
    "use strict";
    var t = e.i(407031);
    e.s(["f", () => t.U])
}, 373488, e => {
    "use strict";
    var t = e.i(643766),
        a = e.i(796866),
        n = e.i(973649),
        i = e.i(922471),
        r = e.i(681812),
        s = e.i(735807);
    e.i(785517), e.s(["f", 0, function(e) {
        var o = e.id;
        e.variant;
        var l = e.title,
            u = e.color,
            c = e.loading,
            d = void 0 !== c && c,
            p = e.content,
            f = e.confirmText,
            m = e.cancelText,
            v = e.onCancel,
            y = e.onConfirm;
        return t.default.createElement("div", null, t.default.createElement(a.f, {
            id: o
        }, l), t.default.createElement(n.f, null, t.default.createElement(s.D, {
            id: "dialog-content-text-describe-id"
        }, p)), t.default.createElement(i.f, null, t.default.createElement(r.f, {
            size: "large",
            variant: "outlined",
            "aria-label": m,
            color: "secondary",
            onClick: v,
            disabled: d
        }, m), t.default.createElement(r.f, {
            size: "large",
            variant: "contained",
            loading: d,
            "aria-label": f,
            color: void 0 === u ? "primaryBrand" : u,
            onClick: y
        }, f)))
    }], 373488)
}, 12246, e => {
    "use strict";
    var t = e.i(225226),
        a = e.i(643766),
        n = e.i(26734);
    e.i(785517), e.i(860663);
    var i = (0, a.createContext)({
        ref: {
            current: null
        },
        enqueue: function() {
            throw Error("useSnackbar was invoked without SnackbarProvider")
        },
        close: function() {
            throw Error("useSnackbar was invoked without SnackbarProvider")
        }
    });
    e.s(["U", 0, function(e) {
        var r, s, o, l, u = e.children,
            c = (0, t.a)(e, ["children"]),
            d = (0, a.useRef)(null),
            p = (0, a.useState)(!1),
            f = p[0],
            m = p[1],
            v = (0, a.useState)([]),
            y = v[0],
            h = v[1],
            g = (0, a.useCallback)(function(e, a) {
                void 0 === e && (e = {}), void 0 === a && (a = function() {
                    return !0
                }), h(function(n) {
                    return (0, t.b)((0, t.b)([], n, !0), [{
                        props: e,
                        shouldClose: a
                    }], !1)
                })
            }, [h]),
            b = (0, a.useCallback)(function() {
                m(!1)
            }, [m]);
        (0, a.useEffect)(function() {
            y.length > 0 && m(!0)
        }, [y.length]);
        var T = (0, a.useMemo)(function() {
            return {
                ref: d,
                enqueue: g,
                close: b
            }
        }, [b, g]);
        return a.default.createElement(a.default.Fragment, null, a.default.createElement(i.Provider, {
            value: T
        }, u), a.default.createElement(n.S, (0, t._)({}, (null == (r = y[0]) ? void 0 : r.props) || {}, c, {
            TransitionProps: (0, t._)((0, t._)({}, (null == (o = null == (s = y[0]) ? void 0 : s.props) ? void 0 : o.TransitionProps) || {}), {
                onExited: function(e) {
                    var a, n, i, r;
                    h(function(e) {
                        var a = e.slice(1);
                        return (0, t.b)([], a, !0)
                    }), (null == (n = null == (a = y[0]) ? void 0 : a.props.TransitionProps) ? void 0 : n.onExited) && (null == (r = null == (i = y[0]) ? void 0 : i.props.TransitionProps) || r.onExited(e))
                }
            }),
            onClose: function(e, t) {
                var a, n, i;
                (null == (a = y[0]) ? void 0 : a.shouldClose(t)) && m(!1), (null == (n = y[0]) ? void 0 : n.props.onClose) && (null == (i = y[0]) || i.props.onClose(e, t))
            },
            open: f
        }), null == (l = y[0]) ? void 0 : l.props.children))
    }, "J", 0, function() {
        var e = (0, a.useContext)(i);
        return {
            ref: e.ref,
            enqueue: e.enqueue,
            close: e.close
        }
    }])
}, 146931, e => {
    "use strict";
    var t = e.i(12246);
    e.s(["f", () => t.U])
}, 42155, 293869, e => {
    "use strict";
    var t = {
            experience_chat: {
                bodyKeys: {
                    Nudge: "AbuseVector.TextChat.DialogBody.Nudge",
                    Suspended: "AbuseVector.TextChat.DialogBody.Suspended",
                    Banned: "AbuseVector.TextChat.DialogBody.Banned"
                },
                titleKeys: {
                    Nudge: "AbuseVector.TextChat.DialogTitle.Nudge"
                },
                labelKey: "AbuseVector.TextChat"
            },
            party_chat: {
                labelKey: "AbuseVector.PartyChat"
            },
            age_verification: {
                labelKey: "AbuseVector.AgeVerification"
            },
            rights_management: {
                labelKey: "AbuseVector.RightsManagement"
            }
        },
        a = new Set(["voice"]),
        n = (e, t) => "".concat(e).concat("/v1/not-approved", "?abuseVector=").concat(encodeURIComponent(t)),
        i = e => "".concat(e).concat("/v1/dismiss-intervention");
    e.s(["e", 0, e => new URL("/report-appeals", e).toString(), "m", 0, i, "b", 0, n, "k", 0, function(e) {
        if (Object.hasOwn(t, e)) return t[e]
    }, "F", 0, e => new URL("/safety-dashboard", e).toString(), "h", 0, function(e) {
        return a.has(e)
    }], 293869);
    var r = e.i(643766),
        s = e.i(785517),
        o = (0, r.createContext)(void 0);
    e.s(["N", 0, e => {
        let {
            Surface: t,
            children: a
        } = e, [{
            request: n,
            open: i
        }, l] = (0, r.useState)({
            open: !1
        }), u = (0, r.useCallback)(e => {
            l({
                request: e,
                open: !0
            })
        }, []), c = (0, r.useCallback)(() => {
            l(e => ({
                ...e,
                open: !1
            }))
        }, []), d = (0, r.useMemo)(() => ({
            showFeatureRestriction: u,
            closeFeatureRestriction: c
        }), [u, c]);
        return (0, s.jsxs)(o.Provider, {
            value: d,
            children: [a, n && (0, s.jsx)(t, {
                request: n,
                open: i,
                onDismiss: c
            })]
        })
    }, "v", 0, function(e) {
        let {
            httpGet: t,
            httpPost: a,
            userModerationApiUrl: r
        } = e;
        return {
            fetchModerationDetail: e => t(n(r, e)),
            dismissIntervention: e => a(i(r), {
                intervention_id: e
            })
        }
    }, "G", 0, ["Feature.NotApproved", "Feature.AppealsPortal", "Feature.InExperienceIntervention", "Feature.UniversalFeatureRestrictions"]], 42155)
}, 436089, e => {
    "use strict";
    var t, a, n, i, r, s, o, l, u, c, d, p, f = e.i(540949),
        m = e.i(28232),
        v = e.i(562442),
        y = e.i(591431);

    function h(e, t) {
        var a = (0, y._)(e, t, "update");
        if (a.set) {
            if (!a.get) throw TypeError("attempted to read set only private field");
            return "__destrWrapper" in a || (a.__destrWrapper = {
                set value(t) {
                    a.set.call(e, t)
                },
                get value() {
                    return a.get.call(e)
                }
            }), a.__destrWrapper
        }
        if (!a.writable) throw TypeError("attempted to set read only private field");
        return a
    }
    var g = e.i(463146),
        b = e.i(605),
        T = e.i(176522),
        w = e.i(455596),
        E = (t = new WeakMap, class extends w.f {
            build(e, t, a) {
                var n;
                let i = t.queryKey,
                    r = null != (n = t.queryHash) ? n : (0, g.J)(i, t),
                    s = this.get(r);
                return s || (s = new b.X({
                    client: e,
                    queryKey: i,
                    queryHash: r,
                    options: e.defaultQueryOptions(t),
                    state: a,
                    defaultOptions: e.getQueryDefaults(i)
                }), this.add(s)), s
            }
            add(e) {
                (0, f._)(this, t).has(e.queryHash) || ((0, f._)(this, t).set(e.queryHash, e), this.notify({
                    type: "added",
                    query: e
                }))
            }
            remove(e) {
                let a = (0, f._)(this, t).get(e.queryHash);
                a && (e.destroy(), a === e && (0, f._)(this, t).delete(e.queryHash), this.notify({
                    type: "removed",
                    query: e
                }))
            }
            clear() {
                T.f.batch(() => {
                    this.getAll().forEach(e => {
                        this.remove(e)
                    })
                })
            }
            get(e) {
                return (0, f._)(this, t).get(e)
            }
            getAll() {
                return [...(0, f._)(this, t).values()]
            }
            find(e) {
                let t = {
                    exact: !0,
                    ...e
                };
                return this.getAll().find(e => (0, g.N)(t, e))
            }
            findAll() {
                let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                    t = this.getAll();
                return Object.keys(e).length > 0 ? t.filter(t => (0, g.N)(e, t)) : t
            }
            notify(e) {
                T.f.batch(() => {
                    this.listeners.forEach(t => {
                        t(e)
                    })
                })
            }
            onFocus() {
                T.f.batch(() => {
                    this.getAll().forEach(e => {
                        e.onFocus()
                    })
                })
            }
            onOnline() {
                T.f.batch(() => {
                    this.getAll().forEach(e => {
                        e.onOnline()
                    })
                })
            }
            constructor(e = {}) {
                super(), (0, m._)(this, t, {
                    writable: !0,
                    value: void 0
                }), this.config = e, (0, v._)(this, t, new Map)
            }
        }),
        S = e.i(769747),
        I = w,
        C = (a = new WeakMap, n = new WeakMap, i = new WeakMap, class extends I.f {
            build(e, t, a) {
                let n = new S.I({
                    client: e,
                    mutationCache: this,
                    mutationId: ++h(this, i).value,
                    options: e.defaultMutationOptions(t),
                    state: a
                });
                return this.add(n), n
            }
            add(e) {
                (0, f._)(this, a).add(e);
                let t = x(e);
                if ("string" == typeof t) {
                    let a = (0, f._)(this, n).get(t);
                    a ? a.push(e) : (0, f._)(this, n).set(t, [e])
                }
                this.notify({
                    type: "added",
                    mutation: e
                })
            }
            remove(e) {
                if ((0, f._)(this, a).delete(e)) {
                    let t = x(e);
                    if ("string" == typeof t) {
                        let a = (0, f._)(this, n).get(t);
                        if (a)
                            if (a.length > 1) {
                                let t = a.indexOf(e); - 1 !== t && a.splice(t, 1)
                            } else a[0] === e && (0, f._)(this, n).delete(t)
                    }
                }
                this.notify({
                    type: "removed",
                    mutation: e
                })
            }
            canRun(e) {
                let t = x(e);
                if ("string" != typeof t) return !0;
                {
                    let a = (0, f._)(this, n).get(t),
                        i = null == a ? void 0 : a.find(e => "pending" === e.state.status);
                    return !i || i === e
                }
            }
            runNext(e) {
                let t = x(e);
                if ("string" != typeof t) return Promise.resolve();
                {
                    var a, i;
                    let r = null == (i = (0, f._)(this, n).get(t)) ? void 0 : i.find(t => t !== e && t.state.isPaused);
                    return null != (a = null == r ? void 0 : r.continue()) ? a : Promise.resolve()
                }
            }
            clear() {
                T.f.batch(() => {
                    (0, f._)(this, a).forEach(e => {
                        this.notify({
                            type: "removed",
                            mutation: e
                        })
                    }), (0, f._)(this, a).clear(), (0, f._)(this, n).clear()
                })
            }
            getAll() {
                return Array.from((0, f._)(this, a))
            }
            find(e) {
                let t = {
                    exact: !0,
                    ...e
                };
                return this.getAll().find(e => (0, g.L)(t, e))
            }
            findAll() {
                let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                return this.getAll().filter(t => (0, g.L)(e, t))
            }
            notify(e) {
                T.f.batch(() => {
                    this.listeners.forEach(t => {
                        t(e)
                    })
                })
            }
            resumePausedMutations() {
                let e = this.getAll().filter(e => e.state.isPaused);
                return T.f.batch(() => Promise.all(e.map(e => e.continue().catch(g.z))))
            }
            constructor(e = {}) {
                super(), (0, m._)(this, a, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, n, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, i, {
                    writable: !0,
                    value: void 0
                }), this.config = e, (0, v._)(this, a, new Set), (0, v._)(this, n, new Map), (0, v._)(this, i, 0)
            }
        });

    function x(e) {
        var t;
        return null == (t = e.options.scope) ? void 0 : t.id
    }
    var P = e.i(461736),
        A = e.i(458330),
        _ = e.i(719392),
        R = (r = new WeakMap, s = new WeakMap, o = new WeakMap, l = new WeakMap, u = new WeakMap, c = new WeakMap, d = new WeakMap, p = new WeakMap, class {
            mount() {
                h(this, c).value++, 1 === (0, f._)(this, c) && ((0, v._)(this, d, P.f.subscribe(async e => {
                    e && (await this.resumePausedMutations(), (0, f._)(this, r).onFocus())
                })), (0, v._)(this, p, A.f.subscribe(async e => {
                    e && (await this.resumePausedMutations(), (0, f._)(this, r).onOnline())
                })))
            }
            unmount() {
                var e, t;
                h(this, c).value--, 0 === (0, f._)(this, c) && (null == (e = (0, f._)(this, d)) || e.call(this), (0, v._)(this, d, void 0), null == (t = (0, f._)(this, p)) || t.call(this), (0, v._)(this, p, void 0))
            }
            isFetching(e) {
                return (0, f._)(this, r).findAll({
                    ...e,
                    fetchStatus: "fetching"
                }).length
            }
            isMutating(e) {
                return (0, f._)(this, s).findAll({
                    ...e,
                    status: "pending"
                }).length
            }
            getQueryData(e) {
                var t;
                let a = this.defaultQueryOptions({
                    queryKey: e
                });
                return null == (t = (0, f._)(this, r).get(a.queryHash)) ? void 0 : t.state.data
            }
            ensureQueryData(e) {
                let t = this.defaultQueryOptions(e),
                    a = (0, f._)(this, r).build(this, t),
                    n = a.state.data;
                return void 0 === n ? this.fetchQuery(e) : (e.revalidateIfStale && a.isStaleByTime((0, g.H)(t.staleTime, a)) && this.prefetchQuery(t), Promise.resolve(n))
            }
            getQueriesData(e) {
                return (0, f._)(this, r).findAll(e).map(e => {
                    let {
                        queryKey: t,
                        state: a
                    } = e;
                    return [t, a.data]
                })
            }
            setQueryData(e, t, a) {
                let n = this.defaultQueryOptions({
                        queryKey: e
                    }),
                    i = (0, f._)(this, r).get(n.queryHash),
                    s = null == i ? void 0 : i.state.data,
                    o = (0, g.b)(t, s);
                if (void 0 !== o) return (0, f._)(this, r).build(this, n).setData(o, {
                    ...a,
                    manual: !0
                })
            }
            setQueriesData(e, t, a) {
                return T.f.batch(() => (0, f._)(this, r).findAll(e).map(e => {
                    let {
                        queryKey: n
                    } = e;
                    return [n, this.setQueryData(n, t, a)]
                }))
            }
            getQueryState(e) {
                var t;
                let a = this.defaultQueryOptions({
                    queryKey: e
                });
                return null == (t = (0, f._)(this, r).get(a.queryHash)) ? void 0 : t.state
            }
            removeQueries(e) {
                let t = (0, f._)(this, r);
                T.f.batch(() => {
                    t.findAll(e).forEach(e => {
                        t.remove(e)
                    })
                })
            }
            resetQueries(e, t) {
                let a = (0, f._)(this, r);
                return T.f.batch(() => (a.findAll(e).forEach(e => {
                    e.reset()
                }), this.refetchQueries({
                    type: "active",
                    ...e
                }, t)))
            }
            cancelQueries(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    a = {
                        revert: !0,
                        ...t
                    };
                return Promise.all(T.f.batch(() => (0, f._)(this, r).findAll(e).map(e => e.cancel(a)))).then(g.z).catch(g.z)
            }
            invalidateQueries(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                return T.f.batch(() => {
                    var a, n;
                    return ((0, f._)(this, r).findAll(e).forEach(e => {
                        e.invalidate()
                    }), (null == e ? void 0 : e.refetchType) === "none") ? Promise.resolve() : this.refetchQueries({
                        ...e,
                        type: null != (a = null != (n = null == e ? void 0 : e.refetchType) ? n : null == e ? void 0 : e.type) ? a : "active"
                    }, t)
                })
            }
            refetchQueries(e) {
                var t;
                let a = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = {
                        ...a,
                        cancelRefetch: null == (t = a.cancelRefetch) || t
                    };
                return Promise.all(T.f.batch(() => (0, f._)(this, r).findAll(e).filter(e => !e.isDisabled() && !e.isStatic()).map(e => {
                    let t = e.fetch(void 0, n);
                    return n.throwOnError || (t = t.catch(g.z)), "paused" === e.state.fetchStatus ? Promise.resolve() : t
                }))).then(g.z)
            }
            fetchQuery(e) {
                let t = this.defaultQueryOptions(e);
                void 0 === t.retry && (t.retry = !1);
                let a = (0, f._)(this, r).build(this, t);
                return a.isStaleByTime((0, g.H)(t.staleTime, a)) ? a.fetch(t) : Promise.resolve(a.state.data)
            }
            prefetchQuery(e) {
                return this.fetchQuery(e).then(g.z).catch(g.z)
            }
            fetchInfiniteQuery(e) {
                return e.behavior = (0, _.T)(e.pages), this.fetchQuery(e)
            }
            prefetchInfiniteQuery(e) {
                return this.fetchInfiniteQuery(e).then(g.z).catch(g.z)
            }
            ensureInfiniteQueryData(e) {
                return e.behavior = (0, _.T)(e.pages), this.ensureQueryData(e)
            }
            resumePausedMutations() {
                return A.f.isOnline() ? (0, f._)(this, s).resumePausedMutations() : Promise.resolve()
            }
            getQueryCache() {
                return (0, f._)(this, r)
            }
            getMutationCache() {
                return (0, f._)(this, s)
            }
            getDefaultOptions() {
                return (0, f._)(this, o)
            }
            setDefaultOptions(e) {
                (0, v._)(this, o, e)
            }
            setQueryDefaults(e, t) {
                (0, f._)(this, l).set((0, g.q)(e), {
                    queryKey: e,
                    defaultOptions: t
                })
            }
            getQueryDefaults(e) {
                let t = [...(0, f._)(this, l).values()],
                    a = {};
                return t.forEach(t => {
                    (0, g.P)(e, t.queryKey) && Object.assign(a, t.defaultOptions)
                }), a
            }
            setMutationDefaults(e, t) {
                (0, f._)(this, u).set((0, g.q)(e), {
                    mutationKey: e,
                    defaultOptions: t
                })
            }
            getMutationDefaults(e) {
                let t = [...(0, f._)(this, u).values()],
                    a = {};
                return t.forEach(t => {
                    (0, g.P)(e, t.mutationKey) && Object.assign(a, t.defaultOptions)
                }), a
            }
            defaultQueryOptions(e) {
                if (e._defaulted) return e;
                let t = {
                    ...(0, f._)(this, o).queries,
                    ...this.getQueryDefaults(e.queryKey),
                    ...e,
                    _defaulted: !0
                };
                return t.queryHash || (t.queryHash = (0, g.J)(t.queryKey, t)), void 0 === t.refetchOnReconnect && (t.refetchOnReconnect = "always" !== t.networkMode), void 0 === t.throwOnError && (t.throwOnError = !!t.suspense), !t.networkMode && t.persister && (t.networkMode = "offlineFirst"), t.queryFn === g.V && (t.enabled = !1), t
            }
            defaultMutationOptions(e) {
                return (null == e ? void 0 : e._defaulted) ? e : {
                    ...(0, f._)(this, o).mutations,
                    ...(null == e ? void 0 : e.mutationKey) && this.getMutationDefaults(e.mutationKey),
                    ...e,
                    _defaulted: !0
                }
            }
            clear() {
                (0, f._)(this, r).clear(), (0, f._)(this, s).clear()
            }
            constructor(e = {}) {
                (0, m._)(this, r, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, s, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, o, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, l, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, u, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, c, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, d, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, p, {
                    writable: !0,
                    value: void 0
                }), (0, v._)(this, r, e.queryCache || new E), (0, v._)(this, s, e.mutationCache || new C), (0, v._)(this, o, e.defaultOptions || {}), (0, v._)(this, l, new Map), (0, v._)(this, u, new Map), (0, v._)(this, c, 0)
            }
        });
    e.s(["f", 0, R], 436089)
}, 49001, e => {
    "use strict";
    var t = e.i(523426),
        a = e.i(239328),
        n = e.i(245299),
        i = e.i(954119),
        r = e.i(134731),
        s = e.i(165136),
        o = e.i(942100),
        l = e.i(779433),
        u = e.i(118413),
        c = e.i(428993),
        d = e.i(9436),
        p = e.i(846130),
        f = e.i(787617),
        m = e.i(360894),
        v = e.i(704211),
        y = e.i(92174),
        h = e.i(926415),
        g = e.i(481186),
        b = e.i(426173),
        T = e.i(242002),
        w = e.i(157700);
    let E = (0, w.e)({
        namespace: "game-engine-geometry",
        name: "enableMeshTextureApiRemoveIdVerification",
        defaultValue: !1
    });
    var S = e.i(886525),
        I = e.i(665869),
        C = e.i(967230),
        x = e.i(82899),
        P = e.i(199972),
        A = e.i(477797);
    let _ = (0, w.e)({
        namespace: "page-migrations",
        name: "preferencesPageMigrationEnabled",
        defaultValue: !1
    });
    var R = e.i(100022),
        O = e.i(494192),
        V = e.i(378089);
    let U = [{
        flag: t.f,
        metadata: {
            namespace: "anti-cheat",
            name: "enhancedAntiCheatAccess",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: a.Z,
        metadata: {
            namespace: "avatar-marketplace",
            name: "enableCreatorShowcases",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: a.W,
        metadata: {
            namespace: "avatar-marketplace",
            name: "enableAvatarCreationTokenCategories",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: a.C,
        metadata: {
            namespace: "avatar-marketplace",
            name: "enableBulkMakeupTokenCreation",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: a.D,
        metadata: {
            namespace: "avatar-marketplace",
            name: "isAutoPublishPreferencesEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: a.n,
        metadata: {
            namespace: "avatar-marketplace",
            name: "showTaxonomyOnAvatarItemAnalyticsTab",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: a.T,
        metadata: {
            namespace: "avatar-marketplace",
            name: "enableCoreContentGatedBanner",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: a.x,
        metadata: {
            namespace: "avatar-marketplace",
            name: "enableTimedOptionsSunsetBanner",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: n.f,
        metadata: {
            namespace: "collaborative-tools",
            name: "enableEnvironments",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: i.f,
        metadata: {
            namespace: "communities",
            name: "CreatorAnalytics",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "group"
        }
    }, {
        flag: r.p,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isAssetPrivacyOptOutSurveyEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: r.E,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isAssetAccessRequestsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: r.n,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isModelCustomThumbnailUploadEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: r.r,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isAssetDependenciesViewerEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: r.A,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isCreatorStoreVideoMultipartUploadEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: r.V,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isPublishBeforeExposeEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: s.m,
        metadata: {
            namespace: "content-licensing",
            name: "isUnifiedMatchesEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: s.b,
        metadata: {
            namespace: "content-licensing",
            name: "isExperiencePreviewEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: s.j,
        metadata: {
            namespace: "content-licensing",
            name: "enableIpPlatformLicenseRecommendations",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: s.g,
        metadata: {
            namespace: "content-licensing",
            name: "isImageAttachmentEnabledInLicenseApplication",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: s.N,
        metadata: {
            namespace: "content-licensing",
            name: "isShowcaseExperiencesEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: s.X,
        metadata: {
            namespace: "content-licensing",
            name: "isIgnoreMatchEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: s.y,
        metadata: {
            namespace: "content-licensing",
            name: "maxCollectibleItemDetailsRequestCount",
            defaultValue: 30,
            valueType: "number",
            contextType: "static"
        }
    }, {
        flag: s.p,
        metadata: {
            namespace: "content-licensing",
            name: "isBadgeOnlyAgreementsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: s.a,
        metadata: {
            namespace: "content-licensing",
            name: "isIphEarningsTotalAcrossLicenseTypesEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: o.X,
        metadata: {
            namespace: "content-publishing",
            name: "isPromotionalTextEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: o.r,
        metadata: {
            namespace: "content-publishing",
            name: "isExperienceNameCharacterValidationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l.$,
        metadata: {
            namespace: "content-suitability",
            name: "questionnaireV2Allowlist",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l.z,
        metadata: {
            namespace: "content-suitability",
            name: "questionnaireV2Q1Release",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l.K,
        metadata: {
            namespace: "content-suitability",
            name: "enableProposedIarcQuestionnaire",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l.p,
        metadata: {
            namespace: "content-suitability",
            name: "enableStudioQuestionnaireV2",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: u.G,
        metadata: {
            namespace: "creator-analytics",
            name: "analyticsChartLoadEventstreamEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: u.s,
        metadata: {
            namespace: "creator-analytics",
            name: "isLimitedAnalyticsAdminMonitoringNavigationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: u.n,
        metadata: {
            namespace: "creator-analytics",
            name: "visibleAssetIdInPersonalizationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: u.H,
        metadata: {
            namespace: "creator-analytics",
            name: "isExperimentationTemplatesEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: u.m,
        metadata: {
            namespace: "creator-analytics",
            name: "isCustomMetricsBackendEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: u.q,
        metadata: {
            namespace: "creator-analytics",
            name: "isCustomMetricMdeEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: u.j,
        metadata: {
            namespace: "creator-analytics",
            name: "isExperimentTargetingEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: u.f,
        metadata: {
            namespace: "creator-analytics",
            name: "isTargetingConfigsEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: u.U,
        metadata: {
            namespace: "creator-analytics",
            name: "isExperimentNullControlValueEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: u.S,
        metadata: {
            namespace: "creator-analytics",
            name: "isExperimentRolloutEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: u.p,
        metadata: {
            namespace: "creator-analytics",
            name: "IsGeneralBreakGlassBannerEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: u.e,
        metadata: {
            namespace: "creator-analytics",
            name: "IsMonetizationBreakGlassBannerEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: u.X,
        metadata: {
            namespace: "creator-analytics",
            name: "isPlayerFeedbackExampleCommentsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: u.o,
        metadata: {
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantChatHistoryEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: u.a,
        metadata: {
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantChatEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: u.J,
        metadata: {
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantStreamSilenceRecoveryEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: u.D,
        metadata: {
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantIssueBannerEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: u.T,
        metadata: {
            namespace: "creator-analytics",
            name: "showCreatorRewardsReportingDisclaimer",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: u.L,
        metadata: {
            namespace: "creator-analytics",
            name: "isRotraceMetricEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: u.V,
        metadata: {
            namespace: "creator-analytics",
            name: "isTelemetryMigrationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: u.c,
        metadata: {
            namespace: "creator-analytics",
            name: "showVideoServiceDashboard",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: u.W,
        metadata: {
            namespace: "creator-analytics",
            name: "isTreemapColorBySiblingProportionEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: u.w,
        metadata: {
            namespace: "creator-analytics",
            name: "isAssistantChartOverflowMenuEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: u.b,
        metadata: {
            namespace: "creator-analytics",
            name: "isAnalyticsMetricAwareYAxisFormatterEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: u.y,
        metadata: {
            namespace: "creator-analytics",
            name: "isCustomDashboardsLocalStorageEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: u.x,
        metadata: {
            namespace: "creator-analytics",
            name: "isJourneyEventsEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: u.r,
        metadata: {
            namespace: "creator-analytics",
            name: "isClientSessionsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: u.i,
        metadata: {
            namespace: "creator-analytics",
            name: "isEhdResultsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: u.k,
        metadata: {
            namespace: "creator-analytics",
            name: "isEhdResultsAlwaysFetched",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: u.l,
        metadata: {
            namespace: "creator-analytics",
            name: "isMetricVariantChartStateEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: u.Q,
        metadata: {
            namespace: "creator-analytics",
            name: "isPeriodSummaryBridgeEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: u.E,
        metadata: {
            namespace: "creator-analytics",
            name: "isExperimentSegmentationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: u.d,
        metadata: {
            namespace: "creator-analytics",
            name: "isExperimentSampleSizeEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: u.R,
        metadata: {
            namespace: "creator-analytics",
            name: "isExperimentMetricsV2Enabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: u.C,
        metadata: {
            namespace: "creator-analytics",
            name: "isExperimentLiftChartEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: u.u,
        metadata: {
            namespace: "creator-analytics",
            name: "isExperimentSignificanceCaasEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: u.z,
        metadata: {
            namespace: "creator-analytics",
            name: "isClientSessionDetailsV2Enabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: u.P,
        metadata: {
            namespace: "creator-analytics",
            name: "isObservabilityDataCapturesEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: u.Y,
        metadata: {
            namespace: "creator-analytics",
            name: "isRaqiv2RequestQueryEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: c.p,
        metadata: {
            namespace: "creator-business",
            name: "isRevenueShareAgreementsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: c.O,
        metadata: {
            namespace: "creator-business",
            name: "enableVirtualTransactionsTab",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: c.E,
        metadata: {
            namespace: "creator-business",
            name: "newCreatorWallets",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: c.K,
        metadata: {
            namespace: "creator-business",
            name: "newTransactionsFlag",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: d.x,
        metadata: {
            namespace: "creator-creations",
            name: "isBadgeDefaultIconEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: d.t,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsUploadEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: d.G,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsSitetestUrlParsingEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: d.p,
        metadata: {
            namespace: "creator-creations",
            name: "isTextDocumentEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: d.M,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsUploadLanguageSelectEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: d.h,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsFeedIdEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: d.s,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsShareLinkEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: d.q,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsModeratedTabEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: p.Z,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerSupportAccountTranslationPreference",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: p.k,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerSupport",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: p.b,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerSupportTicketTranslation",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: p.w,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerHostedEvents",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: p.z,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerSupportCreatorTicketReroute",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: p.n,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerSupportArchive",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: p.N,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerSupportCategoryChange",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: p._,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerSupportSpamManagement",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: p.E,
        metadata: {
            namespace: "creator-gameops",
            name: "enableEarlyTestersUserOwnedGame",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: f.a,
        metadata: {
            namespace: "creator-platform",
            name: "isCreationsNavigationReorderEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: f.K,
        metadata: {
            namespace: "creator-platform",
            name: "tryOnWebButtonEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: m.f,
        metadata: {
            namespace: "creator-roadmap",
            name: "creatorRoadmapEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: v.u,
        metadata: {
            namespace: "creator-services-insights",
            name: "isCsmExtendedMetricsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: v.J,
        metadata: {
            namespace: "creator-services-insights",
            name: "isServerLogStructuredStackTracesEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: y.P,
        metadata: {
            namespace: "devex",
            name: "shouldUseWatermarkFiatCalculation",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: y.A,
        metadata: {
            namespace: "devex",
            name: "isTaxDocumentationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: h.f,
        metadata: {
            namespace: "engine-networking",
            name: "isBandwidthNetworkTabEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: g.f,
        metadata: {
            namespace: "extended-services",
            name: "isQueueServiceAnalyticsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: b.b,
        metadata: {
            namespace: "financial-platform",
            name: "ShowDevExWithholdingAmount",
            defaultValue: 100,
            valueType: "number",
            contextType: "static"
        }
    }, {
        flag: b.h,
        metadata: {
            namespace: "financial-platform",
            name: "ShowOct20ShutoffBanner",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: b.p,
        metadata: {
            namespace: "financial-platform",
            name: "isTaxDocumentationOpenToDevexEligible",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: b.u,
        metadata: {
            namespace: "financial-platform",
            name: "isTaxFormDeliveryConsentEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: b.f,
        metadata: {
            namespace: "financial-platform",
            name: "taxFormDeliveryConsentRolloutPercentage",
            defaultValue: 100,
            valueType: "number",
            contextType: "static"
        }
    }, {
        flag: b.d,
        metadata: {
            namespace: "financial-platform",
            name: "devexFinancialPolicyRolloutPercentage",
            defaultValue: 0,
            valueType: "number",
            contextType: "static"
        }
    }, {
        flag: T.B,
        metadata: {
            namespace: "game-discovery-serving",
            name: "isAcquisitionThumbnailUpsellEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: T.p,
        metadata: {
            namespace: "game-discovery-serving",
            name: "isHomeAcquisitionSignalsLayoutRefreshEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: E,
        metadata: {
            namespace: "game-engine-geometry",
            name: "enableMeshTextureApiRemoveIdVerification",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: S.f,
        metadata: {
            namespace: "game-engine-streaming",
            name: "enableExperienceLaunchTimeChart",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: I.K,
        metadata: {
            namespace: "groups",
            name: "enableGroupGameEarlyTesters",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: I.Y,
        metadata: {
            namespace: "groups",
            name: "enableGroupModerationPage",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: I.d,
        metadata: {
            namespace: "groups",
            name: "enableGroupDeactivation",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: C.O,
        metadata: {
            namespace: "immersive-ads",
            name: "isAdsPageRedesignEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: C.J,
        metadata: {
            namespace: "immersive-ads",
            name: "isManagedRewardedTabEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: C.j,
        metadata: {
            namespace: "immersive-ads",
            name: "isInGameTemplatePlacementEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: C.Z,
        metadata: {
            namespace: "immersive-ads",
            name: "managedRewardedCtrBenchmarkLow",
            defaultValue: .01,
            valueType: "number",
            contextType: "static"
        }
    }, {
        flag: C.k,
        metadata: {
            namespace: "immersive-ads",
            name: "managedRewardedCtrBenchmarkHigh",
            defaultValue: .05,
            valueType: "number",
            contextType: "static"
        }
    }, {
        flag: C.D,
        metadata: {
            namespace: "immersive-ads",
            name: "isRewardItemAnalyticsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: x.f,
        metadata: {
            namespace: "leaderboards",
            name: "isLeaderboardConfigsEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: P.$,
        metadata: {
            namespace: "localization",
            name: "imageLocalizationSettingsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: P.S,
        metadata: {
            namespace: "localization",
            name: "imageTranslationAllowlist",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: P.D,
        metadata: {
            namespace: "localization",
            name: "enableImageTranslationEnrollment",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: P.E,
        metadata: {
            namespace: "localization",
            name: "enableImageTranslationListingTab",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: P.F,
        metadata: {
            namespace: "localization",
            name: "enableSharedTranslationListComponents",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: A.Y,
        metadata: {
            namespace: "monetization",
            name: "mockManagedPricingSummary",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: A.d,
        metadata: {
            namespace: "monetization",
            name: "mockManagedPricingEvents",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: A.X,
        metadata: {
            namespace: "monetization",
            name: "mockHardCodedPrices",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: A.D,
        metadata: {
            namespace: "monetization",
            name: "isProductArchiveEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: A.s,
        metadata: {
            namespace: "monetization",
            name: "isManagedPricingHolidayFreezeAlertEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: A.$,
        metadata: {
            namespace: "monetization",
            name: "mockShopItemsExternalEligibility",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: _,
        metadata: {
            namespace: "page-migrations",
            name: "preferencesPageMigrationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: R.f,
        metadata: {
            namespace: "payouts",
            name: "enablePayoutWatermarkContributions",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "group"
        }
    }, {
        flag: O.f,
        metadata: {
            namespace: "preset-chat",
            name: "presetChatEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: V.H,
        metadata: {
            namespace: "talent-hub",
            name: "enableTalentHubV2",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: V._,
        metadata: {
            namespace: "talent-hub",
            name: "enableTalentHubV2M2",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }];
    e.s(["f", 0, U], 49001)
}, 523426, e => {
    "use strict";
    let t = (0, e.i(157700).e)({
        namespace: "anti-cheat",
        name: "enhancedAntiCheatAccess",
        defaultValue: !1
    });
    e.s(["f", 0, t])
}, 239328, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.e)({
            namespace: "avatar-marketplace",
            name: "enableCreatorShowcases",
            defaultValue: !1
        }),
        n = (0, t.e)({
            namespace: "avatar-marketplace",
            name: "enableAvatarCreationTokenCategories",
            defaultValue: !1
        }),
        i = (0, t.e)({
            namespace: "avatar-marketplace",
            name: "enableBulkMakeupTokenCreation",
            defaultValue: !1
        }),
        r = (0, t.e)({
            namespace: "avatar-marketplace",
            name: "isAutoPublishPreferencesEnabled",
            defaultValue: !1
        }),
        s = (0, t.e)({
            namespace: "avatar-marketplace",
            name: "showTaxonomyOnAvatarItemAnalyticsTab",
            defaultValue: !1
        }),
        o = (0, t.e)({
            namespace: "avatar-marketplace",
            name: "enableCoreContentGatedBanner",
            defaultValue: !1
        }),
        l = (0, t.e)({
            namespace: "avatar-marketplace",
            name: "enableTimedOptionsSunsetBanner",
            defaultValue: !1
        });
    e.s(["W", 0, n, "C", 0, i, "T", 0, o, "Z", 0, a, "x", 0, l, "D", 0, r, "n", 0, s])
}, 245299, e => {
    "use strict";
    let t = (0, e.i(157700).e)({
        namespace: "collaborative-tools",
        name: "enableEnvironments",
        defaultValue: !1
    });
    e.s(["f", 0, t])
}, 954119, e => {
    "use strict";
    let t = (0, e.i(157700).e)({
        namespace: "communities",
        name: "CreatorAnalytics",
        defaultValue: !0
    });
    e.s(["f", 0, t])
}, 134731, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.e)({
            namespace: "content-access-and-inventory",
            name: "isAssetPrivacyOptOutSurveyEnabled",
            defaultValue: !1
        }),
        n = (0, t.e)({
            namespace: "content-access-and-inventory",
            name: "isAssetAccessRequestsEnabled",
            defaultValue: !1
        }),
        i = (0, t.e)({
            namespace: "content-access-and-inventory",
            name: "isModelCustomThumbnailUploadEnabled",
            defaultValue: !1
        }),
        r = (0, t.e)({
            namespace: "content-access-and-inventory",
            name: "isAssetDependenciesViewerEnabled",
            defaultValue: !1
        }),
        s = (0, t.e)({
            namespace: "content-access-and-inventory",
            name: "isCreatorStoreVideoMultipartUploadEnabled",
            defaultValue: !1
        }),
        o = (0, t.e)({
            namespace: "content-access-and-inventory",
            name: "isPublishBeforeExposeEnabled",
            defaultValue: !1
        });
    e.s(["E", 0, n, "r", 0, r, "p", 0, a, "A", 0, s, "n", 0, i, "V", 0, o])
}, 165136, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.e)({
            namespace: "content-licensing",
            name: "isUnifiedMatchesEnabled",
            defaultValue: !1
        }),
        n = (0, t.e)({
            namespace: "content-licensing",
            name: "isExperiencePreviewEnabled",
            defaultValue: !0
        }),
        i = (0, t.e)({
            namespace: "content-licensing",
            name: "enableIpPlatformLicenseRecommendations",
            defaultValue: !1
        }),
        r = (0, t.e)({
            namespace: "content-licensing",
            name: "isImageAttachmentEnabledInLicenseApplication",
            defaultValue: !1
        }),
        s = (0, t.e)({
            namespace: "content-licensing",
            name: "isShowcaseExperiencesEnabled",
            defaultValue: !1
        }),
        o = (0, t.e)({
            namespace: "content-licensing",
            name: "isIgnoreMatchEnabled",
            defaultValue: !0
        }),
        l = (0, t.e)({
            namespace: "content-licensing",
            name: "maxCollectibleItemDetailsRequestCount",
            defaultValue: 30
        }),
        u = (0, t.e)({
            namespace: "content-licensing",
            name: "isBadgeOnlyAgreementsEnabled",
            defaultValue: !1
        }),
        c = (0, t.e)({
            namespace: "content-licensing",
            name: "isIphEarningsTotalAcrossLicenseTypesEnabled",
            defaultValue: !1
        });
    e.s(["j", 0, i, "p", 0, u, "b", 0, n, "X", 0, o, "g", 0, r, "a", 0, c, "N", 0, s, "m", 0, a, "y", 0, l])
}, 942100, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.e)({
            namespace: "content-publishing",
            name: "isPromotionalTextEnabled",
            defaultValue: !1
        }),
        n = (0, t.e)({
            namespace: "content-publishing",
            name: "isExperienceNameCharacterValidationEnabled",
            defaultValue: !1
        });
    e.s(["r", 0, n, "X", 0, a])
}, 779433, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.e)({
            namespace: "content-suitability",
            name: "questionnaireV2Allowlist",
            defaultValue: !1
        }),
        n = (0, t.e)({
            namespace: "content-suitability",
            name: "questionnaireV2Q1Release",
            defaultValue: !0
        }),
        i = (0, t.e)({
            namespace: "content-suitability",
            name: "enableProposedIarcQuestionnaire",
            defaultValue: !1
        }),
        r = (0, t.e)({
            namespace: "content-suitability",
            name: "enableStudioQuestionnaireV2",
            defaultValue: !0
        });
    e.s(["K", 0, i, "p", 0, r, "$", 0, a, "z", 0, n])
}, 9436, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.e)({
            namespace: "creator-creations",
            name: "isBadgeDefaultIconEnabled",
            defaultValue: !1
        }),
        n = (0, t.e)({
            namespace: "creator-creations",
            name: "isMomentsUploadEnabled",
            defaultValue: !1
        }),
        i = (0, t.e)({
            namespace: "creator-creations",
            name: "isMomentsSitetestUrlParsingEnabled",
            defaultValue: !1
        }),
        r = (0, t.e)({
            namespace: "creator-creations",
            name: "isTextDocumentEnabled",
            defaultValue: !1
        }),
        s = (0, t.e)({
            namespace: "creator-creations",
            name: "isMomentsUploadLanguageSelectEnabled",
            defaultValue: !1
        }),
        o = (0, t.e)({
            namespace: "creator-creations",
            name: "isMomentsFeedIdEnabled",
            defaultValue: !1
        }),
        l = (0, t.e)({
            namespace: "creator-creations",
            name: "isMomentsShareLinkEnabled",
            defaultValue: !1
        }),
        u = (0, t.e)({
            namespace: "creator-creations",
            name: "isMomentsModeratedTabEnabled",
            defaultValue: !1
        });
    e.s(["x", 0, a, "h", 0, o, "q", 0, u, "s", 0, l, "G", 0, i, "t", 0, n, "M", 0, s, "p", 0, r])
}, 846130, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.e)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportAccountTranslationPreference",
            defaultValue: !1
        }),
        n = (0, t.e)({
            namespace: "creator-gameops",
            name: "enablePlayerSupport",
            defaultValue: !1
        }),
        i = (0, t.e)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportTicketTranslation",
            defaultValue: !1
        }),
        r = (0, t.e)({
            namespace: "creator-gameops",
            name: "enablePlayerHostedEvents",
            defaultValue: !1
        }),
        s = (0, t.e)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportCreatorTicketReroute",
            defaultValue: !1
        }),
        o = (0, t.e)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportArchive",
            defaultValue: !1
        }),
        l = (0, t.e)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportCategoryChange",
            defaultValue: !1
        }),
        u = (0, t.e)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportSpamManagement",
            defaultValue: !1
        }),
        c = (0, t.e)({
            namespace: "creator-gameops",
            name: "enableEarlyTestersUserOwnedGame",
            defaultValue: !1
        });
    e.s(["E", 0, c, "w", 0, r, "k", 0, n, "Z", 0, a, "n", 0, o, "N", 0, l, "z", 0, s, "_", 0, u, "b", 0, i])
}, 787617, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.e)({
            namespace: "creator-platform",
            name: "isCreationsNavigationReorderEnabled",
            defaultValue: !1
        }),
        n = (0, t.e)({
            namespace: "creator-platform",
            name: "tryOnWebButtonEnabled",
            defaultValue: !1
        });
    e.s(["a", 0, a, "K", 0, n])
}, 360894, e => {
    "use strict";
    let t = (0, e.i(157700).e)({
        namespace: "creator-roadmap",
        name: "creatorRoadmapEnabled",
        defaultValue: !1
    });
    e.s(["f", 0, t])
}, 704211, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.e)({
            namespace: "creator-services-insights",
            name: "isCsmExtendedMetricsEnabled",
            defaultValue: !1
        }),
        n = (0, t.e)({
            namespace: "creator-services-insights",
            name: "isServerLogStructuredStackTracesEnabled",
            defaultValue: !1
        });
    e.s(["u", 0, a, "J", 0, n])
}, 926415, e => {
    "use strict";
    let t = (0, e.i(157700).e)({
        namespace: "engine-networking",
        name: "isBandwidthNetworkTabEnabled",
        defaultValue: !1
    });
    e.s(["f", 0, t])
}, 481186, e => {
    "use strict";
    let t = (0, e.i(157700).e)({
        namespace: "extended-services",
        name: "isQueueServiceAnalyticsEnabled",
        defaultValue: !1
    });
    e.s(["f", 0, t])
}, 242002, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.e)({
            namespace: "game-discovery-serving",
            name: "isAcquisitionThumbnailUpsellEnabled",
            defaultValue: !0
        }),
        n = (0, t.e)({
            namespace: "game-discovery-serving",
            name: "isHomeAcquisitionSignalsLayoutRefreshEnabled",
            defaultValue: !1
        });
    e.s(["B", 0, a, "p", 0, n])
}, 967230, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.e)({
            namespace: "immersive-ads",
            name: "isAdsPageRedesignEnabled",
            defaultValue: !1
        }),
        n = (0, t.e)({
            namespace: "immersive-ads",
            name: "isManagedRewardedTabEnabled",
            defaultValue: !1
        }),
        i = (0, t.e)({
            namespace: "immersive-ads",
            name: "isInGameTemplatePlacementEnabled",
            defaultValue: !1
        }),
        r = (0, t.e)({
            namespace: "immersive-ads",
            name: "managedRewardedCtrBenchmarkLow",
            defaultValue: .01
        }),
        s = (0, t.e)({
            namespace: "immersive-ads",
            name: "managedRewardedCtrBenchmarkHigh",
            defaultValue: .05
        }),
        o = (0, t.e)({
            namespace: "immersive-ads",
            name: "isRewardItemAnalyticsEnabled",
            defaultValue: !1
        });
    e.s(["O", 0, a, "j", 0, i, "J", 0, n, "D", 0, o, "k", 0, s, "Z", 0, r])
}, 82899, e => {
    "use strict";
    let t = (0, e.i(157700).e)({
        namespace: "leaderboards",
        name: "isLeaderboardConfigsEnabled",
        defaultValue: !0
    });
    e.s(["f", 0, t])
}, 199972, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.e)({
            namespace: "localization",
            name: "imageLocalizationSettingsEnabled",
            defaultValue: !1
        }),
        n = (0, t.e)({
            namespace: "localization",
            name: "imageTranslationAllowlist",
            defaultValue: !1
        }),
        i = (0, t.e)({
            namespace: "localization",
            name: "enableImageTranslationEnrollment",
            defaultValue: !1
        }),
        r = (0, t.e)({
            namespace: "localization",
            name: "enableImageTranslationListingTab",
            defaultValue: !1
        }),
        s = (0, t.e)({
            namespace: "localization",
            name: "enableSharedTranslationListComponents",
            defaultValue: !1
        });
    e.s(["D", 0, i, "E", 0, r, "F", 0, s, "$", 0, a, "S", 0, n])
}, 477797, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.e)({
            namespace: "monetization",
            name: "mockManagedPricingSummary",
            defaultValue: !1
        }),
        n = (0, t.e)({
            namespace: "monetization",
            name: "mockManagedPricingEvents",
            defaultValue: !1
        }),
        i = (0, t.e)({
            namespace: "monetization",
            name: "mockHardCodedPrices",
            defaultValue: !1
        }),
        r = (0, t.e)({
            namespace: "monetization",
            name: "isProductArchiveEnabled",
            defaultValue: !1
        }),
        s = (0, t.e)({
            namespace: "monetization",
            name: "isManagedPricingHolidayFreezeAlertEnabled",
            defaultValue: !1
        }),
        o = (0, t.e)({
            namespace: "monetization",
            name: "mockShopItemsExternalEligibility",
            defaultValue: !1
        });
    e.s(["s", 0, s, "D", 0, r, "X", 0, i, "d", 0, n, "Y", 0, a, "$", 0, o])
}, 100022, e => {
    "use strict";
    let t = (0, e.i(157700).e)({
        namespace: "payouts",
        name: "enablePayoutWatermarkContributions",
        defaultValue: !0
    });
    e.s(["f", 0, t])
}, 494192, e => {
    "use strict";
    let t = (0, e.i(157700).e)({
        namespace: "preset-chat",
        name: "presetChatEnabled",
        defaultValue: !1
    });
    e.s(["f", 0, t])
}, 378089, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.e)({
            namespace: "talent-hub",
            name: "enableTalentHubV2",
            defaultValue: !1
        }),
        n = (0, t.e)({
            namespace: "talent-hub",
            name: "enableTalentHubV2M2",
            defaultValue: !1
        });
    e.s(["H", 0, a, "_", 0, n])
}, 814984, e => {
    "use strict";
    let t = (0, e.i(650502).l)("access-management"),
        a = encodeURIComponent("studio/CollaborationSettings"),
        n = async function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0,
                a = await fetch(e, {
                    credentials: "include"
                }),
                i = a.status % 100 * 100;
            if (!a.ok && 500 === i && t < 2) return await new Promise(e => {
                setTimeout(e, 2 ** (t + 1) * 500)
            }), n(e, t + 1);
            if (500 === i && 2 === t) throw Error("Failed to get feature access after 3 attempts");
            let r = await a.json();
            if ("object" != typeof r || null === r || !("access" in r)) throw Error('"access" not found in response');
            return r.access
        }, i = async () => await n("".concat(t, "/v1/upsell-feature-access?nameSpace=").concat(a, "&featureName=").concat("ShouldShowCreatorHubBanner")) === "Granted";
    e.s(["f", 0, i])
}, 904969, e => {
    "use strict";
    e.s(["A", 0, "2030-01-01T00:00:00.000Z", "c", 0, "2026-01-21T00:00:00.000Z", "X", 0, "2025-12-03T00:00:00.000Z", "i", 0, "https://www.roblox.com/my/account?creatorCollaboration", "$", 0, "https://devforum.roblox.com/t/age-check-notifications-in-studio-and-creator-hub/4117693", "v", 0, "https://www.roblox.com/my/account?creatorCollaboration", "M", 0, "https://devforum.roblox.com/t/age-check-notifications-in-studio-and-creator-hub/4117693"])
}, 906791, e => {
    "use strict";
    var t = e.i(785517),
        a = e.i(643766),
        n = e.i(458451),
        i = e.i(889311),
        r = e.i(823062),
        s = e.i(814984),
        o = e.i(904969);
    let l = "CreatorHub.AgeVerificationBannerSettings",
        u = async () => {
            localStorage.removeItem(l)
        }, c = async () => {
            let e, t = localStorage.getItem(l);
            if (!t) return !1;
            try {
                let {
                    dismissedAt: a
                } = (e => {
                    let t = JSON.parse(e);
                    if (!(null == t ? void 0 : t.dismissedAt)) throw Error("Dismissed date must be set");
                    let a = new Date(t.dismissedAt);
                    if (Number.isNaN(a.getTime())) throw TypeError("Dismissed date string is not a valid date string");
                    if (a.getTime() > Date.now()) throw Error("Dismissed date cannot be in the future");
                    return {
                        dismissedAt: a
                    }
                })(t);
                e = a
            } catch (e) {
                return u(), !1
            }
            let a = new Date;
            return e.getFullYear() === a.getFullYear() && e.getMonth() === a.getMonth() && e.getDate() === a.getDate()
        }, d = async () => {
            localStorage.setItem(l, JSON.stringify({
                dismissedAt: new Date().toISOString()
            }))
        }, p = (0, a.createContext)({
            isBannerVisible: !1,
            isBannerEligible: !1,
            isHighPriority: !1,
            dismissBanner: () => Promise.reject(Error("dismissBanner not implemented")),
            variant: "ageVerification"
        }), f = e => {
            let t = new Date(e);
            return new Date(t.getUTCFullYear(), t.getUTCMonth(), t.getUTCDate())
        }, m = async () => await (0, s.f)() ? "ageVerification" : "doNotShow";
    e.s(["G", 0, e => {
        let {
            children: s
        } = e, [l, u] = (0, a.useState)(!0), [v, y] = (0, a.useState)("doNotShow"), {
            isFetched: h,
            user: g
        } = (0, n.s)(), {
            unifiedLogger: b
        } = (0, r.X)(), {
            isHighPriority: T,
            isEnabled: w
        } = (0, a.useMemo)(() => {
            let e = f(o.X),
                t = f(o.A),
                a = f(o.c),
                n = new Date;
            return {
                isHighPriority: a <= n,
                isEnabled: e <= n && n < t
            }
        }, []), E = (0, a.useCallback)(async () => {
            await d(), u(!0)
        }, [u]);
        (0, a.useEffect)(() => {
            w && h && (null == g ? void 0 : g.id) && (async () => {
                let e = !1;
                try {
                    e = await c()
                } catch (e) {
                    b.logErrorEvent({
                        eventName: i.f.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "isDismissedToday",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                u(e);
                let t = "doNotShow";
                try {
                    t = await m()
                } catch (e) {
                    b.logErrorEvent({
                        eventName: i.f.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "getEligibility",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                y(t)
            })().catch(e => {
                b.logErrorEvent({
                    eventName: i.f.AgeVerificationUpsellBannerError,
                    parameters: {
                        branch: "runAsync",
                        error: e instanceof Error ? e.message : String(e)
                    }
                })
            })
        }, [w, h, g, b]);
        let S = (0, a.useMemo)(() => {
            let e = w && "doNotShow" !== v;
            return {
                isBannerVisible: e && !l,
                isBannerEligible: e,
                isHighPriority: T,
                variant: "doNotShow" !== v ? v : "ageVerification",
                dismissBanner: E
            }
        }, [w, v, l, T, E]);
        return (0, t.jsx)(p.Provider, {
            value: S,
            children: s
        })
    }, "p", 0, () => (0, a.useContext)(p)], 906791)
}, 401263, 884213, e => {
    "use strict";
    var t = e.i(643766);
    let a = /{(.+?)}/g,
        n = (e, t) => void 0 === t || 0 === Object.keys(t).length ? e : e.replace(a, (e, a) => {
            var n;
            return null != (n = t[a]) ? n : "{".concat(a, "}")
        });
    e.s(["f", 0, n], 884213);
    let i = /{(.+?)}/,
        r = /({.+?})/g,
        s = /^[a-zA-Z0-9-]+\.(?:capture-loopback\.)?chromatic\.com$/,
        o = /(?:^|\.)robloxlabs\.com$/,
        l = () => {
            let e, t = s.test(window.location.hostname),
                a = window.location.hostname.includes("localhost"),
                n = "string" == typeof(e = window.location.hostname) && o.test(e);
            return {
                isSSR: !1,
                isAllowed: t || a || n,
                isDangerous: t || n,
                preferLoadedTranslations: n
            }
        },
        u = (e, t) => t.isDangerous ? "[!!".concat(e, "!!]") : e;
    var c = e.i(730530);
    e.s(["f", 0, e => {
        let {
            ready: a,
            translate: s,
            translateHTML: o,
            translateWithNamespace: d,
            translateWithNamespaceHTML: p
        } = e, f = (0, t.useMemo)(() => ({
            ready: a,
            translate: s,
            translateHTML: o,
            translateWithNamespace: d,
            translateWithNamespaceHTML: p
        }), [a, s, o, d, p]);
        return (0, t.useMemo)(() => {
            let e = {
                ready: f.ready,
                translate: (0, c.O)(f),
                translateHTML: (0, c.t)(f),
                translateWithNamespace: f.translateWithNamespace,
                translateWithNamespaceHTML: f.translateWithNamespaceHTML
            };
            return {
                ...e,
                tPendingTranslation: (e => {
                    let {
                        ready: t,
                        translate: a
                    } = e;
                    return (e, i, r, s) => {
                        let o = l();
                        if (!o.isAllowed) return a(r, s);
                        if (o.preferLoadedTranslations && t) {
                            let e = a(r, s);
                            if (e.length > 0) return e
                        }
                        return n(o.preferLoadedTranslations && !t ? e : u(e, o), s)
                    }
                })(e),
                tPendingHtmlTranslation: (e => {
                    let {
                        ready: a,
                        translateHTML: s
                    } = e;
                    return (e, o, c, d, p) => {
                        let f = l();
                        if (!f.isAllowed) return s(c, d, p);
                        if (f.preferLoadedTranslations && a) {
                            let e = s(c, d, p);
                            if ("" !== e) return e
                        }
                        return ((e, a, s) => {
                            let o, l;
                            if (void 0 === a && void 0 === s) return e;
                            let {
                                stringArgs: u,
                                htmlArgs: c
                            } = (o = {}, l = {}, void 0 === s || Object.entries(s).forEach(e => {
                                let [t, a] = e;
                                "string" == typeof a ? o[t] = a : l[t] = a
                            }), {
                                stringArgs: o,
                                htmlArgs: l
                            }), d = n(e, u), p = d.split(r).filter(e => !!e);
                            if (1 === p.length) return d;
                            let f = [...p];
                            if (0 !== Object.keys(c).length) {
                                let e = p.reduce((e, t, a) => {
                                    let n = i.exec(t);
                                    if (n) {
                                        let t = n[1];
                                        if (Object.hasOwn(c, t)) {
                                            let n = e[t];
                                            if (!n) return Object.assign(e, {
                                                [t]: [a]
                                            });
                                            n.push(a)
                                        }
                                    }
                                    return e
                                }, {});
                                Object.entries(c).forEach(t => {
                                    let [a, n] = t, i = e[a];
                                    i && i.forEach(e => {
                                        f[e] = n
                                    })
                                })
                            }
                            if (!Array.isArray(a) || 0 === a.length) return (0, t.createElement)(t.Fragment, null, ...f);
                            let m = a.reduce((e, t) => {
                                    let {
                                        opening: a,
                                        closing: n,
                                        content: i
                                    } = t;
                                    return Object.assign(e, {
                                        ["{".concat(a, "}")]: {
                                            match: "{".concat(n, "}"),
                                            content: i
                                        }
                                    })
                                }, {}),
                                v = [],
                                y = [],
                                h = [];
                            for (let e = f.shift(); void 0 !== e; e = f.shift())
                                if ("string" == typeof e && i.test(e))
                                    if (Object.hasOwn(m, e)) y.push(e), h.push(e);
                                    else {
                                        let a = y.pop();
                                        if (void 0 !== a) {
                                            let {
                                                match: n,
                                                content: i
                                            } = m[a];
                                            if (e !== n) break;
                                            let r = [],
                                                s = !1;
                                            for (; h.length > 0 && !s;) {
                                                let e = h.pop();
                                                e === a ? s = !0 : r.unshift(e)
                                            }
                                            let o = i(r.every(e => "string" == typeof e) ? r : (0, t.createElement)(t.Fragment, null, ...r));
                                            0 === h.length ? v.push(o) : h.push(o)
                                        }
                                    }
                            else 0 === h.length ? v.push(e) : h.push(e);
                            return (0, t.createElement)(t.Fragment, null, ...v)
                        })(f.preferLoadedTranslations && !a ? e : u(e, f), d, p)
                    }
                })(e)
            }
        }, [f])
    }], 401263)
}, 419652, e => {
    "use strict";
    let t = (0, e.i(643766).createContext)({
        droppedFile: void 0,
        updateDroppedFile: () => {}
    });
    t.displayName = "CreateAssetForm", e.s(["f", 0, t])
}, 968439, e => {
    "use strict";
    var t, a = e.i(805290),
        n = e.i(532308),
        i = e.i(272593),
        r = ((t = {}).PrivacyPolicyUri = "privacyPolicyUri", t.TermsOfServiceUri = "termsOfServiceUri", t.Summary = "summary", t.Name = "name", t.CategoryJustification = "categoryJustification", t.VideoUri = "videoUri", t.RequestedCategory = "requestedCategory", t);
    let s = new class {
            createApplicationForUser(e) {
                return this.applicationApi.applicationCreateApplicationForUser(e)
            }
            createApplicationForGroup(e) {
                return this.applicationApi.applicationCreateApplicationForGroup(e)
            }
            getApplication(e) {
                return this.applicationApi.applicationGetApplication(e)
            }
            updateApplication(e) {
                return this.applicationApi.applicationUpdateApplication(e)
            }
            uploadApplicationImage(e) {
                return this.applicationApi.applicationUploadApplicationImage(e)
            }
            deleteApplication(e) {
                return this.applicationApi.applicationDeleteApplication(e)
            }
            listApplicationsForUser(e) {
                return this.applicationApi.applicationListApplicationsForUser(e)
            }
            listApplicationsForGroup(e) {
                return this.applicationApi.applicationListApplicationsForGroup(e)
            }
            getScopesConfiguration() {
                return this.scopeApi.scopeGetScopes()
            }
            regenerateApplicationSecret(e) {
                return this.applicationApi.applicationRegenerateApplicationSecret(e)
            }
            getMetadataInformation() {
                return this.applicationApi.applicationGetApplicationManagementMetadata()
            }
            publishApplication(e) {
                return this.applicationApi.applicationPublishApplication(e)
            }
            constructor() {
                (0, a._)(this, "applicationApi", void 0), (0, a._)(this, "scopeApi", void 0);
                let e = (0, i.f)("oauth", "bedev2");
                this.applicationApi = new n.E(e), this.scopeApi = new n.l(e)
            }
        },
        o = (0, i.f)("oauth", "bedev2"),
        l = new n.d(o),
        u = new n.I(o);
    e.s(["Z", 0, {
        authorizationApi: l,
        discoveryApi: u
    }, "o", () => r, "U", 0, s])
}, 6923, 80338, e => {
    "use strict";
    var t = e.i(415858),
        a = function(e, t) {
            return (a = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var a in t) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a])
            })(e, t)
        };

    function n(e, t, a, n) {
        return new(a || (a = Promise))(function(i, r) {
            function s(e) {
                try {
                    l(n.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function o(e) {
                try {
                    l(n.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function l(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof a ? t : new a(function(e) {
                    e(t)
                })).then(s, o)
            }
            l((n = n.apply(e, t || [])).next())
        })
    }

    function i(e, t) {
        var a, n, i, r = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return s.next = o(0), s.throw = o(1), s.return = o(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
            return this
        }), s;

        function o(o) {
            return function(l) {
                var u = [o, l];
                if (a) throw TypeError("Generator is already executing.");
                for (; s && (s = 0, u[0] && (r = 0)), r;) try {
                    if (a = 1, n && (i = 2 & u[0] ? n.return : u[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, u[1])).done) return i;
                    switch (n = 0, i && (u = [2 & u[0], i.value]), u[0]) {
                        case 0:
                        case 1:
                            i = u;
                            break;
                        case 4:
                            return r.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            r.label++, n = u[1], u = [0];
                            continue;
                        case 7:
                            u = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = r.trys).length > 0 && i[i.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === u[0] && (!i || u[1] > i[0] && u[1] < i[3])) {
                                r.label = u[1];
                                break
                            }
                            if (6 === u[0] && r.label < i[1]) {
                                r.label = i[1], i = u;
                                break
                            }
                            if (i && r.label < i[2]) {
                                r.label = i[2], r.ops.push(u);
                                break
                            }
                            i[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    u = t.call(e, r)
                } catch (e) {
                    u = [6, e], n = 0
                } finally {
                    a = i = 0
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

    function r(e) {
        var a;
        return null == (a = e) ? a : {
            notificationChannel: (0, t.u)(a, "notificationChannel") ? a.notificationChannel : void 0,
            status: (0, t.u)(a, "status") ? a.status : void 0
        }
    }

    function s(e) {
        if (void 0 !== e) return null === e ? null : {
            notificationChannel: e.notificationChannel,
            status: e.status
        }
    }

    function o(e) {
        var a;
        return null == (a = e) ? a : {
            notificationType: (0, t.u)(a, "notificationType") ? a.notificationType : void 0,
            status: (0, t.u)(a, "status") ? a.status : void 0,
            localizedNotificationTypeName: (0, t.u)(a, "localizedNotificationTypeName") ? a.localizedNotificationTypeName : void 0,
            localizedNotificationTypeDescription: (0, t.u)(a, "localizedNotificationTypeDescription") ? a.localizedNotificationTypeDescription : void 0,
            notificationChannelPreferences: (0, t.u)(a, "notificationChannelPreferences") ? a.notificationChannelPreferences.map(r) : void 0
        }
    }

    function l(e) {
        if (void 0 !== e) return null === e ? null : {
            notificationType: e.notificationType,
            status: e.status,
            localizedNotificationTypeName: e.localizedNotificationTypeName,
            localizedNotificationTypeDescription: e.localizedNotificationTypeDescription,
            notificationChannelPreferences: void 0 === e.notificationChannelPreferences ? void 0 : e.notificationChannelPreferences.map(s)
        }
    }

    function u(e) {
        var a;
        return null == (a = e) ? a : {
            notificationCategoryName: (0, t.u)(a, "notificationCategoryName") ? a.notificationCategoryName : void 0,
            localizedNotificationCategoryName: (0, t.u)(a, "localizedNotificationCategoryName") ? a.localizedNotificationCategoryName : void 0,
            notifications: (0, t.u)(a, "notifications") ? a.notifications.map(o) : void 0
        }
    }

    function c(e) {
        var a;
        return null == (a = e) ? a : {
            settingType: (0, t.u)(a, "settingType") ? a.settingType : void 0,
            settingValue: (0, t.u)(a, "settingValue") ? a.settingValue : void 0
        }
    }

    function d(e, a) {
        var n, i;
        return null == e ? e : {
            emailSettings: (0, t.u)(e, "emailSettings") ? null == (n = e.emailSettings) ? n : {
                disableAllEmails: (0, t.u)(n, "disableAllEmails") ? n.disableAllEmails : void 0,
                notifyJobApplication: (0, t.u)(n, "notifyJobApplication") ? n.notifyJobApplication : void 0,
                notifyApplicantRescinded: (0, t.u)(n, "notifyApplicantRescinded") ? n.notifyApplicantRescinded : void 0,
                notifyNewMessage: (0, t.u)(n, "notifyNewMessage") ? n.notifyNewMessage : void 0,
                notifyApplicationStatus: (0, t.u)(n, "notifyApplicationStatus") ? n.notifyApplicationStatus : void 0,
                notifyInviteToJob: (0, t.u)(n, "notifyInviteToJob") ? n.notifyInviteToJob : void 0
            } : void 0,
            privacySettings: (0, t.u)(e, "privacySettings") ? null == (i = e.privacySettings) ? i : {
                talentHubRestrictions: (0, t.u)(i, "talentHubRestrictions") ? i.talentHubRestrictions : void 0
            } : void 0
        }
    }
    var p = function(e) {
        function r() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function n() {
                this.constructor = e
            }
            a(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
        }(r, e), r.prototype.v1NotificationsSettingsPatchRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/notifications/settings",
                                schemaPath: "/v1/notifications/settings",
                                method: "PATCH",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        userId: e.userId,
                                        notificationsSettings: void 0 === e.notificationsSettings ? void 0 : e.notificationsSettings.map(l)
                                    }
                                }(e.v1NotificationsSettingsPatchRequest)
                            }, a)];
                        case 1:
                            return s = i.sent(), [2, new t.H(s)]
                    }
                })
            })
        }, r.prototype.v1NotificationsSettingsPatch = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.v1NotificationsSettingsPatchRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, r.prototype.v1NotificationsSettingsPostRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/notifications/settings",
                                schemaPath: "/v1/notifications/settings",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        userId: e.userId,
                                        notificationChannels: e.notificationChannels
                                    }
                                }(e.v1NotificationsSettingsPostRequest)
                            }, a)];
                        case 1:
                            return s = i.sent(), [2, new t.H(s, function(e) {
                                return null == e ? e : {
                                    categories: (0, t.u)(e, "categories") ? e.categories.map(u) : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.v1NotificationsSettingsPost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.v1NotificationsSettingsPostRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, r.prototype.v1NotificationsUnsubscribePostRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/notifications/unsubscribe",
                                schemaPath: "/v1/notifications/unsubscribe",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        userId: e.userId,
                                        hash: e.hash,
                                        choice: e.choice,
                                        notificationType: e.notificationType
                                    }
                                }(e.v1NotificationsUnsubscribePostRequest)
                            }, a)];
                        case 1:
                            return s = i.sent(), [2, new t.H(s)]
                    }
                })
            })
        }, r.prototype.v1NotificationsUnsubscribePost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.v1NotificationsUnsubscribePostRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, r.prototype.v1NotificationsValidatePostRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/notifications/validate",
                                schemaPath: "/v1/notifications/validate",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        userId: e.userId,
                                        hash: e.hash,
                                        notificationType: e.notificationType
                                    }
                                }(e.v1NotificationsValidatePostRequest)
                            }, a)];
                        case 1:
                            return s = i.sent(), [2, new t.H(s)]
                    }
                })
            })
        }, r.prototype.v1NotificationsValidatePost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.v1NotificationsValidatePostRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, r.prototype.v1SettingsPatchRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/settings",
                                schemaPath: "/v1/settings",
                                method: "PATCH",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        userId: e.userId,
                                        settingsType: e.settingsType,
                                        talentHubSettings: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                emailSettings: function(e) {
                                                    if (void 0 !== e) return null === e ? null : {
                                                        disableAllEmails: e.disableAllEmails,
                                                        notifyJobApplication: e.notifyJobApplication,
                                                        notifyApplicantRescinded: e.notifyApplicantRescinded,
                                                        notifyNewMessage: e.notifyNewMessage,
                                                        notifyApplicationStatus: e.notifyApplicationStatus,
                                                        notifyInviteToJob: e.notifyInviteToJob
                                                    }
                                                }(e.emailSettings),
                                                privacySettings: function(e) {
                                                    if (void 0 !== e) return null === e ? null : {
                                                        talentHubRestrictions: e.talentHubRestrictions
                                                    }
                                                }(e.privacySettings)
                                            }
                                        }(e.talentHubSettings)
                                    }
                                }(e.updateCreatorSettingsByUserIdAndSettingsTypeRequest)
                            }, a)];
                        case 1:
                            return s = i.sent(), [2, new t.H(s, function(e) {
                                return null == e ? e : {
                                    userId: (0, t.u)(e, "userId") ? e.userId : void 0,
                                    settingsType: (0, t.u)(e, "settingsType") ? e.settingsType : void 0,
                                    talentHubSettings: (0, t.u)(e, "talentHubSettings") ? d(e.talentHubSettings) : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.v1SettingsPatch = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.v1SettingsPatchRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, r.prototype.v1SettingsPostRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/settings",
                                schemaPath: "/v1/settings",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        userId: e.userId,
                                        settingsType: e.settingsType
                                    }
                                }(e.getOrCreateCreatorSettingsByUserIdAndSettingsTypeRequest)
                            }, a)];
                        case 1:
                            return s = i.sent(), [2, new t.H(s, function(e) {
                                return null == e ? e : {
                                    userId: (0, t.u)(e, "userId") ? e.userId : void 0,
                                    settingsType: (0, t.u)(e, "settingsType") ? e.settingsType : void 0,
                                    isCreated: (0, t.u)(e, "isCreated") ? e.isCreated : void 0,
                                    talentHubSettings: (0, t.u)(e, "talentHubSettings") ? d(e.talentHubSettings) : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.v1SettingsPost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.v1SettingsPostRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, r.prototype.v1SettingsUserIdUserIdSettingsTypeSettingsTypeDeleteRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.w("userId", "Required parameter requestParameters.userId was null or undefined when calling v1SettingsUserIdUserIdSettingsTypeSettingsTypeDelete.");
                            if (null === e.settingsType || void 0 === e.settingsType) throw new t.w("settingsType", "Required parameter requestParameters.settingsType was null or undefined when calling v1SettingsUserIdUserIdSettingsTypeSettingsTypeDelete.");
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/settings/user_id/{userId}/settings_type/{settingsType}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))).replace("{".concat("settingsType", "}"), encodeURIComponent(String(e.settingsType))),
                                schemaPath: "/v1/settings/user_id/{userId}/settings_type/{settingsType}",
                                method: "DELETE",
                                headers: r,
                                query: n
                            }, a)];
                        case 1:
                            return s = i.sent(), [2, new t.H(s, function(e) {
                                return null == e ? e : {
                                    isSuccess: (0, t.u)(e, "isSuccess") ? e.isSuccess : void 0,
                                    settingsType: (0, t.u)(e, "settingsType") ? e.settingsType : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.v1SettingsUserIdUserIdSettingsTypeSettingsTypeDelete = function(e, t) {
            return n(this, void 0, void 0, function() {
                return i(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.v1SettingsUserIdUserIdSettingsTypeSettingsTypeDeleteRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, r.prototype.v1UnsubscribeUnsubscribePostRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/unsubscribe/unsubscribe",
                                schemaPath: "/v1/unsubscribe/unsubscribe",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        userId: e.userId,
                                        hash: e.hash,
                                        unsubscribeType: e.unsubscribeType
                                    }
                                }(e.v1UnsubscribeUnsubscribePostRequest)
                            }, a)];
                        case 1:
                            return s = i.sent(), [2, new t.H(s, function(e) {
                                return null == e ? e : {
                                    isSuccess: (0, t.u)(e, "isSuccess") ? e.isSuccess : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.v1UnsubscribeUnsubscribePost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.v1UnsubscribeUnsubscribePostRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, r.prototype.v1UnsubscribeValidatePostRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/unsubscribe/validate",
                                schemaPath: "/v1/unsubscribe/validate",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        userId: e.userId,
                                        hash: e.hash,
                                        unsubscribeType: e.unsubscribeType
                                    }
                                }(e.v1UnsubscribeValidatePostRequest)
                            }, a)];
                        case 1:
                            return s = i.sent(), [2, new t.H(s, function(e) {
                                return null == e ? e : {
                                    isValid: (0, t.u)(e, "isValid") ? e.isValid : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.v1UnsubscribeValidatePost = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.v1UnsubscribeValidatePostRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, r.prototype.v2SettingsUserUserIdGetRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.w("userId", "Required parameter requestParameters.userId was null or undefined when calling v2SettingsUserUserIdGet.");
                            return n = {}, void 0 !== e.maxPageSize && (n.maxPageSize = e.maxPageSize), void 0 !== e.pageToken && (n.pageToken = e.pageToken), r = {}, [4, this.request({
                                path: "/v2/settings/user/{userId}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v2/settings/user/{userId}",
                                method: "GET",
                                headers: r,
                                query: n
                            }, a)];
                        case 1:
                            return s = i.sent(), [2, new t.H(s, function(e) {
                                return null == e ? e : {
                                    userId: (0, t.u)(e, "userId") ? e.userId : void 0,
                                    settings: (0, t.u)(e, "settings") ? e.settings.map(c) : void 0,
                                    nextPageToken: (0, t.u)(e, "nextPageToken") ? e.nextPageToken : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.v2SettingsUserUserIdGet = function(e, t) {
            return n(this, void 0, void 0, function() {
                return i(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.v2SettingsUserUserIdGetRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, r.prototype.v2SettingsUserUserIdSettingSettingTypeGetRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.w("userId", "Required parameter requestParameters.userId was null or undefined when calling v2SettingsUserUserIdSettingSettingTypeGet.");
                            if (null === e.settingType || void 0 === e.settingType) throw new t.w("settingType", "Required parameter requestParameters.settingType was null or undefined when calling v2SettingsUserUserIdSettingSettingTypeGet.");
                            return n = {}, r = {}, [4, this.request({
                                path: "/v2/settings/user/{userId}/setting/{settingType}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))).replace("{".concat("settingType", "}"), encodeURIComponent(String(e.settingType))),
                                schemaPath: "/v2/settings/user/{userId}/setting/{settingType}",
                                method: "GET",
                                headers: r,
                                query: n
                            }, a)];
                        case 1:
                            return s = i.sent(), [2, new t.H(s, function(e) {
                                return null == e ? e : {
                                    userId: (0, t.u)(e, "userId") ? e.userId : void 0,
                                    settingType: (0, t.u)(e, "settingType") ? e.settingType : void 0,
                                    settingValue: (0, t.u)(e, "settingValue") ? e.settingValue : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.v2SettingsUserUserIdSettingSettingTypeGet = function(e, t) {
            return n(this, void 0, void 0, function() {
                return i(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.v2SettingsUserUserIdSettingSettingTypeGetRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, r.prototype.v2SettingsUserUserIdSettingSettingTypePatchRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var n, r, s;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.w("userId", "Required parameter requestParameters.userId was null or undefined when calling v2SettingsUserUserIdSettingSettingTypePatch.");
                            if (null === e.settingType || void 0 === e.settingType) throw new t.w("settingType", "Required parameter requestParameters.settingType was null or undefined when calling v2SettingsUserUserIdSettingSettingTypePatch.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v2/settings/user/{userId}/setting/{settingType}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))).replace("{".concat("settingType", "}"), encodeURIComponent(String(e.settingType))),
                                schemaPath: "/v2/settings/user/{userId}/setting/{settingType}",
                                method: "PATCH",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        userId: e.userId,
                                        settingType: e.settingType,
                                        settingValue: e.settingValue
                                    }
                                }(e.updateOrCreateGenericCreatorSettingsByUserIdAndSettingTypeRequest)
                            }, a)];
                        case 1:
                            return s = i.sent(), [2, new t.H(s, function(e) {
                                return null == e ? e : {
                                    userId: (0, t.u)(e, "userId") ? e.userId : void 0,
                                    settingType: (0, t.u)(e, "settingType") ? e.settingType : void 0,
                                    settingValue: (0, t.u)(e, "settingValue") ? e.settingValue : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.v2SettingsUserUserIdSettingSettingTypePatch = function(e, t) {
            return n(this, void 0, void 0, function() {
                return i(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.v2SettingsUserUserIdSettingSettingTypePatchRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, r
    }(t._);
    e.s(["P", 0, p, "I", 0, {
        Invalid: "GENERIC_CREATOR_SETTING_TYPE_INVALID",
        Theme: "GENERIC_CREATOR_SETTING_TYPE_THEME",
        HomeHomepageUpsell: "GENERIC_CREATOR_SETTING_TYPE_HOME_HOMEPAGE_UPSELL",
        HomeStudioDocumentationUpsell: "GENERIC_CREATOR_SETTING_TYPE_HOME_STUDIO_DOCUMENTATION_UPSELL",
        HomeShowTour: "GENERIC_CREATOR_SETTING_TYPE_HOME_SHOW_TOUR",
        DataSharingDefaults: "GENERIC_CREATOR_SETTING_TYPE_DATA_SHARING_DEFAULTS",
        ShowMinimumSpecBanner: "GENERIC_CREATOR_SETTING_TYPE_SHOW_MINIMUM_SPEC_BANNER",
        HubHomeLastViewedDate: "GENERIC_CREATOR_SETTING_TYPE_HUB_HOME_LAST_VIEWED_DATE",
        CoursesTakeSurveyBanner: "GENERIC_CREATOR_SETTING_TYPE_COURSES_TAKE_SURVEY_BANNER",
        CoursesExploreCoursesBanner: "GENERIC_CREATOR_SETTING_TYPE_COURSES_EXPLORE_COURSES_BANNER",
        HomeAgeVerificationUpsell: "GENERIC_CREATOR_SETTING_TYPE_HOME_AGE_VERIFICATION_UPSELL",
        NotificationsM2Tooltip: "GENERIC_CREATOR_SETTING_TYPE_NOTIFICATIONS_M2_TOOLTIP",
        GroupUnifiedAcknowledgement: "GENERIC_CREATOR_SETTING_TYPE_GROUP_UNIFIED_ACKNOWLEDGEMENT",
        CreatorHubNavPin: "GENERIC_CREATOR_SETTING_TYPE_CREATOR_HUB_NAV_PIN",
        PlayerSupportTranslateAll: "GENERIC_CREATOR_SETTING_TYPE_PLAYER_SUPPORT_TRANSLATE_ALL"
    }, "S", 0, {
        Invalid: "NOTIFICATION_PREFERENCE_STATUS_INVALID",
        All: "NOTIFICATION_PREFERENCE_STATUS_ALL",
        Personalized: "NOTIFICATION_PREFERENCE_STATUS_PERSONALIZED",
        None: "NOTIFICATION_PREFERENCE_STATUS_NONE"
    }, "t", 0, {
        Invalid: "UNSUBSCRIBE_CHOICE_INVALID",
        One: "UNSUBSCRIBE_CHOICE_ONE",
        All: "UNSUBSCRIBE_CHOICE_ALL"
    }], 80338);
    let f = new p((0, e.i(272593).f)("creator-settings", "bedev2"));
    e.s(["M", 0, {
        getCreatorSettings: (e, t) => {
            let a = {
                v1NotificationsSettingsPostRequest: {
                    userId: Number(e),
                    notificationChannels: t
                }
            };
            return f.v1NotificationsSettingsPost(a)
        },
        updateCreatorSettings: async (e, t) => {
            let a = {
                v1NotificationsSettingsPatchRequest: {
                    userId: Number(e),
                    notificationsSettings: t
                }
            };
            await f.v1NotificationsSettingsPatch(a)
        },
        validateUnsubscribeRequest: async (e, t, a) => {
            await f.v1NotificationsValidatePost({
                v1NotificationsValidatePostRequest: {
                    hash: e,
                    userId: Number(t),
                    notificationType: a
                }
            })
        },
        unsubscribeFromNotification: async (e, t, a, n) => {
            await f.v1NotificationsUnsubscribePost({
                v1NotificationsUnsubscribePostRequest: {
                    hash: e,
                    userId: Number(t),
                    choice: a,
                    notificationType: n
                }
            })
        }
    }, "Y", 0, {
        getGenericCreatorSetting: (e, t) => f.v2SettingsUserUserIdSettingSettingTypeGet({
            userId: e,
            settingType: t
        }),
        getGenericCreatorSettingsByUserId: e => f.v2SettingsUserUserIdGet({
            userId: e
        }),
        updateGenericCreatorSetting: (e, t, a) => f.v2SettingsUserUserIdSettingSettingTypePatch({
            userId: e,
            settingType: t,
            updateOrCreateGenericCreatorSettingsByUserIdAndSettingTypeRequest: {
                settingValue: a
            }
        })
    }], 6923)
}, 28850, e => {
    "use strict";
    var t = e.i(805290),
        a = e.i(415858),
        n = function(e, t) {
            return (n = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var a in t) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a])
            })(e, t)
        },
        i = function() {
            return (i = Object.assign || function(e) {
                for (var t, a = 1, n = arguments.length; a < n; a++)
                    for (var i in t = arguments[a]) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
                return e
            }).apply(this, arguments)
        };

    function r(e, t, a, n) {
        return new(a || (a = Promise))(function(i, r) {
            function s(e) {
                try {
                    l(n.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function o(e) {
                try {
                    l(n.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function l(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof a ? t : new a(function(e) {
                    e(t)
                })).then(s, o)
            }
            l((n = n.apply(e, t || [])).next())
        })
    }

    function s(e, t) {
        var a, n, i, r = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return s.next = o(0), s.throw = o(1), s.return = o(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
            return this
        }), s;

        function o(o) {
            return function(l) {
                var u = [o, l];
                if (a) throw TypeError("Generator is already executing.");
                for (; s && (s = 0, u[0] && (r = 0)), r;) try {
                    if (a = 1, n && (i = 2 & u[0] ? n.return : u[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, u[1])).done) return i;
                    switch (n = 0, i && (u = [2 & u[0], i.value]), u[0]) {
                        case 0:
                        case 1:
                            i = u;
                            break;
                        case 4:
                            return r.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            r.label++, n = u[1], u = [0];
                            continue;
                        case 7:
                            u = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = r.trys).length > 0 && i[i.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === u[0] && (!i || u[1] > i[0] && u[1] < i[3])) {
                                r.label = u[1];
                                break
                            }
                            if (6 === u[0] && r.label < i[1]) {
                                r.label = i[1], i = u;
                                break
                            }
                            if (i && r.label < i[2]) {
                                r.label = i[2], r.ops.push(u);
                                break
                            }
                            i[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    u = t.call(e, r)
                } catch (e) {
                    u = [6, e], n = 0
                } finally {
                    a = i = 0
                }
                if (5 & u[0]) throw u[1];
                return {
                    value: u[0] ? u[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function o(e) {
        var t;
        return null == (t = e) ? t : {
            createdAt: (0, a.u)(t, "created_at") ? new Date(t.created_at) : void 0,
            expiresAt: (0, a.u)(t, "expires_at") ? new Date(t.expires_at) : void 0,
            id: (0, a.u)(t, "id") ? t.id : void 0,
            universeId: (0, a.u)(t, "universe_id") ? t.universe_id : void 0,
            values: (0, a.u)(t, "values") ? function(e) {
                if (null == e) return e;
                if ("SelectGracePeriod" === e.type) return i(i({}, null == e ? e : {
                    decisionEventId: e.decision_event_id,
                    type: e.type,
                    version: e.version
                }), {
                    type: "SelectGracePeriod"
                });
                throw Error("No variant of CreatorAcknowledgmentValues exists with 'type=".concat(e.type, "'"))
            }(t.values) : void 0,
            visible: (0, a.u)(t, "visible") ? t.visible : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function l(e, t) {
        return null == e ? e : {
            items: (0, a.u)(e, "items") ? e.items.map(o) : void 0,
            nextCursor: (0, a.u)(e, "next_cursor") ? e.next_cursor : void 0
        }
    }

    function u(e) {
        var t;
        return null == (t = e) ? t : {
            createdAt: (0, a.u)(t, "created_at") ? new Date(t.created_at) : void 0,
            id: (0, a.u)(t, "id") ? t.id : void 0,
            policy: (0, a.u)(t, "policy") ? t.policy : void 0,
            policyLabelKey: (0, a.u)(t, "policy_label_key") ? t.policy_label_key : void 0
        }
    }
    var c = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return function(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                function a() {
                    this.constructor = e
                }
                n(e, t), e.prototype = null === t ? Object.create(t) : (a.prototype = t.prototype, new a)
            }(t, e), t.prototype.creatorTransparencyServiceGetCreatorAcknowledgmentRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, i, r;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new a.w("id", "Required parameter requestParameters.id was null or undefined when calling creatorTransparencyServiceGetCreatorAcknowledgment.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/creator-acknowledgments/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/creator-acknowledgments/{id}",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return r = s.sent(), [2, new a.H(r, function(e) {
                                    return o(e)
                                })]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceGetCreatorAcknowledgment = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.creatorTransparencyServiceGetCreatorAcknowledgmentRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceGetRestrictionRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, i, r;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.contentId || void 0 === e.contentId) throw new a.w("contentId", "Required parameter requestParameters.contentId was null or undefined when calling creatorTransparencyServiceGetRestriction.");
                                if (null === e.contentType || void 0 === e.contentType) throw new a.w("contentType", "Required parameter requestParameters.contentType was null or undefined when calling creatorTransparencyServiceGetRestriction.");
                                return n = {}, void 0 !== e.contentId && (n.content_id = e.contentId), void 0 !== e.contentType && (n.content_type = e.contentType), i = {}, [4, this.request({
                                    path: "/v1/restriction",
                                    schemaPath: "/v1/restriction",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return r = s.sent(), [2, new a.H(r, function(e) {
                                    return null == e ? e : {
                                        isRestricted: (0, a.u)(e, "is_restricted") ? e.is_restricted : void 0,
                                        restrictionMessage: (0, a.u)(e, "restriction_message") ? e.restriction_message : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceGetRestriction = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.creatorTransparencyServiceGetRestrictionRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceListCreatorAcknowledgmentsRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, i, r;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return n = {}, void 0 !== e.cursor && (n.cursor = e.cursor), void 0 !== e.limit && (n.limit = e.limit), i = {}, [4, this.request({
                                    path: "/v1/creator-acknowledgments",
                                    schemaPath: "/v1/creator-acknowledgments",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return r = s.sent(), [2, new a.H(r, function(e) {
                                    return l(e)
                                })]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceListCreatorAcknowledgments = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), s(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.creatorTransparencyServiceListCreatorAcknowledgmentsRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceListUniverseCreatorAcknowledgmentsRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, i, r;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new a.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling creatorTransparencyServiceListUniverseCreatorAcknowledgments.");
                                return n = {}, void 0 !== e.cursor && (n.cursor = e.cursor), void 0 !== e.limit && (n.limit = e.limit), i = {}, [4, this.request({
                                    path: "/v1/universes/{universe_id}/creator-acknowledgments".replace("{".concat("universe_id", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universe_id}/creator-acknowledgments",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return r = s.sent(), [2, new a.H(r, function(e) {
                                    return l(e)
                                })]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceListUniverseCreatorAcknowledgments = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.creatorTransparencyServiceListUniverseCreatorAcknowledgmentsRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceListUniverseViolationsRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, i, r;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new a.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling creatorTransparencyServiceListUniverseViolations.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/universes/{universe_id}/violations".replace("{".concat("universe_id", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universe_id}/violations",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return r = s.sent(), [2, new a.H(r, function(e) {
                                    return null == e ? e : {
                                        items: (0, a.u)(e, "items") ? e.items.map(u) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceListUniverseViolations = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.creatorTransparencyServiceListUniverseViolationsRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, t
        }(a._),
        d = a,
        p = e.i(272593);
    class f extends d._ {
        async getRestriction(e, t, a) {
            return this.api.creatorTransparencyServiceGetRestriction({
                contentId: e,
                contentType: t
            }, a)
        }
        async listCreatorAcknowledgments(e, t, a) {
            return this.api.creatorTransparencyServiceListCreatorAcknowledgments({
                cursor: e,
                limit: t
            }, a)
        }
        async listUniverseCreatorAcknowledgments(e, t, a, n) {
            return this.api.creatorTransparencyServiceListUniverseCreatorAcknowledgments({
                universeId: e,
                cursor: t,
                limit: a
            }, n)
        }
        async listUniverseViolations(e, t) {
            return this.api.creatorTransparencyServiceListUniverseViolations({
                universeId: e
            }, t)
        }
        async getUniverseViolation(e, t) {
            let a = await this.request({
                path: "/v1/universes/".concat(e, "/violations/").concat(encodeURIComponent(t)),
                schemaPath: "/v1/universes/{universe_id}/violations/{violation_id}",
                method: "GET",
                headers: {}
            });
            return new d.H(a, e => ({
                ...u(e),
                appealBy: void 0 === e.appeal_by ? void 0 : new Date(e.appeal_by),
                canAppeal: e.can_appeal,
                appeals: e.appeals.map(e => ({
                    state: e.state,
                    createdAt: new Date(e.created_at),
                    decidedAt: void 0 === e.decided_at ? void 0 : new Date(e.decided_at),
                    submitterUserId: e.submitter_user_id,
                    message: e.message
                })),
                moderatorNote: e.moderator_note
            })).value()
        }
        async createUniverseViolationAppeal(e, t, a) {
            let n = await this.request({
                path: "/v1/universes/".concat(e, "/violations/").concat(encodeURIComponent(t), "/appeals"),
                schemaPath: "/v1/universes/{universe_id}/violations/{violation_id}/appeals",
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: {
                    message: a
                }
            });
            return new d.H(n, e => ({
                state: e.state,
                createdAt: new Date(e.created_at),
                message: e.message
            })).value()
        }
        constructor() {
            let e = (0, p.f)("creator-transparency-service", "bedev2");
            super(e), (0, t._)(this, "api", void 0), this.api = new c(e)
        }
    }
    let m = new f;
    e.s(["f", 0, m], 28850)
}, 66424, 813914, e => {
    "use strict";
    var t = e.i(764967),
        a = e.i(805290),
        n = e.i(415858);
    class i extends Error {
        constructor(e, t, n) {
            super("Creator Wallets API error: ".concat(e, " ").concat(t)), (0, a._)(this, "status", void 0), (0, a._)(this, "statusText", void 0), (0, a._)(this, "body", void 0), this.name = "CreatorWalletsApiError", this.status = e, this.statusText = t, this.body = n
        }
    }
    let r = new Set(Object.values(t.P).filter(e => e !== t.P.Invalid));

    function s(e) {
        return "object" == typeof e && null !== e
    }

    function o(e) {
        return "string" == typeof e && r.has(e)
    }
    async function l(e) {
        try {
            return await e
        } catch (e) {
            if (e instanceof n.$ || e instanceof Error && "ResponseError" === e.name && "response" in e && e.response instanceof Response) {
                let t;
                try {
                    t = await e.response.clone().json()
                } catch (e) {
                    t = null
                }
                throw new i(e.response.status, e.response.statusText, t)
            }
            throw e
        }
    }

    function u(e) {
        let {
            inquiryId: t,
            sessionToken: a
        } = e;
        if (!t || !a) throw TypeError("InitializeSanctionsScreeningEmbedding returned an unexpected payload");
        return {
            inquiryId: t,
            sessionToken: a
        }
    }
    e.s(["C", 0, i, "g", 0, function(e) {
        if (!(e instanceof i) || !s(e.body)) return null;
        let {
            details: t
        } = e.body;
        if (!Array.isArray(t)) return null;
        for (let e of t) {
            if (!s(e) || !Array.isArray(e.unmetPrerequisites)) continue;
            let t = e["@type"];
            if ("string" == typeof t && !t.endsWith(".KycPrerequisitesNotMet")) continue;
            let a = e.unmetPrerequisites.filter(o);
            if (a.length > 0) return a
        }
        return null
    }, "n", 0, u, "w", 0, l], 813914);
    var c = e.i(272593);
    let d = new t.N((0, c.f)("creator-wallets", "bedev2"));

    function p(e) {
        if (void 0 === e) return;
        if (!/^[1-9]\d*$/.test(e)) throw TypeError("Creator Wallet group id must be a positive integer");
        let t = Number(e);
        if (!Number.isSafeInteger(t)) throw TypeError("Creator Wallet group id must be a safe integer");
        return t
    }
    e.s(["f", 0, {
        getOnboardingState(e, t) {
            let a = p(e);
            return l(void 0 === a ? d.v1SelfOnboardingStateGet({}, t) : d.v1GroupCreatorWalletIdGroupIdOnboardingStateGet({
                creatorWalletIdGroupId: a
            }, t))
        },
        getOnboardingRequirements: e => l(d.v1SelfOnboardingRequirementsGet({}, e)),
        selectOnboardingAccountType: e => l(d.v1SelfOnboardingAccountTypeselectPost({
            selectOnboardingAccountTypeRequest: e
        })),
        acceptOnboardingTerms: e => l(d.v1SelfOnboardingTermsacceptPost({
            acceptOnboardingTermsRequest: e
        })),
        deleteOnboardingDraft: () => l(d.v1SelfOnboardingDraftDelete({})),
        acknowledgeOnboardingStatus(e, t) {
            let a = p(t);
            return l(void 0 === a ? d.v1SelfOnboardingStatusacknowledgePost({
                acknowledgeOnboardingStatusRequest: e
            }) : d.v1GroupCreatorWalletIdGroupIdOnboardingStatusacknowledgePost({
                creatorWalletIdGroupId: a,
                acknowledgeOnboardingStatusRequest: e
            }))
        },
        getSanctionsScreening: e => l(d.v1SelfOnboardingSanctionsScreeningGet({}, e)),
        startSanctionsScreening: () => l(d.v1SelfOnboardingSanctionsScreeningstartPost({
            startSanctionsScreeningRequest: {}
        })),
        initializeSanctionsScreeningEmbedding: async () => u(await l(d.v1SelfOnboardingSanctionsScreeningEmbeddinginitializePost({
            initializeSanctionsScreeningEmbeddingRequest: {}
        }))),
        getWalletBalance(e, t) {
            let a = p(e);
            return l(void 0 === a ? d.v1SelfWalletBalanceGet({}, t) : d.v1GroupCreatorWalletIdGroupIdWalletBalanceGet({
                creatorWalletIdGroupId: a
            }, t))
        },
        getWalletEarningsEstimate(e, t) {
            let a = p(e);
            return l(void 0 === a ? d.v1SelfWalletEarningsEstimateGet({}, t) : d.v1GroupCreatorWalletIdGroupIdWalletEarningsEstimateGet({
                creatorWalletIdGroupId: a
            }, t))
        },
        listBeneficiaries(e, t, a) {
            let n = p(e),
                i = (null == a ? void 0 : a.includeArchived) ? {
                    includeArchived: !0
                } : {};
            return l(void 0 === n ? d.v1SelfWalletBeneficiariesGet(i, t) : d.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesGet({
                creatorWalletIdGroupId: n,
                ...i
            }, t))
        },
        initializeKycEmbedding(e, t) {
            let a = p(t);
            return l(void 0 === a ? d.v1SelfOnboardingKycEmbeddinginitializePost({
                initializeKycEmbeddingRequest: e
            }) : d.v1GroupCreatorWalletIdGroupIdOnboardingKycEmbeddinginitializePost({
                creatorWalletIdGroupId: a,
                initializeKycEmbeddingRequest: e
            }))
        },
        initializeKycRfiEmbedding(e, t) {
            let a = p(t);
            return l(void 0 === a ? d.v1SelfOnboardingKycRfiEmbeddinginitializePost({
                initializeKycRfiEmbeddingRequest: e
            }) : d.v1GroupCreatorWalletIdGroupIdOnboardingKycRfiEmbeddinginitializePost({
                creatorWalletIdGroupId: a,
                initializeKycRfiEmbeddingRequest: e
            }))
        },
        async initializeBeneficiaryEmbedding(e, t) {
            let a = p(t);
            return function(e) {
                let {
                    clientId: t,
                    authCode: a
                } = e;
                if ("string" != typeof t || "string" != typeof a) throw TypeError("InitializeBeneficiaryEmbedding returned an unexpected payload");
                return {
                    clientId: t,
                    authCode: a
                }
            }(await l(void 0 === a ? d.v1SelfWalletBeneficiaryEmbeddinginitializePost({
                initializeBeneficiaryEmbeddingRequest: e
            }) : d.v1GroupCreatorWalletIdGroupIdWalletBeneficiaryEmbeddinginitializePost({
                creatorWalletIdGroupId: a,
                initializeBeneficiaryEmbeddingRequest: e
            })))
        },
        async saveBeneficiary(e, t) {
            let a = p(t);
            return function(e) {
                let {
                    beneficiary: t
                } = e;
                if (!t || "string" != typeof t.beneficiaryId) throw TypeError("SaveBeneficiary returned an unexpected payload");
                return t
            }(await l(void 0 === a ? d.v1SelfWalletBeneficiariesPost({
                saveBeneficiaryRequest: e
            }) : d.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesPost({
                creatorWalletIdGroupId: a,
                saveBeneficiaryRequest: e
            })))
        },
        archiveBeneficiary(e, t) {
            let a = p(t);
            return l(void 0 === a ? d.v1SelfWalletBeneficiariesBeneficiaryIdDelete({
                beneficiaryId: e
            }) : d.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesBeneficiaryIdDelete({
                creatorWalletIdGroupId: a,
                beneficiaryId: e
            }))
        },
        initiateWithdrawal(e, t) {
            let a = p(t);
            return l(d.v1WalletWithdrawalsPost({
                initiateWithdrawalRequest: {
                    ...e,
                    creatorWalletId: void 0 === a ? e.creatorWalletId : {
                        ...e.creatorWalletId,
                        groupId: a
                    }
                }
            }))
        }
    }], 66424)
}, 998683, e => {
    "use strict";
    var t = e.i(805290),
        a = e.i(658867),
        n = e.i(272593);
    let i = new class {
        async getLocale(e) {
            return this.localeApi.v1LocalesGet(e)
        }
        async getUserLocalizationLocusSupportedLocales() {
            return this.localeApi.v1LocalesUserLocalizationLocusSupportedLocalesGet()
        }
        async getSupportedLocalesForCreators(e) {
            return this.localeApi.v1LocalesSupportedLocalesForCreatorsGet(e)
        }
        async getSupportedLocalesForFeature(e) {
            return this.localeApi.v1LocalesSupportedLocalesForFeatureGet(e)
        }
        constructor() {
            (0, t._)(this, "localeApi", void 0), this.localeApi = new a.J((0, n.f)("locale", "bedev1"))
        }
    };
    e.s(["f", 0, i])
}, 607204, e => {
    "use strict";
    var t = e.i(581395),
        a = e.i(272593),
        n = e.i(127403);
    let i = (0, a.f)("orgs", "bedev2", {
            middleware: [new n.f]
        }),
        r = new t.f(i),
        s = new t.R(i),
        o = new t.U(i),
        l = new t.V(i),
        u = new t.B(i);
    e.s(["f", 0, {
        organizationClient: {
            getOrganization: async e => r.v1OrganizationsGet({
                groupId: e
            })
        },
        invitationClient: {
            createInvitation: async (e, t) => s.v1OrganizationsOrganizationIdInvitationsPost({
                organizationId: e,
                createInvitationRequestModel: t
            }),
            getInvitationsByOrganizationId: async (e, t, a) => s.v1OrganizationsOrganizationIdInvitationsGet({
                organizationId: e,
                pageToken: t,
                maxPageSize: a
            }),
            getInvitation: async (e, t) => s.v1OrganizationsOrganizationIdInvitationsInvitationIdGet({
                organizationId: e,
                invitationId: t
            }),
            acceptOrDeclineInvitation: async (e, t, a) => s.v1OrganizationsOrganizationIdInvitationsInvitationIdPatch({
                organizationId: e,
                invitationId: t,
                updateInvitationRequestModel: a
            }),
            deleteInvitationById: async (e, t) => s.v1OrganizationsOrganizationIdInvitationsInvitationIdDelete({
                organizationId: e,
                invitationId: t
            }),
            getRoleIdsByInvitationId: async (e, t) => s.v1OrganizationsOrganizationIdInvitationsInvitationIdRoleIdsGet({
                organizationId: e,
                invitationId: t
            })
        },
        roleClient: {
            createRole: async (e, t) => o.v1OrganizationsOrganizationIdRolesPost({
                organizationId: e,
                createOrUpdateRoleRequestModel: t
            }),
            getRoleMetadata: async (e, t, a) => o.v1OrganizationsOrganizationIdRolesRoleIdMetadataGet({
                organizationId: e,
                roleId: t,
                isDefault: a
            }),
            updateRoleMetadata: async (e, t, a) => o.v1OrganizationsOrganizationIdRolesRoleIdMetadataPatch({
                organizationId: e,
                roleId: t,
                createOrUpdateRoleRequestModel: a
            }),
            updateRolePosition: async (e, t, a) => o.v1OrganizationsOrganizationIdRolesRoleIdPositionPatch({
                organizationId: e,
                roleId: t,
                updateRolePositionRequestModel: a
            }),
            getRolesByOrganization: async (e, t, a) => o.v1OrganizationsOrganizationIdRolesGet({
                organizationId: e,
                pageToken: t,
                maxPageSize: a
            }),
            deleteRole: async (e, t) => o.v1OrganizationsOrganizationIdRolesRoleIdDelete({
                organizationId: e,
                roleId: t
            }),
            getInvitationsWithRole: async (e, t, a, n) => o.v1OrganizationsOrganizationIdRolesRoleIdInvitationsGet({
                organizationId: e,
                roleId: t,
                pageToken: a,
                maxPageSize: n
            })
        },
        userClient: {
            getUserInvitationByOrganization: async (e, t) => l.v1OrganizationsOrganizationIdUsersUserIdInvitationsGet({
                organizationId: e,
                userId: t
            }),
            addUserToOrganization: async (e, t) => l.v1OrganizationsOrganizationIdUsersUserIdPost({
                organizationId: e,
                userId: t
            })
        },
        groupUniversePayoutClient: {
            getUniversePayouts: async e => u.v1OrganizationsOrganizationIdPayoutsUniverseIdGet(e),
            updateUniversePayouts: async e => u.v1OrganizationsOrganizationIdPayoutsUniverseIdPatch(e),
            findUniversePayouts: async e => u.v1OrganizationsOrganizationIdPayoutsUniversesGet(e),
            getLatestOneTimePayoutForUsers: async (e, t) => {
                let a = {
                    organizationId: e,
                    userIds: t.map(String)
                };
                return u.v1OrganizationsOrganizationIdPayoutsLatestGet(a)
            },
            getSuggestedPayouts: async e => u.v1OrganizationsOrganizationIdPayoutsSuggestedGet({
                organizationId: e
            })
        }
    }])
}, 196990, e => {
    "use strict";
    var t = e.i(805290),
        a = e.i(623127),
        n = e.i(272593);
    let i = new class {
        async acceptUserAgreements(e) {
            let t = {
                insertAcceptancesRequest: {
                    acceptances: e.map(e => ({
                        agreementId: e
                    }))
                }
            };
            return this.acceptanceApi.acceptanceInsert(t)
        }
        async getLuobuUserAgreement(e) {
            return (await this.agreementResolutionApi.agreementResolutionGetByContext({
                clientType: e.clientType
            })).filter(e => e.regulationType !== a.z.Luobu)
        }
        getUserAgreements(e) {
            return this.agreementResolutionApi.agreementResolutionGetByContext(e)
        }
        constructor() {
            (0, t._)(this, "agreementResolutionApi", void 0), (0, t._)(this, "acceptanceApi", void 0);
            let e = (0, n.f)("user-agreements", "bedev2");
            this.agreementResolutionApi = new a.g(e), this.acceptanceApi = new a.b(e)
        }
    };
    e.s(["f", 0, i])
}, 790806, e => {
    "use strict";
    var t = e.i(805290),
        a = e.i(110592),
        n = e.i(272593);
    let i = new class {
            getAgeBracket() {
                return this.usersApi.v1UsersAuthenticatedAgeBracketGet()
            }
            getAuthenticatedUser() {
                return this.usersApi.v1UsersAuthenticatedGet()
            }
            async validateDisplayName(e) {
                await this.displayNameApi.v1DisplayNamesValidateGet(e)
            }
            searchUsers(e, t, a) {
                return this.userSearchApi.v1UsersSearchGet({
                    keyword: e,
                    limit: t,
                    cursor: a
                })
            }
            getUserById(e) {
                return this.usersApi.v1UsersUserIdGet({
                    userId: e
                })
            }
            getUsersByIds(e) {
                return this.usersApi.v1UsersPost({
                    request: {
                        userIds: e
                    }
                })
            }
            constructor() {
                (0, t._)(this, "displayNameApi", void 0), (0, t._)(this, "usersApi", void 0), (0, t._)(this, "userSearchApi", void 0);
                let e = (0, n.f)("users", "bedev1");
                this.displayNameApi = new a.p(e), this.usersApi = new a.h(e), this.userSearchApi = new a.y(e)
            }
        },
        r = new a.h((0, n.f)("users", "bedev1"));
    e.s(["V", 0, {
        usersApi: r
    }, "U", 0, i])
}, 127403, e => {
    "use strict";
    e.s(["f", 0, class {
        post(e) {
            let {
                fetch: t,
                url: a,
                init: n,
                response: i
            } = e, r = new URL(a);
            return "POST" !== n.method && "PATCH" !== n.method || "true" === r.searchParams.get("isSecure") || 403 !== i.status ? Promise.resolve(i) : (r.searchParams.set("isSecure", "true"), t(r.toString(), n))
        }
    }])
}, 950492, e => {
    "use strict";
    let t = async e => {
        let t, {
                api: a,
                getItems: n,
                getPageToken: i
            } = e,
            r = [];
        do {
            let e = await a(t);
            r = r.concat(n(e)), t = i(e)
        } while (t) return r
    };
    e.s(["f", 0, t])
}, 354088, e => {
    "use strict";
    var t = e.i(785517),
        a = e.i(643766),
        n = e.i(500758),
        i = e.i(428993),
        r = e.i(814975),
        s = e.i(6923);
    let o = new Set(["CreatorWalletUpdate"]),
        l = {
            ExperienceGuidelines: [],
            CreatorExperiencePermissions: [],
            CloudServices: [],
            Oauth2: [],
            CreatorOutreach: [],
            PlatformFeedback: []
        },
        u = (e, t, a) => null == e && null == t || e === t ? 0 : null == e ? 1 : null == t ? -1 : null != a && (a.includes(e) || a.includes(t)) ? a.includes(e) && a.includes(t) ? a.indexOf(e) - a.indexOf(t) : a.includes(e) ? -1 : 1 : e.localeCompare(t),
        c = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : l,
                a = Object.keys(t);
            return e.sort((e, t) => u(e.notificationCategoryName, t.notificationCategoryName, a))
        },
        d = function(e, t) {
            let a = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : l,
                n = a[e];
            return t.sort((e, t) => u(e.notificationType, t.notificationType, n))
        },
        p = (0, a.createContext)({
            notificationSettings: [],
            notificationsSettingsContextStored: !1,
            notificationSettingsFailedToLoad: !1,
            notificationSettingsContextLoading: !0,
            getNotificationSettings: () => {},
            setNotificationSettings: () => {}
        });
    e.s(["g", 0, p, "U", 0, e => {
        let {
            children: l
        } = e, {
            user: u
        } = (0, r.f)(), [f, m] = (0, a.useState)([]), [v, y] = (0, a.useState)(!1), [h, g] = (0, a.useState)(!0), [b, T] = (0, a.useState)(!1), w = null == u ? void 0 : u.id, E = (0, a.useCallback)(async () => {
            if (!v && null != w) try {
                var e;
                T(!1), g(!0);
                let t = await s.M.getCreatorSettings(w.toString()),
                    a = (e => {
                        for (let n of (c(e), e)) {
                            var t, a;
                            d(null != (t = n.notificationCategoryName) ? t : "", null != (a = n.notifications) ? a : [])
                        }
                        return e
                    })(null != (e = t.categories) ? e : []);
                m(a), y(!0)
            } catch (e) {
                T(!0), y(!1)
            } finally {
                g(!1)
            }
        }, [w, v]), {
            ready: S,
            value: I
        } = (0, n.f)(i.E), C = (0, a.useMemo)(() => !0 === I ? f : f.map(e => {
            var t;
            return {
                ...e,
                notifications: null == (t = e.notifications) ? void 0 : t.filter(e => {
                    var t;
                    return !o.has(null != (t = e.notificationType) ? t : "")
                })
            }
        }).filter(e => {
            var t, a;
            return (null != (t = null == (a = e.notifications) ? void 0 : a.length) ? t : 0) > 0
        }), [f, I]), x = (0, a.useMemo)(() => ({
            notificationSettings: C,
            notificationsSettingsContextStored: v,
            notificationSettingsFailedToLoad: b,
            notificationSettingsContextLoading: h || !S,
            getNotificationSettings: E,
            setNotificationSettings: m
        }), [C, b, E, h, v, S]);
        return (0, t.jsx)(p.Provider, {
            value: x,
            children: l
        })
    }], 354088)
}, 945451, 330159, 641831, e => {
    "use strict";
    var t = e.i(643766),
        a = e.i(533414),
        n = e.i(814975);
    let i = e => () => {
            var i;
            let {
                user: r
            } = (0, n.f)(), s = "".concat(e, ".").concat(null != (i = null == r ? void 0 : r.id) ? i : "anonymous"), [o, l] = (0, a.j)(s, []);
            return {
                dismissAcks: (0, t.useCallback)(e => {
                    l(t => [...new Set([...t, ...e.map(e => {
                        var t;
                        return null != (t = e.id) ? t : ""
                    })])])
                }, [l]),
                filterAcks: (0, t.useMemo)(() => {
                    let e = new Set(o);
                    return t => t.filter(t => {
                        var a;
                        return !e.has(null != (a = t.id) ? a : "")
                    })
                }, [o])
            }
        },
        r = i("creatorTransparencyAcknowledgments.dismissed.overlay"),
        s = i("creatorTransparencyAcknowledgments.dismissed.banner");
    e.s(["D", 0, s, "l", 0, r], 945451);
    let o = e => {
        if (!(!(e instanceof Date) || Number.isNaN(e.getTime()))) return e.toISOString()
    };
    e.s(["f", 0, (e, t) => {
        let a = o(e.createdAt),
            n = o(e.expiresAt),
            i = {};
        return e.id && (i.acknowledgmentId = e.id), a && (i.createdAt = a), n && (i.expiresAt = n), t.decisionEventId && (i.decisionEventId = t.decisionEventId), e.universeId && (i.universeId = e.universeId.toString()), i
    }], 330159), e.s(["f", 0, e => "https://".concat("roblox.com", "/safety-dashboard#/violations/").concat(encodeURIComponent(e))], 641831)
}, 719338, 672401, e => {
    "use strict";
    var t = e.i(643766);
    let a = (0, t.createContext)({
        isOrganizationRefreshRequired: !1,
        organization: void 0,
        refreshOrganization: () => ({}),
        isOrganizationLoading: !1
    });
    a.displayName = "Organization", e.s(["f", 0, a], 672401), e.s(["f", 0, function() {
        return (0, t.useContext)(a)
    }], 719338)
}, 911502, e => {
    "use strict";
    var t = e.i(785517),
        a = e.i(643766),
        n = e.i(341260),
        i = e.i(79187),
        r = e.i(814975),
        s = e.i(607204),
        o = e.i(581395),
        l = e.i(881670),
        u = e.i(509049),
        c = e.i(745873),
        d = e.i(433285),
        p = e.i(148792),
        f = e.i(811314),
        m = e.i(8994),
        v = e.i(870999),
        y = e.i(47277),
        h = e.i(67243),
        g = e.i(12246),
        b = e.i(156071),
        T = e.i(790806),
        w = e.i(759283),
        E = e.i(719338);
    let S = (0, h.f)()(() => ({
            dialogTitle: {
                marginBottom: 12
            },
            dialogContent: {
                paddingBottom: 0
            },
            dialogSubActions: {
                "& > button:not(:last-child)": {
                    marginRight: 8
                }
            }
        })),
        I = (0, i.K)(e => {
            let {
                open: n,
                onClose: r,
                invitation: l
            } = e, {
                translate: u
            } = (0, i.A)(), {
                organization: c
            } = (0, E.f)(), {
                classes: {
                    dialogTitle: h,
                    dialogContent: I,
                    dialogSubActions: C
                }
            } = S(), {
                enqueue: x,
                close: P
            } = (0, g.J)(), A = (0, a.useCallback)(e => {
                x({
                    message: e,
                    anchorOrigin: {
                        vertical: "bottom",
                        horizontal: "center"
                    },
                    autoHideDuration: w.A,
                    autoHide: !0,
                    onClose: P
                })
            }, [x, P]), [_, R] = (0, a.useState)(), [O, V] = (0, a.useState)(), [U, N] = (0, a.useState)(), [k, L] = (0, a.useState)(), G = (0, a.useCallback)(async () => {
                if (null == l ? void 0 : l.senderUserId) try {
                    let e = await T.U.getUserById(Number.parseInt(l.senderUserId, 10));
                    N(e.name), L(!1)
                } catch (e) {
                    L(!0)
                }
            }, [l]), q = (0, a.useCallback)(async () => {
                if ((null == c ? void 0 : c.id) && (null == c ? void 0 : c.groupId)) try {
                    let e = await b.U.getGroupInfo(Number.parseInt(c.groupId, 10));
                    R(null == e ? void 0 : e.name)
                } catch (e) {
                    A(u("Error.GroupInformation"))
                }
            }, [null == c ? void 0 : c.groupId, null == c ? void 0 : c.id, A, u]);
            (0, a.useEffect)(() => {
                G(), q()
            }, [q, G]);
            let M = (0, a.useCallback)(() => {
                    r(void 0)
                }, [r]),
                z = (0, a.useCallback)(async () => {
                    if ((null == l ? void 0 : l.organizationId) && (null == l ? void 0 : l.id)) {
                        V(!0);
                        try {
                            await s.f.invitationClient.acceptOrDeclineInvitation(l.organizationId, l.id, {
                                status: o.P.Declined
                            }), r(!1)
                        } catch (e) {
                            A(u("Error.DecliningInvitation")), V(!1)
                        }
                    }
                }, [l.id, l.organizationId, r, A, u]),
                D = (0, a.useCallback)(async () => {
                    if ((null == l ? void 0 : l.organizationId) && (null == l ? void 0 : l.id)) {
                        V(!0);
                        try {
                            await s.f.invitationClient.acceptOrDeclineInvitation(l.organizationId, l.id, {
                                status: o.P.Accepted
                            }), r(!0)
                        } catch (e) {
                            A(u("Error.AcceptingInvitation")), V(!1)
                        }
                    }
                }, [l.id, l.organizationId, r, A, u]);
            return (0, t.jsxs)(p.f, {
                maxWidth: "Medium",
                open: n,
                children: [(0, t.jsx)(m.f, {
                    className: I,
                    children: (0, t.jsxs)(v.f, {
                        container: !0,
                        wrap: "wrap",
                        alignItems: "flex-start",
                        children: [(0, t.jsx)(v.f, {
                            container: !0,
                            children: (0, t.jsx)(y.f, {
                                variant: "h4",
                                className: h,
                                children: u("Label.JoinOrganization", {
                                    organizationName: null != _ ? _ : u("Label.Group")
                                })
                            })
                        }), (0, t.jsx)(v.f, {
                            container: !0,
                            children: (0, t.jsx)(y.f, {
                                variant: "body1",
                                children: k ? u("Message.JoinOrganizationWithoutUsername") : u("Message.JoinOrganization", {
                                    username: null != U ? U : ""
                                })
                            })
                        })]
                    })
                }), (0, t.jsx)(f.f, {
                    children: (0, t.jsxs)(v.f, {
                        container: !0,
                        justifyContent: "space-between",
                        children: [(0, t.jsx)(d.f, {
                            variant: "outlined",
                            color: "primary",
                            size: "small",
                            onClick: M,
                            disabled: O,
                            children: u("Action.NotNow")
                        }), (0, t.jsxs)(v.f, {
                            className: C,
                            children: [(0, t.jsx)(d.f, {
                                variant: "outlined",
                                color: "primary",
                                size: "small",
                                onClick: z,
                                disabled: O,
                                children: u("Action.Decline")
                            }), (0, t.jsx)(d.f, {
                                variant: "contained",
                                color: "primaryBrand",
                                size: "small",
                                onClick: D,
                                loading: O,
                                children: u("Action.Accept")
                            })]
                        })]
                    })
                })]
            })
        }, [l.f.Organization]),
        C = (0, h.f)()(() => ({
            dialogTitle: {
                marginBottom: 12
            },
            dialogContent: {
                paddingBottom: 0
            },
            dialogActions: {
                margin: "0px 16px 0px 16px"
            }
        })),
        x = (0, i.K)(e => {
            let {
                open: n,
                onClose: r,
                invitation: s,
                accepted: o
            } = e, {
                translate: l
            } = (0, i.A)(), {
                classes: {
                    dialogTitle: u,
                    dialogContent: c,
                    dialogActions: h
                }
            } = C(), [g, b] = (0, a.useState)(), [w, E] = (0, a.useState)(), S = (0, a.useCallback)(async () => {
                if (null == s ? void 0 : s.senderUserId) try {
                    let e = await T.U.getUserById(Number.parseInt(s.senderUserId, 10));
                    b(e.name), E(!1)
                } catch (e) {
                    E(!0)
                }
            }, [s]);
            (0, a.useEffect)(() => {
                S()
            }, [S]);
            let I = (0, a.useCallback)(() => {
                r()
            }, [r]);
            return (0, t.jsxs)(p.f, {
                maxWidth: "Medium",
                open: n,
                onClose: r,
                children: [(0, t.jsx)(m.f, {
                    className: c,
                    children: (0, t.jsxs)(v.f, {
                        container: !0,
                        wrap: "wrap",
                        alignItems: "flex-start",
                        children: [(0, t.jsx)(y.f, {
                            variant: "h4",
                            className: u,
                            children: l(o ? "Label.InvitationAccepted" : "Label.InvitationDeclined")
                        }), (0, t.jsx)(y.f, {
                            variant: "body1",
                            children: o ? (0, t.jsx)(t.Fragment, {
                                children: w ? l("Message.InvitationAcceptedWithoutUsername") : l("Message.InvitationAccepted", {
                                    username: null != g ? g : ""
                                })
                            }) : (0, t.jsx)(t.Fragment, {
                                children: w ? l("Message.InvitationDeclinedWithoutUsername") : l("Message.InvitationDeclined", {
                                    username: null != g ? g : ""
                                })
                            })
                        })]
                    })
                }), (0, t.jsx)(f.f, {
                    className: h,
                    children: (0, t.jsx)(v.f, {
                        container: !0,
                        justifyContent: "flex-end",
                        children: (0, t.jsx)(d.f, {
                            variant: "contained",
                            color: "primaryBrand",
                            size: "small",
                            onClick: I,
                            children: l("Action.Close")
                        })
                    })
                })]
            })
        }, [l.f.Organization]);
    var P = e.i(582977),
        A = e.i(672401);
    let _ = (0, i.K)(e => {
        let {
            children: i
        } = e, l = (0, n.useRouter)(), {
            user: d
        } = (0, r.f)(), p = (0, c.W)(), {
            currentItemGroupId: f
        } = (0, u.f)(), [m, v] = (0, a.useState)(), [y, h] = (0, a.useState)(), [g, b] = (0, a.useState)(!1), [T, w] = (0, a.useState)(!1), [E, S] = (0, a.useState)(), [C, _] = (0, a.useState)(!1), R = null == d ? void 0 : d.id, O = (0, a.useMemo)(() => {
            var e;
            return null != (e = null == p ? void 0 : p.id) ? e : f
        }, [p, f]), V = l.query[P.L], U = l.isReady, N = (0, a.useCallback)(() => {
            n.default.push("https://create.".concat("roblox.com", "/dashboard/creations"))
        }, []), k = (0, a.useCallback)(async e => {
            if (!R) return void h(null);
            try {
                let t = await s.f.userClient.getUserInvitationByOrganization(e, R.toString());
                h(t)
            } catch (e) {
                h(null), N()
            }
        }, [R, N]), L = (0, a.useCallback)(async () => {
            if (U) {
                w(!0);
                try {
                    if ("string" == typeof V) return void await k(V);
                    if (!O) return void v(null);
                    if (h(null), O) {
                        let e = await s.f.organizationClient.getOrganization(O.toString());
                        v(e)
                    } else v(void 0);
                    b(!1)
                } catch (e) {
                    v(null), h(null)
                } finally {
                    w(!1)
                }
            }
        }, [O, k, V, U]), G = (0, a.useCallback)(() => {
            b(!0), L()
        }, [L]), q = (0, a.useMemo)(() => ({
            organization: m,
            refreshOrganization: G,
            isOrganizationRefreshRequired: g,
            isOrganizationLoading: T
        }), [m, G, g, T]);
        return (0, a.useEffect)(() => {
            L()
        }, [L]), (0, t.jsx)(A.f.Provider, {
            value: q,
            children: (0, t.jsxs)(t.Fragment, {
                children: [i, y && (0, t.jsxs)(t.Fragment, {
                    children: [(0, t.jsx)(I, {
                        open: y.invitationStatusType === o.P.Open && void 0 === E,
                        onClose: e => {
                            !0 === e ? (S(!0), _(!0)) : !1 === e ? (S(!1), _(!0)) : (N(), h(null))
                        },
                        invitation: y
                    }), (0, t.jsx)(x, {
                        open: C,
                        onClose: () => {
                            _(!1), !0 === E && G(), N()
                        },
                        invitation: y,
                        accepted: !0 === E
                    })]
                })]
            })
        })
    }, [l.f.Organization]);
    e.s(["f", 0, _], 911502)
}, 748411, e => {
    "use strict";
    var t = e.i(910272),
        a = e.i(773057);
    e.s(["f", 0, e => (0, t.f)({
        queryKey: ["universeDetails", e],
        queryFn: () => {
            if (void 0 === e || !Number.isFinite(e)) throw Error("universeId is required");
            return a.f.getUniverseDetails(e)
        },
        enabled: void 0 !== e && Number.isFinite(e),
        staleTime: 3e5,
        refetchOnMount: !1
    })])
}, 758835, e => {
    "use strict";
    var t = e.i(643766),
        a = e.i(341260);
    let n = () => {
        let e = Error("Blocking route change for unsaved changes");
        throw Object.assign(e, {
            cancelled: !0
        }), e
    };
    e.s(["f", 0, (e, i) => {
        (0, t.useEffect)(() => {
            let t = void 0 !== e ? e(n) : void 0;
            return t && a.default.events.on("routeChangeStart", t), () => {
                t && a.default.events.off("routeChangeStart", t)
            }
        }, [e]), (0, t.useEffect)(() => (i && a.default.events.on("routeChangeComplete", i), () => {
            i && a.default.events.off("routeChangeComplete", i)
        }), [i])
    }])
}, 681559, 272749, e => {
    "use strict";
    var t = e.i(79187),
        a = e.i(998683);
    let n = {
        en_us: t.v.English,
        es_es: t.v.Spanish,
        fr_fr: t.v.French,
        de_de: t.v.German,
        it_it: t.v.Italian,
        pt_br: t.v.BrazilPortuguese,
        ko_kr: t.v.Korean,
        zh_cn: t.v.SimplifiedChinese,
        zh_tw: t.v.TraditionalChinese,
        ja_jp: t.v.Japanese,
        ru_ru: t.v.Russian,
        id_id: t.v.Indonesian,
        pl_pl: t.v.Polish,
        vi_vn: t.v.Vietnamese,
        th_th: t.v.Thai,
        hi_in: t.v.Hindi,
        nl_nl: t.v.Dutch
    };
    class i extends t.d {
        async loadRuntimeLocaleInfo() {
            let {
                generalExperience: e
            } = await a.f.getUserLocalizationLocusSupportedLocales(), i = null == e ? void 0 : e.locale;
            if (void 0 === i) return this.defaultLocaleInfo;
            if (i in n) {
                let e = n[i];
                return {
                    locale: e,
                    nativeName: (0, t.t)(e)
                }
            }
            return console.warn("Unexpected locale ".concat(i, " received, fallback to default locale")), this.defaultLocaleInfo
        }
        constructor(e, t) {
            super(e, {
                cdnDomain: "roblox.com",
                fallbackLocale: t,
                useLocalOverrides: !1
            })
        }
    }
    e.s(["f", 0, i], 681559);
    var r = e.i(670777),
        s = e.i(811683);
    let o = t.v.English,
        l = t.O.English,
        u = o === t.v.SimplifiedChinese ? s.default : r.default;
    e.s(["J", 0, o, "y", 0, u, "n", 0, l, "E", 0, void 0], 272749)
}, 210205, 120654, e => {
    "use strict";
    var t = e.i(643766);
    let a = {
            info: console.info,
            error: console.error,
            captureError: console.error,
            reportEvent: console.log
        },
        n = (0, t.createContext)(a);
    n.displayName = "TencentPerformanceMonitor", e.s(["f", 0, n], 120654), e.s(["f", 0, function() {
        return (0, t.useContext)(n)
    }], 210205)
}, 927868, e => {
    "use strict";
    e.s(["h", 0, (e, t) => {
        let a = Object.entries(e).find(e => {
            let [, a] = e;
            return a === t
        });
        return a ? a[0] : null
    }, "I", 0, (e, t) => e.includes(t), "s", 0, (e, t) => Object.values(e).includes(t)])
}, 839165, e => {
    "use strict";
    var t = e.i(415858);
    class a extends t._ {
        get(e) {
            return this.request({
                headers: {},
                method: "GET",
                path: e,
                schemaPath: e
            }).then(e => new t.H(e).value())
        }
        post(e, a) {
            return this.request({
                body: a,
                headers: a ? {
                    "Content-Type": "application/json"
                } : {},
                method: "POST",
                path: e,
                schemaPath: e
            }).then(e => new t.H(e).value())
        }
        postWithoutResponse(e, a) {
            return this.request({
                body: a,
                headers: a ? {
                    "Content-Type": "application/json"
                } : {},
                method: "POST",
                path: e,
                schemaPath: e
            }).then(e => new t.V(e).value())
        }
    }
    let n = new a(new t.x({
        basePath: "",
        credentials: "include",
        robloxSiteDomain: "roblox.com"
    }));
    e.s(["J", 0, e => n.get(e), "d", 0, (e, t) => n.post(e, t), "h", 0, (e, t) => n.postWithoutResponse(e, t)])
}, 336964, e => {
    "use strict";
    let t;
    var a = e.i(798280);

    function n(e) {
        var t, a, n, i;
        if ((null == e ? void 0 : e.mode) === "standalone") return {
            mode: "standalone",
            shouldUnmountOnClose: null == (i = e.shouldUnmountOnClose) || i
        };
        let r = null != e ? e : {};
        return {
            mode: "content",
            size: null != (t = r.size) ? t : "Medium",
            isModal: null == (a = r.isModal) || a,
            hasCloseAffordance: void 0 !== r.closeLabel,
            closeLabel: r.closeLabel,
            hasMarginTop: r.hasMarginTop,
            hasMarginBottom: r.hasMarginBottom,
            hasDescription: r.hasDescription,
            shouldUnmountOnClose: null == (n = r.shouldUnmountOnClose) || n
        }
    }
    let i = n(),
        r = {
            ...t = (0, a.f)({
                render: null,
                options: null,
                isOpen: !1
            }),
            open: (e, a) => {
                t.setState({
                    render: e,
                    options: n(a),
                    isOpen: !0
                })
            },
            close: () => {
                t.getSnapshot().isOpen && t.setState({
                    isOpen: !1
                })
            },
            clearContent: () => {
                t.getSnapshot().isOpen || t.setState({
                    render: null,
                    options: null
                })
            }
        };
    e.s(["u", 0, i, "w", 0, r])
}, 798280, e => {
    "use strict";
    e.s(["f", 0, e => {
        let t = new Set,
            a = e;
        return {
            getSnapshot: function() {
                return a
            },
            setState: function(e) {
                let n = a;
                a = {
                    ...a,
                    ...e
                }, t.forEach(e => e(a, n))
            },
            subscribe: function(e) {
                return t.add(e), () => {
                    t.delete(e)
                }
            }
        }
    }])
}, 209534, e => {
    "use strict";
    var t = e.i(798280);
    let a = 0,
        n = (0, t.f)({
            current: null
        }),
        i = {
            ...n,
            enqueue: function(e) {
                var t, i;
                let r = n.getSnapshot().current;
                null == r || null == (t = (i = r.props).onClose) || t.call(i), a += 1, n.setState({
                    current: {
                        id: "snackbar-".concat(a),
                        props: e
                    }
                })
            },
            dismiss: function() {
                var e, t;
                let {
                    current: a
                } = n.getSnapshot();
                a && (null == (e = (t = a.props).onClose) || e.call(t), n.setState({
                    current: null
                }))
            }
        };
    e.s(["f", 0, i])
}, 894244, e => {
    "use strict";
    let t = async function() {
        var e;
        let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
            a = null != (e = t.redirectUri) ? e : window.location.href,
            n = new URL("/oauth/v1/authorize", "https://apis.roblox.com"),
            i = {
                client_id: "4273917941353191905",
                response_type: "none",
                redirect_uri: a,
                scope: "openid",
                prompt: "none"
            };
        return void 0 !== t.state && (i.state = t.state), n.search = new URLSearchParams(i).toString(), n.href
    };
    e.s(["f", 0, t])
}, 745873, 67262, e => {
    "use strict";
    var t = e.i(785517),
        a = e.i(643766),
        n = e.i(458451),
        i = e.i(533414),
        r = e.i(910272),
        s = e.i(947024),
        o = e.i(602635),
        l = e.i(814975);
    let u = (0, e.i(272593).f)("creator-home-api", "bedev2"),
        c = new s._(u),
        d = new s.k(u),
        p = {
            groupsApi: d,
            userScreenApi: c,
            creatorHomeContentApi: new s.D(u),
            signalsApi: new s.f(u)
        };
    e.s(["f", 0, p], 67262);
    let f = function() {
        let {
            user: e
        } = (0, l.f)();
        return (0, r.f)({
            queryKey: o.E,
            enabled: !!e,
            queryFn: () => {
                let e;
                return e = {
                    surface: s.j.CreatorHub
                }, p.groupsApi.groupsListGroups(e)
            }
        })
    };
    var m = e.i(809576);
    let v = (0, a.createContext)(null);
    e.s(["e", 0, e => {
        let {
            children: r
        } = e, {
            user: s
        } = (0, n.s)(), o = (0, m.h)(), {
            data: l,
            isLoading: u,
            refetch: c
        } = f(), [d, p] = (0, i.j)("creatorHubGroups.".concat(null == s ? void 0 : s.id), null), [y, h] = (0, i.j)("creatorHubGroup.".concat(null == s ? void 0 : s.id), null), [g, b] = (0, i.j)("creatorHubGroupData.".concat(null == s ? void 0 : s.id), {}), T = (0, a.useCallback)(e => {
            h(e);
            let t = null != e ? e : "user";
            b(e => {
                let a = {
                    lastSelected: Date.now(),
                    priority: 1
                };
                if (e[t]) {
                    let {
                        priority: n,
                        lastSelected: i
                    } = e[t];
                    "number" != typeof n || Number.isNaN(n) || "number" != typeof i || Number.isNaN(i) || (a.priority = n * (1 + Math.log10(1 + 10 / Math.max(Date.now() - i, 864e5))))
                }
                return {
                    ...e,
                    [t]: a
                }
            })
        }, [h, b]), w = (0, a.useMemo)(() => {
            if (null == l ? void 0 : l.groups) return null == l ? void 0 : l.groups;
            if (null === d) return [];
            try {
                let e = "string" == typeof d ? JSON.parse(d) : d;
                return Array.isArray(e) && e.every(e => "object" == typeof e && null !== e && "id" in e && "number" == typeof e.id && "name" in e && "string" == typeof e.name && "roleSetName" in e && "string" == typeof e.roleSetName) ? e : []
            } catch (e) {
                return []
            }
        }, [d, null == l ? void 0 : l.groups]), E = (0, a.useMemo)(() => {
            var e;
            return y && null != (e = w.find(e => {
                let {
                    id: t
                } = e;
                return t === y
            })) ? e : null
        }, [y, w]), S = null == E ? void 0 : E.id, I = null == s ? void 0 : s.id, {
            data: C,
            error: x,
            isPending: P,
            refetch: A
        } = (0, m.$)(S, I), {
            data: _,
            isPending: R,
            refetch: O
        } = (0, m.V)(S, I), V = (0, a.useCallback)(() => null == S || null == I ? Promise.resolve() : Promise.all([A(), O()]), [O, A, S, I]);
        (0, a.useEffect)(() => {
            (null == s ? void 0 : s.id) && (null == l ? void 0 : l.groups) && !u && p(null == l ? void 0 : l.groups)
        }, [null == l ? void 0 : l.groups, w, u, p, null == s ? void 0 : s.id]);
        let U = (0, a.useMemo)(() => {
            var e;
            return {
                groups: w,
                currentGroup: E,
                groupData: g,
                isFetched: !u && !!I,
                refreshGroups: c,
                setCurrentGroup: T,
                ...o,
                permissions: C,
                isOwner: null != I && (null == _ || null == (e = _.owner) ? void 0 : e.userId) === I,
                isPermissionsLoading: null != E && (P || R),
                permissionsError: x,
                refreshPermissions: V
            }
        }, [E, g, w, u, R, P, _, o, C, x, c, V, T, I]);
        return (0, t.jsx)(v.Provider, {
            value: U,
            children: r
        })
    }, "W", 0, () => {
        let e = (0, a.useContext)(v);
        if (null === e) throw Error("useCurrentGroup must be used within a GroupsProvider");
        return e.currentGroup
    }, "_", 0, () => {
        let e = (0, a.useContext)(v);
        if (null === e) throw Error("useGroups must be used within a GroupsProvider");
        return e
    }], 745873)
}, 809576, e => {
    "use strict";
    var t = e.i(643766),
        a = e.i(463146),
        n = e.i(910272),
        i = e.i(228096),
        r = e.i(458451),
        s = e.i(93714),
        o = e.i(272593);
    let l = new s.A((0, o.f)("groups", "bedev1"));
    async function u(e, t, a) {
        var n;
        return null != (n = (await l.v2GroupsGroupIdEntityTypeEntityIdPermissionsResolvedGet({
            groupId: e,
            entityType: t,
            entityId: a
        })).permissions) ? n : {}
    }
    async function c(e) {
        return u(e, "groups", String(e))
    }
    async function d(e) {
        let t, a = [];
        do {
            var n, i;
            let r = await l.v2GroupsGroupIdEntityTypePermissionsResolvedGet({
                groupId: e,
                entityType: "roles",
                cursor: t
            });
            a.push(...null != (n = r.data) ? n : []), t = null != (i = r.nextPageCursor) ? i : void 0
        } while (t) return a
    }
    var p = e.i(156071);
    let f = new s.A((0, o.f)("groups", "bedev1"));
    async function m(e) {
        var t;
        return null != (t = (await f.v2EntityTypeEntityIdPermissionsResolvedGet({
            entityType: "universes",
            entityId: String(e)
        })).permissions) ? t : {}
    }
    var v = e.i(759283);
    let y = (e, t) => ["groups", e, t, "resolved-permissions"],
        h = (e, t) => ["groups", e, t, "roles", "resolved-permissions"],
        g = (e, t) => ["universe-resolved-permissions", t, void 0 === e ? e : String(e)];
    e.s(["V", 0, function(e, t) {
        return (0, n.f)({
            queryKey: ["groups", e, t, "owner"],
            queryFn: e && t ? () => p.U.getGroupInfo(e) : a.V
        })
    }, "h", 0, function() {
        let {
            user: e
        } = (0, r.s)(), a = (0, i.d)(), n = null == e ? void 0 : e.id, s = (0, t.useCallback)(e => a.fetchQuery({
            queryKey: g(e, n),
            queryFn: () => m(e),
            staleTime: 6e4
        }), [a, n]), o = (0, t.useCallback)(e => a.fetchQuery({
            queryKey: y(e, n),
            queryFn: () => c(e),
            staleTime: 6e4
        }), [a, n]), l = (0, t.useCallback)(e => a.fetchQuery({
            queryKey: h(e, n),
            queryFn: () => d(e),
            staleTime: 6e4
        }), [a, n]);
        return (0, t.useMemo)(() => ({
            fetchGroupPermissions: o,
            fetchRolePermissions: l,
            fetchUniversePermissions: s
        }), [o, l, s])
    }, "$", 0, function(e, t) {
        return (0, n.f)({
            queryKey: y(e, t),
            queryFn: e && t ? () => c(e) : a.V,
            staleTime: 6e4
        })
    }, "K", 0, function(e) {
        let {
            user: t
        } = (0, r.s)(), i = null == t ? void 0 : t.id;
        return (0, n.f)({
            queryKey: h(e, i),
            queryFn: e && i ? () => d(e) : a.V,
            staleTime: 6e4
        })
    }, "v", 0, function(e) {
        let {
            user: t
        } = (0, r.s)(), i = null == t ? void 0 : t.id;
        return (0, n.f)({
            queryKey: g(e, i),
            queryFn: void 0 !== e && e !== v.h ? () => m(e) : a.V,
            staleTime: 6e4
        })
    }], 809576)
}, 407881, 616931, e => {
    "use strict";
    var t = e.i(785517),
        a = e.i(643766),
        n = e.i(341260),
        i = e.i(623127);
    let r = {
            [i.Q.ChildrenPrivacyPolicy]: "Label.ChildrenPrivacyPolicy",
            [i.Q.ConsentFlow]: "Label.ConsentFlow",
            [i.Q.LuobuThirdPartyDataUse]: "Label.LuobuThirdPartyDataUse",
            [i.Q.PersonalInformationPolicy]: "Label.PersonalInformationPolicy",
            [i.Q.PrivacyPolicy]: "Label.PrivacyPolicy",
            [i.Q.RefundTerms]: "Label.RefundTerms",
            [i.Q.RiderTerms]: "Label.RiderTerms",
            [i.Q.TermsOfService]: "Label.TermsOfService"
        },
        s = ["/v1-studio-login"];
    e.s(["M", 0, r, "y", 0, s, "N", 0, 3], 616931);
    let o = (0, a.createContext)({
        isPending: !1,
        completeCheck: () => {}
    });
    e.s(["U", 0, e => {
        let {
            children: i
        } = e, {
            pathname: r
        } = (0, n.useRouter)(), [l, u] = (0, a.useState)(!0), c = (0, a.useCallback)(() => u(!1), []), d = s.some(e => r.startsWith(e)), p = (0, a.useMemo)(() => ({
            isPending: l && !d,
            completeCheck: c
        }), [l, d, c]);
        return (0, t.jsx)(o.Provider, {
            value: p,
            children: i
        })
    }, "c", 0, () => (0, a.useContext)(o)], 407881)
}, 670777, (e, t, a) => {
    t.exports = {
        "OpenGraph.Title": "Creator Dashboard",
        "OpenGraph.Description": "Make anything you can imagine. Everything you need to start building on Roblox for free; join a global community of Creators and publish instantly to the world."
    }
}, 811683, (e, t, a) => {
    t.exports = {
        "OpenGraph.Description": "创作你能想象出的一切。免费为你提供在 Roblox 上开始创作所需的一切资源；加入全球创作者社区并立即向全世界发布你的创作。",
        "OpenGraph.Title": "创作中心"
    }
}, 822092, e => {
    "use strict";
    let t;
    e.s(["c", 0, e => {
        t = e.unifiedLogger
    }, "g", 0, () => t])
}, 929036, e => {
    "use strict";
    var t = "u" > typeof globalThis ? globalThis : window;
    e.s(["a", 0, function(e) {
        return e && e.__esModule && Object.prototype.hasOwnProperty.call(e, "default") ? e.default : e
    }, "c", 0, t, "g", 0, function(e) {
        if (Object.prototype.hasOwnProperty.call(e, "__esModule")) return e;
        var t = e.default;
        if ("function" == typeof t) {
            var a = function e() {
                var a = !1;
                try {
                    a = this instanceof e
                } catch (e) {}
                return a ? Reflect.construct(t, arguments, this.constructor) : t.apply(this, arguments)
            };
            a.prototype = t.prototype
        } else a = {};
        return Object.defineProperty(a, "__esModule", {
            value: !0
        }), Object.keys(e).forEach(function(t) {
            var n = Object.getOwnPropertyDescriptor(e, t);
            Object.defineProperty(a, t, n.get ? n : {
                enumerable: !0,
                get: function() {
                    return e[t]
                }
            })
        }), a
    }])
}, 725924, e => {
    "use strict";
    let t, a;
    var n, i, r = e.i(643766);
    let s = "u" > typeof Intl,
        o = !s || void 0 === Intl.Locale,
        l = !s || void 0 === Intl.RelativeTimeFormat,
        u = !s || void 0 === Intl.PluralRules,
        c = !s || void 0 === Intl.DisplayNames,
        d = "function" != typeof window.ResizeObserver,
        p = (n = o || l || u || c || d, i = function() {
            return Promise.all([(o ? e.A(361318).then(function(e) {
                return e.p
            }) : Promise.resolve()).then(() => Promise.all([l ? e.A(950511).then(function(e) {
                return e.p
            }).then(() => e.A(874521)) : null, u ? e.A(684498).then(function(e) {
                return e.p
            }).then(() => e.A(104943)) : null, c ? e.A(951862).then(() => e.A(890267)) : null])), d ? e.A(956827) : null])
        }, t = !1, a = n ? i().catch(() => {}).then(() => {
            t = !0
        }) : null, function() {
            let [e, n] = (0, r.useState)(!a || t);
            return (0, r.useEffect)(() => {
                a && !e && a.then(() => n(!0))
            }, [e]), e
        });
    e.s(["f", 0, p], 725924)
}, 823062, e => {
    "use strict";
    var t = e.i(643766),
        a = e.i(544761);
    let n = (0, t.createContext)(null),
        i = [],
        r = ["pageload", "click", "impression", "hover", "webvitals", "apivitals", "formvitals", "error", "session"],
        s = new Set(["TTFB", "FCP", "LCP", "FID", "CLS", "INP"]);

    function o() {
        let e = (0, t.useContext)(n);
        if (null === e) throw Error("useUnifiedLoggerProvider must be used within a UnifiedLoggerProvider");
        return e
    }
    let l = () => null;
    e.s(["d", 0, e => {
        var o;
        let {
            children: l,
            unifiedLogger: u,
            pageLoggerConfig: c,
            path: d,
            url: p,
            isReady: f = !0,
            getPageLoadPath: m
        } = e, v = null != (o = null == c ? void 0 : c.tags) ? o : i, y = null == c ? void 0 : c.rosId, h = (0, t.useMemo)(() => ({
            tags: v,
            rosId: y,
            path: d,
            url: p,
            isReady: f
        }), [v, y, d, p, f]), g = (0, t.useRef)(h), b = (0, t.useRef)(h), T = (0, t.useRef)(m);
        (0, t.useLayoutEffect)(() => {
            T.current = m
        }, [m]), (0, t.useLayoutEffect)(() => {
            b.current = h, void 0 === g.current.path && void 0 !== h.path && (g.current = {
                ...g.current,
                path: h.path
            })
        }, [h]), (0, t.useLayoutEffect)(() => {
            let e = e => {
                var t;
                let n;
                if (e instanceof a.W && void 0 !== e.pageContext) return;
                let i = (n = null == (t = e.parameters) ? void 0 : t.metricName, "webvitals" === e.eventType && void 0 !== n && s.has(n)) ? g.current : b.current,
                    r = "pageload" === e.eventType && T.current ? T.current() : i.path;
                void 0 !== r && (e.parameters = {
                    ...e.parameters,
                    path: r
                }), i.tags.forEach(t => e.addTag(t)), void 0 !== i.rosId && e.addTag("owner: ".concat(i.rosId))
            };
            return r.forEach(t => {
                u.events.on(t, e)
            }), () => {
                r.forEach(t => {
                    u.events.off(t, e)
                })
            }
        }, [u]);
        let w = (0, t.useMemo)(() => ({
            unifiedLogger: u,
            pageContext: h
        }), [u, h]);
        return t.default.createElement(n.Provider, {
            value: w
        }, l)
    }, "W", 0, function() {
        return (0, t.useContext)(n)
    }, "G", 0, e => {
        let {
            unifiedLogger: a,
            pageContext: n
        } = o(), {
            path: i,
            url: r,
            isReady: s
        } = n, u = a.pageSettledTracker, c = (0, t.useSyncExternalStore)(u.subscribe, u.getSnapshot, l);
        (0, t.useEffect)(() => {
            if (!c || c.isNavigating || !s || !i || !r || !e || c.url.split(/[?#]/)[0] !== r.split(/[?#]/)[0]) return;
            let t = new URL(i, window.location.origin).pathname,
                n = requestAnimationFrame(() => {
                    n = requestAnimationFrame(() => {
                        a.logPageSettledEvent({
                            navigationId: c.id,
                            page: t,
                            outcome: e
                        })
                    })
                });
            return () => cancelAnimationFrame(n)
        }, [c, s, r, i, e, a])
    }, "X", 0, o])
}]);

//# debugId=dc88dfc0-7dc5-0ec2-3b70-d537002b2a75
//# sourceMappingURL=2ts_eyuxwnau2.js.map