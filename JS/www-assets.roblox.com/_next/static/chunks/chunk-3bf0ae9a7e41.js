;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "20deedd4-8b42-beb0-d4ef-c961855e93f3")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 175067, e => {
    "use strict";
    let t = null;
    e.s(["getGameLauncher", 0, () => t, "setGameLauncher", 0, e => {
        t = e
    }])
}, 266712, 567950, e => {
    "use strict";
    let t = (e, t, i) => new Promise(r => {
        let s = new CustomEvent(e, {
            cancelable: !0,
            detail: t(r)
        });
        window.dispatchEvent(s) && r(i)
    });
    e.s(["requestFromContainer", 0, t], 567950), e.s(["startAccessManagementUpsell", 0, e => {
        let {
            featureName: i,
            redirectLink: r,
            ampFeatureCheckData: s = [],
            isAsyncCall: n = !0,
            usePrologue: u = !1,
            ampRecourseData: a = null,
            featureSpecificData: o,
            namespace: l,
            wizardIntent: c
        } = e;
        return t("StartAccessManagementUpsell", e => ({
            featureName: i,
            redirectLink: r ?? null,
            ampFeatureCheckData: s,
            isAsyncCall: n,
            usePrologue: u,
            ampRecourseData: a,
            featureSpecificData: o ?? null,
            namespace: l ?? null,
            wizardIntent: c ?? null,
            closeCallback: t => {
                e("Granted" === t)
            }
        }), !1)
    }], 266712)
}, 888104, e => {
    "use strict";
    var t, i, r, s, n, u, a, o, l, c, h, f, d, p, v, m = e.i(371847);
    e.i(912035);
    var b = e.i(376054),
        y = e.i(136927),
        _ = e.i(550475),
        g = e.i(42297),
        w = e.i(474754),
        O = e.i(259864),
        E = e.i(414822),
        M = e.i(578889),
        k = e.i(766271);

    function S(e, t) {
        let i = new Set(t);
        return e.filter(e => !i.has(e))
    }
    var C = (t = new WeakMap, i = new WeakMap, r = new WeakMap, s = new WeakMap, n = new WeakMap, u = new WeakMap, a = new WeakMap, o = new WeakMap, l = new WeakMap, c = new WeakMap, h = new WeakSet, f = new WeakSet, d = new WeakSet, p = new WeakSet, v = new WeakSet, class extends M.Subscribable {
        onSubscribe() {
            1 === this.listeners.size && (0, b._)(this, n).forEach(e => {
                e.subscribe(t => {
                    (0, g._)(this, p, R).call(this, e, t)
                })
            })
        }
        onUnsubscribe() {
            this.listeners.size || this.destroy()
        }
        destroy() {
            this.listeners = new Set, (0, b._)(this, n).forEach(e => {
                e.destroy()
            })
        }
        setQueries(e, t) {
            (0, _._)(this, r, e), (0, _._)(this, s, t), O.notifyManager.batch(() => {
                let e = (0, b._)(this, n),
                    t = (0, g._)(this, d, j).call(this, (0, b._)(this, r));
                t.forEach(e => e.observer.setOptions(e.defaultedQueryOptions));
                let s = t.map(e => e.observer),
                    u = s.map(e => e.getCurrentResult()),
                    a = e.length !== s.length,
                    o = s.some((t, i) => t !== e[i]),
                    l = a || o,
                    h = !!l || u.some((e, t) => {
                        let r = (0, b._)(this, i)[t];
                        return !r || !(0, k.shallowEqualObjects)(e, r)
                    });
                (l || h) && (l && ((0, _._)(this, c, t), (0, _._)(this, n, s)), (0, _._)(this, i, u), this.hasListeners() && (l && (S(e, s).forEach(e => {
                    e.destroy()
                }), S(s, e).forEach(e => {
                    e.subscribe(t => {
                        (0, g._)(this, p, R).call(this, e, t)
                    })
                })), (0, g._)(this, v, L).call(this)))
            })
        }
        getCurrentResult() {
            return (0, b._)(this, i)
        }
        getQueries() {
            return (0, b._)(this, n).map(e => e.getCurrentQuery())
        }
        getObservers() {
            return (0, b._)(this, n)
        }
        getOptimisticResult(e, t) {
            let i = (0, g._)(this, d, j).call(this, e),
                r = i.map(e => e.observer.getOptimisticResult(e.defaultedQueryOptions)),
                s = i.map(e => e.defaultedQueryOptions.queryHash);
            return [r, e => (0, g._)(this, f, W).call(this, e ?? r, t, s), () => (0, g._)(this, h, Q).call(this, r, i)]
        }
        constructor(e, m, b) {
            super(), (0, w._)(this, h), (0, w._)(this, f), (0, w._)(this, d), (0, w._)(this, p), (0, w._)(this, v), (0, y._)(this, t, {
                writable: !0,
                value: void 0
            }), (0, y._)(this, i, {
                writable: !0,
                value: void 0
            }), (0, y._)(this, r, {
                writable: !0,
                value: void 0
            }), (0, y._)(this, s, {
                writable: !0,
                value: void 0
            }), (0, y._)(this, n, {
                writable: !0,
                value: void 0
            }), (0, y._)(this, u, {
                writable: !0,
                value: void 0
            }), (0, y._)(this, a, {
                writable: !0,
                value: void 0
            }), (0, y._)(this, o, {
                writable: !0,
                value: void 0
            }), (0, y._)(this, l, {
                writable: !0,
                value: void 0
            }), (0, y._)(this, c, {
                writable: !0,
                value: []
            }), (0, _._)(this, t, e), (0, _._)(this, s, b), (0, _._)(this, r, []), (0, _._)(this, n, []), (0, _._)(this, i, []), this.setQueries(m)
        }
    });

    function Q(e, t) {
        return t.map((i, r) => {
            let s = e[r];
            return i.defaultedQueryOptions.notifyOnChangeProps ? s : i.observer.trackResult(s, e => {
                t.forEach(t => {
                    t.observer.trackProp(e)
                })
            })
        })
    }

    function W(e, t, r) {
        if (t) {
            let s = (0, b._)(this, l),
                n = void 0 !== r && void 0 !== s && (s.length !== r.length || r.some((e, t) => e !== s[t]));
            return (!(0, b._)(this, u) || (0, b._)(this, i) !== (0, b._)(this, o) || n || t !== (0, b._)(this, a)) && ((0, _._)(this, a, t), (0, _._)(this, o, (0, b._)(this, i)), void 0 !== r && (0, _._)(this, l, r), (0, _._)(this, u, (0, k.replaceEqualDeep)((0, b._)(this, u), t(e)))), (0, b._)(this, u)
        }
        return e
    }

    function j(e) {
        let i = new Map;
        (0, b._)(this, n).forEach(e => {
            let t = e.options.queryHash;
            if (!t) return;
            let r = i.get(t);
            r ? r.push(e) : i.set(t, [e])
        });
        let r = [];
        return e.forEach(e => {
            let s = (0, b._)(this, t).defaultQueryOptions(e),
                n = i.get(s.queryHash)?.shift() ?? new E.QueryObserver((0, b._)(this, t), s);
            r.push({
                defaultedQueryOptions: s,
                observer: n
            })
        }), r
    }

    function R(e, t) {
        let r = (0, b._)(this, n).indexOf(e);
        if (-1 !== r) {
            var s;
            let e;
            (0, _._)(this, i, (s = (0, b._)(this, i), (e = s.slice(0))[r] = t, e)), (0, g._)(this, v, L).call(this)
        }
    }

    function L() {
        if (this.hasListeners()) {
            let e = (0, b._)(this, u),
                t = (0, g._)(this, h, Q).call(this, (0, b._)(this, i), (0, b._)(this, c));
            e !== (0, g._)(this, f, W).call(this, t, (0, b._)(this, s)?.combine) && O.notifyManager.batch(() => {
                this.listeners.forEach(e => {
                    e((0, b._)(this, i))
                })
            })
        }
    }
    var T = e.i(391855),
        I = e.i(373201),
        $ = e.i(653350),
        x = e.i(997962),
        B = e.i(322910);
    e.s(["useQueries", 0, function(e, t) {
        let {
            queries: i,
            ...r
        } = e, s = (0, T.useQueryClient)(t), n = (0, I.useIsRestoring)(), u = (0, $.useQueryErrorResetBoundary)(), a = m.useMemo(() => i.map(e => {
            let t = s.defaultQueryOptions(e);
            return t._optimisticResults = n ? "isRestoring" : "optimistic", t
        }), [i, s, n]);
        a.forEach(e => {
            (0, B.ensureSuspenseTimers)(e);
            let t = s.getQueryCache().get(e.queryHash);
            (0, x.ensurePreventErrorBoundaryRetry)(e, u, t)
        }), (0, x.useClearResetErrorBoundary)(u);
        let [o] = m.useState(() => new C(s, a, r)), [l, c, h] = o.getOptimisticResult(a, r.combine), f = !n && !1 !== r.subscribed;
        m.useSyncExternalStore(m.useCallback(e => f ? o.subscribe(O.notifyManager.batchCalls(e)) : k.noop, [o, f]), () => o.getCurrentResult(), () => o.getCurrentResult()), m.useEffect(() => {
            o.setQueries(a, r)
        }, [a, r, o]);
        let d = l.some((e, t) => (0, B.shouldSuspend)(a[t], e)) ? l.flatMap((e, t) => {
            let i = a[t];
            if (i && (0, B.shouldSuspend)(i, e)) {
                let e = new E.QueryObserver(s, i);
                return (0, B.fetchOptimistic)(i, e, u)
            }
            return []
        }) : [];
        if (d.length > 0) throw Promise.all(d);
        let p = l.find((e, t) => {
            let i = a[t];
            return i && (0, x.getHasError)({
                result: e,
                errorResetBoundary: u,
                throwOnError: i.throwOnError,
                query: s.getQueryCache().get(i.queryHash),
                suspense: i.suspense
            })
        });
        if (null == p ? void 0 : p.error) throw p.error;
        return c(h())
    }], 888104)
}, 351853, (e, t, i) => {
    var r = 0 / 0,
        s = /^\s+|\s+$/g,
        n = /^[-+]0x[0-9a-f]+$/i,
        u = /^0b[01]+$/i,
        a = /^0o[0-7]+$/i,
        o = parseInt,
        l = e.g && e.g.Object === Object && e.g,
        c = "object" == typeof self && self && self.Object === Object && self,
        h = l || c || Function("return this")(),
        f = Object.prototype.toString,
        d = Math.max,
        p = Math.min,
        v = function() {
            return h.Date.now()
        };

    function m(e) {
        var t = typeof e;
        return !!e && ("object" == t || "function" == t)
    }

    function b(e) {
        if ("number" == typeof e) return e;
        if ("symbol" == typeof(t = e) || t && "object" == typeof t && "[object Symbol]" == f.call(t)) return r;
        if (m(e)) {
            var t, i = "function" == typeof e.valueOf ? e.valueOf() : e;
            e = m(i) ? i + "" : i
        }
        if ("string" != typeof e) return 0 === e ? e : +e;
        e = e.replace(s, "");
        var l = u.test(e);
        return l || a.test(e) ? o(e.slice(2), l ? 2 : 8) : n.test(e) ? r : +e
    }
    t.exports = function(e, t, i) {
        var r, s, n, u, a, o, l = 0,
            c = !1,
            h = !1,
            f = !0;
        if ("function" != typeof e) throw TypeError("Expected a function");

        function y(t) {
            var i = r,
                n = s;
            return r = s = void 0, l = t, u = e.apply(n, i)
        }

        function _(e) {
            var i = e - o,
                r = e - l;
            return void 0 === o || i >= t || i < 0 || h && r >= n
        }

        function g() {
            var e, i, r, s = v();
            if (_(s)) return w(s);
            a = setTimeout(g, (e = s - o, i = s - l, r = t - e, h ? p(r, n - i) : r))
        }

        function w(e) {
            return (a = void 0, f && r) ? y(e) : (r = s = void 0, u)
        }

        function O() {
            var e, i = v(),
                n = _(i);
            if (r = arguments, s = this, o = i, n) {
                if (void 0 === a) return l = e = o, a = setTimeout(g, t), c ? y(e) : u;
                if (h) return a = setTimeout(g, t), y(o)
            }
            return void 0 === a && (a = setTimeout(g, t)), u
        }
        return t = b(t) || 0, m(i) && (c = !!i.leading, n = (h = "maxWait" in i) ? d(b(i.maxWait) || 0, t) : n, f = "trailing" in i ? !!i.trailing : f), O.cancel = function() {
            void 0 !== a && clearTimeout(a), l = 0, r = o = s = a = void 0
        }, O.flush = function() {
            return void 0 === a ? u : w(v())
        }, O
    }
}, 250646, e => {
    "use strict";
    var t = e.i(371847);
    e.i(351853);
    var i = "u" > typeof window ? t.useLayoutEffect : t.useEffect,
        r = "u" < typeof window;
    e.s(["useMediaQuery", 0, function(e) {
        let {
            defaultValue: s = !1,
            initializeWithValue: n = !0
        } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, u = e => r ? s : window.matchMedia(e).matches, [a, o] = (0, t.useState)(() => n ? u(e) : s);

        function l() {
            o(u(e))
        }
        return i(() => {
            let t = window.matchMedia(e);
            return l(), t.addListener ? t.addListener(l) : t.addEventListener("change", l), () => {
                t.removeListener ? t.removeListener(l) : t.removeEventListener("change", l)
            }
        }, [e]), a
    }])
}, 559659, e => {
    "use strict";
    var t = e.i(160963),
        i = e.i(214147);
    let r = [],
        s = !1,
        n = !1;

    function u() {
        let e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
        for (let t of r) t(e)
    }
    e.s(["createFireTelemetryHistogram", 0, function(e, a) {
        let o, l = a.flushIntervalMs ?? 5e3;

        function c(e, t) {
            a.onError ? a.onError(e, t) : console.error(e, t)
        }
        if (!(0, i.isValidIdentifier)(e)) return c(`@rbx/web-telemetry: invalid featureName "${e}"`, {
            name: e
        }), () => {};
        let h = new Map;

        function f() {
            let e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
            if (0 === h.size) return;
            let i = h;
            h = new Map;
            let r = BigInt(Date.now()),
                s = Array.from(i.values(), e => {
                    let {
                        bucketIndices: t,
                        countsInBuckets: i
                    } = function(e) {
                        let t = [],
                            i = [];
                        for (let [r, s] of e) s > 0 && (t.push(r), i.push(BigInt(s)));
                        return {
                            bucketIndices: t,
                            countsInBuckets: i
                        }
                    }(e.bucketCounts);
                    return {
                        name: e.name,
                        sum: e.sum,
                        count: BigInt(e.count),
                        bucketIndices: t,
                        countsInBuckets: i,
                        timestampMs: r,
                        attributes: e.attributes
                    }
                }),
                u = BigInt(1),
                a = "u" > typeof crypto && "function" == typeof crypto.randomUUID ? crypto.randomUUID() : `web-telemetry-${Date.now()}-${Math.random().toString(16).slice(2)}`;
            e || n || "u" > typeof document && "hidden" === document.visibilityState ? (0, t.sendHistogramBatchSync)(s, r, u, a) : (0, t.sendHistogramBatch)(s, r, u, a)
        }
        return r.push(f), s || ("u" > typeof document && document.addEventListener("visibilitychange", () => {
                "hidden" === document.visibilityState && u()
            }), window.addEventListener("beforeunload", () => {
                n = !0, u()
            }), s = !0),
            function(t, r, s) {
                let n = `${e}_${t}`;
                if (! function(e, t) {
                        if (!(0, i.isValidIdentifier)(e)) return !1;
                        if (t) {
                            for (let e of Object.keys(t))
                                if (!(0, i.isValidIdentifier)(e)) return !1
                        }
                        return !0
                    }(n, r)) return void c("@rbx/web-telemetry: invalid event name or attribute key", {
                    name: t
                });
                let u = s ?? 0;
                if (!Number.isFinite(u)) return void c("@rbx/web-telemetry: value must be a finite number", {
                    name: t
                });
                let a = r && Object.keys(r).length > 0 ? r : void 0,
                    d = function(e, t) {
                        if (!t || 0 === Object.keys(t).length) return e;
                        let i = Object.keys(t).sort().map(e => `${e}=${t[e]}`).join("&");
                        return `${e}|${i}`
                    }(n, a),
                    p = h.get(d);
                p || (p = {
                    name: n,
                    attributes: a,
                    sum: 0,
                    count: 0,
                    bucketCounts: new Map
                }, h.set(d, p)), p.sum += u, p.count += 1;
                let v = function(e) {
                    if (e <= 0) return -1;
                    if (e < 1e-4) return 1;
                    if (e > 1e11) return 272;
                    let t = Math.log10(e),
                        i = Math.floor((t - -4) * 18);
                    return 1e-9 > Math.abs((t - -4) * 18 - i) && i > 0 && (i -= 1), i + 2
                }(u);
                p.bucketCounts.set(v, (p.bucketCounts.get(v) ?? 0) + 1),
                    function e() {
                        void 0 === o && (o = setTimeout(() => {
                            o = void 0, f(), h.size > 0 && e()
                        }, l))
                    }()
            }
    }, "flushTelemetryHistograms", 0, function() {
        u(!0)
    }])
}]);

//# debugId=20deedd4-8b42-beb0-d4ef-c961855e93f3
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0etv_vh7-4m5..js.map