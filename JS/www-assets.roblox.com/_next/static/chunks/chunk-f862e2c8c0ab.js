;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "60dd3723-df96-93dc-a62c-452613c52bf2")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 423517, 257771, e => {
    "use strict";
    let t = "experimentation",
        a = "layer",
        i = "experiment",
        s = "isAudienceSpecified",
        n = "isAudienceMember",
        r = "userAgent",
        l = "platformType",
        o = "ptid",
        u = "segment",
        c = "experiment_variant",
        h = "hashUnit",
        d = "hashValue",
        p = "allocKey",
        f = "allocValue",
        m = "holdout";
    e.s(["DEFAULT_ROBLOX_PROJECT", 0, 1, "EXPERIMENTATION_TARGET_NAME", 0, t, "EXPOSED_EVENT_NAME", 0, "expExposed", "EXPOSURE_LOGGING_ASSIGNED_EXPERIMENT_VARIABLES_VARIANT_KEY", 0, c, "EXPOSURE_LOGGING_ASSIGNED_SEGMENT_KEY", 0, u, "EXPOSURE_LOGGING_EXPERIMENT_NAME_KEY", 0, i, "EXPOSURE_LOGGING_HOLDOUT_GROUP_EXPERIMENT_NAME_KEY", 0, m, "EXPOSURE_LOGGING_IS_AUDIENCE_MEMBER_KEY", 0, n, "EXPOSURE_LOGGING_IS_AUDIENCE_SPECIFIED_KEY", 0, s, "EXPOSURE_LOGGING_LAYER_NAME_KEY", 0, a, "EXPOSURE_LOGGING_PLATFORM_TYPE_ID_KEY", 0, o, "EXPOSURE_LOGGING_PLATFORM_TYPE_KEY", 0, l, "EXPOSURE_LOGGING_PRIMARY_UNIT_ALLOC_VALUE_KEY", 0, f, "EXPOSURE_LOGGING_PRIMARY_UNIT_ALLOC_VARIABLE_KEY", 0, p, "EXPOSURE_LOGGING_PRIMARY_UNIT_VALUE_KEY", 0, d, "EXPOSURE_LOGGING_PRIMARY_UNIT_VARIABLE_KEY", 0, h, "EXPOSURE_LOGGING_USER_AGENT_KEY", 0, r], 423517), e.s(["buildLayerExposureEvent", 0, (e, g, y, _) => {
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
                [s]: b.isAudienceSpecified?.toString(),
                [n]: b.isAudienceMember?.toString(),
                [r]: e.userAgent,
                [l]: e.platformType,
                [o]: e.platformTypeId?.toString(),
                [u]: b.segment?.toString(),
                [c]: b.experimentVariant,
                [h]: b.primaryUnit,
                [d]: b.primaryUnitValue?.toString(),
                [p]: b.primaryUnit,
                [f]: b.primaryUnitValue?.toString(),
                [m]: b.holdoutGroupExperimentName
            },
            M = {
                ...E,
                ...w
            };
        return Object.keys(M).forEach(e => {
            M[e] = M[e] ?? ""
        }), M
    }], 257771)
}, 384778, e => {
    "use strict";
    var t = e.i(766271);

    function a(e, t) {
        let {
            pages: a,
            pageParams: i
        } = t, s = a.length - 1;
        return a.length > 0 ? e.getNextPageParam(a[s], a, i[s], i) : void 0
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
            onFetch: (s, n) => {
                let r = s.options,
                    l = s.fetchOptions?.meta?.fetchMore?.direction,
                    o = s.state.data?.pages || [],
                    u = s.state.data?.pageParams || [],
                    c = {
                        pages: [],
                        pageParams: []
                    },
                    h = 0,
                    d = async () => {
                        let n = !1,
                            d = (0, t.ensureQueryFn)(s.options, s.fetchOptions),
                            p = async (e, a, i) => {
                                let r;
                                if (n) return Promise.reject();
                                if (null == a && e.pages.length) return Promise.resolve(e);
                                let l = (r = {
                                        client: s.client,
                                        queryKey: s.queryKey,
                                        pageParam: a,
                                        direction: i ? "backward" : "forward",
                                        meta: s.options.meta
                                    }, (0, t.addConsumeAwareSignal)(r, () => s.signal, () => n = !0), r),
                                    o = await d(l),
                                    {
                                        maxPages: u
                                    } = s.options,
                                    c = i ? t.addToStart : t.addToEnd;
                                return {
                                    pages: c(e.pages, o, u),
                                    pageParams: c(e.pageParams, a, u)
                                }
                            };
                        if (l && o.length) {
                            let e = "backward" === l,
                                t = {
                                    pages: o,
                                    pageParams: u
                                },
                                s = (e ? i : a)(r, t);
                            c = await p(t, s, e)
                        } else {
                            let t = e ?? o.length;
                            do {
                                let e = 0 === h ? u[0] ?? r.initialPageParam : a(r, c);
                                if (h > 0 && null == e) break;
                                c = await p(c, e), h++
                            } while (h < t)
                        }
                        return c
                    };
                s.options.persister ? s.fetchFn = () => s.options.persister?.(d, {
                    client: s.client,
                    queryKey: s.queryKey,
                    meta: s.options.meta,
                    signal: s.signal
                }, n) : s.fetchFn = d
            }
        }
    }])
}, 376054, 303069, 463075, 136927, 550475, e => {
    "use strict";

    function t(e, t, a) {
        if (!t.has(e)) throw TypeError("attempted to " + a + " private field on non-instance");
        return t.get(e)
    }

    function a(e, t) {
        if (t.has(e)) throw TypeError("Cannot initialize the same private elements twice on an object")
    }
    e.s(["_", 0, t], 303069), e.s(["_", 0, function(e, a) {
        var i = t(e, a, "get");
        return i.get ? i.get.call(e) : i.value
    }], 376054), e.s(["_", 0, a], 463075), e.s(["_", 0, function(e, t, i) {
        a(e, t), t.set(e, i)
    }], 136927), e.s(["_", 0, function(e, a, i) {
        var s = t(e, a, "set");
        if (s.set) s.set.call(e, i);
        else {
            if (!s.writable) throw TypeError("attempted to set read only private field");
            s.value = i
        }
        return i
    }], 550475)
}, 341332, e => {
    "use strict";
    var t = e.i(357355),
        a = e.i(358239);
    e.s(["DeviceTypes", 0, {
        computer: "computer",
        tablet: "tablet",
        phone: "phone",
        console: "console"
    }, "getDeviceMeta", 0, () => (0, a.getDeviceClient)(), "isIos13Ipad", 0, () => t.navigator?.platform === "MacIntel" && t.navigator.maxTouchPoints > 1, "isMac", 0, () => "osx" === (0, a.getDeviceClient)().operatingSystem, "isWindows", 0, () => "windows" === (0, a.getDeviceClient)().operatingSystem])
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
}, 883355, e => {
    "use strict";
    var t = e.i(868275),
        a = e.i(360702),
        i = e.i(723941);
    let s = e => {
            try {
                localStorage.removeItem(e)
            } catch {}
        },
        n = e => {
            let t = null;
            try {
                t = localStorage.getItem(e)
            } catch {}
            return null == t ? null : (0, i.deserializeUntyped)(t).getOrNull()
        };
    class r extends Error {
        constructor(e) {
            super(e.code, {
                cause: e
            }), (0, t._)(this, "cause", void 0), this.cause = e
        }
    }
    let l = (e, t) => {
            let s = (0, i.serialize)(t);
            if (s.isErr()) return (0, a.err)(new r({
                code: "JsonSerialization",
                error: s.error
            }));
            try {
                return localStorage.setItem(e, s.value), (0, a.ok)(null)
            } catch (e) {
                return (0, a.err)(new r({
                    code: "Unknown",
                    error: e
                }))
            }
        },
        o = 0,
        u = e => {
            o = Number.MAX_SAFE_INTEGER;
            let t = n("expiryList");
            if (null != t && 0 !== t.version) return (0, a.err)(new r({
                code: "PageRefreshNeeded"
            }));
            let i = Date.now(),
                u = {};
            for (let [a, n] of Object.entries(t?.data ?? {}))
                if (a === e?.key) {
                    let {
                        maxAge: t
                    } = e.options;
                    if (null != t) {
                        let e = i + t;
                        o = Math.min(o, e), u[a] = e
                    }
                } else i >= n ? s(a) : (o = Math.min(o, n), u[a] = n);
            return l("expiryList", {
                version: 0,
                data: u
            })
        };
    e.s(["LocalStorageWriteError", 0, r, "getItem", 0, e => (Date.now() >= o && u(), n(e)), "hasItem", 0, e => {
        try {
            return null != localStorage.getItem(e)
        } catch {
            return !1
        }
    }, "removeItem", 0, s, "setItem", 0, function(e, t) {
        let a = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return u({
            key: e,
            options: a
        }).andThen(() => l(e, t))
    }])
}, 910030, e => {
    "use strict";
    var t, a, i, s, n, r, l, o, u, c, h, d, p = e.i(376054),
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
        M = (t = new WeakMap, class extends w.Subscribable {
            build(e, t, a) {
                let i = t.queryKey,
                    s = t.queryHash ?? (0, _.hashQueryKeyByOptions)(i, t),
                    n = this.get(s);
                return n || (n = new b.Query({
                    client: e,
                    queryKey: i,
                    queryHash: s,
                    options: e.defaultQueryOptions(t),
                    state: a,
                    defaultOptions: e.getQueryDefaults(i)
                }), this.add(n)), n
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
        P = (a = new WeakMap, i = new WeakMap, s = new WeakMap, class extends O.Subscribable {
            build(e, t, a) {
                let i = new S.Mutation({
                    client: e,
                    mutationCache: this,
                    mutationId: ++y(this, s).value,
                    options: e.defaultMutationOptions(t),
                    state: a
                });
                return this.add(i), i
            }
            add(e) {
                (0, p._)(this, a).add(e);
                let t = A(e);
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
                    let t = A(e);
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
                let t = A(e);
                if ("string" != typeof t) return !0;
                {
                    let a = (0, p._)(this, i).get(t),
                        s = a?.find(e => "pending" === e.state.status);
                    return !s || s === e
                }
            }
            runNext(e) {
                let t = A(e);
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
                }), (0, f._)(this, s, {
                    writable: !0,
                    value: void 0
                }), this.config = e, (0, m._)(this, a, new Set), (0, m._)(this, i, new Map), (0, m._)(this, s, 0)
            }
        });

    function A(e) {
        return e.options.scope?.id
    }
    var I = e.i(82679),
        R = e.i(60045),
        x = e.i(384778),
        N = (n = new WeakMap, r = new WeakMap, l = new WeakMap, o = new WeakMap, u = new WeakMap, c = new WeakMap, h = new WeakMap, d = new WeakMap, class {
            mount() {
                y(this, c).value++, 1 === (0, p._)(this, c) && ((0, m._)(this, h, I.focusManager.subscribe(async e => {
                    e && (await this.resumePausedMutations(), (0, p._)(this, n).onFocus())
                })), (0, m._)(this, d, R.onlineManager.subscribe(async e => {
                    e && (await this.resumePausedMutations(), (0, p._)(this, n).onOnline())
                })))
            }
            unmount() {
                var e, t;
                y(this, c).value--, 0 === (0, p._)(this, c) && (null == (e = (0, p._)(this, h)) || e.call(this), (0, m._)(this, h, void 0), null == (t = (0, p._)(this, d)) || t.call(this), (0, m._)(this, d, void 0))
            }
            isFetching(e) {
                return (0, p._)(this, n).findAll({
                    ...e,
                    fetchStatus: "fetching"
                }).length
            }
            isMutating(e) {
                return (0, p._)(this, r).findAll({
                    ...e,
                    status: "pending"
                }).length
            }
            getQueryData(e) {
                let t = this.defaultQueryOptions({
                    queryKey: e
                });
                return (0, p._)(this, n).get(t.queryHash)?.state.data
            }
            ensureQueryData(e) {
                let t = this.defaultQueryOptions(e),
                    a = (0, p._)(this, n).build(this, t),
                    i = a.state.data;
                return void 0 === i ? this.fetchQuery(e) : (e.revalidateIfStale && a.isStaleByTime((0, _.resolveStaleTime)(t.staleTime, a)) && this.prefetchQuery(t), Promise.resolve(i))
            }
            getQueriesData(e) {
                return (0, p._)(this, n).findAll(e).map(e => {
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
                    s = (0, p._)(this, n).get(i.queryHash),
                    r = s?.state.data,
                    l = (0, _.functionalUpdate)(t, r);
                if (void 0 !== l) return (0, p._)(this, n).build(this, i).setData(l, {
                    ...a,
                    manual: !0
                })
            }
            setQueriesData(e, t, a) {
                return E.notifyManager.batch(() => (0, p._)(this, n).findAll(e).map(e => {
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
                return (0, p._)(this, n).get(t.queryHash)?.state
            }
            removeQueries(e) {
                let t = (0, p._)(this, n);
                E.notifyManager.batch(() => {
                    t.findAll(e).forEach(e => {
                        t.remove(e)
                    })
                })
            }
            resetQueries(e, t) {
                let a = (0, p._)(this, n);
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
                return Promise.all(E.notifyManager.batch(() => (0, p._)(this, n).findAll(e).map(e => e.cancel(a)))).then(_.noop).catch(_.noop)
            }
            invalidateQueries(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                return E.notifyManager.batch(() => ((0, p._)(this, n).findAll(e).forEach(e => {
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
                return Promise.all(E.notifyManager.batch(() => (0, p._)(this, n).findAll(e).filter(e => !e.isDisabled() && !e.isStatic()).map(e => {
                    let t = e.fetch(void 0, a);
                    return a.throwOnError || (t = t.catch(_.noop)), "paused" === e.state.fetchStatus ? Promise.resolve() : t
                }))).then(_.noop)
            }
            fetchQuery(e) {
                let t = this.defaultQueryOptions(e);
                void 0 === t.retry && (t.retry = !1);
                let a = (0, p._)(this, n).build(this, t);
                return a.isStaleByTime((0, _.resolveStaleTime)(t.staleTime, a)) ? a.fetch(t) : Promise.resolve(a.state.data)
            }
            prefetchQuery(e) {
                return this.fetchQuery(e).then(_.noop).catch(_.noop)
            }
            fetchInfiniteQuery(e) {
                return e.behavior = (0, x.infiniteQueryBehavior)(e.pages), this.fetchQuery(e)
            }
            prefetchInfiniteQuery(e) {
                return this.fetchInfiniteQuery(e).then(_.noop).catch(_.noop)
            }
            ensureInfiniteQueryData(e) {
                return e.behavior = (0, x.infiniteQueryBehavior)(e.pages), this.ensureQueryData(e)
            }
            resumePausedMutations() {
                return R.onlineManager.isOnline() ? (0, p._)(this, r).resumePausedMutations() : Promise.resolve()
            }
            getQueryCache() {
                return (0, p._)(this, n)
            }
            getMutationCache() {
                return (0, p._)(this, r)
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
                (0, p._)(this, n).clear(), (0, p._)(this, r).clear()
            }
            constructor(e = {}) {
                (0, f._)(this, n, {
                    writable: !0,
                    value: void 0
                }), (0, f._)(this, r, {
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
                }), (0, f._)(this, c, {
                    writable: !0,
                    value: void 0
                }), (0, f._)(this, h, {
                    writable: !0,
                    value: void 0
                }), (0, f._)(this, d, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, n, e.queryCache || new M), (0, m._)(this, r, e.mutationCache || new P), (0, m._)(this, l, e.defaultOptions || {}), (0, m._)(this, o, new Map), (0, m._)(this, u, new Map), (0, m._)(this, c, 0)
            }
        });
    e.s(["QueryClient", 0, N], 910030)
}, 266712, 567950, e => {
    "use strict";
    let t = (e, t, a) => new Promise(i => {
        let s = new CustomEvent(e, {
            cancelable: !0,
            detail: t(i)
        });
        window.dispatchEvent(s) && i(a)
    });
    e.s(["requestFromContainer", 0, t], 567950), e.s(["startAccessManagementUpsell", 0, e => {
        let {
            featureName: a,
            redirectLink: i,
            ampFeatureCheckData: s = [],
            isAsyncCall: n = !0,
            usePrologue: r = !1,
            ampRecourseData: l = null,
            featureSpecificData: o,
            namespace: u,
            wizardIntent: c
        } = e;
        return t("StartAccessManagementUpsell", e => ({
            featureName: a,
            redirectLink: i ?? null,
            ampFeatureCheckData: s,
            isAsyncCall: n,
            usePrologue: r,
            ampRecourseData: l,
            featureSpecificData: o ?? null,
            namespace: u ?? null,
            wizardIntent: c ?? null,
            closeCallback: t => {
                e("Granted" === t)
            }
        }), !1)
    }], 266712)
}, 919403, 539181, e => {
    "use strict";
    let t, a, i;
    var s = e.i(420482);

    function n(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function r() {
        for (var e = arguments.length, t = Array(e), a = 0; a < e; a++) t[a] = arguments[a];
        return e => {
            let a = !1,
                i = t.map(t => {
                    let i = n(t, e);
                    return a || "function" != typeof i || (a = !0), i
                });
            if (a) return () => {
                for (let e = 0; e < i.length; e++) {
                    let a = i[e];
                    "function" == typeof a ? a() : n(t[e], null)
                }
            }
        }
    }
    e.s(["composeRefs", 0, r, "useComposedRefs", 0, function() {
        for (var e = arguments.length, t = Array(e), a = 0; a < e; a++) t[a] = arguments[a];
        return s.useCallback(r(...t), t)
    }], 539181);
    var l = e.i(19836),
        o = Symbol.for("react.lazy"),
        u = s[" use ".trim().toString()];

    function c(e) {
        var t;
        return null != e && "object" == typeof e && "$$typeof" in e && e.$$typeof === o && "_payload" in e && "object" == typeof(t = e._payload) && null !== t && "then" in t
    }
    var h = ((i = s.forwardRef((e, t) => {
            let {
                children: a,
                ...i
            } = e;
            if (c(a) && "function" == typeof u && (a = u(a._payload)), s.isValidElement(a)) {
                var n;
                let e, l, o = (n = a, (l = (e = Object.getOwnPropertyDescriptor(n.props, "ref")?.get) && "isReactWarning" in e && e.isReactWarning) ? n.ref : (l = (e = Object.getOwnPropertyDescriptor(n, "ref")?.get) && "isReactWarning" in e && e.isReactWarning) ? n.props.ref : n.props.ref || n.ref),
                    u = function(e, t) {
                        let a = {
                            ...t
                        };
                        for (let i in t) {
                            let s = e[i],
                                n = t[i];
                            /^on[A-Z]/.test(i) ? s && n ? a[i] = function() {
                                for (var e = arguments.length, t = Array(e), a = 0; a < e; a++) t[a] = arguments[a];
                                let i = n(...t);
                                return s(...t), i
                            } : s && (a[i] = s) : "style" === i ? a[i] = {
                                ...s,
                                ...n
                            } : "className" === i && (a[i] = [s, n].filter(Boolean).join(" "))
                        }
                        return {
                            ...e,
                            ...a
                        }
                    }(i, a.props);
                return a.type !== s.Fragment && (u.ref = t ? r(t, o) : o), s.cloneElement(a, u)
            }
            return s.Children.count(a) > 1 ? s.Children.only(null) : null
        })).displayName = "Slot.SlotClone", t = i, (a = s.forwardRef((e, a) => {
            let {
                children: i,
                ...n
            } = e;
            c(i) && "function" == typeof u && (i = u(i._payload));
            let r = s.Children.toArray(i),
                o = r.find(p);
            if (o) {
                let e = o.props.children,
                    i = r.map(t => t !== o ? t : s.Children.count(e) > 1 ? s.Children.only(null) : s.isValidElement(e) ? e.props.children : null);
                return (0, l.jsx)(t, {
                    ...n,
                    ref: a,
                    children: s.isValidElement(e) ? s.cloneElement(e, void 0, i) : null
                })
            }
            return (0, l.jsx)(t, {
                ...n,
                ref: a,
                children: i
            })
        })).displayName = "Slot.Slot", a),
        d = Symbol("radix.slottable");

    function p(e) {
        return s.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === d
    }
    e.s(["Slot", 0, h], 919403)
}, 941918, e => {
    "use strict";
    var t = e.i(7284),
        a = e.i(420482);
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
}, 778935, e => {
    "use strict";
    var t = e.i(7284),
        a = e.i(420482);
    let i = {
            XSmall: "size-[var(--icon-size-xsmall)]",
            Small: "size-[var(--icon-size-small)]",
            Medium: "size-[var(--icon-size-medium)]",
            Large: "size-[var(--icon-size-large)]",
            XLarge: "size-[var(--icon-size-xlarge)]",
            XXLarge: "size-[var(--icon-size-xxlarge)]"
        },
        s = a.default.forwardRef((e, s) => {
            let {
                name: n,
                size: r = "Medium",
                className: l,
                children: o,
                ...u
            } = e;
            return a.default.createElement("span", {
                ref: s,
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.default)("grow-0 shrink-0 basis-auto icon", n, i[r], l),
                ...u
            })
        });
    s.displayName = "Icon", e.s(["Icon", 0, s])
}, 55001, 986592, e => {
    "use strict";
    var t = e.i(941918);
    let a = "opacity-[0.5]";
    e.s(["disabledOpacity", 0, a], 986592);
    var i = e.i(420482);
    let s = e => {
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
    var n = e.i(778935),
        r = e.i(7284),
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
        c = {
            Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-alert", "content-action-alert"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        h = {
            Emphasis: ["bg-action-standard", "content-action-standard"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-standard", "content-action-standard"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-standard", "content-action-standard"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        d = (0, i.forwardRef)((e, d) => {
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
                ...M
            } = e, S = (0, r.default)("foundation-web-button", g ? a : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", u[b], g ? h[E] : c[E], f), O = {
                textDecoration: "none",
                ...m
            }, P = e => i.default.createElement(i.default.Fragment, null, i.default.createElement(t.StateLayer, null), y && i.default.createElement("div", {
                "aria-hidden": "true",
                className: "absolute flex"
            }, i.default.createElement(s, {
                width: o[b],
                height: o[b]
            })), i.default.createElement("span", {
                className: (0, r.default)("flex items-center min-width-0", "Large" === b || "Medium" === b ? "gap-small" : "gap-xsmall", y && "invisible")
            }, _ && i.default.createElement(n.Icon, {
                name: _,
                size: b
            }), i.default.createElement("span", {
                className: "padding-y-xsmall text-truncate-end text-no-wrap"
            }, e)));
            if (w) {
                let {
                    as: e,
                    ...t
                } = M, a = i.default.Children.only(p);
                return i.default.createElement(l.Slot, {
                    ref: d,
                    ...t,
                    className: S,
                    style: O,
                    "aria-disabled": g || void 0
                }, i.default.cloneElement(a, {}, P(a.props.children)))
            }
            if ("a" === M.as) {
                let {
                    as: e,
                    href: t,
                    ...a
                } = M;
                return i.default.createElement("a", {
                    ref: d,
                    ...a,
                    "aria-disabled": g,
                    href: g ? void 0 : t,
                    className: S,
                    style: O
                }, P(p))
            }
            let {
                as: A,
                ...I
            } = M;
            return i.default.createElement("button", {
                ref: d,
                type: "button",
                ...I,
                disabled: g,
                className: S,
                style: O
            }, P(p))
        });
    e.s(["Button", 0, d, "buttonVariants", 0, ["Emphasis", "Standard", "SoftEmphasis", "Utility", "Link", "Alert", "ActionUtility"]], 55001)
}, 371078, e => {
    "use strict";
    var t = e.i(815079);
    e.s(["getAbsoluteUrl", 0, e => {
        let a;
        if (0 === e.length || /^([a-z]+:\/\/|\/\/)/.test(e)) return e;
        let i = e;
        if (!e.startsWith("/")) {
            let t = window.location.pathname;
            i = t.slice(0, t.lastIndexOf("/") + 1) + e
        }
        let s = (a = t.rootDomain, {
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
        return void 0 === s && (s = `${window.location.protocol}//${window.location.hostname}${i}`), s
    }])
}, 51449, e => {
    "use strict";
    var t, a, i, s, n, r = e.i(376054),
        l = e.i(136927),
        o = e.i(550475),
        u = e.i(42297),
        c = e.i(474754),
        h = e.i(259864),
        d = e.i(539392),
        p = e.i(313805),
        f = (t = new WeakMap, a = new WeakMap, i = new WeakMap, s = new WeakMap, n = new WeakSet, class extends d.Removable {
            setOptions(e) {
                this.options = e, this.updateGcTime(this.options.gcTime)
            }
            get meta() {
                return this.options.meta
            }
            addObserver(e) {
                (0, r._)(this, a).includes(e) || ((0, r._)(this, a).push(e), this.clearGcTimeout(), (0, r._)(this, i).notify({
                    type: "observerAdded",
                    mutation: this,
                    observer: e
                }))
            }
            removeObserver(e) {
                (0, o._)(this, a, (0, r._)(this, a).filter(t => t !== e)), this.scheduleGc(), (0, r._)(this, i).notify({
                    type: "observerRemoved",
                    mutation: this,
                    observer: e
                })
            }
            optionalRemove() {
                (0, r._)(this, a).length || ("pending" === this.state.status ? this.scheduleGc() : (0, r._)(this, i).remove(this))
            }
            continue () {
                return (0, r._)(this, s)?.continue() ?? this.execute(this.state.variables)
            }
            async execute(e) {
                let a = () => {
                        (0, u._)(this, n, g).call(this, {
                            type: "continue"
                        })
                    },
                    l = {
                        client: (0, r._)(this, t),
                        meta: this.options.meta,
                        mutationKey: this.options.mutationKey
                    };
                (0, o._)(this, s, (0, p.createRetryer)({
                    fn: () => this.options.mutationFn ? this.options.mutationFn(e, l) : Promise.reject(Error("No mutationFn found")),
                    onFail: (e, t) => {
                        (0, u._)(this, n, g).call(this, {
                            type: "failed",
                            failureCount: e,
                            error: t
                        })
                    },
                    onPause: () => {
                        (0, u._)(this, n, g).call(this, {
                            type: "pause"
                        })
                    },
                    onContinue: a,
                    retry: this.options.retry ?? 0,
                    retryDelay: this.options.retryDelay,
                    networkMode: this.options.networkMode,
                    canRun: () => (0, r._)(this, i).canRun(this)
                }));
                let c = "pending" === this.state.status,
                    h = !(0, r._)(this, s).canStart();
                try {
                    if (c) a();
                    else {
                        (0, u._)(this, n, g).call(this, {
                            type: "pending",
                            variables: e,
                            isPaused: h
                        }), (0, r._)(this, i).config.onMutate && await (0, r._)(this, i).config.onMutate(e, this, l);
                        let t = await this.options.onMutate?.(e, l);
                        t !== this.state.context && (0, u._)(this, n, g).call(this, {
                            type: "pending",
                            context: t,
                            variables: e,
                            isPaused: h
                        })
                    }
                    let t = await (0, r._)(this, s).start();
                    return await (0, r._)(this, i).config.onSuccess?.(t, e, this.state.context, this, l), await this.options.onSuccess?.(t, e, this.state.context, l), await (0, r._)(this, i).config.onSettled?.(t, null, this.state.variables, this.state.context, this, l), await this.options.onSettled?.(t, null, e, this.state.context, l), (0, u._)(this, n, g).call(this, {
                        type: "success",
                        data: t
                    }), t
                } catch (t) {
                    try {
                        await (0, r._)(this, i).config.onError?.(t, e, this.state.context, this, l)
                    } catch (e) {
                        Promise.reject(e)
                    }
                    try {
                        await this.options.onError?.(t, e, this.state.context, l)
                    } catch (e) {
                        Promise.reject(e)
                    }
                    try {
                        await (0, r._)(this, i).config.onSettled?.(void 0, t, this.state.variables, this.state.context, this, l)
                    } catch (e) {
                        Promise.reject(e)
                    }
                    try {
                        await this.options.onSettled?.(void 0, t, e, this.state.context, l)
                    } catch (e) {
                        Promise.reject(e)
                    }
                    throw (0, u._)(this, n, g).call(this, {
                        type: "error",
                        error: t
                    }), t
                } finally {
                    (0, r._)(this, i).runNext(this)
                }
            }
            constructor(e) {
                super(), (0, c._)(this, n), (0, l._)(this, t, {
                    writable: !0,
                    value: void 0
                }), (0, l._)(this, a, {
                    writable: !0,
                    value: void 0
                }), (0, l._)(this, i, {
                    writable: !0,
                    value: void 0
                }), (0, l._)(this, s, {
                    writable: !0,
                    value: void 0
                }), (0, o._)(this, t, e.client), this.mutationId = e.mutationId, (0, o._)(this, i, e.mutationCache), (0, o._)(this, a, []), this.state = e.state || m(), this.setOptions(e.options), this.scheduleGc()
            }
        });

    function m() {
        return {
            context: void 0,
            data: void 0,
            error: null,
            failureCount: 0,
            failureReason: null,
            isPaused: !1,
            status: "idle",
            variables: void 0,
            submittedAt: 0
        }
    }

    function g(e) {
        this.state = (t => {
            switch (e.type) {
                case "failed":
                    return {
                        ...t, failureCount: e.failureCount, failureReason: e.error
                    };
                case "pause":
                    return {
                        ...t, isPaused: !0
                    };
                case "continue":
                    return {
                        ...t, isPaused: !1
                    };
                case "pending":
                    return {
                        ...t, context: e.context, data: void 0, failureCount: 0, failureReason: null, error: null, isPaused: e.isPaused, status: "pending", variables: e.variables, submittedAt: Date.now()
                    };
                case "success":
                    return {
                        ...t, data: e.data, failureCount: 0, failureReason: null, error: null, status: "success", isPaused: !1
                    };
                case "error":
                    return {
                        ...t, data: void 0, error: e.error, failureCount: t.failureCount + 1, failureReason: e.error, isPaused: !1, status: "error"
                    }
            }
        })(this.state), h.notifyManager.batch(() => {
            (0, r._)(this, a).forEach(t => {
                t.onMutationUpdate(e)
            }), (0, r._)(this, i).notify({
                mutation: this,
                type: "updated",
                action: e
            })
        })
    }
    e.s(["Mutation", 0, f, "getDefaultState", 0, m])
}, 932598, e => {
    "use strict";
    let t = "function" == typeof crypto.randomUUID;
    e.s(["generateRandomUuid", 0, () => {
        let e, a;
        return t ? crypto.randomUUID() : (e = new Uint8Array(16), crypto.getRandomValues(e), a = Array.from(e, (e, t) => (6 === t ? 15 & e | 64 : 8 === t ? 63 & e | 128 : e).toString(16).padStart(2, "0")), `${a.slice(0,4).join("")}-${a.slice(4,6).join("")}-${a.slice(6,8).join("")}-${a.slice(8,10).join("")}-${a.slice(10,16).join("")}`)
    }])
}, 175067, e => {
    "use strict";
    let t = null;
    e.s(["getGameLauncher", 0, () => t, "setGameLauncher", 0, e => {
        t = e
    }])
}]);

//# debugId=60dd3723-df96-93dc-a62c-452613c52bf2
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0fqr6dx-sk7ky.js.map