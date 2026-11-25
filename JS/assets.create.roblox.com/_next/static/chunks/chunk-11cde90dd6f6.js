;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "11c4e73b-b1b7-39bf-c497-9c81d37d1391")
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
                            g(e, t, l, {
                                once: !0
                            }), "error" !== t && (i = e, r = o, s = {
                                once: !0
                            }, "function" == typeof i.on && g(i, "error", r, s))
                        })
                    }, r.EventEmitter = r, r.prototype._events = void 0, r.prototype._eventsCount = 0, r.prototype._maxListeners = void 0;
                    var s = 10;

                    function o(e) {
                        if ("function" != typeof e) throw TypeError('The "listener" argument must be of type Function. Received type ' + typeof e)
                    }

                    function l(e) {
                        return void 0 === e._maxListeners ? r.defaultMaxListeners : e._maxListeners
                    }

                    function c(e, t, a, n) {
                        if (o(a), void 0 === (r = e._events) ? (r = e._events = Object.create(null), e._eventsCount = 0) : (void 0 !== r.newListener && (e.emit("newListener", t, a.listener ? a.listener : a), r = e._events), s = r[t]), void 0 === s) s = r[t] = a, ++e._eventsCount;
                        else if ("function" == typeof s ? s = r[t] = n ? [a, s] : [s, a] : n ? s.unshift(a) : s.push(a), (i = l(e)) > 0 && s.length > i && !s.warned) {
                            s.warned = !0;
                            var i, r, s, c = Error("Possible EventEmitter memory leak detected. " + s.length + " " + String(t) + " listeners added. Use emitter.setMaxListeners() to increase limit");
                            c.name = "MaxListenersExceededWarning", c.emitter = e, c.type = t, c.count = s.length, console && console.warn && console.warn(c)
                        }
                        return e
                    }

                    function u() {
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
                            i = u.bind(n);
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

                    function g(e, t, a, n) {
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
                            for (var c = l.length, u = m(l, c), a = 0; a < c; ++a) n(u[a], this, t);
                        return !0
                    }, r.prototype.addListener = function(e, t) {
                        return c(this, e, t, !1)
                    }, r.prototype.on = r.prototype.addListener, r.prototype.prependListener = function(e, t) {
                        return c(this, e, t, !0)
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
                var c = [o, l];
                if (a) throw TypeError("Generator is already executing.");
                for (; s && (s = 0, c[0] && (r = 0)), r;) try {
                    if (a = 1, n && (i = 2 & c[0] ? n.return : c[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, c[1])).done) return i;
                    switch (n = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                        case 0:
                        case 1:
                            i = c;
                            break;
                        case 4:
                            return r.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            r.label++, n = c[1], c = [0];
                            continue;
                        case 7:
                            c = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = r.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                r.label = c[1];
                                break
                            }
                            if (6 === c[0] && r.label < i[1]) {
                                r.label = i[1], i = c;
                                break
                            }
                            if (i && r.label < i[2]) {
                                r.label = i[2], r.ops.push(c);
                                break
                            }
                            i[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    c = t.call(e, r)
                } catch (e) {
                    c = [6, e], n = 0
                } finally {
                    a = i = 0
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

    function c(e) {
        if (void 0 !== e) return null === e ? null : {
            acceptances: e.acceptances.map(l)
        }
    }

    function u(e) {
        var a;
        return null == (a = e) ? a : {
            errorCode: (0, t.u)(a, "errorCode") ? a.errorCode : void 0,
            message: (0, t.u)(a, "message") ? a.message : void 0,
            agreementId: a.agreementId
        }
    }

    function d(e, a) {
        return null == e ? e : {
            results: (0, t.u)(e, "results") ? null === e.results ? null : e.results.map(u) : void 0
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
                                    body: c(e.insertAcceptancesRequest)
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
                                    body: c(e.insertAcceptancesRequest)
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
}, 629683, e => {
    "use strict";
    var t = e.i(732241),
        a = e.i(882782),
        n = e.i(600937),
        i = e.i(798251),
        r = e.i(471019),
        s = e.i(335020),
        o = e.i(643766);
    let l = {
            Info: "icon-filled-circle-i",
            Warning: "icon-filled-triangle-exclamation",
            Success: "icon-filled-circle-check",
            Error: "icon-filled-circle-x"
        },
        c = {
            Info: "var(--color-system-emphasis)",
            Warning: "var(--color-system-warning)",
            Success: "var(--color-extended-green-700, var(--color-system-success))",
            Error: "var(--color-action-alert-foreground)"
        },
        u = {
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
                severity: g = "Info",
                primaryActionLabel: v,
                primaryActionHref: y,
                primaryActionLinkTarget: h,
                onPrimaryAction: b,
                secondaryActionLabel: T,
                secondaryActionHref: w,
                secondaryActionLinkTarget: x,
                onSecondaryAction: E,
                hasCloseAffordance: k = !0,
                closeLabel: I = "Dismiss alert",
                onDismiss: S,
                className: C,
                style: V,
                ...A
            } = e, O = (0, n.f)("foundation-web-alert-message-"), P = !!v, R = !!T, _ = !!(k && S), M = "Feedback" === m && (P || R || _), q = "Warning" === g || "Error" === g ? "alert" : "status", z = null;
            P && (z = R ? o.default.createElement(p, {
                label: v || "",
                href: y,
                linkTarget: h,
                onAction: b,
                variant: "Standard"
            }) : o.default.createElement(f, {
                label: v || "",
                href: y,
                linkTarget: h,
                onAction: b
            }));
            let j = R ? o.default.createElement(p, {
                label: T || "",
                href: w,
                linkTarget: x,
                onAction: E,
                variant: "Utility"
            }) : null;
            return o.default.createElement("div", {
                ref: a,
                role: M ? "region" : q,
                "aria-labelledby": M ? O : void 0,
                className: (0, s.U)("foundation-web-alert relative width-full stroke-standard", "System" === m ? "[border-left-width:0] [border-right-width:0]" : "radius-medium", u[g], C),
                ...A
            }, o.default.createElement("div", {
                "aria-hidden": "true",
                className: (0, s.U)("absolute inset-[0] pointer-events-none", "Feedback" === m && "radius-medium"),
                style: {
                    backgroundColor: d[g]
                }
            }), o.default.createElement("div", {
                className: "relative flex items-start gap-x-medium padding-x-large padding-y-small min-width-0"
            }, o.default.createElement("div", {
                className: "flex items-start padding-y-xsmall self-stretch shrink-0"
            }, o.default.createElement("div", {
                className: "relative flex items-start padding-y-xxsmall"
            }, "Warning" !== g && o.default.createElement("span", {
                "aria-hidden": "true",
                className: "absolute width-[10px] height-[14px] top-[5px]",
                style: {
                    left: "50%",
                    transform: "translateX(-50%)",
                    backgroundColor: "var(--dark-mode-content-emphasis)"
                }
            }), o.default.createElement(t.f, {
                "aria-hidden": "true",
                name: l[g],
                size: "Medium",
                className: "relative",
                style: {
                    color: c[g]
                }
            }))), o.default.createElement("div", {
                className: (0, s.U)("flex grow-1 basis-0 min-width-0 items-start gap-x-medium gap-y-small", R ? "flex-col" : "wrap")
            }, o.default.createElement("div", {
                id: M ? O : void 0,
                role: M ? q : void 0,
                className: (0, s.U)("flex items-center padding-top-[var(--size-150)] text-body-medium text-wrap content-emphasis [overflow-wrap:anywhere]", R ? "width-full min-width-0" : "grow-1 basis-0 min-width-[min(200px,100%)]")
            }, i), (z || j) && o.default.createElement("div", {
                className: (0, s.U)("flex items-center gap-small wrap shrink-0", !R && "padding-y-[var(--size-150)]")
            }, z, j)), _ && o.default.createElement(r.f, {
                variant: "Utility",
                size: "Medium",
                isCircular: !0,
                className: "content-emphasis shrink-0 padding-[var(--size-150)]",
                "aria-label": I,
                onClick: S
            })))
        });
    e.s(["f", 0, m])
}, 808061, e => {
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
                maxValue: c,
                valuesLocation: u = "None",
                ariaLabel: d,
                ...p
            } = e, f = "Determinate" === s, m = Math.min(100, Math.max(0, o)), g = f && void 0 !== l && "None" !== u, v = f && void 0 !== c && "None" !== u, y = "Sides" === u, h = a.default.createElement("div", {
                className: (0, t.U)("relative height-100 radius-circle bg-shift-200", y ? "grow-1 shrink-1 min-width-0" : "block width-full"),
                style: y ? {
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
            })), b = g && a.default.createElement("span", {
                className: (0, t.U)("content-emphasis flex-shrink-0", n),
                "aria-hidden": "true"
            }, l), T = v && a.default.createElement("span", {
                className: (0, t.U)("content-emphasis flex-shrink-0", n),
                "aria-hidden": "true"
            }, c), w = (g || v) && a.default.createElement("div", {
                className: "flex justify-between width-full gap-xsmall"
            }, g ? b : a.default.createElement("span", null), v ? T : a.default.createElement("span", null));
            return a.default.createElement("div", {
                ref: i,
                className: (0, t.U)("block width-full", r),
                role: "progressbar",
                "aria-label": d,
                "aria-valuemin": f ? 0 : void 0,
                "aria-valuemax": f ? 100 : void 0,
                "aria-valuenow": f ? m : void 0,
                ...p
            }, y ? a.default.createElement("div", {
                className: "flex items-center gap-small width-full"
            }, b, h, T) : a.default.createElement("div", {
                className: "flex flex-col gap-small width-full"
            }, "Top" === u && w, h, "Bottom" === u && w))
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

    function c(e) {
        return (0, t.g)("MuiDialogContentText", e)
    }(0, r.g)("MuiDialogContentText", ["root"]);
    let u = ["children", "className"],
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
                p = (0, t._)(r, u),
                f = (e => {
                    let {
                        classes: t
                    } = e, n = (0, i.a)({
                        root: ["root"]
                    }, c, t);
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
            c = l[0],
            u = l[1],
            d = (0, a.useState)(!1),
            p = d[0],
            f = d[1],
            m = (0, a.useCallback)(function() {
                f(!0)
            }, [f]),
            g = (0, a.useCallback)(function() {
                f(!1)
            }, [f]),
            v = (0, a.useCallback)(function(e, t) {
                void 0 === t && (t = {}), u({
                    props: t,
                    children: e
                })
            }, [u]),
            y = (0, a.useMemo)(function() {
                return {
                    ref: o,
                    open: m,
                    close: g,
                    configure: v
                }
            }, [g, v, m]);
        return a.default.createElement(a.default.Fragment, null, a.default.createElement(i.Provider, {
            value: y
        }, r), a.default.createElement(n.f, (0, t._)({}, c.props, s, {
            "aria-labelledby": c.props.id,
            "aria-describedby": "dialog-content-text-describe-id",
            open: p,
            onClose: g,
            ref: o
        }), c.children))
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
            c = e.color,
            u = e.loading,
            d = void 0 !== u && u,
            p = e.content,
            f = e.confirmText,
            m = e.cancelText,
            g = e.onCancel,
            v = e.onConfirm;
        return t.default.createElement("div", null, t.default.createElement(a.f, {
            id: o
        }, l), t.default.createElement(n.f, null, t.default.createElement(s.D, {
            id: "dialog-content-text-describe-id"
        }, p)), t.default.createElement(i.f, null, t.default.createElement(r.f, {
            size: "large",
            variant: "outlined",
            "aria-label": m,
            color: "secondary",
            onClick: g,
            disabled: d
        }, m), t.default.createElement(r.f, {
            size: "large",
            variant: "contained",
            loading: d,
            "aria-label": f,
            color: void 0 === c ? "primaryBrand" : c,
            onClick: v
        }, f)))
    }], 373488)
}, 146931, e => {
    "use strict";
    var t = e.i(12246);
    e.s(["f", () => t.U])
}, 969162, 83883, e => {
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
    }], 83883);
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
        }), c = (0, r.useCallback)(e => {
            l({
                request: e,
                open: !0
            })
        }, []), u = (0, r.useCallback)(() => {
            l(e => ({
                ...e,
                open: !1
            }))
        }, []), d = (0, r.useMemo)(() => ({
            showFeatureRestriction: c,
            closeFeatureRestriction: u
        }), [c, u]);
        return (0, s.jsxs)(o.Provider, {
            value: d,
            children: [a, n && (0, s.jsx)(t, {
                request: n,
                open: i,
                onDismiss: u
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
    }, "G", 0, ["Feature.NotApproved", "Feature.AppealsPortal", "Feature.InExperienceIntervention", "Feature.UniversalFeatureRestrictions"]], 969162)
}, 436089, e => {
    "use strict";
    var t, a, n, i, r, s, o, l, c, u, d, p, f = e.i(540949),
        m = e.i(28232),
        g = e.i(562442),
        v = e.i(591431);

    function y(e, t) {
        var a = (0, v._)(e, t, "update");
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
    var h = e.i(463146),
        b = e.i(605),
        T = e.i(176522),
        w = e.i(455596),
        x = (t = new WeakMap, class extends w.f {
            build(e, t, a) {
                var n;
                let i = t.queryKey,
                    r = null != (n = t.queryHash) ? n : (0, h.J)(i, t),
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
                return this.getAll().find(e => (0, h.N)(t, e))
            }
            findAll() {
                let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                    t = this.getAll();
                return Object.keys(e).length > 0 ? t.filter(t => (0, h.N)(e, t)) : t
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
                }), this.config = e, (0, g._)(this, t, new Map)
            }
        }),
        E = e.i(769747),
        k = w,
        I = (a = new WeakMap, n = new WeakMap, i = new WeakMap, class extends k.f {
            build(e, t, a) {
                let n = new E.I({
                    client: e,
                    mutationCache: this,
                    mutationId: ++y(this, i).value,
                    options: e.defaultMutationOptions(t),
                    state: a
                });
                return this.add(n), n
            }
            add(e) {
                (0, f._)(this, a).add(e);
                let t = S(e);
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
                    let t = S(e);
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
                let t = S(e);
                if ("string" != typeof t) return !0;
                {
                    let a = (0, f._)(this, n).get(t),
                        i = null == a ? void 0 : a.find(e => "pending" === e.state.status);
                    return !i || i === e
                }
            }
            runNext(e) {
                let t = S(e);
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
                return this.getAll().find(e => (0, h.L)(t, e))
            }
            findAll() {
                let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                return this.getAll().filter(t => (0, h.L)(e, t))
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
                return T.f.batch(() => Promise.all(e.map(e => e.continue().catch(h.z))))
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
                }), this.config = e, (0, g._)(this, a, new Set), (0, g._)(this, n, new Map), (0, g._)(this, i, 0)
            }
        });

    function S(e) {
        var t;
        return null == (t = e.options.scope) ? void 0 : t.id
    }
    var C = e.i(461736),
        V = e.i(458330),
        A = e.i(719392),
        O = (r = new WeakMap, s = new WeakMap, o = new WeakMap, l = new WeakMap, c = new WeakMap, u = new WeakMap, d = new WeakMap, p = new WeakMap, class {
            mount() {
                y(this, u).value++, 1 === (0, f._)(this, u) && ((0, g._)(this, d, C.f.subscribe(async e => {
                    e && (await this.resumePausedMutations(), (0, f._)(this, r).onFocus())
                })), (0, g._)(this, p, V.f.subscribe(async e => {
                    e && (await this.resumePausedMutations(), (0, f._)(this, r).onOnline())
                })))
            }
            unmount() {
                var e, t;
                y(this, u).value--, 0 === (0, f._)(this, u) && (null == (e = (0, f._)(this, d)) || e.call(this), (0, g._)(this, d, void 0), null == (t = (0, f._)(this, p)) || t.call(this), (0, g._)(this, p, void 0))
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
                return void 0 === n ? this.fetchQuery(e) : (e.revalidateIfStale && a.isStaleByTime((0, h.H)(t.staleTime, a)) && this.prefetchQuery(t), Promise.resolve(n))
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
                    o = (0, h.b)(t, s);
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
                return Promise.all(T.f.batch(() => (0, f._)(this, r).findAll(e).map(e => e.cancel(a)))).then(h.z).catch(h.z)
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
                    return n.throwOnError || (t = t.catch(h.z)), "paused" === e.state.fetchStatus ? Promise.resolve() : t
                }))).then(h.z)
            }
            fetchQuery(e) {
                let t = this.defaultQueryOptions(e);
                void 0 === t.retry && (t.retry = !1);
                let a = (0, f._)(this, r).build(this, t);
                return a.isStaleByTime((0, h.H)(t.staleTime, a)) ? a.fetch(t) : Promise.resolve(a.state.data)
            }
            prefetchQuery(e) {
                return this.fetchQuery(e).then(h.z).catch(h.z)
            }
            fetchInfiniteQuery(e) {
                return e.behavior = (0, A.T)(e.pages), this.fetchQuery(e)
            }
            prefetchInfiniteQuery(e) {
                return this.fetchInfiniteQuery(e).then(h.z).catch(h.z)
            }
            ensureInfiniteQueryData(e) {
                return e.behavior = (0, A.T)(e.pages), this.ensureQueryData(e)
            }
            resumePausedMutations() {
                return V.f.isOnline() ? (0, f._)(this, s).resumePausedMutations() : Promise.resolve()
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
                (0, g._)(this, o, e)
            }
            setQueryDefaults(e, t) {
                (0, f._)(this, l).set((0, h.q)(e), {
                    queryKey: e,
                    defaultOptions: t
                })
            }
            getQueryDefaults(e) {
                let t = [...(0, f._)(this, l).values()],
                    a = {};
                return t.forEach(t => {
                    (0, h.P)(e, t.queryKey) && Object.assign(a, t.defaultOptions)
                }), a
            }
            setMutationDefaults(e, t) {
                (0, f._)(this, c).set((0, h.q)(e), {
                    mutationKey: e,
                    defaultOptions: t
                })
            }
            getMutationDefaults(e) {
                let t = [...(0, f._)(this, c).values()],
                    a = {};
                return t.forEach(t => {
                    (0, h.P)(e, t.mutationKey) && Object.assign(a, t.defaultOptions)
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
                return t.queryHash || (t.queryHash = (0, h.J)(t.queryKey, t)), void 0 === t.refetchOnReconnect && (t.refetchOnReconnect = "always" !== t.networkMode), void 0 === t.throwOnError && (t.throwOnError = !!t.suspense), !t.networkMode && t.persister && (t.networkMode = "offlineFirst"), t.queryFn === h.V && (t.enabled = !1), t
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
                }), (0, m._)(this, c, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, u, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, d, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, p, {
                    writable: !0,
                    value: void 0
                }), (0, g._)(this, r, e.queryCache || new x), (0, g._)(this, s, e.mutationCache || new I), (0, g._)(this, o, e.defaultOptions || {}), (0, g._)(this, l, new Map), (0, g._)(this, c, new Map), (0, g._)(this, u, 0)
            }
        });
    e.s(["f", 0, O], 436089)
}, 49001, e => {
    "use strict";
    var t = e.i(406407),
        a = e.i(523426),
        n = e.i(239328),
        i = e.i(245299),
        r = e.i(954119),
        s = e.i(134731),
        o = e.i(165136),
        l = e.i(942100),
        c = e.i(779433),
        u = e.i(118413),
        d = e.i(428993),
        p = e.i(159022),
        f = e.i(9436),
        m = e.i(846130),
        g = e.i(787617),
        v = e.i(360894),
        y = e.i(704211),
        h = e.i(92174),
        b = e.i(926415),
        T = e.i(481186),
        w = e.i(426173),
        x = e.i(242002);
    let E = (0, e.i(157700).e)({
        namespace: "game-engine-geometry",
        name: "enableMeshTextureApiRemoveIdVerification",
        defaultValue: !1
    });
    var k = e.i(886525),
        I = e.i(665869),
        S = e.i(967230),
        C = e.i(82899),
        V = e.i(199972),
        A = e.i(792427),
        O = e.i(477797),
        P = e.i(100022),
        R = e.i(494192),
        _ = e.i(378089),
        M = e.i(579286);
    let q = [{
        flag: t.f,
        metadata: {
            namespace: "advertiser-publisher-experience",
            name: "adsActivityAnnotationsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: a.f,
        metadata: {
            namespace: "anti-cheat",
            name: "enhancedAntiCheatAccess",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: n.Z,
        metadata: {
            namespace: "avatar-marketplace",
            name: "enableCreatorShowcases",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: n.W,
        metadata: {
            namespace: "avatar-marketplace",
            name: "enableAvatarCreationTokenCategories",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: n.C,
        metadata: {
            namespace: "avatar-marketplace",
            name: "enableBulkMakeupTokenCreation",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: n.D,
        metadata: {
            namespace: "avatar-marketplace",
            name: "isAutoPublishPreferencesEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: n.n,
        metadata: {
            namespace: "avatar-marketplace",
            name: "showTaxonomyOnAvatarItemAnalyticsTab",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: n.T,
        metadata: {
            namespace: "avatar-marketplace",
            name: "enableCoreContentGatedBanner",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: n.x,
        metadata: {
            namespace: "avatar-marketplace",
            name: "enableTimedOptionsSunsetBanner",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: n.b,
        metadata: {
            namespace: "avatar-marketplace",
            name: "enableAvatarAnalyticsCreatedTimeSort",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: i.f,
        metadata: {
            namespace: "collaborative-tools",
            name: "enableEnvironments",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: r.f,
        metadata: {
            namespace: "communities",
            name: "CreatorAnalytics",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "group"
        }
    }, {
        flag: s.v,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isAssetDraftStatusEnrollmentEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: s.p,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isAssetPrivacyOptOutSurveyEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: s.E,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isAssetAccessRequestsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: s.n,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isModelCustomThumbnailUploadEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: s.r,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isAssetDependenciesViewerEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: s.A,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isCreatorStoreVideoMultipartUploadEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: s.V,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isPublishBeforeExposeEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: o.m,
        metadata: {
            namespace: "content-licensing",
            name: "isUnifiedMatchesEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: o.b,
        metadata: {
            namespace: "content-licensing",
            name: "isExperiencePreviewEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: o.j,
        metadata: {
            namespace: "content-licensing",
            name: "enableIpPlatformLicenseRecommendations",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: o.g,
        metadata: {
            namespace: "content-licensing",
            name: "isImageAttachmentEnabledInLicenseApplication",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: o.N,
        metadata: {
            namespace: "content-licensing",
            name: "isShowcaseExperiencesEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: o.X,
        metadata: {
            namespace: "content-licensing",
            name: "isIgnoreMatchEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: o.y,
        metadata: {
            namespace: "content-licensing",
            name: "maxCollectibleItemDetailsRequestCount",
            defaultValue: 30,
            valueType: "number",
            contextType: "static"
        }
    }, {
        flag: o.p,
        metadata: {
            namespace: "content-licensing",
            name: "isBadgeOnlyAgreementsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: o.a,
        metadata: {
            namespace: "content-licensing",
            name: "isIphEarningsTotalAcrossLicenseTypesEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: o.V,
        metadata: {
            namespace: "content-licensing",
            name: "isExperienceOverviewEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: o.Z,
        metadata: {
            namespace: "content-licensing",
            name: "isCreatorAcceptLicenseOfferEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l.X,
        metadata: {
            namespace: "content-publishing",
            name: "isPromotionalTextEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l.r,
        metadata: {
            namespace: "content-publishing",
            name: "isExperienceNameCharacterValidationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: c.$,
        metadata: {
            namespace: "content-suitability",
            name: "questionnaireV2Allowlist",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: c.z,
        metadata: {
            namespace: "content-suitability",
            name: "questionnaireV2Q1Release",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: c.K,
        metadata: {
            namespace: "content-suitability",
            name: "enableProposedIarcQuestionnaire",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: c.p,
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
        flag: d.p,
        metadata: {
            namespace: "creator-business",
            name: "isRevenueShareAgreementsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: d.O,
        metadata: {
            namespace: "creator-business",
            name: "enableVirtualTransactionsTab",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: d.E,
        metadata: {
            namespace: "creator-business",
            name: "newCreatorWallets",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: d.K,
        metadata: {
            namespace: "creator-business",
            name: "newTransactionsFlag",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: p.f,
        metadata: {
            namespace: "creator-compute",
            name: "enableComputeFunctions",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: f.x,
        metadata: {
            namespace: "creator-creations",
            name: "isBadgeDefaultIconEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: f.t,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsUploadEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: f.G,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsSitetestUrlParsingEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: f.p,
        metadata: {
            namespace: "creator-creations",
            name: "isTextDocumentEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: f.M,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsUploadLanguageSelectEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: f.h,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsFeedIdEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: f.s,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsShareLinkEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: f.q,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsModeratedTabEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: m.Z,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerSupportAccountTranslationPreference",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: m.k,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerSupport",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: m.b,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerSupportTicketTranslation",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: m.w,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerHostedEvents",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: m.z,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerSupportCreatorTicketReroute",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: m.n,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerSupportArchive",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: m.N,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerSupportCategoryChange",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: m._,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerSupportSpamManagement",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: m.E,
        metadata: {
            namespace: "creator-gameops",
            name: "enableEarlyTestersUserOwnedGame",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: g.M,
        metadata: {
            namespace: "creator-platform",
            name: "isTcsNoticeEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: g.a,
        metadata: {
            namespace: "creator-platform",
            name: "isCreationsNavigationReorderEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: g.K,
        metadata: {
            namespace: "creator-platform",
            name: "tryOnWebButtonEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: v.f,
        metadata: {
            namespace: "creator-roadmap",
            name: "creatorRoadmapEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: y.u,
        metadata: {
            namespace: "creator-services-insights",
            name: "isCsmExtendedMetricsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: y.J,
        metadata: {
            namespace: "creator-services-insights",
            name: "isServerLogStructuredStackTracesEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: y.L,
        metadata: {
            namespace: "creator-services-insights",
            name: "isServerRegionEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: h.P,
        metadata: {
            namespace: "devex",
            name: "shouldUseWatermarkFiatCalculation",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: h.A,
        metadata: {
            namespace: "devex",
            name: "isTaxDocumentationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: b.f,
        metadata: {
            namespace: "engine-networking",
            name: "isBandwidthNetworkTabEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: T.f,
        metadata: {
            namespace: "extended-services",
            name: "isQueueServiceAnalyticsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: w.b,
        metadata: {
            namespace: "financial-platform",
            name: "ShowDevExWithholdingAmount",
            defaultValue: 100,
            valueType: "number",
            contextType: "static"
        }
    }, {
        flag: w.h,
        metadata: {
            namespace: "financial-platform",
            name: "ShowOct20ShutoffBanner",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: w.p,
        metadata: {
            namespace: "financial-platform",
            name: "isTaxDocumentationOpenToDevexEligible",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: w.u,
        metadata: {
            namespace: "financial-platform",
            name: "isTaxFormDeliveryConsentEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: w.f,
        metadata: {
            namespace: "financial-platform",
            name: "taxFormDeliveryConsentRolloutPercentage",
            defaultValue: 100,
            valueType: "number",
            contextType: "static"
        }
    }, {
        flag: w.d,
        metadata: {
            namespace: "financial-platform",
            name: "devexFinancialPolicyRolloutPercentage",
            defaultValue: 0,
            valueType: "number",
            contextType: "static"
        }
    }, {
        flag: x.B,
        metadata: {
            namespace: "game-discovery-serving",
            name: "isAcquisitionThumbnailUpsellEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: x.p,
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
        flag: k.f,
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
        flag: S.O,
        metadata: {
            namespace: "immersive-ads",
            name: "isAdsPageRedesignEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: S.J,
        metadata: {
            namespace: "immersive-ads",
            name: "isManagedRewardedTabEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: S.j,
        metadata: {
            namespace: "immersive-ads",
            name: "isInGameTemplatePlacementEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: S.Z,
        metadata: {
            namespace: "immersive-ads",
            name: "managedRewardedCtrBenchmarkLow",
            defaultValue: .01,
            valueType: "number",
            contextType: "static"
        }
    }, {
        flag: S.k,
        metadata: {
            namespace: "immersive-ads",
            name: "managedRewardedCtrBenchmarkHigh",
            defaultValue: .05,
            valueType: "number",
            contextType: "static"
        }
    }, {
        flag: S.D,
        metadata: {
            namespace: "immersive-ads",
            name: "isRewardItemAnalyticsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: C.f,
        metadata: {
            namespace: "leaderboards",
            name: "isLeaderboardConfigsEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: V.$,
        metadata: {
            namespace: "localization",
            name: "imageLocalizationSettingsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: V.S,
        metadata: {
            namespace: "localization",
            name: "imageTranslationAllowlist",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: V.D,
        metadata: {
            namespace: "localization",
            name: "enableImageTranslationEnrollment",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: V.E,
        metadata: {
            namespace: "localization",
            name: "enableImageTranslationListingTab",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: V.F,
        metadata: {
            namespace: "localization",
            name: "enableSharedTranslationListComponents",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: A.f,
        metadata: {
            namespace: "matchmaking",
            name: "enablePlayerRouting",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: O.Y,
        metadata: {
            namespace: "monetization",
            name: "mockManagedPricingSummary",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: O.d,
        metadata: {
            namespace: "monetization",
            name: "mockManagedPricingEvents",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: O.X,
        metadata: {
            namespace: "monetization",
            name: "mockHardCodedPrices",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: O.D,
        metadata: {
            namespace: "monetization",
            name: "isProductArchiveEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: O.s,
        metadata: {
            namespace: "monetization",
            name: "isManagedPricingHolidayFreezeAlertEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: O.$,
        metadata: {
            namespace: "monetization",
            name: "mockShopItemsExternalEligibility",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: P.f,
        metadata: {
            namespace: "payouts",
            name: "enablePayoutWatermarkContributions",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "group"
        }
    }, {
        flag: R.g,
        metadata: {
            namespace: "preset-chat",
            name: "presetChatEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: R.Y,
        metadata: {
            namespace: "preset-chat",
            name: "presetChatViolationReasonsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: _.H,
        metadata: {
            namespace: "talent-hub",
            name: "enableTalentHubV2",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: _._,
        metadata: {
            namespace: "talent-hub",
            name: "enableTalentHubV2M2",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: M.f,
        metadata: {
            namespace: "tcs-experience-status",
            name: "showNeedsAttentionStatus",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }];
    e.s(["f", 0, q], 49001)
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
        }),
        c = (0, t.e)({
            namespace: "avatar-marketplace",
            name: "enableAvatarAnalyticsCreatedTimeSort",
            defaultValue: !1
        });
    e.s(["b", 0, c, "W", 0, n, "C", 0, i, "T", 0, o, "Z", 0, a, "x", 0, l, "D", 0, r, "n", 0, s])
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
            name: "isAssetDraftStatusEnrollmentEnabled",
            defaultValue: !1
        }),
        n = (0, t.e)({
            namespace: "content-access-and-inventory",
            name: "isAssetPrivacyOptOutSurveyEnabled",
            defaultValue: !1
        }),
        i = (0, t.e)({
            namespace: "content-access-and-inventory",
            name: "isAssetAccessRequestsEnabled",
            defaultValue: !1
        }),
        r = (0, t.e)({
            namespace: "content-access-and-inventory",
            name: "isModelCustomThumbnailUploadEnabled",
            defaultValue: !1
        }),
        s = (0, t.e)({
            namespace: "content-access-and-inventory",
            name: "isAssetDependenciesViewerEnabled",
            defaultValue: !1
        }),
        o = (0, t.e)({
            namespace: "content-access-and-inventory",
            name: "isCreatorStoreVideoMultipartUploadEnabled",
            defaultValue: !1
        }),
        l = (0, t.e)({
            namespace: "content-access-and-inventory",
            name: "isPublishBeforeExposeEnabled",
            defaultValue: !1
        });
    e.s(["E", 0, i, "r", 0, s, "v", 0, a, "p", 0, n, "A", 0, o, "n", 0, r, "V", 0, l])
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
        c = (0, t.e)({
            namespace: "content-licensing",
            name: "isBadgeOnlyAgreementsEnabled",
            defaultValue: !1
        }),
        u = (0, t.e)({
            namespace: "content-licensing",
            name: "isIphEarningsTotalAcrossLicenseTypesEnabled",
            defaultValue: !1
        }),
        d = (0, t.e)({
            namespace: "content-licensing",
            name: "isExperienceOverviewEnabled",
            defaultValue: !1
        }),
        p = (0, t.e)({
            namespace: "content-licensing",
            name: "isCreatorAcceptLicenseOfferEnabled",
            defaultValue: !1
        });
    e.s(["j", 0, i, "p", 0, c, "Z", 0, p, "V", 0, d, "b", 0, n, "X", 0, o, "g", 0, r, "a", 0, u, "N", 0, s, "m", 0, a, "y", 0, l])
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
        c = (0, t.e)({
            namespace: "creator-creations",
            name: "isMomentsModeratedTabEnabled",
            defaultValue: !1
        });
    e.s(["x", 0, a, "h", 0, o, "q", 0, c, "s", 0, l, "G", 0, i, "t", 0, n, "M", 0, s, "p", 0, r])
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
        }),
        i = (0, t.e)({
            namespace: "creator-services-insights",
            name: "isServerRegionEnabled",
            defaultValue: !1
        });
    e.s(["u", 0, a, "J", 0, n, "L", 0, i])
}, 926415, e => {
    "use strict";
    let t = (0, e.i(157700).e)({
        namespace: "engine-networking",
        name: "isBandwidthNetworkTabEnabled",
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
}, 665869, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.e)({
            namespace: "groups",
            name: "enableGroupGameEarlyTesters",
            defaultValue: !1
        }),
        n = (0, t.e)({
            namespace: "groups",
            name: "enableGroupModerationPage",
            defaultValue: !1
        }),
        i = (0, t.e)({
            namespace: "groups",
            name: "enableGroupDeactivation",
            defaultValue: !1
        });
    e.s(["d", 0, i, "K", 0, a, "Y", 0, n])
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
}, 792427, e => {
    "use strict";
    let t = (0, e.i(157700).e)({
        namespace: "matchmaking",
        name: "enablePlayerRouting",
        defaultValue: !1
    });
    e.s(["f", 0, t])
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
}, 579286, e => {
    "use strict";
    let t = (0, e.i(157700).e)({
        namespace: "tcs-experience-status",
        name: "showNeedsAttentionStatus",
        defaultValue: !1
    });
    e.s(["f", 0, t])
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
        c = async () => {
            localStorage.removeItem(l)
        }, u = async () => {
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
                return c(), !1
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
        } = e, [l, c] = (0, a.useState)(!0), [g, v] = (0, a.useState)("doNotShow"), {
            isFetched: y,
            user: h
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
        }, []), x = (0, a.useCallback)(async () => {
            await d(), c(!0)
        }, [c]);
        (0, a.useEffect)(() => {
            w && y && (null == h ? void 0 : h.id) && (async () => {
                let e = !1;
                try {
                    e = await u()
                } catch (e) {
                    b.logErrorEvent({
                        eventName: i.f.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "isDismissedToday",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                c(e);
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
                v(t)
            })().catch(e => {
                b.logErrorEvent({
                    eventName: i.f.AgeVerificationUpsellBannerError,
                    parameters: {
                        branch: "runAsync",
                        error: e instanceof Error ? e.message : String(e)
                    }
                })
            })
        }, [w, y, h, b]);
        let E = (0, a.useMemo)(() => {
            let e = w && "doNotShow" !== g;
            return {
                isBannerVisible: e && !l,
                isBannerEligible: e,
                isHighPriority: T,
                variant: "doNotShow" !== g ? g : "ageVerification",
                dismissBanner: x
            }
        }, [w, g, l, T, x]);
        return (0, t.jsx)(p.Provider, {
            value: E,
            children: s
        })
    }, "p", 0, () => (0, a.useContext)(p)], 906791)
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
        c = new n.I(o);
    e.s(["Z", 0, {
        authorizationApi: l,
        discoveryApi: c
    }, "o", () => r, "U", 0, s])
}, 66424, e => {
    "use strict";
    var t = e.i(73991),
        a = e.i(813914),
        a = a,
        n = a,
        i = e.i(272593);
    let r = new t.N((0, i.f)("creator-wallets", "bedev2"));

    function s(e) {
        if (void 0 === e) return;
        if (!/^[1-9]\d*$/.test(e)) throw TypeError("Creator Wallet group id must be a positive integer");
        let t = Number(e);
        if (!Number.isSafeInteger(t)) throw TypeError("Creator Wallet group id must be a safe integer");
        return t
    }
    e.s(["f", 0, {
        getOnboardingState(e, t) {
            let n = s(e);
            return (0, a.w)(void 0 === n ? r.v1SelfOnboardingStateGet({}, t) : r.v1GroupCreatorWalletIdGroupIdOnboardingStateGet({
                creatorWalletIdGroupId: n
            }, t))
        },
        getOnboardingRequirements: e => (0, a.w)(r.v1SelfOnboardingRequirementsGet({}, e)),
        selectOnboardingAccountType: e => (0, a.w)(r.v1SelfOnboardingAccountTypeselectPost({
            selectOnboardingAccountTypeRequest: e
        })),
        acceptOnboardingTerms: e => (0, a.w)(r.v1SelfOnboardingTermsacceptPost({
            acceptOnboardingTermsRequest: e
        })),
        deleteOnboardingDraft: () => (0, a.w)(r.v1SelfOnboardingDraftDelete({})),
        acknowledgeOnboardingStatus(e, t) {
            let n = s(t);
            return (0, a.w)(void 0 === n ? r.v1SelfOnboardingStatusacknowledgePost({
                acknowledgeOnboardingStatusRequest: e
            }) : r.v1GroupCreatorWalletIdGroupIdOnboardingStatusacknowledgePost({
                creatorWalletIdGroupId: n,
                acknowledgeOnboardingStatusRequest: e
            }))
        },
        getSanctionsScreening: e => (0, a.w)(r.v1SelfOnboardingSanctionsScreeningGet({}, e)),
        startSanctionsScreening: () => (0, a.w)(r.v1SelfOnboardingSanctionsScreeningstartPost({
            startSanctionsScreeningRequest: {}
        })),
        async initializeSanctionsScreeningEmbedding() {
            let e = await (0, a.w)(r.v1SelfOnboardingSanctionsScreeningEmbeddinginitializePost({
                initializeSanctionsScreeningEmbeddingRequest: {}
            }));
            return (0, n.n)(e)
        },
        getWalletBalance(e, t) {
            let n = s(e);
            return (0, a.w)(void 0 === n ? r.v1SelfWalletBalanceGet({}, t) : r.v1GroupCreatorWalletIdGroupIdWalletBalanceGet({
                creatorWalletIdGroupId: n
            }, t))
        },
        getWalletEarningsEstimate(e, t) {
            let n = s(e);
            return (0, a.w)(void 0 === n ? r.v1SelfWalletEarningsEstimateGet({}, t) : r.v1GroupCreatorWalletIdGroupIdWalletEarningsEstimateGet({
                creatorWalletIdGroupId: n
            }, t))
        },
        listBeneficiaries(e, t, n) {
            let i = s(e),
                o = (null == n ? void 0 : n.includeArchived) ? {
                    includeArchived: !0
                } : {};
            return (0, a.w)(void 0 === i ? r.v1SelfWalletBeneficiariesGet(o, t) : r.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesGet({
                creatorWalletIdGroupId: i,
                ...o
            }, t))
        },
        initializeKycEmbedding(e, t) {
            let n = s(t);
            return (0, a.w)(void 0 === n ? r.v1SelfOnboardingKycEmbeddinginitializePost({
                initializeKycEmbeddingRequest: e
            }) : r.v1GroupCreatorWalletIdGroupIdOnboardingKycEmbeddinginitializePost({
                creatorWalletIdGroupId: n,
                initializeKycEmbeddingRequest: e
            }))
        },
        initializeKycRfiEmbedding(e, t) {
            let n = s(t);
            return (0, a.w)(void 0 === n ? r.v1SelfOnboardingKycRfiEmbeddinginitializePost({
                initializeKycRfiEmbeddingRequest: e
            }) : r.v1GroupCreatorWalletIdGroupIdOnboardingKycRfiEmbeddinginitializePost({
                creatorWalletIdGroupId: n,
                initializeKycRfiEmbeddingRequest: e
            }))
        },
        async initializeBeneficiaryEmbedding(e, t) {
            let n = s(t);
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
            }(await (0, a.w)(void 0 === n ? r.v1SelfWalletBeneficiaryEmbeddinginitializePost({
                initializeBeneficiaryEmbeddingRequest: e
            }) : r.v1GroupCreatorWalletIdGroupIdWalletBeneficiaryEmbeddinginitializePost({
                creatorWalletIdGroupId: n,
                initializeBeneficiaryEmbeddingRequest: e
            })))
        },
        async saveBeneficiary(e, t) {
            let n = s(t);
            return function(e) {
                let {
                    beneficiary: t
                } = e;
                if (!t || "string" != typeof t.beneficiaryId) throw TypeError("SaveBeneficiary returned an unexpected payload");
                return t
            }(await (0, a.w)(void 0 === n ? r.v1SelfWalletBeneficiariesPost({
                saveBeneficiaryRequest: e
            }) : r.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesPost({
                creatorWalletIdGroupId: n,
                saveBeneficiaryRequest: e
            })))
        },
        archiveBeneficiary(e, t) {
            let n = s(t);
            return (0, a.w)(void 0 === n ? r.v1SelfWalletBeneficiariesBeneficiaryIdDelete({
                beneficiaryId: e
            }) : r.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesBeneficiaryIdDelete({
                creatorWalletIdGroupId: n,
                beneficiaryId: e
            }))
        },
        initiateWithdrawal(e, t) {
            let n = s(t);
            return (0, a.w)(r.v1WalletWithdrawalsPost({
                initiateWithdrawalRequest: {
                    ...e,
                    creatorWalletId: void 0 === n ? e.creatorWalletId : {
                        ...e.creatorWalletId,
                        groupId: n
                    }
                }
            }))
        }
    }], 66424)
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
        c = new t.B(i);
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
            getUniversePayouts: async e => c.v1OrganizationsOrganizationIdPayoutsUniverseIdGet(e),
            updateUniversePayouts: async e => c.v1OrganizationsOrganizationIdPayoutsUniverseIdPatch(e),
            findUniversePayouts: async e => c.v1OrganizationsOrganizationIdPayoutsUniversesGet(e),
            getLatestOneTimePayoutForUsers: async (e, t) => {
                let a = {
                    organizationId: e,
                    userIds: t.map(String)
                };
                return c.v1OrganizationsOrganizationIdPayoutsLatestGet(a)
            },
            getSuggestedPayouts: async e => c.v1OrganizationsOrganizationIdPayoutsSuggestedGet({
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
        c = e.i(509049),
        u = e.i(745873),
        d = e.i(433285),
        p = e.i(148792),
        f = e.i(811314),
        m = e.i(8994),
        g = e.i(870999),
        v = e.i(47277),
        y = e.i(67243),
        h = e.i(12246),
        b = e.i(156071),
        T = e.i(790806),
        w = e.i(759283),
        x = e.i(719338);
    let E = (0, y.f)()(() => ({
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
        k = (0, i.K)(e => {
            let {
                open: n,
                onClose: r,
                invitation: l
            } = e, {
                translate: c
            } = (0, i.A)(), {
                organization: u
            } = (0, x.f)(), {
                classes: {
                    dialogTitle: y,
                    dialogContent: k,
                    dialogSubActions: I
                }
            } = E(), {
                enqueue: S,
                close: C
            } = (0, h.J)(), V = (0, a.useCallback)(e => {
                S({
                    message: e,
                    anchorOrigin: {
                        vertical: "bottom",
                        horizontal: "center"
                    },
                    autoHideDuration: w.A,
                    autoHide: !0,
                    onClose: C
                })
            }, [S, C]), [A, O] = (0, a.useState)(), [P, R] = (0, a.useState)(), [_, M] = (0, a.useState)(), [q, z] = (0, a.useState)(), j = (0, a.useCallback)(async () => {
                if (null == l ? void 0 : l.senderUserId) try {
                    let e = await T.U.getUserById(Number.parseInt(l.senderUserId, 10));
                    M(e.name), z(!1)
                } catch (e) {
                    z(!0)
                }
            }, [l]), D = (0, a.useCallback)(async () => {
                if ((null == u ? void 0 : u.id) && (null == u ? void 0 : u.groupId)) try {
                    let e = await b.U.getGroupInfo(Number.parseInt(u.groupId, 10));
                    O(null == e ? void 0 : e.name)
                } catch (e) {
                    V(c("Error.GroupInformation"))
                }
            }, [null == u ? void 0 : u.groupId, null == u ? void 0 : u.id, V, c]);
            (0, a.useEffect)(() => {
                j(), D()
            }, [D, j]);
            let U = (0, a.useCallback)(() => {
                    r(void 0)
                }, [r]),
                L = (0, a.useCallback)(async () => {
                    if ((null == l ? void 0 : l.organizationId) && (null == l ? void 0 : l.id)) {
                        R(!0);
                        try {
                            await s.f.invitationClient.acceptOrDeclineInvitation(l.organizationId, l.id, {
                                status: o.P.Declined
                            }), r(!1)
                        } catch (e) {
                            V(c("Error.DecliningInvitation")), R(!1)
                        }
                    }
                }, [l.id, l.organizationId, r, V, c]),
                B = (0, a.useCallback)(async () => {
                    if ((null == l ? void 0 : l.organizationId) && (null == l ? void 0 : l.id)) {
                        R(!0);
                        try {
                            await s.f.invitationClient.acceptOrDeclineInvitation(l.organizationId, l.id, {
                                status: o.P.Accepted
                            }), r(!0)
                        } catch (e) {
                            V(c("Error.AcceptingInvitation")), R(!1)
                        }
                    }
                }, [l.id, l.organizationId, r, V, c]);
            return (0, t.jsxs)(p.f, {
                maxWidth: "Medium",
                open: n,
                children: [(0, t.jsx)(m.f, {
                    className: k,
                    children: (0, t.jsxs)(g.f, {
                        container: !0,
                        wrap: "wrap",
                        alignItems: "flex-start",
                        children: [(0, t.jsx)(g.f, {
                            container: !0,
                            children: (0, t.jsx)(v.f, {
                                variant: "h4",
                                className: y,
                                children: c("Label.JoinOrganization", {
                                    organizationName: null != A ? A : c("Label.Group")
                                })
                            })
                        }), (0, t.jsx)(g.f, {
                            container: !0,
                            children: (0, t.jsx)(v.f, {
                                variant: "body1",
                                children: q ? c("Message.JoinOrganizationWithoutUsername") : c("Message.JoinOrganization", {
                                    username: null != _ ? _ : ""
                                })
                            })
                        })]
                    })
                }), (0, t.jsx)(f.f, {
                    children: (0, t.jsxs)(g.f, {
                        container: !0,
                        justifyContent: "space-between",
                        children: [(0, t.jsx)(d.f, {
                            variant: "outlined",
                            color: "primary",
                            size: "small",
                            onClick: U,
                            disabled: P,
                            children: c("Action.NotNow")
                        }), (0, t.jsxs)(g.f, {
                            className: I,
                            children: [(0, t.jsx)(d.f, {
                                variant: "outlined",
                                color: "primary",
                                size: "small",
                                onClick: L,
                                disabled: P,
                                children: c("Action.Decline")
                            }), (0, t.jsx)(d.f, {
                                variant: "contained",
                                color: "primaryBrand",
                                size: "small",
                                onClick: B,
                                loading: P,
                                children: c("Action.Accept")
                            })]
                        })]
                    })
                })]
            })
        }, [l.f.Organization]),
        I = (0, y.f)()(() => ({
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
        S = (0, i.K)(e => {
            let {
                open: n,
                onClose: r,
                invitation: s,
                accepted: o
            } = e, {
                translate: l
            } = (0, i.A)(), {
                classes: {
                    dialogTitle: c,
                    dialogContent: u,
                    dialogActions: y
                }
            } = I(), [h, b] = (0, a.useState)(), [w, x] = (0, a.useState)(), E = (0, a.useCallback)(async () => {
                if (null == s ? void 0 : s.senderUserId) try {
                    let e = await T.U.getUserById(Number.parseInt(s.senderUserId, 10));
                    b(e.name), x(!1)
                } catch (e) {
                    x(!0)
                }
            }, [s]);
            (0, a.useEffect)(() => {
                E()
            }, [E]);
            let k = (0, a.useCallback)(() => {
                r()
            }, [r]);
            return (0, t.jsxs)(p.f, {
                maxWidth: "Medium",
                open: n,
                onClose: r,
                children: [(0, t.jsx)(m.f, {
                    className: u,
                    children: (0, t.jsxs)(g.f, {
                        container: !0,
                        wrap: "wrap",
                        alignItems: "flex-start",
                        children: [(0, t.jsx)(v.f, {
                            variant: "h4",
                            className: c,
                            children: l(o ? "Label.InvitationAccepted" : "Label.InvitationDeclined")
                        }), (0, t.jsx)(v.f, {
                            variant: "body1",
                            children: o ? (0, t.jsx)(t.Fragment, {
                                children: w ? l("Message.InvitationAcceptedWithoutUsername") : l("Message.InvitationAccepted", {
                                    username: null != h ? h : ""
                                })
                            }) : (0, t.jsx)(t.Fragment, {
                                children: w ? l("Message.InvitationDeclinedWithoutUsername") : l("Message.InvitationDeclined", {
                                    username: null != h ? h : ""
                                })
                            })
                        })]
                    })
                }), (0, t.jsx)(f.f, {
                    className: y,
                    children: (0, t.jsx)(g.f, {
                        container: !0,
                        justifyContent: "flex-end",
                        children: (0, t.jsx)(d.f, {
                            variant: "contained",
                            color: "primaryBrand",
                            size: "small",
                            onClick: k,
                            children: l("Action.Close")
                        })
                    })
                })]
            })
        }, [l.f.Organization]);
    var C = e.i(582977),
        V = e.i(672401);
    let A = (0, i.K)(e => {
        let {
            children: i
        } = e, l = (0, n.useRouter)(), {
            user: d
        } = (0, r.f)(), p = (0, u.W)(), {
            currentItemGroupId: f
        } = (0, c.f)(), [m, g] = (0, a.useState)(), [v, y] = (0, a.useState)(), [h, b] = (0, a.useState)(!1), [T, w] = (0, a.useState)(!1), [x, E] = (0, a.useState)(), [I, A] = (0, a.useState)(!1), O = null == d ? void 0 : d.id, P = (0, a.useMemo)(() => {
            var e;
            return null != (e = null == p ? void 0 : p.id) ? e : f
        }, [p, f]), R = l.query[C.L], _ = l.isReady, M = (0, a.useCallback)(() => {
            n.default.push("https://create.".concat("roblox.com", "/dashboard/creations"))
        }, []), q = (0, a.useCallback)(async e => {
            if (!O) return void y(null);
            try {
                let t = await s.f.userClient.getUserInvitationByOrganization(e, O.toString());
                y(t)
            } catch (e) {
                y(null), M()
            }
        }, [O, M]), z = (0, a.useCallback)(async () => {
            if (_) {
                w(!0);
                try {
                    if ("string" == typeof R) return void await q(R);
                    if (!P) return void g(null);
                    if (y(null), P) {
                        let e = await s.f.organizationClient.getOrganization(P.toString());
                        g(e)
                    } else g(void 0);
                    b(!1)
                } catch (e) {
                    g(null), y(null)
                } finally {
                    w(!1)
                }
            }
        }, [P, q, R, _]), j = (0, a.useCallback)(() => {
            b(!0), z()
        }, [z]), D = (0, a.useMemo)(() => ({
            organization: m,
            refreshOrganization: j,
            isOrganizationRefreshRequired: h,
            isOrganizationLoading: T
        }), [m, j, h, T]);
        return (0, a.useEffect)(() => {
            z()
        }, [z]), (0, t.jsx)(V.f.Provider, {
            value: D,
            children: (0, t.jsxs)(t.Fragment, {
                children: [i, v && (0, t.jsxs)(t.Fragment, {
                    children: [(0, t.jsx)(k, {
                        open: v.invitationStatusType === o.P.Open && void 0 === x,
                        onClose: e => {
                            !0 === e ? (E(!0), A(!0)) : !1 === e ? (E(!1), A(!0)) : (M(), y(null))
                        },
                        invitation: v
                    }), (0, t.jsx)(S, {
                        open: I,
                        onClose: () => {
                            A(!1), !0 === x && j(), M()
                        },
                        invitation: v,
                        accepted: !0 === x
                    })]
                })]
            })
        })
    }, [l.f.Organization]);
    e.s(["f", 0, A], 911502)
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
}, 892963, e => {
    "use strict";
    var t = e.i(785517),
        a = e.i(79187),
        n = e.i(493924);
    e.s(["f", 0, () => {
        let {
            translate: e
        } = (0, a.A)();
        return (0, t.jsx)(n.U, {
            size: "large",
            illustration: "noPermissions",
            title: e("Description.AccessDenied"),
            description: e("Label.AccessDenied")
        })
    }])
}, 269966, e => {
    "use strict";
    var t = e.i(785517),
        a = e.i(79187),
        n = e.i(350898),
        i = e.i(870999),
        r = e.i(47277),
        s = e.i(814975),
        o = e.i(881670),
        l = e.i(761084),
        c = e.i(584147),
        u = e.i(892963),
        d = e.i(493924);

    function p() {
        let {
            translate: e
        } = (0, a.A)();
        return (0, t.jsx)(d.U, {
            size: "large",
            illustration: "noPermissions",
            title: e("Description.AccessDeniedAgeOrRegion"),
            description: e("Label.AccessDeniedAgeOrRegion")
        })
    }
    var f = e.i(42361);
    let m = (0, a.K)(e => {
        let {
            errorCode: o,
            isAgeOrRegionRestricted: d = !1
        } = e, {
            user: m
        } = (0, s.f)(), {
            translate: g
        } = (0, a.A)(), v = (0, n.f)(e => e.breakpoints.down("Medium")), {
            classes: {
                root: y,
                background: h,
                loggedinErrorArea: b,
                guestErrorArea: T,
                errorImage: w,
                textHeader: x,
                loggedinImageArea: E,
                guestImageArea: k
            }
        } = (0, f.f)(), {
            headingKey: I,
            descriptionKey: S
        } = c.f[o], C = null !== m;
        return 403 === o ? d ? (0, t.jsx)(p, {}) : (0, t.jsx)(u.f, {}) : (0, t.jsx)(i.f, {
            className: y,
            alignItems: "center",
            justifyContent: "center",
            container: !0,
            children: (0, t.jsxs)(i.f, {
                container: !0,
                item: !0,
                className: h,
                justifyContent: "center",
                alignItems: "flex-start",
                children: [(0, t.jsxs)(i.f, {
                    item: !0,
                    className: C ? b : T,
                    Medium: 6,
                    children: [(0, t.jsx)(r.f, {
                        color: "primary",
                        variant: "h1",
                        className: x,
                        align: v ? "center" : "left",
                        children: g(I)
                    }), (0, t.jsx)("br", {}), (0, t.jsx)(r.f, {
                        color: "secondary",
                        align: v ? "center" : "left",
                        children: g(S)
                    })]
                }), (0, t.jsx)(i.f, {
                    item: !0,
                    className: C ? E : k,
                    Medium: 6,
                    children: (0, t.jsx)("img", {
                        className: w,
                        src: l.o,
                        alt: "error",
                        width: l.z,
                        height: l.z
                    })
                })]
            })
        })
    }, [o.f.Error]);
    e.s(["f", 0, m], 269966)
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
        c = o === t.v.SimplifiedChinese ? s.default : r.default;
    e.s(["J", 0, o, "y", 0, c, "n", 0, l, "E", 0, void 0], 272749)
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
        } = (0, n.useRouter)(), [l, c] = (0, a.useState)(!0), u = (0, a.useCallback)(() => c(!1), []), d = s.some(e => r.startsWith(e)), p = (0, a.useMemo)(() => ({
            isPending: l && !d,
            completeCheck: u
        }), [l, d, u]);
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
}, 918408, e => {
    "use strict";
    var t = e.i(805290),
        a = e.i(785517),
        n = e.i(643766),
        i = e.i(823062),
        r = e.i(458330),
        s = e.i(228096),
        o = e.i(910272),
        l = e.i(463146);
    e.i(900496);
    let c = (0, n.createContext)(void 0),
        u = ["loading", "paused", "accessError", "requiredError", "forbidden", "notFound"];

    function d(e) {
        let {
            fallback: t,
            pageId: n,
            readiness: i,
            stage: r
        } = e;
        switch (i.kind) {
            case "ready":
                return null;
            case "waiting":
                if ("offline" === i.reason || "paused" === i.reason) return (0, a.jsx)(t.paused, {
                    pageId: n,
                    stage: r,
                    pendingIds: i.pendingIds,
                    reason: i.reason
                });
                return (0, a.jsx)(t.loading, {
                    pageId: n,
                    stage: r,
                    pendingIds: i.pendingIds
                });
            case "error": {
                let e = "access" === r ? t.accessError : t.requiredError,
                    s = i.failures[0];
                if (!s) throw Error("An error requires a failing root");
                return (0, a.jsx)(e, {
                    pageId: n,
                    primaryFailure: s,
                    failures: i.failures,
                    recovery: i.recovery
                })
            }
            case "unavailable":
                return (0, a.jsx)("forbidden" === i.presentation ? t.forbidden : t.notFound, {
                    pageId: n,
                    requestId: i.requestId
                });
            default:
                return i
        }
    }
    let p = {
            canRetry: !1
        },
        f = new WeakMap;

    function m(e) {
        return [...new Map(e.map(e => [e.requestId, {
            requestId: e.requestId,
            classification: h(e.classification)
        }])).values()]
    }

    function g(e) {
        return e.includes("offline") ? "offline" : e.includes("paused") ? "paused" : e.includes("prerequisite") ? "prerequisite" : "request"
    }

    function v(e) {
        if (!/^[a-z][a-z0-9_.-]{0,79}$/i.test(e)) throw Error("Barista page/request IDs must be static diagnostic names")
    }
    let y = ["network", "service", "invalid-data", "contract", "unknown"];

    function h(e) {
        return y.includes(e) ? e : "unknown"
    }
    class b {
        setLogger(e) {
            this.logger = e
        }
        activateReporter(e) {
            this.reporter = e
        }
        retireReporter(e) {
            this.reporter === e && (this.reporter = void 0)
        }
        retain() {
            this.cleanupGeneration++
        }
        send(e) {
            if (!this.active) return;
            let t = Object.freeze({
                    ...e,
                    durationMs: Math.max(0, performance.now() - this.startedAt)
                }),
                a = this.logger;
            queueMicrotask(() => {
                try {
                    let e;
                    a && Promise.resolve((e = {
                        schemaVersion: "1",
                        durationMs: String(Math.round(t.durationMs)),
                        kind: t.kind
                    }, ("state-change" === t.kind || "ended" === t.kind) && (e.stage = t.stage, e.outcome = t.outcome), "state-change" === t.kind && "ready" === t.outcome && (e.initial = String(t.initial), e.degraded = String(t.degraded)), "optional-settled" === t.kind && (e.degraded = String(t.degraded)), "ended" === t.kind && (e.reason = t.reason, e.reachedReady = String(t.reachedReady)), a.logWebVitalsEvent.bind(a)({
                        eventName: "baristaPageLifecycle",
                        parameters: e
                    }))).catch(() => void 0)
                } catch (e) {}
            })
        }
        start() {
            this.retain(), this.started || (this.started = !0, this.active = !0, this.startedAt = performance.now())
        }
        finish(e) {
            this.active && (this.send({
                kind: "ended",
                stage: this.stage,
                outcome: this.outcome,
                reason: e,
                reachedReady: this.reachedReady
            }), this.active = !1)
        }
        abandon() {
            let e = ++this.cleanupGeneration;
            queueMicrotask(() => {
                e === this.cleanupGeneration && this.finish("unmounted")
            })
        }
        commit(e, t) {
            t === this.reporter && (this.started && void 0 !== this.scopeKey && e.scopeKey !== this.scopeKey && (this.finish(void 0 === e.scopeKey ? "scope-retired" : "scope-changed"), this.started = !1, this.reachedReady = !1, this.optionalSettled = !1, this.signature = ""), this.scopeKey = e.scopeKey, this.start(), this.report(e.stage, e.readiness, e.requests))
        }
        reportState(e) {
            let t = "".concat(e.stage, ":").concat(e.outcome);
            this.stage = e.stage, this.outcome = e.outcome, t !== this.signature && (this.signature = t, this.send({
                kind: "state-change",
                ...e
            }))
        }
        report(e, t, a) {
            if (this.started || this.start(), "waiting" === t.kind) {
                this.stage = e, this.outcome = "waiting", this.signature = "".concat(e, ":waiting");
                return
            }
            if ("scope" !== e) {
                if ("error" === t.kind) {
                    let a = Object.freeze(m(t.failures).map(e => Object.freeze(e)));
                    this.reportState({
                        stage: e,
                        outcome: "error",
                        failures: a
                    })
                } else if ("unavailable" === t.kind) this.reportState("access" === e && "not-found" !== t.cause ? {
                    stage: e,
                    outcome: "disabled" === t.cause ? "disabled" : "denied",
                    requestId: t.requestId
                } : {
                    stage: e,
                    outcome: "not-found",
                    requestId: t.requestId
                });
                else if ("content" === e) {
                    let t = Object.values(null != a ? a : {}).filter(e => "optional" === e.requirement),
                        n = t.some(e => "waiting" === e.outcome.kind),
                        i = t.some(e => "error" === e.outcome.kind || "blocked" === e.outcome.kind),
                        r = !this.reachedReady;
                    this.reachedReady = !0, this.reportState({
                        stage: e,
                        outcome: "ready",
                        initial: r,
                        degraded: i
                    }), this.optionalSettled || !(t.length > 0) || n || (this.optionalSettled = !0, this.send({
                        kind: "optional-settled",
                        degraded: i
                    }))
                }
            }
        }
        constructor(e) {
            (0, t._)(this, "logger", void 0), (0, t._)(this, "startedAt", 0), (0, t._)(this, "started", !1), (0, t._)(this, "active", !1), (0, t._)(this, "reachedReady", !1), (0, t._)(this, "optionalSettled", !1), (0, t._)(this, "cleanupGeneration", 0), (0, t._)(this, "reporter", void 0), (0, t._)(this, "stage", "scope"), (0, t._)(this, "outcome", "waiting"), (0, t._)(this, "scopeKey", void 0), (0, t._)(this, "signature", ""), this.logger = e
        }
    }

    function T(e) {
        let {
            visit: t,
            ...a
        } = e, [i] = (0, n.useState)(() => ({}));
        return (0, n.useLayoutEffect)(() => (t.activateReporter(i), () => {
            t.retireReporter(i)
        }), [t, i]), (0, n.useEffect)(() => {
            t.commit(a, i)
        }), null
    }

    function w(e, t) {
        var a;
        let n, i, r, s, o = m(t);
        return a = Object.values(e), i = new Set(o.map(e => e.requestId)), r = new Set, s = new Map, a.forEach(function e(t) {
            var a;
            if (r.has(t)) return;
            r.add(t);
            let {
                outcome: n
            } = t;
            "error" === n.kind && i.has(n.failure.requestId) ? s.set(n.failure.requestId, n.recovery) : "blocked" === n.kind && (null == (a = t.parents) || a.forEach(e))
        }), 0 === (n = [...new Set([...s.values()])].filter(e => e.canRetry)).length ? p : {
            canRetry: !0,
            isRetrying: n.some(e => e.isRetrying),
            async retry() {
                await Promise.allSettled(n.map(e => e.retry()))
            }
        }
    }

    function x(e) {
        let t = [...e],
            a = new Set;
        for (let e of t) {
            var n;
            if (a.has(e)) continue;
            a.add(e);
            let {
                outcome: i
            } = e;
            if (("skipped" === i.kind || "error" === i.kind) && "not-found" === i.presentation) return e;
            "blocked" === i.kind && t.push(...null != (n = e.parents) ? n : [])
        }
    }

    function E(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
            a = Object.entries(e).map(e => {
                let [a, n] = e;
                if (a !== n.id) throw Error("Request record keys must match declaration IDs");
                if (v(a), t.includes(a)) throw Error("Request IDs must be unique across access and content");
                return "".concat(a, ":").concat(n.kind, ":").concat(n.purpose, ":").concat(n.requirement)
            }).join("|"),
            [i] = (0, n.useState)(a);
        if (i !== a) throw Error("Request declarations must retain their IDs, order, roles, and requirements")
    }
    let k = Object.freeze({}),
        I = [],
        S = () => () => void 0,
        C = () => !0,
        V = () => !1,
        A = "barista-pages/inert";

    function O(e) {
        return "paused" !== e ? "request" : r.f.isOnline() ? "paused" : "offline"
    }

    function P(e, t, a) {
        let n = "access-prerequisite" === e.purpose && void 0 === e.onError ? {
            kind: "not-found"
        } : {
            kind: "error",
            classification: "unknown"
        };
        try {
            var i, r, s, o, l;
            n = null != (i = null != (r = null == (o = e.onError) || null == (s = o.classify) ? void 0 : s.call(o, t)) ? r : null == (l = e.classifyError) ? void 0 : l.call(e, t)) ? i : n
        } catch (e) {
            n = {
                kind: "error",
                classification: "contract"
            }
        }
        return {
            kind: "error",
            failure: {
                requestId: e.id,
                classification: "not-found" === n.kind ? "unknown" : h(n.classification)
            },
            presentation: "not-found" === n.kind ? "not-found" : "error",
            recovery: a
        }
    }
    let R = Symbol("missing-layout-context"),
        _ = (0, n.createContext)(R);
    e.s(["u", 0, function(e) {
        let {
            fallback: t,
            children: n
        } = e;
        return (0, a.jsx)(c.Provider, {
            value: t,
            children: n
        })
    }, "z", 0, function(e) {
        let t = Object.freeze({
            ...e,
            fallback: Object.freeze({
                ...e.fallback
            }),
            pageConfig: e.pageConfig ? Object.freeze({
                ...e.pageConfig
            }) : void 0
        });
        v(t.id);
        let r = function(e) {
            var t;
            let r = e.usePageScope,
                s = e.usePageState,
                o = e.useAccess,
                l = null != (t = e.useRequests) ? t : () => k,
                c = {
                    scope: void 0
                },
                u = {
                    kind: "waiting",
                    reason: "prerequisite",
                    pendingIds: I
                };

            function v(t) {
                let {
                    context: n,
                    scopeKey: i,
                    visit: r,
                    pageState: s,
                    fallback: o,
                    access: c,
                    accessIds: u = I
                } = t, f = l({
                    ...n,
                    access: c,
                    pageState: s
                });
                E(f, u);
                let v = function(e) {
                        let t = Object.values(e).filter(e => "required" === e.requirement),
                            a = x(t);
                        if (a) return {
                            kind: "unavailable",
                            requestId: a.id,
                            presentation: "not-found",
                            cause: "not-found"
                        };
                        let n = m(t.flatMap(e => {
                            var t;
                            return "error" === (t = e.outcome).kind ? [t.failure] : "blocked" === t.kind ? t.failures : []
                        }));
                        for (let a of t) {
                            let {
                                outcome: t
                            } = a;
                            if ("error" === t.kind || "blocked" === t.kind) {
                                let t = n.length > 0 ? n : [{
                                    requestId: a.id,
                                    classification: "contract"
                                }];
                                return {
                                    kind: "error",
                                    failures: t,
                                    recovery: w(e, t)
                                }
                            }
                            if ("skipped" === t.kind) return {
                                kind: "error",
                                failures: [{
                                    requestId: a.id,
                                    classification: "contract"
                                }],
                                recovery: p
                            }
                        }
                        let i = t.filter(e => "waiting" === e.outcome.kind);
                        return i.length > 0 ? {
                            kind: "waiting",
                            pendingIds: i.map(e => e.id),
                            reason: g(i.map(e => "waiting" === e.outcome.kind ? e.outcome.reason : "request"))
                        } : {
                            kind: "ready"
                        }
                    }(f),
                    y = {
                        pageState: s,
                        data: Object.fromEntries(Object.entries(f).flatMap(e => {
                            let [t, a] = e;
                            return "required" === a.requirement && "success" === a.outcome.kind ? [
                                [t, a.outcome.data]
                            ] : []
                        })),
                        optional: Object.fromEntries(Object.entries(f).filter(e => {
                            let [, t] = e;
                            return "optional" === t.requirement
                        })),
                        pagination: Object.fromEntries(Object.entries(f).flatMap(e => {
                            let [t, a] = e;
                            return "required" === a.requirement && "infinite" === a.kind ? [
                                [t, a.pagination]
                            ] : []
                        }))
                    },
                    h = e.PageBody;
                return (0, a.jsxs)(a.Fragment, {
                    children: [(0, a.jsx)(T, {
                        visit: r,
                        scopeKey: i,
                        stage: "content",
                        readiness: v,
                        requests: f
                    }), (0, a.jsx)(h, {
                        requests: f,
                        pageState: s,
                        renderContent: t => "ready" === v.kind ? t(y) : (0, a.jsx)(d, {
                            fallback: o,
                            pageId: e.id,
                            readiness: v,
                            stage: "content"
                        })
                    })]
                })
            }

            function y(t) {
                if (!o) throw Error("Missing access hook");
                let n = o(t.context);
                E(n);
                let i = function(e) {
                    let t = Object.values(e);
                    for (let a of ["enablement", "permission"]) {
                        let n = t.filter(e => "enablement" === a ? "enablement" === e.purpose : "enablement" !== e.purpose),
                            i = n.map(t => ({
                                id: t.id,
                                outcome: function(e, t) {
                                    var a, n;
                                    if ("gate" === e.kind) return e.outcome;
                                    if ("permission" === e.purpose) return null != (a = f.get(e)) ? a : {
                                        kind: "error",
                                        failure: {
                                            requestId: e.id,
                                            classification: "contract"
                                        },
                                        recovery: p
                                    };
                                    let {
                                        outcome: i
                                    } = e;
                                    switch (i.kind) {
                                        case "success":
                                            return {
                                                kind: "allowed"
                                            };
                                        case "waiting":
                                            return {
                                                kind: "waiting", reason: i.reason
                                            };
                                        case "error":
                                            return "not-found" === i.presentation ? {
                                                kind: "denied",
                                                presentation: "not-found"
                                            } : {
                                                kind: "error",
                                                failure: i.failure,
                                                recovery: i.recovery
                                            };
                                        case "blocked":
                                            return {
                                                kind: "error", failure: null != (n = i.failures[0]) ? n : {
                                                    requestId: e.id,
                                                    classification: "contract"
                                                }, recovery: w(t, i.failures)
                                            };
                                        case "skipped":
                                            return {
                                                kind: "error", failure: {
                                                    requestId: e.id,
                                                    classification: "contract"
                                                }, recovery: p
                                            };
                                        default:
                                            return i
                                    }
                                }(t, e)
                            })),
                            r = i.find(e => "denied" === e.outcome.kind);
                        if ((null == r ? void 0 : r.outcome.kind) === "denied") {
                            let e = n.find(e => e.id === r.id);
                            return {
                                kind: "unavailable",
                                requestId: r.id,
                                presentation: r.outcome.presentation,
                                cause: "enablement" === a ? "disabled" : (null == e ? void 0 : e.purpose) === "access-prerequisite" ? "not-found" : "denied"
                            }
                        }
                        let s = x(n.filter(e => "gate" !== e.kind));
                        if (s) return {
                            kind: "unavailable",
                            requestId: s.id,
                            presentation: "not-found",
                            cause: "not-found"
                        };
                        let o = new Map(i.map(e => [e.id, e.outcome])),
                            l = m(n.flatMap(e => {
                                if ("gate" !== e.kind && "blocked" === e.outcome.kind) return e.outcome.failures;
                                let t = o.get(e.id);
                                return (null == t ? void 0 : t.kind) === "error" ? [t.failure] : []
                            }));
                        if (l.length > 0) {
                            let t = m(l);
                            return {
                                kind: "error",
                                failures: t,
                                recovery: w(e, t)
                            }
                        }
                        let c = i.filter(e => "waiting" === e.outcome.kind);
                        if (c.length > 0) return {
                            kind: "waiting",
                            pendingIds: c.map(e => e.id),
                            reason: g(c.map(e => "waiting" === e.outcome.kind ? e.outcome.reason : "prerequisite"))
                        }
                    }
                    return {
                        kind: "ready"
                    }
                }(n);
                if ("ready" !== i.kind) return (0, a.jsxs)(a.Fragment, {
                    children: [(0, a.jsx)(T, {
                        visit: t.visit,
                        scopeKey: t.scopeKey,
                        stage: "access",
                        readiness: i
                    }), (0, a.jsx)(d, {
                        fallback: t.fallback,
                        pageId: e.id,
                        readiness: i,
                        stage: "access"
                    })]
                });
                let r = Object.fromEntries(Object.entries(n).flatMap(e => {
                    let [t, a] = e;
                    return "access-prerequisite" === a.purpose && "success" === a.outcome.kind ? [
                        [t, a.outcome.data]
                    ] : []
                }));
                return (0, a.jsx)(v, {
                    ...t,
                    access: r,
                    accessIds: Object.keys(n)
                })
            }
            let h = o ? function(t) {
                    return (0, n.useSyncExternalStore)(S, C, V) ? (0, a.jsx)(y, {
                        ...t
                    }) : (0, a.jsxs)(a.Fragment, {
                        children: [(0, a.jsx)(T, {
                            visit: t.visit,
                            scopeKey: t.scopeKey,
                            stage: "access",
                            readiness: u
                        }), (0, a.jsx)(d, {
                            fallback: t.fallback,
                            pageId: e.id,
                            readiness: u,
                            stage: "access"
                        })]
                    })
                } : function(e) {
                    return (0, a.jsx)(v, {
                        ...e,
                        access: {}
                    })
                },
                A = s ? function(e) {
                    if (!s) throw Error("Missing state hook");
                    let t = s(e.context);
                    return (0, a.jsx)(h, {
                        ...e,
                        pageState: t
                    })
                } : h;

            function O(t) {
                let {
                    pageProps: n,
                    layoutContext: i,
                    visit: s,
                    fallback: o
                } = t;
                if (!r) throw Error("Missing scope hook");
                let l = r({
                        pageProps: n,
                        layoutContext: i
                    }),
                    c = o.loading;
                if ("ready" !== l.kind) return (0, a.jsxs)(a.Fragment, {
                    children: [(0, a.jsx)(T, {
                        visit: s,
                        scopeKey: void 0,
                        stage: "scope",
                        readiness: {
                            kind: "waiting",
                            reason: "prerequisite",
                            pendingIds: I
                        }
                    }), "waiting" === l.kind ? (0, a.jsx)(c, {
                        pageId: e.id,
                        stage: "scope",
                        pendingIds: I
                    }) : (0, a.jsx)("div", {
                        style: {
                            display: "contents"
                        },
                        children: l.content
                    })]
                });
                if (0 === l.scopeKey.length) throw Error("Ready scopes require an authority reset key");
                return (0, a.jsx)(A, {
                    context: l.context,
                    scopeKey: l.scopeKey,
                    visit: s,
                    fallback: o
                }, l.scopeKey)
            }
            return function(e) {
                let t = function() {
                    let e = (0, i.W)(),
                        [t] = (0, n.useState)(() => new b),
                        a = null == e ? void 0 : e.unifiedLogger,
                        r = null == e ? void 0 : e.pageContext;
                    return (0, n.useLayoutEffect)(() => {
                        if (!a || !r) return void t.setLogger(void 0);
                        let e = {
                            path: r.path,
                            tags: [...r.tags],
                            rosId: r.rosId
                        };
                        t.setLogger({
                            logWebVitalsEvent: t => a.logWebVitalsEvent({
                                ...t,
                                pageContext: e
                            })
                        })
                    }, [t, a, r]), (0, n.useEffect)(() => (t.retain(), () => {
                        t.abandon()
                    }), [t]), t
                }();
                return r ? (0, a.jsx)(O, {
                    ...e,
                    visit: t
                }) : (0, a.jsx)(A, {
                    context: c,
                    scopeKey: "page-mount",
                    visit: t,
                    fallback: e.fallback
                })
            }
        }(t);
        return Object.assign(function(e) {
            var i;
            let s, o = (i = t.fallback, (0, n.useMemo)(() => {
                    let e = {
                        ...s,
                        ...i
                    };
                    for (let t of u)
                        if (void 0 === e[t]) throw Error("Missing page fallback: ".concat(t));
                    return e
                }, [s = (0, n.useContext)(c), i])),
                l = (0, n.useContext)(_);
            if (l === R && t.usePageScope) throw Error("Render scoped pages through their attached getPageLayout callback");
            return (0, a.jsx)(r, {
                pageProps: e,
                fallback: o,
                layoutContext: l
            }, t.id)
        }, t.pageConfig, {
            getPageLayout: (e, n) => {
                let i = (0, a.jsx)(_.Provider, {
                    value: n,
                    children: e
                });
                return t.getPageLayout ? t.getPageLayout(i, n) : i
            }
        })
    }, "L", 0, function(e) {
        return function(t) {
            return function(e) {
                var t, a, n, i, r, c, u;
                v(e.id);
                let d = (0, s.d)(),
                    m = "ready" === e.input.kind,
                    g = "ready" === e.input.kind ? e.queryOptions(e.input.value) : void 0,
                    y = (0, o.f)({
                        ...g,
                        queryKey: null != (t = null == g ? void 0 : g.queryKey) ? t : [A, e.id],
                        queryFn: m && null != (a = null == g ? void 0 : g.queryFn) ? a : l.V,
                        enabled: m,
                        subscribed: m,
                        throwOnError: !1,
                        notifyOnChangeProps: "all",
                        queryHash: void 0
                    }),
                    h = d.getQueryCache().find({
                        queryKey: null != (n = null == g ? void 0 : g.queryKey) ? n : [A, e.id]
                    });
                if (!h) throw Error("Missing query observer");
                let b = y.isError && y.error !== h.state.error,
                    T = (r = m && y.isError && !b, c = y.isFetching, u = () => y.refetch({
                        cancelRefetch: !1
                    }), r && u ? {
                        canRetry: !0,
                        isRetrying: c,
                        async retry() {
                            try {
                                await u()
                            } catch (e) {}
                        }
                    } : p),
                    w = function(e, t, a) {
                        var n;
                        let i = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : {
                                selectionFailed: !1,
                                hasUsableSelection: !1
                            },
                            {
                                input: r,
                                id: s
                            } = e;
                        if ("blocked" === r.kind) return {
                            kind: "blocked",
                            failures: r.failures
                        };
                        if ("waiting" === r.kind) return {
                            kind: "waiting",
                            reason: r.reason,
                            waitingFor: r.waitingFor
                        };
                        if ("skipped" === r.kind) return "optional" === e.requirement ? {
                            kind: "skipped",
                            reason: r.reason
                        } : "data" !== e.purpose ? {
                            kind: "error",
                            failure: {
                                requestId: s,
                                classification: "contract"
                            },
                            presentation: "error",
                            recovery: p
                        } : "not-found" === e.onSkipped ? {
                            kind: "skipped",
                            reason: r.reason,
                            presentation: "not-found"
                        } : (null == (n = e.onSkipped) ? void 0 : n.kind) === "fallback" ? {
                            kind: "success",
                            data: e.onSkipped.value,
                            refresh: {
                                kind: "idle"
                            }
                        } : {
                            kind: "error",
                            failure: {
                                requestId: s,
                                classification: "contract"
                            },
                            presentation: "error",
                            recovery: p
                        };
                        if ("data" !== e.purpose && "error" === t.status) return P(e, t.error, a);
                        if (t.isPlaceholderData) return {
                            kind: "waiting",
                            reason: O(t.fetchStatus),
                            waitingFor: [s]
                        };
                        if (i.selectionFailed && "error" === t.status) return P(e, t.error, p);
                        if ("success" === t.status || i.hasUsableSelection || void 0 !== t.data) {
                            let n, i = "error" === t.status ? {
                                kind: "error",
                                failure: {
                                    requestId: e.id,
                                    classification: "error" === (n = P(e, t.error, p)).kind ? n.failure.classification : "unknown"
                                },
                                recovery: a
                            } : "paused" === t.fetchStatus ? {
                                kind: "paused"
                            } : "fetching" === t.fetchStatus ? {
                                kind: "refreshing"
                            } : {
                                kind: "idle"
                            };
                            return {
                                kind: "success",
                                data: t.data,
                                refresh: i
                            }
                        }
                        return "error" === t.status ? P(e, t.error, a) : {
                            kind: "waiting",
                            reason: O(t.fetchStatus),
                            waitingFor: [s]
                        }
                    }(e, y, T, {
                        selectionFailed: b,
                        hasUsableSelection: h.state.dataUpdateCount > 0
                    }),
                    x = {
                        id: e.id,
                        kind: "query",
                        purpose: e.purpose,
                        requirement: e.requirement,
                        outcome: w,
                        parents: e.input.parents
                    };
                return "permission" === e.purpose && (i = function(e, t) {
                    var a, n;
                    if ("error" === t.kind) return "not-found" === t.presentation ? {
                        kind: "denied",
                        presentation: "not-found"
                    } : void 0 === e.onError && "skipped" !== e.input.kind ? {
                        kind: "denied",
                        presentation: null != (a = e.onDenied) ? a : "forbidden"
                    } : {
                        kind: "error",
                        failure: t.failure,
                        recovery: t.recovery
                    };
                    if ("success" !== t.kind) return {
                        kind: "waiting",
                        reason: "waiting" === t.kind ? t.reason : "prerequisite"
                    };
                    try {
                        return e.decide(t.data) ? {
                            kind: "allowed"
                        } : {
                            kind: "denied",
                            presentation: null != (n = e.onDenied) ? n : "forbidden"
                        }
                    } catch (t) {
                        return {
                            kind: "error",
                            failure: {
                                requestId: e.id,
                                classification: "contract"
                            },
                            recovery: p
                        }
                    }
                }(e, w), f.set(x, i)), x
            }({
                ...t,
                queryOptions: e.queryOptions
            })
        }
    }, "Z", 0, function(e) {
        return {
            kind: "ready",
            dependency: "required",
            value: e
        }
    }, "w", 0, function(e) {
        return {
            kind: "skipped",
            dependency: "required",
            reason: e
        }
    }])
}, 822092, e => {
    "use strict";
    let t;
    e.s(["c", 0, e => {
        t = e.unifiedLogger
    }, "g", 0, () => t])
}, 813914, e => {
    "use strict";
    var t = e.i(805290),
        a = e.i(73991),
        n = e.i(415858);
    class i extends Error {
        constructor(e, a, n) {
            super("Creator Wallets API error: ".concat(e, " ").concat(a)), (0, t._)(this, "status", void 0), (0, t._)(this, "statusText", void 0), (0, t._)(this, "body", void 0), this.name = "CreatorWalletsApiError", this.status = e, this.statusText = a, this.body = n
        }
    }
    let r = new Set(Object.values(a.P).filter(e => e !== a.P.Invalid));

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
    }, "n", 0, function(e) {
        let {
            inquiryId: t,
            sessionToken: a
        } = e;
        if (!t || !a) throw TypeError("InitializeSanctionsScreeningEmbedding returned an unexpected payload");
        return {
            inquiryId: t,
            sessionToken: a
        }
    }, "w", 0, l])
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
}]);

//# debugId=11c4e73b-b1b7-39bf-c497-9c81d37d1391
//# sourceMappingURL=303dxgwwpylm6.js.map