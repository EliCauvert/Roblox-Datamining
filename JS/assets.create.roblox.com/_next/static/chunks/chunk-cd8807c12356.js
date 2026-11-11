;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "29bd5646-424f-c7e7-06c3-f71f36f200d9")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 540949, 591431, 266059, 28232, 562442, t => {
    "use strict";

    function e(t, e, i) {
        if (!e.has(t)) throw TypeError("attempted to " + i + " private field on non-instance");
        return e.get(t)
    }

    function i(t, e) {
        if (e.has(t)) throw TypeError("Cannot initialize the same private elements twice on an object")
    }
    t.s(["_", 0, e], 591431), t.s(["_", 0, function(t, i) {
        var s = e(t, i, "get");
        return s.get ? s.get.call(t) : s.value
    }], 540949), t.s(["_", 0, i], 266059), t.s(["_", 0, function(t, e, s) {
        i(t, e), e.set(t, s)
    }], 28232), t.s(["_", 0, function(t, i, s) {
        var n = e(t, i, "set");
        if (n.set) n.set.call(t, s);
        else {
            if (!n.writable) throw TypeError("attempted to set read only private field");
            n.value = s
        }
        return s
    }], 562442)
}, 594485, 459216, t => {
    "use strict";
    t.s(["_", 0, function(t, e, i) {
        if (!e.has(t)) throw TypeError("attempted to get private field on non-instance");
        return i
    }], 594485);
    var e = t.i(266059);
    t.s(["_", 0, function(t, i) {
        (0, e._)(t, i), i.add(t)
    }], 459216)
}, 461736, t => {
    "use strict";
    var e, i, s, n = t.i(540949),
        r = t.i(28232),
        a = t.i(562442),
        o = t.i(455596),
        l = t.i(463146),
        h = new(e = new WeakMap, i = new WeakMap, s = new WeakMap, class extends o.f {
            onSubscribe() {
                (0, n._)(this, i) || this.setEventListener((0, n._)(this, s))
            }
            onUnsubscribe() {
                var t;
                this.hasListeners() || (null == (t = (0, n._)(this, i)) || t.call(this), (0, a._)(this, i, void 0))
            }
            setEventListener(t) {
                var e;
                (0, a._)(this, s, t), null == (e = (0, n._)(this, i)) || e.call(this), (0, a._)(this, i, t(t => {
                    "boolean" == typeof t ? this.setFocused(t) : this.onFocus()
                }))
            }
            setFocused(t) {
                (0, n._)(this, e) !== t && ((0, a._)(this, e, t), this.onFocus())
            }
            onFocus() {
                let t = this.isFocused();
                this.listeners.forEach(e => {
                    e(t)
                })
            }
            isFocused() {
                var t;
                return "boolean" == typeof(0, n._)(this, e) ? (0, n._)(this, e) : (null == (t = globalThis.document) ? void 0 : t.visibilityState) !== "hidden"
            }
            constructor() {
                super(), (0, r._)(this, e, {
                    writable: !0,
                    value: void 0
                }), (0, r._)(this, i, {
                    writable: !0,
                    value: void 0
                }), (0, r._)(this, s, {
                    writable: !0,
                    value: void 0
                }), (0, a._)(this, s, t => {
                    if (!l.l && window.addEventListener) {
                        let e = () => t();
                        return window.addEventListener("visibilitychange", e, !1), () => {
                            window.removeEventListener("visibilitychange", e)
                        }
                    }
                })
            }
        });
    t.s(["f", 0, h])
}, 176522, t => {
    "use strict";
    let e, i, s, n, r, a;
    var o = t.i(323292).T,
        l = (e = [], i = 0, s = t => {
            t()
        }, n = t => {
            t()
        }, r = o, {
            batch: t => {
                let a;
                i++;
                try {
                    a = t()
                } finally {
                    let t;
                    --i || (t = e, e = [], t.length && r(() => {
                        n(() => {
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
                i ? e.push(t) : r(() => {
                    s(t)
                })
            },
            setNotifyFunction: t => {
                s = t
            },
            setBatchNotifyFunction: t => {
                n = t
            },
            setScheduler: t => {
                r = t
            }
        });
    t.s(["f", 0, l])
}, 230699, 605, t => {
    "use strict";
    var e, i, s, n, r, a, o, l, h, u, c, d, f, p, v, _, y, b, w, m, g, O, R, C, S, k, M, U, T, F, E, W, P = t.i(540949),
        q = t.i(28232),
        j = t.i(562442),
        A = t.i(594485),
        x = t.i(459216),
        D = t.i(461736),
        I = t.i(176522),
        L = t.i(463146),
        Q = t.i(397740),
        H = t.i(823255),
        K = (e = new WeakMap, i = new WeakMap, s = new WeakMap, n = new WeakMap, r = new WeakMap, a = new WeakMap, o = new WeakMap, l = new WeakSet, class extends H.f {
            get meta() {
                return this.options.meta
            }
            get promise() {
                var t;
                return null == (t = (0, P._)(this, r)) ? void 0 : t.promise
            }
            setOptions(t) {
                if (this.options = {
                        ...(0, P._)(this, a),
                        ...t
                    }, this.updateGcTime(this.options.gcTime), this.state && void 0 === this.state.data) {
                    let t = G(this.options);
                    void 0 !== t.data && (this.setData(t.data, {
                        updatedAt: t.dataUpdatedAt,
                        manual: !0
                    }), (0, j._)(this, e, t))
                }
            }
            optionalRemove() {
                this.observers.length || "idle" !== this.state.fetchStatus || (0, P._)(this, s).remove(this)
            }
            setData(t, e) {
                let i = (0, L.M)(this.state.data, t, this.options);
                return (0, A._)(this, l, B).call(this, {
                    data: i,
                    type: "success",
                    dataUpdatedAt: null == e ? void 0 : e.updatedAt,
                    manual: null == e ? void 0 : e.manual
                }), i
            }
            setState(t, e) {
                (0, A._)(this, l, B).call(this, {
                    type: "setState",
                    state: t,
                    setStateOptions: e
                })
            }
            cancel(t) {
                var e, i;
                let s = null == (e = (0, P._)(this, r)) ? void 0 : e.promise;
                return null == (i = (0, P._)(this, r)) || i.cancel(t), s ? s.then(L.z).catch(L.z) : Promise.resolve()
            }
            destroy() {
                super.destroy(), this.cancel({
                    silent: !0
                })
            }
            reset() {
                this.destroy(), this.setState((0, P._)(this, e))
            }
            isActive() {
                return this.observers.some(t => !1 !== (0, L.O)(t.options.enabled, this))
            }
            isDisabled() {
                return this.getObserversCount() > 0 ? !this.isActive() : this.options.queryFn === L.V || this.state.dataUpdateCount + this.state.errorUpdateCount === 0
            }
            isStatic() {
                return this.getObserversCount() > 0 && this.observers.some(t => "static" === (0, L.H)(t.options.staleTime, this))
            }
            isStale() {
                return this.getObserversCount() > 0 ? this.observers.some(t => t.getCurrentResult().isStale) : void 0 === this.state.data || this.state.isInvalidated
            }
            isStaleByTime() {
                let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : 0;
                return void 0 === this.state.data || "static" !== t && (!!this.state.isInvalidated || !(0, L.C)(this.state.dataUpdatedAt, t))
            }
            onFocus() {
                var t;
                let e = this.observers.find(t => t.shouldFetchOnWindowFocus());
                null == e || e.refetch({
                    cancelRefetch: !1
                }), null == (t = (0, P._)(this, r)) || t.continue()
            }
            onOnline() {
                var t;
                let e = this.observers.find(t => t.shouldFetchOnReconnect());
                null == e || e.refetch({
                    cancelRefetch: !1
                }), null == (t = (0, P._)(this, r)) || t.continue()
            }
            addObserver(t) {
                this.observers.includes(t) || (this.observers.push(t), this.clearGcTimeout(), (0, P._)(this, s).notify({
                    type: "observerAdded",
                    query: this,
                    observer: t
                }))
            }
            removeObserver(t) {
                this.observers.includes(t) && (this.observers = this.observers.filter(e => e !== t), this.observers.length || ((0, P._)(this, r) && ((0, P._)(this, o) ? (0, P._)(this, r).cancel({
                    revert: !0
                }) : (0, P._)(this, r).cancelRetry()), this.scheduleGc()), (0, P._)(this, s).notify({
                    type: "observerRemoved",
                    query: this,
                    observer: t
                }))
            }
            getObserversCount() {
                return this.observers.length
            }
            invalidate() {
                this.state.isInvalidated || (0, A._)(this, l, B).call(this, {
                    type: "invalidate"
                })
            }
            async fetch(t, e) {
                var a, h, u, c, d, f, p, v, _, y, b, w;
                let m;
                if ("idle" !== this.state.fetchStatus && (null == (a = (0, P._)(this, r)) ? void 0 : a.status()) !== "rejected") {
                    if (void 0 !== this.state.data && (null == e ? void 0 : e.cancelRefetch)) this.cancel({
                        silent: !0
                    });
                    else if ((0, P._)(this, r)) return (0, P._)(this, r).continueRetry(), (0, P._)(this, r).promise
                }
                if (t && this.setOptions(t), !this.options.queryFn) {
                    let t = this.observers.find(t => t.options.queryFn);
                    t && this.setOptions(t.options)
                }
                let g = new AbortController,
                    O = t => {
                        Object.defineProperty(t, "signal", {
                            enumerable: !0,
                            get: () => ((0, j._)(this, o, !0), g.signal)
                        })
                    },
                    R = () => {
                        let t, i = (0, L.W)(this.options, e),
                            s = (O(t = {
                                client: (0, P._)(this, n),
                                queryKey: this.queryKey,
                                meta: this.meta
                            }), t);
                        return ((0, j._)(this, o, !1), this.options.persister) ? this.options.persister(i, s, this) : i(s)
                    },
                    C = (O(m = {
                        fetchOptions: e,
                        options: this.options,
                        queryKey: this.queryKey,
                        client: (0, P._)(this, n),
                        state: this.state,
                        fetchFn: R
                    }), m);
                null == (h = this.options.behavior) || h.onFetch(C, this), (0, j._)(this, i, this.state), ("idle" === this.state.fetchStatus || this.state.fetchMeta !== (null == (u = C.fetchOptions) ? void 0 : u.meta)) && (0, A._)(this, l, B).call(this, {
                    type: "fetch",
                    meta: null == (c = C.fetchOptions) ? void 0 : c.meta
                }), (0, j._)(this, r, (0, Q.v)({
                    initialPromise: null == e ? void 0 : e.initialPromise,
                    fn: C.fetchFn,
                    onCancel: t => {
                        t instanceof Q.x && t.revert && this.setState({
                            ...(0, P._)(this, i),
                            fetchStatus: "idle"
                        }), g.abort()
                    },
                    onFail: (t, e) => {
                        (0, A._)(this, l, B).call(this, {
                            type: "failed",
                            failureCount: t,
                            error: e
                        })
                    },
                    onPause: () => {
                        (0, A._)(this, l, B).call(this, {
                            type: "pause"
                        })
                    },
                    onContinue: () => {
                        (0, A._)(this, l, B).call(this, {
                            type: "continue"
                        })
                    },
                    retry: C.options.retry,
                    retryDelay: C.options.retryDelay,
                    networkMode: C.options.networkMode,
                    canRun: () => !0
                }));
                try {
                    let t = await (0, P._)(this, r).start();
                    if (void 0 === t) throw Error("".concat(this.queryHash, " data is undefined"));
                    return this.setData(t), null == (d = (f = (0, P._)(this, s).config).onSuccess) || d.call(f, t, this), null == (p = (v = (0, P._)(this, s).config).onSettled) || p.call(v, t, this.state.error, this), t
                } catch (t) {
                    if (t instanceof Q.x) {
                        if (t.silent) return (0, P._)(this, r).promise;
                        else if (t.revert) {
                            if (void 0 === this.state.data) throw t;
                            return this.state.data
                        }
                    }
                    throw (0, A._)(this, l, B).call(this, {
                        type: "error",
                        error: t
                    }), null == (_ = (y = (0, P._)(this, s).config).onError) || _.call(y, t, this), null == (b = (w = (0, P._)(this, s).config).onSettled) || b.call(w, this.state.data, t, this), t
                } finally {
                    this.scheduleGc()
                }
            }
            constructor(t) {
                var h;
                super(), (0, x._)(this, l), (0, q._)(this, e, {
                    writable: !0,
                    value: void 0
                }), (0, q._)(this, i, {
                    writable: !0,
                    value: void 0
                }), (0, q._)(this, s, {
                    writable: !0,
                    value: void 0
                }), (0, q._)(this, n, {
                    writable: !0,
                    value: void 0
                }), (0, q._)(this, r, {
                    writable: !0,
                    value: void 0
                }), (0, q._)(this, a, {
                    writable: !0,
                    value: void 0
                }), (0, q._)(this, o, {
                    writable: !0,
                    value: void 0
                }), (0, j._)(this, o, !1), (0, j._)(this, a, t.defaultOptions), this.setOptions(t.options), this.observers = [], (0, j._)(this, n, t.client), (0, j._)(this, s, (0, P._)(this, n).getQueryCache()), this.queryKey = t.queryKey, this.queryHash = t.queryHash, (0, j._)(this, e, G(this.options)), this.state = null != (h = t.state) ? h : (0, P._)(this, e), this.scheduleGc()
            }
        });

    function z(t, e) {
        return {
            fetchFailureCount: 0,
            fetchFailureReason: null,
            fetchStatus: (0, Q.e)(e.networkMode) ? "fetching" : "paused",
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

    function B(t) {
        let e = e => {
            var s, n;
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
                        ...e, ...z(e.data, this.options), fetchMeta: null != (s = t.meta) ? s : null
                    };
                case "success":
                    let r = {
                        ...e,
                        data: t.data,
                        dataUpdateCount: e.dataUpdateCount + 1,
                        dataUpdatedAt: null != (n = t.dataUpdatedAt) ? n : Date.now(),
                        error: null,
                        isInvalidated: !1,
                        status: "success",
                        ...!t.manual && {
                            fetchStatus: "idle",
                            fetchFailureCount: 0,
                            fetchFailureReason: null
                        }
                    };
                    return (0, j._)(this, i, t.manual ? r : void 0), r;
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
        this.state = e(this.state), I.f.batch(() => {
            this.observers.forEach(t => {
                t.onQueryUpdate()
            }), (0, P._)(this, s).notify({
                query: this,
                type: "updated",
                action: t
            })
        })
    }
    t.s(["X", 0, K, "W", 0, z], 605);
    var N = t.i(455596),
        J = t.i(679986),
        V = t.i(323292),
        X = (h = new WeakMap, u = new WeakMap, c = new WeakMap, d = new WeakMap, f = new WeakMap, p = new WeakMap, v = new WeakMap, _ = new WeakMap, y = new WeakMap, b = new WeakMap, w = new WeakMap, m = new WeakMap, g = new WeakMap, O = new WeakMap, R = new WeakMap, C = new WeakSet, S = new WeakSet, k = new WeakSet, M = new WeakSet, U = new WeakSet, T = new WeakSet, F = new WeakSet, E = new WeakSet, W = new WeakSet, class extends N.f {
            bindMethods() {
                this.refetch = this.refetch.bind(this)
            }
            onSubscribe() {
                1 === this.listeners.size && ((0, P._)(this, u).addObserver(this), Z((0, P._)(this, u), this.options) ? (0, A._)(this, C, te).call(this) : this.updateResult(), (0, A._)(this, U, tr).call(this))
            }
            onUnsubscribe() {
                this.hasListeners() || this.destroy()
            }
            shouldFetchOnReconnect() {
                return Y((0, P._)(this, u), this.options, this.options.refetchOnReconnect)
            }
            shouldFetchOnWindowFocus() {
                return Y((0, P._)(this, u), this.options, this.options.refetchOnWindowFocus)
            }
            destroy() {
                this.listeners = new Set, (0, A._)(this, T, ta).call(this), (0, A._)(this, F, to).call(this), (0, P._)(this, u).removeObserver(this)
            }
            setOptions(t) {
                let e = this.options,
                    i = (0, P._)(this, u);
                if (this.options = (0, P._)(this, h).defaultQueryOptions(t), void 0 !== this.options.enabled && "boolean" != typeof this.options.enabled && "function" != typeof this.options.enabled && "boolean" != typeof(0, L.O)(this.options.enabled, (0, P._)(this, u))) throw Error("Expected enabled to be a boolean or a callback that returns a boolean");
                (0, A._)(this, E, tl).call(this), (0, P._)(this, u).setOptions(this.options), e._defaulted && !(0, L.U)(this.options, e) && (0, P._)(this, h).getQueryCache().notify({
                    type: "observerOptionsUpdated",
                    query: (0, P._)(this, u),
                    observer: this
                });
                let s = this.hasListeners();
                s && $((0, P._)(this, u), i, this.options, e) && (0, A._)(this, C, te).call(this), this.updateResult(), s && ((0, P._)(this, u) !== i || (0, L.O)(this.options.enabled, (0, P._)(this, u)) !== (0, L.O)(e.enabled, (0, P._)(this, u)) || (0, L.H)(this.options.staleTime, (0, P._)(this, u)) !== (0, L.H)(e.staleTime, (0, P._)(this, u))) && (0, A._)(this, S, ti).call(this);
                let n = (0, A._)(this, k, ts).call(this);
                s && ((0, P._)(this, u) !== i || (0, L.O)(this.options.enabled, (0, P._)(this, u)) !== (0, L.O)(e.enabled, (0, P._)(this, u)) || n !== (0, P._)(this, O)) && (0, A._)(this, M, tn).call(this, n)
            }
            getOptimisticResult(t) {
                var e, i;
                let s = (0, P._)(this, h).getQueryCache().build((0, P._)(this, h), t),
                    n = this.createResult(s, t);
                return e = this, i = n, (0, L.U)(e.getCurrentResult(), i) || ((0, j._)(this, d, n), (0, j._)(this, p, this.options), (0, j._)(this, f, (0, P._)(this, u).state)), n
            }
            getCurrentResult() {
                return (0, P._)(this, d)
            }
            trackResult(t, e) {
                return new Proxy(t, {
                    get: (t, i) => (this.trackProp(i), null == e || e(i), "promise" !== i || this.options.experimental_prefetchInRender || "pending" !== (0, P._)(this, v).status || (0, P._)(this, v).reject(Error("experimental_prefetchInRender feature flag is not enabled")), Reflect.get(t, i))
                })
            }
            trackProp(t) {
                (0, P._)(this, R).add(t)
            }
            getCurrentQuery() {
                return (0, P._)(this, u)
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
                let e = (0, P._)(this, h).defaultQueryOptions(t),
                    i = (0, P._)(this, h).getQueryCache().build((0, P._)(this, h), e);
                return i.fetch().then(() => this.createResult(i, e))
            }
            fetch(t) {
                var e;
                return (0, A._)(this, C, te).call(this, {
                    ...t,
                    cancelRefetch: null == (e = t.cancelRefetch) || e
                }).then(() => (this.updateResult(), (0, P._)(this, d)))
            }
            createResult(t, e) {
                let i, s = (0, P._)(this, u),
                    n = this.options,
                    r = (0, P._)(this, d),
                    a = (0, P._)(this, f),
                    o = (0, P._)(this, p),
                    l = t !== s ? t.state : (0, P._)(this, c),
                    {
                        state: h
                    } = t,
                    m = {
                        ...h
                    },
                    g = !1;
                if (e._optimisticResults) {
                    let i = this.hasListeners(),
                        r = !i && Z(t, e),
                        a = i && $(t, s, e, n);
                    (r || a) && (m = {
                        ...m,
                        ...z(h.data, t.options)
                    }), "isRestoring" === e._optimisticResults && (m.fetchStatus = "idle")
                }
                let {
                    error: O,
                    errorUpdatedAt: R,
                    status: C
                } = m;
                i = m.data;
                let S = !1;
                if (void 0 !== e.placeholderData && void 0 === i && "pending" === C) {
                    let t;
                    if ((null == r ? void 0 : r.isPlaceholderData) && e.placeholderData === (null == o ? void 0 : o.placeholderData)) t = r.data, S = !0;
                    else {
                        var k;
                        t = "function" == typeof e.placeholderData ? e.placeholderData(null == (k = (0, P._)(this, w)) ? void 0 : k.state.data, (0, P._)(this, w)) : e.placeholderData
                    }
                    void 0 !== t && (C = "success", i = (0, L.M)(null == r ? void 0 : r.data, t, e), g = !0)
                }
                if (e.select && void 0 !== i && !S)
                    if (r && i === (null == a ? void 0 : a.data) && e.select === (0, P._)(this, y)) i = (0, P._)(this, b);
                    else try {
                        (0, j._)(this, y, e.select), i = e.select(i), i = (0, L.M)(null == r ? void 0 : r.data, i, e), (0, j._)(this, b, i), (0, j._)(this, _, null)
                    } catch (t) {
                        (0, j._)(this, _, t)
                    }(0, P._)(this, _) && (O = (0, P._)(this, _), i = (0, P._)(this, b), R = Date.now(), C = "error");
                let M = "fetching" === m.fetchStatus,
                    U = "pending" === C,
                    T = "error" === C,
                    F = U && M,
                    E = void 0 !== i,
                    W = {
                        status: C,
                        fetchStatus: m.fetchStatus,
                        isPending: U,
                        isSuccess: "success" === C,
                        isError: T,
                        isInitialLoading: F,
                        isLoading: F,
                        data: i,
                        dataUpdatedAt: m.dataUpdatedAt,
                        error: O,
                        errorUpdatedAt: R,
                        failureCount: m.fetchFailureCount,
                        failureReason: m.fetchFailureReason,
                        errorUpdateCount: m.errorUpdateCount,
                        isFetched: m.dataUpdateCount > 0 || m.errorUpdateCount > 0,
                        isFetchedAfterMount: m.dataUpdateCount > l.dataUpdateCount || m.errorUpdateCount > l.errorUpdateCount,
                        isFetching: M,
                        isRefetching: M && !U,
                        isLoadingError: T && !E,
                        isPaused: "paused" === m.fetchStatus,
                        isPlaceholderData: g,
                        isRefetchError: T && E,
                        isStale: tt(t, e),
                        refetch: this.refetch,
                        promise: (0, P._)(this, v),
                        isEnabled: !1 !== (0, L.O)(e.enabled, t)
                    };
                if (this.options.experimental_prefetchInRender) {
                    let e = t => {
                            "error" === W.status ? t.reject(W.error) : void 0 !== W.data && t.resolve(W.data)
                        },
                        i = () => {
                            e((0, j._)(this, v, W.promise = (0, J.f)()))
                        },
                        n = (0, P._)(this, v);
                    switch (n.status) {
                        case "pending":
                            t.queryHash === s.queryHash && e(n);
                            break;
                        case "fulfilled":
                            ("error" === W.status || W.data !== n.value) && i();
                            break;
                        case "rejected":
                            ("error" !== W.status || W.error !== n.reason) && i()
                    }
                }
                return W
            }
            updateResult() {
                let t = (0, P._)(this, d),
                    e = this.createResult((0, P._)(this, u), this.options);
                if ((0, j._)(this, f, (0, P._)(this, u).state), (0, j._)(this, p, this.options), void 0 !== (0, P._)(this, f).data && (0, j._)(this, w, (0, P._)(this, u)), (0, L.U)(e, t)) return;
                (0, j._)(this, d, e);
                let i = () => {
                    if (!t) return !0;
                    let {
                        notifyOnChangeProps: e
                    } = this.options, i = "function" == typeof e ? e() : e;
                    if ("all" === i || !i && !(0, P._)(this, R).size) return !0;
                    let s = new Set(null != i ? i : (0, P._)(this, R));
                    return this.options.throwOnError && s.add("error"), Object.keys((0, P._)(this, d)).some(e => (0, P._)(this, d)[e] !== t[e] && s.has(e))
                };
                (0, A._)(this, W, th).call(this, {
                    listeners: i()
                })
            }
            onQueryUpdate() {
                this.updateResult(), this.hasListeners() && (0, A._)(this, U, tr).call(this)
            }
            constructor(t, e) {
                super(), (0, x._)(this, C), (0, x._)(this, S), (0, x._)(this, k), (0, x._)(this, M), (0, x._)(this, U), (0, x._)(this, T), (0, x._)(this, F), (0, x._)(this, E), (0, x._)(this, W), (0, q._)(this, h, {
                    writable: !0,
                    value: void 0
                }), (0, q._)(this, u, {
                    writable: !0,
                    value: void 0
                }), (0, q._)(this, c, {
                    writable: !0,
                    value: void 0
                }), (0, q._)(this, d, {
                    writable: !0,
                    value: void 0
                }), (0, q._)(this, f, {
                    writable: !0,
                    value: void 0
                }), (0, q._)(this, p, {
                    writable: !0,
                    value: void 0
                }), (0, q._)(this, v, {
                    writable: !0,
                    value: void 0
                }), (0, q._)(this, _, {
                    writable: !0,
                    value: void 0
                }), (0, q._)(this, y, {
                    writable: !0,
                    value: void 0
                }), (0, q._)(this, b, {
                    writable: !0,
                    value: void 0
                }), (0, q._)(this, w, {
                    writable: !0,
                    value: void 0
                }), (0, q._)(this, m, {
                    writable: !0,
                    value: void 0
                }), (0, q._)(this, g, {
                    writable: !0,
                    value: void 0
                }), (0, q._)(this, O, {
                    writable: !0,
                    value: void 0
                }), (0, q._)(this, R, {
                    writable: !0,
                    value: new Set
                }), this.options = e, (0, j._)(this, h, t), (0, j._)(this, _, null), (0, j._)(this, v, (0, J.f)()), this.bindMethods(), this.setOptions(e)
            }
        });

    function Z(t, e) {
        return !1 !== (0, L.O)(e.enabled, t) && void 0 === t.state.data && ("error" !== t.state.status || !1 !== e.retryOnMount) || void 0 !== t.state.data && Y(t, e, e.refetchOnMount)
    }

    function Y(t, e, i) {
        if (!1 !== (0, L.O)(e.enabled, t) && "static" !== (0, L.H)(e.staleTime, t)) {
            let s = "function" == typeof i ? i(t) : i;
            return "always" === s || !1 !== s && tt(t, e)
        }
        return !1
    }

    function $(t, e, i, s) {
        return (t !== e || !1 === (0, L.O)(s.enabled, t)) && (!i.suspense || "error" !== t.state.status) && tt(t, i)
    }

    function tt(t, e) {
        return !1 !== (0, L.O)(e.enabled, t) && t.isStaleByTime((0, L.H)(e.staleTime, t))
    }

    function te(t) {
        (0, A._)(this, E, tl).call(this);
        let e = (0, P._)(this, u).fetch(this.options, t);
        return (null == t ? void 0 : t.throwOnError) || (e = e.catch(L.z)), e
    }

    function ti() {
        (0, A._)(this, T, ta).call(this);
        let t = (0, L.H)(this.options.staleTime, (0, P._)(this, u));
        if (L.l || (0, P._)(this, d).isStale || !(0, L.u)(t)) return;
        let e = (0, L.C)((0, P._)(this, d).dataUpdatedAt, t);
        (0, j._)(this, m, V.U.setTimeout(() => {
            (0, P._)(this, d).isStale || this.updateResult()
        }, e + 1))
    }

    function ts() {
        var t;
        return null != (t = "function" == typeof this.options.refetchInterval ? this.options.refetchInterval((0, P._)(this, u)) : this.options.refetchInterval) && t
    }

    function tn(t) {
        (0, A._)(this, F, to).call(this), (0, j._)(this, O, t), !L.l && !1 !== (0, L.O)(this.options.enabled, (0, P._)(this, u)) && (0, L.u)((0, P._)(this, O)) && 0 !== (0, P._)(this, O) && (0, j._)(this, g, V.U.setInterval(() => {
            (this.options.refetchIntervalInBackground || D.f.isFocused()) && (0, A._)(this, C, te).call(this)
        }, (0, P._)(this, O)))
    }

    function tr() {
        (0, A._)(this, S, ti).call(this), (0, A._)(this, M, tn).call(this, (0, A._)(this, k, ts).call(this))
    }

    function ta() {
        (0, P._)(this, m) && (V.U.clearTimeout((0, P._)(this, m)), (0, j._)(this, m, void 0))
    }

    function to() {
        (0, P._)(this, g) && (V.U.clearInterval((0, P._)(this, g)), (0, j._)(this, g, void 0))
    }

    function tl() {
        let t = (0, P._)(this, h).getQueryCache().build((0, P._)(this, h), this.options);
        if (t === (0, P._)(this, u)) return;
        let e = (0, P._)(this, u);
        (0, j._)(this, u, t), (0, j._)(this, c, t.state), this.hasListeners() && (null == e || e.removeObserver(this), t.addObserver(this))
    }

    function th(t) {
        I.f.batch(() => {
            t.listeners && this.listeners.forEach(t => {
                t((0, P._)(this, d))
            }), (0, P._)(this, h).getQueryCache().notify({
                query: (0, P._)(this, u),
                type: "observerResultsUpdated"
            })
        })
    }
    t.s(["f", 0, X], 230699)
}, 823255, t => {
    "use strict";
    var e, i = t.i(540949),
        s = t.i(28232),
        n = t.i(562442),
        r = t.i(323292),
        a = t.i(463146),
        o = (e = new WeakMap, class {
            destroy() {
                this.clearGcTimeout()
            }
            scheduleGc() {
                this.clearGcTimeout(), (0, a.u)(this.gcTime) && (0, n._)(this, e, r.U.setTimeout(() => {
                    this.optionalRemove()
                }, this.gcTime))
            }
            updateGcTime(t) {
                this.gcTime = Math.max(this.gcTime || 0, null != t ? t : a.l ? 1 / 0 : 3e5)
            }
            clearGcTimeout() {
                (0, i._)(this, e) && (r.U.clearTimeout((0, i._)(this, e)), (0, n._)(this, e, void 0))
            }
            constructor() {
                (0, s._)(this, e, {
                    writable: !0,
                    value: void 0
                })
            }
        });
    t.s(["f", 0, o])
}, 397740, 458330, 679986, t => {
    "use strict";
    var e, i, s, n = t.i(461736),
        r = t.i(540949),
        a = t.i(28232),
        o = t.i(562442),
        l = t.i(455596),
        h = t.i(463146),
        u = new(e = new WeakMap, i = new WeakMap, s = new WeakMap, class extends l.f {
            onSubscribe() {
                (0, r._)(this, i) || this.setEventListener((0, r._)(this, s))
            }
            onUnsubscribe() {
                var t;
                this.hasListeners() || (null == (t = (0, r._)(this, i)) || t.call(this), (0, o._)(this, i, void 0))
            }
            setEventListener(t) {
                var e;
                (0, o._)(this, s, t), null == (e = (0, r._)(this, i)) || e.call(this), (0, o._)(this, i, t(this.setOnline.bind(this)))
            }
            setOnline(t) {
                (0, r._)(this, e) !== t && ((0, o._)(this, e, t), this.listeners.forEach(e => {
                    e(t)
                }))
            }
            isOnline() {
                return (0, r._)(this, e)
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
                    if (!h.l && window.addEventListener) {
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

    function f(t) {
        return (null != t ? t : "online") !== "online" || u.isOnline()
    }
    t.s(["f", 0, u], 458330), t.s(["f", 0, c], 679986);
    var p = class extends Error {
        constructor(t) {
            super("CancelledError"), this.revert = null == t ? void 0 : t.revert, this.silent = null == t ? void 0 : t.silent
        }
    };
    t.s(["x", 0, p, "e", 0, f, "v", 0, function(t) {
        let e, i = !1,
            s = 0,
            r = c(),
            a = () => n.f.isFocused() && ("always" === t.networkMode || u.isOnline()) && t.canRun(),
            o = () => f(t.networkMode) && t.canRun(),
            l = t => {
                "pending" === r.status && (null == e || e(), r.resolve(t))
            },
            v = t => {
                "pending" === r.status && (null == e || e(), r.reject(t))
            },
            _ = () => new Promise(i => {
                var s;
                e = t => {
                    ("pending" !== r.status || a()) && i(t)
                }, null == (s = t.onPause) || s.call(t)
            }).then(() => {
                if (e = void 0, "pending" === r.status) {
                    var i;
                    null == (i = t.onContinue) || i.call(t)
                }
            }),
            y = () => {
                let e;
                if ("pending" !== r.status) return;
                let n = 0 === s ? t.initialPromise : void 0;
                try {
                    e = null != n ? n : t.fn()
                } catch (t) {
                    e = Promise.reject(t)
                }
                Promise.resolve(e).then(l).catch(e => {
                    var n, o, l;
                    if ("pending" !== r.status) return;
                    let u = null != (n = t.retry) ? n : 3 * !h.l,
                        c = null != (o = t.retryDelay) ? o : d,
                        f = "function" == typeof c ? c(s, e) : c,
                        p = !0 === u || "number" == typeof u && s < u || "function" == typeof u && u(s, e);
                    i || !p ? v(e) : (s++, null == (l = t.onFail) || l.call(t, s, e), (0, h.s)(f).then(() => a() ? void 0 : _()).then(() => {
                        i ? v(e) : y()
                    }))
                })
            };
        return {
            promise: r,
            status: () => r.status,
            cancel: e => {
                if ("pending" === r.status) {
                    var i;
                    let s = new p(e);
                    v(s), null == (i = t.onCancel) || i.call(t, s)
                }
            },
            continue: () => (null == e || e(), r),
            cancelRetry: () => {
                i = !0
            },
            continueRetry: () => {
                i = !1
            },
            canStart: o,
            start: () => (o() ? y() : _().then(y), r)
        }
    }], 397740)
}, 455596, t => {
    "use strict";
    t.s(["f", 0, class {
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
}, 323292, t => {
    "use strict";
    var e, i, s = t.i(540949),
        n = t.i(28232),
        r = t.i(562442),
        a = {
            setTimeout: (t, e) => setTimeout(t, e),
            clearTimeout: t => clearTimeout(t),
            setInterval: (t, e) => setInterval(t, e),
            clearInterval: t => clearInterval(t)
        },
        o = new(e = new WeakMap, i = new WeakMap, class {
            setTimeoutProvider(t) {
                (0, r._)(this, e, t)
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
                (0, n._)(this, e, {
                    writable: !0,
                    value: a
                }), (0, n._)(this, i, {
                    writable: !0,
                    value: !1
                })
            }
        });
    t.s(["T", 0, function(t) {
        setTimeout(t, 0)
    }, "U", 0, o])
}, 463146, t => {
    "use strict";
    var e = t.i(323292),
        i = "Deno" in globalThis;

    function s(t, e) {
        return ((null == e ? void 0 : e.queryKeyHashFn) || n)(t)
    }

    function n(t) {
        return JSON.stringify(t, (t, e) => h(e) ? Object.keys(e).sort().reduce((t, i) => (t[i] = e[i], t), {}) : e)
    }

    function r(t, e) {
        return t === e || typeof t == typeof e && !!t && !!e && "object" == typeof t && "object" == typeof e && Object.keys(e).every(i => r(t[i], e[i]))
    }
    var a = Object.prototype.hasOwnProperty;

    function o(t, e) {
        if (t === e) return t;
        let i = l(t) && l(e);
        if (!i && !(h(t) && h(e))) return e;
        let s = (i ? t : Object.keys(t)).length,
            n = i ? e : Object.keys(e),
            r = n.length,
            u = i ? Array(r) : {},
            c = 0;
        for (let l = 0; l < r; l++) {
            let r = i ? l : n[l],
                h = t[r],
                d = e[r];
            if (h === d) {
                u[r] = h, (i ? l < s : a.call(t, r)) && c++;
                continue
            }
            if (null === h || null === d || "object" != typeof h || "object" != typeof d) {
                u[r] = d;
                continue
            }
            let f = o(h, d);
            u[r] = f, f === h && c++
        }
        return s === r && c === s ? t : u
    }

    function l(t) {
        return Array.isArray(t) && t.length === Object.keys(t).length
    }

    function h(t) {
        if (!u(t)) return !1;
        let e = t.constructor;
        if (void 0 === e) return !0;
        let i = e.prototype;
        return !!u(i) && !!i.hasOwnProperty("isPrototypeOf") && Object.getPrototypeOf(t) === Object.prototype
    }

    function u(t) {
        return "[object Object]" === Object.prototype.toString.call(t)
    }
    var c = Symbol();
    t.s(["E", 0, function(t, e) {
        let i = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 0,
            s = [...t, e];
        return i && s.length > i ? s.slice(1) : s
    }, "R", 0, function(t, e) {
        let i = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 0,
            s = [e, ...t];
        return i && s.length > i ? s.slice(0, -1) : s
    }, "W", 0, function(t, e) {
        return !t.queryFn && (null == e ? void 0 : e.initialPromise) ? () => e.initialPromise : t.queryFn && t.queryFn !== c ? t.queryFn : () => Promise.reject(Error("Missing queryFn: '".concat(t.queryHash, "'")))
    }, "b", 0, function(t, e) {
        return "function" == typeof t ? t(e) : t
    }, "q", 0, n, "J", 0, s, "l", 0, i, "u", 0, function(t) {
        return "number" == typeof t && t >= 0 && 1 / 0 !== t
    }, "y", 0, function(t) {
        return t
    }, "L", 0, function(t, e) {
        let {
            exact: i,
            status: s,
            predicate: a,
            mutationKey: o
        } = t;
        if (o) {
            if (!e.options.mutationKey) return !1;
            if (i) {
                if (n(e.options.mutationKey) !== n(o)) return !1
            } else if (!r(e.options.mutationKey, o)) return !1
        }
        return (!s || e.state.status === s) && (!a || !!a(e))
    }, "N", 0, function(t, e) {
        let {
            type: i = "all",
            exact: n,
            fetchStatus: a,
            predicate: o,
            queryKey: l,
            stale: h
        } = t;
        if (l) {
            if (n) {
                if (e.queryHash !== s(l, e.options)) return !1
            } else if (!r(e.queryKey, l)) return !1
        }
        if ("all" !== i) {
            let t = e.isActive();
            if ("active" === i && !t || "inactive" === i && t) return !1
        }
        return ("boolean" != typeof h || e.isStale() === h) && (!a || a === e.state.fetchStatus) && (!o || !!o(e))
    }, "z", 0, function() {}, "P", 0, r, "M", 0, function(t, e, i) {
        return "function" == typeof i.structuralSharing ? i.structuralSharing(t, e) : !1 !== i.structuralSharing ? o(t, e) : e
    }, "B", 0, o, "O", 0, function(t, e) {
        return "function" == typeof t ? t(e) : t
    }, "H", 0, function(t, e) {
        return "function" == typeof t ? t(e) : t
    }, "U", 0, function(t, e) {
        if (!e || Object.keys(t).length !== Object.keys(e).length) return !1;
        for (let i in t)
            if (t[i] !== e[i]) return !1;
        return !0
    }, "Z", 0, function(t, e) {
        return "function" == typeof t ? t(...e) : !!t
    }, "V", 0, c, "s", 0, function(t) {
        return new Promise(i => {
            e.U.setTimeout(i, t)
        })
    }, "C", 0, function(t, e) {
        return Math.max(t + (e || 0) - Date.now(), 0)
    }])
}, 870849, t => {
    "use strict";
    var e = t.i(643766),
        i = e.createContext(!1);
    i.Provider, t.s(["f", 0, () => e.useContext(i)])
}, 228096, t => {
    "use strict";
    var e = t.i(643766),
        i = t.i(785517),
        s = e.createContext(void 0);
    t.s(["P", 0, t => {
        let {
            client: n,
            children: r
        } = t;
        return e.useEffect(() => (n.mount(), () => {
            n.unmount()
        }), [n]), (0, i.jsx)(s.Provider, {
            value: n,
            children: r
        })
    }, "d", 0, t => {
        let i = e.useContext(s);
        if (t) return t;
        if (!i) throw Error("No QueryClient set, use QueryClientProvider to set one");
        return i
    }])
}, 590490, 657076, t => {
    "use strict";
    let e;
    var i = t.i(643766);
    t.i(785517);
    var s = i.createContext((e = !1, {
        clearReset: () => {
            e = !1
        },
        reset: () => {
            e = !0
        },
        isReset: () => e
    }));
    t.s(["f", 0, () => i.useContext(s)], 590490);
    var n = t.i(463146);
    t.s(["l", 0, (t, e) => {
        (t.suspense || t.throwOnError || t.experimental_prefetchInRender) && !e.isReset() && (t.retryOnMount = !1)
    }, "P", 0, t => {
        let {
            result: e,
            errorResetBoundary: i,
            throwOnError: s,
            query: r,
            suspense: a
        } = t;
        return e.isError && !i.isReset() && !e.isFetching && r && (a && void 0 === e.data || (0, n.Z)(s, [e.error, r]))
    }, "E", 0, t => {
        i.useEffect(() => {
            t.clearReset()
        }, [t])
    }], 657076)
}, 910272, 776191, 154152, t => {
    "use strict";
    var e = t.i(230699),
        i = t.i(643766),
        s = t.i(463146),
        n = t.i(176522),
        r = t.i(228096),
        a = t.i(590490),
        o = t.i(657076),
        l = t.i(870849),
        h = t => {
            if (t.suspense) {
                let e = t => "static" === t ? t : Math.max(null != t ? t : 1e3, 1e3),
                    i = t.staleTime;
                t.staleTime = "function" == typeof i ? function() {
                    for (var t = arguments.length, s = Array(t), n = 0; n < t; n++) s[n] = arguments[n];
                    return e(i(...s))
                } : e(i), "number" == typeof t.gcTime && (t.gcTime = Math.max(t.gcTime, 1e3))
            }
        },
        u = (t, e) => t.isLoading && t.isFetching && !e,
        c = (t, e) => (null == t ? void 0 : t.suspense) && e.isPending,
        d = (t, e, i) => e.fetchOptimistic(t).catch(() => {
            i.clearReset()
        });

    function f(t, e, f) {
        var p, v, _, y, b;
        let w = (0, l.f)(),
            m = (0, a.f)(),
            g = (0, r.d)(f),
            O = g.defaultQueryOptions(t);
        null == (v = g.getDefaultOptions().queries) || null == (p = v._experimental_beforeQuery) || p.call(v, O), O._optimisticResults = w ? "isRestoring" : "optimistic", h(O), (0, o.l)(O, m), (0, o.E)(m);
        let R = !g.getQueryCache().get(O.queryHash),
            [C] = i.useState(() => new e(g, O)),
            S = C.getOptimisticResult(O),
            k = !w && !1 !== t.subscribed;
        if (i.useSyncExternalStore(i.useCallback(t => {
                let e = k ? C.subscribe(n.f.batchCalls(t)) : s.z;
                return C.updateResult(), e
            }, [C, k]), () => C.getCurrentResult(), () => C.getCurrentResult()), i.useEffect(() => {
                C.setOptions(O)
            }, [O, C]), c(O, S)) throw d(O, C, m);
        if ((0, o.P)({
                result: S,
                errorResetBoundary: m,
                throwOnError: O.throwOnError,
                query: g.getQueryCache().get(O.queryHash),
                suspense: O.suspense
            })) throw S.error;
        if (null == (y = g.getDefaultOptions().queries) || null == (_ = y._experimental_afterQuery) || _.call(y, O, S), O.experimental_prefetchInRender && !s.l && u(S, w)) {
            let t = R ? d(O, C, m) : null == (b = g.getQueryCache().get(O.queryHash)) ? void 0 : b.promise;
            null == t || t.catch(s.z).finally(() => {
                C.updateResult()
            })
        }
        return O.notifyOnChangeProps ? S : C.trackResult(S)
    }
    t.s(["A", 0, (t, e) => void 0 === e.state.data, "p", 0, h, "X", 0, d, "Q", 0, c, "t", 0, u], 776191), t.s(["f", 0, f], 154152), t.s(["f", 0, function(t, i) {
        return f(t, e.f, i)
    }], 910272)
}]);

//# debugId=29bd5646-424f-c7e7-06c3-f71f36f200d9
//# sourceMappingURL=04_d4j7cmnpbp.js.map