! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "34e423b40e47f46f5c7cf2bc603524c06d614fa2"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "a4ada4cc-6dd4-40f9-9178-5844e5a3e105", e._sentryDebugIdIdentifier = "sentry-dbid-a4ada4cc-6dd4-40f9-9178-5844e5a3e105")
    } catch (e) {}
}(),
function() {
    "use strict";
    var e, t, n, r, o, i, a, u, s, l, c, d = {},
        p = {};

    function f(e) {
        var t = p[e];
        if (void 0 !== t) return t.exports;
        var n = p[e] = {
            exports: {}
        };
        return d[e](n, n.exports, f), n.exports
    }

    function v(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
        return r
    }

    function h(e, t) {
        if (e) {
            if ("string" == typeof e) return v(e, t);
            var n = Object.prototype.toString.call(e).slice(8, -1);
            if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return v(e, t)
        }
    }

    function y(e) {
        return function(e) {
            if (Array.isArray(e)) return v(e)
        }(e) || function(e) {
            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
        }(e) || h(e) || function() {
            throw TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }
    f.n = function(e) {
        var t = e && e.__esModule ? function() {
            return e.default
        } : function() {
            return e
        };
        return f.d(t, {
            a: t
        }), t
    }, f.d = function(e, t) {
        for (var n in t) f.o(t, n) && !f.o(e, n) && Object.defineProperty(e, n, {
            enumerable: !0,
            get: t[n]
        })
    }, f.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, f.rv = function() {
        return "1.7.12"
    }, f.ruid = "bundler=rspack@1.7.12";
    var m = ["Roblox", "core-scripts", "realtime"],
        b = function(e, t) {
            var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : window;
            if ("string" == typeof e) n[e] = t;
            else {
                var r = y(e),
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
        T = function(e) {
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

    function w(e, t) {
        return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
    }

    function g(e, t) {
        if (!w(e, t)) throw TypeError("Cannot call a class as a function")
    }

    function P(e, t) {
        for (var n = 0; n < t.length; n++) {
            var r = t[n];
            r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
        }
    }

    function E(e, t, n) {
        return t && P(e.prototype, t), n && P(e, n), e
    }

    function R(e, t, n) {
        return t in e ? Object.defineProperty(e, t, {
            value: n,
            enumerable: !0,
            configurable: !0,
            writable: !0
        }) : e[t] = n, e
    }

    function O(e) {
        for (var t = 1; t < arguments.length; t++) {
            var n = null != arguments[t] ? arguments[t] : {},
                r = Object.keys(n);
            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                return Object.getOwnPropertyDescriptor(n, e).enumerable
            }))), r.forEach(function(t) {
                R(e, t, n[t])
            })
        }
        return e
    }

    function S(e, t) {
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

    function I(e) {
        return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
    }
    var A = window.React,
        N = f.n(A);
    (_ = M || (M = {}))[_.Offline = 0] = "Offline", _[_.Online = 1] = "Online", _[_.Game = 2] = "Game", _[_.Studio = 3] = "Studio", _[_.Invisible = 4] = "Invisible";
    var _, M, C = M,
        L = {
            exports: {}
        },
        x = {}.hasOwnProperty;

    function U() {
        for (var e = [], t = 0; t < arguments.length; t++) {
            var n = arguments[t];
            if (n) {
                var r = void 0 === n ? "undefined" : I(n);
                if ("string" === r || "number" === r) e.push(n);
                else if (Array.isArray(n)) {
                    if (n.length) {
                        var o = U.apply(null, n);
                        o && e.push(o)
                    }
                } else if ("object" === r) {
                    if (n.toString !== Object.prototype.toString && !n.toString.toString().includes("[native code]")) {
                        e.push(n.toString());
                        continue
                    }
                    for (var i in n) x.call(n, i) && n[i] && e.push(i)
                }
            }
        }
        return e.join(" ")
    }
    L.exports ? (U.default = U, L.exports = U) : window.classNames = U;
    var F = (J = L.exports) && J.__esModule && Object.prototype.hasOwnProperty.call(J, "default") ? J.default : J,
        D = function(e, t) {
            return (D = Object.setPrototypeOf || w({
                __proto__: []
            }, Array) && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function k(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        D(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }
    var B = function() {
        return (B = Object.assign || function(e) {
            for (var t, n = 1, r = arguments.length; n < r; n++)
                for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
            return e
        }).apply(this, arguments)
    };

    function j(e, t, n, r) {
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
                e.done ? o(e.value) : (w(t = e.value, n) ? t : new n(function(e) {
                    e(t)
                })).then(a, u)
            }
            s((r = r.apply(e, t || [])).next())
        })
    }

    function V(e, t) {
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
                void 0 === e && (e = new G);
                var t = this;
                this.configuration = e, this.fetchApi = function(e, n) {
                    return j(t, void 0, void 0, function() {
                        var t, r, o, i, a, u, s, l, c;
                        return V(this, function(d) {
                            switch (d.label) {
                                case 0:
                                    t = {
                                        url: e,
                                        init: n
                                    }, r = 0, o = this.middleware, d.label = 1;
                                case 1:
                                    return r < o.length ? (c = o[r]).pre ? [4, c.pre(B({
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
                return j(this, void 0, void 0, function() {
                    var n, r, o, i;
                    return V(this, function(a) {
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
                var r, o = "u" > typeof FormData && w(e.body, FormData) || w(e.body, URLSearchParams) || (r = e.body, "u" > typeof Blob && w(r, Blob)) ? e.body : JSON.stringify(e.body),
                    i = Object.assign({}, this.configuration.headers, e.headers);
                return {
                    url: n,
                    init: B({
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
        z = function(e) {
            function t(t, n) {
                var r = e.call(this, n) || this;
                return r.field = t, r.name = "RequiredError", r
            }
            return k(t, e), t
        }(Error),
        G = function() {
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
                            if (w(i, Array)) {
                                var a = i.map(function(e) {
                                    return encodeURIComponent(String(e))
                                }).join("&".concat(encodeURIComponent(o), "="));
                                return "".concat(encodeURIComponent(o), "=").concat(a)
                            }
                            return w(i, Date) ? "".concat(encodeURIComponent(o), "=").concat(encodeURIComponent(i.toISOString())) : w(i, Object) ? e(i, o) : "".concat(encodeURIComponent(o), "=").concat(encodeURIComponent(String(i)))
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

    function H(e, t) {
        return null != e[t]
    }
    var J, W, Q, Y = function() {
            function e(e, t) {
                void 0 === t && (t = function(e) {
                    return e
                }), this.raw = e, this.transformer = t
            }
            return e.prototype.value = function() {
                return j(this, void 0, void 0, function() {
                    var e;
                    return V(this, function(t) {
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
        Z = "x-csrf-token",
        K = function() {
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
                return 403 === i.status && i.headers.has(Z) ? (this.currentToken = null != (t = i.headers.get(Z)) ? t : "", n(r, this.appendCSRFHeader(o))) : Promise.resolve(i)
            }, e.prototype.appendCSRFHeader = function(e) {
                var t;
                return B(B({}, e), {
                    headers: B(B({}, e.headers), ((t = {})[Z] = this.currentToken, t))
                })
            }, e
        }(),
        $ = function() {
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
    (W || (W = {})).LoadApi = "loadApi", (Q || (Q = {})).Time = "time";
    var X, ee = function(e) {
            void 0 === e && (e = {
                baseUrl: ""
            }), this.configuration = e, this.baseUrl = this.configuration.baseUrl
        },
        et = function() {
            function e(e) {
                void 0 === e && (e = new ee), this.configuration = e, this.baseUrl = e.baseUrl
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
        en = "Grasshopper",
        er = function() {
            function e(e) {
                var t;
                this.eventTracker = (t = new et(new ee({
                    baseUrl: "https://ecsv2.".concat(e, "/").concat(en)
                })), {
                    sendEvent: function(e) {
                        var n = {
                            target: en,
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
                    eventType: W.LoadApi,
                    context: Q.Time,
                    additionalProperties: {
                        elapsedTime: e.elapsedTime,
                        apiUrl: e.url,
                        statusCode: e.response.status
                    }
                })
            }, e
        }(),
        eo = new K,
        ei = new $,
        ea = function(e) {
            function t(t) {
                void 0 === t && (t = {});
                var n = B({}, t);
                if (Array.isArray(n.middleware) ? n.middleware.unshift(eo, ei) : n.middleware = [eo, ei], t.robloxSiteDomain) {
                    var r = new er(t.robloxSiteDomain);
                    n.middleware.unshift(r)
                }
                return e.call(this, n) || this
            }
            return k(t, e), t
        }(G);

    function eu(e) {
        return es(e)
    }

    function es(e, t) {
        return null == e ? e : {
            userIds: H(e, "userIds") ? e.userIds : void 0
        }
    }

    function el(e) {
        if (void 0 !== e) return null === e ? null : {
            userIds: e.userIds
        }
    }

    function ec(e) {
        return ed(e)
    }

    function ed(e, t) {
        return null == e ? e : {
            location: H(e, "location") ? e.location : void 0,
            placeId: H(e, "placeId") ? e.placeId : void 0,
            disconnect: H(e, "disconnect") ? e.disconnect : void 0
        }
    }

    function ep(e) {
        if (void 0 !== e) return null === e ? null : {
            location: e.location,
            placeId: e.placeId,
            disconnect: e.disconnect
        }
    }

    function ef(e) {
        return ev(e)
    }

    function ev(e, t) {
        return null == e ? e : {
            isInvisible: H(e, "isInvisible") ? e.isInvisible : void 0
        }
    }

    function eh(e) {
        if (void 0 !== e) return null === e ? null : {
            isInvisible: e.isInvisible
        }
    }

    function ey(e) {
        return em(e)
    }

    function em(e, t) {
        return null == e ? e : {
            userIds: H(e, "userIds") ? e.userIds : void 0
        }
    }

    function eb(e) {
        if (void 0 !== e) return null === e ? null : {
            userIds: e.userIds
        }
    }

    function eT(e) {
        return ew(e)
    }

    function ew(e, t) {
        return null == e ? e : {
            userId: H(e, "userId") ? e.userId : void 0,
            lastOnline: H(e, "lastOnline") ? new Date(e.lastOnline) : void 0
        }
    }

    function eg(e) {
        if (void 0 !== e) return null === e ? null : {
            userId: e.userId,
            lastOnline: void 0 === e.lastOnline ? void 0 : e.lastOnline.toISOString()
        }
    }

    function eP(e) {
        return eE(e)
    }

    function eE(e, t) {
        return null == e ? e : {
            lastOnlineTimestamps: H(e, "lastOnlineTimestamps") ? e.lastOnlineTimestamps.map(eT) : void 0
        }
    }

    function eR(e) {
        if (void 0 !== e) return null === e ? null : {
            lastOnlineTimestamps: void 0 === e.lastOnlineTimestamps ? void 0 : e.lastOnlineTimestamps.map(eg)
        }
    }

    function eO(e) {
        return eS(e)
    }

    function eS(e, t) {
        return null == e ? e : {
            userPresenceType: H(e, "userPresenceType") ? e.userPresenceType : void 0,
            lastLocation: H(e, "lastLocation") ? e.lastLocation : void 0,
            placeId: H(e, "placeId") ? e.placeId : void 0,
            rootPlaceId: H(e, "rootPlaceId") ? e.rootPlaceId : void 0,
            gameId: H(e, "gameId") ? e.gameId : void 0,
            universeId: H(e, "universeId") ? e.universeId : void 0,
            userId: H(e, "userId") ? e.userId : void 0,
            lastOnline: H(e, "lastOnline") ? new Date(e.lastOnline) : void 0,
            invisibleModeExpiry: H(e, "invisibleModeExpiry") ? new Date(e.invisibleModeExpiry) : void 0
        }
    }

    function eI(e) {
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

    function eA(e) {
        return eN(e)
    }

    function eN(e, t) {
        return null == e ? e : {
            userPresences: H(e, "userPresences") ? e.userPresences.map(eO) : void 0
        }
    }

    function e_(e) {
        if (void 0 !== e) return null === e ? null : {
            userPresences: void 0 === e.userPresences ? void 0 : e.userPresences.map(eI)
        }
    }(eM = X || (X = {}))[eM.NUMBER_0 = 0] = "NUMBER_0", eM[eM.NUMBER_1 = 1] = "NUMBER_1", eM[eM.NUMBER_2 = 2] = "NUMBER_2", eM[eM.NUMBER_3 = 3] = "NUMBER_3", eM[eM.NUMBER_4 = 4] = "NUMBER_4";
    var eM, eC, eL, ex, eU = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return k(t, e), t.prototype.v1PresenceLastOnlinePostRaw = function(e, t) {
                return j(this, void 0, void 0, function() {
                    var n, r;
                    return V(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.lastOnlineRequest || void 0 === e.lastOnlineRequest) throw new z("lastOnlineRequest", "Required parameter requestParameters.lastOnlineRequest was null or undefined when calling v1PresenceLastOnlinePost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/presence/last-online",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: el(e.lastOnlineRequest)
                                }, t)];
                            case 1:
                                return [2, new Y(o.sent(), function(e) {
                                    return eP(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1PresenceLastOnlinePost = function(e, t) {
                return j(this, void 0, void 0, function() {
                    return V(this, function(n) {
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
                return j(this, void 0, void 0, function() {
                    var n, r;
                    return V(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.registerAppPresenceRequest || void 0 === e.registerAppPresenceRequest) throw new z("registerAppPresenceRequest", "Required parameter requestParameters.registerAppPresenceRequest was null or undefined when calling v1PresenceRegisterAppPresencePost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/presence/register-app-presence",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: ep(e.registerAppPresenceRequest)
                                }, t)];
                            case 1:
                                return [2, new Y(o.sent())]
                        }
                    })
                })
            }, t.prototype.v1PresenceRegisterAppPresencePost = function(e, t) {
                return j(this, void 0, void 0, function() {
                    return V(this, function(n) {
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
                return j(this, void 0, void 0, function() {
                    var n, r;
                    return V(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.setInvisibilityRequest || void 0 === e.setInvisibilityRequest) throw new z("setInvisibilityRequest", "Required parameter requestParameters.setInvisibilityRequest was null or undefined when calling v1PresenceSetInvisibilityStatusPost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/presence/set-invisibility-status",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: eh(e.setInvisibilityRequest)
                                }, t)];
                            case 1:
                                return [2, new Y(o.sent())]
                        }
                    })
                })
            }, t.prototype.v1PresenceSetInvisibilityStatusPost = function(e, t) {
                return j(this, void 0, void 0, function() {
                    return V(this, function(n) {
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
                return j(this, void 0, void 0, function() {
                    var n, r;
                    return V(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.userPresenceRequest || void 0 === e.userPresenceRequest) throw new z("userPresenceRequest", "Required parameter requestParameters.userPresenceRequest was null or undefined when calling v1PresenceUsersPost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/presence/users",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: eb(e.userPresenceRequest)
                                }, t)];
                            case 1:
                                return [2, new Y(o.sent(), function(e) {
                                    return eA(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1PresenceUsersPost = function(e, t) {
                return j(this, void 0, void 0, function() {
                    return V(this, function(n) {
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
        eF = Object.freeze({
            __proto__: null,
            PresenceApi: eU,
            RobloxPresenceApiModelsRequestLastOnlineRequestFromJSON: eu,
            RobloxPresenceApiModelsRequestLastOnlineRequestFromJSONTyped: es,
            RobloxPresenceApiModelsRequestLastOnlineRequestToJSON: el,
            RobloxPresenceApiModelsRequestRegisterAppPresenceRequestFromJSON: ec,
            RobloxPresenceApiModelsRequestRegisterAppPresenceRequestFromJSONTyped: ed,
            RobloxPresenceApiModelsRequestRegisterAppPresenceRequestToJSON: ep,
            RobloxPresenceApiModelsRequestSetInvisibilityStatusRequestFromJSON: ef,
            RobloxPresenceApiModelsRequestSetInvisibilityStatusRequestFromJSONTyped: ev,
            RobloxPresenceApiModelsRequestSetInvisibilityStatusRequestToJSON: eh,
            RobloxPresenceApiModelsRequestUserPresenceRequestFromJSON: ey,
            RobloxPresenceApiModelsRequestUserPresenceRequestFromJSONTyped: em,
            RobloxPresenceApiModelsRequestUserPresenceRequestToJSON: eb,
            RobloxPresenceApiModelsResponseLastOnlineFromJSON: eT,
            RobloxPresenceApiModelsResponseLastOnlineFromJSONTyped: ew,
            RobloxPresenceApiModelsResponseLastOnlineResponseFromJSON: eP,
            RobloxPresenceApiModelsResponseLastOnlineResponseFromJSONTyped: eE,
            RobloxPresenceApiModelsResponseLastOnlineResponseToJSON: eR,
            RobloxPresenceApiModelsResponseLastOnlineToJSON: eg,
            RobloxPresenceApiModelsResponseUserPresenceFromJSON: eO,
            RobloxPresenceApiModelsResponseUserPresenceFromJSONTyped: eS,
            RobloxPresenceApiModelsResponseUserPresenceToJSON: eI,
            get RobloxPresenceApiModelsResponseUserPresenceUserPresenceTypeEnum() {
                return X
            },
            RobloxPresenceApiModelsResponseUserPresencesResponseFromJSON: eA,
            RobloxPresenceApiModelsResponseUserPresencesResponseFromJSONTyped: eN,
            RobloxPresenceApiModelsResponseUserPresencesResponseToJSON: e_
        }),
        eD = Object.freeze({
            __proto__: null,
            PresenceApi: eU,
            RobloxPresenceApiModelsRequestLastOnlineRequestFromJSON: eu,
            RobloxPresenceApiModelsRequestLastOnlineRequestFromJSONTyped: es,
            RobloxPresenceApiModelsRequestLastOnlineRequestToJSON: el,
            RobloxPresenceApiModelsRequestRegisterAppPresenceRequestFromJSON: ec,
            RobloxPresenceApiModelsRequestRegisterAppPresenceRequestFromJSONTyped: ed,
            RobloxPresenceApiModelsRequestRegisterAppPresenceRequestToJSON: ep,
            RobloxPresenceApiModelsRequestSetInvisibilityStatusRequestFromJSON: ef,
            RobloxPresenceApiModelsRequestSetInvisibilityStatusRequestFromJSONTyped: ev,
            RobloxPresenceApiModelsRequestSetInvisibilityStatusRequestToJSON: eh,
            RobloxPresenceApiModelsRequestUserPresenceRequestFromJSON: ey,
            RobloxPresenceApiModelsRequestUserPresenceRequestFromJSONTyped: em,
            RobloxPresenceApiModelsRequestUserPresenceRequestToJSON: eb,
            RobloxPresenceApiModelsResponseLastOnlineFromJSON: eT,
            RobloxPresenceApiModelsResponseLastOnlineFromJSONTyped: ew,
            RobloxPresenceApiModelsResponseLastOnlineResponseFromJSON: eP,
            RobloxPresenceApiModelsResponseLastOnlineResponseFromJSONTyped: eE,
            RobloxPresenceApiModelsResponseLastOnlineResponseToJSON: eR,
            RobloxPresenceApiModelsResponseLastOnlineToJSON: eg,
            RobloxPresenceApiModelsResponseUserPresenceFromJSON: eO,
            RobloxPresenceApiModelsResponseUserPresenceFromJSONTyped: eS,
            RobloxPresenceApiModelsResponseUserPresenceToJSON: eI,
            get RobloxPresenceApiModelsResponseUserPresenceUserPresenceTypeEnum() {
                return X
            },
            RobloxPresenceApiModelsResponseUserPresencesResponseFromJSON: eA,
            RobloxPresenceApiModelsResponseUserPresencesResponseFromJSONTyped: eN,
            RobloxPresenceApiModelsResponseUserPresencesResponseToJSON: e_,
            v1: eF
        }),
        ek = eD.v1.RobloxPresenceApiModelsResponseUserPresenceUserPresenceTypeEnum,
        eB = {
            presenceStatusToClassName: ((eC = {})[C.Offline] = "", eC[C.Online] = "online", eC[C.Game] = "game", eC[C.Studio] = "studio", eC[C.Invisible] = "invisible-mode", eC),
            presenceStatusResponseToPresenceStatus: ((eL = {})[ek.NUMBER_0] = C.Offline, eL[ek.NUMBER_1] = C.Online, eL[ek.NUMBER_2] = C.Game, eL[ek.NUMBER_3] = C.Studio, eL[ek.NUMBER_4] = C.Invisible, eL)
        };

    function ej(e, t, n, r) {
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
                e.done ? o(e.value) : (w(t = e.value, n) ? t : new n(function(e) {
                    e(t)
                })).then(a, u)
            }
            s((r = r.apply(e, t || [])).next())
        })
    }

    function eV(e, t) {
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
    "function" == typeof SuppressedError && SuppressedError, (ez = ex || (ex = {})).Strict = "strict", ez.Lax = "lax", ez.None = "none";
    var ez, eG, eH, eJ, eW, eQ, eY, eZ, eK, e$, eX, e0, e1 = function() {
        return (e1 = Object.assign || function(e) {
            for (var t, n = 1, r = arguments.length; n < r; n++)
                for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
            return e
        }).apply(this, arguments)
    };
    "function" == typeof SuppressedError && SuppressedError, (tb = eG || (eG = {})).PagingParametersChanged = "Paging parameters were changed", tb.GetItemsFailure = "Unable to get items", tb.InvalidPageNumber = "Invalid page number", (tT = eH || (eH = {}))[tT.Initialized = 0] = "Initialized", tT[tT.Idle = 1] = "Idle", tT[tT.Loading = 2] = "Loading", (tw = eJ || (eJ = {})).Asc = "Asc", tw.Desc = "Desc", "RelativeTimeFormat" in Intl || function() {
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
                            return tm
                        })];
                    case 1:
                        return e.sent(), [4, Promise.resolve().then(function() {
                            return tx
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
                e.done ? o(e.value) : (w(t = e.value, n) ? t : new n(function(e) {
                    e(t)
                })).then(a, u)
            }
            s((r = r.apply(e, t || [])).next())
        })
    }(), (tg = eW || (eW = {})).Edge = "edge", tg.IE = "ie", tg.Chrome = "chrome", tg.Opera = "opera", tg.Safari = "safari", tg.Firefox = "firefox", tg.Unknown = "", (tP = eQ || (eQ = {}))[tP.Windows = 0] = "Windows", tP[tP.macOS = 1] = "macOS", tP[tP.Linux = 2] = "Linux", tP[tP.Unix = 3] = "Unix", tP[tP.iOS = 4] = "iOS", tP[tP.Android = 5] = "Android", tP[tP.Unknown = 6] = "Unknown", (tE = eY || (eY = {})).Unidentified = "Unidentified", tE.Alt = "Alt", tE.AltGraph = "AltGraph", tE.CapsLock = "CapsLock", tE.Control = "Control", tE.Fn = "Fn", tE.FnLock = "FnLock", tE.Hyper = "Hyper", tE.Meta = "Meta", tE.NumLock = "NumLock", tE.ScrollLock = "ScrollLock", tE.Shift = "Shift", tE.Super = "Super", tE.Symbol = "Symbol", tE.SymbolLock = "SymbolLock", tE.Enter = "Enter", tE.Tab = "Tab", tE.ArrowDown = "ArrowDown", tE.ArrowLeft = "ArrowLeft", tE.ArrowRight = "ArrowRight", tE.ArrowUp = "ArrowUp", tE.End = "End", tE.Home = "Home", tE.PageDown = "PageDown", tE.PageUp = "PageUp", tE.Backspace = "Backspace", tE.Clear = "Clear", tE.Copy = "Copy", tE.CrSel = "CrSel", tE.Cut = "Cut", tE.Delete = "Delete", tE.EraseEof = "EraseEof", tE.ExSel = "ExSel", tE.Insert = "Insert", tE.Paste = "Paste", tE.Redo = "Redo", tE.Undo = "Undo", tE.Accept = "Accept", tE.Again = "Again", tE.Attn = "Attn", tE.Cancel = "Cancel", tE.ContextMenu = "ContextMenu", tE.Escape = "Escape", tE.Execute = "Execute", tE.Find = "Find", tE.Finish = "Finish", tE.Help = "Help", tE.Pause = "Pause", tE.Play = "Play", tE.Props = "Props", tE.Select = "Select", tE.ZoomIn = "ZoomIn", tE.ZoomOut = "ZoomOut", tE.BrightnessDown = "BrightnessDown", tE.BrightnessUp = "BrightnessUp", tE.Eject = "Eject", tE.LogOff = "LogOff", tE.Power = "Power", tE.PowerOff = "PowerOff", tE.PrintScreen = "PrintScreen", tE.Hibernate = "Hibernate", tE.Standby = "Standby", tE.WakeUp = "WakeUp", tE.AllCandidates = "AllCandidates", tE.Alphanumeric = "Alphanumeric", tE.CodeInput = "CodeInput", tE.Compose = "Compose", tE.Convert = "Convert", tE.Dead = "Dead", tE.FinalMode = "FinalMode", tE.GroupFirst = "GroupFirst", tE.GroupLast = "GroupLast", tE.GroupNext = "GroupNext", tE.GroupPrevious = "GroupPrevious", tE.ModeChange = "ModeChange", tE.NextCandidate = "NextCandidate", tE.NonConvert = "NonConvert", tE.PreviousCandidate = "PreviousCandidate", tE.Process = "Process", tE.SingleCandidate = "SingleCandidate", tE.HangulMode = "HangulMode", tE.HanjaMode = "HanjaMode", tE.JunjaMode = "JunjaMode", tE.Eisu = "Eisu", tE.Hankaku = "Hankaku", tE.Hiragana = "Hiragana", tE.HiraganaKatakana = "HiraganaKatakana", tE.KanaMode = "KanaMode", tE.KanjiMode = "KanjiMode", tE.Katakana = "Katakana", tE.Romaji = "Romaji", tE.Zenkaku = "Zenkaku", tE.ZenkakuHanaku = "ZenkakuHanaku", tE.F1 = "F1", tE.F2 = "F2", tE.F3 = "F3", tE.F4 = "F4", tE.F5 = "F5", tE.F6 = "F6", tE.F7 = "F7", tE.F8 = "F8", tE.F9 = "F9", tE.F10 = "F10", tE.F11 = "F11", tE.F12 = "F12", tE.F13 = "F13", tE.F14 = "F14", tE.F15 = "F15", tE.F16 = "F16", tE.F17 = "F17", tE.F18 = "F18", tE.F19 = "F19", tE.F20 = "F20", tE.Soft1 = "Soft1", tE.Soft2 = "Soft2", tE.Soft3 = "Soft3", tE.Soft4 = "Soft4", tE.AppSwitch = "AppSwitch", tE.Call = "Call", tE.Camera = "Camera", tE.CameraFocus = "CameraFocus", tE.EndCall = "EndCall", tE.GoBack = "GoBack", tE.GoHome = "GoHome", tE.HeadsetHook = "HeadsetHook", tE.LastNumberRedial = "LastNumberRedial", tE.Notification = "Notification", tE.MannerMode = "MannerMode", tE.VoiceDial = "VoiceDial", tE.ChannelDown = "ChannelDown", tE.ChannelUp = "ChannelUp", tE.MediaFastForward = "MediaFastForward", tE.MediaPause = "MediaPause", tE.MediaPlay = "MediaPlay", tE.MediaPlayPause = "MediaPlayPause", tE.MediaRecord = "MediaRecord", tE.MediaRewind = "MediaRewind", tE.MediaStop = "MediaStop", tE.MediaTrackNext = "MediaTrackNext", tE.MediaTrackPrevious = "MediaTrackPrevious", tE.AudioBalanceLeft = "AudioBalanceLeft", tE.AudioBalanceRight = "AudioBalanceRight", tE.AudioBassDown = "AudioBassDown", tE.AudioBassBoostDown = "AudioBassBoostDown", tE.AudioBassBoostToggle = "AudioBassBoostToggle", tE.AudioBassBoostUp = "AudioBassBoostUp", tE.AudioBassUp = "AudioBassUp", tE.AudioFaderFront = "AudioFaderFront", tE.AudioFaderRear = "AudioFaderRear", tE.AudioSurroundModeNext = "AudioSurroundModeNext", tE.AudioTrebleDown = "AudioTrebleDown", tE.AudioTrebleUp = "AudioTrebleUp", tE.AudioVolumeDown = "AudioVolumeDown", tE.AudioVolumeMute = "AudioVolumeMute", tE.AudioVolumeUp = "AudioVolumeUp", tE.MicrophoneToggle = "MicrophoneToggle", tE.MicrophoneVolumeDown = "MicrophoneVolumeDown", tE.MicrophoneVolumeMute = "MicrophoneVolumeMute", tE.MicrophoneVolumeUp = "MicrophoneVolumeUp", tE.TV = "TV", tE.TV3DMode = "TV3DMode", tE.TVAntennaCable = "TVAntennaCable", tE.TVAudioDescription = "TVAudioDescription", tE.TVAudioDescriptionMixDown = "TVAudioDescriptionMixDown", tE.TVAudioDescriptionMixUp = "TVAudioDescriptionMixUp", tE.TVContentsMenu = "TVContentsMenu", tE.TVDataService = "TVDataService", tE.TVInput = "TVInput", tE.TVInputComponent1 = "TVInputComponent1", tE.TVInputComponent2 = "TVInputComponent2", tE.TVInputComposite1 = "TVInputComposite1", tE.TVInputComposite2 = "TVInputComposite2", tE.TVInputHDMI1 = "TVInputHDMI1", tE.TVInputHDMI2 = "TVInputHDMI2", tE.TVInputHDMI3 = "TVInputHDMI3", tE.TVInputHDMI4 = "TVInputHDMI4", tE.TVInputVGA1 = "TVInputVGA1", tE.TVMediaContext = "TVMediaContext", tE.TVNetwork = "TVNetwork", tE.TVNumberEntry = "TVNumberEntry", tE.TVPower = "TVPower", tE.TVRadioService = "TVRadioService", tE.TVSatellite = "TVSatellite", tE.TVSatelliteBS = "TVSatelliteBS", tE.TVSatelliteCS = "TVSatelliteCS", tE.TVSatelliteToggle = "TVSatelliteToggle", tE.TVTerrestrialAnalog = "TVTerrestrialAnalog", tE.TVTerrestrialDigital = "TVTerrestrialDigital", tE.TVTimer = "TVTimer", tE.AVRInput = "AVRInput", tE.AVRPower = "AVRPower", tE.ColorF0Red = "ColorF0Red", tE.ColorF1Green = "ColorF1Green", tE.ColorF2Yellow = "ColorF2Yellow", tE.ColorF3Blue = "ColorF3Blue", tE.ColorF4Grey = "ColorF4Grey", tE.ColorF5Brown = "ColorF5Brown", tE.ClosedCaptionToggle = "ClosedCaptionToggle", tE.Dimmer = "Dimmer", tE.DisplaySwap = "DisplaySwap", tE.DVR = "DVR", tE.Exit = "Exit", tE.FavoriteClear0 = "FavoriteClear0", tE.FavoriteClear1 = "FavoriteClear1", tE.FavoriteClear2 = "FavoriteClear2", tE.FavoriteClear3 = "FavoriteClear3", tE.FavoriteRecall0 = "FavoriteRecall0", tE.FavoriteRecall1 = "FavoriteRecall1", tE.FavoriteRecall2 = "FavoriteRecall2", tE.FavoriteRecall3 = "FavoriteRecall3", tE.FavoriteStore0 = "FavoriteStore0", tE.FavoriteStore1 = "FavoriteStore1", tE.FavoriteStore2 = "FavoriteStore2", tE.FavoriteStore3 = "FavoriteStore3", tE.Guide = "Guide", tE.GuideNextDay = "GuideNextDay", tE.GuidePreviousDay = "GuidePreviousDay", tE.Info = "Info", tE.InstantReplay = "InstantReplay", tE.Link = "Link", tE.ListProgram = "ListProgram", tE.LiveContent = "LiveContent", tE.Lock = "Lock", tE.MediaApps = "MediaApps", tE.MediaAudioTrack = "MediaAudioTrack", tE.MediaLast = "MediaLast", tE.MediaSkipBackward = "MediaSkipBackward", tE.MediaSkipForward = "MediaSkipForward", tE.MediaStepBackward = "MediaStepBackward", tE.MediaStepForward = "MediaStepForward", tE.MediaTopMenu = "MediaTopMenu", tE.NavigateIn = "NavigateIn", tE.NavigateNext = "NavigateNext", tE.NavigateOut = "NavigateOut", tE.NavigatePrevious = "NavigatePrevious", tE.NextFavoriteChannel = "NextFavoriteChannel", tE.NextUserProfile = "NextUserProfile", tE.OnDemand = "OnDemand", tE.Pairing = "Pairing", tE.PinPDown = "PinPDown", tE.PinPMove = "PinPMove", tE.PinPToggle = "PinPToggle", tE.PinPUp = "PinPUp", tE.PlaySpeedDown = "PlaySpeedDown", tE.PlaySpeedReset = "PlaySpeedReset", tE.PlaySpeedUp = "PlaySpeedUp", tE.RandomToggle = "RandomToggle", tE.RcLowBattery = "RcLowBattery", tE.RecordSpeedNext = "RecordSpeedNext", tE.RfBypass = "RfBypass", tE.ScanChannelsToggle = "ScanChannelsToggle", tE.ScreenModeNext = "ScreenModeNext", tE.Settings = "Settings", tE.SplitScreenToggle = "SplitScreenToggle", tE.STBInput = "STBInput", tE.STBPower = "STBPower", tE.Subtitle = "Subtitle", tE.Teletext = "Teletext", tE.VideoModeNext = "VideoModeNext", tE.Wink = "Wink", tE.ZoomToggle = "ZoomToggle", tE.SpeechCorrectionList = "SpeechCorrectionList", tE.SpeechInputToggle = "SpeechInputToggle", tE.Close = "Close", tE.New = "New", tE.Open = "Open", tE.Print = "Print", tE.Save = "Save", tE.SpellCheck = "SpellCheck", tE.MailForward = "MailForward", tE.MailReply = "MailReply", tE.MailSend = "MailSend", tE.LaunchCalculator = "LaunchCalculator", tE.LaunchCalendar = "LaunchCalendar", tE.LaunchContacts = "LaunchContacts", tE.LaunchMail = "LaunchMail", tE.LaunchMediaPlayer = "LaunchMediaPlayer", tE.LaunchMusicPlayer = "LaunchMusicPlayer", tE.LaunchMyComputer = "LaunchMyComputer", tE.LaunchPhone = "LaunchPhone", tE.LaunchScreenSaver = "LaunchScreenSaver", tE.LaunchSpreadsheet = "LaunchSpreadsheet", tE.LaunchWebBrowser = "LaunchWebBrowser", tE.LaunchWebCam = "LaunchWebCam", tE.LaunchWordProcessor = "LaunchWordProcessor", tE.LaunchApplication1 = "LaunchApplication1", tE.LaunchApplication2 = "LaunchApplication2", tE.LaunchApplication3 = "LaunchApplication3", tE.LaunchApplication4 = "LaunchApplication4", tE.LaunchApplication5 = "LaunchApplication5", tE.LaunchApplication6 = "LaunchApplication6", tE.LaunchApplication7 = "LaunchApplication7", tE.LaunchApplication8 = "LaunchApplication8", tE.LaunchApplication9 = "LaunchApplication9", tE.LaunchApplication10 = "LaunchApplication10", tE.LaunchApplication11 = "LaunchApplication11", tE.LaunchApplication12 = "LaunchApplication12", tE.LaunchApplication13 = "LaunchApplication13", tE.LaunchApplication14 = "LaunchApplication14", tE.LaunchApplication15 = "LaunchApplication15", tE.LaunchApplication16 = "LaunchApplication16", tE.BrowserBack = "BrowserBack", tE.BrowserFavorites = "BrowserFavorites", tE.BrowserForward = "BrowserForward", tE.BrowserHome = "BrowserHome", tE.BrowserRefresh = "BrowserRefresh", tE.BrowserSearch = "BrowserSearch", tE.BrowserStop = "BrowserStop", tE.Decimal = "Decimal", tE.Key11 = "Key11", tE.Key12 = "Key12", tE.Multiply = "Multiply", tE.Add = "Add", tE.Divide = "Divide", tE.Subtract = "Subtract", tE.Separator = "Separator", (tR = eZ || (eZ = {}))[tR.ACCEPTED = 202] = "ACCEPTED", tR[tR.BAD_GATEWAY = 502] = "BAD_GATEWAY", tR[tR.BAD_REQUEST = 400] = "BAD_REQUEST", tR[tR.CONFLICT = 409] = "CONFLICT", tR[tR.CONTINUE = 100] = "CONTINUE", tR[tR.CREATED = 201] = "CREATED", tR[tR.EXPECTATION_FAILED = 417] = "EXPECTATION_FAILED", tR[tR.FAILED_DEPENDENCY = 424] = "FAILED_DEPENDENCY", tR[tR.FORBIDDEN = 403] = "FORBIDDEN", tR[tR.GATEWAY_TIMEOUT = 504] = "GATEWAY_TIMEOUT", tR[tR.GONE = 410] = "GONE", tR[tR.HTTP_VERSION_NOT_SUPPORTED = 505] = "HTTP_VERSION_NOT_SUPPORTED", tR[tR.IM_A_TEAPOT = 418] = "IM_A_TEAPOT", tR[tR.INSUFFICIENT_SPACE_ON_RESOURCE = 419] = "INSUFFICIENT_SPACE_ON_RESOURCE", tR[tR.INSUFFICIENT_STORAGE = 507] = "INSUFFICIENT_STORAGE", tR[tR.INTERNAL_SERVER_ERROR = 500] = "INTERNAL_SERVER_ERROR", tR[tR.LENGTH_REQUIRED = 411] = "LENGTH_REQUIRED", tR[tR.LOCKED = 423] = "LOCKED", tR[tR.METHOD_FAILURE = 420] = "METHOD_FAILURE", tR[tR.METHOD_NOT_ALLOWED = 405] = "METHOD_NOT_ALLOWED", tR[tR.MOVED_PERMANENTLY = 301] = "MOVED_PERMANENTLY", tR[tR.MOVED_TEMPORARILY = 302] = "MOVED_TEMPORARILY", tR[tR.MULTI_STATUS = 207] = "MULTI_STATUS", tR[tR.MULTIPLE_CHOICES = 300] = "MULTIPLE_CHOICES", tR[tR.NETWORK_AUTHENTICATION_REQUIRED = 511] = "NETWORK_AUTHENTICATION_REQUIRED", tR[tR.NO_CONTENT = 204] = "NO_CONTENT", tR[tR.NON_AUTHORITATIVE_INFORMATION = 203] = "NON_AUTHORITATIVE_INFORMATION", tR[tR.NOT_ACCEPTABLE = 406] = "NOT_ACCEPTABLE", tR[tR.NOT_FOUND = 404] = "NOT_FOUND", tR[tR.NOT_IMPLEMENTED = 501] = "NOT_IMPLEMENTED", tR[tR.NOT_MODIFIED = 304] = "NOT_MODIFIED", tR[tR.OK = 200] = "OK", tR[tR.PARTIAL_CONTENT = 206] = "PARTIAL_CONTENT", tR[tR.PAYMENT_REQUIRED = 402] = "PAYMENT_REQUIRED", tR[tR.PERMANENT_REDIRECT = 308] = "PERMANENT_REDIRECT", tR[tR.PRECONDITION_FAILED = 412] = "PRECONDITION_FAILED", tR[tR.PRECONDITION_REQUIRED = 428] = "PRECONDITION_REQUIRED", tR[tR.PROCESSING = 102] = "PROCESSING", tR[tR.PROXY_AUTHENTICATION_REQUIRED = 407] = "PROXY_AUTHENTICATION_REQUIRED", tR[tR.REQUEST_HEADER_FIELDS_TOO_LARGE = 431] = "REQUEST_HEADER_FIELDS_TOO_LARGE", tR[tR.REQUEST_TIMEOUT = 408] = "REQUEST_TIMEOUT", tR[tR.REQUEST_TOO_LONG = 413] = "REQUEST_TOO_LONG", tR[tR.REQUEST_URI_TOO_LONG = 414] = "REQUEST_URI_TOO_LONG", tR[tR.REQUESTED_RANGE_NOT_SATISFIABLE = 416] = "REQUESTED_RANGE_NOT_SATISFIABLE", tR[tR.RESET_CONTENT = 205] = "RESET_CONTENT", tR[tR.SEE_OTHER = 303] = "SEE_OTHER", tR[tR.SERVICE_UNAVAILABLE = 503] = "SERVICE_UNAVAILABLE", tR[tR.SWITCHING_PROTOCOLS = 101] = "SWITCHING_PROTOCOLS", tR[tR.TEMPORARY_REDIRECT = 307] = "TEMPORARY_REDIRECT", tR[tR.TOO_MANY_REQUESTS = 429] = "TOO_MANY_REQUESTS", tR[tR.UNAUTHORIZED = 401] = "UNAUTHORIZED", tR[tR.UNAVAILABLE_FOR_LEGAL_REASONS = 451] = "UNAVAILABLE_FOR_LEGAL_REASONS", tR[tR.UNPROCESSABLE_ENTITY = 422] = "UNPROCESSABLE_ENTITY", tR[tR.UNSUPPORTED_MEDIA_TYPE = 415] = "UNSUPPORTED_MEDIA_TYPE", tR[tR.USE_PROXY = 305] = "USE_PROXY", (tO = eK || (eK = {})).ACCEPTED = "Accepted", tO.BAD_GATEWAY = "Bad Gateway", tO.BAD_REQUEST = "Bad Request", tO.CONFLICT = "Conflict", tO.CONTINUE = "Continue", tO.CREATED = "Created", tO.EXPECTATION_FAILED = "Expectation Failed", tO.FAILED_DEPENDENCY = "Failed Dependency", tO.FORBIDDEN = "Forbidden", tO.GATEWAY_TIMEOUT = "Gateway Timeout", tO.GONE = "Gone", tO.HTTP_VERSION_NOT_SUPPORTED = "HTTP Version Not Supported", tO.IM_A_TEAPOT = "I'm a teapot", tO.INSUFFICIENT_SPACE_ON_RESOURCE = "Insufficient Space on Resource", tO.INSUFFICIENT_STORAGE = "Insufficient Storage", tO.INTERNAL_SERVER_ERROR = "Internal Server Error", tO.LENGTH_REQUIRED = "Length Required", tO.LOCKED = "Locked", tO.METHOD_FAILURE = "Method Failure", tO.METHOD_NOT_ALLOWED = "Method Not Allowed", tO.MOVED_PERMANENTLY = "Moved Permanently", tO.MOVED_TEMPORARILY = "Moved Temporarily", tO.MULTI_STATUS = "Multi-Status", tO.MULTIPLE_CHOICES = "Multiple Choices", tO.NETWORK_AUTHENTICATION_REQUIRED = "Network Authentication Required", tO.NO_CONTENT = "No Content", tO.NON_AUTHORITATIVE_INFORMATION = "Non Authoritative Information", tO.NOT_ACCEPTABLE = "Not Acceptable", tO.NOT_FOUND = "Not Found", tO.NOT_IMPLEMENTED = "Not Implemented", tO.NOT_MODIFIED = "Not Modified", tO.OK = "OK", tO.PARTIAL_CONTENT = "Partial Content", tO.PAYMENT_REQUIRED = "Payment Required", tO.PERMANENT_REDIRECT = "Permanent Redirect", tO.PRECONDITION_FAILED = "Precondition Failed", tO.PRECONDITION_REQUIRED = "Precondition Required", tO.PROCESSING = "Processing", tO.PROXY_AUTHENTICATION_REQUIRED = "Proxy Authentication Required", tO.REQUEST_HEADER_FIELDS_TOO_LARGE = "Request Header Fields Too Large", tO.REQUEST_TIMEOUT = "Request Timeout", tO.REQUEST_TOO_LONG = "Request Entity Too Large", tO.REQUEST_URI_TOO_LONG = "Request-URI Too Long", tO.REQUESTED_RANGE_NOT_SATISFIABLE = "Requested Range Not Satisfiable", tO.RESET_CONTENT = "Reset Content", tO.SEE_OTHER = "See Other", tO.SERVICE_UNAVAILABLE = "Service Unavailable", tO.SWITCHING_PROTOCOLS = "Switching Protocols", tO.TEMPORARY_REDIRECT = "Temporary Redirect", tO.TOO_MANY_REQUESTS = "Too Many Requests", tO.UNAUTHORIZED = "Unauthorized", tO.UNAVAILABLE_FOR_LEGAL_REASONS = "Unavailable For Legal Reasons", tO.UNPROCESSABLE_ENTITY = "Unprocessable Entity", tO.UNSUPPORTED_MEDIA_TYPE = "Unsupported Media Type", tO.USE_PROXY = "Use Proxy", (tS = e$ || (e$ = {})).CONNECT = "CONNECT", tS.DELETE = "DELETE", tS.GET = "GET", tS.HEAD = "HEAD", tS.OPTIONS = "OPTIONS", tS.PATCH = "PATCH", tS.POST = "POST", tS.PUT = "PUT", tS.TRACE = "TRACE", (tI = eX || (eX = {})).withPlus = "withPlus", tI.withoutPlus = "withoutPlus", (tA = e0 || (e0 = {})).processFailure = "processFailure", tA.unretriableFailure = "unretriableFailure", tA.maxAttemptsReached = "maxAttemptsReached";
    for (var e2 = function(e, t) {
            return function(n) {
                return Math.min(t, Math.pow(2, n - 1) * e)
            }
        }, e4 = function() {
            function e() {
                this.completeItems = new Map, this.requestQueue = [], this.runningBatchCount = 0
            }
            return e.prototype.handleBatchResult = function(e, t, n, r) {
                var o = this,
                    i = 0,
                    a = (new Date).getTime();
                t.forEach(function(e) {
                    if (o.completeItems.has(e.key)) e.resolve(o.completeItems.get(e.key));
                    else if (r.maxRetryAttempts && r.maxRetryAttempts > 0 && n !== e0.unretriableFailure) {
                        var t, u = (t = e.retryAttempts, r.getFailureCooldown ? r.getFailureCooldown(t) : 1e3);
                        i = i > 0 ? Math.min(i, u) : u, e.retryAttempts + 1 <= r.maxRetryAttempts ? (e.retryAttempts += 1, e.queueAfter = a + u, o.requestQueue.unshift(e)) : e.reject(e0.maxAttemptsReached)
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
                        }), r.handleBatchResult(e, o, e0.processFailure, t)
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
        }(), e3 = function() {
            function e() {
                this.createExponentialBackoffCooldown = e2, this.createQueueProcessor = function(e, t, n) {
                    var r = new e4;
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
                var r = e1({
                    processBatchWaitTime: 250,
                    maxConcurrentBatches: 5
                }, n);
                return this.createQueueProcessor(e, t, r)
            }, e
        }(), e5 = [], e6 = 0; e6 < 256; ++e6) e5.push((e6 + 256).toString(16).substr(1));
    var e8 = "RelativeTimeFormat" in Intl,
        e7 = ["lookup", "best fit"],
        e9 = ["long", "short", "narrow"],
        te = ["always", "auto"],
        tt = ["second", "minute", "hour", "day", "week", "month", "quarter", "year"];

    function tn(e) {
        if (null == e) throw TypeError("Argument ".concat(e, " cannot be converted to an Object"));
        return "boolean" == typeof e ? new Boolean(e) : "number" == typeof e ? new Number(e) : "string" == typeof e ? new String(e) : "symbol" == (void 0 === e ? "undefined" : I(e)) ? Object(e) : e
    }
    var tr = /-u(?:-[0-9a-z]{2,8})+/gi;

    function to(e) {
        return e.replace(tr, "")
    }

    function ti(e, t) {
        for (var n = t;;) {
            if (e.includes(n)) return n;
            var r = n.lastIndexOf("-");
            if (-1 === r) return;
            r >= 2 && "-" === n.charAt(r - 2) && (r -= 2), n = n.slice(0, r)
        }
    }

    function ta(e) {
        return "[object Object]" === Object.prototype.toString.call(e)
    }

    function tu(e, t, n, r, o) {
        var i = function(e, t) {
            if ("object" != (void 0 === e ? "undefined" : I(e))) throw TypeError("Given argument ".concat(e, " must be of type Object"));
            if ("string" != typeof t && "symbol" != (void 0 === t ? "undefined" : I(t))) throw TypeError("Given argument ".concat(t, " must be a PropertyKey"));
            return e[t]
        }(e, t);
        if (void 0 !== i) {
            if ("boolean" !== n && "string" !== n) throw TypeError("Expected type ".concat(n, " to be 'boolean' or 'string"));
            if ("boolean" === n && (i = !!i), "string" === n && (i += ""), void 0 !== r && !r.includes(i)) throw RangeError("Value ".concat(i, " out of range for options property ").concat(t));
            return i
        }
        return o
    }
    var ts = new WeakMap,
        tl = ["nu"],
        tc = {},
        td = [];

    function tp(e, t, n) {
        var r = ts.get(e);
        null == r && (r = Object.create(null), ts.set(e, r)), r[t] = n
    }

    function tf(e, t) {
        var n = ts.get(e);
        if (null == n) throw ReferenceError("No internal slots has been allocated for the given instance of RelativeTimeFormat");
        return n[t]
    }

    function tv(e, t) {
        var n = ts.get(e);
        return null != n && t in n
    }

    function th(e, t, n) {
        if (!tv(e, "initializedRelativeTimeFormat")) throw TypeError("Internal function called on incompatible receiver ".concat(e.toString()));
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
            if (!tt.some(function(t) {
                    return t === e
                })) throw RangeError("Unit: '".concat(e, "' must be one of: ").concat(tt.map(function(e) {
                return '"'.concat(e, '"')
            }).join(", ")));
            return e
        }(n);
        var r = tf(e, "fields"),
            o = tf(e, "style"),
            i = "short" === o ? "".concat(n, "-short") : "narrow" === o ? "".concat(n, "-narrow") : n,
            a = i in r;
        a || (i = n);
        var u = r[i];
        if (null == u) throw TypeError("Could not match entry: '".concat(i, "' inside fields for locale: '").concat(tf(e, "locale"), "'"));
        if ("auto" === tf(e, "numeric") && (a = t + "" in u)) return [{
            type: "literal",
            value: u[t + ""]
        }];
        var s = u[Object.is(t, -0) || t < 0 ? "past" : "future"],
            l = tf(e, "numberFormat").formatToParts(Math.abs(t));
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
                        "literal" === h.type ? r.push(S(O({}, h), {
                            type: h.type
                        })) : r.push(S(O({}, h), {
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
            if (!tv(e, "pluralRules")) throw TypeError("Given instance of of Intl.RelativeTimeFormat must have an [[InitializedPluralRules]] internal slot");
            if ("number" != typeof t) throw TypeError("Argument 'n' must be a number");
            return isFinite(t) ? tf(e, "pluralRules").select(t) : "other"
        }(e, t)], n, l)
    }
    var ty = function() {
        function e() {
            g(this, e);
            var t = arguments[0],
                n = arguments[1];
            if (void 0 === (w(this, e) ? this.constructor : void 0)) throw TypeError("Constructor Intl.RelativeTimeFormat requires 'new'");
            var r = Intl.getCanonicalLocales(t);
            n = void 0 === n ? Object.create(null) : tn(n);
            var o = Object.create(null);
            o.localeMatcher = tu(n, "localeMatcher", "string", e7, "best fit");
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
                                        c = to(l),
                                        d = ti(t, c);
                                    if (void 0 !== d) {
                                        if (r.locale = d, l !== c) {
                                            var p = l.match(tr);
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
                                if (null == tN) throw ReferenceError("Could not determine locale: No default locale has been configured");
                                return tN
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
                            if (!ta(h)) throw TypeError("LocaleData for locale: '".concat(a, "' must be an object"));
                            var y = h[v];
                            if (!Array.isArray(y) && !ta(y)) throw TypeError("key: '".concat(v, "' in LocaleData for locale: '").concat(a, "' must be indexable"));
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
                                void 0 !== g && y.includes(g) && (w = m, (void 0 === g ? "undefined" : I(g)) == (void 0 === w ? "undefined" : I(w)) && ("number" == typeof g ? !(!isNaN(g) || !isNaN(w)) || (!Object.is(g, 0) || !Object.is(w, -0)) && g === w : function(e, t) {
                                    if ("number" == typeof e) throw TypeError("First argument 'x' must not be a number");
                                    if ((void 0 === e ? "undefined" : I(e)) != (void 0 === t ? "undefined" : I(t))) throw TypeError("The given arguments must have the same type");
                                    return null == e || ("string" == typeof e || "boolean" == typeof e ? e === t : "symbol" == (void 0 === e ? "undefined" : I(e)) ? e.valueOf() === t.valueOf() : e === t)
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
                }(td, r, o, tl, tc),
                a = i.locale;
            tp(this, "locale", a), tp(this, "numberingSystem", i.nu);
            var u = i.dataLocale;
            tp(this, "style", tu(n, "style", "string", e9, "long")), tp(this, "numeric", tu(n, "numeric", "string", te, "always"));
            var s = tc[u];
            if (!w(s, Object)) throw TypeError("Expected the LocaleDataEntry for locale: '".concat(u, "' to be an Object"));
            tp(this, "fields", s), tp(this, "numberFormat", new Intl.NumberFormat(a)), tp(this, "pluralRules", new Intl.PluralRules(a)), tp(this, "initializedRelativeTimeFormat", this)
        }
        return E(e, [{
            key: "format",
            value: function(e, t) {
                if (!w(this, Object) || !tv(this, "initializedRelativeTimeFormat")) throw TypeError("Method Intl.RelativeTimeFormat.prototype.format called on incompatible receiver ".concat(this.toString()));
                return function(e, t, n) {
                    var r = th(e, t, n),
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
                if (!w(this, Object) || !tv(this, "initializedRelativeTimeFormat")) throw TypeError("Method Intl.RelativeTimeFormat.prototype.formatToParts called on incompatible receiver ".concat(this.toString()));
                return th(this, e = Number(e), t += "")
            }
        }, {
            key: "resolvedOptions",
            value: function() {
                if (!w(this, Object) || !tv(this, "initializedRelativeTimeFormat")) throw TypeError("Method Intl.RelativeTimeFormat.prototype.resolvedOptions called on incompatible receiver ".concat(this.toString()));
                return {
                    locale: tf(this, "locale"),
                    style: tf(this, "style"),
                    numeric: tf(this, "numeric"),
                    numberingSystem: tf(this, "numberingSystem")
                }
            }
        }], [{
            key: "supportedLocalesOf",
            value: function(e) {
                var t, n, r = arguments[1];
                return t = Intl.getCanonicalLocales(e), void 0 !== (n = r) && tu(n = tn(n), "localeMatcher", "string", e7, "best fit"),
                    function(e, t) {
                        var n = [],
                            r = !0,
                            o = !1,
                            i = void 0;
                        try {
                            for (var a, u = t[Symbol.iterator](); !(r = (a = u.next()).done); r = !0) {
                                var s = a.value;
                                void 0 !== ti(e, to(s)) && n.push(s)
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
                    }(td, t)
            }
        }, {
            key: "__addLocaleData",
            value: function(e) {
                var t = e.data,
                    n = e.locale;
                null == tN && (tN = n), tc[n] = t, td.includes(n) || td.push(n)
            }
        }]), e
    }();
    Object.defineProperty(ty.prototype, Symbol.toStringTag, {
        writable: !1,
        enumerable: !1,
        value: "Intl.RelativeTimeFormat",
        configurable: !0
    }), e8 || function() {
        if ("u" < typeof Intl) throw TypeError("Could not define Intl.RelativeTimeFormat: Expected 'Intl' to exist. Remember to include polyfills for Intl.NumberFormat, Intl.getCanonicalLocales, and Intl.PluralRules before applying this polyfill");
        Intl.RelativeTimeFormat = ty
    }();
    var tm = Object.freeze({
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
    var tb, tT, tw, tg, tP, tE, tR, tO, tS, tI, tA, tN, t_, tM, tC, tL, tx = Object.freeze({
            __proto__: null
        }),
        tU = new eD.v1.PresenceApi(new ea({
            basePath: null != (tC = null == (tM = null == (t_ = window.Roblox) ? void 0 : t_.EnvironmentUrls) ? void 0 : tM.presenceApi) ? tC : "https://presence.roblox.com",
            credentials: "include"
        }));
    (o = tL || (tL = {})).WebFriends = "webFriends", o.WebGroups = "webGroups", o.WebNavigation = "webNavigation", o.WebPlayerSearch = "webPlayerSearch", o.WebProfile = "webProfile";
    var tF = tL,
        tD = "PresenceData",
        tk = function(e) {
            var t, n, r;
            return {
                userId: null != (t = null == e ? void 0 : e.userId) ? t : 0,
                userPresenceType: eB.presenceStatusResponseToPresenceStatus[null != (n = null == e ? void 0 : e.userPresenceType) ? n : 0],
                lastLocation: null != (r = null == e ? void 0 : e.lastLocation) ? r : "Website",
                placeId: null == e ? void 0 : e.placeId,
                rootPlaceId: null == e ? void 0 : e.rootPlaceId,
                gameId: null == e ? void 0 : e.gameId,
                universeId: null == e ? void 0 : e.universeId,
                lastOnline: null == e ? void 0 : e.lastOnline,
                invisibleModeExpiry: null == e ? void 0 : e.invisibleModeExpiry
            }
        };

    function tB() {
        var e, t = null == (e = window.localStorage) ? void 0 : e.getItem(tD),
            n = Object.entries(t ? JSON.parse(t) : {}),
            r = new Map;
        return n.forEach(function(e) {
            r.set(Number.parseInt(e[0], 10), e[1])
        }), r
    }

    function tj(e) {
        var t, n, r = tB();
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
            null == (t = window.localStorage) || t.setItem(tD, JSON.stringify(Object.fromEntries(r)))
        } catch (e) {
            null == (n = window.localStorage) || n.removeItem(tD)
        }
    }
    var tV = {
            fetchUserPresences: function(e) {
                return ej(this, arguments, void 0, function(e, t) {
                    var n, r, o, i, a, u, s, l, c, d, p, f, v;
                    return void 0 === t && (t = !1), eV(this, function(h) {
                        switch (h.label) {
                            case 0:
                                var y;
                                return (null == (f = null == (p = window.Roblox) ? void 0 : p.CurrentUser) ? void 0 : f.isAuthenticated) ? (r = [], o = [], t || (y = tB(), o = (r = e.map(function(e) {
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
                                    return ej(this, void 0, void 0, function() {
                                        var t, n;
                                        return eV(this, function(r) {
                                            switch (r.label) {
                                                case 0:
                                                    return r.trys.push([0, 2, , 3]), [4, tU.v1PresenceUsersPost({
                                                        userPresenceRequest: {
                                                            userIds: e
                                                        }
                                                    })];
                                                case 1:
                                                    return (t = (null != (n = r.sent().userPresences) ? n : []).map(tk)).forEach(function(e) {
                                                        var t, n, r, o, i, a;
                                                        Number.parseInt(null != (r = null == (n = null == (t = window.Roblox) ? void 0 : t.CurrentUser) ? void 0 : n.userId) ? r : "-1", 10) === e.userId && e.userPresenceType === C.Invisible && (null == (i = null == (o = window.Roblox) ? void 0 : o.EventStream) || i.SendEventWithTarget("invisibleModeFeedback", "invisibleModeFeedback", {
                                                            surface: (a = window.location.href).includes("/profile") ? tF.WebProfile : a.includes("/search/users") ? tF.WebPlayerSearch : a.includes("/users/friends") ? tF.WebFriends : a.includes("/groups") ? tF.WebGroups : tF.WebNavigation
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
                                        userPresenceType: C.Offline,
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
                                }), tj(a), c = e.map(function(e) {
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
                tj([e])
            }
        },
        tq = (new e3).createRequestProcessor(function(e) {
            return ej(void 0, void 0, void 0, function() {
                var t, n;
                return eV(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, tV.fetchUserPresences(e.map(function(e) {
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
        tz = new Map,
        tG = {
            subscribeToPresenceChanges: function(e, t, n) {
                e.forEach(function(e) {
                    var r;
                    tz.has(e) || tz.set(e, []), null == (r = tz.get(e)) || r.push(t), n && tq.queueItem(e).then(t)
                })
            },
            getPresences: function(e) {
                return Promise.all(e.map(function(e) {
                    return tq.queueItem(e)
                }))
            },
            refetchPresences: function(e) {
                return ej(this, void 0, void 0, function() {
                    var t;
                    return eV(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, tV.fetchUserPresences(e, !0)];
                            case 1:
                                return (t = n.sent()).forEach(function(e, t, n) {
                                    var r;
                                    null == (r = tz.get(e.userId)) || r.forEach(function(t) {
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
                        tV.invalidateUserPresence(e), e.userId && tz.has(e.userId) && (null == (t = tz.get(e.userId)) || t.forEach(function(t) {
                            return t(e)
                        }))
                    })
                })
            },
            clearPresenceSubscriptions: function() {
                tz = new Map
            }
        };
    window.Roblox = window.Roblox || {}, window.Roblox.Presence = window.Roblox.Presence || {}, void 0 === (null == (a = null == (i = window.Roblox) ? void 0 : i.Presence) ? void 0 : a.presenceProvider) && (window.Roblox.Presence.presenceProvider = tG, tG.initializeEventListener());
    var tH = function() {
        return window.Roblox.Presence.presenceProvider
    };

    function tJ(e, t) {
        var n = (0, A.useState)(null != t ? t : {
                userId: null != e ? e : 0,
                lastLocation: "Website",
                userPresenceType: 0
            }),
            r = n[0],
            o = n[1];
        return (0, A.useEffect)(function() {
            void 0 !== e && tH().subscribeToPresenceChanges([e], o, void 0 === t)
        }, [t, e]), r
    }
    var tW = window.Roblox["core-scripts"].realtime,
        tQ = f.n(tW),
        tY = window.Roblox["core-scripts"].meta.user;

    function tZ(e, t, n, r, o, i, a) {
        try {
            var u = e[i](a),
                s = u.value
        } catch (e) {
            n(e);
            return
        }
        u.done ? t(s) : Promise.resolve(s).then(r, o)
    }

    function tK(e) {
        return function() {
            var t = this,
                n = arguments;
            return new Promise(function(r, o) {
                var i = e.apply(t, n);

                function a(e) {
                    tZ(i, r, o, a, u, "next", e)
                }

                function u(e) {
                    tZ(i, r, o, a, u, "throw", e)
                }
                a(void 0)
            })
        }
    }

    function t$(e, t) {
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
        }(e, t) || h(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }

    function tX(e, t) {
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

    function t0(e) {
        return (t0 = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
            return e.__proto__ || Object.getPrototypeOf(e)
        })(e)
    }

    function t1() {
        try {
            var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
        } catch (e) {}
        return (t1 = function() {
            return !!e
        })()
    }

    function t2(e, t, n) {
        t = t0(t);
        var r = t1() ? Reflect.construct(t, n || [], t0(e).constructor) : t.apply(e, n);
        if (r && ("object" === I(r) || "function" == typeof r)) return r;
        if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
        return e
    }

    function t4(e, t) {
        return (t4 = Object.setPrototypeOf || function(e, t) {
            return e.__proto__ = t, e
        })(e, t)
    }

    function t3(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
        e.prototype = Object.create(t && t.prototype, {
            constructor: {
                value: e,
                writable: !0,
                configurable: !0
            }
        }), t && t4(e, t)
    }

    function t5(e, t, n) {
        return (t5 = t1() ? Reflect.construct : function(e, t, n) {
            var r = [null];
            r.push.apply(r, t);
            var o = new(Function.bind.apply(e, r));
            return n && t4(o, n.prototype), o
        }).apply(null, arguments)
    }

    function t6(e) {
        var t = "function" == typeof Map ? new Map : void 0;
        return (t6 = function(e) {
            if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
            if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
            if (void 0 !== t) {
                if (t.has(e)) return t.get(e);
                t.set(e, n)
            }

            function n() {
                return t5(e, arguments, t0(this).constructor)
            }
            return n.prototype = Object.create(e.prototype, {
                constructor: {
                    value: n,
                    enumerable: !1,
                    writable: !0,
                    configurable: !0
                }
            }), t4(n, e)
        })(e)
    }

    function t8(e, t, n) {
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
                return g(this, t), t2(this, t, arguments)
            }
            return t3(t, e), t
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
                return !!((null == n ? void 0 : n.Parent) && w(t, n.Parent)) || (null == t || null == (o = t._zod) || null == (r = o.traits) ? void 0 : r.has(e))
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
            return g(this, t), t2(this, t, ["Encountered Promise during synchronous parse. Use .parseAsync() instead."])
        }
        return t3(t, e), t
    }(t6(Error));
    t6(Error);
    var t9 = {};

    function ne(e) {
        return e && Object.assign(t9, e), t9
    }

    function nt(e, t) {
        return (void 0 === t ? "undefined" : I(t)) === "bigint" ? t.toString() : t
    }

    function nn(e) {
        return {
            get value() {
                var t = e();
                return Object.defineProperty(this, "value", {
                    value: t
                }), t
            }
        }
    }
    var nr = Symbol("evaluating");

    function no(e, t, n) {
        var r = void 0;
        Object.defineProperty(e, t, {
            get: function() {
                if (r !== nr) return void 0 === r && (r = nr, r = n()), r
            },
            set: function(n) {
                Object.defineProperty(e, t, {
                    value: n
                })
            },
            configurable: !0
        })
    }
    var ni = "captureStackTrace" in Error ? Error.captureStackTrace : function() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n]
    };

    function na(e) {
        return e.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")
    }

    function nu(e) {
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
        return (delete e.message, "string" == typeof e.error) ? S(O({}, e), {
            error: function() {
                return e.error
            }
        }) : e
    }

    function ns(e) {
        var t, n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
        if (!0 === e.aborted) return !0;
        for (var r = n; r < e.issues.length; r++)
            if ((null == (t = e.issues[r]) ? void 0 : t.continue) !== !0) return !0;
        return !1
    }

    function nl(e, t) {
        return t.map(function(t) {
            return null != t.path || (t.path = []), t.path.unshift(e), t
        })
    }

    function nc(e) {
        return "string" == typeof e ? e : null == e ? void 0 : e.message
    }

    function nd(e, t, n) {
        var r, o, i, a, u, s, l, c, d, p, f, v = S(O({}, e), {
            path: null != (r = e.path) ? r : []
        });
        return e.message || (v.message = null != (o = null != (i = null != (a = null != (u = nc(null == (c = e.inst) || null == (l = c._zod.def) || null == (s = l.error) ? void 0 : s.call(l, e))) ? u : nc(null == t || null == (d = t.error) ? void 0 : d.call(t, e))) ? a : nc(null == (p = n.customError) ? void 0 : p.call(n, e))) ? i : nc(null == (f = n.localeError) ? void 0 : f.call(n, e))) ? o : "Invalid input"), delete v.inst, delete v.continue, (null == t ? void 0 : t.reportInput) || delete v.input, v
    }
    nn(function() {
        var e, t;
        if ("u" > typeof navigator && (null == (t = navigator) || null == (e = t.userAgent) ? void 0 : e.includes("Cloudflare"))) return !1;
        try {
            return Function(""), !0
        } catch (e) {
            return !1
        }
    });
    var np = function(e, t) {
            e.name = "$ZodError", Object.defineProperty(e, "_zod", {
                value: e._zod,
                enumerable: !1
            }), Object.defineProperty(e, "issues", {
                value: t,
                enumerable: !1
            }), e.message = JSON.stringify(t, nt, 2), Object.defineProperty(e, "toString", {
                value: function() {
                    return e.message
                },
                enumerable: !1
            })
        },
        nf = t8("$ZodError", np),
        nv = t8("$ZodError", np, {
            Parent: Error
        }),
        nh = (e = nv, function(t, n, r, o) {
            var i = r ? Object.assign(r, {
                    async: !1
                }) : {
                    async: !1
                },
                a = t._zod.run({
                    value: n,
                    issues: []
                }, i);
            if (w(a, Promise)) throw new t7;
            if (a.issues.length) {
                var u, s = new(null != (u = null == o ? void 0 : o.Err) ? u : e)(a.issues.map(function(e) {
                    return nd(e, i, ne())
                }));
                throw ni(s, null == o ? void 0 : o.callee), s
            }
            return a.value
        }),
        ny = (t = nv, function(e, n, r, o) {
            return tK(function() {
                var i, a, u, s;
                return tX(this, function(l) {
                    switch (l.label) {
                        case 0:
                            if (i = r ? Object.assign(r, {
                                    async: !0
                                }) : {
                                    async: !0
                                }, !w(a = e._zod.run({
                                    value: n,
                                    issues: []
                                }, i), Promise)) return [3, 2];
                            return [4, a];
                        case 1:
                            a = l.sent(), l.label = 2;
                        case 2:
                            if (a.issues.length) throw ni(s = new(null != (u = null == o ? void 0 : o.Err) ? u : t)(a.issues.map(function(e) {
                                return nd(e, i, ne())
                            })), null == o ? void 0 : o.callee), s;
                            return [2, a.value]
                    }
                })
            })()
        }),
        nm = (n = nv, function(e, t, r) {
            var o = r ? S(O({}, r), {
                    async: !1
                }) : {
                    async: !1
                },
                i = e._zod.run({
                    value: t,
                    issues: []
                }, o);
            if (w(i, Promise)) throw new t7;
            return i.issues.length ? {
                success: !1,
                error: new(null != n ? n : nf)(i.issues.map(function(e) {
                    return nd(e, o, ne())
                }))
            } : {
                success: !0,
                data: i.value
            }
        }),
        nb = (r = nv, function(e, t, n) {
            return tK(function() {
                var o, i;
                return tX(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (o = n ? Object.assign(n, {
                                    async: !0
                                }) : {
                                    async: !0
                                }, !w(i = e._zod.run({
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
                                    return nd(e, o, ne())
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
    var nT = /^-?\d+(?:\.\d+)?/,
        nw = {
            major: 4,
            minor: 1,
            patch: 11
        },
        ng = t8("$ZodType", function(e, t) {
            null != e || (e = {}), e._zod.def = t, e._zod.bag = e._zod.bag || {}, e._zod.version = nw;
            var n, r = y(null != (u = e._zod.def.checks) ? u : []);
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
                        for (var h, m = d._zod.onattach[Symbol.iterator](); !(p = (h = m.next()).done); p = !0)(0, h.value)(e)
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
                        var r = ns(e),
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
                                if (w(i, Promise) && (null == n ? void 0 : n.async) === !1) throw new t7;
                                if (u || w(i, Promise)) u = (null != u ? u : Promise.resolve()).then(function() {
                                    return tK(function() {
                                        return tX(this, function(t) {
                                            switch (t.label) {
                                                case 0:
                                                    return [4, i];
                                                case 1:
                                                    if (t.sent(), e.issues.length === o) return [2];
                                                    return r || (r = ns(e, o)), [2]
                                            }
                                        })
                                    })()
                                });
                                else {
                                    if (e.issues.length === o) return;
                                    r || (r = ns(e, o))
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
                    T = function(t, n, o) {
                        if (ns(t)) return t.aborted = !0, t;
                        var i = b(n, r, o);
                        if (w(i, Promise)) {
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
                        }, S(O({}, n), {
                            skipChecks: !0
                        }));
                        return w(o, Promise) ? o.then(function(e) {
                            return T(e, t, n)
                        }) : T(o, t, n)
                    }
                    var i = e._zod.parse(t, n);
                    if (w(i, Promise)) {
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
                        var n, r = nm(e, t);
                        return r.success ? {
                            value: r.data
                        } : {
                            issues: null == (n = r.error) ? void 0 : n.issues
                        }
                    } catch (n) {
                        return nb(e, t).then(function(e) {
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
        nP = t8("$ZodNumber", function(e, t) {
            var n;
            ng.init(e, t), e._zod.pattern = null != (n = e._zod.bag.pattern) ? n : nT, e._zod.parse = function(n, r) {
                if (t.coerce) try {
                    n.value = Number(n.value)
                } catch (e) {}
                var o = n.value;
                if ("number" == typeof o && !Number.isNaN(o) && Number.isFinite(o)) return n;
                var i = "number" == typeof o ? Number.isNaN(o) ? "NaN" : Number.isFinite(o) ? void 0 : "Infinity" : void 0;
                return n.issues.push(O({
                    expected: "number",
                    code: "invalid_type",
                    input: o,
                    inst: e
                }, i ? {
                    received: i
                } : {})), n
            }
        }),
        nE = t8("$ZodUnknown", function(e, t) {
            ng.init(e, t), e._zod.parse = function(e) {
                return e
            }
        });

    function nR(e, t, n) {
        if (e.issues.length) {
            var r;
            (r = t.issues).push.apply(r, y(nl(n, e.issues)))
        }
        t.value[n] = e.value
    }
    var nO = t8("$ZodArray", function(e, t) {
        ng.init(e, t), e._zod.parse = function(n, r) {
            var o = function(e) {
                    var o = i[e],
                        u = t.element._zod.run({
                            value: o,
                            issues: []
                        }, r);
                    w(u, Promise) ? a.push(u.then(function(t) {
                        return nR(t, n, e)
                    })) : nR(u, n, e)
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

    function nS(e, t, n, r) {
        if (e.issues.length) {
            var o;
            (o = t.issues).push.apply(o, y(nl(n, e.issues)))
        }
        void 0 === e.value ? n in r && (t.value[n] = void 0) : t.value[n] = e.value
    }
    var nI = t8("$ZodObject", function(e, t) {
            ng.init(e, t);
            var n, r = Object.getOwnPropertyDescriptor(t, "shape");
            if (!(null == r ? void 0 : r.get)) {
                var o = t.shape;
                Object.defineProperty(t, "shape", {
                    get: function() {
                        var e = O({}, o);
                        return Object.defineProperty(t, "shape", {
                            value: e
                        }), e
                    }
                })
            }
            var i = nn(function() {
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
                    return S(O({}, e), {
                        keys: n,
                        keySet: new Set(n),
                        numKeys: n.length,
                        optionalKeys: new Set(f)
                    })
                }(t)
            });
            no(e._zod, "propValues", function() {
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
                if (!((void 0 === (p = o) ? "undefined" : I(p)) === "object" && null !== p && !Array.isArray(p))) return t.issues.push({
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
                        w(n, Promise) ? u.push(n.then(function(n) {
                            return nS(n, t, e, o)
                        })) : nS(n, t, e, o)
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
                                w(i, Promise) ? e.push(i.then(function(e) {
                                    return nS(e, n, o, t)
                                })) : nS(i, n, o, t)
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
        nA = t8("$ZodLiteral", function(e, t) {
            if (ng.init(e, t), 0 === t.values.length) throw Error("Cannot create literal schema with no valid values");
            e._zod.values = new Set(t.values), e._zod.pattern = new RegExp("^(".concat(t.values.map(function(e) {
                return "string" == typeof e ? na(e) : e ? na(e.toString()) : String(e)
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

    function nN(e, t) {
        return e.issues.length && void 0 === t ? {
            issues: [],
            value: void 0
        } : e
    }
    var n_ = t8("$ZodOptional", function(e, t) {
        ng.init(e, t), e._zod.optin = "optional", e._zod.optout = "optional", no(e._zod, "values", function() {
            return t.innerType._zod.values ? new Set(y(t.innerType._zod.values).concat([void 0])) : void 0
        }), no(e._zod, "pattern", function() {
            var e, n, r, o = t.innerType._zod.pattern;
            return o ? new RegExp("^(".concat((n = +!!(e = o.source).startsWith("^"), r = e.endsWith("$") ? e.length - 1 : e.length, e.slice(n, r)), ")?$")) : void 0
        }), e._zod.parse = function(e, n) {
            if ("optional" === t.innerType._zod.optin) {
                var r = t.innerType._zod.run(e, n);
                return w(r, Promise) ? r.then(function(t) {
                    return nN(t, e.value)
                }) : nN(r, e.value)
            }
            return void 0 === e.value ? e : t.innerType._zod.run(e, n)
        }
    });
    Symbol("ZodOutput"), Symbol("ZodInput");
    var nM = t8("ZodMiniType", function(e, t) {
            if (!e._zod) throw Error("Uninitialized schema in ZodMiniType.");
            ng.init(e, t), e.def = t, e.type = t.type, e.parse = function(t, n) {
                return nh(e, t, n, {
                    callee: e.parse
                })
            }, e.safeParse = function(t, n) {
                return nm(e, t, n)
            }, e.parseAsync = function(t, n) {
                return tK(function() {
                    return tX(this, function(r) {
                        return [2, ny(e, t, n, {
                            callee: e.parseAsync
                        })]
                    })
                })()
            }, e.safeParseAsync = function(t, n) {
                return tK(function() {
                    return tX(this, function(r) {
                        return [2, nb(e, t, n)]
                    })
                })()
            }, e.check = function() {
                for (var n, r = arguments.length, o = Array(r), i = 0; i < r; i++) o[i] = arguments[i];
                return e.clone(S(O({}, t), {
                    checks: y(null != (n = t.checks) ? n : []).concat(y(o.map(function(e) {
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
        nC = t8("ZodMiniNumber", function(e, t) {
            nP.init(e, t), nM.init(e, t)
        });

    function nL(e) {
        return new nC(O({
            type: "number",
            checks: []
        }, nu(e)))
    }
    var nx = t8("ZodMiniUnknown", function(e, t) {
        nE.init(e, t), nM.init(e, t)
    });

    function nU() {
        return new nx({
            type: "unknown"
        })
    }
    var nF = t8("ZodMiniArray", function(e, t) {
            nO.init(e, t), nM.init(e, t)
        }),
        nD = t8("ZodMiniObject", function(e, t) {
            nI.init(e, t), nM.init(e, t), no(e, "shape", function() {
                return t.shape
            })
        });

    function nk(e, t) {
        return new nD(O({
            type: "object",
            shape: e,
            catchall: nU()
        }, nu(t)))
    }
    var nB = t8("ZodMiniLiteral", function(e, t) {
            nA.init(e, t), nM.init(e, t)
        }),
        nj = t8("ZodMiniOptional", function(e, t) {
            n_.init(e, t), nM.init(e, t)
        }),
        nV = window.Roblox["core-scripts"].environmentUrls,
        nq = f.n(nV),
        nz = window.Roblox["core-lib"].http.index,
        nG = window.Roblox["core-lib"].url.index,
        nH = "PresenceBulkNotifications",
        nJ = nk({
            Type: new nB(O({
                type: "literal",
                values: Array.isArray(u = "PresenceChanged") ? u : [u]
            }, nu(void 0))),
            UserId: nL(),
            SessionStarted: nU(),
            PresenceReport: new nj({
                type: "optional",
                innerType: nU()
            })
        }),
        nW = (s = {
            userPresences: new nF(O({
                type: "array",
                element: nk({
                    userId: nL()
                })
            }, nu(void 0)))
        }, new nD(O({
            type: "object",
            shape: null != s ? s : {}
        }, nu(void 0)))),
        nQ = function(e) {
            document.dispatchEvent(new CustomEvent("Roblox.Presence.Update", {
                detail: e
            }))
        },
        nY = function(e) {
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
                                c = nJ.safeParse(l);
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
                            var b = t$(y.value, 2),
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
                    p.length > 0 && tK(function() {
                        var e;
                        return tX(this, function(t) {
                            switch (t.label) {
                                case 0:
                                    return e = nG.Url.parse(nq().presenceApi).getOrThrow().withPath("/v1/presence/users"), [4, nz.post(e, {
                                        userIds: p
                                    }, nW, {
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
                        nQ(d)
                    }), nQ(d)
                };
            return e.Subscribe(nH, r),
                function() {
                    e.Unsubscribe(nH, r)
                }
        };

    function nZ() {
        return null != c || (c = "".concat(nq().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), c
    }
    var nK = function() {},
        n$ = function(e, t) {
            return e << 3 | t
        },
        nX = n$(1, 2),
        n0 = n$(2, 2),
        n1 = n$(5, 2),
        n2 = n$(6, 2),
        n4 = n$(8, 2),
        n3 = n$(1, 2),
        n5 = n$(2, 1),
        n6 = n$(3, 0),
        n8 = n$(5, 2);
    n$(1, 2), n$(2, 1), n$(3, 0), n$(4, 2), n$(5, 2), n$(6, 0), n$(8, 2);
    var n7 = n$(4, 0),
        n9 = n$(6, 2),
        re = n$(7, 2);
    n$(1, 0), n$(2, 2);
    var rt = n$(1, 2),
        rn = n$(2, 2),
        rr = n$(1, 2);
    n$(1, 2), n$(2, 2), n$(1, 2);
    var ro = new TextEncoder,
        ri = function() {
            function e() {
                g(this, e), R(this, "buf", [])
            }
            return E(e, [{
                key: "writeVarint",
                value: function(e) {
                    var t = (void 0 === e ? "undefined" : I(e)) === "bigint" ? e : BigInt(Math.trunc(e));
                    for (t < BigInt(0) && (t += BigInt(1) << BigInt(64)); t > BigInt(127);) this.buf.push(128 | Number(t & BigInt(127))), t >>= BigInt(7);
                    this.buf.push(Number(t))
                }
            }, {
                key: "writeString",
                value: function(e) {
                    var t = ro.encode(e);
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

    function ra(e, t, n) {
        var r = new ri;
        return r.writeVarint(n$(1, 2)), r.writeString(e), r.writeVarint(t), n(r), r.toBytes()
    }

    function ru(e) {
        var t = new ri;
        if (t.writeVarint(n3), t.writeString(e.name), t.writeVarint(n5), t.writeDouble(e.value), t.writeVarint(n6), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
            var n = function(e) {
                var t = new ri,
                    n = !0,
                    r = !1,
                    o = void 0;
                try {
                    for (var i, a = Object.entries(e)[Symbol.iterator](); !(n = (i = a.next()).done); n = !0) ! function() {
                        var e = t$(i.value, 2),
                            n = e[0],
                            r = e[1];
                        if ("string" == typeof r) {
                            var o = ra(n, n$(2, 2), function(e) {
                                e.writeString(r)
                            });
                            t.writeVarint(n1), t.writeBytes(o)
                        } else if ("boolean" == typeof r) {
                            var a = ra(n, n$(2, 0), function(e) {
                                e.writeVarint(+!!r)
                            });
                            t.writeVarint(n2), t.writeBytes(a)
                        } else if ((void 0 === r ? "undefined" : I(r)) === "bigint") {
                            var u = ra(n, n$(2, 0), function(e) {
                                e.writeVarint(r)
                            });
                            t.writeVarint(n0), t.writeBytes(u)
                        } else if ("number" == typeof r)
                            if (Number.isFinite(r))
                                if (Number.isInteger(r) && r >= -0x80000000 && r <= 0x7fffffff) {
                                    var s = ra(n, n$(2, 0), function(e) {
                                        e.writeVarint(r)
                                    });
                                    t.writeVarint(nX), t.writeBytes(s)
                                } else if (Number.isInteger(r)) {
                            var l = ra(n, n$(2, 0), function(e) {
                                e.writeVarint(BigInt(r))
                            });
                            t.writeVarint(n0), t.writeBytes(l)
                        } else {
                            var c = ra(n, n$(2, 1), function(e) {
                                e.writeDouble(r)
                            });
                            t.writeVarint(n4), t.writeBytes(c)
                        } else {
                            var d = ra(n, n$(2, 2), function(e) {
                                e.writeString(String(r))
                            });
                            t.writeVarint(n1), t.writeBytes(d)
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
            t.writeVarint(n8), t.writeBytes(n)
        }
        return t.toBytes()
    }

    function rs(e, t, n) {
        var r = new ri;
        r.writeVarint(n7), r.writeVarint(n);
        var o = !0,
            i = !1,
            a = void 0;
        try {
            for (var u, s = e[Symbol.iterator](); !(o = (u = s.next()).done); o = !0) {
                var l = u.value;
                r.writeVarint(n9), r.writeBytes(l)
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
                r.writeVarint(re), r.writeBytes(h)
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

    function rl(e) {
        var t = new ri;
        t.writeVarint(rt), t.writeString("eventstream.enginetelemetry.EngineTelemetryBatchEvent"), t.writeVarint(rn), t.writeBytes(e);
        var n = t.toBytes(),
            r = new ri;
        return r.writeVarint(rr), r.writeBytes(n), r.toBytes()
    }
    var rc = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

    function rd(e) {
        return rc.test(e)
    }
    var rp = [],
        rf = !1,
        rv = !1;

    function rh(e, t) {
        var n, r, o = e.map(function(e) {
                return {
                    name: e.name,
                    value: e.value,
                    timestampMs: e.timestampMs,
                    attributes: e.attributes
                }
            }),
            i = BigInt(Date.now());
        !0 === t || rv || "u" > typeof document && "hidden" === document.visibilityState ? (n = rl(rs(o.map(ru), [], i)).buffer, fetch("".concat(nZ()).concat("/v1/events/single"), {
            method: "POST",
            headers: {
                "Content-Type": "application/x-protobuf"
            },
            body: n,
            credentials: "include",
            keepalive: !0
        }).catch(nK)) : (r = rl(rs(o.map(ru), [], i)), tK(function() {
            var e, t, n, o, i, a, u, s, l, c, d, p, f;
            return tX(this, function(v) {
                switch (v.label) {
                    case 0:
                        if ("u" < typeof CompressionStream) return [2, {
                            body: r.buffer,
                            compressed: !1
                        }];
                        return (t = (e = new CompressionStream("gzip")).writable.getWriter()).write(r).catch(nK), t.close().catch(nK), n = [], [4, (o = e.readable.getReader()).read()];
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
            return n && (r["Content-Encoding"] = "gzip"), fetch("".concat(nZ()).concat("/v1/events/single"), {
                method: "POST",
                headers: r,
                body: t,
                credentials: "include",
                keepalive: !0
            })
        }).catch(nK)
    }

    function ry() {
        var e = !0,
            t = !1,
            n = void 0;
        try {
            for (var r, o = rp[Symbol.iterator](); !(e = (r = o.next()).done); e = !0) {
                var i = r.value.splice(0);
                0 !== i.length && rh(i, !0)
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
    var rm = function() {
            if ("u" > typeof document) {
                var e = document.querySelector('meta[name="page-meta"]');
                return null == e ? void 0 : e.dataset.internalPageName
            }
        },
        rb = ["Messages", "Avatar"],
        rT = function(e) {
            var t;
            return null != (t = rb.find(function(t) {
                return t === e
            })) ? t : "other"
        },
        rw = {
            featureName: "AppShell",
            team: "User > Consumer Apps > Platforms - Web & Backend",
            features: {
                page: {
                    counters: [{
                        name: "ShellStart",
                        dimensions: ["host", "page", "auth_state"]
                    }, {
                        name: "PageHeartbeat",
                        dimensions: ["host", "page", "beat"]
                    }]
                },
                presence: {
                    counters: [{
                        name: "PresenceHeartbeat",
                        dimensions: ["host", "page", "outcome"]
                    }]
                },
                navigation: {
                    counters: [{
                        name: "NavLoad",
                        dimensions: ["host", "page", "outcome"]
                    }]
                },
                realtime: {
                    counters: [{
                        name: "RealtimeStart",
                        dimensions: ["host", "page", "outcome"]
                    }]
                },
                chat: {
                    counters: [{
                        name: "ChatLoad",
                        dimensions: ["host", "page", "outcome"]
                    }]
                },
                gameLaunch: {
                    counters: [{
                        name: "GameLaunch",
                        dimensions: ["host", "page", "outcome"]
                    }]
                }
            }
        },
        rg = (l = function(e) {
            var t, n = Math.max(1, 10),
                r = 250;

            function o(e, t) {
                console.error(e, t)
            }
            if (!rd(e)) return o('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                    name: e
                }),
                function() {};
            var i = [];
            return rp.push(i), rf || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                    "hidden" === document.visibilityState && ry()
                }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                    rv = !0, ry()
                }), rf = !0),
                function(a, u, s) {
                    var l = "".concat(e, "_").concat(a);
                    if (! function(e, t) {
                            if (!rd(e)) return !1;
                            if (t) {
                                var n = !0,
                                    r = !1,
                                    o = void 0;
                                try {
                                    for (var i, a = Object.keys(t)[Symbol.iterator](); !(n = (i = a.next()).done); n = !0) {
                                        var u = i.value;
                                        if (!rd(u)) return !1
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
                    }), i.length >= n ? (void 0 !== t && (clearTimeout(t), t = void 0), rh(i.splice(0, n))) : void 0 === t && (t = setTimeout(function() {
                        for (t = void 0; i.length > 0;) rh(i.splice(0, n))
                    }, r))
                }
        }(rw.featureName), function(e, t) {
            var n = Object.values(rw.features).some(function(t) {
                var n;
                return null == (n = t.counters) ? void 0 : n.some(function(t) {
                    var n;
                    return "string" != typeof t && t.name === e && (null == (n = t.dimensions) ? void 0 : n.includes("page")) === !0
                })
            });
            l(e, S(O({}, n && null == t.page ? {
                page: rT(rm())
            } : {}, t), {
                host: "dotnet"
            }))
        });
    b(["Roblox", "Presence", "PresenceTypes"], {
        Offline: 0,
        Online: 1,
        InGame: 2,
        InStudio: 3
    }), b("RobloxPresence", {
        PresenceType: C,
        PresenceStatusIcon: function(e) {
            var t, n, r = e.userId,
                o = e.initialPresence,
                i = e.className,
                a = e.translate,
                u = tJ(r, o),
                s = null != (t = null == u ? void 0 : u.userPresenceType) ? t : C.Offline,
                l = null != (n = null == u ? void 0 : u.lastLocation) ? n : "";
            a && s === C.Invisible && (l = a("Label.Invisible"));
            var c = eB.presenceStatusToClassName[s];
            return s !== C.Offline ? N().createElement("span", {
                "data-testid": "presence-icon",
                title: l,
                className: F(i, c, "icon-".concat(c))
            }) : null
        },
        PresenceStatusLabel: function(e) {
            var t, n, r = e.userId,
                o = e.translate,
                i = e.linkUrlGetter,
                a = e.linkClassNames,
                u = tJ(r, void 0);
            if (u.userPresenceType === C.Offline) return o("Label.Offline");
            if (u.userPresenceType === C.Online) return o("Label.Online");
            if (u.userPresenceType === C.Game) {
                if (u.rootPlaceId) {
                    var s = i ? i(u.rootPlaceId) : "".concat(null == (n = null == (t = window.Roblox) ? void 0 : t.EnvironmentUrls) ? void 0 : n.websiteUrl, "/games/").concat(u.rootPlaceId);
                    return N().createElement("a", {
                        href: s,
                        className: F(null != a ? a : [])
                    }, u.lastLocation)
                }
                return o("Label.Online")
            }
            return u.userPresenceType === C.Studio ? u.lastLocation : u.userPresenceType === C.Invisible ? o("Label.Invisible") : void 0
        },
        usePresence: tJ,
        getPresenceProvider: tH,
        presenceClient: tU
    }), (0, tY.isAuthenticated)() && document.addEventListener("DOMContentLoaded", function() {
        if (T(m)) {
            var e;
            try {
                e = tQ().GetClient()
            } catch (e) {
                throw rg("RealtimeStart", {
                    outcome: "failed"
                }), e
            }
            rg("RealtimeStart", {
                outcome: "started"
            }), nY(e)
        }
    })
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected(document.currentScript && document.currentScript.getAttribute("data-bundlename") || "PresenceStatus");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/presenceStatus-36c33019dbffcb21.js.map