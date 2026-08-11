! function() {
    "use strict";
    var e, t, n, r, i, o = {},
        a = {};

    function s(e) {
        var t = a[e];
        if (void 0 !== t) return t.exports;
        var n = a[e] = {
            exports: {}
        };
        return o[e](n, n.exports, s), n.exports
    }

    function u(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
        return r
    }
    s.n = function(e) {
        var t = e && e.__esModule ? function() {
            return e.default
        } : function() {
            return e
        };
        return s.d(t, {
            a: t
        }), t
    }, s.d = function(e, t) {
        for (var n in t) s.o(t, n) && !s.o(e, n) && Object.defineProperty(e, n, {
            enumerable: !0,
            get: t[n]
        })
    }, s.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, s.rv = function() {
        return "1.5.7"
    }, s.ruid = "bundler=rspack@1.5.7";
    var c = function(e, t) {
            var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : window;
            if ("string" == typeof e) n[e] = t;
            else {
                var r = function(e) {
                        if (Array.isArray(e)) return u(e)
                    }(e) || function(e) {
                        if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(e) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return u(e, void 0);
                            var n = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return u(e, t)
                        }
                    }(e) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    i = r.pop(),
                    o = n,
                    a = !0,
                    s = !1,
                    c = void 0;
                try {
                    for (var l, f = r[Symbol.iterator](); !(a = (l = f.next()).done); a = !0) {
                        var p, d = l.value;
                        null != (p = o)[d] || (p[d] = {}), o = o[d]
                    }
                } catch (e) {
                    s = !0, c = e
                } finally {
                    try {
                        a || null == f.return || f.return()
                    } finally {
                        if (s) throw c
                    }
                }
                o[i] = t
            }
        },
        l = window.React,
        f = s.n(l);

    function p(e, t) {
        for (var n = 0; n < t.length; n++) {
            var r = t[n];
            r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
        }
    }

    function d(e, t) {
        return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
    }

    function h(e) {
        for (var t = 1; t < arguments.length; t++) {
            var n = null != arguments[t] ? arguments[t] : {},
                r = Object.keys(n);
            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                return Object.getOwnPropertyDescriptor(n, e).enumerable
            }))), r.forEach(function(t) {
                var r;
                r = n[t], t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r
            })
        }
        return e
    }

    function $(e, t) {
        return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
            var n = Object.keys(e);
            if (Object.getOwnPropertySymbols) {
                var r = Object.getOwnPropertySymbols(e);
                n.push.apply(n, r)
            }
            return n
        })(Object(t)).forEach(function(n) {
            Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
        }), e
    }

    function v(e) {
        return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
    }(y = b || (b = {}))[y.Offline = 0] = "Offline", y[y.Online = 1] = "Online", y[y.Game = 2] = "Game", y[y.Studio = 3] = "Studio", y[y.Invisible = 4] = "Invisible";
    var m = b;

    function g(e) {
        return e && e.__esModule && Object.prototype.hasOwnProperty.call(e, "default") ? e.default : e
    }
    var y, b, w = {
            exports: {}
        },
        E = {}.hasOwnProperty;

    function S() {
        for (var e = [], t = 0; t < arguments.length; t++) {
            var n = arguments[t];
            if (n) {
                var r = void 0 === n ? "undefined" : v(n);
                if ("string" === r || "number" === r) e.push(n);
                else if (Array.isArray(n)) {
                    if (n.length) {
                        var i = S.apply(null, n);
                        i && e.push(i)
                    }
                } else if ("object" === r) {
                    if (n.toString !== Object.prototype.toString && !n.toString.toString().includes("[native code]")) {
                        e.push(n.toString());
                        continue
                    }
                    for (var o in n) E.call(n, o) && n[o] && e.push(o)
                }
            }
        }
        return e.join(" ")
    }
    w.exports ? (S.default = S, w.exports = S) : window.classNames = S;
    var T = g(w.exports),
        O = function(e, t) {
            return (O = Object.setPrototypeOf || d({
                __proto__: []
            }, Array) && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function x(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        O(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }
    var A = function() {
        return (A = Object.assign || function(e) {
            for (var t, n = 1, r = arguments.length; n < r; n++)
                for (var i in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
            return e
        }).apply(this, arguments)
    };

    function R(e, t, n, r) {
        return new(n || (n = Promise))(function(i, o) {
            function a(e) {
                try {
                    u(r.next(e))
                } catch (e) {
                    o(e)
                }
            }

            function s(e) {
                try {
                    u(r.throw(e))
                } catch (e) {
                    o(e)
                }
            }

            function u(e) {
                var t;
                e.done ? i(e.value) : (d(t = e.value, n) ? t : new n(function(e) {
                    e(t)
                })).then(a, s)
            }
            u((r = r.apply(e, t || [])).next())
        })
    }

    function C(e, t) {
        var n, r, i, o, a = {
            label: 0,
            sent: function() {
                if (1 & i[0]) throw i[1];
                return i[1]
            },
            trys: [],
            ops: []
        };
        return o = {
            next: s(0),
            throw: s(1),
            return: s(2)
        }, "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function s(s) {
            return function(u) {
                var c = [s, u];
                if (n) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, c[0] && (a = 0)), a;) try {
                    if (n = 1, r && (i = 2 & c[0] ? r.return : c[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, c[1])).done) return i;
                    switch (r = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                        case 0:
                        case 1:
                            i = c;
                            break;
                        case 4:
                            return a.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            a.label++, r = c[1], c = [0];
                            continue;
                        case 7:
                            c = a.ops.pop(), a.trys.pop();
                            continue;
                        default:
                            if (!((i = (i = a.trys).length > 0 && i[i.length - 1]) || 6 !== c[0] && 2 !== c[0])) {
                                a = 0;
                                continue
                            }
                            if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                a.label = c[1];
                                break
                            }
                            if (6 === c[0] && a.label < i[1]) {
                                a.label = i[1], i = c;
                                break
                            }
                            if (i && a.label < i[2]) {
                                a.label = i[2], a.ops.push(c);
                                break
                            }
                            i[2] && a.ops.pop(), a.trys.pop();
                            continue
                    }
                    c = t.call(e, a)
                } catch (e) {
                    c = [6, e], r = 0
                } finally {
                    n = i = 0
                }
                if (5 & c[0]) throw c[1];
                return {
                    value: c[0] ? c[1] : void 0,
                    done: !0
                }
            }
        }
    }
    var P = function() {
            function e(e) {
                void 0 === e && (e = new M);
                var t = this;
                this.configuration = e, this.fetchApi = function(e, n) {
                    return R(t, void 0, void 0, function() {
                        var t, r, i, o, a, s, u, c, l;
                        return C(this, function(f) {
                            switch (f.label) {
                                case 0:
                                    t = {
                                        url: e,
                                        init: n
                                    }, r = 0, i = this.middleware, f.label = 1;
                                case 1:
                                    return r < i.length ? (l = i[r]).pre ? [4, l.pre(A({
                                        fetch: this.fetchApi
                                    }, t))] : [3, 3] : [3, 4];
                                case 2:
                                    t = f.sent() || t, f.label = 3;
                                case 3:
                                    return r++, [3, 1];
                                case 4:
                                    return o = performance.now(), [4, (this.configuration.fetchApi || fetch)(t.url, t.init)];
                                case 5:
                                    a = f.sent(), s = performance.now(), u = 0, c = this.middleware, f.label = 6;
                                case 6:
                                    return u < c.length ? (l = c[u]).post ? [4, l.post({
                                        fetch: this.fetchApi,
                                        url: t.url,
                                        init: t.init,
                                        response: a.clone(),
                                        elapsedTime: s - o
                                    })] : [3, 8] : [3, 9];
                                case 7:
                                    a = f.sent() || a, f.label = 8;
                                case 8:
                                    return u++, [3, 6];
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
                return R(this, void 0, void 0, function() {
                    var n, r, i, o;
                    return C(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return r = (n = this.createFetchParams(e, t)).url, i = n.init, [4, this.fetchApi(r, i)];
                            case 1:
                                if ((o = a.sent()).status >= 200 && o.status < 300) return [2, o];
                                throw o
                        }
                    })
                })
            }, e.prototype.createFetchParams = function(e, t) {
                var n = this.configuration.basePath + e.path;
                void 0 !== e.query && 0 !== Object.keys(e.query).length && (n += "?" + this.configuration.queryParamsStringify(e.query));
                var r, i = "undefined" != typeof FormData && d(e.body, FormData) || d(e.body, URLSearchParams) || (r = e.body, "undefined" != typeof Blob && d(r, Blob)) ? e.body : JSON.stringify(e.body),
                    o = Object.assign({}, this.configuration.headers, e.headers);
                return {
                    url: n,
                    init: A({
                        method: e.method,
                        headers: o,
                        body: i,
                        credentials: this.configuration.credentials,
                        referrerPolicy: this.configuration.referrerPolicy
                    }, t)
                }
            }, e.prototype.clone = function() {
                var e = new this.constructor(this.configuration);
                return e.middleware = this.middleware.slice(), e
            }, e
        }(),
        I = function(e) {
            function t(t, n) {
                var r = e.call(this, n) || this;
                return r.field = t, r.name = "RequiredError", r
            }
            return x(t, e), t
        }(Error),
        M = function() {
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
                            var i = n + (n.length ? "[".concat(r, "]") : r),
                                o = t[r];
                            if (d(o, Array)) {
                                var a = o.map(function(e) {
                                    return encodeURIComponent(String(e))
                                }).join("&".concat(encodeURIComponent(i), "="));
                                return "".concat(encodeURIComponent(i), "=").concat(a)
                            }
                            return d(o, Date) ? "".concat(encodeURIComponent(i), "=").concat(encodeURIComponent(o.toISOString())) : d(o, Object) ? e(o, i) : "".concat(encodeURIComponent(i), "=").concat(encodeURIComponent(String(o)))
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

    function N(e, t) {
        return null != e[t]
    }
    var k, L, U = function() {
            function e(e, t) {
                void 0 === t && (t = function(e) {
                    return e
                }), this.raw = e, this.transformer = t
            }
            return e.prototype.value = function() {
                return R(this, void 0, void 0, function() {
                    var e;
                    return C(this, function(t) {
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
        _ = "x-csrf-token",
        D = function() {
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
                    i = e.init,
                    o = e.response;
                return 403 === o.status && o.headers.has(_) ? (this.currentToken = null != (t = o.headers.get(_)) ? t : "", n(r, this.appendCSRFHeader(i))) : Promise.resolve(o)
            }, e.prototype.appendCSRFHeader = function(e) {
                var t;
                return A(A({}, e), {
                    headers: A(A({}, e.headers), ((t = {})[_] = this.currentToken, t))
                })
            }, e
        }(),
        V = function() {
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
    (k || (k = {})).LoadApi = "loadApi", (L || (L = {})).Time = "time";
    var F, j = function(e) {
            void 0 === e && (e = {
                baseUrl: ""
            }), this.configuration = e, this.baseUrl = this.configuration.baseUrl
        },
        q = function() {
            function e(e) {
                void 0 === e && (e = new j), this.configuration = e, this.baseUrl = e.baseUrl
            }
            return e.prototype.sendEvent = function(e) {
                var t = e.localTime,
                    n = e.target,
                    r = e.eventType,
                    i = e.context,
                    o = e.additionalProperties,
                    a = e.currentUrl,
                    s = e.guestId,
                    u = e.sessionId,
                    c = t.toISOString(),
                    l = new URL("".concat(this.baseUrl, "/pe"));
                return l.searchParams.append("t", n), l.searchParams.append("evt", r), l.searchParams.append("ctx", i), l.searchParams.append("lt", c), l.searchParams.append("url", a || window.location.href), void 0 !== s && l.searchParams.append("gid", s), void 0 !== u && l.searchParams.append("sid", u), void 0 !== o && Object.keys(o).forEach(function(e) {
                    l.searchParams.append(e, o[e].toString())
                }), fetch(l.href, {
                    credentials: "same-origin"
                })
            }, e.prototype.sendEventViaImg = function(e, t) {
                var n = e.localTime,
                    r = e.target,
                    i = e.eventType,
                    o = e.context,
                    a = e.additionalProperties,
                    s = e.currentUrl,
                    u = e.guestId,
                    c = e.sessionId,
                    l = n.toISOString(),
                    f = new URL("".concat(this.baseUrl, "/e.png"));
                f.searchParams.append("t", r), f.searchParams.append("evt", i), f.searchParams.append("ctx", o), f.searchParams.append("lt", l), f.searchParams.append("url", s || window.location.href), void 0 !== u && f.searchParams.append("gid", u), void 0 !== c && f.searchParams.append("sid", c), void 0 !== a && Object.keys(a).forEach(function(e) {
                    f.searchParams.append(e, a[e].toString())
                });
                var p = new Image;
                return p.src = f.href, p.onload = function() {
                    void 0 !== t && t(!0)
                }, p.onerror = function(e) {
                    void 0 !== t && t(!1), console.error(e)
                }, p
            }, e
        }(),
        B = "Grasshopper",
        H = function() {
            function e(e) {
                var t;
                this.eventTracker = (t = new q(new j({
                    baseUrl: "https://ecsv2.".concat(e, "/").concat(B)
                })), {
                    sendEvent: function(e) {
                        var n = {
                            target: B,
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
                    eventType: k.LoadApi,
                    context: L.Time,
                    additionalProperties: {
                        elapsedTime: e.elapsedTime,
                        apiUrl: e.url,
                        statusCode: e.response.status
                    }
                })
            }, e
        }(),
        G = new D,
        z = new V,
        W = function(e) {
            function t(t) {
                void 0 === t && (t = {});
                var n = A({}, t);
                if (Array.isArray(n.middleware) ? n.middleware.unshift(G, z) : n.middleware = [G, z], t.robloxSiteDomain) {
                    var r = new H(t.robloxSiteDomain);
                    n.middleware.unshift(r)
                }
                return e.call(this, n) || this
            }
            return x(t, e), t
        }(M);

    function J(e) {
        return Y(e)
    }

    function Y(e, t) {
        return null == e ? e : {
            userIds: N(e, "userIds") ? e.userIds : void 0
        }
    }

    function Q(e) {
        if (void 0 !== e) return null === e ? null : {
            userIds: e.userIds
        }
    }

    function K(e) {
        return Z(e)
    }

    function Z(e, t) {
        return null == e ? e : {
            location: N(e, "location") ? e.location : void 0,
            placeId: N(e, "placeId") ? e.placeId : void 0,
            disconnect: N(e, "disconnect") ? e.disconnect : void 0
        }
    }

    function X(e) {
        if (void 0 !== e) return null === e ? null : {
            location: e.location,
            placeId: e.placeId,
            disconnect: e.disconnect
        }
    }

    function ee(e) {
        return et(e)
    }

    function et(e, t) {
        return null == e ? e : {
            isInvisible: N(e, "isInvisible") ? e.isInvisible : void 0
        }
    }

    function en(e) {
        if (void 0 !== e) return null === e ? null : {
            isInvisible: e.isInvisible
        }
    }

    function er(e) {
        return ei(e)
    }

    function ei(e, t) {
        return null == e ? e : {
            userIds: N(e, "userIds") ? e.userIds : void 0
        }
    }

    function eo(e) {
        if (void 0 !== e) return null === e ? null : {
            userIds: e.userIds
        }
    }

    function ea(e) {
        return es(e)
    }

    function es(e, t) {
        return null == e ? e : {
            userId: N(e, "userId") ? e.userId : void 0,
            lastOnline: N(e, "lastOnline") ? new Date(e.lastOnline) : void 0
        }
    }

    function eu(e) {
        if (void 0 !== e) return null === e ? null : {
            userId: e.userId,
            lastOnline: void 0 === e.lastOnline ? void 0 : e.lastOnline.toISOString()
        }
    }

    function ec(e) {
        return el(e)
    }

    function el(e, t) {
        return null == e ? e : {
            lastOnlineTimestamps: N(e, "lastOnlineTimestamps") ? e.lastOnlineTimestamps.map(ea) : void 0
        }
    }

    function ef(e) {
        if (void 0 !== e) return null === e ? null : {
            lastOnlineTimestamps: void 0 === e.lastOnlineTimestamps ? void 0 : e.lastOnlineTimestamps.map(eu)
        }
    }

    function ep(e) {
        return ed(e)
    }

    function ed(e, t) {
        return null == e ? e : {
            userPresenceType: N(e, "userPresenceType") ? e.userPresenceType : void 0,
            lastLocation: N(e, "lastLocation") ? e.lastLocation : void 0,
            placeId: N(e, "placeId") ? e.placeId : void 0,
            rootPlaceId: N(e, "rootPlaceId") ? e.rootPlaceId : void 0,
            gameId: N(e, "gameId") ? e.gameId : void 0,
            universeId: N(e, "universeId") ? e.universeId : void 0,
            userId: N(e, "userId") ? e.userId : void 0,
            lastOnline: N(e, "lastOnline") ? new Date(e.lastOnline) : void 0,
            invisibleModeExpiry: N(e, "invisibleModeExpiry") ? new Date(e.invisibleModeExpiry) : void 0
        }
    }

    function eh(e) {
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

    function e$(e) {
        return ev(e)
    }

    function ev(e, t) {
        return null == e ? e : {
            userPresences: N(e, "userPresences") ? e.userPresences.map(ep) : void 0
        }
    }

    function em(e) {
        if (void 0 !== e) return null === e ? null : {
            userPresences: void 0 === e.userPresences ? void 0 : e.userPresences.map(eh)
        }
    }(eg = F || (F = {}))[eg.NUMBER_0 = 0] = "NUMBER_0", eg[eg.NUMBER_1 = 1] = "NUMBER_1", eg[eg.NUMBER_2 = 2] = "NUMBER_2", eg[eg.NUMBER_3 = 3] = "NUMBER_3", eg[eg.NUMBER_4 = 4] = "NUMBER_4";
    var eg, ey, eb, ew, eE, eS = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return x(t, e), t.prototype.v1PresenceLastOnlinePostRaw = function(e, t) {
                return R(this, void 0, void 0, function() {
                    var n, r;
                    return C(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.lastOnlineRequest || void 0 === e.lastOnlineRequest) throw new I("lastOnlineRequest", "Required parameter requestParameters.lastOnlineRequest was null or undefined when calling v1PresenceLastOnlinePost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/presence/last-online",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: Q(e.lastOnlineRequest)
                                }, t)];
                            case 1:
                                return [2, new U(i.sent(), function(e) {
                                    return ec(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1PresenceLastOnlinePost = function(e, t) {
                return R(this, void 0, void 0, function() {
                    return C(this, function(n) {
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
                return R(this, void 0, void 0, function() {
                    var n, r;
                    return C(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.registerAppPresenceRequest || void 0 === e.registerAppPresenceRequest) throw new I("registerAppPresenceRequest", "Required parameter requestParameters.registerAppPresenceRequest was null or undefined when calling v1PresenceRegisterAppPresencePost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/presence/register-app-presence",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: X(e.registerAppPresenceRequest)
                                }, t)];
                            case 1:
                                return [2, new U(i.sent())]
                        }
                    })
                })
            }, t.prototype.v1PresenceRegisterAppPresencePost = function(e, t) {
                return R(this, void 0, void 0, function() {
                    return C(this, function(n) {
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
                return R(this, void 0, void 0, function() {
                    var n, r;
                    return C(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.setInvisibilityRequest || void 0 === e.setInvisibilityRequest) throw new I("setInvisibilityRequest", "Required parameter requestParameters.setInvisibilityRequest was null or undefined when calling v1PresenceSetInvisibilityStatusPost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/presence/set-invisibility-status",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: en(e.setInvisibilityRequest)
                                }, t)];
                            case 1:
                                return [2, new U(i.sent())]
                        }
                    })
                })
            }, t.prototype.v1PresenceSetInvisibilityStatusPost = function(e, t) {
                return R(this, void 0, void 0, function() {
                    return C(this, function(n) {
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
                return R(this, void 0, void 0, function() {
                    var n, r;
                    return C(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.userPresenceRequest || void 0 === e.userPresenceRequest) throw new I("userPresenceRequest", "Required parameter requestParameters.userPresenceRequest was null or undefined when calling v1PresenceUsersPost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/presence/users",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: eo(e.userPresenceRequest)
                                }, t)];
                            case 1:
                                return [2, new U(i.sent(), function(e) {
                                    return e$(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1PresenceUsersPost = function(e, t) {
                return R(this, void 0, void 0, function() {
                    return C(this, function(n) {
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
        }(P),
        eT = Object.freeze({
            __proto__: null,
            PresenceApi: eS,
            RobloxPresenceApiModelsRequestLastOnlineRequestFromJSON: J,
            RobloxPresenceApiModelsRequestLastOnlineRequestFromJSONTyped: Y,
            RobloxPresenceApiModelsRequestLastOnlineRequestToJSON: Q,
            RobloxPresenceApiModelsRequestRegisterAppPresenceRequestFromJSON: K,
            RobloxPresenceApiModelsRequestRegisterAppPresenceRequestFromJSONTyped: Z,
            RobloxPresenceApiModelsRequestRegisterAppPresenceRequestToJSON: X,
            RobloxPresenceApiModelsRequestSetInvisibilityStatusRequestFromJSON: ee,
            RobloxPresenceApiModelsRequestSetInvisibilityStatusRequestFromJSONTyped: et,
            RobloxPresenceApiModelsRequestSetInvisibilityStatusRequestToJSON: en,
            RobloxPresenceApiModelsRequestUserPresenceRequestFromJSON: er,
            RobloxPresenceApiModelsRequestUserPresenceRequestFromJSONTyped: ei,
            RobloxPresenceApiModelsRequestUserPresenceRequestToJSON: eo,
            RobloxPresenceApiModelsResponseLastOnlineFromJSON: ea,
            RobloxPresenceApiModelsResponseLastOnlineFromJSONTyped: es,
            RobloxPresenceApiModelsResponseLastOnlineResponseFromJSON: ec,
            RobloxPresenceApiModelsResponseLastOnlineResponseFromJSONTyped: el,
            RobloxPresenceApiModelsResponseLastOnlineResponseToJSON: ef,
            RobloxPresenceApiModelsResponseLastOnlineToJSON: eu,
            RobloxPresenceApiModelsResponseUserPresenceFromJSON: ep,
            RobloxPresenceApiModelsResponseUserPresenceFromJSONTyped: ed,
            RobloxPresenceApiModelsResponseUserPresenceToJSON: eh,
            get RobloxPresenceApiModelsResponseUserPresenceUserPresenceTypeEnum() {
                return F
            },
            RobloxPresenceApiModelsResponseUserPresencesResponseFromJSON: e$,
            RobloxPresenceApiModelsResponseUserPresencesResponseFromJSONTyped: ev,
            RobloxPresenceApiModelsResponseUserPresencesResponseToJSON: em
        }),
        eO = Object.freeze({
            __proto__: null,
            PresenceApi: eS,
            RobloxPresenceApiModelsRequestLastOnlineRequestFromJSON: J,
            RobloxPresenceApiModelsRequestLastOnlineRequestFromJSONTyped: Y,
            RobloxPresenceApiModelsRequestLastOnlineRequestToJSON: Q,
            RobloxPresenceApiModelsRequestRegisterAppPresenceRequestFromJSON: K,
            RobloxPresenceApiModelsRequestRegisterAppPresenceRequestFromJSONTyped: Z,
            RobloxPresenceApiModelsRequestRegisterAppPresenceRequestToJSON: X,
            RobloxPresenceApiModelsRequestSetInvisibilityStatusRequestFromJSON: ee,
            RobloxPresenceApiModelsRequestSetInvisibilityStatusRequestFromJSONTyped: et,
            RobloxPresenceApiModelsRequestSetInvisibilityStatusRequestToJSON: en,
            RobloxPresenceApiModelsRequestUserPresenceRequestFromJSON: er,
            RobloxPresenceApiModelsRequestUserPresenceRequestFromJSONTyped: ei,
            RobloxPresenceApiModelsRequestUserPresenceRequestToJSON: eo,
            RobloxPresenceApiModelsResponseLastOnlineFromJSON: ea,
            RobloxPresenceApiModelsResponseLastOnlineFromJSONTyped: es,
            RobloxPresenceApiModelsResponseLastOnlineResponseFromJSON: ec,
            RobloxPresenceApiModelsResponseLastOnlineResponseFromJSONTyped: el,
            RobloxPresenceApiModelsResponseLastOnlineResponseToJSON: ef,
            RobloxPresenceApiModelsResponseLastOnlineToJSON: eu,
            RobloxPresenceApiModelsResponseUserPresenceFromJSON: ep,
            RobloxPresenceApiModelsResponseUserPresenceFromJSONTyped: ed,
            RobloxPresenceApiModelsResponseUserPresenceToJSON: eh,
            get RobloxPresenceApiModelsResponseUserPresenceUserPresenceTypeEnum() {
                return F
            },
            RobloxPresenceApiModelsResponseUserPresencesResponseFromJSON: e$,
            RobloxPresenceApiModelsResponseUserPresencesResponseFromJSONTyped: ev,
            RobloxPresenceApiModelsResponseUserPresencesResponseToJSON: em,
            v1: eT
        }),
        ex = eO.v1.RobloxPresenceApiModelsResponseUserPresenceUserPresenceTypeEnum,
        eA = {
            presenceStatusToClassName: ((ey = {})[m.Offline] = "", ey[m.Online] = "online", ey[m.Game] = "game", ey[m.Studio] = "studio", ey[m.Invisible] = "invisible-mode", ey),
            presenceStatusToAngularTranslation: ((eb = {})[m.Offline] = "Label.Offline", eb[m.Online] = "Label.Online", eb[m.Game] = "", eb[m.Studio] = "", eb[m.Invisible] = "Label.Invisible", eb),
            presenceStatusResponseToPresenceStatus: ((ew = {})[ex.NUMBER_0] = m.Offline, ew[ex.NUMBER_1] = m.Online, ew[ex.NUMBER_2] = m.Game, ew[ex.NUMBER_3] = m.Studio, ew[ex.NUMBER_4] = m.Invisible, ew)
        };

    function eR(e, t, n, r) {
        return new(n || (n = Promise))(function(i, o) {
            function a(e) {
                try {
                    u(r.next(e))
                } catch (e) {
                    o(e)
                }
            }

            function s(e) {
                try {
                    u(r.throw(e))
                } catch (e) {
                    o(e)
                }
            }

            function u(e) {
                var t;
                e.done ? i(e.value) : (d(t = e.value, n) ? t : new n(function(e) {
                    e(t)
                })).then(a, s)
            }
            u((r = r.apply(e, t || [])).next())
        })
    }

    function eC(e, t) {
        var n, r, i, o = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function s(s) {
            return function(u) {
                var c = [s, u];
                if (n) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, c[0] && (o = 0)), o;) try {
                    if (n = 1, r && (i = 2 & c[0] ? r.return : c[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, c[1])).done) return i;
                    switch (r = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                        case 0:
                        case 1:
                            i = c;
                            break;
                        case 4:
                            return o.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            o.label++, r = c[1], c = [0];
                            continue;
                        case 7:
                            c = o.ops.pop(), o.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                o.label = c[1];
                                break
                            }
                            if (6 === c[0] && o.label < i[1]) {
                                o.label = i[1], i = c;
                                break
                            }
                            if (i && o.label < i[2]) {
                                o.label = i[2], o.ops.push(c);
                                break
                            }
                            i[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    c = t.call(e, o)
                } catch (e) {
                    c = [6, e], r = 0
                } finally {
                    n = i = 0
                }
                if (5 & c[0]) throw c[1];
                return {
                    value: c[0] ? c[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function eP(e, t, n) {
        if (n || 2 == arguments.length)
            for (var r, i = 0, o = t.length; i < o; i++) !r && i in t || (r || (r = Array.prototype.slice.call(t, 0, i)), r[i] = t[i]);
        return e.concat(r || Array.prototype.slice.call(t))
    }
    "function" == typeof SuppressedError && SuppressedError, (eI = eE || (eE = {})).Strict = "strict", eI.Lax = "lax", eI.None = "none";
    var eI, eM, eN, ek, eL, eU, e_, eD, eV, eF, ej, eq, eB = function() {
        return (eB = Object.assign || function(e) {
            for (var t, n = 1, r = arguments.length; n < r; n++)
                for (var i in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
            return e
        }).apply(this, arguments)
    };
    "function" == typeof SuppressedError && SuppressedError, (ta = eM || (eM = {})).PagingParametersChanged = "Paging parameters were changed", ta.GetItemsFailure = "Unable to get items", ta.InvalidPageNumber = "Invalid page number", (ts = eN || (eN = {}))[ts.Initialized = 0] = "Initialized", ts[ts.Idle = 1] = "Idle", ts[ts.Loading = 2] = "Loading", (tu = ek || (ek = {})).Asc = "Asc", tu.Desc = "Desc", "RelativeTimeFormat" in Intl || function() {
        var e, t, n, r;
        e = this, t = void 0, n = void 0, r = function() {
            return function(e, t) {
                var n, r, i, o = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function s(s) {
                    return function(u) {
                        var c = [s, u];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, c[0] && (o = 0)), o;) try {
                            if (n = 1, r && (i = 2 & c[0] ? r.return : c[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, c[1])).done) return i;
                            switch (r = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                                case 0:
                                case 1:
                                    i = c;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, r = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!((i = (i = o.trys).length > 0 && i[i.length - 1]) || 6 !== c[0] && 2 !== c[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                        o.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && o.label < i[1]) {
                                        o.label = i[1], i = c;
                                        break
                                    }
                                    if (i && o.label < i[2]) {
                                        o.label = i[2], o.ops.push(c);
                                        break
                                    }
                                    i[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            c = t.call(e, o)
                        } catch (e) {
                            c = [6, e], r = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }(this, function(e) {
                switch (e.label) {
                    case 0:
                        return [4, Promise.resolve().then(function() {
                            return to
                        })];
                    case 1:
                        return e.sent(), [4, Promise.resolve().then(function() {
                            return tE
                        })];
                    case 2:
                        return e.sent(), [2]
                }
            })
        }, new(n || (n = Promise))(function(i, o) {
            function a(e) {
                try {
                    u(r.next(e))
                } catch (e) {
                    o(e)
                }
            }

            function s(e) {
                try {
                    u(r.throw(e))
                } catch (e) {
                    o(e)
                }
            }

            function u(e) {
                var t;
                e.done ? i(e.value) : (d(t = e.value, n) ? t : new n(function(e) {
                    e(t)
                })).then(a, s)
            }
            u((r = r.apply(e, t || [])).next())
        })
    }(), (tc = eL || (eL = {})).Edge = "edge", tc.IE = "ie", tc.Chrome = "chrome", tc.Opera = "opera", tc.Safari = "safari", tc.Firefox = "firefox", tc.Unknown = "", (tl = eU || (eU = {}))[tl.Windows = 0] = "Windows", tl[tl.macOS = 1] = "macOS", tl[tl.Linux = 2] = "Linux", tl[tl.Unix = 3] = "Unix", tl[tl.iOS = 4] = "iOS", tl[tl.Android = 5] = "Android", tl[tl.Unknown = 6] = "Unknown", (tf = e_ || (e_ = {})).Unidentified = "Unidentified", tf.Alt = "Alt", tf.AltGraph = "AltGraph", tf.CapsLock = "CapsLock", tf.Control = "Control", tf.Fn = "Fn", tf.FnLock = "FnLock", tf.Hyper = "Hyper", tf.Meta = "Meta", tf.NumLock = "NumLock", tf.ScrollLock = "ScrollLock", tf.Shift = "Shift", tf.Super = "Super", tf.Symbol = "Symbol", tf.SymbolLock = "SymbolLock", tf.Enter = "Enter", tf.Tab = "Tab", tf.ArrowDown = "ArrowDown", tf.ArrowLeft = "ArrowLeft", tf.ArrowRight = "ArrowRight", tf.ArrowUp = "ArrowUp", tf.End = "End", tf.Home = "Home", tf.PageDown = "PageDown", tf.PageUp = "PageUp", tf.Backspace = "Backspace", tf.Clear = "Clear", tf.Copy = "Copy", tf.CrSel = "CrSel", tf.Cut = "Cut", tf.Delete = "Delete", tf.EraseEof = "EraseEof", tf.ExSel = "ExSel", tf.Insert = "Insert", tf.Paste = "Paste", tf.Redo = "Redo", tf.Undo = "Undo", tf.Accept = "Accept", tf.Again = "Again", tf.Attn = "Attn", tf.Cancel = "Cancel", tf.ContextMenu = "ContextMenu", tf.Escape = "Escape", tf.Execute = "Execute", tf.Find = "Find", tf.Finish = "Finish", tf.Help = "Help", tf.Pause = "Pause", tf.Play = "Play", tf.Props = "Props", tf.Select = "Select", tf.ZoomIn = "ZoomIn", tf.ZoomOut = "ZoomOut", tf.BrightnessDown = "BrightnessDown", tf.BrightnessUp = "BrightnessUp", tf.Eject = "Eject", tf.LogOff = "LogOff", tf.Power = "Power", tf.PowerOff = "PowerOff", tf.PrintScreen = "PrintScreen", tf.Hibernate = "Hibernate", tf.Standby = "Standby", tf.WakeUp = "WakeUp", tf.AllCandidates = "AllCandidates", tf.Alphanumeric = "Alphanumeric", tf.CodeInput = "CodeInput", tf.Compose = "Compose", tf.Convert = "Convert", tf.Dead = "Dead", tf.FinalMode = "FinalMode", tf.GroupFirst = "GroupFirst", tf.GroupLast = "GroupLast", tf.GroupNext = "GroupNext", tf.GroupPrevious = "GroupPrevious", tf.ModeChange = "ModeChange", tf.NextCandidate = "NextCandidate", tf.NonConvert = "NonConvert", tf.PreviousCandidate = "PreviousCandidate", tf.Process = "Process", tf.SingleCandidate = "SingleCandidate", tf.HangulMode = "HangulMode", tf.HanjaMode = "HanjaMode", tf.JunjaMode = "JunjaMode", tf.Eisu = "Eisu", tf.Hankaku = "Hankaku", tf.Hiragana = "Hiragana", tf.HiraganaKatakana = "HiraganaKatakana", tf.KanaMode = "KanaMode", tf.KanjiMode = "KanjiMode", tf.Katakana = "Katakana", tf.Romaji = "Romaji", tf.Zenkaku = "Zenkaku", tf.ZenkakuHanaku = "ZenkakuHanaku", tf.F1 = "F1", tf.F2 = "F2", tf.F3 = "F3", tf.F4 = "F4", tf.F5 = "F5", tf.F6 = "F6", tf.F7 = "F7", tf.F8 = "F8", tf.F9 = "F9", tf.F10 = "F10", tf.F11 = "F11", tf.F12 = "F12", tf.F13 = "F13", tf.F14 = "F14", tf.F15 = "F15", tf.F16 = "F16", tf.F17 = "F17", tf.F18 = "F18", tf.F19 = "F19", tf.F20 = "F20", tf.Soft1 = "Soft1", tf.Soft2 = "Soft2", tf.Soft3 = "Soft3", tf.Soft4 = "Soft4", tf.AppSwitch = "AppSwitch", tf.Call = "Call", tf.Camera = "Camera", tf.CameraFocus = "CameraFocus", tf.EndCall = "EndCall", tf.GoBack = "GoBack", tf.GoHome = "GoHome", tf.HeadsetHook = "HeadsetHook", tf.LastNumberRedial = "LastNumberRedial", tf.Notification = "Notification", tf.MannerMode = "MannerMode", tf.VoiceDial = "VoiceDial", tf.ChannelDown = "ChannelDown", tf.ChannelUp = "ChannelUp", tf.MediaFastForward = "MediaFastForward", tf.MediaPause = "MediaPause", tf.MediaPlay = "MediaPlay", tf.MediaPlayPause = "MediaPlayPause", tf.MediaRecord = "MediaRecord", tf.MediaRewind = "MediaRewind", tf.MediaStop = "MediaStop", tf.MediaTrackNext = "MediaTrackNext", tf.MediaTrackPrevious = "MediaTrackPrevious", tf.AudioBalanceLeft = "AudioBalanceLeft", tf.AudioBalanceRight = "AudioBalanceRight", tf.AudioBassDown = "AudioBassDown", tf.AudioBassBoostDown = "AudioBassBoostDown", tf.AudioBassBoostToggle = "AudioBassBoostToggle", tf.AudioBassBoostUp = "AudioBassBoostUp", tf.AudioBassUp = "AudioBassUp", tf.AudioFaderFront = "AudioFaderFront", tf.AudioFaderRear = "AudioFaderRear", tf.AudioSurroundModeNext = "AudioSurroundModeNext", tf.AudioTrebleDown = "AudioTrebleDown", tf.AudioTrebleUp = "AudioTrebleUp", tf.AudioVolumeDown = "AudioVolumeDown", tf.AudioVolumeMute = "AudioVolumeMute", tf.AudioVolumeUp = "AudioVolumeUp", tf.MicrophoneToggle = "MicrophoneToggle", tf.MicrophoneVolumeDown = "MicrophoneVolumeDown", tf.MicrophoneVolumeMute = "MicrophoneVolumeMute", tf.MicrophoneVolumeUp = "MicrophoneVolumeUp", tf.TV = "TV", tf.TV3DMode = "TV3DMode", tf.TVAntennaCable = "TVAntennaCable", tf.TVAudioDescription = "TVAudioDescription", tf.TVAudioDescriptionMixDown = "TVAudioDescriptionMixDown", tf.TVAudioDescriptionMixUp = "TVAudioDescriptionMixUp", tf.TVContentsMenu = "TVContentsMenu", tf.TVDataService = "TVDataService", tf.TVInput = "TVInput", tf.TVInputComponent1 = "TVInputComponent1", tf.TVInputComponent2 = "TVInputComponent2", tf.TVInputComposite1 = "TVInputComposite1", tf.TVInputComposite2 = "TVInputComposite2", tf.TVInputHDMI1 = "TVInputHDMI1", tf.TVInputHDMI2 = "TVInputHDMI2", tf.TVInputHDMI3 = "TVInputHDMI3", tf.TVInputHDMI4 = "TVInputHDMI4", tf.TVInputVGA1 = "TVInputVGA1", tf.TVMediaContext = "TVMediaContext", tf.TVNetwork = "TVNetwork", tf.TVNumberEntry = "TVNumberEntry", tf.TVPower = "TVPower", tf.TVRadioService = "TVRadioService", tf.TVSatellite = "TVSatellite", tf.TVSatelliteBS = "TVSatelliteBS", tf.TVSatelliteCS = "TVSatelliteCS", tf.TVSatelliteToggle = "TVSatelliteToggle", tf.TVTerrestrialAnalog = "TVTerrestrialAnalog", tf.TVTerrestrialDigital = "TVTerrestrialDigital", tf.TVTimer = "TVTimer", tf.AVRInput = "AVRInput", tf.AVRPower = "AVRPower", tf.ColorF0Red = "ColorF0Red", tf.ColorF1Green = "ColorF1Green", tf.ColorF2Yellow = "ColorF2Yellow", tf.ColorF3Blue = "ColorF3Blue", tf.ColorF4Grey = "ColorF4Grey", tf.ColorF5Brown = "ColorF5Brown", tf.ClosedCaptionToggle = "ClosedCaptionToggle", tf.Dimmer = "Dimmer", tf.DisplaySwap = "DisplaySwap", tf.DVR = "DVR", tf.Exit = "Exit", tf.FavoriteClear0 = "FavoriteClear0", tf.FavoriteClear1 = "FavoriteClear1", tf.FavoriteClear2 = "FavoriteClear2", tf.FavoriteClear3 = "FavoriteClear3", tf.FavoriteRecall0 = "FavoriteRecall0", tf.FavoriteRecall1 = "FavoriteRecall1", tf.FavoriteRecall2 = "FavoriteRecall2", tf.FavoriteRecall3 = "FavoriteRecall3", tf.FavoriteStore0 = "FavoriteStore0", tf.FavoriteStore1 = "FavoriteStore1", tf.FavoriteStore2 = "FavoriteStore2", tf.FavoriteStore3 = "FavoriteStore3", tf.Guide = "Guide", tf.GuideNextDay = "GuideNextDay", tf.GuidePreviousDay = "GuidePreviousDay", tf.Info = "Info", tf.InstantReplay = "InstantReplay", tf.Link = "Link", tf.ListProgram = "ListProgram", tf.LiveContent = "LiveContent", tf.Lock = "Lock", tf.MediaApps = "MediaApps", tf.MediaAudioTrack = "MediaAudioTrack", tf.MediaLast = "MediaLast", tf.MediaSkipBackward = "MediaSkipBackward", tf.MediaSkipForward = "MediaSkipForward", tf.MediaStepBackward = "MediaStepBackward", tf.MediaStepForward = "MediaStepForward", tf.MediaTopMenu = "MediaTopMenu", tf.NavigateIn = "NavigateIn", tf.NavigateNext = "NavigateNext", tf.NavigateOut = "NavigateOut", tf.NavigatePrevious = "NavigatePrevious", tf.NextFavoriteChannel = "NextFavoriteChannel", tf.NextUserProfile = "NextUserProfile", tf.OnDemand = "OnDemand", tf.Pairing = "Pairing", tf.PinPDown = "PinPDown", tf.PinPMove = "PinPMove", tf.PinPToggle = "PinPToggle", tf.PinPUp = "PinPUp", tf.PlaySpeedDown = "PlaySpeedDown", tf.PlaySpeedReset = "PlaySpeedReset", tf.PlaySpeedUp = "PlaySpeedUp", tf.RandomToggle = "RandomToggle", tf.RcLowBattery = "RcLowBattery", tf.RecordSpeedNext = "RecordSpeedNext", tf.RfBypass = "RfBypass", tf.ScanChannelsToggle = "ScanChannelsToggle", tf.ScreenModeNext = "ScreenModeNext", tf.Settings = "Settings", tf.SplitScreenToggle = "SplitScreenToggle", tf.STBInput = "STBInput", tf.STBPower = "STBPower", tf.Subtitle = "Subtitle", tf.Teletext = "Teletext", tf.VideoModeNext = "VideoModeNext", tf.Wink = "Wink", tf.ZoomToggle = "ZoomToggle", tf.SpeechCorrectionList = "SpeechCorrectionList", tf.SpeechInputToggle = "SpeechInputToggle", tf.Close = "Close", tf.New = "New", tf.Open = "Open", tf.Print = "Print", tf.Save = "Save", tf.SpellCheck = "SpellCheck", tf.MailForward = "MailForward", tf.MailReply = "MailReply", tf.MailSend = "MailSend", tf.LaunchCalculator = "LaunchCalculator", tf.LaunchCalendar = "LaunchCalendar", tf.LaunchContacts = "LaunchContacts", tf.LaunchMail = "LaunchMail", tf.LaunchMediaPlayer = "LaunchMediaPlayer", tf.LaunchMusicPlayer = "LaunchMusicPlayer", tf.LaunchMyComputer = "LaunchMyComputer", tf.LaunchPhone = "LaunchPhone", tf.LaunchScreenSaver = "LaunchScreenSaver", tf.LaunchSpreadsheet = "LaunchSpreadsheet", tf.LaunchWebBrowser = "LaunchWebBrowser", tf.LaunchWebCam = "LaunchWebCam", tf.LaunchWordProcessor = "LaunchWordProcessor", tf.LaunchApplication1 = "LaunchApplication1", tf.LaunchApplication2 = "LaunchApplication2", tf.LaunchApplication3 = "LaunchApplication3", tf.LaunchApplication4 = "LaunchApplication4", tf.LaunchApplication5 = "LaunchApplication5", tf.LaunchApplication6 = "LaunchApplication6", tf.LaunchApplication7 = "LaunchApplication7", tf.LaunchApplication8 = "LaunchApplication8", tf.LaunchApplication9 = "LaunchApplication9", tf.LaunchApplication10 = "LaunchApplication10", tf.LaunchApplication11 = "LaunchApplication11", tf.LaunchApplication12 = "LaunchApplication12", tf.LaunchApplication13 = "LaunchApplication13", tf.LaunchApplication14 = "LaunchApplication14", tf.LaunchApplication15 = "LaunchApplication15", tf.LaunchApplication16 = "LaunchApplication16", tf.BrowserBack = "BrowserBack", tf.BrowserFavorites = "BrowserFavorites", tf.BrowserForward = "BrowserForward", tf.BrowserHome = "BrowserHome", tf.BrowserRefresh = "BrowserRefresh", tf.BrowserSearch = "BrowserSearch", tf.BrowserStop = "BrowserStop", tf.Decimal = "Decimal", tf.Key11 = "Key11", tf.Key12 = "Key12", tf.Multiply = "Multiply", tf.Add = "Add", tf.Divide = "Divide", tf.Subtract = "Subtract", tf.Separator = "Separator", (tp = eD || (eD = {}))[tp.ACCEPTED = 202] = "ACCEPTED", tp[tp.BAD_GATEWAY = 502] = "BAD_GATEWAY", tp[tp.BAD_REQUEST = 400] = "BAD_REQUEST", tp[tp.CONFLICT = 409] = "CONFLICT", tp[tp.CONTINUE = 100] = "CONTINUE", tp[tp.CREATED = 201] = "CREATED", tp[tp.EXPECTATION_FAILED = 417] = "EXPECTATION_FAILED", tp[tp.FAILED_DEPENDENCY = 424] = "FAILED_DEPENDENCY", tp[tp.FORBIDDEN = 403] = "FORBIDDEN", tp[tp.GATEWAY_TIMEOUT = 504] = "GATEWAY_TIMEOUT", tp[tp.GONE = 410] = "GONE", tp[tp.HTTP_VERSION_NOT_SUPPORTED = 505] = "HTTP_VERSION_NOT_SUPPORTED", tp[tp.IM_A_TEAPOT = 418] = "IM_A_TEAPOT", tp[tp.INSUFFICIENT_SPACE_ON_RESOURCE = 419] = "INSUFFICIENT_SPACE_ON_RESOURCE", tp[tp.INSUFFICIENT_STORAGE = 507] = "INSUFFICIENT_STORAGE", tp[tp.INTERNAL_SERVER_ERROR = 500] = "INTERNAL_SERVER_ERROR", tp[tp.LENGTH_REQUIRED = 411] = "LENGTH_REQUIRED", tp[tp.LOCKED = 423] = "LOCKED", tp[tp.METHOD_FAILURE = 420] = "METHOD_FAILURE", tp[tp.METHOD_NOT_ALLOWED = 405] = "METHOD_NOT_ALLOWED", tp[tp.MOVED_PERMANENTLY = 301] = "MOVED_PERMANENTLY", tp[tp.MOVED_TEMPORARILY = 302] = "MOVED_TEMPORARILY", tp[tp.MULTI_STATUS = 207] = "MULTI_STATUS", tp[tp.MULTIPLE_CHOICES = 300] = "MULTIPLE_CHOICES", tp[tp.NETWORK_AUTHENTICATION_REQUIRED = 511] = "NETWORK_AUTHENTICATION_REQUIRED", tp[tp.NO_CONTENT = 204] = "NO_CONTENT", tp[tp.NON_AUTHORITATIVE_INFORMATION = 203] = "NON_AUTHORITATIVE_INFORMATION", tp[tp.NOT_ACCEPTABLE = 406] = "NOT_ACCEPTABLE", tp[tp.NOT_FOUND = 404] = "NOT_FOUND", tp[tp.NOT_IMPLEMENTED = 501] = "NOT_IMPLEMENTED", tp[tp.NOT_MODIFIED = 304] = "NOT_MODIFIED", tp[tp.OK = 200] = "OK", tp[tp.PARTIAL_CONTENT = 206] = "PARTIAL_CONTENT", tp[tp.PAYMENT_REQUIRED = 402] = "PAYMENT_REQUIRED", tp[tp.PERMANENT_REDIRECT = 308] = "PERMANENT_REDIRECT", tp[tp.PRECONDITION_FAILED = 412] = "PRECONDITION_FAILED", tp[tp.PRECONDITION_REQUIRED = 428] = "PRECONDITION_REQUIRED", tp[tp.PROCESSING = 102] = "PROCESSING", tp[tp.PROXY_AUTHENTICATION_REQUIRED = 407] = "PROXY_AUTHENTICATION_REQUIRED", tp[tp.REQUEST_HEADER_FIELDS_TOO_LARGE = 431] = "REQUEST_HEADER_FIELDS_TOO_LARGE", tp[tp.REQUEST_TIMEOUT = 408] = "REQUEST_TIMEOUT", tp[tp.REQUEST_TOO_LONG = 413] = "REQUEST_TOO_LONG", tp[tp.REQUEST_URI_TOO_LONG = 414] = "REQUEST_URI_TOO_LONG", tp[tp.REQUESTED_RANGE_NOT_SATISFIABLE = 416] = "REQUESTED_RANGE_NOT_SATISFIABLE", tp[tp.RESET_CONTENT = 205] = "RESET_CONTENT", tp[tp.SEE_OTHER = 303] = "SEE_OTHER", tp[tp.SERVICE_UNAVAILABLE = 503] = "SERVICE_UNAVAILABLE", tp[tp.SWITCHING_PROTOCOLS = 101] = "SWITCHING_PROTOCOLS", tp[tp.TEMPORARY_REDIRECT = 307] = "TEMPORARY_REDIRECT", tp[tp.TOO_MANY_REQUESTS = 429] = "TOO_MANY_REQUESTS", tp[tp.UNAUTHORIZED = 401] = "UNAUTHORIZED", tp[tp.UNAVAILABLE_FOR_LEGAL_REASONS = 451] = "UNAVAILABLE_FOR_LEGAL_REASONS", tp[tp.UNPROCESSABLE_ENTITY = 422] = "UNPROCESSABLE_ENTITY", tp[tp.UNSUPPORTED_MEDIA_TYPE = 415] = "UNSUPPORTED_MEDIA_TYPE", tp[tp.USE_PROXY = 305] = "USE_PROXY", (td = eV || (eV = {})).ACCEPTED = "Accepted", td.BAD_GATEWAY = "Bad Gateway", td.BAD_REQUEST = "Bad Request", td.CONFLICT = "Conflict", td.CONTINUE = "Continue", td.CREATED = "Created", td.EXPECTATION_FAILED = "Expectation Failed", td.FAILED_DEPENDENCY = "Failed Dependency", td.FORBIDDEN = "Forbidden", td.GATEWAY_TIMEOUT = "Gateway Timeout", td.GONE = "Gone", td.HTTP_VERSION_NOT_SUPPORTED = "HTTP Version Not Supported", td.IM_A_TEAPOT = "I'm a teapot", td.INSUFFICIENT_SPACE_ON_RESOURCE = "Insufficient Space on Resource", td.INSUFFICIENT_STORAGE = "Insufficient Storage", td.INTERNAL_SERVER_ERROR = "Internal Server Error", td.LENGTH_REQUIRED = "Length Required", td.LOCKED = "Locked", td.METHOD_FAILURE = "Method Failure", td.METHOD_NOT_ALLOWED = "Method Not Allowed", td.MOVED_PERMANENTLY = "Moved Permanently", td.MOVED_TEMPORARILY = "Moved Temporarily", td.MULTI_STATUS = "Multi-Status", td.MULTIPLE_CHOICES = "Multiple Choices", td.NETWORK_AUTHENTICATION_REQUIRED = "Network Authentication Required", td.NO_CONTENT = "No Content", td.NON_AUTHORITATIVE_INFORMATION = "Non Authoritative Information", td.NOT_ACCEPTABLE = "Not Acceptable", td.NOT_FOUND = "Not Found", td.NOT_IMPLEMENTED = "Not Implemented", td.NOT_MODIFIED = "Not Modified", td.OK = "OK", td.PARTIAL_CONTENT = "Partial Content", td.PAYMENT_REQUIRED = "Payment Required", td.PERMANENT_REDIRECT = "Permanent Redirect", td.PRECONDITION_FAILED = "Precondition Failed", td.PRECONDITION_REQUIRED = "Precondition Required", td.PROCESSING = "Processing", td.PROXY_AUTHENTICATION_REQUIRED = "Proxy Authentication Required", td.REQUEST_HEADER_FIELDS_TOO_LARGE = "Request Header Fields Too Large", td.REQUEST_TIMEOUT = "Request Timeout", td.REQUEST_TOO_LONG = "Request Entity Too Large", td.REQUEST_URI_TOO_LONG = "Request-URI Too Long", td.REQUESTED_RANGE_NOT_SATISFIABLE = "Requested Range Not Satisfiable", td.RESET_CONTENT = "Reset Content", td.SEE_OTHER = "See Other", td.SERVICE_UNAVAILABLE = "Service Unavailable", td.SWITCHING_PROTOCOLS = "Switching Protocols", td.TEMPORARY_REDIRECT = "Temporary Redirect", td.TOO_MANY_REQUESTS = "Too Many Requests", td.UNAUTHORIZED = "Unauthorized", td.UNAVAILABLE_FOR_LEGAL_REASONS = "Unavailable For Legal Reasons", td.UNPROCESSABLE_ENTITY = "Unprocessable Entity", td.UNSUPPORTED_MEDIA_TYPE = "Unsupported Media Type", td.USE_PROXY = "Use Proxy", (th = eF || (eF = {})).CONNECT = "CONNECT", th.DELETE = "DELETE", th.GET = "GET", th.HEAD = "HEAD", th.OPTIONS = "OPTIONS", th.PATCH = "PATCH", th.POST = "POST", th.PUT = "PUT", th.TRACE = "TRACE", (t$ = ej || (ej = {})).withPlus = "withPlus", t$.withoutPlus = "withoutPlus", (tv = eq || (eq = {})).processFailure = "processFailure", tv.unretriableFailure = "unretriableFailure", tv.maxAttemptsReached = "maxAttemptsReached";
    for (var eH = function(e, t) {
            return function(n) {
                return Math.min(t, Math.pow(2, n - 1) * e)
            }
        }, eG = function() {
            function e() {
                this.completeItems = new Map, this.requestQueue = [], this.runningBatchCount = 0
            }
            return e.prototype.handleBatchResult = function(e, t, n, r) {
                var i = this,
                    o = 0,
                    a = (new Date).getTime();
                t.forEach(function(e) {
                    if (i.completeItems.has(e.key)) e.resolve(i.completeItems.get(e.key));
                    else if (r.maxRetryAttempts && r.maxRetryAttempts > 0 && n !== eq.unretriableFailure) {
                        var t, s = (t = e.retryAttempts, r.getFailureCooldown ? r.getFailureCooldown(t) : 1e3);
                        o = o > 0 ? Math.min(o, s) : s, e.retryAttempts + 1 <= r.maxRetryAttempts ? (e.retryAttempts += 1, e.queueAfter = a + s, i.requestQueue.unshift(e)) : e.reject(eq.maxAttemptsReached)
                    } else e.reject(n)
                }), this.runningBatchCount -= 1, o > 0 ? setTimeout(function() {
                    return i.processQueue(e, r)
                }, o + r.processBatchWaitTime) : this.processQueue(e, r)
            }, e.prototype.processQueue = function(e, t) {
                var n, r = this;
                if (!(this.runningBatchCount >= t.maxConcurrentBatches)) {
                    for (var i = [], o = new Map, a = [], s = (new Date).getTime(); i.length < t.batchSize && this.requestQueue.length > 0;) {
                        var u = this.requestQueue.shift();
                        u && (u.queueAfter > s ? (o.set(u.key, u), a.push(u)) : this.completeItems.has(u.key) ? u.resolve(this.completeItems.get(u.key)) : o.has(u.key) ? a.push(u) : (o.set(u.key, u), i.push(u)))
                    }(n = this.requestQueue).push.apply(n, a), i.length <= 0 || (this.runningBatchCount += 1, e(i).then(function(n) {
                        Object.keys(n).forEach(function(e) {
                            r.saveCompleteItem(e, n[e], t)
                        }), r.handleBatchResult(e, i, eq.processFailure, t)
                    }, function(n) {
                        r.handleBatchResult(e, i, n, t)
                    }))
                }
            }, e.prototype.saveCompleteItem = function(e, t, n) {
                var r = this;
                this.completeItems.set(e, t), n.getItemExpiration && setTimeout(function() {
                    r.completeItems.delete(e)
                }, n.getItemExpiration(e))
            }, e.prototype.queueItem = function(e, t, n, r) {
                var i = this;
                return new Promise(function(o, a) {
                    i.requestQueue.push({
                        key: n(e),
                        itemId: e,
                        retryAttempts: 0,
                        queueAfter: 0,
                        startTime: new Date,
                        resolve: o,
                        reject: a
                    }), setTimeout(function() {
                        return i.processQueue(t, r)
                    }, r.processBatchWaitTime)
                })
            }, e.prototype.invalidateItem = function(e, t) {
                this.completeItems.delete(t(e))
            }, e
        }(), ez = function() {
            function e() {
                this.createExponentialBackoffCooldown = eH, this.createQueueProcessor = function(e, t, n) {
                    var r = new eG;
                    return {
                        queueItem: function(i) {
                            return r.queueItem(i, e, t, n)
                        },
                        invalidateItem: function(e) {
                            return r.invalidateItem(e, t)
                        }
                    }
                }
            }
            return e.prototype.createRequestProcessor = function(e, t, n) {
                var r = eB({
                    processBatchWaitTime: 250,
                    maxConcurrentBatches: 5
                }, n);
                return this.createQueueProcessor(e, t, r)
            }, e
        }(), eW = [], eJ = 0; eJ < 256; ++eJ) eW.push((eJ + 256).toString(16).substr(1));
    var eY = "RelativeTimeFormat" in Intl,
        eQ = ["lookup", "best fit"],
        eK = ["long", "short", "narrow"],
        eZ = ["always", "auto"],
        eX = ["second", "minute", "hour", "day", "week", "month", "quarter", "year"];

    function e0(e) {
        if (null == e) throw TypeError("Argument ".concat(e, " cannot be converted to an Object"));
        return "boolean" == typeof e ? new Boolean(e) : "number" == typeof e ? new Number(e) : "string" == typeof e ? new String(e) : "symbol" == (void 0 === e ? "undefined" : v(e)) ? Object(e) : e
    }
    var e1 = /-u(?:-[0-9a-z]{2,8})+/gi;

    function e2(e) {
        return e.replace(e1, "")
    }

    function e3(e, t) {
        for (var n = t;;) {
            if (e.includes(n)) return n;
            var r = n.lastIndexOf("-");
            if (-1 === r) return;
            r >= 2 && "-" === n.charAt(r - 2) && (r -= 2), n = n.slice(0, r)
        }
    }

    function e4(e) {
        return "[object Object]" === Object.prototype.toString.call(e)
    }

    function e5(e, t, n, r, i) {
        var o = function(e, t) {
            if ("object" != (void 0 === e ? "undefined" : v(e))) throw TypeError("Given argument ".concat(e, " must be of type Object"));
            if ("string" != typeof t && "symbol" != (void 0 === t ? "undefined" : v(t))) throw TypeError("Given argument ".concat(t, " must be a PropertyKey"));
            return e[t]
        }(e, t);
        if (void 0 !== o) {
            if ("boolean" !== n && "string" !== n) throw TypeError("Expected type ".concat(n, " to be 'boolean' or 'string"));
            if ("boolean" === n && (o = !!o), "string" === n && (o += ""), void 0 !== r && !r.includes(o)) throw RangeError("Value ".concat(o, " out of range for options property ").concat(t));
            return o
        }
        return i
    }
    var e6 = new WeakMap,
        e9 = ["nu"],
        e8 = {},
        e7 = [];

    function te(e, t, n) {
        var r = e6.get(e);
        null == r && (r = Object.create(null), e6.set(e, r)), r[t] = n
    }

    function tt(e, t) {
        var n = e6.get(e);
        if (null == n) throw ReferenceError("No internal slots has been allocated for the given instance of RelativeTimeFormat");
        return n[t]
    }

    function tn(e, t) {
        var n = e6.get(e);
        return null != n && t in n
    }

    function tr(e, t, n) {
        if (!tn(e, "initializedRelativeTimeFormat")) throw TypeError("Internal function called on incompatible receiver ".concat(e.toString()));
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
            if (!eX.some(function(t) {
                    return t === e
                })) throw RangeError("Unit: '".concat(e, "' must be one of: ").concat(eX.map(function(e) {
                return '"'.concat(e, '"')
            }).join(", ")));
            return e
        }(n);
        var r = tt(e, "fields"),
            i = tt(e, "style"),
            o = "short" === i ? "".concat(n, "-short") : "narrow" === i ? "".concat(n, "-narrow") : n,
            a = o in r;
        a || (o = n);
        var s = r[o];
        if (null == s) throw TypeError("Could not match entry: '".concat(o, "' inside fields for locale: '").concat(tt(e, "locale"), "'"));
        if ("auto" === tt(e, "numeric") && (a = t + "" in s)) return [{
            type: "literal",
            value: s[t + ""]
        }];
        var u = s[Object.is(t, -0) || t < 0 ? "past" : "future"],
            c = tt(e, "numberFormat").formatToParts(Math.abs(t));
        return function(e, t, n) {
            for (var r = [], i = String.prototype.indexOf.call(e, "{", 0), o = 0, a = 0, s = e.length; void 0 !== e[i];) {
                if (-1 === (o = String.prototype.indexOf.call(e, "}", i))) throw RangeError("The pattern: '".concat(e, "' is malformed"));
                if (i > a) {
                    var u = e.slice(a, i);
                    r.push({
                        type: "literal",
                        value: u
                    })
                }
                var c = e.slice(i + 1, o);
                if ("0" !== c) throw TypeError("Expected ".concat(c, ' to be "0"'));
                var l = !0,
                    f = !1,
                    p = void 0;
                try {
                    for (var d, v = n[Symbol.iterator](); !(l = (d = v.next()).done); l = !0) {
                        var m = d.value;
                        "literal" === m.type ? r.push($(h({}, m), {
                            type: m.type
                        })) : r.push($(h({}, m), {
                            unit: t
                        }))
                    }
                } catch (e) {
                    f = !0, p = e
                } finally {
                    try {
                        l || null == v.return || v.return()
                    } finally {
                        if (f) throw p
                    }
                }
                a = o + 1, i = String.prototype.indexOf.call(e, "{", a)
            }
            if (a < s) {
                var g = e.slice(a, s);
                r.push({
                    type: "literal",
                    value: g
                })
            }
            return r
        }(u[function(e, t) {
            if (!tn(e, "pluralRules")) throw TypeError("Given instance of of Intl.RelativeTimeFormat must have an [[InitializedPluralRules]] internal slot");
            if ("number" != typeof t) throw TypeError("Argument 'n' must be a number");
            return isFinite(t) ? tt(e, "pluralRules").select(t) : "other"
        }(e, t)], n, c)
    }
    var ti = function() {
        var e, t;

        function n() {
            if (!(this instanceof n)) throw TypeError("Cannot call a class as a function");
            var e = arguments[0],
                t = arguments[1];
            if (void 0 === (d(this, n) ? this.constructor : void 0)) throw TypeError("Constructor Intl.RelativeTimeFormat requires 'new'");
            var r = Intl.getCanonicalLocales(e);
            t = void 0 === t ? Object.create(null) : e0(t);
            var i = Object.create(null);
            i.localeMatcher = e5(t, "localeMatcher", "string", eQ, "best fit");
            var o = function(e, t, n, r, i) {
                    var o = (n.localeMatcher, function(e) {
                            var t = e.availableLocales,
                                n = e.requestedLocales,
                                r = {},
                                i = !0,
                                o = !1,
                                a = void 0;
                            try {
                                for (var s, u = n[Symbol.iterator](); !(i = (s = u.next()).done); i = !0) {
                                    var c = s.value,
                                        l = e2(c),
                                        f = e3(t, l);
                                    if (void 0 !== f) {
                                        if (r.locale = f, c !== l) {
                                            var p = c.match(e1);
                                            r.extension = null == p ? "" : p[0]
                                        }
                                        return r
                                    }
                                }
                            } catch (e) {
                                o = !0, a = e
                            } finally {
                                try {
                                    i || null == u.return || u.return()
                                } finally {
                                    if (o) throw a
                                }
                            }
                            return r.locale = function() {
                                if (null == tm) throw ReferenceError("Could not determine locale: No default locale has been configured");
                                return tm
                            }(), r
                        }({
                            availableLocales: e,
                            requestedLocales: t
                        })),
                        a = o.locale,
                        s = {};
                    s.dataLocale = a;
                    var u = "-u",
                        c = !0,
                        l = !1,
                        f = void 0;
                    try {
                        for (var p, d = r[Symbol.iterator](); !(c = (p = d.next()).done); c = !0) {
                            var h = p.value,
                                $ = i[a];
                            if (!e4($)) throw TypeError("LocaleData for locale: '".concat(a, "' must be an object"));
                            var m = $[h];
                            if (!Array.isArray(m) && !e4(m)) throw TypeError("key: '".concat(h, "' in LocaleData for locale: '").concat(a, "' must be indexable"));
                            var g = m[0];
                            if ("string" != typeof g && null !== g) throw TypeError("value: '".concat(g, "' for key: '").concat(h, "' in LocaleData for locale: '").concat(a, "' must be a string or null"));
                            var y = "";
                            if ("extension" in o) {
                                var b = function(e, t) {
                                    if (2 !== t.length) throw TypeError("Could not get UnicodeExtensionValue: The given key: '".concat(t, "' must have a length of 2"));
                                    var n = t.length,
                                        r = "-".concat(t, "-"),
                                        i = String.prototype.indexOf.call(e, r);
                                    if (-1 !== i) {
                                        for (var o = i + 4, a = o, s = o, u = !1; !u;) {
                                            var c = String.prototype.indexOf.call(e, "-", s);
                                            2 == (-1 === c ? n - s : c - s) ? u = !0 : -1 === c ? (a = n, u = !0) : (a = c, s = c + 1)
                                        }
                                        return e.slice(o, a)
                                    }
                                    if (r = "-".concat(t), -1 !== (i = String.prototype.indexOf.call(e, r)) && i + 3 === n) return ""
                                }(o.extension, h);
                                void 0 !== b && ("" !== b ? m.includes(b) && (g = b, y = "-".concat(h, "-").concat(g)) : m.includes("true") && (g = "true"))
                            }
                            if ("key" in n) {
                                var w, E = n.key;
                                if ("string" != typeof E && null != E) throw TypeError("options value: '".concat(E, "' must be a string, undefined, or null"));
                                void 0 !== E && m.includes(E) && (w = g, (void 0 === E ? "undefined" : v(E)) == (void 0 === w ? "undefined" : v(w)) && ("number" == typeof E ? !(!isNaN(E) || !isNaN(w)) || (!Object.is(E, 0) || !Object.is(w, -0)) && E === w : function(e, t) {
                                    if ("number" == typeof e) throw TypeError("First argument 'x' must not be a number");
                                    if ((void 0 === e ? "undefined" : v(e)) != (void 0 === t ? "undefined" : v(t))) throw TypeError("The given arguments must have the same type");
                                    return null == e || ("string" == typeof e || "boolean" == typeof e ? e === t : "symbol" == (void 0 === e ? "undefined" : v(e)) ? e.valueOf() === t.valueOf() : e === t)
                                }(E, w)) || (g = E, y = ""))
                            }
                            s[h] = g, u += y
                        }
                    } catch (e) {
                        l = !0, f = e
                    } finally {
                        try {
                            c || null == d.return || d.return()
                        } finally {
                            if (l) throw f
                        }
                    }
                    if (u.length > 2) {
                        var S = String.prototype.indexOf.call(a, "-x-");
                        if (-1 === S) a = "".concat(a).concat(u);
                        else {
                            var T = a.slice(0, S),
                                O = a.slice(S);
                            a = "".concat(T).concat(u).concat(O)
                        }
                        a = Intl.getCanonicalLocales(a)[0]
                    }
                    return s.locale = a, s
                }(e7, r, i, e9, e8),
                a = o.locale;
            te(this, "locale", a), te(this, "numberingSystem", o.nu);
            var s = o.dataLocale;
            te(this, "style", e5(t, "style", "string", eK, "long")), te(this, "numeric", e5(t, "numeric", "string", eZ, "always"));
            var u = e8[s];
            if (!d(u, Object)) throw TypeError("Expected the LocaleDataEntry for locale: '".concat(s, "' to be an Object"));
            te(this, "fields", u), te(this, "numberFormat", new Intl.NumberFormat(a)), te(this, "pluralRules", new Intl.PluralRules(a)), te(this, "initializedRelativeTimeFormat", this)
        }
        return e = [{
            key: "format",
            value: function(e, t) {
                if (!d(this, Object) || !tn(this, "initializedRelativeTimeFormat")) throw TypeError("Method Intl.RelativeTimeFormat.prototype.format called on incompatible receiver ".concat(this.toString()));
                return function(e, t, n) {
                    var r = tr(e, t, n),
                        i = "",
                        o = !0,
                        a = !1,
                        s = void 0;
                    try {
                        for (var u, c = r[Symbol.iterator](); !(o = (u = c.next()).done); o = !0) {
                            var l = u.value;
                            i += l.value
                        }
                    } catch (e) {
                        a = !0, s = e
                    } finally {
                        try {
                            o || null == c.return || c.return()
                        } finally {
                            if (a) throw s
                        }
                    }
                    return i
                }(this, e = Number(e), t += "")
            }
        }, {
            key: "formatToParts",
            value: function(e, t) {
                if (!d(this, Object) || !tn(this, "initializedRelativeTimeFormat")) throw TypeError("Method Intl.RelativeTimeFormat.prototype.formatToParts called on incompatible receiver ".concat(this.toString()));
                return tr(this, e = Number(e), t += "")
            }
        }, {
            key: "resolvedOptions",
            value: function() {
                if (!d(this, Object) || !tn(this, "initializedRelativeTimeFormat")) throw TypeError("Method Intl.RelativeTimeFormat.prototype.resolvedOptions called on incompatible receiver ".concat(this.toString()));
                return {
                    locale: tt(this, "locale"),
                    style: tt(this, "style"),
                    numeric: tt(this, "numeric"),
                    numberingSystem: tt(this, "numberingSystem")
                }
            }
        }], t = [{
            key: "supportedLocalesOf",
            value: function(e) {
                var t, n, r = arguments[1];
                return t = Intl.getCanonicalLocales(e), void 0 !== (n = r) && e5(n = e0(n), "localeMatcher", "string", eQ, "best fit"),
                    function(e, t) {
                        var n = [],
                            r = !0,
                            i = !1,
                            o = void 0;
                        try {
                            for (var a, s = t[Symbol.iterator](); !(r = (a = s.next()).done); r = !0) {
                                var u = a.value;
                                void 0 !== e3(e, e2(u)) && n.push(u)
                            }
                        } catch (e) {
                            i = !0, o = e
                        } finally {
                            try {
                                r || null == s.return || s.return()
                            } finally {
                                if (i) throw o
                            }
                        }
                        return n
                    }(e7, t)
            }
        }, {
            key: "__addLocaleData",
            value: function(e) {
                var t = e.data,
                    n = e.locale;
                null == tm && (tm = n), e8[n] = t, e7.includes(n) || e7.push(n)
            }
        }], e && p(n.prototype, e), t && p(n, t), n
    }();
    Object.defineProperty(ti.prototype, Symbol.toStringTag, {
        writable: !1,
        enumerable: !1,
        value: "Intl.RelativeTimeFormat",
        configurable: !0
    }), eY || function() {
        if ("undefined" == typeof Intl) throw TypeError("Could not define Intl.RelativeTimeFormat: Expected 'Intl' to exist. Remember to include polyfills for Intl.NumberFormat, Intl.getCanonicalLocales, and Intl.PluralRules before applying this polyfill");
        Intl.RelativeTimeFormat = ti
    }();
    var to = Object.freeze({
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
    var ta, ts, tu, tc, tl, tf, tp, td, th, t$, tv, tm, tg, ty, tb, tw, tE = Object.freeze({
            __proto__: null
        }),
        tS = new eO.v1.PresenceApi(new W({
            basePath: null != (tb = null == (ty = null == (tg = window.Roblox) ? void 0 : tg.EnvironmentUrls) ? void 0 : ty.presenceApi) ? tb : "https://presence.roblox.com",
            credentials: "include"
        }));
    (e = tw || (tw = {})).WebFriends = "webFriends", e.WebGroups = "webGroups", e.WebNavigation = "webNavigation", e.WebPlayerSearch = "webPlayerSearch", e.WebProfile = "webProfile";
    var tT = tw,
        tO = "PresenceData",
        tx = function(e) {
            var t, n, r;
            return {
                userId: null != (t = null == e ? void 0 : e.userId) ? t : 0,
                userPresenceType: eA.presenceStatusResponseToPresenceStatus[null != (n = null == e ? void 0 : e.userPresenceType) ? n : 0],
                lastLocation: null != (r = null == e ? void 0 : e.lastLocation) ? r : "Website",
                placeId: null == e ? void 0 : e.placeId,
                rootPlaceId: null == e ? void 0 : e.rootPlaceId,
                gameId: null == e ? void 0 : e.gameId,
                universeId: null == e ? void 0 : e.universeId,
                lastOnline: null == e ? void 0 : e.lastOnline,
                invisibleModeExpiry: null == e ? void 0 : e.invisibleModeExpiry
            }
        };

    function tA() {
        var e, t = null == (e = window.localStorage) ? void 0 : e.getItem(tO),
            n = Object.entries(t ? JSON.parse(t) : {}),
            r = new Map;
        return n.forEach(function(e) {
            r.set(Number.parseInt(e[0], 10), e[1])
        }), r
    }

    function tR(e) {
        var t, n, r = tA();
        e.forEach(function(e) {
            var t, n;
            if (e && e.userId) {
                var i = r.get(null == e ? void 0 : e.userId);
                i && i.data.userPresenceType === e.userPresenceType || null == (n = null == (t = window.Roblox) ? void 0 : t.EventStream) || n.SendEventWithTarget("PresenceImpression", "PresenceImpression", {
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
            null == (t = window.localStorage) || t.setItem(tO, JSON.stringify(Object.fromEntries(r)))
        } catch (e) {
            null == (n = window.localStorage) || n.removeItem(tO)
        }
    }
    var tC = {
            fetchUserPresences: function(e) {
                return eR(this, arguments, void 0, function(e, t) {
                    var n, r, i, o, a, s, u, c, l, f, p, d, h;
                    return void 0 === t && (t = !1), eC(this, function($) {
                        switch ($.label) {
                            case 0:
                                var v;
                                return (null == (d = null == (p = window.Roblox) ? void 0 : p.CurrentUser) ? void 0 : d.isAuthenticated) ? (r = [], i = [], t || (v = tA(), i = (r = e.map(function(e) {
                                    return v.get(e)
                                }).filter(function(e) {
                                    return e && Date.now() - e.lastUpdated < 3e4
                                }).map(function(e) {
                                    return null == e ? void 0 : e.data
                                })).map(function(e) {
                                    return null == e ? void 0 : e.userId
                                })), (o = e.filter(function(e) {
                                    return !i.includes(e)
                                })).length > 0 ? [4, function(e) {
                                    return eR(this, void 0, void 0, function() {
                                        var t, n;
                                        return eC(this, function(r) {
                                            switch (r.label) {
                                                case 0:
                                                    return r.trys.push([0, 2, , 3]), [4, tS.v1PresenceUsersPost({
                                                        userPresenceRequest: {
                                                            userIds: e
                                                        }
                                                    })];
                                                case 1:
                                                    return (t = (null != (n = r.sent().userPresences) ? n : []).map(tx)).forEach(function(e) {
                                                        var t, n, r, i, o, a;
                                                        Number.parseInt(null != (r = null == (n = null == (t = window.Roblox) ? void 0 : t.CurrentUser) ? void 0 : n.userId) ? r : "-1", 10) === e.userId && e.userPresenceType === m.Invisible && (null == (o = null == (i = window.Roblox) ? void 0 : i.EventStream) || o.SendEventWithTarget("invisibleModeFeedback", "invisibleModeFeedback", {
                                                            surface: (a = window.location.href).includes("/profile") ? tT.WebProfile : a.includes("/search/users") ? tT.WebPlayerSearch : a.includes("/users/friends") ? tT.WebFriends : a.includes("/groups") ? tT.WebGroups : tT.WebNavigation
                                                        }, 1))
                                                    }), [2, t];
                                                case 2:
                                                    return console.error(r.sent()), [3, 3];
                                                case 3:
                                                    return [2, []]
                                            }
                                        })
                                    })
                                }(o)] : [3, 2]) : (n = new Map, e.forEach(function(e) {
                                    n.set(e, {
                                        userId: e,
                                        userPresenceType: m.Offline,
                                        lastLocation: "Website"
                                    })
                                }), [2, n]);
                            case 1:
                                return s = null != (h = $.sent()) ? h : [], [3, 3];
                            case 2:
                                s = [], $.label = 3;
                            case 3:
                                return a = s, u = eP(eP([], r, !0), a, !0), c = new Map, u.forEach(function(e) {
                                    e && e.userId && c.set(e.userId, e)
                                }), tR(a), l = e.map(function(e) {
                                    return c.get(e)
                                }).filter(function(e) {
                                    return null != e
                                }), f = new Map, l.forEach(function(e) {
                                    var t;
                                    return f.set(null != (t = e.userId) ? t : -1, e)
                                }), [2, f]
                        }
                    })
                })
            },
            invalidateUserPresence: function(e) {
                tR([e])
            }
        },
        tP = (new ez).createRequestProcessor(function(e) {
            return eR(void 0, void 0, void 0, function() {
                var t, n;
                return eC(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, tC.fetchUserPresences(e.map(function(e) {
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
        tI = new Map,
        tM = {
            subscribeToPresenceChanges: function(e, t, n) {
                e.forEach(function(e) {
                    var r;
                    tI.has(e) || tI.set(e, []), null == (r = tI.get(e)) || r.push(t), n && tP.queueItem(e).then(t)
                })
            },
            getPresences: function(e) {
                return Promise.all(e.map(function(e) {
                    return tP.queueItem(e)
                }))
            },
            refetchPresences: function(e) {
                return eR(this, void 0, void 0, function() {
                    var t;
                    return eC(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, tC.fetchUserPresences(e, !0)];
                            case 1:
                                return (t = n.sent()).forEach(function(e, t, n) {
                                    var r;
                                    null == (r = tI.get(e.userId)) || r.forEach(function(t) {
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
                        tC.invalidateUserPresence(e), e.userId && tI.has(e.userId) && (null == (t = tI.get(e.userId)) || t.forEach(function(t) {
                            return t(e)
                        }))
                    })
                })
            },
            clearPresenceSubscriptions: function() {
                tI = new Map
            }
        };
    window.Roblox = window.Roblox || {}, window.Roblox.Presence = window.Roblox.Presence || {}, void 0 === (null == (n = null == (t = window.Roblox) ? void 0 : t.Presence) ? void 0 : n.presenceProvider) && (window.Roblox.Presence.presenceProvider = tM, tM.initializeEventListener());
    var tN = function() {
        return window.Roblox.Presence.presenceProvider
    };

    function tk(e, t) {
        var n = (0, l.useState)(null != t ? t : {
                userId: null != e ? e : 0,
                lastLocation: "Website",
                userPresenceType: 0
            }),
            r = n[0],
            i = n[1];
        return (0, l.useEffect)(function() {
            void 0 !== e && tN().subscribeToPresenceChanges([e], i, void 0 === t)
        }, [t, e]), r
    }
    /**
     * @license AngularJS v1.8.3
     * (c) 2010-2020 Google LLC. http://angularjs.org
     * License: MIT
     */
    ! function(e) {
        var t = {
            objectMaxDepth: 5,
            urlErrorParamsEnabled: !0
        };

        function n(e) {
            return q(e) && e > 0
        }

        function r(e, n) {
            n = n || Error;
            var r = "https://errors.angularjs.org/1.8.3/",
                i = RegExp(r.replace(".", "\\.") + "[\\s\\S]*", "g");
            return function() {
                var o, a, s = arguments[0],
                    u = arguments[1],
                    c = "[" + (e ? e + ":" : "") + s + "] ",
                    l = ef(arguments, 2).map(function(e) {
                        return eV(e, t.objectMaxDepth)
                    });
                if (c += u.replace(/\{\d+\}/g, function(e) {
                        var t = +e.slice(1, -1);
                        return t < l.length ? l[t].replace(i, "") : e
                    }), c += "\n" + r + (e ? e + "/" : "") + s, t.urlErrorParamsEnabled)
                    for (a = 0, o = "?"; a < l.length; a++, o = "&") c += o + "p" + a + "=" + encodeURIComponent(l[a]);
                return new n(c)
            }
        }
        var i, o, a, s, u = /^\/(.+)\/([a-z]*)$/,
            c = "validity",
            l = Object.prototype.hasOwnProperty,
            f = function(e) {
                return j(e) ? e.toLowerCase() : e
            },
            p = function(e) {
                return j(e) ? e.toUpperCase() : e
            },
            h = [].slice,
            $ = [].splice,
            m = [].push,
            g = Object.prototype.toString,
            y = Object.getPrototypeOf,
            b = r("ng"),
            w = e.angular || (e.angular = {}),
            E = 0;

        function S(e) {
            if (null == e || J(e)) return !1;
            if (H(e) || j(e) || o && d(e, o)) return !0;
            var t = "length" in Object(e) && e.length;
            return q(t) && (t >= 0 && t - 1 in e || "function" == typeof e.item)
        }

        function T(e, t, n) {
            var r, i;
            if (e)
                if (z(e))
                    for (r in e) "prototype" !== r && "length" !== r && "name" !== r && e.hasOwnProperty(r) && t.call(n, e[r], r, e);
                else if (H(e) || S(e)) {
                var o = "object" != (void 0 === e ? "undefined" : v(e));
                for (r = 0, i = e.length; r < i; r++)(o || r in e) && t.call(n, e[r], r, e)
            } else if (e.forEach && e.forEach !== T) e.forEach(t, n, e);
            else if (F(e))
                for (r in e) t.call(n, e[r], r, e);
            else if ("function" == typeof e.hasOwnProperty)
                for (r in e) e.hasOwnProperty(r) && t.call(n, e[r], r, e);
            else
                for (r in e) l.call(e, r) && t.call(n, e[r], r, e);
            return e
        }

        function O(e, t, n) {
            for (var r = Object.keys(e).sort(), i = 0; i < r.length; i++) t.call(n, e[r[i]], r[i]);
            return r
        }

        function x(e) {
            return function(t, n) {
                e(n, t)
            }
        }

        function A(e, t) {
            t ? e.$$hashKey = t : delete e.$$hashKey
        }

        function R(e, t, n) {
            for (var r = e.$$hashKey, i = 0, o = t.length; i < o; ++i) {
                var a = t[i];
                if (V(a) || z(a))
                    for (var s = Object.keys(a), u = 0, c = s.length; u < c; u++) {
                        var l = s[u],
                            f = a[l];
                        n && V(f) ? B(f) ? e[l] = new Date(f.valueOf()) : W(f) ? e[l] = new RegExp(f) : f.nodeName ? e[l] = f.cloneNode(!0) : et(f) ? e[l] = f.clone() : "__proto__" !== l && (V(e[l]) || (e[l] = H(f) ? [] : {}), R(e[l], [f], !0)) : e[l] = f
                    }
            }
            return A(e, r), e
        }

        function C(e) {
            return R(e, h.call(arguments, 1), !1)
        }

        function P(e) {
            return parseInt(e, 10)
        }
        i = e.document.documentMode;
        var I = Number.isNaN || function(e) {
            return e != e
        };

        function M(e, t) {
            return C(Object.create(e), t)
        }

        function N() {}

        function k(e) {
            return e
        }

        function L(e) {
            return function() {
                return e
            }
        }

        function U(e) {
            return z(e.toString) && e.toString !== g
        }

        function _(e) {
            return void 0 === e
        }

        function D(e) {
            return void 0 !== e
        }

        function V(e) {
            return null !== e && "object" == (void 0 === e ? "undefined" : v(e))
        }

        function F(e) {
            return null !== e && "object" == (void 0 === e ? "undefined" : v(e)) && !y(e)
        }

        function j(e) {
            return "string" == typeof e
        }

        function q(e) {
            return "number" == typeof e
        }

        function B(e) {
            return "[object Date]" === g.call(e)
        }

        function H(e) {
            return Array.isArray(e) || d(e, Array)
        }

        function G(e) {
            switch (g.call(e)) {
                case "[object Error]":
                case "[object Exception]":
                case "[object DOMException]":
                    return !0;
                default:
                    return d(e, Error)
            }
        }

        function z(e) {
            return "function" == typeof e
        }

        function W(e) {
            return "[object RegExp]" === g.call(e)
        }

        function J(e) {
            return e && e.window === e
        }

        function Y(e) {
            return e && e.$evalAsync && e.$watch
        }

        function Q(e) {
            return "boolean" == typeof e
        }

        function K(e) {
            return e && z(e.then)
        }
        N.$inject = [], k.$inject = [];
        var Z = /^\[object (?:Uint8|Uint8Clamped|Uint16|Uint32|Int8|Int16|Int32|Float32|Float64)Array]$/,
            X = function(e) {
                return j(e) ? e.trim() : e
            },
            ee = function(e) {
                return e.replace(/([-()[\]{}+?*.$^|,:#<!\\])/g, "\\$1").replace(/\x08/g, "\\x08")
            };

        function et(e) {
            return !(!e || !(e.nodeName || e.prop && e.attr && e.find))
        }

        function en(e) {
            return f(e.nodeName || e[0] && e[0].nodeName)
        }

        function er(e, t) {
            return -1 !== Array.prototype.indexOf.call(e, t)
        }

        function ei(e, t) {
            var n = e.indexOf(t);
            return n >= 0 && e.splice(n, 1), n
        }

        function eo(e, t, r) {
            var i = [],
                o = [];
            if (r = n(r) ? r : NaN, t) {
                if (t && q(t.length) && Z.test(g.call(t)) || "[object ArrayBuffer]" === g.call(t)) throw b("cpta", "Can't copy! TypedArray destination cannot be mutated.");
                if (e === t) throw b("cpi", "Can't copy! Source and destination are identical.");
                return H(t) ? t.length = 0 : T(t, function(e, n) {
                    "$$hashKey" !== n && delete t[n]
                }), i.push(e), o.push(t), a(e, t, r)
            }
            return s(e, r);

            function a(e, t, n) {
                if (--n < 0) return "...";
                var r, i = t.$$hashKey;
                if (H(e))
                    for (var o = 0, a = e.length; o < a; o++) t.push(s(e[o], n));
                else if (F(e))
                    for (r in e) t[r] = s(e[r], n);
                else if (e && "function" == typeof e.hasOwnProperty)
                    for (r in e) e.hasOwnProperty(r) && (t[r] = s(e[r], n));
                else
                    for (r in e) l.call(e, r) && (t[r] = s(e[r], n));
                return A(t, i), t
            }

            function s(e, t) {
                if (!V(e)) return e;
                var n = i.indexOf(e);
                if (-1 !== n) return o[n];
                if (J(e) || Y(e)) throw b("cpws", "Can't copy! Making copies of Window or Scope instances is not supported.");
                var r = !1,
                    u = function(e) {
                        switch (g.call(e)) {
                            case "[object Int8Array]":
                            case "[object Int16Array]":
                            case "[object Int32Array]":
                            case "[object Float32Array]":
                            case "[object Float64Array]":
                            case "[object Uint8Array]":
                            case "[object Uint8ClampedArray]":
                            case "[object Uint16Array]":
                            case "[object Uint32Array]":
                                return new e.constructor(s(e.buffer), e.byteOffset, e.length);
                            case "[object ArrayBuffer]":
                                if (!e.slice) {
                                    var t = new ArrayBuffer(e.byteLength);
                                    return new Uint8Array(t).set(new Uint8Array(e)), t
                                }
                                return e.slice(0);
                            case "[object Boolean]":
                            case "[object Number]":
                            case "[object String]":
                            case "[object Date]":
                                return new e.constructor(e.valueOf());
                            case "[object RegExp]":
                                var n = new RegExp(e.source, e.toString().match(/[^/]*$/)[0]);
                                return n.lastIndex = e.lastIndex, n;
                            case "[object Blob]":
                                return new e.constructor([e], {
                                    type: e.type
                                })
                        }
                        if (z(e.cloneNode)) return e.cloneNode(!0)
                    }(e);
                return void 0 === u && (u = H(e) ? [] : Object.create(y(e)), r = !0), i.push(e), o.push(u), r ? a(e, u, t) : u
            }
        }

        function ea(e, t) {
            return e === t || e != e && t != t
        }

        function es(e, t) {
            if (e === t) return !0;
            if (null === e || null === t) return !1;
            if (e != e && t != t) return !0;
            var n, r, i, o = void 0 === e ? "undefined" : v(e);
            if (o === (void 0 === t ? "undefined" : v(t)) && "object" === o) {
                if (!H(e)) {
                    if (B(e)) return !!B(t) && ea(e.getTime(), t.getTime());
                    if (W(e)) return !!W(t) && e.toString() === t.toString();
                    if (Y(e) || Y(t) || J(e) || J(t) || H(t) || B(t) || W(t)) return !1;
                    for (r in i = eL(), e)
                        if ("$" !== r.charAt(0) && !z(e[r])) {
                            if (!es(e[r], t[r])) return !1;
                            i[r] = !0
                        } for (r in t)
                        if (!(r in i) && "$" !== r.charAt(0) && D(t[r]) && !z(t[r])) return !1;
                    return !0
                }
                if (!H(t)) return !1;
                if ((n = e.length) === t.length) {
                    for (r = 0; r < n; r++)
                        if (!es(e[r], t[r])) return !1;
                    return !0
                }
            }
            return !1
        }
        var eu = function() {
                if (!D(eu.rules)) {
                    var t = e.document.querySelector("[ng-csp]") || e.document.querySelector("[data-ng-csp]");
                    if (t) {
                        var n = t.getAttribute("ng-csp") || t.getAttribute("data-ng-csp");
                        eu.rules = {
                            noUnsafeEval: !n || -1 !== n.indexOf("no-unsafe-eval"),
                            noInlineStyle: !n || -1 !== n.indexOf("no-inline-style")
                        }
                    } else eu.rules = {
                        noUnsafeEval: function() {
                            try {
                                return Function(""), !1
                            } catch (e) {
                                return !0
                            }
                        }(),
                        noInlineStyle: !1
                    }
                }
                return eu.rules
            },
            ec = function() {
                if (D(ec.name_)) return ec.name_;
                var t, n, r, i, o = eO.length;
                for (n = 0; n < o; ++n)
                    if (r = eO[n], t = e.document.querySelector("[" + r.replace(":", "\\:") + "jq]")) {
                        i = t.getAttribute(r + "jq");
                        break
                    } return ec.name_ = i
            };

        function el(e, t, n) {
            return e.concat(h.call(t, n))
        }

        function ef(e, t) {
            return h.call(e, t || 0)
        }

        function ep(e, t) {
            var n = arguments.length > 2 ? ef(arguments, 2) : [];
            return !z(t) || d(t, RegExp) ? t : n.length ? function() {
                return arguments.length ? t.apply(e, el(n, arguments, 0)) : t.apply(e, n)
            } : function() {
                return arguments.length ? t.apply(e, arguments) : t.call(e)
            }
        }

        function ed(t, n) {
            var r = n;
            return "string" == typeof t && "$" === t.charAt(0) && "$" === t.charAt(1) ? r = void 0 : J(n) ? r = "$WINDOW" : n && e.document === n ? r = "$DOCUMENT" : Y(n) && (r = "$SCOPE"), r
        }

        function eh(e, t) {
            if (!_(e)) return q(t) || (t = t ? 2 : null), JSON.stringify(e, ed, t)
        }

        function e$(e) {
            return j(e) ? JSON.parse(e) : e
        }
        var ev = /:/g;

        function em(e, t) {
            var n = Date.parse("Jan 01, 1970 00:00:00 " + (e = e.replace(ev, ""))) / 6e4;
            return I(n) ? t : n
        }

        function eg(e, t) {
            return (e = new Date(e.getTime())).setMinutes(e.getMinutes() + t), e
        }

        function ey(e, t, n) {
            n = n ? -1 : 1;
            var r = e.getTimezoneOffset();
            return eg(e, n * (em(t, r) - r))
        }

        function eb(e) {
            e = o(e).clone().empty();
            var t = o("<div></div>").append(e).html();
            try {
                return e[0].nodeType === e_ ? f(t) : t.match(/^(<[^>]+>)/)[1].replace(/^<([\w-]+)/, function(e, t) {
                    return "<" + f(t)
                })
            } catch (e) {
                return f(t)
            }
        }

        function ew(e) {
            try {
                return decodeURIComponent(e)
            } catch (e) {}
        }

        function eE(e) {
            var t = {};
            return T((e || "").split("&"), function(e) {
                var n, r, i;
                e && (r = e = e.replace(/\+/g, "%20"), -1 !== (n = e.indexOf("=")) && (r = e.substring(0, n), i = e.substring(n + 1)), D(r = ew(r)) && (i = !D(i) || ew(i), l.call(t, r) ? H(t[r]) ? t[r].push(i) : t[r] = [t[r], i] : t[r] = i))
            }), t
        }

        function eS(e) {
            return eT(e, !0).replace(/%26/gi, "&").replace(/%3D/gi, "=").replace(/%2B/gi, "+")
        }

        function eT(e, t) {
            return encodeURIComponent(e).replace(/%40/gi, "@").replace(/%3A/gi, ":").replace(/%24/g, "$").replace(/%2C/gi, ",").replace(/%3B/gi, ";").replace(/%20/g, t ? "%20" : "+")
        }
        var eO = ["ng-", "data-ng-", "ng:", "x-ng-"],
            ex = function(t) {
                var n = t.currentScript;
                if (!n) return !0;
                if (!(d(n, e.HTMLScriptElement) || d(n, e.SVGScriptElement))) return !1;
                var r = n.attributes;
                return [r.getNamedItem("src"), r.getNamedItem("href"), r.getNamedItem("xlink:href")].every(function(e) {
                    if (!e) return !0;
                    if (!e.value) return !1;
                    var n = t.createElement("a");
                    if (n.href = e.value, t.location.origin === n.origin) return !0;
                    switch (n.protocol) {
                        case "http:":
                        case "https:":
                        case "ftp:":
                        case "blob:":
                        case "file:":
                        case "data:":
                            return !0;
                        default:
                            return !1
                    }
                })
            }(e.document);

        function eA(t, n, r) {
            V(r) || (r = {}), r = C({
                strictDi: !1
            }, r);
            var i = function() {
                    if ((t = o(t)).injector()) throw b("btstrpd", "App already bootstrapped with this element '{0}'", (t[0] === e.document ? "document" : eb(t)).replace(/</, "&lt;").replace(/>/, "&gt;"));
                    (n = n || []).unshift(["$provide", function(e) {
                        e.value("$rootElement", t)
                    }]), r.debugInfoEnabled && n.push(["$compileProvider", function(e) {
                        e.debugInfoEnabled(!0)
                    }]), n.unshift("ng");
                    var i = tL(n, r.strictDi);
                    return i.invoke(["$rootScope", "$rootElement", "$compile", "$injector", function(e, t, n, r) {
                        e.$apply(function() {
                            t.data("$injector", r), n(t)(e)
                        })
                    }]), i
                },
                a = /^NG_ENABLE_DEBUG_INFO!/,
                s = /^NG_DEFER_BOOTSTRAP!/;
            if (e && a.test(e.name) && (r.debugInfoEnabled = !0, e.name = e.name.replace(a, "")), e && !s.test(e.name)) return i();
            e.name = e.name.replace(s, ""), w.resumeBootstrap = function(e) {
                return T(e, function(e) {
                    n.push(e)
                }), i()
            }, z(w.resumeDeferredBootstrap) && w.resumeDeferredBootstrap()
        }
        var eR = /[A-Z]/g;

        function eC(e, t) {
            return t = t || "_", e.replace(eR, function(e, n) {
                return (n ? t : "") + e.toLowerCase()
            })
        }
        var eP = !1;

        function eI(e, t, n) {
            if (!e) throw b("areq", "Argument '{0}' is {1}", t || "?", n || "required");
            return e
        }

        function eM(e, t, n) {
            return n && H(e) && (e = e[e.length - 1]), eI(z(e), t, "not a function, got " + (e && "object" == (void 0 === e ? "undefined" : v(e)) ? e.constructor.name || "Object" : void 0 === e ? "undefined" : v(e))), e
        }

        function eN(e, t) {
            if ("hasOwnProperty" === e) throw b("badname", "hasOwnProperty is not a valid {0} name", t)
        }

        function ek(e) {
            for (var t, n = e[0], r = e[e.length - 1], i = 1; n !== r && (n = n.nextSibling); i++)(t || e[i] !== n) && (t || (t = o(h.call(e, 0, i))), t.push(n));
            return t || e
        }

        function eL() {
            return Object.create(null)
        }

        function eU(e) {
            if (null == e) return "";
            switch (void 0 === e ? "undefined" : v(e)) {
                case "string":
                    break;
                case "number":
                    e = "" + e;
                    break;
                default:
                    e = !U(e) || H(e) || B(e) ? eh(e) : e.toString()
            }
            return e
        }
        var e_ = 3;

        function eD(e, t) {
            if (H(e)) {
                t = t || [];
                for (var n = 0, r = e.length; n < r; n++) t[n] = e[n]
            } else if (V(e))
                for (var i in t = t || {}, e) "$" === i.charAt(0) && "$" === i.charAt(1) || (t[i] = e[i]);
            return t || e
        }

        function eV(e, t) {
            var r, i;
            return "function" == typeof e ? e.toString().replace(/ \{[\s\S]*$/, "") : _(e) ? "undefined" : "string" != typeof e ? (r = e, i = [], n(t) && (r = w.copy(r, null, t)), JSON.stringify(r, function(e, t) {
                if (V(t = ed(e, t))) {
                    if (i.indexOf(t) >= 0) return "...";
                    i.push(t)
                }
                return t
            })) : e
        }
        e9.expando = "ng339";
        var eF = e9.cache = {},
            ej = 1;
        e9._data = function(e) {
            return this.cache[e[this.expando]] || {}
        };
        var eq = /-([a-z])/g,
            eB = /^-ms-/,
            eH = {
                mouseleave: "mouseout",
                mouseenter: "mouseover"
            },
            eG = r("jqLite");

        function ez(e, t) {
            return t.toUpperCase()
        }

        function eW(e) {
            return e.replace(eq, ez)
        }
        var eJ = /^<([\w-]+)\s*\/?>(?:<\/\1>|)$/,
            eY = /<|&#?\w+;/,
            eQ = /<([\w:-]+)/,
            eK = /<(?!area|br|col|embed|hr|img|input|link|meta|param)(([\w:-]+)[^>]*)\/>/gi,
            eZ = {
                thead: ["table"],
                col: ["colgroup", "table"],
                tr: ["tbody", "table"],
                td: ["tr", "tbody", "table"]
            };
        eZ.tbody = eZ.tfoot = eZ.colgroup = eZ.caption = eZ.thead, eZ.th = eZ.td;
        var eX = {
            option: [1, '<select multiple="multiple">', "</select>"],
            _default: [0, "", ""]
        };
        for (var e0 in eZ) {
            var e1 = eZ[e0],
                e2 = e1.slice().reverse();
            eX[e0] = [e2.length, "<" + e2.join("><") + ">", "</" + e1.join("></") + ">"]
        }

        function e3(e) {
            return !eY.test(e)
        }

        function e4(e) {
            var t = e.nodeType;
            return 1 === t || !t || 9 === t
        }

        function e5(t, n) {
            var r, o, a, s, u, c = n.createDocumentFragment(),
                l = [];
            if (e3(t)) l.push(n.createTextNode(t));
            else {
                if (r = c.appendChild(n.createElement("div")), o = (eQ.exec(t) || ["", ""])[1].toLowerCase(), s = e9.legacyXHTMLReplacement ? t.replace(eK, "<$1></$2>") : t, i < 10)
                    for (a = eX[o] || eX._default, r.innerHTML = a[1] + s + a[2], u = a[0]; u--;) r = r.firstChild;
                else {
                    for (u = (a = eZ[o] || []).length; --u > -1;) r.appendChild(e.document.createElement(a[u])), r = r.firstChild;
                    r.innerHTML = s
                }
                l = el(l, r.childNodes), (r = c.firstChild).textContent = ""
            }
            return c.textContent = "", c.innerHTML = "", T(l, function(e) {
                c.appendChild(e)
            }), c
        }
        eX.optgroup = eX.option;
        var e6 = e.Node.prototype.contains || function(e) {
            return !!(16 & this.compareDocumentPosition(e))
        };

        function e9(t) {
            var n, r, i, o;
            if (d(t, e9)) return t;
            if (j(t) && (t = X(t), n = !0), !d(this, e9)) {
                if (n && "<" !== t.charAt(0)) throw eG("nosel", "Looking up elements via selectors is not supported by jqLite! See: http://docs.angularjs.org/api/angular.element");
                return new e9(t)
            }
            n ? tc(this, (r = t, i = i || e.document, (o = eJ.exec(r)) ? [i.createElement(o[1])] : (o = e5(r, i)) ? o.childNodes : [])) : z(t) ? th(t) : tc(this, t)
        }

        function e8(e) {
            return e.cloneNode(!0)
        }

        function e7(e, t) {
            !t && e4(e) && o.cleanData([e]), e.querySelectorAll && o.cleanData(e.querySelectorAll("*"))
        }

        function te(e) {
            var t;
            for (t in e) return !1;
            return !0
        }

        function tt(e) {
            var t = e.ng339,
                n = t && eF[t],
                r = n && n.events,
                i = n && n.data;
            i && !te(i) || r && !te(r) || (delete eF[t], e.ng339 = void 0)
        }

        function tn(e, t, n, r) {
            if (D(r)) throw eG("offargs", "jqLite#off() does not support the `selector` argument");
            var i = ti(e),
                o = i && i.events,
                a = i && i.handle;
            if (a) {
                if (t) {
                    var s = function(t) {
                        var r = o[t];
                        D(n) && ei(r || [], n), D(n) && r && r.length > 0 || (e.removeEventListener(t, a), delete o[t])
                    };
                    T(t.split(" "), function(e) {
                        s(e), eH[e] && s(eH[e])
                    })
                } else
                    for (t in o) "$destroy" !== t && e.removeEventListener(t, a), delete o[t];
                tt(e)
            }
        }

        function tr(e, t) {
            var n = e.ng339,
                r = n && eF[n];
            r && (t ? delete r.data[t] : r.data = {}, tt(e))
        }

        function ti(e, t) {
            var n = e.ng339,
                r = n && eF[n];
            return t && !r && (e.ng339 = n = ++ej, r = eF[n] = {
                events: {},
                data: {},
                handle: void 0
            }), r
        }

        function to(e, t, n) {
            if (e4(e)) {
                var r, i = D(n),
                    o = !i && t && !V(t),
                    a = !t,
                    s = ti(e, !o),
                    u = s && s.data;
                if (i) u[eW(t)] = n;
                else {
                    if (a) return u;
                    if (o) return u && u[eW(t)];
                    for (r in t) u[eW(r)] = t[r]
                }
            }
        }

        function ta(e, t) {
            return !!e.getAttribute && (" " + (e.getAttribute("class") || "") + " ").replace(/[\n\t]/g, " ").indexOf(" " + t + " ") > -1
        }

        function ts(e, t) {
            if (t && e.setAttribute) {
                var n = (" " + (e.getAttribute("class") || "") + " ").replace(/[\n\t]/g, " "),
                    r = n;
                T(t.split(" "), function(e) {
                    e = X(e), r = r.replace(" " + e + " ", " ")
                }), r !== n && e.setAttribute("class", X(r))
            }
        }

        function tu(e, t) {
            if (t && e.setAttribute) {
                var n = (" " + (e.getAttribute("class") || "") + " ").replace(/[\n\t]/g, " "),
                    r = n;
                T(t.split(" "), function(e) {
                    e = X(e), -1 === r.indexOf(" " + e + " ") && (r += e + " ")
                }), r !== n && e.setAttribute("class", X(r))
            }
        }

        function tc(e, t) {
            if (t)
                if (t.nodeType) e[e.length++] = t;
                else {
                    var n = t.length;
                    if ("number" == typeof n && t.window !== t) {
                        if (n)
                            for (var r = 0; r < n; r++) e[e.length++] = t[r]
                    } else e[e.length++] = t
                }
        }

        function tl(e, t) {
            return tf(e, "$" + (t || "ngController") + "Controller")
        }

        function tf(e, t, n) {
            9 === e.nodeType && (e = e.documentElement);
            for (var r = H(t) ? t : [t]; e;) {
                for (var i = 0, a = r.length; i < a; i++)
                    if (D(n = o.data(e, r[i]))) return n;
                e = e.parentNode || 11 === e.nodeType && e.host
            }
        }

        function tp(e) {
            for (e7(e, !0); e.firstChild;) e.removeChild(e.firstChild)
        }

        function td(e, t) {
            t || e7(e);
            var n = e.parentNode;
            n && n.removeChild(e)
        }

        function th(t) {
            function n() {
                e.document.removeEventListener("DOMContentLoaded", n), e.removeEventListener("load", n), t()
            }
            "complete" === e.document.readyState ? e.setTimeout(t) : (e.document.addEventListener("DOMContentLoaded", n), e.addEventListener("load", n))
        }
        var t$ = e9.prototype = {
                ready: th,
                toString: function() {
                    var e = [];
                    return T(this, function(t) {
                        e.push("" + t)
                    }), "[" + e.join(", ") + "]"
                },
                eq: function(e) {
                    return o(e >= 0 ? this[e] : this[this.length + e])
                },
                length: 0,
                push: m,
                sort: [].sort,
                splice: [].splice
            },
            tv = {};
        T("multiple,selected,checked,disabled,readOnly,required,open".split(","), function(e) {
            tv[f(e)] = e
        });
        var tm = {};
        T("input,select,option,textarea,button,form,details".split(","), function(e) {
            tm[e] = !0
        });
        var tg = {
            ngMinlength: "minlength",
            ngMaxlength: "maxlength",
            ngMin: "min",
            ngMax: "max",
            ngPattern: "pattern",
            ngStep: "step"
        };

        function ty(e, t) {
            var n = tv[t.toLowerCase()];
            return n && tm[en(e)] && n
        }

        function tb(e, t, n) {
            n.call(e, t)
        }

        function tw(e, t, n) {
            var r = t.relatedTarget;
            r && (r === e || e6.call(e, r)) || n.call(e, t)
        }

        function tE() {
            this.$get = function() {
                return C(e9, {
                    hasClass: function(e, t) {
                        return e.attr && (e = e[0]), ta(e, t)
                    },
                    addClass: function(e, t) {
                        return e.attr && (e = e[0]), tu(e, t)
                    },
                    removeClass: function(e, t) {
                        return e.attr && (e = e[0]), ts(e, t)
                    }
                })
            }
        }

        function tS(e, t) {
            var n = e && e.$$hashKey;
            if (n) return "function" == typeof n && (n = e.$$hashKey()), n;
            var r = void 0 === e ? "undefined" : v(e);
            return "function" === r || "object" === r && null !== e ? e.$$hashKey = r + ":" + (t || function() {
                return ++E
            })() : r + ":" + e
        }
        T({
            data: to,
            removeData: tr,
            hasData: function(e) {
                for (var t in eF[e.ng339]) return !0;
                return !1
            },
            cleanData: function(e) {
                for (var t = 0, n = e.length; t < n; t++) tr(e[t]), tn(e[t])
            }
        }, function(e, t) {
            e9[t] = e
        }), T({
            data: to,
            inheritedData: tf,
            scope: function(e) {
                return o.data(e, "$scope") || tf(e.parentNode || e, ["$isolateScope", "$scope"])
            },
            isolateScope: function(e) {
                return o.data(e, "$isolateScope") || o.data(e, "$isolateScopeNoTemplate")
            },
            controller: tl,
            injector: function(e) {
                return tf(e, "$injector")
            },
            removeAttr: function(e, t) {
                e.removeAttribute(t)
            },
            hasClass: ta,
            css: function(e, t, n) {
                if (t = eW(t.replace(eB, "ms-")), !D(n)) return e.style[t];
                e.style[t] = n
            },
            attr: function(e, t, n) {
                var r, i = e.nodeType;
                if (i !== e_ && 2 !== i && 8 !== i && e.getAttribute) {
                    var o = f(t),
                        a = tv[o];
                    if (!D(n)) return r = e.getAttribute(t), a && null !== r && (r = o), null === r ? void 0 : r;
                    null === n || !1 === n && a ? e.removeAttribute(t) : e.setAttribute(t, a ? o : n)
                }
            },
            prop: function(e, t, n) {
                if (!D(n)) return e[t];
                e[t] = n
            },
            text: function() {
                return e.$dv = "", e;

                function e(e, t) {
                    if (_(t)) {
                        var n = e.nodeType;
                        return 1 === n || n === e_ ? e.textContent : ""
                    }
                    e.textContent = t
                }
            }(),
            val: function(e, t) {
                if (_(t)) {
                    if (e.multiple && "select" === en(e)) {
                        var n = [];
                        return T(e.options, function(e) {
                            e.selected && n.push(e.value || e.text)
                        }), n
                    }
                    return e.value
                }
                e.value = t
            },
            html: function(e, t) {
                if (_(t)) return e.innerHTML;
                e7(e, !0), e.innerHTML = t
            },
            empty: tp
        }, function(e, t) {
            e9.prototype[t] = function(t, n) {
                var r, i, o = this.length;
                if (e !== tp && _(2 === e.length && e !== ta && e !== tl ? t : n)) {
                    if (V(t)) {
                        for (r = 0; r < o; r++)
                            if (e === to) e(this[r], t);
                            else
                                for (i in t) e(this[r], i, t[i]);
                        return this
                    }
                    for (var a = e.$dv, s = _(a) ? Math.min(o, 1) : o, u = 0; u < s; u++) {
                        var c = e(this[u], t, n);
                        a = a ? a + c : c
                    }
                    return a
                }
                for (r = 0; r < o; r++) e(this[r], t, n);
                return this
            }
        }), T({
            removeData: tr,
            on: function(e, t, n, r) {
                if (D(r)) throw eG("onargs", "jqLite#on() does not support the `selector` or `eventData` parameters");
                if (e4(e)) {
                    var i, o = ti(e, !0),
                        a = o.events,
                        s = o.handle;
                    s || ((i = function(t, n) {
                        t.isDefaultPrevented = function() {
                            return t.defaultPrevented
                        };
                        var r = a[n || t.type],
                            i = r ? r.length : 0;
                        if (i) {
                            if (_(t.immediatePropagationStopped)) {
                                var o = t.stopImmediatePropagation;
                                t.stopImmediatePropagation = function() {
                                    t.immediatePropagationStopped = !0, t.stopPropagation && t.stopPropagation(), o && o.call(t)
                                }
                            }
                            t.isImmediatePropagationStopped = function() {
                                return !0 === t.immediatePropagationStopped
                            };
                            var s = r.specialHandlerWrapper || tb;
                            i > 1 && (r = eD(r));
                            for (var u = 0; u < i; u++) t.isImmediatePropagationStopped() || s(e, t, r[u])
                        }
                    }).elem = e, s = o.handle = i);
                    for (var u = t.indexOf(" ") >= 0 ? t.split(" ") : [t], c = u.length, l = function(t, r, i) {
                            var o = a[t];
                            o || ((o = a[t] = []).specialHandlerWrapper = r, "$destroy" === t || i || e.addEventListener(t, s)), o.push(n)
                        }; c--;) eH[t = u[c]] ? (l(eH[t], tw), l(t, void 0, !0)) : l(t)
                }
            },
            off: tn,
            one: function(e, t, n) {
                (e = o(e)).on(t, function r() {
                    e.off(t, n), e.off(t, r)
                }), e.on(t, n)
            },
            replaceWith: function(e, t) {
                var n, r = e.parentNode;
                e7(e), T(new e9(t), function(t) {
                    n ? r.insertBefore(t, n.nextSibling) : r.replaceChild(t, e), n = t
                })
            },
            children: function(e) {
                var t = [];
                return T(e.childNodes, function(e) {
                    1 === e.nodeType && t.push(e)
                }), t
            },
            contents: function(e) {
                return e.contentDocument || e.childNodes || []
            },
            append: function(e, t) {
                var n = e.nodeType;
                if (1 === n || 11 === n)
                    for (var r = 0, i = (t = new e9(t)).length; r < i; r++) {
                        var o = t[r];
                        e.appendChild(o)
                    }
            },
            prepend: function(e, t) {
                if (1 === e.nodeType) {
                    var n = e.firstChild;
                    T(new e9(t), function(t) {
                        e.insertBefore(t, n)
                    })
                }
            },
            wrap: function(e, t) {
                var n, r;
                n = o(t).eq(0).clone()[0], (r = e.parentNode) && r.replaceChild(n, e), n.appendChild(e)
            },
            remove: td,
            detach: function(e) {
                td(e, !0)
            },
            after: function(e, t) {
                var n = e,
                    r = e.parentNode;
                if (r)
                    for (var i = 0, o = (t = new e9(t)).length; i < o; i++) {
                        var a = t[i];
                        r.insertBefore(a, n.nextSibling), n = a
                    }
            },
            addClass: tu,
            removeClass: ts,
            toggleClass: function(e, t, n) {
                t && T(t.split(" "), function(t) {
                    var r = n;
                    _(r) && (r = !ta(e, t)), (r ? tu : ts)(e, t)
                })
            },
            parent: function(e) {
                var t = e.parentNode;
                return t && 11 !== t.nodeType ? t : null
            },
            next: function(e) {
                return e.nextElementSibling
            },
            find: function(e, t) {
                return e.getElementsByTagName ? e.getElementsByTagName(t) : []
            },
            clone: e8,
            triggerHandler: function(e, t, n) {
                var r, i, o, a = t.type || t,
                    s = ti(e),
                    u = s && s.events,
                    c = u && u[a];
                c && (r = {
                    preventDefault: function() {
                        this.defaultPrevented = !0
                    },
                    isDefaultPrevented: function() {
                        return !0 === this.defaultPrevented
                    },
                    stopImmediatePropagation: function() {
                        this.immediatePropagationStopped = !0
                    },
                    isImmediatePropagationStopped: function() {
                        return !0 === this.immediatePropagationStopped
                    },
                    stopPropagation: N,
                    type: a,
                    target: e
                }, t.type && (r = C(r, t)), i = eD(c), o = n ? [r].concat(n) : [r], T(i, function(t) {
                    r.isImmediatePropagationStopped() || t.apply(e, o)
                }))
            }
        }, function(e, t) {
            e9.prototype[t] = function(t, n, r) {
                for (var i, a = 0, s = this.length; a < s; a++) _(i) ? D(i = e(this[a], t, n, r)) && (i = o(i)) : tc(i, e(this[a], t, n, r));
                return D(i) ? i : this
            }
        }), e9.prototype.bind = e9.prototype.on, e9.prototype.unbind = e9.prototype.off;
        var tT = Object.create(null);

        function tO() {
            this._keys = [], this._values = [], this._lastKey = NaN, this._lastIndex = -1
        }
        tO.prototype = {
            _idx: function(e) {
                return e !== this._lastKey && (this._lastKey = e, this._lastIndex = this._keys.indexOf(e)), this._lastIndex
            },
            _transformKey: function(e) {
                return I(e) ? tT : e
            },
            get: function(e) {
                e = this._transformKey(e);
                var t = this._idx(e);
                if (-1 !== t) return this._values[t]
            },
            has: function(e) {
                return e = this._transformKey(e), -1 !== this._idx(e)
            },
            set: function(e, t) {
                e = this._transformKey(e);
                var n = this._idx(e); - 1 === n && (n = this._lastIndex = this._keys.length), this._keys[n] = e, this._values[n] = t
            },
            delete: function(e) {
                e = this._transformKey(e);
                var t = this._idx(e);
                return -1 !== t && (this._keys.splice(t, 1), this._values.splice(t, 1), this._lastKey = NaN, this._lastIndex = -1, !0)
            }
        };
        var tx = [function() {
                this.$get = [function() {
                    return tO
                }]
            }],
            tA = /^([^(]+?)=>/,
            tR = /^[^(]*\(\s*([^)]*)\)/m,
            tC = /,/,
            tP = /^\s*(_?)(\S+?)\1\s*$/,
            tI = /((\/\/.*$)|(\/\*[\s\S]*?\*\/))/gm,
            tM = r("$injector");

        function tN(e) {
            return Function.prototype.toString.call(e)
        }

        function tk(e) {
            var t = tN(e).replace(tI, "");
            return t.match(tA) || t.match(tR)
        }

        function tL(e, t) {
            t = !0 === t;
            var n = {},
                r = "Provider",
                o = [],
                a = new tO,
                u = {
                    $provide: {
                        provider: h($),
                        factory: h(v),
                        service: h(function(e, t) {
                            return v(e, ["$injector", function(e) {
                                return e.instantiate(t)
                            }])
                        }),
                        value: h(function(e, t) {
                            return v(e, L(t), !1)
                        }),
                        constant: h(function(e, t) {
                            eN(e, "constant"), u[e] = t, l[e] = t
                        }),
                        decorator: function(e, t) {
                            var n = c.get(e + r),
                                i = n.$get;
                            n.$get = function() {
                                var e = p.invoke(i, n);
                                return p.invoke(t, null, {
                                    $delegate: e
                                })
                            }
                        }
                    }
                },
                c = u.$injector = g(u, function(e, t) {
                    throw w.isString(t) && o.push(t), tM("unpr", "Unknown provider: {0}", o.join(" <- "))
                }),
                l = {},
                f = g(l, function(e, t) {
                    var n = c.get(e + r, t);
                    return p.invoke(n.$get, n, void 0, e)
                }),
                p = f;
            u["$injector" + r] = {
                $get: L(f)
            }, p.modules = c.modules = eL();
            var d = m(e);
            return (p = f.get("$injector")).strictDi = t, T(d, function(e) {
                e && p.invoke(e)
            }), p.loadNewModules = function(e) {
                T(m(e), function(e) {
                    e && p.invoke(e)
                })
            }, p;

            function h(e) {
                return function(t, n) {
                    if (!V(t)) return e(t, n);
                    T(t, x(e))
                }
            }

            function $(e, t) {
                if (eN(e, "service"), (z(t) || H(t)) && (t = c.instantiate(t)), !t.$get) throw tM("pget", "Provider '{0}' must define $get factory method.", e);
                return u[e + r] = t
            }

            function v(e, t, n) {
                return $(e, {
                    $get: !1 !== n ? function() {
                        var n = p.invoke(t, this);
                        if (_(n)) throw tM("undef", "Provider '{0}' must return a value from $get factory method.", e);
                        return n
                    } : t
                })
            }

            function m(e) {
                eI(_(e) || H(e), "modulesToLoad", "not an array");
                var t, n = [];
                return T(e, function(e) {
                    if (!a.get(e)) {
                        a.set(e, !0);
                        try {
                            j(e) ? (t = s(e), p.modules[e] = t, n = n.concat(m(t.requires)).concat(t._runBlocks), r(t._invokeQueue), r(t._configBlocks)) : z(e) || H(e) ? n.push(c.invoke(e)) : eM(e, "module")
                        } catch (t) {
                            throw H(e) && (e = e[e.length - 1]), t.message && t.stack && -1 === t.stack.indexOf(t.message) && (t = t.message + "\n" + t.stack), tM("modulerr", "Failed to instantiate module {0} due to:\n{1}", e, t.stack || t.message || t)
                        }
                    }

                    function r(e) {
                        var t, n;
                        for (t = 0, n = e.length; t < n; t++) {
                            var r = e[t],
                                i = c.get(r[0]);
                            i[r[1]].apply(i, r[2])
                        }
                    }
                }), n
            }

            function g(e, a) {
                function s(t, r) {
                    if (e.hasOwnProperty(t)) {
                        if (e[t] === n) throw tM("cdep", "Circular dependency found: {0}", t + " <- " + o.join(" <- "));
                        return e[t]
                    }
                    try {
                        return o.unshift(t), e[t] = n, e[t] = a(t, r), e[t]
                    } catch (r) {
                        throw e[t] === n && delete e[t], r
                    } finally {
                        o.shift()
                    }
                }

                function c(e, n, r) {
                    for (var i = [], o = tL.$$annotate(e, t, r), a = 0, u = o.length; a < u; a++) {
                        var c = o[a];
                        if ("string" != typeof c) throw tM("itkn", "Incorrect injection token! Expected service name as string, got {0}", c);
                        i.push(n && n.hasOwnProperty(c) ? n[c] : s(c, r))
                    }
                    return i
                }
                return {
                    invoke: function(e, t, n, r) {
                        "string" == typeof n && (r = n, n = null);
                        var o = c(e, n, r);
                        return H(e) && (e = e[e.length - 1]), ! function(e) {
                            if (i || "function" != typeof e) return !1;
                            var t = e.$$ngIsClass;
                            return Q(t) || (t = e.$$ngIsClass = /^class\b/.test(tN(e))), t
                        }(e) ? e.apply(t, o) : (o.unshift(null), new(Function.prototype.bind.apply(e, o)))
                    },
                    instantiate: function(e, t, n) {
                        var r = H(e) ? e[e.length - 1] : e,
                            i = c(e, t, n);
                        return i.unshift(null), new(Function.prototype.bind.apply(r, i))
                    },
                    get: s,
                    annotate: tL.$$annotate,
                    has: function(t) {
                        return u.hasOwnProperty(t + r) || e.hasOwnProperty(t)
                    }
                }
            }
        }

        function tU() {
            var t = !0;
            this.disableAutoScrolling = function() {
                t = !1
            }, this.$get = ["$window", "$location", "$rootScope", function(n, r, i) {
                var a = n.document;

                function s(e) {
                    if (e) {
                        e.scrollIntoView();
                        var t = function() {
                            var e = u.yOffset;
                            if (z(e)) e = e();
                            else if (et(e)) {
                                var t = e[0];
                                e = "fixed" !== n.getComputedStyle(t).position ? 0 : t.getBoundingClientRect().bottom
                            } else q(e) || (e = 0);
                            return e
                        }();
                        if (t) {
                            var r = e.getBoundingClientRect().top;
                            n.scrollBy(0, r - t)
                        }
                    } else n.scrollTo(0, 0)
                }

                function u(e) {
                    var t, n, i;
                    (e = j(e) ? e : q(e) ? e.toString() : r.hash()) ? (t = a.getElementById(e)) ? s(t): (n = a.getElementsByName(e), i = null, Array.prototype.some.call(n, function(e) {
                        if ("a" === en(e)) return i = e, !0
                    }), (t = i) ? s(t) : "top" === e && s(null)): s(null)
                }
                return t && i.$watch(function() {
                    return r.hash()
                }, function(t, n) {
                    var r, a;
                    t === n && "" === t || (r = function() {
                        i.$evalAsync(u)
                    }, "complete" === (a = a || e).document.readyState ? a.setTimeout(r) : o(a).on("load", r))
                }), u
            }]
        }
        tL.$$annotate = function(e, t, n) {
            var r, i, o;
            if ("function" == typeof e) {
                if (!(r = e.$inject)) {
                    if (r = [], e.length) {
                        if (t) throw j(n) && n || (n = e.name || ((o = tk(e)) ? "function(" + (o[1] || "").replace(/[\s\r\n]+/, " ") + ")" : "fn")), tM("strictdi", "{0} is not using explicit annotation and cannot be invoked in strict mode", n);
                        T(tk(e)[1].split(tC), function(e) {
                            e.replace(tP, function(e, t, n) {
                                r.push(n)
                            })
                        })
                    }
                    e.$inject = r
                }
            } else H(e) ? (eM(e[i = e.length - 1], "fn"), r = e.slice(0, i)) : eM(e, "fn", !0);
            return r
        };
        var t_ = r("$animate"),
            tD = "ng-animate";

        function tV(e, t) {
            return e || t ? e ? t ? (H(e) && (e = e.join(" ")), H(t) && (t = t.join(" ")), e + " " + t) : e : t : ""
        }

        function tF(e) {
            return V(e) ? e : {}
        }
        var tj = function() {
                this.$get = N
            },
            tq = function() {
                var e = new tO,
                    t = [];
                this.$get = ["$$AnimateRunner", "$rootScope", function(n, r) {
                    return {
                        enabled: N,
                        on: N,
                        off: N,
                        pin: N,
                        push: function(a, s, u, c) {
                            c && c(), (u = u || {}).from && a.css(u.from), u.to && a.css(u.to), (u.addClass || u.removeClass) && (l = u.addClass, f = u.removeClass, d = i(p = e.get(a) || {}, l, !0), h = i(p, f, !1), (d || h) && (e.set(a, p), t.push(a), 1 === t.length && r.$$postDigest(o)));
                            var l, f, p, d, h, $ = new n;
                            return $.complete(), $
                        }
                    };

                    function i(e, t, n) {
                        var r = !1;
                        return t && T(t = j(t) ? t.split(" ") : H(t) ? t : [], function(t) {
                            t && (r = !0, e[t] = n)
                        }), r
                    }

                    function o() {
                        T(t, function(t) {
                            var n = e.get(t);
                            if (n) {
                                var r, i, o = (j(r = t.attr("class")) && (r = r.split(" ")), i = eL(), T(r, function(e) {
                                        e.length && (i[e] = !0)
                                    }), i),
                                    a = "",
                                    s = "";
                                T(n, function(e, t) {
                                    !!o[t] !== e && (e ? a += (a.length ? " " : "") + t : s += (s.length ? " " : "") + t)
                                }), T(t, function(e) {
                                    a && tu(e, a), s && ts(e, s)
                                }), e.delete(t)
                            }
                        }), t.length = 0
                    }
                }]
            },
            tB = ["$provide", function(e) {
                var t = this,
                    n = null,
                    r = null;
                this.$$registeredAnimations = Object.create(null), this.register = function(n, r) {
                    if (n && "." !== n.charAt(0)) throw t_("notcsel", "Expecting class selector starting with '.' got '{0}'.", n);
                    var i = n + "-animation";
                    t.$$registeredAnimations[n.substr(1)] = i, e.factory(i, r)
                }, this.customFilter = function(e) {
                    return 1 == arguments.length && (r = z(e) ? e : null), r
                }, this.classNameFilter = function(e) {
                    if (1 == arguments.length && (n = d(e, RegExp) ? e : null) && RegExp("[(\\s|\\/)]" + tD + "[(\\s|\\/)]").test(n.toString())) throw n = null, t_("nongcls", '$animateProvider.classNameFilter(regex) prohibits accepting a regex value which matches/contains the "{0}" CSS class.', tD);
                    return n
                }, this.$get = ["$$animateQueue", function(e) {
                    function t(e, t, n) {
                        if (n) {
                            var r = function(e) {
                                for (var t = 0; t < e.length; t++) {
                                    var n = e[t];
                                    if (1 === n.nodeType) return n
                                }
                            }(n);
                            !r || r.parentNode || r.previousElementSibling || (n = null)
                        }
                        n ? n.after(e) : t.prepend(e)
                    }
                    return {
                        on: e.on,
                        off: e.off,
                        pin: e.pin,
                        enabled: e.enabled,
                        cancel: function(e) {
                            e.cancel && e.cancel()
                        },
                        enter: function(n, r, i, a) {
                            return r = r && o(r), i = i && o(i), t(n, r = r || i.parent(), i), e.push(n, "enter", tF(a))
                        },
                        move: function(n, r, i, a) {
                            return r = r && o(r), i = i && o(i), t(n, r = r || i.parent(), i), e.push(n, "move", tF(a))
                        },
                        leave: function(t, n) {
                            return e.push(t, "leave", tF(n), function() {
                                t.remove()
                            })
                        },
                        addClass: function(t, n, r) {
                            return (r = tF(r)).addClass = tV(r.addclass, n), e.push(t, "addClass", r)
                        },
                        removeClass: function(t, n, r) {
                            return (r = tF(r)).removeClass = tV(r.removeClass, n), e.push(t, "removeClass", r)
                        },
                        setClass: function(t, n, r, i) {
                            return (i = tF(i)).addClass = tV(i.addClass, n), i.removeClass = tV(i.removeClass, r), e.push(t, "setClass", i)
                        },
                        animate: function(t, n, r, i, o) {
                            return (o = tF(o)).from = o.from ? C(o.from, n) : n, o.to = o.to ? C(o.to, r) : r, i = i || "ng-inline-animate", o.tempClasses = tV(o.tempClasses, i), e.push(t, "animate", o)
                        }
                    }
                }]
            }],
            tH = function() {
                this.$get = ["$$rAF", function(e) {
                    var t = [];

                    function n(n) {
                        t.push(n), t.length > 1 || e(function() {
                            for (var e = 0; e < t.length; e++) t[e]();
                            t = []
                        })
                    }
                    return function() {
                        var e = !1;
                        return n(function() {
                                e = !0
                            }),
                            function(t) {
                                e ? t() : n(t)
                            }
                    }
                }]
            },
            tG = function() {
                this.$get = ["$q", "$sniffer", "$$animateAsyncRun", "$$isDocumentHidden", "$timeout", function(e, t, n, r, i) {
                    function o(e) {
                        this.setHost(e);
                        var t = n();
                        this._doneCallbacks = [], this._tick = function(e) {
                            r() ? i(e, 0, !1) : t(e)
                        }, this._state = 0
                    }
                    return o.chain = function(e, t) {
                        var n = 0;
                        ! function r() {
                            n === e.length ? t(!0) : e[n](function(e) {
                                !1 !== e ? (n++, r()) : t(!1)
                            })
                        }()
                    }, o.all = function(e, t) {
                        var n = 0,
                            r = !0;

                        function i(i) {
                            r = r && i, ++n === e.length && t(r)
                        }
                        T(e, function(e) {
                            e.done(i)
                        })
                    }, o.prototype = {
                        setHost: function(e) {
                            this.host = e || {}
                        },
                        done: function(e) {
                            2 === this._state ? e() : this._doneCallbacks.push(e)
                        },
                        progress: N,
                        getPromise: function() {
                            if (!this.promise) {
                                var t = this;
                                this.promise = e(function(e, n) {
                                    t.done(function(t) {
                                        !1 === t ? n() : e()
                                    })
                                })
                            }
                            return this.promise
                        },
                        then: function(e, t) {
                            return this.getPromise().then(e, t)
                        },
                        catch: function(e) {
                            return this.getPromise().catch(e)
                        },
                        finally: function(e) {
                            return this.getPromise().finally(e)
                        },
                        pause: function() {
                            this.host.pause && this.host.pause()
                        },
                        resume: function() {
                            this.host.resume && this.host.resume()
                        },
                        end: function() {
                            this.host.end && this.host.end(), this._resolve(!0)
                        },
                        cancel: function() {
                            this.host.cancel && this.host.cancel(), this._resolve(!1)
                        },
                        complete: function(e) {
                            var t = this;
                            0 === t._state && (t._state = 1, t._tick(function() {
                                t._resolve(e)
                            }))
                        },
                        _resolve: function(e) {
                            2 !== this._state && (T(this._doneCallbacks, function(t) {
                                t(e)
                            }), this._doneCallbacks.length = 0, this._state = 2)
                        }
                    }, o
                }]
            },
            tz = function() {
                this.$get = ["$$rAF", "$q", "$$AnimateRunner", function(e, t, n) {
                    return function(t, r) {
                        var i = r || {};
                        i.$$prepared || (i = eo(i)), i.cleanupStyles && (i.from = i.to = null), i.from && (t.css(i.from), i.from = null);
                        var o, a = new n;
                        return {
                            start: s,
                            end: s
                        };

                        function s() {
                            return e(function() {
                                i.addClass && (t.addClass(i.addClass), i.addClass = null), i.removeClass && (t.removeClass(i.removeClass), i.removeClass = null), i.to && (t.css(i.to), i.to = null), o || a.complete(), o = !0
                            }), a
                        }
                    }
                }]
            };

        function tW(e, t, n, r, i) {
            var a = this,
                s = e.location,
                u = e.history,
                c = e.setTimeout,
                l = e.clearTimeout,
                f = {},
                p = i(n);
            a.isMock = !1, a.$$completeOutstandingRequest = p.completeTask, a.$$incOutstandingRequestCount = p.incTaskCount, a.notifyWhenNoOutstandingRequests = p.notifyWhenNoPendingTasks;
            var d, h, $ = s.href,
                v = t.find("base"),
                m = null,
                g = r.history ? function() {
                    try {
                        return u.state
                    } catch (e) {}
                } : N;
            S(), a.url = function(t, n, i) {
                if (_(i) && (i = null), s !== e.location && (s = e.location), u !== e.history && (u = e.history), t) {
                    var o, c, l = h === i;
                    if (t = rS(t).href, $ === t && (!r.history || l)) return a;
                    var f = $ && nk($) === nk(t);
                    return $ = t, h = i, !r.history || f && l ? (f || (m = t), n ? s.replace(t) : f ? s.hash = -1 === (c = (o = t).indexOf("#")) ? "" : o.substr(c) : s.href = t, s.href !== t && (m = t)) : (u[n ? "replaceState" : "pushState"](i, "", t), S()), m && (m = t), a
                }
                return (m || s.href).replace(/#$/, "")
            }, a.state = function() {
                return d
            };
            var y = [],
                b = !1;

            function w() {
                m = null, O()
            }
            var E = null;

            function S() {
                es(d = _(d = g()) ? null : d, E) && (d = E), E = d, h = d
            }

            function O() {
                var e = h;
                S(), $ === a.url() && e === d || ($ = a.url(), h = d, T(y, function(e) {
                    e(a.url(), d)
                }))
            }
            a.onUrlChange = function(t) {
                return b || (r.history && o(e).on("popstate", w), o(e).on("hashchange", w), b = !0), y.push(t), t
            }, a.$$applicationDestroyed = function() {
                o(e).off("hashchange popstate", w)
            }, a.$$checkUrlChange = O, a.baseHref = function() {
                var e = v.attr("href");
                return e ? e.replace(/^(https?:)?\/\/[^/]*/, "") : ""
            }, a.defer = function(e, t, n) {
                var r;
                return t = t || 0, n = n || p.DEFAULT_TASK_TYPE, p.incTaskCount(n), f[r = c(function() {
                    delete f[r], p.completeTask(e, n)
                }, t)] = n, r
            }, a.defer.cancel = function(e) {
                if (f.hasOwnProperty(e)) {
                    var t = f[e];
                    return delete f[e], l(e), p.completeTask(N, t), !0
                }
                return !1
            }
        }

        function tJ() {
            this.$get = ["$window", "$log", "$sniffer", "$document", "$$taskTrackerFactory", function(e, t, n, r, i) {
                return new tW(e, r, t, n, i)
            }]
        }

        function tY() {
            this.$get = function() {
                var e = {};

                function t(t, n) {
                    if (t in e) throw r("$cacheFactory")("iid", "CacheId '{0}' is already taken!", t);
                    var i = 0,
                        o = C({}, n, {
                            id: t
                        }),
                        a = eL(),
                        s = n && n.capacity || Number.MAX_VALUE,
                        u = eL(),
                        c = null,
                        l = null;
                    return e[t] = {
                        put: function(e, t) {
                            if (!_(t)) return s < Number.MAX_VALUE && f(u[e] || (u[e] = {
                                key: e
                            })), e in a || i++, a[e] = t, i > s && this.remove(l.key), t
                        },
                        get: function(e) {
                            if (s < Number.MAX_VALUE) {
                                var t = u[e];
                                if (!t) return;
                                f(t)
                            }
                            return a[e]
                        },
                        remove: function(e) {
                            if (s < Number.MAX_VALUE) {
                                var t = u[e];
                                if (!t) return;
                                t === c && (c = t.p), t === l && (l = t.n), p(t.n, t.p), delete u[e]
                            }
                            e in a && (delete a[e], i--)
                        },
                        removeAll: function() {
                            a = eL(), i = 0, u = eL(), c = l = null
                        },
                        destroy: function() {
                            a = null, o = null, u = null, delete e[t]
                        },
                        info: function() {
                            return C({}, o, {
                                size: i
                            })
                        }
                    };

                    function f(e) {
                        e !== c && (l ? l === e && (l = e.n) : l = e, p(e.n, e.p), p(e, c), (c = e).n = null)
                    }

                    function p(e, t) {
                        e !== t && (e && (e.p = t), t && (t.n = e))
                    }
                }
                return t.info = function() {
                    var t = {};
                    return T(e, function(e, n) {
                        t[n] = e.info()
                    }), t
                }, t.get = function(t) {
                    return e[t]
                }, t
            }
        }

        function tQ() {
            this.$get = ["$cacheFactory", function(e) {
                return e("templates")
            }]
        }
        var tK = r("$compile"),
            tZ = new function() {};

        function tX(t, n) {
            var r = {},
                a = "Directive",
                s = /^\s*directive:\s*([\w-]+)\s+(.*)$/,
                u = /(([\w-]+)(?::([^;]+))?;?)/,
                c = function(e) {
                    var t, n = {},
                        r = e.split(",");
                    for (t = 0; t < r.length; t++) n[r[t]] = !0;
                    return n
                }("ngSrc,ngSrcset,src,srcset"),
                p = /^(?:(\^\^?)?(\?)?(\^\^?)?)?/,
                h = /^(on[a-z]+|formaction)$/,
                $ = eL();

            function v(e, t, n) {
                var r = /^([@&]|[=<](\*?))(\??)\s*([\w$]*)$/,
                    i = eL();
                return T(e, function(e, o) {
                    if ((e = e.trim()) in $) i[o] = $[e];
                    else {
                        var a = e.match(r);
                        if (!a) throw tK("iscp", "Invalid {3} for directive '{0}'. Definition: {... {1}: '{2}' ...}", t, o, e, n ? "controller bindings definition" : "isolate scope definition");
                        i[o] = {
                            mode: a[1][0],
                            collection: "*" === a[2],
                            optional: "?" === a[3],
                            attrName: a[4] || o
                        }, a[4] && ($[e] = i[o])
                    }
                }), i
            }
            this.directive = function e(n, i) {
                return eI(n, "name"), eN(n, "directive"), j(n) ? (! function(e) {
                    var t = e.charAt(0);
                    if (!t || t !== f(t)) throw tK("baddir", "Directive/Component name '{0}' is invalid. The first character must be a lowercase letter", e);
                    if (e !== e.trim()) throw tK("baddir", "Directive/Component name '{0}' is invalid. The name should not contain leading or trailing whitespaces", e)
                }(n), eI(i, "directiveFactory"), r.hasOwnProperty(n) || (r[n] = [], t.factory(n + a, ["$injector", "$exceptionHandler", function(e, t) {
                    var i = [];
                    return T(r[n], function(r, o) {
                        try {
                            var a, s, u = e.invoke(r);
                            z(u) ? u = {
                                compile: L(u)
                            } : !u.compile && u.link && (u.compile = L(u.link)), u.priority = u.priority || 0, u.index = o, u.name = u.name || n, u.require = (s = (a = u).require || a.controller && a.name, !H(s) && V(s) && T(s, function(e, t) {
                                var n = e.match(p);
                                e.substring(n[0].length) || (s[t] = n[0] + t)
                            }), s), u.restrict = function(e, t) {
                                if (e && (!j(e) || !/[EACM]/.test(e))) throw tK("badrestrict", "Restrict property '{0}' of directive '{1}' is invalid", e, t);
                                return e || "EA"
                            }(u.restrict, n), u.$$moduleName = r.$$moduleName, i.push(u)
                        } catch (e) {
                            t(e)
                        }
                    }), i
                }])), r[n].push(i)) : T(n, x(e)), this
            }, this.component = function e(t, n) {
                if (!j(t)) return T(t, x(ep(this, e))), this;
                var r = n.controller || function() {};

                function i(e) {
                    function t(t) {
                        return z(t) || H(t) ? function(n, r) {
                            return e.invoke(t, this, {
                                $element: n,
                                $attrs: r
                            })
                        } : t
                    }
                    var i = n.template || n.templateUrl ? n.template : "",
                        o = {
                            controller: r,
                            controllerAs: function(e, t) {
                                !1;
                                if (j(e)) {
                                    var n = t9.exec(e);
                                    if (n) return n[3]
                                }
                            }(n.controller) || n.controllerAs || "$ctrl",
                            template: t(i),
                            templateUrl: t(n.templateUrl),
                            transclude: n.transclude,
                            scope: {},
                            bindToController: n.bindings || {},
                            restrict: "E",
                            require: n.require
                        };
                    return T(n, function(e, t) {
                        "$" === t.charAt(0) && (o[t] = e)
                    }), o
                }
                return T(n, function(e, t) {
                    "$" === t.charAt(0) && (i[t] = e, z(r) && (r[t] = e))
                }), i.$inject = ["$injector"], this.directive(t, i)
            }, this.aHrefSanitizationTrustedUrlList = function(e) {
                return D(e) ? (n.aHrefSanitizationTrustedUrlList(e), this) : n.aHrefSanitizationTrustedUrlList()
            }, Object.defineProperty(this, "aHrefSanitizationWhitelist", {
                get: function() {
                    return this.aHrefSanitizationTrustedUrlList
                },
                set: function(e) {
                    this.aHrefSanitizationTrustedUrlList = e
                }
            }), this.imgSrcSanitizationTrustedUrlList = function(e) {
                return D(e) ? (n.imgSrcSanitizationTrustedUrlList(e), this) : n.imgSrcSanitizationTrustedUrlList()
            }, Object.defineProperty(this, "imgSrcSanitizationWhitelist", {
                get: function() {
                    return this.imgSrcSanitizationTrustedUrlList
                },
                set: function(e) {
                    this.imgSrcSanitizationTrustedUrlList = e
                }
            });
            var m = !0;
            this.debugInfoEnabled = function(e) {
                return D(e) ? (m = e, this) : m
            };
            var y = !1;
            this.strictComponentBindingsEnabled = function(e) {
                return D(e) ? (y = e, this) : y
            };
            var b = 10;
            this.onChangesTtl = function(e) {
                return arguments.length ? (b = e, this) : b
            };
            var w = !0;
            this.commentDirectivesEnabled = function(e) {
                return arguments.length ? (w = e, this) : w
            };
            var E = !0;
            this.cssClassDirectivesEnabled = function(e) {
                return arguments.length ? (E = e, this) : E
            };
            var S = eL();
            this.addPropertySecurityContext = function(e, t, n) {
                    var r = e.toLowerCase() + "|" + t.toLowerCase();
                    if (r in S && S[r] !== n) throw tK("ctxoverride", "Property context '{0}.{1}' already set to '{2}', cannot override to '{3}'.", e, t, S[r], n);
                    return S[r] = n, this
                },
                function() {
                    function e(e, t) {
                        T(t, function(t) {
                            S[t.toLowerCase()] = e
                        })
                    }
                    e(ro.HTML, ["iframe|srcdoc", "*|innerHTML", "*|outerHTML"]), e(ro.CSS, ["*|style"]), e(ro.URL, ["area|href", "area|ping", "a|href", "a|ping", "blockquote|cite", "body|background", "del|cite", "input|src", "ins|cite", "q|cite"]), e(ro.MEDIA_URL, ["audio|src", "img|src", "img|srcset", "source|src", "source|srcset", "track|src", "video|src", "video|poster"]), e(ro.RESOURCE_URL, ["*|formAction", "applet|code", "applet|codebase", "base|href", "embed|src", "frame|src", "form|action", "head|profile", "html|manifest", "iframe|src", "link|href", "media|src", "object|codebase", "object|data", "script|src"])
                }(), this.$get = ["$injector", "$interpolate", "$exceptionHandler", "$templateRequest", "$parse", "$controller", "$rootScope", "$sce", "$animate", function(t, n, $, O, x, A, R, P, I) {
                    var L, U = /^\w/,
                        D = e.document.createElement("div"),
                        F = w,
                        q = E,
                        B = b;

                    function W() {
                        try {
                            if (!--B) throw L = void 0, tK("infchng", "{0} $onChanges() iterations reached. Aborting!\n", b);
                            R.$apply(function() {
                                for (var e = 0, t = L.length; e < t; ++e) try {
                                    L[e]()
                                } catch (e) {
                                    $(e)
                                }
                                L = void 0
                            })
                        } finally {
                            B++
                        }
                    }

                    function J(e, t) {
                        if (!e) return e;
                        if (!j(e)) throw tK("srcset", 'Can\'t pass trusted values to `{0}`: "{1}"', t, e.toString());
                        for (var n = "", r = X(e), i = /\s/.test(r) ? /(\s+\d+x\s*,|\s+\d+w\s*,|\s+,|,\s+)/ : /(,)/, o = r.split(i), a = Math.floor(o.length / 2), s = 0; s < a; s++) {
                            var u = 2 * s;
                            n += P.getTrustedMediaUrl(X(o[u])), n += " " + X(o[u + 1])
                        }
                        var c = X(o[2 * s]).split(/\s/);
                        return n += P.getTrustedMediaUrl(X(c[0])), 2 === c.length && (n += " " + X(c[1])), n
                    }

                    function K(e, t) {
                        if (t) {
                            var n, r, i, o = Object.keys(t);
                            for (n = 0, r = o.length; n < r; n++) this[i = o[n]] = t[i]
                        } else this.$attr = {};
                        this.$$element = e
                    }

                    function Z(e, t) {
                        try {
                            e.addClass(t)
                        } catch (e) {}
                    }
                    K.prototype = {
                        $normalize: t3,
                        $addClass: function(e) {
                            e && e.length > 0 && I.addClass(this.$$element, e)
                        },
                        $removeClass: function(e) {
                            e && e.length > 0 && I.removeClass(this.$$element, e)
                        },
                        $updateClass: function(e, t) {
                            var n = t4(e, t);
                            n && n.length && I.addClass(this.$$element, n);
                            var r = t4(t, e);
                            r && r.length && I.removeClass(this.$$element, r)
                        },
                        $set: function(e, t, n, r) {
                            var i, o, a, s, u, c = ty(this.$$element[0], e),
                                l = tg[e],
                                f = e;
                            c ? (this.$$element.prop(e, t), r = c) : l && (this[l] = t, f = l), this[e] = t, r ? this.$attr[e] = r : (r = this.$attr[e]) || (this.$attr[e] = r = eC(e, "-")), "img" === en(this.$$element) && "srcset" === e && (this[e] = t = J(t, "$set('srcset', value)")), !1 !== n && (null === t || _(t) ? this.$$element.removeAttr(r) : U.test(r) ? c && !1 === t ? this.$$element.removeAttr(r) : this.$$element.attr(r, t) : (i = this.$$element[0], o = r, a = t, D.innerHTML = "<span " + o + ">", u = (s = D.firstChild.attributes)[0], s.removeNamedItem(u.name), u.value = a, i.attributes.setNamedItem(u)));
                            var p = this.$$observers;
                            p && T(p[f], function(e) {
                                try {
                                    e(t)
                                } catch (e) {
                                    $(e)
                                }
                            })
                        },
                        $observe: function(e, t) {
                            var n = this,
                                r = n.$$observers || (n.$$observers = eL()),
                                i = r[e] || (r[e] = []);
                            return i.push(t), R.$evalAsync(function() {
                                    i.$$inter || !n.hasOwnProperty(e) || _(n[e]) || t(n[e])
                                }),
                                function() {
                                    ei(i, t)
                                }
                        }
                    };
                    var ee = n.startSymbol(),
                        et = n.endSymbol(),
                        er = "{{" === ee && "}}" === et ? k : function(e) {
                            return e.replace(/\{\{/g, ee).replace(/}}/g, et)
                        },
                        eo = /^ng(Attr|Prop|On)([A-Z].*)$/,
                        eu = /^(.+)Start$/;
                    return ec.$$addBindingInfo = m ? function(e, t) {
                        var n = e.data("$binding") || [];
                        H(t) ? n = n.concat(t) : n.push(t), e.data("$binding", n)
                    } : N, ec.$$addBindingClass = m ? function(e) {
                        Z(e, "ng-binding")
                    } : N, ec.$$addScopeInfo = m ? function(e, t, n, r) {
                        e.data(n ? r ? "$isolateScopeNoTemplate" : "$isolateScope" : "$scope", t)
                    } : N, ec.$$addScopeClass = m ? function(e, t) {
                        Z(e, t ? "ng-isolate-scope" : "ng-scope")
                    } : N, ec.$$createComment = function(t, n) {
                        var r = "";
                        return m && (r = " " + (t || "") + ": ", n && (r += n + " ")), e.document.createComment(r)
                    }, ec;

                    function ec(e, t, n, r, i) {
                        d(e, o) || (e = o(e));
                        var a = el(e, t, e, n, r, i);
                        ec.$$addScopeClass(e);
                        var s = null;
                        return function(t, n, r) {
                            if (!e) throw tK("multilink", "This element has already been linked.");
                            eI(t, "scope"), i && i.needsNewScope && (t = t.$parent.$new());
                            var u, c, l = (r = r || {}).parentBoundTranscludeFn,
                                f = r.transcludeControllers,
                                p = r.futureParentElement;
                            if (l && l.$$boundTransclude && (l = l.$$boundTransclude), s || (s = (u = p && p[0]) && "foreignobject" !== en(u) && g.call(u).match(/SVG/) ? "svg" : "html"), c = "html" !== s ? o(eO(s, o("<div></div>").append(e).html())) : n ? t$.clone.call(e) : e, f)
                                for (var d in f) c.data("$" + d + "Controller", f[d].instance);
                            return ec.$$addScopeInfo(c, t), n && n(c, t), a && a(t, c, c, l), n || (e = a = null), c
                        }
                    }

                    function el(t, n, r, a, s, u) {
                        for (var c, l, f, p, h, v, m, g = [], y = H(t) || d(t, o), b = 0; b < t.length; b++) c = new K, 11 === i && function(e, t, n) {
                            var r, i = e[t],
                                o = i.parentNode;
                            if (i.nodeType === e_)
                                for (;
                                    (r = o ? i.nextSibling : e[t + 1]) && r.nodeType === e_;) i.nodeValue = i.nodeValue + r.nodeValue, r.parentNode && r.parentNode.removeChild(r), n && r === e[t + 1] && e.splice(t + 1, 1)
                        }(t, b, y), (f = (l = eh(t[b], [], c, 0 === b ? a : void 0, s)).length ? function t(n, r, i, a, s, u, c, l, f) {
                            f = f || {};
                            for (var p, d, h, v, m, g = -Number.MAX_VALUE, y = f.newScopeDirective, b = f.controllerDirectives, w = f.newIsolateScopeDirective, E = f.templateDirective, S = f.nonTlbTranscludeDirective, x = !1, R = !1, P = f.hasElementTranscludeDirective, I = i.$$element = o(r), N = u, k = a, L = !1, U = !1, D = 0, F = n.length; D < F; D++) {
                                var j = (p = n[D]).$$start,
                                    q = p.$$end;
                                if (j && (I = e$(r, j, q)), h = void 0, g > p.priority) break;
                                if ((m = p.scope) && (p.templateUrl || (V(m) ? (eT("new/isolated scope", w || y, p, I), w = p) : eT("new/isolated scope", w, p, I)), y = y || p), d = p.name, !L && (p.replace && (p.templateUrl || p.template) || p.transclude && !p.$$tlb)) {
                                    for (var B, W = D + 1; B = n[W++];)
                                        if (B.transclude && !B.$$tlb || B.replace && (B.templateUrl || B.template)) {
                                            U = !0;
                                            break
                                        } L = !0
                                }
                                if (!p.templateUrl && p.controller && (b = b || eL(), eT("'" + d + "' controller", b[d], p, I), b[d] = p), m = p.transclude)
                                    if (x = !0, p.$$tlb || (eT("transclusion", S, p, I), S = p), "element" === m) P = !0, g = p.priority, h = I, r = (I = i.$$element = o(ec.$$createComment(d, i[d])))[0], eA(s, ef(h), r), k = em(U, h, a, g, N && N.name, {
                                        nonTlbTranscludeDirective: S
                                    });
                                    else {
                                        var J = eL();
                                        if (V(m)) {
                                            h = e.document.createDocumentFragment();
                                            var Q = eL(),
                                                ee = eL();
                                            for (var et in T(m, function(e, t) {
                                                    var n = "?" === e.charAt(0);
                                                    Q[e = n ? e.substring(1) : e] = t, J[t] = null, ee[t] = n
                                                }), T(I.contents(), function(t) {
                                                    var n = Q[t3(en(t))];
                                                    n ? (ee[n] = !0, J[n] = J[n] || e.document.createDocumentFragment(), J[n].appendChild(t)) : h.appendChild(t)
                                                }), T(ee, function(e, t) {
                                                    if (!e) throw tK("reqslot", "Required transclusion slot `{0}` was not filled.", t)
                                                }), J)
                                                if (J[et]) {
                                                    var ei = o(J[et].childNodes);
                                                    J[et] = em(U, ei, a)
                                                } h = o(h.childNodes)
                                        } else h = o(e8(r)).contents();
                                        I.empty(), (k = em(U, h, a, void 0, void 0, {
                                            needsNewScope: p.$$isolateScope || p.$$newScope
                                        })).$$slots = J
                                    } if (p.template)
                                    if (R = !0, eT("template", E, p, I), E = p, m = er(m = z(p.template) ? p.template(I, i) : p.template), p.replace) {
                                        if (N = p, r = (h = e3(m) ? [] : t5(eO(p.templateNamespace, X(m))))[0], 1 !== h.length || 1 !== r.nodeType) throw tK("tplrt", "Template for directive '{0}' must have exactly one root element. {1}", d, "");
                                        eA(s, I, r);
                                        var eo = {
                                                $attr: {}
                                            },
                                            ea = eh(r, [], eo),
                                            es = n.splice(D + 1, n.length - (D + 1));
                                        (w || y) && ey(ea, w, y), n = n.concat(ea).concat(es), eE(i, eo), F = n.length
                                    } else I.html(m);
                                if (p.templateUrl) R = !0, eT("template", E, p, I), E = p, p.replace && (N = p), eS = function(e, n, r, i, a, s, u, c) {
                                    var l, f, p = [],
                                        d = n[0],
                                        h = e.shift(),
                                        v = M(h, {
                                            templateUrl: null,
                                            transclude: null,
                                            replace: null,
                                            $$originalDirective: h
                                        }),
                                        m = z(h.templateUrl) ? h.templateUrl(n, r) : h.templateUrl,
                                        g = h.templateNamespace;
                                    return n.empty(), O(m).then(function($) {
                                            var y, b, w, E;
                                            if ($ = er($), h.replace) {
                                                if (y = (w = e3($) ? [] : t5(eO(g, X($))))[0], 1 !== w.length || 1 !== y.nodeType) throw tK("tplrt", "Template for directive '{0}' must have exactly one root element. {1}", h.name, m);
                                                b = {
                                                    $attr: {}
                                                }, eA(i, n, y);
                                                var S = eh(y, [], b);
                                                V(h.scope) && ey(S, !0), e = S.concat(e), eE(r, b)
                                            } else y = d, n.html($);
                                            for (e.unshift(v), l = t(e, y, r, a, n, h, s, u, c), T(i, function(e, t) {
                                                    e === y && (i[t] = n[0])
                                                }), f = el(n[0].childNodes, a); p.length;) {
                                                var O = p.shift(),
                                                    x = p.shift(),
                                                    A = p.shift(),
                                                    R = p.shift(),
                                                    C = n[0];
                                                if (!O.$$destroyed) {
                                                    if (x !== d) {
                                                        var P = x.className;
                                                        c.hasElementTranscludeDirective && h.replace || (C = e8(y)), eA(A, o(x), C), Z(o(C), P)
                                                    }
                                                    E = l.transcludeOnThisElement ? ed(O, l.transclude, R) : R, l(f, O, C, i, E)
                                                }
                                            }
                                            p = null
                                        }).catch(function(e) {
                                            G(e) && $(e)
                                        }),
                                        function(e, t, n, r, i) {
                                            var o = i;
                                            t.$$destroyed || (p ? p.push(t, n, r, o) : (l.transcludeOnThisElement && (o = ed(t, l.transclude, i)), l(f, t, n, r, o)))
                                        }
                                }(n.splice(D, n.length - D), I, i, s, x && k, c, l, {
                                    controllerDirectives: b,
                                    newScopeDirective: y !== p && y,
                                    newIsolateScopeDirective: w,
                                    templateDirective: E,
                                    nonTlbTranscludeDirective: S
                                }), F = n.length;
                                else if (p.compile) try {
                                    v = p.compile(I, i, k);
                                    var eu = p.$$originalDirective || p;
                                    z(v) ? ew(null, ep(eu, v), j, q) : v && ew(ep(eu, v.pre), ep(eu, v.post), j, q)
                                } catch (e) {
                                    $(e, eb(I))
                                }
                                p.terminal && (eS.terminal = !0, g = Math.max(g, p.priority))
                            }
                            return eS.scope = y && !0 === y.scope, eS.transcludeOnThisElement = x, eS.templateOnThisElement = R, eS.transclude = k, f.hasElementTranscludeDirective = P, eS;

                            function ew(e, t, n, r) {
                                e && (n && (e = ev(e, n, r)), e.require = p.require, e.directiveName = d, (w === p || p.$$isolateScope) && (e = eR(e, {
                                    isolateScope: !0
                                })), c.push(e)), t && (n && (t = ev(t, n, r)), t.require = p.require, t.directiveName = d, (w === p || p.$$isolateScope) && (t = eR(t, {
                                    isolateScope: !0
                                })), l.push(t))
                            }

                            function eS(e, t, n, a, s) {
                                for (var u in r === n ? (O = i, S = i.$$element) : O = new K(S = o(n), i), v = t, w ? h = t.$new(!0) : y && (v = t.$parent), s && ((g = function(e, t, n, r) {
                                        if (Y(e) || (r = n, n = t, t = e, e = void 0), P && (i = m), n || (n = P ? S.parent() : S), !r) return s(e, t, i, n, N);
                                        var i, o = s.$$slots[r];
                                        if (o) return o(e, t, i, n, N);
                                        if (_(o)) throw tK("noslot", 'No parent directive that requires a transclusion with slot name "{0}". Element: {1}', r, eb(S))
                                    }).$$boundTransclude = s, g.isSlotFilled = function(e) {
                                        return !!s.$$slots[e]
                                    }), b && (m = function(e, t, n, r, i, o, a) {
                                        var s = eL();
                                        for (var u in r) {
                                            var c = r[u],
                                                l = {
                                                    $scope: c === a || c.$$isolateScope ? i : o,
                                                    $element: e,
                                                    $attrs: t,
                                                    $transclude: n
                                                },
                                                f = c.controller;
                                            "@" === f && (f = t[c.name]);
                                            var p = A(f, l, !0, c.controllerAs);
                                            s[c.name] = p, e.data("$" + c.name + "Controller", p.instance)
                                        }
                                        return s
                                    }(S, O, g, b, h, t, w)), w && (ec.$$addScopeInfo(S, h, !0, !(E && (E === w || E === w.$$originalDirective))), ec.$$addScopeClass(S, !0), h.$$isolateBindings = w.$$isolateBindings, (x = eN(t, O, h, h.$$isolateBindings, w)).removeWatches && h.$on("$destroy", x.removeWatches)), m) {
                                    var f, p, d, h, v, m, g, S, O, x, R = b[u],
                                        I = m[u],
                                        M = R.$$bindings.bindToController;
                                    I.instance = I(), S.data("$" + R.name + "Controller", I.instance), I.bindingInfo = eN(v, O, I.instance, M, R)
                                }
                                for (T(b, function(e, t) {
                                        var n = e.require;
                                        e.bindToController && !H(n) && V(n) && C(m[t].instance, eg(t, n, S, m))
                                    }), T(m, function(e) {
                                        var t = e.instance;
                                        if (z(t.$onChanges)) try {
                                            t.$onChanges(e.bindingInfo.initialChanges)
                                        } catch (e) {
                                            $(e)
                                        }
                                        if (z(t.$onInit)) try {
                                            t.$onInit()
                                        } catch (e) {
                                            $(e)
                                        }
                                        z(t.$doCheck) && (v.$watch(function() {
                                            t.$doCheck()
                                        }), t.$doCheck()), z(t.$onDestroy) && v.$on("$destroy", function() {
                                            t.$onDestroy()
                                        })
                                    }), f = 0, p = c.length; f < p; f++) eP(d = c[f], d.isolateScope ? h : t, S, O, d.require && eg(d.directiveName, d.require, S, m), g);
                                var N = t;
                                for (w && (w.template || null === w.templateUrl) && (N = h), e && e(N, n.childNodes, void 0, s), f = l.length - 1; f >= 0; f--) eP(d = l[f], d.isolateScope ? h : t, S, O, d.require && eg(d.directiveName, d.require, S, m), g);
                                T(m, function(e) {
                                    var t = e.instance;
                                    z(t.$postLink) && t.$postLink()
                                })
                            }
                        }(l, t[b], c, n, r, null, [], [], u) : null) && f.scope && ec.$$addScopeClass(c.$$element), h = (!f || !f.terminal) && (p = t[b].childNodes) && p.length ? el(p, f ? (f.transcludeOnThisElement || !f.templateOnThisElement) && f.transclude : n) : null, (f || h) && (g.push(b, f, h), v = !0, m = m || f), u = null;
                        return v ? function(e, t, r, i) {
                            var a, s, u, c, l, f, p, d;
                            if (m)
                                for (d = Array(t.length), l = 0; l < g.length; l += 3) d[p = g[l]] = t[p];
                            else d = t;
                            for (l = 0, f = g.length; l < f;) u = d[g[l++]], a = g[l++], s = g[l++], a ? (a.scope ? (c = e.$new(), ec.$$addScopeInfo(o(u), c)) : c = e, a(s, c, u, r, a.transcludeOnThisElement ? ed(e, a.transclude, i) : !a.templateOnThisElement && i ? i : !i && n ? ed(e, n) : null)) : s && s(e, u.childNodes, void 0, i)
                        } : null
                    }

                    function ed(e, t, n) {
                        function r(r, i, o, a, s) {
                            return r || ((r = e.$new(!1, s)).$$transcluded = !0), t(r, i, {
                                parentBoundTranscludeFn: n,
                                transcludeControllers: o,
                                futureParentElement: a
                            })
                        }
                        var i = r.$$slots = eL();
                        for (var o in t.$$slots) t.$$slots[o] ? i[o] = ed(e, t.$$slots[o], n) : i[o] = null;
                        return r
                    }

                    function eh(e, i, o, l, f) {
                        var p, d, v, m, g = e.nodeType,
                            y = o.$attr;
                        switch (g) {
                            case 1:
                                ew(i, t3(v = en(e)), "E", l, f);
                                for (var b, w, E, T, O, A = e.attributes, C = 0, I = A && A.length; C < I; C++) {
                                    var M, N, L, U, _ = !1,
                                        D = !1,
                                        B = !1,
                                        H = !1,
                                        G = !1;
                                    w = (b = A[C]).name, T = b.value, (O = (E = t3(w.toLowerCase())).match(eo)) ? (B = "Attr" === O[1], H = "Prop" === O[1], G = "On" === O[1], w = w.replace(t1, "").toLowerCase().substr(4 + O[1].length).replace(/_(.)/g, function(e, t) {
                                        return t.toUpperCase()
                                    })) : (U = E.match(eu)) && function(e) {
                                        if (r.hasOwnProperty(e)) {
                                            for (var n = t.get(e + a), i = 0, o = n.length; i < o; i++)
                                                if (n[i].multiElement) return !0
                                        }
                                        return !1
                                    }(U[1]) && (_ = w, D = w.substr(0, w.length - 5) + "end", w = w.substr(0, w.length - 6)), H || G ? (o[E] = T, y[E] = b.name, H ? function(e, t, n, r) {
                                        if (h.test(r)) throw tK("nodomevents", "Property bindings for HTML DOM event properties are disallowed");
                                        var i, o = en(e),
                                            a = S[o + "|" + (i = r.toLowerCase())] || S["*|" + i],
                                            s = k;
                                        "srcset" !== r || "img" !== o && "source" !== o ? a && (s = P.getTrusted.bind(P, a)) : s = ex, t.push({
                                            priority: 100,
                                            compile: function(e, t) {
                                                var i = x(t[n]),
                                                    o = x(t[n], function(e) {
                                                        return P.valueOf(e)
                                                    });
                                                return {
                                                    pre: function(e, t) {
                                                        function n() {
                                                            var n = i(e);
                                                            t[0][r] = s(n)
                                                        }
                                                        n(), e.$watch(o, n)
                                                    }
                                                }
                                            }
                                        })
                                    }(e, i, E, w) : (M = i, N = E, L = w, M.push(iV(x, R, $, N, L, !1)))) : (y[E = t3(w.toLowerCase())] = w, !B && o.hasOwnProperty(E) || (o[E] = T, ty(e, E) && (o[E] = !0)), function(e, t, r, i, o) {
                                        var a = en(e),
                                            s = "srcdoc" === i ? P.HTML : "src" === i || "ngSrc" === i ? -1 === ["img", "video", "audio", "source", "track"].indexOf(a) ? P.RESOURCE_URL : P.MEDIA_URL : "xlinkHref" === i ? "image" === a ? P.MEDIA_URL : "a" === a ? P.URL : P.RESOURCE_URL : "form" === a && "action" === i || "base" === a && "href" === i || "link" === a && "href" === i ? P.RESOURCE_URL : "a" !== a || "href" !== i && "ngHref" !== i ? void 0 : P.URL,
                                            u = c[i] || o,
                                            l = n(r, !o, s, u);
                                        if (l) {
                                            if ("multiple" === i && "select" === a) throw tK("selmulti", "Binding to the 'multiple' attribute is not supported. Element: {0}", eb(e));
                                            if (h.test(i)) throw tK("nodomevents", "Interpolations for HTML DOM event attributes are disallowed");
                                            t.push({
                                                priority: 100,
                                                compile: function() {
                                                    return {
                                                        pre: function(e, t, o) {
                                                            var a = o.$$observers || (o.$$observers = eL()),
                                                                c = o[i];
                                                            c !== r && (l = c && n(c, !0, s, u), r = c), l && (o[i] = l(e), (a[i] || (a[i] = [])).$$inter = !0, (o.$$observers && o.$$observers[i].$$scope || e).$watch(l, function(e, t) {
                                                                "class" === i && e !== t ? o.$updateClass(e, t) : o.$set(i, e)
                                                            }))
                                                        }
                                                    }
                                                }
                                            })
                                        }
                                    }(e, i, T, E, B), ew(i, E, "A", l, f, _, D))
                                }
                                if ("input" === v && "hidden" === e.getAttribute("type") && e.setAttribute("autocomplete", "off"), !q) break;
                                if (V(m = e.className) && (m = m.animVal), j(m) && "" !== m)
                                    for (; d = u.exec(m);) ew(i, E = t3(d[2]), "C", l, f) && (o[E] = X(d[3])), m = m.substr(d.index + d[0].length);
                                break;
                            case e_:
                                (p = n(e.nodeValue, !0)) && i.push({
                                    priority: 0,
                                    compile: function(e) {
                                        var t = e.parent(),
                                            n = !!t.length;
                                        return n && ec.$$addBindingClass(t),
                                            function(e, t) {
                                                var r = t.parent();
                                                n || ec.$$addBindingClass(r), ec.$$addBindingInfo(r, p.expressions), e.$watch(p, function(e) {
                                                    t[0].nodeValue = e
                                                })
                                            }
                                    }
                                });
                                break;
                            case 8:
                                if (!F) break;
                                try {
                                    var z = s.exec(e.nodeValue);
                                    if (z) {
                                        var W = t3(z[1]);
                                        ew(i, W, "M", l, f) && (o[W] = X(z[2]))
                                    }
                                } catch (e) {}
                        }
                        return i.sort(eS), i
                    }

                    function e$(e, t, n) {
                        var r = [],
                            i = 0;
                        if (t && e.hasAttribute && e.hasAttribute(t))
                            do {
                                if (!e) throw tK("uterdir", "Unterminated attribute, found '{0}' but no matching '{1}' found.", t, n);
                                1 === e.nodeType && (e.hasAttribute(t) && i++, e.hasAttribute(n) && i--), r.push(e), e = e.nextSibling
                            } while (i > 0);
                        else r.push(e);
                        return o(r)
                    }

                    function ev(e, t, n) {
                        return function(r, i, o, a, s) {
                            return e(r, i = e$(i[0], t, n), o, a, s)
                        }
                    }

                    function em(e, t, n, r, i, o) {
                        var a;
                        return e ? ec(t, n, r, i, o) : function() {
                            return a || (a = ec(t, n, r, i, o), t = n = o = null), a.apply(this, arguments)
                        }
                    }

                    function eg(e, t, n, r) {
                        var i;
                        if (j(t)) {
                            var o = t.match(p),
                                a = t.substring(o[0].length),
                                s = o[1] || o[3],
                                u = "?" === o[2];
                            if ("^^" === s ? n = n.parent() : i = (i = r && r[a]) && i.instance, !i) {
                                var c = "$" + a + "Controller";
                                i = "^^" === s && n[0] && 9 === n[0].nodeType ? null : s ? n.inheritedData(c) : n.data(c)
                            }
                            if (!i && !u) throw tK("ctreq", "Controller '{0}', required by directive '{1}', can't be found!", a, e)
                        } else if (H(t)) {
                            i = [];
                            for (var l = 0, f = t.length; l < f; l++) i[l] = eg(e, t[l], n, r)
                        } else V(t) && (i = {}, T(t, function(t, o) {
                            i[o] = eg(e, t, n, r)
                        }));
                        return i || null
                    }

                    function ey(e, t, n) {
                        for (var r = 0, i = e.length; r < i; r++) e[r] = M(e[r], {
                            $$isolateScope: t,
                            $$newScope: n
                        })
                    }

                    function ew(e, n, i, o, s, u, c) {
                        if (n === s) return null;
                        var l = null;
                        if (r.hasOwnProperty(n)) {
                            for (var f, p = t.get(n + a), d = 0, h = p.length; d < h; d++)
                                if (f = p[d], (_(o) || o > f.priority) && -1 !== f.restrict.indexOf(i)) {
                                    if (u && (f = M(f, {
                                            $$start: u,
                                            $$end: c
                                        })), !f.$$bindings) {
                                        var $ = f.$$bindings = function(e, t) {
                                            var n = {
                                                isolateScope: null,
                                                bindToController: null
                                            };
                                            if (V(e.scope) && (!0 === e.bindToController ? (n.bindToController = v(e.scope, t, !0), n.isolateScope = {}) : n.isolateScope = v(e.scope, t, !1)), V(e.bindToController) && (n.bindToController = v(e.bindToController, t, !0)), n.bindToController && !e.controller) throw tK("noctrl", "Cannot bind to controller without directive '{0}'s controller.", t);
                                            return n
                                        }(f, f.name);
                                        V($.isolateScope) && (f.$$isolateBindings = $.isolateScope)
                                    }
                                    e.push(f), l = f
                                }
                        }
                        return l
                    }

                    function eE(e, t) {
                        var n = t.$attr,
                            r = e.$attr;
                        T(e, function(r, i) {
                            "$" !== i.charAt(0) && (t[i] && t[i] !== r && (r.length ? r += ("style" === i ? ";" : " ") + t[i] : r = t[i]), e.$set(i, r, !0, n[i]))
                        }), T(t, function(t, i) {
                            e.hasOwnProperty(i) || "$" === i.charAt(0) || (e[i] = t, "class" !== i && "style" !== i && (r[i] = n[i]))
                        })
                    }

                    function eS(e, t) {
                        var n = t.priority - e.priority;
                        return 0 !== n ? n : e.name !== t.name ? e.name < t.name ? -1 : 1 : e.index - t.index
                    }

                    function eT(e, t, n, r) {
                        function i(e) {
                            return e ? " (module: " + e + ")" : ""
                        }
                        if (t) throw tK("multidir", "Multiple directives [{0}{1}, {2}{3}] asking for {4} on: {5}", t.name, i(t.$$moduleName), n.name, i(n.$$moduleName), e, eb(r))
                    }

                    function eO(t, n) {
                        switch (t = f(t || "html")) {
                            case "svg":
                            case "math":
                                var r = e.document.createElement("div");
                                return r.innerHTML = "<" + t + ">" + n + "</" + t + ">", r.childNodes[0].childNodes;
                            default:
                                return n
                        }
                    }

                    function ex(e) {
                        return J(P.valueOf(e), "ng-prop-srcset")
                    }

                    function eA(t, n, r) {
                        var i, a, s = n[0],
                            u = n.length,
                            c = s.parentNode;
                        if (t) {
                            for (i = 0, a = t.length; i < a; i++)
                                if (t[i] === s) {
                                    t[i++] = r;
                                    for (var l = i, f = l + u - 1, p = t.length; l < p; l++, f++) f < p ? t[l] = t[f] : delete t[l];
                                    t.length -= u - 1, t.context === s && (t.context = r);
                                    break
                                }
                        }
                        c && c.replaceChild(r, s);
                        var d = e.document.createDocumentFragment();
                        for (i = 0; i < u; i++) d.appendChild(n[i]);
                        for (o.hasData(s) && (o.data(r, o.data(s)), o(s).off("$destroy")), o.cleanData(d.querySelectorAll("*")), i = 1; i < u; i++) delete n[i];
                        n[0] = r, n.length = 1
                    }

                    function eR(e, t) {
                        return C(function() {
                            return e.apply(null, arguments)
                        }, e, t)
                    }

                    function eP(e, t, n, r, i, o) {
                        try {
                            e(t, n, r, i, o)
                        } catch (e) {
                            $(e, eb(n))
                        }
                    }

                    function eM(e, t) {
                        if (y) throw tK("missingattr", "Attribute '{0}' of '{1}' is non-optional and must be set!", e, t)
                    }

                    function eN(e, t, r, i, o) {
                        var a, s = [],
                            u = {};

                        function c(t, n, i) {
                            z(r.$onChanges) && !ea(n, i) && (L || (e.$$postDigest(W), L = []), a || (a = {}, L.push(f)), a[t] && (i = a[t].previousValue), a[t] = new t0(i, n))
                        }

                        function f() {
                            r.$onChanges(a), a = void 0
                        }
                        return T(i, function(i, a) {
                            var f, p, d, h, $, v = i.attrName,
                                m = i.optional;
                            switch (i.mode) {
                                case "@":
                                    m || l.call(t, v) || (eM(v, o.name), r[a] = t[v] = void 0), $ = t.$observe(v, function(e) {
                                        if (j(e) || Q(e)) {
                                            var t = r[a];
                                            c(a, e, t), r[a] = e
                                        }
                                    }), t.$$observers[v].$$scope = e, j(f = t[v]) ? r[a] = n(f)(e) : Q(f) && (r[a] = f), u[a] = new t0(tZ, r[a]), s.push($);
                                    break;
                                case "=":
                                    if (!l.call(t, v)) {
                                        if (m) break;
                                        eM(v, o.name), t[v] = void 0
                                    }
                                    if (m && !t[v]) break;
                                    h = (p = x(t[v])).literal ? es : ea, d = p.assign || function() {
                                        throw f = r[a] = p(e), tK("nonassign", "Expression '{0}' in attribute '{1}' used with directive '{2}' is non-assignable!", t[v], v, o.name)
                                    }, f = r[a] = p(e);
                                    var g = function(t) {
                                        return h(t, r[a]) || (h(t, f) ? d(e, t = r[a]) : r[a] = t), f = t
                                    };
                                    g.$stateful = !0, $ = i.collection ? e.$watchCollection(t[v], g) : e.$watch(x(t[v], g), null, p.literal), s.push($);
                                    break;
                                case "<":
                                    if (!l.call(t, v)) {
                                        if (m) break;
                                        eM(v, o.name), t[v] = void 0
                                    }
                                    if (m && !t[v]) break;
                                    var y = (p = x(t[v])).literal,
                                        b = r[a] = p(e);
                                    u[a] = new t0(tZ, r[a]), $ = e[i.collection ? "$watchCollection" : "$watch"](p, function(e, t) {
                                        if (t === e) {
                                            if (t === b || y && es(t, b)) return;
                                            t = b
                                        }
                                        c(a, e, t), r[a] = e
                                    }), s.push($);
                                    break;
                                case "&":
                                    if (m || l.call(t, v) || eM(v, o.name), (p = t.hasOwnProperty(v) ? x(t[v]) : N) === N && m) break;
                                    r[a] = function(t) {
                                        return p(e, t)
                                    }
                            }
                        }), {
                            initialChanges: u,
                            removeWatches: s.length && function() {
                                for (var e = 0, t = s.length; e < t; ++e) s[e]()
                            }
                        }
                    }
                }]
        }

        function t0(e, t) {
            this.previousValue = e, this.currentValue = t
        }
        tX.$inject = ["$provide", "$$sanitizeUriProvider"], t0.prototype.isFirstChange = function() {
            return this.previousValue === tZ
        };
        var t1 = /^((?:x|data)[:\-_])/i,
            t2 = /[:\-_]+(.)/g;

        function t3(e) {
            return e.replace(t1, "").replace(t2, function(e, t, n) {
                return n ? t.toUpperCase() : t
            })
        }

        function t4(e, t) {
            var n = "",
                r = e.split(/\s+/),
                i = t.split(/\s+/);
            e: for (var o = 0; o < r.length; o++) {
                for (var a = r[o], s = 0; s < i.length; s++)
                    if (a === i[s]) continue e;
                n += (n.length > 0 ? " " : "") + a
            }
            return n
        }

        function t5(e) {
            var t = (e = o(e)).length;
            if (t <= 1) return e;
            for (; t--;) {
                var n = e[t];
                (8 === n.nodeType || n.nodeType === e_ && "" === n.nodeValue.trim()) && $.call(e, t, 1)
            }
            return e
        }
        var t6 = r("$controller"),
            t9 = /^(\S+)(\s+as\s+([\w$]+))?$/;

        function t8() {
            var e = {};
            this.has = function(t) {
                return e.hasOwnProperty(t)
            }, this.register = function(t, n) {
                eN(t, "controller"), V(t) ? C(e, t) : e[t] = n
            }, this.$get = ["$injector", function(t) {
                return function(r, i, o, a) {
                    var s, u, c, l;
                    if (o = !0 === o, a && j(a) && (l = a), j(r)) {
                        if (!(u = r.match(t9))) throw t6("ctrlfmt", "Badly formed controller string '{0}'. Must match `__name__ as __id__` or `__name__`.", r);
                        if (c = u[1], l = l || u[3], !(r = e.hasOwnProperty(c) ? e[c] : function(e, t, n) {
                                if (!t) return e;
                                for (var r, i = t.split("."), o = e, a = i.length, s = 0; s < a; s++) r = i[s], e && (e = (o = e)[r]);
                                return !n && z(e) ? ep(o, e) : e
                            }(i.$scope, c, !0))) throw t6("ctrlreg", "The controller with the name '{0}' is not registered.", c);
                        eM(r, c, !0)
                    }
                    return o ? (s = Object.create((H(r) ? r[r.length - 1] : r).prototype || null), l && n(i, l, s, c || r.name), C(function() {
                        var e = t.invoke(r, s, i, c);
                        return e !== s && (V(e) || z(e)) && (s = e, l && n(i, l, s, c || r.name)), s
                    }, {
                        instance: s,
                        identifier: l
                    })) : (s = t.instantiate(r, i, c), l && n(i, l, s, c || r.name), s)
                };

                function n(e, t, n, i) {
                    if (!e || !V(e.$scope)) throw r("$controller")("noscp", "Cannot export controller '{0}' as '{1}'! No $scope object provided via `locals`.", i, t);
                    e.$scope[t] = n
                }
            }]
        }

        function t7() {
            this.$get = ["$window", function(e) {
                return o(e.document)
            }]
        }

        function ne() {
            this.$get = ["$document", "$rootScope", function(e, t) {
                var n = e[0],
                    r = n && n.hidden;

                function i() {
                    r = n.hidden
                }
                return e.on("visibilitychange", i), t.$on("$destroy", function() {
                        e.off("visibilitychange", i)
                    }),
                    function() {
                        return r
                    }
            }]
        }

        function nt() {
            this.$get = ["$log", function(e) {
                return function(t, n) {
                    e.error.apply(e, arguments)
                }
            }]
        }
        var nn = function() {
                this.$get = ["$document", function(e) {
                    return function(t) {
                        return t ? !t.nodeType && d(t, o) && (t = t[0]) : t = e[0].body, t.offsetWidth + 1
                    }
                }]
            },
            nr = "application/json",
            ni = {
                "Content-Type": nr + ";charset=utf-8"
            },
            no = /^\[|^\{(?!\{)/,
            na = {
                "[": /]$/,
                "{": /}$/
            },
            ns = /^\)]\}',?\n/,
            nu = r("$http");

        function nc(e) {
            return V(e) ? B(e) ? e.toISOString() : eh(e) : e
        }

        function nl() {
            this.$get = function() {
                return function(e) {
                    if (!e) return "";
                    var t = [];
                    return O(e, function(e, n) {
                        null === e || _(e) || z(e) || (H(e) ? T(e, function(e) {
                            t.push(eT(n) + "=" + eT(nc(e)))
                        }) : t.push(eT(n) + "=" + eT(nc(e))))
                    }), t.join("&")
                }
            }
        }

        function nf() {
            this.$get = function() {
                return function(e) {
                    if (!e) return "";
                    var t = [];
                    return function e(n, r, i) {
                        H(n) ? T(n, function(t, n) {
                            e(t, r + "[" + (V(t) ? n : "") + "]")
                        }) : V(n) && !B(n) ? O(n, function(t, n) {
                            e(t, r + (i ? "" : "[") + n + (i ? "" : "]"))
                        }) : (z(n) && (n = n()), t.push(eT(r) + "=" + (null == n ? "" : eT(nc(n)))))
                    }(e, "", !0), t.join("&")
                }
            }
        }

        function np(e, t) {
            if (j(e)) {
                var n, r = e.replace(ns, "").trim();
                if (r) {
                    var i = t("Content-Type"),
                        o = i && 0 === i.indexOf(nr);
                    if (o || (n = r.match(no)) && na[n[0]].test(r)) try {
                        e = e$(r)
                    } catch (t) {
                        if (!o) return e;
                        throw nu("baddata", 'Data must be a valid JSON object. Received: "{0}". Parse error: "{1}"', e, t)
                    }
                }
            }
            return e
        }

        function nd(e) {
            var t, n = eL();

            function r(e, t) {
                e && (n[e] = n[e] ? n[e] + ", " + t : t)
            }
            return j(e) ? T(e.split("\n"), function(e) {
                t = e.indexOf(":"), r(f(X(e.substr(0, t))), X(e.substr(t + 1)))
            }) : V(e) && T(e, function(e, t) {
                r(f(t), X(e))
            }), n
        }

        function nh(e) {
            var t;
            return function(n) {
                if (t || (t = nd(e)), n) {
                    var r = t[f(n)];
                    return void 0 === r && (r = null), r
                }
                return t
            }
        }

        function n$(e, t, n, r) {
            return z(r) ? r(e, t, n) : (T(r, function(r) {
                e = r(e, t, n)
            }), e)
        }

        function nv(e) {
            return 200 <= e && e < 300
        }

        function nm() {
            var e = this.defaults = {
                    transformResponse: [np],
                    transformRequest: [function(e) {
                        return V(e) && "[object File]" !== g.call(e) && "[object Blob]" !== g.call(e) && "[object FormData]" !== g.call(e) ? eh(e) : e
                    }],
                    headers: {
                        common: {
                            Accept: "application/json, text/plain, */*"
                        },
                        post: eD(ni),
                        put: eD(ni),
                        patch: eD(ni)
                    },
                    xsrfCookieName: "XSRF-TOKEN",
                    xsrfHeaderName: "X-XSRF-TOKEN",
                    paramSerializer: "$httpParamSerializer",
                    jsonpCallbackParam: "callback"
                },
                t = !1;
            this.useApplyAsync = function(e) {
                return D(e) ? (t = !!e, this) : t
            };
            var n = this.interceptors = [],
                i = this.xsrfTrustedOrigins = [];
            Object.defineProperty(this, "xsrfWhitelistedOrigins", {
                get: function() {
                    return this.xsrfTrustedOrigins
                },
                set: function(e) {
                    this.xsrfTrustedOrigins = e
                }
            }), this.$get = ["$browser", "$httpBackend", "$$cookieReader", "$cacheFactory", "$rootScope", "$q", "$injector", "$sce", function(o, a, s, u, c, l, d, h) {
                var $ = u("$http");
                e.paramSerializer = j(e.paramSerializer) ? d.get(e.paramSerializer) : e.paramSerializer;
                var v = [];
                T(n, function(e) {
                    v.unshift(j(e) ? d.get(e) : d.invoke(e))
                });
                var m, g = (m = [rw].concat(i.map(rS)), function(e) {
                    var t = rS(e);
                    return m.some(rT.bind(null, t))
                });

                function y(n) {
                    if (!V(n)) throw r("$http")("badreq", "Http request configuration must be an object.  Received: {0}", n);
                    if (!j(h.valueOf(n.url))) throw r("$http")("badreq", "Http request configuration url must be a string or a $sce trusted object.  Received: {0}", n.url);
                    var i = C({
                        method: "get",
                        transformRequest: e.transformRequest,
                        transformResponse: e.transformResponse,
                        paramSerializer: e.paramSerializer,
                        jsonpCallbackParam: e.jsonpCallbackParam
                    }, n);
                    i.headers = function(t) {
                        var n, r, i, o, a, s, u = e.headers,
                            c = C({}, t.headers);
                        u = C({}, u.common, u[f(t.method)]);
                        e: for (o in u) {
                            for (s in a = f(o), c)
                                if (f(s) === a) continue e;
                            c[o] = u[o]
                        }
                        return n = eD(t), i = {}, T(c, function(e, t) {
                            z(e) ? null != (r = e(n)) && (i[t] = r) : i[t] = e
                        }), i
                    }(n), i.method = p(i.method), i.paramSerializer = j(i.paramSerializer) ? d.get(i.paramSerializer) : i.paramSerializer, o.$$incOutstandingRequestCount("$http");
                    var u = [],
                        m = [],
                        b = l.resolve(i);
                    return T(v, function(e) {
                        (e.request || e.requestError) && u.unshift(e.request, e.requestError), (e.response || e.responseError) && m.push(e.response, e.responseError)
                    }), b = (b = w(b, u)).then(function(n) {
                        var r = n.headers,
                            i = n$(n.data, nh(r), void 0, n.transformRequest);
                        return _(i) && T(r, function(e, t) {
                            "content-type" === f(t) && delete r[t]
                        }), _(n.withCredentials) && !_(e.withCredentials) && (n.withCredentials = e.withCredentials), (function(n, r) {
                            var i, o, u, p, d = l.defer(),
                                v = d.promise,
                                m = n.headers,
                                b = "jsonp" === f(n.method),
                                w = n.url;
                            if (b ? w = h.getTrustedResourceUrl(w) : j(w) || (w = h.valueOf(w)), i = w, (o = n.paramSerializer(n.params)).length > 0 && (i += (-1 === i.indexOf("?") ? "?" : "&") + o), w = i, b && (w = function(e, t) {
                                    var n = e.split("?");
                                    if (n.length > 2) throw nu("badjsonp", 'Illegal use more than one "?", in url, "{1}"', e);
                                    return T(eE(n[1]), function(n, r) {
                                        if ("JSON_CALLBACK" === n) throw nu("badjsonp", 'Illegal use of JSON_CALLBACK in url, "{0}"', e);
                                        if (r === t) throw nu("badjsonp", 'Illegal use of callback param, "{0}", in url, "{1}"', t, e)
                                    }), e += (-1 === e.indexOf("?") ? "?" : "&") + t + "=JSON_CALLBACK"
                                }(w, n.jsonpCallbackParam)), y.pendingRequests.push(n), v.then(A, A), (n.cache || e.cache) && !1 !== n.cache && ("GET" === n.method || "JSONP" === n.method) && (u = V(n.cache) ? n.cache : V(e.cache) ? e.cache : $), u && (D(p = u.get(w)) ? K(p) ? p.then(x, x) : H(p) ? O(p[1], p[0], eD(p[2]), p[3], p[4]) : O(p, 200, {}, "OK", "complete") : u.put(w, v)), _(p)) {
                                var E = g(n.url) ? s()[n.xsrfCookieName || e.xsrfCookieName] : void 0;
                                E && (m[n.xsrfHeaderName || e.xsrfHeaderName] = E), a(n.method, w, r, function(e, n, r, i, o) {
                                    function a() {
                                        O(n, e, r, i, o)
                                    }
                                    u && (nv(e) ? u.put(w, [e, n, nd(r), i, o]) : u.remove(w)), t ? c.$applyAsync(a) : (a(), c.$$phase || c.$apply())
                                }, m, n.timeout, n.withCredentials, n.responseType, S(n.eventHandlers), S(n.uploadEventHandlers))
                            }
                            return v;

                            function S(e) {
                                if (e) {
                                    var n = {};
                                    return T(e, function(e, r) {
                                        n[r] = function(n) {
                                            function r() {
                                                e(n)
                                            }
                                            t ? c.$applyAsync(r) : c.$$phase ? r() : c.$apply(r)
                                        }
                                    }), n
                                }
                            }

                            function O(e, t, r, i, o) {
                                (nv(t = t >= -1 ? t : 0) ? d.resolve : d.reject)({
                                    data: e,
                                    status: t,
                                    headers: nh(r),
                                    config: n,
                                    statusText: i,
                                    xhrStatus: o
                                })
                            }

                            function x(e) {
                                O(e.data, e.status, eD(e.headers()), e.statusText, e.xhrStatus)
                            }

                            function A() {
                                var e = y.pendingRequests.indexOf(n); - 1 !== e && y.pendingRequests.splice(e, 1)
                            }
                        })(n, i).then(E, E)
                    }), b = (b = w(b, m)).finally(function() {
                        o.$$completeOutstandingRequest(N, "$http")
                    });

                    function w(e, t) {
                        for (var n = 0, r = t.length; n < r;) {
                            var i = t[n++],
                                o = t[n++];
                            e = e.then(i, o)
                        }
                        return t.length = 0, e
                    }

                    function E(e) {
                        var t = C({}, e);
                        return t.data = n$(e.data, e.headers, e.status, i.transformResponse), nv(e.status) ? t : l.reject(t)
                    }
                }
                return y.pendingRequests = [],
                    function(e) {
                        T(arguments, function(e) {
                            y[e] = function(t, n) {
                                return y(C({}, n || {}, {
                                    method: e,
                                    url: t
                                }))
                            }
                        })
                    }("get", "delete", "head", "jsonp"),
                    function(e) {
                        T(arguments, function(e) {
                            y[e] = function(t, n, r) {
                                return y(C({}, r || {}, {
                                    method: e,
                                    url: t,
                                    data: n
                                }))
                            }
                        })
                    }("post", "put", "patch"), y.defaults = e, y
            }]
        }

        function ng() {
            this.$get = function() {
                return function() {
                    return new e.XMLHttpRequest
                }
            }
        }

        function ny() {
            this.$get = ["$browser", "$jsonpCallbacks", "$document", "$xhrFactory", function(e, t, n, r) {
                var i, o;
                return i = e.defer, o = n[0],
                    function(n, a, s, u, c, l, p, d, h, $) {
                        if (a = a || e.url(), "jsonp" === f(n)) var v, m, g, y, b, w = t.createCallback(a),
                            E = (v = a, m = w, g = function(e, n) {
                                var r = 200 === e && t.getResponse(w);
                                R(u, e, r, "", n, "complete"), t.removeCallback(w)
                            }, v = v.replace("JSON_CALLBACK", m), y = o.createElement("script"), b = null, y.type = "text/javascript", y.src = v, y.async = !0, b = function(e) {
                                y.removeEventListener("load", b), y.removeEventListener("error", b), o.body.removeChild(y), y = null;
                                var n = -1,
                                    r = "unknown";
                                e && ("load" !== e.type || t.wasCalled(m) || (e = {
                                    type: "error"
                                }), r = e.type, n = "error" === e.type ? 404 : 200), g && g(n, r)
                            }, y.addEventListener("load", b), y.addEventListener("error", b), o.body.appendChild(y), b);
                        else {
                            var S = r(n, a),
                                O = !1;
                            if (S.open(n, a, !0), T(c, function(e, t) {
                                    D(e) && S.setRequestHeader(t, e)
                                }), S.onload = function() {
                                    var e = S.statusText || "",
                                        t = "response" in S ? S.response : S.responseText,
                                        n = 1223 === S.status ? 204 : S.status;
                                    0 === n && (n = t ? 200 : 404 * ("file" === rS(a).protocol)), R(u, n, t, S.getAllResponseHeaders(), e, "complete")
                                }, S.onerror = function() {
                                    R(u, -1, null, null, "", "error")
                                }, S.ontimeout = function() {
                                    R(u, -1, null, null, "", "timeout")
                                }, S.onabort = function() {
                                    R(u, -1, null, null, "", O ? "timeout" : "abort")
                                }, T(h, function(e, t) {
                                    S.addEventListener(t, e)
                                }), T($, function(e, t) {
                                    S.upload.addEventListener(t, e)
                                }), p && (S.withCredentials = !0), d) try {
                                S.responseType = d
                            } catch (e) {
                                if ("json" !== d) throw e
                            }
                            S.send(_(s) ? null : s)
                        }
                        if (l > 0) var x = i(function() {
                            A("timeout")
                        }, l);
                        else K(l) && l.then(function() {
                            A(D(l.$$timeoutId) ? "timeout" : "abort")
                        });

                        function A(e) {
                            O = "timeout" === e, E && E(), S && S.abort()
                        }

                        function R(e, t, n, r, o, a) {
                            D(x) && i.cancel(x), E = S = null, e(t, n, r, o, a)
                        }
                    }
            }]
        }
        var nb = w.$interpolateMinErr = r("$interpolate");

        function nw() {
            var e = "{{",
                t = "}}";
            this.startSymbol = function(t) {
                return t ? (e = t, this) : e
            }, this.endSymbol = function(e) {
                return e ? (t = e, this) : t
            }, this.$get = ["$parse", "$exceptionHandler", "$sce", function(n, r, i) {
                var o = e.length,
                    a = t.length,
                    s = RegExp(e.replace(/./g, c), "g"),
                    u = RegExp(t.replace(/./g, c), "g");

                function c(e) {
                    return "\\\\\\" + e
                }

                function l(n) {
                    return n.replace(s, e).replace(u, t)
                }

                function f(e, t, n, r) {
                    var i = e.$watch(function(e) {
                        return i(), r(e)
                    }, t, n);
                    return i
                }

                function p(s, u, c, p) {
                    var d = c === i.URL || c === i.MEDIA_URL;
                    if (!s.length || -1 === s.indexOf(e)) {
                        if (u) return;
                        var h = l(s);
                        d && (h = i.getTrusted(c, h));
                        var $ = L(h);
                        return $.exp = s, $.expressions = [], $.$$watchDelegate = f, $
                    }
                    p = !!p;
                    for (var v, m, g, y, b, w = 0, E = [], S = s.length, T = [], O = []; w < S;) {
                        if (-1 === (v = s.indexOf(e, w)) || -1 === (m = s.indexOf(t, v + o))) {
                            w !== S && T.push(l(s.substring(w)));
                            break
                        }
                        w !== v && T.push(l(s.substring(w, v))), y = s.substring(v + o, m), E.push(y), w = m + a, O.push(T.length), T.push("")
                    }
                    b = 1 === T.length && 1 === O.length;
                    var x = d && b ? void 0 : function(e) {
                        try {
                            return e = c && !d ? i.getTrusted(c, e) : i.valueOf(e), p && !D(e) ? e : eU(e)
                        } catch (e) {
                            r(nb.interr(s, e))
                        }
                    };
                    if (g = E.map(function(e) {
                            return n(e, x)
                        }), !u || E.length) {
                        var A = function(e) {
                            for (var t = 0, n = E.length; t < n; t++) {
                                if (p && _(e[t])) return;
                                T[O[t]] = e[t]
                            }
                            return d ? i.getTrusted(c, b ? T[0] : T.join("")) : (c && T.length > 1 && nb.throwNoconcat(s), T.join(""))
                        };
                        return C(function(e) {
                            var t = 0,
                                n = E.length,
                                i = Array(n);
                            try {
                                for (; t < n; t++) i[t] = g[t](e);
                                return A(i)
                            } catch (e) {
                                r(nb.interr(s, e))
                            }
                        }, {
                            exp: s,
                            expressions: E,
                            $$watchDelegate: function(e, t) {
                                var n;
                                return e.$watchGroup(g, function(r, i) {
                                    var o = A(r);
                                    t.call(this, o, r !== i ? n : o, e), n = o
                                })
                            }
                        })
                    }
                }
                return p.startSymbol = function() {
                    return e
                }, p.endSymbol = function() {
                    return t
                }, p
            }]
        }
        nb.throwNoconcat = function(e) {
            throw nb("noconcat", "Error while interpolating: {0}\nStrict Contextual Escaping disallows interpolations that concatenate multiple expressions when a trusted value is required.  See http://docs.angularjs.org/api/ng.$sce", e)
        }, nb.interr = function(e, t) {
            return nb("interr", "Can't interpolate: {0}\n{1}", e, t.toString())
        };
        var nE = r("$interval");

        function nS() {
            this.$get = ["$$intervalFactory", "$window", function(e, t) {
                var n = {},
                    r = function(e) {
                        t.clearInterval(e), delete n[e]
                    },
                    i = e(function(e, r, i) {
                        var o = t.setInterval(e, r);
                        return n[o] = i, o
                    }, r);
                return i.cancel = function(e) {
                    if (!e) return !1;
                    if (!e.hasOwnProperty("$$intervalId")) throw nE("badprom", "`$interval.cancel()` called with a promise that was not generated by `$interval()`.");
                    if (!n.hasOwnProperty(e.$$intervalId)) return !1;
                    var t = e.$$intervalId,
                        i = n[t];
                    return re(i.promise), i.reject("canceled"), r(t), !0
                }, i
            }]
        }

        function nT() {
            this.$get = ["$browser", "$q", "$$q", "$rootScope", function(e, t, n, r) {
                return function(i, o) {
                    return function(a, s, u, c) {
                        var l = arguments.length > 4,
                            f = l ? ef(arguments, 4) : [],
                            p = 0,
                            d = D(c) && !c,
                            h = (d ? n : t).defer(),
                            $ = h.promise;

                        function v() {
                            l ? a.apply(null, f) : a(p)
                        }
                        return u = D(u) ? u : 0, $.$$intervalId = i(function() {
                            d ? e.defer(v) : r.$evalAsync(v), h.notify(p++), u > 0 && p >= u && (h.resolve(p), o($.$$intervalId)), d || r.$apply()
                        }, s, h, d), $
                    }
                }
            }]
        }
        var nO = function() {
                this.$get = function() {
                    var e = w.callbacks,
                        t = {};
                    return {
                        createCallback: function(n) {
                            var r, i = "_" + (e.$$counter++).toString(36),
                                o = "angular.callbacks." + i,
                                a = ((r = function(e) {
                                    r.data = e, r.called = !0
                                }).id = i, r);
                            return t[o] = e[i] = a, o
                        },
                        wasCalled: function(e) {
                            return t[e].called
                        },
                        getResponse: function(e) {
                            return t[e].data
                        },
                        removeCallback: function(n) {
                            var r = t[n];
                            delete e[r.id], delete t[n]
                        }
                    }
                }
            },
            nx = /^([^?#]*)(\?([^#]*))?(#(.*))?$/,
            nA = {
                http: 80,
                https: 443,
                ftp: 21
            },
            nR = r("$location");

        function nC(e, t) {
            var n = rS(e);
            t.$$protocol = n.protocol, t.$$host = n.hostname, t.$$port = P(n.port) || nA[n.protocol] || null
        }
        var nP = /^\s*[\\/]{2,}/;

        function nI(e, t, n) {
            if (nP.test(e)) throw nR("badpath", 'Invalid url "{0}".', e);
            var r = "/" !== e.charAt(0);
            r && (e = "/" + e);
            var i = rS(e);
            t.$$path = function(e, t) {
                for (var n = e.split("/"), r = n.length; r--;) n[r] = decodeURIComponent(n[r]), t && (n[r] = n[r].replace(/\//g, "%2F"));
                return n.join("/")
            }(r && "/" === i.pathname.charAt(0) ? i.pathname.substring(1) : i.pathname, n), t.$$search = eE(i.search), t.$$hash = decodeURIComponent(i.hash), t.$$path && "/" !== t.$$path.charAt(0) && (t.$$path = "/" + t.$$path)
        }

        function nM(e, t) {
            return e.slice(0, t.length) === t
        }

        function nN(e, t) {
            if (nM(t, e)) return t.substr(e.length)
        }

        function nk(e) {
            var t = e.indexOf("#");
            return -1 === t ? e : e.substr(0, t)
        }

        function nL(e, t, n) {
            this.$$html5 = !0, n = n || "", nC(e, this), this.$$parse = function(e) {
                var n = nN(t, e);
                if (!j(n)) throw nR("ipthprfx", 'Invalid url "{0}", missing path prefix "{1}".', e, t);
                nI(n, this, !0), this.$$path || (this.$$path = "/"), this.$$compose()
            }, this.$$normalizeUrl = function(e) {
                return t + e.substr(1)
            }, this.$$parseLinkUrl = function(r, i) {
                var o, a, s;
                return i && "#" === i[0] ? (this.hash(i.slice(1)), !0) : (D(o = nN(e, r)) ? (a = o, s = n && D(o = nN(n, o)) ? t + (nN("/", o) || o) : e + a) : D(o = nN(t, r)) ? s = t + o : t === r + "/" && (s = t), s && this.$$parse(s), !!s)
            }
        }

        function nU(e, t, n) {
            nC(e, this), this.$$parse = function(r) {
                var i, o, a, s, u, c, l = nN(e, r) || nN(t, r);
                _(l) || "#" !== l.charAt(0) ? this.$$html5 ? c = l : (c = "", _(l) && (e = r, this.replace())) : _(c = nN(n, l)) && (c = l), nI(c, this, !1), this.$$path = (i = this.$$path, u = /^\/[A-Z]:(\/.*)/, (nM(o = c, a = e) && (o = o.replace(a, "")), u.exec(o)) ? i : (s = u.exec(i)) ? s[1] : i), this.$$compose()
            }, this.$$normalizeUrl = function(t) {
                return e + (t ? n + t : "")
            }, this.$$parseLinkUrl = function(t, n) {
                return nk(e) === nk(t) && (this.$$parse(t), !0)
            }
        }

        function n_(e, t, n) {
            this.$$html5 = !0, nU.apply(this, arguments), this.$$parseLinkUrl = function(r, i) {
                var o, a;
                return i && "#" === i[0] ? (this.hash(i.slice(1)), !0) : (e === nk(r) ? o = r : (a = nN(t, r)) ? o = e + n + a : t === r + "/" && (o = t), o && this.$$parse(o), !!o)
            }, this.$$normalizeUrl = function(t) {
                return e + n + t
            }
        }
        var nD = {
            $$absUrl: "",
            $$html5: !1,
            $$replace: !1,
            $$compose: function() {
                var e, t, n, r, i, o;
                this.$$url = (e = this.$$path, t = this.$$search, n = this.$$hash, r = [], T(t, function(e, t) {
                    H(e) ? T(e, function(e) {
                        r.push(eT(t, !0) + (!0 === e ? "" : "=" + eT(e, !0)))
                    }) : r.push(eT(t, !0) + (!0 === e ? "" : "=" + eT(e, !0)))
                }), i = r.length ? r.join("&") : "", o = n ? "#" + eS(n) : "", function(e) {
                    for (var t = e.split("/"), n = t.length; n--;) t[n] = eS(t[n].replace(/%2F/g, "/"));
                    return t.join("/")
                }(e) + (i ? "?" + i : "") + o), this.$$absUrl = this.$$normalizeUrl(this.$$url), this.$$urlUpdatedByLocation = !0
            },
            absUrl: nV("$$absUrl"),
            url: function(e) {
                if (_(e)) return this.$$url;
                var t = nx.exec(e);
                return (t[1] || "" === e) && this.path(decodeURIComponent(t[1])), (t[2] || t[1] || "" === e) && this.search(t[3] || ""), this.hash(t[5] || ""), this
            },
            protocol: nV("$$protocol"),
            host: nV("$$host"),
            port: nV("$$port"),
            path: nF("$$path", function(e) {
                return "/" === (e = null !== e ? e.toString() : "").charAt(0) ? e : "/" + e
            }),
            search: function(e, t) {
                switch (arguments.length) {
                    case 0:
                        return this.$$search;
                    case 1:
                        if (j(e) || q(e)) e = e.toString(), this.$$search = eE(e);
                        else {
                            if (!V(e)) throw nR("isrcharg", "The first argument of the `$location#search()` call must be a string or an object.");
                            T(e = eo(e, {}), function(t, n) {
                                null == t && delete e[n]
                            }), this.$$search = e
                        }
                        break;
                    default:
                        _(t) || null === t ? delete this.$$search[e] : this.$$search[e] = t
                }
                return this.$$compose(), this
            },
            hash: nF("$$hash", function(e) {
                return null !== e ? e.toString() : ""
            }),
            replace: function() {
                return this.$$replace = !0, this
            }
        };

        function nV(e) {
            return function() {
                return this[e]
            }
        }

        function nF(e, t) {
            return function(n) {
                return _(n) ? this[e] : (this[e] = t(n), this.$$compose(), this)
            }
        }

        function nj() {
            var e = "!",
                t = {
                    enabled: !1,
                    requireBase: !0,
                    rewriteLinks: !0
                };
            this.hashPrefix = function(t) {
                return D(t) ? (e = t, this) : e
            }, this.html5Mode = function(e) {
                return Q(e) ? (t.enabled = e, this) : V(e) ? (Q(e.enabled) && (t.enabled = e.enabled), Q(e.requireBase) && (t.requireBase = e.requireBase), (Q(e.rewriteLinks) || j(e.rewriteLinks)) && (t.rewriteLinks = e.rewriteLinks), this) : t
            }, this.$get = ["$rootScope", "$browser", "$sniffer", "$rootElement", "$window", function(n, r, i, a, s) {
                var u, c, l, f, p = r.baseHref(),
                    d = r.url();
                if (t.enabled) {
                    if (!p && t.requireBase) throw nR("nobase", "$location in HTML5 mode requires a <base> tag to be present!");
                    f = d.substring(0, d.indexOf("/", d.indexOf("//") + 2)) + (p || "/"), l = i.history ? nL : n_
                } else f = nk(d), l = nU;
                var h = (u = f).substr(0, nk(u).lastIndexOf("/") + 1);
                (c = new l(f, h, "#" + e)).$$parseLinkUrl(d, d), c.$$state = r.state();
                var $ = /^\s*(javascript|mailto):/i;

                function v(e, t, n) {
                    var i = c.url(),
                        o = c.$$state;
                    try {
                        r.url(e, t, n), c.$$state = r.state()
                    } catch (e) {
                        throw c.url(i), c.$$state = o, e
                    }
                }
                a.on("click", function(e) {
                    var i = t.rewriteLinks;
                    if (i && !e.ctrlKey && !e.metaKey && !e.shiftKey && 2 !== e.which && 2 !== e.button) {
                        for (var s = o(e.target);
                            "a" !== en(s[0]);)
                            if (s[0] === a[0] || !(s = s.parent())[0]) return;
                        if (!j(i) || !_(s.attr(i))) {
                            var u = s.prop("href"),
                                l = s.attr("href") || s.attr("xlink:href");
                            V(u) && "[object SVGAnimatedString]" === u.toString() && (u = rS(u.animVal).href), $.test(u) || !u || s.attr("target") || e.isDefaultPrevented() || c.$$parseLinkUrl(u, l) && (e.preventDefault(), c.absUrl() !== r.url() && n.$apply())
                        }
                    }
                }), c.absUrl() !== d && r.url(c.absUrl(), !0);
                var m = !0;
                return r.onUrlChange(function(e, t) {
                    nM(e, h) ? (n.$evalAsync(function() {
                        var r, i = c.absUrl(),
                            o = c.$$state;
                        c.$$parse(e), c.$$state = t, r = n.$broadcast("$locationChangeStart", e, i, t, o).defaultPrevented, c.absUrl() === e && (r ? (c.$$parse(i), c.$$state = o, v(i, !1, o)) : (m = !1, g(i, o)))
                    }), n.$$phase || n.$digest()) : s.location.href = e
                }), n.$watch(function() {
                    if (m || c.$$urlUpdatedByLocation) {
                        c.$$urlUpdatedByLocation = !1;
                        var e = r.url(),
                            t = c.absUrl(),
                            o = r.state(),
                            a = c.$$replace,
                            s = e !== t && rS(e).href !== rS(t).href || c.$$html5 && i.history && o !== c.$$state;
                        (m || s) && (m = !1, n.$evalAsync(function() {
                            var t = c.absUrl(),
                                r = n.$broadcast("$locationChangeStart", t, e, c.$$state, o).defaultPrevented;
                            c.absUrl() === t && (r ? (c.$$parse(e), c.$$state = o) : (s && v(t, a, o === c.$$state ? null : c.$$state), g(e, o)))
                        }))
                    }
                    c.$$replace = !1
                }), c;

                function g(e, t) {
                    n.$broadcast("$locationChangeSuccess", c.absUrl(), e, c.$$state, t)
                }
            }]
        }

        function nq() {
            var e = !0,
                t = this;
            this.debugEnabled = function(t) {
                return D(t) ? (e = t, this) : e
            }, this.$get = ["$window", function(n) {
                var r, o = i || /\bEdge\//.test(n.navigator && n.navigator.userAgent);
                return {
                    log: a("log"),
                    info: a("info"),
                    warn: a("warn"),
                    error: a("error"),
                    debug: (r = a("debug"), function() {
                        e && r.apply(t, arguments)
                    })
                };

                function a(e) {
                    var t = n.console || {},
                        r = t[e] || t.log || N;
                    return function() {
                        var e = [];
                        return T(arguments, function(t) {
                            var n;
                            e.push((G(n = t) && (n.stack && o ? n = n.message && -1 === n.stack.indexOf(n.message) ? "Error: " + n.message + "\n" + n.stack : n.stack : n.sourceURL && (n = n.message + "\n" + n.sourceURL + ":" + n.line)), n))
                        }), Function.prototype.apply.call(r, t, e)
                    }
                }
            }]
        }
        T([n_, nU, nL], function(e) {
            e.prototype = Object.create(nD), e.prototype.state = function(t) {
                if (!arguments.length) return this.$$state;
                if (e !== nL || !this.$$html5) throw nR("nostate", "History API state support is available only in HTML5 mode and only in browsers supporting HTML5 History API");
                return this.$$state = _(t) ? null : t, this.$$urlUpdatedByLocation = !0, this
            }
        });
        var nB = r("$parse"),
            nH = {}.constructor.prototype.valueOf;

        function nG(e) {
            return e + ""
        }
        var nz = eL();
        T("+ - * / % === !== == != < > <= >= && || ! = |".split(" "), function(e) {
            nz[e] = !0
        });
        var nW = {
                n: "\n",
                f: "\f",
                r: "\r",
                t: "	",
                v: "\v",
                "'": "'",
                '"': '"'
            },
            nJ = function(e) {
                this.options = e
            };
        nJ.prototype = {
            constructor: nJ,
            lex: function(e) {
                for (this.text = e, this.index = 0, this.tokens = []; this.index < this.text.length;) {
                    var t = this.text.charAt(this.index);
                    if ('"' === t || "'" === t) this.readString(t);
                    else if (this.isNumber(t) || "." === t && this.isNumber(this.peek())) this.readNumber();
                    else if (this.isIdentifierStart(this.peekMultichar())) this.readIdent();
                    else if (this.is(t, "(){}[].,;:?")) this.tokens.push({
                        index: this.index,
                        text: t
                    }), this.index++;
                    else if (this.isWhitespace(t)) this.index++;
                    else {
                        var n = t + this.peek(),
                            r = n + this.peek(2),
                            i = nz[t],
                            o = nz[n],
                            a = nz[r];
                        if (i || o || a) {
                            var s = a ? r : o ? n : t;
                            this.tokens.push({
                                index: this.index,
                                text: s,
                                operator: !0
                            }), this.index += s.length
                        } else this.throwError("Unexpected next character ", this.index, this.index + 1)
                    }
                }
                return this.tokens
            },
            is: function(e, t) {
                return -1 !== t.indexOf(e)
            },
            peek: function(e) {
                var t = e || 1;
                return this.index + t < this.text.length && this.text.charAt(this.index + t)
            },
            isNumber: function(e) {
                return "0" <= e && e <= "9" && "string" == typeof e
            },
            isWhitespace: function(e) {
                return " " === e || "\r" === e || "	" === e || "\n" === e || "\v" === e || "\xa0" === e
            },
            isIdentifierStart: function(e) {
                return this.options.isIdentifierStart ? this.options.isIdentifierStart(e, this.codePointAt(e)) : this.isValidIdentifierStart(e)
            },
            isValidIdentifierStart: function(e) {
                return "a" <= e && e <= "z" || "A" <= e && e <= "Z" || "_" === e || "$" === e
            },
            isIdentifierContinue: function(e) {
                return this.options.isIdentifierContinue ? this.options.isIdentifierContinue(e, this.codePointAt(e)) : this.isValidIdentifierContinue(e)
            },
            isValidIdentifierContinue: function(e, t) {
                return this.isValidIdentifierStart(e, t) || this.isNumber(e)
            },
            codePointAt: function(e) {
                return 1 === e.length ? e.charCodeAt(0) : (e.charCodeAt(0) << 10) + e.charCodeAt(1) - 0x35fdc00
            },
            peekMultichar: function() {
                var e = this.text.charAt(this.index),
                    t = this.peek();
                if (!t) return e;
                var n = e.charCodeAt(0),
                    r = t.charCodeAt(0);
                return n >= 55296 && n <= 56319 && r >= 56320 && r <= 57343 ? e + t : e
            },
            isExpOperator: function(e) {
                return "-" === e || "+" === e || this.isNumber(e)
            },
            throwError: function(e, t, n) {
                throw n = n || this.index, nB("lexerr", "Lexer Error: {0} at column{1} in expression [{2}].", e, D(t) ? "s " + t + "-" + this.index + " [" + this.text.substring(t, n) + "]" : " " + n, this.text)
            },
            readNumber: function() {
                for (var e = "", t = this.index; this.index < this.text.length;) {
                    var n = f(this.text.charAt(this.index));
                    if ("." === n || this.isNumber(n)) e += n;
                    else {
                        var r = this.peek();
                        if ("e" === n && this.isExpOperator(r)) e += n;
                        else if (this.isExpOperator(n) && r && this.isNumber(r) && "e" === e.charAt(e.length - 1)) e += n;
                        else {
                            if (!this.isExpOperator(n) || r && this.isNumber(r) || "e" !== e.charAt(e.length - 1)) break;
                            this.throwError("Invalid exponent")
                        }
                    }
                    this.index++
                }
                this.tokens.push({
                    index: t,
                    text: e,
                    constant: !0,
                    value: Number(e)
                })
            },
            readIdent: function() {
                var e = this.index;
                for (this.index += this.peekMultichar().length; this.index < this.text.length;) {
                    var t = this.peekMultichar();
                    if (!this.isIdentifierContinue(t)) break;
                    this.index += t.length
                }
                this.tokens.push({
                    index: e,
                    text: this.text.slice(e, this.index),
                    identifier: !0
                })
            },
            readString: function(e) {
                var t = this.index;
                this.index++;
                for (var n = "", r = e, i = !1; this.index < this.text.length;) {
                    var o = this.text.charAt(this.index);
                    if (r += o, i) {
                        if ("u" === o) {
                            var a = this.text.substring(this.index + 1, this.index + 5);
                            a.match(/[\da-f]{4}/i) || this.throwError("Invalid unicode escape [\\u" + a + "]"), this.index += 4, n += String.fromCharCode(parseInt(a, 16))
                        } else n += nW[o] || o;
                        i = !1
                    } else if ("\\" === o) i = !0;
                    else {
                        if (o === e) return this.index++, void this.tokens.push({
                            index: t,
                            text: r,
                            constant: !0,
                            value: n
                        });
                        n += o
                    }
                    this.index++
                }
                this.throwError("Unterminated quote", t)
            }
        };
        var nY = function(e, t) {
            this.lexer = e, this.options = t
        };

        function nQ(e, t) {
            return void 0 !== e ? e : t
        }

        function nK(e, t) {
            return void 0 === e ? t : void 0 === t ? e : e + t
        }

        function nZ(e, t, n) {
            var r, i, o, a = e.isPure = function(e, t) {
                switch (e.type) {
                    case nY.MemberExpression:
                        if (e.computed) return !1;
                        break;
                    case nY.UnaryExpression:
                        return 1;
                    case nY.BinaryExpression:
                        return "+" !== e.operator && 1;
                    case nY.CallExpression:
                        return !1
                }
                return void 0 === t ? 2 : t
            }(e, n);
            switch (e.type) {
                case nY.Program:
                    r = !0, T(e.body, function(e) {
                        nZ(e.expression, t, a), r = r && e.expression.constant
                    }), e.constant = r;
                    break;
                case nY.Literal:
                    e.constant = !0, e.toWatch = [];
                    break;
                case nY.UnaryExpression:
                    nZ(e.argument, t, a), e.constant = e.argument.constant, e.toWatch = e.argument.toWatch;
                    break;
                case nY.BinaryExpression:
                    nZ(e.left, t, a), nZ(e.right, t, a), e.constant = e.left.constant && e.right.constant, e.toWatch = e.left.toWatch.concat(e.right.toWatch);
                    break;
                case nY.LogicalExpression:
                    nZ(e.left, t, a), nZ(e.right, t, a), e.constant = e.left.constant && e.right.constant, e.toWatch = e.constant ? [] : [e];
                    break;
                case nY.ConditionalExpression:
                    nZ(e.test, t, a), nZ(e.alternate, t, a), nZ(e.consequent, t, a), e.constant = e.test.constant && e.alternate.constant && e.consequent.constant, e.toWatch = e.constant ? [] : [e];
                    break;
                case nY.Identifier:
                    e.constant = !1, e.toWatch = [e];
                    break;
                case nY.MemberExpression:
                    nZ(e.object, t, a), e.computed && nZ(e.property, t, a), e.constant = e.object.constant && (!e.computed || e.property.constant), e.toWatch = e.constant ? [] : [e];
                    break;
                case nY.CallExpression:
                    r = o = !!e.filter && !t(e.callee.name).$stateful, i = [], T(e.arguments, function(e) {
                        nZ(e, t, a), r = r && e.constant, i.push.apply(i, e.toWatch)
                    }), e.constant = r, e.toWatch = o ? i : [e];
                    break;
                case nY.AssignmentExpression:
                    nZ(e.left, t, a), nZ(e.right, t, a), e.constant = e.left.constant && e.right.constant, e.toWatch = [e];
                    break;
                case nY.ArrayExpression:
                    r = !0, i = [], T(e.elements, function(e) {
                        nZ(e, t, a), r = r && e.constant, i.push.apply(i, e.toWatch)
                    }), e.constant = r, e.toWatch = i;
                    break;
                case nY.ObjectExpression:
                    r = !0, i = [], T(e.properties, function(e) {
                        nZ(e.value, t, a), r = r && e.value.constant, i.push.apply(i, e.value.toWatch), e.computed && (nZ(e.key, t, !1), r = r && e.key.constant, i.push.apply(i, e.key.toWatch))
                    }), e.constant = r, e.toWatch = i;
                    break;
                case nY.ThisExpression:
                case nY.LocalsExpression:
                    e.constant = !1, e.toWatch = []
            }
        }

        function nX(e) {
            if (1 === e.length) {
                var t = e[0].expression,
                    n = t.toWatch;
                return 1 !== n.length || n[0] !== t ? n : void 0
            }
        }

        function n0(e) {
            return e.type === nY.Identifier || e.type === nY.MemberExpression
        }

        function n1(e) {
            if (1 === e.body.length && n0(e.body[0].expression)) return {
                type: nY.AssignmentExpression,
                left: e.body[0].expression,
                right: {
                    type: nY.NGValueParameter
                },
                operator: "="
            }
        }

        function n2(e) {
            this.$filter = e
        }

        function n3(e) {
            this.$filter = e
        }

        function n4(e, t, n) {
            this.ast = new nY(e, n), this.astCompiler = n.csp ? new n3(t) : new n2(t)
        }

        function n5(e) {
            return z(e.valueOf) ? e.valueOf() : nH.call(e)
        }

        function n6() {
            var e, t, n = eL(),
                r = {
                    true: !0,
                    false: !1,
                    null: null,
                    undefined: void 0
                };
            this.addLiteral = function(e, t) {
                r[e] = t
            }, this.setIdentifierFns = function(n, r) {
                return e = n, t = r, this
            }, this.$get = ["$filter", function(i) {
                var o = {
                    csp: eu().noUnsafeEval,
                    literals: eo(r),
                    isIdentifierStart: z(e) && e,
                    isIdentifierContinue: z(t) && t
                };
                return a.$$getAst = function(e) {
                    return new n4(new nJ(o), i, o).getAst(e).ast
                }, a;

                function a(e, t) {
                    var r, a;
                    switch (void 0 === e ? "undefined" : v(e)) {
                        case "string":
                            return (r = n[a = e = e.trim()]) || (r = new n4(new nJ(o), i, o).parse(e), n[a] = p(r)), d(r, t);
                        case "function":
                            return d(e, t);
                        default:
                            return d(N, t)
                    }
                }

                function s(e, t, n) {
                    return null == e || null == t ? e === t : !("object" == (void 0 === e ? "undefined" : v(e)) && "object" == v(e = n5(e)) && !n) && (e === t || e != e && t != t)
                }

                function u(e, t, n, r, i) {
                    var o, a = r.inputs;
                    if (1 === a.length) {
                        var u = s;
                        return a = a[0], e.$watch(function(e) {
                            var t = a(e);
                            return s(t, u, a.isPure) || (o = r(e, void 0, void 0, [t]), u = t && n5(t)), o
                        }, t, n, i)
                    }
                    for (var c = [], l = [], f = 0, p = a.length; f < p; f++) c[f] = s, l[f] = null;
                    return e.$watch(function(e) {
                        for (var t = !1, n = 0, i = a.length; n < i; n++) {
                            var u = a[n](e);
                            (t || (t = !s(u, c[n], a[n].isPure))) && (l[n] = u, c[n] = u && n5(u))
                        }
                        return t && (o = r(e, void 0, void 0, l)), o
                    }, t, n, i)
                }

                function c(e, t, n, r, i) {
                    var o, a, s = r.literal ? l : D,
                        u = r.$$intercepted || r,
                        c = r.$$interceptor || k,
                        f = r.inputs && !u.inputs;
                    return h.literal = r.literal, h.constant = r.constant, h.inputs = r.inputs, p(h), o = e.$watch(h, t, n, i);

                    function d() {
                        s(a) && o()
                    }

                    function h(e, t, n, r) {
                        return s(a = f && r ? r[0] : u(e, t, n, r)) && e.$$postDigest(d), c(a)
                    }
                }

                function l(e) {
                    var t = !0;
                    return T(e, function(e) {
                        D(e) || (t = !1)
                    }), t
                }

                function f(e, t, n, r) {
                    var i = e.$watch(function(e) {
                        return i(), r(e)
                    }, t, n);
                    return i
                }

                function p(e) {
                    return e.constant ? e.$$watchDelegate = f : e.oneTime ? e.$$watchDelegate = c : e.inputs && (e.$$watchDelegate = u), e
                }

                function d(e, t) {
                    if (!t) return e;
                    e.$$interceptor && (t = function(e, t) {
                        function n(n) {
                            return t(e(n))
                        }
                        return n.$stateful = e.$stateful || t.$stateful, n.$$pure = e.$$pure && t.$$pure, n
                    }(e.$$interceptor, t), e = e.$$intercepted);
                    var n = !1,
                        r = function(r, i, o, a) {
                            var s = n && a ? a[0] : e(r, i, o, a);
                            return t(s)
                        };
                    return r.$$intercepted = e, r.$$interceptor = t, r.literal = e.literal, r.oneTime = e.oneTime, r.constant = e.constant, t.$stateful || (n = !e.inputs, r.inputs = e.inputs ? e.inputs : [e], t.$$pure || (r.inputs = r.inputs.map(function(e) {
                        return 2 === e.isPure ? function(t) {
                            return e(t)
                        } : e
                    }))), p(r)
                }
            }]
        }

        function n9() {
            var e = !0;
            this.$get = ["$rootScope", "$exceptionHandler", function(t, n) {
                return n7(function(e) {
                    t.$evalAsync(e)
                }, n, e)
            }], this.errorOnUnhandledRejections = function(t) {
                return D(t) ? (e = t, this) : e
            }
        }

        function n8() {
            var e = !0;
            this.$get = ["$browser", "$exceptionHandler", function(t, n) {
                return n7(function(e) {
                    t.defer(e)
                }, n, e)
            }], this.errorOnUnhandledRejections = function(t) {
                return D(t) ? (e = t, this) : e
            }
        }

        function n7(e, t, n) {
            var i = r("$q", TypeError),
                o = 0,
                a = [];

            function s() {
                return new u
            }

            function u() {
                var e = this.promise = new c;
                this.resolve = function(t) {
                    p(e, t)
                }, this.reject = function(t) {
                    d(e, t)
                }, this.notify = function(t) {
                    $(e, t)
                }
            }

            function c() {
                this.$$state = {
                    status: 0
                }
            }

            function l() {
                for (; !o && a.length;) {
                    var e = a.shift();
                    if (!e.pur) {
                        e.pur = !0;
                        var n = "Possibly unhandled rejection: " + eV(e.value);
                        G(e.value) ? t(e.value, n) : t(n)
                    }
                }
            }

            function f(r) {
                !n || r.pending || 2 !== r.status || r.pur || (0 === o && 0 === a.length && e(l), a.push(r)), !r.processScheduled && r.pending && (r.processScheduled = !0, ++o, e(function() {
                    ! function(r) {
                        var i, a, s;
                        s = r.pending, r.processScheduled = !1, r.pending = void 0;
                        try {
                            for (var u = 0, c = s.length; u < c; ++u) {
                                r.pur = !0, a = s[u][0], i = s[u][r.status];
                                try {
                                    z(i) ? p(a, i(r.value)) : 1 === r.status ? p(a, r.value) : d(a, r.value)
                                } catch (e) {
                                    d(a, e), e && !0 === e.$$passToExceptionHandler && t(e)
                                }
                            }
                        } finally {
                            --o, n && 0 === o && e(l)
                        }
                    }(r)
                }))
            }

            function p(e, t) {
                e.$$state.status || (t === e ? h(e, i("qcycle", "Expected promise to be resolved with value other than itself '{0}'", t)) : function e(t, n) {
                    var r, i = !1;
                    try {
                        (V(n) || z(n)) && (r = n.then), z(r) ? (t.$$state.status = -1, r.call(n, function(n) {
                            i || (i = !0, e(t, n))
                        }, o, function(e) {
                            $(t, e)
                        })) : (t.$$state.value = n, t.$$state.status = 1, f(t.$$state))
                    } catch (e) {
                        o(e)
                    }

                    function o(e) {
                        i || (i = !0, h(t, e))
                    }
                }(e, t))
            }

            function d(e, t) {
                e.$$state.status || h(e, t)
            }

            function h(e, t) {
                e.$$state.value = t, e.$$state.status = 2, f(e.$$state)
            }

            function $(n, r) {
                var i = n.$$state.pending;
                n.$$state.status <= 0 && i && i.length && e(function() {
                    for (var e, n, o = 0, a = i.length; o < a; o++) {
                        n = i[o][0], e = i[o][3];
                        try {
                            $(n, z(e) ? e(r) : r)
                        } catch (e) {
                            t(e)
                        }
                    }
                })
            }

            function v(e) {
                var t = new c;
                return d(t, e), t
            }

            function m(e, t, n) {
                var r = null;
                try {
                    z(n) && (r = n())
                } catch (e) {
                    return v(e)
                }
                return K(r) ? r.then(function() {
                    return t(e)
                }, v) : t(e)
            }

            function g(e, t, n, r) {
                var i = new c;
                return p(i, e), i.then(t, n, r)
            }
            C(c.prototype, {
                then: function(e, t, n) {
                    if (_(e) && _(t) && _(n)) return this;
                    var r = new c;
                    return this.$$state.pending = this.$$state.pending || [], this.$$state.pending.push([r, e, t, n]), this.$$state.status > 0 && f(this.$$state), r
                },
                catch: function(e) {
                    return this.then(null, e)
                },
                finally: function(e, t) {
                    return this.then(function(t) {
                        return m(t, y, e)
                    }, function(t) {
                        return m(t, v, e)
                    }, t)
                }
            });
            var y = g;

            function b(e) {
                if (!z(e)) throw i("norslvr", "Expected resolverFn, got '{0}'", e);
                var t = new c;
                return e(function(e) {
                    p(t, e)
                }, function(e) {
                    d(t, e)
                }), t
            }
            return b.prototype = c.prototype, b.defer = s, b.reject = v, b.when = g, b.resolve = y, b.all = function(e) {
                var t = new c,
                    n = 0,
                    r = H(e) ? [] : {};
                return T(e, function(e, i) {
                    n++, g(e).then(function(e) {
                        r[i] = e, --n || p(t, r)
                    }, function(e) {
                        d(t, e)
                    })
                }), 0 === n && p(t, r), t
            }, b.race = function(e) {
                var t = s();
                return T(e, function(e) {
                    g(e).then(t.resolve, t.reject)
                }), t.promise
            }, b
        }
        nY.Program = "Program", nY.ExpressionStatement = "ExpressionStatement", nY.AssignmentExpression = "AssignmentExpression", nY.ConditionalExpression = "ConditionalExpression", nY.LogicalExpression = "LogicalExpression", nY.BinaryExpression = "BinaryExpression", nY.UnaryExpression = "UnaryExpression", nY.CallExpression = "CallExpression", nY.MemberExpression = "MemberExpression", nY.Identifier = "Identifier", nY.Literal = "Literal", nY.ArrayExpression = "ArrayExpression", nY.Property = "Property", nY.ObjectExpression = "ObjectExpression", nY.ThisExpression = "ThisExpression", nY.LocalsExpression = "LocalsExpression", nY.NGValueParameter = "NGValueParameter", nY.prototype = {
            ast: function(e) {
                this.text = e, this.tokens = this.lexer.lex(e);
                var t = this.program();
                return 0 !== this.tokens.length && this.throwError("is an unexpected token", this.tokens[0]), t
            },
            program: function() {
                for (var e = [];;)
                    if (this.tokens.length > 0 && !this.peek("}", ")", ";", "]") && e.push(this.expressionStatement()), !this.expect(";")) return {
                        type: nY.Program,
                        body: e
                    }
            },
            expressionStatement: function() {
                return {
                    type: nY.ExpressionStatement,
                    expression: this.filterChain()
                }
            },
            filterChain: function() {
                for (var e = this.expression(); this.expect("|");) e = this.filter(e);
                return e
            },
            expression: function() {
                return this.assignment()
            },
            assignment: function() {
                var e = this.ternary();
                if (this.expect("=")) {
                    if (!n0(e)) throw nB("lval", "Trying to assign a value to a non l-value");
                    e = {
                        type: nY.AssignmentExpression,
                        left: e,
                        right: this.assignment(),
                        operator: "="
                    }
                }
                return e
            },
            ternary: function() {
                var e, t, n = this.logicalOR();
                return this.expect("?") && (e = this.expression(), this.consume(":")) ? (t = this.expression(), {
                    type: nY.ConditionalExpression,
                    test: n,
                    alternate: e,
                    consequent: t
                }) : n
            },
            logicalOR: function() {
                for (var e = this.logicalAND(); this.expect("||");) e = {
                    type: nY.LogicalExpression,
                    operator: "||",
                    left: e,
                    right: this.logicalAND()
                };
                return e
            },
            logicalAND: function() {
                for (var e = this.equality(); this.expect("&&");) e = {
                    type: nY.LogicalExpression,
                    operator: "&&",
                    left: e,
                    right: this.equality()
                };
                return e
            },
            equality: function() {
                for (var e, t = this.relational(); e = this.expect("==", "!=", "===", "!==");) t = {
                    type: nY.BinaryExpression,
                    operator: e.text,
                    left: t,
                    right: this.relational()
                };
                return t
            },
            relational: function() {
                for (var e, t = this.additive(); e = this.expect("<", ">", "<=", ">=");) t = {
                    type: nY.BinaryExpression,
                    operator: e.text,
                    left: t,
                    right: this.additive()
                };
                return t
            },
            additive: function() {
                for (var e, t = this.multiplicative(); e = this.expect("+", "-");) t = {
                    type: nY.BinaryExpression,
                    operator: e.text,
                    left: t,
                    right: this.multiplicative()
                };
                return t
            },
            multiplicative: function() {
                for (var e, t = this.unary(); e = this.expect("*", "/", "%");) t = {
                    type: nY.BinaryExpression,
                    operator: e.text,
                    left: t,
                    right: this.unary()
                };
                return t
            },
            unary: function() {
                var e;
                return (e = this.expect("+", "-", "!")) ? {
                    type: nY.UnaryExpression,
                    operator: e.text,
                    prefix: !0,
                    argument: this.unary()
                } : this.primary()
            },
            primary: function() {
                var e, t;
                for (this.expect("(") ? (e = this.filterChain(), this.consume(")")) : this.expect("[") ? e = this.arrayDeclaration() : this.expect("{") ? e = this.object() : this.selfReferential.hasOwnProperty(this.peek().text) ? e = eo(this.selfReferential[this.consume().text]) : this.options.literals.hasOwnProperty(this.peek().text) ? e = {
                        type: nY.Literal,
                        value: this.options.literals[this.consume().text]
                    } : this.peek().identifier ? e = this.identifier() : this.peek().constant ? e = this.constant() : this.throwError("not a primary expression", this.peek()); t = this.expect("(", "[", ".");) "(" === t.text ? (e = {
                    type: nY.CallExpression,
                    callee: e,
                    arguments: this.parseArguments()
                }, this.consume(")")) : "[" === t.text ? (e = {
                    type: nY.MemberExpression,
                    object: e,
                    property: this.expression(),
                    computed: !0
                }, this.consume("]")) : "." === t.text ? e = {
                    type: nY.MemberExpression,
                    object: e,
                    property: this.identifier(),
                    computed: !1
                } : this.throwError("IMPOSSIBLE");
                return e
            },
            filter: function(e) {
                for (var t = [e], n = {
                        type: nY.CallExpression,
                        callee: this.identifier(),
                        arguments: t,
                        filter: !0
                    }; this.expect(":");) t.push(this.expression());
                return n
            },
            parseArguments: function() {
                var e = [];
                if (")" !== this.peekToken().text)
                    do e.push(this.filterChain()); while (this.expect(","));
                return e
            },
            identifier: function() {
                var e = this.consume();
                return e.identifier || this.throwError("is not a valid identifier", e), {
                    type: nY.Identifier,
                    name: e.text
                }
            },
            constant: function() {
                return {
                    type: nY.Literal,
                    value: this.consume().value
                }
            },
            arrayDeclaration: function() {
                var e = [];
                if ("]" !== this.peekToken().text)
                    do {
                        if (this.peek("]")) break;
                        e.push(this.expression())
                    } while (this.expect(","));
                return this.consume("]"), {
                    type: nY.ArrayExpression,
                    elements: e
                }
            },
            object: function() {
                var e, t = [];
                if ("}" !== this.peekToken().text)
                    do {
                        if (this.peek("}")) break;
                        e = {
                            type: nY.Property,
                            kind: "init"
                        }, this.peek().constant ? (e.key = this.constant(), e.computed = !1, this.consume(":"), e.value = this.expression()) : this.peek().identifier ? (e.key = this.identifier(), e.computed = !1, this.peek(":") ? (this.consume(":"), e.value = this.expression()) : e.value = e.key) : this.peek("[") ? (this.consume("["), e.key = this.expression(), this.consume("]"), e.computed = !0, this.consume(":"), e.value = this.expression()) : this.throwError("invalid key", this.peek()), t.push(e)
                    } while (this.expect(","));
                return this.consume("}"), {
                    type: nY.ObjectExpression,
                    properties: t
                }
            },
            throwError: function(e, t) {
                throw nB("syntax", "Syntax Error: Token '{0}' {1} at column {2} of the expression [{3}] starting at [{4}].", t.text, e, t.index + 1, this.text, this.text.substring(t.index))
            },
            consume: function(e) {
                if (0 === this.tokens.length) throw nB("ueoe", "Unexpected end of expression: {0}", this.text);
                var t = this.expect(e);
                return t || this.throwError("is unexpected, expecting [" + e + "]", this.peek()), t
            },
            peekToken: function() {
                if (0 === this.tokens.length) throw nB("ueoe", "Unexpected end of expression: {0}", this.text);
                return this.tokens[0]
            },
            peek: function(e, t, n, r) {
                return this.peekAhead(0, e, t, n, r)
            },
            peekAhead: function(e, t, n, r, i) {
                if (this.tokens.length > e) {
                    var o = this.tokens[e],
                        a = o.text;
                    if (a === t || a === n || a === r || a === i || !t && !n && !r && !i) return o
                }
                return !1
            },
            expect: function(e, t, n, r) {
                var i = this.peek(e, t, n, r);
                return !!i && (this.tokens.shift(), i)
            },
            selfReferential: {
                this: {
                    type: nY.ThisExpression
                },
                $locals: {
                    type: nY.LocalsExpression
                }
            }
        };

        function re(e) {
            e.$$state && (e.$$state.pur = !0)
        }

        function rt() {
            this.$get = ["$window", "$timeout", function(e, t) {
                var n = e.requestAnimationFrame || e.webkitRequestAnimationFrame,
                    r = e.cancelAnimationFrame || e.webkitCancelAnimationFrame || e.webkitCancelRequestAnimationFrame,
                    i = !!n,
                    o = i ? function(e) {
                        var t = n(e);
                        return function() {
                            r(t)
                        }
                    } : function(e) {
                        var n = t(e, 16.66, !1);
                        return function() {
                            t.cancel(n)
                        }
                    };
                return o.supported = i, o
            }]
        }

        function rn() {
            var e = 10,
                t = r("$rootScope"),
                n = null,
                o = null;
            this.digestTtl = function(t) {
                return arguments.length && (e = t), e
            }, this.$get = ["$exceptionHandler", "$parse", "$browser", function(r, a, s) {
                function u(e) {
                    e.currentScope.$$destroyed = !0
                }

                function c() {
                    this.$id = ++E, this.$$phase = this.$parent = this.$$watchers = this.$$nextSibling = this.$$prevSibling = this.$$childHead = this.$$childTail = null, this.$root = this, this.$$destroyed = !1, this.$$suspended = !1, this.$$listeners = {}, this.$$listenerCount = {}, this.$$watchersCount = 0, this.$$isolateBindings = null
                }
                c.prototype = {
                    constructor: c,
                    $new: function(e, t) {
                        var n;
                        return t = t || this, e ? (n = new c).$root = this.$root : (this.$$ChildScope || (this.$$ChildScope = function(e) {
                            function t() {
                                this.$$watchers = this.$$nextSibling = this.$$childHead = this.$$childTail = null, this.$$listeners = {}, this.$$listenerCount = {}, this.$$watchersCount = 0, this.$id = ++E, this.$$ChildScope = null, this.$$suspended = !1
                            }
                            return t.prototype = e, t
                        }(this)), n = new this.$$ChildScope), n.$parent = t, n.$$prevSibling = t.$$childTail, t.$$childHead ? (t.$$childTail.$$nextSibling = n, t.$$childTail = n) : t.$$childHead = t.$$childTail = n, (e || t !== this) && n.$on("$destroy", u), n
                    },
                    $watch: function(e, t, r, i) {
                        var o = a(e),
                            s = z(t) ? t : N;
                        if (o.$$watchDelegate) return o.$$watchDelegate(this, s, r, o, e);
                        var u = this,
                            c = u.$$watchers,
                            l = {
                                fn: s,
                                last: b,
                                get: o,
                                exp: i || e,
                                eq: !!r
                            };
                        return n = null, c || ((c = u.$$watchers = []).$$digestWatchIndex = -1), c.unshift(l), c.$$digestWatchIndex++, g(this, 1),
                            function() {
                                var e = ei(c, l);
                                e >= 0 && (g(u, -1), e < c.$$digestWatchIndex && c.$$digestWatchIndex--), n = null
                            }
                    },
                    $watchGroup: function(e, t) {
                        var n = Array(e.length),
                            r = Array(e.length),
                            i = [],
                            o = this,
                            a = !1,
                            s = !0;
                        if (!e.length) {
                            var u = !0;
                            return o.$evalAsync(function() {
                                    u && t(r, r, o)
                                }),
                                function() {
                                    u = !1
                                }
                        }
                        if (1 === e.length) return this.$watch(e[0], function(e, i, o) {
                            r[0] = e, n[0] = i, t(r, e === i ? r : n, o)
                        });

                        function c() {
                            a = !1;
                            try {
                                s ? (s = !1, t(r, r, o)) : t(r, n, o)
                            } finally {
                                for (var i = 0; i < e.length; i++) n[i] = r[i]
                            }
                        }
                        return T(e, function(e, t) {
                                var n = o.$watch(e, function(e) {
                                    r[t] = e, a || (a = !0, o.$evalAsync(c))
                                });
                                i.push(n)
                            }),
                            function() {
                                for (; i.length;) i.shift()()
                            }
                    },
                    $watchCollection: function(e, t) {
                        $.$$pure = a(e).literal, $.$stateful = !$.$$pure;
                        var n, r, i, o = this,
                            s = t.length > 1,
                            u = 0,
                            c = a(e, $),
                            f = [],
                            p = {},
                            d = !0,
                            h = 0;

                        function $(e) {
                            var t, i, o, a;
                            if (!_(n = e)) {
                                if (V(n))
                                    if (S(n)) {
                                        r !== f && (h = (r = f).length = 0, u++), t = n.length, h !== t && (u++, r.length = h = t);
                                        for (var s = 0; s < t; s++) a = r[s], o = n[s], a != a && o != o || a === o || (u++, r[s] = o)
                                    } else {
                                        for (i in r !== p && (r = p = {}, h = 0, u++), t = 0, n) l.call(n, i) && (t++, o = n[i], a = r[i], i in r ? a != a && o != o || a === o || (u++, r[i] = o) : (h++, r[i] = o, u++));
                                        if (h > t)
                                            for (i in u++, r) l.call(n, i) || (h--, delete r[i])
                                    }
                                else r !== n && (r = n, u++);
                                return u
                            }
                        }
                        return this.$watch(c, function() {
                            if (d ? (d = !1, t(n, n, o)) : t(n, i, o), s)
                                if (V(n))
                                    if (S(n)) {
                                        i = Array(n.length);
                                        for (var e = 0; e < n.length; e++) i[e] = n[e]
                                    } else
                                        for (var r in i = {}, n) l.call(n, r) && (i[r] = n[r]);
                            else i = n
                        })
                    },
                    $digest: function() {
                        var i, a, u, c, l, h, g, y, E, S = e,
                            T = p.length ? f : this,
                            O = [];
                        v("$digest"), s.$$checkUrlChange(), this === f && null !== o && (s.defer.cancel(o), w()), n = null;
                        do {
                            l = !1, g = T;
                            for (var x = 0; x < p.length; x++) {
                                try {
                                    (0, (E = p[x]).fn)(E.scope, E.locals)
                                } catch (e) {
                                    r(e)
                                }
                                n = null
                            }
                            p.length = 0;
                            e: do {
                                if (c = !g.$$suspended && g.$$watchers)
                                    for (c.$$digestWatchIndex = c.length; c.$$digestWatchIndex--;) try {
                                        if (i = c[c.$$digestWatchIndex])
                                            if ((a = (0, i.get)(g)) === (u = i.last) || (i.eq ? es(a, u) : I(a) && I(u))) {
                                                if (i === n) {
                                                    l = !1;
                                                    break e
                                                }
                                            } else l = !0, n = i, i.last = i.eq ? eo(a, null) : a, (0, i.fn)(a, u === b ? a : u, g), S < 5 && (O[y = 4 - S] || (O[y] = []), O[y].push({
                                                msg: z(i.exp) ? "fn: " + (i.exp.name || i.exp.toString()) : i.exp,
                                                newVal: a,
                                                oldVal: u
                                            }))
                                    } catch (e) {
                                        r(e)
                                    }
                                if (!(h = !g.$$suspended && g.$$watchersCount && g.$$childHead || g !== T && g.$$nextSibling))
                                    for (; g !== T && !(h = g.$$nextSibling);) g = g.$parent
                            } while (g = h);
                            if ((l || p.length) && !S--) throw m(), t("infdig", "{0} $digest() iterations reached. Aborting!\nWatchers fired in the last 5 iterations: {1}", e, O)
                        } while (l || p.length);
                        for (m(); $ < d.length;) try {
                            d[$++]()
                        } catch (e) {
                            r(e)
                        }
                        d.length = $ = 0, s.$$checkUrlChange()
                    },
                    $suspend: function() {
                        this.$$suspended = !0
                    },
                    $isSuspended: function() {
                        return this.$$suspended
                    },
                    $resume: function() {
                        this.$$suspended = !1
                    },
                    $destroy: function() {
                        if (!this.$$destroyed) {
                            var e = this.$parent;
                            for (var t in this.$broadcast("$destroy"), this.$$destroyed = !0, this === f && s.$$applicationDestroyed(), g(this, -this.$$watchersCount), this.$$listenerCount) y(this, this.$$listenerCount[t], t);
                            e && e.$$childHead === this && (e.$$childHead = this.$$nextSibling), e && e.$$childTail === this && (e.$$childTail = this.$$prevSibling), this.$$prevSibling && (this.$$prevSibling.$$nextSibling = this.$$nextSibling), this.$$nextSibling && (this.$$nextSibling.$$prevSibling = this.$$prevSibling), this.$destroy = this.$digest = this.$apply = this.$evalAsync = this.$applyAsync = N, this.$on = this.$watch = this.$watchGroup = function() {
                                    return N
                                }, this.$$listeners = {}, this.$$nextSibling = null,
                                function e(t) {
                                    9 === i && (t.$$childHead && e(t.$$childHead), t.$$nextSibling && e(t.$$nextSibling)), t.$parent = t.$$nextSibling = t.$$prevSibling = t.$$childHead = t.$$childTail = t.$root = t.$$watchers = null
                                }(this)
                        }
                    },
                    $eval: function(e, t) {
                        return a(e)(this, t)
                    },
                    $evalAsync: function(e, t) {
                        f.$$phase || p.length || s.defer(function() {
                            p.length && f.$digest()
                        }, null, "$evalAsync"), p.push({
                            scope: this,
                            fn: a(e),
                            locals: t
                        })
                    },
                    $$postDigest: function(e) {
                        d.push(e)
                    },
                    $apply: function(e) {
                        try {
                            v("$apply");
                            try {
                                return this.$eval(e)
                            } finally {
                                m()
                            }
                        } catch (e) {
                            r(e)
                        } finally {
                            try {
                                f.$digest()
                            } catch (e) {
                                throw r(e), e
                            }
                        }
                    },
                    $applyAsync: function(e) {
                        var t = this;
                        e && h.push(function() {
                            t.$eval(e)
                        }), e = a(e), null === o && (o = s.defer(function() {
                            f.$apply(w)
                        }, null, "$applyAsync"))
                    },
                    $on: function(e, t) {
                        var n = this.$$listeners[e];
                        n || (this.$$listeners[e] = n = []), n.push(t);
                        var r = this;
                        do r.$$listenerCount[e] || (r.$$listenerCount[e] = 0), r.$$listenerCount[e]++; while (r = r.$parent);
                        var i = this;
                        return function() {
                            var r = n.indexOf(t); - 1 !== r && (delete n[r], y(i, 1, e))
                        }
                    },
                    $emit: function(e, t) {
                        var n, i, o, a = [],
                            s = this,
                            u = !1,
                            c = {
                                name: e,
                                targetScope: s,
                                stopPropagation: function() {
                                    u = !0
                                },
                                preventDefault: function() {
                                    c.defaultPrevented = !0
                                },
                                defaultPrevented: !1
                            },
                            l = el([c], arguments, 1);
                        do {
                            for (n = s.$$listeners[e] || a, c.currentScope = s, i = 0, o = n.length; i < o; i++)
                                if (n[i]) try {
                                    n[i].apply(null, l)
                                } catch (e) {
                                    r(e)
                                } else n.splice(i, 1), i--, o--;
                            if (u) break;
                            s = s.$parent
                        } while (s);
                        return c.currentScope = null, c
                    },
                    $broadcast: function(e, t) {
                        var n = this,
                            i = this,
                            o = {
                                name: e,
                                targetScope: this,
                                preventDefault: function() {
                                    o.defaultPrevented = !0
                                },
                                defaultPrevented: !1
                            };
                        if (!this.$$listenerCount[e]) return o;
                        for (var a, s, u, c = el([o], arguments, 1); n = i;) {
                            for (o.currentScope = n, s = 0, u = (a = n.$$listeners[e] || []).length; s < u; s++)
                                if (a[s]) try {
                                    a[s].apply(null, c)
                                } catch (e) {
                                    r(e)
                                } else a.splice(s, 1), s--, u--;
                            if (!(i = n.$$listenerCount[e] && n.$$childHead || n !== this && n.$$nextSibling))
                                for (; n !== this && !(i = n.$$nextSibling);) n = n.$parent
                        }
                        return o.currentScope = null, o
                    }
                };
                var f = new c,
                    p = f.$$asyncQueue = [],
                    d = f.$$postDigestQueue = [],
                    h = f.$$applyAsyncQueue = [],
                    $ = 0;
                return f;

                function v(e) {
                    if (f.$$phase) throw t("inprog", "{0} already in progress", f.$$phase);
                    f.$$phase = e
                }

                function m() {
                    f.$$phase = null
                }

                function g(e, t) {
                    do e.$$watchersCount += t; while (e = e.$parent)
                }

                function y(e, t, n) {
                    do e.$$listenerCount[n] -= t, 0 === e.$$listenerCount[n] && delete e.$$listenerCount[n]; while (e = e.$parent)
                }

                function b() {}

                function w() {
                    for (; h.length;) try {
                        h.shift()()
                    } catch (e) {
                        r(e)
                    }
                    o = null
                }
            }]
        }

        function rr() {
            var e = /^\s*(https?|s?ftp|mailto|tel|file):/,
                t = /^\s*((https?|ftp|file|blob):|data:image\/)/;
            this.aHrefSanitizationTrustedUrlList = function(t) {
                return D(t) ? (e = t, this) : e
            }, this.imgSrcSanitizationTrustedUrlList = function(e) {
                return D(e) ? (t = e, this) : t
            }, this.$get = function() {
                return function(n, r) {
                    var i = r ? t : e,
                        o = rS(n && n.trim()).href;
                    return "" === o || o.match(i) ? n : "unsafe:" + o
                }
            }
        }
        n2.prototype = {
            compile: function(e) {
                var t = this;
                this.state = {
                    nextId: 0,
                    filters: {},
                    fn: {
                        vars: [],
                        body: [],
                        own: {}
                    },
                    assign: {
                        vars: [],
                        body: [],
                        own: {}
                    },
                    inputs: []
                }, nZ(e, t.$filter);
                var n, r = "";
                if (this.stage = "assign", n = n1(e)) {
                    this.state.computing = "assign";
                    var i = this.nextId();
                    this.recurse(n, i), this.return_(i), r = "fn.assign=" + this.generateFunction("assign", "s,v,l")
                }
                var o = nX(e.body);
                t.stage = "inputs", T(o, function(e, n) {
                    var r = "fn" + n;
                    t.state[r] = {
                        vars: [],
                        body: [],
                        own: {}
                    }, t.state.computing = r;
                    var i = t.nextId();
                    t.recurse(e, i), t.return_(i), t.state.inputs.push({
                        name: r,
                        isPure: e.isPure
                    }), e.watchId = n
                }), this.state.computing = "fn", this.stage = "main", this.recurse(e);
                var a = Function("$filter", "getStringValue", "ifDefined", "plus", '"' + this.USE + " " + this.STRICT + '";\n' + this.filterPrefix() + "var fn=" + this.generateFunction("fn", "s,l,a,i") + r + this.watchFns() + "return fn;")(this.$filter, nG, nQ, nK);
                return this.state = this.stage = void 0, a
            },
            USE: "use",
            STRICT: "strict",
            watchFns: function() {
                var e = [],
                    t = this.state.inputs,
                    n = this;
                return T(t, function(t) {
                    e.push("var " + t.name + "=" + n.generateFunction(t.name, "s")), t.isPure && e.push(t.name, ".isPure=" + JSON.stringify(t.isPure) + ";")
                }), t.length && e.push("fn.inputs=[" + t.map(function(e) {
                    return e.name
                }).join(",") + "];"), e.join("")
            },
            generateFunction: function(e, t) {
                return "function(" + t + "){" + this.varsPrefix(e) + this.body(e) + "};"
            },
            filterPrefix: function() {
                var e = [],
                    t = this;
                return T(this.state.filters, function(n, r) {
                    e.push(n + "=$filter(" + t.escape(r) + ")")
                }), e.length ? "var " + e.join(",") + ";" : ""
            },
            varsPrefix: function(e) {
                return this.state[e].vars.length ? "var " + this.state[e].vars.join(",") + ";" : ""
            },
            body: function(e) {
                return this.state[e].body.join("")
            },
            recurse: function(e, t, n, r, i, o) {
                var a, s, u, c, l, f = this;
                if (r = r || N, !o && D(e.watchId)) return t = t || this.nextId(), void this.if_("i", this.lazyAssign(t, this.computedMember("i", e.watchId)), this.lazyRecurse(e, t, n, r, i, !0));
                switch (e.type) {
                    case nY.Program:
                        T(e.body, function(t, n) {
                            f.recurse(t.expression, void 0, void 0, function(e) {
                                s = e
                            }), n !== e.body.length - 1 ? f.current().body.push(s, ";") : f.return_(s)
                        });
                        break;
                    case nY.Literal:
                        c = this.escape(e.value), this.assign(t, c), r(t || c);
                        break;
                    case nY.UnaryExpression:
                        this.recurse(e.argument, void 0, void 0, function(e) {
                            s = e
                        }), c = e.operator + "(" + this.ifDefined(s, 0) + ")", this.assign(t, c), r(c);
                        break;
                    case nY.BinaryExpression:
                        this.recurse(e.left, void 0, void 0, function(e) {
                            a = e
                        }), this.recurse(e.right, void 0, void 0, function(e) {
                            s = e
                        }), c = "+" === e.operator ? this.plus(a, s) : "-" === e.operator ? this.ifDefined(a, 0) + e.operator + this.ifDefined(s, 0) : "(" + a + ")" + e.operator + "(" + s + ")", this.assign(t, c), r(c);
                        break;
                    case nY.LogicalExpression:
                        t = t || this.nextId(), f.recurse(e.left, t), f.if_("&&" === e.operator ? t : f.not(t), f.lazyRecurse(e.right, t)), r(t);
                        break;
                    case nY.ConditionalExpression:
                        t = t || this.nextId(), f.recurse(e.test, t), f.if_(t, f.lazyRecurse(e.alternate, t), f.lazyRecurse(e.consequent, t)), r(t);
                        break;
                    case nY.Identifier:
                        t = t || this.nextId(), n && (n.context = "inputs" === f.stage ? "s" : this.assign(this.nextId(), this.getHasOwnProperty("l", e.name) + "?l:s"), n.computed = !1, n.name = e.name), f.if_("inputs" === f.stage || f.not(f.getHasOwnProperty("l", e.name)), function() {
                            f.if_("inputs" === f.stage || "s", function() {
                                i && 1 !== i && f.if_(f.isNull(f.nonComputedMember("s", e.name)), f.lazyAssign(f.nonComputedMember("s", e.name), "{}")), f.assign(t, f.nonComputedMember("s", e.name))
                            })
                        }, t && f.lazyAssign(t, f.nonComputedMember("l", e.name))), r(t);
                        break;
                    case nY.MemberExpression:
                        a = n && (n.context = this.nextId()) || this.nextId(), t = t || this.nextId(), f.recurse(e.object, a, void 0, function() {
                            f.if_(f.notNull(a), function() {
                                e.computed ? (s = f.nextId(), f.recurse(e.property, s), f.getStringValue(s), i && 1 !== i && f.if_(f.not(f.computedMember(a, s)), f.lazyAssign(f.computedMember(a, s), "{}")), c = f.computedMember(a, s), f.assign(t, c), n && (n.computed = !0, n.name = s)) : (i && 1 !== i && f.if_(f.isNull(f.nonComputedMember(a, e.property.name)), f.lazyAssign(f.nonComputedMember(a, e.property.name), "{}")), c = f.nonComputedMember(a, e.property.name), f.assign(t, c), n && (n.computed = !1, n.name = e.property.name))
                            }, function() {
                                f.assign(t, "undefined")
                            }), r(t)
                        }, !!i);
                        break;
                    case nY.CallExpression:
                        t = t || this.nextId(), e.filter ? (s = f.filter(e.callee.name), u = [], T(e.arguments, function(e) {
                            var t = f.nextId();
                            f.recurse(e, t), u.push(t)
                        }), c = s + "(" + u.join(",") + ")", f.assign(t, c), r(t)) : (s = f.nextId(), a = {}, u = [], f.recurse(e.callee, s, a, function() {
                            f.if_(f.notNull(s), function() {
                                T(e.arguments, function(t) {
                                    f.recurse(t, e.constant ? void 0 : f.nextId(), void 0, function(e) {
                                        u.push(e)
                                    })
                                }), c = a.name ? f.member(a.context, a.name, a.computed) + "(" + u.join(",") + ")" : s + "(" + u.join(",") + ")", f.assign(t, c)
                            }, function() {
                                f.assign(t, "undefined")
                            }), r(t)
                        }));
                        break;
                    case nY.AssignmentExpression:
                        s = this.nextId(), a = {}, this.recurse(e.left, void 0, a, function() {
                            f.if_(f.notNull(a.context), function() {
                                f.recurse(e.right, s), c = f.member(a.context, a.name, a.computed) + e.operator + s, f.assign(t, c), r(t || c)
                            })
                        }, 1);
                        break;
                    case nY.ArrayExpression:
                        u = [], T(e.elements, function(t) {
                            f.recurse(t, e.constant ? void 0 : f.nextId(), void 0, function(e) {
                                u.push(e)
                            })
                        }), c = "[" + u.join(",") + "]", this.assign(t, c), r(t || c);
                        break;
                    case nY.ObjectExpression:
                        u = [], l = !1, T(e.properties, function(e) {
                            e.computed && (l = !0)
                        }), l ? (t = t || this.nextId(), this.assign(t, "{}"), T(e.properties, function(e) {
                            e.computed ? (a = f.nextId(), f.recurse(e.key, a)) : a = e.key.type === nY.Identifier ? e.key.name : "" + e.key.value, s = f.nextId(), f.recurse(e.value, s), f.assign(f.member(t, a, e.computed), s)
                        })) : (T(e.properties, function(t) {
                            f.recurse(t.value, e.constant ? void 0 : f.nextId(), void 0, function(e) {
                                u.push(f.escape(t.key.type === nY.Identifier ? t.key.name : "" + t.key.value) + ":" + e)
                            })
                        }), c = "{" + u.join(",") + "}", this.assign(t, c)), r(t || c);
                        break;
                    case nY.ThisExpression:
                        this.assign(t, "s"), r(t || "s");
                        break;
                    case nY.LocalsExpression:
                        this.assign(t, "l"), r(t || "l");
                        break;
                    case nY.NGValueParameter:
                        this.assign(t, "v"), r(t || "v")
                }
            },
            getHasOwnProperty: function(e, t) {
                var n = e + "." + t,
                    r = this.current().own;
                return r.hasOwnProperty(n) || (r[n] = this.nextId(!1, e + "&&(" + this.escape(t) + " in " + e + ")")), r[n]
            },
            assign: function(e, t) {
                if (e) return this.current().body.push(e, "=", t, ";"), e
            },
            filter: function(e) {
                return this.state.filters.hasOwnProperty(e) || (this.state.filters[e] = this.nextId(!0)), this.state.filters[e]
            },
            ifDefined: function(e, t) {
                return "ifDefined(" + e + "," + this.escape(t) + ")"
            },
            plus: function(e, t) {
                return "plus(" + e + "," + t + ")"
            },
            return_: function(e) {
                this.current().body.push("return ", e, ";")
            },
            if_: function(e, t, n) {
                if (!0 === e) t();
                else {
                    var r = this.current().body;
                    r.push("if(", e, "){"), t(), r.push("}"), n && (r.push("else{"), n(), r.push("}"))
                }
            },
            not: function(e) {
                return "!(" + e + ")"
            },
            isNull: function(e) {
                return e + "==null"
            },
            notNull: function(e) {
                return e + "!=null"
            },
            nonComputedMember: function(e, t) {
                return /^[$_a-zA-Z][$_a-zA-Z0-9]*$/.test(t) ? e + "." + t : e + '["' + t.replace(/[^$_a-zA-Z0-9]/g, this.stringEscapeFn) + '"]'
            },
            computedMember: function(e, t) {
                return e + "[" + t + "]"
            },
            member: function(e, t, n) {
                return n ? this.computedMember(e, t) : this.nonComputedMember(e, t)
            },
            getStringValue: function(e) {
                this.assign(e, "getStringValue(" + e + ")")
            },
            lazyRecurse: function(e, t, n, r, i, o) {
                var a = this;
                return function() {
                    a.recurse(e, t, n, r, i, o)
                }
            },
            lazyAssign: function(e, t) {
                var n = this;
                return function() {
                    n.assign(e, t)
                }
            },
            stringEscapeRegex: /[^ a-zA-Z0-9]/g,
            stringEscapeFn: function(e) {
                return "\\u" + ("0000" + e.charCodeAt(0).toString(16)).slice(-4)
            },
            escape: function(e) {
                if (j(e)) return "'" + e.replace(this.stringEscapeRegex, this.stringEscapeFn) + "'";
                if (q(e)) return e.toString();
                if (!0 === e) return "true";
                if (!1 === e) return "false";
                if (null === e) return "null";
                if (void 0 === e) return "undefined";
                throw nB("esc", "IMPOSSIBLE")
            },
            nextId: function(e, t) {
                var n = "v" + this.state.nextId++;
                return e || this.current().vars.push(n + (t ? "=" + t : "")), n
            },
            current: function() {
                return this.state[this.state.computing]
            }
        }, n3.prototype = {
            compile: function(e) {
                var t, n, r = this;
                nZ(e, r.$filter), (t = n1(e)) && (n = this.recurse(t));
                var i, o = nX(e.body);
                o && (i = [], T(o, function(e, t) {
                    var n = r.recurse(e);
                    n.isPure = e.isPure, e.input = n, i.push(n), e.watchId = t
                }));
                var a = [];
                T(e.body, function(e) {
                    a.push(r.recurse(e.expression))
                });
                var s = 0 === e.body.length ? N : 1 === e.body.length ? a[0] : function(e, t) {
                    var n;
                    return T(a, function(r) {
                        n = r(e, t)
                    }), n
                };
                return n && (s.assign = function(e, t, r) {
                    return n(e, r, t)
                }), i && (s.inputs = i), s
            },
            recurse: function(e, t, n) {
                var r, i, o, a = this;
                if (e.input) return this.inputs(e.input, e.watchId);
                switch (e.type) {
                    case nY.Literal:
                        return this.value(e.value, t);
                    case nY.UnaryExpression:
                        return i = this.recurse(e.argument), this["unary" + e.operator](i, t);
                    case nY.BinaryExpression:
                    case nY.LogicalExpression:
                        return r = this.recurse(e.left), i = this.recurse(e.right), this["binary" + e.operator](r, i, t);
                    case nY.ConditionalExpression:
                        return this["ternary?:"](this.recurse(e.test), this.recurse(e.alternate), this.recurse(e.consequent), t);
                    case nY.Identifier:
                        return a.identifier(e.name, t, n);
                    case nY.MemberExpression:
                        return r = this.recurse(e.object, !1, !!n), e.computed || (i = e.property.name), e.computed && (i = this.recurse(e.property)), e.computed ? this.computedMember(r, i, t, n) : this.nonComputedMember(r, i, t, n);
                    case nY.CallExpression:
                        return o = [], T(e.arguments, function(e) {
                            o.push(a.recurse(e))
                        }), e.filter && (i = this.$filter(e.callee.name)), e.filter || (i = this.recurse(e.callee, !0)), e.filter ? function(e, n, r, a) {
                            for (var s = [], u = 0; u < o.length; ++u) s.push(o[u](e, n, r, a));
                            var c = i.apply(void 0, s, a);
                            return t ? {
                                context: void 0,
                                name: void 0,
                                value: c
                            } : c
                        } : function(e, n, r, a) {
                            var s, u = i(e, n, r, a);
                            if (null != u.value) {
                                for (var c = [], l = 0; l < o.length; ++l) c.push(o[l](e, n, r, a));
                                s = u.value.apply(u.context, c)
                            }
                            return t ? {
                                value: s
                            } : s
                        };
                    case nY.AssignmentExpression:
                        return r = this.recurse(e.left, !0, 1), i = this.recurse(e.right),
                            function(e, n, o, a) {
                                var s = r(e, n, o, a),
                                    u = i(e, n, o, a);
                                return s.context[s.name] = u, t ? {
                                    value: u
                                } : u
                            };
                    case nY.ArrayExpression:
                        return o = [], T(e.elements, function(e) {
                                o.push(a.recurse(e))
                            }),
                            function(e, n, r, i) {
                                for (var a = [], s = 0; s < o.length; ++s) a.push(o[s](e, n, r, i));
                                return t ? {
                                    value: a
                                } : a
                            };
                    case nY.ObjectExpression:
                        return o = [], T(e.properties, function(e) {
                                e.computed ? o.push({
                                    key: a.recurse(e.key),
                                    computed: !0,
                                    value: a.recurse(e.value)
                                }) : o.push({
                                    key: e.key.type === nY.Identifier ? e.key.name : "" + e.key.value,
                                    computed: !1,
                                    value: a.recurse(e.value)
                                })
                            }),
                            function(e, n, r, i) {
                                for (var a = {}, s = 0; s < o.length; ++s) o[s].computed ? a[o[s].key(e, n, r, i)] = o[s].value(e, n, r, i) : a[o[s].key] = o[s].value(e, n, r, i);
                                return t ? {
                                    value: a
                                } : a
                            };
                    case nY.ThisExpression:
                        return function(e) {
                            return t ? {
                                value: e
                            } : e
                        };
                    case nY.LocalsExpression:
                        return function(e, n) {
                            return t ? {
                                value: n
                            } : n
                        };
                    case nY.NGValueParameter:
                        return function(e, n, r) {
                            return t ? {
                                value: r
                            } : r
                        }
                }
            },
            "unary+": function(e, t) {
                return function(n, r, i, o) {
                    var a = e(n, r, i, o);
                    return a = D(a) ? +a : 0, t ? {
                        value: a
                    } : a
                }
            },
            "unary-": function(e, t) {
                return function(n, r, i, o) {
                    var a = e(n, r, i, o);
                    return a = D(a) ? -a : -0, t ? {
                        value: a
                    } : a
                }
            },
            "unary!": function(e, t) {
                return function(n, r, i, o) {
                    var a = !e(n, r, i, o);
                    return t ? {
                        value: a
                    } : a
                }
            },
            "binary+": function(e, t, n) {
                return function(r, i, o, a) {
                    var s = nK(e(r, i, o, a), t(r, i, o, a));
                    return n ? {
                        value: s
                    } : s
                }
            },
            "binary-": function(e, t, n) {
                return function(r, i, o, a) {
                    var s = e(r, i, o, a),
                        u = t(r, i, o, a),
                        c = (D(s) ? s : 0) - (D(u) ? u : 0);
                    return n ? {
                        value: c
                    } : c
                }
            },
            "binary*": function(e, t, n) {
                return function(r, i, o, a) {
                    var s = e(r, i, o, a) * t(r, i, o, a);
                    return n ? {
                        value: s
                    } : s
                }
            },
            "binary/": function(e, t, n) {
                return function(r, i, o, a) {
                    var s = e(r, i, o, a) / t(r, i, o, a);
                    return n ? {
                        value: s
                    } : s
                }
            },
            "binary%": function(e, t, n) {
                return function(r, i, o, a) {
                    var s = e(r, i, o, a) % t(r, i, o, a);
                    return n ? {
                        value: s
                    } : s
                }
            },
            "binary===": function(e, t, n) {
                return function(r, i, o, a) {
                    var s = e(r, i, o, a) === t(r, i, o, a);
                    return n ? {
                        value: s
                    } : s
                }
            },
            "binary!==": function(e, t, n) {
                return function(r, i, o, a) {
                    var s = e(r, i, o, a) !== t(r, i, o, a);
                    return n ? {
                        value: s
                    } : s
                }
            },
            "binary==": function(e, t, n) {
                return function(r, i, o, a) {
                    var s = e(r, i, o, a) == t(r, i, o, a);
                    return n ? {
                        value: s
                    } : s
                }
            },
            "binary!=": function(e, t, n) {
                return function(r, i, o, a) {
                    var s = e(r, i, o, a) != t(r, i, o, a);
                    return n ? {
                        value: s
                    } : s
                }
            },
            "binary<": function(e, t, n) {
                return function(r, i, o, a) {
                    var s = e(r, i, o, a) < t(r, i, o, a);
                    return n ? {
                        value: s
                    } : s
                }
            },
            "binary>": function(e, t, n) {
                return function(r, i, o, a) {
                    var s = e(r, i, o, a) > t(r, i, o, a);
                    return n ? {
                        value: s
                    } : s
                }
            },
            "binary<=": function(e, t, n) {
                return function(r, i, o, a) {
                    var s = e(r, i, o, a) <= t(r, i, o, a);
                    return n ? {
                        value: s
                    } : s
                }
            },
            "binary>=": function(e, t, n) {
                return function(r, i, o, a) {
                    var s = e(r, i, o, a) >= t(r, i, o, a);
                    return n ? {
                        value: s
                    } : s
                }
            },
            "binary&&": function(e, t, n) {
                return function(r, i, o, a) {
                    var s = e(r, i, o, a) && t(r, i, o, a);
                    return n ? {
                        value: s
                    } : s
                }
            },
            "binary||": function(e, t, n) {
                return function(r, i, o, a) {
                    var s = e(r, i, o, a) || t(r, i, o, a);
                    return n ? {
                        value: s
                    } : s
                }
            },
            "ternary?:": function(e, t, n, r) {
                return function(i, o, a, s) {
                    var u = e(i, o, a, s) ? t(i, o, a, s) : n(i, o, a, s);
                    return r ? {
                        value: u
                    } : u
                }
            },
            value: function(e, t) {
                return function() {
                    return t ? {
                        context: void 0,
                        name: void 0,
                        value: e
                    } : e
                }
            },
            identifier: function(e, t, n) {
                return function(r, i, o, a) {
                    var s = i && e in i ? i : r;
                    n && 1 !== n && s && null == s[e] && (s[e] = {});
                    var u = s ? s[e] : void 0;
                    return t ? {
                        context: s,
                        name: e,
                        value: u
                    } : u
                }
            },
            computedMember: function(e, t, n, r) {
                return function(i, o, a, s) {
                    var u, c, l = e(i, o, a, s);
                    return null != l && (u = nG(u = t(i, o, a, s)), r && 1 !== r && l && !l[u] && (l[u] = {}), c = l[u]), n ? {
                        context: l,
                        name: u,
                        value: c
                    } : c
                }
            },
            nonComputedMember: function(e, t, n, r) {
                return function(i, o, a, s) {
                    var u = e(i, o, a, s);
                    r && 1 !== r && u && null == u[t] && (u[t] = {});
                    var c = null != u ? u[t] : void 0;
                    return n ? {
                        context: u,
                        name: t,
                        value: c
                    } : c
                }
            },
            inputs: function(e, t) {
                return function(n, r, i, o) {
                    return o ? o[t] : e(n, r, i)
                }
            }
        }, n4.prototype = {
            constructor: n4,
            parse: function(e) {
                var t, n = this.getAst(e),
                    r = this.astCompiler.compile(n.ast);
                return r.literal = 0 === (t = n.ast).body.length || 1 === t.body.length && (t.body[0].expression.type === nY.Literal || t.body[0].expression.type === nY.ArrayExpression || t.body[0].expression.type === nY.ObjectExpression), r.constant = n.ast.constant, r.oneTime = n.oneTime, r
            },
            getAst: function(e) {
                var t = !1;
                return ":" === (e = e.trim()).charAt(0) && ":" === e.charAt(1) && (t = !0, e = e.substring(2)), {
                    ast: this.ast.ast(e),
                    oneTime: t
                }
            }
        };
        var ri = r("$sce"),
            ro = {
                HTML: "html",
                CSS: "css",
                MEDIA_URL: "mediaUrl",
                URL: "url",
                RESOURCE_URL: "resourceUrl",
                JS: "js"
            },
            ra = /_([a-z])/g;

        function rs(e) {
            return e.replace(ra, ez)
        }

        function ru(e) {
            var t = [];
            return D(e) && T(e, function(e) {
                t.push(function(e) {
                    if ("self" === e) return e;
                    if (j(e)) {
                        if (e.indexOf("***") > -1) throw ri("iwcard", "Illegal sequence *** in string matcher.  String: {0}", e);
                        return RegExp("^" + (e = ee(e).replace(/\\\*\\\*/g, ".*").replace(/\\\*/g, "[^:/.?&;]*")) + "$")
                    }
                    if (W(e)) return RegExp("^" + e.source + "$");
                    throw ri("imatcher", 'Matchers may only be "self", string patterns or RegExp objects')
                }(e))
            }), t
        }

        function rc() {
            this.SCE_CONTEXTS = ro;
            var t = ["self"],
                n = [];
            this.trustedResourceUrlList = function(e) {
                return arguments.length && (t = ru(e)), t
            }, Object.defineProperty(this, "resourceUrlWhitelist", {
                get: function() {
                    return this.trustedResourceUrlList
                },
                set: function(e) {
                    this.trustedResourceUrlList = e
                }
            }), this.bannedResourceUrlList = function(e) {
                return arguments.length && (n = ru(e)), n
            }, Object.defineProperty(this, "resourceUrlBlacklist", {
                get: function() {
                    return this.bannedResourceUrlList
                },
                set: function(e) {
                    this.bannedResourceUrlList = e
                }
            }), this.$get = ["$injector", "$$sanitizeUri", function(r, i) {
                var o = function(e) {
                    throw ri("unsafe", "Attempting to use an unsafe value in a safe context.")
                };

                function a(t, n) {
                    return "self" === t ? rT(n, rw) || rT(n, e.document.baseURI ? e.document.baseURI : (ry || ((ry = e.document.createElement("a")).href = ".", ry = ry.cloneNode(!1)), ry.href)) : !!t.exec(n.href)
                }

                function s(e) {
                    var t = function(e) {
                        this.$$unwrapTrustedValue = function() {
                            return e
                        }
                    };
                    return e && (t.prototype = new e), t.prototype.valueOf = function() {
                        return this.$$unwrapTrustedValue()
                    }, t.prototype.toString = function() {
                        return this.$$unwrapTrustedValue().toString()
                    }, t
                }
                r.has("$sanitize") && (o = r.get("$sanitize"));
                var u = s(),
                    c = {};
                return c[ro.HTML] = s(u), c[ro.CSS] = s(u), c[ro.MEDIA_URL] = s(u), c[ro.URL] = s(c[ro.MEDIA_URL]), c[ro.JS] = s(u), c[ro.RESOURCE_URL] = s(c[ro.URL]), {
                    trustAs: function(e, t) {
                        var n = c.hasOwnProperty(e) ? c[e] : null;
                        if (!n) throw ri("icontext", "Attempted to trust a value in invalid context. Context: {0}; Value: {1}", e, t);
                        if (null === t || _(t) || "" === t) return t;
                        if ("string" != typeof t) throw ri("itype", "Attempted to trust a non-string value in a content requiring a string: Context: {0}", e);
                        return new n(t)
                    },
                    getTrusted: function(e, r) {
                        if (null === r || _(r) || "" === r) return r;
                        var s = c.hasOwnProperty(e) ? c[e] : null;
                        if (s && d(r, s)) return r.$$unwrapTrustedValue();
                        if (z(r.$$unwrapTrustedValue) && (r = r.$$unwrapTrustedValue()), e === ro.MEDIA_URL || e === ro.URL) return i(r.toString(), e === ro.MEDIA_URL);
                        if (e === ro.RESOURCE_URL) {
                            if (function(e) {
                                    var r, i, o = rS(e.toString()),
                                        s = !1;
                                    for (r = 0, i = t.length; r < i; r++)
                                        if (a(t[r], o)) {
                                            s = !0;
                                            break
                                        } if (s) {
                                        for (r = 0, i = n.length; r < i; r++)
                                            if (a(n[r], o)) {
                                                s = !1;
                                                break
                                            }
                                    }
                                    return s
                                }(r)) return r;
                            throw ri("insecurl", "Blocked loading resource from url not allowed by $sceDelegate policy.  URL: {0}", r.toString())
                        }
                        if (e === ro.HTML) return o(r);
                        throw ri("unsafe", "Attempting to use an unsafe value in a safe context.")
                    },
                    valueOf: function(e) {
                        return d(e, u) ? e.$$unwrapTrustedValue() : e
                    }
                }
            }]
        }

        function rl() {
            var e = !0;
            this.enabled = function(t) {
                return arguments.length && (e = !!t), e
            }, this.$get = ["$parse", "$sceDelegate", function(t, n) {
                if (e && i < 8) throw ri("iequirks", "Strict Contextual Escaping does not support Internet Explorer version < 11 in quirks mode.  You can fix this by adding the text <!doctype html> to the top of your HTML document.  See http://docs.angularjs.org/api/ng.$sce for more information.");
                var r = eD(ro);
                r.isEnabled = function() {
                    return e
                }, r.trustAs = n.trustAs, r.getTrusted = n.getTrusted, r.valueOf = n.valueOf, e || (r.trustAs = r.getTrusted = function(e, t) {
                    return t
                }, r.valueOf = k), r.parseAs = function(e, n) {
                    var i = t(n);
                    return i.literal && i.constant ? i : t(n, function(t) {
                        return r.getTrusted(e, t)
                    })
                };
                var o = r.parseAs,
                    a = r.getTrusted,
                    s = r.trustAs;
                return T(ro, function(e, t) {
                    var n = f(t);
                    r[rs("parse_as_" + n)] = function(t) {
                        return o(e, t)
                    }, r[rs("get_trusted_" + n)] = function(t) {
                        return a(e, t)
                    }, r[rs("trust_as_" + n)] = function(t) {
                        return s(e, t)
                    }
                }), r
            }]
        }

        function rf() {
            this.$get = ["$window", "$document", function(e, t) {
                var n = {},
                    r = !(!(e.nw && e.nw.process) && e.chrome && (e.chrome.app && e.chrome.app.runtime || !e.chrome.app && e.chrome.runtime && e.chrome.runtime.id)) && e.history && e.history.pushState,
                    o = P((/android (\d+)/.exec(f((e.navigator || {}).userAgent)) || [])[1]),
                    a = /Boxee/i.test((e.navigator || {}).userAgent),
                    s = t[0] || {},
                    u = s.body && s.body.style,
                    c = !1,
                    l = !1;
                return u && (c = "transition" in u || "webkitTransition" in u, l = "animation" in u || "webkitAnimation" in u), {
                    history: !(!r || o < 4 || a),
                    hasEvent: function(e) {
                        if ("input" === e && i) return !1;
                        if (_(n[e])) {
                            var t = s.createElement("div");
                            n[e] = "on" + e in t
                        }
                        return n[e]
                    },
                    csp: eu(),
                    transitions: c,
                    animations: l,
                    android: o
                }
            }]
        }

        function rp() {
            this.$get = L(function(e) {
                return new rd(e)
            })
        }

        function rd(e) {
            var t = {},
                n = [],
                r = this.ALL_TASKS_TYPE = "$$all$$",
                i = this.DEFAULT_TASK_TYPE = "$$default$$";

            function o() {
                var e = n.pop();
                return e && e.cb
            }

            function a(e) {
                for (var t = n.length - 1; t >= 0; --t) {
                    var r = n[t];
                    if (r.type === e) return n.splice(t, 1), r.cb
                }
            }
            this.completeTask = function(n, s) {
                s = s || i;
                try {
                    n()
                } finally {
                    t[l = (l = s) || i] && (t[l]--, t[r]--);
                    var u = t[s],
                        c = t[r];
                    if (!c || !u)
                        for (var l, f, p = c ? a : o; f = p(s);) try {
                            f()
                        } catch (t) {
                            e.error(t)
                        }
                }
            }, this.incTaskCount = function(e) {
                t[e = e || i] = (t[e] || 0) + 1, t[r] = (t[r] || 0) + 1
            }, this.notifyWhenNoPendingTasks = function(e, i) {
                t[i = i || r] ? n.push({
                    type: i,
                    cb: e
                }) : e()
            }
        }
        var rh = r("$templateRequest");

        function r$() {
            var e;
            this.httpOptions = function(t) {
                return t ? (e = t, this) : e
            }, this.$get = ["$exceptionHandler", "$templateCache", "$http", "$q", "$sce", function(t, n, r, i, o) {
                function a(s, u) {
                    a.totalPendingRequests++, j(s) && !_(n.get(s)) || (s = o.getTrustedResourceUrl(s));
                    var c = r.defaults && r.defaults.transformResponse;
                    return H(c) ? c = c.filter(function(e) {
                        return e !== np
                    }) : c === np && (c = null), r.get(s, C({
                        cache: n,
                        transformResponse: c
                    }, e)).finally(function() {
                        a.totalPendingRequests--
                    }).then(function(e) {
                        return n.put(s, e.data)
                    }, function(e) {
                        return u || t(e = rh("tpload", "Failed to load template: {0} (HTTP status: {1} {2})", s, e.status, e.statusText)), i.reject(e)
                    })
                }
                return a.totalPendingRequests = 0, a
            }]
        }

        function rv() {
            this.$get = ["$rootScope", "$browser", "$location", function(e, t, n) {
                return {
                    findBindings: function(e, t, n) {
                        var r = e.getElementsByClassName("ng-binding"),
                            i = [];
                        return T(r, function(e) {
                            var r = w.element(e).data("$binding");
                            r && T(r, function(r) {
                                n ? RegExp("(^|\\s)" + ee(t) + "(\\s|\\||$)").test(r) && i.push(e) : -1 !== r.indexOf(t) && i.push(e)
                            })
                        }), i
                    },
                    findModels: function(e, t, n) {
                        for (var r = ["ng-", "data-ng-", "ng\\:"], i = 0; i < r.length; ++i) {
                            var o = "[" + r[i] + "model" + (n ? "=" : "*=") + '"' + t + '"]',
                                a = e.querySelectorAll(o);
                            if (a.length) return a
                        }
                    },
                    getLocation: function() {
                        return n.url()
                    },
                    setLocation: function(t) {
                        t !== n.url() && (n.url(t), e.$digest())
                    },
                    whenStable: function(e) {
                        t.notifyWhenNoOutstandingRequests(e)
                    }
                }
            }]
        }
        var rm = r("$timeout");

        function rg() {
            this.$get = ["$rootScope", "$browser", "$q", "$$q", "$exceptionHandler", function(e, t, n, r, i) {
                var o = {};

                function a(a, s, u) {
                    z(a) || (u = s, s = a, a = N);
                    var c, l = ef(arguments, 3),
                        f = D(u) && !u,
                        p = (f ? r : n).defer(),
                        d = p.promise;
                    return c = t.defer(function() {
                        try {
                            p.resolve(a.apply(null, l))
                        } catch (e) {
                            p.reject(e), i(e)
                        } finally {
                            delete o[d.$$timeoutId]
                        }
                        f || e.$apply()
                    }, s, "$timeout"), d.$$timeoutId = c, o[c] = p, d
                }
                return a.cancel = function(e) {
                    if (!e) return !1;
                    if (!e.hasOwnProperty("$$timeoutId")) throw rm("badprom", "`$timeout.cancel()` called with a promise that was not generated by `$timeout()`.");
                    if (!o.hasOwnProperty(e.$$timeoutId)) return !1;
                    var n = e.$$timeoutId,
                        r = o[n];
                    return re(r.promise), r.reject("canceled"), delete o[n], t.defer.cancel(n)
                }, a
            }]
        }
        var ry, rb = e.document.createElement("a"),
            rw = rS(e.location.href);
        rb.href = "http://[::1]";
        var rE = "[::1]" === rb.hostname;

        function rS(e) {
            if (!j(e)) return e;
            var t = e;
            i && (rb.setAttribute("href", t), t = rb.href), rb.setAttribute("href", t);
            var n = rb.hostname;
            return !rE && n.indexOf(":") > -1 && (n = "[" + n + "]"), {
                href: rb.href,
                protocol: rb.protocol ? rb.protocol.replace(/:$/, "") : "",
                host: rb.host,
                search: rb.search ? rb.search.replace(/^\?/, "") : "",
                hash: rb.hash ? rb.hash.replace(/^#/, "") : "",
                hostname: n,
                port: rb.port,
                pathname: "/" === rb.pathname.charAt(0) ? rb.pathname : "/" + rb.pathname
            }
        }

        function rT(e, t) {
            return e = rS(e), t = rS(t), e.protocol === t.protocol && e.host === t.host
        }

        function rO() {
            this.$get = L(e)
        }

        function rx(e) {
            var t = e[0] || {},
                n = {},
                r = "";

            function i(e) {
                try {
                    return decodeURIComponent(e)
                } catch (t) {
                    return e
                }
            }
            return function() {
                var e, o, a, s, u, c = function(e) {
                    try {
                        return e.cookie || ""
                    } catch (e) {
                        return ""
                    }
                }(t);
                if (c !== r)
                    for (e = (r = c).split("; "), n = {}, a = 0; a < e.length; a++)(s = (o = e[a]).indexOf("=")) > 0 && _(n[u = i(o.substring(0, s))]) && (n[u] = i(o.substring(s + 1)));
                return n
            }
        }

        function rA() {
            this.$get = rx
        }

        function rR(e) {
            var t = "Filter";

            function n(r, i) {
                if (V(r)) {
                    var o = {};
                    return T(r, function(e, t) {
                        o[t] = n(t, e)
                    }), o
                }
                return e.factory(r + t, i)
            }
            this.register = n, this.$get = ["$injector", function(e) {
                return function(n) {
                    return e.get(n + t)
                }
            }], n("currency", rM), n("date", rH), n("filter", rC), n("json", rG), n("limitTo", rJ), n("lowercase", rz), n("number", rN), n("orderBy", rQ), n("uppercase", rW)
        }

        function rC() {
            return function(e, t, n, i) {
                var o, a, s, u, c, l, p;
                if (!S(e)) {
                    if (null == e) return e;
                    throw r("filter")("notarray", "Expected array but received: {0}", e)
                }
                switch (i = i || "$", rI(t)) {
                    case "function":
                        o = t;
                        break;
                    case "boolean":
                    case "null":
                    case "number":
                    case "string":
                        a = !0;
                    case "object":
                        s = t, u = n, c = i, l = a, p = V(s) && c in s, !0 === u ? u = es : z(u) || (u = function(e, t) {
                            return !_(e) && (null === e || null === t ? e === t : !(V(t) || V(e) && !U(e)) && (e = f("" + e), t = f("" + t), -1 !== e.indexOf(t)))
                        }), o = function(e) {
                            return p && !V(e) ? rP(e, s[c], u, c, !1) : rP(e, s, u, c, l)
                        };
                        break;
                    default:
                        return e
                }
                return Array.prototype.filter.call(e, o)
            }
        }

        function rP(e, t, n, r, i, o) {
            var a, s = rI(e),
                u = rI(t);
            if ("string" === u && "!" === t.charAt(0)) return !rP(e, t.substring(1), n, r, i);
            if (H(e)) return e.some(function(e) {
                return rP(e, t, n, r, i)
            });
            switch (s) {
                case "object":
                    if (i) {
                        for (a in e)
                            if (a.charAt && "$" !== a.charAt(0) && rP(e[a], t, n, r, !0)) return !0;
                        return !o && rP(e, t, n, r, !1)
                    }
                    if ("object" === u) {
                        for (a in t) {
                            var c = t[a];
                            if (!z(c) && !_(c)) {
                                var l = a === r;
                                if (!rP(l ? e : e[a], c, n, r, l, l)) return !1
                            }
                        }
                        return !0
                    }
                    return n(e, t);
                case "function":
                    return !1;
                default:
                    return n(e, t)
            }
        }

        function rI(e) {
            return null === e ? "null" : void 0 === e ? "undefined" : v(e)
        }

        function rM(e) {
            var t = e.NUMBER_FORMATS;
            return function(e, n, r) {
                _(n) && (n = t.CURRENCY_SYM), _(r) && (r = t.PATTERNS[1].maxFrac);
                var i = n ? /\u00A4/g : /\s*\u00A4\s*/g;
                return null == e ? e : rk(e, t.PATTERNS[1], t.GROUP_SEP, t.DECIMAL_SEP, r).replace(i, n)
            }
        }

        function rN(e) {
            var t = e.NUMBER_FORMATS;
            return function(e, n) {
                return null == e ? e : rk(e, t.PATTERNS[0], t.GROUP_SEP, t.DECIMAL_SEP, n)
            }
        }

        function rk(e, t, n, r, i) {
            if (!j(e) && !q(e) || isNaN(e)) return "";
            var o, a = !isFinite(e),
                s = !1,
                u = Math.abs(e) + "",
                c = "";
            if (a) c = "∞";
            else {
                ! function(e, t, n, r) {
                    var i = e.d,
                        o = i.length - e.i,
                        a = (t = _(t) ? Math.min(Math.max(n, o), r) : +t) + e.i,
                        s = i[a];
                    if (a > 0) {
                        i.splice(Math.max(e.i, a));
                        for (var u = a; u < i.length; u++) i[u] = 0
                    } else {
                        o = Math.max(0, o), e.i = 1, i.length = Math.max(1, a = t + 1), i[0] = 0;
                        for (var c = 1; c < a; c++) i[c] = 0
                    }
                    if (s >= 5)
                        if (a - 1 < 0) {
                            for (var l = 0; l > a; l--) i.unshift(0), e.i++;
                            i.unshift(1), e.i++
                        } else i[a - 1]++;
                    for (; o < Math.max(0, t); o++) i.push(0);
                    var f = i.reduceRight(function(e, t, n, r) {
                        return t += e, r[n] = t % 10, Math.floor(t / 10)
                    }, 0);
                    f && (i.unshift(f), e.i++)
                }(o = function(e) {
                    var t, n, r, i, o, a = 0;
                    for ((n = e.indexOf(".")) > -1 && (e = e.replace(".", "")), (r = e.search(/e/i)) > 0 ? (n < 0 && (n = r), n += +e.slice(r + 1), e = e.substring(0, r)) : n < 0 && (n = e.length), r = 0;
                        "0" === e.charAt(r); r++);
                    if (r === (o = e.length)) t = [0], n = 1;
                    else {
                        for (o--;
                            "0" === e.charAt(o);) o--;
                        for (n -= r, t = [], i = 0; r <= o; r++, i++) t[i] = +e.charAt(r)
                    }
                    return n > 22 && (t = t.splice(0, 21), a = n - 1, n = 1), {
                        d: t,
                        e: a,
                        i: n
                    }
                }(u), i, t.minFrac, t.maxFrac);
                var l = o.d,
                    f = o.i,
                    p = o.e,
                    d = [];
                for (s = l.reduce(function(e, t) {
                        return e && !t
                    }, !0); f < 0;) l.unshift(0), f++;
                f > 0 ? d = l.splice(f, l.length) : (d = l, l = [0]);
                var h = [];
                for (l.length >= t.lgSize && h.unshift(l.splice(-t.lgSize, l.length).join("")); l.length > t.gSize;) h.unshift(l.splice(-t.gSize, l.length).join(""));
                l.length && h.unshift(l.join("")), c = h.join(n), d.length && (c += r + d.join("")), p && (c += "e+" + p)
            }
            return e < 0 && !s ? t.negPre + c + t.negSuf : t.posPre + c + t.posSuf
        }

        function rL(e, t, n, r) {
            var i = "";
            for ((e < 0 || r && e <= 0) && (r ? e = 1 - e : (e = -e, i = "-")), e = "" + e; e.length < t;) e = "0" + e;
            return n && (e = e.substr(e.length - t)), i + e
        }

        function rU(e, t, n, r, i) {
            return n = n || 0,
                function(o) {
                    var a = o["get" + e]();
                    return (n > 0 || a > -n) && (a += n), 0 === a && -12 === n && (a = 12), rL(a, t, r, i)
                }
        }

        function r_(e, t, n) {
            return function(r, i) {
                var o = r["get" + e]();
                return i[p((n ? "STANDALONE" : "") + (t ? "SHORT" : "") + e)][o]
            }
        }

        function rD(e) {
            var t = new Date(e, 0, 1).getDay();
            return new Date(e, 0, (t <= 4 ? 5 : 12) - t)
        }

        function rV(e) {
            return function(t) {
                var n = rD(t.getFullYear());
                return rL(1 + Math.round((new Date(t.getFullYear(), t.getMonth(), t.getDate() + (4 - t.getDay())) - n) / 6048e5), e)
            }
        }

        function rF(e, t) {
            return 0 >= e.getFullYear() ? t.ERAS[0] : t.ERAS[1]
        }
        rx.$inject = ["$document"], rR.$inject = ["$provide"], rM.$inject = ["$locale"], rN.$inject = ["$locale"];
        var rj = {
                yyyy: rU("FullYear", 4, 0, !1, !0),
                yy: rU("FullYear", 2, 0, !0, !0),
                y: rU("FullYear", 1, 0, !1, !0),
                MMMM: r_("Month"),
                MMM: r_("Month", !0),
                MM: rU("Month", 2, 1),
                M: rU("Month", 1, 1),
                LLLL: r_("Month", !1, !0),
                dd: rU("Date", 2),
                d: rU("Date", 1),
                HH: rU("Hours", 2),
                H: rU("Hours", 1),
                hh: rU("Hours", 2, -12),
                h: rU("Hours", 1, -12),
                mm: rU("Minutes", 2),
                m: rU("Minutes", 1),
                ss: rU("Seconds", 2),
                s: rU("Seconds", 1),
                sss: rU("Milliseconds", 3),
                EEEE: r_("Day"),
                EEE: r_("Day", !0),
                a: function(e, t) {
                    return 12 > e.getHours() ? t.AMPMS[0] : t.AMPMS[1]
                },
                Z: function(e, t, n) {
                    var r = -1 * n;
                    return (r >= 0 ? "+" : "") + (rL(Math[r > 0 ? "floor" : "ceil"](r / 60), 2) + rL(Math.abs(r % 60), 2))
                },
                ww: rV(2),
                w: rV(1),
                G: rF,
                GG: rF,
                GGG: rF,
                GGGG: function(e, t) {
                    return 0 >= e.getFullYear() ? t.ERANAMES[0] : t.ERANAMES[1]
                }
            },
            rq = /((?:[^yMLdHhmsaZEwG']+)|(?:'(?:[^']|'')*')|(?:E+|y+|M+|L+|d+|H+|h+|m+|s+|a|Z|G+|w+))([\s\S]*)/,
            rB = /^-?\d+$/;

        function rH(e) {
            var t = /^(\d{4})-?(\d\d)-?(\d\d)(?:T(\d\d)(?::?(\d\d)(?::?(\d\d)(?:\.(\d+))?)?)?(Z|([+-])(\d\d):?(\d\d))?)?$/;
            return function(n, r, i) {
                var o, a, s = "",
                    u = [];
                if (r = r || "mediumDate", r = e.DATETIME_FORMATS[r] || r, j(n) && (n = rB.test(n) ? P(n) : function(e) {
                        var n;
                        if (n = e.match(t)) {
                            var r = new Date(0),
                                i = 0,
                                o = 0,
                                a = n[8] ? r.setUTCFullYear : r.setFullYear,
                                s = n[8] ? r.setUTCHours : r.setHours;
                            n[9] && (i = P(n[9] + n[10]), o = P(n[9] + n[11])), a.call(r, P(n[1]), P(n[2]) - 1, P(n[3]));
                            var u = P(n[4] || 0) - i,
                                c = P(n[5] || 0) - o,
                                l = P(n[6] || 0),
                                f = Math.round(1e3 * parseFloat("0." + (n[7] || 0)));
                            return s.call(r, u, c, l, f), r
                        }
                        return e
                    }(n)), q(n) && (n = new Date(n)), !B(n) || !isFinite(n.getTime())) return n;
                for (; r;)(a = rq.exec(r)) ? r = (u = el(u, a, 1)).pop() : (u.push(r), r = null);
                var c = n.getTimezoneOffset();
                return i && (c = em(i, c), n = ey(n, i, !0)), T(u, function(t) {
                    o = rj[t], s += o ? o(n, e.DATETIME_FORMATS, c) : "''" === t ? "'" : t.replace(/(^'|'$)/g, "").replace(/''/g, "'")
                }), s
            }
        }

        function rG() {
            return function(e, t) {
                return _(t) && (t = 2), eh(e, t)
            }
        }
        rH.$inject = ["$locale"];
        var rz = L(f),
            rW = L(p);

        function rJ() {
            return function(e, t, n) {
                return I(t = Math.abs(Number(t)) === 1 / 0 ? Number(t) : P(t)) ? e : (q(e) && (e = e.toString()), S(e) ? (n = (n = !n || isNaN(n) ? 0 : P(n)) < 0 ? Math.max(0, e.length + n) : n, t >= 0 ? rY(e, n, n + t) : 0 === n ? rY(e, t, e.length) : rY(e, Math.max(0, n + t), n)) : e)
            }
        }

        function rY(e, t, n) {
            return j(e) ? e.slice(t, n) : h.call(e, t, n)
        }

        function rQ(e) {
            return function(i, o, a, s) {
                if (null == i) return i;
                if (!S(i)) throw r("orderBy")("notarray", "Expected array but received: {0}", i);
                H(o) || (o = [o]), 0 === o.length && (o = ["+"]);
                var u = o.map(function(t) {
                        var n = 1,
                            r = k;
                        if (z(t)) r = t;
                        else if (j(t) && ("+" !== t.charAt(0) && "-" !== t.charAt(0) || (n = "-" === t.charAt(0) ? -1 : 1, t = t.substring(1)), "" !== t && (r = e(t)).constant)) {
                            var i = r();
                            r = function(e) {
                                return e[i]
                            }
                        }
                        return {
                            get: r,
                            descending: n
                        }
                    }),
                    c = a ? -1 : 1,
                    l = z(s) ? s : n,
                    f = Array.prototype.map.call(i, function(e, n) {
                        return {
                            value: e,
                            tieBreaker: {
                                value: n,
                                type: "number",
                                index: n
                            },
                            predicateValues: u.map(function(r) {
                                var i, o, a;
                                return i = r.get(e), o = void 0 === i ? "undefined" : v(i), null === i ? o = "null" : "object" === o && (z((a = i).valueOf) && t(a = a.valueOf()) || U(a) && t(a = a.toString()), i = a), {
                                    value: i,
                                    type: o,
                                    index: n
                                }
                            })
                        }
                    });
                return f.sort(function(e, t) {
                    for (var r = 0, i = u.length; r < i; r++) {
                        var o = l(e.predicateValues[r], t.predicateValues[r]);
                        if (o) return o * u[r].descending * c
                    }
                    return (l(e.tieBreaker, t.tieBreaker) || n(e.tieBreaker, t.tieBreaker)) * c
                }), i = f.map(function(e) {
                    return e.value
                })
            };

            function t(e) {
                switch (void 0 === e ? "undefined" : v(e)) {
                    case "number":
                    case "boolean":
                    case "string":
                        return !0;
                    default:
                        return !1
                }
            }

            function n(e, t) {
                var n = 0,
                    r = e.type,
                    i = t.type;
                if (r === i) {
                    var o = e.value,
                        a = t.value;
                    "string" === r ? (o = o.toLowerCase(), a = a.toLowerCase()) : "object" === r && (V(o) && (o = e.index), V(a) && (a = t.index)), o !== a && (n = o < a ? -1 : 1)
                } else n = "undefined" === r ? 1 : "undefined" === i ? -1 : "null" === r ? 1 : "null" === i || r < i ? -1 : 1;
                return n
            }
        }

        function rK(e) {
            return z(e) && (e = {
                link: e
            }), e.restrict = e.restrict || "AC", L(e)
        }
        rQ.$inject = ["$parse"];
        var rZ = L({
                restrict: "E",
                compile: function(e, t) {
                    if (!t.href && !t.xlinkHref) return function(e, t) {
                        if ("a" === t[0].nodeName.toLowerCase()) {
                            var n = "[object SVGAnimatedString]" === g.call(t.prop("href")) ? "xlink:href" : "href";
                            t.on("click", function(e) {
                                t.attr(n) || e.preventDefault()
                            })
                        }
                    }
                }
            }),
            rX = {};
        T(tv, function(e, t) {
            if ("multiple" !== e) {
                var n = t3("ng-" + t),
                    r = i;
                "checked" === e && (r = function(e, t, r) {
                    r.ngModel !== r[n] && i(e, 0, r)
                }), rX[n] = function() {
                    return {
                        restrict: "A",
                        priority: 100,
                        link: r
                    }
                }
            }

            function i(e, r, i) {
                e.$watch(i[n], function(e) {
                    i.$set(t, !!e)
                })
            }
        }), T(tg, function(e, t) {
            rX[t] = function() {
                return {
                    priority: 100,
                    link: function(e, n, r) {
                        if ("ngPattern" === t && "/" === r.ngPattern.charAt(0)) {
                            var i = r.ngPattern.match(u);
                            if (i) return void r.$set("ngPattern", new RegExp(i[1], i[2]))
                        }
                        e.$watch(r[t], function(e) {
                            r.$set(t, e)
                        })
                    }
                }
            }
        }), T(["src", "srcset", "href"], function(e) {
            var t = t3("ng-" + e);
            rX[t] = ["$sce", function(n) {
                return {
                    priority: 99,
                    link: function(r, o, a) {
                        var s = e,
                            u = e;
                        "href" === e && "[object SVGAnimatedString]" === g.call(o.prop("href")) && (u = "xlinkHref", a.$attr[u] = "xlink:href", s = null), a.$set(t, n.getTrustedMediaUrl(a[t])), a.$observe(t, function(t) {
                            t ? (a.$set(u, t), i && s && o.prop(s, a[u])) : "href" === e && a.$set(u, null)
                        })
                    }
                }
            }]
        });
        var r0 = {
                $addControl: N,
                $getControls: L([]),
                $$renameControl: function(e, t) {
                    e.$name = t
                },
                $removeControl: N,
                $setValidity: N,
                $setDirty: N,
                $setPristine: N,
                $setSubmitted: N,
                $$setSubmitted: N
            },
            r1 = "ng-pending",
            r2 = "ng-submitted";

        function r3(e, t, n, r, i) {
            this.$$controls = [], this.$error = {}, this.$$success = {}, this.$pending = void 0, this.$name = i(t.name || t.ngForm || "")(n), this.$dirty = !1, this.$pristine = !0, this.$valid = !0, this.$invalid = !1, this.$submitted = !1, this.$$parentForm = r0, this.$$element = e, this.$$animate = r, r9(this)
        }
        r3.$inject = ["$element", "$attrs", "$scope", "$animate", "$interpolate"], r3.prototype = {
            $rollbackViewValue: function() {
                T(this.$$controls, function(e) {
                    e.$rollbackViewValue()
                })
            },
            $commitViewValue: function() {
                T(this.$$controls, function(e) {
                    e.$commitViewValue()
                })
            },
            $addControl: function(e) {
                eN(e.$name, "input"), this.$$controls.push(e), e.$name && (this[e.$name] = e), e.$$parentForm = this
            },
            $getControls: function() {
                return eD(this.$$controls)
            },
            $$renameControl: function(e, t) {
                var n = e.$name;
                this[n] === e && delete this[n], this[t] = e, e.$name = t
            },
            $removeControl: function(e) {
                e.$name && this[e.$name] === e && delete this[e.$name], T(this.$pending, function(t, n) {
                    this.$setValidity(n, null, e)
                }, this), T(this.$error, function(t, n) {
                    this.$setValidity(n, null, e)
                }, this), T(this.$$success, function(t, n) {
                    this.$setValidity(n, null, e)
                }, this), ei(this.$$controls, e), e.$$parentForm = r0
            },
            $setDirty: function() {
                this.$$animate.removeClass(this.$$element, iW), this.$$animate.addClass(this.$$element, iJ), this.$dirty = !0, this.$pristine = !1, this.$$parentForm.$setDirty()
            },
            $setPristine: function() {
                this.$$animate.setClass(this.$$element, iW, iJ + " " + r2), this.$dirty = !1, this.$pristine = !0, this.$submitted = !1, T(this.$$controls, function(e) {
                    e.$setPristine()
                })
            },
            $setUntouched: function() {
                T(this.$$controls, function(e) {
                    e.$setUntouched()
                })
            },
            $setSubmitted: function() {
                for (var e = this; e.$$parentForm && e.$$parentForm !== r0;) e = e.$$parentForm;
                e.$$setSubmitted()
            },
            $$setSubmitted: function() {
                this.$$animate.addClass(this.$$element, r2), this.$submitted = !0, T(this.$$controls, function(e) {
                    e.$$setSubmitted && e.$$setSubmitted()
                })
            }
        }, r8({
            clazz: r3,
            set: function(e, t, n) {
                var r = e[t];
                r ? -1 === r.indexOf(n) && r.push(n) : e[t] = [n]
            },
            unset: function(e, t, n) {
                var r = e[t];
                r && (ei(r, n), 0 === r.length && delete e[t])
            }
        });
        var r4 = function(e) {
                return ["$timeout", "$parse", function(t, n) {
                    return {
                        name: "form",
                        restrict: e ? "EAC" : "E",
                        require: ["form", "^^?form"],
                        controller: r3,
                        compile: function(n, i) {
                            n.addClass(iW).addClass(iG);
                            var o = i.name ? "name" : !(!e || !i.ngForm) && "ngForm";
                            return {
                                pre: function(e, n, i, a) {
                                    var s = a[0];
                                    if (!("action" in i)) {
                                        var u = function(t) {
                                            e.$apply(function() {
                                                s.$commitViewValue(), s.$setSubmitted()
                                            }), t.preventDefault()
                                        };
                                        n[0].addEventListener("submit", u), n.on("$destroy", function() {
                                            t(function() {
                                                n[0].removeEventListener("submit", u)
                                            }, 0, !1)
                                        })
                                    }(a[1] || s.$$parentForm).$addControl(s);
                                    var c = o ? r(s.$name) : N;
                                    o && (c(e, s), i.$observe(o, function(t) {
                                        s.$name !== t && (c(e, void 0), s.$$parentForm.$$renameControl(s, t), (c = r(s.$name))(e, s))
                                    })), n.on("$destroy", function() {
                                        s.$$parentForm.$removeControl(s), c(e, void 0), C(s, r0)
                                    })
                                }
                            }
                        }
                    };

                    function r(e) {
                        return "" === e ? n('this[""]').assign : n(e).assign || N
                    }
                }]
            },
            r5 = r4(),
            r6 = r4(!0);

        function r9(e) {
            e.$$classCache = {}, e.$$classCache[iz] = !(e.$$classCache[iG] = e.$$element.hasClass(iG))
        }

        function r8(e) {
            var t = e.clazz,
                n = e.set,
                r = e.unset;

            function i(e, t, n) {
                n && !e.$$classCache[t] ? (e.$$animate.addClass(e.$$element, t), e.$$classCache[t] = !0) : !n && e.$$classCache[t] && (e.$$animate.removeClass(e.$$element, t), e.$$classCache[t] = !1)
            }

            function o(e, t, n) {
                i(e, iG + (t = t ? "-" + eC(t, "-") : ""), !0 === n), i(e, iz + t, !1 === n)
            }
            t.prototype.$setValidity = function(e, t, a) {
                var s, u, c;
                _(t) ? (this[u = "$pending"] || (this[u] = {}), n(this[u], e, a)) : (this[c = "$pending"] && r(this[c], e, a), r7(this[c]) && (this[c] = void 0)), Q(t) ? t ? (r(this.$error, e, a), n(this.$$success, e, a)) : (n(this.$error, e, a), r(this.$$success, e, a)) : (r(this.$error, e, a), r(this.$$success, e, a)), this.$pending ? (i(this, r1, !0), this.$valid = this.$invalid = void 0, o(this, "", null)) : (i(this, r1, !1), this.$valid = r7(this.$error), this.$invalid = !this.$valid, o(this, "", this.$valid)), o(this, e, s = this.$pending && this.$pending[e] ? void 0 : !this.$error[e] && (!!this.$$success[e] || null)), this.$$parentForm.$setValidity(e, s, this)
            }
        }

        function r7(e) {
            if (e) {
                for (var t in e)
                    if (e.hasOwnProperty(t)) return !1
            }
            return !0
        }
        var ie = /^\d{4,}-[01]\d-[0-3]\dT[0-2]\d:[0-5]\d:[0-5]\d\.\d+(?:[+-][0-2]\d:[0-5]\d|Z)$/,
            it = /^[a-z][a-z\d.+-]*:\/*(?:[^:@]+(?::[^@]+)?@)?(?:[^\s:/?#]+|\[[a-f\d:]+])(?::\d+)?(?:\/[^?#]*)?(?:\?[^#]*)?(?:#.*)?$/i,
            ir = /^(?=.{1,254}$)(?=.{1,64}@)[-!#$%&'*+/0-9=?A-Z^_`a-z{|}~]+(\.[-!#$%&'*+/0-9=?A-Z^_`a-z{|}~]+)*@[A-Za-z0-9]([A-Za-z0-9-]{0,61}[A-Za-z0-9])?(\.[A-Za-z0-9]([A-Za-z0-9-]{0,61}[A-Za-z0-9])?)*$/,
            ii = /^\s*(-|\+)?(\d+|(\d*(\.\d*)))([eE][+-]?\d+)?\s*$/,
            io = /^(\d{4,})-(\d{2})-(\d{2})$/,
            ia = /^(\d{4,})-(\d\d)-(\d\d)T(\d\d):(\d\d)(?::(\d\d)(\.\d{1,3})?)?$/,
            is = /^(\d{4,})-W(\d\d)$/,
            iu = /^(\d{4,})-(\d\d)$/,
            ic = /^(\d\d):(\d\d)(?::(\d\d)(\.\d{1,3})?)?$/,
            il = eL();
        T("date,datetime-local,month,time,week".split(","), function(e) {
            il[e] = !0
        });
        var ip = {
            text: function(e, t, n, r, i, o) {
                ih(e, t, n, r, i, o), id(r)
            },
            date: iv("date", io, i$(io, ["yyyy", "MM", "dd"]), "yyyy-MM-dd"),
            "datetime-local": iv("datetimelocal", ia, i$(ia, ["yyyy", "MM", "dd", "HH", "mm", "ss", "sss"]), "yyyy-MM-ddTHH:mm:ss.sss"),
            time: iv("time", ic, i$(ic, ["HH", "mm", "ss", "sss"]), "HH:mm:ss.sss"),
            week: iv("week", is, function(e, t) {
                if (B(e)) return e;
                if (j(e)) {
                    is.lastIndex = 0;
                    var n = is.exec(e);
                    if (n) {
                        var r = +n[1],
                            i = +n[2],
                            o = 0,
                            a = 0,
                            s = 0,
                            u = 0,
                            c = rD(r);
                        return t && (o = t.getHours(), a = t.getMinutes(), s = t.getSeconds(), u = t.getMilliseconds()), new Date(r, 0, c.getDate() + 7 * (i - 1), o, a, s, u)
                    }
                }
                return NaN
            }, "yyyy-Www"),
            month: iv("month", iu, i$(iu, ["yyyy", "MM"]), "yyyy-MM"),
            number: function(e, t, n, r, i, o, a, s) {
                var u;
                if (im(e, t, n, r, "number"), ig(r), ih(e, t, n, r, i, o), D(n.min) || n.ngMin) {
                    var c = n.min || s(n.ngMin)(e);
                    u = iy(c), r.$validators.min = function(e, t) {
                        return r.$isEmpty(t) || _(u) || t >= u
                    }, n.$observe("min", function(e) {
                        e !== c && (u = iy(e), c = e, r.$validate())
                    })
                }
                if (D(n.max) || n.ngMax) {
                    var l = n.max || s(n.ngMax)(e),
                        f = iy(l);
                    r.$validators.max = function(e, t) {
                        return r.$isEmpty(t) || _(f) || t <= f
                    }, n.$observe("max", function(e) {
                        e !== l && (f = iy(e), l = e, r.$validate())
                    })
                }
                if (D(n.step) || n.ngStep) {
                    var p = n.step || s(n.ngStep)(e),
                        d = iy(p);
                    r.$validators.step = function(e, t) {
                        return r.$isEmpty(t) || _(d) || iw(t, u || 0, d)
                    }, n.$observe("step", function(e) {
                        e !== p && (d = iy(e), p = e, r.$validate())
                    })
                }
            },
            url: function(e, t, n, r, i, o) {
                ih(e, t, n, r, i, o), id(r), r.$validators.url = function(e, t) {
                    var n = e || t;
                    return r.$isEmpty(n) || it.test(n)
                }
            },
            email: function(e, t, n, r, i, o) {
                ih(e, t, n, r, i, o), id(r), r.$validators.email = function(e, t) {
                    var n = e || t;
                    return r.$isEmpty(n) || ir.test(n)
                }
            },
            radio: function(e, t, n, r) {
                var i = !n.ngTrim || "false" !== X(n.ngTrim);
                _(n.name) && t.attr("name", ++E), t.on("change", function(e) {
                    var o;
                    t[0].checked && (o = n.value, i && (o = X(o)), r.$setViewValue(o, e && e.type))
                }), r.$render = function() {
                    var e = n.value;
                    i && (e = X(e)), t[0].checked = e === r.$viewValue
                }, n.$observe("value", r.$render)
            },
            range: function(e, t, n, r, i, o) {
                im(e, t, n, r, "range"), ig(r), ih(e, t, n, r, i, o);
                var a = r.$$hasNativeValidators && "range" === t[0].type,
                    s = a ? 0 : void 0,
                    u = a ? 100 : void 0,
                    c = a ? 1 : void 0,
                    l = t[0].validity,
                    f = D(n.min),
                    p = D(n.max),
                    d = D(n.step),
                    h = r.$render;

                function $(e, r) {
                    t.attr(e, n[e]);
                    var i = n[e];
                    n.$observe(e, function(e) {
                        e !== i && (i = e, r(e))
                    })
                }
                r.$render = a && D(l.rangeUnderflow) && D(l.rangeOverflow) ? function() {
                    h(), r.$setViewValue(t.val())
                } : h, f && (s = iy(n.min), r.$validators.min = a ? function() {
                    return !0
                } : function(e, t) {
                    return r.$isEmpty(t) || _(s) || t >= s
                }, $("min", function(e) {
                    if (s = iy(e), !I(r.$modelValue))
                        if (a) {
                            var n = t.val();
                            s > n && (n = s, t.val(n)), r.$setViewValue(n)
                        } else r.$validate()
                })), p && (u = iy(n.max), r.$validators.max = a ? function() {
                    return !0
                } : function(e, t) {
                    return r.$isEmpty(t) || _(u) || t <= u
                }, $("max", function(e) {
                    if (u = iy(e), !I(r.$modelValue))
                        if (a) {
                            var n = t.val();
                            u < n && (t.val(u), n = u < s ? s : u), r.$setViewValue(n)
                        } else r.$validate()
                })), d && (c = iy(n.step), r.$validators.step = a ? function() {
                    return !l.stepMismatch
                } : function(e, t) {
                    return r.$isEmpty(t) || _(c) || iw(t, s || 0, c)
                }, $("step", function(e) {
                    c = iy(e), I(r.$modelValue) || (a ? r.$viewValue !== t.val() && r.$setViewValue(t.val()) : r.$validate())
                }))
            },
            checkbox: function(e, t, n, r, i, o, a, s) {
                var u = iE(s, e, "ngTrueValue", n.ngTrueValue, !0),
                    c = iE(s, e, "ngFalseValue", n.ngFalseValue, !1);
                t.on("change", function(e) {
                    r.$setViewValue(t[0].checked, e && e.type)
                }), r.$render = function() {
                    t[0].checked = r.$viewValue
                }, r.$isEmpty = function(e) {
                    return !1 === e
                }, r.$formatters.push(function(e) {
                    return es(e, u)
                }), r.$parsers.push(function(e) {
                    return e ? u : c
                })
            },
            hidden: N,
            button: N,
            submit: N,
            reset: N,
            file: N
        };

        function id(e) {
            e.$formatters.push(function(t) {
                return e.$isEmpty(t) ? t : t.toString()
            })
        }

        function ih(e, t, n, r, i, o) {
            var a, s = f(t[0].type);
            if (!i.android) {
                var u = !1;
                t.on("compositionstart", function() {
                    u = !0
                }), t.on("compositionupdate", function(e) {
                    (_(e.data) || "" === e.data) && (u = !1)
                }), t.on("compositionend", function() {
                    u = !1, l()
                })
            }
            var l = function(e) {
                if (a && (o.defer.cancel(a), a = null), !u) {
                    var i = t.val(),
                        c = e && e.type;
                    "password" === s || n.ngTrim && "false" === n.ngTrim || (i = X(i)), (r.$viewValue !== i || "" === i && r.$$hasNativeValidators) && r.$setViewValue(i, c)
                }
            };
            if (i.hasEvent("input")) t.on("input", l);
            else {
                var p = function(e, t, n) {
                    a || (a = o.defer(function() {
                        a = null, t && t.value === n || l(e)
                    }))
                };
                t.on("keydown", function(e) {
                    var t = e.keyCode;
                    91 === t || 15 < t && t < 19 || 37 <= t && t <= 40 || p(e, this, this.value)
                }), i.hasEvent("paste") && t.on("paste cut drop", p)
            }
            t.on("change", l), il[s] && r.$$hasNativeValidators && s === n.type && t.on("keydown wheel mousedown", function(e) {
                if (!a) {
                    var t = this[c],
                        n = t.badInput,
                        r = t.typeMismatch;
                    a = o.defer(function() {
                        a = null, t.badInput === n && t.typeMismatch === r || l(e)
                    })
                }
            }), r.$render = function() {
                var e = r.$isEmpty(r.$viewValue) ? "" : r.$viewValue;
                t.val() !== e && t.val(e)
            }
        }

        function i$(e, t) {
            return function(n, r) {
                var i, o;
                if (B(n)) return n;
                if (j(n)) {
                    if ('"' === n.charAt(0) && '"' === n.charAt(n.length - 1) && (n = n.substring(1, n.length - 1)), ie.test(n)) return new Date(n);
                    if (e.lastIndex = 0, i = e.exec(n)) {
                        i.shift(), o = r ? {
                            yyyy: r.getFullYear(),
                            MM: r.getMonth() + 1,
                            dd: r.getDate(),
                            HH: r.getHours(),
                            mm: r.getMinutes(),
                            ss: r.getSeconds(),
                            sss: r.getMilliseconds() / 1e3
                        } : {
                            yyyy: 1970,
                            MM: 1,
                            dd: 1,
                            HH: 0,
                            mm: 0,
                            ss: 0,
                            sss: 0
                        }, T(i, function(e, n) {
                            n < t.length && (o[t[n]] = +e)
                        });
                        var a = new Date(o.yyyy, o.MM - 1, o.dd, o.HH, o.mm, o.ss || 0, 1e3 * o.sss || 0);
                        return o.yyyy < 100 && a.setFullYear(o.yyyy), a
                    }
                }
                return NaN
            }
        }

        function iv(e, t, n, r) {
            return function(i, o, a, s, u, c, l, f) {
                im(i, o, a, s, e), ih(0, o, a, s, u, c);
                var p, d, h = "time" === e || "datetimelocal" === e;
                if (s.$parsers.push(function(n) {
                        return s.$isEmpty(n) ? null : t.test(n) ? w(n, p) : void(s.$$parserName = e)
                    }), s.$formatters.push(function(e) {
                        if (e && !B(e)) throw iX("datefmt", "Expected `{0}` to be a date", e);
                        if (y(e)) {
                            p = e;
                            var t, n, i = s.$options.getOption("timezone");
                            return i && (d = i, p = ey(p, i, !0)), t = r, h && j(s.$options.getOption("timeSecondsFormat")) && (t = r.replace("ss.sss", s.$options.getOption("timeSecondsFormat")).replace(/:$/, "")), n = l("date")(e, t, i), h && s.$options.getOption("timeStripZeroSeconds") && (n = n.replace(/(?::00)?(?:\.000)?$/, "")), n
                        }
                        return p = null, d = null, ""
                    }), D(a.min) || a.ngMin) {
                    var $ = a.min || f(a.ngMin)(i),
                        v = b($);
                    s.$validators.min = function(e) {
                        return !y(e) || _(v) || n(e) >= v
                    }, a.$observe("min", function(e) {
                        e !== $ && (v = b(e), $ = e, s.$validate())
                    })
                }
                if (D(a.max) || a.ngMax) {
                    var m = a.max || f(a.ngMax)(i),
                        g = b(m);
                    s.$validators.max = function(e) {
                        return !y(e) || _(g) || n(e) <= g
                    }, a.$observe("max", function(e) {
                        e !== m && (g = b(e), m = e, s.$validate())
                    })
                }

                function y(e) {
                    return e && !(e.getTime && e.getTime() != e.getTime())
                }

                function b(e) {
                    return D(e) && !B(e) ? w(e) || void 0 : e
                }

                function w(e, t) {
                    var r = s.$options.getOption("timezone");
                    d && d !== r && (t = eg(t, em(d)));
                    var i = n(e, t);
                    return !isNaN(i) && r && (i = ey(i, r)), i
                }
            }
        }

        function im(e, t, n, r, i) {
            (r.$$hasNativeValidators = V(t[0].validity)) && r.$parsers.push(function(e) {
                var n = t.prop(c) || {};
                if (!n.badInput && !n.typeMismatch) return e;
                r.$$parserName = i
            })
        }

        function ig(e) {
            e.$parsers.push(function(t) {
                return e.$isEmpty(t) ? null : ii.test(t) ? parseFloat(t) : void(e.$$parserName = "number")
            }), e.$formatters.push(function(t) {
                if (!e.$isEmpty(t)) {
                    if (!q(t)) throw iX("numfmt", "Expected `{0}` to be a number", t);
                    t = t.toString()
                }
                return t
            })
        }

        function iy(e) {
            return D(e) && !q(e) && (e = parseFloat(e)), I(e) ? void 0 : e
        }

        function ib(e) {
            var t = e.toString(),
                n = t.indexOf(".");
            if (-1 === n) {
                if (-1 < e && e < 1) {
                    var r = /e-(\d+)$/.exec(t);
                    if (r) return Number(r[1])
                }
                return 0
            }
            return t.length - n - 1
        }

        function iw(e, t, n) {
            var r, i, o, a = Number(e),
                s = (0 | (r = a)) !== r,
                u = (0 | (i = t)) !== i,
                c = (0 | (o = n)) !== o;
            if (s || u || c) {
                var l = Math.pow(10, Math.max(s ? ib(a) : 0, u ? ib(t) : 0, c ? ib(n) : 0));
                a *= l, t *= l, n *= l, s && (a = Math.round(a)), u && (t = Math.round(t)), c && (n = Math.round(n))
            }
            return (a - t) % n == 0
        }

        function iE(e, t, n, r, i) {
            var o;
            if (D(r)) {
                if (!(o = e(r)).constant) throw iX("constexpr", "Expected constant expression for `{0}`, but saw `{1}`.", n, r);
                return o(t)
            }
            return i
        }
        var iS = ["$browser", "$sniffer", "$filter", "$parse", function(e, t, n, r) {
                return {
                    restrict: "E",
                    require: ["?ngModel"],
                    link: {
                        pre: function(i, o, a, s) {
                            s[0] && (ip[f(a.type)] || ip.text)(i, o, a, s[0], t, e, n, r)
                        }
                    }
                }
            }],
            iT = function() {
                var e = {
                    configurable: !0,
                    enumerable: !1,
                    get: function() {
                        return this.getAttribute("value") || ""
                    },
                    set: function(e) {
                        this.setAttribute("value", e)
                    }
                };
                return {
                    restrict: "E",
                    priority: 200,
                    compile: function(t, n) {
                        if ("hidden" === f(n.type)) return {
                            pre: function(t, n, r, i) {
                                var o = n[0];
                                o.parentNode && o.parentNode.insertBefore(o, o.nextSibling), Object.defineProperty && Object.defineProperty(o, "value", e)
                            }
                        }
                    }
                }
            },
            iO = /^(true|false|\d+)$/,
            ix = function() {
                function e(e, t, n) {
                    var r = D(n) ? n : 9 === i ? "" : null;
                    e.prop("value", r), t.$set("value", n)
                }
                return {
                    restrict: "A",
                    priority: 100,
                    compile: function(t, n) {
                        return iO.test(n.ngValue) ? function(t, n, r) {
                            e(n, r, t.$eval(r.ngValue))
                        } : function(t, n, r) {
                            t.$watch(r.ngValue, function(t) {
                                e(n, r, t)
                            })
                        }
                    }
                }
            },
            iA = ["$compile", function(e) {
                return {
                    restrict: "AC",
                    compile: function(t) {
                        return e.$$addBindingClass(t),
                            function(t, n, r) {
                                e.$$addBindingInfo(n, r.ngBind), n = n[0], t.$watch(r.ngBind, function(e) {
                                    n.textContent = eU(e)
                                })
                            }
                    }
                }
            }],
            iR = ["$interpolate", "$compile", function(e, t) {
                return {
                    compile: function(n) {
                        return t.$$addBindingClass(n),
                            function(n, r, i) {
                                var o = e(r.attr(i.$attr.ngBindTemplate));
                                t.$$addBindingInfo(r, o.expressions), r = r[0], i.$observe("ngBindTemplate", function(e) {
                                    r.textContent = _(e) ? "" : e
                                })
                            }
                    }
                }
            }],
            iC = ["$sce", "$parse", "$compile", function(e, t, n) {
                return {
                    restrict: "A",
                    compile: function(r, i) {
                        var o = t(i.ngBindHtml),
                            a = t(i.ngBindHtml, function(t) {
                                return e.valueOf(t)
                            });
                        return n.$$addBindingClass(r),
                            function(t, r, i) {
                                n.$$addBindingInfo(r, i.ngBindHtml), t.$watch(a, function() {
                                    var n = o(t);
                                    r.html(e.getTrustedHtml(n) || "")
                                })
                            }
                    }
                }
            }],
            iP = L({
                restrict: "A",
                require: "ngModel",
                link: function(e, t, n, r) {
                    r.$viewChangeListeners.push(function() {
                        e.$eval(n.ngChange)
                    })
                }
            });

        function iI(e, t) {
            var n;
            return e = "ngClass" + e, ["$parse", function(a) {
                return {
                    restrict: "AC",
                    link: function(s, u, c) {
                        var l, f = u.data("$classCounts"),
                            p = !0;

                        function d(e, t) {
                            var n = [];
                            return T(e, function(e) {
                                (t > 0 || f[e]) && (f[e] = (f[e] || 0) + t, f[e] === +(t > 0) && n.push(e))
                            }), n.join(" ")
                        }
                        f || (f = eL(), u.data("$classCounts", f)), "ngClass" !== e && (n || (n = a("$index", function(e) {
                            return 1 & e
                        })), s.$watch(n, function(e) {
                            var n, r;
                            e === t ? (n = d(i(n = l), 1), c.$addClass(n)) : (r = d(i(r = l), -1), c.$removeClass(r)), p = e
                        })), s.$watch(a(c[e], o), function(e) {
                            var n, o, a, s, u, f;
                            p === t && (a = r(n = i(l), o = i(e)), s = r(o, n), u = d(a, -1), f = d(s, 1), c.$addClass(f), c.$removeClass(u)), l = e
                        })
                    }
                }
            }];

            function r(e, t) {
                if (!e || !e.length) return [];
                if (!t || !t.length) return e;
                var n = [];
                e: for (var r = 0; r < e.length; r++) {
                    for (var i = e[r], o = 0; o < t.length; o++)
                        if (i === t[o]) continue e;
                    n.push(i)
                }
                return n
            }

            function i(e) {
                return e && e.split(" ")
            }

            function o(e) {
                if (!e) return e;
                var t = e;
                return H(e) ? t = e.map(o).join(" ") : V(e) ? t = Object.keys(e).filter(function(t) {
                    return e[t]
                }).join(" ") : j(e) || (t = e + ""), t
            }
        }
        var iM = iI("", !0),
            iN = iI("Odd", 0),
            ik = iI("Even", 1),
            iL = rK({
                compile: function(e, t) {
                    t.$set("ngCloak", void 0), e.removeClass("ng-cloak")
                }
            }),
            iU = [function() {
                return {
                    restrict: "A",
                    scope: !0,
                    controller: "@",
                    priority: 500
                }
            }],
            i_ = {},
            iD = {
                blur: !0,
                focus: !0
            };

        function iV(e, t, n, r, i, o) {
            return {
                restrict: "A",
                compile: function(a, s) {
                    var u = e(s[r]);
                    return function(e, r) {
                        r.on(i, function(r) {
                            var i = function() {
                                u(e, {
                                    $event: r
                                })
                            };
                            if (t.$$phase)
                                if (o) e.$evalAsync(i);
                                else try {
                                    i()
                                } catch (e) {
                                    n(e)
                                } else e.$apply(i)
                        })
                    }
                }
            }
        }
        T("click dblclick mousedown mouseup mouseover mouseout mousemove mouseenter mouseleave keydown keyup keypress submit focus blur copy cut paste".split(" "), function(e) {
            var t = t3("ng-" + e);
            i_[t] = ["$parse", "$rootScope", "$exceptionHandler", function(n, r, i) {
                return iV(n, r, i, t, e, iD[e])
            }]
        });
        var iF = ["$animate", "$compile", function(e, t) {
                return {
                    multiElement: !0,
                    transclude: "element",
                    priority: 600,
                    terminal: !0,
                    restrict: "A",
                    $$tlb: !0,
                    link: function(n, r, i, o, a) {
                        var s, u, c;
                        n.$watch(i.ngIf, function(n) {
                            n ? u || a(function(n, o) {
                                u = o, n[n.length++] = t.$$createComment("end ngIf", i.ngIf), s = {
                                    clone: n
                                }, e.enter(n, r.parent(), r)
                            }) : (c && (c.remove(), c = null), u && (u.$destroy(), u = null), s && (c = ek(s.clone), e.leave(c).done(function(e) {
                                !1 !== e && (c = null)
                            }), s = null))
                        })
                    }
                }
            }],
            ij = ["$templateRequest", "$anchorScroll", "$animate", function(e, t, n) {
                return {
                    restrict: "ECA",
                    priority: 400,
                    terminal: !0,
                    transclude: "element",
                    controller: w.noop,
                    compile: function(r, i) {
                        var o = i.ngInclude || i.src,
                            a = i.onload || "",
                            s = i.autoscroll;
                        return function(r, i, u, c, l) {
                            var f, p, d, h = 0,
                                $ = function() {
                                    p && (p.remove(), p = null), f && (f.$destroy(), f = null), d && (n.leave(d).done(function(e) {
                                        !1 !== e && (p = null)
                                    }), p = d, d = null)
                                };
                            r.$watch(o, function(o) {
                                var u = function(e) {
                                        !1 !== e && D(s) && (!s || r.$eval(s)) && t()
                                    },
                                    p = ++h;
                                o ? (e(o, !0).then(function(e) {
                                    if (!r.$$destroyed && p === h) {
                                        var t = r.$new();
                                        c.template = e, d = l(t, function(e) {
                                            $(), n.enter(e, null, i).done(u)
                                        }), (f = t).$emit("$includeContentLoaded", o), r.$eval(a)
                                    }
                                }, function() {
                                    r.$$destroyed || p === h && ($(), r.$emit("$includeContentError", o))
                                }), r.$emit("$includeContentRequested", o)) : ($(), c.template = null)
                            })
                        }
                    }
                }
            }],
            iq = ["$compile", function(t) {
                return {
                    restrict: "ECA",
                    priority: -400,
                    require: "ngInclude",
                    link: function(n, r, i, o) {
                        g.call(r[0]).match(/SVG/) ? (r.empty(), t(e5(o.template, e.document).childNodes)(n, function(e) {
                            r.append(e)
                        }, {
                            futureParentElement: r
                        })) : (r.html(o.template), t(r.contents())(n))
                    }
                }
            }],
            iB = rK({
                priority: 450,
                compile: function() {
                    return {
                        pre: function(e, t, n) {
                            e.$eval(n.ngInit)
                        }
                    }
                }
            }),
            iH = function() {
                return {
                    restrict: "A",
                    priority: 100,
                    require: "ngModel",
                    link: function(e, t, n, r) {
                        var i = n.ngList || ", ",
                            o = "false" !== n.ngTrim,
                            a = o ? X(i) : i;
                        r.$parsers.push(function(e) {
                            if (!_(e)) {
                                var t = [];
                                return e && T(e.split(a), function(e) {
                                    e && t.push(o ? X(e) : e)
                                }), t
                            }
                        }), r.$formatters.push(function(e) {
                            if (H(e)) return e.join(i)
                        }), r.$isEmpty = function(e) {
                            return !e || !e.length
                        }
                    }
                }
            },
            iG = "ng-valid",
            iz = "ng-invalid",
            iW = "ng-pristine",
            iJ = "ng-dirty",
            iY = "ng-untouched",
            iQ = "ng-touched",
            iK = "ng-empty",
            iZ = "ng-not-empty",
            iX = r("ngModel");

        function i0(e, t, n, r, i, o, a, s, u) {
            var c;
            this.$viewValue = NaN, this.$modelValue = NaN, this.$$rawModelValue = void 0, this.$validators = {}, this.$asyncValidators = {}, this.$parsers = [], this.$formatters = [], this.$viewChangeListeners = [], this.$untouched = !0, this.$touched = !1, this.$pristine = !0, this.$dirty = !1, this.$valid = !0, this.$invalid = !1, this.$error = {}, this.$$success = {}, this.$pending = void 0, this.$name = u(n.name || "", !1)(e), this.$$parentForm = r0, this.$options = i1, this.$$updateEvents = "", this.$$updateEventHandler = this.$$updateEventHandler.bind(this), this.$$parsedNgModel = i(n.ngModel), this.$$parsedNgModelAssign = this.$$parsedNgModel.assign, this.$$ngModelGet = this.$$parsedNgModel, this.$$ngModelSet = this.$$parsedNgModelAssign, this.$$pendingDebounce = null, this.$$parserValid = void 0, this.$$parserName = "parse", this.$$currentValidationRunId = 0, this.$$scope = e, this.$$rootScope = e.$root, this.$$attr = n, this.$$element = r, this.$$animate = o, this.$$timeout = a, this.$$parse = i, this.$$q = s, this.$$exceptionHandler = t, r9(this), (c = this).$$scope.$watch(function(e) {
                var t = c.$$ngModelGet(e);
                return t === c.$modelValue || c.$modelValue != c.$modelValue && t != t || c.$$setModelValue(t), t
            })
        }
        i0.$inject = ["$scope", "$exceptionHandler", "$attrs", "$element", "$parse", "$animate", "$timeout", "$q", "$interpolate"], i0.prototype = {
            $$initGetterSetters: function() {
                if (this.$options.getOption("getterSetter")) {
                    var e = this.$$parse(this.$$attr.ngModel + "()"),
                        t = this.$$parse(this.$$attr.ngModel + "($$$p)");
                    this.$$ngModelGet = function(t) {
                        var n = this.$$parsedNgModel(t);
                        return z(n) && (n = e(t)), n
                    }, this.$$ngModelSet = function(e, n) {
                        z(this.$$parsedNgModel(e)) ? t(e, {
                            $$$p: n
                        }) : this.$$parsedNgModelAssign(e, n)
                    }
                } else if (!this.$$parsedNgModel.assign) throw iX("nonassign", "Expression '{0}' is non-assignable. Element: {1}", this.$$attr.ngModel, eb(this.$$element))
            },
            $render: N,
            $isEmpty: function(e) {
                return _(e) || "" === e || null === e || e != e
            },
            $$updateEmptyClasses: function(e) {
                this.$isEmpty(e) ? (this.$$animate.removeClass(this.$$element, iZ), this.$$animate.addClass(this.$$element, iK)) : (this.$$animate.removeClass(this.$$element, iK), this.$$animate.addClass(this.$$element, iZ))
            },
            $setPristine: function() {
                this.$dirty = !1, this.$pristine = !0, this.$$animate.removeClass(this.$$element, iJ), this.$$animate.addClass(this.$$element, iW)
            },
            $setDirty: function() {
                this.$dirty = !0, this.$pristine = !1, this.$$animate.removeClass(this.$$element, iW), this.$$animate.addClass(this.$$element, iJ), this.$$parentForm.$setDirty()
            },
            $setUntouched: function() {
                this.$touched = !1, this.$untouched = !0, this.$$animate.setClass(this.$$element, iY, iQ)
            },
            $setTouched: function() {
                this.$touched = !0, this.$untouched = !1, this.$$animate.setClass(this.$$element, iQ, iY)
            },
            $rollbackViewValue: function() {
                this.$$timeout.cancel(this.$$pendingDebounce), this.$viewValue = this.$$lastCommittedViewValue, this.$render()
            },
            $validate: function() {
                if (!I(this.$modelValue)) {
                    var e = this.$$lastCommittedViewValue,
                        t = this.$$rawModelValue,
                        n = this.$valid,
                        r = this.$modelValue,
                        i = this.$options.getOption("allowInvalid"),
                        o = this;
                    this.$$runValidators(t, e, function(e) {
                        i || n === e || (o.$modelValue = e ? t : void 0, o.$modelValue !== r && o.$$writeModelToScope())
                    })
                }
            },
            $$runValidators: function(e, t, n) {
                this.$$currentValidationRunId++;
                var r, i, o, a, s = this.$$currentValidationRunId,
                    u = this;

                function c(e, t) {
                    s === u.$$currentValidationRunId && u.$setValidity(e, t)
                }

                function l(e) {
                    s === u.$$currentValidationRunId && n(e)
                }(r = u.$$parserName, _(u.$$parserValid) ? (c(r, null), !0) : (u.$$parserValid || (T(u.$validators, function(e, t) {
                    c(t, null)
                }), T(u.$asyncValidators, function(e, t) {
                    c(t, null)
                })), c(r, u.$$parserValid), u.$$parserValid)) ? (i = !0, T(u.$validators, function(n, r) {
                    var o = !!n(e, t);
                    i = i && o, c(r, o)
                }), !i && (T(u.$asyncValidators, function(e, t) {
                    c(t, null)
                }), 1)) ? l(!1): (o = [], a = !0, T(u.$asyncValidators, function(n, r) {
                    var i = n(e, t);
                    if (!K(i)) throw iX("nopromise", "Expected asynchronous validator to return a promise but got '{0}' instead.", i);
                    c(r, void 0), o.push(i.then(function() {
                        c(r, !0)
                    }, function() {
                        a = !1, c(r, !1)
                    }))
                }), o.length ? u.$$q.all(o).then(function() {
                    l(a)
                }, N) : l(!0)): l(!1)
            },
            $commitViewValue: function() {
                var e = this.$viewValue;
                this.$$timeout.cancel(this.$$pendingDebounce), (this.$$lastCommittedViewValue !== e || "" === e && this.$$hasNativeValidators) && (this.$$updateEmptyClasses(e), this.$$lastCommittedViewValue = e, this.$pristine && this.$setDirty(), this.$$parseAndValidate())
            },
            $$parseAndValidate: function() {
                var e = this.$$lastCommittedViewValue,
                    t = this;
                if (this.$$parserValid = !_(e) || void 0, this.$setValidity(this.$$parserName, null), this.$$parserName = "parse", this.$$parserValid) {
                    for (var n = 0; n < this.$parsers.length; n++)
                        if (_(e = this.$parsers[n](e))) {
                            this.$$parserValid = !1;
                            break
                        }
                }
                I(this.$modelValue) && (this.$modelValue = this.$$ngModelGet(this.$$scope));
                var r = this.$modelValue,
                    i = this.$options.getOption("allowInvalid");

                function o() {
                    t.$modelValue !== r && t.$$writeModelToScope()
                }
                this.$$rawModelValue = e, i && (this.$modelValue = e, o()), this.$$runValidators(e, this.$$lastCommittedViewValue, function(n) {
                    i || (t.$modelValue = n ? e : void 0, o())
                })
            },
            $$writeModelToScope: function() {
                this.$$ngModelSet(this.$$scope, this.$modelValue), T(this.$viewChangeListeners, function(e) {
                    try {
                        e()
                    } catch (e) {
                        this.$$exceptionHandler(e)
                    }
                }, this)
            },
            $setViewValue: function(e, t) {
                this.$viewValue = e, this.$options.getOption("updateOnDefault") && this.$$debounceViewValueCommit(t)
            },
            $$debounceViewValueCommit: function(e) {
                var t = this.$options.getOption("debounce");
                q(t[e]) ? t = t[e] : q(t.default) && -1 === this.$options.getOption("updateOn").indexOf(e) ? t = t.default : q(t["*"]) && (t = t["*"]), this.$$timeout.cancel(this.$$pendingDebounce);
                var n = this;
                t > 0 ? this.$$pendingDebounce = this.$$timeout(function() {
                    n.$commitViewValue()
                }, t) : this.$$rootScope.$$phase ? this.$commitViewValue() : this.$$scope.$apply(function() {
                    n.$commitViewValue()
                })
            },
            $overrideModelOptions: function(e) {
                this.$options = this.$options.createChild(e), this.$$setUpdateOnEvents()
            },
            $processModelValue: function() {
                var e = this.$$format();
                this.$viewValue !== e && (this.$$updateEmptyClasses(e), this.$viewValue = this.$$lastCommittedViewValue = e, this.$render(), this.$$runValidators(this.$modelValue, this.$viewValue, N))
            },
            $$format: function() {
                for (var e = this.$formatters, t = e.length, n = this.$modelValue; t--;) n = e[t](n);
                return n
            },
            $$setModelValue: function(e) {
                this.$modelValue = this.$$rawModelValue = e, this.$$parserValid = void 0, this.$processModelValue()
            },
            $$setUpdateOnEvents: function() {
                this.$$updateEvents && this.$$element.off(this.$$updateEvents, this.$$updateEventHandler), this.$$updateEvents = this.$options.getOption("updateOn"), this.$$updateEvents && this.$$element.on(this.$$updateEvents, this.$$updateEventHandler)
            },
            $$updateEventHandler: function(e) {
                this.$$debounceViewValueCommit(e && e.type)
            }
        }, r8({
            clazz: i0,
            set: function(e, t) {
                e[t] = !0
            },
            unset: function(e, t) {
                delete e[t]
            }
        });
        var i1, i2 = ["$rootScope", function(e) {
                return {
                    restrict: "A",
                    require: ["ngModel", "^?form", "^?ngModelOptions"],
                    controller: i0,
                    priority: 1,
                    compile: function(t) {
                        return t.addClass(iW).addClass(iY).addClass(iG), {
                            pre: function(e, t, n, r) {
                                var i = r[0],
                                    o = r[1] || i.$$parentForm,
                                    a = r[2];
                                a && (i.$options = a.$options), i.$$initGetterSetters(), o.$addControl(i), n.$observe("name", function(e) {
                                    i.$name !== e && i.$$parentForm.$$renameControl(i, e)
                                }), e.$on("$destroy", function() {
                                    i.$$parentForm.$removeControl(i)
                                })
                            },
                            post: function(t, n, r, i) {
                                var o = i[0];

                                function a() {
                                    o.$setTouched()
                                }
                                o.$$setUpdateOnEvents(), n.on("blur", function() {
                                    o.$touched || (e.$$phase ? t.$evalAsync(a) : t.$apply(a))
                                })
                            }
                        }
                    }
                }
            }],
            i3 = /(\s+|^)default(\s+|$)/;

        function i4(e) {
            this.$$options = e
        }
        i4.prototype = {
            getOption: function(e) {
                return this.$$options[e]
            },
            createChild: function(e) {
                var t = !1;
                return T(e = C({}, e), function(n, r) {
                    "$inherit" === n ? "*" === r ? t = !0 : (e[r] = this.$$options[r], "updateOn" === r && (e.updateOnDefault = this.$$options.updateOnDefault)) : "updateOn" === r && (e.updateOnDefault = !1, e[r] = X(n.replace(i3, function() {
                        return e.updateOnDefault = !0, " "
                    })))
                }, this), t && (delete e["*"], i6(e, this.$$options)), i6(e, i1.$$options), new i4(e)
            }
        }, i1 = new i4({
            updateOn: "",
            updateOnDefault: !0,
            debounce: 0,
            getterSetter: !1,
            allowInvalid: !1,
            timezone: null
        });
        var i5 = function() {
            function e(e, t) {
                this.$$attrs = e, this.$$scope = t
            }
            return e.$inject = ["$attrs", "$scope"], e.prototype = {
                $onInit: function() {
                    var e = this.parentCtrl ? this.parentCtrl.$options : i1,
                        t = this.$$scope.$eval(this.$$attrs.ngModelOptions);
                    this.$options = e.createChild(t)
                }
            }, {
                restrict: "A",
                priority: 10,
                require: {
                    parentCtrl: "?^^ngModelOptions"
                },
                bindToController: !0,
                controller: e
            }
        };

        function i6(e, t) {
            T(t, function(t, n) {
                D(e[n]) || (e[n] = t)
            })
        }
        var i9 = rK({
                terminal: !0,
                priority: 1e3
            }),
            i8 = r("ngOptions"),
            i7 = /^\s*([\s\S]+?)(?:\s+as\s+([\s\S]+?))?(?:\s+group\s+by\s+([\s\S]+?))?(?:\s+disable\s+when\s+([\s\S]+?))?\s+for\s+(?:([$\w][$\w]*)|(?:\(\s*([$\w][$\w]*)\s*,\s*([$\w][$\w]*)\s*\)))\s+in\s+([\s\S]+?)(?:\s+track\s+by\s+([\s\S]+?))?$/,
            oe = ["$compile", "$document", "$parse", function(t, n, r) {
                var i = e.document.createElement("option"),
                    a = e.document.createElement("optgroup");
                return {
                    restrict: "A",
                    terminal: !0,
                    require: ["select", "ngModel"],
                    link: {
                        pre: function(e, t, n, r) {
                            r[0].registerOption = N
                        },
                        post: function(e, s, u, c) {
                            for (var l = c[0], f = c[1], p = u.multiple, d = 0, h = s.children(), $ = h.length; d < $; d++)
                                if ("" === h[d].value) {
                                    l.hasEmptyOption = !0, l.emptyOption = h.eq(d);
                                    break
                                } s.empty();
                            var v, m = !!l.emptyOption;
                            o(i.cloneNode(!1)).val("?");
                            var g = function(e, t, n) {
                                    var i = e.match(i7);
                                    if (!i) throw i8("iexp", "Expected expression in form of '_select_ (as _label_)? for (_key_,)?_value_ in _collection_' but got '{0}'. Element: {1}", e, eb(t));
                                    var o = i[5] || i[7],
                                        a = i[6],
                                        s = / as /.test(i[0]) && i[1],
                                        u = i[9],
                                        c = r(i[2] ? i[1] : o),
                                        l = s && r(s) || c,
                                        f = u && r(u),
                                        p = u ? function(e, t) {
                                            return f(n, t)
                                        } : function(e) {
                                            return tS(e)
                                        },
                                        d = function(e, t) {
                                            return p(e, y(e, t))
                                        },
                                        h = r(i[2] || i[1]),
                                        $ = r(i[3] || ""),
                                        v = r(i[4] || ""),
                                        m = r(i[8]),
                                        g = {},
                                        y = a ? function(e, t) {
                                            return g[a] = t, g[o] = e, g
                                        } : function(e) {
                                            return g[o] = e, g
                                        };

                                    function b(e, t, n, r, i) {
                                        this.selectValue = e, this.viewValue = t, this.label = n, this.group = r, this.disabled = i
                                    }

                                    function w(e) {
                                        var t;
                                        if (!a && S(e)) t = e;
                                        else
                                            for (var n in t = [], e) e.hasOwnProperty(n) && "$" !== n.charAt(0) && t.push(n);
                                        return t
                                    }
                                    return {
                                        trackBy: u,
                                        getTrackByValue: d,
                                        getWatchables: r(m, function(e) {
                                            for (var t = [], r = w(e = e || []), o = r.length, a = 0; a < o; a++) {
                                                var s = e === r ? a : r[a],
                                                    u = e[s],
                                                    c = y(u, s),
                                                    l = p(u, c);
                                                if (t.push(l), i[2] || i[1]) {
                                                    var f = h(n, c);
                                                    t.push(f)
                                                }
                                                if (i[4]) {
                                                    var d = v(n, c);
                                                    t.push(d)
                                                }
                                            }
                                            return t
                                        }),
                                        getOptions: function() {
                                            for (var e = [], t = {}, r = m(n) || [], i = w(r), o = i.length, a = 0; a < o; a++) {
                                                var s = r === i ? a : i[a],
                                                    c = y(r[s], s),
                                                    f = l(n, c),
                                                    g = p(f, c),
                                                    E = new b(g, f, h(n, c), $(n, c), v(n, c));
                                                e.push(E), t[g] = E
                                            }
                                            return {
                                                items: e,
                                                selectValueMap: t,
                                                getOptionFromViewValue: function(e) {
                                                    return t[d(e)]
                                                },
                                                getViewValueFromOption: function(e) {
                                                    return u ? eo(e.viewValue) : e.viewValue
                                                }
                                            }
                                        }
                                    }
                                }(u.ngOptions, s, e),
                                y = n[0].createDocumentFragment();

                            function b(e, t) {
                                var n = i.cloneNode(!1);
                                t.appendChild(n), e.element = n, n.disabled = e.disabled, e.label !== n.label && (n.label = e.label, n.textContent = e.label), n.value = e.selectValue
                            }

                            function w(e) {
                                var t = v.getOptionFromViewValue(e),
                                    n = t && t.element;
                                return n && !n.selected && (n.selected = !0), t
                            }
                            l.generateUnknownOptionValue = function(e) {
                                return "?"
                            }, p ? (l.writeValue = function(e) {
                                if (v) {
                                    var t = e && e.map(w) || [];
                                    v.items.forEach(function(e) {
                                        e.element.selected && !er(t, e) && (e.element.selected = !1)
                                    })
                                }
                            }, l.readValue = function() {
                                var e = s.val() || [],
                                    t = [];
                                return T(e, function(e) {
                                    var n = v.selectValueMap[e];
                                    n && !n.disabled && t.push(v.getViewValueFromOption(n))
                                }), t
                            }, g.trackBy && e.$watchCollection(function() {
                                if (H(f.$viewValue)) return f.$viewValue.map(function(e) {
                                    return g.getTrackByValue(e)
                                })
                            }, function() {
                                f.$render()
                            })) : (l.writeValue = function(e) {
                                if (v) {
                                    var t = s[0].options[s[0].selectedIndex],
                                        n = v.getOptionFromViewValue(e);
                                    t && t.removeAttribute("selected"), n ? (s[0].value !== n.selectValue && (l.removeUnknownOption(), s[0].value = n.selectValue, n.element.selected = !0), n.element.setAttribute("selected", "selected")) : l.selectUnknownOrEmptyOption(e)
                                }
                            }, l.readValue = function() {
                                var e = v.selectValueMap[s.val()];
                                return e && !e.disabled ? (l.unselectEmptyOption(), l.removeUnknownOption(), v.getViewValueFromOption(e)) : null
                            }, g.trackBy && e.$watch(function() {
                                return g.getTrackByValue(f.$viewValue)
                            }, function() {
                                f.$render()
                            })), m && (t(l.emptyOption)(e), s.prepend(l.emptyOption), 8 === l.emptyOption[0].nodeType ? (l.hasEmptyOption = !1, l.registerOption = function(e, t) {
                                "" === t.val() && (l.hasEmptyOption = !0, l.emptyOption = t, l.emptyOption.removeClass("ng-scope"), f.$render(), t.on("$destroy", function() {
                                    var e = l.$isEmptyOptionSelected();
                                    l.hasEmptyOption = !1, l.emptyOption = void 0, e && f.$render()
                                }))
                            }) : l.emptyOption.removeClass("ng-scope")), e.$watchCollection(g.getWatchables, function() {
                                var e = v && l.readValue();
                                if (v)
                                    for (var t = v.items.length - 1; t >= 0; t--) {
                                        var n = v.items[t];
                                        D(n.group) ? td(n.element.parentNode) : td(n.element)
                                    }
                                v = g.getOptions();
                                var r = {};
                                if (v.items.forEach(function(e) {
                                        var t;
                                        D(e.group) ? ((t = r[e.group]) || (t = a.cloneNode(!1), y.appendChild(t), t.label = null === e.group ? "null" : e.group, r[e.group] = t), b(e, t)) : b(e, y)
                                    }), s[0].appendChild(y), f.$render(), !f.$isEmpty(e)) {
                                    var i = l.readValue();
                                    (g.trackBy || p ? es(e, i) : e === i) || (f.$setViewValue(i), f.$render())
                                }
                            })
                        }
                    }
                }
            }],
            ot = ["$locale", "$interpolate", "$log", function(e, t, n) {
                var r = /{}/g,
                    i = /^when(Minus)?(.+)$/;
                return {
                    link: function(o, a, s) {
                        var u, c = s.count,
                            l = s.$attr.when && a.attr(s.$attr.when),
                            p = s.offset || 0,
                            d = o.$eval(l) || {},
                            h = {},
                            $ = t.startSymbol() + c + "-" + p + t.endSymbol(),
                            v = w.noop;

                        function m(e) {
                            a.text(e || "")
                        }
                        T(s, function(e, t) {
                            var n = i.exec(t);
                            n && (d[(n[1] ? "-" : "") + f(n[2])] = a.attr(s.$attr[t]))
                        }), T(d, function(e, n) {
                            h[n] = t(e.replace(r, $))
                        }), o.$watch(c, function(t) {
                            var r = parseFloat(t),
                                i = I(r);
                            if (i || r in d || (r = e.pluralCat(r - p)), !(r === u || i && I(u))) {
                                v();
                                var a = h[r];
                                _(a) ? (null != t && n.debug("ngPluralize: no rule defined for '" + r + "' in " + l), v = N, m()) : v = o.$watch(a, m), u = r
                            }
                        })
                    }
                }
            }],
            on = r("ngRef"),
            or = ["$parse", function(e) {
                return {
                    priority: -1,
                    restrict: "A",
                    compile: function(t, n) {
                        var r = t3(en(t)),
                            i = e(n.ngRef),
                            o = i.assign || function() {
                                throw on("nonassign", 'Expression in ngRef="{0}" is non-assignable!', n.ngRef)
                            };
                        return function(e, t, a) {
                            var s;
                            if (a.hasOwnProperty("ngRefRead")) {
                                if ("$element" === a.ngRefRead) s = t;
                                else if (!(s = t.data("$" + a.ngRefRead + "Controller"))) throw on("noctrl", 'The controller for ngRefRead="{0}" could not be found on ngRef="{1}"', a.ngRefRead, n.ngRef)
                            } else s = t.data("$" + r + "Controller");
                            o(e, s = s || t), t.on("$destroy", function() {
                                i(e) === s && o(e, null)
                            })
                        }
                    }
                }
            }],
            oi = ["$parse", "$animate", "$compile", function(e, t, n) {
                var i = "$$NG_REMOVED",
                    o = r("ngRepeat"),
                    a = function(e, t, n, r, i, o, a) {
                        e[n] = r, i && (e[i] = o), e.$index = t, e.$first = 0 === t, e.$last = t === a - 1, e.$middle = !(e.$first || e.$last), e.$odd = !(e.$even = !(1 & t))
                    },
                    s = function(e, t, n) {
                        return tS(n)
                    },
                    u = function(e, t) {
                        return t
                    };
                return {
                    restrict: "A",
                    multiElement: !0,
                    transclude: "element",
                    priority: 1e3,
                    terminal: !0,
                    $$tlb: !0,
                    compile: function(r, c) {
                        var f = c.ngRepeat,
                            p = n.$$createComment("end ngRepeat", f),
                            d = f.match(/^\s*([\s\S]+?)\s+in\s+([\s\S]+?)(?:\s+as\s+([\s\S]+?))?(?:\s+track\s+by\s+([\s\S]+?))?\s*$/);
                        if (!d) throw o("iexp", "Expected expression in form of '_item_ in _collection_[ track by _id_]' but got '{0}'.", f);
                        var h = d[1],
                            $ = d[2],
                            v = d[3],
                            m = d[4];
                        if (!(d = h.match(/^(?:(\s*[$\w]+)|\(\s*([$\w]+)\s*,\s*([$\w]+)\s*\))$/))) throw o("iidexp", "'_item_' in '_item_ in _collection_' should be an identifier or '(_key_, _value_)' expression, but got '{0}'.", h);
                        var g, y = d[3] || d[1],
                            b = d[2];
                        if (v && (!/^[$a-zA-Z_][$a-zA-Z0-9_]*$/.test(v) || /^(null|undefined|this|\$index|\$first|\$middle|\$last|\$even|\$odd|\$parent|\$root|\$id)$/.test(v))) throw o("badident", "alias '{0}' is invalid --- must be a valid JS identifier which is not a reserved name.", v);
                        if (m) {
                            var w = {
                                    $id: tS
                                },
                                E = e(m);
                            g = function(e, t, n, r) {
                                return b && (w[b] = t), w[y] = n, w.$index = r, E(e, w)
                            }
                        }
                        return function(e, n, r, c, d) {
                            var h = eL();
                            e.$watchCollection($, function(r) {
                                var c, $, m, E, O, x, A, R, C, P, I, M, N, k = n[0],
                                    L = eL();
                                if (v && (e[v] = r), S(r)) P = r, C = g || s;
                                else
                                    for (var U in C = g || u, P = [], r) l.call(r, U) && "$" !== U.charAt(0) && P.push(U);
                                for (M = Array(O = P.length), $ = 0; $ < O; $++)
                                    if (x = r === P ? $ : P[$], A = r[x], h[R = C(e, x, A, $)]) I = h[R], delete h[R], L[R] = I, M[$] = I;
                                    else {
                                        if (L[R]) throw T(M, function(e) {
                                            e && e.scope && (h[e.id] = e)
                                        }), o("dupes", "Duplicates in a repeater are not allowed. Use 'track by' expression to specify unique keys. Repeater: {0}, Duplicate key: {1}, Duplicate value: {2}", f, R, A);
                                        M[$] = {
                                            id: R,
                                            scope: void 0,
                                            clone: void 0
                                        }, L[R] = !0
                                    } for (var _ in w && (w[y] = void 0), h) {
                                    if (N = ek((I = h[_]).clone), t.leave(N), N[0].parentNode)
                                        for ($ = 0, m = N.length; $ < m; $++) N[$][i] = !0;
                                    I.scope.$destroy()
                                }
                                for ($ = 0; $ < O; $++)
                                    if (x = r === P ? $ : P[$], A = r[x], (I = M[$]).scope) {
                                        E = k;
                                        do E = E.nextSibling; while (E && E[i]);
                                        I.clone[0] !== E && t.move(ek(I.clone), null, k), k = (c = I).clone[c.clone.length - 1], a(I.scope, $, y, A, b, x, O)
                                    } else d(function(e, n) {
                                        I.scope = n;
                                        var r = p.cloneNode(!1);
                                        e[e.length++] = r, t.enter(e, null, k), k = r, I.clone = e, L[I.id] = I, a(I.scope, $, y, A, b, x, O)
                                    });
                                h = L
                            })
                        }
                    }
                }
            }],
            oo = "ng-hide",
            oa = "ng-hide-animate",
            os = ["$animate", function(e) {
                return {
                    restrict: "A",
                    multiElement: !0,
                    link: function(t, n, r) {
                        t.$watch(r.ngShow, function(t) {
                            e[t ? "removeClass" : "addClass"](n, oo, {
                                tempClasses: oa
                            })
                        })
                    }
                }
            }],
            ou = ["$animate", function(e) {
                return {
                    restrict: "A",
                    multiElement: !0,
                    link: function(t, n, r) {
                        t.$watch(r.ngHide, function(t) {
                            e[t ? "addClass" : "removeClass"](n, oo, {
                                tempClasses: oa
                            })
                        })
                    }
                }
            }],
            oc = rK(function(e, t, n) {
                e.$watchCollection(n.ngStyle, function(e, n) {
                    n && e !== n && T(n, function(e, n) {
                        t.css(n, "")
                    }), e && t.css(e)
                })
            }),
            ol = ["$animate", "$compile", function(e, t) {
                return {
                    require: "ngSwitch",
                    controller: ["$scope", function() {
                        this.cases = {}
                    }],
                    link: function(n, r, i, o) {
                        var a = i.ngSwitch || i.on,
                            s = [],
                            u = [],
                            c = [],
                            l = [],
                            f = function(e, t) {
                                return function(n) {
                                    !1 !== n && e.splice(t, 1)
                                }
                            };
                        n.$watch(a, function(n) {
                            for (var r, i; c.length;) e.cancel(c.pop());
                            for (r = 0, i = l.length; r < i; ++r) {
                                var a = ek(u[r].clone);
                                l[r].$destroy(), (c[r] = e.leave(a)).done(f(c, r))
                            }
                            u.length = 0, l.length = 0, (s = o.cases["!" + n] || o.cases["?"]) && T(s, function(n) {
                                n.transclude(function(r, i) {
                                    l.push(i);
                                    var o = n.element;
                                    r[r.length++] = t.$$createComment("end ngSwitchWhen"), u.push({
                                        clone: r
                                    }), e.enter(r, o.parent(), o)
                                })
                            })
                        })
                    }
                }
            }],
            of = rK({
                transclude: "element",
                priority: 1200,
                require: "^ngSwitch",
                multiElement: !0,
                link: function(e, t, n, r, i) {
                    T(n.ngSwitchWhen.split(n.ngSwitchWhenSeparator).sort().filter(function(e, t, n) {
                        return n[t - 1] !== e
                    }), function(e) {
                        r.cases["!" + e] = r.cases["!" + e] || [], r.cases["!" + e].push({
                            transclude: i,
                            element: t
                        })
                    })
                }
            }),
            op = rK({
                transclude: "element",
                priority: 1200,
                require: "^ngSwitch",
                multiElement: !0,
                link: function(e, t, n, r, i) {
                    r.cases["?"] = r.cases["?"] || [], r.cases["?"].push({
                        transclude: i,
                        element: t
                    })
                }
            }),
            od = r("ngTransclude"),
            oh = ["$compile", function(e) {
                return {
                    restrict: "EAC",
                    compile: function(t) {
                        var n = e(t.contents());
                        return t.empty(),
                            function(e, t, r, i, o) {
                                if (!o) throw od("orphan", "Illegal use of ngTransclude directive in the template! No parent directive that requires a transclusion found. Element: {0}", eb(t));
                                r.ngTransclude === r.$attr.ngTransclude && (r.ngTransclude = "");
                                var a = r.ngTransclude || r.ngTranscludeSlot;

                                function s() {
                                    n(e, function(e) {
                                        t.append(e)
                                    })
                                }
                                o(function(e, n) {
                                    e.length && function(e) {
                                        for (var t = 0, n = e.length; t < n; t++) {
                                            var r = e[t];
                                            if (r.nodeType !== e_ || r.nodeValue.trim()) return !0
                                        }
                                    }(e) ? t.append(e) : (s(), n.$destroy())
                                }, null, a), a && !o.isSlotFilled(a) && s()
                            }
                    }
                }
            }],
            o$ = ["$templateCache", function(e) {
                return {
                    restrict: "E",
                    terminal: !0,
                    compile: function(t, n) {
                        if ("text/ng-template" === n.type) {
                            var r = n.id,
                                i = t[0].text;
                            e.put(r, i)
                        }
                    }
                }
            }],
            ov = {
                $setViewValue: N,
                $render: N
            };

        function om(e, t) {
            e.prop("selected", t), e.attr("selected", t)
        }
        var og = ["$element", "$scope", function(t, n) {
                var r = this,
                    i = new tO;
                r.selectValueMap = {}, r.ngModelCtrl = ov, r.multiple = !1, r.unknownOption = o(e.document.createElement("option")), r.hasEmptyOption = !1, r.emptyOption = void 0, r.renderUnknownOption = function(e) {
                    var n = r.generateUnknownOptionValue(e);
                    r.unknownOption.val(n), t.prepend(r.unknownOption), om(r.unknownOption, !0), t.val(n)
                }, r.updateUnknownOption = function(e) {
                    var n = r.generateUnknownOptionValue(e);
                    r.unknownOption.val(n), om(r.unknownOption, !0), t.val(n)
                }, r.generateUnknownOptionValue = function(e) {
                    return "? " + tS(e) + " ?"
                }, r.removeUnknownOption = function() {
                    r.unknownOption.parent() && r.unknownOption.remove()
                }, r.selectEmptyOption = function() {
                    r.emptyOption && (t.val(""), om(r.emptyOption, !0))
                }, r.unselectEmptyOption = function() {
                    r.hasEmptyOption && om(r.emptyOption, !1)
                }, n.$on("$destroy", function() {
                    r.renderUnknownOption = N
                }), r.readValue = function() {
                    var e = t.val(),
                        n = e in r.selectValueMap ? r.selectValueMap[e] : e;
                    return r.hasOption(n) ? n : null
                }, r.writeValue = function(e) {
                    var n = t[0].options[t[0].selectedIndex];
                    if (n && om(o(n), !1), r.hasOption(e)) {
                        r.removeUnknownOption();
                        var i = tS(e);
                        t.val(i in r.selectValueMap ? i : e);
                        var a = t[0].options[t[0].selectedIndex];
                        om(o(a), !0)
                    } else r.selectUnknownOrEmptyOption(e)
                }, r.addOption = function(e, t) {
                    if (8 !== t[0].nodeType) {
                        eN(e, '"option value"'), "" === e && (r.hasEmptyOption = !0, r.emptyOption = t);
                        var n = i.get(e) || 0;
                        i.set(e, n + 1), s()
                    }
                }, r.removeOption = function(e) {
                    var t = i.get(e);
                    t && (1 === t ? (i.delete(e), "" === e && (r.hasEmptyOption = !1, r.emptyOption = void 0)) : i.set(e, t - 1))
                }, r.hasOption = function(e) {
                    return !!i.get(e)
                }, r.$hasEmptyOption = function() {
                    return r.hasEmptyOption
                }, r.$isUnknownOptionSelected = function() {
                    return t[0].options[0] === r.unknownOption[0]
                }, r.$isEmptyOptionSelected = function() {
                    return r.hasEmptyOption && t[0].options[t[0].selectedIndex] === r.emptyOption[0]
                }, r.selectUnknownOrEmptyOption = function(e) {
                    null == e && r.emptyOption ? (r.removeUnknownOption(), r.selectEmptyOption()) : r.unknownOption.parent().length ? r.updateUnknownOption(e) : r.renderUnknownOption(e)
                };
                var a = !1;

                function s() {
                    a || (a = !0, n.$$postDigest(function() {
                        a = !1, r.ngModelCtrl.$render()
                    }))
                }
                var u = !1;

                function c(e) {
                    u || (u = !0, n.$$postDigest(function() {
                        n.$$destroyed || (u = !1, r.ngModelCtrl.$setViewValue(r.readValue()), e && r.ngModelCtrl.$render())
                    }))
                }
                r.registerOption = function(e, t, n, i, o) {
                    var a, u;
                    n.$attr.ngValue ? n.$observe("value", function(e) {
                        var n, i = t.prop("selected");
                        D(u) && (r.removeOption(a), delete r.selectValueMap[u], n = !0), u = tS(e), a = e, r.selectValueMap[u] = e, r.addOption(e, t), t.attr("value", u), n && i && c()
                    }) : i ? n.$observe("value", function(e) {
                        r.readValue();
                        var n, i = t.prop("selected");
                        D(a) && (r.removeOption(a), n = !0), a = e, r.addOption(e, t), n && i && c()
                    }) : o ? e.$watch(o, function(e, i) {
                        n.$set("value", e);
                        var o = t.prop("selected");
                        i !== e && r.removeOption(i), r.addOption(e, t), i && o && c()
                    }) : r.addOption(n.value, t), n.$observe("disabled", function(e) {
                        ("true" === e || e && t.prop("selected")) && (r.multiple ? c(!0) : (r.ngModelCtrl.$setViewValue(null), r.ngModelCtrl.$render()))
                    }), t.on("$destroy", function() {
                        var e = r.readValue(),
                            t = n.value;
                        r.removeOption(t), s(), (r.multiple && e && -1 !== e.indexOf(t) || e === t) && c(!0)
                    })
                }
            }],
            oy = function() {
                return {
                    restrict: "E",
                    require: ["select", "?ngModel"],
                    controller: og,
                    priority: 1,
                    link: {
                        pre: function(e, t, n, r) {
                            var i = r[0],
                                a = r[1];
                            if (!a) return void(i.registerOption = N);
                            if (i.ngModelCtrl = a, t.on("change", function() {
                                    i.removeUnknownOption(), e.$apply(function() {
                                        a.$setViewValue(i.readValue())
                                    })
                                }), n.multiple) {
                                i.multiple = !0, i.readValue = function() {
                                    var e = [];
                                    return T(t.find("option"), function(t) {
                                        if (t.selected && !t.disabled) {
                                            var n = t.value;
                                            e.push(n in i.selectValueMap ? i.selectValueMap[n] : n)
                                        }
                                    }), e
                                }, i.writeValue = function(e) {
                                    T(t.find("option"), function(t) {
                                        var n = !!e && (er(e, t.value) || er(e, i.selectValueMap[t.value]));
                                        n !== t.selected && om(o(t), n)
                                    })
                                };
                                var s, u = NaN;
                                e.$watch(function() {
                                    u !== a.$viewValue || es(s, a.$viewValue) || (s = eD(a.$viewValue), a.$render()), u = a.$viewValue
                                }), a.$isEmpty = function(e) {
                                    return !e || 0 === e.length
                                }
                            }
                        },
                        post: function(e, t, n, r) {
                            var i = r[1];
                            if (i) {
                                var o = r[0];
                                i.$render = function() {
                                    o.writeValue(i.$viewValue)
                                }
                            }
                        }
                    }
                }
            },
            ob = ["$interpolate", function(e) {
                return {
                    restrict: "E",
                    priority: 100,
                    compile: function(t, n) {
                        var r, i;
                        return D(n.ngValue) || (D(n.value) ? r = e(n.value, !0) : (i = e(t.text(), !0)) || n.$set("value", t.text())),
                            function(e, t, n) {
                                var o = "$selectController",
                                    a = t.parent(),
                                    s = a.data(o) || a.parent().data(o);
                                s && s.registerOption(e, t, n, r, i)
                            }
                    }
                }
            }],
            ow = ["$parse", function(e) {
                return {
                    restrict: "A",
                    require: "?ngModel",
                    link: function(t, n, r, i) {
                        if (i) {
                            var o = r.hasOwnProperty("required") || e(r.ngRequired)(t);
                            r.ngRequired || (r.required = !0), i.$validators.required = function(e, t) {
                                return !o || !i.$isEmpty(t)
                            }, r.$observe("required", function(e) {
                                o !== e && (o = e, i.$validate())
                            })
                        }
                    }
                }
            }],
            oE = ["$parse", function(e) {
                return {
                    restrict: "A",
                    require: "?ngModel",
                    compile: function(t, n) {
                        var r, i;
                        return n.ngPattern && (r = n.ngPattern, i = "/" === n.ngPattern.charAt(0) && u.test(n.ngPattern) ? function() {
                                return n.ngPattern
                            } : e(n.ngPattern)),
                            function(e, t, n, o) {
                                if (o) {
                                    var a = n.pattern;
                                    n.ngPattern ? a = i(e) : r = n.pattern;
                                    var s = oO(a, r, t);
                                    n.$observe("pattern", function(e) {
                                        var n = s;
                                        s = oO(e, r, t), (n && n.toString()) !== (s && s.toString()) && o.$validate()
                                    }), o.$validators.pattern = function(e, t) {
                                        return o.$isEmpty(t) || _(s) || s.test(t)
                                    }
                                }
                            }
                    }
                }
            }],
            oS = ["$parse", function(e) {
                return {
                    restrict: "A",
                    require: "?ngModel",
                    link: function(t, n, r, i) {
                        if (i) {
                            var o = r.maxlength || e(r.ngMaxlength)(t),
                                a = ox(o);
                            r.$observe("maxlength", function(e) {
                                o !== e && (a = ox(e), o = e, i.$validate())
                            }), i.$validators.maxlength = function(e, t) {
                                return a < 0 || i.$isEmpty(t) || t.length <= a
                            }
                        }
                    }
                }
            }],
            oT = ["$parse", function(e) {
                return {
                    restrict: "A",
                    require: "?ngModel",
                    link: function(t, n, r, i) {
                        if (i) {
                            var o = r.minlength || e(r.ngMinlength)(t),
                                a = ox(o) || -1;
                            r.$observe("minlength", function(e) {
                                o !== e && (a = ox(e) || -1, o = e, i.$validate())
                            }), i.$validators.minlength = function(e, t) {
                                return i.$isEmpty(t) || t.length >= a
                            }
                        }
                    }
                }
            }];

        function oO(e, t, n) {
            if (e) {
                if (j(e) && (e = RegExp("^" + e + "$")), !e.test) throw r("ngPattern")("noregexp", "Expected {0} to be a RegExp but was {1}. Element: {2}", t, e, eb(n));
                return e
            }
        }

        function ox(e) {
            var t = P(e);
            return I(t) ? -1 : t
        }
        e.angular.bootstrap ? e.console && console.log("WARNING: Tried to load AngularJS more than once.") : (! function() {
            var t;
            if (!eP) {
                var n = ec();
                (a = _(n) ? e.jQuery : n ? e[n] : void 0) && a.fn.on ? (o = a, C(a.fn, {
                    scope: t$.scope,
                    isolateScope: t$.isolateScope,
                    controller: t$.controller,
                    injector: t$.injector,
                    inheritedData: t$.inheritedData
                })) : o = e9, t = o.cleanData, o.cleanData = function(e) {
                    for (var n, r, i = 0; null != (r = e[i]); i++)(n = (o._data(r) || {}).events) && n.$destroy && o(r).triggerHandler("$destroy");
                    t(e)
                }, w.element = o, eP = !0
            }
        }(), C(w, {
            errorHandlingConfig: function(e) {
                if (!V(e)) return t;
                D(e.objectMaxDepth) && (t.objectMaxDepth = n(e.objectMaxDepth) ? e.objectMaxDepth : NaN), D(e.urlErrorParamsEnabled) && Q(e.urlErrorParamsEnabled) && (t.urlErrorParamsEnabled = e.urlErrorParamsEnabled)
            },
            bootstrap: eA,
            copy: eo,
            extend: C,
            merge: function(e) {
                return R(e, h.call(arguments, 1), !0)
            },
            equals: es,
            element: o,
            forEach: T,
            injector: tL,
            noop: N,
            bind: ep,
            toJson: eh,
            fromJson: e$,
            identity: k,
            isUndefined: _,
            isDefined: D,
            isString: j,
            isFunction: z,
            isObject: V,
            isNumber: q,
            isElement: et,
            isArray: H,
            version: {
                full: "1.8.3",
                major: 1,
                minor: 8,
                dot: 3,
                codeName: "ultimate-farewell"
            },
            isDate: B,
            callbacks: {
                $$counter: 0
            },
            getTestability: function(e) {
                var t = w.element(e).injector();
                if (!t) throw b("test", "no injector found for element argument to getTestability");
                return t.get("$$testability")
            },
            reloadWithDebugInfo: function() {
                e.name = "NG_ENABLE_DEBUG_INFO!" + e.name, e.location.reload()
            },
            UNSAFE_restoreLegacyJqLiteXHTMLReplacement: function() {
                e9.legacyXHTMLReplacement = !0
            },
            $$minErr: r,
            $$csp: eu,
            $$encodeUriSegment: eS,
            $$encodeUriQuery: eT,
            $$lowercase: f,
            $$stringify: eU,
            $$uppercase: p
        }), (s = function(e) {
            var t = r("$injector"),
                n = r("ng");

            function i(e, t, n) {
                return e[t] || (e[t] = n())
            }
            var o = i(e, "angular", Object);
            return o.$$minErr = o.$$minErr || r, i(o, "module", function() {
                var e = {};
                return function(r, o, a) {
                    var s = {};
                    return function(e) {
                        if ("hasOwnProperty" === e) throw n("badname", "hasOwnProperty is not a valid {0} name", "module")
                    }(r), o && e.hasOwnProperty(r) && (e[r] = null), i(e, r, function() {
                        if (!o) throw t("nomod", "Module '{0}' is not available! You either misspelled the module name or forgot to load it. If registering a module ensure that you specify the dependencies as the second argument.", r);
                        var e = [],
                            i = [],
                            u = [],
                            c = f("$injector", "invoke", "push", i),
                            l = {
                                _invokeQueue: e,
                                _configBlocks: i,
                                _runBlocks: u,
                                info: function(e) {
                                    if (D(e)) {
                                        if (!V(e)) throw n("aobj", "Argument '{0}' must be an object", "value");
                                        return s = e, this
                                    }
                                    return s
                                },
                                requires: o,
                                name: r,
                                provider: p("$provide", "provider"),
                                factory: p("$provide", "factory"),
                                service: p("$provide", "service"),
                                value: f("$provide", "value"),
                                constant: f("$provide", "constant", "unshift"),
                                decorator: p("$provide", "decorator", i),
                                animation: p("$animateProvider", "register"),
                                filter: p("$filterProvider", "register"),
                                controller: p("$controllerProvider", "register"),
                                directive: p("$compileProvider", "directive"),
                                component: p("$compileProvider", "component"),
                                config: c,
                                run: function(e) {
                                    return u.push(e), this
                                }
                            };
                        return a && c(a), l;

                        function f(t, n, r, i) {
                            return i || (i = e),
                                function() {
                                    return i[r || "push"]([t, n, arguments]), l
                                }
                        }

                        function p(t, n, i) {
                            return i || (i = e),
                                function(e, o) {
                                    return o && z(o) && (o.$$moduleName = r), i.push([t, n, arguments]), l
                                }
                        }
                    })
                }
            })
        }(e))("ng", ["ngLocale"], ["$provide", function(e) {
            e.provider({
                $$sanitizeUri: rr
            }), e.provider("$compile", tX).directive({
                a: rZ,
                input: iS,
                textarea: iS,
                form: r5,
                script: o$,
                select: oy,
                option: ob,
                ngBind: iA,
                ngBindHtml: iC,
                ngBindTemplate: iR,
                ngClass: iM,
                ngClassEven: ik,
                ngClassOdd: iN,
                ngCloak: iL,
                ngController: iU,
                ngForm: r6,
                ngHide: ou,
                ngIf: iF,
                ngInclude: ij,
                ngInit: iB,
                ngNonBindable: i9,
                ngPluralize: ot,
                ngRef: or,
                ngRepeat: oi,
                ngShow: os,
                ngStyle: oc,
                ngSwitch: ol,
                ngSwitchWhen: of,
                ngSwitchDefault: op,
                ngOptions: oe,
                ngTransclude: oh,
                ngModel: i2,
                ngList: iH,
                ngChange: iP,
                pattern: oE,
                ngPattern: oE,
                required: ow,
                ngRequired: ow,
                minlength: oT,
                ngMinlength: oT,
                maxlength: oS,
                ngMaxlength: oS,
                ngValue: ix,
                ngModelOptions: i5
            }).directive({
                ngInclude: iq,
                input: iT
            }).directive(rX).directive(i_), e.provider({
                $anchorScroll: tU,
                $animate: tB,
                $animateCss: tz,
                $$animateJs: tj,
                $$animateQueue: tq,
                $$AnimateRunner: tG,
                $$animateAsyncRun: tH,
                $browser: tJ,
                $cacheFactory: tY,
                $controller: t8,
                $document: t7,
                $$isDocumentHidden: ne,
                $exceptionHandler: nt,
                $filter: rR,
                $$forceReflow: nn,
                $interpolate: nw,
                $interval: nS,
                $$intervalFactory: nT,
                $http: nm,
                $httpParamSerializer: nl,
                $httpParamSerializerJQLike: nf,
                $httpBackend: ny,
                $xhrFactory: ng,
                $jsonpCallbacks: nO,
                $location: nj,
                $log: nq,
                $parse: n6,
                $rootScope: rn,
                $q: n9,
                $$q: n8,
                $sce: rl,
                $sceDelegate: rc,
                $sniffer: rf,
                $$taskTrackerFactory: rp,
                $templateCache: tQ,
                $templateRequest: r$,
                $$testability: rv,
                $timeout: rg,
                $window: rO,
                $$rAF: rt,
                $$jqLite: tE,
                $$Map: tx,
                $$cookieReader: rA
            })
        }]).info({
            angularVersion: "1.8.3"
        }), w.module("ngLocale", [], ["$provide", function(e) {
            e.value("$locale", {
                DATETIME_FORMATS: {
                    AMPMS: ["AM", "PM"],
                    DAY: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
                    ERANAMES: ["Before Christ", "Anno Domini"],
                    ERAS: ["BC", "AD"],
                    FIRSTDAYOFWEEK: 6,
                    MONTH: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
                    SHORTDAY: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
                    SHORTMONTH: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                    STANDALONEMONTH: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
                    WEEKENDRANGE: [5, 6],
                    fullDate: "EEEE, MMMM d, y",
                    longDate: "MMMM d, y",
                    medium: "MMM d, y h:mm:ss a",
                    mediumDate: "MMM d, y",
                    mediumTime: "h:mm:ss a",
                    short: "M/d/yy h:mm a",
                    shortDate: "M/d/yy",
                    shortTime: "h:mm a"
                },
                NUMBER_FORMATS: {
                    CURRENCY_SYM: "$",
                    DECIMAL_SEP: ".",
                    GROUP_SEP: ",",
                    PATTERNS: [{
                        gSize: 3,
                        lgSize: 3,
                        maxFrac: 3,
                        minFrac: 0,
                        minInt: 1,
                        negPre: "-",
                        negSuf: "",
                        posPre: "",
                        posSuf: ""
                    }, {
                        gSize: 3,
                        lgSize: 3,
                        maxFrac: 2,
                        minFrac: 2,
                        minInt: 1,
                        negPre: "-\xa4",
                        negSuf: "",
                        posPre: "\xa4",
                        posSuf: ""
                    }]
                },
                id: "en-us",
                localeID: "en_US",
                pluralCat: function(e, t) {
                    var n, r, i, o, a = (void 0 === (n = t) && (n = Math.min(-1 == (i = (r = e + "").indexOf(".")) ? 0 : r.length - i - 1, 3)), o = Math.pow(10, n), {
                        v: n,
                        f: (e * o | 0) % o
                    });
                    return 1 == (0 | e) && 0 == a.v ? "one" : "other"
                }
            })
        }]), o(function() {
            ! function(t, n) {
                var r, i, o = {};
                if (T(eO, function(e) {
                        var n = e + "app";
                        !r && t.hasAttribute && t.hasAttribute(n) && (r = t, i = t.getAttribute(n))
                    }), T(eO, function(e) {
                        var n, o = e + "app";
                        !r && (n = t.querySelector("[" + o.replace(":", "\\:") + "]")) && (r = n, i = n.getAttribute(o))
                    }), r) {
                    if (!ex) return e.console.error("AngularJS: disabling automatic bootstrap. <script> protocol indicates an extension, document.location.href does not match.");
                    o.strictDi = null !== function(e, t) {
                        var n, r, i = eO.length;
                        for (r = 0; r < i; ++r)
                            if (n = eO[r] + t, j(n = e.getAttribute(n))) return n;
                        return null
                    }(r, "strict-di"), n(r, i ? [i] : [], o)
                }
            }(e.document, eA)
        }))
    }(window), window.angular.$$csp().noInlineStyle || window.angular.element(document.head).prepend(window.angular.element("<style>").text('@charset "UTF-8";[ng\\:cloak],[ng-cloak],[data-ng-cloak],[x-ng-cloak],.ng-cloak,.x-ng-cloak,.ng-hide:not(.ng-hide-animate){display:none !important;}ng\\:form{display:block;}.ng-animate-shim{visibility:hidden;}.ng-anchor{position:absolute;}'));
    var tL = g(angular).module("presence", []).config(["languageResourceProvider", function(e) {
            if (window.Roblox) {
                var t = (new Roblox.TranslationResourceProvider).getTranslationResource("Common.Presence");
                e.setTranslationResources([t])
            }
        }]),
        tU = {
            template: "\n    <div ng-if='$ctrl.statusLabelTranslation === \"Label.Invisible\"' class='avatar-status' title='{{ \"Label.Invisible\" | translate }}' ng-class='$ctrl.statusClass'>\n      <span class='icon-{{$ctrl.statusClass}}'></span>\n    </div>\n    <div ng-if='$ctrl.statusLabelTranslation !== \"Label.Invisible\"' class='avatar-status' title='{{$ctrl.presence.lastLocation}}' ng-class='$ctrl.statusClass'>\n      <span class='icon-{{$ctrl.statusClass}}'></span>\n    </div>\n  ",
            controller: "presenceStatusController",
            bindings: {
                userId: "<"
            }
        };
    tL.component("presenceStatusIcon", tU);
    var t_ = {
        template: "\n    <span ng-class='$ctrl.className' ng-if='$ctrl.statusLabelTranslation' ng-bind='$ctrl.statusLabelTranslation | translate'></span>\n    <a ng-class='$ctrl.linkClassName' ng-if='!$ctrl.statusLabelTranslation && $ctrl.presence.rootPlaceId' href='/games/{{$ctrl.presence.rootPlaceId}}' ng-bind='$ctrl.presence.lastLocation'>\n    <span ng-class='$ctrl.className' ng-if='!$ctrl.statusLabelTranslation && !$ctrl.presence.rootPlaceId' ng-bind=\"'Label.Online' | translate\"></span>\n  ",
        controller: "presenceStatusController",
        bindings: {
            userId: "<",
            linkClassName: "@",
            className: "@"
        }
    };

    function tD(e) {
        var t = this;
        this.presence = {
            userId: this.userId,
            userPresenceType: m.Offline,
            lastLocation: ""
        }, this.statusClass = "", this.statusLabelTranslation = "", e.$watch(function() {
            return t.userId
        }, function() {
            tN().subscribeToPresenceChanges([t.userId], function(n) {
                e.$evalAsync(function() {
                    t.presence = n, t.statusClass = eA.presenceStatusToClassName[t.presence.userPresenceType], t.statusLabelTranslation = eA.presenceStatusToAngularTranslation[t.presence.userPresenceType]
                })
            }, !0)
        })
    }
    tL.component("presenceStatusLabel", t_), tL.controller("presenceStatusController", ["$scope", tD]);
    var tV = "PresenceChanged",
        tF = window.Roblox,
        tj = window.HeaderScripts,
        tq = window.CoreUtilities,
        tB = (r = function(e) {
            document.dispatchEvent(new CustomEvent("Roblox.Presence.Update", {
                detail: e
            }))
        }, i = new Map, {
            initializeRealTimeSubscriptions: function() {
                tF.RealTime && tF.RealTime.Factory.GetClient().Subscribe("PresenceBulkNotifications", function(e) {
                    var t = new Map;
                    e.forEach(function(e) {
                        e.Type === tV && t.set(e.UserId, e)
                    }), tB.getPresences(t)
                })
            },
            getPresences: function(e) {
                var t = new Map,
                    n = [],
                    o = !0,
                    a = !1,
                    s = void 0;
                try {
                    for (var u, c = e.keys()[Symbol.iterator](); !(o = (u = c.next()).done); o = !0) {
                        var l = u.value,
                            f = e.get(l),
                            p = f.PresenceReport;
                        p && (!i.has(l) || f.SessionStarted > i.get(l)) ? (t.set(l, p), i.set(l, f.SessionStarted)) : n.push(l)
                    }
                } catch (e) {
                    a = !0, s = e
                } finally {
                    try {
                        o || null == c.return || c.return()
                    } finally {
                        if (a) throw s
                    }
                }
                if (n.length > 0) {
                    var d = {
                        url: "".concat(tF.EnvironmentUrls.presenceApi, "/v1/presence/users"),
                        withCredentials: !0
                    };
                    tq.httpService.post(d, {
                        userIds: n
                    }).then(function(e) {
                        if (null == e ? void 0 : e.data) {
                            var n = !0,
                                r = !1,
                                i = void 0;
                            try {
                                for (var o, a = e.data.userPresences[Symbol.iterator](); !(n = (o = a.next()).done); n = !0) {
                                    var s = o.value;
                                    t.set(s.userId, s)
                                }
                            } catch (e) {
                                r = !0, i = e
                            } finally {
                                try {
                                    n || null == a.return || a.return()
                                } finally {
                                    if (r) throw i
                                }
                            }
                        }
                    }).catch(function(e) {
                        console.error(e)
                    }).finally(function() {
                        r(t)
                    })
                }
                r(t)
            }
        });
    (null === tj.authenticatedUser || void 0 === tj.authenticatedUser ? void 0 : tj.authenticatedUser.isAuthenticated) && document.addEventListener("DOMContentLoaded", function() {
        tB.initializeRealTimeSubscriptions()
    }), c(["Roblox", "Presence", "PresenceTypes"], {
        Offline: 0,
        Online: 1,
        InGame: 2,
        InStudio: 3
    }), c("RobloxPresence", {
        PresenceType: m,
        PresenceStatusIcon: function(e) {
            var t, n, r = e.userId,
                i = e.initialPresence,
                o = e.className,
                a = e.translate,
                s = tk(r, i),
                u = null != (t = null == s ? void 0 : s.userPresenceType) ? t : m.Offline,
                c = null != (n = null == s ? void 0 : s.lastLocation) ? n : "";
            a && u === m.Invisible && (c = a("Label.Invisible"));
            var l = eA.presenceStatusToClassName[u];
            return u !== m.Offline ? f().createElement("span", {
                "data-testid": "presence-icon",
                title: c,
                className: T(o, l, "icon-".concat(l))
            }) : null
        },
        PresenceStatusLabel: function(e) {
            var t, n, r = e.userId,
                i = e.translate,
                o = e.linkUrlGetter,
                a = e.linkClassNames,
                s = tk(r, void 0);
            if (s.userPresenceType === m.Offline) return i("Label.Offline");
            if (s.userPresenceType === m.Online) return i("Label.Online");
            if (s.userPresenceType === m.Game) {
                if (s.rootPlaceId) {
                    var u = o ? o(s.rootPlaceId) : "".concat(null == (n = null == (t = window.Roblox) ? void 0 : t.EnvironmentUrls) ? void 0 : n.websiteUrl, "/games/").concat(s.rootPlaceId);
                    return f().createElement("a", {
                        href: u,
                        className: T(null != a ? a : [])
                    }, s.lastLocation)
                }
                return i("Label.Online")
            }
            return s.userPresenceType === m.Studio ? s.lastLocation : s.userPresenceType === m.Invisible ? i("Label.Invisible") : void 0
        },
        usePresence: tk,
        presenceModule: {
            presenceModule: tL,
            presenceStatusIcon: tU,
            presenceStatusLabel: t_,
            presenceStatusController: tD
        },
        getPresenceProvider: tN,
        presenceClient: tS
    })
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("PresenceStatus");
//# debugId=e1456091-4c46-43e3-bcfb-b15a9cdf904d
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/presenceStatus-ac74dede75943562.js.map