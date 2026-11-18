;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "2c56ea6d-9302-1dd6-1e30-892630371162")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 932598, e => {
    "use strict";
    let t = "function" == typeof crypto.randomUUID;
    e.s(["generateRandomUuid", 0, () => {
        let e, a;
        return t ? crypto.randomUUID() : (e = new Uint8Array(16), crypto.getRandomValues(e), a = Array.from(e, (e, t) => (6 === t ? 15 & e | 64 : 8 === t ? 63 & e | 128 : e).toString(16).padStart(2, "0")), `${a.slice(0,4).join("")}-${a.slice(4,6).join("")}-${a.slice(6,8).join("")}-${a.slice(8,10).join("")}-${a.slice(10,16).join("")}`)
    }])
}, 384778, e => {
    "use strict";
    var t = e.i(766271);

    function a(e, t) {
        let {
            pages: a,
            pageParams: i
        } = t, n = a.length - 1;
        return a.length > 0 ? e.getNextPageParam(a[n], a, i[n], i) : void 0
    }

    function i(e, t) {
        let {
            pages: a,
            pageParams: i
        } = t;
        return a.length > 0 ? e.getPreviousPageParam?.(a[0], a, i[0], i) : void 0
    }
    e.s(["hasNextPage", 0, function(e, t) {
        return !!t && null != a(e, t)
    }, "hasPreviousPage", 0, function(e, t) {
        return !!t && !!e.getPreviousPageParam && null != i(e, t)
    }, "infiniteQueryBehavior", 0, function(e) {
        return {
            onFetch: (n, r) => {
                let s = n.options,
                    l = n.fetchOptions?.meta?.fetchMore?.direction,
                    o = n.state.data?.pages || [],
                    u = n.state.data?.pageParams || [],
                    d = {
                        pages: [],
                        pageParams: []
                    },
                    c = 0,
                    h = async () => {
                        let r = !1,
                            h = (0, t.ensureQueryFn)(n.options, n.fetchOptions),
                            p = async (e, a, i) => {
                                let s;
                                if (r) return Promise.reject();
                                if (null == a && e.pages.length) return Promise.resolve(e);
                                let l = (s = {
                                        client: n.client,
                                        queryKey: n.queryKey,
                                        pageParam: a,
                                        direction: i ? "backward" : "forward",
                                        meta: n.options.meta
                                    }, (0, t.addConsumeAwareSignal)(s, () => n.signal, () => r = !0), s),
                                    o = await h(l),
                                    {
                                        maxPages: u
                                    } = n.options,
                                    d = i ? t.addToStart : t.addToEnd;
                                return {
                                    pages: d(e.pages, o, u),
                                    pageParams: d(e.pageParams, a, u)
                                }
                            };
                        if (l && o.length) {
                            let e = "backward" === l,
                                t = {
                                    pages: o,
                                    pageParams: u
                                },
                                n = (e ? i : a)(s, t);
                            d = await p(t, n, e)
                        } else {
                            let t = e ?? o.length;
                            do {
                                let e = 0 === c ? u[0] ?? s.initialPageParam : a(s, d);
                                if (c > 0 && null == e) break;
                                d = await p(d, e), c++
                            } while (c < t)
                        }
                        return d
                    };
                n.options.persister ? n.fetchFn = () => n.options.persister?.(h, {
                    client: n.client,
                    queryKey: n.queryKey,
                    meta: n.options.meta,
                    signal: n.signal
                }, r) : n.fetchFn = h
            }
        }
    }])
}, 910030, e => {
    "use strict";
    var t, a, i, n, r, s, l, o, u, d, c, h, p = e.i(376054),
        f = e.i(136927),
        m = e.i(550475),
        g = e.i(303069);

    function y(e, t) {
        var a = (0, g._)(e, t, "update");
        if (a.set) {
            if (!a.get) throw TypeError("attempted to read set only private field");
            return "__destrWrapper" in a || (a.__destrWrapper = {
                set value(v) {
                    a.set.call(e, v)
                },
                get value() {
                    return a.get.call(e)
                }
            }), a.__destrWrapper
        }
        if (!a.writable) throw TypeError("attempted to set read only private field");
        return a
    }
    var _ = e.i(766271),
        b = e.i(877912),
        E = e.i(259864),
        w = e.i(578889),
        A = (t = new WeakMap, class extends w.Subscribable {
            build(e, t, a) {
                let i = t.queryKey,
                    n = t.queryHash ?? (0, _.hashQueryKeyByOptions)(i, t),
                    r = this.get(n);
                return r || (r = new b.Query({
                    client: e,
                    queryKey: i,
                    queryHash: n,
                    options: e.defaultQueryOptions(t),
                    state: a,
                    defaultOptions: e.getQueryDefaults(i)
                }), this.add(r)), r
            }
            add(e) {
                (0, p._)(this, t).has(e.queryHash) || ((0, p._)(this, t).set(e.queryHash, e), this.notify({
                    type: "added",
                    query: e
                }))
            }
            remove(e) {
                let a = (0, p._)(this, t).get(e.queryHash);
                a && (e.destroy(), a === e && (0, p._)(this, t).delete(e.queryHash), this.notify({
                    type: "removed",
                    query: e
                }))
            }
            clear() {
                E.notifyManager.batch(() => {
                    this.getAll().forEach(e => {
                        this.remove(e)
                    })
                })
            }
            get(e) {
                return (0, p._)(this, t).get(e)
            }
            getAll() {
                return [...(0, p._)(this, t).values()]
            }
            find(e) {
                let t = {
                    exact: !0,
                    ...e
                };
                return this.getAll().find(e => (0, _.matchQuery)(t, e))
            }
            findAll() {
                let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                    t = this.getAll();
                return Object.keys(e).length > 0 ? t.filter(t => (0, _.matchQuery)(e, t)) : t
            }
            notify(e) {
                E.notifyManager.batch(() => {
                    this.listeners.forEach(t => {
                        t(e)
                    })
                })
            }
            onFocus() {
                E.notifyManager.batch(() => {
                    this.getAll().forEach(e => {
                        e.onFocus()
                    })
                })
            }
            onOnline() {
                E.notifyManager.batch(() => {
                    this.getAll().forEach(e => {
                        e.onOnline()
                    })
                })
            }
            constructor(e = {}) {
                super(), (0, f._)(this, t, {
                    writable: !0,
                    value: void 0
                }), this.config = e, (0, m._)(this, t, new Map)
            }
        }),
        S = e.i(51449),
        O = w,
        P = (a = new WeakMap, i = new WeakMap, n = new WeakMap, class extends O.Subscribable {
            build(e, t, a) {
                let i = new S.Mutation({
                    client: e,
                    mutationCache: this,
                    mutationId: ++y(this, n).value,
                    options: e.defaultMutationOptions(t),
                    state: a
                });
                return this.add(i), i
            }
            add(e) {
                (0, p._)(this, a).add(e);
                let t = M(e);
                if ("string" == typeof t) {
                    let a = (0, p._)(this, i).get(t);
                    a ? a.push(e) : (0, p._)(this, i).set(t, [e])
                }
                this.notify({
                    type: "added",
                    mutation: e
                })
            }
            remove(e) {
                if ((0, p._)(this, a).delete(e)) {
                    let t = M(e);
                    if ("string" == typeof t) {
                        let a = (0, p._)(this, i).get(t);
                        if (a)
                            if (a.length > 1) {
                                let t = a.indexOf(e); - 1 !== t && a.splice(t, 1)
                            } else a[0] === e && (0, p._)(this, i).delete(t)
                    }
                }
                this.notify({
                    type: "removed",
                    mutation: e
                })
            }
            canRun(e) {
                let t = M(e);
                if ("string" != typeof t) return !0;
                {
                    let a = (0, p._)(this, i).get(t),
                        n = a?.find(e => "pending" === e.state.status);
                    return !n || n === e
                }
            }
            runNext(e) {
                let t = M(e);
                if ("string" != typeof t) return Promise.resolve();
                {
                    let a = (0, p._)(this, i).get(t)?.find(t => t !== e && t.state.isPaused);
                    return a?.continue() ?? Promise.resolve()
                }
            }
            clear() {
                E.notifyManager.batch(() => {
                    (0, p._)(this, a).forEach(e => {
                        this.notify({
                            type: "removed",
                            mutation: e
                        })
                    }), (0, p._)(this, a).clear(), (0, p._)(this, i).clear()
                })
            }
            getAll() {
                return Array.from((0, p._)(this, a))
            }
            find(e) {
                let t = {
                    exact: !0,
                    ...e
                };
                return this.getAll().find(e => (0, _.matchMutation)(t, e))
            }
            findAll() {
                let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                return this.getAll().filter(t => (0, _.matchMutation)(e, t))
            }
            notify(e) {
                E.notifyManager.batch(() => {
                    this.listeners.forEach(t => {
                        t(e)
                    })
                })
            }
            resumePausedMutations() {
                let e = this.getAll().filter(e => e.state.isPaused);
                return E.notifyManager.batch(() => Promise.all(e.map(e => e.continue().catch(_.noop))))
            }
            constructor(e = {}) {
                super(), (0, f._)(this, a, {
                    writable: !0,
                    value: void 0
                }), (0, f._)(this, i, {
                    writable: !0,
                    value: void 0
                }), (0, f._)(this, n, {
                    writable: !0,
                    value: void 0
                }), this.config = e, (0, m._)(this, a, new Set), (0, m._)(this, i, new Map), (0, m._)(this, n, 0)
            }
        });

    function M(e) {
        return e.options.scope?.id
    }
    var I = e.i(82679),
        R = e.i(60045),
        N = e.i(384778),
        C = (r = new WeakMap, s = new WeakMap, l = new WeakMap, o = new WeakMap, u = new WeakMap, d = new WeakMap, c = new WeakMap, h = new WeakMap, class {
            mount() {
                y(this, d).value++, 1 === (0, p._)(this, d) && ((0, m._)(this, c, I.focusManager.subscribe(async e => {
                    e && (await this.resumePausedMutations(), (0, p._)(this, r).onFocus())
                })), (0, m._)(this, h, R.onlineManager.subscribe(async e => {
                    e && (await this.resumePausedMutations(), (0, p._)(this, r).onOnline())
                })))
            }
            unmount() {
                var e, t;
                y(this, d).value--, 0 === (0, p._)(this, d) && (null == (e = (0, p._)(this, c)) || e.call(this), (0, m._)(this, c, void 0), null == (t = (0, p._)(this, h)) || t.call(this), (0, m._)(this, h, void 0))
            }
            isFetching(e) {
                return (0, p._)(this, r).findAll({
                    ...e,
                    fetchStatus: "fetching"
                }).length
            }
            isMutating(e) {
                return (0, p._)(this, s).findAll({
                    ...e,
                    status: "pending"
                }).length
            }
            getQueryData(e) {
                let t = this.defaultQueryOptions({
                    queryKey: e
                });
                return (0, p._)(this, r).get(t.queryHash)?.state.data
            }
            ensureQueryData(e) {
                let t = this.defaultQueryOptions(e),
                    a = (0, p._)(this, r).build(this, t),
                    i = a.state.data;
                return void 0 === i ? this.fetchQuery(e) : (e.revalidateIfStale && a.isStaleByTime((0, _.resolveStaleTime)(t.staleTime, a)) && this.prefetchQuery(t), Promise.resolve(i))
            }
            getQueriesData(e) {
                return (0, p._)(this, r).findAll(e).map(e => {
                    let {
                        queryKey: t,
                        state: a
                    } = e;
                    return [t, a.data]
                })
            }
            setQueryData(e, t, a) {
                let i = this.defaultQueryOptions({
                        queryKey: e
                    }),
                    n = (0, p._)(this, r).get(i.queryHash),
                    s = n?.state.data,
                    l = (0, _.functionalUpdate)(t, s);
                if (void 0 !== l) return (0, p._)(this, r).build(this, i).setData(l, {
                    ...a,
                    manual: !0
                })
            }
            setQueriesData(e, t, a) {
                return E.notifyManager.batch(() => (0, p._)(this, r).findAll(e).map(e => {
                    let {
                        queryKey: i
                    } = e;
                    return [i, this.setQueryData(i, t, a)]
                }))
            }
            getQueryState(e) {
                let t = this.defaultQueryOptions({
                    queryKey: e
                });
                return (0, p._)(this, r).get(t.queryHash)?.state
            }
            removeQueries(e) {
                let t = (0, p._)(this, r);
                E.notifyManager.batch(() => {
                    t.findAll(e).forEach(e => {
                        t.remove(e)
                    })
                })
            }
            resetQueries(e, t) {
                let a = (0, p._)(this, r);
                return E.notifyManager.batch(() => (a.findAll(e).forEach(e => {
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
                return Promise.all(E.notifyManager.batch(() => (0, p._)(this, r).findAll(e).map(e => e.cancel(a)))).then(_.noop).catch(_.noop)
            }
            invalidateQueries(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                return E.notifyManager.batch(() => ((0, p._)(this, r).findAll(e).forEach(e => {
                    e.invalidate()
                }), e?.refetchType === "none") ? Promise.resolve() : this.refetchQueries({
                    ...e,
                    type: e?.refetchType ?? e?.type ?? "active"
                }, t))
            }
            refetchQueries(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    a = {
                        ...t,
                        cancelRefetch: t.cancelRefetch ?? !0
                    };
                return Promise.all(E.notifyManager.batch(() => (0, p._)(this, r).findAll(e).filter(e => !e.isDisabled() && !e.isStatic()).map(e => {
                    let t = e.fetch(void 0, a);
                    return a.throwOnError || (t = t.catch(_.noop)), "paused" === e.state.fetchStatus ? Promise.resolve() : t
                }))).then(_.noop)
            }
            fetchQuery(e) {
                let t = this.defaultQueryOptions(e);
                void 0 === t.retry && (t.retry = !1);
                let a = (0, p._)(this, r).build(this, t);
                return a.isStaleByTime((0, _.resolveStaleTime)(t.staleTime, a)) ? a.fetch(t) : Promise.resolve(a.state.data)
            }
            prefetchQuery(e) {
                return this.fetchQuery(e).then(_.noop).catch(_.noop)
            }
            fetchInfiniteQuery(e) {
                return e.behavior = (0, N.infiniteQueryBehavior)(e.pages), this.fetchQuery(e)
            }
            prefetchInfiniteQuery(e) {
                return this.fetchInfiniteQuery(e).then(_.noop).catch(_.noop)
            }
            ensureInfiniteQueryData(e) {
                return e.behavior = (0, N.infiniteQueryBehavior)(e.pages), this.ensureQueryData(e)
            }
            resumePausedMutations() {
                return R.onlineManager.isOnline() ? (0, p._)(this, s).resumePausedMutations() : Promise.resolve()
            }
            getQueryCache() {
                return (0, p._)(this, r)
            }
            getMutationCache() {
                return (0, p._)(this, s)
            }
            getDefaultOptions() {
                return (0, p._)(this, l)
            }
            setDefaultOptions(e) {
                (0, m._)(this, l, e)
            }
            setQueryDefaults(e, t) {
                (0, p._)(this, o).set((0, _.hashKey)(e), {
                    queryKey: e,
                    defaultOptions: t
                })
            }
            getQueryDefaults(e) {
                let t = [...(0, p._)(this, o).values()],
                    a = {};
                return t.forEach(t => {
                    (0, _.partialMatchKey)(e, t.queryKey) && Object.assign(a, t.defaultOptions)
                }), a
            }
            setMutationDefaults(e, t) {
                (0, p._)(this, u).set((0, _.hashKey)(e), {
                    mutationKey: e,
                    defaultOptions: t
                })
            }
            getMutationDefaults(e) {
                let t = [...(0, p._)(this, u).values()],
                    a = {};
                return t.forEach(t => {
                    (0, _.partialMatchKey)(e, t.mutationKey) && Object.assign(a, t.defaultOptions)
                }), a
            }
            defaultQueryOptions(e) {
                if (e._defaulted) return e;
                let t = {
                    ...(0, p._)(this, l).queries,
                    ...this.getQueryDefaults(e.queryKey),
                    ...e,
                    _defaulted: !0
                };
                return t.queryHash || (t.queryHash = (0, _.hashQueryKeyByOptions)(t.queryKey, t)), void 0 === t.refetchOnReconnect && (t.refetchOnReconnect = "always" !== t.networkMode), void 0 === t.throwOnError && (t.throwOnError = !!t.suspense), !t.networkMode && t.persister && (t.networkMode = "offlineFirst"), t.queryFn === _.skipToken && (t.enabled = !1), t
            }
            defaultMutationOptions(e) {
                return e?._defaulted ? e : {
                    ...(0, p._)(this, l).mutations,
                    ...e?.mutationKey && this.getMutationDefaults(e.mutationKey),
                    ...e,
                    _defaulted: !0
                }
            }
            clear() {
                (0, p._)(this, r).clear(), (0, p._)(this, s).clear()
            }
            constructor(e = {}) {
                (0, f._)(this, r, {
                    writable: !0,
                    value: void 0
                }), (0, f._)(this, s, {
                    writable: !0,
                    value: void 0
                }), (0, f._)(this, l, {
                    writable: !0,
                    value: void 0
                }), (0, f._)(this, o, {
                    writable: !0,
                    value: void 0
                }), (0, f._)(this, u, {
                    writable: !0,
                    value: void 0
                }), (0, f._)(this, d, {
                    writable: !0,
                    value: void 0
                }), (0, f._)(this, c, {
                    writable: !0,
                    value: void 0
                }), (0, f._)(this, h, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, r, e.queryCache || new A), (0, m._)(this, s, e.mutationCache || new P), (0, m._)(this, l, e.defaultOptions || {}), (0, m._)(this, o, new Map), (0, m._)(this, u, new Map), (0, m._)(this, d, 0)
            }
        });
    e.s(["QueryClient", 0, C], 910030)
}, 919403, 539181, e => {
    "use strict";
    let t, a, i;
    var n = e.i(371847);

    function r(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function s() {
        for (var e = arguments.length, t = Array(e), a = 0; a < e; a++) t[a] = arguments[a];
        return e => {
            let a = !1,
                i = t.map(t => {
                    let i = r(t, e);
                    return a || "function" != typeof i || (a = !0), i
                });
            if (a) return () => {
                for (let e = 0; e < i.length; e++) {
                    let a = i[e];
                    "function" == typeof a ? a() : r(t[e], null)
                }
            }
        }
    }
    e.s(["composeRefs", 0, s, "useComposedRefs", 0, function() {
        for (var e = arguments.length, t = Array(e), a = 0; a < e; a++) t[a] = arguments[a];
        return n.useCallback(s(...t), t)
    }], 539181);
    var l = e.i(809804),
        o = Symbol.for("react.lazy"),
        u = n[" use ".trim().toString()];

    function d(e) {
        var t;
        return null != e && "object" == typeof e && "$$typeof" in e && e.$$typeof === o && "_payload" in e && "object" == typeof(t = e._payload) && null !== t && "then" in t
    }
    var c = ((i = n.forwardRef((e, t) => {
            let {
                children: a,
                ...i
            } = e;
            if (d(a) && "function" == typeof u && (a = u(a._payload)), n.isValidElement(a)) {
                var r;
                let e, l, o = (r = a, (l = (e = Object.getOwnPropertyDescriptor(r.props, "ref")?.get) && "isReactWarning" in e && e.isReactWarning) ? r.ref : (l = (e = Object.getOwnPropertyDescriptor(r, "ref")?.get) && "isReactWarning" in e && e.isReactWarning) ? r.props.ref : r.props.ref || r.ref),
                    u = function(e, t) {
                        let a = {
                            ...t
                        };
                        for (let i in t) {
                            let n = e[i],
                                r = t[i];
                            /^on[A-Z]/.test(i) ? n && r ? a[i] = function() {
                                for (var e = arguments.length, t = Array(e), a = 0; a < e; a++) t[a] = arguments[a];
                                let i = r(...t);
                                return n(...t), i
                            } : n && (a[i] = n) : "style" === i ? a[i] = {
                                ...n,
                                ...r
                            } : "className" === i && (a[i] = [n, r].filter(Boolean).join(" "))
                        }
                        return {
                            ...e,
                            ...a
                        }
                    }(i, a.props);
                return a.type !== n.Fragment && (u.ref = t ? s(t, o) : o), n.cloneElement(a, u)
            }
            return n.Children.count(a) > 1 ? n.Children.only(null) : null
        })).displayName = "Slot.SlotClone", t = i, (a = n.forwardRef((e, a) => {
            let {
                children: i,
                ...r
            } = e;
            d(i) && "function" == typeof u && (i = u(i._payload));
            let s = n.Children.toArray(i),
                o = s.find(p);
            if (o) {
                let e = o.props.children,
                    i = s.map(t => t !== o ? t : n.Children.count(e) > 1 ? n.Children.only(null) : n.isValidElement(e) ? e.props.children : null);
                return (0, l.jsx)(t, {
                    ...r,
                    ref: a,
                    children: n.isValidElement(e) ? n.cloneElement(e, void 0, i) : null
                })
            }
            return (0, l.jsx)(t, {
                ...r,
                ref: a,
                children: i
            })
        })).displayName = "Slot.Slot", a),
        h = Symbol("radix.slottable");

    function p(e) {
        return n.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === h
    }
    e.s(["Slot", 0, c], 919403)
}, 885065, e => {
    "use strict";
    var t = e.i(7284),
        a = e.i(371847);
    e.s(["StateLayer", 0, e => {
        let {
            className: i
        } = e;
        return a.default.createElement("div", {
            "aria-hidden": !0,
            "data-testid": "foundation-web-state-layer",
            className: (0, t.default)("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", i)
        })
    }, "interactable", 0, "relative clip group/interactable focus-visible:outline-focus disabled:outline-none"])
}, 491965, e => {
    "use strict";
    var t = e.i(7284),
        a = e.i(371847);
    let i = {
            XSmall: "size-[var(--icon-size-xsmall)]",
            Small: "size-[var(--icon-size-small)]",
            Medium: "size-[var(--icon-size-medium)]",
            Large: "size-[var(--icon-size-large)]",
            XLarge: "size-[var(--icon-size-xlarge)]",
            XXLarge: "size-[var(--icon-size-xxlarge)]"
        },
        n = a.default.forwardRef((e, n) => {
            let {
                name: r,
                size: s = "Medium",
                className: l,
                children: o,
                ...u
            } = e;
            return a.default.createElement("span", {
                ref: n,
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.default)("grow-0 shrink-0 basis-auto icon", r, i[s], l),
                ...u
            })
        });
    n.displayName = "Icon", e.s(["Icon", 0, n])
}, 982249, 826550, e => {
    "use strict";
    var t = e.i(885065);
    let a = "opacity-[0.5]";
    e.s(["disabledOpacity", 0, a], 826550);
    var i = e.i(371847);
    let n = e => {
        let {
            width: t,
            height: a
        } = e;
        return i.default.createElement("svg", {
            className: "foundation-web-loading-spinner",
            width: t,
            height: a,
            viewBox: "0 0 20 20",
            fill: "none",
            xmlns: "http://www.w3.org/2000/svg"
        }, i.default.createElement("path", {
            fillRule: "evenodd",
            clipRule: "evenodd",
            fill: "currentColor",
            d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
        }))
    };
    var r = e.i(491965),
        s = e.i(7284),
        l = e.i(919403);
    let o = {
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
        d = {
            Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-alert", "content-action-alert"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        c = {
            Emphasis: ["bg-action-standard", "content-action-standard"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-standard", "content-action-standard"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-standard", "content-action-standard"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        h = (0, i.forwardRef)((e, h) => {
            let {
                children: p,
                className: f,
                style: m,
                isDisabled: g = !1,
                isLoading: y = !1,
                icon: _,
                size: b = "Large",
                variant: E = "Emphasis",
                asChild: w,
                ...A
            } = e, S = (0, s.default)("foundation-web-button", g ? a : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", u[b], g ? c[E] : d[E], f), O = {
                textDecoration: "none",
                ...m
            }, P = e => i.default.createElement(i.default.Fragment, null, i.default.createElement(t.StateLayer, null), y && i.default.createElement("div", {
                "aria-hidden": "true",
                className: "absolute flex"
            }, i.default.createElement(n, {
                width: o[b],
                height: o[b]
            })), i.default.createElement("span", {
                className: (0, s.default)("flex items-center min-width-0", "Large" === b || "Medium" === b ? "gap-small" : "gap-xsmall", y && "invisible")
            }, _ && i.default.createElement(r.Icon, {
                name: _,
                size: b
            }), i.default.createElement("span", {
                className: "padding-y-xsmall text-truncate-end text-no-wrap"
            }, e)));
            if (w) {
                let {
                    as: e,
                    ...t
                } = A, a = i.default.Children.only(p);
                return i.default.createElement(l.Slot, {
                    ref: h,
                    ...t,
                    className: S,
                    style: O,
                    "aria-disabled": g || void 0
                }, i.default.cloneElement(a, {}, P(a.props.children)))
            }
            if ("a" === A.as) {
                let {
                    as: e,
                    href: t,
                    ...a
                } = A;
                return i.default.createElement("a", {
                    ref: h,
                    ...a,
                    "aria-disabled": g,
                    href: g ? void 0 : t,
                    className: S,
                    style: O
                }, P(p))
            }
            let {
                as: M,
                ...I
            } = A;
            return i.default.createElement("button", {
                ref: h,
                type: "button",
                ...I,
                disabled: g,
                className: S,
                style: O
            }, P(p))
        });
    e.s(["Button", 0, h, "buttonVariants", 0, ["Emphasis", "Standard", "SoftEmphasis", "Utility", "Link", "Alert", "ActionUtility"]], 982249)
}, 743682, 56144, e => {
    "use strict";
    var t = e.i(371847);
    e.i(652447);
    var a = e.i(539181),
        i = e.i(809804);

    function n(e) {
        var n;
        let r, l = (n = e, (r = t.forwardRef((e, i) => {
                let {
                    children: n,
                    ...r
                } = e;
                if (t.isValidElement(n)) {
                    var s;
                    let e, l, o = (s = n, (l = (e = Object.getOwnPropertyDescriptor(s.props, "ref")?.get) && "isReactWarning" in e && e.isReactWarning) ? s.ref : (l = (e = Object.getOwnPropertyDescriptor(s, "ref")?.get) && "isReactWarning" in e && e.isReactWarning) ? s.props.ref : s.props.ref || s.ref),
                        u = function(e, t) {
                            let a = {
                                ...t
                            };
                            for (let i in t) {
                                let n = e[i],
                                    r = t[i];
                                /^on[A-Z]/.test(i) ? n && r ? a[i] = function() {
                                    for (var e = arguments.length, t = Array(e), a = 0; a < e; a++) t[a] = arguments[a];
                                    let i = r(...t);
                                    return n(...t), i
                                } : n && (a[i] = n) : "style" === i ? a[i] = {
                                    ...n,
                                    ...r
                                } : "className" === i && (a[i] = [n, r].filter(Boolean).join(" "))
                            }
                            return {
                                ...e,
                                ...a
                            }
                        }(r, n.props);
                    return n.type !== t.Fragment && (u.ref = i ? (0, a.composeRefs)(i, o) : o), t.cloneElement(n, u)
                }
                return t.Children.count(n) > 1 ? t.Children.only(null) : null
            })).displayName = `${n}.SlotClone`, r),
            o = t.forwardRef((e, a) => {
                let {
                    children: n,
                    ...r
                } = e, o = t.Children.toArray(n), u = o.find(s);
                if (u) {
                    let e = u.props.children,
                        n = o.map(a => a !== u ? a : t.Children.count(e) > 1 ? t.Children.only(null) : t.isValidElement(e) ? e.props.children : null);
                    return (0, i.jsx)(l, {
                        ...r,
                        ref: a,
                        children: t.isValidElement(e) ? t.cloneElement(e, void 0, n) : null
                    })
                }
                return (0, i.jsx)(l, {
                    ...r,
                    ref: a,
                    children: n
                })
            });
        return o.displayName = `${e}.Slot`, o
    }
    var r = Symbol("radix.slottable");

    function s(e) {
        return t.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === r
    }
    e.s(["createSlot", 0, n], 56144);
    var l = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce((e, a) => {
        let r = n(`Primitive.${a}`),
            s = t.forwardRef((e, t) => {
                let {
                    asChild: n,
                    ...s
                } = e;
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, i.jsx)(n ? r : a, {
                    ...s,
                    ref: t
                })
            });
        return s.displayName = `Primitive.${a}`, {
            ...e,
            [a]: s
        }
    }, {});
    e.s(["Primitive", 0, l], 743682)
}, 806887, e => {
    "use strict";
    var t = e.i(371847),
        a = e.i(743682),
        i = e.i(809804),
        n = Object.freeze({
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
        r = t.forwardRef((e, t) => (0, i.jsx)(a.Primitive.span, {
            ...e,
            ref: t,
            style: {
                ...n,
                ...e.style
            }
        }));
    r.displayName = "VisuallyHidden", e.s(["VisuallyHidden", 0, r])
}, 145420, e => {
    "use strict";
    var t = e.i(245837),
        a = e.i(646424),
        i = e.i(587541);
    let n = () => i.Url.parse(t.default.metricsApi).getOrThrow().withPath("/v1/games/report-event"),
        r = () => i.Url.parse(`https://assetgame.${t.default.domain}`).getOrThrow().withPath("/game/report-stats"),
        s = (e, t, i) => {
            try {
                a.postUntyped(e().withSearchParams({
                    name: t,
                    ...i
                }), "", {
                    credentials: "include",
                    keepalive: !0,
                    signal: AbortSignal.timeout(3e4)
                })
            } catch {}
        },
        l = new Map,
        o = (e, t) => {
            let a = Date.now();
            t.forEach(t => {
                let i = l.get(t);
                void 0 !== i && (l.delete(t), s(r, `${t}_${e}`, {
                    value: String(a - i)
                }))
            })
        };
    e.s(["endCancel", 0, function() {
        for (var e = arguments.length, t = Array(e), a = 0; a < e; a++) t[a] = arguments[a];
        o("Cancel", t)
    }, "endFailure", 0, function() {
        for (var e = arguments.length, t = Array(e), a = 0; a < e; a++) t[a] = arguments[a];
        o("Failure", t)
    }, "endSuccess", 0, function() {
        for (var e = arguments.length, t = Array(e), a = 0; a < e; a++) t[a] = arguments[a];
        o("Success", t)
    }, "fireEvent", 0, function() {
        for (var e = arguments.length, t = Array(e), a = 0; a < e; a++) t[a] = arguments[a];
        t.forEach(e => {
            s(n, e)
        })
    }, "start", 0, function() {
        for (var e = arguments.length, t = Array(e), a = 0; a < e; a++) t[a] = arguments[a];
        let i = Date.now();
        t.forEach(e => l.set(e, i))
    }])
}, 778579, 57099, e => {
    "use strict";
    var t = e.i(357355),
        a = e.i(145420),
        i = e.i(880983),
        n = e.i(889375);
    let r = {
            pathname: "",
            context: "unknown"
        },
        s = (e, a, s, l, o, u) => {
            let d;
            if (null == t.window) return;
            let {
                pathname: c
            } = t.window.location;
            r.pathname !== c && (r = {
                pathname: c,
                context: "unknown"
            }), null != a && "" !== a && "unknown" !== a && (r.context = a), (0, n.sendEvent)(e, r.context, {
                lType: "protocol",
                pid: s ?? void 0,
                refuid: l ?? void 0,
                pg: (d = (0, i.stripLocalePrefix)(c).toLowerCase()).endsWith("profile") ? "profile" : d.startsWith("/develop") ? "develop" : d.startsWith("/discover") ? "games" : "gameDetail",
                joinAttemptId: o ?? void 0,
                ...null == u ? {} : {
                    actionType: u
                }
            })
        },
        l = {
            startClientAttempted: "clientStartAttempt",
            startClientSucceeded: "clientStartSuccessWeb",
            beginInstall: "installBegin",
            successfulInstall: "installSuccess",
            manualDownload: "manualDownload"
        },
        o = {
            startClientAttempted: ["GameLaunchAttempt_<os>", "GameLaunchAttempt_<os>_<launchmethod>"],
            startClientSucceeded: ["GameLaunchSuccessWeb_<os>", "GameLaunchSuccessWeb_<os>_<launchmethod>"]
        };
    e.s(["logGameLaunchEvent", 0, (e, t, i) => {
        let {
            launchMethod: n,
            params: r
        } = i, u = "Windows" === e ? "Win32" : e;
        (0, a.fireEvent)(...(o[t] ?? []).map(e => e.replace("<os>", u).replace("<launchmethod>", n))), s(l[t], null, "placeId" in r ? r.placeId : void 0)
    }, "sendGamePlayEvent", 0, s], 57099);
    let u = (e, t, a, i) => {
        let r = Object.fromEntries(Object.entries(a).filter(e => {
            let [t] = e;
            return "ctx" !== t
        }));
        (0, n.sendEvent)(e, t, r)
    };
    e.s(["eventTypes", 0, {
        formInteraction: "formInteraction",
        modalAction: "modalAction",
        pageLoad: "pageLoad",
        buttonClick: "buttonClick"
    }, "sendEvent", 0, (e, t) => {
        let {
            name: a,
            type: i,
            context: n,
            requiredParams: r
        } = e, s = {
            btn: a,
            ...t
        };
        Array.isArray(r) && r.forEach(e => {
            Object.hasOwn(s, e) || console.error(`A required event parameter '${e}' is not provided`)
        }), u(i, n, s)
    }, "sendEventWithTarget", 0, u, "sendGamePlayEvent", 0, (e, t, a, i, n) => {
        s("gamePlayIntent", e, t, a, i, n)
    }, "targetTypes", 0, {
        DEFAULT: 0,
        WWW: 1,
        STUDIO: 2,
        DIAGNOSTIC: 3
    }], 778579)
}, 309937, e => {
    "use strict";
    var t = e.i(126392);
    let a = () => {
        let e = (0, t.getCurrentUser)();
        return e?.id == null ? null : {
            ...e,
            id: e.id
        }
    };
    e.s(["authenticatedUser", 0, () => {
        let e, i = a();
        return null == i ? null : {
            isAuthenticated: !0,
            id: (0, t.userIdToNumber)(i.id),
            name: i.userName ?? null,
            displayName: i.displayName ?? null,
            created: (e = document.querySelector('meta[name="user-data"]')?.dataset ?? document.documentElement.dataset).created ?? e.userCreated ?? null,
            isUnder13: i.isUnder13,
            isPremiumUser: i.isPremiumUser,
            hasVerifiedBadge: i.isVerified
        }
    }, "isAuthenticated", 0, () => null != a(), "isBlackbirdUser", 0, () => a()?.membership === t.blackbirdMembership, "isUnder13", 0, () => a()?.isUnder13 ?? !1, "name", 0, () => a()?.userName ?? null, "userId", 0, () => {
        let e = a();
        return null == e ? null : (0, t.userIdToNumber)(e.id)
    }])
}, 371078, e => {
    "use strict";
    var t = e.i(519003);
    e.s(["getAbsoluteUrl", 0, e => {
        let a;
        if (0 === e.length || /^([a-z]+:\/\/|\/\/)/.test(e)) return e;
        let i = e;
        if (!e.startsWith("/")) {
            let t = window.location.pathname;
            i = t.slice(0, t.lastIndexOf("/") + 1) + e
        }
        let n = (a = (0, t.getPageBaseUrls)().rootDomain, {
            "/game/report-stats": `https://assetgame.${a}/game/report-stats`,
            "/game/report-event": `https://metrics.${a}/v1/games/report-event`,
            "/catalog/html": `https://search.${a}/catalog/html`,
            "/catalog/json": `https://search.${a}/catalog/json`,
            "/catalog/contents": `https://search.${a}/catalog/contents`,
            "/catalog/items": `https://search.${a}/catalog/items`,
            "/asset-hash-thumbnail/image": `https://assetgame.${a}/asset-hash-thumbnail/image`,
            "/asset-hash-thumbnail/json": `https://assetgame.${a}/asset-hash-thumbnail/json`,
            "/asset-thumbnail-3d/json": `https://assetgame.${a}/asset-thumbnail-3d/json`,
            "/asset-thumbnail/image": `https://assetgame.${a}/asset-thumbnail/image`,
            "/asset-thumbnail/json": `https://assetgame.${a}/asset-thumbnail/json`,
            "/asset-thumbnail/url": `https://assetgame.${a}/asset-thumbnail/url`,
            "/asset/request-thumbnail-fix": `https://assetgame.${a}/asset/request-thumbnail-fix`
        })[i.toLowerCase()];
        return void 0 === n && (n = `${window.location.protocol}//${window.location.hostname}${i}`), n
    }])
}, 423517, 257771, e => {
    "use strict";
    let t = "experimentation",
        a = "layer",
        i = "experiment",
        n = "isAudienceSpecified",
        r = "isAudienceMember",
        s = "userAgent",
        l = "platformType",
        o = "ptid",
        u = "segment",
        d = "experiment_variant",
        c = "hashUnit",
        h = "hashValue",
        p = "allocKey",
        f = "allocValue",
        m = "holdout";
    e.s(["DEFAULT_ROBLOX_PROJECT", 0, 1, "EXPERIMENTATION_TARGET_NAME", 0, t, "EXPOSED_EVENT_NAME", 0, "expExposed", "EXPOSURE_LOGGING_ASSIGNED_EXPERIMENT_VARIABLES_VARIANT_KEY", 0, d, "EXPOSURE_LOGGING_ASSIGNED_SEGMENT_KEY", 0, u, "EXPOSURE_LOGGING_EXPERIMENT_NAME_KEY", 0, i, "EXPOSURE_LOGGING_HOLDOUT_GROUP_EXPERIMENT_NAME_KEY", 0, m, "EXPOSURE_LOGGING_IS_AUDIENCE_MEMBER_KEY", 0, r, "EXPOSURE_LOGGING_IS_AUDIENCE_SPECIFIED_KEY", 0, n, "EXPOSURE_LOGGING_LAYER_NAME_KEY", 0, a, "EXPOSURE_LOGGING_PLATFORM_TYPE_ID_KEY", 0, o, "EXPOSURE_LOGGING_PLATFORM_TYPE_KEY", 0, l, "EXPOSURE_LOGGING_PRIMARY_UNIT_ALLOC_VALUE_KEY", 0, f, "EXPOSURE_LOGGING_PRIMARY_UNIT_ALLOC_VARIABLE_KEY", 0, p, "EXPOSURE_LOGGING_PRIMARY_UNIT_VALUE_KEY", 0, h, "EXPOSURE_LOGGING_PRIMARY_UNIT_VARIABLE_KEY", 0, c, "EXPOSURE_LOGGING_USER_AGENT_KEY", 0, s], 423517), e.s(["buildLayerExposureEvent", 0, (e, g, y, _) => {
        let b = e.layers[g],
            E = {
                uid: y.toString(),
                btid: _,
                project: e.projectId?.toString(),
                version: e.version?.toString(),
                ts: Date.now().toString(),
                lt: new Date().toISOString(),
                target: t
            },
            w = {
                [a]: g,
                [i]: b.experimentName,
                [n]: b.isAudienceSpecified?.toString(),
                [r]: b.isAudienceMember?.toString(),
                [s]: e.userAgent,
                [l]: e.platformType,
                [o]: e.platformTypeId?.toString(),
                [u]: b.segment?.toString(),
                [d]: b.experimentVariant,
                [c]: b.primaryUnit,
                [h]: b.primaryUnitValue?.toString(),
                [p]: b.primaryUnit,
                [f]: b.primaryUnitValue?.toString(),
                [m]: b.holdoutGroupExperimentName
            },
            A = {
                ...E,
                ...w
            };
        return Object.keys(A).forEach(e => {
            A[e] = A[e] ?? ""
        }), A
    }], 257771)
}]);

//# debugId=2c56ea6d-9302-1dd6-1e30-892630371162
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0b-z2sec4y4nc.js.map