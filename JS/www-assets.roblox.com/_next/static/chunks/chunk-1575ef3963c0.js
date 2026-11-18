;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "6b6ba246-b3bb-f266-3c38-b1b36cea99f5")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 348225, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "setAttributesFromProps", {
        enumerable: !0,
        get: function() {
            return o
        }
    });
    let n = {
            acceptCharset: "accept-charset",
            className: "class",
            htmlFor: "for",
            httpEquiv: "http-equiv",
            noModule: "noModule"
        },
        a = ["onLoad", "onReady", "dangerouslySetInnerHTML", "children", "onError", "strategy", "stylesheets"];

    function i(e) {
        return ["async", "defer", "noModule"].includes(e)
    }

    function o(e, t) {
        for (let [r, o] of Object.entries(t)) {
            if (!t.hasOwnProperty(r) || a.includes(r) || void 0 === o) continue;
            let s = n[r] || r.toLowerCase();
            "SCRIPT" === e.tagName && i(s) ? e[s] = !!o : e.setAttribute(s, String(o)), (!1 === o || "SCRIPT" === e.tagName && i(s) && (!o || "false" === o)) && (e.setAttribute(s, ""), e.removeAttribute(s))
        }
    }("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 709143, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        getObjectClassLabel: function() {
            return i
        },
        isPlainObject: function() {
            return o
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });

    function i(e) {
        return Object.prototype.toString.call(e)
    }

    function o(e) {
        if ("[object Object]" !== i(e)) return !1;
        let t = Object.getPrototypeOf(e);
        return null === t || t.hasOwnProperty("isPrototypeOf")
    }
}, 939190, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        default: function() {
            return o
        },
        getProperError: function() {
            return s
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });
    let i = e.r(709143);

    function o(e) {
        return "object" == typeof e && null !== e && "name" in e && "message" in e
    }

    function s(e) {
        let t;
        return o(e) ? e : Object.defineProperty(Error((0, i.isPlainObject)(e) ? (t = new WeakSet, JSON.stringify(e, (e, r) => {
            if ("object" == typeof r && null !== r) {
                if (t.has(r)) return "[Circular]";
                t.add(r)
            }
            return r
        })) : e + ""), "__NEXT_ERROR_CODE", {
            value: "E394",
            enumerable: !1,
            configurable: !0
        })
    }
}, 947550, e => {
    "use strict";
    var t = e.i(58833);

    function r(e) {
        let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : (0, t.safeDateNow)(),
            n = parseInt(`${e}`, 10);
        if (!isNaN(n)) return 1e3 * n;
        let a = Date.parse(`${e}`);
        return isNaN(a) ? 6e4 : a - r
    }
    e.s(["isRateLimited", 0, function(e, r) {
        let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : (0, t.safeDateNow)();
        return (e[r] || e.all || 0) > n
    }, "parseRetryAfterHeader", 0, r, "updateRateLimits", 0, function(e, n) {
        let {
            statusCode: a,
            headers: i
        } = n, o = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : (0, t.safeDateNow)(), s = {
            ...e
        }, l = i?.["x-sentry-rate-limits"], u = i?.["retry-after"];
        if (l)
            for (let e of l.trim().split(",")) {
                let [t, r, , , n] = e.split(":", 5), a = parseInt(t, 10), i = (isNaN(a) ? 60 : a) * 1e3;
                if (r)
                    for (let e of r.split(";")) "metric_bucket" === e ? (!n || n.split(";").includes("custom")) && (s[e] = o + i) : s[e] = o + i;
                else s.all = o + i
            } else u ? s.all = o + r(u, o) : 429 === a && (s.all = o + 6e4);
        return s
    }])
}, 789189, e => {
    "use strict";
    e.s(["safeUnref", 0, function(e) {
        return "object" == typeof e && "function" == typeof e.unref && e.unref(), e
    }])
}, 606218, e => {
    "use strict";
    var t = e.i(131810),
        r = e.i(695524),
        n = e.i(227668),
        a = e.i(947550),
        i = e.i(789189);
    e.s(["makeOfflineTransport", 0, function(e) {
        function o() {
            for (var e = arguments.length, n = Array(e), a = 0; a < e; a++) n[a] = arguments[a];
            t.DEBUG_BUILD && r.debug.log("[Offline]:", ...n)
        }
        return t => {
            let r, s = e(t);
            if (!t.createStore) throw Error("No `createStore` function was provided");
            let l = t.createStore(t),
                u = 5e3;

            function c(e) {
                r && clearTimeout(r), r = (0, i.safeUnref)(setTimeout(async () => {
                    r = void 0;
                    let e = await l.shift();
                    e && (o("Attempting to send previously queued event"), e[0].sent_at = new Date().toISOString(), p(e, !0).catch(e => {
                        o("Failed to retry sending", e)
                    }))
                }, e))
            }

            function d() {
                r || (c(u), u = Math.min(2 * u, 36e5))
            }
            async function p(e) {
                let r = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                if (!r && (0, n.envelopeContainsItemType)(e, ["replay_event", "replay_recording"])) return await l.push(e), c(100), {};
                try {
                    if (t.shouldSend && await t.shouldSend(e) === !1) throw Error("Envelope not sent because `shouldSend` callback returned false");
                    let r = await s.send(e),
                        n = 100;
                    if (r) {
                        if (r.headers?.["retry-after"]) n = (0, a.parseRetryAfterHeader)(r.headers["retry-after"]);
                        else if (r.headers?.["x-sentry-rate-limits"]) n = 6e4;
                        else if ((r.statusCode || 0) >= 400) return r
                    }
                    return c(n), u = 5e3, r
                } catch (a) {
                    var i;
                    if (await (i = u, !(0, n.envelopeContainsItemType)(e, ["client_report"]) && (!t.shouldStore || t.shouldStore(e, a, i)))) return r ? await l.unshift(e) : await l.push(e), d(), o("Error sending. Event queued.", a), {};
                    throw a
                }
            }
            return t.flushAtStartup && d(), {
                send: p,
                flush: e => (void 0 === e && (u = 5e3, c(100)), s.flush(e))
            }
        }
    }])
}, 298219, e => {
    "use strict";
    var t = e.i(471903),
        r = e.i(789189);
    let n = Symbol.for("SentryBufferFullError");
    e.s(["SENTRY_BUFFER_FULL_ERROR", 0, n, "makePromiseBuffer", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : 100,
            a = new Set;
        return {
            get $() {
                return Array.from(a)
            },
            add: function(r) {
                if (!(a.size < e)) return (0, t.rejectedSyncPromise)(n);
                let i = r();
                return a.add(i), i.then(() => {
                    a.delete(i)
                }, () => {
                    a.delete(i)
                }), i
            },
            drain: function(e) {
                if (!a.size) return (0, t.resolvedSyncPromise)(!0);
                let n = Promise.allSettled(Array.from(a)).then(() => !0);
                return e ? Promise.race([n, new Promise(t => (0, r.safeUnref)(setTimeout(() => t(!1), e)))]) : n
            }
        }
    }])
}, 594077, e => {
    "use strict";
    var t = e.i(131810),
        r = e.i(695524),
        n = e.i(227668),
        a = e.i(298219),
        i = e.i(947550);
    e.s(["DEFAULT_TRANSPORT_BUFFER_SIZE", 0, 64, "createTransport", 0, function(e, o) {
        let s = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : (0, a.makePromiseBuffer)(e.bufferSize || 64),
            l = {};
        return {
            send: function(u) {
                let c = [];
                if ((0, n.forEachEnvelopeItem)(u, (t, r) => {
                        let a = (0, n.envelopeItemTypeToDataCategory)(r);
                        (0, i.isRateLimited)(l, a) ? e.recordDroppedEvent("ratelimit_backoff", a): c.push(t)
                    }), 0 === c.length) return Promise.resolve({});
                let d = (0, n.createEnvelope)(u[0], c),
                    p = a => {
                        if ((0, n.envelopeContainsItemType)(d, ["client_report"])) {
                            t.DEBUG_BUILD && r.debug.warn(`Dropping client report. Will not send outcomes (reason: ${a}).`);
                            return
                        }(0, n.forEachEnvelopeItem)(d, (t, r) => {
                            e.recordDroppedEvent(a, (0, n.envelopeItemTypeToDataCategory)(r))
                        })
                    };
                return s.add(() => o({
                    body: (0, n.serializeEnvelope)(d)
                }).then(e => (413 === e.statusCode ? (t.DEBUG_BUILD && r.debug.error("Sentry responded with status code 413. Envelope was discarded due to exceeding size limits."), p("send_error")) : (t.DEBUG_BUILD && void 0 !== e.statusCode && (e.statusCode < 200 || e.statusCode >= 300) && r.debug.warn(`Sentry responded with status code ${e.statusCode} to sent event.`), l = (0, i.updateRateLimits)(l, e)), e), e => {
                    throw p("network_error"), t.DEBUG_BUILD && r.debug.error("Encountered error running transport request:", e), e
                })).then(e => e, e => {
                    if (e === a.SENTRY_BUFFER_FULL_ERROR) return t.DEBUG_BUILD && r.debug.error("Skipped sending event because buffer is full."), p("queue_overflow"), Promise.resolve({});
                    throw e
                })
            },
            flush: e => s.drain(e)
        }
    }])
}, 398720, e => {
    "use strict";
    var t = e.i(131810),
        r = e.i(695524);
    let n = e.i(204078).GLOBAL_OBJ;

    function a(e) {
        return e && /^function\s+\w+\(\)\s+\{\s+\[native code\]\s+\}$/.test(e.toString())
    }
    e.s(["isNativeFunction", 0, a, "supportsHistory", 0, function() {
        return "history" in n && !!n.history
    }, "supportsNativeFetch", 0, function() {
        if ("string" == typeof EdgeRuntime) return !0;
        if (! function() {
                if (!("fetch" in n)) return !1;
                try {
                    return new Headers, new Request("data:,"), new Response, !0
                } catch {
                    return !1
                }
            }()) return !1;
        if (a(n.fetch)) return !0;
        let e = !1,
            i = n.document;
        if (i && "function" == typeof i.createElement) try {
            let t = i.createElement("iframe");
            t.hidden = !0, i.head.appendChild(t), t.contentWindow?.fetch && (e = a(t.contentWindow.fetch)), i.head.removeChild(t)
        } catch (e) {
            t.DEBUG_BUILD && r.debug.warn("Could not create sandbox iframe for pure fetch check, bailing to window.fetch: ", e)
        }
        return e
    }, "supportsReportingObserver", 0, function() {
        return "ReportingObserver" in n
    }])
}, 741655, e => {
    "use strict";
    let t = "u" < typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__;
    e.s(["DEBUG_BUILD", 0, t])
}, 845068, e => {
    "use strict";
    let t = e.i(204078).GLOBAL_OBJ;
    e.s(["WINDOW", 0, t])
}, 556095, 776581, e => {
    "use strict";
    var t = e.i(594077),
        r = e.i(298219),
        n = e.i(398720),
        a = e.i(695524),
        i = e.i(741655),
        o = e.i(845068);
    let s = {};

    function l(e) {
        let t = s[e];
        if (t) return t;
        let r = o.WINDOW[e];
        if ((0, n.isNativeFunction)(r)) return s[e] = r.bind(o.WINDOW);
        let l = o.WINDOW.document;
        if (l && "function" == typeof l.createElement) try {
            let t = l.createElement("iframe");
            t.hidden = !0, l.head.appendChild(t);
            let n = t.contentWindow;
            n?.[e] && (r = n[e]), l.head.removeChild(t)
        } catch (t) {
            i.DEBUG_BUILD && a.debug.warn(`Could not create sandbox iframe for ${e} check, bailing to window.${e}: `, t)
        }
        return r ? s[e] = r.bind(o.WINDOW) : r
    }

    function u(e) {
        s[e] = void 0
    }
    e.s(["clearCachedImplementation", 0, u, "getNativeImplementation", 0, l, "setTimeout", 0, function() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return l("setTimeout")(...t)
    }], 776581), e.s(["makeFetchTransport", 0, function(e) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : l("fetch"),
            a = 0,
            i = 0;
        async function o(t) {
            let r = t.body.length;
            a += r, i++;
            let o = {
                body: t.body,
                method: "POST",
                referrerPolicy: "strict-origin",
                headers: e.headers,
                keepalive: a <= 6e4 && i < 15,
                ...e.fetchOptions
            };
            try {
                let t = await n(e.url, o);
                return {
                    statusCode: t.status,
                    headers: {
                        "x-sentry-rate-limits": t.headers.get("X-Sentry-Rate-Limits"),
                        "retry-after": t.headers.get("Retry-After")
                    }
                }
            } catch (e) {
                throw u("fetch"), e
            } finally {
                a -= r, i--
            }
        }
        return (0, t.createTransport)(e, o, (0, r.makePromiseBuffer)(e.bufferSize || 40))
    }], 556095)
}, 645343, e => {
    "use strict";
    var t = e.i(606218),
        r = e.i(227668),
        n = e.i(865607),
        a = e.i(556095);

    function i(e) {
        return new Promise((t, r) => {
            e.oncomplete = e.onsuccess = () => t(e.result), e.onabort = e.onerror = () => r(e.error)
        })
    }

    function o(e) {
        return i(e.getAllKeys())
    }

    function s(e) {
        let t;

        function n() {
            var r, n;
            let a, o;
            return void 0 == t && (r = e.dbName || "sentry-offline", n = e.storeName || "queue", (a = indexedDB.open(r)).onupgradeneeded = () => a.result.createObjectStore(n), o = i(a), t = e => o.then(t => e(t.transaction(n, "readwrite").objectStore(n)))), t
        }
        return {
            push: async t => {
                try {
                    var a, s;
                    let l = (0, r.serializeEnvelope)(t);
                    await (a = n(), s = e.maxQueueSize || 30, a(e => o(e).then(t => {
                        if (!(t.length >= s)) return e.put(l, Math.max(...t, 0) + 1), i(e.transaction)
                    })))
                } catch {}
            },
            unshift: async t => {
                try {
                    var a, s;
                    let l = (0, r.serializeEnvelope)(t);
                    await (a = n(), s = e.maxQueueSize || 30, a(e => o(e).then(t => {
                        if (!(t.length >= s)) return e.put(l, Math.min(...t, 0) - 1), i(e.transaction)
                    })))
                } catch {}
            },
            shift: async () => {
                try {
                    let e = await n()(e => o(e).then(t => {
                        let r = t[0];
                        if (null != r) return i(e.get(r)).then(t => (e.delete(r), i(e.transaction).then(() => t)))
                    }));
                    if (e) return (0, r.parseEnvelope)(e)
                } catch {}
            }
        }
    }
    e.s(["makeBrowserOfflineTransport", 0, function() {
        var e;
        let r = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : a.makeFetchTransport;
        return e = (0, t.makeOfflineTransport)(r), t => {
            let r = e({
                ...t,
                createStore: s
            });
            return n.WINDOW.addEventListener("online", async e => {
                await r.flush()
            }), r
        }
    }])
}, 960186, 930064, 699689, 184108, 481606, 736828, 549331, 106661, 836798, 35536, e => {
    "use strict";
    let t, r;
    var n = e.i(64583);
    e.s(["applySdkMetadata", 0, function(e, t) {
        let r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : [t],
            a = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : "npm",
            i = (e._metadata = e._metadata || {}).sdk = e._metadata.sdk || {};
        i.name || (i.name = `sentry.javascript.${t}`, i.packages = r.map(e => ({
            name: `${a}:@sentry/${e}`,
            version: n.SDK_VERSION
        })), i.version = n.SDK_VERSION)
    }], 960186);
    var a = e.i(131810),
        i = e.i(420546),
        o = e.i(695524);
    let s = [];

    function l(e, t, r) {
        if (r[t.name]) {
            a.DEBUG_BUILD && o.debug.log(`Integration skipped because it was already installed: ${t.name}`);
            return
        }
        if (r[t.name] = t, s.includes(t.name) || "function" != typeof t.setupOnce || (t.setupOnce(), s.push(t.name)), t.setup && "function" == typeof t.setup && t.setup(e), "function" == typeof t.preprocessEvent) {
            let r = t.preprocessEvent.bind(t);
            e.on("preprocessEvent", (t, n) => r(t, n, e))
        }
        if ("function" == typeof t.processEvent) {
            let r = t.processEvent.bind(t),
                n = Object.assign((t, n) => r(t, n, e), {
                    id: t.name
                });
            e.addEventProcessor(n)
        } ["processSpan", "processSegmentSpan"].forEach(r => {
            let n = t[r];
            "function" == typeof n && e.on(r, r => n.call(t, r, e))
        }), a.DEBUG_BUILD && o.debug.log(`Integration installed: ${t.name}`)
    }

    function u(e) {
        return e
    }

    function c(e) {
        let t = [];
        e.message && t.push(e.message);
        try {
            let r = e.exception.values[e.exception.values.length - 1];
            r?.value && (t.push(r.value), r.type && t.push(`${r.type}: ${r.value}`))
        } catch {}
        return t
    }
    e.s(["addIntegration", 0, function(e) {
        let t = (0, i.getClient)();
        if (!t) {
            a.DEBUG_BUILD && o.debug.warn(`Cannot add integration "${e.name}" because no SDK Client is available.`);
            return
        }
        t.addIntegration(e)
    }, "afterSetupIntegrations", 0, function(e, t) {
        for (let r of t) r?.afterAllSetup && r.afterAllSetup(e)
    }, "defineIntegration", 0, u, "getIntegrationsToSetup", 0, function(e) {
        let t, r, n = e.defaultIntegrations || [],
            a = e.integrations;
        if (n.forEach(e => {
                e.isDefaultInstance = !0
            }), Array.isArray(a)) t = [...n, ...a];
        else if ("function" == typeof a) {
            let e = a(n);
            t = Array.isArray(e) ? e : [e]
        } else t = n;
        return r = {}, t.forEach(e => {
            let {
                name: t
            } = e, n = r[t];
            n && !n.isDefaultInstance && e.isDefaultInstance || (r[t] = e)
        }), Object.values(r)
    }, "setupIntegration", 0, l, "setupIntegrations", 0, function(e, t) {
        let r = {};
        return t.forEach(t => {
            t?.beforeSetup && t.beforeSetup(e)
        }), t.forEach(t => {
            t && l(e, t, r)
        }), r
    }], 930064), e.s(["getPossibleEventMessages", 0, c], 699689);
    var d = e.i(483e3),
        p = e.i(403770);
    let f = [/^Script error\.?$/, /^Javascript error: Script error\.? on line 0$/, /^ResizeObserver loop completed with undelivered notifications.$/, /^Cannot redefine property: googletag$/, /^Can't find variable: gmo$/, /^undefined is not an object \(evaluating 'a\.[A-Z]'\)$/, /can't redefine non-configurable property "solana"/, /vv\(\)\.getRestrictions is not a function/, /Can't find variable: _AutofillCallbackHandler/, /Object Not Found Matching Id:\d+, MethodName:simulateEvent/, /^Java exception was raised during method invocation$/],
        h = u(function() {
            let e, t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
            return {
                name: "EventFilters",
                setup(r) {
                    e = g(t, r.getOptions())
                },
                processEvent: (r, n, i) => (e || (e = g(t, i.getOptions())), ! function(e, t) {
                    if (e.type) {
                        if ("transaction" === e.type && function(e, t) {
                                if (!t?.length) return !1;
                                let r = e.transaction;
                                return !!r && (0, p.stringMatchesSomePattern)(r, t)
                            }(e, t.ignoreTransactions)) return a.DEBUG_BUILD && o.debug.warn(`Event dropped due to being matched by \`ignoreTransactions\` option.
Event: ${(0,d.getEventDescription)(e)}`), !0
                    } else {
                        var r, n, i;
                        if (r = e, n = t.ignoreErrors, n?.length && c(r).some(e => (0, p.stringMatchesSomePattern)(e, n))) return a.DEBUG_BUILD && o.debug.warn(`Event dropped due to being matched by \`ignoreErrors\` option.
Event: ${(0,d.getEventDescription)(e)}`), !0;
                        if (i = e, i.exception?.values?.length && !i.message && !i.exception.values.some(e => e.stacktrace || e.type && "Error" !== e.type || e.value)) return a.DEBUG_BUILD && o.debug.warn(`Event dropped due to not having an error message, error type or stacktrace.
Event: ${(0,d.getEventDescription)(e)}`), !0;
                        if (function(e, t) {
                                if (!t?.length) return !1;
                                let r = _(e);
                                return !!r && (0, p.stringMatchesSomePattern)(r, t)
                            }(e, t.denyUrls)) return a.DEBUG_BUILD && o.debug.warn(`Event dropped due to being matched by \`denyUrls\` option.
Event: ${(0,d.getEventDescription)(e)}.
Url: ${_(e)}`), !0;
                        if (! function(e, t) {
                                if (!t?.length) return !0;
                                let r = _(e);
                                return !r || (0, p.stringMatchesSomePattern)(r, t)
                            }(e, t.allowUrls)) return a.DEBUG_BUILD && o.debug.warn(`Event dropped due to not being matched by \`allowUrls\` option.
Event: ${(0,d.getEventDescription)(e)}.
Url: ${_(e)}`), !0
                    }
                    return !1
                }(r, e) ? r : null)
            }
        }),
        m = u(function() {
            let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
            return {
                ...h(e),
                name: "InboundFilters"
            }
        });

    function g() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
            t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        return {
            allowUrls: [...e.allowUrls || [], ...t.allowUrls || []],
            denyUrls: [...e.denyUrls || [], ...t.denyUrls || []],
            ignoreErrors: [...e.ignoreErrors || [], ...t.ignoreErrors || [], ...e.disableErrorDefaults ? [] : f],
            ignoreTransactions: [...e.ignoreTransactions || [], ...t.ignoreTransactions || []]
        }
    }

    function _(e) {
        try {
            let t = [...e.exception?.values ?? []].reverse().find(e => e.mechanism?.parent_id === void 0 && e.stacktrace?.frames?.length),
                r = t?.stacktrace?.frames;
            return r ? function() {
                let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [];
                for (let t = e.length - 1; t >= 0; t--) {
                    let r = e[t];
                    if (r && "<anonymous>" !== r.filename && "[native code]" !== r.filename) return r.filename || null
                }
                return null
            }(r) : null
        } catch {
            return a.DEBUG_BUILD && o.debug.error(`Cannot extract url for event ${(0,d.getEventDescription)(e)}`), null
        }
    }
    e.s(["eventFiltersIntegration", 0, h, "inboundFiltersIntegration", 0, m], 184108);
    var v = e.i(211429);
    let y = new WeakMap,
        b = u(() => ({
            name: "FunctionToString",
            setupOnce() {
                t = Function.prototype.toString;
                try {
                    Function.prototype.toString = function() {
                        for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                        let a = (0, v.getOriginalFunction)(this),
                            o = y.has((0, i.getClient)()) && void 0 !== a ? a : this;
                        return t.apply(o, r)
                    }
                } catch {}
            },
            setup(e) {
                y.set(e, !0)
            }
        }));
    e.s(["functionToStringIntegration", 0, b], 481606);
    var E = e.i(454181),
        S = e.i(950271);
    let T = u(() => ({
        name: "ConversationId",
        setup(e) {
            e.on("spanStart", e => {
                let t = (0, i.getCurrentScope)().getScopeData(),
                    r = (0, i.getIsolationScope)().getScopeData(),
                    n = t.conversationId || r.conversationId;
                if (n) {
                    let {
                        op: t,
                        data: r,
                        description: a
                    } = (0, S.spanToJSON)(e);
                    if (!t?.startsWith("gen_ai.") && !r["ai.operationId"] && !a?.startsWith("ai.")) return;
                    e.setAttribute(E.GEN_AI_CONVERSATION_ID_ATTRIBUTE, n)
                }
            })
        }
    }));
    e.s(["conversationIdIntegration", 0, T], 736828);
    var R = e.i(140332);
    let I = u(() => {
        let e;
        return {
            name: "Dedupe",
            processEvent(t) {
                if (t.type) return t;
                try {
                    var r, n, i, s, l, u;
                    let c, d, p, f;
                    if (r = t, (n = e) && (i = r, s = n, c = i.message, d = s.message, (c || d) && (!c || d) && (c || !d) && c === d && P(i, s) && O(i, s) && 1 || (l = r, u = n, p = w(u), f = w(l), p && f && p.type === f.type && p.value === f.value && P(l, u) && O(l, u)))) return a.DEBUG_BUILD && o.debug.warn("Event dropped due to being a duplicate of previously captured event."), null
                } catch {}
                return e = t
            }
        }
    });

    function O(e, t) {
        let r = (0, R.getFramesFromEvent)(e),
            n = (0, R.getFramesFromEvent)(t);
        if (!r && !n) return !0;
        if (r && !n || !r && n || n.length !== r.length) return !1;
        for (let e = 0; e < n.length; e++) {
            let t = n[e],
                a = r[e];
            if (t.filename !== a.filename || t.lineno !== a.lineno || t.colno !== a.colno || t.function !== a.function) return !1
        }
        return !0
    }

    function P(e, t) {
        let r = e.fingerprint,
            n = t.fingerprint;
        if (!r && !n) return !0;
        if (r && !n || !r && n) return !1;
        try {
            return r.join("") === n.join("")
        } catch {
            return !1
        }
    }

    function w(e) {
        return e.exception?.values?.[0]
    }

    function N(e) {
        (0, i.getCurrentScope)().setClient(e)
    }
    e.s(["dedupeIntegration", 0, I], 549331), e.s(["initAndBind", 0, function(e, t) {
        !0 === t.debug && (a.DEBUG_BUILD ? o.debug.enable() : (0, o.consoleSandbox)(() => {
            console.warn("[Sentry] Cannot initialize SDK with `debug` option using a non-debug bundle.")
        })), (0, i.getCurrentScope)().update(t.initialScope);
        let r = new e(t);
        return N(r), r.init(), r
    }, "setCurrentClient", 0, N], 106661);
    var A = e.i(295446),
        C = e.i(10955),
        D = e.i(59172),
        x = e.i(943266),
        L = e.i(867058),
        U = e.i(557156);
    let M = 0;

    function B(e) {
        let t = Math.floor(1e3 * e);
        void 0 !== r && t !== r && (M = 0);
        let n = M;
        return M++, r = t, {
            key: "sentry.timestamp.sequence",
            value: {
                value: n,
                type: "integer"
            }
        }
    }
    var k = e.i(901781);

    function j(e, t) {
        return t ? (0, i.withScope)(t, () => {
            let r = (0, S.getActiveSpan)(),
                n = r ? (0, S.spanToTraceContext)(r) : (0, i.getTraceContextFromScope)(t);
            return [r ? (0, k.getDynamicSamplingContextFromSpan)(r) : (0, k.getDynamicSamplingContextFromScope)(e, t), n]
        }) : [void 0, void 0]
    }
    let $ = {
        trace: 1,
        debug: 5,
        info: 9,
        warn: 13,
        error: 17,
        fatal: 21
    };
    var W = e.i(551482),
        F = e.i(227668);

    function H(e, t, r) {
        let n = !(arguments.length > 3) || void 0 === arguments[3] || arguments[3];
        r && (!e[t] || n) && (e[t] = r)
    }

    function G(e, t) {
        var r;
        let n = z(),
            a = (r = e, z().get(r));
        void 0 === a ? n.set(e, [t]) : a.length >= 100 ? (q(e, a), n.set(e, [t])) : n.set(e, [...a, t])
    }

    function q(e, t) {
        var r, n, a, i;
        let o, s = t ?? (i = e, z().get(i)) ?? [];
        if (0 === s.length) return;
        let l = e.getOptions(),
            u = (r = l._metadata, n = l.tunnel, a = e.getDsn(), o = {}, r?.sdk && (o.sdk = {
                name: r.sdk.name,
                version: r.sdk.version
            }), n && a && (o.dsn = (0, W.dsnToString)(a)), (0, F.createEnvelope)(o, [
                [{
                    type: "log",
                    item_count: s.length,
                    content_type: "application/vnd.sentry.items.log+json"
                }, {
                    items: s
                }]
            ]));
        z().set(e, []), e.emit("flushLogs"), e.sendEnvelope(u)
    }

    function z() {
        return (0, C.getGlobalSingleton)("clientToLogBufferMap", () => new WeakMap)
    }

    function X(e, t, r) {
        let n = !(arguments.length > 3) || void 0 === arguments[3] || arguments[3];
        !r || !n && t in e || (e[t] = r)
    }

    function Y(e, t) {
        var r;
        let n = K(),
            a = (r = e, K().get(r));
        void 0 === a ? n.set(e, [t]) : a.length >= 1e3 ? (J(e, a), n.set(e, [t])) : n.set(e, [...a, t])
    }

    function J(e, t) {
        var r, n, a, i;
        let o, s = t ?? (i = e, K().get(i)) ?? [];
        if (0 === s.length) return;
        let l = e.getOptions(),
            u = (r = l._metadata, n = l.tunnel, a = e.getDsn(), o = {}, r?.sdk && (o.sdk = {
                name: r.sdk.name,
                version: r.sdk.version
            }), n && a && (o.dsn = (0, W.dsnToString)(a)), (0, F.createEnvelope)(o, [
                [{
                    type: "trace_metric",
                    item_count: s.length,
                    content_type: "application/vnd.sentry.items.trace-metric+json"
                }, {
                    items: s
                }]
            ]));
        K().set(e, []), e.emit("flushMetrics"), e.sendEnvelope(u)
    }
    e.s(["_INTERNAL_captureLog", 0, function(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : (0, i.getCurrentScope)(),
            r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : G,
            n = t?.getClient() ?? (0, i.getClient)();
        if (!n) {
            a.DEBUG_BUILD && o.debug.warn("No client available to capture log.");
            return
        }
        let {
            release: s,
            environment: l,
            enableLogs: u = !1,
            beforeSendLog: c
        } = n.getOptions();
        if (!u) {
            a.DEBUG_BUILD && o.debug.warn("logging option not enabled, log will not be captured.");
            return
        }
        let [, d] = j(n, t), p = {
            ...e.attributes
        }, {
            user: {
                id: f,
                email: h,
                username: m
            },
            attributes: g = {}
        } = (0, x.getCombinedScopeData)((0, i.getIsolationScope)(), t);
        H(p, "user.id", f, !1), H(p, "user.email", h, !1), H(p, "user.name", m, !1), H(p, "sentry.release", s), H(p, "sentry.environment", l);
        let {
            name: _,
            version: v
        } = n.getSdkMetadata()?.sdk ?? {};
        H(p, "sentry.sdk.name", _), H(p, "sentry.sdk.version", v);
        let y = n.getIntegrationByName("Replay"),
            b = y?.getReplayId(!0);
        H(p, "sentry.replay_id", b), b && y?.getRecordingMode() === "buffer" && H(p, "sentry._internal.replay_is_buffering", !0);
        let E = e.message;
        if ((0, D.isParameterizedString)(E)) {
            let {
                __sentry_template_string__: e,
                __sentry_template_values__: t = []
            } = E;
            t?.length && (p["sentry.message.template"] = e), t.forEach((e, t) => {
                p[`sentry.message.parameter.${t}`] = e
            })
        }
        let S = (0, L._getSpanForScope)(t);
        H(p, "sentry.trace.parent_span_id", S?.spanContext().spanId);
        let T = {
            ...e,
            attributes: p
        };
        n.emit("beforeCaptureLog", T);
        let R = c ? (0, o.consoleSandbox)(() => c(T)) : T;
        if (!R) {
            n.recordDroppedEvent("before_send", "log_item", 1), a.DEBUG_BUILD && o.debug.warn("beforeSendLog returned null, log will not be captured.");
            return
        }
        let {
            level: I,
            message: O,
            attributes: P = {},
            severityNumber: w
        } = R, N = (0, U.timestampInSeconds)(), C = B(N);
        r(n, {
            timestamp: N,
            level: I,
            body: O,
            trace_id: d?.trace_id,
            severity_number: w ?? $[I],
            attributes: {
                ...(0, A.serializeAttributes)(g),
                ...(0, A.serializeAttributes)(P, !0),
                [C.key]: C.value
            }
        }), n.emit("afterCaptureLog", R)
    }, "_INTERNAL_flushLogsBuffer", 0, q], 836798);

    function K() {
        return (0, C.getGlobalSingleton)("clientToMetricBufferMap", () => new WeakMap)
    }
    e.s(["_INTERNAL_captureMetric", 0, function(e, t) {
        let r = t?.scope ?? (0, i.getCurrentScope)(),
            n = t?.captureSerializedMetric ?? Y,
            s = r?.getClient() ?? (0, i.getClient)();
        if (!s) {
            a.DEBUG_BUILD && o.debug.warn("No client available to capture metric.");
            return
        }
        let {
            _experiments: l,
            enableMetrics: u,
            beforeSendMetric: c
        } = s.getOptions();
        if (!(u ?? l?.enableMetrics ?? !0)) {
            a.DEBUG_BUILD && o.debug.warn("metrics option not enabled, metric will not be captured.");
            return
        }
        let {
            user: d,
            attributes: p
        } = (0, x.getCombinedScopeData)((0, i.getIsolationScope)(), r), f = function(e, t, r) {
            let {
                release: n,
                environment: a
            } = t.getOptions(), i = {
                ...e.attributes
            };
            X(i, "user.id", r.id, !1), X(i, "user.email", r.email, !1), X(i, "user.name", r.username, !1), X(i, "sentry.release", n), X(i, "sentry.environment", a);
            let {
                name: o,
                version: s
            } = t.getSdkMetadata()?.sdk ?? {};
            X(i, "sentry.sdk.name", o), X(i, "sentry.sdk.version", s);
            let l = t.getIntegrationByName("Replay"),
                u = l?.getReplayId(!0);
            return X(i, "sentry.replay_id", u), u && l?.getRecordingMode() === "buffer" && X(i, "sentry._internal.replay_is_buffering", !0), {
                ...e,
                attributes: i
            }
        }(e, s, d);
        s.emit("processMetric", f);
        let h = c || l?.beforeSendMetric,
            m = h ? h(f) : f;
        if (!m) {
            a.DEBUG_BUILD && o.debug.log("`beforeSendMetric` returned `null`, will not send metric.");
            return
        }
        let g = function(e, t, r, n) {
            let [, a] = j(t, r), i = (0, L._getSpanForScope)(r), o = i ? i.spanContext().traceId : a?.trace_id, s = i ? i.spanContext().spanId : void 0, l = (0, U.timestampInSeconds)(), u = B(l);
            return {
                timestamp: l,
                trace_id: o ?? "",
                span_id: s,
                name: e.name,
                type: e.type,
                unit: e.unit,
                value: e.value,
                attributes: {
                    ...(0, A.serializeAttributes)(n),
                    ...(0, A.serializeAttributes)(e.attributes, "skip-undefined"),
                    [u.key]: u.value
                }
            }
        }(m, s, r, p);
        a.DEBUG_BUILD && o.debug.log("[Metric]", g), n(s, g), s.emit("afterCaptureMetric", m)
    }, "_INTERNAL_flushMetricsBuffer", 0, J], 35536)
}, 687050, 775364, 699976, 510068, 694035, e => {
    "use strict";
    var t = e.i(828873),
        r = e.i(358984),
        n = e.i(420546),
        a = e.i(131810),
        i = e.i(718305),
        o = e.i(930064),
        s = e.i(836798),
        l = e.i(35536),
        u = e.i(271693),
        c = e.i(901781),
        d = e.i(785970),
        p = e.i(594077),
        f = e.i(227668),
        h = e.i(557156),
        m = e.i(695524),
        g = e.i(551482),
        _ = e.i(699689),
        v = e.i(59172),
        y = e.i(626471),
        b = e.i(483e3),
        E = e.i(121482),
        S = e.i(343385),
        T = e.i(298219),
        R = e.i(58833),
        I = e.i(658675),
        O = e.i(950271),
        P = e.i(471903),
        w = e.i(789189),
        N = e.i(454181);
    let A = "Not capturing exception because it's already been captured.",
        C = "Discarded session because of missing or non-string release",
        D = Symbol.for("SentryInternalError"),
        x = Symbol.for("SentryDoNotSendEventError");

    function L(e) {
        return {
            message: e,
            [D]: !0
        }
    }

    function U(e) {
        return {
            message: e,
            [x]: !0
        }
    }

    function M(e) {
        return !!e && "object" == typeof e && D in e
    }

    function B(e) {
        return !!e && "object" == typeof e && x in e
    }

    function k(e, t, r, n, a) {
        let i, o = 0,
            s = !1;
        e.on(r, () => {
            o = 0, clearTimeout(i), s = !1
        }), e.on(t, t => {
            (o += n(t)) >= 8e5 ? a(e) : s || (s = !0, i = (0, w.safeUnref)(setTimeout(() => {
                a(e)
            }, 5e3)))
        }), e.on("flush", () => {
            a(e)
        })
    }
    class j {
        captureException(e, t, r) {
            let n = (0, b.uuid4)();
            if ((0, b.checkOrSetAlreadyCaught)(e)) return a.DEBUG_BUILD && m.debug.log(A), n;
            let i = {
                event_id: n,
                ...t
            };
            return this._process(() => this.eventFromException(e, i).then(e => this._captureEvent(e, i, r)).then(e => e), "error"), i.event_id
        }
        captureMessage(e, t, r, n) {
            let a = {
                    event_id: (0, b.uuid4)(),
                    ...r
                },
                i = (0, v.isParameterizedString)(e) ? e : String(e),
                o = (0, v.isPrimitive)(e),
                s = o ? this.eventFromMessage(i, t, a) : this.eventFromException(e, a);
            return this._process(() => s.then(e => this._captureEvent(e, a, n)), o ? "unknown" : "error"), a.event_id
        }
        captureEvent(e, t, r) {
            let n = (0, b.uuid4)();
            if (t?.originalException && (0, b.checkOrSetAlreadyCaught)(t.originalException)) return a.DEBUG_BUILD && m.debug.log(A), n;
            let i = {
                    event_id: n,
                    ...t
                },
                o = e.sdkProcessingMetadata || {},
                s = o.capturedSpanScope,
                l = o.capturedSpanIsolationScope,
                u = $(e.type);
            return this._process(() => this._captureEvent(e, i, s || r, l), u), i.event_id
        }
        captureSession(e) {
            this.sendSession(e), (0, u.updateSession)(e, {
                init: !1
            })
        }
        getDsn() {
            return this._dsn
        }
        getOptions() {
            return this._options
        }
        getSdkMetadata() {
            return this._options._metadata
        }
        getTransport() {
            return this._transport
        }
        async flush(e) {
            let t = this._transport;
            if (!t) return !0;
            this.emit("flush");
            let r = await this._isClientDoneProcessing(e),
                n = await t.flush(e);
            return r && n
        }
        async close(e) {
            (0, s._INTERNAL_flushLogsBuffer)(this);
            let t = await this.flush(e);
            return this.getOptions().enabled = !1, this.emit("close"), t
        }
        getEventProcessors() {
            return this._eventProcessors
        }
        addEventProcessor(e) {
            this._eventProcessors.push(e)
        }
        init() {
            (this._isEnabled() || this._options.integrations.some(e => {
                let {
                    name: t
                } = e;
                return t.startsWith("Spotlight")
            })) && this._setupIntegrations()
        }
        getIntegrationByName(e) {
            return this._integrations[e]
        }
        addIntegration(e) {
            let t = this._integrations[e.name];
            !t && e.beforeSetup && e.beforeSetup(this), (0, o.setupIntegration)(this, e, this._integrations), t || (0, o.afterSetupIntegrations)(this, [e])
        }
        sendEvent(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            this.emit("beforeSendEvent", e, t);
            let r = (0, i.createEventEnvelope)(e, this._dsn, this._options._metadata, this._options.tunnel);
            for (let e of t.attachments || []) r = (0, f.addItemToEnvelope)(r, (0, f.createAttachmentEnvelopeItem)(e));
            this.sendEnvelope(r).then(t => this.emit("afterSendEvent", e, t))
        }
        sendSession(e) {
            let {
                release: t,
                environment: n = r.DEFAULT_ENVIRONMENT
            } = this._options;
            if ("aggregates" in e) {
                let r = e.attrs || {};
                if (!r.release && !t) {
                    a.DEBUG_BUILD && m.debug.warn(C);
                    return
                }
                r.release = r.release || t, r.environment = r.environment || n, e.attrs = r
            } else {
                if (!e.release && !t) {
                    a.DEBUG_BUILD && m.debug.warn(C);
                    return
                }
                e.release = e.release || t, e.environment = e.environment || n
            }
            this.emit("beforeSendSession", e);
            let o = (0, i.createSessionEnvelope)(e, this._dsn, this._options._metadata, this._options.tunnel);
            this.sendEnvelope(o)
        }
        recordDroppedEvent(e, t) {
            let r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 1;
            if (this._options.sendClientReports) {
                let n = `${e}:${t}`;
                a.DEBUG_BUILD && m.debug.log(`Recording outcome: "${n}"${r>1?` (${r} times)`:""}`), this._outcomes[n] = (this._outcomes[n] || 0) + r
            }
        }
        on(e, t) {
            let r = this._hooks[e] = this._hooks[e] || new Set,
                n = function() {
                    for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                    return t(...r)
                };
            return r.add(n), () => {
                r.delete(n)
            }
        }
        emit(e) {
            for (var t = arguments.length, r = Array(t > 1 ? t - 1 : 0), n = 1; n < t; n++) r[n - 1] = arguments[n];
            let a = this._hooks[e];
            a && a.forEach(e => e(...r))
        }
        async sendEnvelope(e) {
            if (this.emit("beforeEnvelope", e), this._isEnabled() && this._transport) try {
                return await this._transport.send(e)
            } catch (e) {
                return a.DEBUG_BUILD && m.debug.error("Error while sending envelope:", e), {}
            }
            return a.DEBUG_BUILD && m.debug.error("Transport disabled"), {}
        }
        dispose() {}
        _setupIntegrations() {
            let {
                integrations: e
            } = this._options;
            this._integrations = (0, o.setupIntegrations)(this, e), (0, o.afterSetupIntegrations)(this, e)
        }
        _updateSessionFromEvent(e, t) {
            let r = "fatal" === t.level,
                n = !1,
                a = t.exception?.values;
            if (a) {
                for (let e of (n = !0, r = !1, a))
                    if (e.mechanism?.handled === !1) {
                        r = !0;
                        break
                    }
            }
            let i = "ok" === e.status;
            (i && 0 === e.errors || i && r) && ((0, u.updateSession)(e, {
                ...r && {
                    status: "crashed"
                },
                errors: e.errors || Number(n || r)
            }), this.captureSession(e))
        }
        async _isClientDoneProcessing(e) {
            let t = 0;
            for (; !e || t < e;) {
                if (await new Promise(e => setTimeout(e, 1)), !this._numProcessing) return !0;
                t++
            }
            return !1
        }
        _isEnabled() {
            return !1 !== this.getOptions().enabled && void 0 !== this._transport
        }
        _prepareEvent(e, t, r, a) {
            let i = this.getOptions(),
                o = Object.keys(this._integrations);
            return !t.integrations && o?.length && (t.integrations = o), this.emit("preprocessEvent", e, t), e.type || a.setLastEventId(e.event_id || t.event_id), (0, S.prepareEvent)(i, e, t, r, this, a).then(e => (null === e || (this.emit("postprocessEvent", e, t), e.contexts = {
                trace: {
                    ...e.contexts?.trace,
                    ...(0, n.getTraceContextFromScope)(r)
                },
                ...e.contexts
            }, e.sdkProcessingMetadata = {
                dynamicSamplingContext: (0, c.getDynamicSamplingContextFromScope)(this, r),
                ...e.sdkProcessingMetadata
            }), e))
        }
        _captureEvent(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : (0, n.getCurrentScope)(),
                i = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : (0, n.getIsolationScope)();
            return a.DEBUG_BUILD && W(e) && m.debug.log(`Captured error event \`${(0,_.getPossibleEventMessages)(e)[0]||"<unknown>"}\``), this._processEvent(e, t, r, i).then(e => e.event_id, e => {
                a.DEBUG_BUILD && (B(e) ? m.debug.log(e.message) : M(e) ? m.debug.warn(e.message) : m.debug.warn(e))
            })
        }
        _processEvent(e, t, r, n) {
            let a = this.getOptions(),
                {
                    sampleRate: i
                } = a,
                o = F(e),
                s = W(e),
                l = e.type || "error",
                u = `before send for type \`${l}\``,
                c = void 0 === i ? void 0 : (0, E.parseSampleRate)(i);
            if (s && "number" == typeof c && (0, R.safeMathRandom)() > c) return this.recordDroppedEvent("sample_rate", "error"), (0, P.rejectedSyncPromise)(U(`Discarding event because it's not included in the random sample (sampling rate = ${i})`));
            let p = $(e.type);
            return this._prepareEvent(e, t, r, n).then(e => {
                if (null === e) throw this.recordDroppedEvent("event_processor", p), U("An event processor returned `null`, will not send event.");
                return t.data?.__sentry__ === !0 ? e : function(e, t) {
                    let r = `${t} must return \`null\` or a valid event.`;
                    if ((0, v.isThenable)(e)) return e.then(e => {
                        if (!(0, v.isPlainObject)(e) && null !== e) throw L(r);
                        return e
                    }, e => {
                        throw L(`${t} rejected with ${e}`)
                    });
                    if (!(0, v.isPlainObject)(e) && null !== e) throw L(r);
                    return e
                }(function(e, t, r, n) {
                    let {
                        beforeSend: a,
                        beforeSendTransaction: i,
                        ignoreSpans: o
                    } = t, s = !(0, d.isStreamedBeforeSendSpanCallback)(t.beforeSendSpan) && t.beforeSendSpan, l = r;
                    if (W(l) && a) return a(l, n);
                    if (F(l)) {
                        if (s || o) {
                            let t = function(e) {
                                let {
                                    trace_id: t,
                                    parent_span_id: r,
                                    span_id: n,
                                    status: a,
                                    origin: i,
                                    data: o,
                                    op: s
                                } = e.contexts?.trace ?? {};
                                return {
                                    data: o ?? {},
                                    description: e.transaction,
                                    op: s,
                                    parent_span_id: r,
                                    span_id: n ?? "",
                                    start_timestamp: e.start_timestamp ?? 0,
                                    status: a,
                                    timestamp: e.timestamp,
                                    trace_id: t ?? "",
                                    origin: i,
                                    profile_id: o?.[N.SEMANTIC_ATTRIBUTE_PROFILE_ID],
                                    exclusive_time: o?.[N.SEMANTIC_ATTRIBUTE_EXCLUSIVE_TIME],
                                    measurements: e.measurements,
                                    is_segment: !0
                                }
                            }(l);
                            if (o?.length && (0, I.shouldIgnoreSpan)(t, o)) return null;
                            if (s) {
                                let e = s(t);
                                if (e) l = (0, y.merge)(r, {
                                    type: "transaction",
                                    timestamp: e.timestamp,
                                    start_timestamp: e.start_timestamp,
                                    transaction: e.description,
                                    contexts: {
                                        trace: {
                                            trace_id: e.trace_id,
                                            span_id: e.span_id,
                                            parent_span_id: e.parent_span_id,
                                            op: e.op,
                                            status: e.status,
                                            origin: e.origin,
                                            data: {
                                                ...e.data,
                                                ...e.profile_id && {
                                                    [N.SEMANTIC_ATTRIBUTE_PROFILE_ID]: e.profile_id
                                                },
                                                ...e.exclusive_time && {
                                                    [N.SEMANTIC_ATTRIBUTE_EXCLUSIVE_TIME]: e.exclusive_time
                                                }
                                            }
                                        }
                                    },
                                    measurements: e.measurements
                                });
                                else(0, O.showSpanDropWarning)()
                            }
                            if (l.spans) {
                                let t = [],
                                    r = l.spans;
                                for (let e of r) {
                                    if (o?.length && (0, I.shouldIgnoreSpan)(e, o)) {
                                        (0, I.reparentChildSpans)(r, e);
                                        continue
                                    }
                                    if (s) {
                                        let r = s(e);
                                        r ? t.push(r) : ((0, O.showSpanDropWarning)(), t.push(e))
                                    } else t.push(e)
                                }
                                let n = l.spans.length - t.length;
                                n && e.recordDroppedEvent("before_send", "span", n), l.spans = t
                            }
                        }
                        if (i) {
                            if (l.spans) {
                                let e = l.spans.length;
                                l.sdkProcessingMetadata = {
                                    ...r.sdkProcessingMetadata,
                                    spanCountBeforeProcessing: e
                                }
                            }
                            return i(l, n)
                        }
                    }
                    return l
                }(this, a, e, t), u)
            }).then(a => {
                if (null === a) {
                    if (this.recordDroppedEvent("before_send", p), o) {
                        let t = 1 + (e.spans || []).length;
                        this.recordDroppedEvent("before_send", "span", t)
                    }
                    throw U(`${u} returned \`null\`, will not send event.`)
                }
                let i = r.getSession() || n.getSession();
                if (s && i && this._updateSessionFromEvent(i, a), o) {
                    let e = (a.sdkProcessingMetadata?.spanCountBeforeProcessing || 0) - (a.spans ? a.spans.length : 0);
                    e > 0 && this.recordDroppedEvent("before_send", "span", e)
                }
                let l = a.transaction_info;
                return o && l && a.transaction !== e.transaction && (a.transaction_info = {
                    ...l,
                    source: "custom"
                }), this.sendEvent(a, t), a
            }).then(null, e => {
                if (B(e) || M(e)) throw e;
                throw this.captureException(e, {
                    mechanism: {
                        handled: !1,
                        type: "internal"
                    },
                    data: {
                        __sentry__: !0
                    },
                    originalException: e
                }), L(`Event processing pipeline threw an error, original event will not be sent. Details have been sent as a new event.
Reason: ${e}`)
            })
        }
        _process(e, t) {
            this._numProcessing++, this._promiseBuffer.add(e).then(e => (this._numProcessing--, e), e => (this._numProcessing--, e === T.SENTRY_BUFFER_FULL_ERROR && this.recordDroppedEvent("queue_overflow", t), e))
        }
        _clearOutcomes() {
            let e = this._outcomes;
            return this._outcomes = {}, Object.entries(e).map(e => {
                let [t, r] = e, [n, a] = t.split(":");
                return {
                    reason: n,
                    category: a,
                    quantity: r
                }
            })
        }
        _flushOutcomes() {
            var e;
            let t;
            a.DEBUG_BUILD && m.debug.log("Flushing outcomes...");
            let r = this._clearOutcomes();
            if (0 === r.length) {
                a.DEBUG_BUILD && m.debug.log("No outcomes to send");
                return
            }
            if (!this._dsn) {
                a.DEBUG_BUILD && m.debug.log("No dsn provided, will not send outcomes");
                return
            }
            a.DEBUG_BUILD && m.debug.log("Sending outcomes:", r);
            let n = (e = this._options.tunnel && (0, g.dsnToString)(this._dsn), t = [{
                type: "client_report"
            }, {
                timestamp: (0, h.dateTimestampInSeconds)(),
                discarded_events: r
            }], (0, f.createEnvelope)(e ? {
                dsn: e
            } : {}, [t]));
            this.sendEnvelope(n)
        }
        constructor(e) {
            if (this._options = e, this._integrations = {}, this._numProcessing = 0, this._outcomes = {}, this._hooks = {}, this._eventProcessors = [], this._promiseBuffer = (0, T.makePromiseBuffer)(e.transportOptions?.bufferSize ?? p.DEFAULT_TRANSPORT_BUFFER_SIZE), e.dsn ? this._dsn = (0, g.makeDsn)(e.dsn) : a.DEBUG_BUILD && m.debug.warn("No DSN provided, client will not send events."), this._dsn) {
                const r = (0, t.getEnvelopeEndpointWithUrlEncodedAuth)(this._dsn, e.tunnel, e._metadata ? e._metadata.sdk : void 0);
                this._transport = e.transport({
                    tunnel: this._options.tunnel,
                    recordDroppedEvent: this.recordDroppedEvent.bind(this),
                    ...e.transportOptions,
                    url: r
                })
            }
            this._options.enableLogs = this._options.enableLogs ?? this._options._experiments?.enableLogs, this._options.enableLogs && k(this, "afterCaptureLog", "flushLogs", G, s._INTERNAL_flushLogsBuffer), (this._options.enableMetrics ?? this._options._experiments?.enableMetrics ?? !0) && k(this, "afterCaptureMetric", "flushMetrics", H, l._INTERNAL_flushMetricsBuffer)
        }
    }

    function $(e) {
        return "replay_event" === e ? "replay" : e || "error"
    }

    function W(e) {
        return void 0 === e.type
    }

    function F(e) {
        return "transaction" === e.type
    }

    function H(e) {
        let t = 0;
        return e.name && (t += 2 * e.name.length), (t += 8) + q(e.attributes)
    }

    function G(e) {
        let t = 0;
        return e.message && (t += 2 * e.message.length), t + q(e.attributes)
    }

    function q(e) {
        if (!e) return 0;
        let t = 0;
        return Object.values(e).forEach(e => {
            Array.isArray(e) ? t += e.length * z(e[0]) : (0, v.isPrimitive)(e) ? t += z(e) : t += 100
        }), t
    }

    function z(e) {
        return "string" == typeof e ? 2 * e.length : "number" == typeof e ? 8 : 4 * ("boolean" == typeof e)
    }

    function X() {
        return "npm"
    }
    e.s(["getSDKSource", 0, X, "isBrowserBundle", 0, function() {
        return "u" > typeof __SENTRY_BROWSER_BUNDLE__ && !!__SENTRY_BROWSER_BUNDLE__
    }], 775364);
    var Y = e.i(960186);

    function J(e) {
        "aggregates" in e ? e.attrs?.ip_address === void 0 && (e.attrs = {
            ...e.attrs,
            ip_address: "{{auto}}"
        }) : void 0 === e.ipAddress && (e.ipAddress = "{{auto}}")
    }
    var K = e.i(100749),
        V = e.i(211429);

    function Q(e) {
        return (0, v.isError)(e) && "__sentry_fetch_url_host__" in e && "string" == typeof e.__sentry_fetch_url_host__ ? `${e.message} (${e.__sentry_fetch_url_host__})` : e.message
    }

    function Z(e, t) {
        var r, n;
        let a, i, o = et(e, t),
            s = {
                type: (r = t, !(a = r?.name) && en(r) ? r.message && Array.isArray(r.message) && 2 == r.message.length ? r.message[0] : "WebAssembly.Exception" : a),
                value: (n = t, i = n?.message, en(n) ? Array.isArray(n.message) && 2 == n.message.length ? n.message[1] : "wasm exception" : i ? i.error && "string" == typeof i.error.message ? Q(i.error) : Q(n) : "No error message")
            };
        return o.length && (s.stacktrace = {
            frames: o
        }), void 0 === s.type && "" === s.value && (s.value = "Unrecoverable error caught"), s
    }

    function ee(e, t) {
        return {
            exception: {
                values: [Z(e, t)]
            }
        }
    }

    function et(e, t) {
        var r, n;
        let a = t.stacktrace || t.stack || "",
            i = (r = t) && er.test(r.message) ? 1 : 0,
            o = "number" == typeof(n = t).framesToPop ? n.framesToPop : 0;
        try {
            return e(a, i, o)
        } catch {}
        return []
    }
    let er = /Minified React error #\d+;/i;

    function en(e) {
        return "u" > typeof WebAssembly && void 0 !== WebAssembly.Exception && e instanceof WebAssembly.Exception
    }

    function ea(e, t, r, n) {
        let a = eo(e, t, r?.syntheticException || void 0, n);
        return (0, b.addExceptionMechanism)(a), a.level = "error", r?.event_id && (a.event_id = r.event_id), (0, P.resolvedSyncPromise)(a)
    }

    function ei(e, t) {
        let r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "info",
            n = arguments.length > 3 ? arguments[3] : void 0,
            a = arguments.length > 4 ? arguments[4] : void 0,
            i = es(e, t, n?.syntheticException || void 0, a);
        return i.level = r, n?.event_id && (i.event_id = n.event_id), (0, P.resolvedSyncPromise)(i)
    }

    function eo(e, t, r, a, i) {
        let o;
        if ((0, v.isErrorEvent)(t) && t.error) return ee(e, t.error);
        if ((0, v.isDOMError)(t) || (0, v.isDOMException)(t)) {
            if ("stack" in t) o = ee(e, t);
            else {
                let n = t.name || ((0, v.isDOMError)(t) ? "DOMError" : "DOMException"),
                    i = t.message ? `${n}: ${t.message}` : n;
                o = es(e, i, r, a), (0, b.addExceptionTypeValue)(o, i)
            }
            return "code" in t && (o.tags = {
                ...o.tags,
                "DOMException.code": `${t.code}`
            }), o
        }
        return (0, v.isError)(t) ? ee(e, t) : ((0, v.isPlainObject)(t) || (0, v.isEvent)(t) ? o = function(e, t, r, a) {
            let i = (0, n.getClient)(),
                o = i?.getOptions().normalizeDepth,
                s = Object.values(t).find(e => e instanceof Error),
                l = {
                    __serialized__: (0, K.normalizeToSize)(t, o)
                };
            if (s) return {
                exception: {
                    values: [Z(e, s)]
                },
                extra: l
            };
            let u = {
                exception: {
                    values: [{
                        type: (0, v.isEvent)(t) ? t.constructor.name : a ? "UnhandledRejection" : "Error",
                        value: function(e, t) {
                            let {
                                isUnhandledRejection: r
                            } = t, n = (0, V.extractExceptionKeysForMessage)(e), a = r ? "promise rejection" : "exception";
                            if ((0, v.isErrorEvent)(e)) return `Event \`ErrorEvent\` captured as ${a} with message \`${e.message}\``;
                            if ((0, v.isEvent)(e)) {
                                let t = function(e) {
                                    try {
                                        let t = Object.getPrototypeOf(e);
                                        return t ? t.constructor.name : void 0
                                    } catch {}
                                }(e);
                                return `Event \`${t}\` (type=${e.type}) captured as ${a}`
                            }
                            return `Object captured as ${a} with keys: ${n}`
                        }(t, {
                            isUnhandledRejection: a
                        })
                    }]
                },
                extra: l
            };
            if (r) {
                let t = et(e, r);
                t.length && (u.exception.values[0].stacktrace = {
                    frames: t
                })
            }
            return u
        }(e, t, r, i) : (o = es(e, t, r, a), (0, b.addExceptionTypeValue)(o, `${t}`, void 0)), (0, b.addExceptionMechanism)(o, {
            synthetic: !0
        }), o)
    }

    function es(e, t, r, n) {
        let a = {};
        if (n && r) {
            let n = et(e, r);
            n.length && (a.exception = {
                values: [{
                    value: t,
                    stacktrace: {
                        frames: n
                    }
                }]
            }), (0, b.addExceptionMechanism)(a, {
                synthetic: !0
            })
        }
        if ((0, v.isParameterizedString)(t)) {
            let {
                __sentry_template_string__: e,
                __sentry_template_values__: r
            } = t;
            return a.logentry = {
                message: e,
                params: r
            }, a
        }
        return a.message = t, a
    }
    e.s(["eventFromException", 0, ea, "eventFromMessage", 0, ei, "eventFromUnknownInput", 0, eo, "exceptionFromError", 0, Z], 699976);
    var el = e.i(865607);
    e.s(["BrowserClient", 0, class extends j {
        eventFromException(e, t) {
            return ea(this._options.stackParser, e, t, this._options.attachStacktrace)
        }
        eventFromMessage(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "info",
                r = arguments.length > 2 ? arguments[2] : void 0;
            return ei(this._options.stackParser, e, t, r, this._options.attachStacktrace)
        }
        _prepareEvent(e, t, r, n) {
            return e.platform = e.platform || "javascript", super._prepareEvent(e, t, r, n)
        }
        constructor(e) {
            const t = function(e) {
                    return {
                        release: "string" == typeof __SENTRY_RELEASE__ ? __SENTRY_RELEASE__ : el.WINDOW.SENTRY_RELEASE?.id,
                        sendClientReports: !0,
                        parentSpanIsAlwaysRootSpan: !0,
                        ...e
                    }
                }(e),
                r = el.WINDOW.SENTRY_SDK_SOURCE || X();
            (0, Y.applySdkMetadata)(t, "browser", ["browser"], r), t._metadata?.sdk && (t._metadata.sdk.settings = {
                infer_ip: t.sendDefaultPii ? "auto" : "never",
                ...t._metadata.sdk.settings
            }), super(t);
            const {
                sendDefaultPii: n,
                sendClientReports: a,
                enableLogs: i,
                _experiments: o,
                enableMetrics: u
            } = this._options, c = u ?? o?.enableMetrics ?? !0;
            el.WINDOW.document && (a || i || c) && el.WINDOW.document.addEventListener("visibilitychange", () => {
                "hidden" === el.WINDOW.document.visibilityState && (a && this._flushOutcomes(), i && (0, s._INTERNAL_flushLogsBuffer)(this), c && (0, l._INTERNAL_flushMetricsBuffer)(this))
            }), n && this.on("beforeSendSession", J)
        }
    }], 687050);
    var eu = e.i(204078),
        ec = e.i(140332);
    let ed = {},
        ep = {};

    function ef(e, t) {
        ed[e] = ed[e] || [], ed[e].push(t)
    }

    function eh(e, t) {
        if (!ep[e]) {
            ep[e] = !0;
            try {
                t()
            } catch (t) {
                a.DEBUG_BUILD && m.debug.error(`Error while instrumenting ${e}`, t)
            }
        }
    }

    function em(e, t) {
        let r = e && ed[e];
        if (r)
            for (let n of r) try {
                n(t)
            } catch (t) {
                a.DEBUG_BUILD && m.debug.error(`Error while triggering instrumentation handler.
Type: ${e}
Name: ${(0,ec.getFunctionName)(n)}
Error:`, t)
            }
    }

    function eg() {
        "console" in eu.GLOBAL_OBJ && m.CONSOLE_LEVELS.forEach(function(e) {
            e in eu.GLOBAL_OBJ.console && (0, V.fill)(eu.GLOBAL_OBJ.console, e, function(t) {
                return m.originalConsoleMethods[e] = t,
                    function() {
                        for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                        em("console", {
                            args: r,
                            level: e
                        });
                        let a = m.originalConsoleMethods[e];
                        a?.apply(eu.GLOBAL_OBJ.console, r)
                    }
            })
        })
    }
    e.s(["addHandler", 0, ef, "maybeInstrument", 0, eh, "triggerHandlers", 0, em], 510068), e.s(["addConsoleInstrumentationHandler", 0, function(e) {
        let t = "console";
        ef(t, e), eh(t, eg)
    }], 694035)
}, 635089, 839826, 516814, 726158, 854787, e => {
    "use strict";
    var t = e.i(420546),
        r = e.i(59172),
        n = e.i(211429),
        a = e.i(398720),
        i = e.i(557156),
        o = e.i(204078),
        s = e.i(510068);

    function l(e) {
        let l = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
        (!l || (0, a.supportsNativeFetch)()) && (0, n.fill)(o.GLOBAL_OBJ, "fetch", function(a) {
            return function() {
                for (var l = arguments.length, u = Array(l), c = 0; c < l; c++) u[c] = arguments[c];
                let f = Error(),
                    {
                        method: h,
                        url: m
                    } = function(e) {
                        if (0 === e.length) return {
                            method: "GET",
                            url: ""
                        };
                        if (2 === e.length) {
                            let [t, n] = e;
                            return {
                                url: p(t),
                                method: d(n, "method") ? String(n.method).toUpperCase() : (0, r.isRequest)(t) && d(t, "method") ? String(t.method).toUpperCase() : "GET"
                            }
                        }
                        let t = e[0];
                        return {
                            url: p(t),
                            method: d(t, "method") ? String(t.method).toUpperCase() : "GET"
                        }
                    }(u),
                    g = {
                        args: u,
                        fetchData: {
                            method: h,
                            url: m
                        },
                        startTimestamp: 1e3 * (0, i.timestampInSeconds)(),
                        virtualError: f,
                        headers: function(e) {
                            let [t, n] = e;
                            try {
                                if ("object" == typeof n && null !== n && "headers" in n && n.headers) return new Headers(n.headers);
                                if ((0, r.isRequest)(t)) return new Headers(t.headers)
                            } catch {}
                        }(u)
                    };
                return e || (0, s.triggerHandlers)("fetch", {
                    ...g
                }), a.apply(o.GLOBAL_OBJ, u).then(async t => (e ? e(t) : (0, s.triggerHandlers)("fetch", {
                    ...g,
                    endTimestamp: 1e3 * (0, i.timestampInSeconds)(),
                    response: t
                }), t), e => {
                    (0, s.triggerHandlers)("fetch", {
                        ...g,
                        endTimestamp: 1e3 * (0, i.timestampInSeconds)(),
                        error: e
                    }), (0, r.isError)(e) && void 0 === e.stack && (e.stack = f.stack, (0, n.addNonEnumerableProperty)(e, "framesToPop", 1));
                    let a = (0, t.getClient)(),
                        o = a?.getOptions().enhanceFetchErrorMessages ?? "always";
                    if (!1 !== o && e instanceof TypeError && ("Failed to fetch" === e.message || "Load failed" === e.message || "NetworkError when attempting to fetch resource." === e.message)) try {
                        let t = new URL(g.fetchData.url).host;
                        "always" === o ? e.message = `${e.message} (${t})` : (0, n.addNonEnumerableProperty)(e, "__sentry_fetch_url_host__", t)
                    } catch {}
                    throw e
                })
            }
        })
    }
    async function u(e, t) {
        if (e?.body) {
            let r = e.body,
                n = r.getReader(),
                a = setTimeout(() => {
                    r.cancel().then(null, () => {})
                }, 9e4),
                i = !0;
            for (; i;) {
                let e;
                try {
                    e = setTimeout(() => {
                        r.cancel().then(null, () => {})
                    }, 5e3);
                    let {
                        done: a
                    } = await n.read();
                    clearTimeout(e), a && (t(), i = !1)
                } catch {
                    i = !1
                } finally {
                    clearTimeout(e)
                }
            }
            clearTimeout(a), n.releaseLock(), r.cancel().then(null, () => {})
        }
    }

    function c(e) {
        let t;
        try {
            t = e.clone()
        } catch {
            return
        }
        u(t, () => {
            (0, s.triggerHandlers)("fetch-body-resolved", {
                endTimestamp: 1e3 * (0, i.timestampInSeconds)(),
                response: e
            })
        })
    }

    function d(e, t) {
        return !!e && "object" == typeof e && !!e[t]
    }

    function p(e) {
        return "string" == typeof e ? e : e ? d(e, "url") ? e.url : e.toString ? e.toString() : "" : ""
    }
    e.s(["addFetchEndInstrumentationHandler", 0, function(e) {
        let t = "fetch-body-resolved";
        (0, s.addHandler)(t, e), (0, s.maybeInstrument)(t, () => l(c))
    }, "addFetchInstrumentationHandler", 0, function(e, t) {
        let r = "fetch";
        (0, s.addHandler)(r, e), (0, s.maybeInstrument)(r, () => l(void 0, t))
    }], 635089), e.s(["severityLevelFromString", 0, function(e) {
        return "warn" === e ? "warning" : ["fatal", "error", "warning", "log", "info", "debug"].includes(e) ? e : "log"
    }], 839826);
    var f = e.i(695524);

    function h(e) {
        return "isRelative" in e
    }
    e.s(["addBreadcrumb", 0, function(e, r) {
        let n = (0, t.getClient)(),
            a = (0, t.getIsolationScope)();
        if (!n) return;
        let {
            beforeBreadcrumb: o = null,
            maxBreadcrumbs: s = 100
        } = n.getOptions();
        if (s <= 0) return;
        let l = {
                timestamp: (0, i.dateTimestampInSeconds)(),
                ...e
            },
            u = o ? (0, f.consoleSandbox)(() => o(l, r)) : l;
        null !== u && (n.emit && n.emit("beforeAddBreadcrumb", u, r), a.addBreadcrumb(u, s))
    }], 516814), e.s(["getBreadcrumbLogLevelFromHttpStatusCode", 0, function(e) {
        if (void 0 !== e) return e >= 400 && e < 500 ? "warning" : e >= 500 ? "error" : void 0
    }], 726158), e.i(454181), e.s(["getSanitizedUrlStringFromUrlObject", 0, function(e) {
        if (h(e)) return e.pathname;
        let t = new URL(e);
        return t.search = "", t.hash = "", ["80", "443"].includes(t.port) && (t.port = ""), t.password && (t.password = "%filtered%"), t.username && (t.username = "%filtered%"), t.toString()
    }, "isURLObjectRelative", 0, h, "parseStringToURLObject", 0, function(e, t) {
        let r = 0 >= e.indexOf("://") && 0 !== e.indexOf("//"),
            n = t ?? (r ? "thismessage:/" : void 0);
        try {
            if ("canParse" in URL && !URL.canParse(e, n)) return;
            let t = new URL(e, n);
            if (r) return {
                isRelative: r,
                pathname: t.pathname,
                search: t.search,
                hash: t.hash
            };
            return t
        } catch {}
    }, "parseUrl", 0, function(e) {
        if (!e) return {};
        let t = e.match(/^(([^:/?#]+):)?(\/\/([^/?#]*))?([^?#]*)(\?([^#]*))?(#(.*))?$/);
        if (!t) return {};
        let r = t[6] || "",
            n = t[8] || "";
        return {
            host: t[4],
            path: t[5],
            protocol: t[2],
            search: r,
            hash: n,
            relative: t[5] + r + n
        }
    }, "stripDataUrlContent", 0, function(e) {
        let t = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1];
        if (e.startsWith("data:")) {
            let r = e.match(/^data:([^;,]+)/),
                n = r ? r[1] : "text/plain",
                a = e.includes(";base64,"),
                i = e.indexOf(","),
                o = "";
            if (t && -1 !== i) {
                let t = e.slice(i + 1);
                o = t.length > 10 ? `${t.slice(0,10)}... [truncated]` : t
            }
            return `data:${n}${a?",base64":""}${o?`,${o}`:""}`
        }
        return e
    }, "stripUrlQueryAndFragment", 0, function(e) {
        return e.split(/[?#]/, 1)[0]
    }], 854787)
}, 357640, 196171, 956928, 357486, 568207, 70550, 19296, 733916, 865915, 502247, 622732, 163671, 974231, e => {
    "use strict";
    let t, r, n, a;
    var i = e.i(930064),
        o = e.i(694035),
        s = e.i(635089),
        l = e.i(420546),
        u = e.i(403770),
        c = e.i(839826),
        d = e.i(516814),
        p = e.i(695524),
        f = e.i(880985),
        h = e.i(726158),
        m = e.i(854787),
        g = e.i(483e3),
        _ = e.i(510068),
        v = e.i(211429),
        y = e.i(845068);

    function b(e) {
        (0, _.addHandler)("dom", e), (0, _.maybeInstrument)("dom", E)
    }

    function E() {
        if (!y.WINDOW.document) return;
        let e = _.triggerHandlers.bind(null, "dom"),
            t = S(e, !0);
        y.WINDOW.document.addEventListener("click", t, !1), y.WINDOW.document.addEventListener("keypress", t, !1), ["EventTarget", "Node"].forEach(t => {
            let r = y.WINDOW,
                n = r[t]?.prototype;
            n?.hasOwnProperty?.("addEventListener") && ((0, v.fill)(n, "addEventListener", function(t) {
                return function(r, n, a) {
                    if ("click" === r || "keypress" == r) try {
                        let n = this.__sentry_instrumentation_handlers__ = this.__sentry_instrumentation_handlers__ || {},
                            i = n[r] = n[r] || {
                                refCount: 0
                            };
                        if (!i.handler) {
                            let n = S(e);
                            i.handler = n, t.call(this, r, n, a)
                        }
                        i.refCount++
                    } catch {}
                    return t.call(this, r, n, a)
                }
            }), (0, v.fill)(n, "removeEventListener", function(e) {
                return function(t, r, n) {
                    if ("click" === t || "keypress" == t) try {
                        let r = this.__sentry_instrumentation_handlers__ || {},
                            a = r[t];
                        a && (a.refCount--, a.refCount <= 0 && (e.call(this, t, a.handler, n), a.handler = void 0, delete r[t]), 0 === Object.keys(r).length && delete this.__sentry_instrumentation_handlers__)
                    } catch {}
                    return e.call(this, t, r, n)
                }
            }))
        })
    }

    function S(e) {
        let a = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
        return i => {
            var o;
            if (!i || i._sentryCaptured) return;
            let s = function(e) {
                try {
                    return e.target
                } catch {
                    return null
                }
            }(i);
            if (o = i.type, "keypress" === o && (!s?.tagName || "INPUT" !== s.tagName && "TEXTAREA" !== s.tagName && !s.isContentEditable && 1)) return;
            (0, v.addNonEnumerableProperty)(i, "_sentryCaptured", !0), s && !s._sentryId && (0, v.addNonEnumerableProperty)(s, "_sentryId", (0, g.uuid4)());
            let l = "keypress" === i.type ? "input" : i.type;
            ! function(e) {
                if (e.type !== r) return !1;
                try {
                    if (!e.target || e.target._sentryId !== n) return !1
                } catch {}
                return !0
            }(i) && (e({
                event: i,
                name: l,
                global: a
            }), r = i.type, n = s ? s._sentryId : void 0), clearTimeout(t), t = y.WINDOW.setTimeout(() => {
                n = void 0, r = void 0
            }, 1e3)
        }
    }
    e.s(["addClickKeypressInstrumentationHandler", 0, b], 196171);
    var T = e.i(557156),
        R = e.i(59172);
    let I = "__sentry_xhr_v3__";

    function O(e) {
        (0, _.addHandler)("xhr", e), (0, _.maybeInstrument)("xhr", P)
    }

    function P() {
        if (!y.WINDOW.XMLHttpRequest) return;
        let e = XMLHttpRequest.prototype;
        e.open = new Proxy(e.open, {
            apply(e, t, r) {
                let n = Error(),
                    a = 1e3 * (0, T.timestampInSeconds)(),
                    i = (0, R.isString)(r[0]) ? r[0].toUpperCase() : void 0,
                    o = function(e) {
                        if ((0, R.isString)(e)) return e;
                        try {
                            return e.toString()
                        } catch {}
                    }(r[1]);
                if (!i || !o) return e.apply(t, r);
                t[I] = {
                    method: i,
                    url: o,
                    request_headers: {}
                }, "POST" === i && o.match(/sentry_key/) && (t.__sentry_own_request__ = !0);
                let s = () => {
                    let e = t[I];
                    if (e && 4 === t.readyState) {
                        try {
                            e.status_code = t.status
                        } catch {}
                        let r = {
                            endTimestamp: 1e3 * (0, T.timestampInSeconds)(),
                            startTimestamp: a,
                            xhr: t,
                            virtualError: n
                        };
                        (0, _.triggerHandlers)("xhr", r)
                    }
                };
                return "onreadystatechange" in t && "function" == typeof t.onreadystatechange ? t.onreadystatechange = new Proxy(t.onreadystatechange, {
                    apply: (e, t, r) => (s(), e.apply(t, r))
                }) : t.addEventListener("readystatechange", s), t.setRequestHeader = new Proxy(t.setRequestHeader, {
                    apply(e, t, r) {
                        let [n, a] = r, i = t[I];
                        return i && (0, R.isString)(n) && (0, R.isString)(a) && (i.request_headers[n.toLowerCase()] = a), e.apply(t, r)
                    }
                }), e.apply(t, r)
            }
        }), e.send = new Proxy(e.send, {
            apply(e, t, r) {
                let n = t[I];
                if (!n) return e.apply(t, r);
                void 0 !== r[0] && (n.body = r[0]);
                let a = {
                    startTimestamp: 1e3 * (0, T.timestampInSeconds)(),
                    xhr: t
                };
                return (0, _.triggerHandlers)("xhr", a), e.apply(t, r)
            }
        })
    }
    e.s(["SENTRY_XHR_DATA_KEY", 0, I, "addXhrInstrumentationHandler", 0, O], 956928);
    var w = e.i(398720);

    function N(e) {
        let t = "history";
        (0, _.addHandler)(t, e), (0, _.maybeInstrument)(t, A)
    }

    function A() {
        function e(e) {
            return function() {
                for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                let i = r.length > 2 ? r[2] : void 0;
                if (i) {
                    let t = a,
                        n = function(e) {
                            try {
                                return new URL(e, y.WINDOW.location.origin).toString()
                            } catch {
                                return e
                            }
                        }(String(i));
                    if (a = n, t === n) return e.apply(this, r);
                    (0, _.triggerHandlers)("history", {
                        from: t,
                        to: n
                    })
                }
                return e.apply(this, r)
            }
        }
        y.WINDOW.addEventListener("popstate", () => {
            let e = y.WINDOW.location.href,
                t = a;
            a = e, t === e || (0, _.triggerHandlers)("history", {
                from: t,
                to: e
            })
        }), (0, w.supportsHistory)() && ((0, v.fill)(y.WINDOW.history, "pushState", e), (0, v.fill)(y.WINDOW.history, "replaceState", e))
    }
    e.s(["addHistoryInstrumentationHandler", 0, N], 357486);
    var C = e.i(563969),
        D = e.i(865607);
    let x = (0, i.defineIntegration)(function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
            t = {
                console: !0,
                dom: !0,
                fetch: !0,
                history: !0,
                sentry: !0,
                xhr: !0,
                ...e
            };
        return {
            name: "Breadcrumbs",
            setup(e) {
                var r, n, a, i, _, v, y;
                t.console && (0, o.addConsoleInstrumentationHandler)((r = e, function(e) {
                    if ((0, l.getClient)() !== r) return;
                    let t = {
                        category: "console",
                        data: {
                            arguments: e.args,
                            logger: "console"
                        },
                        level: (0, c.severityLevelFromString)(e.level),
                        message: (0, u.safeJoin)(e.args, " ")
                    };
                    if ("assert" === e.level)
                        if (!1 !== e.args[0]) return;
                        else t.message = `Assertion failed: ${(0,u.safeJoin)(e.args.slice(1)," ")||"console.assert"}`, t.data.arguments = e.args.slice(1);
                    (0, d.addBreadcrumb)(t, {
                        input: e.args,
                        level: e.level
                    })
                })), t.dom && b((n = e, a = t.dom, function(e) {
                    let t, r;
                    if ((0, l.getClient)() !== n) return;
                    let i = "object" == typeof a ? a.serializeAttribute : void 0,
                        o = "object" == typeof a && "number" == typeof a.maxStringLength ? a.maxStringLength : void 0;
                    o && o > 1024 && (C.DEBUG_BUILD && p.debug.warn(`\`dom.maxStringLength\` cannot exceed 1024, but a value of ${o} was configured. Sentry will use 1024 instead.`), o = 1024), "string" == typeof i && (i = [i]);
                    try {
                        var s;
                        let n = e.event,
                            a = (s = n) && s.target ? n.target : n;
                        t = (0, f.htmlTreeAsString)(a, {
                            keyAttrs: i,
                            maxStringLength: o
                        }), r = (0, f.getComponentName)(a)
                    } catch {
                        t = "<unknown>"
                    }
                    if (0 === t.length) return;
                    let u = {
                        category: `ui.${e.name}`,
                        message: t
                    };
                    r && (u.data = {
                        "ui.component_name": r
                    }), (0, d.addBreadcrumb)(u, {
                        event: e.event,
                        name: e.name,
                        global: e.global
                    })
                })), t.xhr && O((i = e, function(e) {
                    if ((0, l.getClient)() !== i) return;
                    let {
                        startTimestamp: t,
                        endTimestamp: r
                    } = e, n = e.xhr[I];
                    if (!t || !r || !n) return;
                    let {
                        method: a,
                        url: o,
                        status_code: s,
                        body: u
                    } = n, c = {
                        xhr: e.xhr,
                        input: u,
                        startTimestamp: t,
                        endTimestamp: r
                    }, p = {
                        category: "xhr",
                        data: {
                            method: a,
                            url: o,
                            status_code: s
                        },
                        type: "http",
                        level: (0, h.getBreadcrumbLogLevelFromHttpStatusCode)(s)
                    };
                    i.emit("beforeOutgoingRequestBreadcrumb", p, c), (0, d.addBreadcrumb)(p, c)
                })), t.fetch && (0, s.addFetchInstrumentationHandler)((_ = e, function(e) {
                    if ((0, l.getClient)() !== _) return;
                    let {
                        startTimestamp: t,
                        endTimestamp: r
                    } = e;
                    if (r && (!e.fetchData.url.match(/sentry_key/) || "POST" !== e.fetchData.method))
                        if (e.error) {
                            let n = {
                                    data: e.error,
                                    input: e.args,
                                    startTimestamp: t,
                                    endTimestamp: r
                                },
                                a = {
                                    category: "fetch",
                                    data: e.fetchData,
                                    level: "error",
                                    type: "http"
                                };
                            _.emit("beforeOutgoingRequestBreadcrumb", a, n), (0, d.addBreadcrumb)(a, n)
                        } else {
                            let n = e.response,
                                a = {
                                    ...e.fetchData,
                                    status_code: n?.status
                                },
                                i = {
                                    input: e.args,
                                    response: n,
                                    startTimestamp: t,
                                    endTimestamp: r
                                },
                                o = {
                                    category: "fetch",
                                    data: a,
                                    type: "http",
                                    level: (0, h.getBreadcrumbLogLevelFromHttpStatusCode)(a.status_code)
                                };
                            _.emit("beforeOutgoingRequestBreadcrumb", o, i), (0, d.addBreadcrumb)(o, i)
                        }
                })), t.history && N((v = e, function(e) {
                    if ((0, l.getClient)() !== v) return;
                    let t = e.from,
                        r = e.to,
                        n = (0, m.parseUrl)(D.WINDOW.location.href),
                        a = t ? (0, m.parseUrl)(t) : void 0,
                        i = (0, m.parseUrl)(r);
                    a?.path || (a = n), n.protocol === i.protocol && n.host === i.host && (r = i.relative), n.protocol === a.protocol && n.host === a.host && (t = a.relative), (0, d.addBreadcrumb)({
                        category: "navigation",
                        data: {
                            from: t,
                            to: r
                        }
                    })
                })), t.sentry && e.on("beforeSendEvent", (y = e, function(e) {
                    (0, l.getClient)() === y && (0, d.addBreadcrumb)({
                        category: `sentry.${"transaction"===e.type?"transaction":"event"}`,
                        event_id: e.event_id,
                        level: e.level,
                        message: (0, g.getEventDescription)(e)
                    }, {
                        event: e
                    })
                }))
            }
        }
    });
    e.s(["breadcrumbsIntegration", 0, x], 357640);
    var L = e.i(140332);
    let U = "EventTarget,Window,Node,ApplicationCache,AudioTrackList,BroadcastChannel,ChannelMergerNode,CryptoOperation,EventSource,FileReader,HTMLUnknownElement,IDBDatabase,IDBRequest,IDBTransaction,KeyOperation,MediaController,MessagePort,ModalWindow,Notification,SVGElementInstance,Screen,SharedWorker,TextTrack,TextTrackCue,TextTrackList,WebSocket,WebSocketWorker,Worker,XMLHttpRequest,XMLHttpRequestEventTarget,XMLHttpRequestUpload".split(","),
        M = (0, i.defineIntegration)(function() {
            let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                t = {
                    XMLHttpRequest: !0,
                    eventTarget: !0,
                    requestAnimationFrame: !0,
                    setInterval: !0,
                    setTimeout: !0,
                    unregisterOriginalCallbacks: !1,
                    ...e
                };
            return {
                name: "BrowserApiErrors",
                setupOnce() {
                    t.setTimeout && (0, v.fill)(D.WINDOW, "setTimeout", B), t.setInterval && (0, v.fill)(D.WINDOW, "setInterval", B), t.requestAnimationFrame && (0, v.fill)(D.WINDOW, "requestAnimationFrame", k), t.XMLHttpRequest && "XMLHttpRequest" in D.WINDOW && (0, v.fill)(XMLHttpRequest.prototype, "send", j);
                    let e = t.eventTarget;
                    e && (Array.isArray(e) ? e : U).forEach(e => {
                        var r, n;
                        let a, i;
                        return r = e, n = t, a = D.WINDOW, i = a[r]?.prototype, void(i?.hasOwnProperty?.("addEventListener") && ((0, v.fill)(i, "addEventListener", function(e) {
                            return function(t, a, i) {
                                var o, s, l, u;
                                try {
                                    o = a, "function" == typeof o.handleEvent && (a.handleEvent = (0, D.wrap)(a.handleEvent, {
                                        mechanism: {
                                            data: {
                                                handler: (0, L.getFunctionName)(a),
                                                target: r
                                            },
                                            handled: !1,
                                            type: "auto.browser.browserapierrors.handleEvent"
                                        }
                                    }))
                                } catch {}
                                return n.unregisterOriginalCallbacks && (s = this, l = t, u = a, s && "object" == typeof s && "removeEventListener" in s && "function" == typeof s.removeEventListener && s.removeEventListener(l, u)), e.apply(this, [t, (0, D.wrap)(a, {
                                    mechanism: {
                                        data: {
                                            handler: (0, L.getFunctionName)(a),
                                            target: r
                                        },
                                        handled: !1,
                                        type: "auto.browser.browserapierrors.addEventListener"
                                    }
                                }), i])
                            }
                        }), (0, v.fill)(i, "removeEventListener", function(e) {
                            return function(t, r, n) {
                                try {
                                    let a = r.__sentry_wrapped__;
                                    a && e.call(this, t, a, n)
                                } catch {}
                                return e.call(this, t, r, n)
                            }
                        })))
                    })
                }
            }
        });

    function B(e) {
        return function() {
            for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
            let a = r[0];
            return r[0] = (0, D.wrap)(a, {
                mechanism: {
                    handled: !1,
                    type: `auto.browser.browserapierrors.${(0,L.getFunctionName)(e)}`
                }
            }), e.apply(this, r)
        }
    }

    function k(e) {
        return function(t) {
            return e.apply(this, [(0, D.wrap)(t, {
                mechanism: {
                    data: {
                        handler: (0, L.getFunctionName)(e)
                    },
                    handled: !1,
                    type: "auto.browser.browserapierrors.requestAnimationFrame"
                }
            })])
        }
    }

    function j(e) {
        return function() {
            for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
            let a = this;
            return ["onload", "onerror", "onprogress", "onreadystatechange"].forEach(e => {
                e in a && "function" == typeof a[e] && (0, v.fill)(a, e, function(t) {
                    let r = {
                            mechanism: {
                                data: {
                                    handler: (0, L.getFunctionName)(t)
                                },
                                handled: !1,
                                type: `auto.browser.browserapierrors.xhr.${e}`
                            }
                        },
                        n = (0, v.getOriginalFunction)(t);
                    return n && (r.mechanism.data.handler = (0, L.getFunctionName)(n)), (0, D.wrap)(t, r)
                })
            }), e.apply(this, r)
        }
    }
    e.s(["browserApiErrorsIntegration", 0, M], 568207);
    var $ = e.i(285586);
    let W = (0, i.defineIntegration)(function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
            t = e.lifecycle ?? "route";
        return {
            name: "BrowserSession",
            setupOnce() {
                if (void 0 === D.WINDOW.document) {
                    C.DEBUG_BUILD && p.debug.warn("Using the `browserSessionIntegration` in non-browser environments is not supported.");
                    return
                }(0, $.startSession)({
                    ignoreDuration: !0
                }), (0, $.captureSession)();
                let e = (0, l.getIsolationScope)(),
                    r = e.getUser();
                e.addScopeListener(e => {
                    let t = e.getUser();
                    (r?.id !== t?.id || r?.ip_address !== t?.ip_address) && ((0, $.captureSession)(), r = t)
                }), "route" === t && N(e => {
                    let {
                        from: t,
                        to: r
                    } = e;
                    t !== r && ((0, $.startSession)({
                        ignoreDuration: !0
                    }), (0, $.captureSession)())
                })
            }
        }
    });
    e.s(["browserSessionIntegration", 0, W], 70550);
    let F = (0, i.defineIntegration)(() => ({
        name: "CultureContext",
        preprocessEvent(e) {
            let t = H();
            t && (e.contexts = {
                ...e.contexts,
                culture: {
                    ...t,
                    ...e.contexts?.culture
                }
            })
        },
        processSegmentSpan(e) {
            let t = H();
            t && (e.attributes = {
                "culture.locale": t.locale,
                "culture.timezone": t.timezone,
                "culture.calendar": t.calendar,
                ...e.attributes
            })
        }
    }));

    function H() {
        try {
            let e = D.WINDOW.Intl;
            if (!e) return;
            let t = e.DateTimeFormat().resolvedOptions();
            return {
                locale: t.locale,
                timezone: t.timeZone,
                calendar: t.calendar
            }
        } catch {
            return
        }
    }
    e.s(["cultureContextIntegration", 0, F], 19296);
    var G = e.i(204078);
    let q = null;

    function z(e) {
        let t = "error";
        (0, _.addHandler)(t, e), (0, _.maybeInstrument)(t, X)
    }

    function X() {
        q = G.GLOBAL_OBJ.onerror, G.GLOBAL_OBJ.onerror = function(e, t, r, n, a) {
            return (0, _.triggerHandlers)("error", {
                column: n,
                error: a,
                line: r,
                msg: e,
                url: t
            }), !!q && q.apply(this, arguments)
        }, G.GLOBAL_OBJ.onerror.__SENTRY_INSTRUMENTED__ = !0
    }
    e.s(["addGlobalErrorInstrumentationHandler", 0, z], 733916);
    let Y = null;

    function J(e) {
        let t = "unhandledrejection";
        (0, _.addHandler)(t, e), (0, _.maybeInstrument)(t, K)
    }

    function K() {
        Y = G.GLOBAL_OBJ.onunhandledrejection, G.GLOBAL_OBJ.onunhandledrejection = function(e) {
            return (0, _.triggerHandlers)("unhandledrejection", e), !Y || Y.apply(this, arguments)
        }, G.GLOBAL_OBJ.onunhandledrejection.__SENTRY_INSTRUMENTED__ = !0
    }
    e.s(["addGlobalUnhandledRejectionInstrumentationHandler", 0, J], 865915);
    var V = e.i(699976);
    let Q = (0, i.defineIntegration)(function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
            t = {
                onerror: !0,
                onunhandledrejection: !0,
                ...e
            };
        return {
            name: "GlobalHandlers",
            setupOnce() {
                Error.stackTraceLimit = 50
            },
            setup(e) {
                var r, n;
                t.onerror && (r = e, z(e => {
                    var t, n, a, i;
                    let o, s, u, c, d, {
                        stackParser: p,
                        attachStacktrace: h
                    } = er();
                    if ((0, l.getClient)() !== r || (0, D.shouldIgnoreOnError)()) return;
                    let {
                        msg: g,
                        url: _,
                        line: v,
                        column: y,
                        error: b
                    } = e, E = (t = (0, V.eventFromUnknownInput)(p, b || g, void 0, h, !1), n = _, a = v, i = y, 0 === (d = (c = (u = (s = (o = t.exception = t.exception || {}).values = o.values || [])[0] = s[0] || {}).stacktrace = u.stacktrace || {}).frames = c.frames || []).length && d.push({
                        colno: i,
                        lineno: a,
                        filename: function(e) {
                            if ((0, R.isString)(e) && 0 !== e.length) return e.startsWith("data:") ? `<${(0,m.stripDataUrlContent)(e,!1)}>` : e
                        }(n) ?? (0, f.getLocationHref)(),
                        function: L.UNKNOWN_FUNCTION,
                        in_app: !0
                    }), t);
                    E.level = "error", (0, $.captureEvent)(E, {
                        originalException: b,
                        mechanism: {
                            handled: !1,
                            type: "auto.browser.global_handlers.onerror"
                        }
                    })
                }), et("onerror")), t.onunhandledrejection && (n = e, J(e => {
                    let {
                        stackParser: t,
                        attachStacktrace: r
                    } = er();
                    if ((0, l.getClient)() !== n || (0, D.shouldIgnoreOnError)()) return;
                    let a = Z(e),
                        i = (0, R.isPrimitive)(a) ? ee(a) : (0, V.eventFromUnknownInput)(t, a, void 0, r, !0);
                    i.level = "error", (0, $.captureEvent)(i, {
                        originalException: a,
                        mechanism: {
                            handled: !1,
                            type: "auto.browser.global_handlers.onunhandledrejection"
                        }
                    })
                }), et("onunhandledrejection"))
            }
        }
    });

    function Z(e) {
        if ((0, R.isPrimitive)(e)) return e;
        try {
            if ("reason" in e) return e.reason;
            if ("detail" in e && "reason" in e.detail) return e.detail.reason
        } catch {}
        return e
    }

    function ee(e) {
        return {
            exception: {
                values: [{
                    type: "UnhandledRejection",
                    value: `Non-Error promise rejection captured with value: ${String(e)}`
                }]
            }
        }
    }

    function et(e) {
        C.DEBUG_BUILD && p.debug.log(`Global Handler attached: ${e}`)
    }

    function er() {
        let e = (0, l.getClient)();
        return e?.getOptions() || {
            stackParser: () => [],
            attachStacktrace: !1
        }
    }
    e.s(["_eventFromRejectionWithPrimitive", 0, ee, "_getUnhandledRejectionError", 0, Z, "globalHandlersIntegration", 0, Q], 502247);
    let en = (0, i.defineIntegration)(() => ({
        name: "HttpContext",
        preprocessEvent(e) {
            if (!D.WINDOW.navigator && !D.WINDOW.location && !D.WINDOW.document) return;
            let t = (0, D.getHttpRequestData)(),
                r = {
                    ...t.headers,
                    ...e.request?.headers
                };
            e.request = {
                ...t,
                ...e.request,
                headers: r
            }
        }
    }));

    function ea(e) {
        return Array.isArray(e.errors)
    }

    function ei(e, t, r) {
        e.mechanism = {
            handled: !0,
            type: "auto.core.linked_errors",
            ...ea(r) && {
                is_exception_group: !0
            },
            ...e.mechanism,
            exception_id: t
        }
    }

    function eo(e, t, r, n) {
        e.mechanism = {
            handled: !0,
            ...e.mechanism,
            type: "chained",
            source: t,
            exception_id: r,
            parent_id: n
        }
    }
    e.s(["httpContextIntegration", 0, en], 622732);
    let es = (0, i.defineIntegration)(function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
            t = e.limit || 5,
            r = e.key || "cause";
        return {
            name: "LinkedErrors",
            preprocessEvent(e, n, a) {
                let i = a.getOptions();
                ! function(e, t, r, n, a, i) {
                    if (!a.exception?.values || !i || !(0, R.isInstanceOf)(i.originalException, Error)) return;
                    let o = a.exception.values.length > 0 ? a.exception.values[a.exception.values.length - 1] : void 0;
                    o && (a.exception.values = function e(t, r, n, a, i, o, s, l) {
                        if (o.length >= n + 1) return o;
                        let u = [...o];
                        if ((0, R.isInstanceOf)(a[i], Error)) {
                            ei(s, l, a);
                            let o = t(r, a[i]),
                                c = u.length;
                            eo(o, i, c, l), u = e(t, r, n, a[i], i, [o, ...u], o, c)
                        }
                        return ea(a) && a.errors.forEach((o, c) => {
                            if ((0, R.isInstanceOf)(o, Error)) {
                                ei(s, l, a);
                                let d = t(r, o),
                                    p = u.length;
                                eo(d, `errors[${c}]`, p, l), u = e(t, r, n, o, i, [d, ...u], d, p)
                            }
                        }), u
                    }(e, t, n, i.originalException, r, a.exception.values, o, 0))
                }(V.exceptionFromError, i.stackParser, r, t, e, n)
            }
        }
    });

    function el(e, t, r, n) {
        let a = {
            filename: e,
            function: "<anonymous>" === t ? L.UNKNOWN_FUNCTION : t,
            in_app: !0
        };
        return void 0 !== r && (a.lineno = r), void 0 !== n && (a.colno = n), a
    }
    e.s(["linkedErrorsIntegration", 0, es], 163671);
    let eu = /^\s*at (\S+?)(?::(\d+))(?::(\d+))\s*$/i,
        ec = /^\s*at (?:(.+?\)(?: \[.+\])?|.*?) ?\((?:address at )?)?(?:async )?((?:<anonymous>|[-a-z]+:|.*bundle|\/)?.*?)(?::(\d+))?(?::(\d+))?\)?\s*$/i,
        ed = /\((\S*)(?::(\d+))(?::(\d+))\)/,
        ep = /at (.+?) ?\(data:(.+?),/,
        ef = [30, e => {
            let t = e.match(ep);
            if (t) return {
                filename: `<data:${t[2]}>`,
                function: t[1]
            };
            let r = eu.exec(e);
            if (r) {
                let [, e, t, n] = r;
                return el(e, L.UNKNOWN_FUNCTION, +t, +n)
            }
            let n = ec.exec(e);
            if (n) {
                if (n[2]?.indexOf("eval") === 0) {
                    let e = ed.exec(n[2]);
                    e && (n[2] = e[1], n[3] = e[2], n[4] = e[3])
                }
                let [e, t] = eI(n[1] || L.UNKNOWN_FUNCTION, n[2]);
                return el(t, e, n[3] ? +n[3] : void 0, n[4] ? +n[4] : void 0)
            }
        }],
        eh = /^\s*(.*?)(?:\((.*?)\))?(?:^|@)?((?:[-a-z]+)?:\/.*?|\[native code\]|[^@]*(?:bundle|\d+\.js)|\/[\w\-. /=]+)(?::(\d+))?(?::(\d+))?\s*$/i,
        em = /(\S+) line (\d+)(?: > eval line \d+)* > eval/i,
        eg = [50, e => {
            let t = eh.exec(e);
            if (t) {
                if (t[3] && t[3].indexOf(" > eval") > -1) {
                    let e = em.exec(t[3]);
                    e && (t[1] = t[1] || "eval", t[3] = e[1], t[4] = e[2], t[5] = "")
                }
                let e = t[3],
                    r = t[1] || L.UNKNOWN_FUNCTION;
                return [r, e] = eI(r, e), el(e, r, t[4] ? +t[4] : void 0, t[5] ? +t[5] : void 0)
            }
        }],
        e_ = /^\s*at (?:((?:\[object object\])?.+) )?\(?((?:[-a-z]+):.*?):(\d+)(?::(\d+))?\)?\s*$/i,
        ev = [40, e => {
            let t = e_.exec(e);
            return t ? el(t[2], t[1] || L.UNKNOWN_FUNCTION, +t[3], t[4] ? +t[4] : void 0) : void 0
        }],
        ey = / line (\d+).*script (?:in )?(\S+)(?:: in function (\S+))?$/i,
        eb = [10, e => {
            let t = ey.exec(e);
            return t ? el(t[2], t[3] || L.UNKNOWN_FUNCTION, +t[1]) : void 0
        }],
        eE = / line (\d+), column (\d+)\s*(?:in (?:<anonymous function: ([^>]+)>|([^)]+))\(.*\))? in (.*):\s*$/i,
        eS = [20, e => {
            let t = eE.exec(e);
            return t ? el(t[5], t[3] || t[4] || L.UNKNOWN_FUNCTION, +t[1], +t[2]) : void 0
        }],
        eT = [ef, eg],
        eR = (0, L.createStackParser)(...eT),
        eI = (e, t) => {
            let r = -1 !== e.indexOf("safari-extension"),
                n = -1 !== e.indexOf("safari-web-extension");
            return r || n ? [-1 !== e.indexOf("@") ? e.split("@")[0] : L.UNKNOWN_FUNCTION, r ? `safari-extension:${t}` : `safari-web-extension:${t}`] : [e, t]
        };
    e.s(["chromeStackLineParser", 0, ef, "defaultStackLineParsers", 0, eT, "defaultStackParser", 0, eR, "geckoStackLineParser", 0, eg, "opera10StackLineParser", 0, eb, "opera11StackLineParser", 0, eS, "winjsStackLineParser", 0, ev], 974231)
}, 822138, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "BloomFilter", {
        enumerable: !0,
        get: function() {
            return n
        }
    });
    class n {
        static from(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 1e-4,
                r = new n(e.length, t);
            for (let t of e) r.add(t);
            return r
        }
        export () {
            return {
                numItems: this.numItems,
                errorRate: this.errorRate,
                numBits: this.numBits,
                numHashes: this.numHashes,
                bitArray: this.bitArray
            }
        }
        import(e) {
            this.numItems = e.numItems, this.errorRate = e.errorRate, this.numBits = e.numBits, this.numHashes = e.numHashes, this.bitArray = e.bitArray
        }
        add(e) {
            this.getHashValues(e).forEach(e => {
                this.bitArray[e] = 1
            })
        }
        contains(e) {
            return this.getHashValues(e).every(e => this.bitArray[e])
        }
        getHashValues(e) {
            let t = [];
            for (let r = 1; r <= this.numHashes; r++) {
                let n = function(e) {
                    let t = 0;
                    for (let r = 0; r < e.length; r++) t = Math.imul(t ^ e.charCodeAt(r), 0x5bd1e995), t ^= t >>> 13, t = Math.imul(t, 0x5bd1e995);
                    return t >>> 0
                }(`${e}${r}`) % this.numBits;
                t.push(n)
            }
            return t
        }
        constructor(e, t = 1e-4) {
            this.numItems = e, this.errorRate = t, this.numBits = Math.ceil(-(e * Math.log(t)) / (Math.log(2) * Math.log(2))), this.numHashes = Math.ceil(this.numBits / e * Math.log(2)), this.bitArray = Array(this.numBits).fill(0)
        }
    }
}, 497298, (e, t, r) => {
    "use strict";

    function n(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "";
        return ("/" === e ? "/index" : /^\/index(\/|$)/.test(e) ? `/index${e}` : e) + t
    }
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "default", {
        enumerable: !0,
        get: function() {
            return n
        }
    })
}, 489296, (e, t, r) => {
    "use strict";
    let n;

    function a(e) {
        return (void 0 === n && "u" > typeof window && (n = window.trustedTypes?.createPolicy("nextjs", {
            createHTML: e => e,
            createScript: e => e,
            createScriptURL: e => e
        }) || null), n)?.createScriptURL(e) || e
    }
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "__unsafeCreateTrustedScriptURL", {
        enumerable: !0,
        get: function() {
            return a
        }
    }), ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 210390, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        cancelIdleCallback: function() {
            return o
        },
        requestIdleCallback: function() {
            return i
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });
    let i = "u" > typeof self && self.requestIdleCallback && self.requestIdleCallback.bind(window) || function(e) {
            let t = Date.now();
            return self.setTimeout(function() {
                e({
                    didTimeout: !1,
                    timeRemaining: function() {
                        return Math.max(0, 50 - (Date.now() - t))
                    }
                })
            }, 1)
        },
        o = "u" > typeof self && self.cancelIdleCallback && self.cancelIdleCallback.bind(window) || function(e) {
            return clearTimeout(e)
        };
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 905625, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "resolvePromiseWithTimeout", {
        enumerable: !0,
        get: function() {
            return a
        }
    });
    let n = e.r(210390);

    function a(e, t, r) {
        return new Promise((r, a) => {
            let i = !1;
            e.then(e => {
                i = !0, r(e)
            }).catch(a), (0, n.requestIdleCallback)(() => setTimeout(() => {
                i || a(t)
            }, 3800))
        })
    }("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 639948, (e, t, r) => {
    "use strict";
    let n;
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var a = {
        createRouteLoader: function() {
            return v
        },
        getClientBuildManifest: function() {
            return g
        },
        isAssetError: function() {
            return h
        },
        markAssetError: function() {
            return f
        }
    };
    for (var i in a) Object.defineProperty(r, i, {
        enumerable: !0,
        get: a[i]
    });
    e.r(481258), e.r(497298);
    let o = e.r(489296),
        s = e.r(210390),
        l = e.r(61509),
        u = e.r(482729),
        c = e.r(905625);

    function d(e, t, r) {
        let n, a = t.get(e);
        if (a) return "future" in a ? a.future : Promise.resolve(a);
        let i = new Promise(e => {
            n = e
        });
        return t.set(e, {
            resolve: n,
            future: i
        }), r ? r().then(e => (n(e), e)).catch(r => {
            throw t.delete(e), r
        }) : i
    }
    let p = Symbol("ASSET_LOAD_ERROR");

    function f(e) {
        return Object.defineProperty(e, p, {})
    }

    function h(e) {
        return e && p in e
    }
    let m = function(e) {
        try {
            return e = document.createElement("link"), !!window.MSInputMethodContext && !!document.documentMode || e.relList.supports("prefetch")
        } catch {
            return !1
        }
    }();

    function g() {
        if (self.__BUILD_MANIFEST) return Promise.resolve(self.__BUILD_MANIFEST);
        let e = new Promise(e => {
            let t = self.__BUILD_MANIFEST_CB;
            self.__BUILD_MANIFEST_CB = () => {
                e(self.__BUILD_MANIFEST), t && t()
            }
        });
        return (0, c.resolvePromiseWithTimeout)(e, f(Object.defineProperty(Error("Failed to load client build manifest"), "__NEXT_ERROR_CODE", {
            value: "E273",
            enumerable: !1,
            configurable: !0
        })), n)
    }

    function _(e, t) {
        return g().then(r => {
            if (!(t in r)) throw f(Object.defineProperty(Error(`Failed to lookup route: ${t}`), "__NEXT_ERROR_CODE", {
                value: "E446",
                enumerable: !1,
                configurable: !0
            }));
            let n = r[t].map(t => e + "/_next/" + (0, u.encodeURIPath)(t));
            return {
                scripts: n.filter(e => e.endsWith(".js")).map(e => (0, o.__unsafeCreateTrustedScriptURL)(e) + (0, l.getAssetTokenQuery)()),
                css: n.filter(e => e.endsWith(".css")).map(e => e + (0, l.getAssetTokenQuery)())
            }
        })
    }

    function v(e) {
        let t = new Map,
            r = new Map,
            a = new Map,
            i = new Map;

        function o(e) {
            {
                var t;
                let n = r.get(e.toString());
                return n ? n : document.querySelector(`script[src^="${e}"]`) ? Promise.resolve() : (r.set(e.toString(), n = new Promise((r, n) => {
                    (t = document.createElement("script")).onload = r, t.onerror = () => n(f(Object.defineProperty(Error(`Failed to load script: ${e}`), "__NEXT_ERROR_CODE", {
                        value: "E74",
                        enumerable: !1,
                        configurable: !0
                    }))), t.crossOrigin = void 0, t.src = e, document.body.appendChild(t)
                })), n)
            }
        }

        function l(e) {
            let t = a.get(e);
            return t || a.set(e, t = fetch(e, {
                credentials: "same-origin"
            }).then(t => {
                if (!t.ok) throw Object.defineProperty(Error(`Failed to load stylesheet: ${e}`), "__NEXT_ERROR_CODE", {
                    value: "E189",
                    enumerable: !1,
                    configurable: !0
                });
                return t.text().then(t => ({
                    href: e,
                    content: t
                }))
            }).catch(e => {
                throw f(e)
            })), t
        }
        return {
            whenEntrypoint: e => d(e, t),
            onEntrypoint(e, r) {
                (r ? Promise.resolve().then(() => r()).then(e => ({
                    component: e && e.default || e,
                    exports: e
                }), e => ({
                    error: e
                })) : Promise.resolve(void 0)).then(r => {
                    let n = t.get(e);
                    n && "resolve" in n ? r && (t.set(e, r), n.resolve(r)) : (r ? t.set(e, r) : t.delete(e), i.delete(e))
                })
            },
            loadRoute(r, a) {
                return d(r, i, () => {
                    let i;
                    return (0, c.resolvePromiseWithTimeout)(_(e, r).then(e => {
                        let {
                            scripts: n,
                            css: a
                        } = e;
                        return Promise.all([t.has(r) ? [] : Promise.all(n.map(o)), Promise.all(a.map(l))])
                    }).then(e => this.whenEntrypoint(r).then(t => ({
                        entrypoint: t,
                        styles: e[1]
                    }))), f(Object.defineProperty(Error(`Route did not complete loading: ${r}`), "__NEXT_ERROR_CODE", {
                        value: "E12",
                        enumerable: !1,
                        configurable: !0
                    })), n).then(e => {
                        let {
                            entrypoint: t,
                            styles: r
                        } = e, n = Object.assign({
                            styles: r
                        }, t);
                        return "error" in t ? t : n
                    }).catch(e => {
                        if (a) throw e;
                        return {
                            error: e
                        }
                    }).finally(() => i?.())
                })
            },
            prefetch(t) {
                let r;
                return (r = navigator.connection) && (r.saveData || /2g/.test(r.effectiveType)) ? Promise.resolve() : _(e, t).then(e => Promise.all(m ? e.scripts.map(e => {
                    var t, r, n;
                    return t = e.toString(), r = "script", new Promise((e, a) => {
                        let i = `
      link[rel="prefetch"][href^="${t}"],
      link[rel="preload"][href^="${t}"],
      script[src^="${t}"]`;
                        if (document.querySelector(i)) return e();
                        n = document.createElement("link"), r && (n.as = r), n.rel = "prefetch", n.crossOrigin = void 0, n.onload = e, n.onerror = () => a(f(Object.defineProperty(Error(`Failed to prefetch: ${t}`), "__NEXT_ERROR_CODE", {
                            value: "E268",
                            enumerable: !1,
                            configurable: !0
                        }))), n.href = t, document.head.appendChild(n)
                    })
                }) : [])).then(() => {
                    (0, s.requestIdleCallback)(() => this.loadRoute(t, !0).catch(() => {}))
                }).catch(() => {})
            }
        }
    }("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 234113, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        ESCAPE_REGEX: function() {
            return o
        },
        htmlEscapeAttributeString: function() {
            return c
        },
        htmlEscapeJsonString: function() {
            return u
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });
    let i = {
            "&": "\\u0026",
            ">": "\\u003e",
            "<": "\\u003c",
            "\u2028": "\\u2028",
            "\u2029": "\\u2029"
        },
        o = /[&><\u2028\u2029]/g,
        s = {
            "&": "&amp;",
            '"': "&quot;",
            "'": "&#39;",
            "<": "&lt;",
            ">": "&gt;"
        },
        l = /[&"'<>]/g;

    function u(e) {
        return e.replace(o, e => i[e])
    }

    function c(e) {
        return e.replace(l, e => s[e])
    }
}, 686591, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        default: function() {
            return b
        },
        handleClientScriptLoad: function() {
            return _
        },
        initScriptLoader: function() {
            return v
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });
    let i = e.r(481258),
        o = e.r(744066),
        s = e.r(809804),
        l = i._(e.r(652447)),
        u = o._(e.r(371847)),
        c = e.r(530272),
        d = e.r(348225),
        p = e.r(210390),
        f = e.r(234113),
        h = new Map,
        m = new Set,
        g = e => {
            let {
                src: t,
                id: r,
                onLoad: n = () => {},
                onReady: a = null,
                dangerouslySetInnerHTML: i,
                children: o = "",
                strategy: s = "afterInteractive",
                onError: u,
                stylesheets: c
            } = e, p = r || t;
            if (p && m.has(p)) return;
            if (h.has(t)) {
                m.add(p), h.get(t).then(n, u);
                return
            }
            let f = () => {
                    a && a(), m.add(p)
                },
                g = document.createElement("script"),
                _ = new Promise((e, t) => {
                    g.addEventListener("load", function(t) {
                        e(), n && n.call(this, t), f()
                    }), g.addEventListener("error", function(e) {
                        t(e)
                    })
                }).catch(function(e) {
                    u && u(e)
                });
            i ? (g.innerHTML = i.__html || "", f()) : o ? (g.textContent = "string" == typeof o ? o : Array.isArray(o) ? o.join("") : "", f()) : t && (g.src = t, h.set(t, _)), (0, d.setAttributesFromProps)(g, e), "worker" === s && g.setAttribute("type", "text/partytown"), g.setAttribute("data-nscript", s), c && (e => {
                if (l.default.preinit) return e.forEach(e => {
                    l.default.preinit(e, {
                        as: "style"
                    })
                });
                if ("u" > typeof window) {
                    let t = document.head;
                    e.forEach(e => {
                        let r = document.createElement("link");
                        r.type = "text/css", r.rel = "stylesheet", r.href = e, t.appendChild(r)
                    })
                }
            })(c), document.body.appendChild(g)
        };

    function _(e) {
        let {
            strategy: t = "afterInteractive"
        } = e;
        "lazyOnload" === t ? window.addEventListener("load", () => {
            (0, p.requestIdleCallback)(() => g(e))
        }) : g(e)
    }

    function v(e) {
        e.forEach(_), [...document.querySelectorAll('[data-nscript="beforeInteractive"]'), ...document.querySelectorAll('[data-nscript="beforePageRender"]')].forEach(e => {
            let t = e.id || e.getAttribute("src");
            m.add(t)
        })
    }

    function y(e) {
        let {
            id: t,
            src: r = "",
            onLoad: n = () => {},
            onReady: a = null,
            strategy: i = "afterInteractive",
            onError: o,
            stylesheets: d,
            ...h
        } = e, {
            updateScripts: _,
            scripts: v,
            getIsSsr: y,
            appDir: b,
            nonce: E
        } = (0, u.useContext)(c.HeadManagerContext);
        E = h.nonce || E;
        let S = (0, u.useRef)(!1);
        (0, u.useEffect)(() => {
            let e = t || r;
            S.current || (a && e && m.has(e) && a(), S.current = !0)
        }, [a, t, r]);
        let T = (0, u.useRef)(!1);
        if ((0, u.useEffect)(() => {
                if (!T.current) {
                    if ("afterInteractive" === i) g(e);
                    else "lazyOnload" === i && ("complete" === document.readyState ? (0, p.requestIdleCallback)(() => g(e)) : window.addEventListener("load", () => {
                        (0, p.requestIdleCallback)(() => g(e))
                    }));
                    T.current = !0
                }
            }, [e, i]), ("beforeInteractive" === i || "worker" === i) && (_ ? (v[i] = (v[i] || []).concat([{
                id: t,
                src: r,
                onLoad: n,
                onReady: a,
                onError: o,
                ...h,
                nonce: E
            }]), _(v)) : y && y() ? m.add(t || r) : y && !y() && g({
                ...e,
                nonce: E
            })), b) {
            if (d && d.forEach(e => {
                    l.default.preinit(e, {
                        as: "style"
                    })
                }), "beforeInteractive" === i)
                if (!r) return h.dangerouslySetInnerHTML && (h.children = h.dangerouslySetInnerHTML.__html, delete h.dangerouslySetInnerHTML), (0, s.jsx)("script", {
                    nonce: E,
                    dangerouslySetInnerHTML: {
                        __html: `(self.__next_s=self.__next_s||[]).push(${(0,f.htmlEscapeJsonString)(JSON.stringify([0,{...h,id:t}]))})`
                    }
                });
                else return l.default.preload(r, h.integrity ? {
                    as: "script",
                    integrity: h.integrity,
                    nonce: E,
                    crossOrigin: h.crossOrigin
                } : {
                    as: "script",
                    nonce: E,
                    crossOrigin: h.crossOrigin
                }), (0, s.jsx)("script", {
                    nonce: E,
                    dangerouslySetInnerHTML: {
                        __html: `(self.__next_s=self.__next_s||[]).push(${(0,f.htmlEscapeJsonString)(JSON.stringify([r,{...h,id:t}]))})`
                    }
                });
            "afterInteractive" === i && r && l.default.preload(r, h.integrity ? {
                as: "script",
                integrity: h.integrity,
                nonce: E,
                crossOrigin: h.crossOrigin
            } : {
                as: "script",
                nonce: E,
                crossOrigin: h.crossOrigin
            })
        }
        return null
    }
    Object.defineProperty(y, "__nextScript", {
        value: !0
    });
    let b = y;
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 183490, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        getSortedRouteObjects: function() {
            return s
        },
        getSortedRoutes: function() {
            return o
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });
    class i {
        insert(e) {
            this._insert(e.split("/").filter(Boolean), [], !1)
        }
        smoosh() {
            return this._smoosh()
        }
        _smoosh() {
            let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "/",
                t = [...this.children.keys()].sort();
            null !== this.slugName && t.splice(t.indexOf("[]"), 1), null !== this.restSlugName && t.splice(t.indexOf("[...]"), 1), null !== this.optionalRestSlugName && t.splice(t.indexOf("[[...]]"), 1);
            let r = t.map(t => this.children.get(t)._smoosh(`${e}${t}/`)).reduce((e, t) => [...e, ...t], []);
            if (null !== this.slugName && r.push(...this.children.get("[]")._smoosh(`${e}[${this.slugName}]/`)), !this.placeholder) {
                let t = "/" === e ? "/" : e.slice(0, -1);
                if (null != this.optionalRestSlugName) throw Object.defineProperty(Error(`You cannot define a route with the same specificity as a optional catch-all route ("${t}" and "${t}[[...${this.optionalRestSlugName}]]").`), "__NEXT_ERROR_CODE", {
                    value: "E458",
                    enumerable: !1,
                    configurable: !0
                });
                r.unshift(t)
            }
            return null !== this.restSlugName && r.push(...this.children.get("[...]")._smoosh(`${e}[...${this.restSlugName}]/`)), null !== this.optionalRestSlugName && r.push(...this.children.get("[[...]]")._smoosh(`${e}[[...${this.optionalRestSlugName}]]/`)), r
        }
        _insert(e, t, r) {
            if (0 === e.length) {
                this.placeholder = !1;
                return
            }
            if (r) throw Object.defineProperty(Error("Catch-all must be the last part of the URL."), "__NEXT_ERROR_CODE", {
                value: "E392",
                enumerable: !1,
                configurable: !0
            });
            let n = e[0];
            if (n.startsWith("[") && n.endsWith("]")) {
                let i = n.slice(1, -1),
                    o = !1;
                if (i.startsWith("[") && i.endsWith("]") && (i = i.slice(1, -1), o = !0), i.startsWith("…")) throw Object.defineProperty(Error(`Detected a three-dot character ('…') at ('${i}'). Did you mean ('...')?`), "__NEXT_ERROR_CODE", {
                    value: "E147",
                    enumerable: !1,
                    configurable: !0
                });
                if (i.startsWith("...") && (i = i.substring(3), r = !0), i.startsWith("[") || i.endsWith("]")) throw Object.defineProperty(Error(`Segment names may not start or end with extra brackets ('${i}').`), "__NEXT_ERROR_CODE", {
                    value: "E421",
                    enumerable: !1,
                    configurable: !0
                });
                if (i.startsWith(".")) throw Object.defineProperty(Error(`Segment names may not start with erroneous periods ('${i}').`), "__NEXT_ERROR_CODE", {
                    value: "E288",
                    enumerable: !1,
                    configurable: !0
                });

                function a(e, r) {
                    if (null !== e && e !== r) throw Object.defineProperty(Error(`You cannot use different slug names for the same dynamic path ('${e}' !== '${r}').`), "__NEXT_ERROR_CODE", {
                        value: "E337",
                        enumerable: !1,
                        configurable: !0
                    });
                    t.forEach(e => {
                        if (e === r) throw Object.defineProperty(Error(`You cannot have the same slug name "${r}" repeat within a single dynamic path`), "__NEXT_ERROR_CODE", {
                            value: "E247",
                            enumerable: !1,
                            configurable: !0
                        });
                        if (e.replace(/\W/g, "") === n.replace(/\W/g, "")) throw Object.defineProperty(Error(`You cannot have the slug names "${e}" and "${r}" differ only by non-word symbols within a single dynamic path`), "__NEXT_ERROR_CODE", {
                            value: "E499",
                            enumerable: !1,
                            configurable: !0
                        })
                    }), t.push(r)
                }
                if (r)
                    if (o) {
                        if (null != this.restSlugName) throw Object.defineProperty(Error(`You cannot use both an required and optional catch-all route at the same level ("[...${this.restSlugName}]" and "${e[0]}" ).`), "__NEXT_ERROR_CODE", {
                            value: "E299",
                            enumerable: !1,
                            configurable: !0
                        });
                        a(this.optionalRestSlugName, i), this.optionalRestSlugName = i, n = "[[...]]"
                    } else {
                        if (null != this.optionalRestSlugName) throw Object.defineProperty(Error(`You cannot use both an optional and required catch-all route at the same level ("[[...${this.optionalRestSlugName}]]" and "${e[0]}").`), "__NEXT_ERROR_CODE", {
                            value: "E300",
                            enumerable: !1,
                            configurable: !0
                        });
                        a(this.restSlugName, i), this.restSlugName = i, n = "[...]"
                    }
                else {
                    if (o) throw Object.defineProperty(Error(`Optional route parameters are not yet supported ("${e[0]}").`), "__NEXT_ERROR_CODE", {
                        value: "E435",
                        enumerable: !1,
                        configurable: !0
                    });
                    a(this.slugName, i), this.slugName = i, n = "[]"
                }
            }
            this.children.has(n) || this.children.set(n, new i), this.children.get(n)._insert(e.slice(1), t, r)
        }
        constructor() {
            this.placeholder = !0, this.children = new Map, this.slugName = null, this.restSlugName = null, this.optionalRestSlugName = null
        }
    }

    function o(e) {
        let t = new i;
        return e.forEach(e => t.insert(e)), t.smoosh()
    }

    function s(e, t) {
        let r = {},
            n = [];
        for (let a = 0; a < e.length; a++) {
            let i = t(e[a]);
            r[i] = a, n[a] = i
        }
        return o(n).map(t => e[r[t]])
    }
}, 11931, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "isDynamicRoute", {
        enumerable: !0,
        get: function() {
            return o
        }
    });
    let n = e.r(92744),
        a = /\/[^/]*\[[^/]+\][^/]*(?=\/|$)/,
        i = /\/\[[^/]+\](?=\/|$)/;

    function o(e) {
        let t = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1];
        return ((0, n.isInterceptionRouteAppPath)(e) && (e = (0, n.extractInterceptionRouteInformation)(e).interceptedRoute), t) ? i.test(e) : a.test(e)
    }
}, 776881, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        getSortedRouteObjects: function() {
            return i.getSortedRouteObjects
        },
        getSortedRoutes: function() {
            return i.getSortedRoutes
        },
        isDynamicRoute: function() {
            return o.isDynamicRoute
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });
    let i = e.r(183490),
        o = e.r(11931)
}, 919136, (e, t, r) => {
    "use strict";

    function n(e) {
        return e.replace(/\\/g, "/")
    }
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "normalizePathSep", {
        enumerable: !0,
        get: function() {
            return n
        }
    })
}, 490825, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "denormalizePagePath", {
        enumerable: !0,
        get: function() {
            return i
        }
    });
    let n = e.r(776881),
        a = e.r(919136);

    function i(e) {
        let t = (0, a.normalizePathSep)(e);
        return t.startsWith("/index/") && !(0, n.isDynamicRoute)(t) ? t.slice(6) : "/index" !== t ? t : "/"
    }
}, 793296, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "normalizeLocalePath", {
        enumerable: !0,
        get: function() {
            return a
        }
    });
    let n = new WeakMap;

    function a(e, t) {
        let r;
        if (!t) return {
            pathname: e
        };
        let a = n.get(t);
        a || (a = t.map(e => e.toLowerCase()), n.set(t, a));
        let i = e.split("/", 2);
        if (!i[1]) return {
            pathname: e
        };
        let o = i[1].toLowerCase(),
            s = a.indexOf(o);
        return s < 0 ? {
            pathname: e
        } : (r = t[s], {
            pathname: e = e.slice(r.length + 1) || "/",
            detectedLocale: r
        })
    }
}, 45647, (e, t, r) => {
    "use strict";

    function n() {
        let e = Object.create(null);
        return {
            on(t, r) {
                (e[t] || (e[t] = [])).push(r)
            },
            off(t, r) {
                e[t] && e[t].splice(e[t].indexOf(r) >>> 0, 1)
            },
            emit(t) {
                for (var r = arguments.length, n = Array(r > 1 ? r - 1 : 0), a = 1; a < r; a++) n[a - 1] = arguments[a];
                (e[t] || []).slice().map(e => {
                    e(...n)
                })
            }
        }
    }
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "default", {
        enumerable: !0,
        get: function() {
            return n
        }
    })
}, 273577, (e, t, r) => {
    (() => {
        "use strict";
        "u" > typeof __nccwpck_require__ && (__nccwpck_require__.ab = "/ROOT/node_modules/.pnpm/next@16.2.6_patch_hash=2889283f843aeb9b88db5fd798b6e589c78c4b38fab3ccd115a3f784da4f1be8_5143821f351443e644013a4d37024e4a/node_modules/next/dist/compiled/path-to-regexp/");
        var e = {};
        (() => {
            function t(e, t) {
                void 0 === t && (t = {});
                for (var r = function(e) {
                        for (var t = [], r = 0; r < e.length;) {
                            var n = e[r];
                            if ("*" === n || "+" === n || "?" === n) {
                                t.push({
                                    type: "MODIFIER",
                                    index: r,
                                    value: e[r++]
                                });
                                continue
                            }
                            if ("\\" === n) {
                                t.push({
                                    type: "ESCAPED_CHAR",
                                    index: r++,
                                    value: e[r++]
                                });
                                continue
                            }
                            if ("{" === n) {
                                t.push({
                                    type: "OPEN",
                                    index: r,
                                    value: e[r++]
                                });
                                continue
                            }
                            if ("}" === n) {
                                t.push({
                                    type: "CLOSE",
                                    index: r,
                                    value: e[r++]
                                });
                                continue
                            }
                            if (":" === n) {
                                for (var a = "", i = r + 1; i < e.length;) {
                                    var o = e.charCodeAt(i);
                                    if (o >= 48 && o <= 57 || o >= 65 && o <= 90 || o >= 97 && o <= 122 || 95 === o) {
                                        a += e[i++];
                                        continue
                                    }
                                    break
                                }
                                if (!a) throw TypeError("Missing parameter name at ".concat(r));
                                t.push({
                                    type: "NAME",
                                    index: r,
                                    value: a
                                }), r = i;
                                continue
                            }
                            if ("(" === n) {
                                var s = 1,
                                    l = "",
                                    i = r + 1;
                                if ("?" === e[i]) throw TypeError('Pattern cannot start with "?" at '.concat(i));
                                for (; i < e.length;) {
                                    if ("\\" === e[i]) {
                                        l += e[i++] + e[i++];
                                        continue
                                    }
                                    if (")" === e[i]) {
                                        if (0 == --s) {
                                            i++;
                                            break
                                        }
                                    } else if ("(" === e[i] && (s++, "?" !== e[i + 1])) throw TypeError("Capturing groups are not allowed at ".concat(i));
                                    l += e[i++]
                                }
                                if (s) throw TypeError("Unbalanced pattern at ".concat(r));
                                if (!l) throw TypeError("Missing pattern at ".concat(r));
                                t.push({
                                    type: "PATTERN",
                                    index: r,
                                    value: l
                                }), r = i;
                                continue
                            }
                            t.push({
                                type: "CHAR",
                                index: r,
                                value: e[r++]
                            })
                        }
                        return t.push({
                            type: "END",
                            index: r,
                            value: ""
                        }), t
                    }(e), n = t.prefixes, i = void 0 === n ? "./" : n, o = t.delimiter, s = void 0 === o ? "/#?" : o, l = [], u = 0, c = 0, d = "", p = function(e) {
                        if (c < r.length && r[c].type === e) return r[c++].value
                    }, f = function(e) {
                        var t = p(e);
                        if (void 0 !== t) return t;
                        var n = r[c],
                            a = n.type,
                            i = n.index;
                        throw TypeError("Unexpected ".concat(a, " at ").concat(i, ", expected ").concat(e))
                    }, h = function() {
                        for (var e, t = ""; e = p("CHAR") || p("ESCAPED_CHAR");) t += e;
                        return t
                    }, m = function(e) {
                        for (var t = 0; t < s.length; t++) {
                            var r = s[t];
                            if (e.indexOf(r) > -1) return !0
                        }
                        return !1
                    }, g = function(e) {
                        var t = l[l.length - 1],
                            r = e || (t && "string" == typeof t ? t : "");
                        if (t && !r) throw TypeError('Must have text between two parameters, missing text after "'.concat(t.name, '"'));
                        return !r || m(r) ? "[^".concat(a(s), "]+?") : "(?:(?!".concat(a(r), ")[^").concat(a(s), "])+?")
                    }; c < r.length;) {
                    var _ = p("CHAR"),
                        v = p("NAME"),
                        y = p("PATTERN");
                    if (v || y) {
                        var b = _ || ""; - 1 === i.indexOf(b) && (d += b, b = ""), d && (l.push(d), d = ""), l.push({
                            name: v || u++,
                            prefix: b,
                            suffix: "",
                            pattern: y || g(b),
                            modifier: p("MODIFIER") || ""
                        });
                        continue
                    }
                    var E = _ || p("ESCAPED_CHAR");
                    if (E) {
                        d += E;
                        continue
                    }
                    if (d && (l.push(d), d = ""), p("OPEN")) {
                        var b = h(),
                            S = p("NAME") || "",
                            T = p("PATTERN") || "",
                            R = h();
                        f("CLOSE"), l.push({
                            name: S || (T ? u++ : ""),
                            pattern: S && !T ? g(b) : T,
                            prefix: b,
                            suffix: R,
                            modifier: p("MODIFIER") || ""
                        });
                        continue
                    }
                    f("END")
                }
                return l
            }

            function r(e, t) {
                void 0 === t && (t = {});
                var r = i(t),
                    n = t.encode,
                    a = void 0 === n ? function(e) {
                        return e
                    } : n,
                    o = t.validate,
                    s = void 0 === o || o,
                    l = e.map(function(e) {
                        if ("object" == typeof e) return new RegExp("^(?:".concat(e.pattern, ")$"), r)
                    });
                return function(t) {
                    for (var r = "", n = 0; n < e.length; n++) {
                        var i = e[n];
                        if ("string" == typeof i) {
                            r += i;
                            continue
                        }
                        var o = t ? t[i.name] : void 0,
                            u = "?" === i.modifier || "*" === i.modifier,
                            c = "*" === i.modifier || "+" === i.modifier;
                        if (Array.isArray(o)) {
                            if (!c) throw TypeError('Expected "'.concat(i.name, '" to not repeat, but got an array'));
                            if (0 === o.length) {
                                if (u) continue;
                                throw TypeError('Expected "'.concat(i.name, '" to not be empty'))
                            }
                            for (var d = 0; d < o.length; d++) {
                                var p = a(o[d], i);
                                if (s && !l[n].test(p)) throw TypeError('Expected all "'.concat(i.name, '" to match "').concat(i.pattern, '", but got "').concat(p, '"'));
                                r += i.prefix + p + i.suffix
                            }
                            continue
                        }
                        if ("string" == typeof o || "number" == typeof o) {
                            var p = a(String(o), i);
                            if (s && !l[n].test(p)) throw TypeError('Expected "'.concat(i.name, '" to match "').concat(i.pattern, '", but got "').concat(p, '"'));
                            r += i.prefix + p + i.suffix;
                            continue
                        }
                        if (!u) {
                            var f = c ? "an array" : "a string";
                            throw TypeError('Expected "'.concat(i.name, '" to be ').concat(f))
                        }
                    }
                    return r
                }
            }

            function n(e, t, r) {
                void 0 === r && (r = {});
                var n = r.decode,
                    a = void 0 === n ? function(e) {
                        return e
                    } : n;
                return function(r) {
                    var n = e.exec(r);
                    if (!n) return !1;
                    for (var i = n[0], o = n.index, s = Object.create(null), l = 1; l < n.length; l++) ! function(e) {
                        if (void 0 !== n[e]) {
                            var r = t[e - 1];
                            "*" === r.modifier || "+" === r.modifier ? s[r.name] = n[e].split(r.prefix + r.suffix).map(function(e) {
                                return a(e, r)
                            }) : s[r.name] = a(n[e], r)
                        }
                    }(l);
                    return {
                        path: i,
                        index: o,
                        params: s
                    }
                }
            }

            function a(e) {
                return e.replace(/([.+*?=^!:${}()[\]|/\\])/g, "\\$1")
            }

            function i(e) {
                return e && e.sensitive ? "" : "i"
            }

            function o(e, t, r) {
                void 0 === r && (r = {});
                for (var n = r.strict, o = void 0 !== n && n, s = r.start, l = r.end, u = r.encode, c = void 0 === u ? function(e) {
                        return e
                    } : u, d = r.delimiter, p = r.endsWith, f = "[".concat(a(void 0 === p ? "" : p), "]|$"), h = "[".concat(a(void 0 === d ? "/#?" : d), "]"), m = void 0 === s || s ? "^" : "", g = 0; g < e.length; g++) {
                    var _ = e[g];
                    if ("string" == typeof _) m += a(c(_));
                    else {
                        var v = a(c(_.prefix)),
                            y = a(c(_.suffix));
                        if (_.pattern)
                            if (t && t.push(_), v || y)
                                if ("+" === _.modifier || "*" === _.modifier) {
                                    var b = "*" === _.modifier ? "?" : "";
                                    m += "(?:".concat(v, "((?:").concat(_.pattern, ")(?:").concat(y).concat(v, "(?:").concat(_.pattern, "))*)").concat(y, ")").concat(b)
                                } else m += "(?:".concat(v, "(").concat(_.pattern, ")").concat(y, ")").concat(_.modifier);
                        else {
                            if ("+" === _.modifier || "*" === _.modifier) throw TypeError('Can not repeat "'.concat(_.name, '" without a prefix and suffix'));
                            m += "(".concat(_.pattern, ")").concat(_.modifier)
                        } else m += "(?:".concat(v).concat(y, ")").concat(_.modifier)
                    }
                }
                if (void 0 === l || l) o || (m += "".concat(h, "?")), m += r.endsWith ? "(?=".concat(f, ")") : "$";
                else {
                    var E = e[e.length - 1],
                        S = "string" == typeof E ? h.indexOf(E[E.length - 1]) > -1 : void 0 === E;
                    o || (m += "(?:".concat(h, "(?=").concat(f, "))?")), S || (m += "(?=".concat(h, "|").concat(f, ")"))
                }
                return new RegExp(m, i(r))
            }

            function s(e, r, n) {
                if (e instanceof RegExp) {
                    var a;
                    if (!r) return e;
                    for (var l = /\((?:\?<(.*?)>)?(?!\?)/g, u = 0, c = l.exec(e.source); c;) r.push({
                        name: c[1] || u++,
                        prefix: "",
                        suffix: "",
                        modifier: "",
                        pattern: ""
                    }), c = l.exec(e.source);
                    return e
                }
                return Array.isArray(e) ? (a = e.map(function(e) {
                    return s(e, r, n).source
                }), new RegExp("(?:".concat(a.join("|"), ")"), i(n))) : o(t(e, n), r, n)
            }
            Object.defineProperty(e, "__esModule", {
                value: !0
            }), e.pathToRegexp = e.tokensToRegexp = e.regexpToFunction = e.match = e.tokensToFunction = e.compile = e.parse = void 0, e.parse = t, e.compile = function(e, n) {
                return r(t(e, n), n)
            }, e.tokensToFunction = r, e.match = function(e, t) {
                var r = [];
                return n(s(e, r, t), r, t)
            }, e.regexpToFunction = n, e.tokensToRegexp = o, e.pathToRegexp = s
        })(), t.exports = e
    })()
}, 939347, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        PARAM_SEPARATOR: function() {
            return i
        },
        hasAdjacentParameterIssues: function() {
            return o
        },
        normalizeAdjacentParameters: function() {
            return s
        },
        normalizeTokensForRegexp: function() {
            return l
        },
        stripNormalizedSeparators: function() {
            return u
        },
        stripParameterSeparators: function() {
            return c
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });
    let i = "_NEXTSEP_";

    function o(e) {
        return "string" == typeof e && !!(/\/\(\.{1,3}\):[^/\s]+/.test(e) || /:[a-zA-Z_][a-zA-Z0-9_]*:[a-zA-Z_][a-zA-Z0-9_]*/.test(e))
    }

    function s(e) {
        let t = e;
        return (t = t.replace(/(\([^)]*\)):([^/\s]+)/g, `$1${i}:$2`)).replace(/:([^:/\s)]+)(?=:)/g, `:$1${i}`)
    }

    function l(e) {
        return e.map(e => "object" == typeof e && null !== e && "modifier" in e && ("*" === e.modifier || "+" === e.modifier) && "prefix" in e && "suffix" in e && "" === e.prefix && "" === e.suffix ? {
            ...e,
            prefix: "/"
        } : e)
    }

    function u(e) {
        return e.replace(RegExp(`\\)${i}`, "g"), ")")
    }

    function c(e) {
        let t = {};
        for (let [r, n] of Object.entries(e)) "string" == typeof n ? t[r] = n.replace(RegExp(`^${i}`), "") : Array.isArray(n) ? t[r] = n.map(e => "string" == typeof e ? e.replace(RegExp(`^${i}`), "") : e) : t[r] = n;
        return t
    }
}, 577615, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        safeCompile: function() {
            return l
        },
        safePathToRegexp: function() {
            return s
        },
        safeRegexpToFunction: function() {
            return u
        },
        safeRouteMatcher: function() {
            return c
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });
    let i = e.r(273577),
        o = e.r(939347);

    function s(e, t, r) {
        if ("string" != typeof e) return (0, i.pathToRegexp)(e, t, r);
        let n = (0, o.hasAdjacentParameterIssues)(e),
            a = n ? (0, o.normalizeAdjacentParameters)(e) : e;
        try {
            return (0, i.pathToRegexp)(a, t, r)
        } catch (a) {
            if (!n) try {
                let n = (0, o.normalizeAdjacentParameters)(e);
                return (0, i.pathToRegexp)(n, t, r)
            } catch (e) {}
            throw a
        }
    }

    function l(e, t) {
        let r = (0, o.hasAdjacentParameterIssues)(e),
            n = r ? (0, o.normalizeAdjacentParameters)(e) : e;
        try {
            let e = (0, i.compile)(n, t);
            if (r) return t => (0, o.stripNormalizedSeparators)(e(t));
            return e
        } catch (n) {
            if (!r) try {
                let r = (0, o.normalizeAdjacentParameters)(e),
                    n = (0, i.compile)(r, t);
                return e => (0, o.stripNormalizedSeparators)(n(e))
            } catch (e) {}
            throw n
        }
    }

    function u(e, t) {
        let r = (0, i.regexpToFunction)(e, t || []);
        return e => {
            let t = r(e);
            return !!t && {
                ...t,
                params: (0, o.stripParameterSeparators)(t.params)
            }
        }
    }

    function c(e) {
        return t => {
            let r = e(t);
            return !!r && (0, o.stripParameterSeparators)(r)
        }
    }
}, 104867, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "getRouteMatcher", {
        enumerable: !0,
        get: function() {
            return i
        }
    });
    let n = e.r(378201),
        a = e.r(577615);

    function i(e) {
        let {
            re: t,
            groups: r
        } = e;
        return (0, a.safeRouteMatcher)(e => {
            let a = t.exec(e);
            if (!a) return !1;
            let i = e => {
                    try {
                        return decodeURIComponent(e)
                    } catch {
                        throw Object.defineProperty(new n.DecodeError("failed to decode param"), "__NEXT_ERROR_CODE", {
                            value: "E528",
                            enumerable: !1,
                            configurable: !0
                        })
                    }
                },
                o = {};
            for (let [e, t] of Object.entries(r)) {
                let r = a[t.pos];
                void 0 !== r && (t.repeat ? o[e] = r.split("/").map(e => i(e)) : o[e] = i(r))
            }
            return o
        })
    }
}, 746714, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "escapeStringRegexp", {
        enumerable: !0,
        get: function() {
            return i
        }
    });
    let n = /[|\\{}()[\]^$+*?.-]/,
        a = /[|\\{}()[\]^$+*?.-]/g;

    function i(e) {
        return n.test(e) ? e.replace(a, "\\$&") : e
    }
}, 302379, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "parseLoaderTree", {
        enumerable: !0,
        get: function() {
            return a
        }
    });
    let n = e.r(868596);

    function a(e) {
        let [t, r, a, i] = e, {
            layout: o,
            template: s
        } = a, {
            page: l
        } = a;
        l = t === n.DEFAULT_SEGMENT_KEY ? a.defaultPage : l;
        let u = o?.[1] || s?.[1] || l?.[1];
        return {
            page: l,
            segment: t,
            modules: a,
            conventionPath: u,
            parallelRoutes: r,
            staticSiblings: i
        }
    }
}, 814641, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        isInterceptionAppRoute: function() {
            return c
        },
        isNormalizedAppRoute: function() {
            return u
        },
        parseAppRoute: function() {
            return function e(t, r) {
                let n, a, s, u = t.split("/").filter(Boolean),
                    c = [];
                for (let d of u) {
                    let u = l(function(e) {
                        if (!/%5b|%5d/i.test(e)) return e;
                        try {
                            let t = decodeURIComponent(e);
                            return (0, o.getSegmentParam)(t) ? t : e
                        } catch {
                            return e
                        }
                    }(d));
                    if (u) {
                        if (r && ("route-group" === u.type || "parallel-route" === u.type)) throw Object.defineProperty(new i.InvariantError(`${t} is being parsed as a normalized route, but it has a route group or parallel route segment.`), "__NEXT_ERROR_CODE", {
                            value: "E923",
                            enumerable: !1,
                            configurable: !0
                        });
                        if (c.push(u), u.interceptionMarker) {
                            let i = t.split(u.interceptionMarker);
                            if (2 !== i.length) throw Object.defineProperty(Error(`Invalid interception route: ${t}`), "__NEXT_ERROR_CODE", {
                                value: "E924",
                                enumerable: !1,
                                configurable: !0
                            });
                            a = r ? e(i[0], !0) : e(i[0], !1), s = r ? e(i[1], !0) : e(i[1], !1), n = u.interceptionMarker
                        }
                    }
                }
                let d = c.filter(e => "dynamic" === e.type);
                return {
                    normalized: r,
                    pathname: t,
                    segments: c,
                    dynamicSegments: d,
                    interceptionMarker: n,
                    interceptingRoute: a,
                    interceptedRoute: s
                }
            }
        },
        parseAppRouteSegment: function() {
            return l
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });
    let i = e.r(642216),
        o = e.r(418978),
        s = e.r(92744);

    function l(e) {
        if ("" === e) return null;
        let t = s.INTERCEPTION_ROUTE_MARKERS.find(t => e.startsWith(t)),
            r = (0, o.getSegmentParam)(e);
        return r ? {
            type: "dynamic",
            name: e,
            param: r,
            interceptionMarker: t
        } : e.startsWith("(") && e.endsWith(")") ? {
            type: "route-group",
            name: e,
            interceptionMarker: t
        } : e.startsWith("@") ? {
            type: "parallel-route",
            name: e,
            interceptionMarker: t
        } : {
            type: "static",
            name: e,
            interceptionMarker: t
        }
    }

    function u(e) {
        return e.normalized
    }

    function c(e) {
        return void 0 !== e.interceptionMarker && void 0 !== e.interceptingRoute && void 0 !== e.interceptedRoute
    }
}, 450004, (e, t, r) => {
    "use strict";

    function n(e) {
        switch (e) {
            case "catchall-intercepted-(..)(..)":
            case "dynamic-intercepted-(..)(..)":
                return "(..)(..)";
            case "catchall-intercepted-(.)":
            case "dynamic-intercepted-(.)":
                return "(.)";
            case "catchall-intercepted-(..)":
            case "dynamic-intercepted-(..)":
                return "(..)";
            case "catchall-intercepted-(...)":
            case "dynamic-intercepted-(...)":
                return "(...)";
            default:
                return null
        }
    }
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "interceptionPrefixFromParamType", {
        enumerable: !0,
        get: function() {
            return n
        }
    })
}, 869197, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "resolveParamValue", {
        enumerable: !0,
        get: function() {
            return i
        }
    });
    let n = e.r(642216),
        a = e.r(450004);

    function i(e, t, r, i, o) {
        switch (t) {
            case "catchall":
            case "optional-catchall":
            case "catchall-intercepted-(..)(..)":
            case "catchall-intercepted-(.)":
            case "catchall-intercepted-(..)":
            case "catchall-intercepted-(...)":
                let s = [];
                for (let e = r; e < i.segments.length; e++) {
                    let n = i.segments[e];
                    if ("static" === n.type) {
                        let i = n.name,
                            o = (0, a.interceptionPrefixFromParamType)(t);
                        o && e === r && o === n.interceptionMarker && (i = i.replace(n.interceptionMarker, "")), s.push(i)
                    } else {
                        if (!o.hasOwnProperty(n.param.paramName)) {
                            if ("optional-catchall" === n.param.paramType) break;
                            return
                        }
                        let e = o[n.param.paramName];
                        Array.isArray(e) ? s.push(...e) : s.push(e)
                    }
                }
                if (s.length > 0) return s;
                if ("optional-catchall" === t) return;
                throw Object.defineProperty(new n.InvariantError(`Unexpected empty path segments match for a route "${i.pathname}" with param "${e}" of type "${t}"`), "__NEXT_ERROR_CODE", {
                    value: "E931",
                    enumerable: !1,
                    configurable: !0
                });
            case "dynamic":
            case "dynamic-intercepted-(..)(..)":
            case "dynamic-intercepted-(.)":
            case "dynamic-intercepted-(..)":
            case "dynamic-intercepted-(...)":
                if (r < i.segments.length) {
                    let e = i.segments[r];
                    if ("dynamic" === e.type && !o.hasOwnProperty(e.param.paramName)) return;
                    return "dynamic" === e.type ? o[e.param.paramName] : (0, a.interceptionPrefixFromParamType)(t) === e.interceptionMarker ? e.name.replace(e.interceptionMarker, "") : e.name
                }
                return
        }
    }
}, 765529, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        PARAMETER_PATTERN: function() {
            return d
        },
        getDynamicParam: function() {
            return c
        },
        interpolateParallelRouteParams: function() {
            return u
        },
        parseMatchedParameter: function() {
            return f
        },
        parseParameter: function() {
            return p
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });
    let i = e.r(642216),
        o = e.r(302379),
        s = e.r(814641),
        l = e.r(869197);

    function u(e, t, r, n) {
        let a = structuredClone(t),
            u = [{
                tree: e,
                depth: 0
            }],
            c = (0, s.parseAppRoute)(r, !0);
        for (; u.length > 0;) {
            let {
                tree: e,
                depth: t
            } = u.pop(), {
                segment: r,
                parallelRoutes: d
            } = (0, o.parseLoaderTree)(e), p = (0, s.parseAppRouteSegment)(r);
            if (p?.type === "dynamic" && !a.hasOwnProperty(p.param.paramName) && !n?.has(p.param.paramName)) {
                let {
                    paramName: e,
                    paramType: r
                } = p.param, n = (0, l.resolveParamValue)(e, r, t, c, a);
                if (void 0 !== n) a[e] = n;
                else if ("optional-catchall" !== r) throw Object.defineProperty(new i.InvariantError(`Could not resolve param value for segment: ${e}`), "__NEXT_ERROR_CODE", {
                    value: "E932",
                    enumerable: !1,
                    configurable: !0
                })
            }
            let f = t;
            for (let e of (p && "route-group" !== p.type && "parallel-route" !== p.type && f++, Object.values(d))) u.push({
                tree: e,
                depth: f
            })
        }
        return a
    }

    function c(e, t, r, n, a) {
        let o = function(e, t, r) {
            let n = e[t];
            if (r?.has(t)) {
                let [e] = r.get(t);
                n = e
            } else Array.isArray(n) ? n = n.map(e => encodeURIComponent(e)) : "string" == typeof n && (n = encodeURIComponent(n));
            return n
        }(e, t, n);
        if (!o || 0 === o.length) {
            if ("oc" === r) return {
                param: t,
                value: null,
                type: r,
                treeSegment: [t, "", r, a]
            };
            throw Object.defineProperty(new i.InvariantError(`Missing value for segment key: "${t}" with dynamic param type: ${r}`), "__NEXT_ERROR_CODE", {
                value: "E864",
                enumerable: !1,
                configurable: !0
            })
        }
        let s = Array.isArray(o) ? o.join("/") : o;
        return {
            param: t,
            value: o,
            treeSegment: [t, s, r, a],
            type: r
        }
    }
    let d = /^([^[]*)\[((?:\[[^\]]*\])|[^\]]+)\](.*)$/;

    function p(e) {
        let t = e.match(d);
        return t ? f(t[2]) : f(e)
    }

    function f(e) {
        let t = e.startsWith("[") && e.endsWith("]");
        t && (e = e.slice(1, -1));
        let r = e.startsWith("...");
        return r && (e = e.slice(3)), {
            key: e,
            repeat: r,
            optional: t
        }
    }
}, 85320, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        getNamedMiddlewareRegex: function() {
            return m
        },
        getNamedRouteRegex: function() {
            return h
        },
        getRouteRegex: function() {
            return d
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });
    let i = e.r(862384),
        o = e.r(92744),
        s = e.r(746714),
        l = e.r(69220),
        u = e.r(765529);

    function c(e, t, r) {
        let n = {},
            a = 1,
            i = [];
        for (let c of (0, l.removeTrailingSlash)(e).slice(1).split("/")) {
            let e = o.INTERCEPTION_ROUTE_MARKERS.find(e => c.startsWith(e)),
                l = c.match(u.PARAMETER_PATTERN);
            if (e && l && l[2]) {
                let {
                    key: t,
                    optional: r,
                    repeat: o
                } = (0, u.parseMatchedParameter)(l[2]);
                n[t] = {
                    pos: a++,
                    repeat: o,
                    optional: r
                }, i.push(`/${(0,s.escapeStringRegexp)(e)}([^/]+?)`)
            } else if (l && l[2]) {
                let {
                    key: e,
                    repeat: t,
                    optional: o
                } = (0, u.parseMatchedParameter)(l[2]);
                n[e] = {
                    pos: a++,
                    repeat: t,
                    optional: o
                }, r && l[1] && i.push(`/${(0,s.escapeStringRegexp)(l[1])}`);
                let c = t ? o ? "(?:/(.+?))?" : "/(.+?)" : "/([^/]+?)";
                r && l[1] && (c = c.substring(1)), i.push(c)
            } else i.push(`/${(0,s.escapeStringRegexp)(c)}`);
            t && l && l[3] && i.push((0, s.escapeStringRegexp)(l[3]))
        }
        return {
            parameterizedRoute: i.join(""),
            groups: n
        }
    }

    function d(e) {
        let {
            includeSuffix: t = !1,
            includePrefix: r = !1,
            excludeOptionalTrailingSlash: n = !1
        } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, {
            parameterizedRoute: a,
            groups: i
        } = c(e, t, r), o = a;
        return n || (o += "(?:/)?"), {
            re: RegExp(`^${o}$`),
            groups: i
        }
    }

    function p(e) {
        let t, {
                interceptionMarker: r,
                getSafeRouteKey: n,
                segment: a,
                routeKeys: i,
                keyPrefix: o,
                backreferenceDuplicateKeys: l
            } = e,
            {
                key: c,
                optional: d,
                repeat: p
            } = (0, u.parseMatchedParameter)(a),
            f = c.replace(/\W/g, "");
        o && (f = `${o}${f}`);
        let h = !1;
        (0 === f.length || f.length > 30) && (h = !0), isNaN(parseInt(f.slice(0, 1))) || (h = !0), h && (f = n());
        let m = f in i;
        o ? i[f] = `${o}${c}` : i[f] = c;
        let g = r ? (0, s.escapeStringRegexp)(r) : "";
        return t = m && l ? `\\k<${f}>` : p ? `(?<${f}>.+?)` : `(?<${f}>[^/]+?)`, {
            key: c,
            pattern: d ? `(?:/${g}${t})?` : `/${g}${t}`,
            cleanedKey: f,
            optional: d,
            repeat: p
        }
    }

    function f(e, t, r, n, a) {
        let c, d = arguments.length > 5 && void 0 !== arguments[5] ? arguments[5] : {
                names: {},
                intercepted: {}
            },
            f = (c = 0, () => {
                let e = "",
                    t = ++c;
                for (; t > 0;) e += String.fromCharCode(97 + (t - 1) % 26), t = Math.floor((t - 1) / 26);
                return e
            }),
            h = {},
            m = [],
            g = [];
        for (let c of (d = structuredClone(d), (0, l.removeTrailingSlash)(e).slice(1).split("/"))) {
            let e, l = o.INTERCEPTION_ROUTE_MARKERS.some(e => c.startsWith(e)),
                _ = c.match(u.PARAMETER_PATTERN),
                v = l ? _?.[1] : void 0;
            if (v && _?.[2] ? (e = t ? i.NEXT_INTERCEPTION_MARKER_PREFIX : void 0, d.intercepted[_[2]] = v) : e = _?.[2] && d.intercepted[_[2]] ? t ? i.NEXT_INTERCEPTION_MARKER_PREFIX : void 0 : t ? i.NEXT_QUERY_PARAM_PREFIX : void 0, v && _ && _[2]) {
                let {
                    key: t,
                    pattern: r,
                    cleanedKey: n,
                    repeat: i,
                    optional: o
                } = p({
                    getSafeRouteKey: f,
                    interceptionMarker: v,
                    segment: _[2],
                    routeKeys: h,
                    keyPrefix: e,
                    backreferenceDuplicateKeys: a
                });
                m.push(r), g.push(`/${_[1]}:${d.names[t]??n}${i?o?"*":"+":""}`), d.names[t] ??= n
            } else if (_ && _[2]) {
                n && _[1] && (m.push(`/${(0,s.escapeStringRegexp)(_[1])}`), g.push(`/${_[1]}`));
                let {
                    key: t,
                    pattern: r,
                    cleanedKey: i,
                    repeat: o,
                    optional: l
                } = p({
                    getSafeRouteKey: f,
                    segment: _[2],
                    routeKeys: h,
                    keyPrefix: e,
                    backreferenceDuplicateKeys: a
                }), u = r;
                n && _[1] && (u = u.substring(1)), m.push(u), g.push(`/:${d.names[t]??i}${o?l?"*":"+":""}`), d.names[t] ??= i
            } else m.push(`/${(0,s.escapeStringRegexp)(c)}`), g.push(`/${c}`);
            r && _ && _[3] && (m.push((0, s.escapeStringRegexp)(_[3])), g.push(_[3]))
        }
        return {
            namedParameterizedRoute: m.join(""),
            routeKeys: h,
            pathToRegexpPattern: g.join(""),
            reference: d
        }
    }

    function h(e, t) {
        let r = f(e, t.prefixRouteKeys, t.includeSuffix ?? !1, t.includePrefix ?? !1, t.backreferenceDuplicateKeys ?? !1, t.reference),
            n = r.namedParameterizedRoute;
        return t.excludeOptionalTrailingSlash || (n += "(?:/)?"), {
            ...d(e, t),
            namedRegex: `^${n}$`,
            routeKeys: r.routeKeys,
            pathToRegexpPattern: r.pathToRegexpPattern,
            reference: r.reference
        }
    }

    function m(e, t) {
        let {
            parameterizedRoute: r
        } = c(e, !1, !1), {
            catchAll: n = !0
        } = t;
        if ("/" === r) return {
            namedRegex: `^/${n?".*":""}$`
        };
        let {
            namedParameterizedRoute: a
        } = f(e, !1, !1, !1, !1, void 0);
        return {
            namedRegex: `^${a}${n?"(?:(/.*)?)":""}$`
        }
    }
}, 452737, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "detectDomainLocale", {
        enumerable: !0,
        get: function() {
            return n
        }
    });
    let n = function() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r]
    };
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 355997, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "addLocale", {
        enumerable: !0,
        get: function() {
            return n
        }
    }), e.r(294089);
    let n = function(e) {
        for (var t = arguments.length, r = Array(t > 1 ? t - 1 : 0), n = 1; n < t; n++) r[n - 1] = arguments[n];
        return e
    };
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 320318, (e, t, r) => {
    "use strict";

    function n(e, t) {
        return e
    }
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "removeLocale", {
        enumerable: !0,
        get: function() {
            return n
        }
    }), e.r(959227), ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 51857, (e, t, r) => {
    "use strict";

    function n(e, t) {
        let r = {};
        return Object.keys(e).forEach(n => {
            t.includes(n) || (r[n] = e[n])
        }), r
    }
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "omit", {
        enumerable: !0,
        get: function() {
            return n
        }
    })
}, 97929, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "interpolateAs", {
        enumerable: !0,
        get: function() {
            return i
        }
    });
    let n = e.r(104867),
        a = e.r(85320);

    function i(e, t, r) {
        let i = "",
            o = (0, a.getRouteRegex)(e),
            s = o.groups,
            l = (t !== e ? (0, n.getRouteMatcher)(o)(t) : "") || r;
        i = e;
        let u = Object.keys(s);
        return u.every(e => {
            let t = l[e] || "",
                {
                    repeat: r,
                    optional: n
                } = s[e],
                a = `[${r?"...":""}${e}]`;
            return n && (a = `${!t?"/":""}[${a}]`), r && !Array.isArray(t) && (t = [t]), (n || e in l) && (i = i.replace(a, r ? t.map(e => encodeURIComponent(e)).join("/") : encodeURIComponent(t)) || "/")
        }) || (i = ""), {
            params: u,
            result: i
        }
    }
}, 941991, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "resolveHref", {
        enumerable: !0,
        get: function() {
            return f
        }
    });
    let n = e.r(565112),
        a = e.r(414035),
        i = e.r(51857),
        o = e.r(378201),
        s = e.r(294089),
        l = e.r(686429),
        u = e.r(776881),
        c = e.r(97929),
        d = e.r(85320),
        p = e.r(104867);

    function f(e, t, r) {
        let f, h = "string" == typeof t ? t : (0, a.formatWithValidation)(t),
            m = h.match(/^[a-z][a-z0-9+.-]*:\/\//i),
            g = m ? h.slice(m[0].length) : h;
        if ((g.split("?", 1)[0] || "").match(/(\/\/|\\)/)) {
            console.error(`Invalid href '${h}' passed to next/router in page: '${e.pathname}'. Repeated forward-slashes (//) or backslashes \\ are not valid in the href.`);
            let t = (0, o.normalizeRepeatedSlashes)(g);
            h = (m ? m[0] : "") + t
        }
        if (!(0, l.isLocalURL)(h)) return r ? [h] : h;
        try {
            let t = h.startsWith("#") ? e.asPath : e.pathname;
            if (h.startsWith("?") && (t = e.asPath, (0, u.isDynamicRoute)(e.pathname))) {
                t = e.pathname;
                let r = (0, d.getRouteRegex)(e.pathname);
                (0, p.getRouteMatcher)(r)(e.asPath) || (t = e.asPath)
            }
            f = new URL(t, "http://n")
        } catch (e) {
            f = new URL("/", "http://n")
        }
        try {
            let e = new URL(h, f);
            e.pathname = (0, s.normalizePathTrailingSlash)(e.pathname);
            let t = "";
            if ((0, u.isDynamicRoute)(e.pathname) && e.searchParams && r) {
                let r = (0, n.searchParamsToUrlQuery)(e.searchParams),
                    {
                        result: o,
                        params: s
                    } = (0, c.interpolateAs)(e.pathname, e.pathname, r);
                o && (t = (0, a.formatWithValidation)({
                    pathname: o,
                    hash: e.hash,
                    query: (0, i.omit)(r, s)
                }))
            }
            let o = e.origin === f.origin ? e.href.slice(e.origin.length) : e.href;
            return r ? [o, t || o] : o
        } catch (e) {
            return r ? [h] : h
        }
    }("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 321161, (e, t, r) => {
    "use strict";

    function n(e) {
        return "/api" === e || !!(null == e ? void 0 : e.startsWith("/api/"))
    }
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "isAPIRoute", {
        enumerable: !0,
        get: function() {
            return n
        }
    })
}, 448691, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "removePathPrefix", {
        enumerable: !0,
        get: function() {
            return a
        }
    });
    let n = e.r(115523);

    function a(e, t) {
        if (!(0, n.pathHasPrefix)(e, t)) return e;
        let r = e.slice(t.length);
        return r.startsWith("/") ? r : `/${r}`
    }
}, 781992, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "getNextPathnameInfo", {
        enumerable: !0,
        get: function() {
            return o
        }
    });
    let n = e.r(793296),
        a = e.r(448691),
        i = e.r(115523);

    function o(e, t) {
        let {
            basePath: r,
            i18n: o,
            trailingSlash: s
        } = t.nextConfig ?? {}, l = {
            pathname: e,
            trailingSlash: "/" !== e ? e.endsWith("/") : s
        };
        r && (0, i.pathHasPrefix)(l.pathname, r) && (l.pathname = (0, a.removePathPrefix)(l.pathname, r), l.basePath = r);
        let u = l.pathname;
        if (l.pathname.startsWith("/_next/data/") && l.pathname.endsWith(".json")) {
            let e = l.pathname.replace(/^\/_next\/data\//, "").replace(/\.json$/, "").split("/");
            l.buildId = e[0], u = "index" !== e[1] ? `/${e.slice(1).join("/")}` : "/", !0 === t.parseData && (l.pathname = u)
        }
        if (o) {
            let e = t.i18nProvider ? t.i18nProvider.analyze(l.pathname) : (0, n.normalizeLocalePath)(l.pathname, o.locales);
            l.locale = e.detectedLocale, l.pathname = e.pathname ?? l.pathname, !e.detectedLocale && l.buildId && (e = t.i18nProvider ? t.i18nProvider.analyze(u) : (0, n.normalizeLocalePath)(u, o.locales)).detectedLocale && (l.locale = e.detectedLocale)
        }
        return l
    }
}, 477854, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "addPathSuffix", {
        enumerable: !0,
        get: function() {
            return a
        }
    });
    let n = e.r(959227);

    function a(e, t) {
        if (!e.startsWith("/") || !t) return e;
        let {
            pathname: r,
            query: a,
            hash: i
        } = (0, n.parsePath)(e);
        return `${r}${t}${a}${i}`
    }
}, 265262, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "addLocale", {
        enumerable: !0,
        get: function() {
            return i
        }
    });
    let n = e.r(926115),
        a = e.r(115523);

    function i(e, t, r, i) {
        if (!t || t === r) return e;
        let o = e.toLowerCase();
        return !i && ((0, a.pathHasPrefix)(o, "/api") || (0, a.pathHasPrefix)(o, `/${t.toLowerCase()}`)) ? e : (0, n.addPathPrefix)(e, `/${t}`)
    }
}, 957314, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "formatNextPathnameInfo", {
        enumerable: !0,
        get: function() {
            return s
        }
    });
    let n = e.r(69220),
        a = e.r(926115),
        i = e.r(477854),
        o = e.r(265262);

    function s(e) {
        let t = (0, o.addLocale)(e.pathname, e.locale, e.buildId ? void 0 : e.defaultLocale, e.ignorePrefix);
        return (e.buildId || !e.trailingSlash) && (t = (0, n.removeTrailingSlash)(t)), e.buildId && (t = (0, i.addPathSuffix)((0, a.addPathPrefix)(t, `/_next/data/${e.buildId}`), "/" === e.pathname ? "index.json" : ".json")), t = (0, a.addPathPrefix)(t, e.basePath), !e.buildId && e.trailingSlash ? t.endsWith("/") ? t : (0, i.addPathSuffix)(t, "/") : (0, n.removeTrailingSlash)(t)
    }
}, 713091, (e, t, r) => {
    "use strict";

    function n(e, t) {
        let r = Object.keys(e);
        if (r.length !== Object.keys(t).length) return !1;
        for (let n = r.length; n--;) {
            let a = r[n];
            if ("query" === a) {
                let r = Object.keys(e.query);
                if (r.length !== Object.keys(t.query).length) return !1;
                for (let n = r.length; n--;) {
                    let a = r[n];
                    if (!t.query.hasOwnProperty(a) || e.query[a] !== t.query[a]) return !1
                }
            } else if (!t.hasOwnProperty(a) || e[a] !== t[a]) return !1
        }
        return !0
    }
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "compareRouterStates", {
        enumerable: !0,
        get: function() {
            return n
        }
    })
}, 561355, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "getPathMatch", {
        enumerable: !0,
        get: function() {
            return a
        }
    });
    let n = e.r(273577);

    function a(e, t) {
        let r = [],
            a = (0, n.pathToRegexp)(e, r, {
                delimiter: "/",
                sensitive: "boolean" == typeof t?.sensitive && t.sensitive,
                strict: t?.strict
            }),
            i = (0, n.regexpToFunction)(t?.regexModifier ? new RegExp(t.regexModifier(a.source), a.flags) : a, r);
        return (e, n) => {
            if ("string" != typeof e) return !1;
            let a = i(e);
            if (!a) return !1;
            if (t?.removeUnnamedParams)
                for (let e of r) "number" == typeof e.name && delete a.params[e.name];
            return {
                ...n,
                ...a.params
            }
        }
    }
}, 48750, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "parseUrl", {
        enumerable: !0,
        get: function() {
            return i
        }
    });
    let n = e.r(565112),
        a = e.r(56764);

    function i(e) {
        if (e.startsWith("/")) return (0, a.parseRelativeUrl)(e);
        let t = new URL(e),
            r = t.username,
            i = t.password,
            o = r ? i ? `${r}:${i}` : r : null,
            s = t.pathname,
            l = t.search;
        return {
            auth: o,
            hash: t.hash,
            hostname: t.hostname,
            href: t.href,
            pathname: s,
            port: t.port,
            protocol: t.protocol,
            query: (0, n.searchParamsToUrlQuery)(t.searchParams),
            search: l,
            origin: t.origin,
            slashes: "//" === t.href.slice(t.protocol.length, t.protocol.length + 2)
        }
    }
}, 197652, (e, t, r) => {
    (() => {
        "use strict";
        "u" > typeof __nccwpck_require__ && (__nccwpck_require__.ab = "/ROOT/node_modules/.pnpm/next@16.2.6_patch_hash=2889283f843aeb9b88db5fd798b6e589c78c4b38fab3ccd115a3f784da4f1be8_5143821f351443e644013a4d37024e4a/node_modules/next/dist/compiled/cookie/");
        var e, r, n, a, i = {};
        i.parse = function(t, r) {
            if ("string" != typeof t) throw TypeError("argument str must be a string");
            for (var a = {}, i = t.split(n), o = (r || {}).decode || e, s = 0; s < i.length; s++) {
                var l = i[s],
                    u = l.indexOf("=");
                if (!(u < 0)) {
                    var c = l.substr(0, u).trim(),
                        d = l.substr(++u, l.length).trim();
                    '"' == d[0] && (d = d.slice(1, -1)), void 0 == a[c] && (a[c] = function(e, t) {
                        try {
                            return t(e)
                        } catch (t) {
                            return e
                        }
                    }(d, o))
                }
            }
            return a
        }, i.serialize = function(e, t, n) {
            var i = n || {},
                o = i.encode || r;
            if ("function" != typeof o) throw TypeError("option encode is invalid");
            if (!a.test(e)) throw TypeError("argument name is invalid");
            var s = o(t);
            if (s && !a.test(s)) throw TypeError("argument val is invalid");
            var l = e + "=" + s;
            if (null != i.maxAge) {
                var u = i.maxAge - 0;
                if (isNaN(u) || !isFinite(u)) throw TypeError("option maxAge is invalid");
                l += "; Max-Age=" + Math.floor(u)
            }
            if (i.domain) {
                if (!a.test(i.domain)) throw TypeError("option domain is invalid");
                l += "; Domain=" + i.domain
            }
            if (i.path) {
                if (!a.test(i.path)) throw TypeError("option path is invalid");
                l += "; Path=" + i.path
            }
            if (i.expires) {
                if ("function" != typeof i.expires.toUTCString) throw TypeError("option expires is invalid");
                l += "; Expires=" + i.expires.toUTCString()
            }
            if (i.httpOnly && (l += "; HttpOnly"), i.secure && (l += "; Secure"), i.sameSite) switch ("string" == typeof i.sameSite ? i.sameSite.toLowerCase() : i.sameSite) {
                case !0:
                case "strict":
                    l += "; SameSite=Strict";
                    break;
                case "lax":
                    l += "; SameSite=Lax";
                    break;
                case "none":
                    l += "; SameSite=None";
                    break;
                default:
                    throw TypeError("option sameSite is invalid")
            }
            return l
        }, e = decodeURIComponent, r = encodeURIComponent, n = /; */, a = /^[\u0009\u0020-\u007e\u0080-\u00ff]+$/, t.exports = i
    })()
}, 410956, (e, t, r) => {
    "use strict";

    function n(t) {
        return function() {
            let {
                cookie: r
            } = t;
            if (!r) return {};
            let {
                parse: n
            } = e.r(197652);
            return n(Array.isArray(r) ? r.join("; ") : r)
        }
    }
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "getCookieParser", {
        enumerable: !0,
        get: function() {
            return n
        }
    })
}, 885316, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        compileNonPath: function() {
            return p
        },
        matchHas: function() {
            return d
        },
        parseDestination: function() {
            return f
        },
        prepareDestination: function() {
            return h
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });
    let i = e.r(746714),
        o = e.r(48750),
        s = e.r(92744),
        l = e.r(410956),
        u = e.r(577615);

    function c(e) {
        return e.replace(/__ESC_COLON_/gi, ":")
    }

    function d(e, t) {
        let r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : [],
            n = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : [],
            a = {},
            i = r => {
                let n, i = r.key;
                switch (r.type) {
                    case "header":
                        i = i.toLowerCase(), n = e.headers[i];
                        break;
                    case "cookie":
                        n = "cookies" in e ? e.cookies[r.key] : (0, l.getCookieParser)(e.headers)()[r.key];
                        break;
                    case "query":
                        n = t[i];
                        break;
                    case "host": {
                        let {
                            host: t
                        } = e?.headers || {};
                        n = t?.split(":", 1)[0].toLowerCase()
                    }
                }
                if (!r.value && n) return a[function(e) {
                    let t = "";
                    for (let r = 0; r < e.length; r++) {
                        let n = e.charCodeAt(r);
                        (n > 64 && n < 91 || n > 96 && n < 123) && (t += e[r])
                    }
                    return t
                }(i)] = n, !0;
                if (n) {
                    let e = RegExp(`^${r.value}$`),
                        t = Array.isArray(n) ? n.slice(-1)[0].match(e) : n.match(e);
                    if (t) return Array.isArray(t) && (t.groups ? Object.keys(t.groups).forEach(e => {
                        a[e] = t.groups[e]
                    }) : "host" === r.type && t[0] && (a.host = t[0])), !0
                }
                return !1
            };
        return !(!r.every(e => i(e)) || n.some(e => i(e))) && a
    }

    function p(e, t) {
        if (!e.includes(":")) return e;
        for (let r of Object.keys(t)) e.includes(`:${r}`) && (e = e.replace(RegExp(`:${r}\\*`, "g"), `:${r}--ESCAPED_PARAM_ASTERISKS`).replace(RegExp(`:${r}\\?`, "g"), `:${r}--ESCAPED_PARAM_QUESTION`).replace(RegExp(`:${r}\\+`, "g"), `:${r}--ESCAPED_PARAM_PLUS`).replace(RegExp(`:${r}(?!\\w)`, "g"), `--ESCAPED_PARAM_COLON${r}`));
        return e = e.replace(/(:|\*|\?|\+|\(|\)|\{|\})/g, "\\$1").replace(/--ESCAPED_PARAM_PLUS/g, "+").replace(/--ESCAPED_PARAM_COLON/g, ":").replace(/--ESCAPED_PARAM_QUESTION/g, "?").replace(/--ESCAPED_PARAM_ASTERISKS/g, "*"), (0, u.safeCompile)(`/${e}`, {
            validate: !1
        })(t).slice(1)
    }

    function f(e) {
        let t = e.destination;
        for (let r of Object.keys({
                ...e.params,
                ...e.query
            })) r && (t = t.replace(RegExp(`:${(0,i.escapeStringRegexp)(r)}`, "g"), `__ESC_COLON_${r}`));
        let r = (0, o.parseUrl)(t),
            n = r.pathname;
        n && (n = c(n));
        let a = r.href;
        a && (a = c(a));
        let s = r.hostname;
        s && (s = c(s));
        let l = r.hash;
        l && (l = c(l));
        let u = r.search;
        u && (u = c(u));
        let d = r.origin;
        return d && (d = c(d)), {
            ...r,
            pathname: n,
            hostname: s,
            href: a,
            hash: l,
            search: u,
            origin: d
        }
    }

    function h(e) {
        let t, r, n = f(e),
            {
                hostname: a,
                query: i,
                search: o
            } = n,
            l = n.pathname;
        n.hash && (l = `${l}${n.hash}`);
        let d = [],
            h = [];
        for (let e of ((0, u.safePathToRegexp)(l, h), h)) d.push(e.name);
        if (a) {
            let e = [];
            for (let t of ((0, u.safePathToRegexp)(a, e), e)) d.push(t.name)
        }
        let m = (0, u.safeCompile)(l, {
            validate: !1
        });
        for (let [r, n] of(a && (t = (0, u.safeCompile)(a, {
                validate: !1
            })), Object.entries(i))) Array.isArray(n) ? i[r] = n.map(t => p(c(t), e.params)) : "string" == typeof n && (i[r] = p(c(n), e.params));
        let g = Object.keys(e.params).filter(e => "nextInternalLocale" !== e);
        if (e.appendParamsToQuery && !g.some(e => d.includes(e)))
            for (let t of g) t in i || (i[t] = e.params[t]);
        if ((0, s.isInterceptionRouteAppPath)(l))
            for (let t of l.split("/")) {
                let r = s.INTERCEPTION_ROUTE_MARKERS.find(e => t.startsWith(e));
                if (r) {
                    "(..)(..)" === r ? (e.params["0"] = "(..)", e.params["1"] = "(..)") : e.params["0"] = r;
                    break
                }
            }
        try {
            let [a, i] = (r = m(e.params)).split("#", 2);
            t && (n.hostname = t(e.params)), n.pathname = a, n.hash = `${i?"#":""}${i||""}`, n.search = o ? p(o, e.params) : ""
        } catch (e) {
            if (e.message.match(/Expected .*? to not repeat, but got an array/)) throw Object.defineProperty(Error("To use a multi-match in the destination you must add `*` at the end of the param name to signify it should repeat. https://nextjs.org/docs/messages/invalid-multi-match"), "__NEXT_ERROR_CODE", {
                value: "E329",
                enumerable: !1,
                configurable: !0
            });
            throw e
        }
        return n.query = {
            ...e.query,
            ...n.query
        }, {
            newUrl: r,
            destQuery: i,
            parsedDestination: n
        }
    }
}, 961300, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "default", {
        enumerable: !0,
        get: function() {
            return u
        }
    });
    let n = e.r(561355),
        a = e.r(885316),
        i = e.r(69220),
        o = e.r(793296),
        s = e.r(725780),
        l = e.r(56764);

    function u(e, t, r, u, c, d) {
        let p, f = !1,
            h = !1,
            m = (0, l.parseRelativeUrl)(e),
            g = (0, i.removeTrailingSlash)((0, o.normalizeLocalePath)((0, s.removeBasePath)(m.pathname), d).pathname),
            _ = r => {
                let l = (0, n.getPathMatch)(r.source + "", {
                    removeUnnamedParams: !0,
                    strict: !0
                })(m.pathname);
                if ((r.has || r.missing) && l) {
                    let e = (0, a.matchHas)({
                        headers: {
                            host: document.location.hostname,
                            "user-agent": navigator.userAgent
                        },
                        cookies: document.cookie.split("; ").reduce((e, t) => {
                            let [r, ...n] = t.split("=");
                            return e[r] = n.join("="), e
                        }, {})
                    }, m.query, r.has, r.missing);
                    e ? Object.assign(l, e) : l = !1
                }
                if (l) {
                    if (!r.destination) return h = !0, !0;
                    let n = (0, a.prepareDestination)({
                        appendParamsToQuery: !0,
                        destination: r.destination,
                        params: l,
                        query: u
                    });
                    if (m = n.parsedDestination, e = n.newUrl, Object.assign(u, n.parsedDestination.query), g = (0, i.removeTrailingSlash)((0, o.normalizeLocalePath)((0, s.removeBasePath)(e), d).pathname), t.includes(g)) return f = !0, p = g, !0;
                    if ((p = c(g)) !== e && t.includes(p)) return f = !0, !0
                }
            },
            v = !1;
        for (let e = 0; e < r.beforeFiles.length; e++) _(r.beforeFiles[e]);
        if (!(f = t.includes(g))) {
            if (!v) {
                for (let e = 0; e < r.afterFiles.length; e++)
                    if (_(r.afterFiles[e])) {
                        v = !0;
                        break
                    }
            }
            if (v || (p = c(g), v = f = t.includes(p)), !v) {
                for (let e = 0; e < r.fallback.length; e++)
                    if (_(r.fallback[e])) {
                        v = !0;
                        break
                    }
            }
        }
        return {
            asPath: e,
            parsedAs: m,
            matchedPage: f,
            resolvedHref: p,
            externalDest: h
        }
    }
}, 116239, (e, t, r) => {
    "use strict";
    let n;
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var a = {
        createKey: function() {
            return J
        },
        default: function() {
            return Q
        },
        matchesMiddleware: function() {
            return W
        }
    };
    for (var i in a) Object.defineProperty(r, i, {
        enumerable: !0,
        get: a[i]
    });
    let o = e.r(481258),
        s = e.r(744066),
        l = e.r(69220),
        u = e.r(639948),
        c = e.r(686591),
        d = s._(e.r(939190)),
        p = e.r(490825),
        f = e.r(793296),
        h = o._(e.r(45647)),
        m = e.r(378201),
        g = e.r(11931),
        _ = e.r(56764),
        v = e.r(104867),
        y = e.r(85320),
        b = e.r(414035);
    e.r(452737);
    let E = e.r(959227),
        S = e.r(355997),
        T = e.r(320318),
        R = e.r(725780),
        I = e.r(393806),
        O = e.r(861013),
        P = e.r(941991),
        w = e.r(321161),
        N = e.r(781992),
        A = e.r(957314),
        C = e.r(713091),
        D = e.r(686429),
        x = e.r(149145),
        L = e.r(51857),
        U = e.r(97929),
        M = e.r(455528),
        B = e.r(862384),
        k = e.r(61509),
        j = e.r(916781);

    function $() {
        return Object.assign(Object.defineProperty(Error("Route Cancelled"), "__NEXT_ERROR_CODE", {
            value: "E315",
            enumerable: !1,
            configurable: !0
        }), {
            cancelled: !0
        })
    }
    async function W(e) {
        let t = await Promise.resolve(e.router.pageLoader.getMiddleware());
        if (!t) return !1;
        let {
            pathname: r
        } = (0, E.parsePath)(e.asPath), n = (0, O.hasBasePath)(r) ? (0, R.removeBasePath)(r) : r, a = (0, I.addBasePath)((0, S.addLocale)(n, e.locale));
        return t.some(e => new RegExp(e.regexp).test(a))
    }

    function F(e) {
        let t = (0, m.getLocationOrigin)();
        return e.startsWith(t) ? e.substring(t.length) : e
    }

    function H(e, t, r) {
        let [n, a] = (0, P.resolveHref)(e, t, !0), i = (0, m.getLocationOrigin)(), o = n.startsWith(i), s = a && a.startsWith(i);
        n = F(n), a = a ? F(a) : a;
        let l = o ? n : (0, I.addBasePath)(n),
            u = r ? F((0, P.resolveHref)(e, r)) : a || n;
        return {
            url: l,
            as: s ? u : (0, I.addBasePath)(u)
        }
    }

    function G(e, t) {
        let r = (0, l.removeTrailingSlash)((0, p.denormalizePagePath)(e));
        return "/404" === r || "/_error" === r ? e : (t.includes(r) || t.some(t => {
            if ((0, g.isDynamicRoute)(t) && (0, y.getRouteRegex)(t).re.test(r)) return e = t, !0
        }), (0, l.removeTrailingSlash)(e))
    }
    async function q(e) {
        if (!await W(e) || !e.fetchData) return null;
        let t = await e.fetchData(),
            r = await
        function(e, t, r) {
            let a = {
                    basePath: r.router.basePath,
                    i18n: {
                        locales: r.router.locales
                    },
                    trailingSlash: !1
                },
                i = t.headers.get("x-nextjs-rewrite"),
                o = i || t.headers.get("x-nextjs-matched-path"),
                s = t.headers.get(B.MATCHED_PATH_HEADER);
            if (!s || o || s.includes("__next_data_catchall") || s.includes("/_error") || s.includes("/404") || (o = s), o) {
                if (o.startsWith("/")) {
                    let t = (0, _.parseRelativeUrl)(o),
                        s = (0, N.getNextPathnameInfo)(t.pathname, {
                            nextConfig: a,
                            parseData: !0
                        }),
                        c = (0, l.removeTrailingSlash)(s.pathname);
                    return Promise.all([r.router.pageLoader.getPageList(), (0, u.getClientBuildManifest)()]).then(a => {
                        let [o, {
                            __rewrites: l
                        }] = a, u = (0, S.addLocale)(s.pathname, s.locale);
                        if ((0, g.isDynamicRoute)(u) || !i && o.includes((0, f.normalizeLocalePath)((0, R.removeBasePath)(u), r.router.locales).pathname)) {
                            let r = (0, N.getNextPathnameInfo)((0, _.parseRelativeUrl)(e).pathname, {
                                nextConfig: void 0,
                                parseData: !0
                            });
                            t.pathname = u = (0, I.addBasePath)(r.pathname)
                        } {
                            let e = n(u, o, l, t.query, e => G(e, o), r.router.locales);
                            e.matchedPage && (t.pathname = e.parsedAs.pathname, u = t.pathname, Object.assign(t.query, e.parsedAs.query))
                        }
                        let d = o.includes(c) ? c : G((0, f.normalizeLocalePath)((0, R.removeBasePath)(t.pathname), r.router.locales).pathname, o);
                        if ((0, g.isDynamicRoute)(d)) {
                            let e = (0, v.getRouteMatcher)((0, y.getRouteRegex)(d))(u);
                            Object.assign(t.query, e || {})
                        }
                        return {
                            type: "rewrite",
                            parsedAs: t,
                            resolvedHref: d
                        }
                    })
                }
                let t = (0, E.parsePath)(e),
                    s = (0, A.formatNextPathnameInfo)({
                        ...(0, N.getNextPathnameInfo)(t.pathname, {
                            nextConfig: a,
                            parseData: !0
                        }),
                        defaultLocale: r.router.defaultLocale,
                        buildId: ""
                    });
                return Promise.resolve({
                    type: "redirect-external",
                    destination: `${s}${t.query}${t.hash}`
                })
            }
            let c = t.headers.get("x-nextjs-redirect");
            if (c) {
                if (c.startsWith("/")) {
                    let e = (0, E.parsePath)(c),
                        t = (0, A.formatNextPathnameInfo)({
                            ...(0, N.getNextPathnameInfo)(e.pathname, {
                                nextConfig: a,
                                parseData: !0
                            }),
                            defaultLocale: r.router.defaultLocale,
                            buildId: ""
                        });
                    return Promise.resolve({
                        type: "redirect-internal",
                        newAs: `${t}${e.query}${e.hash}`,
                        newUrl: `${t}${e.query}${e.hash}`
                    })
                }
                return Promise.resolve({
                    type: "redirect-external",
                    destination: c
                })
            }
            return Promise.resolve({
                type: "next"
            })
        }(t.dataHref, t.response, e);
        return {
            dataHref: t.dataHref,
            json: t.json,
            response: t.response,
            text: t.text,
            cacheKey: t.cacheKey,
            effect: r
        }
    }
    n = e.r(961300).default;
    let z = Symbol("SSG_DATA_NOT_FOUND");

    function X(e) {
        try {
            return JSON.parse(e)
        } catch (e) {
            return null
        }
    }

    function Y(e) {
        let {
            dataHref: t,
            inflightCache: r,
            isPrefetch: n,
            hasMiddleware: a,
            isServerRender: i,
            parseJSON: o,
            persistCache: s,
            isBackground: l,
            unstable_skipClientCache: c
        } = e, {
            href: d
        } = new URL(t, window.location.href), p = (0, k.getDeploymentId)(), f = e => (function e(t, r, n) {
            return fetch(t, {
                credentials: "same-origin",
                method: n.method || "GET",
                headers: Object.assign({}, n.headers, {
                    "x-nextjs-data": "1"
                })
            }).then(a => !a.ok && r > 1 && a.status >= 500 ? e(t, r - 1, n) : a)
        })(t, i ? 3 : 1, {
            headers: Object.assign({}, n ? {
                purpose: "prefetch"
            } : {}, n && a ? {
                "x-middleware-prefetch": "1"
            } : {}, p ? {
                "x-deployment-id": p
            } : {}),
            method: e?.method ?? "GET"
        }).then(r => r.ok && e?.method === "HEAD" ? {
            dataHref: t,
            response: r,
            text: "",
            json: {},
            cacheKey: d
        } : r.text().then(e => {
            if (!r.ok) {
                if (a && [301, 302, 307, 308].includes(r.status)) return {
                    dataHref: t,
                    response: r,
                    text: e,
                    json: {},
                    cacheKey: d
                };
                if (404 === r.status && X(e)?.notFound) return {
                    dataHref: t,
                    json: {
                        notFound: z
                    },
                    response: r,
                    text: e,
                    cacheKey: d
                };
                let n = Object.defineProperty(Error("Failed to load static props"), "__NEXT_ERROR_CODE", {
                    value: "E124",
                    enumerable: !1,
                    configurable: !0
                });
                throw i || (0, u.markAssetError)(n), n
            }
            let n = r.headers.get(B.NEXT_NAV_DEPLOYMENT_ID_HEADER);
            if (null != n && n !== p) {
                let e = Object.defineProperty(Error("Loaded static props were from an outdated deployment, forcing a hard reload"), "__NEXT_ERROR_CODE", {
                    value: "E989",
                    enumerable: !1,
                    configurable: !0
                });
                throw i || (0, u.markAssetError)(e), e
            }
            return {
                dataHref: t,
                json: o ? X(e) : null,
                response: r,
                text: e,
                cacheKey: d
            }
        })).then(e => (s && "no-cache" !== e.response.headers.get("x-middleware-cache") || delete r[d], e)).catch(e => {
            throw c || delete r[d], ("Failed to fetch" === e.message || "NetworkError when attempting to fetch resource." === e.message || "Load failed" === e.message) && (0, u.markAssetError)(e), e
        });
        return c && s ? f({}).then(e => ("no-cache" !== e.response.headers.get("x-middleware-cache") && (r[d] = Promise.resolve(e)), e)) : void 0 !== r[d] ? r[d] : r[d] = f(l ? {
            method: "HEAD"
        } : {})
    }

    function J() {
        return Math.random().toString(36).slice(2, 10)
    }

    function K(e) {
        let {
            url: t,
            router: r
        } = e;
        if (t === (0, I.addBasePath)((0, S.addLocale)(r.asPath, r.locale))) throw Object.defineProperty(Error(`Invariant: attempted to hard navigate to the same URL ${t} ${location.href}`), "__NEXT_ERROR_CODE", {
            value: "E282",
            enumerable: !1,
            configurable: !0
        });
        window.location.href = t
    }
    let V = e => {
        let {
            route: t,
            router: r
        } = e, n = !1, a = r.clc = () => {
            n = !0
        };
        return () => {
            if (n) {
                let e = Object.defineProperty(Error(`Abort fetching component for route: "${t}"`), "__NEXT_ERROR_CODE", {
                    value: "E483",
                    enumerable: !1,
                    configurable: !0
                });
                throw e.cancelled = !0, e
            }
            a === r.clc && (r.clc = null)
        }
    };
    class Q {
        reload() {
            window.location.reload()
        }
        back() {
            window.history.back()
        }
        forward() {
            window.history.forward()
        }
        push(e, t) {
            let r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
            if ((0, j.isJavaScriptURLString)(e.toString()) || t && (0, j.isJavaScriptURLString)(t.toString())) throw Object.defineProperty(Error("Next.js has blocked a javascript: URL as a security precaution."), "__NEXT_ERROR_CODE", {
                value: "E978",
                enumerable: !1,
                configurable: !0
            });
            return {
                url: e,
                as: t
            } = H(this, e, t), this.change("pushState", e, t, r)
        }
        replace(e, t) {
            let r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
            if ((0, j.isJavaScriptURLString)(e.toString()) || t && (0, j.isJavaScriptURLString)(t.toString())) throw Object.defineProperty(Error("Next.js has blocked a javascript: URL as a security precaution."), "__NEXT_ERROR_CODE", {
                value: "E978",
                enumerable: !1,
                configurable: !0
            });
            return {
                url: e,
                as: t
            } = H(this, e, t), this.change("replaceState", e, t, r)
        }
        async _bfl(t, r, n, a) {
            {
                if (!this._bfl_s && !this._bfl_d) {
                    let r, i, {
                        BloomFilter: o
                    } = e.r(822138);
                    try {
                        ({
                            __routerFilterStatic: r,
                            __routerFilterDynamic: i
                        } = await (0, u.getClientBuildManifest)())
                    } catch (e) {
                        if (console.error(e), a) return !0;
                        return K({
                            url: (0, I.addBasePath)((0, S.addLocale)(t, n || this.locale, this.defaultLocale)),
                            router: this
                        }), new Promise(() => {})
                    }
                    let s = {
                        numItems: 7,
                        errorRate: 1e-4,
                        numBits: 135,
                        numHashes: 14,
                        bitArray: [1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0]
                    };
                    !r && s && (r = s || void 0);
                    let l = {
                        numItems: 0,
                        errorRate: 1e-4,
                        numBits: 0,
                        numHashes: null,
                        bitArray: []
                    };
                    !i && l && (i = l), r?.numHashes && (this._bfl_s = new o(r.numItems, r.errorRate), this._bfl_s.import(r)), i?.numHashes && (this._bfl_d = new o(i.numItems, i.errorRate), this._bfl_d.import(i))
                }
                let i = !1,
                    o = !1;
                for (let {
                        as: e,
                        allowMatchCurrent: s
                    }
                    of [{
                        as: t
                    }, {
                        as: r
                    }])
                    if (e) {
                        let r = (0, l.removeTrailingSlash)(new URL(e, "http://n").pathname),
                            u = (0, I.addBasePath)((0, S.addLocale)(r, n || this.locale));
                        if (s || r !== (0, l.removeTrailingSlash)(new URL(this.asPath, "http://n").pathname)) {
                            for (let e of (i = i || !!this._bfl_s?.contains(r) || !!this._bfl_s?.contains(u), [r, u])) {
                                let t = e.split("/");
                                for (let e = 0; !o && e < t.length + 1; e++) {
                                    let r = t.slice(0, e).join("/");
                                    if (r && this._bfl_d?.contains(r)) {
                                        o = !0;
                                        break
                                    }
                                }
                            }
                            if (i || o) {
                                if (a) return !0;
                                return K({
                                    url: (0, I.addBasePath)((0, S.addLocale)(t, n || this.locale, this.defaultLocale)),
                                    router: this
                                }), new Promise(() => {})
                            }
                        }
                    }
            }
            return !1
        }
        async change(e, t, r, a, i) {
            let o, s;
            if (!(0, D.isLocalURL)(t)) return K({
                url: t,
                router: this
            }), !1;
            let p = 1 === a._h;
            p || a.shallow || await this._bfl(r, void 0, a.locale);
            let f = p || a._shouldResolveHref || (0, E.parsePath)(t).pathname === (0, E.parsePath)(r).pathname,
                h = {
                    ...this.state
                },
                P = !0 !== this.isReady;
            this.isReady = !0;
            let w = this.isSsr;
            if (p || (this.isSsr = !1), p && this.clc) return !1;
            let N = h.locale;
            m.ST && performance.mark("routeChange");
            let {
                shallow: A = !1,
                scroll: x = !0
            } = a, M = {
                shallow: A
            };
            this._inFlightRoute && this.clc && (w || Q.events.emit("routeChangeError", $(), this._inFlightRoute, M), this.clc(), this.clc = null), r = (0, I.addBasePath)((0, S.addLocale)((0, O.hasBasePath)(r) ? (0, R.removeBasePath)(r) : r, a.locale, this.defaultLocale));
            let B = (0, T.removeLocale)((0, O.hasBasePath)(r) ? (0, R.removeBasePath)(r) : r, h.locale);
            this._inFlightRoute = r;
            let k = N !== h.locale;
            if (!p && this.onlyAHashChange(B) && !k) {
                h.asPath = B, Q.events.emit("hashChangeStart", r, M), this.changeState(e, t, r, {
                    ...a,
                    scroll: !1
                }), x && this.scrollToHash(B);
                try {
                    await this.set(h, this.components[h.route], null)
                } catch (e) {
                    throw (0, d.default)(e) && e.cancelled && Q.events.emit("routeChangeError", e, B, M), e
                }
                return Q.events.emit("hashChangeComplete", r, M), !0
            }
            let j = (0, _.parseRelativeUrl)(t),
                {
                    pathname: F,
                    query: q
                } = j;
            try {
                [o, {
                    __rewrites: s
                }] = await Promise.all([this.pageLoader.getPageList(), (0, u.getClientBuildManifest)(), this.pageLoader.getMiddleware()])
            } catch (e) {
                return K({
                    url: r,
                    router: this
                }), !1
            }
            this.urlIsNew(B) || k || (e = "replaceState");
            let X = r;
            F = F ? (0, l.removeTrailingSlash)((0, R.removeBasePath)(F)) : F;
            let Y = (0, l.removeTrailingSlash)(F),
                J = r.startsWith("/") && (0, _.parseRelativeUrl)(r).pathname;
            if (this.components[F]?.__appRouter) return K({
                url: r,
                router: this
            }), new Promise(() => {});
            let V = !!(J && Y !== J && (!(0, g.isDynamicRoute)(Y) || !(0, v.getRouteMatcher)((0, y.getRouteRegex)(Y))(J))),
                Z = !a.shallow && await W({
                    asPath: r,
                    locale: h.locale,
                    router: this
                });
            if (p && Z && (f = !1), f && "/_error" !== F)
                if (a._shouldResolveHref = !0, r.startsWith("/")) {
                    let e = n((0, I.addBasePath)((0, S.addLocale)(B, h.locale), !0), o, s, q, e => G(e, o), this.locales);
                    if (e.externalDest) return K({
                        url: r,
                        router: this
                    }), !0;
                    Z || (X = e.asPath), e.matchedPage && e.resolvedHref && (F = e.resolvedHref, j.pathname = (0, I.addBasePath)(F), Z || (t = (0, b.formatWithValidation)(j)))
                } else j.pathname = G(F, o), j.pathname !== F && (F = j.pathname, j.pathname = (0, I.addBasePath)(F), Z || (t = (0, b.formatWithValidation)(j)));
            if (!(0, D.isLocalURL)(r)) return K({
                url: r,
                router: this
            }), !1;
            X = (0, T.removeLocale)((0, R.removeBasePath)(X), h.locale), Y = (0, l.removeTrailingSlash)(F);
            let ee = !1;
            if ((0, g.isDynamicRoute)(Y)) {
                let e = (0, _.parseRelativeUrl)(X),
                    n = e.pathname,
                    a = (0, y.getRouteRegex)(Y);
                ee = (0, v.getRouteMatcher)(a)(n);
                let i = Y === n,
                    o = i ? (0, U.interpolateAs)(Y, n, q) : {};
                if (ee && (!i || o.result)) i ? r = (0, b.formatWithValidation)(Object.assign({}, e, {
                    pathname: o.result,
                    query: (0, L.omit)(q, o.params)
                })) : Object.assign(q, ee);
                else {
                    let e = Object.keys(a.groups).filter(e => !q[e] && !a.groups[e].optional);
                    if (e.length > 0 && !Z) throw Object.defineProperty(Error((i ? `The provided \`href\` (${t}) value is missing query values (${e.join(", ")}) to be interpolated properly. ` : `The provided \`as\` value (${n}) is incompatible with the \`href\` value (${Y}). `) + `Read more: https://nextjs.org/docs/messages/${i?"href-interpolation-failed":"incompatible-href-as"}`), "__NEXT_ERROR_CODE", {
                        value: "E344",
                        enumerable: !1,
                        configurable: !0
                    })
                }
            }
            p || Q.events.emit("routeChangeStart", r, M);
            let et = "/404" === this.pathname || "/_error" === this.pathname;
            try {
                let n = await this.getRouteInfo({
                    route: Y,
                    pathname: F,
                    query: q,
                    as: r,
                    resolvedAs: X,
                    routeProps: M,
                    locale: h.locale,
                    isPreview: h.isPreview,
                    hasMiddleware: Z,
                    unstable_skipClientCache: a.unstable_skipClientCache,
                    isQueryUpdating: p && !this.isFallback,
                    isMiddlewareRewrite: V
                });
                if (p || a.shallow || await this._bfl(r, "resolvedAs" in n ? n.resolvedAs : void 0, h.locale), "route" in n && Z) {
                    Y = F = n.route || Y, M.shallow || (q = Object.assign({}, n.query || {}, q));
                    let e = (0, O.hasBasePath)(j.pathname) ? (0, R.removeBasePath)(j.pathname) : j.pathname;
                    if (ee && F !== e && Object.keys(ee).forEach(e => {
                            ee && q[e] === ee[e] && delete q[e]
                        }), (0, g.isDynamicRoute)(F)) {
                        let e = !M.shallow && n.resolvedAs ? n.resolvedAs : (0, I.addBasePath)((0, S.addLocale)(new URL(r, location.href).pathname, h.locale), !0);
                        (0, O.hasBasePath)(e) && (e = (0, R.removeBasePath)(e));
                        let t = (0, y.getRouteRegex)(F),
                            a = (0, v.getRouteMatcher)(t)(new URL(e, location.href).pathname);
                        a && Object.assign(q, a)
                    }
                }
                if ("type" in n)
                    if ("redirect-internal" === n.type) return this.change(e, n.newUrl, n.newAs, a);
                    else return K({
                        url: n.destination,
                        router: this
                    }), new Promise(() => {});
                let s = n.Component;
                if (s && s.unstable_scriptLoader && [].concat(s.unstable_scriptLoader()).forEach(e => {
                        (0, c.handleClientScriptLoad)(e.props)
                    }), (n.__N_SSG || n.__N_SSP) && n.props) {
                    if (n.props.pageProps && n.props.pageProps.__N_REDIRECT) {
                        a.locale = !1;
                        let t = n.props.pageProps.__N_REDIRECT;
                        if (t.startsWith("/") && !1 !== n.props.pageProps.__N_REDIRECT_BASE_PATH) {
                            let r = (0, _.parseRelativeUrl)(t);
                            r.pathname = G(r.pathname, o);
                            let {
                                url: n,
                                as: i
                            } = H(this, t, t);
                            return this.change(e, n, i, a)
                        }
                        return K({
                            url: t,
                            router: this
                        }), new Promise(() => {})
                    }
                    if (h.isPreview = !!n.props.__N_PREVIEW, n.props.notFound === z) {
                        let e;
                        try {
                            await this.fetchComponent("/404"), e = "/404"
                        } catch (t) {
                            e = "/_error"
                        }
                        if (n = await this.getRouteInfo({
                                route: e,
                                pathname: e,
                                query: q,
                                as: r,
                                resolvedAs: X,
                                routeProps: {
                                    shallow: !1
                                },
                                locale: h.locale,
                                isPreview: h.isPreview,
                                isNotFound: !0
                            }), "type" in n) throw Object.defineProperty(Error("Unexpected middleware effect on /404"), "__NEXT_ERROR_CODE", {
                            value: "E158",
                            enumerable: !1,
                            configurable: !0
                        })
                    }
                }
                p && "/_error" === this.pathname && self.__NEXT_DATA__.props?.pageProps?.statusCode === 500 && n.props?.pageProps && (n.props.pageProps.statusCode = 500);
                let l = a.shallow && h.route === (n.route ?? Y),
                    u = a.scroll ?? (!p && !l),
                    f = i ?? (u ? {
                        x: 0,
                        y: 0
                    } : null),
                    m = {
                        ...h,
                        route: Y,
                        pathname: F,
                        query: q,
                        asPath: B,
                        isFallback: !1
                    };
                if (p && et) {
                    if (n = await this.getRouteInfo({
                            route: this.pathname,
                            pathname: this.pathname,
                            query: q,
                            as: r,
                            resolvedAs: X,
                            routeProps: {
                                shallow: !1
                            },
                            locale: h.locale,
                            isPreview: h.isPreview,
                            isQueryUpdating: p && !this.isFallback
                        }), "type" in n) throw Object.defineProperty(Error(`Unexpected middleware effect on ${this.pathname}`), "__NEXT_ERROR_CODE", {
                        value: "E225",
                        enumerable: !1,
                        configurable: !0
                    });
                    "/_error" === this.pathname && self.__NEXT_DATA__.props?.pageProps?.statusCode === 500 && n.props?.pageProps && (n.props.pageProps.statusCode = 500);
                    try {
                        await this.set(m, n, f)
                    } catch (e) {
                        throw (0, d.default)(e) && e.cancelled && Q.events.emit("routeChangeError", e, B, M), e
                    }
                    return !0
                }
                if (Q.events.emit("beforeHistoryChange", r, M), this.changeState(e, t, r, a), !(p && !f && !P && !k && (0, C.compareRouterStates)(m, this.state))) {
                    try {
                        await this.set(m, n, f)
                    } catch (e) {
                        if (e.cancelled) n.error = n.error || e;
                        else throw e
                    }
                    if (n.error) throw p || Q.events.emit("routeChangeError", n.error, B, M), n.error;
                    p || Q.events.emit("routeChangeComplete", r, M), u && /#.+$/.test(r) && this.scrollToHash(r)
                }
                return !0
            } catch (e) {
                if ((0, d.default)(e) && e.cancelled) return !1;
                throw e
            }
        }
        changeState(e, t, r) {
            let n = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : {};
            ("pushState" !== e || (0, m.getURL)() !== r) && (this._shallow = n.shallow, window.history[e]({
                url: t,
                as: r,
                options: n,
                __N: !0,
                key: this._key = "pushState" !== e ? this._key : J()
            }, "", r))
        }
        async handleRouteInfoError(e, t, r, n, a, i) {
            if (e.cancelled) throw e;
            if ((0, u.isAssetError)(e) || i) throw Q.events.emit("routeChangeError", e, n, a), K({
                url: n,
                router: this
            }), $();
            console.error(e);
            try {
                let n, {
                        page: a,
                        styleSheets: i
                    } = await this.fetchComponent("/_error"),
                    o = {
                        props: n,
                        Component: a,
                        styleSheets: i,
                        err: e,
                        error: e
                    };
                if (!o.props) try {
                    o.props = await this.getInitialProps(a, {
                        err: e,
                        pathname: t,
                        query: r
                    })
                } catch (e) {
                    console.error("Error in error page `getInitialProps`: ", e), o.props = {}
                }
                return o
            } catch (e) {
                return this.handleRouteInfoError((0, d.default)(e) ? e : Object.defineProperty(Error(e + ""), "__NEXT_ERROR_CODE", {
                    value: "E394",
                    enumerable: !1,
                    configurable: !0
                }), t, r, n, a, !0)
            }
        }
        async getRouteInfo(e) {
            let {
                route: t,
                pathname: r,
                query: n,
                as: a,
                resolvedAs: i,
                routeProps: o,
                locale: s,
                hasMiddleware: u,
                isPreview: c,
                unstable_skipClientCache: p,
                isQueryUpdating: h,
                isMiddlewareRewrite: m,
                isNotFound: g
            } = e, _ = t;
            try {
                let e = this.components[_];
                if (o.shallow && e && this.route === _) return e;
                let t = V({
                    route: _,
                    router: this
                });
                u && (e = void 0);
                let d = !e || "initial" in e ? void 0 : e,
                    v = {
                        dataHref: this.pageLoader.getDataHref({
                            href: (0, b.formatWithValidation)({
                                pathname: r,
                                query: n
                            }),
                            skipInterpolation: !0,
                            asPath: g ? "/404" : i,
                            locale: s
                        }),
                        hasMiddleware: !0,
                        isServerRender: this.isSsr,
                        parseJSON: !0,
                        inflightCache: h ? this.sbc : this.sdc,
                        persistCache: !c,
                        isPrefetch: !1,
                        unstable_skipClientCache: p,
                        isBackground: h
                    },
                    y = h && !m ? null : await q({
                        fetchData: () => Y(v),
                        asPath: g ? "/404" : i,
                        locale: s,
                        router: this
                    }).catch(e => {
                        if (h) return null;
                        throw e
                    });
                if (y && ("/_error" === r || "/404" === r) && (y.effect = void 0), h && (y ? y.json = self.__NEXT_DATA__.props : y = {
                        json: self.__NEXT_DATA__.props
                    }), t(), y?.effect?.type === "redirect-internal" || y?.effect?.type === "redirect-external") return y.effect;
                if (y?.effect?.type === "rewrite") {
                    let t = (0, l.removeTrailingSlash)(y.effect.resolvedHref),
                        a = await this.pageLoader.getPageList();
                    if ((!h || a.includes(t)) && (_ = t, r = y.effect.resolvedHref, n = {
                            ...n,
                            ...y.effect.parsedAs.query
                        }, i = (0, R.removeBasePath)((0, f.normalizeLocalePath)(y.effect.parsedAs.pathname, this.locales).pathname), e = this.components[_], o.shallow && e && this.route === _ && !u)) return {
                        ...e,
                        route: _
                    }
                }
                if ((0, w.isAPIRoute)(_)) return K({
                    url: a,
                    router: this
                }), new Promise(() => {});
                let E = d || await this.fetchComponent(_).then(e => ({
                        Component: e.page,
                        styleSheets: e.styleSheets,
                        __N_SSG: e.mod.__N_SSG,
                        __N_SSP: e.mod.__N_SSP
                    })),
                    S = y?.response?.headers.get("x-middleware-skip"),
                    T = E.__N_SSG || E.__N_SSP;
                S && y?.dataHref && delete this.sdc[y.dataHref];
                let {
                    props: I,
                    cacheKey: O
                } = await this._getData(async () => {
                    if (T) {
                        if (y?.json && !S) return {
                            cacheKey: y.cacheKey,
                            props: y.json
                        };
                        let e = y?.dataHref ? y.dataHref : this.pageLoader.getDataHref({
                                href: (0, b.formatWithValidation)({
                                    pathname: r,
                                    query: n
                                }),
                                asPath: i,
                                locale: s
                            }),
                            t = await Y({
                                dataHref: e,
                                isServerRender: this.isSsr,
                                parseJSON: !0,
                                inflightCache: S ? {} : this.sdc,
                                persistCache: !c,
                                isPrefetch: !1,
                                unstable_skipClientCache: p
                            });
                        return {
                            cacheKey: t.cacheKey,
                            props: t.json || {}
                        }
                    }
                    return {
                        headers: {},
                        props: await this.getInitialProps(E.Component, {
                            pathname: r,
                            query: n,
                            asPath: a,
                            locale: s,
                            locales: this.locales,
                            defaultLocale: this.defaultLocale
                        })
                    }
                });
                return E.__N_SSP && v.dataHref && O && delete this.sdc[O], this.isPreview || !E.__N_SSG || h || Y(Object.assign({}, v, {
                    isBackground: !0,
                    persistCache: !1,
                    inflightCache: this.sbc
                })).catch(() => {}), I.pageProps = Object.assign({}, I.pageProps), E.props = I, E.route = _, E.query = n, E.resolvedAs = i, this.components[_] = E, E
            } catch (e) {
                return this.handleRouteInfoError((0, d.getProperError)(e), r, n, a, o)
            }
        }
        set(e, t, r) {
            return this.state = e, this.sub(t, this.components["/_app"].Component, r)
        }
        beforePopState(e) {
            this._bps = e
        }
        onlyAHashChange(e) {
            if (!this.asPath) return !1;
            let [t, r] = this.asPath.split("#", 2), [n, a] = e.split("#", 2);
            return !!a && t === n && r === a || t === n && r !== a
        }
        scrollToHash(e) {
            let [, t = ""] = e.split("#", 2);
            (0, M.disableSmoothScrollDuringRouteTransition)(() => {
                if ("" === t || "top" === t) return void window.scrollTo(0, 0);
                let e = decodeURIComponent(t),
                    r = document.getElementById(e);
                if (r) return void r.scrollIntoView();
                let n = document.getElementsByName(e)[0];
                n && n.scrollIntoView()
            }, {
                onlyHashChange: this.onlyAHashChange(e)
            })
        }
        urlIsNew(e) {
            return this.asPath !== e
        }
        async prefetch(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : e,
                r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
            if ("u" > typeof window && (0, x.isBot)(window.navigator.userAgent)) return;
            let a = (0, _.parseRelativeUrl)(e),
                i = a.pathname,
                {
                    pathname: o,
                    query: s
                } = a,
                c = o,
                d = await this.pageLoader.getPageList(),
                p = t,
                f = void 0 !== r.locale ? r.locale || void 0 : this.locale,
                h = await W({
                    asPath: t,
                    locale: f,
                    router: this
                });
            if (t.startsWith("/")) {
                let r;
                ({
                    __rewrites: r
                } = await (0, u.getClientBuildManifest)());
                let i = n((0, I.addBasePath)((0, S.addLocale)(t, this.locale), !0), d, r, a.query, e => G(e, d), this.locales);
                if (i.externalDest) return;
                h || (p = (0, T.removeLocale)((0, R.removeBasePath)(i.asPath), this.locale)), i.matchedPage && i.resolvedHref && (a.pathname = o = i.resolvedHref, h || (e = (0, b.formatWithValidation)(a)))
            }
            a.pathname = G(a.pathname, d), (0, g.isDynamicRoute)(a.pathname) && (o = a.pathname, a.pathname = o, Object.assign(s, (0, v.getRouteMatcher)((0, y.getRouteRegex)(a.pathname))((0, E.parsePath)(t).pathname) || {}), h || (e = (0, b.formatWithValidation)(a)));
            let m = await q({
                fetchData: () => Y({
                    dataHref: this.pageLoader.getDataHref({
                        href: (0, b.formatWithValidation)({
                            pathname: c,
                            query: s
                        }),
                        skipInterpolation: !0,
                        asPath: p,
                        locale: f
                    }),
                    hasMiddleware: !0,
                    isServerRender: !1,
                    parseJSON: !0,
                    inflightCache: this.sdc,
                    persistCache: !this.isPreview,
                    isPrefetch: !0
                }),
                asPath: t,
                locale: f,
                router: this
            });
            if (m?.effect.type === "rewrite" && (a.pathname = m.effect.resolvedHref, o = m.effect.resolvedHref, s = {
                    ...s,
                    ...m.effect.parsedAs.query
                }, p = m.effect.parsedAs.pathname, e = (0, b.formatWithValidation)(a)), m?.effect.type === "redirect-external") return;
            let O = (0, l.removeTrailingSlash)(o);
            await this._bfl(t, p, r.locale, !0) && (this.components[i] = {
                __appRouter: !0
            }), await Promise.all([this.pageLoader._isSsg(O).then(t => !!t && Y({
                dataHref: m?.json ? m?.dataHref : this.pageLoader.getDataHref({
                    href: e,
                    asPath: p,
                    locale: f
                }),
                isServerRender: !1,
                parseJSON: !0,
                inflightCache: this.sdc,
                persistCache: !this.isPreview,
                isPrefetch: !0,
                unstable_skipClientCache: r.unstable_skipClientCache || r.priority && !0
            }).then(() => !1).catch(() => !1)), this.pageLoader[r.priority ? "loadPage" : "prefetch"](O)])
        }
        async fetchComponent(e) {
            let t = V({
                route: e,
                router: this
            });
            try {
                let r = await this.pageLoader.loadPage(e);
                return t(), r
            } catch (e) {
                throw t(), e
            }
        }
        _getData(e) {
            let t = !1,
                r = () => {
                    t = !0
                };
            return this.clc = r, e().then(e => {
                if (r === this.clc && (this.clc = null), t) {
                    let e = Object.defineProperty(Error("Loading initial props cancelled"), "__NEXT_ERROR_CODE", {
                        value: "E405",
                        enumerable: !1,
                        configurable: !0
                    });
                    throw e.cancelled = !0, e
                }
                return e
            })
        }
        getInitialProps(e, t) {
            let {
                Component: r
            } = this.components["/_app"], n = this._wrapApp(r);
            return t.AppTree = n, (0, m.loadGetInitialProps)(r, {
                AppTree: n,
                Component: e,
                router: this,
                ctx: t
            })
        }
        get route() {
            return this.state.route
        }
        get pathname() {
            return this.state.pathname
        }
        get query() {
            return this.state.query
        }
        get asPath() {
            return this.state.asPath
        }
        get locale() {
            return this.state.locale
        }
        get isFallback() {
            return this.state.isFallback
        }
        get isPreview() {
            return this.state.isPreview
        }
        constructor(e, t, r, {
            initialProps: n,
            pageLoader: a,
            App: i,
            wrapApp: o,
            Component: s,
            err: u,
            subscription: c,
            isFallback: d,
            locale: p,
            locales: f,
            defaultLocale: h,
            domainLocales: v,
            isPreview: y
        }) {
            this.sdc = {}, this.sbc = {}, this.isFirstPopStateEvent = !0, this._key = J(), this.onPopState = e => {
                let t, {
                    isFirstPopStateEvent: r
                } = this;
                this.isFirstPopStateEvent = !1;
                let n = e.state;
                if (!n) {
                    let {
                        pathname: e,
                        query: t
                    } = this;
                    this.changeState("replaceState", (0, b.formatWithValidation)({
                        pathname: (0, I.addBasePath)(e),
                        query: t
                    }), (0, m.getURL)());
                    return
                }
                if (n.__NA) return void window.location.reload();
                if (!n.__N || r && this.locale === n.options.locale && n.as === this.asPath) return;
                let {
                    url: a,
                    as: i,
                    options: o,
                    key: s
                } = n;
                this._key = s;
                let {
                    pathname: l
                } = (0, _.parseRelativeUrl)(a);
                this.isSsr && i === (0, I.addBasePath)(this.asPath) && l === (0, I.addBasePath)(this.pathname) || (!this._bps || this._bps(n)) && this.change("replaceState", a, i, Object.assign({}, o, {
                    shallow: o.shallow && this._shallow,
                    locale: o.locale || this.defaultLocale,
                    _h: 0
                }), t)
            };
            const E = (0, l.removeTrailingSlash)(e);
            this.components = {}, "/_error" !== e && (this.components[E] = {
                Component: s,
                initial: !0,
                props: n,
                err: u,
                __N_SSG: n && n.__N_SSG,
                __N_SSP: n && n.__N_SSP
            }), this.components["/_app"] = {
                Component: i,
                styleSheets: []
            }, this.events = Q.events, this.pageLoader = a;
            const S = (0, g.isDynamicRoute)(e) && self.__NEXT_DATA__.autoExport;
            if (this.basePath = "", this.sub = c, this.clc = null, this._wrapApp = o, this.isSsr = !0, this.isLocaleDomain = !1, this.isReady = !!(self.__NEXT_DATA__.gssp || self.__NEXT_DATA__.gip || self.__NEXT_DATA__.isExperimentalCompile || self.__NEXT_DATA__.appGip && !self.__NEXT_DATA__.gsp || !S && !self.location.search && 0), this.state = {
                    route: E,
                    pathname: e,
                    query: t,
                    asPath: S ? e : r,
                    isPreview: !!y,
                    locale: void 0,
                    isFallback: d
                }, this._initialMatchesMiddlewarePromise = Promise.resolve(!1), "u" > typeof window) {
                if (!r.startsWith("//")) {
                    const n = {
                            locale: p
                        },
                        a = (0, m.getURL)();
                    this._initialMatchesMiddlewarePromise = W({
                        router: this,
                        locale: p,
                        asPath: a
                    }).then(i => (n._shouldResolveHref = r !== e, this.changeState("replaceState", i ? a : (0, b.formatWithValidation)({
                        pathname: (0, I.addBasePath)(e),
                        query: t
                    }), a, n), i))
                }
                window.addEventListener("popstate", this.onPopState)
            }
        }
    }
    Q.events = (0, h.default)()
}, 381960, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "default", {
        enumerable: !0,
        get: function() {
            return i
        }
    }), e.r(481258);
    let n = e.r(809804);
    e.r(371847);
    let a = e.r(795728);

    function i(e) {
        function t(t) {
            return (0, n.jsx)(e, {
                router: (0, a.useRouter)(),
                ...t
            })
        }
        return t.getInitialProps = e.getInitialProps, t.origGetInitialProps = e.origGetInitialProps, t
    }("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 795728, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        Router: function() {
            return s.default
        },
        createRouter: function() {
            return _
        },
        default: function() {
            return m
        },
        makePublicRouterInstance: function() {
            return v
        },
        useRouter: function() {
            return g
        },
        withRouter: function() {
            return c.default
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });
    let i = e.r(481258),
        o = i._(e.r(371847)),
        s = i._(e.r(116239)),
        l = e.r(409720),
        u = i._(e.r(939190)),
        c = i._(e.r(381960)),
        d = {
            router: null,
            readyCallbacks: [],
            ready(e) {
                if (this.router) return e();
                "u" > typeof window && this.readyCallbacks.push(e)
            }
        },
        p = ["pathname", "route", "query", "asPath", "components", "isFallback", "basePath", "locale", "locales", "defaultLocale", "isReady", "isPreview", "isLocaleDomain", "domainLocales"],
        f = ["push", "replace", "reload", "back", "prefetch", "beforePopState"];

    function h() {
        if (!d.router) throw Object.defineProperty(Error('No router instance found.\nYou should only use "next/router" on the client side of your app.\n'), "__NEXT_ERROR_CODE", {
            value: "E1044",
            enumerable: !1,
            configurable: !0
        });
        return d.router
    }
    Object.defineProperty(d, "events", {
        get: () => s.default.events
    }), p.forEach(e => {
        Object.defineProperty(d, e, {
            get: () => h()[e]
        })
    }), f.forEach(e => {
        d[e] = function() {
            for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
            return h()[e](...r)
        }
    }), ["routeChangeStart", "beforeHistoryChange", "routeChangeComplete", "routeChangeError", "hashChangeStart", "hashChangeComplete"].forEach(e => {
        d.ready(() => {
            s.default.events.on(e, function() {
                for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                let a = `on${e.charAt(0).toUpperCase()}${e.substring(1)}`;
                if (d[a]) try {
                    d[a](...r)
                } catch (e) {
                    console.error(`Error when running the Router event: ${a}`), console.error((0, u.default)(e) ? `${e.message}
${e.stack}` : e + "")
                }
            })
        })
    });
    let m = d;

    function g() {
        let e = o.default.useContext(l.RouterContext);
        if (!e) throw Object.defineProperty(Error("NextRouter was not mounted. https://nextjs.org/docs/messages/next-router-not-mounted"), "__NEXT_ERROR_CODE", {
            value: "E509",
            enumerable: !1,
            configurable: !0
        });
        return e
    }

    function _() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return d.router = new s.default(...t), d.readyCallbacks.forEach(e => e()), d.readyCallbacks = [], d.router
    }

    function v(e) {
        let t = {};
        for (let r of p) {
            if ("object" == typeof e[r]) {
                t[r] = Object.assign(Array.isArray(e[r]) ? [] : {}, e[r]);
                continue
            }
            t[r] = e[r]
        }
        return t.events = s.default.events, f.forEach(r => {
            t[r] = function() {
                for (var t = arguments.length, n = Array(t), a = 0; a < t; a++) n[a] = arguments[a];
                return e[r](...n)
            }
        }), t
    }("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 681546, (e, t, r) => {
    t.exports = e.r(795728)
}, 791803, 218953, 314357, 911922, 218700, 910671, 998836, 68563, 267569, 411187, 217251, 489767, e => {
    "use strict";
    let t, r, n, a, i, o, s;
    var l = e.i(285586),
        u = e.i(184108),
        c = e.i(481606),
        d = e.i(736828),
        p = e.i(549331),
        f = e.i(930064),
        h = e.i(140332),
        m = e.i(106661),
        g = e.i(687050),
        _ = e.i(357640),
        v = e.i(568207),
        y = e.i(70550),
        b = e.i(19296),
        E = e.i(502247),
        S = e.i(622732),
        T = e.i(163671),
        R = e.i(974231),
        I = e.i(556095),
        O = e.i(695524),
        P = e.i(880985),
        w = e.i(563969),
        N = e.i(865607);

    function A(e) {
        return [(0, u.inboundFiltersIntegration)(), (0, c.functionToStringIntegration)(), (0, d.conversationIdIntegration)(), (0, v.browserApiErrorsIntegration)(), (0, _.breadcrumbsIntegration)(), (0, E.globalHandlersIntegration)(), (0, T.linkedErrorsIntegration)(), (0, p.dedupeIntegration)(), (0, S.httpContextIntegration)(), (0, b.cultureContextIntegration)(), (0, y.browserSessionIntegration)()]
    }

    function C() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
            t = !e.skipBrowserExtensionCheck && !! function() {
                if (void 0 === N.WINDOW.window) return !1;
                let e = N.WINDOW;
                if (e.nw) return !1;
                let t = e.chrome || e.browser;
                if (!t?.runtime?.id) return !1;
                let r = (0, P.getLocationHref)();
                return !(N.WINDOW === N.WINDOW.top && /^(?:chrome-extension|moz-extension|ms-browser-extension|safari-web-extension):\/\//.test(r))
            }() && (w.DEBUG_BUILD && (0, O.consoleSandbox)(() => {
                console.error("[Sentry] You cannot use Sentry.init() in a browser extension, see: https://docs.sentry.io/platforms/javascript/best-practices/browser-extensions/")
            }), !0),
            r = null == e.defaultIntegrations ? A() : e.defaultIntegrations,
            n = {
                ...e,
                enabled: !t && e.enabled,
                stackParser: (0, h.stackParserFromStackParserOptions)(e.stackParser || R.defaultStackParser),
                integrations: (0, f.getIntegrationsToSetup)({
                    integrations: e.integrations,
                    defaultIntegrations: r
                }),
                transport: e.transport || I.makeFetchTransport
            };
        return (0, m.initAndBind)(g.BrowserClient, n)
    }
    e.s(["forceLoad", 0, function() {}, "getDefaultIntegrations", 0, A, "init", 0, C, "onLoad", 0, function(e) {
        e()
    }], 218953);
    var D = e.i(960186),
        x = e.i(371847);
    e.s(["init", 0, function(e) {
        let t = {
            ...e
        };
        return (0, D.applySdkMetadata)(t, "react"), (0, l.setContext)("react", {
            version: x.version
        }), C(t)
    }], 791803);
    var L = e.i(420546),
        U = e.i(131810),
        M = e.i(454181),
        B = e.i(220325),
        k = e.i(658675),
        j = e.i(867058),
        $ = e.i(950271),
        W = e.i(557156),
        F = e.i(901781),
        H = e.i(486110),
        G = e.i(950921),
        q = e.i(174932),
        z = e.i(459557);
    let X = {
        idleTimeout: 1e3,
        finalTimeout: 3e4,
        childSpanTimeout: 15e3
    };

    function Y(e) {
        var t;
        let r, n, a = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
            i = new Map,
            o = !1,
            s = "externalFinish",
            l = !a.disableAutoFinish,
            u = [],
            {
                idleTimeout: c = X.idleTimeout,
                finalTimeout: d = X.finalTimeout,
                childSpanTimeout: p = X.childSpanTimeout,
                beforeSpanEnd: f,
                trimIdleSpanEndTimestamp: h = !0
            } = a,
            m = (0, L.getClient)();
        if (!m || !(0, B.hasSpansEnabled)()) {
            let e = new H.SentryNonRecordingSpan,
                t = {
                    sample_rate: "0",
                    sampled: "false",
                    ...(0, F.getDynamicSamplingContextFromSpan)(e)
                };
            return (0, F.freezeDscOnSpan)(e, t), e
        }
        let g = (0, L.getCurrentScope)(),
            _ = (0, $.getActiveSpan)(),
            v = (t = e, r = (0, z.startInactiveSpan)(t), (0, j._setSpanForScope)((0, L.getCurrentScope)(), r), U.DEBUG_BUILD && O.debug.log("[Tracing] Started span is an idle span"), r);

        function y() {
            n && (clearTimeout(n), n = void 0)
        }

        function b(e) {
            y(), n = setTimeout(() => {
                !o && 0 === i.size && l && (s = "idleTimeout", v.end(e))
            }, c)
        }

        function E(e) {
            n = setTimeout(() => {
                !o && l && (s = "heartbeatFailed", v.end(e))
            }, p)
        }

        function S(e) {
            o = !0, i.clear(), u.forEach(e => e()), (0, j._setSpanForScope)(g, _);
            let t = (0, $.spanToJSON)(v),
                {
                    start_timestamp: r
                } = t;
            if (!r) return;
            t.data[M.SEMANTIC_ATTRIBUTE_SENTRY_IDLE_SPAN_FINISH_REASON] || v.setAttribute(M.SEMANTIC_ATTRIBUTE_SENTRY_IDLE_SPAN_FINISH_REASON, s);
            let n = t.status;
            n && "unknown" !== n || v.setStatus({
                code: q.SPAN_STATUS_OK
            }), O.debug.log(`[Tracing] Idle span "${t.op}" finished`);
            let a = (0, $.getSpanDescendants)(v).filter(e => e !== v),
                l = 0;
            a.forEach(t => {
                t.isRecording() && (t.setStatus({
                    code: q.SPAN_STATUS_ERROR,
                    message: "cancelled"
                }), t.end(e), U.DEBUG_BUILD && O.debug.log("[Tracing] Cancelling span since span ended early", JSON.stringify(t, void 0, 2)));
                let {
                    timestamp: r = 0,
                    start_timestamp: n = 0
                } = (0, $.spanToJSON)(t), a = n <= e, i = r - n <= (d + c) / 1e3;
                if (U.DEBUG_BUILD) {
                    let e = JSON.stringify(t, void 0, 2);
                    a ? i || O.debug.log("[Tracing] Discarding span since it finished after idle span final timeout", e) : O.debug.log("[Tracing] Discarding span since it happened after idle span was finished", e)
                }(!i || !a) && ((0, $.removeChildSpanFromSpan)(v, t), l++)
            }), l > 0 && v.setAttribute("sentry.idle_span_discarded_spans", l)
        }
        return v.end = new Proxy(v.end, {
            apply(e, t, r) {
                if (f && f(v), t instanceof H.SentryNonRecordingSpan) return;
                let [n, ...a] = r, i = n || (0, W.timestampInSeconds)(), o = (0, $.spanTimeInputToSeconds)(i), s = (0, $.getSpanDescendants)(v).filter(e => e !== v), l = (0, $.spanToJSON)(v);
                if (!s.length || !h) return S(o), Reflect.apply(e, t, [o, ...a]);
                let u = m.getOptions().ignoreSpans,
                    c = s?.reduce((e, t) => {
                        let r = (0, $.spanToJSON)(t);
                        return !r.timestamp || u && (0, k.shouldIgnoreSpan)(r, u) ? e : e ? Math.max(e, r.timestamp) : r.timestamp
                    }, void 0),
                    p = l.start_timestamp,
                    g = Math.min(p ? p + d / 1e3 : 1 / 0, Math.max(p || -1 / 0, Math.min(o, c || 1 / 0)));
                return S(g), Reflect.apply(e, t, [g, ...a])
            }
        }), u.push(m.on("spanStart", e => {
            var t;
            !(o || e === v || (0, $.spanToJSON)(e).timestamp || e instanceof G.SentrySpan && e.isStandaloneSpan()) && (0, $.getSpanDescendants)(v).includes(e) && (t = e.spanContext().spanId, y(), i.set(t, !0), E((0, W.timestampInSeconds)() + p / 1e3))
        })), u.push(m.on("spanEnd", e => {
            if (!o) {
                var t;
                t = e.spanContext().spanId, i.has(t) && i.delete(t), 0 === i.size && b((0, W.timestampInSeconds)() + c / 1e3)
            }
        })), u.push(m.on("idleSpanEnableAutoFinish", e => {
            e === v && (l = !0, b(), i.size && E())
        })), a.disableAutoFinish || b(), setTimeout(() => {
            o || (v.setStatus({
                code: q.SPAN_STATUS_ERROR,
                message: "deadline_exceeded"
            }), s = "finalTimeout", v.end())
        }, d), v
    }
    var J = e.i(854787),
        K = e.i(733916),
        V = e.i(865915);
    let Q = !1;

    function Z() {
        Q || (e.tag = "sentry_tracingErrorCallback", Q = !0, (0, K.addGlobalErrorInstrumentationHandler)(e), (0, V.addGlobalUnhandledRejectionInstrumentationHandler)(e));

        function e() {
            let e = (0, $.getActiveSpan)(),
                t = e && (0, $.getRootSpan)(e);
            if (t) {
                let e = "internal_error";
                U.DEBUG_BUILD && O.debug.log(`[Tracing] Root span: ${e} -> Global error occurred`), t.setStatus({
                    code: q.SPAN_STATUS_ERROR,
                    message: e
                })
            }
        }
    }
    e.s(["registerSpanErrorInstrumentation", 0, Z], 314357);
    var ee = e.i(672806),
        et = e.i(204078),
        er = e.i(135119),
        en = e.i(47731),
        ea = e.i(211429),
        ei = e.i(357486),
        eo = e.i(912035),
        es = e.i(775364);

    function el() {
        let e;
        return "u" > typeof window && (!(!(0, es.isBrowserBundle)() && "[object process]" === Object.prototype.toString.call(void 0 !== eo.default ? eo.default : 0)) || (e = et.GLOBAL_OBJ.process, e?.type === "renderer"))
    }
    e.s(["isBrowser", 0, el], 911922);
    var eu = e.i(845068),
        ec = e.i(741655);
    let ed = (e, t, r, n) => {
            let a, i;
            return o => {
                if (t.value >= 0 && (o || n) && ((i = t.value - (a ?? 0)) || void 0 === a)) {
                    var s;
                    a = t.value, t.delta = i, s = t.value, t.rating = s > r[1] ? "poor" : s > r[0] ? "needs-improvement" : "good", e(t)
                }
            }
        },
        ep = function() {
            let e = !(arguments.length > 0) || void 0 === arguments[0] || arguments[0],
                t = eu.WINDOW.performance?.getEntriesByType?.("navigation")[0];
            if (!e || t && t.responseStart > 0 && t.responseStart < performance.now()) return t
        },
        ef = () => {
            let e = ep();
            return e?.activationStart ?? 0
        };

    function eh(e, t, r) {
        eu.WINDOW.document && eu.WINDOW.addEventListener(e, t, r)
    }

    function em(e, t, r) {
        eu.WINDOW.document && eu.WINDOW.removeEventListener(e, t, r)
    }
    let eg = -1,
        e_ = new Set,
        ev = e => {
            if (("pagehide" === e.type || eu.WINDOW.document?.visibilityState === "hidden") && eg > -1) {
                if ("visibilitychange" === e.type || "pagehide" === e.type)
                    for (let e of e_) e();
                isFinite(eg) || (eg = "visibilitychange" === e.type ? e.timeStamp : 0, em("prerenderingchange", ev, !0))
            }
        },
        ey = () => {
            if (eu.WINDOW.document && eg < 0) {
                let e = ef();
                eg = (eu.WINDOW.document.prerendering ? void 0 : globalThis.performance.getEntriesByType("visibility-state").filter(t => "hidden" === t.name && t.startTime > e)[0]?.startTime) ?? (eu.WINDOW.document?.visibilityState !== "hidden" || eu.WINDOW.document?.prerendering ? 1 / 0 : 0), eh("visibilitychange", ev, !0), eh("pagehide", ev, !0), eh("prerenderingchange", ev, !0)
            }
            return {
                get firstHiddenTime() {
                    return eg
                },
                onHidden(e) {
                    e_.add(e)
                }
            }
        },
        eb = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : -1,
                r = ep(),
                n = "navigate";
            return r && (eu.WINDOW.document?.prerendering || ef() > 0 ? n = "prerender" : eu.WINDOW.document?.wasDiscarded ? n = "restore" : r.type && (n = r.type.replace(/_/g, "-"))), {
                name: e,
                value: t,
                rating: "good",
                delta: 0,
                entries: [],
                id: `v5-${Date.now()}-${Math.floor(Math.random()*(9e12-1))+1e12}`,
                navigationType: n
            }
        },
        eE = new WeakMap;

    function eS(e, t) {
        try {
            return eE.get(e) || eE.set(e, new t), eE.get(e)
        } catch (e) {
            return new t
        }
    }
    class eT {
        __init() {
            this._sessionValue = 0
        }
        __init2() {
            this._sessionEntries = []
        }
        _processEntry(e) {
            if (e.hadRecentInput) return;
            let t = this._sessionEntries[0],
                r = this._sessionEntries[this._sessionEntries.length - 1];
            this._sessionValue && t && r && e.startTime - r.startTime < 1e3 && e.startTime - t.startTime < 5e3 ? (this._sessionValue += e.value, this._sessionEntries.push(e)) : (this._sessionValue = e.value, this._sessionEntries = [e]), this._onAfterProcessingUnexpectedShift?.(e)
        }
        constructor() {
            eT.prototype.__init.call(this), eT.prototype.__init2.call(this)
        }
    }
    let eR = function(e, t) {
            let r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
            try {
                if (PerformanceObserver.supportedEntryTypes.includes(e)) {
                    let n = new PerformanceObserver(e => {
                        Promise.resolve().then(() => {
                            t(e.getEntries())
                        })
                    });
                    return n.observe({
                        type: e,
                        buffered: !0,
                        ...r
                    }), n
                }
            } catch {}
        },
        eI = e => {
            let t = !1;
            return () => {
                t || (e(), t = !0)
            }
        },
        eO = e => {
            eu.WINDOW.document?.prerendering ? addEventListener("prerenderingchange", () => e(), !0) : e()
        },
        eP = [1800, 3e3],
        ew = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            eO(() => {
                let r, n = ey(),
                    a = eb("FCP"),
                    i = eR("paint", e => {
                        for (let t of e) "first-contentful-paint" === t.name && (i.disconnect(), t.startTime < n.firstHiddenTime && (a.value = Math.max(t.startTime - ef(), 0), a.entries.push(t), r(!0)))
                    });
                i && (r = ed(e, a, eP, t.reportAllChanges))
            })
        },
        eN = [.1, .25],
        eA = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            ew(eI(() => {
                let r, n = eb("CLS", 0),
                    a = ey(),
                    i = eS(t, eT),
                    o = e => {
                        for (let t of e) i._processEntry(t);
                        i._sessionValue > n.value && (n.value = i._sessionValue, n.entries = i._sessionEntries, r())
                    },
                    s = eR("layout-shift", o);
                s && (r = ed(e, n, eN, t.reportAllChanges), a.onHidden(() => {
                    o(s.takeRecords()), r(!0)
                }), eu.WINDOW?.setTimeout?.(r))
            }))
        },
        eC = 0,
        eD = 1 / 0,
        ex = 0,
        eL = e => {
            e.forEach(e => {
                e.interactionId && (eD = Math.min(eD, e.interactionId), eC = (ex = Math.max(ex, e.interactionId)) ? (ex - eD) / 7 + 1 : 0)
            })
        },
        eU = () => t ? eC : performance.interactionCount || 0,
        eM = 0;
    class eB {
        __init() {
            this._longestInteractionList = []
        }
        __init2() {
            this._longestInteractionMap = new Map
        }
        _resetInteractions() {
            eM = eU(), this._longestInteractionList.length = 0, this._longestInteractionMap.clear()
        }
        _estimateP98LongestInteraction() {
            let e = Math.min(this._longestInteractionList.length - 1, Math.floor((eU() - eM) / 50));
            return this._longestInteractionList[e]
        }
        _processEntry(e) {
            if (this._onBeforeProcessingEntry?.(e), !(e.interactionId || "first-input" === e.entryType)) return;
            let t = this._longestInteractionList.at(-1),
                r = this._longestInteractionMap.get(e.interactionId);
            if (r || this._longestInteractionList.length < 10 || e.duration > t._latency) {
                if (r ? e.duration > r._latency ? (r.entries = [e], r._latency = e.duration) : e.duration === r._latency && e.startTime === r.entries[0].startTime && r.entries.push(e) : (r = {
                        id: e.interactionId,
                        entries: [e],
                        _latency: e.duration
                    }, this._longestInteractionMap.set(r.id, r), this._longestInteractionList.push(r)), this._longestInteractionList.sort((e, t) => t._latency - e._latency), this._longestInteractionList.length > 10)
                    for (let e of this._longestInteractionList.splice(10)) this._longestInteractionMap.delete(e.id);
                this._onAfterProcessingINPCandidate?.(r)
            }
        }
        constructor() {
            eB.prototype.__init.call(this), eB.prototype.__init2.call(this)
        }
    }
    let ek = e => {
            let t = eu.WINDOW.requestIdleCallback || eu.WINDOW.setTimeout;
            eu.WINDOW.document?.visibilityState === "hidden" ? e() : (eh("visibilitychange", e = eI(e), {
                once: !0,
                capture: !0
            }), eh("pagehide", e, {
                once: !0,
                capture: !0
            }), t(() => {
                e(), em("visibilitychange", e, {
                    capture: !0
                }), em("pagehide", e, {
                    capture: !0
                })
            }))
        },
        ej = [200, 500],
        e$ = function(e) {
            let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            if (!(globalThis.PerformanceEventTiming && "interactionId" in PerformanceEventTiming.prototype)) return;
            let n = ey();
            eO(() => {
                let a;
                "interactionCount" in performance || t || (t = eR("event", eL, {
                    type: "event",
                    buffered: !0,
                    durationThreshold: 0
                }));
                let i = eb("INP"),
                    o = eS(r, eB),
                    s = e => {
                        ek(() => {
                            for (let t of e) o._processEntry(t);
                            let t = o._estimateP98LongestInteraction();
                            t && t._latency !== i.value && (i.value = t._latency, i.entries = t.entries, a())
                        })
                    },
                    l = eR("event", s, {
                        durationThreshold: r.durationThreshold ?? 40
                    });
                a = ed(e, i, ej, r.reportAllChanges), l && (l.observe({
                    type: "first-input",
                    buffered: !0
                }), n.onHidden(() => {
                    s(l.takeRecords()), a(!0)
                }))
            })
        };
    class eW {
        _processEntry(e) {
            this._onBeforeProcessingEntry?.(e)
        }
    }
    let eF = [2500, 4e3],
        eH = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            eO(() => {
                let r, n = ey(),
                    a = eb("LCP"),
                    i = eS(t, eW),
                    o = e => {
                        for (let o of (t.reportAllChanges || (e = e.slice(-1)), e)) i._processEntry(o), o.startTime < n.firstHiddenTime && (a.value = Math.max(o.startTime - ef(), 0), a.entries = [o], r())
                    },
                    s = eR("largest-contentful-paint", o);
                if (s) {
                    r = ed(e, a, eF, t.reportAllChanges);
                    let n = eI(() => {
                            o(s.takeRecords()), s.disconnect(), r(!0)
                        }),
                        i = e => {
                            e.isTrusted && (ek(n), em(e.type, i, {
                                capture: !0
                            }))
                        };
                    for (let e of ["keydown", "click", "visibilitychange"]) eh(e, i, {
                        capture: !0
                    })
                }
            })
        },
        eG = [800, 1800],
        eq = e => {
            eu.WINDOW.document?.prerendering ? eO(() => eq(e)) : eu.WINDOW.document?.readyState !== "complete" ? addEventListener("load", () => eq(e), !0) : setTimeout(e)
        },
        ez = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                r = eb("TTFB"),
                n = ed(e, r, eG, t.reportAllChanges);
            eq(() => {
                let e = ep();
                e && (r.value = Math.max(e.responseStart - ef(), 0), r.entries = [e], n(!0))
            })
        },
        eX = {},
        eY = {};

    function eJ(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
        return e9("cls", e, e1, r, t)
    }

    function eK(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
        return e9("lcp", e, e2, n, t)
    }

    function eV(e) {
        return e9("ttfb", e, e5, a)
    }

    function eQ(e) {
        return e9("inp", e, e4, i)
    }

    function eZ(e, t) {
        var r;
        let n;
        return e3(e, t), eY[e] || (n = {}, "event" === (r = e) && (n.durationThreshold = 0), eR(r, e => {
            e0(r, {
                entries: e
            })
        }, n), eY[e] = !0), e8(e, t)
    }

    function e0(e, t) {
        let r = eX[e];
        if (r?.length)
            for (let n of r) try {
                n(t)
            } catch (t) {
                ec.DEBUG_BUILD && O.debug.error(`Error while triggering instrumentation handler.
Type: ${e}
Name: ${(0,h.getFunctionName)(n)}
Error:`, t)
            }
    }

    function e1() {
        return eA(e => {
            e0("cls", {
                metric: e
            }), r = e
        }, {
            reportAllChanges: !0
        })
    }

    function e2() {
        return eH(e => {
            e0("lcp", {
                metric: e
            }), n = e
        }, {
            reportAllChanges: !0
        })
    }

    function e5() {
        return ez(e => {
            e0("ttfb", {
                metric: e
            }), a = e
        })
    }

    function e4() {
        return e$(e => {
            e0("inp", {
                metric: e
            }), i = e
        })
    }

    function e9(e, t, r, n) {
        let a, i = arguments.length > 4 && void 0 !== arguments[4] && arguments[4];
        return e3(e, t), eY[e] || (a = r(), eY[e] = !0), n && t({
            metric: n
        }), e8(e, t, i ? a : void 0)
    }

    function e3(e, t) {
        eX[e] = eX[e] || [], eX[e].push(t)
    }

    function e8(e, t, r) {
        return () => {
            r && r();
            let n = eX[e];
            if (!n) return;
            let a = n.indexOf(t); - 1 !== a && n.splice(a, 1)
        }
    }

    function e6(e) {
        return "duration" in e
    }

    function e7(e) {
        return "number" == typeof e && isFinite(e)
    }

    function te(e, t, r, n) {
        let {
            ...a
        } = n, i = (0, $.spanToJSON)(e).start_timestamp;
        return i && i > t && "function" == typeof e.updateStartTime && e.updateStartTime(t), (0, z.withActiveSpan)(e, () => {
            let e = (0, z.startInactiveSpan)({
                startTime: t,
                ...a
            });
            return e && e.end(r), e
        })
    }

    function tt(e) {
        let t, r = (0, L.getClient)();
        if (!r) return;
        let {
            name: n,
            transaction: a,
            attributes: i,
            startTime: o
        } = e, {
            release: s,
            environment: l,
            sendDefaultPii: u
        } = r.getOptions(), c = r.getIntegrationByName("Replay"), d = c?.getReplayId(), p = (0, L.getCurrentScope)(), f = p.getUser(), h = void 0 !== f ? f.email || f.id || f.ip_address : void 0;
        try {
            t = p.getScopeData().contexts.profile.profile_id
        } catch {}
        let m = {
            release: s,
            environment: l,
            user: h || void 0,
            profile_id: t || void 0,
            replay_id: d || void 0,
            transaction: a,
            "user_agent.original": eu.WINDOW.navigator?.userAgent,
            "client.address": u ? "{{auto}}" : void 0,
            ...i
        };
        return (0, z.startInactiveSpan)({
            name: n,
            attributes: m,
            startTime: o,
            experimental: {
                standalone: !0
            }
        })
    }

    function tr() {
        return eu.WINDOW.addEventListener && eu.WINDOW.performance
    }

    function tn(e) {
        return e / 1e3
    }

    function ta(e) {
        let t = "unknown",
            r = "unknown",
            n = "";
        for (let a of e) {
            if ("/" === a) {
                [t, r] = e.split("/");
                break
            }
            if (!isNaN(Number(a))) {
                t = "h" === n ? "http" : n, r = e.split(n)[1];
                break
            }
            n += a
        }
        return n === e && (t = n), {
            name: t,
            version: r
        }
    }

    function ti(e) {
        try {
            return PerformanceObserver.supportedEntryTypes.includes(e)
        } catch {
            return !1
        }
    }

    function to(e, t) {
        let r, n, a = !1;

        function i(e) {
            !a && n && t(e, n.spanContext().spanId, n), a = !0
        }
        eh("visibilitychange", r = e => {
            ("pagehide" === e.type || eu.WINDOW.document?.visibilityState === "hidden") && (() => {
                i("pagehide")
            })(e)
        }, {
            capture: !0,
            once: !0
        }), eh("pagehide", r, {
            capture: !0,
            once: !0
        });
        let o = e.on("beforeStartNavigationSpan", (e, t) => {
                t?.isRedirect || (i("navigation"), o(), s())
            }),
            s = e.on("afterStartPageLoadSpan", e => {
                n = e, s()
            })
    }
    e.s(["addClsInstrumentationHandler", 0, eJ, "addInpInstrumentationHandler", 0, eQ, "addLcpInstrumentationHandler", 0, eK, "addPerformanceInstrumentationHandler", 0, eZ, "addTtfbInstrumentationHandler", 0, eV, "isPerformanceEventTiming", 0, e6], 218700), e.s(["extractNetworkProtocol", 0, ta, "getBrowserPerformanceAPI", 0, tr, "isMeasurementValue", 0, e7, "listenForWebVitalReportEvents", 0, to, "msToSec", 0, tn, "startAndEndSpan", 0, te, "startStandaloneWebVitalSpan", 0, tt, "supportsWebVital", 0, ti], 910671);
    let ts = [],
        tl = new Map,
        tu = new Map,
        tc = {
            click: "click",
            pointerdown: "click",
            pointerup: "click",
            mousedown: "click",
            mouseup: "click",
            touchstart: "click",
            touchend: "click",
            mouseover: "hover",
            mouseout: "hover",
            mouseenter: "hover",
            mouseleave: "hover",
            pointerover: "hover",
            pointerout: "hover",
            pointerenter: "hover",
            pointerleave: "hover",
            dragstart: "drag",
            dragend: "drag",
            drag: "drag",
            dragenter: "drag",
            dragleave: "drag",
            dragover: "drag",
            drop: "drag",
            keydown: "press",
            keyup: "press",
            keypress: "press",
            input: "press"
        },
        td = e => {
            let {
                metric: t
            } = e;
            if (void 0 == t.value) return;
            let r = tn(t.value);
            if (r > 60) return;
            let n = t.entries.find(e => e.duration === t.value && tc[e.name]);
            if (!n) return;
            let {
                interactionId: a
            } = n, i = tc[n.name], o = tn((0, W.browserPerformanceTimeOrigin)() + n.startTime), s = (0, $.getActiveSpan)(), l = s ? (0, $.getRootSpan)(s) : void 0, u = null != a ? tl.get(a) : void 0, c = u?.span || l, d = c ? (0, $.spanToJSON)(c).description : (0, L.getCurrentScope)().getScopeData().transactionName, p = tt({
                name: u?.elementName || (0, P.htmlTreeAsString)(n.target),
                transaction: d,
                attributes: {
                    [M.SEMANTIC_ATTRIBUTE_SENTRY_ORIGIN]: "auto.http.browser.inp",
                    [M.SEMANTIC_ATTRIBUTE_SENTRY_OP]: `ui.interaction.${i}`,
                    [M.SEMANTIC_ATTRIBUTE_EXCLUSIVE_TIME]: n.duration
                },
                startTime: o
            });
            p && (p.addEvent("inp", {
                [M.SEMANTIC_ATTRIBUTE_SENTRY_MEASUREMENT_UNIT]: "millisecond",
                [M.SEMANTIC_ATTRIBUTE_SENTRY_MEASUREMENT_VALUE]: t.value
            }), p.end(o + r))
        };
    var tp = e.i(139436),
        tf = e.i(403770),
        th = e.i(59172);

    function tm(e) {
        return null != e && e > 0 && e <= 6e4
    }

    function tg(e) {
        return e ? (((0, W.browserPerformanceTimeOrigin)() || performance.timeOrigin) + e) / 1e3 : e
    }

    function t_(e) {
        let t = {};
        if (void 0 != e.nextHopProtocol) {
            let {
                name: r,
                version: n
            } = ta(e.nextHopProtocol);
            t["network.protocol.version"] = n, t["network.protocol.name"] = r
        }
        return (0, W.browserPerformanceTimeOrigin)() || tr()?.timeOrigin ? Object.fromEntries(Object.entries({
            ...t,
            "http.request.redirect_start": tg(e.redirectStart),
            "http.request.redirect_end": tg(e.redirectEnd),
            "http.request.worker_start": tg(e.workerStart),
            "http.request.fetch_start": tg(e.fetchStart),
            "http.request.domain_lookup_start": tg(e.domainLookupStart),
            "http.request.domain_lookup_end": tg(e.domainLookupEnd),
            "http.request.connect_start": tg(e.connectStart),
            "http.request.secure_connection_start": tg(e.secureConnectionStart),
            "http.request.connection_end": tg(e.connectEnd),
            "http.request.request_start": tg(e.requestStart),
            "http.request.response_start": tg(e.responseStart),
            "http.request.response_end": tg(e.responseEnd),
            "http.request.time_to_first_byte": null != e.responseStart ? e.responseStart / 1e3 : void 0
        }).filter(e => {
            let [, t] = e;
            return null != t
        })) : t
    }
    let tv = 0,
        ty = {};

    function tb(e, t, r, n) {
        var a;
        let i = arguments.length > 4 && void 0 !== arguments[4] ? arguments[4] : r,
            o = t["secureConnection" === (a = r) ? "connectEnd" : "fetch" === a ? "domainLookupStart" : `${a}End`],
            s = t[`${r}Start`];
        s && o && te(e, n + tn(s), n + tn(o), {
            op: `browser.${i}`,
            name: t.name,
            attributes: {
                [M.SEMANTIC_ATTRIBUTE_SENTRY_ORIGIN]: "auto.ui.browser.metrics",
                ..."redirect" === r && null != t.redirectCount ? {
                    "http.redirect_count": t.redirectCount
                } : {}
            }
        })
    }

    function tE(e) {
        let {
            name: t,
            op: r,
            origin: n,
            metricName: a,
            value: i,
            attributes: o,
            parentSpan: s,
            reportEvent: l,
            startTime: u,
            endTime: c
        } = e, d = (0, L.getCurrentScope)().getScopeData().transactionName, p = {
            [M.SEMANTIC_ATTRIBUTE_SENTRY_ORIGIN]: n,
            [M.SEMANTIC_ATTRIBUTE_SENTRY_OP]: r,
            [M.SEMANTIC_ATTRIBUTE_EXCLUSIVE_TIME]: 0,
            [`browser.web_vital.${a}.value`]: i,
            "sentry.transaction": d,
            "user_agent.original": eu.WINDOW.navigator?.userAgent,
            ...o
        };
        s && (0, $.spanToStreamedSpanJSON)(s).attributes?.[M.SEMANTIC_ATTRIBUTE_SENTRY_OP] === "pageload" && (p["sentry.pageload.span_id"] = s.spanContext().spanId), l && (p[`browser.web_vital.${a}.report_event`] = l);
        let f = (0, z.startInactiveSpan)({
            name: t,
            attributes: p,
            startTime: u,
            parentSpan: s
        });
        f && f.end(c ?? u)
    }
    let tS = "sentry_previous_trace";

    function tT(e) {
        return 1 === e.traceFlags
    }
    var tR = e.i(635089),
        tI = e.i(499678),
        tO = e.i(981964),
        tP = e.i(10955);

    function tw() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
            t = e.client || (0, L.getClient)();
        if (!(0, l.isEnabled)() || !t) return {};
        let r = (0, tP.getMainCarrier)(),
            n = (0, tO.getAsyncContextStrategy)(r);
        if (n.getTraceData) return n.getTraceData(e);
        let a = e.scope || (0, L.getCurrentScope)(),
            i = e.span || (0, $.getActiveSpan)();
        if (!i && (0, L.hasExternalPropagationContext)()) return {};
        let o = i ? (0, $.spanToTraceHeader)(i) : function(e) {
                let {
                    traceId: t,
                    sampled: r,
                    propagationSpanId: n
                } = e.getPropagationContext();
                return (0, en.generateSentryTraceHeader)(t, n, r)
            }(a),
            s = i ? (0, F.getDynamicSamplingContextFromSpan)(i) : (0, F.getDynamicSamplingContextFromScope)(t, a),
            u = (0, tI.dynamicSamplingContextToSentryBaggageHeader)(s);
        if (!en.TRACEPARENT_REGEXP.test(o)) return O.debug.warn("Invalid sentry-trace data. Cannot generate trace data"), {};
        let c = {
            "sentry-trace": o,
            baggage: u
        };
        return e.propagateTraceparent && (c.traceparent = i ? (0, $.spanToTraceparentHeader)(i) : function(e) {
            let {
                traceId: t,
                sampled: r,
                propagationSpanId: n
            } = e.getPropagationContext();
            return (0, en.generateTraceparentHeader)(t, n, r)
        }(a)), c
    }

    function tN(e) {
        return "string" == typeof e && e.split(",").some(e => e.trim().startsWith(tI.SENTRY_BAGGAGE_KEY_PREFIX))
    }

    function tA(e, t, r, n) {
        let a = {
            url: (0, J.stripDataUrlContent)(e),
            type: "fetch",
            "http.method": r,
            [M.SEMANTIC_ATTRIBUTE_SENTRY_ORIGIN]: n,
            [M.SEMANTIC_ATTRIBUTE_SENTRY_OP]: "http.client"
        };
        return t && ((0, J.isURLObjectRelative)(t) || (a["http.url"] = (0, J.stripDataUrlContent)(t.href), a["server.address"] = t.host), t.search && (a["http.query"] = t.search), t.hash && (a["http.fragment"] = t.hash)), a
    }
    e.s(["getTraceData", 0, tw], 998836);
    var tC = e.i(956928);
    let tD = Symbol.for("sentry__originalRequestBody");

    function tx(e) {
        return new URLSearchParams(e).toString()
    }

    function tL(e) {
        let t;
        try {
            t = e.getAllResponseHeaders()
        } catch (t) {
            return ec.DEBUG_BUILD && O.debug.error(t, "Failed to get xhr response headers", e), {}
        }
        return t ? t.split("\r\n").reduce((e, t) => {
            let [r, n] = t.split(": ");
            return n && (e[r.toLowerCase()] = n), e
        }, {}) : {}
    }

    function tU(e) {
        try {
            return new URL(e, N.WINDOW.location.origin).href
        } catch {
            return
        }
    }

    function tM(e) {
        try {
            return new Headers(e)
        } catch {
            return
        }
    }
    e.s(["getBodyString", 0, function(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : O.debug;
        try {
            if ("string" == typeof e) return [e];
            if (e instanceof URLSearchParams) return [e.toString()];
            if (e instanceof FormData) return [tx(e)];
            if (!e) return [void 0]
        } catch (r) {
            return ec.DEBUG_BUILD && t.error(r, "Failed to serialize body", e), [void 0, "BODY_PARSE_ERROR"]
        }
        return ec.DEBUG_BUILD && t.log("Skipping network body because of body type", e), [void 0, "UNPARSEABLE_BODY_TYPE"]
    }, "getFetchRequestArgBody", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [];
        if (e.length >= 2 && e[1] && "object" == typeof e[1] && "body" in e[1]) return e[1].body;
        if (e.length >= 1 && e[0] instanceof Request) {
            let t = e[0][tD];
            if (void 0 !== t) return t
        }
    }, "parseXhrResponseHeaders", 0, tL, "serializeFormData", 0, tx], 68563);
    let tB = new WeakMap,
        tk = new Map,
        tj = {
            traceFetch: !0,
            traceXHR: !0,
            enableHTTPTimings: !0,
            trackFetchStreamPerformance: !1
        };

    function t$(e, t) {
        let {
            traceFetch: r,
            traceXHR: n,
            trackFetchStreamPerformance: a,
            shouldCreateSpanForRequest: i,
            enableHTTPTimings: o,
            tracePropagationTargets: s,
            onRequestSpanStart: l,
            onRequestSpanEnd: u
        } = {
            ...tj,
            ...t
        }, c = "function" == typeof i ? i : e => !0, d = e => (function(e, t) {
            let r = (0, P.getLocationHref)();
            if (r) {
                let n, a;
                try {
                    n = new URL(e, r), a = new URL(r).origin
                } catch {
                    return !1
                }
                let i = n.origin === a;
                return t ? (0, tf.stringMatchesSomePattern)(n.toString(), t) || i && (0, tf.stringMatchesSomePattern)(n.pathname, t) : i
            } {
                let r = !!e.match(/^\/(?!\/)/);
                return t ? (0, tf.stringMatchesSomePattern)(e, t) : r
            }
        })(e, s), p = {}, f = e.getOptions().propagateTraceparent;
        r && (e.addEventProcessor(e => ("transaction" === e.type && e.spans && e.spans.forEach(e => {
            if ("http.client" === e.op) {
                let t = tk.get(e.span_id);
                t && (e.timestamp = t / 1e3, tk.delete(e.span_id))
            }
        }), e)), a && (0, tR.addFetchEndInstrumentationHandler)(e => {
            if (e.response) {
                let t = tB.get(e.response);
                t && e.endTimestamp && tk.set(t, e.endTimestamp)
            }
        }), (0, tR.addFetchInstrumentationHandler)(t => {
            let r = function(e, t, r, n, a) {
                if (!e.fetchData) return;
                let {
                    method: i,
                    url: o
                } = e.fetchData, s = (0, B.hasSpansEnabled)() && t(o);
                if (e.endTimestamp) {
                    var l, u, c;
                    let t, r = e.fetchData.__span;
                    if (!r) return;
                    let i = n[r];
                    i && (s && (function(e, t) {
                        if (t.response) {
                            (0, q.setHttpStatus)(e, t.response.status);
                            let r = t.response?.headers?.get("content-length");
                            if (r) {
                                let t = parseInt(r);
                                t > 0 && e.setAttribute("http.response_content_length", t)
                            }
                        } else t.error && e.setStatus({
                            code: q.SPAN_STATUS_ERROR,
                            message: "internal_error"
                        });
                        e.end()
                    }(i, e), l = i, u = e, t = "object" == typeof(c = a) && null !== c ? c.onRequestSpanEnd : void 0, t?.(l, {
                        headers: u.response?.headers,
                        error: u.error
                    })), delete n[r]);
                    return
                }
                let {
                    spanOrigin: d = "auto.http.browser",
                    propagateTraceparent: p = !1
                } = "object" == typeof a ? a : {
                    spanOrigin: a
                }, f = (0, L.getClient)(), h = !!(0, $.getActiveSpan)(), m = s && h ? (0, z.startInactiveSpan)(function(e, t, r) {
                    if (e.startsWith("data:")) {
                        let n = (0, J.stripDataUrlContent)(e);
                        return {
                            name: `${t} ${n}`,
                            attributes: tA(e, void 0, t, r)
                        }
                    }
                    let n = (0, J.parseStringToURLObject)(e),
                        a = n ? (0, J.getSanitizedUrlStringFromUrlObject)(n) : e;
                    return {
                        name: `${t} ${a}`,
                        attributes: tA(e, n, t, r)
                    }
                }(o, i, d)) : new H.SentryNonRecordingSpan;
                if (s && !h && f?.recordDroppedEvent("no_parent_span", "span"), e.fetchData.__span = m.spanContext().spanId, n[m.spanContext().spanId] = m, r(e.fetchData.url)) {
                    let t = e.args[0],
                        r = {
                            ...e.args[1] || {}
                        },
                        n = function(e, t, r, n) {
                            var a, i;
                            let o = tw({
                                    span: r,
                                    propagateTraceparent: n
                                }),
                                s = o["sentry-trace"],
                                l = o.baggage,
                                u = o.traceparent;
                            if (!s) return;
                            let c = t.headers || ((0, th.isRequest)(e) ? e.headers : void 0);
                            if (!c) return {
                                ...o
                            };
                            if (a = c, "u" > typeof Headers && (0, th.isInstanceOf)(a, Headers)) {
                                let e = new Headers(c);
                                if (e.get("sentry-trace") || e.set("sentry-trace", s), n && u && !e.get("traceparent") && e.set("traceparent", u), l) {
                                    let t = e.get("baggage");
                                    t ? tN(t) || e.set("baggage", `${t},${l}`) : e.set("baggage", l)
                                }
                                return e
                            }
                            if (Array.isArray(i = c) && i.every(e => Array.isArray(e) && 2 === e.length && "string" == typeof e[0])) {
                                let e = [...c];
                                e.find(e => "sentry-trace" === e[0]) || e.push(["sentry-trace", s]), n && u && !e.find(e => "traceparent" === e[0]) && e.push(["traceparent", u]);
                                let t = c.find(e => "baggage" === e[0] && "string" == typeof e[1] && tN(e[1]));
                                return l && !t && e.push(["baggage", l]), e
                            } {
                                let e = "sentry-trace" in c ? c["sentry-trace"] : void 0,
                                    t = "traceparent" in c ? c.traceparent : void 0,
                                    r = "baggage" in c ? c.baggage : void 0,
                                    a = r ? Array.isArray(r) ? [...r] : [r] : [],
                                    i = r && (Array.isArray(r) ? r.find(e => tN(e)) : tN(r));
                                l && !i && a.push(l);
                                let o = Object.assign({}, c, {
                                    "sentry-trace": e ?? s,
                                    baggage: a.length > 0 ? a.join(",") : void 0
                                });
                                return n && u && !t && (o.traceparent = u), o
                            }
                        }(t, r, (0, B.hasSpansEnabled)() && h ? m : void 0, p);
                    n && (e.args[1] = r, r.headers = n)
                }
                if (f) {
                    let t = {
                        input: e.args,
                        response: e.response,
                        startTimestamp: e.startTimestamp,
                        endTimestamp: e.endTimestamp
                    };
                    f.emit("beforeOutgoingRequestSpan", m, t)
                }
                return m
            }(t, c, d, p, {
                propagateTraceparent: f,
                onRequestSpanEnd: u
            });
            if (t.response && t.fetchData.__span && tB.set(t.response, t.fetchData.__span), r) {
                let n = tU(t.fetchData.url),
                    a = n ? (0, J.parseUrl)(n).host : void 0;
                r.setAttributes({
                    "http.url": n ? (0, J.stripDataUrlContent)(n) : void 0,
                    "server.address": a
                }), o && tW(r, e), l?.(r, {
                    headers: t.headers
                })
            }
        })), n && (0, tC.addXhrInstrumentationHandler)(t => {
            let r = function(e, t, r, n, a, i) {
                let o = e.xhr,
                    s = o?.[tC.SENTRY_XHR_DATA_KEY];
                if (!o || o.__sentry_own_request__ || !s) return;
                let {
                    url: l,
                    method: u
                } = s, c = (0, B.hasSpansEnabled)() && t(l);
                if (e.endTimestamp) {
                    let t = o.__sentry_xhr_span_id__;
                    if (!t) return;
                    let r = n[t];
                    r && (c && void 0 !== s.status_code && ((0, q.setHttpStatus)(r, s.status_code), r.end(), i?.(r, {
                        headers: tM(tL(o)),
                        error: e.error
                    })), delete n[t]);
                    return
                }
                let d = tU(l),
                    p = d ? (0, J.parseUrl)(d) : (0, J.parseUrl)(l),
                    f = (0, J.stripDataUrlContent)((0, J.stripUrlQueryAndFragment)(l)),
                    h = (0, L.getClient)(),
                    m = !!(0, $.getActiveSpan)(),
                    g = c && m ? (0, z.startInactiveSpan)({
                        name: `${u} ${f}`,
                        attributes: {
                            url: (0, J.stripDataUrlContent)(l),
                            type: "xhr",
                            "http.method": u,
                            "http.url": d ? (0, J.stripDataUrlContent)(d) : void 0,
                            "server.address": p?.host,
                            [M.SEMANTIC_ATTRIBUTE_SENTRY_ORIGIN]: "auto.http.browser",
                            [M.SEMANTIC_ATTRIBUTE_SENTRY_OP]: "http.client",
                            ...p?.search && {
                                "http.query": p?.search
                            },
                            ...p?.hash && {
                                "http.fragment": p?.hash
                            }
                        }
                    }) : new H.SentryNonRecordingSpan;
                return c && !m && h?.recordDroppedEvent("no_parent_span", "span"), o.__sentry_xhr_span_id__ = g.spanContext().spanId, n[o.__sentry_xhr_span_id__] = g, r(l) && function(e, t, r) {
                    let {
                        "sentry-trace": n,
                        baggage: a,
                        traceparent: i
                    } = tw({
                        span: t,
                        propagateTraceparent: r
                    });
                    n && function(e, t, r, n) {
                        let a = e.__sentry_xhr_v3__?.request_headers;
                        if (!a?.["sentry-trace"] && e.setRequestHeader) try {
                            if (e.setRequestHeader("sentry-trace", t), n && !a?.traceparent && e.setRequestHeader("traceparent", n), r) {
                                let t = a?.baggage;
                                t && t.split(",").some(e => e.trim().startsWith("sentry-")) || e.setRequestHeader("baggage", r)
                            }
                        } catch {}
                    }(e, n, a, i)
                }(o, (0, B.hasSpansEnabled)() && m ? g : void 0, a), h && h.emit("beforeOutgoingRequestSpan", g, e), g
            }(t, c, d, p, f, u);
            r && (o && tW(r, e), l?.(r, {
                headers: tM(t.xhr.__sentry_xhr_v3__?.request_headers)
            }))
        })
    }

    function tW(e, t) {
        let {
            url: r
        } = (0, $.spanToJSON)(e).data;
        if (!r || "string" != typeof r) return;
        let n = () => void setTimeout(a);
        if ((0, ee.hasSpanStreamingEnabled)(t)) {
            let t = e.end.bind(e);
            e.end = e => {
                let r = e ?? (0, W.timestampInSeconds)(),
                    i = !1,
                    o = () => {
                        i || (i = !0, setTimeout(a), t(r), clearTimeout(s))
                    };
                n = o;
                let s = setTimeout(o, 300)
            }
        }
        let a = eZ("resource", t => {
            let {
                entries: a
            } = t;
            a.forEach(t => {
                "resource" === t.entryType && "initiatorType" in t && "string" == typeof t.nextHopProtocol && ("fetch" === t.initiatorType || "xmlhttprequest" === t.initiatorType) && t.name.endsWith(r) && (e.setAttributes(t_(t)), n())
            })
        })
    }
    e.s(["defaultRequestInstrumentationOptions", 0, tj, "instrumentOutgoingRequests", 0, t$], 267569);
    let tF = /Googlebot|Google-InspectionTool|Storebot-Google|Bingbot|Slurp|DuckDuckBot|Baiduspider|YandexBot|Facebot|facebookexternalhit|LinkedInBot|Twitterbot|Applebot/i;

    function tH() {
        let e = N.WINDOW.navigator;
        return !!e?.userAgent && tF.test(e.userAgent)
    }
    let tG = {
        ...X,
        instrumentNavigation: !0,
        instrumentPageLoad: !0,
        markBackgroundSpan: !0,
        enableLongTask: !0,
        enableLongAnimationFrame: !0,
        enableInp: !0,
        ignoreResourceSpans: [],
        ignorePerformanceApiSpans: [],
        detectRedirects: !0,
        linkPreviousTrace: "in-memory",
        consistentTraceSampling: !1,
        enableReportPageLoaded: !1,
        _experiments: {},
        ...tj
    };

    function tq(e, t, r) {
        e.emit("startPageLoadSpan", t, r), (0, L.getCurrentScope)().setTransactionName(t.name);
        let n = e[tJ];
        return n && e.emit("afterStartPageLoadSpan", n), n
    }

    function tz(e, t, r) {
        let {
            url: n,
            isRedirect: a
        } = r || {};
        e.emit("beforeStartNavigationSpan", t, {
            isRedirect: a
        }), e.emit("startNavigationSpan", t, {
            isRedirect: a
        });
        let i = (0, L.getCurrentScope)();
        return i.setTransactionName(t.name), n && !a && i.setSDKProcessingMetadata({
            normalizedRequest: {
                ...(0, N.getHttpRequestData)(),
                url: n
            }
        }), e[tJ]
    }

    function tX(e) {
        let t = N.WINDOW.document,
            r = t?.querySelector(`meta[name=${e}]`);
        return r?.getAttribute("content") || void 0
    }

    function tY(e) {
        let t = N.WINDOW.performance?.getEntriesByType?.("navigation")[0],
            r = t?.serverTiming?.find(t => t.name === e);
        return r?.description
    }
    let tJ = "_sentry_idleSpan";

    function tK(e, t) {
        (0, ea.addNonEnumerableProperty)(e, tJ, t)
    }
    e.s(["browserTracingIntegration", 0, function() {
        let e, t, r, n = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
        "enableElementTiming" in n && (0, O.consoleSandbox)(() => {
            console.warn("[Sentry] `enableElementTiming` is deprecated and no longer has any effect. Use the standalone `elementTimingIntegration` instead.")
        });
        let a = {
                name: void 0,
                source: void 0
            },
            i = N.WINDOW.document,
            {
                enableInp: l,
                enableLongTask: u,
                enableLongAnimationFrame: c,
                _experiments: {
                    enableInteractions: d,
                    enableStandaloneClsSpans: p,
                    enableStandaloneLcpSpans: f
                },
                beforeStartSpan: h,
                idleTimeout: m,
                finalTimeout: g,
                childSpanTimeout: _,
                markBackgroundSpan: v,
                traceFetch: y,
                traceXHR: b,
                trackFetchStreamPerformance: E,
                shouldCreateSpanForRequest: S,
                enableHTTPTimings: T,
                ignoreResourceSpans: R,
                ignorePerformanceApiSpans: I,
                instrumentPageLoad: A,
                instrumentNavigation: C,
                detectRedirects: D,
                linkPreviousTrace: x,
                consistentTraceSampling: U,
                enableReportPageLoaded: k,
                onRequestSpanStart: j,
                onRequestSpanEnd: H
            } = {
                ...tG,
                ...n
            },
            G = tH();

        function X(t, n) {
            let l = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2],
                u = "pageload" === n.op,
                c = n.name,
                d = h ? h(n) : n,
                v = d.attributes || {};
            if (c !== d.name && (v[M.SEMANTIC_ATTRIBUTE_SENTRY_SOURCE] = "custom", d.attributes = v), !l) {
                let e = (0, W.dateTimestampInSeconds)();
                (0, z.startInactiveSpan)({
                    ...d,
                    startTime: e
                }).end(e);
                return
            }
            a.name = d.name, a.source = v[M.SEMANTIC_ATTRIBUTE_SENTRY_SOURCE];
            let y = Y(d, {
                idleTimeout: m,
                finalTimeout: g,
                childSpanTimeout: _,
                disableAutoFinish: u,
                beforeSpanEnd: n => {
                    e?.();
                    let a = (0, ee.hasSpanStreamingEnabled)(t);
                    ! function(e, t) {
                        let r = tr(),
                            n = (0, W.browserPerformanceTimeOrigin)();
                        if (!r?.getEntries || !n) return;
                        let {
                            spanStreamingEnabled: a,
                            ignorePerformanceApiSpans: i,
                            ignoreResourceSpans: l,
                            recordClsOnPageloadSpan: u,
                            recordLcpOnPageloadSpan: c
                        } = t, d = tn(n), p = r.getEntries(), {
                            op: f,
                            start_timestamp: h
                        } = (0, $.spanToJSON)(e);
                        if (p.slice(tv).forEach(t => {
                                let r = tn(t.startTime),
                                    n = tn(Math.max(0, t.duration));
                                if ("navigation" !== f || !h || !(d + r < h)) switch (t.entryType) {
                                    case "navigation":
                                        var a, o, s, u, c, p;
                                        let m, g, _;
                                        a = e, o = t, s = d, ["unloadEvent", "redirect", "domContentLoadedEvent", "loadEvent", "connect"].forEach(e => {
                                            tb(a, o, e, s)
                                        }), tb(a, o, "secureConnection", s, "TLS/SSL"), tb(a, o, "fetch", s, "cache"), tb(a, o, "domainLookup", s, "DNS"), u = a, c = o, m = (p = s) + tn(c.requestStart), g = p + tn(c.responseEnd), _ = p + tn(c.responseStart), c.responseEnd && (te(u, m, g, {
                                            op: "browser.request",
                                            name: c.name,
                                            attributes: {
                                                [M.SEMANTIC_ATTRIBUTE_SENTRY_ORIGIN]: "auto.ui.browser.metrics"
                                            }
                                        }), te(u, _, g, {
                                            op: "browser.response",
                                            name: c.name,
                                            attributes: {
                                                [M.SEMANTIC_ATTRIBUTE_SENTRY_ORIGIN]: "auto.ui.browser.metrics"
                                            }
                                        }));
                                        break;
                                    case "mark":
                                    case "paint":
                                    case "measure": {
                                        ! function(e, t, r, n, a, i) {
                                            if (function(e) {
                                                    if (e?.entryType === "measure") try {
                                                        return "Components ⚛" === e.detail.devtools.track
                                                    } catch {
                                                        return
                                                    }
                                                }(t) || ["mark", "measure"].includes(t.entryType) && (0, tf.stringMatchesSomePattern)(t.name, i)) return;
                                            let o = ep(!1),
                                                s = a + Math.max(r, tn(o ? o.requestStart : 0)),
                                                l = a + r,
                                                u = l + n,
                                                c = {
                                                    [M.SEMANTIC_ATTRIBUTE_SENTRY_ORIGIN]: "auto.resource.browser.metrics"
                                                };
                                            s !== l && (c["sentry.browser.measure_happened_before_request"] = !0, c["sentry.browser.measure_start_time"] = s),
                                                function(e, t) {
                                                    try {
                                                        let r = t.detail;
                                                        if (!r) return;
                                                        if ("object" == typeof r) {
                                                            for (let [t, n] of Object.entries(r))
                                                                if (n && (0, th.isPrimitive)(n)) e[`sentry.browser.measure.detail.${t}`] = n;
                                                                else if (void 0 !== n) try {
                                                                e[`sentry.browser.measure.detail.${t}`] = JSON.stringify(n)
                                                            } catch {}
                                                            return
                                                        }
                                                        if ((0, th.isPrimitive)(r)) {
                                                            e["sentry.browser.measure.detail"] = r;
                                                            return
                                                        }
                                                        try {
                                                            e["sentry.browser.measure.detail"] = JSON.stringify(r)
                                                        } catch {}
                                                    } catch {}
                                                }(c, t), s <= u && te(e, s, u, {
                                                    name: t.name,
                                                    op: t.entryType,
                                                    attributes: c
                                                })
                                        }(e, t, r, n, d, i);
                                        let a = ey(),
                                            o = t.startTime < a.firstHiddenTime;
                                        "first-paint" === t.name && o && (ty.fp = {
                                            value: t.startTime,
                                            unit: "millisecond"
                                        }), "first-contentful-paint" === t.name && o && (ty.fcp = {
                                            value: t.startTime,
                                            unit: "millisecond"
                                        });
                                        break
                                    }
                                    case "resource":
                                        ! function(e, t, r, n, a, i, o) {
                                            var s, l;
                                            if ("xmlhttprequest" === t.initiatorType || "fetch" === t.initiatorType) return;
                                            let u = t.initiatorType ? `resource.${t.initiatorType}` : "resource.other";
                                            if (o?.includes(u)) return;
                                            let c = {
                                                    [M.SEMANTIC_ATTRIBUTE_SENTRY_ORIGIN]: "auto.resource.browser.metrics"
                                                },
                                                d = (0, J.parseUrl)(r);
                                            d.protocol && (c["url.scheme"] = d.protocol.split(":").pop()), d.host && (c["server.address"] = d.host), c["url.same_origin"] = r.includes(eu.WINDOW.location.origin), s = t, l = c, [
                                                ["responseStatus", "http.response.status_code"],
                                                ["transferSize", "http.response_transfer_size"],
                                                ["encodedBodySize", "http.response_content_length"],
                                                ["decodedBodySize", "http.decoded_response_content_length"],
                                                ["renderBlockingStatus", "resource.render_blocking_status"],
                                                ["deliveryType", "http.response_delivery_type"]
                                            ].forEach(e => {
                                                let [t, r] = e, n = s[t];
                                                null != n && ("number" == typeof n && n < 0x7fffffff || "string" == typeof n) && (l[r] = n)
                                            });
                                            let p = {
                                                    ...c,
                                                    ...t_(t)
                                                },
                                                f = i + n;
                                            te(e, f, f + a, {
                                                name: r.replace(eu.WINDOW.location.origin, ""),
                                                op: u,
                                                attributes: p
                                            })
                                        }(e, t, t.name, r, n, d, l)
                                }
                            }), tv = Math.max(p.length - 1, 0), function(e, t) {
                                let r = eu.WINDOW.navigator;
                                if (!r) return;
                                let n = r.connection;
                                n && (n.effectiveType && e.setAttribute(t ? "network.connection.effective_type" : "effectiveConnectionType", n.effectiveType), n.type && e.setAttribute(t ? "network.connection.type" : "connectionType", n.type), e7(n.rtt) && (ty["connection.rtt"] = {
                                    value: n.rtt,
                                    unit: "millisecond"
                                }, t && e.setAttribute("network.connection.rtt", n.rtt))), e7(r.deviceMemory) && (t ? e.setAttribute("device.memory.estimated_capacity", r.deviceMemory) : e.setAttribute("deviceMemory", `${r.deviceMemory} GB`)), e7(r.hardwareConcurrency) && (t ? e.setAttribute("device.processor_count", r.hardwareConcurrency) : e.setAttribute("hardwareConcurrency", String(r.hardwareConcurrency)))
                            }(e, a), "pageload" === f) {
                            if (function(e) {
                                    let t = ep(!1);
                                    if (!t) return;
                                    let {
                                        responseStart: r,
                                        requestStart: n
                                    } = t;
                                    n <= r && (e["ttfb.requestTime"] = {
                                        value: r - n,
                                        unit: "millisecond"
                                    })
                                }(ty), a) {
                                let t = (t, r, n) => {
                                    let a = n ?? `browser.web_vital.${t}.value`;
                                    e.setAttribute(a, r), ec.DEBUG_BUILD && O.debug.log("Setting web vital attribute", {
                                        [a]: r
                                    }, "on pageload span")
                                };
                                ["ttfb", "fp", "fcp"].forEach(e => {
                                    ty[e] && t(e, ty[e].value)
                                }), ty["ttfb.requestTime"] && t("ttfb.requestTime", ty["ttfb.requestTime"].value, "browser.web_vital.ttfb.request_time")
                            } else {
                                var m, g;
                                u || delete ty.cls, c || delete ty.lcp, Object.entries(ty).forEach(e => {
                                    let [t, r] = e;
                                    (0, tp.setMeasurement)(t, r.value, r.unit)
                                }), m = e, g = t, o && g.recordLcpOnPageloadSpan && (o.element && m.setAttribute("lcp.element", (0, P.htmlTreeAsString)(o.element)), o.id && m.setAttribute("lcp.id", o.id), o.url && m.setAttribute("lcp.url", o.url.trim().slice(0, 200)), null != o.loadTime && m.setAttribute("lcp.loadTime", o.loadTime), null != o.renderTime && m.setAttribute("lcp.renderTime", o.renderTime), m.setAttribute("lcp.size", o.size)), s?.sources && g.recordClsOnPageloadSpan && s.sources.forEach((e, t) => m.setAttribute(`cls.source.${t+1}`, (0, P.htmlTreeAsString)(e.node)))
                            }
                            e.setAttribute(a ? "browser.performance.time_origin" : "performance.timeOrigin", d), e.setAttribute(a ? "browser.performance.navigation.activation_start" : "performance.activationStart", ef())
                        }
                        o = void 0, s = void 0, ty = {}
                    }(n, {
                        recordClsOnPageloadSpan: !a && !p,
                        recordLcpOnPageloadSpan: !a && !f,
                        ignoreResourceSpans: R,
                        ignorePerformanceApiSpans: I,
                        spanStreamingEnabled: a
                    }), tK(t, void 0);
                    let i = (0, L.getCurrentScope)(),
                        l = i.getPropagationContext();
                    i.setPropagationContext({
                        ...l,
                        traceId: y.spanContext().traceId,
                        sampled: (0, $.spanIsSampled)(y),
                        dsc: (0, F.getDynamicSamplingContextFromSpan)(n)
                    }), u && (r = void 0)
                },
                trimIdleSpanEndTimestamp: !k
            });

            function b() {
                i && ["interactive", "complete"].includes(i.readyState) && t.emit("idleSpanEnableAutoFinish", y)
            }
            u && k && (r = y), tK(t, y), u && !k && i && (i.addEventListener("readystatechange", () => {
                b()
            }), b())
        }
        return {
            name: "BrowserTracing",
            setup(n) {
                if (G) {
                    w.DEBUG_BUILD && O.debug.log("[Tracing] Skipping browserTracingIntegration setup for bot user agent.");
                    return
                }
                Z();
                let a = (0, ee.hasSpanStreamingEnabled)(n);
                if (e = function(e) {
                        let {
                            recordClsStandaloneSpans: t,
                            recordLcpStandaloneSpans: r,
                            client: n
                        } = e, a = tr();
                        if (a && (0, W.browserPerformanceTimeOrigin)()) {
                            a.mark && eu.WINDOW.performance.mark("sentry-tracing-init");
                            let e = r ? function(e) {
                                    let t, r = 0;
                                    if (!ti("largest-contentful-paint")) return;
                                    let n = eK(e => {
                                        let {
                                            metric: n
                                        } = e, a = n.entries[n.entries.length - 1];
                                        a && tm(n.value) && (r = n.value, t = a)
                                    }, !0);
                                    to(e, (e, a) => {
                                        (function(e, t, r, n) {
                                            if (!tm(e)) return;
                                            ec.DEBUG_BUILD && O.debug.log(`Sending LCP span (${e})`);
                                            let a = tn(((0, W.browserPerformanceTimeOrigin)() || 0) + (t?.startTime || 0)),
                                                i = (0, L.getCurrentScope)().getScopeData().transactionName,
                                                o = t ? (0, P.htmlTreeAsString)(t.element) : "Largest contentful paint",
                                                s = {
                                                    [M.SEMANTIC_ATTRIBUTE_SENTRY_ORIGIN]: "auto.http.browser.lcp",
                                                    [M.SEMANTIC_ATTRIBUTE_SENTRY_OP]: "ui.webvital.lcp",
                                                    [M.SEMANTIC_ATTRIBUTE_EXCLUSIVE_TIME]: 0,
                                                    "sentry.pageload.span_id": r,
                                                    "sentry.report_event": n
                                                };
                                            t && (t.element && (s["lcp.element"] = (0, P.htmlTreeAsString)(t.element)), t.id && (s["lcp.id"] = t.id), t.url && (s["lcp.url"] = t.url), null != t.loadTime && (s["lcp.loadTime"] = t.loadTime), null != t.renderTime && (s["lcp.renderTime"] = t.renderTime), null != t.size && (s["lcp.size"] = t.size));
                                            let l = tt({
                                                name: o,
                                                transaction: i,
                                                attributes: s,
                                                startTime: a
                                            });
                                            l && (l.addEvent("lcp", {
                                                [M.SEMANTIC_ATTRIBUTE_SENTRY_MEASUREMENT_UNIT]: "millisecond",
                                                [M.SEMANTIC_ATTRIBUTE_SENTRY_MEASUREMENT_VALUE]: e
                                            }), l.end(a))
                                        })(r, t, a, e), n()
                                    })
                                }(n) : !1 === r ? eK(e => {
                                    let {
                                        metric: t
                                    } = e, r = t.entries[t.entries.length - 1];
                                    r && tm(t.value) && (ty.lcp = {
                                        value: t.value,
                                        unit: "millisecond"
                                    }, o = r)
                                }, !0) : void 0,
                                i = t ? function(e) {
                                    let t, r = 0;
                                    if (!ti("layout-shift")) return;
                                    let n = eJ(e => {
                                        let {
                                            metric: n
                                        } = e, a = n.entries[n.entries.length - 1];
                                        a && (r = n.value, t = a)
                                    }, !0);
                                    to(e, (e, a) => {
                                        var i, o, s, l;
                                        let u, c, d, p, f;
                                        i = r, o = t, s = a, l = e, ec.DEBUG_BUILD && O.debug.log(`Sending CLS span (${i})`), u = o ? tn(((0, W.browserPerformanceTimeOrigin)() || 0) + o.startTime) : (0, W.timestampInSeconds)(), c = (0, L.getCurrentScope)().getScopeData().transactionName, d = o ? (0, P.htmlTreeAsString)(o.sources[0]?.node) : "Layout shift", p = {
                                            [M.SEMANTIC_ATTRIBUTE_SENTRY_ORIGIN]: "auto.http.browser.cls",
                                            [M.SEMANTIC_ATTRIBUTE_SENTRY_OP]: "ui.webvital.cls",
                                            [M.SEMANTIC_ATTRIBUTE_EXCLUSIVE_TIME]: 0,
                                            "sentry.pageload.span_id": s,
                                            "sentry.report_event": l
                                        }, o?.sources && o.sources.forEach((e, t) => {
                                            p[`cls.source.${t+1}`] = (0, P.htmlTreeAsString)(e.node)
                                        }), (f = tt({
                                            name: d,
                                            transaction: c,
                                            attributes: p,
                                            startTime: u
                                        })) && (f.addEvent("cls", {
                                            [M.SEMANTIC_ATTRIBUTE_SENTRY_MEASUREMENT_UNIT]: "",
                                            [M.SEMANTIC_ATTRIBUTE_SENTRY_MEASUREMENT_VALUE]: i
                                        }), f.end(u)), n()
                                    })
                                }(n) : !1 === t ? eJ(e => {
                                    let {
                                        metric: t
                                    } = e, r = t.entries[t.entries.length - 1];
                                    r && (ty.cls = {
                                        value: t.value,
                                        unit: ""
                                    }, s = r)
                                }, !0) : void 0,
                                l = eV(e => {
                                    let {
                                        metric: t
                                    } = e;
                                    t.entries[t.entries.length - 1] && (ty.ttfb = {
                                        value: t.value,
                                        unit: "millisecond"
                                    })
                                });
                            return () => {
                                l(), e?.(), i?.()
                            }
                        }
                        return () => void 0
                    }({
                        recordClsStandaloneSpans: a ? void 0 : p || !1,
                        recordLcpStandaloneSpans: a ? void 0 : f || !1,
                        client: n
                    }), a ? (! function(e) {
                        let t, r = 0;
                        if (!ti("largest-contentful-paint")) return;
                        let n = eK(e => {
                            let {
                                metric: n
                            } = e, a = n.entries[n.entries.length - 1];
                            a && tm(n.value) && (r = n.value, t = a)
                        }, !0);
                        to(e, (e, a, i) => {
                            (function(e, t, r, n) {
                                if (!tm(e)) return;
                                ec.DEBUG_BUILD && O.debug.log(`Sending LCP span (${e})`);
                                let a = (0, W.browserPerformanceTimeOrigin)() || 0,
                                    i = tn(a),
                                    o = tn(a + (t?.startTime || 0)),
                                    s = t ? (0, P.htmlTreeAsString)(t.element) : "Largest contentful paint",
                                    l = {};
                                t?.element && (l["browser.web_vital.lcp.element"] = (0, P.htmlTreeAsString)(t.element)), t?.id && (l["browser.web_vital.lcp.id"] = t.id), t?.url && (l["browser.web_vital.lcp.url"] = t.url), t?.loadTime != null && (l["browser.web_vital.lcp.load_time"] = t.loadTime), t?.renderTime != null && (l["browser.web_vital.lcp.render_time"] = t.renderTime), t?.size != null && (l["browser.web_vital.lcp.size"] = t.size), tE({
                                    name: s,
                                    op: "ui.webvital.lcp",
                                    origin: "auto.http.browser.lcp",
                                    metricName: "lcp",
                                    value: e,
                                    attributes: l,
                                    parentSpan: r,
                                    reportEvent: n,
                                    startTime: i,
                                    endTime: o
                                })
                            })(r, t, i, e), n()
                        })
                    }(n), ! function(e) {
                        let t, r = 0;
                        if (!ti("layout-shift")) return;
                        let n = eJ(e => {
                            let {
                                metric: n
                            } = e, a = n.entries[n.entries.length - 1];
                            a && (r = n.value, t = a)
                        }, !0);
                        to(e, (e, a, i) => {
                            var o, s, l, u;
                            let c, d, p;
                            o = r, s = t, l = i, u = e, ec.DEBUG_BUILD && O.debug.log(`Sending CLS span (${o})`), c = s ? tn(((0, W.browserPerformanceTimeOrigin)() || 0) + s.startTime) : (0, W.timestampInSeconds)(), d = s ? (0, P.htmlTreeAsString)(s.sources[0]?.node) : "Layout shift", p = {}, s?.sources && s.sources.forEach((e, t) => {
                                p[`browser.web_vital.cls.source.${t+1}`] = (0, P.htmlTreeAsString)(e.node)
                            }), tE({
                                name: d,
                                op: "ui.webvital.cls",
                                origin: "auto.http.browser.cls",
                                metricName: "cls",
                                value: o,
                                attributes: p,
                                parentSpan: l,
                                reportEvent: u,
                                startTime: c
                            }), n()
                        })
                    }(n), l && tr() && (0, W.browserPerformanceTimeOrigin)() && eQ(e => {
                        var t, r, n;
                        let a, i, o, s, l, u, c, d, {
                            metric: p
                        } = e;
                        if (null == p.value || tn(p.value) > 60) return;
                        let f = p.entries.find(e => e.duration === p.value && tc[e.name]);
                        f && (t = p.value, r = f, ec.DEBUG_BUILD && O.debug.log(`Sending INP span (${t})`), a = tn((0, W.browserPerformanceTimeOrigin)() + r.startTime), i = tn(t), o = tc[r.name], s = null != (n = r.interactionId) ? tl.get(n) : void 0, u = (l = (0, $.getActiveSpan)()) ? (0, $.getRootSpan)(l) : void 0, d = (c = s?.span || u) ? (0, $.spanToStreamedSpanJSON)(c).name : (0, L.getCurrentScope)().getScopeData().transactionName, tE({
                            name: s?.elementName || (0, P.htmlTreeAsString)(r.target),
                            op: `ui.interaction.${o}`,
                            origin: "auto.http.browser.inp",
                            metricName: "inp",
                            value: t,
                            attributes: {
                                [M.SEMANTIC_ATTRIBUTE_EXCLUSIVE_TIME]: r.duration,
                                "sentry.transaction": d
                            },
                            startTime: a,
                            endTime: a + i,
                            parentSpan: c
                        }))
                    })) : l && function() {
                        if (tr() && (0, W.browserPerformanceTimeOrigin)()) {
                            let e = eQ(td);
                            () => {
                                e()
                            }
                        }
                    }(), c && et.GLOBAL_OBJ.PerformanceObserver && PerformanceObserver.supportedEntryTypes?.includes("long-animation-frame") ? new PerformanceObserver(e => {
                        let t = (0, $.getActiveSpan)();
                        if (t)
                            for (let r of e.getEntries()) {
                                if (!r.scripts[0]) continue;
                                let e = tn((0, W.browserPerformanceTimeOrigin)() + r.startTime),
                                    {
                                        start_timestamp: n,
                                        op: a
                                    } = (0, $.spanToJSON)(t);
                                if ("navigation" === a && n && e < n) continue;
                                let i = tn(r.duration),
                                    o = {
                                        [M.SEMANTIC_ATTRIBUTE_SENTRY_ORIGIN]: "auto.ui.browser.metrics"
                                    },
                                    {
                                        invoker: s,
                                        invokerType: l,
                                        sourceURL: u,
                                        sourceFunctionName: c,
                                        sourceCharPosition: d
                                    } = r.scripts[0];
                                o["browser.script.invoker"] = s, o["browser.script.invoker_type"] = l, u && (o["code.filepath"] = u), c && (o["code.function"] = c), -1 !== d && (o["browser.script.source_char_position"] = d), te(t, e, e + i, {
                                    name: "Main UI thread blocked",
                                    op: "ui.long-animation-frame",
                                    attributes: o
                                })
                            }
                    }).observe({
                        type: "long-animation-frame",
                        buffered: !0
                    }) : u && eZ("longtask", e => {
                        let {
                            entries: t
                        } = e, r = (0, $.getActiveSpan)();
                        if (!r) return;
                        let {
                            op: n,
                            start_timestamp: a
                        } = (0, $.spanToJSON)(r);
                        for (let e of t) {
                            let t = tn((0, W.browserPerformanceTimeOrigin)() + e.startTime),
                                i = tn(e.duration);
                            "navigation" === n && a && t < a || te(r, t, t + i, {
                                name: "Main UI thread blocked",
                                op: "ui.long-task",
                                attributes: {
                                    [M.SEMANTIC_ATTRIBUTE_SENTRY_ORIGIN]: "auto.ui.browser.metrics"
                                }
                            })
                        }
                    }), d && eZ("event", e => {
                        let {
                            entries: t
                        } = e, r = (0, $.getActiveSpan)();
                        if (r) {
                            for (let e of t)
                                if ("click" === e.name) {
                                    let t = tn((0, W.browserPerformanceTimeOrigin)() + e.startTime),
                                        n = tn(e.duration),
                                        a = {
                                            name: (0, P.htmlTreeAsString)(e.target),
                                            op: `ui.interaction.${e.name}`,
                                            startTime: t,
                                            attributes: {
                                                [M.SEMANTIC_ATTRIBUTE_SENTRY_ORIGIN]: "auto.ui.browser.metrics"
                                            }
                                        },
                                        i = (0, P.getComponentName)(e.target);
                                    i && (a.attributes["ui.component_name"] = i), te(r, t, t + n, a)
                                }
                        }
                    }), D && i) {
                    let e = () => {
                        t = (0, W.timestampInSeconds)()
                    };
                    addEventListener("click", e, {
                        capture: !0
                    }), addEventListener("keydown", e, {
                        capture: !0,
                        passive: !0
                    })
                }

                function h() {
                    let e = n[tJ];
                    e && !(0, $.spanToJSON)(e).timestamp && (w.DEBUG_BUILD && O.debug.log(`[Tracing] Finishing current active span with op: ${(0,$.spanToJSON)(e).op}`), e.setAttribute(M.SEMANTIC_ATTRIBUTE_SENTRY_IDLE_SPAN_FINISH_REASON, "cancelled"), e.end())
                }
                n.on("startNavigationSpan", (e, r) => {
                    if ((0, L.getClient)() !== n) return;
                    if (r?.isRedirect) {
                        w.DEBUG_BUILD && O.debug.warn("[Tracing] Detected redirect, navigation span will not be the root span, but a child span."), X(n, {
                            op: "navigation.redirect",
                            ...e
                        }, !1);
                        return
                    }
                    t = void 0, h(), (0, L.getIsolationScope)().setPropagationContext({
                        traceId: (0, er.generateTraceId)(),
                        sampleRand: Math.random(),
                        propagationSpanId: (0, B.hasSpansEnabled)() ? void 0 : (0, er.generateSpanId)()
                    });
                    let a = (0, L.getCurrentScope)();
                    a.setPropagationContext({
                        traceId: (0, er.generateTraceId)(),
                        sampleRand: Math.random(),
                        propagationSpanId: (0, B.hasSpansEnabled)() ? void 0 : (0, er.generateSpanId)()
                    }), a.setSDKProcessingMetadata({
                        normalizedRequest: void 0
                    }), X(n, {
                        op: "navigation",
                        ...e,
                        parentSpan: null,
                        forceTransaction: !0
                    })
                }), n.on("startPageLoadSpan", function(e) {
                    let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    if ((0, L.getClient)() !== n) return;
                    h();
                    let r = t.sentryTrace || tX("sentry-trace") || tY("sentry-trace"),
                        a = t.baggage || tX("baggage") || tY("baggage"),
                        i = (0, en.propagationContextFromHeaders)(r, a),
                        o = (0, L.getCurrentScope)();
                    o.setPropagationContext(i), (0, B.hasSpansEnabled)() || (o.getPropagationContext().propagationSpanId = (0, er.generateSpanId)()), o.setSDKProcessingMetadata({
                        normalizedRequest: (0, N.getHttpRequestData)()
                    }), X(n, {
                        op: "pageload",
                        ...e
                    })
                }), n.on("endPageloadSpan", () => {
                    k && r && (r.setAttribute(M.SEMANTIC_ATTRIBUTE_SENTRY_IDLE_SPAN_FINISH_REASON, "reportPageLoaded"), r.end())
                })
            },
            afterAllSetup(e) {
                var r, n, i, o, s;
                let u;
                if (G) return;
                let c = (0, P.getLocationHref)();
                if ("off" !== x && function(e, t) {
                        let {
                            linkPreviousTrace: r,
                            consistentTraceSampling: n
                        } = t, a = "session-storage" === r, i = a ? function() {
                            try {
                                let e = N.WINDOW.sessionStorage?.getItem(tS);
                                return JSON.parse(e)
                            } catch {
                                return
                            }
                        }() : void 0;
                        e.on("spanStart", e => {
                            if ((0, $.getRootSpan)(e) !== e) return;
                            let t = (0, L.getCurrentScope)().getPropagationContext();
                            i = function(e, t, r) {
                                let n = (0, $.spanToJSON)(t),
                                    a = {
                                        spanContext: t.spanContext(),
                                        startTimestamp: n.start_timestamp,
                                        sampleRate: function() {
                                            try {
                                                return Number(r.dsc?.sample_rate) ?? Number(n.data?.[M.SEMANTIC_ATTRIBUTE_SENTRY_SAMPLE_RATE])
                                            } catch {
                                                return 0
                                            }
                                        }(),
                                        sampleRand: r.sampleRand
                                    };
                                if (!e) return a;
                                let i = e.spanContext;
                                return i.traceId === n.trace_id ? e : (Date.now() / 1e3 - e.startTimestamp <= 3600 && (w.DEBUG_BUILD && O.debug.log(`Adding previous_trace \`${JSON.stringify(i)}\` link to span \`${JSON.stringify({op:n.op,...t.spanContext()})}\``), t.addLink({
                                    context: i,
                                    attributes: {
                                        [M.SEMANTIC_LINK_ATTRIBUTE_LINK_TYPE]: "previous_trace"
                                    }
                                }), t.setAttribute("sentry.previous_trace", `${i.traceId}-${i.spanId}-${+!!tT(i)}`)), a)
                            }(i, e, t), a && function(e) {
                                try {
                                    N.WINDOW.sessionStorage.setItem(tS, JSON.stringify(e))
                                } catch (e) {
                                    w.DEBUG_BUILD && O.debug.warn("Could not store previous trace in sessionStorage", e)
                                }
                            }(i)
                        });
                        let o = !0;
                        n && e.on("beforeSampling", e => {
                            if (!i) return;
                            let t = (0, L.getCurrentScope)(),
                                r = t.getPropagationContext();
                            if (o && r.parentSpanId) {
                                o = !1;
                                return
                            }
                            t.setPropagationContext({
                                ...r,
                                dsc: {
                                    ...r.dsc,
                                    sample_rate: String(i.sampleRate),
                                    sampled: String(tT(i.spanContext))
                                },
                                sampleRand: i.sampleRand
                            }), e.parentSampled = tT(i.spanContext), e.parentSampleRate = i.sampleRate, e.spanAttributes = {
                                ...e.spanAttributes,
                                [M.SEMANTIC_ATTRIBUTE_SENTRY_PREVIOUS_TRACE_SAMPLE_RATE]: i.sampleRate
                            }
                        })
                    }(e, {
                        linkPreviousTrace: x,
                        consistentTraceSampling: U
                    }), N.WINDOW.location) {
                    if (A) {
                        let t = (0, W.browserPerformanceTimeOrigin)();
                        tq(e, {
                            name: N.WINDOW.location.pathname,
                            startTime: t ? t / 1e3 : void 0,
                            attributes: {
                                [M.SEMANTIC_ATTRIBUTE_SENTRY_SOURCE]: "url",
                                [M.SEMANTIC_ATTRIBUTE_SENTRY_ORIGIN]: "auto.pageload.browser"
                            }
                        })
                    }
                    C && (0, ei.addHistoryInstrumentationHandler)(r => {
                        var n, a;
                        let i, o, {
                            to: s,
                            from: l
                        } = r;
                        if (void 0 === l && c?.indexOf(s) !== -1) {
                            c = void 0;
                            return
                        }
                        c = void 0;
                        let u = (0, J.parseStringToURLObject)(s),
                            d = e[tJ],
                            p = d && D && (n = d, a = t, i = (0, $.spanToJSON)(n), !((o = (0, W.dateTimestampInSeconds)()) - i.start_timestamp > 1.5) && (!a || !(o - a <= 1.5)));
                        tz(e, {
                            name: u?.pathname || N.WINDOW.location.pathname,
                            attributes: {
                                [M.SEMANTIC_ATTRIBUTE_SENTRY_SOURCE]: "url",
                                [M.SEMANTIC_ATTRIBUTE_SENTRY_ORIGIN]: "auto.navigation.browser"
                            }
                        }, {
                            url: s,
                            isRedirect: p
                        })
                    })
                }
                v && (N.WINDOW.document ? N.WINDOW.document.addEventListener("visibilitychange", () => {
                    let e = (0, $.getActiveSpan)();
                    if (!e) return;
                    let t = (0, $.getRootSpan)(e);
                    if (N.WINDOW.document.hidden && t) {
                        let e = "cancelled",
                            {
                                op: r,
                                status: n
                            } = (0, $.spanToJSON)(t);
                        w.DEBUG_BUILD && O.debug.log(`[Tracing] Transaction: ${e} -> since tab moved to the background, op: ${r}`), n || t.setStatus({
                            code: q.SPAN_STATUS_ERROR,
                            message: e
                        }), t.setAttribute("sentry.cancellation_reason", "document.hidden"), t.end()
                    }
                }) : w.DEBUG_BUILD && O.debug.warn("[Tracing] Could not set up background tab detection due to lack of global document")), d && (r = e, n = m, i = g, o = _, s = a, N.WINDOW.document && addEventListener("click", () => {
                    let e = "ui.action.click",
                        t = r[tJ];
                    if (t && ["navigation", "pageload"].includes((0, $.spanToJSON)(t).op)) {
                        w.DEBUG_BUILD && O.debug.warn(`[Tracing] Did not create ${e} span because a pageload or navigation span is in progress.`);
                        return
                    }
                    if (u && (u.setAttribute(M.SEMANTIC_ATTRIBUTE_SENTRY_IDLE_SPAN_FINISH_REASON, "interactionInterrupted"), u.end(), u = void 0), !s.name) {
                        w.DEBUG_BUILD && O.debug.warn(`[Tracing] Did not create ${e} transaction because _latestRouteName is missing.`);
                        return
                    }
                    u = Y({
                        name: s.name,
                        op: e,
                        attributes: {
                            [M.SEMANTIC_ATTRIBUTE_SENTRY_SOURCE]: s.source || "url"
                        }
                    }, {
                        idleTimeout: n,
                        finalTimeout: i,
                        childSpanTimeout: o
                    })
                }, {
                    capture: !0
                })), l && function() {
                    let e = Object.keys(tc);

                    function t(e) {
                        let t = e.target;
                        if (!t) return;
                        let r = (0, P.htmlTreeAsString)(t),
                            n = Math.round(e.timeStamp);
                        if (tu.set(n, r), tu.size > 50) {
                            let e = tu.keys().next().value;
                            void 0 !== e && tu.delete(e)
                        }
                    }
                    el() && e.forEach(e => {
                        eu.WINDOW.addEventListener(e, t, {
                            capture: !0,
                            passive: !0
                        })
                    });
                    let r = e => {
                        let {
                            entries: t
                        } = e, r = (0, $.getActiveSpan)(), n = r && (0, $.getRootSpan)(r);
                        t.forEach(e => {
                            if (!e6(e)) return;
                            let t = e.interactionId;
                            if (null == t || tl.has(t)) return;
                            let r = e.target ? (0, P.htmlTreeAsString)(e.target) : function(e) {
                                let t = Math.round(e.startTime),
                                    r = tu.get(t);
                                if (!r)
                                    for (let e = -5; e <= 5; e++) {
                                        let n = tu.get(t + e);
                                        if (n) {
                                            r = n;
                                            break
                                        }
                                    }
                                return r || "<unknown>"
                            }(e);
                            if (ts.length > 10) {
                                let e = ts.shift();
                                tl.delete(e)
                            }
                            ts.push(t), tl.set(t, {
                                span: n,
                                elementName: r
                            })
                        })
                    };
                    eZ("event", r), eZ("first-input", r)
                }(), t$(e, {
                    traceFetch: y,
                    traceXHR: b,
                    trackFetchStreamPerformance: E,
                    tracePropagationTargets: e.getOptions().tracePropagationTargets,
                    shouldCreateSpanForRequest: S,
                    enableHTTPTimings: T,
                    onRequestSpanStart: j,
                    onRequestSpanEnd: H
                })
            }
        }
    }, "isBotUserAgent", 0, tH, "startBrowserTracingNavigationSpan", 0, tz, "startBrowserTracingPageLoadSpan", 0, tq], 411187);
    let tV = /^(\S+:\\|\/?)([\s\S]*?)((?:\.{1,2}|[^/\\]+?|)(\.[^./\\]*|))(?:[/\\]*)$/;

    function tQ() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        let n = "",
            a = !1;
        for (let e = t.length - 1; e >= -1 && !a; e--) {
            let r = e >= 0 ? t[e] : "/";
            r && (n = `${r}/${n}`, a = "/" === r.charAt(0))
        }
        return n = (function(e, t) {
            let r = 0;
            for (let t = e.length - 1; t >= 0; t--) {
                let n = e[t];
                "." === n ? e.splice(t, 1) : ".." === n ? (e.splice(t, 1), r++) : r && (e.splice(t, 1), r--)
            }
            if (t)
                for (; r--;) e.unshift("..");
            return e
        })(n.split("/").filter(e => !!e), !a).join("/"), (a ? "/" : "") + n || "."
    }

    function tZ(e) {
        let t = 0;
        for (; t < e.length && "" === e[t]; t++);
        let r = e.length - 1;
        for (; r >= 0 && "" === e[r]; r--);
        return t > r ? [] : e.slice(t, r - t + 1)
    }
    let t0 = (0, f.defineIntegration)(function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
            t = e.root,
            r = e.prefix || "app:///",
            n = "window" in et.GLOBAL_OBJ && !!et.GLOBAL_OBJ.window,
            a = e.iteratee || function(e) {
                let {
                    isBrowser: t,
                    root: r,
                    prefix: n
                } = e;
                return e => {
                    if (!e.filename) return e;
                    let a = /^[a-zA-Z]:\\/.test(e.filename) || e.filename.includes("\\") && !e.filename.includes("/"),
                        i = /^\//.test(e.filename);
                    if (t) {
                        if (r) {
                            let t = e.filename;
                            0 === t.indexOf(r) && (e.filename = t.replace(r, n))
                        }
                    } else if (a || i) {
                        let t, i, o = a ? e.filename.replace(/^[a-zA-Z]:/, "").replace(/\\/g, "/") : e.filename,
                            s = r ? function(e, t) {
                                e = tQ(e).slice(1), t = tQ(t).slice(1);
                                let r = tZ(e.split("/")),
                                    n = tZ(t.split("/")),
                                    a = Math.min(r.length, n.length),
                                    i = a;
                                for (let e = 0; e < a; e++)
                                    if (r[e] !== n[e]) {
                                        i = e;
                                        break
                                    } let o = [];
                                for (let e = i; e < r.length; e++) o.push("..");
                                return (o = o.concat(n.slice(i))).join("/")
                            }(r, o) : (t = o.length > 1024 ? `<truncated>${o.slice(-1024)}` : o, (i = tV.exec(t)) ? i.slice(1) : [])[2] || "";
                        e.filename = `${n}${s}`
                    }
                    return e
                }
            }({
                isBrowser: n,
                root: t,
                prefix: r
            });
        return {
            name: "RewriteFrames",
            processEvent(e) {
                let t = e;
                return e.exception && Array.isArray(e.exception.values) && (t = function(e) {
                    try {
                        return {
                            ...e,
                            exception: {
                                ...e.exception,
                                values: e.exception.values.map(e => {
                                    var t;
                                    return {
                                        ...e,
                                        ...e.stacktrace && {
                                            stacktrace: {
                                                ...t = e.stacktrace,
                                                frames: t?.frames?.map(e => a(e))
                                            }
                                        }
                                    }
                                })
                            }
                        }
                    } catch {
                        return e
                    }
                }(t)), t
            }
        }
    });
    e.s(["rewriteFramesIntegration", 0, t0], 217251), e.s(["LRUMap", 0, class {
        get size() {
            return this._cache.size
        }
        get(e) {
            let t = this._cache.get(e);
            if (void 0 !== t) return this._cache.delete(e), this._cache.set(e, t), t
        }
        set(e, t) {
            if (this._cache.size >= this._maxSize) {
                let e = this._cache.keys().next().value;
                this._cache.delete(e)
            }
            this._cache.set(e, t)
        }
        remove(e) {
            let t = this._cache.get(e);
            return t && this._cache.delete(e), t
        }
        clear() {
            this._cache.clear()
        }
        keys() {
            return Array.from(this._cache.keys())
        }
        values() {
            let e = [];
            return this._cache.forEach(t => e.push(t)), e
        }
        constructor(e) {
            this._maxSize = e, this._cache = new Map
        }
    }], 489767)
}]);

//# debugId=6b6ba246-b3bb-f266-3c38-b1b36cea99f5
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0gf4xm90u91ji.js.map