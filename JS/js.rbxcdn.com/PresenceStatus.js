! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "d1874a4ba39db3ec53b67feae6486d7a2d8fc69d"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "5533c47d-cc35-46b9-97a9-acde6dfcbe5b", e._sentryDebugIdIdentifier = "sentry-dbid-5533c47d-cc35-46b9-97a9-acde6dfcbe5b")
    } catch (e) {}
}(),
function() {
    "use strict";
    var e, t, n, r, o, i, a, u, s, l, c = {},
        d = {};

    function p(e) {
        var t = d[e];
        if (void 0 !== t) return t.exports;
        var n = d[e] = {
            exports: {}
        };
        return c[e](n, n.exports, p), n.exports
    }

    function f(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
        return r
    }

    function v(e, t) {
        if (e) {
            if ("string" == typeof e) return f(e, t);
            var n = Object.prototype.toString.call(e).slice(8, -1);
            if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return f(e, t)
        }
    }

    function h(e) {
        return function(e) {
            if (Array.isArray(e)) return f(e)
        }(e) || function(e) {
            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
        }(e) || v(e) || function() {
            throw TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }
    p.n = function(e) {
        var t = e && e.__esModule ? function() {
            return e.default
        } : function() {
            return e
        };
        return p.d(t, {
            a: t
        }), t
    }, p.d = function(e, t) {
        for (var n in t) p.o(t, n) && !p.o(e, n) && Object.defineProperty(e, n, {
            enumerable: !0,
            get: t[n]
        })
    }, p.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, p.rv = function() {
        return "1.7.12"
    }, p.ruid = "bundler=rspack@1.7.12";
    var y = ["Roblox", "core-scripts", "realtime"],
        m = function(e, t) {
            var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : window;
            if ("string" == typeof e) n[e] = t;
            else {
                var r = h(e),
                    o = r.pop(),
                    i = n,
                    a = !0,
                    u = !1,
                    s = void 0;
                try {
                    for (var l, c = r[Symbol.iterator](); !(a = (l = c.next()).done); a = !0) {
                        var d, p = l.value;
                        null != (d = i)[p] || (d[p] = {}), i = i[p]
                    }
                } catch (e) {
                    u = !0, s = e
                } finally {
                    try {
                        a || null == c.return || c.return()
                    } finally {
                        if (u) throw s
                    }
                }
                i[o] = t
            }
        },
        b = function(e) {
            var t = window;
            if ("string" == typeof e) return null != t[e];
            var n = !0,
                r = !1,
                o = void 0;
            try {
                for (var i, a = e[Symbol.iterator](); !(n = (i = a.next()).done); n = !0) {
                    var u = t[i.value];
                    if (null == u) return !1;
                    t = u
                }
            } catch (e) {
                r = !0, o = e
            } finally {
                try {
                    n || null == a.return || a.return()
                } finally {
                    if (r) throw o
                }
            }
            return !0
        };

    function T(e, t) {
        return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
    }

    function w(e, t) {
        if (!T(e, t)) throw TypeError("Cannot call a class as a function")
    }

    function g(e, t) {
        for (var n = 0; n < t.length; n++) {
            var r = t[n];
            r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
        }
    }

    function P(e, t, n) {
        return t && g(e.prototype, t), n && g(e, n), e
    }

    function E(e, t, n) {
        return t in e ? Object.defineProperty(e, t, {
            value: n,
            enumerable: !0,
            configurable: !0,
            writable: !0
        }) : e[t] = n, e
    }

    function R(e) {
        for (var t = 1; t < arguments.length; t++) {
            var n = null != arguments[t] ? arguments[t] : {},
                r = Object.keys(n);
            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                return Object.getOwnPropertyDescriptor(n, e).enumerable
            }))), r.forEach(function(t) {
                E(e, t, n[t])
            })
        }
        return e
    }

    function O(e, t) {
        return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
            var t = Object.keys(e);
            if (Object.getOwnPropertySymbols) {
                var n = Object.getOwnPropertySymbols(e);
                t.push.apply(t, n)
            }
            return t
        })(Object(t)).forEach(function(n) {
            Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
        }), e
    }

    function S(e) {
        return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
    }
    var I = window.React,
        A = p.n(I);
    (N = _ || (_ = {}))[N.Offline = 0] = "Offline", N[N.Online = 1] = "Online", N[N.Game = 2] = "Game", N[N.Studio = 3] = "Studio", N[N.Invisible = 4] = "Invisible";
    var N, _, M = _,
        C = {
            exports: {}
        },
        L = {}.hasOwnProperty;

    function x() {
        for (var e = [], t = 0; t < arguments.length; t++) {
            var n = arguments[t];
            if (n) {
                var r = void 0 === n ? "undefined" : S(n);
                if ("string" === r || "number" === r) e.push(n);
                else if (Array.isArray(n)) {
                    if (n.length) {
                        var o = x.apply(null, n);
                        o && e.push(o)
                    }
                } else if ("object" === r) {
                    if (n.toString !== Object.prototype.toString && !n.toString.toString().includes("[native code]")) {
                        e.push(n.toString());
                        continue
                    }
                    for (var i in n) L.call(n, i) && n[i] && e.push(i)
                }
            }
        }
        return e.join(" ")
    }
    C.exports ? (x.default = x, C.exports = x) : window.classNames = x;
    var U = (H = C.exports) && H.__esModule && Object.prototype.hasOwnProperty.call(H, "default") ? H.default : H,
        F = function(e, t) {
            return (F = Object.setPrototypeOf || T({
                __proto__: []
            }, Array) && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function D(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        F(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }
    var k = function() {
        return (k = Object.assign || function(e) {
            for (var t, n = 1, r = arguments.length; n < r; n++)
                for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
            return e
        }).apply(this, arguments)
    };

    function B(e, t, n, r) {
        return new(n || (n = Promise))(function(o, i) {
            function a(e) {
                try {
                    s(r.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function u(e) {
                try {
                    s(r.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function s(e) {
                var t;
                e.done ? o(e.value) : (T(t = e.value, n) ? t : new n(function(e) {
                    e(t)
                })).then(a, u)
            }
            s((r = r.apply(e, t || [])).next())
        })
    }

    function j(e, t) {
        var n, r, o, i, a = {
            label: 0,
            sent: function() {
                if (1 & o[0]) throw o[1];
                return o[1]
            },
            trys: [],
            ops: []
        };
        return i = {
            next: u(0),
            throw: u(1),
            return: u(2)
        }, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
            return this
        }), i;

        function u(u) {
            return function(s) {
                var l = [u, s];
                if (n) throw TypeError("Generator is already executing.");
                for (; i && (i = 0, l[0] && (a = 0)), a;) try {
                    if (n = 1, r && (o = 2 & l[0] ? r.return : l[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, l[1])).done) return o;
                    switch (r = 0, o && (l = [2 & l[0], o.value]), l[0]) {
                        case 0:
                        case 1:
                            o = l;
                            break;
                        case 4:
                            return a.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            a.label++, r = l[1], l = [0];
                            continue;
                        case 7:
                            l = a.ops.pop(), a.trys.pop();
                            continue;
                        default:
                            if (!((o = (o = a.trys).length > 0 && o[o.length - 1]) || 6 !== l[0] && 2 !== l[0])) {
                                a = 0;
                                continue
                            }
                            if (3 === l[0] && (!o || l[1] > o[0] && l[1] < o[3])) {
                                a.label = l[1];
                                break
                            }
                            if (6 === l[0] && a.label < o[1]) {
                                a.label = o[1], o = l;
                                break
                            }
                            if (o && a.label < o[2]) {
                                a.label = o[2], a.ops.push(l);
                                break
                            }
                            o[2] && a.ops.pop(), a.trys.pop();
                            continue
                    }
                    l = t.call(e, a)
                } catch (e) {
                    l = [6, e], r = 0
                } finally {
                    n = o = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }
    var q = function() {
            function e(e) {
                void 0 === e && (e = new z);
                var t = this;
                this.configuration = e, this.fetchApi = function(e, n) {
                    return B(t, void 0, void 0, function() {
                        var t, r, o, i, a, u, s, l, c;
                        return j(this, function(d) {
                            switch (d.label) {
                                case 0:
                                    t = {
                                        url: e,
                                        init: n
                                    }, r = 0, o = this.middleware, d.label = 1;
                                case 1:
                                    return r < o.length ? (c = o[r]).pre ? [4, c.pre(k({
                                        fetch: this.fetchApi
                                    }, t))] : [3, 3] : [3, 4];
                                case 2:
                                    t = d.sent() || t, d.label = 3;
                                case 3:
                                    return r++, [3, 1];
                                case 4:
                                    return i = performance.now(), [4, (this.configuration.fetchApi || fetch)(t.url, t.init)];
                                case 5:
                                    a = d.sent(), u = performance.now(), s = 0, l = this.middleware, d.label = 6;
                                case 6:
                                    return s < l.length ? (c = l[s]).post ? [4, c.post({
                                        fetch: this.fetchApi,
                                        url: t.url,
                                        init: t.init,
                                        response: a.clone(),
                                        elapsedTime: u - i
                                    })] : [3, 8] : [3, 9];
                                case 7:
                                    a = d.sent() || a, d.label = 8;
                                case 8:
                                    return s++, [3, 6];
                                case 9:
                                    return [2, a]
                            }
                        })
                    })
                }, this.middleware = e.middleware
            }
            return e.prototype.withMiddleware = function() {
                for (var e, t = [], n = 0; n < arguments.length; n++) t[n] = arguments[n];
                var r = this.clone();
                return r.middleware = (e = r.middleware).concat.apply(e, t), r
            }, e.prototype.withPreMiddleware = function() {
                for (var e = [], t = 0; t < arguments.length; t++) e[t] = arguments[t];
                var n = e.map(function(e) {
                    return {
                        pre: e
                    }
                });
                return this.withMiddleware.apply(this, n)
            }, e.prototype.withPostMiddleware = function() {
                for (var e = [], t = 0; t < arguments.length; t++) e[t] = arguments[t];
                var n = e.map(function(e) {
                    return {
                        post: e
                    }
                });
                return this.withMiddleware.apply(this, n)
            }, e.prototype.request = function(e, t) {
                return B(this, void 0, void 0, function() {
                    var n, r, o, i;
                    return j(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return r = (n = this.createFetchParams(e, t)).url, o = n.init, [4, this.fetchApi(r, o)];
                            case 1:
                                if ((i = a.sent()).status >= 200 && i.status < 300) return [2, i];
                                throw i
                        }
                    })
                })
            }, e.prototype.createFetchParams = function(e, t) {
                var n = this.configuration.basePath + e.path;
                void 0 !== e.query && 0 !== Object.keys(e.query).length && (n += "?" + this.configuration.queryParamsStringify(e.query));
                var r, o = "u" > typeof FormData && T(e.body, FormData) || T(e.body, URLSearchParams) || (r = e.body, "u" > typeof Blob && T(r, Blob)) ? e.body : JSON.stringify(e.body),
                    i = Object.assign({}, this.configuration.headers, e.headers);
                return {
                    url: n,
                    init: k({
                        method: e.method,
                        headers: i,
                        body: o,
                        credentials: this.configuration.credentials,
                        referrerPolicy: this.configuration.referrerPolicy
                    }, t)
                }
            }, e.prototype.clone = function() {
                var e = new this.constructor(this.configuration);
                return e.middleware = this.middleware.slice(), e
            }, e
        }(),
        V = function(e) {
            function t(t, n) {
                var r = e.call(this, n) || this;
                return r.field = t, r.name = "RequiredError", r
            }
            return D(t, e), t
        }(Error),
        z = function() {
            function e(e) {
                void 0 === e && (e = {}), this.configuration = e
            }
            return Object.defineProperty(e.prototype, "basePath", {
                get: function() {
                    return this.configuration.basePath
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "fetchApi", {
                get: function() {
                    return this.configuration.fetchApi || window.fetch.bind(window)
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "middleware", {
                get: function() {
                    return this.configuration.middleware || []
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "queryParamsStringify", {
                get: function() {
                    return this.configuration.queryParamsStringify || function e(t, n) {
                        return void 0 === n && (n = ""), Object.keys(t).map(function(r) {
                            var o = n + (n.length ? "[".concat(r, "]") : r),
                                i = t[r];
                            if (T(i, Array)) {
                                var a = i.map(function(e) {
                                    return encodeURIComponent(String(e))
                                }).join("&".concat(encodeURIComponent(o), "="));
                                return "".concat(encodeURIComponent(o), "=").concat(a)
                            }
                            return T(i, Date) ? "".concat(encodeURIComponent(o), "=").concat(encodeURIComponent(i.toISOString())) : T(i, Object) ? e(i, o) : "".concat(encodeURIComponent(o), "=").concat(encodeURIComponent(String(i)))
                        }).filter(function(e) {
                            return e.length > 0
                        }).join("&")
                    }
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "username", {
                get: function() {
                    return this.configuration.username
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "password", {
                get: function() {
                    return this.configuration.password
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "apiKey", {
                get: function() {
                    var e = this.configuration.apiKey;
                    if (e) return "function" == typeof e ? e : function() {
                        return e
                    }
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "accessToken", {
                get: function() {
                    var e = this.configuration.accessToken;
                    if (e) return "function" == typeof e ? e : function() {
                        return e
                    }
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "headers", {
                get: function() {
                    return this.configuration.headers
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "credentials", {
                get: function() {
                    return this.configuration.credentials
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "referrerPolicy", {
                get: function() {
                    return this.configuration.referrerPolicy
                },
                enumerable: !1,
                configurable: !0
            }), e
        }();

    function G(e, t) {
        return null != e[t]
    }
    var H, J, W, Q = function() {
            function e(e, t) {
                void 0 === t && (t = function(e) {
                    return e
                }), this.raw = e, this.transformer = t
            }
            return e.prototype.value = function() {
                return B(this, void 0, void 0, function() {
                    var e;
                    return j(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return e = this.transformer, [4, this.raw.json()];
                            case 1:
                                return [2, e.apply(this, [t.sent()])]
                        }
                    })
                })
            }, e
        }(),
        Y = "x-csrf-token",
        Z = function() {
            function e() {
                this.currentToken = ""
            }
            return e.prototype.pre = function(e) {
                var t = e.url,
                    n = e.init;
                return "POST" === n.method || "PATCH" === n.method || "DELETE" === n.method || "PUT" === n.method ? Promise.resolve({
                    url: t,
                    init: this.appendCSRFHeader(n)
                }) : Promise.resolve({
                    url: t,
                    init: n
                })
            }, e.prototype.post = function(e) {
                var t, n = e.fetch,
                    r = e.url,
                    o = e.init,
                    i = e.response;
                return 403 === i.status && i.headers.has(Y) ? (this.currentToken = null != (t = i.headers.get(Y)) ? t : "", n(r, this.appendCSRFHeader(o))) : Promise.resolve(i)
            }, e.prototype.appendCSRFHeader = function(e) {
                var t;
                return k(k({}, e), {
                    headers: k(k({}, e.headers), ((t = {})[Y] = this.currentToken, t))
                })
            }, e
        }(),
        K = function() {
            function e() {
                this.observers = []
            }
            return e.prototype.subscribe = function(e) {
                var t = this;
                return this.observers.push(e),
                    function() {
                        return t.unsubscribe(e)
                    }
            }, e.prototype.unsubscribe = function(e) {
                this.observers = this.observers.filter(function(t) {
                    return t !== e
                })
            }, e.prototype.post = function(e) {
                var t = e.url,
                    n = e.response;
                return 503 === n.status && this.observers.forEach(function(e) {
                    return e(t)
                }), Promise.resolve(n)
            }, e
        }();
    (J || (J = {})).LoadApi = "loadApi", (W || (W = {})).Time = "time";
    var $, X = function(e) {
            void 0 === e && (e = {
                baseUrl: ""
            }), this.configuration = e, this.baseUrl = this.configuration.baseUrl
        },
        ee = function() {
            function e(e) {
                void 0 === e && (e = new X), this.configuration = e, this.baseUrl = e.baseUrl
            }
            return e.prototype.sendEvent = function(e) {
                var t = e.localTime,
                    n = e.target,
                    r = e.eventType,
                    o = e.context,
                    i = e.additionalProperties,
                    a = e.currentUrl,
                    u = e.guestId,
                    s = e.sessionId,
                    l = t.toISOString(),
                    c = new URL("".concat(this.baseUrl, "/pe"));
                return c.searchParams.append("t", n), c.searchParams.append("evt", r), c.searchParams.append("ctx", o), c.searchParams.append("lt", l), c.searchParams.append("url", a || window.location.href), void 0 !== u && c.searchParams.append("gid", u), void 0 !== s && c.searchParams.append("sid", s), void 0 !== i && Object.keys(i).forEach(function(e) {
                    c.searchParams.append(e, i[e].toString())
                }), fetch(c.href, {
                    credentials: "same-origin"
                })
            }, e.prototype.sendEventViaImg = function(e, t) {
                var n = e.localTime,
                    r = e.target,
                    o = e.eventType,
                    i = e.context,
                    a = e.additionalProperties,
                    u = e.currentUrl,
                    s = e.guestId,
                    l = e.sessionId,
                    c = n.toISOString(),
                    d = new URL("".concat(this.baseUrl, "/e.png"));
                d.searchParams.append("t", r), d.searchParams.append("evt", o), d.searchParams.append("ctx", i), d.searchParams.append("lt", c), d.searchParams.append("url", u || window.location.href), void 0 !== s && d.searchParams.append("gid", s), void 0 !== l && d.searchParams.append("sid", l), void 0 !== a && Object.keys(a).forEach(function(e) {
                    d.searchParams.append(e, a[e].toString())
                });
                var p = new Image;
                return p.src = d.href, p.onload = function() {
                    void 0 !== t && t(!0)
                }, p.onerror = function(e) {
                    void 0 !== t && t(!1), console.error(e)
                }, p
            }, e
        }(),
        et = "Grasshopper",
        en = function() {
            function e(e) {
                var t;
                this.eventTracker = (t = new ee(new X({
                    baseUrl: "https://ecsv2.".concat(e, "/").concat(et)
                })), {
                    sendEvent: function(e) {
                        var n = {
                            target: et,
                            localTime: new Date,
                            eventType: e.eventType,
                            context: e.context,
                            additionalProperties: e.additionalProperties
                        };
                        return t.sendEventViaImg(n)
                    }
                })
            }
            return e.prototype.post = function(e) {
                return this.sendApiLoadEvent(e), Promise.resolve(e.response)
            }, e.prototype.sendApiLoadEvent = function(e) {
                this.eventTracker.sendEvent({
                    eventType: J.LoadApi,
                    context: W.Time,
                    additionalProperties: {
                        elapsedTime: e.elapsedTime,
                        apiUrl: e.url,
                        statusCode: e.response.status
                    }
                })
            }, e
        }(),
        er = new Z,
        eo = new K,
        ei = function(e) {
            function t(t) {
                void 0 === t && (t = {});
                var n = k({}, t);
                if (Array.isArray(n.middleware) ? n.middleware.unshift(er, eo) : n.middleware = [er, eo], t.robloxSiteDomain) {
                    var r = new en(t.robloxSiteDomain);
                    n.middleware.unshift(r)
                }
                return e.call(this, n) || this
            }
            return D(t, e), t
        }(z);

    function ea(e) {
        return eu(e)
    }

    function eu(e, t) {
        return null == e ? e : {
            userIds: G(e, "userIds") ? e.userIds : void 0
        }
    }

    function es(e) {
        if (void 0 !== e) return null === e ? null : {
            userIds: e.userIds
        }
    }

    function el(e) {
        return ec(e)
    }

    function ec(e, t) {
        return null == e ? e : {
            location: G(e, "location") ? e.location : void 0,
            placeId: G(e, "placeId") ? e.placeId : void 0,
            disconnect: G(e, "disconnect") ? e.disconnect : void 0
        }
    }

    function ed(e) {
        if (void 0 !== e) return null === e ? null : {
            location: e.location,
            placeId: e.placeId,
            disconnect: e.disconnect
        }
    }

    function ep(e) {
        return ef(e)
    }

    function ef(e, t) {
        return null == e ? e : {
            isInvisible: G(e, "isInvisible") ? e.isInvisible : void 0
        }
    }

    function ev(e) {
        if (void 0 !== e) return null === e ? null : {
            isInvisible: e.isInvisible
        }
    }

    function eh(e) {
        return ey(e)
    }

    function ey(e, t) {
        return null == e ? e : {
            userIds: G(e, "userIds") ? e.userIds : void 0
        }
    }

    function em(e) {
        if (void 0 !== e) return null === e ? null : {
            userIds: e.userIds
        }
    }

    function eb(e) {
        return eT(e)
    }

    function eT(e, t) {
        return null == e ? e : {
            userId: G(e, "userId") ? e.userId : void 0,
            lastOnline: G(e, "lastOnline") ? new Date(e.lastOnline) : void 0
        }
    }

    function ew(e) {
        if (void 0 !== e) return null === e ? null : {
            userId: e.userId,
            lastOnline: void 0 === e.lastOnline ? void 0 : e.lastOnline.toISOString()
        }
    }

    function eg(e) {
        return eP(e)
    }

    function eP(e, t) {
        return null == e ? e : {
            lastOnlineTimestamps: G(e, "lastOnlineTimestamps") ? e.lastOnlineTimestamps.map(eb) : void 0
        }
    }

    function eE(e) {
        if (void 0 !== e) return null === e ? null : {
            lastOnlineTimestamps: void 0 === e.lastOnlineTimestamps ? void 0 : e.lastOnlineTimestamps.map(ew)
        }
    }

    function eR(e) {
        return eO(e)
    }

    function eO(e, t) {
        return null == e ? e : {
            userPresenceType: G(e, "userPresenceType") ? e.userPresenceType : void 0,
            lastLocation: G(e, "lastLocation") ? e.lastLocation : void 0,
            placeId: G(e, "placeId") ? e.placeId : void 0,
            rootPlaceId: G(e, "rootPlaceId") ? e.rootPlaceId : void 0,
            gameId: G(e, "gameId") ? e.gameId : void 0,
            universeId: G(e, "universeId") ? e.universeId : void 0,
            userId: G(e, "userId") ? e.userId : void 0,
            lastOnline: G(e, "lastOnline") ? new Date(e.lastOnline) : void 0,
            invisibleModeExpiry: G(e, "invisibleModeExpiry") ? new Date(e.invisibleModeExpiry) : void 0
        }
    }

    function eS(e) {
        if (void 0 !== e) return null === e ? null : {
            userPresenceType: e.userPresenceType,
            lastLocation: e.lastLocation,
            placeId: e.placeId,
            rootPlaceId: e.rootPlaceId,
            gameId: e.gameId,
            universeId: e.universeId,
            userId: e.userId,
            lastOnline: void 0 === e.lastOnline ? void 0 : e.lastOnline.toISOString(),
            invisibleModeExpiry: void 0 === e.invisibleModeExpiry ? void 0 : e.invisibleModeExpiry.toISOString()
        }
    }

    function eI(e) {
        return eA(e)
    }

    function eA(e, t) {
        return null == e ? e : {
            userPresences: G(e, "userPresences") ? e.userPresences.map(eR) : void 0
        }
    }

    function eN(e) {
        if (void 0 !== e) return null === e ? null : {
            userPresences: void 0 === e.userPresences ? void 0 : e.userPresences.map(eS)
        }
    }(e_ = $ || ($ = {}))[e_.NUMBER_0 = 0] = "NUMBER_0", e_[e_.NUMBER_1 = 1] = "NUMBER_1", e_[e_.NUMBER_2 = 2] = "NUMBER_2", e_[e_.NUMBER_3 = 3] = "NUMBER_3", e_[e_.NUMBER_4 = 4] = "NUMBER_4";
    var e_, eM, eC, eL, ex = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return D(t, e), t.prototype.v1PresenceLastOnlinePostRaw = function(e, t) {
                return B(this, void 0, void 0, function() {
                    var n, r;
                    return j(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.lastOnlineRequest || void 0 === e.lastOnlineRequest) throw new V("lastOnlineRequest", "Required parameter requestParameters.lastOnlineRequest was null or undefined when calling v1PresenceLastOnlinePost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/presence/last-online",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: es(e.lastOnlineRequest)
                                }, t)];
                            case 1:
                                return [2, new Q(o.sent(), function(e) {
                                    return eg(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1PresenceLastOnlinePost = function(e, t) {
                return B(this, void 0, void 0, function() {
                    return j(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1PresenceLastOnlinePostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1PresenceRegisterAppPresencePostRaw = function(e, t) {
                return B(this, void 0, void 0, function() {
                    var n, r;
                    return j(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.registerAppPresenceRequest || void 0 === e.registerAppPresenceRequest) throw new V("registerAppPresenceRequest", "Required parameter requestParameters.registerAppPresenceRequest was null or undefined when calling v1PresenceRegisterAppPresencePost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/presence/register-app-presence",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: ed(e.registerAppPresenceRequest)
                                }, t)];
                            case 1:
                                return [2, new Q(o.sent())]
                        }
                    })
                })
            }, t.prototype.v1PresenceRegisterAppPresencePost = function(e, t) {
                return B(this, void 0, void 0, function() {
                    return j(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1PresenceRegisterAppPresencePostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1PresenceSetInvisibilityStatusPostRaw = function(e, t) {
                return B(this, void 0, void 0, function() {
                    var n, r;
                    return j(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.setInvisibilityRequest || void 0 === e.setInvisibilityRequest) throw new V("setInvisibilityRequest", "Required parameter requestParameters.setInvisibilityRequest was null or undefined when calling v1PresenceSetInvisibilityStatusPost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/presence/set-invisibility-status",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: ev(e.setInvisibilityRequest)
                                }, t)];
                            case 1:
                                return [2, new Q(o.sent())]
                        }
                    })
                })
            }, t.prototype.v1PresenceSetInvisibilityStatusPost = function(e, t) {
                return B(this, void 0, void 0, function() {
                    return j(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1PresenceSetInvisibilityStatusPostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1PresenceUsersPostRaw = function(e, t) {
                return B(this, void 0, void 0, function() {
                    var n, r;
                    return j(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.userPresenceRequest || void 0 === e.userPresenceRequest) throw new V("userPresenceRequest", "Required parameter requestParameters.userPresenceRequest was null or undefined when calling v1PresenceUsersPost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/presence/users",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: em(e.userPresenceRequest)
                                }, t)];
                            case 1:
                                return [2, new Q(o.sent(), function(e) {
                                    return eI(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1PresenceUsersPost = function(e, t) {
                return B(this, void 0, void 0, function() {
                    return j(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1PresenceUsersPostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(q),
        eU = Object.freeze({
            __proto__: null,
            PresenceApi: ex,
            RobloxPresenceApiModelsRequestLastOnlineRequestFromJSON: ea,
            RobloxPresenceApiModelsRequestLastOnlineRequestFromJSONTyped: eu,
            RobloxPresenceApiModelsRequestLastOnlineRequestToJSON: es,
            RobloxPresenceApiModelsRequestRegisterAppPresenceRequestFromJSON: el,
            RobloxPresenceApiModelsRequestRegisterAppPresenceRequestFromJSONTyped: ec,
            RobloxPresenceApiModelsRequestRegisterAppPresenceRequestToJSON: ed,
            RobloxPresenceApiModelsRequestSetInvisibilityStatusRequestFromJSON: ep,
            RobloxPresenceApiModelsRequestSetInvisibilityStatusRequestFromJSONTyped: ef,
            RobloxPresenceApiModelsRequestSetInvisibilityStatusRequestToJSON: ev,
            RobloxPresenceApiModelsRequestUserPresenceRequestFromJSON: eh,
            RobloxPresenceApiModelsRequestUserPresenceRequestFromJSONTyped: ey,
            RobloxPresenceApiModelsRequestUserPresenceRequestToJSON: em,
            RobloxPresenceApiModelsResponseLastOnlineFromJSON: eb,
            RobloxPresenceApiModelsResponseLastOnlineFromJSONTyped: eT,
            RobloxPresenceApiModelsResponseLastOnlineResponseFromJSON: eg,
            RobloxPresenceApiModelsResponseLastOnlineResponseFromJSONTyped: eP,
            RobloxPresenceApiModelsResponseLastOnlineResponseToJSON: eE,
            RobloxPresenceApiModelsResponseLastOnlineToJSON: ew,
            RobloxPresenceApiModelsResponseUserPresenceFromJSON: eR,
            RobloxPresenceApiModelsResponseUserPresenceFromJSONTyped: eO,
            RobloxPresenceApiModelsResponseUserPresenceToJSON: eS,
            get RobloxPresenceApiModelsResponseUserPresenceUserPresenceTypeEnum() {
                return $
            },
            RobloxPresenceApiModelsResponseUserPresencesResponseFromJSON: eI,
            RobloxPresenceApiModelsResponseUserPresencesResponseFromJSONTyped: eA,
            RobloxPresenceApiModelsResponseUserPresencesResponseToJSON: eN
        }),
        eF = Object.freeze({
            __proto__: null,
            PresenceApi: ex,
            RobloxPresenceApiModelsRequestLastOnlineRequestFromJSON: ea,
            RobloxPresenceApiModelsRequestLastOnlineRequestFromJSONTyped: eu,
            RobloxPresenceApiModelsRequestLastOnlineRequestToJSON: es,
            RobloxPresenceApiModelsRequestRegisterAppPresenceRequestFromJSON: el,
            RobloxPresenceApiModelsRequestRegisterAppPresenceRequestFromJSONTyped: ec,
            RobloxPresenceApiModelsRequestRegisterAppPresenceRequestToJSON: ed,
            RobloxPresenceApiModelsRequestSetInvisibilityStatusRequestFromJSON: ep,
            RobloxPresenceApiModelsRequestSetInvisibilityStatusRequestFromJSONTyped: ef,
            RobloxPresenceApiModelsRequestSetInvisibilityStatusRequestToJSON: ev,
            RobloxPresenceApiModelsRequestUserPresenceRequestFromJSON: eh,
            RobloxPresenceApiModelsRequestUserPresenceRequestFromJSONTyped: ey,
            RobloxPresenceApiModelsRequestUserPresenceRequestToJSON: em,
            RobloxPresenceApiModelsResponseLastOnlineFromJSON: eb,
            RobloxPresenceApiModelsResponseLastOnlineFromJSONTyped: eT,
            RobloxPresenceApiModelsResponseLastOnlineResponseFromJSON: eg,
            RobloxPresenceApiModelsResponseLastOnlineResponseFromJSONTyped: eP,
            RobloxPresenceApiModelsResponseLastOnlineResponseToJSON: eE,
            RobloxPresenceApiModelsResponseLastOnlineToJSON: ew,
            RobloxPresenceApiModelsResponseUserPresenceFromJSON: eR,
            RobloxPresenceApiModelsResponseUserPresenceFromJSONTyped: eO,
            RobloxPresenceApiModelsResponseUserPresenceToJSON: eS,
            get RobloxPresenceApiModelsResponseUserPresenceUserPresenceTypeEnum() {
                return $
            },
            RobloxPresenceApiModelsResponseUserPresencesResponseFromJSON: eI,
            RobloxPresenceApiModelsResponseUserPresencesResponseFromJSONTyped: eA,
            RobloxPresenceApiModelsResponseUserPresencesResponseToJSON: eN,
            v1: eU
        }),
        eD = eF.v1.RobloxPresenceApiModelsResponseUserPresenceUserPresenceTypeEnum,
        ek = {
            presenceStatusToClassName: ((eM = {})[M.Offline] = "", eM[M.Online] = "online", eM[M.Game] = "game", eM[M.Studio] = "studio", eM[M.Invisible] = "invisible-mode", eM),
            presenceStatusResponseToPresenceStatus: ((eC = {})[eD.NUMBER_0] = M.Offline, eC[eD.NUMBER_1] = M.Online, eC[eD.NUMBER_2] = M.Game, eC[eD.NUMBER_3] = M.Studio, eC[eD.NUMBER_4] = M.Invisible, eC)
        };

    function eB(e, t, n, r) {
        return new(n || (n = Promise))(function(o, i) {
            function a(e) {
                try {
                    s(r.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function u(e) {
                try {
                    s(r.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function s(e) {
                var t;
                e.done ? o(e.value) : (T(t = e.value, n) ? t : new n(function(e) {
                    e(t)
                })).then(a, u)
            }
            s((r = r.apply(e, t || [])).next())
        })
    }

    function ej(e, t) {
        var n, r, o, i = {
                label: 0,
                sent: function() {
                    if (1 & o[0]) throw o[1];
                    return o[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = u(0), a.throw = u(1), a.return = u(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function u(u) {
            return function(s) {
                var l = [u, s];
                if (n) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, l[0] && (i = 0)), i;) try {
                    if (n = 1, r && (o = 2 & l[0] ? r.return : l[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, l[1])).done) return o;
                    switch (r = 0, o && (l = [2 & l[0], o.value]), l[0]) {
                        case 0:
                        case 1:
                            o = l;
                            break;
                        case 4:
                            return i.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            i.label++, r = l[1], l = [0];
                            continue;
                        case 7:
                            l = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === l[0] && (!o || l[1] > o[0] && l[1] < o[3])) {
                                i.label = l[1];
                                break
                            }
                            if (6 === l[0] && i.label < o[1]) {
                                i.label = o[1], o = l;
                                break
                            }
                            if (o && i.label < o[2]) {
                                i.label = o[2], i.ops.push(l);
                                break
                            }
                            o[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    l = t.call(e, i)
                } catch (e) {
                    l = [6, e], r = 0
                } finally {
                    n = o = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function eq(e, t, n) {
        if (n || 2 == arguments.length)
            for (var r, o = 0, i = t.length; o < i; o++) !r && o in t || (r || (r = Array.prototype.slice.call(t, 0, o)), r[o] = t[o]);
        return e.concat(r || Array.prototype.slice.call(t))
    }
    "function" == typeof SuppressedError && SuppressedError, (eV = eL || (eL = {})).Strict = "strict", eV.Lax = "lax", eV.None = "none";
    var eV, ez, eG, eH, eJ, eW, eQ, eY, eZ, eK, e$, eX, e0 = function() {
        return (e0 = Object.assign || function(e) {
            for (var t, n = 1, r = arguments.length; n < r; n++)
                for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
            return e
        }).apply(this, arguments)
    };
    "function" == typeof SuppressedError && SuppressedError, (tm = ez || (ez = {})).PagingParametersChanged = "Paging parameters were changed", tm.GetItemsFailure = "Unable to get items", tm.InvalidPageNumber = "Invalid page number", (tb = eG || (eG = {}))[tb.Initialized = 0] = "Initialized", tb[tb.Idle = 1] = "Idle", tb[tb.Loading = 2] = "Loading", (tT = eH || (eH = {})).Asc = "Asc", tT.Desc = "Desc", "RelativeTimeFormat" in Intl || function() {
        var e, t, n, r;
        e = this, t = void 0, n = void 0, r = function() {
            return function(e, t) {
                var n, r, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = u(0), a.throw = u(1), a.return = u(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function u(u) {
                    return function(s) {
                        var l = [u, s];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, l[0] && (i = 0)), i;) try {
                            if (n = 1, r && (o = 2 & l[0] ? r.return : l[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, l[1])).done) return o;
                            switch (r = 0, o && (l = [2 & l[0], o.value]), l[0]) {
                                case 0:
                                case 1:
                                    o = l;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: l[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, r = l[1], l = [0];
                                    continue;
                                case 7:
                                    l = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!((o = (o = i.trys).length > 0 && o[o.length - 1]) || 6 !== l[0] && 2 !== l[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === l[0] && (!o || l[1] > o[0] && l[1] < o[3])) {
                                        i.label = l[1];
                                        break
                                    }
                                    if (6 === l[0] && i.label < o[1]) {
                                        i.label = o[1], o = l;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(l);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            l = t.call(e, i)
                        } catch (e) {
                            l = [6, e], r = 0
                        } finally {
                            n = o = 0
                        }
                        if (5 & l[0]) throw l[1];
                        return {
                            value: l[0] ? l[1] : void 0,
                            done: !0
                        }
                    }
                }
            }(this, function(e) {
                switch (e.label) {
                    case 0:
                        return [4, Promise.resolve().then(function() {
                            return ty
                        })];
                    case 1:
                        return e.sent(), [4, Promise.resolve().then(function() {
                            return tL
                        })];
                    case 2:
                        return e.sent(), [2]
                }
            })
        }, new(n || (n = Promise))(function(o, i) {
            function a(e) {
                try {
                    s(r.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function u(e) {
                try {
                    s(r.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function s(e) {
                var t;
                e.done ? o(e.value) : (T(t = e.value, n) ? t : new n(function(e) {
                    e(t)
                })).then(a, u)
            }
            s((r = r.apply(e, t || [])).next())
        })
    }(), (tw = eJ || (eJ = {})).Edge = "edge", tw.IE = "ie", tw.Chrome = "chrome", tw.Opera = "opera", tw.Safari = "safari", tw.Firefox = "firefox", tw.Unknown = "", (tg = eW || (eW = {}))[tg.Windows = 0] = "Windows", tg[tg.macOS = 1] = "macOS", tg[tg.Linux = 2] = "Linux", tg[tg.Unix = 3] = "Unix", tg[tg.iOS = 4] = "iOS", tg[tg.Android = 5] = "Android", tg[tg.Unknown = 6] = "Unknown", (tP = eQ || (eQ = {})).Unidentified = "Unidentified", tP.Alt = "Alt", tP.AltGraph = "AltGraph", tP.CapsLock = "CapsLock", tP.Control = "Control", tP.Fn = "Fn", tP.FnLock = "FnLock", tP.Hyper = "Hyper", tP.Meta = "Meta", tP.NumLock = "NumLock", tP.ScrollLock = "ScrollLock", tP.Shift = "Shift", tP.Super = "Super", tP.Symbol = "Symbol", tP.SymbolLock = "SymbolLock", tP.Enter = "Enter", tP.Tab = "Tab", tP.ArrowDown = "ArrowDown", tP.ArrowLeft = "ArrowLeft", tP.ArrowRight = "ArrowRight", tP.ArrowUp = "ArrowUp", tP.End = "End", tP.Home = "Home", tP.PageDown = "PageDown", tP.PageUp = "PageUp", tP.Backspace = "Backspace", tP.Clear = "Clear", tP.Copy = "Copy", tP.CrSel = "CrSel", tP.Cut = "Cut", tP.Delete = "Delete", tP.EraseEof = "EraseEof", tP.ExSel = "ExSel", tP.Insert = "Insert", tP.Paste = "Paste", tP.Redo = "Redo", tP.Undo = "Undo", tP.Accept = "Accept", tP.Again = "Again", tP.Attn = "Attn", tP.Cancel = "Cancel", tP.ContextMenu = "ContextMenu", tP.Escape = "Escape", tP.Execute = "Execute", tP.Find = "Find", tP.Finish = "Finish", tP.Help = "Help", tP.Pause = "Pause", tP.Play = "Play", tP.Props = "Props", tP.Select = "Select", tP.ZoomIn = "ZoomIn", tP.ZoomOut = "ZoomOut", tP.BrightnessDown = "BrightnessDown", tP.BrightnessUp = "BrightnessUp", tP.Eject = "Eject", tP.LogOff = "LogOff", tP.Power = "Power", tP.PowerOff = "PowerOff", tP.PrintScreen = "PrintScreen", tP.Hibernate = "Hibernate", tP.Standby = "Standby", tP.WakeUp = "WakeUp", tP.AllCandidates = "AllCandidates", tP.Alphanumeric = "Alphanumeric", tP.CodeInput = "CodeInput", tP.Compose = "Compose", tP.Convert = "Convert", tP.Dead = "Dead", tP.FinalMode = "FinalMode", tP.GroupFirst = "GroupFirst", tP.GroupLast = "GroupLast", tP.GroupNext = "GroupNext", tP.GroupPrevious = "GroupPrevious", tP.ModeChange = "ModeChange", tP.NextCandidate = "NextCandidate", tP.NonConvert = "NonConvert", tP.PreviousCandidate = "PreviousCandidate", tP.Process = "Process", tP.SingleCandidate = "SingleCandidate", tP.HangulMode = "HangulMode", tP.HanjaMode = "HanjaMode", tP.JunjaMode = "JunjaMode", tP.Eisu = "Eisu", tP.Hankaku = "Hankaku", tP.Hiragana = "Hiragana", tP.HiraganaKatakana = "HiraganaKatakana", tP.KanaMode = "KanaMode", tP.KanjiMode = "KanjiMode", tP.Katakana = "Katakana", tP.Romaji = "Romaji", tP.Zenkaku = "Zenkaku", tP.ZenkakuHanaku = "ZenkakuHanaku", tP.F1 = "F1", tP.F2 = "F2", tP.F3 = "F3", tP.F4 = "F4", tP.F5 = "F5", tP.F6 = "F6", tP.F7 = "F7", tP.F8 = "F8", tP.F9 = "F9", tP.F10 = "F10", tP.F11 = "F11", tP.F12 = "F12", tP.F13 = "F13", tP.F14 = "F14", tP.F15 = "F15", tP.F16 = "F16", tP.F17 = "F17", tP.F18 = "F18", tP.F19 = "F19", tP.F20 = "F20", tP.Soft1 = "Soft1", tP.Soft2 = "Soft2", tP.Soft3 = "Soft3", tP.Soft4 = "Soft4", tP.AppSwitch = "AppSwitch", tP.Call = "Call", tP.Camera = "Camera", tP.CameraFocus = "CameraFocus", tP.EndCall = "EndCall", tP.GoBack = "GoBack", tP.GoHome = "GoHome", tP.HeadsetHook = "HeadsetHook", tP.LastNumberRedial = "LastNumberRedial", tP.Notification = "Notification", tP.MannerMode = "MannerMode", tP.VoiceDial = "VoiceDial", tP.ChannelDown = "ChannelDown", tP.ChannelUp = "ChannelUp", tP.MediaFastForward = "MediaFastForward", tP.MediaPause = "MediaPause", tP.MediaPlay = "MediaPlay", tP.MediaPlayPause = "MediaPlayPause", tP.MediaRecord = "MediaRecord", tP.MediaRewind = "MediaRewind", tP.MediaStop = "MediaStop", tP.MediaTrackNext = "MediaTrackNext", tP.MediaTrackPrevious = "MediaTrackPrevious", tP.AudioBalanceLeft = "AudioBalanceLeft", tP.AudioBalanceRight = "AudioBalanceRight", tP.AudioBassDown = "AudioBassDown", tP.AudioBassBoostDown = "AudioBassBoostDown", tP.AudioBassBoostToggle = "AudioBassBoostToggle", tP.AudioBassBoostUp = "AudioBassBoostUp", tP.AudioBassUp = "AudioBassUp", tP.AudioFaderFront = "AudioFaderFront", tP.AudioFaderRear = "AudioFaderRear", tP.AudioSurroundModeNext = "AudioSurroundModeNext", tP.AudioTrebleDown = "AudioTrebleDown", tP.AudioTrebleUp = "AudioTrebleUp", tP.AudioVolumeDown = "AudioVolumeDown", tP.AudioVolumeMute = "AudioVolumeMute", tP.AudioVolumeUp = "AudioVolumeUp", tP.MicrophoneToggle = "MicrophoneToggle", tP.MicrophoneVolumeDown = "MicrophoneVolumeDown", tP.MicrophoneVolumeMute = "MicrophoneVolumeMute", tP.MicrophoneVolumeUp = "MicrophoneVolumeUp", tP.TV = "TV", tP.TV3DMode = "TV3DMode", tP.TVAntennaCable = "TVAntennaCable", tP.TVAudioDescription = "TVAudioDescription", tP.TVAudioDescriptionMixDown = "TVAudioDescriptionMixDown", tP.TVAudioDescriptionMixUp = "TVAudioDescriptionMixUp", tP.TVContentsMenu = "TVContentsMenu", tP.TVDataService = "TVDataService", tP.TVInput = "TVInput", tP.TVInputComponent1 = "TVInputComponent1", tP.TVInputComponent2 = "TVInputComponent2", tP.TVInputComposite1 = "TVInputComposite1", tP.TVInputComposite2 = "TVInputComposite2", tP.TVInputHDMI1 = "TVInputHDMI1", tP.TVInputHDMI2 = "TVInputHDMI2", tP.TVInputHDMI3 = "TVInputHDMI3", tP.TVInputHDMI4 = "TVInputHDMI4", tP.TVInputVGA1 = "TVInputVGA1", tP.TVMediaContext = "TVMediaContext", tP.TVNetwork = "TVNetwork", tP.TVNumberEntry = "TVNumberEntry", tP.TVPower = "TVPower", tP.TVRadioService = "TVRadioService", tP.TVSatellite = "TVSatellite", tP.TVSatelliteBS = "TVSatelliteBS", tP.TVSatelliteCS = "TVSatelliteCS", tP.TVSatelliteToggle = "TVSatelliteToggle", tP.TVTerrestrialAnalog = "TVTerrestrialAnalog", tP.TVTerrestrialDigital = "TVTerrestrialDigital", tP.TVTimer = "TVTimer", tP.AVRInput = "AVRInput", tP.AVRPower = "AVRPower", tP.ColorF0Red = "ColorF0Red", tP.ColorF1Green = "ColorF1Green", tP.ColorF2Yellow = "ColorF2Yellow", tP.ColorF3Blue = "ColorF3Blue", tP.ColorF4Grey = "ColorF4Grey", tP.ColorF5Brown = "ColorF5Brown", tP.ClosedCaptionToggle = "ClosedCaptionToggle", tP.Dimmer = "Dimmer", tP.DisplaySwap = "DisplaySwap", tP.DVR = "DVR", tP.Exit = "Exit", tP.FavoriteClear0 = "FavoriteClear0", tP.FavoriteClear1 = "FavoriteClear1", tP.FavoriteClear2 = "FavoriteClear2", tP.FavoriteClear3 = "FavoriteClear3", tP.FavoriteRecall0 = "FavoriteRecall0", tP.FavoriteRecall1 = "FavoriteRecall1", tP.FavoriteRecall2 = "FavoriteRecall2", tP.FavoriteRecall3 = "FavoriteRecall3", tP.FavoriteStore0 = "FavoriteStore0", tP.FavoriteStore1 = "FavoriteStore1", tP.FavoriteStore2 = "FavoriteStore2", tP.FavoriteStore3 = "FavoriteStore3", tP.Guide = "Guide", tP.GuideNextDay = "GuideNextDay", tP.GuidePreviousDay = "GuidePreviousDay", tP.Info = "Info", tP.InstantReplay = "InstantReplay", tP.Link = "Link", tP.ListProgram = "ListProgram", tP.LiveContent = "LiveContent", tP.Lock = "Lock", tP.MediaApps = "MediaApps", tP.MediaAudioTrack = "MediaAudioTrack", tP.MediaLast = "MediaLast", tP.MediaSkipBackward = "MediaSkipBackward", tP.MediaSkipForward = "MediaSkipForward", tP.MediaStepBackward = "MediaStepBackward", tP.MediaStepForward = "MediaStepForward", tP.MediaTopMenu = "MediaTopMenu", tP.NavigateIn = "NavigateIn", tP.NavigateNext = "NavigateNext", tP.NavigateOut = "NavigateOut", tP.NavigatePrevious = "NavigatePrevious", tP.NextFavoriteChannel = "NextFavoriteChannel", tP.NextUserProfile = "NextUserProfile", tP.OnDemand = "OnDemand", tP.Pairing = "Pairing", tP.PinPDown = "PinPDown", tP.PinPMove = "PinPMove", tP.PinPToggle = "PinPToggle", tP.PinPUp = "PinPUp", tP.PlaySpeedDown = "PlaySpeedDown", tP.PlaySpeedReset = "PlaySpeedReset", tP.PlaySpeedUp = "PlaySpeedUp", tP.RandomToggle = "RandomToggle", tP.RcLowBattery = "RcLowBattery", tP.RecordSpeedNext = "RecordSpeedNext", tP.RfBypass = "RfBypass", tP.ScanChannelsToggle = "ScanChannelsToggle", tP.ScreenModeNext = "ScreenModeNext", tP.Settings = "Settings", tP.SplitScreenToggle = "SplitScreenToggle", tP.STBInput = "STBInput", tP.STBPower = "STBPower", tP.Subtitle = "Subtitle", tP.Teletext = "Teletext", tP.VideoModeNext = "VideoModeNext", tP.Wink = "Wink", tP.ZoomToggle = "ZoomToggle", tP.SpeechCorrectionList = "SpeechCorrectionList", tP.SpeechInputToggle = "SpeechInputToggle", tP.Close = "Close", tP.New = "New", tP.Open = "Open", tP.Print = "Print", tP.Save = "Save", tP.SpellCheck = "SpellCheck", tP.MailForward = "MailForward", tP.MailReply = "MailReply", tP.MailSend = "MailSend", tP.LaunchCalculator = "LaunchCalculator", tP.LaunchCalendar = "LaunchCalendar", tP.LaunchContacts = "LaunchContacts", tP.LaunchMail = "LaunchMail", tP.LaunchMediaPlayer = "LaunchMediaPlayer", tP.LaunchMusicPlayer = "LaunchMusicPlayer", tP.LaunchMyComputer = "LaunchMyComputer", tP.LaunchPhone = "LaunchPhone", tP.LaunchScreenSaver = "LaunchScreenSaver", tP.LaunchSpreadsheet = "LaunchSpreadsheet", tP.LaunchWebBrowser = "LaunchWebBrowser", tP.LaunchWebCam = "LaunchWebCam", tP.LaunchWordProcessor = "LaunchWordProcessor", tP.LaunchApplication1 = "LaunchApplication1", tP.LaunchApplication2 = "LaunchApplication2", tP.LaunchApplication3 = "LaunchApplication3", tP.LaunchApplication4 = "LaunchApplication4", tP.LaunchApplication5 = "LaunchApplication5", tP.LaunchApplication6 = "LaunchApplication6", tP.LaunchApplication7 = "LaunchApplication7", tP.LaunchApplication8 = "LaunchApplication8", tP.LaunchApplication9 = "LaunchApplication9", tP.LaunchApplication10 = "LaunchApplication10", tP.LaunchApplication11 = "LaunchApplication11", tP.LaunchApplication12 = "LaunchApplication12", tP.LaunchApplication13 = "LaunchApplication13", tP.LaunchApplication14 = "LaunchApplication14", tP.LaunchApplication15 = "LaunchApplication15", tP.LaunchApplication16 = "LaunchApplication16", tP.BrowserBack = "BrowserBack", tP.BrowserFavorites = "BrowserFavorites", tP.BrowserForward = "BrowserForward", tP.BrowserHome = "BrowserHome", tP.BrowserRefresh = "BrowserRefresh", tP.BrowserSearch = "BrowserSearch", tP.BrowserStop = "BrowserStop", tP.Decimal = "Decimal", tP.Key11 = "Key11", tP.Key12 = "Key12", tP.Multiply = "Multiply", tP.Add = "Add", tP.Divide = "Divide", tP.Subtract = "Subtract", tP.Separator = "Separator", (tE = eY || (eY = {}))[tE.ACCEPTED = 202] = "ACCEPTED", tE[tE.BAD_GATEWAY = 502] = "BAD_GATEWAY", tE[tE.BAD_REQUEST = 400] = "BAD_REQUEST", tE[tE.CONFLICT = 409] = "CONFLICT", tE[tE.CONTINUE = 100] = "CONTINUE", tE[tE.CREATED = 201] = "CREATED", tE[tE.EXPECTATION_FAILED = 417] = "EXPECTATION_FAILED", tE[tE.FAILED_DEPENDENCY = 424] = "FAILED_DEPENDENCY", tE[tE.FORBIDDEN = 403] = "FORBIDDEN", tE[tE.GATEWAY_TIMEOUT = 504] = "GATEWAY_TIMEOUT", tE[tE.GONE = 410] = "GONE", tE[tE.HTTP_VERSION_NOT_SUPPORTED = 505] = "HTTP_VERSION_NOT_SUPPORTED", tE[tE.IM_A_TEAPOT = 418] = "IM_A_TEAPOT", tE[tE.INSUFFICIENT_SPACE_ON_RESOURCE = 419] = "INSUFFICIENT_SPACE_ON_RESOURCE", tE[tE.INSUFFICIENT_STORAGE = 507] = "INSUFFICIENT_STORAGE", tE[tE.INTERNAL_SERVER_ERROR = 500] = "INTERNAL_SERVER_ERROR", tE[tE.LENGTH_REQUIRED = 411] = "LENGTH_REQUIRED", tE[tE.LOCKED = 423] = "LOCKED", tE[tE.METHOD_FAILURE = 420] = "METHOD_FAILURE", tE[tE.METHOD_NOT_ALLOWED = 405] = "METHOD_NOT_ALLOWED", tE[tE.MOVED_PERMANENTLY = 301] = "MOVED_PERMANENTLY", tE[tE.MOVED_TEMPORARILY = 302] = "MOVED_TEMPORARILY", tE[tE.MULTI_STATUS = 207] = "MULTI_STATUS", tE[tE.MULTIPLE_CHOICES = 300] = "MULTIPLE_CHOICES", tE[tE.NETWORK_AUTHENTICATION_REQUIRED = 511] = "NETWORK_AUTHENTICATION_REQUIRED", tE[tE.NO_CONTENT = 204] = "NO_CONTENT", tE[tE.NON_AUTHORITATIVE_INFORMATION = 203] = "NON_AUTHORITATIVE_INFORMATION", tE[tE.NOT_ACCEPTABLE = 406] = "NOT_ACCEPTABLE", tE[tE.NOT_FOUND = 404] = "NOT_FOUND", tE[tE.NOT_IMPLEMENTED = 501] = "NOT_IMPLEMENTED", tE[tE.NOT_MODIFIED = 304] = "NOT_MODIFIED", tE[tE.OK = 200] = "OK", tE[tE.PARTIAL_CONTENT = 206] = "PARTIAL_CONTENT", tE[tE.PAYMENT_REQUIRED = 402] = "PAYMENT_REQUIRED", tE[tE.PERMANENT_REDIRECT = 308] = "PERMANENT_REDIRECT", tE[tE.PRECONDITION_FAILED = 412] = "PRECONDITION_FAILED", tE[tE.PRECONDITION_REQUIRED = 428] = "PRECONDITION_REQUIRED", tE[tE.PROCESSING = 102] = "PROCESSING", tE[tE.PROXY_AUTHENTICATION_REQUIRED = 407] = "PROXY_AUTHENTICATION_REQUIRED", tE[tE.REQUEST_HEADER_FIELDS_TOO_LARGE = 431] = "REQUEST_HEADER_FIELDS_TOO_LARGE", tE[tE.REQUEST_TIMEOUT = 408] = "REQUEST_TIMEOUT", tE[tE.REQUEST_TOO_LONG = 413] = "REQUEST_TOO_LONG", tE[tE.REQUEST_URI_TOO_LONG = 414] = "REQUEST_URI_TOO_LONG", tE[tE.REQUESTED_RANGE_NOT_SATISFIABLE = 416] = "REQUESTED_RANGE_NOT_SATISFIABLE", tE[tE.RESET_CONTENT = 205] = "RESET_CONTENT", tE[tE.SEE_OTHER = 303] = "SEE_OTHER", tE[tE.SERVICE_UNAVAILABLE = 503] = "SERVICE_UNAVAILABLE", tE[tE.SWITCHING_PROTOCOLS = 101] = "SWITCHING_PROTOCOLS", tE[tE.TEMPORARY_REDIRECT = 307] = "TEMPORARY_REDIRECT", tE[tE.TOO_MANY_REQUESTS = 429] = "TOO_MANY_REQUESTS", tE[tE.UNAUTHORIZED = 401] = "UNAUTHORIZED", tE[tE.UNAVAILABLE_FOR_LEGAL_REASONS = 451] = "UNAVAILABLE_FOR_LEGAL_REASONS", tE[tE.UNPROCESSABLE_ENTITY = 422] = "UNPROCESSABLE_ENTITY", tE[tE.UNSUPPORTED_MEDIA_TYPE = 415] = "UNSUPPORTED_MEDIA_TYPE", tE[tE.USE_PROXY = 305] = "USE_PROXY", (tR = eZ || (eZ = {})).ACCEPTED = "Accepted", tR.BAD_GATEWAY = "Bad Gateway", tR.BAD_REQUEST = "Bad Request", tR.CONFLICT = "Conflict", tR.CONTINUE = "Continue", tR.CREATED = "Created", tR.EXPECTATION_FAILED = "Expectation Failed", tR.FAILED_DEPENDENCY = "Failed Dependency", tR.FORBIDDEN = "Forbidden", tR.GATEWAY_TIMEOUT = "Gateway Timeout", tR.GONE = "Gone", tR.HTTP_VERSION_NOT_SUPPORTED = "HTTP Version Not Supported", tR.IM_A_TEAPOT = "I'm a teapot", tR.INSUFFICIENT_SPACE_ON_RESOURCE = "Insufficient Space on Resource", tR.INSUFFICIENT_STORAGE = "Insufficient Storage", tR.INTERNAL_SERVER_ERROR = "Internal Server Error", tR.LENGTH_REQUIRED = "Length Required", tR.LOCKED = "Locked", tR.METHOD_FAILURE = "Method Failure", tR.METHOD_NOT_ALLOWED = "Method Not Allowed", tR.MOVED_PERMANENTLY = "Moved Permanently", tR.MOVED_TEMPORARILY = "Moved Temporarily", tR.MULTI_STATUS = "Multi-Status", tR.MULTIPLE_CHOICES = "Multiple Choices", tR.NETWORK_AUTHENTICATION_REQUIRED = "Network Authentication Required", tR.NO_CONTENT = "No Content", tR.NON_AUTHORITATIVE_INFORMATION = "Non Authoritative Information", tR.NOT_ACCEPTABLE = "Not Acceptable", tR.NOT_FOUND = "Not Found", tR.NOT_IMPLEMENTED = "Not Implemented", tR.NOT_MODIFIED = "Not Modified", tR.OK = "OK", tR.PARTIAL_CONTENT = "Partial Content", tR.PAYMENT_REQUIRED = "Payment Required", tR.PERMANENT_REDIRECT = "Permanent Redirect", tR.PRECONDITION_FAILED = "Precondition Failed", tR.PRECONDITION_REQUIRED = "Precondition Required", tR.PROCESSING = "Processing", tR.PROXY_AUTHENTICATION_REQUIRED = "Proxy Authentication Required", tR.REQUEST_HEADER_FIELDS_TOO_LARGE = "Request Header Fields Too Large", tR.REQUEST_TIMEOUT = "Request Timeout", tR.REQUEST_TOO_LONG = "Request Entity Too Large", tR.REQUEST_URI_TOO_LONG = "Request-URI Too Long", tR.REQUESTED_RANGE_NOT_SATISFIABLE = "Requested Range Not Satisfiable", tR.RESET_CONTENT = "Reset Content", tR.SEE_OTHER = "See Other", tR.SERVICE_UNAVAILABLE = "Service Unavailable", tR.SWITCHING_PROTOCOLS = "Switching Protocols", tR.TEMPORARY_REDIRECT = "Temporary Redirect", tR.TOO_MANY_REQUESTS = "Too Many Requests", tR.UNAUTHORIZED = "Unauthorized", tR.UNAVAILABLE_FOR_LEGAL_REASONS = "Unavailable For Legal Reasons", tR.UNPROCESSABLE_ENTITY = "Unprocessable Entity", tR.UNSUPPORTED_MEDIA_TYPE = "Unsupported Media Type", tR.USE_PROXY = "Use Proxy", (tO = eK || (eK = {})).CONNECT = "CONNECT", tO.DELETE = "DELETE", tO.GET = "GET", tO.HEAD = "HEAD", tO.OPTIONS = "OPTIONS", tO.PATCH = "PATCH", tO.POST = "POST", tO.PUT = "PUT", tO.TRACE = "TRACE", (tS = e$ || (e$ = {})).withPlus = "withPlus", tS.withoutPlus = "withoutPlus", (tI = eX || (eX = {})).processFailure = "processFailure", tI.unretriableFailure = "unretriableFailure", tI.maxAttemptsReached = "maxAttemptsReached";
    for (var e1 = function(e, t) {
            return function(n) {
                return Math.min(t, Math.pow(2, n - 1) * e)
            }
        }, e2 = function() {
            function e() {
                this.completeItems = new Map, this.requestQueue = [], this.runningBatchCount = 0
            }
            return e.prototype.handleBatchResult = function(e, t, n, r) {
                var o = this,
                    i = 0,
                    a = (new Date).getTime();
                t.forEach(function(e) {
                    if (o.completeItems.has(e.key)) e.resolve(o.completeItems.get(e.key));
                    else if (r.maxRetryAttempts && r.maxRetryAttempts > 0 && n !== eX.unretriableFailure) {
                        var t, u = (t = e.retryAttempts, r.getFailureCooldown ? r.getFailureCooldown(t) : 1e3);
                        i = i > 0 ? Math.min(i, u) : u, e.retryAttempts + 1 <= r.maxRetryAttempts ? (e.retryAttempts += 1, e.queueAfter = a + u, o.requestQueue.unshift(e)) : e.reject(eX.maxAttemptsReached)
                    } else e.reject(n)
                }), this.runningBatchCount -= 1, i > 0 ? setTimeout(function() {
                    return o.processQueue(e, r)
                }, i + r.processBatchWaitTime) : this.processQueue(e, r)
            }, e.prototype.processQueue = function(e, t) {
                var n, r = this;
                if (!(this.runningBatchCount >= t.maxConcurrentBatches)) {
                    for (var o = [], i = new Map, a = [], u = (new Date).getTime(); o.length < t.batchSize && this.requestQueue.length > 0;) {
                        var s = this.requestQueue.shift();
                        s && (s.queueAfter > u ? (i.set(s.key, s), a.push(s)) : this.completeItems.has(s.key) ? s.resolve(this.completeItems.get(s.key)) : i.has(s.key) ? a.push(s) : (i.set(s.key, s), o.push(s)))
                    }(n = this.requestQueue).push.apply(n, a), o.length <= 0 || (this.runningBatchCount += 1, e(o).then(function(n) {
                        Object.keys(n).forEach(function(e) {
                            r.saveCompleteItem(e, n[e], t)
                        }), r.handleBatchResult(e, o, eX.processFailure, t)
                    }, function(n) {
                        r.handleBatchResult(e, o, n, t)
                    }))
                }
            }, e.prototype.saveCompleteItem = function(e, t, n) {
                var r = this;
                this.completeItems.set(e, t), n.getItemExpiration && setTimeout(function() {
                    r.completeItems.delete(e)
                }, n.getItemExpiration(e))
            }, e.prototype.queueItem = function(e, t, n, r) {
                var o = this;
                return new Promise(function(i, a) {
                    o.requestQueue.push({
                        key: n(e),
                        itemId: e,
                        retryAttempts: 0,
                        queueAfter: 0,
                        startTime: new Date,
                        resolve: i,
                        reject: a
                    }), setTimeout(function() {
                        return o.processQueue(t, r)
                    }, r.processBatchWaitTime)
                })
            }, e.prototype.invalidateItem = function(e, t) {
                this.completeItems.delete(t(e))
            }, e
        }(), e4 = function() {
            function e() {
                this.createExponentialBackoffCooldown = e1, this.createQueueProcessor = function(e, t, n) {
                    var r = new e2;
                    return {
                        queueItem: function(o) {
                            return r.queueItem(o, e, t, n)
                        },
                        invalidateItem: function(e) {
                            return r.invalidateItem(e, t)
                        }
                    }
                }
            }
            return e.prototype.createRequestProcessor = function(e, t, n) {
                var r = e0({
                    processBatchWaitTime: 250,
                    maxConcurrentBatches: 5
                }, n);
                return this.createQueueProcessor(e, t, r)
            }, e
        }(), e3 = [], e5 = 0; e5 < 256; ++e5) e3.push((e5 + 256).toString(16).substr(1));
    var e6 = "RelativeTimeFormat" in Intl,
        e7 = ["lookup", "best fit"],
        e8 = ["long", "short", "narrow"],
        e9 = ["always", "auto"],
        te = ["second", "minute", "hour", "day", "week", "month", "quarter", "year"];

    function tt(e) {
        if (null == e) throw TypeError("Argument ".concat(e, " cannot be converted to an Object"));
        return "boolean" == typeof e ? new Boolean(e) : "number" == typeof e ? new Number(e) : "string" == typeof e ? new String(e) : "symbol" == (void 0 === e ? "undefined" : S(e)) ? Object(e) : e
    }
    var tn = /-u(?:-[0-9a-z]{2,8})+/gi;

    function tr(e) {
        return e.replace(tn, "")
    }

    function to(e, t) {
        for (var n = t;;) {
            if (e.includes(n)) return n;
            var r = n.lastIndexOf("-");
            if (-1 === r) return;
            r >= 2 && "-" === n.charAt(r - 2) && (r -= 2), n = n.slice(0, r)
        }
    }

    function ti(e) {
        return "[object Object]" === Object.prototype.toString.call(e)
    }

    function ta(e, t, n, r, o) {
        var i = function(e, t) {
            if ("object" != (void 0 === e ? "undefined" : S(e))) throw TypeError("Given argument ".concat(e, " must be of type Object"));
            if ("string" != typeof t && "symbol" != (void 0 === t ? "undefined" : S(t))) throw TypeError("Given argument ".concat(t, " must be a PropertyKey"));
            return e[t]
        }(e, t);
        if (void 0 !== i) {
            if ("boolean" !== n && "string" !== n) throw TypeError("Expected type ".concat(n, " to be 'boolean' or 'string"));
            if ("boolean" === n && (i = !!i), "string" === n && (i += ""), void 0 !== r && !r.includes(i)) throw RangeError("Value ".concat(i, " out of range for options property ").concat(t));
            return i
        }
        return o
    }
    var tu = new WeakMap,
        ts = ["nu"],
        tl = {},
        tc = [];

    function td(e, t, n) {
        var r = tu.get(e);
        null == r && (r = Object.create(null), tu.set(e, r)), r[t] = n
    }

    function tp(e, t) {
        var n = tu.get(e);
        if (null == n) throw ReferenceError("No internal slots has been allocated for the given instance of RelativeTimeFormat");
        return n[t]
    }

    function tf(e, t) {
        var n = tu.get(e);
        return null != n && t in n
    }

    function tv(e, t, n) {
        if (!tf(e, "initializedRelativeTimeFormat")) throw TypeError("Internal function called on incompatible receiver ".concat(e.toString()));
        if ("number" != typeof t) throw TypeError("Argument: 'value' must be a number");
        if ("string" != typeof n) throw TypeError("Argument: 'unit' must be a string");
        if (isNaN(t) || t === 1 / 0 || t === -1 / 0) throw RangeError("Value need to be finite number");
        n = function(e) {
            if ("string" != typeof e) throw TypeError("unit: '".concat(e, "' must be a string"));
            if ("seconds" === e) return "second";
            if ("minutes" === e) return "minute";
            if ("hours" === e) return "hour";
            if ("days" === e) return "day";
            if ("weeks" === e) return "week";
            if ("months" === e) return "month";
            if ("quarters" === e) return "quarter";
            if ("years" === e) return "year";
            if (!te.some(function(t) {
                    return t === e
                })) throw RangeError("Unit: '".concat(e, "' must be one of: ").concat(te.map(function(e) {
                return '"'.concat(e, '"')
            }).join(", ")));
            return e
        }(n);
        var r = tp(e, "fields"),
            o = tp(e, "style"),
            i = "short" === o ? "".concat(n, "-short") : "narrow" === o ? "".concat(n, "-narrow") : n,
            a = i in r;
        a || (i = n);
        var u = r[i];
        if (null == u) throw TypeError("Could not match entry: '".concat(i, "' inside fields for locale: '").concat(tp(e, "locale"), "'"));
        if ("auto" === tp(e, "numeric") && (a = t + "" in u)) return [{
            type: "literal",
            value: u[t + ""]
        }];
        var s = u[Object.is(t, -0) || t < 0 ? "past" : "future"],
            l = tp(e, "numberFormat").formatToParts(Math.abs(t));
        return function(e, t, n) {
            for (var r = [], o = String.prototype.indexOf.call(e, "{", 0), i = 0, a = 0, u = e.length; void 0 !== e[o];) {
                if (-1 === (i = String.prototype.indexOf.call(e, "}", o))) throw RangeError("The pattern: '".concat(e, "' is malformed"));
                if (o > a) {
                    var s = e.slice(a, o);
                    r.push({
                        type: "literal",
                        value: s
                    })
                }
                var l = e.slice(o + 1, i);
                if ("0" !== l) throw TypeError("Expected ".concat(l, ' to be "0"'));
                var c = !0,
                    d = !1,
                    p = void 0;
                try {
                    for (var f, v = n[Symbol.iterator](); !(c = (f = v.next()).done); c = !0) {
                        var h = f.value;
                        "literal" === h.type ? r.push(O(R({}, h), {
                            type: h.type
                        })) : r.push(O(R({}, h), {
                            unit: t
                        }))
                    }
                } catch (e) {
                    d = !0, p = e
                } finally {
                    try {
                        c || null == v.return || v.return()
                    } finally {
                        if (d) throw p
                    }
                }
                a = i + 1, o = String.prototype.indexOf.call(e, "{", a)
            }
            if (a < u) {
                var y = e.slice(a, u);
                r.push({
                    type: "literal",
                    value: y
                })
            }
            return r
        }(s[function(e, t) {
            if (!tf(e, "pluralRules")) throw TypeError("Given instance of of Intl.RelativeTimeFormat must have an [[InitializedPluralRules]] internal slot");
            if ("number" != typeof t) throw TypeError("Argument 'n' must be a number");
            return isFinite(t) ? tp(e, "pluralRules").select(t) : "other"
        }(e, t)], n, l)
    }
    var th = function() {
        function e() {
            w(this, e);
            var t = arguments[0],
                n = arguments[1];
            if (void 0 === (T(this, e) ? this.constructor : void 0)) throw TypeError("Constructor Intl.RelativeTimeFormat requires 'new'");
            var r = Intl.getCanonicalLocales(t);
            n = void 0 === n ? Object.create(null) : tt(n);
            var o = Object.create(null);
            o.localeMatcher = ta(n, "localeMatcher", "string", e7, "best fit");
            var i = function(e, t, n, r, o) {
                    var i = (n.localeMatcher, function(e) {
                            var t = e.availableLocales,
                                n = e.requestedLocales,
                                r = {},
                                o = !0,
                                i = !1,
                                a = void 0;
                            try {
                                for (var u, s = n[Symbol.iterator](); !(o = (u = s.next()).done); o = !0) {
                                    var l = u.value,
                                        c = tr(l),
                                        d = to(t, c);
                                    if (void 0 !== d) {
                                        if (r.locale = d, l !== c) {
                                            var p = l.match(tn);
                                            r.extension = null == p ? "" : p[0]
                                        }
                                        return r
                                    }
                                }
                            } catch (e) {
                                i = !0, a = e
                            } finally {
                                try {
                                    o || null == s.return || s.return()
                                } finally {
                                    if (i) throw a
                                }
                            }
                            return r.locale = function() {
                                if (null == tA) throw ReferenceError("Could not determine locale: No default locale has been configured");
                                return tA
                            }(), r
                        }({
                            availableLocales: e,
                            requestedLocales: t
                        })),
                        a = i.locale,
                        u = {};
                    u.dataLocale = a;
                    var s = "-u",
                        l = !0,
                        c = !1,
                        d = void 0;
                    try {
                        for (var p, f = r[Symbol.iterator](); !(l = (p = f.next()).done); l = !0) {
                            var v = p.value,
                                h = o[a];
                            if (!ti(h)) throw TypeError("LocaleData for locale: '".concat(a, "' must be an object"));
                            var y = h[v];
                            if (!Array.isArray(y) && !ti(y)) throw TypeError("key: '".concat(v, "' in LocaleData for locale: '").concat(a, "' must be indexable"));
                            var m = y[0];
                            if ("string" != typeof m && null !== m) throw TypeError("value: '".concat(m, "' for key: '").concat(v, "' in LocaleData for locale: '").concat(a, "' must be a string or null"));
                            var b = "";
                            if ("extension" in i) {
                                var T = function(e, t) {
                                    if (2 !== t.length) throw TypeError("Could not get UnicodeExtensionValue: The given key: '".concat(t, "' must have a length of 2"));
                                    var n = t.length,
                                        r = "-".concat(t, "-"),
                                        o = String.prototype.indexOf.call(e, r);
                                    if (-1 !== o) {
                                        for (var i = o + 4, a = i, u = i, s = !1; !s;) {
                                            var l = String.prototype.indexOf.call(e, "-", u);
                                            2 == (-1 === l ? n - u : l - u) ? s = !0 : -1 === l ? (a = n, s = !0) : (a = l, u = l + 1)
                                        }
                                        return e.slice(i, a)
                                    }
                                    if (r = "-".concat(t), -1 !== (o = String.prototype.indexOf.call(e, r)) && o + 3 === n) return ""
                                }(i.extension, v);
                                void 0 !== T && ("" !== T ? y.includes(T) && (m = T, b = "-".concat(v, "-").concat(m)) : y.includes("true") && (m = "true"))
                            }
                            if ("key" in n) {
                                var w, g = n.key;
                                if ("string" != typeof g && null != g) throw TypeError("options value: '".concat(g, "' must be a string, undefined, or null"));
                                void 0 !== g && y.includes(g) && (w = m, (void 0 === g ? "undefined" : S(g)) == (void 0 === w ? "undefined" : S(w)) && ("number" == typeof g ? !(!isNaN(g) || !isNaN(w)) || (!Object.is(g, 0) || !Object.is(w, -0)) && g === w : function(e, t) {
                                    if ("number" == typeof e) throw TypeError("First argument 'x' must not be a number");
                                    if ((void 0 === e ? "undefined" : S(e)) != (void 0 === t ? "undefined" : S(t))) throw TypeError("The given arguments must have the same type");
                                    return null == e || ("string" == typeof e || "boolean" == typeof e ? e === t : "symbol" == (void 0 === e ? "undefined" : S(e)) ? e.valueOf() === t.valueOf() : e === t)
                                }(g, w)) || (m = g, b = ""))
                            }
                            u[v] = m, s += b
                        }
                    } catch (e) {
                        c = !0, d = e
                    } finally {
                        try {
                            l || null == f.return || f.return()
                        } finally {
                            if (c) throw d
                        }
                    }
                    if (s.length > 2) {
                        var P = String.prototype.indexOf.call(a, "-x-");
                        if (-1 === P) a = "".concat(a).concat(s);
                        else {
                            var E = a.slice(0, P),
                                R = a.slice(P);
                            a = "".concat(E).concat(s).concat(R)
                        }
                        a = Intl.getCanonicalLocales(a)[0]
                    }
                    return u.locale = a, u
                }(tc, r, o, ts, tl),
                a = i.locale;
            td(this, "locale", a), td(this, "numberingSystem", i.nu);
            var u = i.dataLocale;
            td(this, "style", ta(n, "style", "string", e8, "long")), td(this, "numeric", ta(n, "numeric", "string", e9, "always"));
            var s = tl[u];
            if (!T(s, Object)) throw TypeError("Expected the LocaleDataEntry for locale: '".concat(u, "' to be an Object"));
            td(this, "fields", s), td(this, "numberFormat", new Intl.NumberFormat(a)), td(this, "pluralRules", new Intl.PluralRules(a)), td(this, "initializedRelativeTimeFormat", this)
        }
        return P(e, [{
            key: "format",
            value: function(e, t) {
                if (!T(this, Object) || !tf(this, "initializedRelativeTimeFormat")) throw TypeError("Method Intl.RelativeTimeFormat.prototype.format called on incompatible receiver ".concat(this.toString()));
                return function(e, t, n) {
                    var r = tv(e, t, n),
                        o = "",
                        i = !0,
                        a = !1,
                        u = void 0;
                    try {
                        for (var s, l = r[Symbol.iterator](); !(i = (s = l.next()).done); i = !0) {
                            var c = s.value;
                            o += c.value
                        }
                    } catch (e) {
                        a = !0, u = e
                    } finally {
                        try {
                            i || null == l.return || l.return()
                        } finally {
                            if (a) throw u
                        }
                    }
                    return o
                }(this, e = Number(e), t += "")
            }
        }, {
            key: "formatToParts",
            value: function(e, t) {
                if (!T(this, Object) || !tf(this, "initializedRelativeTimeFormat")) throw TypeError("Method Intl.RelativeTimeFormat.prototype.formatToParts called on incompatible receiver ".concat(this.toString()));
                return tv(this, e = Number(e), t += "")
            }
        }, {
            key: "resolvedOptions",
            value: function() {
                if (!T(this, Object) || !tf(this, "initializedRelativeTimeFormat")) throw TypeError("Method Intl.RelativeTimeFormat.prototype.resolvedOptions called on incompatible receiver ".concat(this.toString()));
                return {
                    locale: tp(this, "locale"),
                    style: tp(this, "style"),
                    numeric: tp(this, "numeric"),
                    numberingSystem: tp(this, "numberingSystem")
                }
            }
        }], [{
            key: "supportedLocalesOf",
            value: function(e) {
                var t, n, r = arguments[1];
                return t = Intl.getCanonicalLocales(e), void 0 !== (n = r) && ta(n = tt(n), "localeMatcher", "string", e7, "best fit"),
                    function(e, t) {
                        var n = [],
                            r = !0,
                            o = !1,
                            i = void 0;
                        try {
                            for (var a, u = t[Symbol.iterator](); !(r = (a = u.next()).done); r = !0) {
                                var s = a.value;
                                void 0 !== to(e, tr(s)) && n.push(s)
                            }
                        } catch (e) {
                            o = !0, i = e
                        } finally {
                            try {
                                r || null == u.return || u.return()
                            } finally {
                                if (o) throw i
                            }
                        }
                        return n
                    }(tc, t)
            }
        }, {
            key: "__addLocaleData",
            value: function(e) {
                var t = e.data,
                    n = e.locale;
                null == tA && (tA = n), tl[n] = t, tc.includes(n) || tc.push(n)
            }
        }]), e
    }();
    Object.defineProperty(th.prototype, Symbol.toStringTag, {
        writable: !1,
        enumerable: !1,
        value: "Intl.RelativeTimeFormat",
        configurable: !0
    }), e6 || function() {
        if ("u" < typeof Intl) throw TypeError("Could not define Intl.RelativeTimeFormat: Expected 'Intl' to exist. Remember to include polyfills for Intl.NumberFormat, Intl.getCanonicalLocales, and Intl.PluralRules before applying this polyfill");
        Intl.RelativeTimeFormat = th
    }();
    var ty = Object.freeze({
        __proto__: null
    });
    "__addLocaleData" in Intl.RelativeTimeFormat && Intl.RelativeTimeFormat.__addLocaleData({
        locale: "en",
        data: {
            year: {
                0: "this year",
                1: "next year",
                "-1": "last year",
                future: {
                    one: "in {0} year",
                    other: "in {0} years"
                },
                past: {
                    one: "{0} year ago",
                    other: "{0} years ago"
                }
            },
            "year-short": {
                0: "this yr.",
                1: "next yr.",
                "-1": "last yr.",
                future: {
                    one: "in {0} yr.",
                    other: "in {0} yr."
                },
                past: {
                    one: "{0} yr. ago",
                    other: "{0} yr. ago"
                }
            },
            quarter: {
                0: "this quarter",
                1: "next quarter",
                "-1": "last quarter",
                future: {
                    one: "in {0} quarter",
                    other: "in {0} quarters"
                },
                past: {
                    one: "{0} quarter ago",
                    other: "{0} quarters ago"
                }
            },
            "quarter-short": {
                0: "this qtr.",
                1: "next qtr.",
                "-1": "last qtr.",
                future: {
                    one: "in {0} qtr.",
                    other: "in {0} qtrs."
                },
                past: {
                    one: "{0} qtr. ago",
                    other: "{0} qtrs. ago"
                }
            },
            month: {
                0: "this month",
                1: "next month",
                "-1": "last month",
                future: {
                    one: "in {0} month",
                    other: "in {0} months"
                },
                past: {
                    one: "{0} month ago",
                    other: "{0} months ago"
                }
            },
            "month-short": {
                0: "this mo.",
                1: "next mo.",
                "-1": "last mo.",
                future: {
                    one: "in {0} mo.",
                    other: "in {0} mo."
                },
                past: {
                    one: "{0} mo. ago",
                    other: "{0} mo. ago"
                }
            },
            week: {
                0: "this week",
                1: "next week",
                "-1": "last week",
                future: {
                    one: "in {0} week",
                    other: "in {0} weeks"
                },
                past: {
                    one: "{0} week ago",
                    other: "{0} weeks ago"
                }
            },
            "week-short": {
                0: "this wk.",
                1: "next wk.",
                "-1": "last wk.",
                future: {
                    one: "in {0} wk.",
                    other: "in {0} wk."
                },
                past: {
                    one: "{0} wk. ago",
                    other: "{0} wk. ago"
                }
            },
            day: {
                0: "today",
                1: "tomorrow",
                "-1": "yesterday",
                future: {
                    one: "in {0} day",
                    other: "in {0} days"
                },
                past: {
                    one: "{0} day ago",
                    other: "{0} days ago"
                }
            },
            "day-short": {
                future: {
                    one: "in {0} day",
                    other: "in {0} days"
                },
                past: {
                    one: "{0} day ago",
                    other: "{0} days ago"
                }
            },
            hour: {
                0: "this hour",
                future: {
                    one: "in {0} hour",
                    other: "in {0} hours"
                },
                past: {
                    one: "{0} hour ago",
                    other: "{0} hours ago"
                }
            },
            "hour-short": {
                future: {
                    one: "in {0} hr.",
                    other: "in {0} hr."
                },
                past: {
                    one: "{0} hr. ago",
                    other: "{0} hr. ago"
                }
            },
            minute: {
                0: "this minute",
                future: {
                    one: "in {0} minute",
                    other: "in {0} minutes"
                },
                past: {
                    one: "{0} minute ago",
                    other: "{0} minutes ago"
                }
            },
            "minute-short": {
                future: {
                    one: "in {0} min.",
                    other: "in {0} min."
                },
                past: {
                    one: "{0} min. ago",
                    other: "{0} min. ago"
                }
            },
            second: {
                0: "now",
                future: {
                    one: "in {0} second",
                    other: "in {0} seconds"
                },
                past: {
                    one: "{0} second ago",
                    other: "{0} seconds ago"
                }
            },
            "second-short": {
                0: "now",
                future: {
                    one: "in {0} sec.",
                    other: "in {0} sec."
                },
                past: {
                    one: "{0} sec. ago",
                    other: "{0} sec. ago"
                }
            },
            nu: ["latn"]
        }
    });
    var tm, tb, tT, tw, tg, tP, tE, tR, tO, tS, tI, tA, tN, t_, tM, tC, tL = Object.freeze({
            __proto__: null
        }),
        tx = new eF.v1.PresenceApi(new ei({
            basePath: null != (tM = null == (t_ = null == (tN = window.Roblox) ? void 0 : tN.EnvironmentUrls) ? void 0 : t_.presenceApi) ? tM : "https://presence.roblox.com",
            credentials: "include"
        }));
    (o = tC || (tC = {})).WebFriends = "webFriends", o.WebGroups = "webGroups", o.WebNavigation = "webNavigation", o.WebPlayerSearch = "webPlayerSearch", o.WebProfile = "webProfile";
    var tU = tC,
        tF = "PresenceData",
        tD = function(e) {
            var t, n, r;
            return {
                userId: null != (t = null == e ? void 0 : e.userId) ? t : 0,
                userPresenceType: ek.presenceStatusResponseToPresenceStatus[null != (n = null == e ? void 0 : e.userPresenceType) ? n : 0],
                lastLocation: null != (r = null == e ? void 0 : e.lastLocation) ? r : "Website",
                placeId: null == e ? void 0 : e.placeId,
                rootPlaceId: null == e ? void 0 : e.rootPlaceId,
                gameId: null == e ? void 0 : e.gameId,
                universeId: null == e ? void 0 : e.universeId,
                lastOnline: null == e ? void 0 : e.lastOnline,
                invisibleModeExpiry: null == e ? void 0 : e.invisibleModeExpiry
            }
        };

    function tk() {
        var e, t = null == (e = window.localStorage) ? void 0 : e.getItem(tF),
            n = Object.entries(t ? JSON.parse(t) : {}),
            r = new Map;
        return n.forEach(function(e) {
            r.set(Number.parseInt(e[0], 10), e[1])
        }), r
    }

    function tB(e) {
        var t, n, r = tk();
        e.forEach(function(e) {
            var t, n;
            if (e && e.userId) {
                var o = r.get(null == e ? void 0 : e.userId);
                o && o.data.userPresenceType === e.userPresenceType || null == (n = null == (t = window.Roblox) ? void 0 : t.EventStream) || n.SendEventWithTarget("PresenceImpression", "PresenceImpression", {
                    clientTimestampMilliseconds: Date.now(),
                    observedUserId: e.userId,
                    presenceType: e.userPresenceType.toString(),
                    placeId: e.placeId,
                    universeId: e.universeId,
                    gameId: e.gameId,
                    lastLocation: e.lastLocation,
                    implementationVariant: "Web"
                }, 1), r.set(null == e ? void 0 : e.userId, {
                    data: e,
                    lastUpdated: Date.now()
                })
            }
        }), r.forEach(function(e, t, n) {
            Date.now() - e.lastUpdated > 18e5 && r.delete(t)
        });
        try {
            null == (t = window.localStorage) || t.setItem(tF, JSON.stringify(Object.fromEntries(r)))
        } catch (e) {
            null == (n = window.localStorage) || n.removeItem(tF)
        }
    }
    var tj = {
            fetchUserPresences: function(e) {
                return eB(this, arguments, void 0, function(e, t) {
                    var n, r, o, i, a, u, s, l, c, d, p, f, v;
                    return void 0 === t && (t = !1), ej(this, function(h) {
                        switch (h.label) {
                            case 0:
                                var y;
                                return (null == (f = null == (p = window.Roblox) ? void 0 : p.CurrentUser) ? void 0 : f.isAuthenticated) ? (r = [], o = [], t || (y = tk(), o = (r = e.map(function(e) {
                                    return y.get(e)
                                }).filter(function(e) {
                                    return e && Date.now() - e.lastUpdated < 3e4
                                }).map(function(e) {
                                    return null == e ? void 0 : e.data
                                })).map(function(e) {
                                    return null == e ? void 0 : e.userId
                                })), (i = e.filter(function(e) {
                                    return !o.includes(e)
                                })).length > 0 ? [4, function(e) {
                                    return eB(this, void 0, void 0, function() {
                                        var t, n;
                                        return ej(this, function(r) {
                                            switch (r.label) {
                                                case 0:
                                                    return r.trys.push([0, 2, , 3]), [4, tx.v1PresenceUsersPost({
                                                        userPresenceRequest: {
                                                            userIds: e
                                                        }
                                                    })];
                                                case 1:
                                                    return (t = (null != (n = r.sent().userPresences) ? n : []).map(tD)).forEach(function(e) {
                                                        var t, n, r, o, i, a;
                                                        Number.parseInt(null != (r = null == (n = null == (t = window.Roblox) ? void 0 : t.CurrentUser) ? void 0 : n.userId) ? r : "-1", 10) === e.userId && e.userPresenceType === M.Invisible && (null == (i = null == (o = window.Roblox) ? void 0 : o.EventStream) || i.SendEventWithTarget("invisibleModeFeedback", "invisibleModeFeedback", {
                                                            surface: (a = window.location.href).includes("/profile") ? tU.WebProfile : a.includes("/search/users") ? tU.WebPlayerSearch : a.includes("/users/friends") ? tU.WebFriends : a.includes("/groups") ? tU.WebGroups : tU.WebNavigation
                                                        }, 1))
                                                    }), [2, t];
                                                case 2:
                                                    return console.error(r.sent()), [3, 3];
                                                case 3:
                                                    return [2, []]
                                            }
                                        })
                                    })
                                }(i)] : [3, 2]) : (n = new Map, e.forEach(function(e) {
                                    n.set(e, {
                                        userId: e,
                                        userPresenceType: M.Offline,
                                        lastLocation: "Website"
                                    })
                                }), [2, n]);
                            case 1:
                                return u = null != (v = h.sent()) ? v : [], [3, 3];
                            case 2:
                                u = [], h.label = 3;
                            case 3:
                                return a = u, s = eq(eq([], r, !0), a, !0), l = new Map, s.forEach(function(e) {
                                    e && e.userId && l.set(e.userId, e)
                                }), tB(a), c = e.map(function(e) {
                                    return l.get(e)
                                }).filter(function(e) {
                                    return null != e
                                }), d = new Map, c.forEach(function(e) {
                                    var t;
                                    return d.set(null != (t = e.userId) ? t : -1, e)
                                }), [2, d]
                        }
                    })
                })
            },
            invalidateUserPresence: function(e) {
                tB([e])
            }
        },
        tq = (new e4).createRequestProcessor(function(e) {
            return eB(void 0, void 0, void 0, function() {
                var t, n;
                return ej(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, tj.fetchUserPresences(e.map(function(e) {
                                return e.itemId
                            }))];
                        case 1:
                            return t = r.sent(), n = {}, e.forEach(function(e) {
                                t.has(e.itemId) && (n[e.key] = t.get(e.itemId), e.resolve(t.get(e.itemId)))
                            }), [2, n]
                    }
                })
            })
        }, function(e) {
            return e.toString()
        }, {
            getFailureCooldown: function(e) {
                return 100 * e
            },
            maxRetryAttempts: 3,
            batchSize: 100,
            processBatchWaitTime: 10,
            getItemExpiration: function() {
                return 0
            }
        }),
        tV = new Map,
        tz = {
            subscribeToPresenceChanges: function(e, t, n) {
                e.forEach(function(e) {
                    var r;
                    tV.has(e) || tV.set(e, []), null == (r = tV.get(e)) || r.push(t), n && tq.queueItem(e).then(t)
                })
            },
            getPresences: function(e) {
                return Promise.all(e.map(function(e) {
                    return tq.queueItem(e)
                }))
            },
            refetchPresences: function(e) {
                return eB(this, void 0, void 0, function() {
                    var t;
                    return ej(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, tj.fetchUserPresences(e, !0)];
                            case 1:
                                return (t = n.sent()).forEach(function(e, t, n) {
                                    var r;
                                    null == (r = tV.get(e.userId)) || r.forEach(function(t) {
                                        return t(e)
                                    })
                                }), [2, t]
                        }
                    })
                })
            },
            initializeEventListener: function() {
                document.addEventListener("Roblox.Presence.Update", function(e) {
                    e && e.detail && e.detail.forEach(function(e) {
                        var t;
                        tj.invalidateUserPresence(e), e.userId && tV.has(e.userId) && (null == (t = tV.get(e.userId)) || t.forEach(function(t) {
                            return t(e)
                        }))
                    })
                })
            },
            clearPresenceSubscriptions: function() {
                tV = new Map
            }
        };
    window.Roblox = window.Roblox || {}, window.Roblox.Presence = window.Roblox.Presence || {}, void 0 === (null == (a = null == (i = window.Roblox) ? void 0 : i.Presence) ? void 0 : a.presenceProvider) && (window.Roblox.Presence.presenceProvider = tz, tz.initializeEventListener());
    var tG = function() {
        return window.Roblox.Presence.presenceProvider
    };

    function tH(e, t) {
        var n = (0, I.useState)(null != t ? t : {
                userId: null != e ? e : 0,
                lastLocation: "Website",
                userPresenceType: 0
            }),
            r = n[0],
            o = n[1];
        return (0, I.useEffect)(function() {
            void 0 !== e && tG().subscribeToPresenceChanges([e], o, void 0 === t)
        }, [t, e]), r
    }
    var tJ = window.Roblox["core-scripts"].realtime,
        tW = p.n(tJ),
        tQ = window.Roblox["core-scripts"].meta.user;

    function tY(e, t, n, r, o, i, a) {
        try {
            var u = e[i](a),
                s = u.value
        } catch (e) {
            n(e);
            return
        }
        u.done ? t(s) : Promise.resolve(s).then(r, o)
    }

    function tZ(e) {
        return function() {
            var t = this,
                n = arguments;
            return new Promise(function(r, o) {
                var i = e.apply(t, n);

                function a(e) {
                    tY(i, r, o, a, u, "next", e)
                }

                function u(e) {
                    tY(i, r, o, a, u, "throw", e)
                }
                a(void 0)
            })
        }
    }

    function tK(e, t) {
        return function(e) {
            if (Array.isArray(e)) return e
        }(e) || function(e, t) {
            var n, r, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
            if (null != o) {
                var i = [],
                    a = !0,
                    u = !1;
                try {
                    for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), !t || i.length !== t); a = !0);
                } catch (e) {
                    u = !0, r = e
                } finally {
                    try {
                        a || null == o.return || o.return()
                    } finally {
                        if (u) throw r
                    }
                }
                return i
            }
        }(e, t) || v(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }

    function t$(e, t) {
        var n, r, o, i = {
                label: 0,
                sent: function() {
                    if (1 & o[0]) throw o[1];
                    return o[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
            u = Object.defineProperty;
        return u(a, "next", {
            value: s(0)
        }), u(a, "throw", {
            value: s(1)
        }), u(a, "return", {
            value: s(2)
        }), "function" == typeof Symbol && u(a, Symbol.iterator, {
            value: function() {
                return this
            }
        }), a;

        function s(u) {
            return function(s) {
                var l = [u, s];
                if (n) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, l[0] && (i = 0)), i;) try {
                    if (n = 1, r && (o = 2 & l[0] ? r.return : l[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, l[1])).done) return o;
                    switch (r = 0, o && (l = [2 & l[0], o.value]), l[0]) {
                        case 0:
                        case 1:
                            o = l;
                            break;
                        case 4:
                            return i.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            i.label++, r = l[1], l = [0];
                            continue;
                        case 7:
                            l = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === l[0] && (!o || l[1] > o[0] && l[1] < o[3])) {
                                i.label = l[1];
                                break
                            }
                            if (6 === l[0] && i.label < o[1]) {
                                i.label = o[1], o = l;
                                break
                            }
                            if (o && i.label < o[2]) {
                                i.label = o[2], i.ops.push(l);
                                break
                            }
                            o[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    l = t.call(e, i)
                } catch (e) {
                    l = [6, e], r = 0
                } finally {
                    n = o = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function tX(e) {
        return (tX = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
            return e.__proto__ || Object.getPrototypeOf(e)
        })(e)
    }

    function t0() {
        try {
            var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
        } catch (e) {}
        return (t0 = function() {
            return !!e
        })()
    }

    function t1(e, t, n) {
        t = tX(t);
        var r = t0() ? Reflect.construct(t, n || [], tX(e).constructor) : t.apply(e, n);
        if (r && ("object" === S(r) || "function" == typeof r)) return r;
        if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
        return e
    }

    function t2(e, t) {
        return (t2 = Object.setPrototypeOf || function(e, t) {
            return e.__proto__ = t, e
        })(e, t)
    }

    function t4(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
        e.prototype = Object.create(t && t.prototype, {
            constructor: {
                value: e,
                writable: !0,
                configurable: !0
            }
        }), t && t2(e, t)
    }

    function t3(e, t, n) {
        return (t3 = t0() ? Reflect.construct : function(e, t, n) {
            var r = [null];
            r.push.apply(r, t);
            var o = new(Function.bind.apply(e, r));
            return n && t2(o, n.prototype), o
        }).apply(null, arguments)
    }

    function t5(e) {
        var t = "function" == typeof Map ? new Map : void 0;
        return (t5 = function(e) {
            if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
            if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
            if (void 0 !== t) {
                if (t.has(e)) return t.get(e);
                t.set(e, n)
            }

            function n() {
                return t3(e, arguments, tX(this).constructor)
            }
            return n.prototype = Object.create(e.prototype, {
                constructor: {
                    value: n,
                    enumerable: !1,
                    writable: !0,
                    configurable: !0
                }
            }), t2(n, e)
        })(e)
    }

    function t6(e, t, n) {
        function r(n, r) {
            var o, i;
            for (var u in Object.defineProperty(n, "_zod", {
                    value: null != (o = n._zod) ? o : {},
                    enumerable: !1
                }), null != (i = n._zod).traits || (i.traits = new Set), n._zod.traits.add(e), t(n, r), a.prototype) u in n || Object.defineProperty(n, u, {
                value: a.prototype[u].bind(n)
            });
            n._zod.constr = a, n._zod.def = r
        }
        var o, i = function(e) {
            function t() {
                return w(this, t), t1(this, t, arguments)
            }
            return t4(t, e), t
        }(null != (o = null == n ? void 0 : n.Parent) ? o : Object);

        function a(e) {
            var t = (null == n ? void 0 : n.Parent) ? new i : this;
            r(t, e), null != (l = t._zod).deferred || (l.deferred = []);
            var o = !0,
                a = !1,
                u = void 0;
            try {
                for (var s, l, c, d = t._zod.deferred[Symbol.iterator](); !(o = (c = d.next()).done); o = !0)(0, c.value)()
            } catch (e) {
                a = !0, u = e
            } finally {
                try {
                    o || null == d.return || d.return()
                } finally {
                    if (a) throw u
                }
            }
            return t
        }
        return Object.defineProperty(i, "name", {
            value: e
        }), Object.defineProperty(a, "init", {
            value: r
        }), Object.defineProperty(a, Symbol.hasInstance, {
            value: function(t) {
                var r, o;
                return !!((null == n ? void 0 : n.Parent) && T(t, n.Parent)) || (null == t || null == (o = t._zod) || null == (r = o.traits) ? void 0 : r.has(e))
            }
        }), Object.defineProperty(a, "name", {
            value: e
        }), a
    }
    Object.freeze({
        status: "aborted"
    }), Symbol("zod_brand");
    var t7 = function(e) {
        function t() {
            return w(this, t), t1(this, t, ["Encountered Promise during synchronous parse. Use .parseAsync() instead."])
        }
        return t4(t, e), t
    }(t5(Error));
    t5(Error);
    var t8 = {};

    function t9(e) {
        return e && Object.assign(t8, e), t8
    }

    function ne(e, t) {
        return (void 0 === t ? "undefined" : S(t)) === "bigint" ? t.toString() : t
    }

    function nt(e) {
        return {
            get value() {
                var t = e();
                return Object.defineProperty(this, "value", {
                    value: t
                }), t
            }
        }
    }
    var nn = Symbol("evaluating");

    function nr(e, t, n) {
        var r = void 0;
        Object.defineProperty(e, t, {
            get: function() {
                if (r !== nn) return void 0 === r && (r = nn, r = n()), r
            },
            set: function(n) {
                Object.defineProperty(e, t, {
                    value: n
                })
            },
            configurable: !0
        })
    }
    var no = "captureStackTrace" in Error ? Error.captureStackTrace : function() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n]
    };

    function ni(e) {
        return e.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")
    }

    function na(e) {
        if (!e) return {};
        if ("string" == typeof e) return {
            error: function() {
                return e
            }
        };
        if ((null == e ? void 0 : e.message) !== void 0) {
            if ((null == e ? void 0 : e.error) !== void 0) throw Error("Cannot specify both `message` and `error` params");
            e.error = e.message
        }
        return (delete e.message, "string" == typeof e.error) ? O(R({}, e), {
            error: function() {
                return e.error
            }
        }) : e
    }

    function nu(e) {
        var t, n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
        if (!0 === e.aborted) return !0;
        for (var r = n; r < e.issues.length; r++)
            if ((null == (t = e.issues[r]) ? void 0 : t.continue) !== !0) return !0;
        return !1
    }

    function ns(e, t) {
        return t.map(function(t) {
            return null != t.path || (t.path = []), t.path.unshift(e), t
        })
    }

    function nl(e) {
        return "string" == typeof e ? e : null == e ? void 0 : e.message
    }

    function nc(e, t, n) {
        var r, o, i, a, u, s, l, c, d, p, f, v = O(R({}, e), {
            path: null != (r = e.path) ? r : []
        });
        return e.message || (v.message = null != (o = null != (i = null != (a = null != (u = nl(null == (c = e.inst) || null == (l = c._zod.def) || null == (s = l.error) ? void 0 : s.call(l, e))) ? u : nl(null == t || null == (d = t.error) ? void 0 : d.call(t, e))) ? a : nl(null == (p = n.customError) ? void 0 : p.call(n, e))) ? i : nl(null == (f = n.localeError) ? void 0 : f.call(n, e))) ? o : "Invalid input"), delete v.inst, delete v.continue, (null == t ? void 0 : t.reportInput) || delete v.input, v
    }
    nt(function() {
        var e, t;
        if ("u" > typeof navigator && (null == (t = navigator) || null == (e = t.userAgent) ? void 0 : e.includes("Cloudflare"))) return !1;
        try {
            return Function(""), !0
        } catch (e) {
            return !1
        }
    });
    var nd = function(e, t) {
            e.name = "$ZodError", Object.defineProperty(e, "_zod", {
                value: e._zod,
                enumerable: !1
            }), Object.defineProperty(e, "issues", {
                value: t,
                enumerable: !1
            }), e.message = JSON.stringify(t, ne, 2), Object.defineProperty(e, "toString", {
                value: function() {
                    return e.message
                },
                enumerable: !1
            })
        },
        np = t6("$ZodError", nd),
        nf = t6("$ZodError", nd, {
            Parent: Error
        }),
        nv = (e = nf, function(t, n, r, o) {
            var i = r ? Object.assign(r, {
                    async: !1
                }) : {
                    async: !1
                },
                a = t._zod.run({
                    value: n,
                    issues: []
                }, i);
            if (T(a, Promise)) throw new t7;
            if (a.issues.length) {
                var u, s = new(null != (u = null == o ? void 0 : o.Err) ? u : e)(a.issues.map(function(e) {
                    return nc(e, i, t9())
                }));
                throw no(s, null == o ? void 0 : o.callee), s
            }
            return a.value
        }),
        nh = (t = nf, function(e, n, r, o) {
            return tZ(function() {
                var i, a, u, s;
                return t$(this, function(l) {
                    switch (l.label) {
                        case 0:
                            if (i = r ? Object.assign(r, {
                                    async: !0
                                }) : {
                                    async: !0
                                }, !T(a = e._zod.run({
                                    value: n,
                                    issues: []
                                }, i), Promise)) return [3, 2];
                            return [4, a];
                        case 1:
                            a = l.sent(), l.label = 2;
                        case 2:
                            if (a.issues.length) throw no(s = new(null != (u = null == o ? void 0 : o.Err) ? u : t)(a.issues.map(function(e) {
                                return nc(e, i, t9())
                            })), null == o ? void 0 : o.callee), s;
                            return [2, a.value]
                    }
                })
            })()
        }),
        ny = (n = nf, function(e, t, r) {
            var o = r ? O(R({}, r), {
                    async: !1
                }) : {
                    async: !1
                },
                i = e._zod.run({
                    value: t,
                    issues: []
                }, o);
            if (T(i, Promise)) throw new t7;
            return i.issues.length ? {
                success: !1,
                error: new(null != n ? n : np)(i.issues.map(function(e) {
                    return nc(e, o, t9())
                }))
            } : {
                success: !0,
                data: i.value
            }
        }),
        nm = (r = nf, function(e, t, n) {
            return tZ(function() {
                var o, i;
                return t$(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (o = n ? Object.assign(n, {
                                    async: !0
                                }) : {
                                    async: !0
                                }, !T(i = e._zod.run({
                                    value: t,
                                    issues: []
                                }, o), Promise)) return [3, 2];
                            return [4, i];
                        case 1:
                            i = a.sent(), a.label = 2;
                        case 2:
                            return [2, i.issues.length ? {
                                success: !1,
                                error: new r(i.issues.map(function(e) {
                                    return nc(e, o, t9())
                                }))
                            } : {
                                success: !0,
                                data: i.value
                            }]
                    }
                })
            })()
        });
    RegExp('^[^\\s@"]{1,64}@[^\\s@]{1,255}$', "u");
    var nb = /^-?\d+(?:\.\d+)?/,
        nT = {
            major: 4,
            minor: 1,
            patch: 11
        },
        nw = t6("$ZodType", function(e, t) {
            null != e || (e = {}), e._zod.def = t, e._zod.bag = e._zod.bag || {}, e._zod.version = nT;
            var n, r = h(null != (u = e._zod.def.checks) ? u : []);
            e._zod.traits.has("$ZodCheck") && r.unshift(e);
            var o = !0,
                i = !1,
                a = void 0;
            try {
                for (var u, s, l, c = r[Symbol.iterator](); !(o = (l = c.next()).done); o = !0) {
                    var d = l.value,
                        p = !0,
                        f = !1,
                        v = void 0;
                    try {
                        for (var y, m = d._zod.onattach[Symbol.iterator](); !(p = (y = m.next()).done); p = !0)(0, y.value)(e)
                    } catch (e) {
                        f = !0, v = e
                    } finally {
                        try {
                            p || null == m.return || m.return()
                        } finally {
                            if (f) throw v
                        }
                    }
                }
            } catch (e) {
                i = !0, a = e
            } finally {
                try {
                    o || null == c.return || c.return()
                } finally {
                    if (i) throw a
                }
            }
            if (0 === r.length) null != (s = e._zod).deferred || (s.deferred = []), null == (n = e._zod.deferred) || n.push(function() {
                e._zod.run = e._zod.parse
            });
            else {
                var b = function(e, t, n) {
                        var r = nu(e),
                            o = !0,
                            i = !1,
                            a = void 0;
                        try {
                            for (var u, s, l = t[Symbol.iterator](); !(o = (s = l.next()).done); o = !0) ! function() {
                                var t = s.value;
                                if (t._zod.def.when) {
                                    if (!t._zod.def.when(e)) return
                                } else if (r) return;
                                var o = e.issues.length,
                                    i = t._zod.check(e);
                                if (T(i, Promise) && (null == n ? void 0 : n.async) === !1) throw new t7;
                                if (u || T(i, Promise)) u = (null != u ? u : Promise.resolve()).then(function() {
                                    return tZ(function() {
                                        return t$(this, function(t) {
                                            switch (t.label) {
                                                case 0:
                                                    return [4, i];
                                                case 1:
                                                    if (t.sent(), e.issues.length === o) return [2];
                                                    return r || (r = nu(e, o)), [2]
                                            }
                                        })
                                    })()
                                });
                                else {
                                    if (e.issues.length === o) return;
                                    r || (r = nu(e, o))
                                }
                            }()
                        } catch (e) {
                            i = !0, a = e
                        } finally {
                            try {
                                o || null == l.return || l.return()
                            } finally {
                                if (i) throw a
                            }
                        }
                        return u ? u.then(function() {
                            return e
                        }) : e
                    },
                    w = function(t, n, o) {
                        if (nu(t)) return t.aborted = !0, t;
                        var i = b(n, r, o);
                        if (T(i, Promise)) {
                            if (!1 === o.async) throw new t7;
                            return i.then(function(t) {
                                return e._zod.parse(t, o)
                            })
                        }
                        return e._zod.parse(i, o)
                    };
                e._zod.run = function(t, n) {
                    if (n.skipChecks) return e._zod.parse(t, n);
                    if ("backward" === n.direction) {
                        var o = e._zod.parse({
                            value: t.value,
                            issues: []
                        }, O(R({}, n), {
                            skipChecks: !0
                        }));
                        return T(o, Promise) ? o.then(function(e) {
                            return w(e, t, n)
                        }) : w(o, t, n)
                    }
                    var i = e._zod.parse(t, n);
                    if (T(i, Promise)) {
                        if (!1 === n.async) throw new t7;
                        return i.then(function(e) {
                            return b(e, r, n)
                        })
                    }
                    return b(i, r, n)
                }
            }
            e["~standard"] = {
                validate: function(t) {
                    try {
                        var n, r = ny(e, t);
                        return r.success ? {
                            value: r.data
                        } : {
                            issues: null == (n = r.error) ? void 0 : n.issues
                        }
                    } catch (n) {
                        return nm(e, t).then(function(e) {
                            var t;
                            return e.success ? {
                                value: e.data
                            } : {
                                issues: null == (t = e.error) ? void 0 : t.issues
                            }
                        })
                    }
                },
                vendor: "zod",
                version: 1
            }
        }),
        ng = t6("$ZodNumber", function(e, t) {
            var n;
            nw.init(e, t), e._zod.pattern = null != (n = e._zod.bag.pattern) ? n : nb, e._zod.parse = function(n, r) {
                if (t.coerce) try {
                    n.value = Number(n.value)
                } catch (e) {}
                var o = n.value;
                if ("number" == typeof o && !Number.isNaN(o) && Number.isFinite(o)) return n;
                var i = "number" == typeof o ? Number.isNaN(o) ? "NaN" : Number.isFinite(o) ? void 0 : "Infinity" : void 0;
                return n.issues.push(R({
                    expected: "number",
                    code: "invalid_type",
                    input: o,
                    inst: e
                }, i ? {
                    received: i
                } : {})), n
            }
        }),
        nP = t6("$ZodUnknown", function(e, t) {
            nw.init(e, t), e._zod.parse = function(e) {
                return e
            }
        });

    function nE(e, t, n) {
        if (e.issues.length) {
            var r;
            (r = t.issues).push.apply(r, h(ns(n, e.issues)))
        }
        t.value[n] = e.value
    }
    var nR = t6("$ZodArray", function(e, t) {
        nw.init(e, t), e._zod.parse = function(n, r) {
            var o = function(e) {
                    var o = i[e],
                        u = t.element._zod.run({
                            value: o,
                            issues: []
                        }, r);
                    T(u, Promise) ? a.push(u.then(function(t) {
                        return nE(t, n, e)
                    })) : nE(u, n, e)
                },
                i = n.value;
            if (!Array.isArray(i)) return n.issues.push({
                expected: "array",
                code: "invalid_type",
                input: i,
                inst: e
            }), n;
            n.value = Array(i.length);
            for (var a = [], u = 0; u < i.length; u++) o(u);
            return a.length ? Promise.all(a).then(function() {
                return n
            }) : n
        }
    });

    function nO(e, t, n, r) {
        if (e.issues.length) {
            var o;
            (o = t.issues).push.apply(o, h(ns(n, e.issues)))
        }
        void 0 === e.value ? n in r && (t.value[n] = void 0) : t.value[n] = e.value
    }
    var nS = t6("$ZodObject", function(e, t) {
            nw.init(e, t);
            var n, r = Object.getOwnPropertyDescriptor(t, "shape");
            if (!(null == r ? void 0 : r.get)) {
                var o = t.shape;
                Object.defineProperty(t, "shape", {
                    get: function() {
                        var e = R({}, o);
                        return Object.defineProperty(t, "shape", {
                            value: e
                        }), e
                    }
                })
            }
            var i = nt(function() {
                return function(e) {
                    var t, n = Object.keys(e.shape),
                        r = !0,
                        o = !1,
                        i = void 0;
                    try {
                        for (var a, u = n[Symbol.iterator](); !(r = (a = u.next()).done); r = !0) {
                            var s, l, c, d, p = a.value;
                            if (!(null == (d = e.shape) || null == (c = d[p]) || null == (l = c._zod) || null == (s = l.traits) ? void 0 : s.has("$ZodType"))) throw Error('Invalid element at key "'.concat(p, '": expected a Zod schema'))
                        }
                    } catch (e) {
                        o = !0, i = e
                    } finally {
                        try {
                            r || null == u.return || u.return()
                        } finally {
                            if (o) throw i
                        }
                    }
                    var f = Object.keys(t = e.shape).filter(function(e) {
                        return "optional" === t[e]._zod.optin && "optional" === t[e]._zod.optout
                    });
                    return O(R({}, e), {
                        keys: n,
                        keySet: new Set(n),
                        numKeys: n.length,
                        optionalKeys: new Set(f)
                    })
                }(t)
            });
            nr(e._zod, "propValues", function() {
                var e = t.shape,
                    n = {};
                for (var r in e) {
                    var o = e[r]._zod;
                    if (o.values) {
                        null != n[r] || (n[r] = new Set);
                        var i = !0,
                            a = !1,
                            u = void 0;
                        try {
                            for (var s, l, c = o.values[Symbol.iterator](); !(i = (l = c.next()).done); i = !0) {
                                var d = l.value;
                                n[r].add(d)
                            }
                        } catch (e) {
                            a = !0, u = e
                        } finally {
                            try {
                                i || null == c.return || c.return()
                            } finally {
                                if (a) throw u
                            }
                        }
                    }
                }
                return n
            });
            var a = t.catchall;
            e._zod.parse = function(t, r) {
                null != n || (n = i.value);
                var o = t.value;
                if (!((void 0 === (p = o) ? "undefined" : S(p)) === "object" && null !== p && !Array.isArray(p))) return t.issues.push({
                    expected: "object",
                    code: "invalid_type",
                    input: o,
                    inst: e
                }), t;
                t.value = {};
                var u = [],
                    s = n.shape,
                    l = !0,
                    c = !1,
                    d = void 0;
                try {
                    for (var p, f, v = n.keys[Symbol.iterator](); !(l = (f = v.next()).done); l = !0) ! function() {
                        var e = f.value,
                            n = s[e]._zod.run({
                                value: o[e],
                                issues: []
                            }, r);
                        T(n, Promise) ? u.push(n.then(function(n) {
                            return nO(n, t, e, o)
                        })) : nO(n, t, e, o)
                    }()
                } catch (e) {
                    c = !0, d = e
                } finally {
                    try {
                        l || null == v.return || v.return()
                    } finally {
                        if (c) throw d
                    }
                }
                return a ? function(e, t, n, r, o, i) {
                    var a = [],
                        u = o.keySet,
                        s = o.catchall._zod,
                        l = s.def.type,
                        c = !0,
                        d = !1,
                        p = void 0;
                    try {
                        for (var f, v = Object.keys(t)[Symbol.iterator](); !(c = (f = v.next()).done); c = !0) ! function() {
                            var o = f.value;
                            if (!u.has(o)) {
                                if ("never" === l) return a.push(o);
                                var i = s.run({
                                    value: t[o],
                                    issues: []
                                }, r);
                                T(i, Promise) ? e.push(i.then(function(e) {
                                    return nO(e, n, o, t)
                                })) : nO(i, n, o, t)
                            }
                        }()
                    } catch (e) {
                        d = !0, p = e
                    } finally {
                        try {
                            c || null == v.return || v.return()
                        } finally {
                            if (d) throw p
                        }
                    }
                    return (a.length && n.issues.push({
                        code: "unrecognized_keys",
                        keys: a,
                        input: t,
                        inst: i
                    }), e.length) ? Promise.all(e).then(function() {
                        return n
                    }) : n
                }(u, o, t, r, i.value, e) : u.length ? Promise.all(u).then(function() {
                    return t
                }) : t
            }
        }),
        nI = t6("$ZodLiteral", function(e, t) {
            if (nw.init(e, t), 0 === t.values.length) throw Error("Cannot create literal schema with no valid values");
            e._zod.values = new Set(t.values), e._zod.pattern = new RegExp("^(".concat(t.values.map(function(e) {
                return "string" == typeof e ? ni(e) : e ? ni(e.toString()) : String(e)
            }).join("|"), ")$")), e._zod.parse = function(n, r) {
                var o = n.value;
                return e._zod.values.has(o) || n.issues.push({
                    code: "invalid_value",
                    values: t.values,
                    input: o,
                    inst: e
                }), n
            }
        });

    function nA(e, t) {
        return e.issues.length && void 0 === t ? {
            issues: [],
            value: void 0
        } : e
    }
    var nN = t6("$ZodOptional", function(e, t) {
        nw.init(e, t), e._zod.optin = "optional", e._zod.optout = "optional", nr(e._zod, "values", function() {
            return t.innerType._zod.values ? new Set(h(t.innerType._zod.values).concat([void 0])) : void 0
        }), nr(e._zod, "pattern", function() {
            var e, n, r, o = t.innerType._zod.pattern;
            return o ? new RegExp("^(".concat((n = +!!(e = o.source).startsWith("^"), r = e.endsWith("$") ? e.length - 1 : e.length, e.slice(n, r)), ")?$")) : void 0
        }), e._zod.parse = function(e, n) {
            if ("optional" === t.innerType._zod.optin) {
                var r = t.innerType._zod.run(e, n);
                return T(r, Promise) ? r.then(function(t) {
                    return nA(t, e.value)
                }) : nA(r, e.value)
            }
            return void 0 === e.value ? e : t.innerType._zod.run(e, n)
        }
    });
    Symbol("ZodOutput"), Symbol("ZodInput");
    var n_ = t6("ZodMiniType", function(e, t) {
            if (!e._zod) throw Error("Uninitialized schema in ZodMiniType.");
            nw.init(e, t), e.def = t, e.type = t.type, e.parse = function(t, n) {
                return nv(e, t, n, {
                    callee: e.parse
                })
            }, e.safeParse = function(t, n) {
                return ny(e, t, n)
            }, e.parseAsync = function(t, n) {
                return tZ(function() {
                    return t$(this, function(r) {
                        return [2, nh(e, t, n, {
                            callee: e.parseAsync
                        })]
                    })
                })()
            }, e.safeParseAsync = function(t, n) {
                return tZ(function() {
                    return t$(this, function(r) {
                        return [2, nm(e, t, n)]
                    })
                })()
            }, e.check = function() {
                for (var n, r = arguments.length, o = Array(r), i = 0; i < r; i++) o[i] = arguments[i];
                return e.clone(O(R({}, t), {
                    checks: h(null != (n = t.checks) ? n : []).concat(h(o.map(function(e) {
                        return "function" == typeof e ? {
                            _zod: {
                                check: e,
                                def: {
                                    check: "custom"
                                },
                                onattach: []
                            }
                        } : e
                    })))
                }))
            }, e.clone = function(t, n) {
                var r;
                return r = new e._zod.constr(null != t ? t : e._zod.def), (!t || (null == n ? void 0 : n.parent)) && (r._zod.parent = e), r
            }, e.brand = function() {
                return e
            }, e.register = function(t, n) {
                return t.add(e, n), e
            }
        }),
        nM = t6("ZodMiniNumber", function(e, t) {
            ng.init(e, t), n_.init(e, t)
        });

    function nC(e) {
        return new nM(R({
            type: "number",
            checks: []
        }, na(e)))
    }
    var nL = t6("ZodMiniUnknown", function(e, t) {
        nP.init(e, t), n_.init(e, t)
    });

    function nx() {
        return new nL({
            type: "unknown"
        })
    }
    var nU = t6("ZodMiniArray", function(e, t) {
            nR.init(e, t), n_.init(e, t)
        }),
        nF = t6("ZodMiniObject", function(e, t) {
            nS.init(e, t), n_.init(e, t), nr(e, "shape", function() {
                return t.shape
            })
        });

    function nD(e, t) {
        return new nF(R({
            type: "object",
            shape: e,
            catchall: nx()
        }, na(t)))
    }
    var nk = t6("ZodMiniLiteral", function(e, t) {
            nI.init(e, t), n_.init(e, t)
        }),
        nB = t6("ZodMiniOptional", function(e, t) {
            nN.init(e, t), n_.init(e, t)
        }),
        nj = window.Roblox["core-scripts"].environmentUrls,
        nq = p.n(nj),
        nV = window.Roblox["core-lib"].http.index,
        nz = window.Roblox["core-lib"].url.index,
        nG = "PresenceBulkNotifications",
        nH = nD({
            Type: new nk(R({
                type: "literal",
                values: Array.isArray(u = "PresenceChanged") ? u : [u]
            }, na(void 0))),
            UserId: nC(),
            SessionStarted: nx(),
            PresenceReport: new nB({
                type: "optional",
                innerType: nx()
            })
        }),
        nJ = (s = {
            userPresences: new nU(R({
                type: "array",
                element: nD({
                    userId: nC()
                })
            }, na(void 0)))
        }, new nF(R({
            type: "object",
            shape: null != s ? s : {}
        }, na(void 0)))),
        nW = function(e) {
            document.dispatchEvent(new CustomEvent("Roblox.Presence.Update", {
                detail: e
            }))
        },
        nQ = function(e) {
            var t = new Map,
                n = function(e) {
                    var n = e.UserId,
                        r = e.SessionStarted;
                    if (!t.has(n)) return !0;
                    var o = t.get(n);
                    return "string" == typeof r && "string" == typeof o ? r > o : "number" == typeof r && "number" == typeof o && r > o
                },
                r = function(e) {
                    var r = new Map,
                        o = !0,
                        i = !1,
                        a = void 0;
                    try {
                        for (var u, s = (Array.isArray(e) ? e : [])[Symbol.iterator](); !(o = (u = s.next()).done); o = !0) {
                            var l = u.value,
                                c = nH.safeParse(l);
                            c.success && r.set(c.data.UserId, c.data)
                        }
                    } catch (e) {
                        i = !0, a = e
                    } finally {
                        try {
                            o || null == s.return || s.return()
                        } finally {
                            if (i) throw a
                        }
                    }
                    var d = new Map,
                        p = [],
                        f = !0,
                        v = !1,
                        h = void 0;
                    try {
                        for (var y, m = r[Symbol.iterator](); !(f = (y = m.next()).done); f = !0) {
                            var b = tK(y.value, 2),
                                T = b[0],
                                w = b[1];
                            null != w.PresenceReport && n(w) ? (d.set(T, w.PresenceReport), t.set(T, w.SessionStarted)) : p.push(T)
                        }
                    } catch (e) {
                        v = !0, h = e
                    } finally {
                        try {
                            f || null == m.return || m.return()
                        } finally {
                            if (v) throw h
                        }
                    }
                    p.length > 0 && tZ(function() {
                        var e;
                        return t$(this, function(t) {
                            switch (t.label) {
                                case 0:
                                    return e = nz.Url.parse(nq().presenceApi).getOrThrow().withPath("/v1/presence/users"), [4, nV.post(e, {
                                        userIds: p
                                    }, nJ, {
                                        credentials: "include"
                                    })];
                                case 1:
                                    return [2, t.sent().getOrThrow().userPresences]
                            }
                        })
                    })().then(function(e) {
                        var t = !0,
                            n = !1,
                            r = void 0;
                        try {
                            for (var o, i = e[Symbol.iterator](); !(t = (o = i.next()).done); t = !0) {
                                var a = o.value;
                                d.set(a.userId, a)
                            }
                        } catch (e) {
                            n = !0, r = e
                        } finally {
                            try {
                                t || null == i.return || i.return()
                            } finally {
                                if (n) throw r
                            }
                        }
                    }).catch(function(e) {
                        console.error(e)
                    }).finally(function() {
                        nW(d)
                    }), nW(d)
                };
            return e.Subscribe(nG, r),
                function() {
                    e.Unsubscribe(nG, r)
                }
        };

    function nY() {
        return null != l || (l = "".concat(nq().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), l
    }
    var nZ = function() {},
        nK = function(e, t) {
            return e << 3 | t
        },
        n$ = nK(1, 2),
        nX = nK(2, 2),
        n0 = nK(5, 2),
        n1 = nK(6, 2),
        n2 = nK(8, 2),
        n4 = nK(1, 2),
        n3 = nK(2, 1),
        n5 = nK(3, 0),
        n6 = nK(5, 2);
    nK(1, 2), nK(2, 1), nK(3, 0), nK(4, 2), nK(5, 2), nK(6, 0), nK(8, 2);
    var n7 = nK(4, 0),
        n8 = nK(6, 2),
        n9 = nK(7, 2);
    nK(1, 0), nK(2, 2);
    var re = nK(1, 2),
        rt = nK(2, 2),
        rn = nK(1, 2);
    nK(1, 2), nK(2, 2), nK(1, 2);
    var rr = new TextEncoder,
        ro = function() {
            function e() {
                w(this, e), E(this, "buf", [])
            }
            return P(e, [{
                key: "writeVarint",
                value: function(e) {
                    var t = (void 0 === e ? "undefined" : S(e)) === "bigint" ? e : BigInt(Math.trunc(e));
                    for (t < BigInt(0) && (t += BigInt(1) << BigInt(64)); t > BigInt(127);) this.buf.push(128 | Number(t & BigInt(127))), t >>= BigInt(7);
                    this.buf.push(Number(t))
                }
            }, {
                key: "writeString",
                value: function(e) {
                    var t = rr.encode(e);
                    this.writeVarint(t.length);
                    var n = !0,
                        r = !1,
                        o = void 0;
                    try {
                        for (var i, a = t[Symbol.iterator](); !(n = (i = a.next()).done); n = !0) {
                            var u = i.value;
                            this.buf.push(u)
                        }
                    } catch (e) {
                        r = !0, o = e
                    } finally {
                        try {
                            n || null == a.return || a.return()
                        } finally {
                            if (r) throw o
                        }
                    }
                }
            }, {
                key: "writeBytes",
                value: function(e) {
                    this.writeVarint(e.length);
                    var t = !0,
                        n = !1,
                        r = void 0;
                    try {
                        for (var o, i = e[Symbol.iterator](); !(t = (o = i.next()).done); t = !0) {
                            var a = o.value;
                            this.buf.push(a)
                        }
                    } catch (e) {
                        n = !0, r = e
                    } finally {
                        try {
                            t || null == i.return || i.return()
                        } finally {
                            if (n) throw r
                        }
                    }
                }
            }, {
                key: "writeDouble",
                value: function(e) {
                    var t = new DataView(new ArrayBuffer(8));
                    t.setFloat64(0, e, !0);
                    for (var n = 0; n < 8; n += 1) this.buf.push(t.getUint8(n))
                }
            }, {
                key: "toBytes",
                value: function() {
                    return new Uint8Array(this.buf)
                }
            }]), e
        }();

    function ri(e, t, n) {
        var r = new ro;
        return r.writeVarint(nK(1, 2)), r.writeString(e), r.writeVarint(t), n(r), r.toBytes()
    }

    function ra(e) {
        var t = new ro;
        if (t.writeVarint(n4), t.writeString(e.name), t.writeVarint(n3), t.writeDouble(e.value), t.writeVarint(n5), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
            var n = function(e) {
                var t = new ro,
                    n = !0,
                    r = !1,
                    o = void 0;
                try {
                    for (var i, a = Object.entries(e)[Symbol.iterator](); !(n = (i = a.next()).done); n = !0) ! function() {
                        var e = tK(i.value, 2),
                            n = e[0],
                            r = e[1];
                        if ("string" == typeof r) {
                            var o = ri(n, nK(2, 2), function(e) {
                                e.writeString(r)
                            });
                            t.writeVarint(n0), t.writeBytes(o)
                        } else if ("boolean" == typeof r) {
                            var a = ri(n, nK(2, 0), function(e) {
                                e.writeVarint(+!!r)
                            });
                            t.writeVarint(n1), t.writeBytes(a)
                        } else if ((void 0 === r ? "undefined" : S(r)) === "bigint") {
                            var u = ri(n, nK(2, 0), function(e) {
                                e.writeVarint(r)
                            });
                            t.writeVarint(nX), t.writeBytes(u)
                        } else if ("number" == typeof r)
                            if (Number.isFinite(r))
                                if (Number.isInteger(r) && r >= -0x80000000 && r <= 0x7fffffff) {
                                    var s = ri(n, nK(2, 0), function(e) {
                                        e.writeVarint(r)
                                    });
                                    t.writeVarint(n$), t.writeBytes(s)
                                } else if (Number.isInteger(r)) {
                            var l = ri(n, nK(2, 0), function(e) {
                                e.writeVarint(BigInt(r))
                            });
                            t.writeVarint(nX), t.writeBytes(l)
                        } else {
                            var c = ri(n, nK(2, 1), function(e) {
                                e.writeDouble(r)
                            });
                            t.writeVarint(n2), t.writeBytes(c)
                        } else {
                            var d = ri(n, nK(2, 2), function(e) {
                                e.writeString(String(r))
                            });
                            t.writeVarint(n0), t.writeBytes(d)
                        }
                    }()
                } catch (e) {
                    r = !0, o = e
                } finally {
                    try {
                        n || null == a.return || a.return()
                    } finally {
                        if (r) throw o
                    }
                }
                return t.toBytes()
            }(e.attributes);
            t.writeVarint(n6), t.writeBytes(n)
        }
        return t.toBytes()
    }

    function ru(e, t, n) {
        var r = new ro;
        r.writeVarint(n7), r.writeVarint(n);
        var o = !0,
            i = !1,
            a = void 0;
        try {
            for (var u, s = e[Symbol.iterator](); !(o = (u = s.next()).done); o = !0) {
                var l = u.value;
                r.writeVarint(n8), r.writeBytes(l)
            }
        } catch (e) {
            i = !0, a = e
        } finally {
            try {
                o || null == s.return || s.return()
            } finally {
                if (i) throw a
            }
        }
        var c = !0,
            d = !1,
            p = void 0;
        try {
            for (var f, v = t[Symbol.iterator](); !(c = (f = v.next()).done); c = !0) {
                var h = f.value;
                r.writeVarint(n9), r.writeBytes(h)
            }
        } catch (e) {
            d = !0, p = e
        } finally {
            try {
                c || null == v.return || v.return()
            } finally {
                if (d) throw p
            }
        }
        return r.toBytes()
    }

    function rs(e) {
        var t = new ro;
        t.writeVarint(re), t.writeString("eventstream.enginetelemetry.EngineTelemetryBatchEvent"), t.writeVarint(rt), t.writeBytes(e);
        var n = t.toBytes(),
            r = new ro;
        return r.writeVarint(rn), r.writeBytes(n), r.toBytes()
    }
    var rl = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

    function rc(e) {
        return rl.test(e)
    }
    var rd = [],
        rp = !1,
        rf = !1;

    function rv(e, t) {
        var n, r, o = e.map(function(e) {
                return {
                    name: e.name,
                    value: e.value,
                    timestampMs: e.timestampMs,
                    attributes: e.attributes
                }
            }),
            i = BigInt(Date.now());
        !0 === t || rf || "u" > typeof document && "hidden" === document.visibilityState ? (n = rs(ru(o.map(ra), [], i)).buffer, fetch("".concat(nY()).concat("/v1/events/single"), {
            method: "POST",
            headers: {
                "Content-Type": "application/x-protobuf"
            },
            body: n,
            credentials: "include",
            keepalive: !0
        }).catch(nZ)) : (r = rs(ru(o.map(ra), [], i)), tZ(function() {
            var e, t, n, o, i, a, u, s, l, c, d, p, f;
            return t$(this, function(v) {
                switch (v.label) {
                    case 0:
                        if ("u" < typeof CompressionStream) return [2, {
                            body: r.buffer,
                            compressed: !1
                        }];
                        return (t = (e = new CompressionStream("gzip")).writable.getWriter()).write(r).catch(nZ), t.close().catch(nZ), n = [], [4, (o = e.readable.getReader()).read()];
                    case 1:
                        i = v.sent(), v.label = 2;
                    case 2:
                        if (i.done) return [3, 4];
                        return n.push(i.value), [4, o.read()];
                    case 3:
                        return i = v.sent(), [3, 2];
                    case 4:
                        a = new Uint8Array(n.reduce(function(e, t) {
                            return e + t.length
                        }, 0)), u = 0, s = !0, l = !1, c = void 0;
                        try {
                            for (d = n[Symbol.iterator](); !(s = (p = d.next()).done); s = !0) f = p.value, a.set(f, u), u += f.length
                        } catch (e) {
                            l = !0, c = e
                        } finally {
                            try {
                                s || null == d.return || d.return()
                            } finally {
                                if (l) throw c
                            }
                        }
                        return [2, {
                            body: a.buffer,
                            compressed: !0
                        }]
                }
            })
        })()).then(function(e) {
            var t = e.body,
                n = e.compressed,
                r = {
                    "Content-Type": "application/x-protobuf"
                };
            return n && (r["Content-Encoding"] = "gzip"), fetch("".concat(nY()).concat("/v1/events/single"), {
                method: "POST",
                headers: r,
                body: t,
                credentials: "include",
                keepalive: !0
            })
        }).catch(nZ)
    }

    function rh() {
        var e = !0,
            t = !1,
            n = void 0;
        try {
            for (var r, o = rd[Symbol.iterator](); !(e = (r = o.next()).done); e = !0) {
                var i = r.value.splice(0);
                0 !== i.length && rv(i, !0)
            }
        } catch (e) {
            t = !0, n = e
        } finally {
            try {
                e || null == o.return || o.return()
            } finally {
                if (t) throw n
            }
        }
    }
    var ry = globalThis.document,
        rm = void 0 === ry ? void 0 : ry,
        rb = new Map(["android", "ios", "xbox", "uwp", "amazon", "win32", "universalApp", "unknown"].map(function(e) {
            return [e.toLowerCase(), e]
        })),
        rT = function(e) {
            var t, n;
            return null != (t = rb.get(null != (n = null == e ? void 0 : e.trim().toLowerCase()) ? n : "")) ? t : "unknown"
        },
        rw = function() {
            if ("u" > typeof document) {
                var e = document.querySelector('meta[name="page-meta"]');
                return null == e ? void 0 : e.dataset.internalPageName
            }
        },
        rg = ["Messages", "Avatar"],
        rP = function(e) {
            var t;
            return null != (t = rg.find(function(t) {
                return t === e
            })) ? t : "other"
        },
        rE = function() {
            var e;
            return rT(null == rm || null == (e = rm.querySelector('meta[name="device-meta"]')) ? void 0 : e.dataset.appType)
        },
        rR = {
            featureName: "AppShell",
            team: "User > Consumer Apps > Platforms - Web & Backend",
            features: {
                page: {
                    counters: [{
                        name: "ShellStart",
                        dimensions: ["host", "page", "appType", "auth_state"]
                    }, {
                        name: "PageHeartbeat",
                        dimensions: ["host", "page", "appType", "beat"]
                    }]
                },
                presence: {
                    counters: [{
                        name: "PresenceHeartbeat",
                        dimensions: ["host", "page", "appType", "outcome"]
                    }]
                },
                navigation: {
                    counters: [{
                        name: "NavLoad",
                        dimensions: ["host", "page", "appType", "outcome"]
                    }]
                },
                realtime: {
                    counters: [{
                        name: "RealtimeStart",
                        dimensions: ["host", "page", "appType", "outcome"]
                    }]
                },
                chat: {
                    counters: [{
                        name: "ChatLoad",
                        dimensions: ["host", "page", "appType", "outcome"]
                    }]
                },
                gameLaunch: {
                    counters: [{
                        name: "GameLaunch",
                        dimensions: ["host", "page", "appType", "outcome"]
                    }]
                }
            }
        },
        rO = function(e, t, n) {
            var r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : {},
                o = r.appType,
                i = void 0 !== o && o;
            return function(r, o) {
                var a = Object.values(e.features).some(function(e) {
                    var t;
                    return null == (t = e.counters) ? void 0 : t.some(function(e) {
                        var t;
                        return "string" != typeof e && e.name === r && (null == (t = e.dimensions) ? void 0 : t.includes("page")) === !0
                    })
                });
                t(r, R(O(R({}, a && null == o.page ? {
                    page: rP(rw())
                } : {}, o), {
                    host: n
                }), i ? {
                    appType: rE()
                } : {}))
            }
        }(rR, function(e) {
            var t, n = Math.max(1, 10),
                r = 250;

            function o(e, t) {
                console.error(e, t)
            }
            if (!rc(e)) return o('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                    name: e
                }),
                function() {};
            var i = [];
            return rd.push(i), rp || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                    "hidden" === document.visibilityState && rh()
                }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                    rf = !0, rh()
                }), rp = !0),
                function(a, u, s) {
                    var l = "".concat(e, "_").concat(a);
                    if (! function(e, t) {
                            if (!rc(e)) return !1;
                            if (t) {
                                var n = !0,
                                    r = !1,
                                    o = void 0;
                                try {
                                    for (var i, a = Object.keys(t)[Symbol.iterator](); !(n = (i = a.next()).done); n = !0) {
                                        var u = i.value;
                                        if (!rc(u)) return !1
                                    }
                                } catch (e) {
                                    r = !0, o = e
                                } finally {
                                    try {
                                        n || null == a.return || a.return()
                                    } finally {
                                        if (r) throw o
                                    }
                                }
                            }
                            return !0
                        }(l, u)) return void o("@rbx/web-telemetry: invalid event name or attribute key", {
                        name: a,
                        attributes: u
                    });
                    var c = null != s ? s : 1;
                    if (!Number.isFinite(c)) return void o("@rbx/web-telemetry: value must be a finite number", {
                        name: a,
                        attributes: u
                    });
                    var d = u && Object.keys(u).length > 0 ? u : void 0;
                    i.push({
                        name: l,
                        attributes: d,
                        value: c,
                        timestampMs: BigInt(Date.now())
                    }), i.length >= n ? (void 0 !== t && (clearTimeout(t), t = void 0), rv(i.splice(0, n))) : void 0 === t && (t = setTimeout(function() {
                        for (t = void 0; i.length > 0;) rv(i.splice(0, n))
                    }, r))
                }
        }(rR.featureName), "dotnet", {
            appType: !0
        });
    m(["Roblox", "Presence", "PresenceTypes"], {
        Offline: 0,
        Online: 1,
        InGame: 2,
        InStudio: 3
    }), m("RobloxPresence", {
        PresenceType: M,
        PresenceStatusIcon: function(e) {
            var t, n, r = e.userId,
                o = e.initialPresence,
                i = e.className,
                a = e.translate,
                u = tH(r, o),
                s = null != (t = null == u ? void 0 : u.userPresenceType) ? t : M.Offline,
                l = null != (n = null == u ? void 0 : u.lastLocation) ? n : "";
            a && s === M.Invisible && (l = a("Label.Invisible"));
            var c = ek.presenceStatusToClassName[s];
            return s !== M.Offline ? A().createElement("span", {
                "data-testid": "presence-icon",
                title: l,
                className: U(i, c, "icon-".concat(c))
            }) : null
        },
        PresenceStatusLabel: function(e) {
            var t, n, r = e.userId,
                o = e.translate,
                i = e.linkUrlGetter,
                a = e.linkClassNames,
                u = tH(r, void 0);
            if (u.userPresenceType === M.Offline) return o("Label.Offline");
            if (u.userPresenceType === M.Online) return o("Label.Online");
            if (u.userPresenceType === M.Game) {
                if (u.rootPlaceId) {
                    var s = i ? i(u.rootPlaceId) : "".concat(null == (n = null == (t = window.Roblox) ? void 0 : t.EnvironmentUrls) ? void 0 : n.websiteUrl, "/games/").concat(u.rootPlaceId);
                    return A().createElement("a", {
                        href: s,
                        className: U(null != a ? a : [])
                    }, u.lastLocation)
                }
                return o("Label.Online")
            }
            return u.userPresenceType === M.Studio ? u.lastLocation : u.userPresenceType === M.Invisible ? o("Label.Invisible") : void 0
        },
        usePresence: tH,
        getPresenceProvider: tG,
        presenceClient: tx
    }), (0, tQ.isAuthenticated)() && document.addEventListener("DOMContentLoaded", function() {
        if (b(y)) {
            var e;
            try {
                e = tW().GetClient()
            } catch (e) {
                throw rO("RealtimeStart", {
                    outcome: "failed"
                }), e
            }
            rO("RealtimeStart", {
                outcome: "started"
            }), nQ(e)
        }
    })
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected(document.currentScript && document.currentScript.getAttribute("data-bundlename") || "PresenceStatus");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/presenceStatus-da4a97a5b66df16d.js.map