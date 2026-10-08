! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "af947ccc401fe718a8c871e5c237dab8d591fec7"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "8dbb8558-1a65-4e54-a3dc-0d3e52cbe33a", e._sentryDebugIdIdentifier = "sentry-dbid-8dbb8558-1a65-4e54-a3dc-0d3e52cbe33a")
    } catch (e) {}
}(),
function() {
    "use strict";
    var e, t, r = {},
        n = {};

    function i(e) {
        var t = n[e];
        if (void 0 !== t) return t.exports;
        var o = n[e] = {
            exports: {}
        };
        return r[e](o, o.exports, i), o.exports
    }
    i.n = function(e) {
        var t = e && e.__esModule ? function() {
            return e.default
        } : function() {
            return e
        };
        return i.d(t, {
            a: t
        }), t
    }, i.d = function(e, t) {
        for (var r in t) i.o(t, r) && !i.o(e, r) && Object.defineProperty(e, r, {
            enumerable: !0,
            get: t[r]
        })
    }, i.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, i.rv = function() {
        return "1.7.12"
    }, i.ruid = "bundler=rspack@1.7.12";
    var o = window.Roblox,
        a = i.n(o),
        l = window.CoreUtilities,
        c = window.Roblox["core-scripts"].environmentUrls,
        u = i.n(c),
        s = {
            assetRootUrlTemplate: "catalog",
            bundleRootUrlTemplate: "bundles",
            getRecommendations: {
                url: "".concat(c.EnvironmentUrls.catalogApi, "/v2/recommendations/complement-assets"),
                retryable: !0,
                withCredentials: !0
            },
            postItemDetails: {
                url: "".concat(c.EnvironmentUrls.catalogApi, "/v1/catalog/items/details"),
                retryable: !0,
                withCredentials: !0
            },
            postCollectibleItemDetails: {
                url: "".concat(c.EnvironmentUrls.apiGatewayUrl, "/marketplace-items/v1/items/details"),
                retryable: !0,
                withCredentials: !0
            },
            getItemOwnershipUrl: function(e, t, r) {
                return "".concat(c.EnvironmentUrls.inventoryApi, "/v1/users/").concat(e, "/items/").concat(t, "/").concat(r, "/is-owned")
            }
        },
        f = ((e = {})[e.DETAILS_NOT_HYDRATED = 0] = "DETAILS_NOT_HYDRATED", e[e.DETAILS_LOADING = 1] = "DETAILS_LOADING", e[e.DETAILS_HYDRATED = 2] = "DETAILS_HYDRATED", e);

    function d(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function y(e) {
        for (var t = 1; t < arguments.length; t++) {
            var r = null != arguments[t] ? arguments[t] : {},
                n = Object.keys(r);
            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                return Object.getOwnPropertyDescriptor(r, e).enumerable
            }))), n.forEach(function(t) {
                var n;
                n = r[t], t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n
            })
        }
        return e
    }

    function v(e, t) {
        return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
            var t = Object.keys(e);
            if (Object.getOwnPropertySymbols) {
                var r = Object.getOwnPropertySymbols(e);
                t.push.apply(t, r)
            }
            return t
        })(Object(t)).forEach(function(r) {
            Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
        }), e
    }

    function p(e, t) {
        return function(e) {
            if (Array.isArray(e)) return e
        }(e) || function(e, t) {
            var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
            if (null != i) {
                var o = [],
                    a = !0,
                    l = !1;
                try {
                    for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                } catch (e) {
                    l = !0, n = e
                } finally {
                    try {
                        a || null == i.return || i.return()
                    } finally {
                        if (l) throw n
                    }
                }
                return o
            }
        }(e, t) || function(e, t) {
            if (e) {
                if ("string" == typeof e) return d(e, t);
                var r = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return d(e, t)
            }
        }(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }

    function b(e, t, r, n, i, o, a) {
        try {
            var l = e[o](a),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, i)
    }

    function m() {
        return null != t || (t = "".concat(u().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), t
    }
    var h = function() {};

    function w(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function g(e) {
        return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
    }
    var I = function(e, t) {
            return e << 3 | t
        },
        S = I(1, 2),
        O = I(2, 2),
        D = I(5, 2),
        T = I(6, 2),
        E = I(8, 2),
        A = I(1, 2),
        P = I(2, 1),
        R = I(3, 0),
        j = I(5, 2);
    I(1, 2), I(2, 1), I(3, 0), I(4, 2), I(5, 2), I(6, 0), I(8, 2);
    var x = I(4, 0),
        L = I(6, 2),
        C = I(7, 2);
    I(1, 0), I(2, 2);
    var k = I(1, 2),
        B = I(2, 2),
        _ = I(1, 2);
    I(1, 2), I(2, 2), I(1, 2);
    var V = new TextEncoder,
        U = function() {
            var e;

            function t() {
                var e;
                if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                e = [], "buf" in this ? Object.defineProperty(this, "buf", {
                    value: e,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : this.buf = e
            }
            return e = [{
                    key: "writeVarint",
                    value: function(e) {
                        var t = (void 0 === e ? "undefined" : g(e)) === "bigint" ? e : BigInt(Math.trunc(e));
                        for (t < BigInt(0) && (t += BigInt(1) << BigInt(64)); t > BigInt(127);) this.buf.push(128 | Number(t & BigInt(127))), t >>= BigInt(7);
                        this.buf.push(Number(t))
                    }
                }, {
                    key: "writeString",
                    value: function(e) {
                        var t = V.encode(e);
                        this.writeVarint(t.length);
                        var r = !0,
                            n = !1,
                            i = void 0;
                        try {
                            for (var o, a = t[Symbol.iterator](); !(r = (o = a.next()).done); r = !0) {
                                var l = o.value;
                                this.buf.push(l)
                            }
                        } catch (e) {
                            n = !0, i = e
                        } finally {
                            try {
                                r || null == a.return || a.return()
                            } finally {
                                if (n) throw i
                            }
                        }
                    }
                }, {
                    key: "writeBytes",
                    value: function(e) {
                        this.writeVarint(e.length);
                        var t = !0,
                            r = !1,
                            n = void 0;
                        try {
                            for (var i, o = e[Symbol.iterator](); !(t = (i = o.next()).done); t = !0) {
                                var a = i.value;
                                this.buf.push(a)
                            }
                        } catch (e) {
                            r = !0, n = e
                        } finally {
                            try {
                                t || null == o.return || o.return()
                            } finally {
                                if (r) throw n
                            }
                        }
                    }
                }, {
                    key: "writeDouble",
                    value: function(e) {
                        var t = new DataView(new ArrayBuffer(8));
                        t.setFloat64(0, e, !0);
                        for (var r = 0; r < 8; r += 1) this.buf.push(t.getUint8(r))
                    }
                }, {
                    key: "toBytes",
                    value: function() {
                        return new Uint8Array(this.buf)
                    }
                }],
                function(e, t) {
                    for (var r = 0; r < t.length; r++) {
                        var n = t[r];
                        n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                    }
                }(t.prototype, e), t
        }();

    function N(e, t, r) {
        var n = new U;
        return n.writeVarint(I(1, 2)), n.writeString(e), n.writeVarint(t), r(n), n.toBytes()
    }

    function M(e) {
        var t = new U;
        if (t.writeVarint(A), t.writeString(e.name), t.writeVarint(P), t.writeDouble(e.value), t.writeVarint(R), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
            var r = function(e) {
                var t = new U,
                    r = !0,
                    n = !1,
                    i = void 0;
                try {
                    for (var o, a = Object.entries(e)[Symbol.iterator](); !(r = (o = a.next()).done); r = !0) ! function() {
                        var e, r = (e = o.value, function(e) {
                                if (Array.isArray(e)) return e
                            }(e) || function(e) {
                                var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                if (null != n) {
                                    var i = [],
                                        o = !0,
                                        a = !1;
                                    try {
                                        for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                                    } catch (e) {
                                        a = !0, r = e
                                    } finally {
                                        try {
                                            o || null == n.return || n.return()
                                        } finally {
                                            if (a) throw r
                                        }
                                    }
                                    return i
                                }
                            }(e) || function(e) {
                                if (e) {
                                    if ("string" == typeof e) return w(e, 2);
                                    var t = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return w(e, 2)
                                }
                            }(e) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }()),
                            n = r[0],
                            i = r[1];
                        if ("string" == typeof i) {
                            var a = N(n, I(2, 2), function(e) {
                                e.writeString(i)
                            });
                            t.writeVarint(D), t.writeBytes(a)
                        } else if ("boolean" == typeof i) {
                            var l = N(n, I(2, 0), function(e) {
                                e.writeVarint(+!!i)
                            });
                            t.writeVarint(T), t.writeBytes(l)
                        } else if ((void 0 === i ? "undefined" : g(i)) === "bigint") {
                            var c = N(n, I(2, 0), function(e) {
                                e.writeVarint(i)
                            });
                            t.writeVarint(O), t.writeBytes(c)
                        } else if ("number" == typeof i)
                            if (Number.isFinite(i))
                                if (Number.isInteger(i) && i >= -0x80000000 && i <= 0x7fffffff) {
                                    var u = N(n, I(2, 0), function(e) {
                                        e.writeVarint(i)
                                    });
                                    t.writeVarint(S), t.writeBytes(u)
                                } else if (Number.isInteger(i)) {
                            var s = N(n, I(2, 0), function(e) {
                                e.writeVarint(BigInt(i))
                            });
                            t.writeVarint(O), t.writeBytes(s)
                        } else {
                            var f = N(n, I(2, 1), function(e) {
                                e.writeDouble(i)
                            });
                            t.writeVarint(E), t.writeBytes(f)
                        } else {
                            var d = N(n, I(2, 2), function(e) {
                                e.writeString(String(i))
                            });
                            t.writeVarint(D), t.writeBytes(d)
                        }
                    }()
                } catch (e) {
                    n = !0, i = e
                } finally {
                    try {
                        r || null == a.return || a.return()
                    } finally {
                        if (n) throw i
                    }
                }
                return t.toBytes()
            }(e.attributes);
            t.writeVarint(j), t.writeBytes(r)
        }
        return t.toBytes()
    }

    function H(e, t, r) {
        var n = new U;
        n.writeVarint(x), n.writeVarint(r);
        var i = !0,
            o = !1,
            a = void 0;
        try {
            for (var l, c = e[Symbol.iterator](); !(i = (l = c.next()).done); i = !0) {
                var u = l.value;
                n.writeVarint(L), n.writeBytes(u)
            }
        } catch (e) {
            o = !0, a = e
        } finally {
            try {
                i || null == c.return || c.return()
            } finally {
                if (o) throw a
            }
        }
        var s = !0,
            f = !1,
            d = void 0;
        try {
            for (var y, v = t[Symbol.iterator](); !(s = (y = v.next()).done); s = !0) {
                var p = y.value;
                n.writeVarint(C), n.writeBytes(p)
            }
        } catch (e) {
            f = !0, d = e
        } finally {
            try {
                s || null == v.return || v.return()
            } finally {
                if (f) throw d
            }
        }
        return n.toBytes()
    }

    function Y(e) {
        var t = new U;
        t.writeVarint(k), t.writeString("eventstream.enginetelemetry.EngineTelemetryBatchEvent"), t.writeVarint(B), t.writeBytes(e);
        var r = t.toBytes(),
            n = new U;
        return n.writeVarint(_), n.writeBytes(r), n.toBytes()
    }
    var F = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

    function G(e) {
        return F.test(e)
    }
    var q = [],
        $ = !1,
        z = !1;

    function Z(e, t) {
        var r, n, i, o = e.map(function(e) {
                return {
                    name: e.name,
                    value: e.value,
                    timestampMs: e.timestampMs,
                    attributes: e.attributes
                }
            }),
            a = BigInt(Date.now());
        !0 === t || z || "u" > typeof document && "hidden" === document.visibilityState ? (r = Y(H(o.map(M), [], a)).buffer, fetch("".concat(m()).concat("/v1/events/single"), {
            method: "POST",
            headers: {
                "Content-Type": "application/x-protobuf"
            },
            body: r,
            credentials: "include",
            keepalive: !0
        }).catch(h)) : (n = Y(H(o.map(M), [], a)), (i = function() {
            var e, t, r, i, o, a, l, c, u, s, f, d, y;
            return function(e, t) {
                var r, n, i, o = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(a, "next", {
                    value: c(0)
                }), l(a, "throw", {
                    value: c(1)
                }), l(a, "return", {
                    value: c(2)
                }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), a;

                function c(l) {
                    return function(c) {
                        var u = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (o = 0)), o;) try {
                            if (r = 1, n && (i = 2 & u[0] ? n.return : u[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, u[1])).done) return i;
                            switch (n = 0, i && (u = [2 & u[0], i.value]), u[0]) {
                                case 0:
                                case 1:
                                    i = u;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!i || u[1] > i[0] && u[1] < i[3])) {
                                        o.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && o.label < i[1]) {
                                        o.label = i[1], i = u;
                                        break
                                    }
                                    if (i && o.label < i[2]) {
                                        o.label = i[2], o.ops.push(u);
                                        break
                                    }
                                    i[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            u = t.call(e, o)
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
            }(this, function(v) {
                switch (v.label) {
                    case 0:
                        if ("u" < typeof CompressionStream) return [2, {
                            body: n.buffer,
                            compressed: !1
                        }];
                        return (t = (e = new CompressionStream("gzip")).writable.getWriter()).write(n).catch(h), t.close().catch(h), r = [], [4, (i = e.readable.getReader()).read()];
                    case 1:
                        o = v.sent(), v.label = 2;
                    case 2:
                        if (o.done) return [3, 4];
                        return r.push(o.value), [4, i.read()];
                    case 3:
                        return o = v.sent(), [3, 2];
                    case 4:
                        a = new Uint8Array(r.reduce(function(e, t) {
                            return e + t.length
                        }, 0)), l = 0, c = !0, u = !1, s = void 0;
                        try {
                            for (f = r[Symbol.iterator](); !(c = (d = f.next()).done); c = !0) y = d.value, a.set(y, l), l += y.length
                        } catch (e) {
                            u = !0, s = e
                        } finally {
                            try {
                                c || null == f.return || f.return()
                            } finally {
                                if (u) throw s
                            }
                        }
                        return [2, {
                            body: a.buffer,
                            compressed: !0
                        }]
                }
            })
        }, function() {
            var e = this,
                t = arguments;
            return new Promise(function(r, n) {
                var o = i.apply(e, t);

                function a(e) {
                    b(o, r, n, a, l, "next", e)
                }

                function l(e) {
                    b(o, r, n, a, l, "throw", e)
                }
                a(void 0)
            })
        })()).then(function(e) {
            var t = e.body,
                r = e.compressed,
                n = {
                    "Content-Type": "application/x-protobuf"
                };
            return r && (n["Content-Encoding"] = "gzip"), fetch("".concat(m()).concat("/v1/events/single"), {
                method: "POST",
                headers: n,
                body: t,
                credentials: "include",
                keepalive: !0
            })
        }).catch(h)
    }

    function K() {
        var e = !0,
            t = !1,
            r = void 0;
        try {
            for (var n, i = q[Symbol.iterator](); !(e = (n = i.next()).done); e = !0) {
                var o = n.value.splice(0);
                0 !== o.length && Z(o, !0)
            }
        } catch (e) {
            t = !0, r = e
        } finally {
            try {
                e || null == i.return || i.return()
            } finally {
                if (t) throw r
            }
        }
    }
    var W = function(e) {
        var t = e.publish,
            r = e.captureException,
            n = e.featureName;

        function i(e, t, i) {
            if (null != i) {
                var o, a = (null != (o = Error) && "u" > typeof Symbol && o[Symbol.hasInstance] ? !!o[Symbol.hasInstance](i) : i instanceof o) ? i.name || "Error" : "UnknownError",
                    l = n ? "".concat(n, "_").concat(e) : e;
                return null == r || r(i, {
                    error_counter: l
                }), v(y({}, t), {
                    errorType: a
                })
            }
            return t
        }
        return {
            trackCounter: function() {
                for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                var i = p(r, 2);
                t(i[0], i[1])
            },
            trackError: function() {
                for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                var o = p(r, 3),
                    a = o[0],
                    l = o[1],
                    c = o[2],
                    u = i(a, v(y({}, null != l ? l : {}), {
                        severity: "error"
                    }), c);
                t(a, u)
            },
            trackCriticalError: function() {
                for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                var o = p(r, 3),
                    a = o[0],
                    l = o[1],
                    c = o[2],
                    u = i(a, v(y({}, null != l ? l : {}), {
                        severity: "critical"
                    }), c);
                t(a, u)
            }
        }
    }({
        publish: function(e) {
            var t, r = Math.max(1, 10),
                n = 250;

            function i(e, t) {
                console.error(e, t)
            }
            if (!G(e)) return i('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                    name: e
                }),
                function() {};
            var o = [];
            return q.push(o), $ || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                    "hidden" === document.visibilityState && K()
                }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                    z = !0, K()
                }), $ = !0),
                function(a, l, c) {
                    var u = "".concat(e, "_").concat(a);
                    if (! function(e, t) {
                            if (!G(e)) return !1;
                            if (t) {
                                var r = !0,
                                    n = !1,
                                    i = void 0;
                                try {
                                    for (var o, a = Object.keys(t)[Symbol.iterator](); !(r = (o = a.next()).done); r = !0) {
                                        var l = o.value;
                                        if (!G(l)) return !1
                                    }
                                } catch (e) {
                                    n = !0, i = e
                                } finally {
                                    try {
                                        r || null == a.return || a.return()
                                    } finally {
                                        if (n) throw i
                                    }
                                }
                            }
                            return !0
                        }(u, l)) return void i("@rbx/web-telemetry: invalid event name or attribute key", {
                        name: a,
                        attributes: l
                    });
                    var s = null != c ? c : 1;
                    if (!Number.isFinite(s)) return void i("@rbx/web-telemetry: value must be a finite number", {
                        name: a,
                        attributes: l
                    });
                    var f = l && Object.keys(l).length > 0 ? l : void 0;
                    o.push({
                        name: u,
                        attributes: f,
                        value: s,
                        timestampMs: BigInt(Date.now())
                    }), o.length >= r ? (void 0 !== t && (clearTimeout(t), t = void 0), Z(o.splice(0, r))) : void 0 === t && (t = setTimeout(function() {
                        for (t = void 0; o.length > 0;) Z(o.splice(0, r))
                    }, n))
                }
        }("Catalog"),
        captureException: function(e, t) {
            var r;
            console.error(e, t), null == (r = "u" < typeof window ? void 0 : window.Sentry) || r.captureException(e, t ? {
                extra: t
            } : void 0)
        }
    });
    W.trackCounter;
    var J = W.trackError;
    W.trackCriticalError;
    var Q = window.CoreRobloxUtilities;

    function X(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }
    var ee = function(e, t) {
            return "ITEM_DETAILS_HYDRATION_".concat(t.toUpperCase(), "_").concat(e)
        },
        et = function(e) {
            return "ITEM_DETAILS_HYDRATION_".concat(e.toUpperCase(), "_TRACKING")
        },
        er = function(e) {
            var t = [];
            return Q.localStorageService.setLocalStorage(et(e), t), t
        },
        en = function(e) {
            try {
                return Q.localStorageService.getLocalStorage(et(e))
            } catch (e) {
                return
            }
        },
        ei = function(e, t) {
            var r = en(e);
            null == r && (r = er(e)), r.push(t), Q.localStorageService.setLocalStorage(et(e), r)
        },
        eo = function(e, t) {
            try {
                return Q.localStorageService.getLocalStorage(ee(e, t))
            } catch (e) {
                return
            }
        },
        ea = function(e, t, r) {
            if (!r) {
                var n = {};
                n.status = f.DETAILS_LOADING, n.lastModifiedTimestamp = Date.now(), Q.localStorageService.setLocalStorage(ee(e, t), n), ei(t, e)
            }
        },
        el = function(e, t, r, n) {
            if (!n) {
                var i = {};
                i.status = f.DETAILS_HYDRATED, i.details = r, i.lastModifiedTimestamp = Date.now(), Q.localStorageService.setLocalStorage(ee(e, t), i), ei(t, e)
            }
        },
        ec = function(e) {
            var t = en(e),
                r = [];
            null != t && t.forEach(function(t) {
                var n = eo(t, e);
                (null == n ? void 0 : n.lastModifiedTimestamp) === void 0 || Date.now() - (null == n ? void 0 : n.lastModifiedTimestamp) > 1e4 ? Q.localStorageService.removeLocalStorage(ee(t, e)) : r.push(t)
            }), Q.localStorageService.setLocalStorage(et(e), r)
        },
        eu = function() {
            ec("asset"), ec("bundle")
        },
        es = function(e) {
            return new Promise(function(t) {
                return setTimeout(function() {
                    return t(void 0)
                }, e)
            })
        },
        ef = function(e, t) {
            if (!(e.itemRestrictions.includes("Limited") || e.itemRestrictions.includes("LimitedUnique"))) {
                if (e.collectibleItemId && t) {
                    if (e.itemRestrictions.includes("Collectible")) {
                        if (0 === t.unitsAvailableForConsumption || 0 === t.quantityLimitPerUser) return
                    } else if (0 !== t.quantityLimitPerUser) return t.quantityLimitPerUser
                }
                return 1
            }
        },
        ed = function(e, t) {
            if (void 0 !== e) return t ? e - t.totalDiscountAmount : e
        },
        ey = function(e, t) {
            if (!e.isOffSale && !(e.itemRestrictions.includes("Limited") || e.itemRestrictions.includes("LimitedUnique"))) {
                if (e.collectibleItemId && t) {
                    if (e.itemRestrictions.includes("Collectible")) {
                        if (void 0 !== e.collectibleItemId && e.itemRestrictions.includes("Collectible") && (0 === t.unitsAvailableForConsumption || t.lowestResalePrice && 0 !== t.lowestResalePrice && t.lowestResalePrice < t.price || "ExperiencesDevApiOnly" === t.saleLocationType)) {
                            if (0 === t.lowestResalePrice) return;
                            return t.lowestResalePrice
                        }
                        return t.price
                    }
                    if ("ExperiencesDevApiOnly" === t.saleLocationType) return;
                    return t.price
                }
                return ed(e.price, e.discountInformation)
            }
        },
        ev = function(e, t) {
            var r, n;
            return {
                purchasable: (r = e, n = t, !(r.isOffSale || (r.itemRestrictions.includes("Limited") || r.itemRestrictions.includes("LimitedUnique")) && !0 !== r.hasResellers || r.collectibleItemId && n && (void 0 === n || 0 === n.unitsAvailableForConsumption && !1 === n.hasResellers && r.itemRestrictions.includes("Collectible") || !(void 0 !== r.collectibleItemId && r.itemRestrictions.includes("Collectible") && !0 === n.hasResellers && (0 === n.unitsAvailableForConsumption || n.lowestResalePrice && 0 !== n.lowestResalePrice && n.lowestResalePrice < n.price || "ExperiencesDevApiOnly" === n.saleLocationType)) && "ExperiencesDevApiOnly" === n.saleLocationType)) && !r.isOffSale),
                ownershipLimit: ef(e, t),
                purchasePrice: ey(e, t),
                purchaseFromReseller: !!(e.itemRestrictions.includes("Limited") || e.itemRestrictions.includes("LimitedUnique")) || !!e.collectibleItemId && !!t && void 0 !== e.collectibleItemId && e.itemRestrictions.includes("Collectible") && !0 === t.hasResellers && (0 === t.unitsAvailableForConsumption || 0 !== t.lowestResalePrice && t.lowestResalePrice && t.lowestResalePrice < t.price || "ExperiencesDevApiOnly" === t.saleLocationType)
            }
        },
        ep = function(e) {
            if (void 0 !== e.timedOptions && null !== e.timedOptions && 0 !== e.timedOptions.length) {
                var t, r = e.timedOptions,
                    n = e.discountInformation,
                    i = r.find(function(e) {
                        return e.selected
                    }),
                    o = {
                        days: 0,
                        price: null != (t = e.price) ? t : 0,
                        selected: !i
                    };
                return n && (o.discountInformation = n), [o].concat(function(e) {
                    if (Array.isArray(e)) return X(e)
                }(r) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(r) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return X(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return X(e, void 0)
                    }
                }(r) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }())
            }
        };

    function eb(e, t, r, n, i, o, a) {
        try {
            var l = e[o](a),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, i)
    }

    function em(e) {
        return function() {
            var t = this,
                r = arguments;
            return new Promise(function(n, i) {
                var o = e.apply(t, r);

                function a(e) {
                    eb(o, n, i, a, l, "next", e)
                }

                function l(e) {
                    eb(o, n, i, a, l, "throw", e)
                }
                a(void 0)
            })
        }
    }

    function eh(e) {
        for (var t = 1; t < arguments.length; t++) {
            var r = null != arguments[t] ? arguments[t] : {},
                n = Object.keys(r);
            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                return Object.getOwnPropertyDescriptor(r, e).enumerable
            }))), n.forEach(function(t) {
                var n;
                n = r[t], t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n
            })
        }
        return e
    }

    function ew(e, t) {
        return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
            var t = Object.keys(e);
            if (Object.getOwnPropertySymbols) {
                var r = Object.getOwnPropertySymbols(e);
                t.push.apply(t, r)
            }
            return t
        })(Object(t)).forEach(function(r) {
            Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
        }), e
    }

    function eg(e, t) {
        var r, n, i, o = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
            l = Object.defineProperty;
        return l(a, "next", {
            value: c(0)
        }), l(a, "throw", {
            value: c(1)
        }), l(a, "return", {
            value: c(2)
        }), "function" == typeof Symbol && l(a, Symbol.iterator, {
            value: function() {
                return this
            }
        }), a;

        function c(l) {
            return function(c) {
                var u = [l, c];
                if (r) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, u[0] && (o = 0)), o;) try {
                    if (r = 1, n && (i = 2 & u[0] ? n.return : u[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, u[1])).done) return i;
                    switch (n = 0, i && (u = [2 & u[0], i.value]), u[0]) {
                        case 0:
                        case 1:
                            i = u;
                            break;
                        case 4:
                            return o.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            o.label++, n = u[1], u = [0];
                            continue;
                        case 7:
                            u = o.ops.pop(), o.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === u[0] && (!i || u[1] > i[0] && u[1] < i[3])) {
                                o.label = u[1];
                                break
                            }
                            if (6 === u[0] && o.label < i[1]) {
                                o.label = i[1], i = u;
                                break
                            }
                            if (i && o.label < i[2]) {
                                o.label = i[2], o.ops.push(u);
                                break
                            }
                            i[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    u = t.call(e, o)
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
    var eI = function(e, t) {
            return em(function() {
                var r;
                return eg(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (n.trys.push([0, 2, , 3]), t <= 0 || e.length <= 0) return t <= 0 && e.length > 0 && J("ItemDetailsHydrationExhausted"), [2, void 0];
                            return r = [], [4, Promise.resolve(l.httpService.post(s.postItemDetails, {
                                items: e
                            }))];
                        case 1:
                            if (n.sent().data.data.forEach(function(e) {
                                    r.push(ew(eh({}, e), {
                                        purchaseInfo: void 0 === e.collectibleItemId ? ev(e, void 0) : void 0,
                                        timedOptions: ep(e)
                                    }))
                                }), r.length === e.length) return [2, r];
                            return [3, 3];
                        case 2:
                            return n.sent(), [2, eI(e, t - 1)];
                        case 3:
                            return [2, eI(e, t - 1)]
                    }
                })
            })()
        },
        eS = function(e, t) {
            return em(function() {
                var r, n, i;
                return eg(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (r = [], n = [], e.forEach(function(e) {
                                    var t = eo(e.id, e.itemType);
                                    void 0 !== t && t.status === f.DETAILS_HYDRATED ? r.push(t.details) : n.push(e)
                                }), !(n.length > 0 && t > 0)) return [3, 3];
                            return [4, es(500)];
                        case 1:
                            return o.sent(), [4, eS(n, t - 1)];
                        case 2:
                            return (i = o.sent()).hydratedItemDetails = r.concat(i.hydratedItemDetails), [2, i];
                        case 3:
                            return [2, {
                                hydratedItemDetails: r,
                                nonHydratedItemDetails: n
                            }]
                    }
                })
            })()
        },
        eO = function(e, t, r) {
            return em(function() {
                var n, i, o;
                return eg(this, function(a) {
                    switch (a.label) {
                        case 0:
                            for (o = 0, n = function(r) {
                                    var n = t[r],
                                        o = e.find(function(e) {
                                            return e.collectibleItemId === n
                                        });
                                    if (o) {
                                        var a = eo(o.id, o.itemType);
                                        a && void 0 === a.details.collectibleItemDetails && i.push(n)
                                    }
                                }, i = []; o < t.length; o++) n(o);
                            if (!(i.length > 0 && r > 0)) return [3, 3];
                            return [4, es(500)];
                        case 1:
                            return a.sent(), [4, eO(e, i, r - 1)];
                        case 2:
                            a.sent(), a.label = 3;
                        case 3:
                            return [2]
                    }
                })
            })()
        };
    a().ItemDetailsHydrationService = {
        getItemDetails: function(e, t, r) {
            return em(function() {
                var n, i, o, a, c, u, d, y, v, p, b, m, h, w, g;
                return eg(this, function(I) {
                    switch (I.label) {
                        case 0:
                            if (n = null != t && t, eu(), i = [], o = [], a = [], e.forEach(function(e) {
                                    var t = eo(e.id, e.itemType);
                                    null == t ? (o.push(e), ea(e.id, e.itemType, n)) : t.status === f.DETAILS_LOADING || t.status === f.DETAILS_NOT_HYDRATED ? Date.now() - t.lastModifiedTimestamp > 1e3 ? (o.push(e), ea(e.id, e.itemType, n)) : a.push(e) : Date.now() - t.lastModifiedTimestamp > 1e4 ? (o.push(e), ea(e.id, e.itemType, n)) : i.push(t.details)
                                }), !(o.length > 0)) return [3, 2];
                            return [4, Promise.resolve(eI(o, 3))];
                        case 1:
                            void 0 !== (c = I.sent()) && c.forEach(function(e) {
                                el(e.id, e.itemType, e, n), i.push(e)
                            }), I.label = 2;
                        case 2:
                            return [4, eS(a, 3)];
                        case 3:
                            if ((u = I.sent()).hydratedItemDetails.forEach(function(e) {
                                    i.push(e)
                                }), !(u.nonHydratedItemDetails.length > 0)) return [3, 5];
                            return [4, Promise.resolve(eI(a, 3))];
                        case 4:
                            void 0 !== (d = I.sent()) && d.forEach(function(e) {
                                el(e.id, e.itemType, e, n), i.push(e)
                            }), I.label = 5;
                        case 5:
                            if (y = [], v = [], i.forEach(function(e) {
                                    var t = eo(e.id, e.itemType),
                                        r = null == t ? void 0 : t.details;
                                    if ((null == r ? void 0 : r.collectibleItemId) && void 0 === r.collectibleItemDetails)
                                        if (r.collectibleItemDetailsLoading) v.push(r.collectibleItemId);
                                        else {
                                            var i = ew(eh({}, r), {
                                                collectibleItemDetailsLoading: !0
                                            });
                                            el(i.id, i.itemType, i, n), y.push(r.collectibleItemId)
                                        }
                                }), !(y.length > 0 && r)) return [3, 7];
                            return p = function(e) {
                                var t = b.data[e],
                                    r = i.find(function(e) {
                                        return e.collectibleItemId === t.collectibleItemId
                                    });
                                void 0 !== r && (t.purchaseInfo = ev(r, t), r.collectibleItemDetails = t, el(r.id, r.itemType, r, n))
                            }, [4, Promise.resolve(l.httpService.post(s.postCollectibleItemDetails, {
                                itemIds: y
                            }))];
                        case 6:
                            for (m = 0, b = I.sent(); m < b.data.length; m++) p(m);
                            I.label = 7;
                        case 7:
                            return [4, eO(i, v, 5)];
                        case 8:
                            for (I.sent(), h = 0; h < i.length; h++)(g = eo((w = i[h]).id, w.itemType)) && (w.collectibleItemDetails = g.details.collectibleItemDetails);
                            return [2, i]
                    }
                })
            })()
        }
    }
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("ItemDetailsHydrationService");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/itemDetailsHydrationService-cd56ebf1141f05e7.js.map