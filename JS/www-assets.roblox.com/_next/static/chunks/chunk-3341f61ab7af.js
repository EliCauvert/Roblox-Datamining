;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "52d1a1d7-5008-a566-3cd5-879a0ccffcd9")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 305763, t => {
    "use strict";
    var e, i, s = t.i(376054),
        r = t.i(136927),
        n = t.i(550475),
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
}, 766271, t => {
    "use strict";
    var e = t.i(305763),
        i = "u" < typeof window || "Deno" in globalThis;

    function s(t, e) {
        return (e?.queryKeyHashFn || r)(t)
    }

    function r(t) {
        return JSON.stringify(t, (t, e) => h(e) ? Object.keys(e).sort().reduce((t, i) => (t[i] = e[i], t), {}) : e)
    }

    function n(t, e) {
        return t === e || typeof t == typeof e && !!t && !!e && "object" == typeof t && "object" == typeof e && Object.keys(e).every(i => n(t[i], e[i]))
    }
    var a = Object.prototype.hasOwnProperty;

    function o(t, e) {
        let i = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 0;
        if (t === e) return t;
        if (i > 500) return e;
        let s = l(t) && l(e);
        if (!s && !(h(t) && h(e))) return e;
        let r = (s ? t : Object.keys(t)).length,
            n = s ? e : Object.keys(e),
            u = n.length,
            c = s ? Array(u) : {},
            d = 0;
        for (let l = 0; l < u; l++) {
            let h = s ? l : n[l],
                u = t[h],
                p = e[h];
            if (u === p) {
                c[h] = u, (s ? l < r : a.call(t, h)) && d++;
                continue
            }
            if (null === u || null === p || "object" != typeof u || "object" != typeof p) {
                c[h] = p;
                continue
            }
            let f = o(u, p, i + 1);
            c[h] = f, f === u && d++
        }
        return r === u && d === r ? t : c
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
    t.s(["addConsumeAwareSignal", 0, function(t, e, i) {
        let s, r = !1;
        return Object.defineProperty(t, "signal", {
            enumerable: !0,
            get: () => (s ??= e(), r || (r = !0, s.aborted ? i() : s.addEventListener("abort", i, {
                once: !0
            })), s)
        }), t
    }, "addToEnd", 0, function(t, e) {
        let i = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 0,
            s = [...t, e];
        return i && s.length > i ? s.slice(1) : s
    }, "addToStart", 0, function(t, e) {
        let i = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 0,
            s = [e, ...t];
        return i && s.length > i ? s.slice(0, -1) : s
    }, "ensureQueryFn", 0, function(t, e) {
        return !t.queryFn && e?.initialPromise ? () => e.initialPromise : t.queryFn && t.queryFn !== c ? t.queryFn : () => Promise.reject(Error(`Missing queryFn: '${t.queryHash}'`))
    }, "functionalUpdate", 0, function(t, e) {
        return "function" == typeof t ? t(e) : t
    }, "hashKey", 0, r, "hashQueryKeyByOptions", 0, s, "isServer", 0, i, "isValidTimeout", 0, function(t) {
        return "number" == typeof t && t >= 0 && t !== 1 / 0
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
            stale: h
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
        return ("boolean" != typeof h || e.isStale() === h) && (!a || a === e.state.fetchStatus) && (!o || !!o(e))
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
}, 42297, 474754, t => {
    "use strict";
    t.s(["_", 0, function(t, e, i) {
        if (!e.has(t)) throw TypeError("attempted to get private field on non-instance");
        return i
    }], 42297);
    var e = t.i(463075);
    t.s(["_", 0, function(t, i) {
        (0, e._)(t, i), i.add(t)
    }], 474754)
}, 259864, t => {
    "use strict";
    let e, i, s, r, n, a;
    var o = t.i(305763).systemSetTimeoutZero,
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
}, 578889, t => {
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
}, 82679, t => {
    "use strict";
    var e, i, s, r = t.i(376054),
        n = t.i(136927),
        a = t.i(550475),
        o = t.i(578889),
        l = t.i(766271),
        h = new(e = new WeakMap, i = new WeakMap, s = new WeakMap, class extends o.Subscribable {
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
                return "boolean" == typeof(0, r._)(this, e) ? (0, r._)(this, e) : globalThis.document?.visibilityState !== "hidden"
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
    t.s(["focusManager", 0, h])
}, 313805, 60045, 757142, t => {
    "use strict";
    var e, i, s, r = t.i(82679),
        n = t.i(376054),
        a = t.i(136927),
        o = t.i(550475),
        l = t.i(578889),
        h = t.i(766271),
        u = new(e = new WeakMap, i = new WeakMap, s = new WeakMap, class extends l.Subscribable {
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
                    if (!h.isServer && window.addEventListener) {
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
        return (t ?? "online") !== "online" || u.isOnline()
    }
    t.s(["onlineManager", 0, u], 60045), t.s(["pendingThenable", 0, c], 757142);
    var f = class extends Error {
        constructor(t) {
            super("CancelledError"), this.revert = t?.revert, this.silent = t?.silent
        }
    };
    t.s(["CancelledError", 0, f, "canFetch", 0, p, "createRetryer", 0, function(t) {
        let e, i = !1,
            s = 0,
            n = c(),
            a = () => r.focusManager.isFocused() && ("always" === t.networkMode || u.isOnline()) && t.canRun(),
            o = () => p(t.networkMode) && t.canRun(),
            l = t => {
                "pending" === n.status && (e?.(), n.resolve(t))
            },
            v = t => {
                "pending" === n.status && (e?.(), n.reject(t))
            },
            _ = () => new Promise(i => {
                e = t => {
                    ("pending" !== n.status || a()) && i(t)
                }, t.onPause?.()
            }).then(() => {
                e = void 0, "pending" === n.status && t.onContinue?.()
            }),
            b = () => {
                let e;
                if ("pending" !== n.status) return;
                let r = 0 === s ? t.initialPromise : void 0;
                try {
                    e = r ?? t.fn()
                } catch (t) {
                    e = Promise.reject(t)
                }
                Promise.resolve(e).then(l).catch(e => {
                    if ("pending" !== n.status) return;
                    let r = t.retry ?? 3 * !h.isServer,
                        o = t.retryDelay ?? d,
                        l = "function" == typeof o ? o(s, e) : o,
                        u = !0 === r || "number" == typeof r && s < r || "function" == typeof r && r(s, e);
                    i || !u ? v(e) : (s++, t.onFail?.(s, e), (0, h.sleep)(l).then(() => a() ? void 0 : _()).then(() => {
                        i ? v(e) : b()
                    }))
                })
            };
        return {
            promise: n,
            status: () => n.status,
            cancel: e => {
                if ("pending" === n.status) {
                    let i = new f(e);
                    v(i), t.onCancel?.(i)
                }
            },
            continue: () => (e?.(), n),
            cancelRetry: () => {
                i = !0
            },
            continueRetry: () => {
                i = !1
            },
            canStart: o,
            start: () => (o() ? b() : _().then(b), n)
        }
    }], 313805)
}, 539392, t => {
    "use strict";
    var e, i = t.i(376054),
        s = t.i(136927),
        r = t.i(550475),
        n = t.i(305763),
        a = t.i(766271),
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
                this.gcTime = Math.max(this.gcTime || 0, t ?? (a.isServer ? 1 / 0 : 3e5))
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
}, 877912, t => {
    "use strict";
    var e, i, s, r, n, a, o, l, h = t.i(376054),
        u = t.i(136927),
        c = t.i(550475),
        d = t.i(42297),
        p = t.i(474754),
        f = t.i(766271),
        v = t.i(259864),
        _ = t.i(313805),
        b = t.i(539392),
        y = (e = new WeakMap, i = new WeakMap, s = new WeakMap, r = new WeakMap, n = new WeakMap, a = new WeakMap, o = new WeakMap, l = new WeakSet, class extends b.Removable {
            get meta() {
                return this.options.meta
            }
            get promise() {
                return (0, h._)(this, n)?.promise
            }
            setOptions(t) {
                if (this.options = {
                        ...(0, h._)(this, a),
                        ...t
                    }, this.updateGcTime(this.options.gcTime), this.state && void 0 === this.state.data) {
                    let t = g(this.options);
                    void 0 !== t.data && (this.setState(w(t.data, t.dataUpdatedAt)), (0, c._)(this, e, t))
                }
            }
            optionalRemove() {
                this.observers.length || "idle" !== this.state.fetchStatus || (0, h._)(this, s).remove(this)
            }
            setData(t, e) {
                let i = (0, f.replaceData)(this.state.data, t, this.options);
                return (0, d._)(this, l, S).call(this, {
                    data: i,
                    type: "success",
                    dataUpdatedAt: e?.updatedAt,
                    manual: e?.manual
                }), i
            }
            setState(t, e) {
                (0, d._)(this, l, S).call(this, {
                    type: "setState",
                    state: t,
                    setStateOptions: e
                })
            }
            cancel(t) {
                let e = (0, h._)(this, n)?.promise;
                return (0, h._)(this, n)?.cancel(t), e ? e.then(f.noop).catch(f.noop) : Promise.resolve()
            }
            destroy() {
                super.destroy(), this.cancel({
                    silent: !0
                })
            }
            reset() {
                this.destroy(), this.setState((0, h._)(this, e))
            }
            isActive() {
                return this.observers.some(t => !1 !== (0, f.resolveEnabled)(t.options.enabled, this))
            }
            isDisabled() {
                return this.getObserversCount() > 0 ? !this.isActive() : this.options.queryFn === f.skipToken || this.state.dataUpdateCount + this.state.errorUpdateCount === 0
            }
            isStatic() {
                return this.getObserversCount() > 0 && this.observers.some(t => "static" === (0, f.resolveStaleTime)(t.options.staleTime, this))
            }
            isStale() {
                return this.getObserversCount() > 0 ? this.observers.some(t => t.getCurrentResult().isStale) : void 0 === this.state.data || this.state.isInvalidated
            }
            isStaleByTime() {
                let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : 0;
                return void 0 === this.state.data || "static" !== t && (!!this.state.isInvalidated || !(0, f.timeUntilStale)(this.state.dataUpdatedAt, t))
            }
            onFocus() {
                let t = this.observers.find(t => t.shouldFetchOnWindowFocus());
                t?.refetch({
                    cancelRefetch: !1
                }), (0, h._)(this, n)?.continue()
            }
            onOnline() {
                let t = this.observers.find(t => t.shouldFetchOnReconnect());
                t?.refetch({
                    cancelRefetch: !1
                }), (0, h._)(this, n)?.continue()
            }
            addObserver(t) {
                this.observers.includes(t) || (this.observers.push(t), this.clearGcTimeout(), (0, h._)(this, s).notify({
                    type: "observerAdded",
                    query: this,
                    observer: t
                }))
            }
            removeObserver(t) {
                this.observers.includes(t) && (this.observers = this.observers.filter(e => e !== t), this.observers.length || ((0, h._)(this, n) && ((0, h._)(this, o) ? (0, h._)(this, n).cancel({
                    revert: !0
                }) : (0, h._)(this, n).cancelRetry()), this.scheduleGc()), (0, h._)(this, s).notify({
                    type: "observerRemoved",
                    query: this,
                    observer: t
                }))
            }
            getObserversCount() {
                return this.observers.length
            }
            invalidate() {
                this.state.isInvalidated || (0, d._)(this, l, S).call(this, {
                    type: "invalidate"
                })
            }
            async fetch(t, e) {
                let a;
                if ("idle" !== this.state.fetchStatus && (0, h._)(this, n)?.status() !== "rejected") {
                    if (void 0 !== this.state.data && e?.cancelRefetch) this.cancel({
                        silent: !0
                    });
                    else if ((0, h._)(this, n)) return (0, h._)(this, n).continueRetry(), (0, h._)(this, n).promise
                }
                if (t && this.setOptions(t), !this.options.queryFn) {
                    let t = this.observers.find(t => t.options.queryFn);
                    t && this.setOptions(t.options)
                }
                let u = new AbortController,
                    p = t => {
                        Object.defineProperty(t, "signal", {
                            enumerable: !0,
                            get: () => ((0, c._)(this, o, !0), u.signal)
                        })
                    },
                    v = () => {
                        let t, i = (0, f.ensureQueryFn)(this.options, e),
                            s = (p(t = {
                                client: (0, h._)(this, r),
                                queryKey: this.queryKey,
                                meta: this.meta
                            }), t);
                        return ((0, c._)(this, o, !1), this.options.persister) ? this.options.persister(i, s, this) : i(s)
                    },
                    b = (p(a = {
                        fetchOptions: e,
                        options: this.options,
                        queryKey: this.queryKey,
                        client: (0, h._)(this, r),
                        state: this.state,
                        fetchFn: v
                    }), a);
                this.options.behavior?.onFetch(b, this), (0, c._)(this, i, this.state), ("idle" === this.state.fetchStatus || this.state.fetchMeta !== b.fetchOptions?.meta) && (0, d._)(this, l, S).call(this, {
                    type: "fetch",
                    meta: b.fetchOptions?.meta
                }), (0, c._)(this, n, (0, _.createRetryer)({
                    initialPromise: e?.initialPromise,
                    fn: b.fetchFn,
                    onCancel: t => {
                        t instanceof _.CancelledError && t.revert && this.setState({
                            ...(0, h._)(this, i),
                            fetchStatus: "idle"
                        }), u.abort()
                    },
                    onFail: (t, e) => {
                        (0, d._)(this, l, S).call(this, {
                            type: "failed",
                            failureCount: t,
                            error: e
                        })
                    },
                    onPause: () => {
                        (0, d._)(this, l, S).call(this, {
                            type: "pause"
                        })
                    },
                    onContinue: () => {
                        (0, d._)(this, l, S).call(this, {
                            type: "continue"
                        })
                    },
                    retry: b.options.retry,
                    retryDelay: b.options.retryDelay,
                    networkMode: b.options.networkMode,
                    canRun: () => !0
                }));
                try {
                    let t = await (0, h._)(this, n).start();
                    if (void 0 === t) throw Error(`${this.queryHash} data is undefined`);
                    return this.setData(t), (0, h._)(this, s).config.onSuccess?.(t, this), (0, h._)(this, s).config.onSettled?.(t, this.state.error, this), t
                } catch (t) {
                    if (t instanceof _.CancelledError) {
                        if (t.silent) return (0, h._)(this, n).promise;
                        else if (t.revert) {
                            if (void 0 === this.state.data) throw t;
                            return this.state.data
                        }
                    }
                    throw (0, d._)(this, l, S).call(this, {
                        type: "error",
                        error: t
                    }), (0, h._)(this, s).config.onError?.(t, this), (0, h._)(this, s).config.onSettled?.(this.state.data, t, this), t
                } finally {
                    this.scheduleGc()
                }
            }
            constructor(t) {
                super(), (0, p._)(this, l), (0, u._)(this, e, {
                    writable: !0,
                    value: void 0
                }), (0, u._)(this, i, {
                    writable: !0,
                    value: void 0
                }), (0, u._)(this, s, {
                    writable: !0,
                    value: void 0
                }), (0, u._)(this, r, {
                    writable: !0,
                    value: void 0
                }), (0, u._)(this, n, {
                    writable: !0,
                    value: void 0
                }), (0, u._)(this, a, {
                    writable: !0,
                    value: void 0
                }), (0, u._)(this, o, {
                    writable: !0,
                    value: void 0
                }), (0, c._)(this, o, !1), (0, c._)(this, a, t.defaultOptions), this.setOptions(t.options), this.observers = [], (0, c._)(this, r, t.client), (0, c._)(this, s, (0, h._)(this, r).getQueryCache()), this.queryKey = t.queryKey, this.queryHash = t.queryHash, (0, c._)(this, e, g(this.options)), this.state = t.state ?? (0, h._)(this, e), this.scheduleGc()
            }
        });

    function m(t, e) {
        return {
            fetchFailureCount: 0,
            fetchFailureReason: null,
            fetchStatus: (0, _.canFetch)(e.networkMode) ? "fetching" : "paused",
            ...void 0 === t && {
                error: null,
                status: "pending"
            }
        }
    }

    function w(t, e) {
        return {
            data: t,
            dataUpdatedAt: e ?? Date.now(),
            error: null,
            isInvalidated: !1,
            status: "success"
        }
    }

    function g(t) {
        let e = "function" == typeof t.initialData ? t.initialData() : t.initialData,
            i = void 0 !== e,
            s = i ? "function" == typeof t.initialDataUpdatedAt ? t.initialDataUpdatedAt() : t.initialDataUpdatedAt : 0;
        return {
            data: e,
            dataUpdateCount: 0,
            dataUpdatedAt: i ? s ?? Date.now() : 0,
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

    function S(t) {
        let e = e => {
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
                        ...e, ...m(e.data, this.options), fetchMeta: t.meta ?? null
                    };
                case "success":
                    let s = {
                        ...e,
                        ...w(t.data, t.dataUpdatedAt),
                        dataUpdateCount: e.dataUpdateCount + 1,
                        ...!t.manual && {
                            fetchStatus: "idle",
                            fetchFailureCount: 0,
                            fetchFailureReason: null
                        }
                    };
                    return (0, c._)(this, i, t.manual ? s : void 0), s;
                case "error":
                    let r = t.error;
                    return {
                        ...e, error: r, errorUpdateCount: e.errorUpdateCount + 1, errorUpdatedAt: Date.now(), fetchFailureCount: e.fetchFailureCount + 1, fetchFailureReason: r, fetchStatus: "idle", status: "error", isInvalidated: !0
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
        this.state = e(this.state), v.notifyManager.batch(() => {
            this.observers.forEach(t => {
                t.onQueryUpdate()
            }), (0, h._)(this, s).notify({
                query: this,
                type: "updated",
                action: t
            })
        })
    }
    t.s(["Query", 0, y, "fetchState", 0, m])
}, 391855, t => {
    "use strict";
    var e = t.i(420482),
        i = t.i(19836),
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
}, 708923, 414822, 653350, 997962, 373201, 322910, 389673, t => {
    "use strict";
    let e;
    var i, s, r, n, a, o, l, h, u, c, d, p, f, v, _, b, y, m, w, g, S, O, R, E, C = t.i(376054),
        T = t.i(136927),
        M = t.i(550475),
        k = t.i(42297),
        F = t.i(474754),
        U = t.i(82679),
        W = t.i(259864),
        j = t.i(877912),
        q = t.i(578889),
        P = t.i(757142),
        D = t.i(766271),
        Q = t.i(305763),
        A = (i = new WeakMap, s = new WeakMap, r = new WeakMap, n = new WeakMap, a = new WeakMap, o = new WeakMap, l = new WeakMap, h = new WeakMap, u = new WeakMap, c = new WeakMap, d = new WeakMap, p = new WeakMap, f = new WeakMap, v = new WeakMap, _ = new WeakMap, b = new WeakSet, y = new WeakSet, m = new WeakSet, w = new WeakSet, g = new WeakSet, S = new WeakSet, O = new WeakSet, R = new WeakSet, E = new WeakSet, class extends q.Subscribable {
            bindMethods() {
                this.refetch = this.refetch.bind(this)
            }
            onSubscribe() {
                1 === this.listeners.size && ((0, C._)(this, s).addObserver(this), I((0, C._)(this, s), this.options) ? (0, k._)(this, b, B).call(this) : this.updateResult(), (0, k._)(this, g, V).call(this))
            }
            onUnsubscribe() {
                this.hasListeners() || this.destroy()
            }
            shouldFetchOnReconnect() {
                return x((0, C._)(this, s), this.options, this.options.refetchOnReconnect)
            }
            shouldFetchOnWindowFocus() {
                return x((0, C._)(this, s), this.options, this.options.refetchOnWindowFocus)
            }
            destroy() {
                this.listeners = new Set, (0, k._)(this, S, z).call(this), (0, k._)(this, O, Z).call(this), (0, C._)(this, s).removeObserver(this)
            }
            setOptions(t) {
                let e = this.options,
                    r = (0, C._)(this, s);
                if (this.options = (0, C._)(this, i).defaultQueryOptions(t), void 0 !== this.options.enabled && "boolean" != typeof this.options.enabled && "function" != typeof this.options.enabled && "boolean" != typeof(0, D.resolveEnabled)(this.options.enabled, (0, C._)(this, s))) throw Error("Expected enabled to be a boolean or a callback that returns a boolean");
                (0, k._)(this, R, $).call(this), (0, C._)(this, s).setOptions(this.options), e._defaulted && !(0, D.shallowEqualObjects)(this.options, e) && (0, C._)(this, i).getQueryCache().notify({
                    type: "observerOptionsUpdated",
                    query: (0, C._)(this, s),
                    observer: this
                });
                let n = this.hasListeners();
                n && L((0, C._)(this, s), r, this.options, e) && (0, k._)(this, b, B).call(this), this.updateResult(), n && ((0, C._)(this, s) !== r || (0, D.resolveEnabled)(this.options.enabled, (0, C._)(this, s)) !== (0, D.resolveEnabled)(e.enabled, (0, C._)(this, s)) || (0, D.resolveStaleTime)(this.options.staleTime, (0, C._)(this, s)) !== (0, D.resolveStaleTime)(e.staleTime, (0, C._)(this, s))) && (0, k._)(this, y, H).call(this);
                let a = (0, k._)(this, m, G).call(this);
                n && ((0, C._)(this, s) !== r || (0, D.resolveEnabled)(this.options.enabled, (0, C._)(this, s)) !== (0, D.resolveEnabled)(e.enabled, (0, C._)(this, s)) || a !== (0, C._)(this, v)) && (0, k._)(this, w, N).call(this, a)
            }
            getOptimisticResult(t) {
                var e, r;
                let l = (0, C._)(this, i).getQueryCache().build((0, C._)(this, i), t),
                    h = this.createResult(l, t);
                return e = this, r = h, (0, D.shallowEqualObjects)(e.getCurrentResult(), r) || ((0, M._)(this, n, h), (0, M._)(this, o, this.options), (0, M._)(this, a, (0, C._)(this, s).state)), h
            }
            getCurrentResult() {
                return (0, C._)(this, n)
            }
            trackResult(t, e) {
                return new Proxy(t, {
                    get: (t, i) => (this.trackProp(i), e?.(i), "promise" === i && (this.trackProp("data"), this.options.experimental_prefetchInRender || "pending" !== (0, C._)(this, l).status || (0, C._)(this, l).reject(Error("experimental_prefetchInRender feature flag is not enabled"))), Reflect.get(t, i))
                })
            }
            trackProp(t) {
                (0, C._)(this, _).add(t)
            }
            getCurrentQuery() {
                return (0, C._)(this, s)
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
                let e = (0, C._)(this, i).defaultQueryOptions(t),
                    s = (0, C._)(this, i).getQueryCache().build((0, C._)(this, i), e);
                return s.fetch().then(() => this.createResult(s, e))
            }
            fetch(t) {
                return (0, k._)(this, b, B).call(this, {
                    ...t,
                    cancelRefetch: t.cancelRefetch ?? !0
                }).then(() => (this.updateResult(), (0, C._)(this, n)))
            }
            createResult(t, e) {
                let i, p = (0, C._)(this, s),
                    f = this.options,
                    v = (0, C._)(this, n),
                    _ = (0, C._)(this, a),
                    b = (0, C._)(this, o),
                    y = t !== p ? t.state : (0, C._)(this, r),
                    {
                        state: m
                    } = t,
                    w = {
                        ...m
                    },
                    g = !1;
                if (e._optimisticResults) {
                    let i = this.hasListeners(),
                        s = !i && I(t, e),
                        r = i && L(t, p, e, f);
                    (s || r) && (w = {
                        ...w,
                        ...(0, j.fetchState)(m.data, t.options)
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
                    v?.isPlaceholderData && e.placeholderData === b?.placeholderData ? (t = v.data, E = !0) : t = "function" == typeof e.placeholderData ? e.placeholderData((0, C._)(this, d)?.state.data, (0, C._)(this, d)) : e.placeholderData, void 0 !== t && (R = "success", i = (0, D.replaceData)(v?.data, t, e), g = !0)
                }
                if (e.select && void 0 !== i && !E)
                    if (v && i === _?.data && e.select === (0, C._)(this, u)) i = (0, C._)(this, c);
                    else try {
                        (0, M._)(this, u, e.select), i = e.select(i), i = (0, D.replaceData)(v?.data, i, e), (0, M._)(this, c, i), (0, M._)(this, h, null)
                    } catch (t) {
                        (0, M._)(this, h, t)
                    }(0, C._)(this, h) && (S = (0, C._)(this, h), i = (0, C._)(this, c), O = Date.now(), R = "error");
                let T = "fetching" === w.fetchStatus,
                    k = "pending" === R,
                    F = "error" === R,
                    U = k && T,
                    W = void 0 !== i,
                    q = {
                        status: R,
                        fetchStatus: w.fetchStatus,
                        isPending: k,
                        isSuccess: "success" === R,
                        isError: F,
                        isInitialLoading: U,
                        isLoading: U,
                        data: i,
                        dataUpdatedAt: w.dataUpdatedAt,
                        error: S,
                        errorUpdatedAt: O,
                        failureCount: w.fetchFailureCount,
                        failureReason: w.fetchFailureReason,
                        errorUpdateCount: w.errorUpdateCount,
                        isFetched: w.dataUpdateCount > 0 || w.errorUpdateCount > 0,
                        isFetchedAfterMount: w.dataUpdateCount > y.dataUpdateCount || w.errorUpdateCount > y.errorUpdateCount,
                        isFetching: T,
                        isRefetching: T && !k,
                        isLoadingError: F && !W,
                        isPaused: "paused" === w.fetchStatus,
                        isPlaceholderData: g,
                        isRefetchError: F && W,
                        isStale: K(t, e),
                        refetch: this.refetch,
                        promise: (0, C._)(this, l),
                        isEnabled: !1 !== (0, D.resolveEnabled)(e.enabled, t)
                    };
                if (this.options.experimental_prefetchInRender) {
                    let e = void 0 !== q.data,
                        i = "error" === q.status && !e,
                        s = t => {
                            i ? t.reject(q.error) : e && t.resolve(q.data)
                        },
                        r = () => {
                            s((0, M._)(this, l, q.promise = (0, P.pendingThenable)()))
                        },
                        n = (0, C._)(this, l);
                    switch (n.status) {
                        case "pending":
                            t.queryHash === p.queryHash && s(n);
                            break;
                        case "fulfilled":
                            (i || q.data !== n.value) && r();
                            break;
                        case "rejected":
                            i && q.error === n.reason || r()
                    }
                }
                return q
            }
            updateResult() {
                let t = (0, C._)(this, n),
                    e = this.createResult((0, C._)(this, s), this.options);
                if ((0, M._)(this, a, (0, C._)(this, s).state), (0, M._)(this, o, this.options), void 0 !== (0, C._)(this, a).data && (0, M._)(this, d, (0, C._)(this, s)), (0, D.shallowEqualObjects)(e, t)) return;
                (0, M._)(this, n, e);
                let i = () => {
                    if (!t) return !0;
                    let {
                        notifyOnChangeProps: e
                    } = this.options, i = "function" == typeof e ? e() : e;
                    if ("all" === i || !i && !(0, C._)(this, _).size) return !0;
                    let s = new Set(i ?? (0, C._)(this, _));
                    return this.options.throwOnError && s.add("error"), Object.keys((0, C._)(this, n)).some(e => (0, C._)(this, n)[e] !== t[e] && s.has(e))
                };
                (0, k._)(this, E, J).call(this, {
                    listeners: i()
                })
            }
            onQueryUpdate() {
                this.updateResult(), this.hasListeners() && (0, k._)(this, g, V).call(this)
            }
            constructor(t, e) {
                super(), (0, F._)(this, b), (0, F._)(this, y), (0, F._)(this, m), (0, F._)(this, w), (0, F._)(this, g), (0, F._)(this, S), (0, F._)(this, O), (0, F._)(this, R), (0, F._)(this, E), (0, T._)(this, i, {
                    writable: !0,
                    value: void 0
                }), (0, T._)(this, s, {
                    writable: !0,
                    value: void 0
                }), (0, T._)(this, r, {
                    writable: !0,
                    value: void 0
                }), (0, T._)(this, n, {
                    writable: !0,
                    value: void 0
                }), (0, T._)(this, a, {
                    writable: !0,
                    value: void 0
                }), (0, T._)(this, o, {
                    writable: !0,
                    value: void 0
                }), (0, T._)(this, l, {
                    writable: !0,
                    value: void 0
                }), (0, T._)(this, h, {
                    writable: !0,
                    value: void 0
                }), (0, T._)(this, u, {
                    writable: !0,
                    value: void 0
                }), (0, T._)(this, c, {
                    writable: !0,
                    value: void 0
                }), (0, T._)(this, d, {
                    writable: !0,
                    value: void 0
                }), (0, T._)(this, p, {
                    writable: !0,
                    value: void 0
                }), (0, T._)(this, f, {
                    writable: !0,
                    value: void 0
                }), (0, T._)(this, v, {
                    writable: !0,
                    value: void 0
                }), (0, T._)(this, _, {
                    writable: !0,
                    value: new Set
                }), this.options = e, (0, M._)(this, i, t), (0, M._)(this, h, null), (0, M._)(this, l, (0, P.pendingThenable)()), this.bindMethods(), this.setOptions(e)
            }
        });

    function I(t, e) {
        return !1 !== (0, D.resolveEnabled)(e.enabled, t) && void 0 === t.state.data && ("error" !== t.state.status || !1 !== e.retryOnMount) || void 0 !== t.state.data && x(t, e, e.refetchOnMount)
    }

    function x(t, e, i) {
        if (!1 !== (0, D.resolveEnabled)(e.enabled, t) && "static" !== (0, D.resolveStaleTime)(e.staleTime, t)) {
            let s = "function" == typeof i ? i(t) : i;
            return "always" === s || !1 !== s && K(t, e)
        }
        return !1
    }

    function L(t, e, i, s) {
        return (t !== e || !1 === (0, D.resolveEnabled)(s.enabled, t)) && (!i.suspense || "error" !== t.state.status) && K(t, i)
    }

    function K(t, e) {
        return !1 !== (0, D.resolveEnabled)(e.enabled, t) && t.isStaleByTime((0, D.resolveStaleTime)(e.staleTime, t))
    }

    function B(t) {
        (0, k._)(this, R, $).call(this);
        let e = (0, C._)(this, s).fetch(this.options, t);
        return t?.throwOnError || (e = e.catch(D.noop)), e
    }

    function H() {
        (0, k._)(this, S, z).call(this);
        let t = (0, D.resolveStaleTime)(this.options.staleTime, (0, C._)(this, s));
        if (D.isServer || (0, C._)(this, n).isStale || !(0, D.isValidTimeout)(t)) return;
        let e = (0, D.timeUntilStale)((0, C._)(this, n).dataUpdatedAt, t);
        (0, M._)(this, p, Q.timeoutManager.setTimeout(() => {
            (0, C._)(this, n).isStale || this.updateResult()
        }, e + 1))
    }

    function G() {
        return ("function" == typeof this.options.refetchInterval ? this.options.refetchInterval((0, C._)(this, s)) : this.options.refetchInterval) ?? !1
    }

    function N(t) {
        (0, k._)(this, O, Z).call(this), (0, M._)(this, v, t), !D.isServer && !1 !== (0, D.resolveEnabled)(this.options.enabled, (0, C._)(this, s)) && (0, D.isValidTimeout)((0, C._)(this, v)) && 0 !== (0, C._)(this, v) && (0, M._)(this, f, Q.timeoutManager.setInterval(() => {
            (this.options.refetchIntervalInBackground || U.focusManager.isFocused()) && (0, k._)(this, b, B).call(this)
        }, (0, C._)(this, v)))
    }

    function V() {
        (0, k._)(this, y, H).call(this), (0, k._)(this, w, N).call(this, (0, k._)(this, m, G).call(this))
    }

    function z() {
        (0, C._)(this, p) && (Q.timeoutManager.clearTimeout((0, C._)(this, p)), (0, M._)(this, p, void 0))
    }

    function Z() {
        (0, C._)(this, f) && (Q.timeoutManager.clearInterval((0, C._)(this, f)), (0, M._)(this, f, void 0))
    }

    function $() {
        let t = (0, C._)(this, i).getQueryCache().build((0, C._)(this, i), this.options);
        if (t === (0, C._)(this, s)) return;
        let e = (0, C._)(this, s);
        (0, M._)(this, s, t), (0, M._)(this, r, t.state), this.hasListeners() && (e?.removeObserver(this), t.addObserver(this))
    }

    function J(t) {
        W.notifyManager.batch(() => {
            t.listeners && this.listeners.forEach(t => {
                t((0, C._)(this, n))
            }), (0, C._)(this, i).getQueryCache().notify({
                query: (0, C._)(this, s),
                type: "observerResultsUpdated"
            })
        })
    }
    t.s(["QueryObserver", 0, A], 414822), t.i(737344);
    var X = t.i(420482),
        Y = t.i(391855);
    t.i(19836);
    var tt = X.createContext((e = !1, {
            clearReset: () => {
                e = !1
            },
            reset: () => {
                e = !0
            },
            isReset: () => e
        })),
        te = () => X.useContext(tt);
    t.s(["useQueryErrorResetBoundary", 0, te], 653350);
    var ti = (t, e, i) => {
            let s = (null == i ? void 0 : i.state.error) && "function" == typeof t.throwOnError ? (0, D.shouldThrowError)(t.throwOnError, [i.state.error, i]) : t.throwOnError;
            (t.suspense || t.experimental_prefetchInRender || s) && !e.isReset() && (t.retryOnMount = !1)
        },
        ts = t => {
            X.useEffect(() => {
                t.clearReset()
            }, [t])
        },
        tr = t => {
            let {
                result: e,
                errorResetBoundary: i,
                throwOnError: s,
                query: r,
                suspense: n
            } = t;
            return e.isError && !i.isReset() && !e.isFetching && r && (n && void 0 === e.data || (0, D.shouldThrowError)(s, [e.error, r]))
        };
    t.s(["ensurePreventErrorBoundaryRetry", 0, ti, "getHasError", 0, tr, "useClearResetErrorBoundary", 0, ts], 997962);
    var tn = X.createContext(!1),
        ta = () => X.useContext(tn);
    tn.Provider, t.s(["useIsRestoring", 0, ta], 373201);
    var to = t => {
            if (t.suspense) {
                let e = t => "static" === t ? t : Math.max(t ?? 1e3, 1e3),
                    i = t.staleTime;
                t.staleTime = "function" == typeof i ? function() {
                    for (var t = arguments.length, s = Array(t), r = 0; r < t; r++) s[r] = arguments[r];
                    return e(i(...s))
                } : e(i), "number" == typeof t.gcTime && (t.gcTime = Math.max(t.gcTime, 1e3))
            }
        },
        tl = (t, e) => t.isLoading && t.isFetching && !e,
        th = (t, e) => (null == t ? void 0 : t.suspense) && e.isPending,
        tu = (t, e, i) => e.fetchOptimistic(t).catch(() => {
            i.clearReset()
        });

    function tc(t, e, i) {
        var s, r, n, a;
        let o = ta(),
            l = te(),
            h = (0, Y.useQueryClient)(i),
            u = h.defaultQueryOptions(t);
        null == (r = null == (s = h.getDefaultOptions().queries) ? void 0 : s._experimental_beforeQuery) || r.call(s, u);
        let c = h.getQueryCache().get(u.queryHash);
        u._optimisticResults = o ? "isRestoring" : "optimistic", to(u), ti(u, l, c), ts(l);
        let d = !h.getQueryCache().get(u.queryHash),
            [p] = X.useState(() => new e(h, u)),
            f = p.getOptimisticResult(u),
            v = !o && !1 !== t.subscribed;
        if (X.useSyncExternalStore(X.useCallback(t => {
                let e = v ? p.subscribe(W.notifyManager.batchCalls(t)) : D.noop;
                return p.updateResult(), e
            }, [p, v]), () => p.getCurrentResult(), () => p.getCurrentResult()), X.useEffect(() => {
                p.setOptions(u)
            }, [u, p]), th(u, f)) throw tu(u, p, l);
        if (tr({
                result: f,
                errorResetBoundary: l,
                throwOnError: u.throwOnError,
                query: c,
                suspense: u.suspense
            })) throw f.error;
        if (null == (a = null == (n = h.getDefaultOptions().queries) ? void 0 : n._experimental_afterQuery) || a.call(n, u, f), u.experimental_prefetchInRender && !D.isServer && tl(f, o)) {
            let t = d ? tu(u, p, l) : null == c ? void 0 : c.promise;
            null == t || t.catch(D.noop).finally(() => {
                p.updateResult()
            })
        }
        return u.notifyOnChangeProps ? f : p.trackResult(f)
    }
    t.s(["ensureSuspenseTimers", 0, to, "fetchOptimistic", 0, tu, "shouldSuspend", 0, th, "willFetch", 0, tl], 322910), t.s(["useBaseQuery", 0, tc], 389673), t.s(["useQuery", 0, function(t, e) {
        return tc(t, A, e)
    }], 708923)
}]);

//# debugId=52d1a1d7-5008-a566-3cd5-879a0ccffcd9
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0fmy_ydqxqob2.js.map