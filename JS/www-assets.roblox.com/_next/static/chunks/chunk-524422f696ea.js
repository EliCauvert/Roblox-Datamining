;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "249dd7cb-a64d-15f8-d95e-d1dd66e511f5")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 160963, 214147, e => {
    "use strict";
    let t;
    var r = e.i(868275),
        n = e.i(245837);

    function i() {
        return t ??= `${n.default.apiGatewayUrl.replace(/\/$/,"")}/experience-signals-ingest/public`
    }
    let a = () => void 0;
    async function o(e) {
        if ("u" < typeof CompressionStream) return {
            body: e.buffer,
            compressed: !1
        };
        let t = new CompressionStream("gzip"),
            r = t.writable.getWriter();
        r.write(e).catch(a), r.close().catch(a);
        let n = [],
            i = t.readable.getReader(),
            o = await i.read();
        for (; !o.done;) n.push(o.value), o = await i.read();
        let l = new Uint8Array(n.reduce((e, t) => e + t.length, 0)),
            u = 0;
        for (let e of n) l.set(e, u), u += e.length;
        return {
            body: l.buffer,
            compressed: !0
        }
    }

    function l(e, t) {
        fetch(`${i()}${e}`, {
            method: "POST",
            headers: {
                "Content-Type": "application/x-protobuf"
            },
            body: t,
            credentials: "include",
            keepalive: !0
        }).catch(a)
    }

    function u(e, t) {
        o(t).then(t => {
            let {
                body: r,
                compressed: n
            } = t, a = {
                "Content-Type": "application/x-protobuf"
            };
            return n && (a["Content-Encoding"] = "gzip"), fetch(`${i()}${e}`, {
                method: "POST",
                headers: a,
                body: r,
                credentials: "include",
                keepalive: !0
            })
        }).catch(a)
    }
    let s = (e, t) => e << 3 | t,
        c = s(1, 2),
        f = s(2, 2),
        d = s(5, 2),
        p = s(6, 2),
        m = s(8, 2),
        y = s(1, 2),
        g = s(2, 1),
        w = s(3, 0),
        h = s(5, 2),
        b = s(1, 2),
        v = s(2, 1),
        x = s(3, 0),
        V = s(4, 2),
        B = s(5, 2),
        E = s(6, 0),
        N = s(8, 2),
        S = s(4, 0),
        T = s(6, 2),
        _ = s(7, 2),
        C = s(1, 0),
        k = s(2, 2),
        A = s(1, 2),
        O = s(2, 2),
        M = s(1, 2),
        P = s(1, 2),
        D = s(2, 2),
        I = s(1, 2),
        $ = "eventstream.enginetelemetry.EngineTelemetryBatchEvent",
        j = new TextEncoder;
    class F {
        writeVarint(e) {
            let t = "bigint" == typeof e ? e : BigInt(Math.trunc(e));
            for (t < BigInt(0) && (t += BigInt(1) << BigInt(64)); t > BigInt(127);) this.buf.push(128 | Number(t & BigInt(127))), t >>= BigInt(7);
            this.buf.push(Number(t))
        }
        writeString(e) {
            let t = j.encode(e);
            for (let e of (this.writeVarint(t.length), t)) this.buf.push(e)
        }
        writeBytes(e) {
            for (let t of (this.writeVarint(e.length), e)) this.buf.push(t)
        }
        writeDouble(e) {
            let t = new DataView(new ArrayBuffer(8));
            t.setFloat64(0, e, !0);
            for (let e = 0; e < 8; e += 1) this.buf.push(t.getUint8(e))
        }
        toBytes() {
            return new Uint8Array(this.buf)
        }
        constructor() {
            (0, r._)(this, "buf", [])
        }
    }
    let K = 0x80000000 - 1;

    function R(e, t, r) {
        let n = new F;
        return n.writeVarint(s(1, 2)), n.writeString(e), n.writeVarint(t), r(n), n.toBytes()
    }

    function W(e) {
        let t = new F;
        for (let [r, n] of Object.entries(e))
            if ("string" == typeof n) {
                let e = R(r, s(2, 2), e => {
                    e.writeString(n)
                });
                t.writeVarint(d), t.writeBytes(e)
            } else if ("boolean" == typeof n) {
            let e = R(r, s(2, 0), e => {
                e.writeVarint(+!!n)
            });
            t.writeVarint(p), t.writeBytes(e)
        } else if ("bigint" == typeof n) {
            let e = R(r, s(2, 0), e => {
                e.writeVarint(n)
            });
            t.writeVarint(f), t.writeBytes(e)
        } else if ("number" == typeof n)
            if (Number.isFinite(n))
                if (Number.isInteger(n) && n >= -0x80000000 && n <= K) {
                    let e = R(r, s(2, 0), e => {
                        e.writeVarint(n)
                    });
                    t.writeVarint(c), t.writeBytes(e)
                } else if (Number.isInteger(n)) {
            let e = R(r, s(2, 0), e => {
                e.writeVarint(BigInt(n))
            });
            t.writeVarint(f), t.writeBytes(e)
        } else {
            let e = R(r, s(2, 1), e => {
                e.writeDouble(n)
            });
            t.writeVarint(m), t.writeBytes(e)
        } else {
            let e = R(r, s(2, 2), e => {
                e.writeString(String(n))
            });
            t.writeVarint(d), t.writeBytes(e)
        }
        return t.toBytes()
    }

    function z(e) {
        let t = new F;
        if (t.writeVarint(y), t.writeString(e.name), t.writeVarint(g), t.writeDouble(e.value), t.writeVarint(w), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
            let r = W(e.attributes);
            t.writeVarint(h), t.writeBytes(r)
        }
        return t.toBytes()
    }

    function L(e) {
        let t = new F;
        if (t.writeVarint(b), t.writeString(e.name), t.writeVarint(v), t.writeDouble(e.sum), t.writeVarint(x), t.writeVarint(e.count), e.countsInBuckets.length > 0) {
            let r = new F;
            for (let t of e.countsInBuckets) r.writeVarint(t);
            let n = r.toBytes();
            t.writeVarint(V), t.writeBytes(n)
        }
        if (e.bucketIndices.length > 0) {
            let r = new F;
            for (let t of e.bucketIndices) r.writeVarint(t);
            let n = r.toBytes();
            t.writeVarint(B), t.writeBytes(n)
        }
        if (t.writeVarint(E), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
            let r = W(e.attributes);
            t.writeVarint(N), t.writeBytes(r)
        }
        return t.toBytes()
    }

    function H(e, t, r) {
        let n = new F;
        for (let t of (n.writeVarint(S), n.writeVarint(r), e)) n.writeVarint(T), n.writeBytes(t);
        for (let e of t) n.writeVarint(_), n.writeBytes(e);
        return n.toBytes()
    }

    function U(e, t, r, n, i) {
        let a = new F;
        for (let t of (a.writeVarint(C), a.writeVarint(n), a.writeVarint(k), a.writeString(i), a.writeVarint(S), a.writeVarint(r), e)) a.writeVarint(T), a.writeBytes(t);
        for (let e of t) a.writeVarint(_), a.writeBytes(e);
        return a.toBytes()
    }

    function Z(e) {
        let t = new F;
        t.writeVarint(A), t.writeString($), t.writeVarint(O), t.writeBytes(e);
        let r = t.toBytes(),
            n = new F;
        return n.writeVarint(M), n.writeBytes(r), n.toBytes()
    }

    function G(e) {
        let t = new F;
        for (let r of (t.writeVarint(P), t.writeString($), e)) t.writeVarint(D), t.writeBytes(r);
        let r = t.toBytes(),
            n = new F;
        return n.writeVarint(I), n.writeBytes(r), n.toBytes()
    }
    e.s(["sendCounterBatch", 0, function(e, t) {
        u("/v1/events/single", Z(H(e.map(z), [], t)))
    }, "sendCounterBatchSync", 0, function(e, t) {
        l("/v1/events/single", Z(H(e.map(z), [], t)).buffer)
    }, "sendHistogramBatch", 0, function(e, t, r, n) {
        u("/v1/events/optimized", G([U([], e.map(L), t, r, n)]))
    }, "sendHistogramBatchSync", 0, function(e, t, r, n) {
        l("/v1/events/optimized", G([U([], e.map(L), t, r, n)]).buffer)
    }], 160963);
    let q = /^[a-zA-Z_][a-zA-Z0-9_]*$/;
    e.s(["isValidIdentifier", 0, function(e) {
        return q.test(e)
    }], 214147)
}, 333982, e => {
    "use strict";
    var t = e.i(160963),
        r = e.i(214147);
    let n = [],
        i = !1,
        a = !1;

    function o(e, r) {
        let n = e.map(e => ({
                name: e.name,
                value: e.value,
                timestampMs: e.timestampMs,
                attributes: e.attributes
            })),
            i = BigInt(Date.now());
        !0 === r || a || "u" > typeof document && "hidden" === document.visibilityState ? (0, t.sendCounterBatchSync)(n, i) : (0, t.sendCounterBatch)(n, i)
    }

    function l() {
        for (let e of n) {
            let t = e.splice(0);
            0 !== t.length && o(t, !0)
        }
    }
    e.s(["createFireTelemetryCounter", 0, function(e, t) {
        let u, s = Math.max(1, t?.batchSize ?? 10),
            c = t?.batchIntervalMs ?? 250;

        function f(e, r) {
            t?.onError ? t.onError(e, r) : console.error(e, r)
        }
        if (!(0, r.isValidIdentifier)(e)) return f(`@rbx/web-telemetry: invalid featureName "${e}"`, {
            name: e
        }), () => {};
        let d = [];
        return n.push(d), i || ("u" > typeof document && document.addEventListener("visibilitychange", () => {
                "hidden" === document.visibilityState && l()
            }), window.addEventListener("beforeunload", () => {
                a = !0, l()
            }), i = !0),
            function(t, n, i) {
                let a = `${e}_${t}`;
                if (! function(e, t) {
                        if (!(0, r.isValidIdentifier)(e)) return !1;
                        if (t) {
                            for (let e of Object.keys(t))
                                if (!(0, r.isValidIdentifier)(e)) return !1
                        }
                        return !0
                    }(a, n)) return void f("@rbx/web-telemetry: invalid event name or attribute key", {
                    name: t,
                    attributes: n
                });
                let l = i ?? 1;
                if (!Number.isFinite(l)) return void f("@rbx/web-telemetry: value must be a finite number", {
                    name: t,
                    attributes: n
                });
                let p = n && Object.keys(n).length > 0 ? n : void 0;
                d.push({
                    name: a,
                    attributes: p,
                    value: l,
                    timestampMs: BigInt(Date.now())
                }), d.length >= s ? (void 0 !== u && (clearTimeout(u), u = void 0), o(d.splice(0, s))) : void 0 === u && (u = setTimeout(() => {
                    for (u = void 0; d.length > 0;) o(d.splice(0, s))
                }, c))
            }
    }])
}, 824890, e => {
    "use strict";
    var t = e.i(19836),
        r = e.i(420482);
    let n = "__FN_nvfToKPAOuiV__",
        i = "__FN_END_nvfToKPAOuiV__",
        a = RegExp(`${n}(\\d+)\\|`),
        o = RegExp(`${i}(\\d+)\\|`);
    e.s(["renderHtml", 0, (e, l, u) => {
        let s = {
                ...u
            },
            c = {};
        l.forEach((e, t) => {
            let r = t.toString(),
                a = `${n}${r}|`,
                o = `${i}${r}|`;
            s[e.opening] = a, s[e.closing] = o, c[r] = {
                start: a,
                end: o,
                render: e.render
            }
        });
        let f = e => {
                let t = [],
                    r = a.exec(e),
                    n = o.exec(e);
                if (n && (!r || n.index < r.index)) return null;
                if (!r) return [e];
                r.index > 0 && t.push(e.slice(0, r.index));
                let i = null == r[1] ? void 0 : c[r[1]];
                if (null == i) return null;
                let l = e.indexOf(i.end);
                if (l < r.index + r[0].length) return null;
                let u = f(e.slice(r.index + r[0].length, l));
                if (null == u) return null;
                t.push(i.render(u));
                let s = e.slice(l + i.end.length);
                if (s.length > 0) {
                    let e = f(s);
                    if (null == e) return null;
                    t.push(...e)
                }
                return t
            },
            d = f(e(s));
        return null == d ? null : d.filter(e => "" !== e).map((e, n) => (0, t.jsx)(r.Fragment, {
            children: e
        }, n))
    }])
}, 564948, e => {
    "use strict";
    e.s(["createTrackers", 0, function(e, t) {
        let {
            publish: r,
            captureException: n,
            featureName: i
        } = t;

        function a(e, t, r) {
            if (null != r) {
                let a = r instanceof Error ? r.name || "Error" : "UnknownError",
                    o = i ? `${i}_${e}` : e;
                return n?.(r, {
                    error_counter: o
                }), {
                    ...t,
                    errorType: a
                }
            }
            return t
        }
        return {
            trackCounter() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                let [i, a] = t;
                r(i, a)
            },
            trackError() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                let [i, o, l] = t, u = a(i, {
                    ...o ?? {},
                    severity: "error"
                }, l);
                r(i, u)
            },
            trackCriticalError() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                let [i, o, l] = t, u = a(i, {
                    ...o ?? {},
                    severity: "critical"
                }, l);
                r(i, u)
            }
        }
    }])
}, 682877, e => {
    "use strict";
    var t = e.i(824890),
        r = e.i(61907),
        n = e.i(564948),
        i = e.i(333982);
    let a = {
            featureName: "WwwCommon",
            team: "Economy > Payments & Fraud",
            features: {
                i18n: {
                    errors: [{
                        name: "TranslationKeyNotFound",
                        dimensions: ["namespace", "key", "internalPageName"]
                    }, {
                        name: "TranslationMalformed",
                        dimensions: ["namespace", "key", "internalPageName"]
                    }]
                }
            }
        },
        o = (0, i.createFireTelemetryCounter)(a.featureName),
        {
            trackCounter: l,
            trackError: u,
            trackCriticalError: s
        } = (0, n.createTrackers)(a, {
            publish: o
        });
    var c = e.i(496283);
    let f = e => "string" == typeof e && e.length > 0,
        d = (e, t, r) => {
            u(e, {
                key: r,
                namespace: t,
                internalPageName: (0, c.getInternalPageName)() ?? "unknown"
            })
        };
    e.s(["adaptFullKeyTranslator", 0, e => Object.assign(function(t, n) {
        let i = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "";
        if (!f(t)) return d("TranslationKeyNotFound", "unknown", String(t)), i;
        let a = (0, r.toFullKeyPath)(t);
        return a ? e.has(a.path) ? e(a.path, n) : (d("TranslationKeyNotFound", a.namespace, a.key), i) : (d("TranslationKeyNotFound", t, t), i)
    }, {
        html: (n, i, a) => {
            if (!f(n)) return d("TranslationKeyNotFound", "unknown", String(n)), null;
            let o = (0, r.toFullKeyPath)(n);
            if (!o) return d("TranslationKeyNotFound", n, n), null;
            if (!e.has(o.path)) return d("TranslationKeyNotFound", o.namespace, o.key), null;
            let l = (0, t.renderHtml)(t => e(o.path, t), i, a);
            return null == l && d("TranslationMalformed", o.namespace, o.key), l
        }
    }), "adaptTranslator", 0, (e, n) => Object.assign((t, i, a) => {
        let o = (0, r.fromPeriodToColonDelimited)(t);
        return void 0 === a || e.has(o) ? e(o, i) : (d("TranslationKeyNotFound", n, o), a)
    }, {
        rich: (t, n) => e.rich((0, r.fromPeriodToColonDelimited)(t), n),
        has: t => f(t) && e.has((0, r.fromPeriodToColonDelimited)(t)),
        dynamic: function(t, i) {
            let a = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "";
            if (!f(t)) return d("TranslationKeyNotFound", n, String(t)), a;
            let o = (0, r.fromPeriodToColonDelimited)(t),
                l = e.has(o);
            return l || d("TranslationKeyNotFound", n, o), l ? e(o, i) : a
        },
        html: (i, a, o) => {
            if (!f(i)) return d("TranslationKeyNotFound", n, String(i)), null;
            let l = (0, r.fromPeriodToColonDelimited)(i);
            if (!e.has(l)) return d("TranslationKeyNotFound", n, l), null;
            let u = (0, t.renderHtml)(t => e(l, t), a, o);
            return null == u && d("TranslationMalformed", n, l), u
        }
    })], 682877)
}, 7284, e => {
    "use strict";

    function t() {
        for (var e, t, r = 0, n = "", i = arguments.length; r < i; r++)(e = arguments[r]) && (t = function e(t) {
            var r, n, i = "";
            if ("string" == typeof t || "number" == typeof t) i += t;
            else if ("object" == typeof t)
                if (Array.isArray(t)) {
                    var a = t.length;
                    for (r = 0; r < a; r++) t[r] && (n = e(t[r])) && (i && (i += " "), i += n)
                } else
                    for (n in t) t[n] && (i && (i += " "), i += n);
            return i
        }(e)) && (n && (n += " "), n += t);
        return n
    }
    e.s(["clsx", 0, t, "default", 0, t])
}, 775453, e => {
    "use strict";
    e.s(["composeEventHandlers", 0, function(e, t) {
        let {
            checkForDefaultPrevented: r = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(n) {
            if (e?.(n), !1 === r || !n.defaultPrevented) return t?.(n)
        }
    }])
}, 73772, e => {
    "use strict";
    var t = new WeakMap,
        r = new WeakMap,
        n = {},
        i = 0,
        a = function(e) {
            return e && (e.host || a(e.parentNode))
        },
        o = function(e, o, l, u) {
            var s = (Array.isArray(e) ? e : [e]).map(function(e) {
                if (o.contains(e)) return e;
                var t = a(e);
                return t && o.contains(t) ? t : (console.error("aria-hidden", e, "in not contained inside", o, ". Doing nothing"), null)
            }).filter(function(e) {
                return !!e
            });
            n[l] || (n[l] = new WeakMap);
            var c = n[l],
                f = [],
                d = new Set,
                p = new Set(s),
                m = function(e) {
                    !e || d.has(e) || (d.add(e), m(e.parentNode))
                };
            s.forEach(m);
            var y = function(e) {
                !e || p.has(e) || Array.prototype.forEach.call(e.children, function(e) {
                    if (d.has(e)) y(e);
                    else try {
                        var n = e.getAttribute(u),
                            i = null !== n && "false" !== n,
                            a = (t.get(e) || 0) + 1,
                            o = (c.get(e) || 0) + 1;
                        t.set(e, a), c.set(e, o), f.push(e), 1 === a && i && r.set(e, !0), 1 === o && e.setAttribute(l, "true"), i || e.setAttribute(u, "true")
                    } catch (t) {
                        console.error("aria-hidden: cannot operate on ", e, t)
                    }
                })
            };
            return y(o), d.clear(), i++,
                function() {
                    f.forEach(function(e) {
                        var n = t.get(e) - 1,
                            i = c.get(e) - 1;
                        t.set(e, n), c.set(e, i), n || (r.has(e) || e.removeAttribute(u), r.delete(e)), i || e.removeAttribute(l)
                    }), --i || (t = new WeakMap, t = new WeakMap, r = new WeakMap, n = {})
                }
        };
    e.s(["hideOthers", 0, function(e, t, r) {
        void 0 === r && (r = "data-aria-hidden");
        var n = Array.from(Array.isArray(e) ? e : [e]),
            i = t || ("u" < typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
        return i ? (n.push.apply(n, Array.from(i.querySelectorAll("[aria-live], script"))), o(n, i, r, "aria-hidden")) : function() {
            return null
        }
    }])
}, 824627, e => {
    "use strict";
    var t = function() {
        return (t = Object.assign || function(e) {
            for (var t, r = 1, n = arguments.length; r < n; r++)
                for (var i in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
            return e
        }).apply(this, arguments)
    };
    "function" == typeof SuppressedError && SuppressedError, e.s(["__assign", () => t, "__awaiter", 0, function(e, t, r, n) {
        return new(r || (r = Promise))(function(i, a) {
            function o(e) {
                try {
                    u(n.next(e))
                } catch (e) {
                    a(e)
                }
            }

            function l(e) {
                try {
                    u(n.throw(e))
                } catch (e) {
                    a(e)
                }
            }

            function u(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof r ? t : new r(function(e) {
                    e(t)
                })).then(o, l)
            }
            u((n = n.apply(e, t || [])).next())
        })
    }, "__generator", 0, function(e, t) {
        var r, n, i, a = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = l(0), o.throw = l(1), o.return = l(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function l(l) {
            return function(u) {
                var s = [l, u];
                if (r) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, s[0] && (a = 0)), a;) try {
                    if (r = 1, n && (i = 2 & s[0] ? n.return : s[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, s[1])).done) return i;
                    switch (n = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                        case 0:
                        case 1:
                            i = s;
                            break;
                        case 4:
                            return a.label++, {
                                value: s[1],
                                done: !1
                            };
                        case 5:
                            a.label++, n = s[1], s = [0];
                            continue;
                        case 7:
                            s = a.ops.pop(), a.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                a = 0;
                                continue
                            }
                            if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                a.label = s[1];
                                break
                            }
                            if (6 === s[0] && a.label < i[1]) {
                                a.label = i[1], i = s;
                                break
                            }
                            if (i && a.label < i[2]) {
                                a.label = i[2], a.ops.push(s);
                                break
                            }
                            i[2] && a.ops.pop(), a.trys.pop();
                            continue
                    }
                    s = t.call(e, a)
                } catch (e) {
                    s = [6, e], n = 0
                } finally {
                    r = i = 0
                }
                if (5 & s[0]) throw s[1];
                return {
                    value: s[0] ? s[1] : void 0,
                    done: !0
                }
            }
        }
    }, "__rest", 0, function(e, t) {
        var r = {};
        for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && 0 > t.indexOf(n) && (r[n] = e[n]);
        if (null != e && "function" == typeof Object.getOwnPropertySymbols)
            for (var i = 0, n = Object.getOwnPropertySymbols(e); i < n.length; i++) 0 > t.indexOf(n[i]) && Object.prototype.propertyIsEnumerable.call(e, n[i]) && (r[n[i]] = e[n[i]]);
        return r
    }, "__spreadArray", 0, function(e, t, r) {
        if (r || 2 == arguments.length)
            for (var n, i = 0, a = t.length; i < a; i++) !n && i in t || (n || (n = Array.prototype.slice.call(t, 0, i)), n[i] = t[i]);
        return e.concat(n || Array.prototype.slice.call(t))
    }])
}, 422197, e => {
    "use strict";
    var t;
    e.s(["getNonce", 0, function() {
        return t || ("u" > typeof __webpack_nonce__ ? __webpack_nonce__ : void 0)
    }])
}, 734988, 13522, e => {
    "use strict";
    var t = e.i(420482),
        r = e.i(19836);
    e.s(["createContext", 0, function(e, n) {
        let i = t.createContext(n),
            a = e => {
                let {
                    children: n,
                    ...a
                } = e, o = t.useMemo(() => a, Object.values(a));
                return (0, r.jsx)(i.Provider, {
                    value: o,
                    children: n
                })
            };
        return a.displayName = e + "Provider", [a, function(r) {
            let a = t.useContext(i);
            if (a) return a;
            if (void 0 !== n) return n;
            throw Error(`\`${r}\` must be used within \`${e}\``)
        }]
    }, "createContextScope", 0, function(e) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
            i = [],
            a = () => {
                let r = i.map(e => t.createContext(e));
                return function(n) {
                    let i = n?.[e] || r;
                    return t.useMemo(() => ({
                        [`__scope${e}`]: {
                            ...n,
                            [e]: i
                        }
                    }), [n, i])
                }
            };
        return a.scopeName = e, [function(n, a) {
            let o = t.createContext(a),
                l = i.length;
            i = [...i, a];
            let u = n => {
                let {
                    scope: i,
                    children: a,
                    ...u
                } = n, s = i?.[e]?.[l] || o, c = t.useMemo(() => u, Object.values(u));
                return (0, r.jsx)(s.Provider, {
                    value: c,
                    children: a
                })
            };
            return u.displayName = n + "Provider", [u, function(r, i) {
                let u = i?.[e]?.[l] || o,
                    s = t.useContext(u);
                if (s) return s;
                if (void 0 !== a) return a;
                throw Error(`\`${r}\` must be used within \`${n}\``)
            }]
        }, function() {
            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
            let i = r[0];
            if (1 === r.length) return i;
            let a = () => {
                let e = r.map(e => ({
                    useScope: e(),
                    scopeName: e.scopeName
                }));
                return function(r) {
                    let n = e.reduce((e, t) => {
                        let {
                            useScope: n,
                            scopeName: i
                        } = t, a = n(r)[`__scope${i}`];
                        return {
                            ...e,
                            ...a
                        }
                    }, {});
                    return t.useMemo(() => ({
                        [`__scope${i.scopeName}`]: n
                    }), [n])
                }
            };
            return a.scopeName = i.scopeName, a
        }(a, ...n)]
    }], 734988);
    var n = globalThis?.document ? t.useLayoutEffect : () => {};
    e.s(["useLayoutEffect", 0, n], 13522)
}, 481010, 823499, e => {
    "use strict";
    var t = e.i(420482),
        r = e.i(13522),
        n = t[" useId ".trim().toString()] || (() => void 0),
        i = 0;
    e.s(["useId", 0, function(e) {
        let [a, o] = t.useState(n());
        return (0, r.useLayoutEffect)(() => {
            e || o(e => e ?? String(i++))
        }, [e]), e || (a ? `radix-${a}` : "")
    }], 481010), e.s(["useCallbackRef", 0, function(e) {
        let r = t.useRef(e);
        return t.useEffect(() => {
            r.current = e
        }), t.useMemo(() => function() {
            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
            return r.current?.(...t)
        }, [])
    }], 823499)
}, 743682, 56144, e => {
    "use strict";
    var t = e.i(420482);
    e.i(301775);
    var r = e.i(539181),
        n = e.i(19836);

    function i(e) {
        var i;
        let a, l = (i = e, (a = t.forwardRef((e, n) => {
                let {
                    children: i,
                    ...a
                } = e;
                if (t.isValidElement(i)) {
                    var o;
                    let e, l, u = (o = i, (l = (e = Object.getOwnPropertyDescriptor(o.props, "ref")?.get) && "isReactWarning" in e && e.isReactWarning) ? o.ref : (l = (e = Object.getOwnPropertyDescriptor(o, "ref")?.get) && "isReactWarning" in e && e.isReactWarning) ? o.props.ref : o.props.ref || o.ref),
                        s = function(e, t) {
                            let r = {
                                ...t
                            };
                            for (let n in t) {
                                let i = e[n],
                                    a = t[n];
                                /^on[A-Z]/.test(n) ? i && a ? r[n] = function() {
                                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                    let n = a(...t);
                                    return i(...t), n
                                } : i && (r[n] = i) : "style" === n ? r[n] = {
                                    ...i,
                                    ...a
                                } : "className" === n && (r[n] = [i, a].filter(Boolean).join(" "))
                            }
                            return {
                                ...e,
                                ...r
                            }
                        }(a, i.props);
                    return i.type !== t.Fragment && (s.ref = n ? (0, r.composeRefs)(n, u) : u), t.cloneElement(i, s)
                }
                return t.Children.count(i) > 1 ? t.Children.only(null) : null
            })).displayName = `${i}.SlotClone`, a),
            u = t.forwardRef((e, r) => {
                let {
                    children: i,
                    ...a
                } = e, u = t.Children.toArray(i), s = u.find(o);
                if (s) {
                    let e = s.props.children,
                        i = u.map(r => r !== s ? r : t.Children.count(e) > 1 ? t.Children.only(null) : t.isValidElement(e) ? e.props.children : null);
                    return (0, n.jsx)(l, {
                        ...a,
                        ref: r,
                        children: t.isValidElement(e) ? t.cloneElement(e, void 0, i) : null
                    })
                }
                return (0, n.jsx)(l, {
                    ...a,
                    ref: r,
                    children: i
                })
            });
        return u.displayName = `${e}.Slot`, u
    }
    var a = Symbol("radix.slottable");

    function o(e) {
        return t.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === a
    }
    e.s(["createSlot", 0, i], 56144);
    var l = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce((e, r) => {
        let a = i(`Primitive.${r}`),
            o = t.forwardRef((e, t) => {
                let {
                    asChild: i,
                    ...o
                } = e;
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, n.jsx)(i ? a : r, {
                    ...o,
                    ref: t
                })
            });
        return o.displayName = `Primitive.${r}`, {
            ...e,
            [r]: o
        }
    }, {});
    e.s(["Primitive", 0, l], 743682)
}, 378944, e => {
    "use strict";
    var t = e.i(941918),
        r = e.i(778935),
        n = e.i(7284),
        i = e.i(420482);
    let a = {
            Small: "padding-xsmall",
            Medium: "padding-small",
            Large: "padding-small"
        },
        o = {
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-100"
        };
    e.s(["CloseAffordance", 0, e => {
        let {
            variant: l,
            size: u,
            isCircular: s,
            className: c,
            ...f
        } = e;
        return i.default.createElement("button", {
            type: "button",
            className: (0, n.default)("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", t.interactable, o[l], a[u], s && "radius-circle", c),
            ...f
        }, i.default.createElement(t.StateLayer, null), i.default.createElement(r.Icon, {
            name: "icon-regular-x",
            size: u
        }))
    }])
}, 251734, e => {
    "use strict";
    var t = e.i(378944),
        r = e.i(7284),
        n = e.i(420482),
        i = e.i(513443),
        a = e.i(806887);
    let o = (0, n.createContext)({
            size: "Medium",
            isModal: !0,
            hasCloseAffordance: !1,
            hasMarginTop: !0,
            hasMarginBottom: !0,
            hasDescription: !1,
            type: "Default"
        }),
        l = () => {
            let e = (0, n.useContext)(o);
            if (!e) throw Error("Dialog components must be used within a Dialog");
            return e
        },
        u = {
            Small: "padding-x-large",
            Medium: "padding-x-xlarge",
            Large: "padding-x-xlarge"
        },
        s = {
            Small: "padding-top-large",
            Medium: "padding-top-xlarge",
            Large: "padding-top-xlarge"
        },
        c = {
            Small: "padding-bottom-large",
            Medium: "padding-bottom-xlarge",
            Large: "padding-bottom-xlarge"
        },
        f = e => {
            let {
                open: t,
                onOpenChange: r,
                children: a,
                size: l,
                type: u = "Default",
                isModal: s,
                hasCloseAffordance: c,
                closeLabel: f,
                hasMarginTop: d = !0,
                hasMarginBottom: p = !0,
                hasDescription: m = !1,
                experimentalDisablePointerEventsStylingOnBody: y = !1
            } = e, g = (0, n.useMemo)(() => ({
                size: l,
                isModal: s,
                type: u,
                hasCloseAffordance: c,
                closeLabel: f,
                hasMarginTop: d,
                hasMarginBottom: p,
                hasDescription: m
            }), [l, s, u, c, f, d, p, m]);
            return (0, n.useEffect)(() => {
                y && setTimeout(() => {
                    Object.assign(document.body.style, {
                        pointerEvents: "unset"
                    })
                }, 0)
            }, [y, t]), n.default.createElement(o.Provider, {
                value: g
            }, n.default.createElement(i.Root, {
                open: t,
                onOpenChange: r
            }, a))
        };
    f.displayName = "Dialog";
    let d = e => {
        let {
            children: a,
            className: o,
            style: u,
            overlayClassName: s,
            overlayStyle: c,
            onOpenAutoFocus: f,
            ...d
        } = e, {
            size: p,
            isModal: m,
            hasCloseAffordance: y,
            closeLabel: g,
            hasDescription: w
        } = l(), h = (0, r.default)("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", m && "bg-common-backdrop", s), b = (0, r.default)("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", o);
        return n.default.createElement(i.Portal, null, n.default.createElement(i.Overlay, {
            className: h,
            style: c
        }, n.default.createElement(i.Content, {
            className: b,
            "data-size": p,
            style: u,
            onOpenAutoFocus: f,
            ...!w && {
                "aria-describedby": void 0
            },
            ...d
        }, y && n.default.createElement("div", {
            className: "absolute foundation-web-dialog-close-container"
        }, n.default.createElement(i.Close, {
            asChild: !0
        }, n.default.createElement(t.CloseAffordance, {
            variant: "OverMedia",
            size: p,
            isCircular: !0,
            "aria-label": g
        }))), a)))
    };
    d.displayName = "DialogContent";
    let p = e => {
        let {
            children: t,
            className: i,
            ...a
        } = e;
        return n.default.createElement("div", {
            className: (0, r.default)("foundation-web-dialog-hero-media", i),
            ...a
        }, t)
    };
    p.displayName = "DialogHeroMedia";
    let m = e => {
        let {
            children: t,
            className: i,
            ...a
        } = e, {
            size: o,
            hasMarginTop: f,
            hasMarginBottom: d
        } = l(), p = (0, r.default)(u[o], f && s[o], d && c[o], i);
        return n.default.createElement("div", {
            className: p,
            ...a
        }, t)
    };
    m.displayName = "DialogBody";
    let y = e => {
        let {
            children: t,
            className: r,
            hidden: o,
            ...l
        } = e, u = n.default.createElement(i.Title, {
            className: r,
            ...l
        }, t);
        return o ? n.default.createElement(a.VisuallyHidden, null, u) : u
    };
    y.displayName = "DialogTitle";
    let g = e => {
        let {
            children: t,
            className: i,
            ...a
        } = e, {
            size: o
        } = l(), s = (0, r.default)(u[o], c[o], i);
        return n.default.createElement("div", {
            className: s,
            ...a
        }, t)
    };
    g.displayName = "DialogFooter", e.s(["Dialog", 0, f, "DialogBody", 0, m, "DialogContent", 0, d, "DialogFooter", 0, g, "DialogHeroMedia", 0, p, "DialogTitle", 0, y, "dialogSizes", 0, ["Small", "Medium", "Large"]])
}]);

//# debugId=249dd7cb-a64d-15f8-d95e-d1dd66e511f5
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/12.yg0br8t~4g.js.map