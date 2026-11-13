;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "7ad3a4a8-4c0e-444e-accc-7721f3a799de")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 407175, e => {
    e.q("https://www-assets.roblox.com/_next/static/media/privacyChoices.107knwhsvo2xp.webp")
}, 888104, e => {
    "use strict";
    var t, r, a, n, i, o, s, l, u, c, d, f, p, m, h, g = e.i(420482);
    e.i(737344);
    var v = e.i(376054),
        y = e.i(136927),
        b = e.i(550475),
        w = e.i(42297),
        x = e.i(474754),
        P = e.i(259864),
        S = e.i(414822),
        E = e.i(578889),
        C = e.i(766271);

    function _(e, t) {
        let r = new Set(t);
        return e.filter(e => !r.has(e))
    }
    var R = (t = new WeakMap, r = new WeakMap, a = new WeakMap, n = new WeakMap, i = new WeakMap, o = new WeakMap, s = new WeakMap, l = new WeakMap, u = new WeakMap, c = new WeakMap, d = new WeakSet, f = new WeakSet, p = new WeakSet, m = new WeakSet, h = new WeakSet, class extends E.Subscribable {
        onSubscribe() {
            1 === this.listeners.size && (0, v._)(this, i).forEach(e => {
                e.subscribe(t => {
                    (0, w._)(this, m, k).call(this, e, t)
                })
            })
        }
        onUnsubscribe() {
            this.listeners.size || this.destroy()
        }
        destroy() {
            this.listeners = new Set, (0, v._)(this, i).forEach(e => {
                e.destroy()
            })
        }
        setQueries(e, t) {
            (0, b._)(this, a, e), (0, b._)(this, n, t), P.notifyManager.batch(() => {
                let e = (0, v._)(this, i),
                    t = (0, w._)(this, p, j).call(this, (0, v._)(this, a));
                t.forEach(e => e.observer.setOptions(e.defaultedQueryOptions));
                let n = t.map(e => e.observer),
                    o = n.map(e => e.getCurrentResult()),
                    s = e.length !== n.length,
                    l = n.some((t, r) => t !== e[r]),
                    u = s || l,
                    d = !!u || o.some((e, t) => {
                        let a = (0, v._)(this, r)[t];
                        return !a || !(0, C.shallowEqualObjects)(e, a)
                    });
                (u || d) && (u && ((0, b._)(this, c, t), (0, b._)(this, i, n)), (0, b._)(this, r, o), this.hasListeners() && (u && (_(e, n).forEach(e => {
                    e.destroy()
                }), _(n, e).forEach(e => {
                    e.subscribe(t => {
                        (0, w._)(this, m, k).call(this, e, t)
                    })
                })), (0, w._)(this, h, A).call(this)))
            })
        }
        getCurrentResult() {
            return (0, v._)(this, r)
        }
        getQueries() {
            return (0, v._)(this, i).map(e => e.getCurrentQuery())
        }
        getObservers() {
            return (0, v._)(this, i)
        }
        getOptimisticResult(e, t) {
            let r = (0, w._)(this, p, j).call(this, e),
                a = r.map(e => e.observer.getOptimisticResult(e.defaultedQueryOptions)),
                n = r.map(e => e.defaultedQueryOptions.queryHash);
            return [a, e => (0, w._)(this, f, I).call(this, e ?? a, t, n), () => (0, w._)(this, d, O).call(this, a, r)]
        }
        constructor(e, g, v) {
            super(), (0, x._)(this, d), (0, x._)(this, f), (0, x._)(this, p), (0, x._)(this, m), (0, x._)(this, h), (0, y._)(this, t, {
                writable: !0,
                value: void 0
            }), (0, y._)(this, r, {
                writable: !0,
                value: void 0
            }), (0, y._)(this, a, {
                writable: !0,
                value: void 0
            }), (0, y._)(this, n, {
                writable: !0,
                value: void 0
            }), (0, y._)(this, i, {
                writable: !0,
                value: void 0
            }), (0, y._)(this, o, {
                writable: !0,
                value: void 0
            }), (0, y._)(this, s, {
                writable: !0,
                value: void 0
            }), (0, y._)(this, l, {
                writable: !0,
                value: void 0
            }), (0, y._)(this, u, {
                writable: !0,
                value: void 0
            }), (0, y._)(this, c, {
                writable: !0,
                value: []
            }), (0, b._)(this, t, e), (0, b._)(this, n, v), (0, b._)(this, a, []), (0, b._)(this, i, []), (0, b._)(this, r, []), this.setQueries(g)
        }
    });

    function O(e, t) {
        return t.map((r, a) => {
            let n = e[a];
            return r.defaultedQueryOptions.notifyOnChangeProps ? n : r.observer.trackResult(n, e => {
                t.forEach(t => {
                    t.observer.trackProp(e)
                })
            })
        })
    }

    function I(e, t, a) {
        if (t) {
            let n = (0, v._)(this, u),
                i = void 0 !== a && void 0 !== n && (n.length !== a.length || a.some((e, t) => e !== n[t]));
            return (!(0, v._)(this, o) || (0, v._)(this, r) !== (0, v._)(this, l) || i || t !== (0, v._)(this, s)) && ((0, b._)(this, s, t), (0, b._)(this, l, (0, v._)(this, r)), void 0 !== a && (0, b._)(this, u, a), (0, b._)(this, o, (0, C.replaceEqualDeep)((0, v._)(this, o), t(e)))), (0, v._)(this, o)
        }
        return e
    }

    function j(e) {
        let r = new Map;
        (0, v._)(this, i).forEach(e => {
            let t = e.options.queryHash;
            if (!t) return;
            let a = r.get(t);
            a ? a.push(e) : r.set(t, [e])
        });
        let a = [];
        return e.forEach(e => {
            let n = (0, v._)(this, t).defaultQueryOptions(e),
                i = r.get(n.queryHash)?.shift() ?? new S.QueryObserver((0, v._)(this, t), n);
            a.push({
                defaultedQueryOptions: n,
                observer: i
            })
        }), a
    }

    function k(e, t) {
        let a = (0, v._)(this, i).indexOf(e);
        if (-1 !== a) {
            var n;
            let e;
            (0, b._)(this, r, (n = (0, v._)(this, r), (e = n.slice(0))[a] = t, e)), (0, w._)(this, h, A).call(this)
        }
    }

    function A() {
        if (this.hasListeners()) {
            let e = (0, v._)(this, o),
                t = (0, w._)(this, d, O).call(this, (0, v._)(this, r), (0, v._)(this, c));
            e !== (0, w._)(this, f, I).call(this, t, (0, v._)(this, n)?.combine) && P.notifyManager.batch(() => {
                this.listeners.forEach(e => {
                    e((0, v._)(this, r))
                })
            })
        }
    }
    var T = e.i(391855),
        M = e.i(373201),
        N = e.i(653350),
        D = e.i(997962),
        $ = e.i(322910);
    e.s(["useQueries", 0, function(e, t) {
        let {
            queries: r,
            ...a
        } = e, n = (0, T.useQueryClient)(t), i = (0, M.useIsRestoring)(), o = (0, N.useQueryErrorResetBoundary)(), s = g.useMemo(() => r.map(e => {
            let t = n.defaultQueryOptions(e);
            return t._optimisticResults = i ? "isRestoring" : "optimistic", t
        }), [r, n, i]);
        s.forEach(e => {
            (0, $.ensureSuspenseTimers)(e);
            let t = n.getQueryCache().get(e.queryHash);
            (0, D.ensurePreventErrorBoundaryRetry)(e, o, t)
        }), (0, D.useClearResetErrorBoundary)(o);
        let [l] = g.useState(() => new R(n, s, a)), [u, c, d] = l.getOptimisticResult(s, a.combine), f = !i && !1 !== a.subscribed;
        g.useSyncExternalStore(g.useCallback(e => f ? l.subscribe(P.notifyManager.batchCalls(e)) : C.noop, [l, f]), () => l.getCurrentResult(), () => l.getCurrentResult()), g.useEffect(() => {
            l.setQueries(s, a)
        }, [s, a, l]);
        let p = u.some((e, t) => (0, $.shouldSuspend)(s[t], e)) ? u.flatMap((e, t) => {
            let r = s[t];
            if (r && (0, $.shouldSuspend)(r, e)) {
                let e = new S.QueryObserver(n, r);
                return (0, $.fetchOptimistic)(r, e, o)
            }
            return []
        }) : [];
        if (p.length > 0) throw Promise.all(p);
        let m = u.find((e, t) => {
            let r = s[t];
            return r && (0, D.getHasError)({
                result: e,
                errorResetBoundary: o,
                throwOnError: r.throwOnError,
                query: n.getQueryCache().get(r.queryHash),
                suspense: r.suspense
            })
        });
        if (null == m ? void 0 : m.error) throw m.error;
        return c(d())
    }], 888104)
}, 351853, (e, t, r) => {
    var a = 0 / 0,
        n = /^\s+|\s+$/g,
        i = /^[-+]0x[0-9a-f]+$/i,
        o = /^0b[01]+$/i,
        s = /^0o[0-7]+$/i,
        l = parseInt,
        u = e.g && e.g.Object === Object && e.g,
        c = "object" == typeof self && self && self.Object === Object && self,
        d = u || c || Function("return this")(),
        f = Object.prototype.toString,
        p = Math.max,
        m = Math.min,
        h = function() {
            return d.Date.now()
        };

    function g(e) {
        var t = typeof e;
        return !!e && ("object" == t || "function" == t)
    }

    function v(e) {
        if ("number" == typeof e) return e;
        if ("symbol" == typeof(t = e) || t && "object" == typeof t && "[object Symbol]" == f.call(t)) return a;
        if (g(e)) {
            var t, r = "function" == typeof e.valueOf ? e.valueOf() : e;
            e = g(r) ? r + "" : r
        }
        if ("string" != typeof e) return 0 === e ? e : +e;
        e = e.replace(n, "");
        var u = o.test(e);
        return u || s.test(e) ? l(e.slice(2), u ? 2 : 8) : i.test(e) ? a : +e
    }
    t.exports = function(e, t, r) {
        var a, n, i, o, s, l, u = 0,
            c = !1,
            d = !1,
            f = !0;
        if ("function" != typeof e) throw TypeError("Expected a function");

        function y(t) {
            var r = a,
                i = n;
            return a = n = void 0, u = t, o = e.apply(i, r)
        }

        function b(e) {
            var r = e - l,
                a = e - u;
            return void 0 === l || r >= t || r < 0 || d && a >= i
        }

        function w() {
            var e, r, a, n = h();
            if (b(n)) return x(n);
            s = setTimeout(w, (e = n - l, r = n - u, a = t - e, d ? m(a, i - r) : a))
        }

        function x(e) {
            return (s = void 0, f && a) ? y(e) : (a = n = void 0, o)
        }

        function P() {
            var e, r = h(),
                i = b(r);
            if (a = arguments, n = this, l = r, i) {
                if (void 0 === s) return u = e = l, s = setTimeout(w, t), c ? y(e) : o;
                if (d) return s = setTimeout(w, t), y(l)
            }
            return void 0 === s && (s = setTimeout(w, t)), o
        }
        return t = v(t) || 0, g(r) && (c = !!r.leading, i = (d = "maxWait" in r) ? p(v(r.maxWait) || 0, t) : i, f = "trailing" in r ? !!r.trailing : f), P.cancel = function() {
            void 0 !== s && clearTimeout(s), u = 0, a = l = n = s = void 0
        }, P.flush = function() {
            return void 0 === s ? o : x(h())
        }, P
    }
}, 250646, e => {
    "use strict";
    var t = e.i(420482);
    e.i(351853);
    var r = "u" > typeof window ? t.useLayoutEffect : t.useEffect,
        a = "u" < typeof window;
    e.s(["useMediaQuery", 0, function(e) {
        let {
            defaultValue: n = !1,
            initializeWithValue: i = !0
        } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, o = e => a ? n : window.matchMedia(e).matches, [s, l] = (0, t.useState)(() => i ? o(e) : n);

        function u() {
            l(o(e))
        }
        return r(() => {
            let t = window.matchMedia(e);
            return u(), t.addListener ? t.addListener(u) : t.addEventListener("change", u), () => {
                t.removeListener ? t.removeListener(u) : t.removeEventListener("change", u)
            }
        }, [e]), s
    }])
}, 559659, e => {
    "use strict";
    var t = e.i(160963),
        r = e.i(214147);
    let a = [],
        n = !1,
        i = !1;

    function o() {
        let e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
        for (let t of a) t(e)
    }
    e.s(["createFireTelemetryHistogram", 0, function(e, s) {
        let l, u = s.flushIntervalMs ?? 5e3;

        function c(e, t) {
            s.onError ? s.onError(e, t) : console.error(e, t)
        }
        if (!(0, r.isValidIdentifier)(e)) return c(`@rbx/web-telemetry: invalid featureName "${e}"`, {
            name: e
        }), () => {};
        let d = new Map;

        function f() {
            let e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
            if (0 === d.size) return;
            let r = d;
            d = new Map;
            let a = BigInt(Date.now()),
                n = Array.from(r.values(), e => {
                    let {
                        bucketIndices: t,
                        countsInBuckets: r
                    } = function(e) {
                        let t = [],
                            r = [];
                        for (let [a, n] of e) n > 0 && (t.push(a), r.push(BigInt(n)));
                        return {
                            bucketIndices: t,
                            countsInBuckets: r
                        }
                    }(e.bucketCounts);
                    return {
                        name: e.name,
                        sum: e.sum,
                        count: BigInt(e.count),
                        bucketIndices: t,
                        countsInBuckets: r,
                        timestampMs: a,
                        attributes: e.attributes
                    }
                }),
                o = BigInt(1),
                s = "u" > typeof crypto && "function" == typeof crypto.randomUUID ? crypto.randomUUID() : `web-telemetry-${Date.now()}-${Math.random().toString(16).slice(2)}`;
            e || i || "u" > typeof document && "hidden" === document.visibilityState ? (0, t.sendHistogramBatchSync)(n, a, o, s) : (0, t.sendHistogramBatch)(n, a, o, s)
        }
        return a.push(f), n || ("u" > typeof document && document.addEventListener("visibilitychange", () => {
                "hidden" === document.visibilityState && o()
            }), window.addEventListener("beforeunload", () => {
                i = !0, o()
            }), n = !0),
            function(t, a, n) {
                let i = `${e}_${t}`;
                if (! function(e, t) {
                        if (!(0, r.isValidIdentifier)(e)) return !1;
                        if (t) {
                            for (let e of Object.keys(t))
                                if (!(0, r.isValidIdentifier)(e)) return !1
                        }
                        return !0
                    }(i, a)) return void c("@rbx/web-telemetry: invalid event name or attribute key", {
                    name: t
                });
                let o = n ?? 0;
                if (!Number.isFinite(o)) return void c("@rbx/web-telemetry: value must be a finite number", {
                    name: t
                });
                let s = a && Object.keys(a).length > 0 ? a : void 0,
                    p = function(e, t) {
                        if (!t || 0 === Object.keys(t).length) return e;
                        let r = Object.keys(t).sort().map(e => `${e}=${t[e]}`).join("&");
                        return `${e}|${r}`
                    }(i, s),
                    m = d.get(p);
                m || (m = {
                    name: i,
                    attributes: s,
                    sum: 0,
                    count: 0,
                    bucketCounts: new Map
                }, d.set(p, m)), m.sum += o, m.count += 1;
                let h = function(e) {
                    if (e <= 0) return -1;
                    if (e < 1e-4) return 1;
                    if (e > 1e11) return 272;
                    let t = Math.log10(e),
                        r = Math.floor((t - -4) * 18);
                    return 1e-9 > Math.abs((t - -4) * 18 - r) && r > 0 && (r -= 1), r + 2
                }(o);
                m.bucketCounts.set(h, (m.bucketCounts.get(h) ?? 0) + 1),
                    function e() {
                        void 0 === l && (l = setTimeout(() => {
                            l = void 0, f(), d.size > 0 && e()
                        }, u))
                    }()
            }
    }, "flushTelemetryHistograms", 0, function() {
        o(!0)
    }])
}, 526005, e => {
    "use strict";
    var t, r, a, n, i, o, s = e.i(420482),
        l = e.i(376054),
        u = e.i(136927),
        c = e.i(550475),
        d = e.i(42297),
        f = e.i(474754),
        p = e.i(51449),
        m = e.i(259864),
        h = e.i(578889),
        g = e.i(766271),
        v = (t = new WeakMap, r = new WeakMap, a = new WeakMap, n = new WeakMap, i = new WeakSet, o = new WeakSet, class extends h.Subscribable {
            bindMethods() {
                this.mutate = this.mutate.bind(this), this.reset = this.reset.bind(this)
            }
            setOptions(e) {
                let r = this.options;
                this.options = (0, l._)(this, t).defaultMutationOptions(e), (0, g.shallowEqualObjects)(this.options, r) || (0, l._)(this, t).getMutationCache().notify({
                    type: "observerOptionsUpdated",
                    mutation: (0, l._)(this, a),
                    observer: this
                }), r?.mutationKey && this.options.mutationKey && (0, g.hashKey)(r.mutationKey) !== (0, g.hashKey)(this.options.mutationKey) ? this.reset() : (0, l._)(this, a)?.state.status === "pending" && (0, l._)(this, a).setOptions(this.options)
            }
            onUnsubscribe() {
                this.hasListeners() || (0, l._)(this, a)?.removeObserver(this)
            }
            onMutationUpdate(e) {
                (0, d._)(this, i, y).call(this), (0, d._)(this, o, b).call(this, e)
            }
            getCurrentResult() {
                return (0, l._)(this, r)
            }
            reset() {
                (0, l._)(this, a)?.removeObserver(this), (0, c._)(this, a, void 0), (0, d._)(this, i, y).call(this), (0, d._)(this, o, b).call(this)
            }
            mutate(e, r) {
                return (0, c._)(this, n, r), (0, l._)(this, a)?.removeObserver(this), (0, c._)(this, a, (0, l._)(this, t).getMutationCache().build((0, l._)(this, t), this.options)), (0, l._)(this, a).addObserver(this), (0, l._)(this, a).execute(e)
            }
            constructor(e, s) {
                super(), (0, f._)(this, i), (0, f._)(this, o), (0, u._)(this, t, {
                    writable: !0,
                    value: void 0
                }), (0, u._)(this, r, {
                    writable: !0,
                    value: void 0
                }), (0, u._)(this, a, {
                    writable: !0,
                    value: void 0
                }), (0, u._)(this, n, {
                    writable: !0,
                    value: void 0
                }), (0, c._)(this, t, e), this.setOptions(s), this.bindMethods(), (0, d._)(this, i, y).call(this)
            }
        });

    function y() {
        let e = (0, l._)(this, a)?.state ?? (0, p.getDefaultState)();
        (0, c._)(this, r, {
            ...e,
            isPending: "pending" === e.status,
            isSuccess: "success" === e.status,
            isError: "error" === e.status,
            isIdle: "idle" === e.status,
            mutate: this.mutate,
            reset: this.reset
        })
    }

    function b(e) {
        m.notifyManager.batch(() => {
            if ((0, l._)(this, n) && this.hasListeners()) {
                let a = (0, l._)(this, r).variables,
                    i = (0, l._)(this, r).context,
                    o = {
                        client: (0, l._)(this, t),
                        meta: this.options.meta,
                        mutationKey: this.options.mutationKey
                    };
                if (e?.type === "success") {
                    try {
                        (0, l._)(this, n).onSuccess?.(e.data, a, i, o)
                    } catch (e) {
                        Promise.reject(e)
                    }
                    try {
                        (0, l._)(this, n).onSettled?.(e.data, null, a, i, o)
                    } catch (e) {
                        Promise.reject(e)
                    }
                } else if (e?.type === "error") {
                    try {
                        (0, l._)(this, n).onError?.(e.error, a, i, o)
                    } catch (e) {
                        Promise.reject(e)
                    }
                    try {
                        (0, l._)(this, n).onSettled?.(void 0, e.error, a, i, o)
                    } catch (e) {
                        Promise.reject(e)
                    }
                }
            }
            this.listeners.forEach(e => {
                e((0, l._)(this, r))
            })
        })
    }
    var w = e.i(391855);
    e.s(["useMutation", 0, function(e, t) {
        let r = (0, w.useQueryClient)(t),
            [a] = s.useState(() => new v(r, e));
        s.useEffect(() => {
            a.setOptions(e)
        }, [a, e]);
        let n = s.useSyncExternalStore(s.useCallback(e => a.subscribe(m.notifyManager.batchCalls(e)), [a]), () => a.getCurrentResult(), () => a.getCurrentResult()),
            i = s.useCallback((e, t) => {
                a.mutate(e, t).catch(g.noop)
            }, [a]);
        if (n.error && (0, g.shouldThrowError)(a.options.throwOnError, [n.error])) throw n.error;
        return {
            ...n,
            mutate: i,
            mutateAsync: n.mutate
        }
    }], 526005)
}, 630204, e => {
    "use strict";
    var t = e.i(422957),
        r = e.i(420482),
        a = e.i(301775),
        n = "u" > typeof document ? r.useLayoutEffect : function() {};

    function i(e, t) {
        let r, a, n;
        if (e === t) return !0;
        if (typeof e != typeof t) return !1;
        if ("function" == typeof e && e.toString() === t.toString()) return !0;
        if (e && t && "object" == typeof e) {
            if (Array.isArray(e)) {
                if ((r = e.length) !== t.length) return !1;
                for (a = r; 0 != a--;)
                    if (!i(e[a], t[a])) return !1;
                return !0
            }
            if ((r = (n = Object.keys(e)).length) !== Object.keys(t).length) return !1;
            for (a = r; 0 != a--;)
                if (!({}).hasOwnProperty.call(t, n[a])) return !1;
            for (a = r; 0 != a--;) {
                let r = n[a];
                if (("_owner" !== r || !e.$$typeof) && !i(e[r], t[r])) return !1
            }
            return !0
        }
        return e != e && t != t
    }

    function o(e) {
        return "u" < typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
    }

    function s(e, t) {
        let r = o(e);
        return Math.round(t * r) / r
    }

    function l(e) {
        let t = r.useRef(e);
        return n(() => {
            t.current = e
        }), t
    }
    e.s(["arrow", 0, (e, r) => ({
        name: "arrow",
        options: e,
        fn(r) {
            let {
                element: a,
                padding: n
            } = "function" == typeof e ? e(r) : e;
            return a && ({}).hasOwnProperty.call(a, "current") ? null != a.current ? (0, t.arrow)({
                element: a.current,
                padding: n
            }).fn(r) : {} : a ? (0, t.arrow)({
                element: a,
                padding: n
            }).fn(r) : {}
        },
        options: [e, r]
    }), "flip", 0, (e, r) => ({
        ...(0, t.flip)(e),
        options: [e, r]
    }), "hide", 0, (e, r) => ({
        ...(0, t.hide)(e),
        options: [e, r]
    }), "limitShift", 0, (e, r) => ({
        ...(0, t.limitShift)(e),
        options: [e, r]
    }), "offset", 0, (e, r) => ({
        ...(0, t.offset)(e),
        options: [e, r]
    }), "shift", 0, (e, r) => ({
        ...(0, t.shift)(e),
        options: [e, r]
    }), "size", 0, (e, r) => ({
        ...(0, t.size)(e),
        options: [e, r]
    }), "useFloating", 0, function(e) {
        void 0 === e && (e = {});
        let {
            placement: u = "bottom",
            strategy: c = "absolute",
            middleware: d = [],
            platform: f,
            elements: {
                reference: p,
                floating: m
            } = {},
            transform: h = !0,
            whileElementsMounted: g,
            open: v
        } = e, [y, b] = r.useState({
            x: 0,
            y: 0,
            strategy: c,
            placement: u,
            middlewareData: {},
            isPositioned: !1
        }), [w, x] = r.useState(d);
        i(w, d) || x(d);
        let [P, S] = r.useState(null), [E, C] = r.useState(null), _ = r.useCallback(e => {
            e !== j.current && (j.current = e, S(e))
        }, []), R = r.useCallback(e => {
            e !== k.current && (k.current = e, C(e))
        }, []), O = p || P, I = m || E, j = r.useRef(null), k = r.useRef(null), A = r.useRef(y), T = null != g, M = l(g), N = l(f), D = l(v), $ = r.useCallback(() => {
            if (!j.current || !k.current) return;
            let e = {
                placement: u,
                strategy: c,
                middleware: w
            };
            N.current && (e.platform = N.current), (0, t.computePosition)(j.current, k.current, e).then(e => {
                let t = {
                    ...e,
                    isPositioned: !1 !== D.current
                };
                U.current && !i(A.current, t) && (A.current = t, a.flushSync(() => {
                    b(t)
                }))
            })
        }, [w, u, c, N, D]);
        n(() => {
            !1 === v && A.current.isPositioned && (A.current.isPositioned = !1, b(e => ({
                ...e,
                isPositioned: !1
            })))
        }, [v]);
        let U = r.useRef(!1);
        n(() => (U.current = !0, () => {
            U.current = !1
        }), []), n(() => {
            if (O && (j.current = O), I && (k.current = I), O && I) {
                if (M.current) return M.current(O, I, $);
                $()
            }
        }, [O, I, $, M, T]);
        let z = r.useMemo(() => ({
                reference: j,
                floating: k,
                setReference: _,
                setFloating: R
            }), [_, R]),
            L = r.useMemo(() => ({
                reference: O,
                floating: I
            }), [O, I]),
            W = r.useMemo(() => {
                let e = {
                    position: c,
                    left: 0,
                    top: 0
                };
                if (!L.floating) return e;
                let t = s(L.floating, y.x),
                    r = s(L.floating, y.y);
                return h ? {
                    ...e,
                    transform: "translate(" + t + "px, " + r + "px)",
                    ...o(L.floating) >= 1.5 && {
                        willChange: "transform"
                    }
                } : {
                    position: c,
                    left: t,
                    top: r
                }
            }, [c, h, L.floating, y.x, y.y]);
        return r.useMemo(() => ({
            ...y,
            update: $,
            refs: z,
            elements: L,
            floatingStyles: W
        }), [y, $, z, L, W])
    }])
}, 570391, e => {
    "use strict";
    var t = e.i(420482),
        r = e.i(18731);
    e.s(["useSize", 0, function(e) {
        let [a, n] = t.useState(void 0);
        return (0, r.useLayoutEffect)(() => {
            if (e) {
                n({
                    width: e.offsetWidth,
                    height: e.offsetHeight
                });
                let t = new ResizeObserver(t => {
                    let r, a;
                    if (!Array.isArray(t) || !t.length) return;
                    let i = t[0];
                    if ("borderBoxSize" in i) {
                        let e = i.borderBoxSize,
                            t = Array.isArray(e) ? e[0] : e;
                        r = t.inlineSize, a = t.blockSize
                    } else r = e.offsetWidth, a = e.offsetHeight;
                    n({
                        width: r,
                        height: a
                    })
                });
                return t.observe(e, {
                    box: "border-box"
                }), () => t.unobserve(e)
            }
            n(void 0)
        }, [e]), a
    }])
}, 555876, e => {
    "use strict";
    var t = e.i(420482),
        r = e.i(630204),
        a = e.i(422957),
        n = e.i(158051),
        i = e.i(19836),
        o = t.forwardRef((e, t) => {
            let {
                children: r,
                width: a = 10,
                height: o = 5,
                ...s
            } = e;
            return (0, i.jsx)(n.Primitive.svg, {
                ...s,
                ref: t,
                width: a,
                height: o,
                viewBox: "0 0 30 10",
                preserveAspectRatio: "none",
                children: e.asChild ? r : (0, i.jsx)("polygon", {
                    points: "0,0 30,0 15,10"
                })
            })
        });
    o.displayName = "Arrow";
    var s = e.i(922353),
        l = e.i(9413),
        u = e.i(488248),
        c = e.i(18731),
        d = e.i(570391),
        f = "Popper",
        [p, m] = (0, l.createContextScope)(f),
        [h, g] = p(f),
        v = e => {
            let {
                __scopePopper: r,
                children: a
            } = e, [n, o] = t.useState(null);
            return (0, i.jsx)(h, {
                scope: r,
                anchor: n,
                onAnchorChange: o,
                children: a
            })
        };
    v.displayName = f;
    var y = "PopperAnchor",
        b = t.forwardRef((e, r) => {
            let {
                __scopePopper: a,
                virtualRef: o,
                ...l
            } = e, u = g(y, a), c = t.useRef(null), d = (0, s.useComposedRefs)(r, c);
            return t.useEffect(() => {
                u.onAnchorChange(o?.current || c.current)
            }), o ? null : (0, i.jsx)(n.Primitive.div, {
                ...l,
                ref: d
            })
        });
    b.displayName = y;
    var w = "PopperContent",
        [x, P] = p(w),
        S = t.forwardRef((e, o) => {
            let {
                __scopePopper: l,
                side: f = "bottom",
                sideOffset: p = 0,
                align: m = "center",
                alignOffset: h = 0,
                arrowPadding: v = 0,
                avoidCollisions: y = !0,
                collisionBoundary: b = [],
                collisionPadding: P = 0,
                sticky: S = "partial",
                hideWhenDetached: E = !1,
                updatePositionStrategy: C = "optimized",
                onPlaced: _,
                ...j
            } = e, k = g(w, l), [A, T] = t.useState(null), M = (0, s.useComposedRefs)(o, e => T(e)), [N, D] = t.useState(null), $ = (0, d.useSize)(N), U = $?.width ?? 0, z = $?.height ?? 0, L = "number" == typeof P ? P : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...P
            }, W = Array.isArray(b) ? b : [b], F = W.length > 0, B = {
                padding: L,
                boundary: W.filter(R),
                altBoundary: F
            }, {
                refs: q,
                floatingStyles: G,
                placement: H,
                isPositioned: Q,
                middlewareData: V
            } = (0, r.useFloating)({
                strategy: "fixed",
                placement: f + ("center" !== m ? "-" + m : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return (0, a.autoUpdate)(...t, {
                        animationFrame: "always" === C
                    })
                },
                elements: {
                    reference: k.anchor
                },
                middleware: [(0, r.offset)({
                    mainAxis: p + z,
                    alignmentAxis: h
                }), y && (0, r.shift)({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === S ? (0, r.limitShift)() : void 0,
                    ...B
                }), y && (0, r.flip)({
                    ...B
                }), (0, r.size)({
                    ...B,
                    apply: e => {
                        let {
                            elements: t,
                            rects: r,
                            availableWidth: a,
                            availableHeight: n
                        } = e, {
                            width: i,
                            height: o
                        } = r.reference, s = t.floating.style;
                        s.setProperty("--radix-popper-available-width", `${a}px`), s.setProperty("--radix-popper-available-height", `${n}px`), s.setProperty("--radix-popper-anchor-width", `${i}px`), s.setProperty("--radix-popper-anchor-height", `${o}px`)
                    }
                }), N && (0, r.arrow)({
                    element: N,
                    padding: v
                }), O({
                    arrowWidth: U,
                    arrowHeight: z
                }), E && (0, r.hide)({
                    strategy: "referenceHidden",
                    ...B
                })]
            }), [X, K] = I(H), J = (0, u.useCallbackRef)(_);
            (0, c.useLayoutEffect)(() => {
                Q && J?.()
            }, [Q, J]);
            let Y = V.arrow?.x,
                Z = V.arrow?.y,
                ee = V.arrow?.centerOffset !== 0,
                [et, er] = t.useState();
            return (0, c.useLayoutEffect)(() => {
                A && er(window.getComputedStyle(A).zIndex)
            }, [A]), (0, i.jsx)("div", {
                ref: q.setFloating,
                "data-radix-popper-content-wrapper": "",
                style: {
                    ...G,
                    transform: Q ? G.transform : "translate(0, -200%)",
                    minWidth: "max-content",
                    zIndex: et,
                    "--radix-popper-transform-origin": [V.transformOrigin?.x, V.transformOrigin?.y].join(" "),
                    ...V.hide?.referenceHidden && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, i.jsx)(x, {
                    scope: l,
                    placedSide: X,
                    onArrowChange: D,
                    arrowX: Y,
                    arrowY: Z,
                    shouldHideArrow: ee,
                    children: (0, i.jsx)(n.Primitive.div, {
                        "data-side": X,
                        "data-align": K,
                        ...j,
                        ref: M,
                        style: {
                            ...j.style,
                            animation: Q ? void 0 : "none"
                        }
                    })
                })
            })
        });
    S.displayName = w;
    var E = "PopperArrow",
        C = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        _ = t.forwardRef(function(e, t) {
            let {
                __scopePopper: r,
                ...a
            } = e, n = P(E, r), s = C[n.placedSide];
            return (0, i.jsx)("span", {
                ref: n.onArrowChange,
                style: {
                    position: "absolute",
                    left: n.arrowX,
                    top: n.arrowY,
                    [s]: 0,
                    transformOrigin: {
                        top: "",
                        right: "0 0",
                        bottom: "center 0",
                        left: "100% 0"
                    } [n.placedSide],
                    transform: {
                        top: "translateY(100%)",
                        right: "translateY(50%) rotate(90deg) translateX(-50%)",
                        bottom: "rotate(180deg)",
                        left: "translateY(50%) rotate(-90deg) translateX(50%)"
                    } [n.placedSide],
                    visibility: n.shouldHideArrow ? "hidden" : void 0
                },
                children: (0, i.jsx)(o, {
                    ...a,
                    ref: t,
                    style: {
                        ...a.style,
                        display: "block"
                    }
                })
            })
        });

    function R(e) {
        return null !== e
    }
    _.displayName = E;
    var O = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            let {
                placement: r,
                rects: a,
                middlewareData: n
            } = t, i = n.arrow?.centerOffset !== 0, o = i ? 0 : e.arrowWidth, s = i ? 0 : e.arrowHeight, [l, u] = I(r), c = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [u], d = (n.arrow?.x ?? 0) + o / 2, f = (n.arrow?.y ?? 0) + s / 2, p = "", m = "";
            return "bottom" === l ? (p = i ? c : `${d}px`, m = `${-s}px`) : "top" === l ? (p = i ? c : `${d}px`, m = `${a.floating.height+s}px`) : "right" === l ? (p = `${-s}px`, m = i ? c : `${f}px`) : "left" === l && (p = `${a.floating.width+s}px`, m = i ? c : `${f}px`), {
                data: {
                    x: p,
                    y: m
                }
            }
        }
    });

    function I(e) {
        let [t, r = "center"] = e.split("-");
        return [t, r]
    }
    e.s(["Anchor", 0, b, "Arrow", 0, _, "Content", 0, S, "Root", 0, v, "createPopperScope", 0, m], 555876)
}, 813537, e => {
    "use strict";
    var t = e.i(698947),
        r = e.i(420482),
        a = e.i(745911),
        n = r["use".trim()],
        i = e.i(817558),
        o = e.i(244447),
        s = e.i(840154),
        l = e.i(19836),
        u = e.i(180549),
        c = e.i(880983);
    let d = function(e) {
        let {
            Link: c,
            config: d,
            getPathname: f,
            ...p
        } = function(e, a) {
            var u, c, d;
            let f = {
                    ...u = a || {},
                    localePrefix: "object" == typeof(d = u.localePrefix) ? d : {
                        mode: d || "always"
                    },
                    localeCookie: !!((c = u.localeCookie) ?? 1) && {
                        name: "NEXT_LOCALE",
                        sameSite: "lax",
                        ..."object" == typeof c && c
                    },
                    localeDetection: u.localeDetection ?? !0,
                    alternateLinks: u.alternateLinks ?? !0
                },
                p = f.pathnames,
                m = (0, r.forwardRef)(function(t, r) {
                    let a, s, {
                        href: u,
                        locale: c,
                        ...d
                    } = t;
                    "object" == typeof u ? (a = u.pathname, s = u.params) : a = u;
                    let m = (0, i.isLocalizableHref)(u),
                        g = e(),
                        v = (0, i.isPromise)(g) ? n(g) : g,
                        y = m ? h({
                            locale: c || v,
                            href: null == p ? a : {
                                pathname: a,
                                params: s
                            },
                            forcePrefix: null != c || void 0
                        }) : a;
                    return (0, l.jsx)(o.default, {
                        ref: r,
                        href: "object" == typeof u ? {
                            ...u,
                            pathname: y
                        } : y,
                        locale: c,
                        localeCookie: f.localeCookie,
                        ...d
                    })
                });

            function h(e) {
                let t, {
                    forcePrefix: r,
                    href: a,
                    locale: n
                } = e;
                return null == p ? "object" == typeof a ? (t = a.pathname, a.query && (t += (0, s.serializeSearchParams)(a.query))) : t = a : t = (0, s.compileLocalizedPathname)({
                    locale: n,
                    ...(0, s.normalizeNameOrNameWithParams)(a),
                    pathnames: f.pathnames
                }), (0, s.applyPathnamePrefix)(t, n, f, r)
            }

            function g(e) {
                return function(t) {
                    for (var r = arguments.length, a = Array(r > 1 ? r - 1 : 0), n = 1; n < r; n++) a[n - 1] = arguments[n];
                    return e(h(t), ...a)
                }
            }
            return {
                config: f,
                Link: m,
                redirect: g(t.redirect),
                permanentRedirect: g(t.permanentRedirect),
                getPathname: h
            }
        }(a.useLocale, e);
        return {
            ...p,
            Link: c,
            usePathname: function() {
                let e, n, o = (e = (0, t.usePathname)(), n = (0, a.useLocale)(), (0, r.useMemo)(() => {
                        if (!e) return e;
                        let t = e,
                            r = (0, i.getLocalePrefix)(n, d.localePrefix);
                        if ((0, i.hasPathnamePrefixed)(r, e)) t = (0, i.unprefixPathname)(e, r);
                        else if ("never" !== d.localePrefix.mode && d.localePrefix.prefixes) {
                            let r = (0, i.getLocaleAsPrefix)(n);
                            (0, i.hasPathnamePrefixed)(r, e) && (t = (0, i.unprefixPathname)(e, r))
                        }
                        return t
                    }, [d.localePrefix, n, e])),
                    l = (0, a.useLocale)();
                return (0, r.useMemo)(() => o && d.pathnames ? (0, s.getRoute)(l, o, d.pathnames) : o, [l, o])
            },
            useRouter: function() {
                let e = (0, t.useRouter)(),
                    n = (0, a.useLocale)(),
                    i = (0, t.usePathname)();
                return (0, r.useMemo)(() => {
                    function t(e) {
                        return function(t, r) {
                            let {
                                locale: a,
                                ...o
                            } = r || {}, s = [f({
                                href: t,
                                locale: a || n,
                                forcePrefix: null != a || void 0
                            })];
                            Object.keys(o).length > 0 && s.push(o), (0, u.default)(d.localeCookie, i, n, a), e(...s)
                        }
                    }
                    return {
                        ...e,
                        push: t(e.push),
                        replace: t(e.replace),
                        prefetch: t(e.prefetch)
                    }
                }, [n, i, e])
            },
            getPathname: f
        }
    }({
        locales: c.locales,
        defaultLocale: c.defaultLocale,
        localePrefix: {
            mode: "as-needed",
            prefixes: Object.fromEntries([...c.locales.map(e => [e, " "]), [c.defaultLocale, `/${c.defaultLanguage}`], ...Object.entries(c.urlLocalePrefixToLanguage).map(e => {
                let [t, r] = e;
                return [t, `/${r}`]
            })])
        },
        localeDetection: !1,
        localeCookie: !1,
        alternateLinks: !1
    });
    e.s(["Nav", 0, d], 813537)
}, 326602, e => {
    "use strict";
    var t = e.i(587541),
        r = e.i(851460);
    e.s(["intoUrl", 0, e => {
        if (e instanceof t.Url) return e.href;
        if ("string" == typeof e) return e;
        let {
            path: a,
            searchParams: n,
            fragment: i
        } = e, o = null == n ? "" : r.UrlSearchParams.new(n).toString(), s = "" === o ? "" : `?${o}`, l = i ? i.startsWith("#") ? i : `#${i}` : "";
        return `${a}${s}${l}`
    }])
}, 784859, e => {
    "use strict";
    let t = void 0 === globalThis.window,
        r = void 0 !== globalThis.window;
    e.s(["isClient", 0, r, "isServer", 0, t])
}, 931070, e => {
    "use strict";
    var t = e.i(420482),
        r = e.i(698947),
        a = e.i(851460),
        n = e.i(326602),
        i = e.i(813537),
        o = e.i(784859);
    let s = () => o.isServer ? "" : window.location.hash;
    e.s(["useFragment", 0, () => {
        let [e, r] = (0, t.useState)(s());
        return (0, t.useEffect)(() => {
            let e = () => {
                r(s())
            };
            return window.addEventListener("hashchange", e), window.addEventListener("popstate", e), () => {
                window.removeEventListener("hashchange", e), window.removeEventListener("popstate", e)
            }
        }), e
    }, "usePath", 0, () => i.Nav.usePathname(), "useRouter", 0, () => {
        let e = i.Nav.useRouter();
        return (0, t.useMemo)(() => ({
            back: () => {
                e.back()
            },
            forward: () => {
                e.forward()
            },
            refresh: () => {
                e.refresh()
            },
            push: (t, r) => {
                e.push((0, n.intoUrl)(t), r)
            },
            replace: (t, r) => {
                e.replace((0, n.intoUrl)(t), r)
            },
            prefetch: (t, r) => {
                e.prefetch((0, n.intoUrl)(t), r)
            }
        }), [e])
    }, "useSearchParams", 0, () => a.UrlSearchParams.fromURLSearchParams((0, r.useSearchParams)()), "useUnsanitizedSearchParams", 0, () => a.UrlSearchParams.fromURLSearchParams((0, r.useSearchParams)(), !1)], 931070)
}, 454801, 959016, e => {
    "use strict";
    var t = e.i(747769),
        r = e.i(730318),
        a = e.i(420482);
    e.s(["LabelTooltip", 0, e => {
        let {
            title: n,
            description: i,
            position: o = "top-center"
        } = e;
        return a.default.createElement(r.Tooltip, {
            position: o,
            title: n,
            description: i
        }, a.default.createElement(r.TooltipTrigger, {
            asChild: !0
        }, a.default.createElement("span", {
            role: "button",
            tabIndex: 0,
            "aria-label": n,
            className: "flex items-center content-muted",
            "data-testid": "label-tooltip-trigger"
        }, a.default.createElement(t.Icon, {
            name: "icon-regular-circle-i",
            size: "Small"
        }))))
    }], 454801), e.s(["INPUT_BACKGROUND_BY_VARIANT", 0, {
        Standard: "bg-none",
        Contrast: "bg-shift-200",
        Utility: "bg-none"
    }, "INPUT_STROKE_BY_VARIANT", 0, {
        Standard: "stroke-standard",
        Contrast: "stroke-none",
        Utility: "stroke-none"
    }, "INPUT_VARIANTS", 0, ["Standard", "Contrast", "Utility"]], 959016)
}, 953882, e => {
    "use strict";
    var t = e.i(745911);

    function r(e, t) {
        return function() {
            for (var e = arguments.length, r = Array(e), a = 0; a < e; a++) r[a] = arguments[a];
            try {
                return t(...r)
            } catch {
                throw Error(void 0)
            }
        }
    }
    let a = r(0, t.useTranslations),
        n = r(0, t.useFormatter);
    e.s(["useFormatter", 0, n, "useTranslations", 0, a])
}, 801827, e => {
    "use strict";
    var t = e.i(420482),
        r = e.i(953882),
        a = e.i(682877),
        n = e.i(61907);
    e.s(["useTranslations", 0, e => {
        let i = (0, r.useTranslations)((0, n.fromPeriodToColonDelimited)(e));
        return (0, t.useMemo)(() => (0, a.adaptTranslator)(i, e), [i, e])
    }, "useTranslationsInternal", 0, () => (0, r.useTranslations)()])
}, 747769, e => {
    "use strict";
    var t = e.i(7284),
        r = e.i(420482);
    let a = {
            XSmall: "size-[var(--icon-size-xsmall)]",
            Small: "size-[var(--icon-size-small)]",
            Medium: "size-[var(--icon-size-medium)]",
            Large: "size-[var(--icon-size-large)]",
            XLarge: "size-[var(--icon-size-xlarge)]",
            XXLarge: "size-[var(--icon-size-xxlarge)]"
        },
        n = r.default.forwardRef((e, n) => {
            let {
                name: i,
                size: o = "Medium",
                className: s,
                children: l,
                ...u
            } = e;
            return r.default.createElement("span", {
                ref: n,
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.default)("grow-0 shrink-0 basis-auto icon", i, a[o], s),
                ...u
            })
        });
    n.displayName = "Icon", e.s(["Icon", 0, n])
}, 922353, e => {
    "use strict";
    var t = e.i(420482);

    function r(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function a() {
        for (var e = arguments.length, t = Array(e), a = 0; a < e; a++) t[a] = arguments[a];
        return e => {
            let a = !1,
                n = t.map(t => {
                    let n = r(t, e);
                    return a || "function" != typeof n || (a = !0), n
                });
            if (a) return () => {
                for (let e = 0; e < n.length; e++) {
                    let a = n[e];
                    "function" == typeof a ? a() : r(t[e], null)
                }
            }
        }
    }
    e.s(["composeRefs", 0, a, "useComposedRefs", 0, function() {
        for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
        return t.useCallback(a(...r), r)
    }])
}, 954124, e => {
    "use strict";
    var t = e.i(7284),
        r = e.i(420482);
    e.s(["StateLayer", 0, e => {
        let {
            className: a
        } = e;
        return r.default.createElement("div", {
            "aria-hidden": !0,
            "data-testid": "foundation-web-state-layer",
            className: (0, t.default)("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", a)
        })
    }, "interactable", 0, "relative clip group/interactable focus-visible:outline-focus disabled:outline-none"])
}, 493739, e => {
    "use strict";
    let t, r, a;
    var n = e.i(420482),
        i = e.i(922353),
        o = e.i(19836),
        s = Symbol.for("react.lazy"),
        l = n[" use ".trim().toString()];

    function u(e) {
        var t;
        return null != e && "object" == typeof e && "$$typeof" in e && e.$$typeof === s && "_payload" in e && "object" == typeof(t = e._payload) && null !== t && "then" in t
    }
    var c = ((a = n.forwardRef((e, t) => {
            let {
                children: r,
                ...a
            } = e;
            if (u(r) && "function" == typeof l && (r = l(r._payload)), n.isValidElement(r)) {
                var o;
                let e, s, l = (o = r, (s = (e = Object.getOwnPropertyDescriptor(o.props, "ref")?.get) && "isReactWarning" in e && e.isReactWarning) ? o.ref : (s = (e = Object.getOwnPropertyDescriptor(o, "ref")?.get) && "isReactWarning" in e && e.isReactWarning) ? o.props.ref : o.props.ref || o.ref),
                    u = function(e, t) {
                        let r = {
                            ...t
                        };
                        for (let a in t) {
                            let n = e[a],
                                i = t[a];
                            /^on[A-Z]/.test(a) ? n && i ? r[a] = function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                let a = i(...t);
                                return n(...t), a
                            } : n && (r[a] = n) : "style" === a ? r[a] = {
                                ...n,
                                ...i
                            } : "className" === a && (r[a] = [n, i].filter(Boolean).join(" "))
                        }
                        return {
                            ...e,
                            ...r
                        }
                    }(a, r.props);
                return r.type !== n.Fragment && (u.ref = t ? (0, i.composeRefs)(t, l) : l), n.cloneElement(r, u)
            }
            return n.Children.count(r) > 1 ? n.Children.only(null) : null
        })).displayName = "Slot.SlotClone", t = a, (r = n.forwardRef((e, r) => {
            let {
                children: a,
                ...i
            } = e;
            u(a) && "function" == typeof l && (a = l(a._payload));
            let s = n.Children.toArray(a),
                c = s.find(f);
            if (c) {
                let e = c.props.children,
                    a = s.map(t => t !== c ? t : n.Children.count(e) > 1 ? n.Children.only(null) : n.isValidElement(e) ? e.props.children : null);
                return (0, o.jsx)(t, {
                    ...i,
                    ref: r,
                    children: n.isValidElement(e) ? n.cloneElement(e, void 0, a) : null
                })
            }
            return (0, o.jsx)(t, {
                ...i,
                ref: r,
                children: a
            })
        })).displayName = "Slot.Slot", r),
        d = Symbol("radix.slottable");

    function f(e) {
        return n.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === d
    }
    e.s(["Slot", 0, c])
}, 258259, e => {
    "use strict";
    e.s(["disabledOpacity", 0, "opacity-[0.5]"])
}, 523131, e => {
    "use strict";
    var t = e.i(954124),
        r = e.i(258259),
        a = e.i(420482);
    let n = e => {
        let {
            width: t,
            height: r
        } = e;
        return a.default.createElement("svg", {
            className: "foundation-web-loading-spinner",
            width: t,
            height: r,
            viewBox: "0 0 20 20",
            fill: "none",
            xmlns: "http://www.w3.org/2000/svg"
        }, a.default.createElement("path", {
            fillRule: "evenodd",
            clipRule: "evenodd",
            fill: "currentColor",
            d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
        }))
    };
    var i = e.i(747769),
        o = e.i(7284),
        s = e.i(493739);
    let l = {
            Large: 24,
            Medium: 20,
            Small: 16,
            XSmall: 12
        },
        u = {
            Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
            Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
            Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
            XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
        },
        c = {
            Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-alert", "content-action-alert"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        d = {
            Emphasis: ["bg-action-standard", "content-action-standard"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-standard", "content-action-standard"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-standard", "content-action-standard"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        f = (0, a.forwardRef)((e, f) => {
            let {
                children: p,
                className: m,
                style: h,
                isDisabled: g = !1,
                isLoading: v = !1,
                icon: y,
                size: b = "Large",
                variant: w = "Emphasis",
                asChild: x,
                ...P
            } = e, S = (0, o.default)("foundation-web-button", g ? r.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", u[b], g ? d[w] : c[w], m), E = {
                textDecoration: "none",
                ...h
            }, C = e => a.default.createElement(a.default.Fragment, null, a.default.createElement(t.StateLayer, null), v && a.default.createElement("div", {
                "aria-hidden": "true",
                className: "absolute flex"
            }, a.default.createElement(n, {
                width: l[b],
                height: l[b]
            })), a.default.createElement("span", {
                className: (0, o.default)("flex items-center min-width-0", "Large" === b || "Medium" === b ? "gap-small" : "gap-xsmall", v && "invisible")
            }, y && a.default.createElement(i.Icon, {
                name: y,
                size: b
            }), a.default.createElement("span", {
                className: "padding-y-xsmall text-truncate-end text-no-wrap"
            }, e)));
            if (x) {
                let {
                    as: e,
                    ...t
                } = P, r = a.default.Children.only(p);
                return a.default.createElement(s.Slot, {
                    ref: f,
                    ...t,
                    className: S,
                    style: E,
                    "aria-disabled": g || void 0
                }, a.default.cloneElement(r, {}, C(r.props.children)))
            }
            if ("a" === P.as) {
                let {
                    as: e,
                    href: t,
                    ...r
                } = P;
                return a.default.createElement("a", {
                    ref: f,
                    ...r,
                    "aria-disabled": g,
                    href: g ? void 0 : t,
                    className: S,
                    style: E
                }, C(p))
            }
            let {
                as: _,
                ...R
            } = P;
            return a.default.createElement("button", {
                ref: f,
                type: "button",
                ...R,
                disabled: g,
                className: S,
                style: E
            }, C(p))
        });
    e.s(["Button", 0, f], 523131)
}, 389784, e => {
    "use strict";
    var t = e.i(420482),
        r = e.i(922353),
        a = e.i(18731),
        n = e => {
            var n;
            let o, s, {
                    present: l,
                    children: u
                } = e,
                c = function(e) {
                    var r, n;
                    let [o, s] = t.useState(), l = t.useRef({}), u = t.useRef(e), c = t.useRef("none"), [d, f] = (r = e ? "mounted" : "unmounted", n = {
                        mounted: {
                            UNMOUNT: "unmounted",
                            ANIMATION_OUT: "unmountSuspended"
                        },
                        unmountSuspended: {
                            MOUNT: "mounted",
                            ANIMATION_END: "unmounted"
                        },
                        unmounted: {
                            MOUNT: "mounted"
                        }
                    }, t.useReducer((e, t) => n[e][t] ?? e, r));
                    return t.useEffect(() => {
                        let e = i(l.current);
                        c.current = "mounted" === d ? e : "none"
                    }, [d]), (0, a.useLayoutEffect)(() => {
                        let t = l.current,
                            r = u.current;
                        if (r !== e) {
                            let a = c.current,
                                n = i(t);
                            e ? f("MOUNT") : "none" === n || t?.display === "none" ? f("UNMOUNT") : r && a !== n ? f("ANIMATION_OUT") : f("UNMOUNT"), u.current = e
                        }
                    }, [e, f]), (0, a.useLayoutEffect)(() => {
                        if (o) {
                            let e, t = o.ownerDocument.defaultView ?? window,
                                r = r => {
                                    let a = i(l.current).includes(r.animationName);
                                    if (r.target === o && a && (f("ANIMATION_END"), !u.current)) {
                                        let r = o.style.animationFillMode;
                                        o.style.animationFillMode = "forwards", e = t.setTimeout(() => {
                                            "forwards" === o.style.animationFillMode && (o.style.animationFillMode = r)
                                        })
                                    }
                                },
                                a = e => {
                                    e.target === o && (c.current = i(l.current))
                                };
                            return o.addEventListener("animationstart", a), o.addEventListener("animationcancel", r), o.addEventListener("animationend", r), () => {
                                t.clearTimeout(e), o.removeEventListener("animationstart", a), o.removeEventListener("animationcancel", r), o.removeEventListener("animationend", r)
                            }
                        }
                        f("ANIMATION_END")
                    }, [o, f]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: t.useCallback(e => {
                            e && (l.current = getComputedStyle(e)), s(e)
                        }, [])
                    }
                }(l),
                d = "function" == typeof u ? u({
                    present: c.isPresent
                }) : t.Children.only(u),
                f = (0, r.useComposedRefs)(c.ref, (n = d, (s = (o = Object.getOwnPropertyDescriptor(n.props, "ref")?.get) && "isReactWarning" in o && o.isReactWarning) ? n.ref : (s = (o = Object.getOwnPropertyDescriptor(n, "ref")?.get) && "isReactWarning" in o && o.isReactWarning) ? n.props.ref : n.props.ref || n.ref));
            return "function" == typeof u || c.isPresent ? t.cloneElement(d, {
                ref: f
            }) : null
        };

    function i(e) {
        return e?.animationName || "none"
    }
    n.displayName = "Presence", e.s(["Presence", 0, n])
}, 878727, 43734, e => {
    "use strict";
    var t = e.i(954124),
        r = e.i(747769),
        a = e.i(7284),
        n = e.i(420482);
    let i = {
            Small: "padding-xsmall",
            Medium: "padding-small",
            Large: "padding-small"
        },
        o = {
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-100"
        },
        s = e => {
            let {
                variant: s,
                size: l,
                isCircular: u,
                className: c,
                ...d
            } = e;
            return n.default.createElement("button", {
                type: "button",
                className: (0, a.default)("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", t.interactable, o[s], i[l], u && "radius-circle", c),
                ...d
            }, n.default.createElement(t.StateLayer, null), n.default.createElement(r.Icon, {
                name: "icon-regular-x",
                size: l
            }))
        };
    e.s(["CloseAffordance", 0, s], 43734);
    var l = e.i(775453),
        u = e.i(922353),
        c = e.i(9413),
        d = e.i(411207),
        f = e.i(584537),
        p = e.i(783660),
        m = e.i(721988),
        h = e.i(199794),
        g = e.i(389784),
        v = e.i(158051),
        y = e.i(634918),
        b = e.i(700312),
        w = e.i(73772),
        x = e.i(178511),
        P = e.i(19836),
        S = "Dialog",
        [E, C] = (0, c.createContextScope)(S),
        [_, R] = E(S),
        O = e => {
            let {
                __scopeDialog: t,
                children: r,
                open: a,
                defaultOpen: i,
                onOpenChange: o,
                modal: s = !0
            } = e, l = n.useRef(null), u = n.useRef(null), [c = !1, p] = (0, f.useControllableState)({
                prop: a,
                defaultProp: i,
                onChange: o
            });
            return (0, P.jsx)(_, {
                scope: t,
                triggerRef: l,
                contentRef: u,
                contentId: (0, d.useId)(),
                titleId: (0, d.useId)(),
                descriptionId: (0, d.useId)(),
                open: c,
                onOpenChange: p,
                onOpenToggle: n.useCallback(() => p(e => !e), [p]),
                modal: s,
                children: r
            })
        };
    O.displayName = S;
    var I = "DialogTrigger";
    n.forwardRef((e, t) => {
        let {
            __scopeDialog: r,
            ...a
        } = e, n = R(I, r), i = (0, u.useComposedRefs)(t, n.triggerRef);
        return (0, P.jsx)(v.Primitive.button, {
            type: "button",
            "aria-haspopup": "dialog",
            "aria-expanded": n.open,
            "aria-controls": n.contentId,
            "data-state": V(n.open),
            ...a,
            ref: i,
            onClick: (0, l.composeEventHandlers)(e.onClick, n.onOpenToggle)
        })
    }).displayName = I;
    var j = "DialogPortal",
        [k, A] = E(j, {
            forceMount: void 0
        }),
        T = e => {
            let {
                __scopeDialog: t,
                forceMount: r,
                children: a,
                container: i
            } = e, o = R(j, t);
            return (0, P.jsx)(k, {
                scope: t,
                forceMount: r,
                children: n.Children.map(a, e => (0, P.jsx)(g.Presence, {
                    present: r || o.open,
                    children: (0, P.jsx)(h.Portal, {
                        asChild: !0,
                        container: i,
                        children: e
                    })
                }))
            })
        };
    T.displayName = j;
    var M = "DialogOverlay",
        N = n.forwardRef((e, t) => {
            let r = A(M, e.__scopeDialog),
                {
                    forceMount: a = r.forceMount,
                    ...n
                } = e,
                i = R(M, e.__scopeDialog);
            return i.modal ? (0, P.jsx)(g.Presence, {
                present: a || i.open,
                children: (0, P.jsx)($, {
                    ...n,
                    ref: t
                })
            }) : null
        });
    N.displayName = M;
    var D = (0, x.createSlot)("DialogOverlay.RemoveScroll"),
        $ = n.forwardRef((e, t) => {
            let {
                __scopeDialog: r,
                ...a
            } = e, n = R(M, r);
            return (0, P.jsx)(b.RemoveScroll, {
                as: D,
                allowPinchZoom: !0,
                shards: [n.contentRef],
                children: (0, P.jsx)(v.Primitive.div, {
                    "data-state": V(n.open),
                    ...a,
                    ref: t,
                    style: {
                        pointerEvents: "auto",
                        ...a.style
                    }
                })
            })
        }),
        U = "DialogContent",
        z = n.forwardRef((e, t) => {
            let r = A(U, e.__scopeDialog),
                {
                    forceMount: a = r.forceMount,
                    ...n
                } = e,
                i = R(U, e.__scopeDialog);
            return (0, P.jsx)(g.Presence, {
                present: a || i.open,
                children: i.modal ? (0, P.jsx)(L, {
                    ...n,
                    ref: t
                }) : (0, P.jsx)(W, {
                    ...n,
                    ref: t
                })
            })
        });
    z.displayName = U;
    var L = n.forwardRef((e, t) => {
            let r = R(U, e.__scopeDialog),
                a = n.useRef(null),
                i = (0, u.useComposedRefs)(t, r.contentRef, a);
            return n.useEffect(() => {
                let e = a.current;
                if (e) return (0, w.hideOthers)(e)
            }, []), (0, P.jsx)(F, {
                ...e,
                ref: i,
                trapFocus: r.open,
                disableOutsidePointerEvents: !0,
                onCloseAutoFocus: (0, l.composeEventHandlers)(e.onCloseAutoFocus, e => {
                    e.preventDefault(), r.triggerRef.current?.focus()
                }),
                onPointerDownOutside: (0, l.composeEventHandlers)(e.onPointerDownOutside, e => {
                    let t = e.detail.originalEvent,
                        r = 0 === t.button && !0 === t.ctrlKey;
                    (2 === t.button || r) && e.preventDefault()
                }),
                onFocusOutside: (0, l.composeEventHandlers)(e.onFocusOutside, e => e.preventDefault())
            })
        }),
        W = n.forwardRef((e, t) => {
            let r = R(U, e.__scopeDialog),
                a = n.useRef(!1),
                i = n.useRef(!1);
            return (0, P.jsx)(F, {
                ...e,
                ref: t,
                trapFocus: !1,
                disableOutsidePointerEvents: !1,
                onCloseAutoFocus: t => {
                    e.onCloseAutoFocus?.(t), t.defaultPrevented || (a.current || r.triggerRef.current?.focus(), t.preventDefault()), a.current = !1, i.current = !1
                },
                onInteractOutside: t => {
                    e.onInteractOutside?.(t), t.defaultPrevented || (a.current = !0, "pointerdown" === t.detail.originalEvent.type && (i.current = !0));
                    let n = t.target;
                    r.triggerRef.current?.contains(n) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && i.current && t.preventDefault()
                }
            })
        }),
        F = n.forwardRef((e, t) => {
            let {
                __scopeDialog: r,
                trapFocus: a,
                onOpenAutoFocus: i,
                onCloseAutoFocus: o,
                ...s
            } = e, l = R(U, r), c = n.useRef(null), d = (0, u.useComposedRefs)(t, c);
            return (0, y.useFocusGuards)(), (0, P.jsxs)(P.Fragment, {
                children: [(0, P.jsx)(m.FocusScope, {
                    asChild: !0,
                    loop: !0,
                    trapped: a,
                    onMountAutoFocus: i,
                    onUnmountAutoFocus: o,
                    children: (0, P.jsx)(p.DismissableLayer, {
                        role: "dialog",
                        id: l.contentId,
                        "aria-describedby": l.descriptionId,
                        "aria-labelledby": l.titleId,
                        "data-state": V(l.open),
                        ...s,
                        ref: d,
                        onDismiss: () => l.onOpenChange(!1)
                    })
                }), (0, P.jsxs)(P.Fragment, {
                    children: [(0, P.jsx)(Y, {
                        titleId: l.titleId
                    }), (0, P.jsx)(Z, {
                        contentRef: c,
                        descriptionId: l.descriptionId
                    })]
                })]
            })
        }),
        B = "DialogTitle",
        q = n.forwardRef((e, t) => {
            let {
                __scopeDialog: r,
                ...a
            } = e, n = R(B, r);
            return (0, P.jsx)(v.Primitive.h2, {
                id: n.titleId,
                ...a,
                ref: t
            })
        });
    q.displayName = B;
    var G = "DialogDescription";
    n.forwardRef((e, t) => {
        let {
            __scopeDialog: r,
            ...a
        } = e, n = R(G, r);
        return (0, P.jsx)(v.Primitive.p, {
            id: n.descriptionId,
            ...a,
            ref: t
        })
    }).displayName = G;
    var H = "DialogClose",
        Q = n.forwardRef((e, t) => {
            let {
                __scopeDialog: r,
                ...a
            } = e, n = R(H, r);
            return (0, P.jsx)(v.Primitive.button, {
                type: "button",
                ...a,
                ref: t,
                onClick: (0, l.composeEventHandlers)(e.onClick, () => n.onOpenChange(!1))
            })
        });

    function V(e) {
        return e ? "open" : "closed"
    }
    Q.displayName = H;
    var X = "DialogTitleWarning",
        [K, J] = (0, c.createContext)(X, {
            contentName: U,
            titleName: B,
            docsSlug: "dialog"
        }),
        Y = e => {
            let {
                titleId: t
            } = e, r = J(X), a = `\`${r.contentName}\` requires a \`${r.titleName}\` for the component to be accessible for screen reader users.

If you want to hide the \`${r.titleName}\`, you can wrap it with our VisuallyHidden component.

For more information, see https://radix-ui.com/primitives/docs/components/${r.docsSlug}`;
            return n.useEffect(() => {
                t && (document.getElementById(t) || console.error(a))
            }, [a, t]), null
        },
        Z = e => {
            let {
                contentRef: t,
                descriptionId: r
            } = e, a = J("DialogDescriptionWarning"), i = `Warning: Missing \`Description\` or \`aria-describedby={undefined}\` for {${a.contentName}}.`;
            return n.useEffect(() => {
                let e = t.current?.getAttribute("aria-describedby");
                r && e && (document.getElementById(r) || console.warn(i))
            }, [i, t, r]), null
        },
        ee = e.i(285565),
        et = Object.freeze({
            position: "absolute",
            border: 0,
            width: 1,
            height: 1,
            padding: 0,
            margin: -1,
            overflow: "hidden",
            clip: "rect(0, 0, 0, 0)",
            whiteSpace: "nowrap",
            wordWrap: "normal"
        }),
        er = n.forwardRef((e, t) => (0, P.jsx)(ee.Primitive.span, {
            ...e,
            ref: t,
            style: {
                ...et,
                ...e.style
            }
        }));
    er.displayName = "VisuallyHidden";
    let ea = (0, n.createContext)({
            size: "Medium",
            isModal: !0,
            hasCloseAffordance: !1,
            hasMarginTop: !0,
            hasMarginBottom: !0,
            hasDescription: !1,
            type: "Default"
        }),
        en = () => {
            let e = (0, n.useContext)(ea);
            if (!e) throw Error("Dialog components must be used within a Dialog");
            return e
        },
        ei = {
            Small: "padding-x-large",
            Medium: "padding-x-xlarge",
            Large: "padding-x-xlarge"
        },
        eo = {
            Small: "padding-top-large",
            Medium: "padding-top-xlarge",
            Large: "padding-top-xlarge"
        },
        es = {
            Small: "padding-bottom-large",
            Medium: "padding-bottom-xlarge",
            Large: "padding-bottom-xlarge"
        },
        el = e => {
            let {
                open: t,
                onOpenChange: r,
                children: a,
                size: i,
                type: o = "Default",
                isModal: s,
                hasCloseAffordance: l,
                closeLabel: u,
                hasMarginTop: c = !0,
                hasMarginBottom: d = !0,
                hasDescription: f = !1,
                experimentalDisablePointerEventsStylingOnBody: p = !1
            } = e, m = (0, n.useMemo)(() => ({
                size: i,
                isModal: s,
                type: o,
                hasCloseAffordance: l,
                closeLabel: u,
                hasMarginTop: c,
                hasMarginBottom: d,
                hasDescription: f
            }), [i, s, o, l, u, c, d, f]);
            return (0, n.useEffect)(() => {
                p && setTimeout(() => {
                    Object.assign(document.body.style, {
                        pointerEvents: "unset"
                    })
                }, 0)
            }, [p, t]), n.default.createElement(ea.Provider, {
                value: m
            }, n.default.createElement(O, {
                open: t,
                onOpenChange: r
            }, a))
        };
    el.displayName = "Dialog";
    let eu = e => {
        let {
            children: t,
            className: r,
            style: i,
            overlayClassName: o,
            overlayStyle: l,
            onOpenAutoFocus: u,
            ...c
        } = e, {
            size: d,
            isModal: f,
            hasCloseAffordance: p,
            closeLabel: m,
            hasDescription: h
        } = en(), g = (0, a.default)("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", f && "bg-common-backdrop", o), v = (0, a.default)("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
        return n.default.createElement(T, null, n.default.createElement(N, {
            className: g,
            style: l
        }, n.default.createElement(z, {
            className: v,
            "data-size": d,
            style: i,
            onOpenAutoFocus: u,
            ...!h && {
                "aria-describedby": void 0
            },
            ...c
        }, p && n.default.createElement("div", {
            className: "absolute foundation-web-dialog-close-container"
        }, n.default.createElement(Q, {
            asChild: !0
        }, n.default.createElement(s, {
            variant: "OverMedia",
            size: d,
            isCircular: !0,
            "aria-label": m
        }))), t)))
    };
    eu.displayName = "DialogContent";
    let ec = e => {
        let {
            children: t,
            className: r,
            ...i
        } = e;
        return n.default.createElement("div", {
            className: (0, a.default)("foundation-web-dialog-hero-media", r),
            ...i
        }, t)
    };
    ec.displayName = "DialogHeroMedia";
    let ed = e => {
        let {
            children: t,
            className: r,
            ...i
        } = e, {
            size: o,
            hasMarginTop: s,
            hasMarginBottom: l
        } = en(), u = (0, a.default)(ei[o], s && eo[o], l && es[o], r);
        return n.default.createElement("div", {
            className: u,
            ...i
        }, t)
    };
    ed.displayName = "DialogBody";
    let ef = e => {
        let {
            children: t,
            className: r,
            hidden: a,
            ...i
        } = e, o = n.default.createElement(q, {
            className: r,
            ...i
        }, t);
        return a ? n.default.createElement(er, null, o) : o
    };
    ef.displayName = "DialogTitle";
    let ep = e => {
        let {
            children: t,
            className: r,
            ...i
        } = e, {
            size: o
        } = en(), s = (0, a.default)(ei[o], es[o], r);
        return n.default.createElement("div", {
            className: s,
            ...i
        }, t)
    };
    ep.displayName = "DialogFooter", e.s(["Dialog", 0, el, "DialogBody", 0, ed, "DialogContent", 0, eu, "DialogFooter", 0, ep, "DialogHeroMedia", 0, ec, "DialogTitle", 0, ef], 878727)
}, 418568, e => {
    "use strict";
    var t = e.i(646424),
        r = e.i(815079);
    e.i(350223);
    var a = e.i(874296);
    let n = a.object({
        gpcVersion: a.number(),
        cooldownPeriodInMs: a.number(),
        cooldownPeriodFuzzyInMs: a.number()
    });
    e.s(["getGlobalPrivacyControlPolicy", 0, () => t.get(r.apiGateway.withPath("/guac-v2/v1/bundles/user-settings-global-privacy-control-policy"), n), "postGlobalPrivacyControl", 0, () => t.postUntyped(r.apiGateway.withPath("/user-settings-api/v1/user-settings/gpc"), "", {
        credentials: "include"
    })], 418568)
}, 233971, e => {
    "use strict";
    var t = e.i(360702),
        r = e.i(646424),
        a = e.i(815079),
        n = e.i(418568);
    e.s(["getIsYourPrivacyChoicesModalEnabled", 0, () => r.getUntyped(a.apiGateway.withPath("/guac-v2/v1/bundles/footer-ui"), {
        credentials: "include"
    }).map(e => null != e && "object" == typeof e && !Array.isArray(e) && !0 === e.IsPrivacyChoiceModalEnabled), "getModalData", 0, e => {
        let i = !0 === window.navigator.globalPrivacyControl;
        return null == e ? (0, t.okAsync)({
            isGpcEnabled: i,
            canUserManageAdsSettings: !1,
            isAdsSellShareDataEnabled: !1
        }) : (0, n.postGlobalPrivacyControl)().andThen(() => {
            let e;
            return t.AsyncResult.all([r.getUntyped(a.apiGateway.withPath("/user-settings-api/v1/user-settings"), {
                credentials: "include"
            }).map(e => null != e && "object" == typeof e && !Array.isArray(e) && "Enabled" === e.allowSellShareData), (e = a.apiGateway.withPath("/access-management/v1/upsell-feature-access").withSearchParams({
                namespace: "account_management/UserSettingsPolicy",
                featureName: "ShouldShowAdsSettings"
            }), r.getUntyped(e, {
                credentials: "include"
            }).map(e => null != e && "object" == typeof e && !Array.isArray(e) && "Granted" === e.access))]).map(e => {
                let [t, r] = e;
                return {
                    isGpcEnabled: i,
                    canUserManageAdsSettings: r,
                    isAdsSellShareDataEnabled: t
                }
            })
        })
    }])
}, 392435, e => {
    "use strict";
    var t = e.i(778935),
        r = e.i(55001),
        a = e.i(378944),
        n = e.i(7284),
        i = e.i(420482);
    let o = (0, i.forwardRef)((e, o) => {
        let {
            title: s,
            icon: l,
            actionLabel: u,
            onAction: c,
            actions: d,
            onClose: f,
            closeIconAriaLabel: p = "Dismiss snackbar",
            shouldAutoDismiss: m,
            autoDismissDurationMs: h,
            className: g,
            ...v
        } = e, [y, b] = (0, i.useState)("enter"), w = (0, i.useRef)(void 0), x = (0, i.useRef)(void 0), P = (0, i.useRef)(void 0), S = (0, i.useRef)(null), E = d ?? (u && c && i.default.createElement(r.Button, {
            size: "Small",
            variant: "Utility",
            className: "content-inverse-emphasis",
            onClick: c,
            ref: S
        }, u)), C = !!E, _ = s.length > 80, R = m ?? !0, O = 4e3;
        C && (O = _ ? 1e4 : 7e3);
        let I = h ?? O,
            j = (0, i.useCallback)(() => {
                "exit" !== y && (b("exit"), void 0 !== x.current && (window.clearTimeout(x.current), x.current = void 0), P.current = window.setTimeout(() => {
                    f?.()
                }, 150))
            }, [f, y]);
        (0, i.useEffect)(() => (w.current = window.requestAnimationFrame(() => {
            b("idle")
        }), () => {
            void 0 !== w.current && window.cancelAnimationFrame(w.current)
        }), []), (0, i.useEffect)(() => {
            void 0 !== x.current && (window.clearTimeout(x.current), x.current = void 0), R && "exit" !== y && (x.current = window.setTimeout(() => {
                j()
            }, I))
        }, [I, R, y, j]), (0, i.useEffect)(() => {
            C && S.current?.focus()
        }, [C]), (0, i.useEffect)(() => () => {
            void 0 !== x.current && window.clearTimeout(x.current), void 0 !== P.current && window.clearTimeout(P.current), void 0 !== w.current && window.cancelAnimationFrame(w.current)
        }, []);
        let k = {
                position: "fixed",
                left: "50%",
                bottom: "max(var(--padding-xxlarge, 32px), env(safe-area-inset-bottom))",
                transform: `translate(-50%, ${"idle"===y?"0":"120%"})`,
                zIndex: "var(--foundation-portal-zindex, 9999)"
            },
            A = v.style ? {
                ...k,
                ...v.style
            } : k;
        return i.default.createElement("div", {
            ref: o,
            role: "status",
            "aria-live": "polite",
            className: (0, n.default)("flex items-center gap-xxlarge radius-medium shadow-transient-low bg-inverse-surface-0 padding-x-medium padding-y-medium stroke-standard shrink-0", "max-width-[480px] min-height-[48px]", "min-width-[min(100%-max(2_*_var(--margin-small),env(safe-area-inset-left)+env(safe-area-inset-right)),393px)]", "foundation-web-portal-zindex pointer-events-auto", "exit" === y ? "ease-standard-in" : "ease-standard-out", g),
            style: {
                ...A,
                transitionDuration: `${"exit"===y?150:200}ms`,
                transitionProperty: "transform"
            },
            ...v
        }, i.default.createElement("div", {
            className: "flex items-center gap-medium grow-1 basis-0 min-h-[40px]"
        }, l && i.default.createElement(t.Icon, {
            name: l,
            size: "Small",
            className: "shrink-0 content-inverse-emphasis"
        }), i.default.createElement("div", {
            className: "grow-1 basis-0 text-caption-large content-inverse-emphasis text-truncate-end"
        }, s)), i.default.createElement("div", {
            className: "flex items-center justify-end gap-small shrink-0"
        }, E, f && i.default.createElement(a.CloseAffordance, {
            variant: "Utility",
            size: "Small",
            isCircular: !0,
            className: "content-inverse-emphasis",
            "aria-label": p,
            onClick: j
        })))
    });
    e.s(["Snackbar", 0, o])
}, 381111, e => {
    "use strict";
    var t = e.i(245837),
        r = e.i(646424),
        a = e.i(587541),
        n = e.i(645020),
        i = e.i(723941);
    let o = [],
        s = !1,
        l = () => {
            if (s = !1, 0 === o.length) return;
            let e = o;
            o = [], r.postUntyped(a.Url.parse(`${t.default.beaconApi}/v1/measurements`).getOrThrow(), e, {
                credentials: "include",
                keepalive: !0,
                signal: AbortSignal.timeout(3e3)
            })
        };
    e.s(["logMeasurement", 0, (e, t) => {
        let r = (0, i.serialize)(t);
        o.push({
            metricName: e,
            jsonData: r.isOk() ? r.value : "{}"
        });
        let {
            batchSize: a,
            waitMs: u
        } = (() => {
            if ("u" < typeof document) return {
                batchSize: 100,
                waitMs: 1e3
            };
            let e = document.getElementsByName("performance")[0],
                t = (0, n.parseInt)(e?.getAttribute("data-ui-performance-metrics-batch-size") ?? ""),
                [r, a, i] = (e?.getAttribute("data-ui-performance-metrics-batch-wait-time") ?? "").split(":"),
                o = (((0, n.parseInt)(r ?? "") ?? 0) * 3600 + ((0, n.parseInt)(a ?? "") ?? 0) * 60 + ((0, n.parseInt)(i ?? "") ?? 0)) * 1e3;
            return {
                batchSize: t ?? 100,
                waitMs: 0 === o ? 1e3 : o
            }
        })();
        o.length >= a ? l() : s || (s = !0, setTimeout(l, u))
    }])
}, 474557, e => {
    "use strict";
    var t = e.i(7284),
        r = e.i(420482);
    let a = ["[&::after]:[content:'']", "[&::after]:absolute", "[&::after]:inset-[0]", "[&::after]:[background:linear-gradient(90deg,var(--color-extended-white-0)_0%,var(--color-extended-white-20)_50%,var(--color-extended-white-0)_100%)]", "[&::after]:[animation:foundation-web-skeleton-shimmer_1.5s_linear_infinite]", "motion-reduce:[&::after]:[content:none]"],
        n = (0, r.forwardRef)((e, n) => {
            let {
                className: i,
                style: o,
                variant: s = "Rectangle",
                isAnimated: l = !0,
                width: u,
                height: c,
                ...d
            } = e, f = "Text" === s, p = "Circle" === s, m = {};
            return f ? (m.height = c ?? "1em", m.width = u ?? "100%") : (void 0 !== u && (m.width = u), void 0 !== c && (m.height = c)), r.default.createElement("div", {
                ref: n,
                "aria-hidden": "true",
                "data-variant": s,
                ...d,
                className: (0, t.default)("relative clip block bg-[var(--color-common-shimmer)]", f && "radius-xsmall", p && "radius-circle", !f && !p && "radius-small", l && a, i),
                style: {
                    ...m,
                    ...o
                }
            })
        });
    n.displayName = "Skeleton", e.s(["Skeleton", 0, n])
}, 599965, 846379, 99213, e => {
    "use strict";
    var t = e.i(19836),
        r = e.i(420482),
        a = e.i(708923),
        n = e.i(474557);
    let i = Error("thumbnail pending"),
        o = (e, t) => t === i && e < 5;
    e.s(["THUMBNAIL_PENDING", 0, i, "retryPendingThumbnail", 0, o], 846379), e.i(350223);
    var s = e.i(874296),
        l = e.i(245837),
        u = e.i(646424),
        c = e.i(734899),
        d = e.i(587541);
    let f = "150x150",
        p = "webp",
        m = e => `${e.type}:${e.targetId}:${e.size??f}:${e.format??p}:${e.version??""}:${e.headShape??""}:${e.includeBackground?"bg":""}:${e.includeProfileFrame?"frame":""}`,
        h = s.object({
            data: s.array(s.object({
                requestId: s.string(),
                state: s.literal(["Completed", "Pending", "Blocked", "Error", "InReview"]),
                imageUrl: s.nullish(s.string())
            }))
        }),
        g = async e => {
            var t;
            let r, a = d.Url.parse(l.default.thumbnailsApi).getOrThrow().withPath("/v1/batch"),
                n = e.map(e => ({
                    requestId: m(e),
                    type: e.type,
                    targetId: e.targetId,
                    size: e.size ?? f,
                    format: e.format ?? p,
                    ...null != e.version ? {
                        version: e.version
                    } : {},
                    ...e.headShape ? {
                        headShape: e.headShape
                    } : {},
                    ...e.includeBackground ? {
                        includeBackground: !0
                    } : {},
                    ...e.includeProfileFrame && "AvatarHeadShot" === e.type ? {
                        includeProfileFrame: !0
                    } : {}
                }));
            return t = (await u.post(a, n, h, {
                credentials: "include",
                headers: {
                    Accept: "application/json"
                },
                retry: u.defaultBrowserRetryDelay
            })).getOrThrow(), r = new Map, t.data.forEach(e => {
                let {
                    requestId: t,
                    state: a,
                    imageUrl: n
                } = e;
                "Completed" === a ? r.set(t, null != n ? {
                    state: a,
                    imageUrl: n
                } : {
                    state: "Error"
                }) : r.set(t, null != n ? {
                    state: a,
                    imageUrl: n
                } : {
                    state: a
                })
            }), r
        }, v = (0, c.batchQuery)({
            delay: 50,
            maxSize: 100
        }, g, (e, t) => e.get(m(t)) ?? {
            state: "Error"
        });
    e.s(["resolveThumbnail", 0, v], 99213);
    var y = e.i(381111);
    e.s(["Thumbnail2d", 0, e => {
        let {
            targetId: s,
            type: l,
            size: u,
            format: c,
            version: d,
            headShape: f,
            includeBackground: p,
            includeProfileFrame: m,
            altName: h = "",
            imgClassName: g = "",
            containerClassName: b = "",
            onLoad: w
        } = e, x = (0, r.useRef)(Date.now()), P = (0, r.useRef)(0), S = (0, r.useRef)(!1), E = p ?? l?.toLowerCase() === "avatarheadshot", {
            data: C,
            isError: _,
            error: R,
            isPending: O,
            isLoading: I
        } = (0, a.useQuery)({
            queryKey: ["thumbnail-2d", l, s, u, c, d, f, E, m],
            staleTime: 1 / 0,
            retry: o,
            queryFn: async () => {
                let e = await v({
                    type: l,
                    targetId: s,
                    size: u,
                    format: c,
                    version: d,
                    headShape: f,
                    includeBackground: E,
                    includeProfileFrame: m
                });
                if ("Pending" === e.state) throw P.current += 1, i;
                return e
            }
        });
        (0, r.useEffect)(() => {
            x.current = Date.now(), P.current = 0, S.current = !1
        }, [l, s, u, c, d, f, E, m]), (0, r.useEffect)(() => {
            if (S.current) return;
            let e = `${l}_2d`;
            if (C) {
                if (S.current = !0, (0, y.logMeasurement)("ThumbnailStatusCountWebapp", {
                        Status: C.state,
                        ThumbnailType: e
                    }), "Completed" === C.state) {
                    let t = P.current;
                    (0, y.logMeasurement)("ThumbnailLoadDurationWebapp", {
                        Status: "Success",
                        ThumbnailType: e,
                        Value: String(Date.now() - x.current)
                    }), (0, y.logMeasurement)(0 === t ? "ThumbnailNoRetrySuccessWebapp" : "ThumbnailRetryWebapp", 0 === t ? {
                        ThumbnailType: e
                    } : {
                        ThumbnailType: e,
                        Value: String(t)
                    })
                }
            } else _ && R === i && (S.current = !0, (0, y.logMeasurement)("ThumbnailTimeoutWebapp", {
                ThumbnailType: e
            }))
        }, [C, _, R, l]);
        let j = C?.imageUrl ?? null,
            k = C?.state === "Blocked" ? "icon-blocked" : C?.state === "InReview" ? "icon-in-review" : C?.state === "Error" ? "icon-broken" : _ ? R === i ? "icon-pending" : "icon-broken" : "",
            A = O ?? I,
            T = ["thumbnail-2d-container float-left overflow-hidden", b, k, A && "thumbnail-2d-loading"].filter(Boolean).join(" ");
        return (0, t.jsxs)("span", {
            className: T,
            children: [A && (0, t.jsx)(n.Skeleton, {
                variant: "Rectangle",
                width: "100%",
                height: "100%"
            }), null != j && (0, t.jsx)("img", {
                className: ["size-full", g].filter(Boolean).join(" "),
                src: j,
                alt: h,
                onLoad: w
            })]
        })
    }], 599965)
}, 82927, 59408, e => {
    "use strict";
    let t = (e, t) => t.some(t => t instanceof RegExp ? t.test(e) : t === e),
        r = new Set(["https:", "http:", "file:"]);

    function a(e, a) {
        if ("string" != typeof(a = {
                defaultProtocol: "http",
                normalizeProtocol: !0,
                forceHttp: !1,
                forceHttps: !1,
                stripAuthentication: !0,
                stripHash: !1,
                stripTextFragment: !0,
                stripWWW: !0,
                removeQueryParameters: [/^utm_\w+/i],
                removeTrailingSlash: !0,
                removeSingleSlash: !0,
                removeDirectoryIndex: !1,
                removeExplicitPort: !1,
                sortQueryParameters: !0,
                removePath: !1,
                transformPath: !1,
                ...a
            }).defaultProtocol || a.defaultProtocol.endsWith(":") || (a.defaultProtocol = `${a.defaultProtocol}:`), e = e.trim(), /^data:/i.test(e)) return ((e, t) => {
            let {
                stripHash: r
            } = t, a = /^data:(?<type>[^,]*?),(?<data>[^#]*?)(?:#(?<hash>.*))?$/.exec(e);
            if (!a) throw Error(`Invalid URL: ${e}`);
            let {
                type: n,
                data: i,
                hash: o
            } = a.groups, s = n.split(";");
            o = r ? "" : o;
            let l = !1;
            "base64" === s[s.length - 1] && (s.pop(), l = !0);
            let u = s.shift()?.toLowerCase() ?? "",
                c = [...s.map(e => {
                    let [t, r = ""] = e.split("=").map(e => e.trim());
                    return "charset" === t && "us-ascii" === (r = r.toLowerCase()) ? "" : `${t}${r?`=${r}`:""}`
                }).filter(Boolean)];
            return l && c.push("base64"), (c.length > 0 || u && "text/plain" !== u) && c.unshift(u), `data:${c.join(";")},${l?i.trim():i}${o?`#${o}`:""}`
        })(e, a);
        if ((e => {
                try {
                    let {
                        protocol: t
                    } = new URL(e);
                    return t.endsWith(":") && !t.includes(".") && !r.has(t)
                } catch {
                    return !1
                }
            })(e)) return e;
        let n = e.startsWith("//");
        !n && /^\.*\//.test(e) || (e = e.replace(/^(?!(?:\w+:)?\/\/)|^\/\//, a.defaultProtocol));
        let i = new URL(e);
        if (a.forceHttp && a.forceHttps) throw Error("The `forceHttp` and `forceHttps` options cannot be used together");
        if (a.forceHttp && "https:" === i.protocol && (i.protocol = "http:"), a.forceHttps && "http:" === i.protocol && (i.protocol = "https:"), a.stripAuthentication && (i.username = "", i.password = ""), a.stripHash ? i.hash = "" : a.stripTextFragment && (i.hash = i.hash.replace(/#?:~:text.*?$/i, "")), i.pathname) {
            let e = /\b[a-z][a-z\d+\-.]{1,50}:\/\//g,
                t = 0,
                r = "";
            for (;;) {
                let a = e.exec(i.pathname);
                if (!a) break;
                let n = a[0],
                    o = a.index;
                r += i.pathname.slice(t, o).replace(/\/{2,}/g, "/"), r += n, t = o + n.length
            }
            r += i.pathname.slice(t, i.pathname.length).replace(/\/{2,}/g, "/"), i.pathname = r
        }
        if (i.pathname) try {
            i.pathname = decodeURI(i.pathname).replace(/\\/g, "%5C")
        } catch {}
        if (!0 === a.removeDirectoryIndex && (a.removeDirectoryIndex = [/^index\.[a-z]+$/]), Array.isArray(a.removeDirectoryIndex) && a.removeDirectoryIndex.length > 0) {
            let e = i.pathname.split("/");
            t(e[e.length - 1], a.removeDirectoryIndex) && (i.pathname = (e = e.slice(0, -1)).slice(1).join("/") + "/")
        }
        if (a.removePath && (i.pathname = "/"), a.transformPath && "function" == typeof a.transformPath) {
            let e = i.pathname.split("/").filter(Boolean),
                t = a.transformPath(e);
            i.pathname = t?.length > 0 ? `/${t.join("/")}` : "/"
        }
        if (i.hostname && (i.hostname = i.hostname.replace(/\.$/, ""), a.stripWWW && /^www\.(?!www\.)[a-z\-\d]{1,63}\.[a-z.\-\d]{2,63}$/.test(i.hostname) && (i.hostname = i.hostname.replace(/^www\./, ""))), Array.isArray(a.removeQueryParameters))
            for (let e of [...i.searchParams.keys()]) t(e, a.removeQueryParameters) && i.searchParams.delete(e);
        if (Array.isArray(a.keepQueryParameters) || !0 !== a.removeQueryParameters || (i.search = ""), Array.isArray(a.keepQueryParameters) && a.keepQueryParameters.length > 0)
            for (let e of [...i.searchParams.keys()]) t(e, a.keepQueryParameters) || i.searchParams.delete(e);
        if (a.sortQueryParameters) {
            let e = i.search;
            i.searchParams.sort();
            try {
                i.search = decodeURIComponent(i.search)
            } catch {}
            for (let t of e.slice(1).split("&").filter(e => e && !e.includes("="))) {
                let e = decodeURIComponent(t);
                i.search = i.search.replace(`?${e}=`, `?${e}`).replace(`&${e}=`, `&${e}`)
            }
        }
        a.removeTrailingSlash && (i.pathname = i.pathname.replace(/\/$/, "")), a.removeExplicitPort && i.port && (i.port = "");
        let o = e;
        return e = i.toString(), a.removeSingleSlash || "/" !== i.pathname || o.endsWith("/") || "" !== i.hash || (e = e.replace(/\/$/, "")), (a.removeTrailingSlash || "/" === i.pathname) && "" === i.hash && a.removeSingleSlash && (e = e.replace(/\/$/, "")), n && !a.normalizeProtocol && (e = e.replace(/^http:\/\//, "//")), a.stripProtocol && (e = e.replace(/^(?:https?:)?\/\//, "")), e
    }
    e.s(["default", 0, a], 59408);
    var n = e.i(851460),
        i = e.i(245837),
        o = e.i(371078);
    let s = function() {
            let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
            return n.UrlSearchParams.new(Object.entries(e).filter(e => {
                let [, t] = e;
                if (null == t) return !1;
                switch (typeof t) {
                    case "boolean":
                    case "string":
                    case "number":
                    case "bigint":
                        return !0
                }
                return !1
            }).map(e => {
                let [t, r] = e;
                return [t, r.toString()]
            }), !1).toSorted().toString()
        },
        l = (e, t) => {
            let r = s(t);
            return (0, o.getAbsoluteUrl)("" === r ? e : `${e}?${r}`)
        },
        u = e => {
            try {
                let {
                    protocol: t
                } = new URL(e);
                return "http:" === t || "https:" === t
            } catch {
                return !1
            }
        };
    e.s(["composeQueryString", 0, s, "getQueryParam", 0, e => n.UrlSearchParams.parse(window.location.search).get(e) ?? void 0, "getUrlWithLocale", 0, (e, t) => t ? l(e, {
        locale: t
    }) : e, "getUrlWithQueries", 0, l, "isValidHttpUrl", 0, u, "isValidStripeCheckoutUrl", 0, e => u(e) && (e.includes("checkout.stripe.com") || e.includes(i.default.stripeCheckoutDomain)), "urlSafetyValidation", 0, e => {
        let t;
        try {
            t = a(e, {
                defaultProtocol: "https",
                stripWWW: !1,
                sortQueryParameters: !1
            })
        } catch {
            return
        }
        if (!u(t)) return;
        let r = new URL(t),
            {
                domain: n
            } = i.default,
            o = n.split("."),
            s = r.hostname.split(".");
        if ((s.length >= o.length ? s.slice(-o.length).join(".") : r.hostname) === n) return r
    }], 82927)
}, 940311, e => {
    "use strict";
    var t = e.i(545819),
        r = e.i(883355);
    let a = "mrrouter-env",
        n = () => {
            let {
                hostname: e
            } = window.location;
            return /^\d\d?\d?\.\d\d?\d?\.\d\d?\d?\.\d\d?\d?$/.test(e) ? e : e.substring(e.indexOf(".") + 1)
        },
        i = () => ({
            envName: t.get(a)?.value ?? ""
        });
    e.s(["SSR_COOKIE_NAME", 0, a, "getMrRouterConfig", 0, i, "getMrRouterEnvName", 0, () => i().envName, "setMrRouterEnvName", 0, e => {
        let i = e ?? "";
        r.removeItem("Roblox.MrRouterConfig"), "" === i ? t.delete(a, {
            domain: n()
        }) : t.set(a, i, {
            domain: n(),
            maxAge: 86400
        })
    }])
}, 460987, 200643, e => {
    "use strict";
    var t, r = e.i(932598),
        a = e.i(357355);
    (t = {}).Edge = "edge", t.IE = "ie", t.Chrome = "chrome", t.Opera = "opera", t.Safari = "safari", t.Firefox = "firefox", t.Unknown = "";
    let n = function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : a.navigator?.userAgent;
        if (void 0 !== e) {
            if (null !== /Edge\/([0-9._]+)/.exec(e) || null !== /EdgA?\/([0-9.]+)/.exec(e)) return "edge";
            if (null !== /(?!Chrom.*OPR)Chrom(?:e|ium)\/([0-9.]+)(:?\s|$)/.exec(e)) return "chrome";
            if (null !== /Firefox\/([0-9.]+)(?:\s|$)/.exec(e)) return "firefox";
            if (null !== /Opera\/([0-9.]+)(?:\s|$)/.exec(e) || null !== /OPR\/([0-9.]+)(:?\s|$)/.exec(e)) return "opera";
            if (null !== /Trident\/7\.0.*rv:([0-9.]+).*\).*Gecko$/.exec(e) || null !== /MSIE\s([0-9.]+);.*Trident\/[4-7].0/.exec(e) || null !== /MSIE\s(7\.0)/.exec(e)) return "ie";
            if (null !== /Version\/([0-9._]+).*Safari/.exec(e)) return "safari"
        }
        return ""
    };
    var i = e.i(548835),
        o = e.i(245837);
    let s = e => "play" !== e,
        l = ["sitetest1.robloxlabs.com", "sitetest2.robloxlabs.com", "sitetest3.robloxlabs.com"],
        u = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : o.default.domain;
            return l.includes(t) ? `${e}-${t.split(".")[0]}` : e
        },
        c = (e, t, r, a) => `${e}?${Object.entries({request:t,browserTrackerId:r,...Object.fromEntries(Object.entries(a).filter(e=>{let[,t]=e;return void 0!==t}))}).map(e=>{let[t,r]=e;return`
    $ {
        encodeURIComponent(t)
    } = $ {
        encodeURIComponent(r ?? "")
    }
    `}).join("&").replace(/%20/g,"+")}`, d = (e, t, r) => {
        let a = ["1", `launchmode:${e.launchMode}`];
        return t && a.push(`gameinfo:${encodeURIComponent(t)}`), a.push(`launchtime:${String(e.launchTime)}`), r && (null != r.userId && a.push("distributorType:Global", `userId:${String(r.userId)}`), a.push(`browser:${r.browser}`)), Object.entries(e.otherParams).forEach(e => {
            let [t, r] = e;
            a.push(t === r ? t : `${t}:${encodeURIComponent(String(r))}`)
        }), `${e.protocolName}:${a.join("+")}`
    };
    e.s(["buildPlaceLauncherUrl", 0, c, "buildProtocolUrl", 0, d, "getProtocolNameForEnvironment", 0, u, "isStudioLaunchMode", 0, s], 200643);
    let f = e => {
        document.querySelector("iframe#gamelaunch")?.remove();
        let t = document.createElement("iframe");
        t.id = "gamelaunch", t.className = "hidden", t.src = e, document.body.appendChild(t), window.dispatchEvent(new Event("ProtocolLaunchStartSelenium"))
    };
    e.s(["createGameLauncher", 0, e => {
        let t, r = e.installState ?? (t = !1, {
                get: () => t,
                set: e => {
                    t = e
                }
            }),
            a = e.openProtocolUrl ?? f,
            o = e => ({
                launchMethod: "Protocol",
                params: e
            }),
            l = async t => {
                try {
                    let l, u = s(t.launchMode),
                        c = (0, i.resetClientStatus)();
                    e.isAuthenticated() && !u ? [l] = await Promise.all([(0, i.getAuthTicket)(), c]) : await c;
                    let f = u ? {
                        userId: e.isAuthenticated() ? e.getUserId() : null,
                        browser: n()
                    } : void 0;
                    a(d(t, l, f)), e.onLaunchSucceeded(), e.onEvent("startClientSucceeded", o(t)), r.get() && (e.onEvent("successfulInstall", o(t)), r.set(!1))
                } catch (t) {
                    e.onLaunchFailed(t)
                }
            }, p = function(t) {
                let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "play",
                    a = e.getConfig(),
                    n = s(r),
                    i = {
                        ...t,
                        protocolName: u(n ? "roblox-studio" : "roblox-player"),
                        launchMode: r,
                        launchTime: Date.now()
                    },
                    {
                        otherParams: c
                    } = i;
                c.browsertrackerid = e.getBrowserTrackerId(), c.robloxLocale = a.robloxLocale, c.gameLocale = a.gameLocale, n ? c.channel = a.studioChannel : a.isOmitPlayerChannelForWinAndMacEnabled && e.isWindowsOrMac() || (c.channel = a.playerChannel), n || !a.isDuarAutoOptInEnabled || c.LaunchExp || (c.LaunchExp = a.isDuarOptOutDisabled ? "InApp" : "PreferInApp"), e.onEvent("startClientAttempted", o(i));
                let d = l(i);
                return e.onLaunchStarted(i, () => l(i)), d
            }, m = (t, r) => {
                let n = () => {
                    a(t)
                };
                e.onLaunchStarted(r, () => (n(), Promise.resolve())), n()
            }, h = (t, r) => c(e.getConfig().placeLauncherUrl, t, e.getBrowserTrackerId(), r), g = t => null == e.onGuestLaunch || e.isAuthenticated() ? t() : (e.onGuestLaunch(), Promise.resolve()), v = (t, r, a) => e.launchInApp?.({
                ...t,
                browserTrackerId: e.getBrowserTrackerId(),
                ..."string" == typeof r.joinAttemptId ? {
                    joinAttemptId: r.joinAttemptId
                } : {},
                ..."string" == typeof r.joinAttemptOrigin ? {
                    joinAttemptOrigin: r.joinAttemptOrigin
                } : {}
            }) ?? a();
        return {
            joinMultiplayerGame: e => g(() => v({
                requestType: "RequestGame",
                placeId: String(e.placeId),
                isPlayTogetherGame: !0 === e.isPlayTogetherGame
            }, e, () => p({
                otherParams: {
                    placelauncherurl: h("RequestGame", e)
                },
                placeId: e.placeId,
                isPlayTogetherGame: !0 === e.isPlayTogetherGame,
                launchData: e.launchData,
                eventId: e.eventId
            }))),
            followPlayerIntoGame: e => g(() => v({
                requestType: "RequestFollowUser",
                userId: String(e.userId)
            }, e, () => p({
                otherParams: {
                    placelauncherurl: h("RequestFollowUser", e)
                }
            }))),
            joinGameInstance: e => g(() => v({
                requestType: "RequestGameJob",
                placeId: String(e.placeId),
                instanceId: e.gameId,
                isPlayTogetherGame: !0 === e.isPlayTogetherGame
            }, e, () => p({
                otherParams: {
                    placelauncherurl: h("RequestGameJob", e)
                },
                placeId: e.placeId,
                isPlayTogetherGame: !0 === e.isPlayTogetherGame
            }))),
            joinPrivateGame: e => v({
                requestType: "RequestPrivateGame",
                placeId: String(e.placeId),
                ...null == e.accessCode ? {} : {
                    accessCode: e.accessCode
                },
                ...null == e.linkCode ? {} : {
                    linkCode: e.linkCode
                }
            }, e, () => p({
                otherParams: {
                    placelauncherurl: h("RequestPrivateGame", e)
                },
                placeId: e.placeId
            })),
            playTogetherGame: e => g(() => v({
                requestType: "RequestGame",
                placeId: String(e.placeId),
                conversationId: String(e.conversationId)
            }, e, () => p({
                otherParams: {
                    placelauncherurl: h("RequestPlayTogetherGame", e)
                },
                placeId: e.placeId,
                conversationId: e.conversationId
            }))),
            openStudio: () => p({
                otherParams: {
                    avatar: "avatar"
                }
            }, "edit"),
            editGameInStudio: e => {
                let {
                    placeId: t,
                    universeId: r,
                    startTeamTest: a = !1,
                    instanceId: n,
                    annotationId: i
                } = e;
                return p({
                    otherParams: {
                        task: a ? "StartTeamTest" : "EditPlace",
                        placeId: t,
                        universeId: r,
                        ...!a && n ? {
                            targetInstanceId: n
                        } : {},
                        ...!a && i ? {
                            annotationId: i
                        } : {},
                        avatar: "avatar"
                    },
                    placeId: t
                }, "edit")
            },
            tryAssetInStudio: e => {
                let {
                    assetId: t
                } = e;
                return p({
                    otherParams: {
                        assetid: t,
                        avatar: "avatar"
                    }
                }, "asset")
            },
            openPluginInStudio: e => {
                let {
                    pluginId: t
                } = e;
                return p({
                    otherParams: {
                        pluginid: t,
                        avatar: "avatar"
                    }
                }, "plugin")
            },
            startDeepLinkFlow: e => {
                m(e, {})
            },
            startGameWithDeepLinkUrl: (e, t) => {
                m(e, {
                    protocolName: u("roblox-player"),
                    launchMode: "play",
                    otherParams: {},
                    placeId: t
                })
            },
            beginInstall: t => {
                e.onEvent("beginInstall", o(t)), r.set(!0)
            },
            manualDownload: () => {
                e.onEvent("manualDownload", o({}))
            }
        }
    }, "withJoinAttemptId", 0, (e, t, a) => ({
        ...e,
        joinAttemptId: t ?? (0, r.generateRandomUuid)(),
        ...a ? {
            joinAttemptOrigin: a
        } : {}
    })], 460987)
}, 817396, e => {
    "use strict";
    e.s(["getHelpDeskUrl", 0, (e, t, r) => {
        let a = r ?? "https://en.help.roblox.com/hc/";
        return null != e && e && /^[a-zA-Z0-9-_]+$/.test(e) ? a += (e => {
            let t = {
                "zh-cn": "zh-cn",
                zh_cn: "zh-cn",
                "zh-cjv": "zh-cn",
                zh_cjv: "zh-cn",
                "zh-hans": "zh-cn",
                zh_hans: "zh-cn",
                "zh-tw": "zh-tw",
                zh_tw: "zh-tw",
                "zh-hant": "zh-tw",
                zh_hant: "zh-tw",
                "en-us": "en-us",
                en_us: "en-us",
                en: "en-us",
                "en-gb": "en-gb",
                en_gb: "en-gb",
                "fr-ca": "fr-ca",
                fr_ca: "fr-ca",
                nb: "no",
                "nb-no": "no",
                nb_no: "no"
            };
            if (t[e]) return t[e];
            let r = e.split(/[^a-zA-Z0-9]/).filter(Boolean);
            return r[0] ? r[0] : "en"
        })(e) : a += "en-us", t && /^[a-zA-Z0-9]+$/.test(t) && (a += `/articles/${t}`), a
    }])
}, 100266, e => {
    "use strict";
    var t = e.i(420482),
        r = e.i(888104),
        a = e.i(734899);
    e.i(350223);
    var n = e.i(874296),
        i = e.i(245837),
        o = e.i(646424),
        s = e.i(587541);
    let l = n.nullish(n.string()),
        u = n.looseObject({
            userId: n.number(),
            names: n.nullish(n.looseObject({
                combinedName: l,
                username: l,
                displayName: l,
                alias: l,
                contactName: l,
                platformName: l,
                inExperienceName: l
            }))
        }),
        c = n.object({
            profileDetails: n.nullish(n.array(u))
        }),
        d = async (e, t) => {
            let r = s.Url.parse(i.default.apiGatewayUrl).getOrThrow().withPath("/user-profile-api/v1/user/profiles/get-profiles");
            return (await o.post(r, {
                userIds: [...e],
                fields: [...t]
            }, c, {
                credentials: "include",
                headers: {
                    Accept: "application/json"
                },
                retry: o.defaultBrowserRetryDelay
            })).getOrThrow().profileDetails ?? []
        }, f = async (e, t) => {
            let r = [...new Set(e)],
                a = [];
            for (let e = 0; e < r.length; e += 200) a.push(r.slice(e, e + 200));
            let n = await Promise.all(a.map(e => d(e, t))),
                i = {};
            for (let e of n.flat()) i[e.userId] = e;
            return i
        }, p = e => [...new Set(e)].sort(), m = {
            all: () => ["userProfiles"],
            fields: e => [...m.all(), p(e).join(",")],
            user: (e, t) => [...m.fields(e), t]
        }, h = new Map;
    e.s(["useUserProfiles", 0, function(e, n) {
        let {
            enabled: i = !0,
            staleTime: o = 3e5
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}, s = (0, t.useMemo)(() => [...new Set(e)], [e]), l = (0, r.useQueries)({
            queries: s.map(e => ({
                queryKey: m.user(n, e),
                queryFn: () => {
                    let t, r, i;
                    return r = (t = p(n)).join(","), null == (i = h.get(r)) && (i = (0, a.batchQuery)({
                        delay: 10,
                        maxSize: 200
                    }, e => f(e, t), (e, t) => e[t] ?? {
                        userId: t
                    }), h.set(r, i)), i(e)
                },
                enabled: i,
                staleTime: o
            }))
        }), u = l.map(e => e.data), c = (0, t.useRef)(null);
        if (c.current?.profiles.length !== u.length || c.current.profiles.some((e, t) => e !== u[t])) {
            let e = {};
            u.forEach(t => {
                null != t && (e[t.userId] = t)
            }), c.current = {
                profiles: u,
                data: e
            }
        }
        let d = i && l.some(e => void 0 === e.data && "error" !== e.status);
        return {
            data: c.current.data,
            isLoading: d
        }
    }, "userProfilesQueryKeys", 0, m], 100266)
}, 548835, e => {
    "use strict";
    e.i(350223);
    var t = e.i(874296),
        r = e.i(245837),
        a = e.i(646424),
        n = e.i(723941),
        i = e.i(587541);
    let o = (e, t) => i.Url.parse(`${e.replace(/\/+$/,"")}${t}`).getOrThrow(),
        s = t.object({
            status: t.string()
        }),
        l = ["Unknown", "BootstrapperInstalling", "AppStarted", "AcquiringGame", "JoiningGame", "InGame", "LeftGame"],
        u = async () => {
            let {
                status: e
            } = (await a.get(o(r.default.matchmakingApi, "/v1/client-status"), s, {
                credentials: "include"
            })).getOrThrow();
            return l.find(t => t === e) ?? "Unknown"
        }, c = async () => {
            (await a.fetch(o(r.default.matchmakingApi, "/v1/client-status"), {
                method: "POST",
                credentials: "include",
                headers: {
                    "content-type": "application/json"
                },
                body: (0, n.serialize)({
                    status: "Unknown"
                }).value
            })).getOrThrow()
        }, d = async () => {
            let e = await a.getUntyped(o(r.default.authApi, "/v1/client-assertion/"), {
                    credentials: "include"
                }),
                t = await a.fetch(o(r.default.authApi, "/v1/authentication-ticket/"), {
                    method: "POST",
                    credentials: "include",
                    headers: {
                        "content-type": "application/json"
                    },
                    body: (0, n.serialize)((e.isOk() ? e.value : null) ?? {}).getOrThrow()
                });
            if (t.isErr()) return;
            let i = t.value.headers.get("rbx-authentication-ticket");
            if (i) return i
        };
    e.s(["getAuthTicket", 0, d, "getClientStatus", 0, u, "resetClientStatus", 0, c])
}, 165188, 364457, 80247, e => {
    "use strict";
    let t = "EdpDownloadRobloxInstaller",
        r = "tokenAction",
        a = "create-token-attempt",
        n = {
            Installer: "installer",
            WebGameJoin: "web_game_join"
        },
        i = "deeplink";
    e.s(["deferredDeeplinkCreateTokenAction", 0, a, "deferredDeeplinkCreateTokenEventName", 0, r, "deferredDeeplinkDownloadInstallerContext", 0, t, "deferredDeeplinkGroupName", 0, i, "downloadSourceType", 0, n], 364457);
    var o = e.i(646424),
        s = e.i(587541),
        l = e.i(245837),
        u = e.i(778579);
    let c = function(e, n, o) {
            try {
                (0, u.sendEventWithTarget)(r, t, {
                    link_url: n,
                    group: i,
                    action: a,
                    status_code: o,
                    token: e ?? ""
                }, u.targetTypes.WWW)
            } catch {}
        },
        d = async function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                {
                    authTicket: r,
                    btId: a,
                    downloadSource: n
                } = t,
                u = {
                    linkId: e,
                    group: i
                };
            r && (u.authTicket = r), a && (u.btId = a), n && (u.downloadSource = n);
            try {
                let t = await o.fetch(s.Url.parse(l.default.apiGatewayUrl).getOrThrow().withPath("/deferred-deep-link/token-api/create-token"), {
                        method: "POST",
                        credentials: "include",
                        headers: {
                            "content-type": "application/json"
                        },
                        body: JSON.stringify(u)
                    }).getOrThrow(),
                    r = await t.json(),
                    a = "object" == typeof r && null !== r && "token" in r && ("string" == typeof r.token || null === r.token) ? r.token : null;
                return c(a, e, t.status), a
            } catch {
                return null
            }
        };
    var f = e.i(309937),
        p = e.i(270784),
        m = e.i(548835);
    let h = async () => ({
        authTicket: null != (0, f.authenticatedUser)() ? await (0, m.getAuthTicket)() : void 0,
        btId: (0, p.getBrowserTrackerId)() || void 0
    }), g = async e => {
        let {
            linkId: t,
            downloadSource: r
        } = e;
        if (null == t) return {};
        let {
            authTicket: a,
            btId: n
        } = await h(), i = await d(t, {
            authTicket: a,
            btId: n,
            downloadSource: r
        });
        return i ? {
            token: i
        } : {}
    };
    e.s(["getDownloadLinkParams", 0, g], 80247);
    let v = ["/games/{placeId}/{placeName}", "/share-links?code={linkId}&type=ExperienceInvite"].map(e => new RegExp(e.replace(/\{.*?\}/g, "([^/]+)"))),
        y = async e => {
            let t = (e => {
                let t = (e => {
                    try {
                        let t = new URL(e).searchParams.get("referralUrl");
                        if (!t) return null;
                        let r = new URL(decodeURIComponent(t));
                        return "/share-links" === r.pathname && "ExperienceAffiliate" === r.searchParams.get("type") ? r.href : null
                    } catch {
                        return null
                    }
                })(e);
                if (t) return t;
                let r = new URL(e);
                return r.search = "", r.hash = "", v.some(e => e.test(r.pathname)) ? r.toString() : null
            })(e);
            if (!t) return "";
            let {
                token: r
            } = await g({
                linkId: t,
                downloadSource: n.Installer
            });
            return r ? `?token=${r}` : ""
        };
    e.s(["getInstallerDeeplinkQueryParams", 0, y], 165188)
}, 683418, (e, t, r) => {
    "use strict";

    function a(e) {
        let {
            widthInt: t,
            heightInt: r,
            blurWidth: a,
            blurHeight: n,
            blurDataURL: i,
            objectFit: o
        } = e, s = a ? 40 * a : t, l = n ? 40 * n : r, u = s && l ? `viewBox='0 0 ${s} ${l}'` : "";
        return `%3Csvg xmlns='http://www.w3.org/2000/svg' ${u}%3E%3Cfilter id='b' color-interpolation-filters='sRGB'%3E%3CfeGaussianBlur stdDeviation='20'/%3E%3CfeColorMatrix values='1 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 100 -1' result='s'/%3E%3CfeFlood x='0' y='0' width='100%25' height='100%25'/%3E%3CfeComposite operator='out' in='s'/%3E%3CfeComposite in2='SourceGraphic'/%3E%3CfeGaussianBlur stdDeviation='20'/%3E%3C/filter%3E%3Cimage width='100%25' height='100%25' x='0' y='0' preserveAspectRatio='${u?"none":"contain"===o?"xMidYMid":"cover"===o?"xMidYMid slice":"none"}' style='filter: url(%23b);' href='${i}'/%3E%3C/svg%3E`
    }
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "getImageBlurSvg", {
        enumerable: !0,
        get: function() {
            return a
        }
    })
}, 868903, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var a = {
        VALID_LOADERS: function() {
            return i
        },
        imageConfigDefault: function() {
            return o
        }
    };
    for (var n in a) Object.defineProperty(r, n, {
        enumerable: !0,
        get: a[n]
    });
    let i = ["default", "imgix", "cloudinary", "akamai", "custom"],
        o = {
            deviceSizes: [640, 750, 828, 1080, 1200, 1920, 2048, 3840],
            imageSizes: [32, 48, 64, 96, 128, 256, 384],
            path: "/_next/image",
            loader: "default",
            loaderFile: "",
            domains: [],
            disableStaticImages: !1,
            minimumCacheTTL: 14400,
            formats: ["image/webp"],
            maximumDiskCacheSize: void 0,
            maximumRedirects: 3,
            maximumResponseBody: 5e7,
            dangerouslyAllowLocalIP: !1,
            dangerouslyAllowSVG: !1,
            contentSecurityPolicy: "script-src 'none'; frame-src 'none'; sandbox;",
            contentDispositionType: "attachment",
            localPatterns: void 0,
            remotePatterns: [],
            qualities: [75],
            unoptimized: !1,
            customCacheHandler: !1
        }
}, 476199, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "getImgProps", {
        enumerable: !0,
        get: function() {
            return u
        }
    }), e.r(239971);
    let a = e.r(330903),
        n = e.r(683418),
        i = e.r(868903),
        o = ["-moz-initial", "fill", "none", "scale-down", void 0];

    function s(e) {
        return void 0 !== e.default
    }

    function l(e) {
        return void 0 === e ? e : "number" == typeof e ? Number.isFinite(e) ? e : NaN : "string" == typeof e && /^[0-9]+$/.test(e) ? parseInt(e, 10) : NaN
    }

    function u(e, t) {
        var r;
        let u, c, d, {
                src: f,
                sizes: p,
                unoptimized: m = !1,
                priority: h = !1,
                preload: g = !1,
                loading: v,
                className: y,
                quality: b,
                width: w,
                height: x,
                fill: P = !1,
                style: S,
                overrideSrc: E,
                onLoad: C,
                onLoadingComplete: _,
                placeholder: R = "empty",
                blurDataURL: O,
                fetchPriority: I,
                decoding: j = "async",
                layout: k,
                objectFit: A,
                objectPosition: T,
                lazyBoundary: M,
                lazyRoot: N,
                ...D
            } = e,
            {
                imgConf: $,
                showAltText: U,
                blurComplete: z,
                defaultLoader: L
            } = t,
            W = $ || i.imageConfigDefault;
        if ("allSizes" in W) u = W;
        else {
            let e = [...W.deviceSizes, ...W.imageSizes].sort((e, t) => e - t),
                t = W.deviceSizes.sort((e, t) => e - t),
                r = W.qualities?.sort((e, t) => e - t);
            u = {
                ...W,
                allSizes: e,
                deviceSizes: t,
                qualities: r
            }
        }
        if (void 0 === L) throw Object.defineProperty(Error("images.loaderFile detected but the file is missing default export.\nRead more: https://nextjs.org/docs/messages/invalid-images-config"), "__NEXT_ERROR_CODE", {
            value: "E163",
            enumerable: !1,
            configurable: !0
        });
        let F = D.loader || L;
        delete D.loader, delete D.srcSet;
        let B = "__next_img_default" in F;
        if (B) {
            if ("custom" === u.loader) throw Object.defineProperty(Error(`Image with src "${f}" is missing "loader" prop.
Read more: https://nextjs.org/docs/messages/next-image-missing-loader`), "__NEXT_ERROR_CODE", {
                value: "E252",
                enumerable: !1,
                configurable: !0
            })
        } else {
            let e = F;
            F = t => {
                let {
                    config: r,
                    ...a
                } = t;
                return e(a)
            }
        }
        if (k) {
            "fill" === k && (P = !0);
            let e = {
                intrinsic: {
                    maxWidth: "100%",
                    height: "auto"
                },
                responsive: {
                    width: "100%",
                    height: "auto"
                }
            } [k];
            e && (S = {
                ...S,
                ...e
            });
            let t = {
                responsive: "100vw",
                fill: "100vw"
            } [k];
            t && !p && (p = t)
        }
        let q = "",
            G = l(w),
            H = l(x);
        if ((r = f) && "object" == typeof r && (s(r) || void 0 !== r.src)) {
            let e = s(f) ? f.default : f;
            if (!e.src) throw Object.defineProperty(Error(`An object should only be passed to the image component src parameter if it comes from a static image import. It must include src. Received ${JSON.stringify(e)}`), "__NEXT_ERROR_CODE", {
                value: "E460",
                enumerable: !1,
                configurable: !0
            });
            if (!e.height || !e.width) throw Object.defineProperty(Error(`An object should only be passed to the image component src parameter if it comes from a static image import. It must include height and width. Received ${JSON.stringify(e)}`), "__NEXT_ERROR_CODE", {
                value: "E48",
                enumerable: !1,
                configurable: !0
            });
            if (c = e.blurWidth, d = e.blurHeight, O = O || e.blurDataURL, q = e.src, !P)
                if (G || H) {
                    if (G && !H) {
                        let t = G / e.width;
                        H = Math.round(e.height * t)
                    } else if (!G && H) {
                        let t = H / e.height;
                        G = Math.round(e.width * t)
                    }
                } else G = e.width, H = e.height
        }
        let Q = !h && !g && ("lazy" === v || void 0 === v);
        (!(f = "string" == typeof f ? f : q) || f.startsWith("data:") || f.startsWith("blob:")) && (m = !0, Q = !1), u.unoptimized && (m = !0), B && !u.dangerouslyAllowSVG && f.split("?", 1)[0].endsWith(".svg") && (m = !0);
        let V = l(b),
            X = Object.assign(P ? {
                position: "absolute",
                height: "100%",
                width: "100%",
                left: 0,
                top: 0,
                right: 0,
                bottom: 0,
                objectFit: A,
                objectPosition: T
            } : {}, U ? {} : {
                color: "transparent"
            }, S),
            K = z || "empty" === R ? null : "blur" === R ? `url("data:image/svg+xml;charset=utf-8,${(0,n.getImageBlurSvg)({widthInt:G,heightInt:H,blurWidth:c,blurHeight:d,blurDataURL:O||"",objectFit:X.objectFit})}")` : `url("${R}")`,
            J = o.includes(X.objectFit) ? "fill" === X.objectFit ? "100% 100%" : "cover" : X.objectFit,
            Y = K ? {
                backgroundSize: J,
                backgroundPosition: X.objectPosition || "50% 50%",
                backgroundRepeat: "no-repeat",
                backgroundImage: K
            } : {},
            Z = function(e) {
                let {
                    config: t,
                    src: r,
                    unoptimized: n,
                    width: i,
                    quality: o,
                    sizes: s,
                    loader: l
                } = e;
                if (n) {
                    if (r.startsWith("/") && !r.startsWith("//")) {
                        let e = (0, a.getDeploymentId)();
                        if (e) {
                            let t = r.indexOf("?");
                            if (-1 !== t) {
                                let a = new URLSearchParams(r.slice(t + 1));
                                a.get("dpl") || (a.append("dpl", e), r = r.slice(0, t) + "?" + a.toString())
                            } else r += `?dpl=${e}`
                        }
                    }
                    return {
                        src: r,
                        srcSet: void 0,
                        sizes: void 0
                    }
                }
                let {
                    widths: u,
                    kind: c
                } = function(e, t, r) {
                    let {
                        deviceSizes: a,
                        allSizes: n
                    } = e;
                    if (r) {
                        let e = /(^|\s)(1?\d?\d)vw/g,
                            t = [];
                        for (let a; a = e.exec(r);) t.push(parseInt(a[2]));
                        if (t.length) {
                            let e = .01 * Math.min(...t);
                            return {
                                widths: n.filter(t => t >= a[0] * e),
                                kind: "w"
                            }
                        }
                        return {
                            widths: n,
                            kind: "w"
                        }
                    }
                    return "number" != typeof t ? {
                        widths: a,
                        kind: "w"
                    } : {
                        widths: [...new Set([t, 2 * t].map(e => n.find(t => t >= e) || n[n.length - 1]))],
                        kind: "x"
                    }
                }(t, i, s), d = u.length - 1;
                return {
                    sizes: s || "w" !== c ? s : "100vw",
                    srcSet: u.map((e, a) => `${l({config:t,src:r,quality:o,width:e})} ${"w"===c?e:a+1}${c}`).join(", "),
                    src: l({
                        config: t,
                        src: r,
                        quality: o,
                        width: u[d]
                    })
                }
            }({
                config: u,
                src: f,
                unoptimized: m,
                width: G,
                quality: V,
                sizes: p,
                loader: F
            }),
            ee = Q ? "lazy" : v;
        return {
            props: {
                ...D,
                loading: ee,
                fetchPriority: I,
                width: G,
                height: H,
                decoding: j,
                className: y,
                style: {
                    ...X,
                    ...Y
                },
                sizes: Z.sizes,
                srcSet: Z.srcSet,
                src: E || Z.src
            },
            meta: {
                unoptimized: m,
                preload: g || h,
                placeholder: R,
                fill: P
            }
        }
    }
}, 150016, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "default", {
        enumerable: !0,
        get: function() {
            return s
        }
    });
    let a = e.r(420482),
        n = "u" < typeof window,
        i = n ? () => {} : a.useLayoutEffect,
        o = n ? () => {} : a.useEffect;

    function s(e) {
        let {
            headManager: t,
            reduceComponentsToState: r
        } = e;

        function s() {
            if (t && t.mountedInstances) {
                let e = a.Children.toArray(Array.from(t.mountedInstances).filter(Boolean));
                t.updateHead(r(e))
            }
        }
        return n && (t?.mountedInstances?.add(e.children), s()), i(() => (t?.mountedInstances?.add(e.children), () => {
            t?.mountedInstances?.delete(e.children)
        })), i(() => (t && (t._pendingUpdate = s), () => {
            t && (t._pendingUpdate = s)
        })), o(() => (t && t._pendingUpdate && (t._pendingUpdate(), t._pendingUpdate = null), () => {
            t && t._pendingUpdate && (t._pendingUpdate(), t._pendingUpdate = null)
        })), null
    }
}, 96452, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var a = {
        default: function() {
            return h
        },
        defaultHead: function() {
            return d
        }
    };
    for (var n in a) Object.defineProperty(r, n, {
        enumerable: !0,
        get: a[n]
    });
    let i = e.r(481258),
        o = e.r(744066),
        s = e.r(19836),
        l = o._(e.r(420482)),
        u = i._(e.r(150016)),
        c = e.r(620229);

    function d() {
        return [(0, s.jsx)("meta", {
            charSet: "utf-8"
        }, "charset"), (0, s.jsx)("meta", {
            name: "viewport",
            content: "width=device-width"
        }, "viewport")]
    }

    function f(e, t) {
        return "string" == typeof t || "number" == typeof t ? e : t.type === l.default.Fragment ? e.concat(l.default.Children.toArray(t.props.children).reduce((e, t) => "string" == typeof t || "number" == typeof t ? e : e.concat(t), [])) : e.concat(t)
    }
    e.r(239971);
    let p = ["name", "httpEquiv", "charSet", "itemProp"];

    function m(e) {
        let t, r, a, n;
        return e.reduce(f, []).reverse().concat(d().reverse()).filter((t = new Set, r = new Set, a = new Set, n = {}, e => {
            let i = !0,
                o = !1;
            if (e.key && "number" != typeof e.key && e.key.indexOf("$") > 0) {
                o = !0;
                let r = e.key.slice(e.key.indexOf("$") + 1);
                t.has(r) ? i = !1 : t.add(r)
            }
            switch (e.type) {
                case "title":
                case "base":
                    r.has(e.type) ? i = !1 : r.add(e.type);
                    break;
                case "meta":
                    for (let t = 0, r = p.length; t < r; t++) {
                        let r = p[t];
                        if (e.props.hasOwnProperty(r))
                            if ("charSet" === r) a.has(r) ? i = !1 : a.add(r);
                            else {
                                let t = e.props[r],
                                    a = n[r] || new Set;
                                ("name" !== r || !o) && a.has(t) ? i = !1 : (a.add(t), n[r] = a)
                            }
                    }
            }
            return i
        })).reverse().map((e, t) => {
            let r = e.key || t;
            return l.default.cloneElement(e, {
                key: r
            })
        })
    }
    let h = function(e) {
        let {
            children: t
        } = e, r = (0, l.useContext)(c.HeadManagerContext);
        return (0, s.jsx)(u.default, {
            reduceComponentsToState: m,
            headManager: r,
            children: t
        })
    };
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 498162, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "ImageConfigContext", {
        enumerable: !0,
        get: function() {
            return i
        }
    });
    let a = e.r(481258)._(e.r(420482)),
        n = e.r(868903),
        i = a.default.createContext(n.imageConfigDefault)
}, 312673, (e, t, r) => {
    "use strict";

    function a(e, t) {
        let r = e || 75;
        return t?.qualities?.length ? t.qualities.reduce((e, t) => Math.abs(t - r) < Math.abs(e - r) ? t : e, t.qualities[0]) : r
    }
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "findClosestQuality", {
        enumerable: !0,
        get: function() {
            return a
        }
    })
}, 673033, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "default", {
        enumerable: !0,
        get: function() {
            return o
        }
    });
    let a = e.r(312673),
        n = e.r(330903);

    function i(e) {
        let {
            config: t,
            src: r,
            width: i,
            quality: o
        } = e, s = (0, n.getDeploymentId)();
        if (r.startsWith("/") && !r.startsWith("//")) {
            let e = r.indexOf("?");
            if (-1 !== e) {
                let t = new URLSearchParams(r.slice(e + 1)),
                    a = t.get("dpl");
                if (a) {
                    s = a, t.delete("dpl");
                    let n = t.toString();
                    r = r.slice(0, e) + (n ? "?" + n : "")
                }
            }
        }
        if (r.startsWith("/") && r.includes("?") && t.localPatterns?.length === 1 && "**" === t.localPatterns[0].pathname && "" === t.localPatterns[0].search) throw Object.defineProperty(Error(`Image with src "${r}" is using a query string which is not configured in images.localPatterns.
Read more: https://nextjs.org/docs/messages/next-image-unconfigured-localpatterns`), "__NEXT_ERROR_CODE", {
            value: "E871",
            enumerable: !1,
            configurable: !0
        });
        let l = (0, a.findClosestQuality)(o, t);
        return `${t.path}?url=${encodeURIComponent(r)}&w=${i}&q=${l}${r.startsWith("/")&&s?`&dpl=${s}`:""}`
    }
    i.__next_img_default = !0;
    let o = i
}, 252696, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "Image", {
        enumerable: !0,
        get: function() {
            return w
        }
    });
    let a = e.r(481258),
        n = e.r(744066),
        i = e.r(19836),
        o = n._(e.r(420482)),
        s = a._(e.r(301775)),
        l = a._(e.r(96452)),
        u = e.r(476199),
        c = e.r(868903),
        d = e.r(498162);
    e.r(239971);
    let f = e.r(921332),
        p = a._(e.r(673033)),
        m = e.r(74284),
        h = {
            deviceSizes: [640, 750, 828, 1080, 1200, 1920, 2048, 3840],
            imageSizes: [32, 48, 64, 96, 128, 256, 384],
            qualities: [75],
            path: "/_next/image",
            loader: "default",
            dangerouslyAllowSVG: !1,
            unoptimized: !0
        };

    function g(e, t, r, a, n, i, o) {
        let s = e?.src;
        e && e["data-loaded-src"] !== s && (e["data-loaded-src"] = s, ("decode" in e ? e.decode() : Promise.resolve()).catch(() => {}).then(() => {
            if (e.parentElement && e.isConnected) {
                if ("empty" !== t && n(!0), r?.current) {
                    let t = new Event("load");
                    Object.defineProperty(t, "target", {
                        writable: !1,
                        value: e
                    });
                    let a = !1,
                        n = !1;
                    r.current({
                        ...t,
                        nativeEvent: t,
                        currentTarget: e,
                        target: e,
                        isDefaultPrevented: () => a,
                        isPropagationStopped: () => n,
                        persist: () => {},
                        preventDefault: () => {
                            a = !0, t.preventDefault()
                        },
                        stopPropagation: () => {
                            n = !0, t.stopPropagation()
                        }
                    })
                }
                a?.current && a.current(e)
            }
        }))
    }

    function v(e) {
        return o.use ? {
            fetchPriority: e
        } : {
            fetchpriority: e
        }
    }
    "u" < typeof window && (globalThis.__NEXT_IMAGE_IMPORTED = !0);
    let y = (0, o.forwardRef)((e, t) => {
        let {
            src: r,
            srcSet: a,
            sizes: n,
            height: s,
            width: l,
            decoding: u,
            className: c,
            style: d,
            fetchPriority: f,
            placeholder: p,
            loading: h,
            unoptimized: y,
            fill: b,
            onLoadRef: w,
            onLoadingCompleteRef: x,
            setBlurComplete: P,
            setShowAltText: S,
            sizesInput: E,
            onLoad: C,
            onError: _,
            ...R
        } = e, O = (0, o.useCallback)(e => {
            e && (_ && (e.src = e.src), e.complete && g(e, p, w, x, P, y, E))
        }, [r, p, w, x, P, _, y, E]), I = (0, m.useMergedRef)(t, O);
        return (0, i.jsx)("img", {
            ...R,
            ...v(f),
            loading: h,
            width: l,
            height: s,
            decoding: u,
            "data-nimg": b ? "fill" : "1",
            className: c,
            style: d,
            sizes: n,
            srcSet: a,
            src: r,
            ref: I,
            onLoad: e => {
                g(e.currentTarget, p, w, x, P, y, E)
            },
            onError: e => {
                S(!0), "empty" !== p && P(!0), _ && _(e)
            }
        })
    });

    function b(e) {
        let {
            isAppRouter: t,
            imgAttributes: r
        } = e, a = {
            as: "image",
            imageSrcSet: r.srcSet,
            imageSizes: r.sizes,
            crossOrigin: r.crossOrigin,
            referrerPolicy: r.referrerPolicy,
            ...v(r.fetchPriority)
        };
        return t && s.default.preload ? (s.default.preload(r.src, a), null) : (0, i.jsx)(l.default, {
            children: (0, i.jsx)("link", {
                rel: "preload",
                href: r.srcSet ? void 0 : r.src,
                ...a
            }, "__nimg-" + r.src + r.srcSet + r.sizes)
        })
    }
    let w = (0, o.forwardRef)((e, t) => {
        let r = (0, o.useContext)(f.RouterContext),
            a = (0, o.useContext)(d.ImageConfigContext),
            n = (0, o.useMemo)(() => {
                let e = h || a || c.imageConfigDefault,
                    t = [...e.deviceSizes, ...e.imageSizes].sort((e, t) => e - t),
                    r = e.deviceSizes.sort((e, t) => e - t),
                    n = e.qualities?.sort((e, t) => e - t);
                return {
                    ...e,
                    allSizes: t,
                    deviceSizes: r,
                    qualities: n,
                    localPatterns: "u" < typeof window ? a?.localPatterns : e.localPatterns
                }
            }, [a]),
            {
                onLoad: s,
                onLoadingComplete: l
            } = e,
            m = (0, o.useRef)(s);
        (0, o.useEffect)(() => {
            m.current = s
        }, [s]);
        let g = (0, o.useRef)(l);
        (0, o.useEffect)(() => {
            g.current = l
        }, [l]);
        let [v, w] = (0, o.useState)(!1), [x, P] = (0, o.useState)(!1), {
            props: S,
            meta: E
        } = (0, u.getImgProps)(e, {
            defaultLoader: p.default,
            imgConf: n,
            blurComplete: v,
            showAltText: x
        });
        return (0, i.jsxs)(i.Fragment, {
            children: [(0, i.jsx)(y, {
                ...S,
                unoptimized: E.unoptimized,
                placeholder: E.placeholder,
                fill: E.fill,
                onLoadRef: m,
                onLoadingCompleteRef: g,
                setBlurComplete: w,
                setShowAltText: P,
                sizesInput: e.sizes,
                ref: t
            }), E.preload ? (0, i.jsx)(b, {
                isAppRouter: !r,
                imgAttributes: S
            }) : null]
        })
    });
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 31315, e => {
    "use strict";
    var t = e.i(954124),
        r = e.i(258259),
        a = e.i(7284),
        n = e.i(420482),
        i = e.i(493739);
    let o = {
            Large: "size-1200",
            Medium: "size-1000",
            Small: "size-800",
            XSmall: "size-600"
        },
        s = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-700"
        },
        l = {
            Large: {
                circular: "radius-circle",
                square: "radius-medium"
            },
            Medium: {
                circular: "radius-circle",
                square: "radius-medium"
            },
            Small: {
                circular: "radius-circle",
                square: "radius-medium"
            },
            XSmall: {
                circular: "radius-circle",
                square: "radius-small"
            }
        },
        u = {
            Emphasis: "bg-action-emphasis",
            Standard: "bg-action-standard",
            Alert: "bg-action-alert",
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-0"
        },
        c = {
            Emphasis: "bg-action-standard",
            Standard: "bg-action-standard",
            Alert: "bg-action-standard",
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-0"
        },
        d = {
            Emphasis: "bg-action-emphasis",
            Standard: "bg-action-standard",
            Alert: "bg-action-standard",
            Utility: "bg-shift-300",
            OverMedia: "bg-over-media-0"
        },
        f = {
            Default: {
                Emphasis: "content-action-emphasis",
                Standard: "content-action-standard",
                Alert: "content-action-alert",
                Utility: "content-emphasis",
                OverMedia: "content-emphasis"
            },
            Inverse: {
                Emphasis: "content-inverse-action-emphasis",
                Standard: "content-inverse-action-standard",
                Alert: "content-inverse-action-alert",
                Utility: "content-inverse-emphasis",
                OverMedia: "content-inverse-emphasis"
            }
        },
        p = {
            Default: {
                Emphasis: "content-action-standard",
                Standard: "content-action-standard",
                Alert: "content-action-standard",
                Utility: "content-emphasis",
                OverMedia: "content-emphasis"
            },
            Inverse: {
                Emphasis: "content-inverse-action-standard",
                Standard: "content-inverse-action-standard",
                Alert: "content-inverse-action-standard",
                Utility: "content-inverse-emphasis",
                OverMedia: "content-inverse-emphasis"
            }
        },
        m = (0, n.forwardRef)((e, m) => {
            let h, {
                className: g,
                icon: v,
                ariaLabel: y,
                isDisabled: b = !1,
                isCircular: w = !1,
                isSelected: x = !1,
                size: P = "Large",
                variant: S = "Emphasis",
                iconColor: E = "Default",
                asChild: C,
                children: _,
                ...R
            } = e;
            h = b ? c[S] : x ? d[S] : u[S];
            let O = (0, a.default)("foundation-web-icon-button", b ? r.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", o[P], l[P][w ? "circular" : "square"], h, g),
                I = n.default.createElement(n.default.Fragment, null, n.default.createElement(t.StateLayer, null), n.default.createElement("span", {
                    className: (0, a.default)("icon", v, s[P], b ? p[E][S] : f[E][S])
                }));
            if (C) {
                let {
                    as: e,
                    ...t
                } = R, r = n.default.Children.only(_);
                return n.default.createElement(i.Slot, {
                    ref: m,
                    ...t,
                    className: O,
                    "aria-label": y,
                    "aria-disabled": b || void 0
                }, n.default.cloneElement(r, {}, I))
            }
            if ("a" === R.as) {
                let {
                    as: e,
                    href: t,
                    ...r
                } = R;
                return n.default.createElement("a", {
                    ref: m,
                    ...r,
                    "aria-label": y,
                    "aria-disabled": b,
                    href: b ? void 0 : t,
                    className: O
                }, I)
            }
            let {
                as: j,
                ...k
            } = R;
            return n.default.createElement("button", {
                ref: m,
                type: "button",
                ...k,
                "aria-label": y,
                disabled: b,
                className: O
            }, I)
        });
    e.s(["IconButton", 0, m])
}, 900915, e => {
    "use strict";
    var t = e.i(7284),
        r = e.i(420482),
        a = e.i(775453),
        n = e.i(922353),
        i = e.i(9413),
        o = e.i(783660),
        s = e.i(634918),
        l = e.i(721988),
        u = e.i(411207),
        c = e.i(555876),
        d = e.i(199794),
        f = e.i(389784),
        p = e.i(158051),
        m = e.i(178511),
        h = e.i(584537),
        g = e.i(73772),
        v = e.i(700312),
        y = e.i(19836),
        b = "Popover",
        [w, x] = (0, i.createContextScope)(b, [c.createPopperScope]),
        P = (0, c.createPopperScope)(),
        [S, E] = w(b),
        C = e => {
            let {
                __scopePopover: t,
                children: a,
                open: n,
                defaultOpen: i,
                onOpenChange: o,
                modal: s = !1
            } = e, l = P(t), d = r.useRef(null), [f, p] = r.useState(!1), [m = !1, g] = (0, h.useControllableState)({
                prop: n,
                defaultProp: i,
                onChange: o
            });
            return (0, y.jsx)(c.Root, {
                ...l,
                children: (0, y.jsx)(S, {
                    scope: t,
                    contentId: (0, u.useId)(),
                    triggerRef: d,
                    open: m,
                    onOpenChange: g,
                    onOpenToggle: r.useCallback(() => g(e => !e), [g]),
                    hasCustomAnchor: f,
                    onCustomAnchorAdd: r.useCallback(() => p(!0), []),
                    onCustomAnchorRemove: r.useCallback(() => p(!1), []),
                    modal: s,
                    children: a
                })
            })
        };
    C.displayName = b;
    var _ = "PopoverAnchor";
    r.forwardRef((e, t) => {
        let {
            __scopePopover: a,
            ...n
        } = e, i = E(_, a), o = P(a), {
            onCustomAnchorAdd: s,
            onCustomAnchorRemove: l
        } = i;
        return r.useEffect(() => (s(), () => l()), [s, l]), (0, y.jsx)(c.Anchor, {
            ...o,
            ...n,
            ref: t
        })
    }).displayName = _;
    var R = "PopoverTrigger",
        O = r.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                ...i
            } = e, o = E(R, r), s = P(r), l = (0, n.useComposedRefs)(t, o.triggerRef), u = (0, y.jsx)(p.Primitive.button, {
                type: "button",
                "aria-haspopup": "dialog",
                "aria-expanded": o.open,
                "aria-controls": o.contentId,
                "data-state": W(o.open),
                ...i,
                ref: l,
                onClick: (0, a.composeEventHandlers)(e.onClick, o.onOpenToggle)
            });
            return o.hasCustomAnchor ? u : (0, y.jsx)(c.Anchor, {
                asChild: !0,
                ...s,
                children: u
            })
        });
    O.displayName = R;
    var I = "PopoverPortal",
        [j, k] = w(I, {
            forceMount: void 0
        }),
        A = e => {
            let {
                __scopePopover: t,
                forceMount: r,
                children: a,
                container: n
            } = e, i = E(I, t);
            return (0, y.jsx)(j, {
                scope: t,
                forceMount: r,
                children: (0, y.jsx)(f.Presence, {
                    present: r || i.open,
                    children: (0, y.jsx)(d.Portal, {
                        asChild: !0,
                        container: n,
                        children: a
                    })
                })
            })
        };
    A.displayName = I;
    var T = "PopoverContent",
        M = r.forwardRef((e, t) => {
            let r = k(T, e.__scopePopover),
                {
                    forceMount: a = r.forceMount,
                    ...n
                } = e,
                i = E(T, e.__scopePopover);
            return (0, y.jsx)(f.Presence, {
                present: a || i.open,
                children: i.modal ? (0, y.jsx)(D, {
                    ...n,
                    ref: t
                }) : (0, y.jsx)($, {
                    ...n,
                    ref: t
                })
            })
        });
    M.displayName = T;
    var N = (0, m.createSlot)("PopoverContent.RemoveScroll"),
        D = r.forwardRef((e, t) => {
            let i = E(T, e.__scopePopover),
                o = r.useRef(null),
                s = (0, n.useComposedRefs)(t, o),
                l = r.useRef(!1);
            return r.useEffect(() => {
                let e = o.current;
                if (e) return (0, g.hideOthers)(e)
            }, []), (0, y.jsx)(v.RemoveScroll, {
                as: N,
                allowPinchZoom: !0,
                children: (0, y.jsx)(U, {
                    ...e,
                    ref: s,
                    trapFocus: i.open,
                    disableOutsidePointerEvents: !0,
                    onCloseAutoFocus: (0, a.composeEventHandlers)(e.onCloseAutoFocus, e => {
                        e.preventDefault(), l.current || i.triggerRef.current?.focus()
                    }),
                    onPointerDownOutside: (0, a.composeEventHandlers)(e.onPointerDownOutside, e => {
                        let t = e.detail.originalEvent,
                            r = 0 === t.button && !0 === t.ctrlKey;
                        l.current = 2 === t.button || r
                    }, {
                        checkForDefaultPrevented: !1
                    }),
                    onFocusOutside: (0, a.composeEventHandlers)(e.onFocusOutside, e => e.preventDefault(), {
                        checkForDefaultPrevented: !1
                    })
                })
            })
        }),
        $ = r.forwardRef((e, t) => {
            let a = E(T, e.__scopePopover),
                n = r.useRef(!1),
                i = r.useRef(!1);
            return (0, y.jsx)(U, {
                ...e,
                ref: t,
                trapFocus: !1,
                disableOutsidePointerEvents: !1,
                onCloseAutoFocus: t => {
                    e.onCloseAutoFocus?.(t), t.defaultPrevented || (n.current || a.triggerRef.current?.focus(), t.preventDefault()), n.current = !1, i.current = !1
                },
                onInteractOutside: t => {
                    e.onInteractOutside?.(t), t.defaultPrevented || (n.current = !0, "pointerdown" === t.detail.originalEvent.type && (i.current = !0));
                    let r = t.target;
                    a.triggerRef.current?.contains(r) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && i.current && t.preventDefault()
                }
            })
        }),
        U = r.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                trapFocus: a,
                onOpenAutoFocus: n,
                onCloseAutoFocus: i,
                disableOutsidePointerEvents: u,
                onEscapeKeyDown: d,
                onPointerDownOutside: f,
                onFocusOutside: p,
                onInteractOutside: m,
                ...h
            } = e, g = E(T, r), v = P(r);
            return (0, s.useFocusGuards)(), (0, y.jsx)(l.FocusScope, {
                asChild: !0,
                loop: !0,
                trapped: a,
                onMountAutoFocus: n,
                onUnmountAutoFocus: i,
                children: (0, y.jsx)(o.DismissableLayer, {
                    asChild: !0,
                    disableOutsidePointerEvents: u,
                    onInteractOutside: m,
                    onEscapeKeyDown: d,
                    onPointerDownOutside: f,
                    onFocusOutside: p,
                    onDismiss: () => g.onOpenChange(!1),
                    children: (0, y.jsx)(c.Content, {
                        "data-state": W(g.open),
                        role: "dialog",
                        id: g.contentId,
                        ...v,
                        ...h,
                        ref: t,
                        style: {
                            ...h.style,
                            "--radix-popover-content-transform-origin": "var(--radix-popper-transform-origin)",
                            "--radix-popover-content-available-width": "var(--radix-popper-available-width)",
                            "--radix-popover-content-available-height": "var(--radix-popper-available-height)",
                            "--radix-popover-trigger-width": "var(--radix-popper-anchor-width)",
                            "--radix-popover-trigger-height": "var(--radix-popper-anchor-height)"
                        }
                    })
                })
            })
        }),
        z = "PopoverClose",
        L = r.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                ...n
            } = e, i = E(z, r);
            return (0, y.jsx)(p.Primitive.button, {
                type: "button",
                ...n,
                ref: t,
                onClick: (0, a.composeEventHandlers)(e.onClick, () => i.onOpenChange(!1))
            })
        });

    function W(e) {
        return e ? "open" : "closed"
    }
    L.displayName = z, r.forwardRef((e, t) => {
        let {
            __scopePopover: r,
            ...a
        } = e, n = P(r);
        return (0, y.jsx)(c.Arrow, {
            ...n,
            ...a,
            ref: t
        })
    }).displayName = "PopoverArrow";
    let F = e => {
        let t = window.matchMedia?.("(pointer: coarse)")?.matches ?? !1,
            r = document.activeElement?.matches(":focus-visible");
        if (t && !r) return void e.preventDefault();
        let a = e.currentTarget?.querySelector('[role="menuitem"]:not([aria-disabled="true"])');
        a && (e.preventDefault(), a.focus())
    };
    e.s(["Popover", 0, function(e) {
        let {
            open: t,
            defaultOpen: a,
            onOpenChange: n,
            children: i
        } = e;
        return r.createElement(C, {
            open: t,
            defaultOpen: a,
            onOpenChange: n
        }, i)
    }, "PopoverClose", 0, function(e) {
        let {
            children: t,
            ...a
        } = e;
        return r.createElement(L, a, t)
    }, "PopoverContent", 0, function(e) {
        let {
            side: a = "bottom",
            align: n = "center",
            sideOffset: i = 4,
            className: o,
            children: s,
            ariaLabel: l,
            onOpenAutoFocus: u,
            ...c
        } = e;
        return r.createElement(A, null, r.createElement(M, {
            side: a,
            align: n,
            sideOffset: i,
            ...c,
            "aria-label": l ?? c["aria-label"],
            onOpenAutoFocus: u ?? F,
            className: (0, t.default)("foundation-web-portal-zindex", o)
        }, s))
    }, "PopoverTrigger", 0, function(e) {
        let {
            asChild: t,
            disabled: a,
            className: n,
            children: i
        } = e;
        return r.createElement(O, {
            asChild: t,
            disabled: a,
            className: n
        }, i)
    }], 900915)
}, 868970, e => {
    "use strict";
    var t = e.i(19836),
        r = e.i(420482),
        a = e.i(723941),
        n = e.i(126392),
        i = e.i(698947);
    let o = (e => {
        let t, {
                userId: r,
                defaultDark: a
            } = e,
            n = ["color-mode-light", "color-mode-dark", "color-mode-system"],
            i = "color-mode-light",
            {
                classList: o
            } = document.documentElement;
        if (n.some(e => o.contains(e))) return;
        try {
            let e = localStorage.getItem("theme");
            t = null == e ? null : JSON.parse(e)
        } catch {
            t = null
        }
        if (null != t && 0 !== t.version) return void o.add(i);
        let s = t?.data ?? [],
            l = s.find(e => {
                let [t] = e;
                return t.toString() === r.toString()
            }),
            u = l?.[2] ?? 0;
        if (a && (1 & u) == 0) {
            o.add("color-mode-dark");
            let e = s.filter(e => {
                    let [t] = e;
                    return t.toString() !== r.toString()
                }),
                t = e.slice(+(e.length >= 100));
            t.push([r, 1, 1 | u]);
            try {
                localStorage.setItem("theme", JSON.stringify({
                    version: 0,
                    data: t
                }))
            } catch {}
            return
        }
        let c = l?.[1],
            d = (null == c ? null : n[c]) ?? i;
        o.add(d)
    }).toString();
    e.s(["default", 0, function(e) {
        let {
            userId: s,
            defaultDark: l = !1,
            nonce: u
        } = e, c = (0, r.useRef)(!1);
        return (0, i.useServerInsertedHTML)(() => {
            if (!c.current) return c.current = !0, (0, t.jsx)("script", {
                blocking: "render",
                nonce: u,
                children: `(${o})(${a.serialize({userId:(0,n.userIdToNumber)(s),defaultDark:l}).value})`
            }, "color-mode")
        }), null
    }], 868970)
}, 28729, e => {
    "use strict";
    var t = e.i(420482);
    let r = 0;
    e.s(["default", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "«r",
            a = (0, t.useRef)();
        return a.current || (r += 1, a.current = `${e}${r}`), a.current
    }])
}, 690255, e => {
    "use strict";
    var t = e.i(19836),
        r = e.i(420482),
        a = e.i(587541),
        n = e.i(851460),
        i = e.i(813537);
    let o = (0, r.forwardRef)((e, r) => {
        let o, {
            href: s,
            prefetch: l = "none",
            ...u
        } = e;
        return "string" == typeof s ? o = s : s instanceof a.Url ? {
            href: o
        } = s : o = {
            pathname: s.path,
            query: null == s.searchParams ? void 0 : n.UrlSearchParams.new(s.searchParams).toString(),
            hash: s.fragment
        }, (0, t.jsx)(i.Nav.Link, {
            ref: r,
            href: o,
            prefetch: "full" === l || "none" !== l && "auto",
            ...u
        })
    });
    e.s(["Link", 0, o], 690255)
}, 686790, e => {
    "use strict";
    var t = e.i(545819),
        r = e.i(126392);
    let a = e.i(815079).wwwRoblox.host.split(".").splice(1).join(".");
    e.s(["isAnalyticsCookieAccepted", 0, () => !!t.get("RBXcb")?.value.split("&").find(e => "true" === e.split("=")[1]), "setTrackingRestriction", 0, e => {
        null != e && (0, r.getCurrentUser)()?.id != null && t.set("RBXcp", e ? "restricted" : "standard", {
            domain: a,
            maxAge: 15552e3,
            sameSite: "lax"
        })
    }, "setUserConsent", 0, (e, r) => {
        let n = [];
        for (let i of r) e.includes(i) ? n.push(`${i}=true`) : (n.push(`${i}=false`), t.delete(i, {
            domain: a
        }));
        t.set("RBXcb", n.join("&"), {
            domain: a,
            maxAge: 15552e3
        })
    }])
}]);

//# debugId=7ad3a4a8-4c0e-444e-accc-7721f3a799de
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/01wau~~s09g5i.js.map