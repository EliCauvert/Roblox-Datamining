;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "88037f4c-8562-d0e2-4dad-9010f6e58815")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 351853, (e, t, r) => {
    var a = 0 / 0,
        n = /^\s+|\s+$/g,
        i = /^[-+]0x[0-9a-f]+$/i,
        o = /^0b[01]+$/i,
        s = /^0o[0-7]+$/i,
        l = parseInt,
        u = e.g && e.g.Object === Object && e.g,
        c = "object" == typeof self && self && self.Object === Object && self,
        h = u || c || Function("return this")(),
        d = Object.prototype.toString,
        m = Math.max,
        p = Math.min,
        f = function() {
            return h.Date.now()
        };

    function g(e) {
        var t = typeof e;
        return !!e && ("object" == t || "function" == t)
    }

    function v(e) {
        if ("number" == typeof e) return e;
        if ("symbol" == typeof(t = e) || t && "object" == typeof t && "[object Symbol]" == d.call(t)) return a;
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
            h = !1,
            d = !0;
        if ("function" != typeof e) throw TypeError("Expected a function");

        function y(t) {
            var r = a,
                i = n;
            return a = n = void 0, u = t, o = e.apply(i, r)
        }

        function b(e) {
            var r = e - l,
                a = e - u;
            return void 0 === l || r >= t || r < 0 || h && a >= i
        }

        function w() {
            var e, r, a, n = f();
            if (b(n)) return A(n);
            s = setTimeout(w, (e = n - l, r = n - u, a = t - e, h ? p(a, i - r) : a))
        }

        function A(e) {
            return (s = void 0, d && a) ? y(e) : (a = n = void 0, o)
        }

        function I() {
            var e, r = f(),
                i = b(r);
            if (a = arguments, n = this, l = r, i) {
                if (void 0 === s) return u = e = l, s = setTimeout(w, t), c ? y(e) : o;
                if (h) return s = setTimeout(w, t), y(l)
            }
            return void 0 === s && (s = setTimeout(w, t)), o
        }
        return t = v(t) || 0, g(r) && (c = !!r.leading, i = (h = "maxWait" in r) ? m(v(r.maxWait) || 0, t) : i, d = "trailing" in r ? !!r.trailing : d), I.cancel = function() {
            void 0 !== s && clearTimeout(s), u = 0, a = l = n = s = void 0
        }, I.flush = function() {
            return void 0 === s ? o : A(f())
        }, I
    }
}, 250646, e => {
    "use strict";
    var t = e.i(371847);
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
        }, h = async () => {
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
    e.s(["getAuthTicket", 0, h, "getClientStatus", 0, u, "resetClientStatus", 0, c])
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
        h = async function(e) {
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
    var d = e.i(309937),
        m = e.i(270784),
        p = e.i(548835);
    let f = async () => ({
        authTicket: null != (0, d.authenticatedUser)() ? await (0, p.getAuthTicket)() : void 0,
        btId: (0, m.getBrowserTrackerId)() || void 0
    }), g = async e => {
        let {
            linkId: t,
            downloadSource: r
        } = e;
        if (null == t) return {};
        let {
            authTicket: a,
            btId: n
        } = await f(), i = await h(t, {
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
}, 526005, e => {
    "use strict";
    var t, r, a, n, i, o, s = e.i(371847),
        l = e.i(376054),
        u = e.i(136927),
        c = e.i(550475),
        h = e.i(42297),
        d = e.i(474754),
        m = e.i(51449),
        p = e.i(259864),
        f = e.i(578889),
        g = e.i(766271),
        v = (t = new WeakMap, r = new WeakMap, a = new WeakMap, n = new WeakMap, i = new WeakSet, o = new WeakSet, class extends f.Subscribable {
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
                (0, h._)(this, i, y).call(this), (0, h._)(this, o, b).call(this, e)
            }
            getCurrentResult() {
                return (0, l._)(this, r)
            }
            reset() {
                (0, l._)(this, a)?.removeObserver(this), (0, c._)(this, a, void 0), (0, h._)(this, i, y).call(this), (0, h._)(this, o, b).call(this)
            }
            mutate(e, r) {
                return (0, c._)(this, n, r), (0, l._)(this, a)?.removeObserver(this), (0, c._)(this, a, (0, l._)(this, t).getMutationCache().build((0, l._)(this, t), this.options)), (0, l._)(this, a).addObserver(this), (0, l._)(this, a).execute(e)
            }
            constructor(e, s) {
                super(), (0, d._)(this, i), (0, d._)(this, o), (0, u._)(this, t, {
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
                }), (0, c._)(this, t, e), this.setOptions(s), this.bindMethods(), (0, h._)(this, i, y).call(this)
            }
        });

    function y() {
        let e = (0, l._)(this, a)?.state ?? (0, m.getDefaultState)();
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
        p.notifyManager.batch(() => {
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
        let n = s.useSyncExternalStore(s.useCallback(e => a.subscribe(p.notifyManager.batchCalls(e)), [a]), () => a.getCurrentResult(), () => a.getCurrentResult()),
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
}, 381111, e => {
    "use strict";
    var t = e.i(245837),
        r = e.i(646424),
        a = e.i(587541),
        n = e.i(645020),
        i = e.i(723941),
        o = e.i(357355);
    let s = [],
        l = !1,
        u = () => {
            if (l = !1, 0 === s.length) return;
            let e = s;
            s = [];
            try {
                r.postUntyped(a.Url.parse(`${t.default.beaconApi}/v1/measurements`).getOrThrow(), e, {
                    credentials: "include",
                    keepalive: !0,
                    signal: AbortSignal.timeout(3e3)
                })
            } catch {}
        };
    e.s(["logMeasurement", 0, (e, t) => {
        let r = (0, i.serialize)(t);
        s.push({
            metricName: e,
            jsonData: r.isOk() ? r.value : "{}"
        });
        let {
            batchSize: a,
            waitMs: c
        } = (() => {
            if (void 0 === o.document) return {
                batchSize: 100,
                waitMs: 1e3
            };
            let e = o.document.getElementsByName("performance")[0],
                t = (0, n.parseInt)(e?.getAttribute("data-ui-performance-metrics-batch-size") ?? ""),
                [r, a, i] = (e?.getAttribute("data-ui-performance-metrics-batch-wait-time") ?? "").split(":"),
                s = (((0, n.parseInt)(r ?? "") ?? 0) * 3600 + ((0, n.parseInt)(a ?? "") ?? 0) * 60 + ((0, n.parseInt)(i ?? "") ?? 0)) * 1e3;
            return {
                batchSize: t ?? 100,
                waitMs: 0 === s ? 1e3 : s
            }
        })();
        s.length >= a ? u() : l || (l = !0, setTimeout(u, c))
    }, "metricThumbnailType", 0, e => `${"AvatarHeadShot"===e?"AvatarHeadshot":e}_2d`, "shouldSampleMeasurement", 0, () => {
        let e = o.document?.getElementsByName("thumbnail-meta-data")[0],
            t = void 0 === e ? 10 : (0, n.parseInt)(e.dataset.thumbnailMetricsSampleSize ?? "");
        return null !== t && Math.floor(100 * Math.random()) <= t
    }])
}, 773871, e => {
    "use strict";
    var t = e.i(7284),
        r = e.i(371847);
    let a = ["[&::after]:[content:'']", "[&::after]:absolute", "[&::after]:inset-[0]", "[&::after]:[background:linear-gradient(90deg,var(--color-extended-white-0)_0%,var(--color-extended-white-20)_50%,var(--color-extended-white-0)_100%)]", "[&::after]:[animation:foundation-web-skeleton-shimmer_1.5s_linear_infinite]", "motion-reduce:[&::after]:[content:none]"],
        n = (0, r.forwardRef)((e, n) => {
            let {
                className: i,
                style: o,
                variant: s = "Rectangle",
                isAnimated: l = !0,
                width: u,
                height: c,
                ...h
            } = e, d = "Text" === s, m = "Circle" === s, p = {};
            return d ? (p.height = c ?? "1em", p.width = u ?? "100%") : (void 0 !== u && (p.width = u), void 0 !== c && (p.height = c)), r.default.createElement("div", {
                ref: n,
                "aria-hidden": "true",
                "data-variant": s,
                ...h,
                className: (0, t.default)("relative clip block bg-[var(--color-common-shimmer)]", d && "radius-xsmall", m && "radius-circle", !d && !m && "radius-small", l && a, i),
                style: {
                    ...p,
                    ...o
                }
            })
        });
    n.displayName = "Skeleton", e.s(["Skeleton", 0, n])
}, 599965, 846379, 99213, e => {
    "use strict";
    let t;
    var r = e.i(809804),
        a = e.i(371847),
        n = e.i(708923),
        i = e.i(773871);
    let o = Error("thumbnail pending"),
        s = (e, t) => t === o && e < 5;
    e.s(["THUMBNAIL_PENDING", 0, o, "retryPendingThumbnail", 0, s], 846379), e.i(350223);
    var l = e.i(874296),
        u = e.i(245837),
        c = e.i(646424),
        h = e.i(357355),
        d = e.i(734899),
        m = e.i(587541);
    let p = "150x150",
        f = "webp",
        g = e => `${e.type}:${e.targetId}:${e.size??p}:${e.format??f}:${e.version??""}:${e.headShape??""}:${e.includeBackground?"bg":""}:${e.includeProfileFrame?"frame":""}`,
        v = l.object({
            data: l.array(l.object({
                requestId: l.string(),
                state: l.literal(["Completed", "Pending", "Blocked", "Error", "InReview"]),
                imageUrl: l.nullish(l.string())
            }))
        }),
        y = async e => {
            var t, r;
            let a, n = m.Url.parse(u.default.thumbnailsApi).getOrThrow().withPath("/v1/batch"),
                i = e.map(e => ({
                    requestId: g(e),
                    type: e.type,
                    targetId: e.targetId,
                    size: e.size ?? p,
                    format: e.format ?? f,
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
                })),
                o = 0;
            return t = (await c.post(n, i, v, {
                credentials: "include",
                headers: {
                    Accept: "application/json"
                },
                retry: (e, t) => {
                    let r = c.defaultBrowserRetryDelay(e, t);
                    return Number.isNaN(r) || (o += 1), r
                }
            })).getOrThrow(), r = o, a = new Map, t.data.forEach(e => {
                let {
                    requestId: t,
                    state: n,
                    imageUrl: i
                } = e;
                "Completed" === n ? a.set(t, null != i ? {
                    state: n,
                    imageUrl: i,
                    transportRetries: r
                } : {
                    state: "Error",
                    transportRetries: r
                }) : a.set(t, null != i ? {
                    state: n,
                    imageUrl: i,
                    transportRetries: r
                } : {
                    state: n,
                    transportRetries: r
                })
            }), a
        }, b = (0, d.batchQuery)({
            delay: 50,
            maxSize: 100
        }, y, (e, t) => e.get(g(t)) ?? {
            state: "Error"
        }), w = new Set(["GameIcon", "GameThumbnail"]), A = async e => {
            let {
                type: r,
                format: a
            } = e, n = w.has(r) ? "webp" : a ?? f;
            return "webp" !== n ? n : await (t ??= new Promise(e => {
                if (void 0 === h.window) return void e(!0);
                let t = new h.window.Image;
                t.onload = () => {
                    e(t.width > 0 && t.height > 0)
                }, t.onerror = () => {
                    e(!1)
                }, t.src = "data:image/webp;base64,UklGRkoAAABXRUJQVlA4WAoAAAAQAAAAAAAAAAAAQUxQSAwAAAARBxAR/Q9ERP8DAABWUDggGAAAABQBAJ0BKgEAAQAAAP4AAA3AAP7mtQAAAA=="
            })) ? "webp" : "png"
        }, I = async e => b({
            ...e,
            format: await A(e)
        });
    e.s(["resolveThumbnail", 0, I], 99213);
    var P = e.i(381111);
    e.s(["Thumbnail2d", 0, e => {
        let {
            targetId: t,
            type: l,
            size: u,
            format: c,
            version: h,
            headShape: d,
            includeBackground: m,
            includeProfileFrame: p,
            altName: f = "",
            imgClassName: g = "",
            containerClassName: v = "",
            onLoad: y
        } = e, b = (0, a.useRef)(Date.now()), w = (0, a.useRef)(0), A = (0, a.useRef)(!1), S = (0, a.useRef)(!1), T = m ?? l?.toLowerCase() === "avatarheadshot", {
            data: k,
            isError: x,
            error: $,
            isPending: _,
            isLoading: E
        } = (0, n.useQuery)({
            queryKey: ["thumbnail-2d", l, t, u, c, h, d, T, p],
            staleTime: 1 / 0,
            retry: s,
            queryFn: async () => {
                let e = await I({
                    type: l,
                    targetId: t,
                    size: u,
                    format: c,
                    version: h,
                    headShape: d,
                    includeBackground: T,
                    includeProfileFrame: p
                });
                if (w.current += e.transportRetries ?? 0, "Pending" === e.state) throw w.current += 1, o;
                return (0, P.shouldSampleMeasurement)() && (0, P.logMeasurement)("ThumbnailStatusCountWebapp", {
                    Status: e.state,
                    ThumbnailType: (0, P.metricThumbnailType)(l)
                }), e
            }
        });
        (0, a.useEffect)(() => {
            b.current = Date.now(), w.current = 0, A.current = !1, S.current = !1
        }, [l, t, u, c, h, d, T, p]), (0, a.useEffect)(() => {
            !A.current && x && $ === o && (A.current = !0, (0, P.shouldSampleMeasurement)() && (0, P.logMeasurement)("ThumbnailTimeoutWebapp", {
                ThumbnailType: (0, P.metricThumbnailType)(l)
            }))
        }, [x, $, l]);
        let R = k?.imageUrl ?? null,
            U = k?.state === "Blocked" ? "icon-blocked" : k?.state === "InReview" ? "icon-in-review" : k?.state === "Error" ? "icon-broken" : x ? $ === o ? "icon-pending" : "icon-broken" : "",
            C = _ ?? E,
            O = ["thumbnail-2d-container float-left overflow-hidden", v, U, C && "thumbnail-2d-loading"].filter(Boolean).join(" ");
        return (0, r.jsxs)("span", {
            className: O,
            children: [C && (0, r.jsx)(i.Skeleton, {
                className: "thumbnail-2d-skeleton",
                variant: "Rectangle",
                width: "100%",
                height: "100%"
            }), null != R && "" !== R && (0, r.jsx)("img", {
                className: ["size-full", g].filter(Boolean).join(" "),
                src: R,
                alt: f,
                onLoad: () => {
                    if (!S.current && k?.state === "Completed") {
                        S.current = !0;
                        let e = (0, P.metricThumbnailType)(l),
                            t = w.current;
                        (0, P.logMeasurement)("ThumbnailLoadDurationWebapp", {
                            Status: "Success",
                            ThumbnailType: e,
                            Value: String(Date.now() - b.current)
                        }), (0, P.logMeasurement)(0 === t ? "ThumbnailNoRetrySuccessWebapp" : "ThumbnailRetryWebapp", 0 === t ? {
                            ThumbnailType: e
                        } : {
                            ThumbnailType: e,
                            Value: String(t)
                        })
                    }
                    y?.()
                }
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
        i = e.i(577896),
        o = e.i(245837),
        s = e.i(371078);
    let l = function() {
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
        u = (e, t) => {
            let r = l(t);
            return (0, s.getAbsoluteUrl)("" === r ? e : `${e}?${r}`)
        },
        c = e => {
            try {
                let {
                    protocol: t
                } = new URL(e);
                return "http:" === t || "https:" === t
            } catch {
                return !1
            }
        };
    e.s(["composeQueryString", 0, l, "getQueryParam", 0, e => n.UrlSearchParams.parse(window.location.search).get(e) ?? void 0, "getUrlWithLocale", 0, (e, t) => t ? u(e, {
        locale: t
    }) : e, "getUrlWithQueries", 0, u, "isValidHttpUrl", 0, c, "isValidStripeCheckoutUrl", 0, e => c(e) && (e.includes("checkout.stripe.com") || e.includes(o.default.stripeCheckoutDomain)), "urlSafetyValidation", 0, e => {
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
        if (!c(t)) return;
        let r = new URL(t),
            {
                hostname: n
            } = r;
        return [o.default.domain, i.defaultRootDomain].some(e => n === e || n.endsWith(`.${e}`)) ? r : void 0
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
    `}).join("&").replace(/%20/g,"+")}`, h = (e, t, r) => {
        let a = ["1", `launchmode:${e.launchMode}`];
        return t && a.push(`gameinfo:${encodeURIComponent(t)}`), a.push(`launchtime:${String(e.launchTime)}`), r && (null != r.userId && a.push("distributorType:Global", `userId:${String(r.userId)}`), a.push(`browser:${r.browser}`)), Object.entries(e.otherParams).forEach(e => {
            let [t, r] = e;
            a.push(t === r ? t : `${t}:${encodeURIComponent(String(r))}`)
        }), `${e.protocolName}:${a.join("+")}`
    };
    e.s(["buildPlaceLauncherUrl", 0, c, "buildProtocolUrl", 0, h, "getProtocolNameForEnvironment", 0, u, "isStudioLaunchMode", 0, s], 200643);
    let d = e => {
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
            a = e.openProtocolUrl ?? d,
            o = e => ({
                launchMethod: "Protocol",
                params: e
            }),
            l = async t => {
                try {
                    let l, u = s(t.launchMode),
                        c = (0, i.resetClientStatus)();
                    e.isAuthenticated() && !u ? [l] = await Promise.all([(0, i.getAuthTicket)(), c]) : await c;
                    let d = u ? {
                        userId: e.isAuthenticated() ? e.getUserId() : null,
                        browser: n()
                    } : void 0;
                    a(h(t, l, d)), e.onLaunchSucceeded(), e.onEvent("startClientSucceeded", o(t)), r.get() && (e.onEvent("successfulInstall", o(t)), r.set(!1))
                } catch (t) {
                    e.onLaunchFailed(t)
                }
            }, m = function(t) {
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
                let h = l(i);
                return e.onLaunchStarted(i, () => l(i)), h
            }, p = (t, r) => {
                let n = () => {
                    a(t)
                };
                e.onLaunchStarted(r, () => (n(), Promise.resolve())), n()
            }, f = (t, r) => c(e.getConfig().placeLauncherUrl, t, e.getBrowserTrackerId(), r), g = t => null == e.onGuestLaunch || e.isAuthenticated() ? t() : (e.onGuestLaunch(), Promise.resolve()), v = (t, r, a) => e.launchInApp?.({
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
            joinMultiplayerGame: (e, t) => g(() => v({
                requestType: "RequestGame",
                placeId: String(e.placeId),
                isPlayTogetherGame: !0 === e.isPlayTogetherGame
            }, e, () => m({
                otherParams: {
                    placelauncherurl: f("RequestGame", e)
                },
                placeId: e.placeId,
                isPlayTogetherGame: !0 === e.isPlayTogetherGame,
                launchData: e.launchData,
                eventId: e.eventId,
                getPlayOnWeb: t
            }))),
            followPlayerIntoGame: e => g(() => v({
                requestType: "RequestFollowUser",
                userId: String(e.userId)
            }, e, () => m({
                otherParams: {
                    placelauncherurl: f("RequestFollowUser", e)
                }
            }))),
            joinGameInstance: (e, t) => g(() => v({
                requestType: "RequestGameJob",
                placeId: String(e.placeId),
                instanceId: e.gameId,
                isPlayTogetherGame: !0 === e.isPlayTogetherGame
            }, e, () => m({
                otherParams: {
                    placelauncherurl: f("RequestGameJob", e)
                },
                placeId: e.placeId,
                isPlayTogetherGame: !0 === e.isPlayTogetherGame,
                getPlayOnWeb: t
            }))),
            joinPrivateGame: (e, t) => v({
                requestType: "RequestPrivateGame",
                placeId: String(e.placeId),
                ...null == e.accessCode ? {} : {
                    accessCode: e.accessCode
                },
                ...null == e.linkCode ? {} : {
                    linkCode: e.linkCode
                }
            }, e, () => m({
                otherParams: {
                    placelauncherurl: f("RequestPrivateGame", e)
                },
                placeId: e.placeId,
                getPlayOnWeb: t
            })),
            playTogetherGame: e => g(() => v({
                requestType: "RequestGame",
                placeId: String(e.placeId),
                conversationId: String(e.conversationId)
            }, e, () => m({
                otherParams: {
                    placelauncherurl: f("RequestPlayTogetherGame", e)
                },
                placeId: e.placeId,
                conversationId: e.conversationId
            }))),
            openStudio: () => m({
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
                return m({
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
                return m({
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
                return m({
                    otherParams: {
                        pluginid: t,
                        avatar: "avatar"
                    }
                }, "plugin")
            },
            startDeepLinkFlow: e => {
                p(e, {})
            },
            startGameWithDeepLinkUrl: (e, t) => {
                p(e, {
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
}, 735697, e => {
    "use strict";
    var t = e.i(245837),
        r = e.i(10224);
    async function a(e) {
        let {
            rankingStrategy: a = "tc_info_boost",
            count: n = 8
        } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, i = Array.isArray(e) ? e : [e];
        if (0 === i.length) return {
            userInsights: []
        };
        let o = {
                url: `${t.default.apiGatewayUrl}/profile-insights-api/v1/multiProfileInsights`,
                retryable: !0,
                withCredentials: !0
            },
            {
                data: s
            } = await r.post(o, {
                userIds: i,
                rankingStrategy: a,
                count: n
            });
        return s
    }
    e.s(["fetchMultiProfileInsights", 0, a])
}]);

//# debugId=88037f4c-8562-d0e2-4dad-9010f6e58815
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0422jc1ikzox5.js.map