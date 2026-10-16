! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "b6287495c64504c2ac59b864c339e4b56107f081"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "ee7a3062-2ec6-4711-9046-97eb56070b52", e._sentryDebugIdIdentifier = "sentry-dbid-ee7a3062-2ec6-4711-9046-97eb56070b52")
    } catch (e) {}
}(),
function() {
    var e = {
            611: function(e) {
                function t(e) {
                    return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
                }!
                /*!
                	Copyright (c) 2018 Jed Watson.
                	Licensed under the MIT License (MIT), see
                	http://jedwatson.github.io/classnames
                */
                function() {
                    "use strict";
                    var r = {}.hasOwnProperty;

                    function n() {
                        for (var e = "", o = 0; o < arguments.length; o++) {
                            var a = arguments[o];
                            a && (e = i(e, function(e) {
                                if ("string" == typeof e || "number" == typeof e) return e;
                                if ((void 0 === e ? "undefined" : t(e)) !== "object") return "";
                                if (Array.isArray(e)) return n.apply(null, e);
                                if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                                var o = "";
                                for (var a in e) r.call(e, a) && e[a] && (o = i(o, a));
                                return o
                            }(a)))
                        }
                        return e
                    }

                    function i(e, t) {
                        return t ? e ? e + " " + t : e + t : e
                    }
                    e.exports ? (n.default = n, e.exports = n) : "function" == typeof define && "object" === t(define.amd) && define.amd ? define("classnames", [], function() {
                        return n
                    }) : window.classNames = n
                }()
            }
        },
        t = {};

    function r(n) {
        var i = t[n];
        if (void 0 !== i) return i.exports;
        var o = t[n] = {
            exports: {}
        };
        return e[n](o, o.exports, r), o.exports
    }
    r.m = e, r.n = function(e) {
            var t = e && e.__esModule ? function() {
                return e.default
            } : function() {
                return e
            };
            return r.d(t, {
                a: t
            }), t
        }, r.d = function(e, t) {
            for (var n in t) r.o(t, n) && !r.o(e, n) && Object.defineProperty(e, n, {
                enumerable: !0,
                get: t[n]
            })
        }, r.o = function(e, t) {
            return Object.prototype.hasOwnProperty.call(e, t)
        }, r.r = function(e) {
            "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(e, "__esModule", {
                value: !0
            })
        }, r.rv = function() {
            return "1.7.12"
        }, r.ruid = "bundler=rspack@1.7.12",
        function() {
            "use strict";
            var e, t, n = window.ReactJSX,
                i = window.Roblox["core-scripts"].util.ready,
                o = r.n(i),
                a = window.Roblox["core-scripts"].react,
                u = window.PropTypes,
                c = r.n(u),
                l = window.React,
                s = r(611),
                f = r.n(s),
                y = function() {
                    if ("u" > typeof document) {
                        var e = document.querySelector('meta[name="page-meta"]');
                        return null == e ? void 0 : e.dataset.internalPageName
                    }
                },
                b = ["JPY"];

            function p(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function v(e) {
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

            function d(e, t) {
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

            function m(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            u = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            u = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return p(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return p(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var w = globalThis.window,
                g = void 0 === w ? void 0 : w,
                h = function(e, t) {
                    var r;
                    null == g || null == (r = g.Sentry) || r.captureException(e, t ? {
                        tags: t
                    } : void 0)
                };
            window.Roblox["core-scripts"].http.http;
            var S = window.Roblox["core-scripts"].environmentUrls,
                O = r.n(S);

            function j(e, t, r, n, i, o, a) {
                try {
                    var u = e[o](a),
                        c = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(c) : Promise.resolve(c).then(n, i)
            }

            function x() {
                return null != t || (t = "".concat(O().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), t
            }
            var P = function() {};

            function B(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function E(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var k = function(e, t) {
                    return e << 3 | t
                },
                N = k(1, 2),
                D = k(2, 2),
                V = k(5, 2),
                C = k(6, 2),
                I = k(8, 2),
                A = k(1, 2),
                T = k(2, 1),
                _ = k(3, 0),
                R = k(5, 2);
            k(1, 2), k(2, 1), k(3, 0), k(4, 2), k(5, 2), k(6, 0), k(8, 2);
            var M = k(4, 0),
                F = k(6, 2),
                U = k(7, 2);
            k(1, 0), k(2, 2);
            var L = k(1, 2),
                q = k(2, 2),
                z = k(1, 2);
            k(1, 2), k(2, 2), k(1, 2);
            var $ = new TextEncoder,
                W = function() {
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
                                var t = (void 0 === e ? "undefined" : E(e)) === "bigint" ? e : BigInt(Math.trunc(e));
                                for (t < BigInt(0) && (t += BigInt(1) << BigInt(64)); t > BigInt(127);) this.buf.push(128 | Number(t & BigInt(127))), t >>= BigInt(7);
                                this.buf.push(Number(t))
                            }
                        }, {
                            key: "writeString",
                            value: function(e) {
                                var t = $.encode(e);
                                this.writeVarint(t.length);
                                var r = !0,
                                    n = !1,
                                    i = void 0;
                                try {
                                    for (var o, a = t[Symbol.iterator](); !(r = (o = a.next()).done); r = !0) {
                                        var u = o.value;
                                        this.buf.push(u)
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

            function G(e, t, r) {
                var n = new W;
                return n.writeVarint(k(1, 2)), n.writeString(e), n.writeVarint(t), r(n), n.toBytes()
            }

            function J(e) {
                var t = new W;
                if (t.writeVarint(A), t.writeString(e.name), t.writeVarint(T), t.writeDouble(e.value), t.writeVarint(_), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
                    var r = function(e) {
                        var t = new W,
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
                                            if ("string" == typeof e) return B(e, 2);
                                            var t = Object.prototype.toString.call(e).slice(8, -1);
                                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return B(e, 2)
                                        }
                                    }(e) || function() {
                                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                    }()),
                                    n = r[0],
                                    i = r[1];
                                if ("string" == typeof i) {
                                    var a = G(n, k(2, 2), function(e) {
                                        e.writeString(i)
                                    });
                                    t.writeVarint(V), t.writeBytes(a)
                                } else if ("boolean" == typeof i) {
                                    var u = G(n, k(2, 0), function(e) {
                                        e.writeVarint(+!!i)
                                    });
                                    t.writeVarint(C), t.writeBytes(u)
                                } else if ((void 0 === i ? "undefined" : E(i)) === "bigint") {
                                    var c = G(n, k(2, 0), function(e) {
                                        e.writeVarint(i)
                                    });
                                    t.writeVarint(D), t.writeBytes(c)
                                } else if ("number" == typeof i)
                                    if (Number.isFinite(i))
                                        if (Number.isInteger(i) && i >= -0x80000000 && i <= 0x7fffffff) {
                                            var l = G(n, k(2, 0), function(e) {
                                                e.writeVarint(i)
                                            });
                                            t.writeVarint(N), t.writeBytes(l)
                                        } else if (Number.isInteger(i)) {
                                    var s = G(n, k(2, 0), function(e) {
                                        e.writeVarint(BigInt(i))
                                    });
                                    t.writeVarint(D), t.writeBytes(s)
                                } else {
                                    var f = G(n, k(2, 1), function(e) {
                                        e.writeDouble(i)
                                    });
                                    t.writeVarint(I), t.writeBytes(f)
                                } else {
                                    var y = G(n, k(2, 2), function(e) {
                                        e.writeString(String(i))
                                    });
                                    t.writeVarint(V), t.writeBytes(y)
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
                    t.writeVarint(R), t.writeBytes(r)
                }
                return t.toBytes()
            }

            function Y(e, t, r) {
                var n = new W;
                n.writeVarint(M), n.writeVarint(r);
                var i = !0,
                    o = !1,
                    a = void 0;
                try {
                    for (var u, c = e[Symbol.iterator](); !(i = (u = c.next()).done); i = !0) {
                        var l = u.value;
                        n.writeVarint(F), n.writeBytes(l)
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
                    y = void 0;
                try {
                    for (var b, p = t[Symbol.iterator](); !(s = (b = p.next()).done); s = !0) {
                        var v = b.value;
                        n.writeVarint(U), n.writeBytes(v)
                    }
                } catch (e) {
                    f = !0, y = e
                } finally {
                    try {
                        s || null == p.return || p.return()
                    } finally {
                        if (f) throw y
                    }
                }
                return n.toBytes()
            }

            function Z(e) {
                var t = new W;
                t.writeVarint(L), t.writeString("eventstream.enginetelemetry.EngineTelemetryBatchEvent"), t.writeVarint(q), t.writeBytes(e);
                var r = t.toBytes(),
                    n = new W;
                return n.writeVarint(z), n.writeBytes(r), n.toBytes()
            }
            var X = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

            function H(e) {
                return X.test(e)
            }
            var K = [],
                Q = !1,
                ee = !1;

            function et(e, t) {
                var r, n, i, o = e.map(function(e) {
                        return {
                            name: e.name,
                            value: e.value,
                            timestampMs: e.timestampMs,
                            attributes: e.attributes
                        }
                    }),
                    a = BigInt(Date.now());
                !0 === t || ee || "u" > typeof document && "hidden" === document.visibilityState ? (r = Z(Y(o.map(J), [], a)).buffer, fetch("".concat(x()).concat("/v1/events/single"), {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-protobuf"
                    },
                    body: r,
                    credentials: "include",
                    keepalive: !0
                }).catch(P)) : (n = Z(Y(o.map(J), [], a)), (i = function() {
                    var e, t, r, i, o, a, u, c, l, s, f, y, b;
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
                            u = Object.defineProperty;
                        return u(a, "next", {
                            value: c(0)
                        }), u(a, "throw", {
                            value: c(1)
                        }), u(a, "return", {
                            value: c(2)
                        }), "function" == typeof Symbol && u(a, Symbol.iterator, {
                            value: function() {
                                return this
                            }
                        }), a;

                        function c(u) {
                            return function(c) {
                                var l = [u, c];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; a && (a = 0, l[0] && (o = 0)), o;) try {
                                    if (r = 1, n && (i = 2 & l[0] ? n.return : l[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, l[1])).done) return i;
                                    switch (n = 0, i && (l = [2 & l[0], i.value]), l[0]) {
                                        case 0:
                                        case 1:
                                            i = l;
                                            break;
                                        case 4:
                                            return o.label++, {
                                                value: l[1],
                                                done: !1
                                            };
                                        case 5:
                                            o.label++, n = l[1], l = [0];
                                            continue;
                                        case 7:
                                            l = o.ops.pop(), o.trys.pop();
                                            continue;
                                        default:
                                            if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                                o = 0;
                                                continue
                                            }
                                            if (3 === l[0] && (!i || l[1] > i[0] && l[1] < i[3])) {
                                                o.label = l[1];
                                                break
                                            }
                                            if (6 === l[0] && o.label < i[1]) {
                                                o.label = i[1], i = l;
                                                break
                                            }
                                            if (i && o.label < i[2]) {
                                                o.label = i[2], o.ops.push(l);
                                                break
                                            }
                                            i[2] && o.ops.pop(), o.trys.pop();
                                            continue
                                    }
                                    l = t.call(e, o)
                                } catch (e) {
                                    l = [6, e], n = 0
                                } finally {
                                    r = i = 0
                                }
                                if (5 & l[0]) throw l[1];
                                return {
                                    value: l[0] ? l[1] : void 0,
                                    done: !0
                                }
                            }
                        }
                    }(this, function(p) {
                        switch (p.label) {
                            case 0:
                                if ("u" < typeof CompressionStream) return [2, {
                                    body: n.buffer,
                                    compressed: !1
                                }];
                                return (t = (e = new CompressionStream("gzip")).writable.getWriter()).write(n).catch(P), t.close().catch(P), r = [], [4, (i = e.readable.getReader()).read()];
                            case 1:
                                o = p.sent(), p.label = 2;
                            case 2:
                                if (o.done) return [3, 4];
                                return r.push(o.value), [4, i.read()];
                            case 3:
                                return o = p.sent(), [3, 2];
                            case 4:
                                a = new Uint8Array(r.reduce(function(e, t) {
                                    return e + t.length
                                }, 0)), u = 0, c = !0, l = !1, s = void 0;
                                try {
                                    for (f = r[Symbol.iterator](); !(c = (y = f.next()).done); c = !0) b = y.value, a.set(b, u), u += b.length
                                } catch (e) {
                                    l = !0, s = e
                                } finally {
                                    try {
                                        c || null == f.return || f.return()
                                    } finally {
                                        if (l) throw s
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
                            j(o, r, n, a, u, "next", e)
                        }

                        function u(e) {
                            j(o, r, n, a, u, "throw", e)
                        }
                        a(void 0)
                    })
                })()).then(function(e) {
                    var t = e.body,
                        r = e.compressed,
                        n = {
                            "Content-Type": "application/x-protobuf"
                        };
                    return r && (n["Content-Encoding"] = "gzip"), fetch("".concat(x()).concat("/v1/events/single"), {
                        method: "POST",
                        headers: n,
                        body: t,
                        credentials: "include",
                        keepalive: !0
                    })
                }).catch(P)
            }

            function er() {
                var e = !0,
                    t = !1,
                    r = void 0;
                try {
                    for (var n, i = K[Symbol.iterator](); !(e = (n = i.next()).done); e = !0) {
                        var o = n.value.splice(0);
                        0 !== o.length && et(o, !0)
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
            var en = "PaymentsPackage",
                ei = function(e) {
                    var t, r = Math.max(1, 10),
                        n = 250;

                    function i(e, t) {
                        console.error(e, t)
                    }
                    if (!H(e)) return i('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                            name: e
                        }),
                        function() {};
                    var o = [];
                    return K.push(o), Q || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                            "hidden" === document.visibilityState && er()
                        }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                            ee = !0, er()
                        }), Q = !0),
                        function(a, u, c) {
                            var l = "".concat(e, "_").concat(a);
                            if (! function(e, t) {
                                    if (!H(e)) return !1;
                                    if (t) {
                                        var r = !0,
                                            n = !1,
                                            i = void 0;
                                        try {
                                            for (var o, a = Object.keys(t)[Symbol.iterator](); !(r = (o = a.next()).done); r = !0) {
                                                var u = o.value;
                                                if (!H(u)) return !1
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
                                }(l, u)) return void i("@rbx/web-telemetry: invalid event name or attribute key", {
                                name: a,
                                attributes: u
                            });
                            var s = null != c ? c : 1;
                            if (!Number.isFinite(s)) return void i("@rbx/web-telemetry: value must be a finite number", {
                                name: a,
                                attributes: u
                            });
                            var f = u && Object.keys(u).length > 0 ? u : void 0;
                            o.push({
                                name: l,
                                attributes: f,
                                value: s,
                                timestampMs: BigInt(Date.now())
                            }), o.length >= r ? (void 0 !== t && (clearTimeout(t), t = void 0), et(o.splice(0, r))) : void 0 === t && (t = setTimeout(function() {
                                for (t = void 0; o.length > 0;) et(o.splice(0, r))
                            }, n))
                        }
                }(en),
                eo = function(e) {
                    var t = e.publish,
                        r = e.captureException,
                        n = e.featureName;

                    function i(e, t, i) {
                        if (null != i) {
                            var o, a = (null != (o = Error) && "u" > typeof Symbol && o[Symbol.hasInstance] ? !!o[Symbol.hasInstance](i) : i instanceof o) ? i.name || "Error" : "UnknownError",
                                u = n ? "".concat(n, "_").concat(e) : e;
                            return null == r || r(i, {
                                error_counter: u
                            }), d(v({}, t), {
                                errorType: a
                            })
                        }
                        return t
                    }
                    return {
                        trackCounter: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var i = m(r, 2);
                            t(i[0], i[1])
                        },
                        trackError: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var o = m(r, 3),
                                a = o[0],
                                u = o[1],
                                c = o[2],
                                l = i(a, d(v({}, null != u ? u : {}), {
                                    severity: "error"
                                }), c);
                            t(a, l)
                        },
                        trackCriticalError: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var o = m(r, 3),
                                a = o[0],
                                u = o[1],
                                c = o[2],
                                l = i(a, d(v({}, null != u ? u : {}), {
                                    severity: "critical"
                                }), c);
                            t(a, l)
                        }
                    }
                }({
                    publish: ei,
                    captureException: h
                }),
                ea = eo.trackCounter,
                eu = (eo.trackError, eo.trackCriticalError);

            function ec(e) {
                var t = function(e) {
                        var t, r = e.amount,
                            n = e.currencyCode,
                            i = e.tagClassName,
                            o = Math.abs(r),
                            a = "".concat(o).concat(n),
                            u = f()("price-tag", i);
                        try {
                            var c, l = (c = Intl.NumberFormat().resolvedOptions().locale).startsWith("ar-") ? (ea("PriceTag_ArabicLocaleTriggered"), c.replace("ar-", "en-")) : c,
                                s = {
                                    style: "currency",
                                    currency: n,
                                    notation: "standard"
                                };
                            o >= 1e4 && !b.includes(n) && (s.minimumFractionDigits = 0, s.maximumFractionDigits = 2, s.maximumSignificantDigits = 21, s.notation = "compact"), u.split(" ").includes("navbar-compact") && (s.maximumSignificantDigits = 4), a = Intl.NumberFormat(l, s).format(o)
                        } catch (e) {
                            eu("PriceTag_NumberFormatLocaleException", {
                                currencyCode: null === n ? "null" : void 0 === n ? "undefined" : "" === n ? "empty" : "string" == typeof n && /^[a-z]{3}$/i.test(n) ? n.toUpperCase() : "invalid",
                                internalPageName: null != (t = y()) ? t : "unknown"
                            })
                        }
                        return {
                            formattedAmount: a,
                            isNegative: r < 0,
                            className: u
                        }
                    }({
                        amount: e.amount,
                        currencyCode: e.currencyCode,
                        tagClassName: e.tagClassName
                    }),
                    r = t.formattedAmount,
                    i = t.isNegative,
                    o = t.className;
                return (0, n.jsxs)("div", {
                    className: "d-flex-inline gap-1 justify-content-start align-items-center",
                    children: [i && (0, n.jsx)("span", {
                        className: o,
                        children: "-"
                    }), (0, n.jsx)("span", {
                        className: o,
                        children: r
                    })]
                })
            }

            function el(e) {
                var t, r, i, o, a, u = e.containerDataset,
                    c = e.options,
                    l = null != (i = null == c ? void 0 : c.amount) ? i : parseFloat(null != (o = null == u ? void 0 : u.amount) ? o : ""),
                    s = null != (a = null == c ? void 0 : c.currencyCode) ? a : null == u ? void 0 : u.currencyCode;
                return !s || !l && 0 !== l || Number.isNaN(l) ? (eu("PriceTag_DataNotValid", {
                    currencyCode: null != s ? s : "unknown"
                }), null) : (0, n.jsx)(ec, (t = function(e) {
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
                }({}, c), r = r = {
                    amount: l,
                    currencyCode: s
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(r)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(r)).forEach(function(e) {
                    Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(r, e))
                }), t))
            }(e = {
                publish: ei,
                captureException: h,
                featureName: en
            }).publish, e.captureException, e.featureName, l.Component, ec.propTypes = {
                amount: c().number.isRequired,
                currencyCode: c().string.isRequired
            }, el.defaultProps = {
                containerDataset: {},
                options: {}
            }, el.propTypes = {
                containerDataset: c().shape({
                    amount: c().string,
                    currencyCode: c().string
                }),
                options: c().shape({
                    amount: c().number,
                    currencyCode: c().string,
                    tagClassName: c().string
                })
            }, o()(function() {
                window.addEventListener("price-tag:render", function(e) {
                    var t, r, i, o;
                    i = null != (r = null == (t = e.detail) ? void 0 : t.targetSelector) ? r : ".fiat-price-tag", 0 === (o = document.querySelectorAll(i)).length && (o = document.querySelectorAll("#fiat-price-tag")), o.forEach(function(e) {
                        var r = e.dataset;
                        (0, a.renderWithErrorBoundary)((0, n.jsx)(el, {
                            containerDataset: r,
                            options: t
                        }), e)
                    })
                })
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("PriceTag");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/priceTag-0818344f6e840f90.js.map