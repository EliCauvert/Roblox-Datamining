;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "b5f56140-d7d1-5437-1eae-c60ee384885d")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 711300, 747304, 209268, 634203, 35877, t => {
    "use strict";

    function e(t, e, i) {
        if (!e.has(t)) throw TypeError("attempted to " + i + " private field on non-instance");
        return e.get(t)
    }

    function i(t, e) {
        if (e.has(t)) throw TypeError("Cannot initialize the same private elements twice on an object")
    }
    t.s(["_", 0, e], 747304), t.s(["_", 0, function(t, i) {
        var s = e(t, i, "get");
        return s.get ? s.get.call(t) : s.value
    }], 711300), t.s(["_", 0, i], 209268), t.s(["_", 0, function(t, e, s) {
        i(t, e), e.set(t, s)
    }], 634203), t.s(["_", 0, function(t, i, s) {
        var r = e(t, i, "set");
        if (r.set) r.set.call(t, s);
        else {
            if (!r.writable) throw TypeError("attempted to set read only private field");
            r.value = s
        }
        return s
    }], 35877)
}, 422898, 630844, t => {
    "use strict";
    t.s(["_", 0, function(t, e, i) {
        if (!e.has(t)) throw TypeError("attempted to get private field on non-instance");
        return i
    }], 422898);
    var e = t.i(209268);
    t.s(["_", 0, function(t, i) {
        (0, e._)(t, i), i.add(t)
    }], 630844)
}, 549772, t => {
    "use strict";
    var e, i, s, r = t.i(711300),
        n = t.i(634203),
        a = t.i(35877),
        o = t.i(211089),
        l = t.i(711367),
        u = new(e = new WeakMap, i = new WeakMap, s = new WeakMap, class extends o.Subscribable {
            onSubscribe() {
                (0, r._)(this, i) || this.setEventListener((0, r._)(this, s))
            }
            onUnsubscribe() {
                var t;
                this.hasListeners() || (null == (t = (0, r._)(this, i)) || t.call(this), (0, a._)(this, i, void 0))
            }
            setEventListener(t) {
                var e;
                (0, a._)(this, s, t), null == (e = (0, r._)(this, i)) || e.call(this), (0, a._)(this, i, t(t => {
                    "boolean" == typeof t ? this.setFocused(t) : this.onFocus()
                }))
            }
            setFocused(t) {
                (0, r._)(this, e) !== t && ((0, a._)(this, e, t), this.onFocus())
            }
            onFocus() {
                let t = this.isFocused();
                this.listeners.forEach(e => {
                    e(t)
                })
            }
            isFocused() {
                var t;
                return "boolean" == typeof(0, r._)(this, e) ? (0, r._)(this, e) : (null == (t = globalThis.document) ? void 0 : t.visibilityState) !== "hidden"
            }
            constructor() {
                super(), (0, n._)(this, e, {
                    writable: !0,
                    value: void 0
                }), (0, n._)(this, i, {
                    writable: !0,
                    value: void 0
                }), (0, n._)(this, s, {
                    writable: !0,
                    value: void 0
                }), (0, a._)(this, s, t => {
                    if (!l.isServer && window.addEventListener) {
                        let e = () => t();
                        return window.addEventListener("visibilitychange", e, !1), () => {
                            window.removeEventListener("visibilitychange", e)
                        }
                    }
                })
            }
        });
    t.s(["focusManager", 0, u])
}, 665564, t => {
    "use strict";
    let e, i, s, r, n, a;
    var o = t.i(607923).systemSetTimeoutZero,
        l = (e = [], i = 0, s = t => {
            t()
        }, r = t => {
            t()
        }, n = o, {
            batch: t => {
                let a;
                i++;
                try {
                    a = t()
                } finally {
                    let t;
                    --i || (t = e, e = [], t.length && n(() => {
                        r(() => {
                            t.forEach(t => {
                                s(t)
                            })
                        })
                    }))
                }
                return a
            },
            batchCalls: t => function() {
                for (var e = arguments.length, i = Array(e), s = 0; s < e; s++) i[s] = arguments[s];
                a(() => {
                    t(...i)
                })
            },
            schedule: a = t => {
                i ? e.push(t) : n(() => {
                    s(t)
                })
            },
            setNotifyFunction: t => {
                s = t
            },
            setBatchNotifyFunction: t => {
                r = t
            },
            setScheduler: t => {
                n = t
            }
        });
    t.s(["notifyManager", 0, l])
}, 468612, 772278, t => {
    "use strict";
    var e, i, s, r, n, a, o, l, u, h, c, d, p, f, v, _, y, b, m, w, g, S, O, R, E, C, T, M, k, F, U, W, q = t.i(711300),
        j = t.i(634203),
        P = t.i(35877),
        D = t.i(422898),
        Q = t.i(630844),
        A = t.i(549772),
        I = t.i(665564),
        x = t.i(711367),
        L = t.i(919122),
        K = t.i(199189),
        B = (e = new WeakMap, i = new WeakMap, s = new WeakMap, r = new WeakMap, n = new WeakMap, a = new WeakMap, o = new WeakMap, l = new WeakSet, class extends K.Removable {
            get meta() {
                return this.options.meta
            }
            get promise() {
                var t;
                return null == (t = (0, q._)(this, n)) ? void 0 : t.promise
            }
            setOptions(t) {
                if (this.options = {
                        ...(0, q._)(this, a),
                        ...t
                    }, this.updateGcTime(this.options.gcTime), this.state && void 0 === this.state.data) {
                    let t = G(this.options);
                    void 0 !== t.data && (this.setData(t.data, {
                        updatedAt: t.dataUpdatedAt,
                        manual: !0
                    }), (0, P._)(this, e, t))
                }
            }
            optionalRemove() {
                this.observers.length || "idle" !== this.state.fetchStatus || (0, q._)(this, s).remove(this)
            }
            setData(t, e) {
                let i = (0, x.replaceData)(this.state.data, t, this.options);
                return (0, D._)(this, l, z).call(this, {
                    data: i,
                    type: "success",
                    dataUpdatedAt: null == e ? void 0 : e.updatedAt,
                    manual: null == e ? void 0 : e.manual
                }), i
            }
            setState(t, e) {
                (0, D._)(this, l, z).call(this, {
                    type: "setState",
                    state: t,
                    setStateOptions: e
                })
            }
            cancel(t) {
                var e, i;
                let s = null == (e = (0, q._)(this, n)) ? void 0 : e.promise;
                return null == (i = (0, q._)(this, n)) || i.cancel(t), s ? s.then(x.noop).catch(x.noop) : Promise.resolve()
            }
            destroy() {
                super.destroy(), this.cancel({
                    silent: !0
                })
            }
            reset() {
                this.destroy(), this.setState((0, q._)(this, e))
            }
            isActive() {
                return this.observers.some(t => !1 !== (0, x.resolveEnabled)(t.options.enabled, this))
            }
            isDisabled() {
                return this.getObserversCount() > 0 ? !this.isActive() : this.options.queryFn === x.skipToken || this.state.dataUpdateCount + this.state.errorUpdateCount === 0
            }
            isStatic() {
                return this.getObserversCount() > 0 && this.observers.some(t => "static" === (0, x.resolveStaleTime)(t.options.staleTime, this))
            }
            isStale() {
                return this.getObserversCount() > 0 ? this.observers.some(t => t.getCurrentResult().isStale) : void 0 === this.state.data || this.state.isInvalidated
            }
            isStaleByTime() {
                let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : 0;
                return void 0 === this.state.data || "static" !== t && (!!this.state.isInvalidated || !(0, x.timeUntilStale)(this.state.dataUpdatedAt, t))
            }
            onFocus() {
                var t;
                let e = this.observers.find(t => t.shouldFetchOnWindowFocus());
                null == e || e.refetch({
                    cancelRefetch: !1
                }), null == (t = (0, q._)(this, n)) || t.continue()
            }
            onOnline() {
                var t;
                let e = this.observers.find(t => t.shouldFetchOnReconnect());
                null == e || e.refetch({
                    cancelRefetch: !1
                }), null == (t = (0, q._)(this, n)) || t.continue()
            }
            addObserver(t) {
                this.observers.includes(t) || (this.observers.push(t), this.clearGcTimeout(), (0, q._)(this, s).notify({
                    type: "observerAdded",
                    query: this,
                    observer: t
                }))
            }
            removeObserver(t) {
                this.observers.includes(t) && (this.observers = this.observers.filter(e => e !== t), this.observers.length || ((0, q._)(this, n) && ((0, q._)(this, o) ? (0, q._)(this, n).cancel({
                    revert: !0
                }) : (0, q._)(this, n).cancelRetry()), this.scheduleGc()), (0, q._)(this, s).notify({
                    type: "observerRemoved",
                    query: this,
                    observer: t
                }))
            }
            getObserversCount() {
                return this.observers.length
            }
            invalidate() {
                this.state.isInvalidated || (0, D._)(this, l, z).call(this, {
                    type: "invalidate"
                })
            }
            async fetch(t, e) {
                var a, u, h, c, d, p, f, v, _, y, b, m;
                let w;
                if ("idle" !== this.state.fetchStatus && (null == (a = (0, q._)(this, n)) ? void 0 : a.status()) !== "rejected") {
                    if (void 0 !== this.state.data && (null == e ? void 0 : e.cancelRefetch)) this.cancel({
                        silent: !0
                    });
                    else if ((0, q._)(this, n)) return (0, q._)(this, n).continueRetry(), (0, q._)(this, n).promise
                }
                if (t && this.setOptions(t), !this.options.queryFn) {
                    let t = this.observers.find(t => t.options.queryFn);
                    t && this.setOptions(t.options)
                }
                let g = new AbortController,
                    S = t => {
                        Object.defineProperty(t, "signal", {
                            enumerable: !0,
                            get: () => ((0, P._)(this, o, !0), g.signal)
                        })
                    },
                    O = () => {
                        let t, i = (0, x.ensureQueryFn)(this.options, e),
                            s = (S(t = {
                                client: (0, q._)(this, r),
                                queryKey: this.queryKey,
                                meta: this.meta
                            }), t);
                        return ((0, P._)(this, o, !1), this.options.persister) ? this.options.persister(i, s, this) : i(s)
                    },
                    R = (S(w = {
                        fetchOptions: e,
                        options: this.options,
                        queryKey: this.queryKey,
                        client: (0, q._)(this, r),
                        state: this.state,
                        fetchFn: O
                    }), w);
                null == (u = this.options.behavior) || u.onFetch(R, this), (0, P._)(this, i, this.state), ("idle" === this.state.fetchStatus || this.state.fetchMeta !== (null == (h = R.fetchOptions) ? void 0 : h.meta)) && (0, D._)(this, l, z).call(this, {
                    type: "fetch",
                    meta: null == (c = R.fetchOptions) ? void 0 : c.meta
                }), (0, P._)(this, n, (0, L.createRetryer)({
                    initialPromise: null == e ? void 0 : e.initialPromise,
                    fn: R.fetchFn,
                    onCancel: t => {
                        t instanceof L.CancelledError && t.revert && this.setState({
                            ...(0, q._)(this, i),
                            fetchStatus: "idle"
                        }), g.abort()
                    },
                    onFail: (t, e) => {
                        (0, D._)(this, l, z).call(this, {
                            type: "failed",
                            failureCount: t,
                            error: e
                        })
                    },
                    onPause: () => {
                        (0, D._)(this, l, z).call(this, {
                            type: "pause"
                        })
                    },
                    onContinue: () => {
                        (0, D._)(this, l, z).call(this, {
                            type: "continue"
                        })
                    },
                    retry: R.options.retry,
                    retryDelay: R.options.retryDelay,
                    networkMode: R.options.networkMode,
                    canRun: () => !0
                }));
                try {
                    let t = await (0, q._)(this, n).start();
                    if (void 0 === t) throw Error("".concat(this.queryHash, " data is undefined"));
                    return this.setData(t), null == (d = (p = (0, q._)(this, s).config).onSuccess) || d.call(p, t, this), null == (f = (v = (0, q._)(this, s).config).onSettled) || f.call(v, t, this.state.error, this), t
                } catch (t) {
                    if (t instanceof L.CancelledError) {
                        if (t.silent) return (0, q._)(this, n).promise;
                        else if (t.revert) {
                            if (void 0 === this.state.data) throw t;
                            return this.state.data
                        }
                    }
                    throw (0, D._)(this, l, z).call(this, {
                        type: "error",
                        error: t
                    }), null == (_ = (y = (0, q._)(this, s).config).onError) || _.call(y, t, this), null == (b = (m = (0, q._)(this, s).config).onSettled) || b.call(m, this.state.data, t, this), t
                } finally {
                    this.scheduleGc()
                }
            }
            constructor(t) {
                var u;
                super(), (0, Q._)(this, l), (0, j._)(this, e, {
                    writable: !0,
                    value: void 0
                }), (0, j._)(this, i, {
                    writable: !0,
                    value: void 0
                }), (0, j._)(this, s, {
                    writable: !0,
                    value: void 0
                }), (0, j._)(this, r, {
                    writable: !0,
                    value: void 0
                }), (0, j._)(this, n, {
                    writable: !0,
                    value: void 0
                }), (0, j._)(this, a, {
                    writable: !0,
                    value: void 0
                }), (0, j._)(this, o, {
                    writable: !0,
                    value: void 0
                }), (0, P._)(this, o, !1), (0, P._)(this, a, t.defaultOptions), this.setOptions(t.options), this.observers = [], (0, P._)(this, r, t.client), (0, P._)(this, s, (0, q._)(this, r).getQueryCache()), this.queryKey = t.queryKey, this.queryHash = t.queryHash, (0, P._)(this, e, G(this.options)), this.state = null != (u = t.state) ? u : (0, q._)(this, e), this.scheduleGc()
            }
        });

    function H(t, e) {
        return {
            fetchFailureCount: 0,
            fetchFailureReason: null,
            fetchStatus: (0, L.canFetch)(e.networkMode) ? "fetching" : "paused",
            ...void 0 === t && {
                error: null,
                status: "pending"
            }
        }
    }

    function G(t) {
        let e = "function" == typeof t.initialData ? t.initialData() : t.initialData,
            i = void 0 !== e,
            s = i ? "function" == typeof t.initialDataUpdatedAt ? t.initialDataUpdatedAt() : t.initialDataUpdatedAt : 0;
        return {
            data: e,
            dataUpdateCount: 0,
            dataUpdatedAt: i ? null != s ? s : Date.now() : 0,
            error: null,
            errorUpdateCount: 0,
            errorUpdatedAt: 0,
            fetchFailureCount: 0,
            fetchFailureReason: null,
            fetchMeta: null,
            isInvalidated: !1,
            status: i ? "success" : "pending",
            fetchStatus: "idle"
        }
    }

    function z(t) {
        let e = e => {
            var s, r;
            switch (t.type) {
                case "failed":
                    return {
                        ...e, fetchFailureCount: t.failureCount, fetchFailureReason: t.error
                    };
                case "pause":
                    return {
                        ...e, fetchStatus: "paused"
                    };
                case "continue":
                    return {
                        ...e, fetchStatus: "fetching"
                    };
                case "fetch":
                    return {
                        ...e, ...H(e.data, this.options), fetchMeta: null != (s = t.meta) ? s : null
                    };
                case "success":
                    let n = {
                        ...e,
                        data: t.data,
                        dataUpdateCount: e.dataUpdateCount + 1,
                        dataUpdatedAt: null != (r = t.dataUpdatedAt) ? r : Date.now(),
                        error: null,
                        isInvalidated: !1,
                        status: "success",
                        ...!t.manual && {
                            fetchStatus: "idle",
                            fetchFailureCount: 0,
                            fetchFailureReason: null
                        }
                    };
                    return (0, P._)(this, i, t.manual ? n : void 0), n;
                case "error":
                    let a = t.error;
                    return {
                        ...e, error: a, errorUpdateCount: e.errorUpdateCount + 1, errorUpdatedAt: Date.now(), fetchFailureCount: e.fetchFailureCount + 1, fetchFailureReason: a, fetchStatus: "idle", status: "error"
                    };
                case "invalidate":
                    return {
                        ...e, isInvalidated: !0
                    };
                case "setState":
                    return {
                        ...e, ...t.state
                    }
            }
        };
        this.state = e(this.state), I.notifyManager.batch(() => {
            this.observers.forEach(t => {
                t.onQueryUpdate()
            }), (0, q._)(this, s).notify({
                query: this,
                type: "updated",
                action: t
            })
        })
    }
    t.s(["Query", 0, B, "fetchState", 0, H], 772278);
    var N = t.i(211089),
        V = t.i(383062),
        Z = t.i(607923),
        J = (u = new WeakMap, h = new WeakMap, c = new WeakMap, d = new WeakMap, p = new WeakMap, f = new WeakMap, v = new WeakMap, _ = new WeakMap, y = new WeakMap, b = new WeakMap, m = new WeakMap, w = new WeakMap, g = new WeakMap, S = new WeakMap, O = new WeakMap, R = new WeakSet, E = new WeakSet, C = new WeakSet, T = new WeakSet, M = new WeakSet, k = new WeakSet, F = new WeakSet, U = new WeakSet, W = new WeakSet, class extends N.Subscribable {
            bindMethods() {
                this.refetch = this.refetch.bind(this)
            }
            onSubscribe() {
                1 === this.listeners.size && ((0, q._)(this, h).addObserver(this), X((0, q._)(this, h), this.options) ? (0, D._)(this, R, te).call(this) : this.updateResult(), (0, D._)(this, M, tn).call(this))
            }
            onUnsubscribe() {
                this.hasListeners() || this.destroy()
            }
            shouldFetchOnReconnect() {
                return Y((0, q._)(this, h), this.options, this.options.refetchOnReconnect)
            }
            shouldFetchOnWindowFocus() {
                return Y((0, q._)(this, h), this.options, this.options.refetchOnWindowFocus)
            }
            destroy() {
                this.listeners = new Set, (0, D._)(this, k, ta).call(this), (0, D._)(this, F, to).call(this), (0, q._)(this, h).removeObserver(this)
            }
            setOptions(t) {
                let e = this.options,
                    i = (0, q._)(this, h);
                if (this.options = (0, q._)(this, u).defaultQueryOptions(t), void 0 !== this.options.enabled && "boolean" != typeof this.options.enabled && "function" != typeof this.options.enabled && "boolean" != typeof(0, x.resolveEnabled)(this.options.enabled, (0, q._)(this, h))) throw Error("Expected enabled to be a boolean or a callback that returns a boolean");
                (0, D._)(this, U, tl).call(this), (0, q._)(this, h).setOptions(this.options), e._defaulted && !(0, x.shallowEqualObjects)(this.options, e) && (0, q._)(this, u).getQueryCache().notify({
                    type: "observerOptionsUpdated",
                    query: (0, q._)(this, h),
                    observer: this
                });
                let s = this.hasListeners();
                s && $((0, q._)(this, h), i, this.options, e) && (0, D._)(this, R, te).call(this), this.updateResult(), s && ((0, q._)(this, h) !== i || (0, x.resolveEnabled)(this.options.enabled, (0, q._)(this, h)) !== (0, x.resolveEnabled)(e.enabled, (0, q._)(this, h)) || (0, x.resolveStaleTime)(this.options.staleTime, (0, q._)(this, h)) !== (0, x.resolveStaleTime)(e.staleTime, (0, q._)(this, h))) && (0, D._)(this, E, ti).call(this);
                let r = (0, D._)(this, C, ts).call(this);
                s && ((0, q._)(this, h) !== i || (0, x.resolveEnabled)(this.options.enabled, (0, q._)(this, h)) !== (0, x.resolveEnabled)(e.enabled, (0, q._)(this, h)) || r !== (0, q._)(this, S)) && (0, D._)(this, T, tr).call(this, r)
            }
            getOptimisticResult(t) {
                var e, i;
                let s = (0, q._)(this, u).getQueryCache().build((0, q._)(this, u), t),
                    r = this.createResult(s, t);
                return e = this, i = r, (0, x.shallowEqualObjects)(e.getCurrentResult(), i) || ((0, P._)(this, d, r), (0, P._)(this, f, this.options), (0, P._)(this, p, (0, q._)(this, h).state)), r
            }
            getCurrentResult() {
                return (0, q._)(this, d)
            }
            trackResult(t, e) {
                return new Proxy(t, {
                    get: (t, i) => (this.trackProp(i), null == e || e(i), "promise" !== i || this.options.experimental_prefetchInRender || "pending" !== (0, q._)(this, v).status || (0, q._)(this, v).reject(Error("experimental_prefetchInRender feature flag is not enabled")), Reflect.get(t, i))
                })
            }
            trackProp(t) {
                (0, q._)(this, O).add(t)
            }
            getCurrentQuery() {
                return (0, q._)(this, h)
            }
            refetch() {
                let {
                    ...t
                } = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                return this.fetch({
                    ...t
                })
            }
            fetchOptimistic(t) {
                let e = (0, q._)(this, u).defaultQueryOptions(t),
                    i = (0, q._)(this, u).getQueryCache().build((0, q._)(this, u), e);
                return i.fetch().then(() => this.createResult(i, e))
            }
            fetch(t) {
                var e;
                return (0, D._)(this, R, te).call(this, {
                    ...t,
                    cancelRefetch: null == (e = t.cancelRefetch) || e
                }).then(() => (this.updateResult(), (0, q._)(this, d)))
            }
            createResult(t, e) {
                let i, s = (0, q._)(this, h),
                    r = this.options,
                    n = (0, q._)(this, d),
                    a = (0, q._)(this, p),
                    o = (0, q._)(this, f),
                    l = t !== s ? t.state : (0, q._)(this, c),
                    {
                        state: u
                    } = t,
                    w = {
                        ...u
                    },
                    g = !1;
                if (e._optimisticResults) {
                    let i = this.hasListeners(),
                        n = !i && X(t, e),
                        a = i && $(t, s, e, r);
                    (n || a) && (w = {
                        ...w,
                        ...H(u.data, t.options)
                    }), "isRestoring" === e._optimisticResults && (w.fetchStatus = "idle")
                }
                let {
                    error: S,
                    errorUpdatedAt: O,
                    status: R
                } = w;
                i = w.data;
                let E = !1;
                if (void 0 !== e.placeholderData && void 0 === i && "pending" === R) {
                    let t;
                    if ((null == n ? void 0 : n.isPlaceholderData) && e.placeholderData === (null == o ? void 0 : o.placeholderData)) t = n.data, E = !0;
                    else {
                        var C;
                        t = "function" == typeof e.placeholderData ? e.placeholderData(null == (C = (0, q._)(this, m)) ? void 0 : C.state.data, (0, q._)(this, m)) : e.placeholderData
                    }
                    void 0 !== t && (R = "success", i = (0, x.replaceData)(null == n ? void 0 : n.data, t, e), g = !0)
                }
                if (e.select && void 0 !== i && !E)
                    if (n && i === (null == a ? void 0 : a.data) && e.select === (0, q._)(this, y)) i = (0, q._)(this, b);
                    else try {
                        (0, P._)(this, y, e.select), i = e.select(i), i = (0, x.replaceData)(null == n ? void 0 : n.data, i, e), (0, P._)(this, b, i), (0, P._)(this, _, null)
                    } catch (t) {
                        (0, P._)(this, _, t)
                    }(0, q._)(this, _) && (S = (0, q._)(this, _), i = (0, q._)(this, b), O = Date.now(), R = "error");
                let T = "fetching" === w.fetchStatus,
                    M = "pending" === R,
                    k = "error" === R,
                    F = M && T,
                    U = void 0 !== i,
                    W = {
                        status: R,
                        fetchStatus: w.fetchStatus,
                        isPending: M,
                        isSuccess: "success" === R,
                        isError: k,
                        isInitialLoading: F,
                        isLoading: F,
                        data: i,
                        dataUpdatedAt: w.dataUpdatedAt,
                        error: S,
                        errorUpdatedAt: O,
                        failureCount: w.fetchFailureCount,
                        failureReason: w.fetchFailureReason,
                        errorUpdateCount: w.errorUpdateCount,
                        isFetched: w.dataUpdateCount > 0 || w.errorUpdateCount > 0,
                        isFetchedAfterMount: w.dataUpdateCount > l.dataUpdateCount || w.errorUpdateCount > l.errorUpdateCount,
                        isFetching: T,
                        isRefetching: T && !M,
                        isLoadingError: k && !U,
                        isPaused: "paused" === w.fetchStatus,
                        isPlaceholderData: g,
                        isRefetchError: k && U,
                        isStale: tt(t, e),
                        refetch: this.refetch,
                        promise: (0, q._)(this, v),
                        isEnabled: !1 !== (0, x.resolveEnabled)(e.enabled, t)
                    };
                if (this.options.experimental_prefetchInRender) {
                    let e = t => {
                            "error" === W.status ? t.reject(W.error) : void 0 !== W.data && t.resolve(W.data)
                        },
                        i = () => {
                            e((0, P._)(this, v, W.promise = (0, V.pendingThenable)()))
                        },
                        r = (0, q._)(this, v);
                    switch (r.status) {
                        case "pending":
                            t.queryHash === s.queryHash && e(r);
                            break;
                        case "fulfilled":
                            ("error" === W.status || W.data !== r.value) && i();
                            break;
                        case "rejected":
                            ("error" !== W.status || W.error !== r.reason) && i()
                    }
                }
                return W
            }
            updateResult() {
                let t = (0, q._)(this, d),
                    e = this.createResult((0, q._)(this, h), this.options);
                if ((0, P._)(this, p, (0, q._)(this, h).state), (0, P._)(this, f, this.options), void 0 !== (0, q._)(this, p).data && (0, P._)(this, m, (0, q._)(this, h)), (0, x.shallowEqualObjects)(e, t)) return;
                (0, P._)(this, d, e);
                let i = () => {
                    if (!t) return !0;
                    let {
                        notifyOnChangeProps: e
                    } = this.options, i = "function" == typeof e ? e() : e;
                    if ("all" === i || !i && !(0, q._)(this, O).size) return !0;
                    let s = new Set(null != i ? i : (0, q._)(this, O));
                    return this.options.throwOnError && s.add("error"), Object.keys((0, q._)(this, d)).some(e => (0, q._)(this, d)[e] !== t[e] && s.has(e))
                };
                (0, D._)(this, W, tu).call(this, {
                    listeners: i()
                })
            }
            onQueryUpdate() {
                this.updateResult(), this.hasListeners() && (0, D._)(this, M, tn).call(this)
            }
            constructor(t, e) {
                super(), (0, Q._)(this, R), (0, Q._)(this, E), (0, Q._)(this, C), (0, Q._)(this, T), (0, Q._)(this, M), (0, Q._)(this, k), (0, Q._)(this, F), (0, Q._)(this, U), (0, Q._)(this, W), (0, j._)(this, u, {
                    writable: !0,
                    value: void 0
                }), (0, j._)(this, h, {
                    writable: !0,
                    value: void 0
                }), (0, j._)(this, c, {
                    writable: !0,
                    value: void 0
                }), (0, j._)(this, d, {
                    writable: !0,
                    value: void 0
                }), (0, j._)(this, p, {
                    writable: !0,
                    value: void 0
                }), (0, j._)(this, f, {
                    writable: !0,
                    value: void 0
                }), (0, j._)(this, v, {
                    writable: !0,
                    value: void 0
                }), (0, j._)(this, _, {
                    writable: !0,
                    value: void 0
                }), (0, j._)(this, y, {
                    writable: !0,
                    value: void 0
                }), (0, j._)(this, b, {
                    writable: !0,
                    value: void 0
                }), (0, j._)(this, m, {
                    writable: !0,
                    value: void 0
                }), (0, j._)(this, w, {
                    writable: !0,
                    value: void 0
                }), (0, j._)(this, g, {
                    writable: !0,
                    value: void 0
                }), (0, j._)(this, S, {
                    writable: !0,
                    value: void 0
                }), (0, j._)(this, O, {
                    writable: !0,
                    value: new Set
                }), this.options = e, (0, P._)(this, u, t), (0, P._)(this, _, null), (0, P._)(this, v, (0, V.pendingThenable)()), this.bindMethods(), this.setOptions(e)
            }
        });

    function X(t, e) {
        return !1 !== (0, x.resolveEnabled)(e.enabled, t) && void 0 === t.state.data && ("error" !== t.state.status || !1 !== e.retryOnMount) || void 0 !== t.state.data && Y(t, e, e.refetchOnMount)
    }

    function Y(t, e, i) {
        if (!1 !== (0, x.resolveEnabled)(e.enabled, t) && "static" !== (0, x.resolveStaleTime)(e.staleTime, t)) {
            let s = "function" == typeof i ? i(t) : i;
            return "always" === s || !1 !== s && tt(t, e)
        }
        return !1
    }

    function $(t, e, i, s) {
        return (t !== e || !1 === (0, x.resolveEnabled)(s.enabled, t)) && (!i.suspense || "error" !== t.state.status) && tt(t, i)
    }

    function tt(t, e) {
        return !1 !== (0, x.resolveEnabled)(e.enabled, t) && t.isStaleByTime((0, x.resolveStaleTime)(e.staleTime, t))
    }

    function te(t) {
        (0, D._)(this, U, tl).call(this);
        let e = (0, q._)(this, h).fetch(this.options, t);
        return (null == t ? void 0 : t.throwOnError) || (e = e.catch(x.noop)), e
    }

    function ti() {
        (0, D._)(this, k, ta).call(this);
        let t = (0, x.resolveStaleTime)(this.options.staleTime, (0, q._)(this, h));
        if (x.isServer || (0, q._)(this, d).isStale || !(0, x.isValidTimeout)(t)) return;
        let e = (0, x.timeUntilStale)((0, q._)(this, d).dataUpdatedAt, t);
        (0, P._)(this, w, Z.timeoutManager.setTimeout(() => {
            (0, q._)(this, d).isStale || this.updateResult()
        }, e + 1))
    }

    function ts() {
        var t;
        return null != (t = "function" == typeof this.options.refetchInterval ? this.options.refetchInterval((0, q._)(this, h)) : this.options.refetchInterval) && t
    }

    function tr(t) {
        (0, D._)(this, F, to).call(this), (0, P._)(this, S, t), !x.isServer && !1 !== (0, x.resolveEnabled)(this.options.enabled, (0, q._)(this, h)) && (0, x.isValidTimeout)((0, q._)(this, S)) && 0 !== (0, q._)(this, S) && (0, P._)(this, g, Z.timeoutManager.setInterval(() => {
            (this.options.refetchIntervalInBackground || A.focusManager.isFocused()) && (0, D._)(this, R, te).call(this)
        }, (0, q._)(this, S)))
    }

    function tn() {
        (0, D._)(this, E, ti).call(this), (0, D._)(this, T, tr).call(this, (0, D._)(this, C, ts).call(this))
    }

    function ta() {
        (0, q._)(this, w) && (Z.timeoutManager.clearTimeout((0, q._)(this, w)), (0, P._)(this, w, void 0))
    }

    function to() {
        (0, q._)(this, g) && (Z.timeoutManager.clearInterval((0, q._)(this, g)), (0, P._)(this, g, void 0))
    }

    function tl() {
        let t = (0, q._)(this, u).getQueryCache().build((0, q._)(this, u), this.options);
        if (t === (0, q._)(this, h)) return;
        let e = (0, q._)(this, h);
        (0, P._)(this, h, t), (0, P._)(this, c, t.state), this.hasListeners() && (null == e || e.removeObserver(this), t.addObserver(this))
    }

    function tu(t) {
        I.notifyManager.batch(() => {
            t.listeners && this.listeners.forEach(t => {
                t((0, q._)(this, d))
            }), (0, q._)(this, u).getQueryCache().notify({
                query: (0, q._)(this, h),
                type: "observerResultsUpdated"
            })
        })
    }
    t.s(["QueryObserver", 0, J], 468612)
}, 199189, t => {
    "use strict";
    var e, i = t.i(711300),
        s = t.i(634203),
        r = t.i(35877),
        n = t.i(607923),
        a = t.i(711367),
        o = (e = new WeakMap, class {
            destroy() {
                this.clearGcTimeout()
            }
            scheduleGc() {
                this.clearGcTimeout(), (0, a.isValidTimeout)(this.gcTime) && (0, r._)(this, e, n.timeoutManager.setTimeout(() => {
                    this.optionalRemove()
                }, this.gcTime))
            }
            updateGcTime(t) {
                this.gcTime = Math.max(this.gcTime || 0, null != t ? t : a.isServer ? 1 / 0 : 3e5)
            }
            clearGcTimeout() {
                (0, i._)(this, e) && (n.timeoutManager.clearTimeout((0, i._)(this, e)), (0, r._)(this, e, void 0))
            }
            constructor() {
                (0, s._)(this, e, {
                    writable: !0,
                    value: void 0
                })
            }
        });
    t.s(["Removable", 0, o])
}, 919122, 841246, 383062, t => {
    "use strict";
    var e, i, s, r = t.i(549772),
        n = t.i(711300),
        a = t.i(634203),
        o = t.i(35877),
        l = t.i(211089),
        u = t.i(711367),
        h = new(e = new WeakMap, i = new WeakMap, s = new WeakMap, class extends l.Subscribable {
            onSubscribe() {
                (0, n._)(this, i) || this.setEventListener((0, n._)(this, s))
            }
            onUnsubscribe() {
                var t;
                this.hasListeners() || (null == (t = (0, n._)(this, i)) || t.call(this), (0, o._)(this, i, void 0))
            }
            setEventListener(t) {
                var e;
                (0, o._)(this, s, t), null == (e = (0, n._)(this, i)) || e.call(this), (0, o._)(this, i, t(this.setOnline.bind(this)))
            }
            setOnline(t) {
                (0, n._)(this, e) !== t && ((0, o._)(this, e, t), this.listeners.forEach(e => {
                    e(t)
                }))
            }
            isOnline() {
                return (0, n._)(this, e)
            }
            constructor() {
                super(), (0, a._)(this, e, {
                    writable: !0,
                    value: !0
                }), (0, a._)(this, i, {
                    writable: !0,
                    value: void 0
                }), (0, a._)(this, s, {
                    writable: !0,
                    value: void 0
                }), (0, o._)(this, s, t => {
                    if (!u.isServer && window.addEventListener) {
                        let e = () => t(!0),
                            i = () => t(!1);
                        return window.addEventListener("online", e, !1), window.addEventListener("offline", i, !1), () => {
                            window.removeEventListener("online", e), window.removeEventListener("offline", i)
                        }
                    }
                })
            }
        });

    function c() {
        let t, e, i = new Promise((i, s) => {
            t = i, e = s
        });

        function s(t) {
            Object.assign(i, t), delete i.resolve, delete i.reject
        }
        return i.status = "pending", i.catch(() => {}), i.resolve = e => {
            s({
                status: "fulfilled",
                value: e
            }), t(e)
        }, i.reject = t => {
            s({
                status: "rejected",
                reason: t
            }), e(t)
        }, i
    }

    function d(t) {
        return Math.min(1e3 * 2 ** t, 3e4)
    }

    function p(t) {
        return (null != t ? t : "online") !== "online" || h.isOnline()
    }
    t.s(["onlineManager", 0, h], 841246), t.s(["pendingThenable", 0, c], 383062);
    var f = class extends Error {
        constructor(t) {
            super("CancelledError"), this.revert = null == t ? void 0 : t.revert, this.silent = null == t ? void 0 : t.silent
        }
    };
    t.s(["CancelledError", 0, f, "canFetch", 0, p, "createRetryer", 0, function(t) {
        let e, i = !1,
            s = 0,
            n = c(),
            a = () => r.focusManager.isFocused() && ("always" === t.networkMode || h.isOnline()) && t.canRun(),
            o = () => p(t.networkMode) && t.canRun(),
            l = t => {
                "pending" === n.status && (null == e || e(), n.resolve(t))
            },
            v = t => {
                "pending" === n.status && (null == e || e(), n.reject(t))
            },
            _ = () => new Promise(i => {
                var s;
                e = t => {
                    ("pending" !== n.status || a()) && i(t)
                }, null == (s = t.onPause) || s.call(t)
            }).then(() => {
                if (e = void 0, "pending" === n.status) {
                    var i;
                    null == (i = t.onContinue) || i.call(t)
                }
            }),
            y = () => {
                let e;
                if ("pending" !== n.status) return;
                let r = 0 === s ? t.initialPromise : void 0;
                try {
                    e = null != r ? r : t.fn()
                } catch (t) {
                    e = Promise.reject(t)
                }
                Promise.resolve(e).then(l).catch(e => {
                    var r, o, l;
                    if ("pending" !== n.status) return;
                    let h = null != (r = t.retry) ? r : 3 * !u.isServer,
                        c = null != (o = t.retryDelay) ? o : d,
                        p = "function" == typeof c ? c(s, e) : c,
                        f = !0 === h || "number" == typeof h && s < h || "function" == typeof h && h(s, e);
                    i || !f ? v(e) : (s++, null == (l = t.onFail) || l.call(t, s, e), (0, u.sleep)(p).then(() => a() ? void 0 : _()).then(() => {
                        i ? v(e) : y()
                    }))
                })
            };
        return {
            promise: n,
            status: () => n.status,
            cancel: e => {
                if ("pending" === n.status) {
                    var i;
                    let s = new f(e);
                    v(s), null == (i = t.onCancel) || i.call(t, s)
                }
            },
            continue: () => (null == e || e(), n),
            cancelRetry: () => {
                i = !0
            },
            continueRetry: () => {
                i = !1
            },
            canStart: o,
            start: () => (o() ? y() : _().then(y), n)
        }
    }], 919122)
}, 211089, t => {
    "use strict";
    t.s(["Subscribable", 0, class {
        subscribe(t) {
            return this.listeners.add(t), this.onSubscribe(), () => {
                this.listeners.delete(t), this.onUnsubscribe()
            }
        }
        hasListeners() {
            return this.listeners.size > 0
        }
        onSubscribe() {}
        onUnsubscribe() {}
        constructor() {
            this.listeners = new Set, this.subscribe = this.subscribe.bind(this)
        }
    }])
}, 607923, t => {
    "use strict";
    var e, i, s = t.i(711300),
        r = t.i(634203),
        n = t.i(35877),
        a = {
            setTimeout: (t, e) => setTimeout(t, e),
            clearTimeout: t => clearTimeout(t),
            setInterval: (t, e) => setInterval(t, e),
            clearInterval: t => clearInterval(t)
        },
        o = new(e = new WeakMap, i = new WeakMap, class {
            setTimeoutProvider(t) {
                (0, n._)(this, e, t)
            }
            setTimeout(t, i) {
                return (0, s._)(this, e).setTimeout(t, i)
            }
            clearTimeout(t) {
                (0, s._)(this, e).clearTimeout(t)
            }
            setInterval(t, i) {
                return (0, s._)(this, e).setInterval(t, i)
            }
            clearInterval(t) {
                (0, s._)(this, e).clearInterval(t)
            }
            constructor() {
                (0, r._)(this, e, {
                    writable: !0,
                    value: a
                }), (0, r._)(this, i, {
                    writable: !0,
                    value: !1
                })
            }
        });
    t.s(["systemSetTimeoutZero", 0, function(t) {
        setTimeout(t, 0)
    }, "timeoutManager", 0, o])
}, 711367, t => {
    "use strict";
    var e = t.i(607923),
        i = "Deno" in globalThis;

    function s(t, e) {
        return ((null == e ? void 0 : e.queryKeyHashFn) || r)(t)
    }

    function r(t) {
        return JSON.stringify(t, (t, e) => u(e) ? Object.keys(e).sort().reduce((t, i) => (t[i] = e[i], t), {}) : e)
    }

    function n(t, e) {
        return t === e || typeof t == typeof e && !!t && !!e && "object" == typeof t && "object" == typeof e && Object.keys(e).every(i => n(t[i], e[i]))
    }
    var a = Object.prototype.hasOwnProperty;

    function o(t, e) {
        if (t === e) return t;
        let i = l(t) && l(e);
        if (!i && !(u(t) && u(e))) return e;
        let s = (i ? t : Object.keys(t)).length,
            r = i ? e : Object.keys(e),
            n = r.length,
            h = i ? Array(n) : {},
            c = 0;
        for (let l = 0; l < n; l++) {
            let n = i ? l : r[l],
                u = t[n],
                d = e[n];
            if (u === d) {
                h[n] = u, (i ? l < s : a.call(t, n)) && c++;
                continue
            }
            if (null === u || null === d || "object" != typeof u || "object" != typeof d) {
                h[n] = d;
                continue
            }
            let p = o(u, d);
            h[n] = p, p === u && c++
        }
        return s === n && c === s ? t : h
    }

    function l(t) {
        return Array.isArray(t) && t.length === Object.keys(t).length
    }

    function u(t) {
        if (!h(t)) return !1;
        let e = t.constructor;
        if (void 0 === e) return !0;
        let i = e.prototype;
        return !!h(i) && !!i.hasOwnProperty("isPrototypeOf") && Object.getPrototypeOf(t) === Object.prototype
    }

    function h(t) {
        return "[object Object]" === Object.prototype.toString.call(t)
    }
    var c = Symbol();
    t.s(["addToEnd", 0, function(t, e) {
        let i = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 0,
            s = [...t, e];
        return i && s.length > i ? s.slice(1) : s
    }, "addToStart", 0, function(t, e) {
        let i = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 0,
            s = [e, ...t];
        return i && s.length > i ? s.slice(0, -1) : s
    }, "ensureQueryFn", 0, function(t, e) {
        return !t.queryFn && (null == e ? void 0 : e.initialPromise) ? () => e.initialPromise : t.queryFn && t.queryFn !== c ? t.queryFn : () => Promise.reject(Error("Missing queryFn: '".concat(t.queryHash, "'")))
    }, "functionalUpdate", 0, function(t, e) {
        return "function" == typeof t ? t(e) : t
    }, "hashKey", 0, r, "hashQueryKeyByOptions", 0, s, "isServer", 0, i, "isValidTimeout", 0, function(t) {
        return "number" == typeof t && t >= 0 && t !== 1 / 0
    }, "keepPreviousData", 0, function(t) {
        return t
    }, "matchMutation", 0, function(t, e) {
        let {
            exact: i,
            status: s,
            predicate: a,
            mutationKey: o
        } = t;
        if (o) {
            if (!e.options.mutationKey) return !1;
            if (i) {
                if (r(e.options.mutationKey) !== r(o)) return !1
            } else if (!n(e.options.mutationKey, o)) return !1
        }
        return (!s || e.state.status === s) && (!a || !!a(e))
    }, "matchQuery", 0, function(t, e) {
        let {
            type: i = "all",
            exact: r,
            fetchStatus: a,
            predicate: o,
            queryKey: l,
            stale: u
        } = t;
        if (l) {
            if (r) {
                if (e.queryHash !== s(l, e.options)) return !1
            } else if (!n(e.queryKey, l)) return !1
        }
        if ("all" !== i) {
            let t = e.isActive();
            if ("active" === i && !t || "inactive" === i && t) return !1
        }
        return ("boolean" != typeof u || e.isStale() === u) && (!a || a === e.state.fetchStatus) && (!o || !!o(e))
    }, "noop", 0, function() {}, "partialMatchKey", 0, n, "replaceData", 0, function(t, e, i) {
        return "function" == typeof i.structuralSharing ? i.structuralSharing(t, e) : !1 !== i.structuralSharing ? o(t, e) : e
    }, "replaceEqualDeep", 0, o, "resolveEnabled", 0, function(t, e) {
        return "function" == typeof t ? t(e) : t
    }, "resolveStaleTime", 0, function(t, e) {
        return "function" == typeof t ? t(e) : t
    }, "shallowEqualObjects", 0, function(t, e) {
        if (!e || Object.keys(t).length !== Object.keys(e).length) return !1;
        for (let i in t)
            if (t[i] !== e[i]) return !1;
        return !0
    }, "shouldThrowError", 0, function(t, e) {
        return "function" == typeof t ? t(...e) : !!t
    }, "skipToken", 0, c, "sleep", 0, function(t) {
        return new Promise(i => {
            e.timeoutManager.setTimeout(i, t)
        })
    }, "timeUntilStale", 0, function(t, e) {
        return Math.max(t + (e || 0) - Date.now(), 0)
    }])
}, 980385, t => {
    "use strict";
    var e = t.i(416340),
        i = e.createContext(!1);
    i.Provider, t.s(["useIsRestoring", 0, () => e.useContext(i)])
}, 795621, t => {
    "use strict";
    var e = t.i(416340),
        i = t.i(221628),
        s = e.createContext(void 0);
    t.s(["QueryClientProvider", 0, t => {
        let {
            client: r,
            children: n
        } = t;
        return e.useEffect(() => (r.mount(), () => {
            r.unmount()
        }), [r]), (0, i.jsx)(s.Provider, {
            value: r,
            children: n
        })
    }, "useQueryClient", 0, t => {
        let i = e.useContext(s);
        if (t) return t;
        if (!i) throw Error("No QueryClient set, use QueryClientProvider to set one");
        return i
    }])
}, 554314, 114467, t => {
    "use strict";
    let e;
    var i = t.i(416340);
    t.i(221628);
    var s = i.createContext((e = !1, {
        clearReset: () => {
            e = !1
        },
        reset: () => {
            e = !0
        },
        isReset: () => e
    }));
    t.s(["useQueryErrorResetBoundary", 0, () => i.useContext(s)], 554314);
    var r = t.i(711367);
    t.s(["ensurePreventErrorBoundaryRetry", 0, (t, e) => {
        (t.suspense || t.throwOnError || t.experimental_prefetchInRender) && !e.isReset() && (t.retryOnMount = !1)
    }, "getHasError", 0, t => {
        let {
            result: e,
            errorResetBoundary: i,
            throwOnError: s,
            query: n,
            suspense: a
        } = t;
        return e.isError && !i.isReset() && !e.isFetching && n && (a && void 0 === e.data || (0, r.shouldThrowError)(s, [e.error, n]))
    }, "useClearResetErrorBoundary", 0, t => {
        i.useEffect(() => {
            t.clearReset()
        }, [t])
    }], 114467)
}, 157310, 903481, 624083, t => {
    "use strict";
    var e = t.i(468612),
        i = t.i(416340),
        s = t.i(711367),
        r = t.i(665564),
        n = t.i(795621),
        a = t.i(554314),
        o = t.i(114467),
        l = t.i(980385),
        u = t => {
            if (t.suspense) {
                let e = t => "static" === t ? t : Math.max(null != t ? t : 1e3, 1e3),
                    i = t.staleTime;
                t.staleTime = "function" == typeof i ? function() {
                    for (var t = arguments.length, s = Array(t), r = 0; r < t; r++) s[r] = arguments[r];
                    return e(i(...s))
                } : e(i), "number" == typeof t.gcTime && (t.gcTime = Math.max(t.gcTime, 1e3))
            }
        },
        h = (t, e) => t.isLoading && t.isFetching && !e,
        c = (t, e) => (null == t ? void 0 : t.suspense) && e.isPending,
        d = (t, e, i) => e.fetchOptimistic(t).catch(() => {
            i.clearReset()
        });

    function p(t, e, p) {
        var f, v, _, y, b;
        let m = (0, l.useIsRestoring)(),
            w = (0, a.useQueryErrorResetBoundary)(),
            g = (0, n.useQueryClient)(p),
            S = g.defaultQueryOptions(t);
        null == (v = g.getDefaultOptions().queries) || null == (f = v._experimental_beforeQuery) || f.call(v, S), S._optimisticResults = m ? "isRestoring" : "optimistic", u(S), (0, o.ensurePreventErrorBoundaryRetry)(S, w), (0, o.useClearResetErrorBoundary)(w);
        let O = !g.getQueryCache().get(S.queryHash),
            [R] = i.useState(() => new e(g, S)),
            E = R.getOptimisticResult(S),
            C = !m && !1 !== t.subscribed;
        if (i.useSyncExternalStore(i.useCallback(t => {
                let e = C ? R.subscribe(r.notifyManager.batchCalls(t)) : s.noop;
                return R.updateResult(), e
            }, [R, C]), () => R.getCurrentResult(), () => R.getCurrentResult()), i.useEffect(() => {
                R.setOptions(S)
            }, [S, R]), c(S, E)) throw d(S, R, w);
        if ((0, o.getHasError)({
                result: E,
                errorResetBoundary: w,
                throwOnError: S.throwOnError,
                query: g.getQueryCache().get(S.queryHash),
                suspense: S.suspense
            })) throw E.error;
        if (null == (y = g.getDefaultOptions().queries) || null == (_ = y._experimental_afterQuery) || _.call(y, S, E), S.experimental_prefetchInRender && !s.isServer && h(E, m)) {
            let t = O ? d(S, R, w) : null == (b = g.getQueryCache().get(S.queryHash)) ? void 0 : b.promise;
            null == t || t.catch(s.noop).finally(() => {
                R.updateResult()
            })
        }
        return S.notifyOnChangeProps ? E : R.trackResult(E)
    }
    t.s(["defaultThrowOnError", 0, (t, e) => void 0 === e.state.data, "ensureSuspenseTimers", 0, u, "fetchOptimistic", 0, d, "shouldSuspend", 0, c, "willFetch", 0, h], 903481), t.s(["useBaseQuery", 0, p], 624083), t.s(["useQuery", 0, function(t, i) {
        return p(t, e.QueryObserver, i)
    }], 157310)
}]);

//# debugId=b5f56140-d7d1-5437-1eae-c60ee384885d
//# sourceMappingURL=40wf1h5ursw6r.js.map