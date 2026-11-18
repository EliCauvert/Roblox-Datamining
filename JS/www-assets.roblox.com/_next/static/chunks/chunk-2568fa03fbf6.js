;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "c3a3cdb0-82b8-dbc3-37a8-3bf4ed45226e")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 407175, e => {
    e.q("https://www-assets.roblox.com/_next/static/media/privacyChoices.107knwhsvo2xp.webp")
}, 887524, e => {
    "use strict";
    var t = e.i(491965),
        r = e.i(982249),
        a = e.i(964433),
        n = e.i(7284),
        i = e.i(371847);
    let o = (0, i.forwardRef)((e, o) => {
        let {
            title: l,
            icon: s,
            actionLabel: u,
            onAction: c,
            actions: d,
            onClose: m,
            closeIconAriaLabel: p = "Dismiss snackbar",
            shouldAutoDismiss: f,
            autoDismissDurationMs: h,
            className: g,
            ...v
        } = e, [y, b] = (0, i.useState)("enter"), w = (0, i.useRef)(void 0), P = (0, i.useRef)(void 0), S = (0, i.useRef)(void 0), x = (0, i.useRef)(null), E = d ?? (u && c && i.default.createElement(r.Button, {
            size: "Small",
            variant: "Utility",
            className: "content-inverse-emphasis",
            onClick: c,
            ref: x
        }, u)), C = !!E, I = l.length > 80, R = f ?? !0, _ = 4e3;
        C && (_ = I ? 1e4 : 7e3);
        let O = h ?? _,
            j = (0, i.useCallback)(() => {
                "exit" !== y && (b("exit"), void 0 !== P.current && (window.clearTimeout(P.current), P.current = void 0), S.current = window.setTimeout(() => {
                    m?.()
                }, 150))
            }, [m, y]);
        (0, i.useEffect)(() => (w.current = window.requestAnimationFrame(() => {
            b("idle")
        }), () => {
            void 0 !== w.current && window.cancelAnimationFrame(w.current)
        }), []), (0, i.useEffect)(() => {
            void 0 !== P.current && (window.clearTimeout(P.current), P.current = void 0), R && "exit" !== y && (P.current = window.setTimeout(() => {
                j()
            }, O))
        }, [O, R, y, j]), (0, i.useEffect)(() => {
            C && x.current?.focus()
        }, [C]), (0, i.useEffect)(() => () => {
            void 0 !== P.current && window.clearTimeout(P.current), void 0 !== S.current && window.clearTimeout(S.current), void 0 !== w.current && window.cancelAnimationFrame(w.current)
        }, []);
        let k = {
                position: "fixed",
                left: "50%",
                bottom: "max(var(--padding-xxlarge, 32px), env(safe-area-inset-bottom))",
                transform: `translate(-50%, ${"idle"===y?"0":"120%"})`,
                zIndex: "var(--foundation-portal-zindex, 9999)"
            },
            T = v.style ? {
                ...k,
                ...v.style
            } : k;
        return i.default.createElement("div", {
            ref: o,
            role: "status",
            "aria-live": "polite",
            className: (0, n.default)("flex items-center gap-xxlarge radius-medium shadow-transient-low bg-inverse-surface-0 padding-x-medium padding-y-medium stroke-standard shrink-0", "max-width-[480px] min-height-[48px]", "min-width-[min(100%-max(2_*_var(--margin-small),env(safe-area-inset-left)+env(safe-area-inset-right)),393px)]", "foundation-web-portal-zindex pointer-events-auto", "exit" === y ? "ease-standard-in" : "ease-standard-out", g),
            style: {
                ...T,
                transitionDuration: `${"exit"===y?150:200}ms`,
                transitionProperty: "transform"
            },
            ...v
        }, i.default.createElement("div", {
            className: "flex items-center gap-medium grow-1 basis-0 min-h-[40px]"
        }, s && i.default.createElement(t.Icon, {
            name: s,
            size: "Small",
            className: "shrink-0 content-inverse-emphasis"
        }), i.default.createElement("div", {
            className: "grow-1 basis-0 text-caption-large content-inverse-emphasis text-truncate-end"
        }, l)), i.default.createElement("div", {
            className: "flex items-center justify-end gap-small shrink-0"
        }, E, m && i.default.createElement(a.CloseAffordance, {
            variant: "Utility",
            size: "Small",
            isCircular: !0,
            className: "content-inverse-emphasis",
            "aria-label": p,
            onClick: j
        })))
    });
    e.s(["Snackbar", 0, o])
}, 526005, e => {
    "use strict";
    var t, r, a, n, i, o, l = e.i(371847),
        s = e.i(376054),
        u = e.i(136927),
        c = e.i(550475),
        d = e.i(42297),
        m = e.i(474754),
        p = e.i(51449),
        f = e.i(259864),
        h = e.i(578889),
        g = e.i(766271),
        v = (t = new WeakMap, r = new WeakMap, a = new WeakMap, n = new WeakMap, i = new WeakSet, o = new WeakSet, class extends h.Subscribable {
            bindMethods() {
                this.mutate = this.mutate.bind(this), this.reset = this.reset.bind(this)
            }
            setOptions(e) {
                let r = this.options;
                this.options = (0, s._)(this, t).defaultMutationOptions(e), (0, g.shallowEqualObjects)(this.options, r) || (0, s._)(this, t).getMutationCache().notify({
                    type: "observerOptionsUpdated",
                    mutation: (0, s._)(this, a),
                    observer: this
                }), r?.mutationKey && this.options.mutationKey && (0, g.hashKey)(r.mutationKey) !== (0, g.hashKey)(this.options.mutationKey) ? this.reset() : (0, s._)(this, a)?.state.status === "pending" && (0, s._)(this, a).setOptions(this.options)
            }
            onUnsubscribe() {
                this.hasListeners() || (0, s._)(this, a)?.removeObserver(this)
            }
            onMutationUpdate(e) {
                (0, d._)(this, i, y).call(this), (0, d._)(this, o, b).call(this, e)
            }
            getCurrentResult() {
                return (0, s._)(this, r)
            }
            reset() {
                (0, s._)(this, a)?.removeObserver(this), (0, c._)(this, a, void 0), (0, d._)(this, i, y).call(this), (0, d._)(this, o, b).call(this)
            }
            mutate(e, r) {
                return (0, c._)(this, n, r), (0, s._)(this, a)?.removeObserver(this), (0, c._)(this, a, (0, s._)(this, t).getMutationCache().build((0, s._)(this, t), this.options)), (0, s._)(this, a).addObserver(this), (0, s._)(this, a).execute(e)
            }
            constructor(e, l) {
                super(), (0, m._)(this, i), (0, m._)(this, o), (0, u._)(this, t, {
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
                }), (0, c._)(this, t, e), this.setOptions(l), this.bindMethods(), (0, d._)(this, i, y).call(this)
            }
        });

    function y() {
        let e = (0, s._)(this, a)?.state ?? (0, p.getDefaultState)();
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
        f.notifyManager.batch(() => {
            if ((0, s._)(this, n) && this.hasListeners()) {
                let a = (0, s._)(this, r).variables,
                    i = (0, s._)(this, r).context,
                    o = {
                        client: (0, s._)(this, t),
                        meta: this.options.meta,
                        mutationKey: this.options.mutationKey
                    };
                if (e?.type === "success") {
                    try {
                        (0, s._)(this, n).onSuccess?.(e.data, a, i, o)
                    } catch (e) {
                        Promise.reject(e)
                    }
                    try {
                        (0, s._)(this, n).onSettled?.(e.data, null, a, i, o)
                    } catch (e) {
                        Promise.reject(e)
                    }
                } else if (e?.type === "error") {
                    try {
                        (0, s._)(this, n).onError?.(e.error, a, i, o)
                    } catch (e) {
                        Promise.reject(e)
                    }
                    try {
                        (0, s._)(this, n).onSettled?.(void 0, e.error, a, i, o)
                    } catch (e) {
                        Promise.reject(e)
                    }
                }
            }
            this.listeners.forEach(e => {
                e((0, s._)(this, r))
            })
        })
    }
    var w = e.i(391855);
    e.s(["useMutation", 0, function(e, t) {
        let r = (0, w.useQueryClient)(t),
            [a] = l.useState(() => new v(r, e));
        l.useEffect(() => {
            a.setOptions(e)
        }, [a, e]);
        let n = l.useSyncExternalStore(l.useCallback(e => a.subscribe(f.notifyManager.batchCalls(e)), [a]), () => a.getCurrentResult(), () => a.getCurrentResult()),
            i = l.useCallback((e, t) => {
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
        i = e.i(723941);
    let o = [],
        l = !1,
        s = () => {
            if (l = !1, 0 === o.length) return;
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
        o.length >= a ? s() : l || (l = !0, setTimeout(s, u))
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
                variant: l = "Rectangle",
                isAnimated: s = !0,
                width: u,
                height: c,
                ...d
            } = e, m = "Text" === l, p = "Circle" === l, f = {};
            return m ? (f.height = c ?? "1em", f.width = u ?? "100%") : (void 0 !== u && (f.width = u), void 0 !== c && (f.height = c)), r.default.createElement("div", {
                ref: n,
                "aria-hidden": "true",
                "data-variant": l,
                ...d,
                className: (0, t.default)("relative clip block bg-[var(--color-common-shimmer)]", m && "radius-xsmall", p && "radius-circle", !m && !p && "radius-small", s && a, i),
                style: {
                    ...f,
                    ...o
                }
            })
        });
    n.displayName = "Skeleton", e.s(["Skeleton", 0, n])
}, 599965, 846379, 99213, e => {
    "use strict";
    var t = e.i(809804),
        r = e.i(371847),
        a = e.i(708923),
        n = e.i(773871);
    let i = Error("thumbnail pending"),
        o = (e, t) => t === i && e < 5;
    e.s(["THUMBNAIL_PENDING", 0, i, "retryPendingThumbnail", 0, o], 846379), e.i(350223);
    var l = e.i(874296),
        s = e.i(245837),
        u = e.i(646424),
        c = e.i(734899),
        d = e.i(587541);
    let m = "150x150",
        p = "webp",
        f = e => `${e.type}:${e.targetId}:${e.size??m}:${e.format??p}:${e.version??""}:${e.headShape??""}:${e.includeBackground?"bg":""}:${e.includeProfileFrame?"frame":""}`,
        h = l.object({
            data: l.array(l.object({
                requestId: l.string(),
                state: l.literal(["Completed", "Pending", "Blocked", "Error", "InReview"]),
                imageUrl: l.nullish(l.string())
            }))
        }),
        g = async e => {
            var t;
            let r, a = d.Url.parse(s.default.thumbnailsApi).getOrThrow().withPath("/v1/batch"),
                n = e.map(e => ({
                    requestId: f(e),
                    type: e.type,
                    targetId: e.targetId,
                    size: e.size ?? m,
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
        }, g, (e, t) => e.get(f(t)) ?? {
            state: "Error"
        });
    e.s(["resolveThumbnail", 0, v], 99213);
    var y = e.i(381111);
    e.s(["Thumbnail2d", 0, e => {
        let {
            targetId: l,
            type: s,
            size: u,
            format: c,
            version: d,
            headShape: m,
            includeBackground: p,
            includeProfileFrame: f,
            altName: h = "",
            imgClassName: g = "",
            containerClassName: b = "",
            onLoad: w
        } = e, P = (0, r.useRef)(Date.now()), S = (0, r.useRef)(0), x = (0, r.useRef)(!1), E = p ?? s?.toLowerCase() === "avatarheadshot", {
            data: C,
            isError: I,
            error: R,
            isPending: _,
            isLoading: O
        } = (0, a.useQuery)({
            queryKey: ["thumbnail-2d", s, l, u, c, d, m, E, f],
            staleTime: 1 / 0,
            retry: o,
            queryFn: async () => {
                let e = await v({
                    type: s,
                    targetId: l,
                    size: u,
                    format: c,
                    version: d,
                    headShape: m,
                    includeBackground: E,
                    includeProfileFrame: f
                });
                if ("Pending" === e.state) throw S.current += 1, i;
                return e
            }
        });
        (0, r.useEffect)(() => {
            P.current = Date.now(), S.current = 0, x.current = !1
        }, [s, l, u, c, d, m, E, f]), (0, r.useEffect)(() => {
            if (x.current) return;
            let e = `${s}_2d`;
            if (C) {
                if (x.current = !0, (0, y.logMeasurement)("ThumbnailStatusCountWebapp", {
                        Status: C.state,
                        ThumbnailType: e
                    }), "Completed" === C.state) {
                    let t = S.current;
                    (0, y.logMeasurement)("ThumbnailLoadDurationWebapp", {
                        Status: "Success",
                        ThumbnailType: e,
                        Value: String(Date.now() - P.current)
                    }), (0, y.logMeasurement)(0 === t ? "ThumbnailNoRetrySuccessWebapp" : "ThumbnailRetryWebapp", 0 === t ? {
                        ThumbnailType: e
                    } : {
                        ThumbnailType: e,
                        Value: String(t)
                    })
                }
            } else I && R === i && (x.current = !0, (0, y.logMeasurement)("ThumbnailTimeoutWebapp", {
                ThumbnailType: e
            }))
        }, [C, I, R, s]);
        let j = C?.imageUrl ?? null,
            k = C?.state === "Blocked" ? "icon-blocked" : C?.state === "InReview" ? "icon-in-review" : C?.state === "Error" ? "icon-broken" : I ? R === i ? "icon-pending" : "icon-broken" : "",
            T = _ ?? O,
            A = ["thumbnail-2d-container float-left overflow-hidden", b, k, T && "thumbnail-2d-loading"].filter(Boolean).join(" ");
        return (0, t.jsxs)("span", {
            className: A,
            children: [T && (0, t.jsx)(n.Skeleton, {
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
            } = a.groups, l = n.split(";");
            o = r ? "" : o;
            let s = !1;
            "base64" === l[l.length - 1] && (l.pop(), s = !0);
            let u = l.shift()?.toLowerCase() ?? "",
                c = [...l.map(e => {
                    let [t, r = ""] = e.split("=").map(e => e.trim());
                    return "charset" === t && "us-ascii" === (r = r.toLowerCase()) ? "" : `${t}${r?`=${r}`:""}`
                }).filter(Boolean)];
            return s && c.push("base64"), (c.length > 0 || u && "text/plain" !== u) && c.unshift(u), `data:${c.join(";")},${s?i.trim():i}${o?`#${o}`:""}`
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
        l = e.i(371078);
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
        u = (e, t) => {
            let r = s(t);
            return (0, l.getAbsoluteUrl)("" === r ? e : `${e}?${r}`)
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
    e.s(["composeQueryString", 0, s, "getQueryParam", 0, e => n.UrlSearchParams.parse(window.location.search).get(e) ?? void 0, "getUrlWithLocale", 0, (e, t) => t ? u(e, {
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
    let l = e => "play" !== e,
        s = ["sitetest1.robloxlabs.com", "sitetest2.robloxlabs.com", "sitetest3.robloxlabs.com"],
        u = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : o.default.domain;
            return s.includes(t) ? `${e}-${t.split(".")[0]}` : e
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
    e.s(["buildPlaceLauncherUrl", 0, c, "buildProtocolUrl", 0, d, "getProtocolNameForEnvironment", 0, u, "isStudioLaunchMode", 0, l], 200643);
    let m = e => {
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
            a = e.openProtocolUrl ?? m,
            o = e => ({
                launchMethod: "Protocol",
                params: e
            }),
            s = async t => {
                try {
                    let s, u = l(t.launchMode),
                        c = (0, i.resetClientStatus)();
                    e.isAuthenticated() && !u ? [s] = await Promise.all([(0, i.getAuthTicket)(), c]) : await c;
                    let m = u ? {
                        userId: e.isAuthenticated() ? e.getUserId() : null,
                        browser: n()
                    } : void 0;
                    a(d(t, s, m)), e.onLaunchSucceeded(), e.onEvent("startClientSucceeded", o(t)), r.get() && (e.onEvent("successfulInstall", o(t)), r.set(!1))
                } catch (t) {
                    e.onLaunchFailed(t)
                }
            }, p = function(t) {
                let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "play",
                    a = e.getConfig(),
                    n = l(r),
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
                let d = s(i);
                return e.onLaunchStarted(i, () => s(i)), d
            }, f = (t, r) => {
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
            joinMultiplayerGame: (e, t) => g(() => v({
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
                eventId: e.eventId,
                getPlayOnWeb: t
            }))),
            followPlayerIntoGame: e => g(() => v({
                requestType: "RequestFollowUser",
                userId: String(e.userId)
            }, e, () => p({
                otherParams: {
                    placelauncherurl: h("RequestFollowUser", e)
                }
            }))),
            joinGameInstance: (e, t) => g(() => v({
                requestType: "RequestGameJob",
                placeId: String(e.placeId),
                instanceId: e.gameId,
                isPlayTogetherGame: !0 === e.isPlayTogetherGame
            }, e, () => p({
                otherParams: {
                    placelauncherurl: h("RequestGameJob", e)
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
            }, e, () => p({
                otherParams: {
                    placelauncherurl: h("RequestPrivateGame", e)
                },
                placeId: e.placeId,
                getPlayOnWeb: t
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
                f(e, {})
            },
            startGameWithDeepLinkUrl: (e, t) => {
                f(e, {
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
                data: l
            } = await r.post(o, {
                userIds: i,
                rankingStrategy: a,
                count: n
            });
        return l
    }
    e.s(["fetchMultiProfileInsights", 0, a])
}, 713639, e => {
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
    var t = e.i(371847),
        r = e.i(713639),
        a = e.i(682877),
        n = e.i(61907);
    e.s(["useTranslations", 0, e => {
        let i = (0, r.useTranslations)((0, n.fromPeriodToColonDelimited)(e));
        return (0, t.useMemo)(() => (0, a.adaptTranslator)(i, e), [i, e])
    }, "useTranslationsInternal", 0, () => (0, r.useTranslations)()])
}, 959491, e => {
    "use strict";
    var t = e.i(7284),
        r = e.i(371847);
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
                className: l,
                children: s,
                ...u
            } = e;
            return r.default.createElement("span", {
                ref: n,
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.default)("grow-0 shrink-0 basis-auto icon", i, a[o], l),
                ...u
            })
        });
    n.displayName = "Icon", e.s(["Icon", 0, n])
}, 922353, e => {
    "use strict";
    var t = e.i(371847);

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
}, 808558, e => {
    "use strict";
    var t = e.i(7284),
        r = e.i(371847);
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
    var n = e.i(371847),
        i = e.i(922353),
        o = e.i(809804),
        l = Symbol.for("react.lazy"),
        s = n[" use ".trim().toString()];

    function u(e) {
        var t;
        return null != e && "object" == typeof e && "$$typeof" in e && e.$$typeof === l && "_payload" in e && "object" == typeof(t = e._payload) && null !== t && "then" in t
    }
    var c = ((a = n.forwardRef((e, t) => {
            let {
                children: r,
                ...a
            } = e;
            if (u(r) && "function" == typeof s && (r = s(r._payload)), n.isValidElement(r)) {
                var o;
                let e, l, s = (o = r, (l = (e = Object.getOwnPropertyDescriptor(o.props, "ref")?.get) && "isReactWarning" in e && e.isReactWarning) ? o.ref : (l = (e = Object.getOwnPropertyDescriptor(o, "ref")?.get) && "isReactWarning" in e && e.isReactWarning) ? o.props.ref : o.props.ref || o.ref),
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
                return r.type !== n.Fragment && (u.ref = t ? (0, i.composeRefs)(t, s) : s), n.cloneElement(r, u)
            }
            return n.Children.count(r) > 1 ? n.Children.only(null) : null
        })).displayName = "Slot.SlotClone", t = a, (r = n.forwardRef((e, r) => {
            let {
                children: a,
                ...i
            } = e;
            u(a) && "function" == typeof s && (a = s(a._payload));
            let l = n.Children.toArray(a),
                c = l.find(m);
            if (c) {
                let e = c.props.children,
                    a = l.map(t => t !== c ? t : n.Children.count(e) > 1 ? n.Children.only(null) : n.isValidElement(e) ? e.props.children : null);
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

    function m(e) {
        return n.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === d
    }
    e.s(["Slot", 0, c])
}, 7312, e => {
    "use strict";
    e.s(["disabledOpacity", 0, "opacity-[0.5]"])
}, 69134, e => {
    "use strict";
    var t = e.i(808558),
        r = e.i(7312),
        a = e.i(371847);
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
    var i = e.i(959491),
        o = e.i(7284),
        l = e.i(493739);
    let s = {
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
        m = (0, a.forwardRef)((e, m) => {
            let {
                children: p,
                className: f,
                style: h,
                isDisabled: g = !1,
                isLoading: v = !1,
                icon: y,
                size: b = "Large",
                variant: w = "Emphasis",
                asChild: P,
                ...S
            } = e, x = (0, o.default)("foundation-web-button", g ? r.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", u[b], g ? d[w] : c[w], f), E = {
                textDecoration: "none",
                ...h
            }, C = e => a.default.createElement(a.default.Fragment, null, a.default.createElement(t.StateLayer, null), v && a.default.createElement("div", {
                "aria-hidden": "true",
                className: "absolute flex"
            }, a.default.createElement(n, {
                width: s[b],
                height: s[b]
            })), a.default.createElement("span", {
                className: (0, o.default)("flex items-center min-width-0", "Large" === b || "Medium" === b ? "gap-small" : "gap-xsmall", v && "invisible")
            }, y && a.default.createElement(i.Icon, {
                name: y,
                size: b
            }), a.default.createElement("span", {
                className: "padding-y-xsmall text-truncate-end text-no-wrap"
            }, e)));
            if (P) {
                let {
                    as: e,
                    ...t
                } = S, r = a.default.Children.only(p);
                return a.default.createElement(l.Slot, {
                    ref: m,
                    ...t,
                    className: x,
                    style: E,
                    "aria-disabled": g || void 0
                }, a.default.cloneElement(r, {}, C(r.props.children)))
            }
            if ("a" === S.as) {
                let {
                    as: e,
                    href: t,
                    ...r
                } = S;
                return a.default.createElement("a", {
                    ref: m,
                    ...r,
                    "aria-disabled": g,
                    href: g ? void 0 : t,
                    className: x,
                    style: E
                }, C(p))
            }
            let {
                as: I,
                ...R
            } = S;
            return a.default.createElement("button", {
                ref: m,
                type: "button",
                ...R,
                disabled: g,
                className: x,
                style: E
            }, C(p))
        });
    e.s(["Button", 0, m], 69134)
}, 389784, e => {
    "use strict";
    var t = e.i(371847),
        r = e.i(922353),
        a = e.i(18731),
        n = e => {
            var n;
            let o, l, {
                    present: s,
                    children: u
                } = e,
                c = function(e) {
                    var r, n;
                    let [o, l] = t.useState(), s = t.useRef({}), u = t.useRef(e), c = t.useRef("none"), [d, m] = (r = e ? "mounted" : "unmounted", n = {
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
                        let e = i(s.current);
                        c.current = "mounted" === d ? e : "none"
                    }, [d]), (0, a.useLayoutEffect)(() => {
                        let t = s.current,
                            r = u.current;
                        if (r !== e) {
                            let a = c.current,
                                n = i(t);
                            e ? m("MOUNT") : "none" === n || t?.display === "none" ? m("UNMOUNT") : r && a !== n ? m("ANIMATION_OUT") : m("UNMOUNT"), u.current = e
                        }
                    }, [e, m]), (0, a.useLayoutEffect)(() => {
                        if (o) {
                            let e, t = o.ownerDocument.defaultView ?? window,
                                r = r => {
                                    let a = i(s.current).includes(r.animationName);
                                    if (r.target === o && a && (m("ANIMATION_END"), !u.current)) {
                                        let r = o.style.animationFillMode;
                                        o.style.animationFillMode = "forwards", e = t.setTimeout(() => {
                                            "forwards" === o.style.animationFillMode && (o.style.animationFillMode = r)
                                        })
                                    }
                                },
                                a = e => {
                                    e.target === o && (c.current = i(s.current))
                                };
                            return o.addEventListener("animationstart", a), o.addEventListener("animationcancel", r), o.addEventListener("animationend", r), () => {
                                t.clearTimeout(e), o.removeEventListener("animationstart", a), o.removeEventListener("animationcancel", r), o.removeEventListener("animationend", r)
                            }
                        }
                        m("ANIMATION_END")
                    }, [o, m]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: t.useCallback(e => {
                            e && (s.current = getComputedStyle(e)), l(e)
                        }, [])
                    }
                }(s),
                d = "function" == typeof u ? u({
                    present: c.isPresent
                }) : t.Children.only(u),
                m = (0, r.useComposedRefs)(c.ref, (n = d, (l = (o = Object.getOwnPropertyDescriptor(n.props, "ref")?.get) && "isReactWarning" in o && o.isReactWarning) ? n.ref : (l = (o = Object.getOwnPropertyDescriptor(n, "ref")?.get) && "isReactWarning" in o && o.isReactWarning) ? n.props.ref : n.props.ref || n.ref));
            return "function" == typeof u || c.isPresent ? t.cloneElement(d, {
                ref: m
            }) : null
        };

    function i(e) {
        return e?.animationName || "none"
    }
    n.displayName = "Presence", e.s(["Presence", 0, n])
}, 386650, 217061, e => {
    "use strict";
    var t = e.i(808558),
        r = e.i(959491),
        a = e.i(7284),
        n = e.i(371847);
    let i = {
            Small: "padding-xsmall",
            Medium: "padding-small",
            Large: "padding-small"
        },
        o = {
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-100"
        },
        l = e => {
            let {
                variant: l,
                size: s,
                isCircular: u,
                className: c,
                ...d
            } = e;
            return n.default.createElement("button", {
                type: "button",
                className: (0, a.default)("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", t.interactable, o[l], i[s], u && "radius-circle", c),
                ...d
            }, n.default.createElement(t.StateLayer, null), n.default.createElement(r.Icon, {
                name: "icon-regular-x",
                size: s
            }))
        };
    e.s(["CloseAffordance", 0, l], 217061);
    var s = e.i(775453),
        u = e.i(922353),
        c = e.i(9413),
        d = e.i(411207),
        m = e.i(584537),
        p = e.i(783660),
        f = e.i(721988),
        h = e.i(199794),
        g = e.i(389784),
        v = e.i(158051),
        y = e.i(634918),
        b = e.i(700312),
        w = e.i(73772),
        P = e.i(178511),
        S = e.i(809804),
        x = "Dialog",
        [E, C] = (0, c.createContextScope)(x),
        [I, R] = E(x),
        _ = e => {
            let {
                __scopeDialog: t,
                children: r,
                open: a,
                defaultOpen: i,
                onOpenChange: o,
                modal: l = !0
            } = e, s = n.useRef(null), u = n.useRef(null), [c = !1, p] = (0, m.useControllableState)({
                prop: a,
                defaultProp: i,
                onChange: o
            });
            return (0, S.jsx)(I, {
                scope: t,
                triggerRef: s,
                contentRef: u,
                contentId: (0, d.useId)(),
                titleId: (0, d.useId)(),
                descriptionId: (0, d.useId)(),
                open: c,
                onOpenChange: p,
                onOpenToggle: n.useCallback(() => p(e => !e), [p]),
                modal: l,
                children: r
            })
        };
    _.displayName = x;
    var O = "DialogTrigger";
    n.forwardRef((e, t) => {
        let {
            __scopeDialog: r,
            ...a
        } = e, n = R(O, r), i = (0, u.useComposedRefs)(t, n.triggerRef);
        return (0, S.jsx)(v.Primitive.button, {
            type: "button",
            "aria-haspopup": "dialog",
            "aria-expanded": n.open,
            "aria-controls": n.contentId,
            "data-state": V(n.open),
            ...a,
            ref: i,
            onClick: (0, s.composeEventHandlers)(e.onClick, n.onOpenToggle)
        })
    }).displayName = O;
    var j = "DialogPortal",
        [k, T] = E(j, {
            forceMount: void 0
        }),
        A = e => {
            let {
                __scopeDialog: t,
                forceMount: r,
                children: a,
                container: i
            } = e, o = R(j, t);
            return (0, S.jsx)(k, {
                scope: t,
                forceMount: r,
                children: n.Children.map(a, e => (0, S.jsx)(g.Presence, {
                    present: r || o.open,
                    children: (0, S.jsx)(h.Portal, {
                        asChild: !0,
                        container: i,
                        children: e
                    })
                }))
            })
        };
    A.displayName = j;
    var N = "DialogOverlay",
        D = n.forwardRef((e, t) => {
            let r = T(N, e.__scopeDialog),
                {
                    forceMount: a = r.forceMount,
                    ...n
                } = e,
                i = R(N, e.__scopeDialog);
            return i.modal ? (0, S.jsx)(g.Presence, {
                present: a || i.open,
                children: (0, S.jsx)(U, {
                    ...n,
                    ref: t
                })
            }) : null
        });
    D.displayName = N;
    var M = (0, P.createSlot)("DialogOverlay.RemoveScroll"),
        U = n.forwardRef((e, t) => {
            let {
                __scopeDialog: r,
                ...a
            } = e, n = R(N, r);
            return (0, S.jsx)(b.RemoveScroll, {
                as: M,
                allowPinchZoom: !0,
                shards: [n.contentRef],
                children: (0, S.jsx)(v.Primitive.div, {
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
        L = "DialogContent",
        z = n.forwardRef((e, t) => {
            let r = T(L, e.__scopeDialog),
                {
                    forceMount: a = r.forceMount,
                    ...n
                } = e,
                i = R(L, e.__scopeDialog);
            return (0, S.jsx)(g.Presence, {
                present: a || i.open,
                children: i.modal ? (0, S.jsx)($, {
                    ...n,
                    ref: t
                }) : (0, S.jsx)(F, {
                    ...n,
                    ref: t
                })
            })
        });
    z.displayName = L;
    var $ = n.forwardRef((e, t) => {
            let r = R(L, e.__scopeDialog),
                a = n.useRef(null),
                i = (0, u.useComposedRefs)(t, r.contentRef, a);
            return n.useEffect(() => {
                let e = a.current;
                if (e) return (0, w.hideOthers)(e)
            }, []), (0, S.jsx)(W, {
                ...e,
                ref: i,
                trapFocus: r.open,
                disableOutsidePointerEvents: !0,
                onCloseAutoFocus: (0, s.composeEventHandlers)(e.onCloseAutoFocus, e => {
                    e.preventDefault(), r.triggerRef.current?.focus()
                }),
                onPointerDownOutside: (0, s.composeEventHandlers)(e.onPointerDownOutside, e => {
                    let t = e.detail.originalEvent,
                        r = 0 === t.button && !0 === t.ctrlKey;
                    (2 === t.button || r) && e.preventDefault()
                }),
                onFocusOutside: (0, s.composeEventHandlers)(e.onFocusOutside, e => e.preventDefault())
            })
        }),
        F = n.forwardRef((e, t) => {
            let r = R(L, e.__scopeDialog),
                a = n.useRef(!1),
                i = n.useRef(!1);
            return (0, S.jsx)(W, {
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
        W = n.forwardRef((e, t) => {
            let {
                __scopeDialog: r,
                trapFocus: a,
                onOpenAutoFocus: i,
                onCloseAutoFocus: o,
                ...l
            } = e, s = R(L, r), c = n.useRef(null), d = (0, u.useComposedRefs)(t, c);
            return (0, y.useFocusGuards)(), (0, S.jsxs)(S.Fragment, {
                children: [(0, S.jsx)(f.FocusScope, {
                    asChild: !0,
                    loop: !0,
                    trapped: a,
                    onMountAutoFocus: i,
                    onUnmountAutoFocus: o,
                    children: (0, S.jsx)(p.DismissableLayer, {
                        role: "dialog",
                        id: s.contentId,
                        "aria-describedby": s.descriptionId,
                        "aria-labelledby": s.titleId,
                        "data-state": V(s.open),
                        ...l,
                        ref: d,
                        onDismiss: () => s.onOpenChange(!1)
                    })
                }), (0, S.jsxs)(S.Fragment, {
                    children: [(0, S.jsx)(Z, {
                        titleId: s.titleId
                    }), (0, S.jsx)(Y, {
                        contentRef: c,
                        descriptionId: s.descriptionId
                    })]
                })]
            })
        }),
        G = "DialogTitle",
        B = n.forwardRef((e, t) => {
            let {
                __scopeDialog: r,
                ...a
            } = e, n = R(G, r);
            return (0, S.jsx)(v.Primitive.h2, {
                id: n.titleId,
                ...a,
                ref: t
            })
        });
    B.displayName = G;
    var q = "DialogDescription";
    n.forwardRef((e, t) => {
        let {
            __scopeDialog: r,
            ...a
        } = e, n = R(q, r);
        return (0, S.jsx)(v.Primitive.p, {
            id: n.descriptionId,
            ...a,
            ref: t
        })
    }).displayName = q;
    var H = "DialogClose",
        Q = n.forwardRef((e, t) => {
            let {
                __scopeDialog: r,
                ...a
            } = e, n = R(H, r);
            return (0, S.jsx)(v.Primitive.button, {
                type: "button",
                ...a,
                ref: t,
                onClick: (0, s.composeEventHandlers)(e.onClick, () => n.onOpenChange(!1))
            })
        });

    function V(e) {
        return e ? "open" : "closed"
    }
    Q.displayName = H;
    var X = "DialogTitleWarning",
        [K, J] = (0, c.createContext)(X, {
            contentName: L,
            titleName: G,
            docsSlug: "dialog"
        }),
        Z = e => {
            let {
                titleId: t
            } = e, r = J(X), a = `\`${r.contentName}\` requires a \`${r.titleName}\` for the component to be accessible for screen reader users.

If you want to hide the \`${r.titleName}\`, you can wrap it with our VisuallyHidden component.

For more information, see https://radix-ui.com/primitives/docs/components/${r.docsSlug}`;
            return n.useEffect(() => {
                t && (document.getElementById(t) || console.error(a))
            }, [a, t]), null
        },
        Y = e => {
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
        er = n.forwardRef((e, t) => (0, S.jsx)(ee.Primitive.span, {
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
        el = {
            Small: "padding-bottom-large",
            Medium: "padding-bottom-xlarge",
            Large: "padding-bottom-xlarge"
        },
        es = e => {
            let {
                open: t,
                onOpenChange: r,
                children: a,
                size: i,
                type: o = "Default",
                isModal: l,
                hasCloseAffordance: s,
                closeLabel: u,
                hasMarginTop: c = !0,
                hasMarginBottom: d = !0,
                hasDescription: m = !1,
                experimentalDisablePointerEventsStylingOnBody: p = !1
            } = e, f = (0, n.useMemo)(() => ({
                size: i,
                isModal: l,
                type: o,
                hasCloseAffordance: s,
                closeLabel: u,
                hasMarginTop: c,
                hasMarginBottom: d,
                hasDescription: m
            }), [i, l, o, s, u, c, d, m]);
            return (0, n.useEffect)(() => {
                p && setTimeout(() => {
                    Object.assign(document.body.style, {
                        pointerEvents: "unset"
                    })
                }, 0)
            }, [p, t]), n.default.createElement(ea.Provider, {
                value: f
            }, n.default.createElement(_, {
                open: t,
                onOpenChange: r
            }, a))
        };
    es.displayName = "Dialog";
    let eu = e => {
        let {
            children: t,
            className: r,
            style: i,
            overlayClassName: o,
            overlayStyle: s,
            onOpenAutoFocus: u,
            ...c
        } = e, {
            size: d,
            isModal: m,
            hasCloseAffordance: p,
            closeLabel: f,
            hasDescription: h
        } = en(), g = (0, a.default)("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", m && "bg-common-backdrop", o), v = (0, a.default)("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
        return n.default.createElement(A, null, n.default.createElement(D, {
            className: g,
            style: s
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
        }, n.default.createElement(l, {
            variant: "OverMedia",
            size: d,
            isCircular: !0,
            "aria-label": f
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
            hasMarginTop: l,
            hasMarginBottom: s
        } = en(), u = (0, a.default)(ei[o], l && eo[o], s && el[o], r);
        return n.default.createElement("div", {
            className: u,
            ...i
        }, t)
    };
    ed.displayName = "DialogBody";
    let em = e => {
        let {
            children: t,
            className: r,
            hidden: a,
            ...i
        } = e, o = n.default.createElement(B, {
            className: r,
            ...i
        }, t);
        return a ? n.default.createElement(er, null, o) : o
    };
    em.displayName = "DialogTitle";
    let ep = e => {
        let {
            children: t,
            className: r,
            ...i
        } = e, {
            size: o
        } = en(), l = (0, a.default)(ei[o], el[o], r);
        return n.default.createElement("div", {
            className: l,
            ...i
        }, t)
    };
    ep.displayName = "DialogFooter", e.s(["Dialog", 0, es, "DialogBody", 0, ed, "DialogContent", 0, eu, "DialogFooter", 0, ep, "DialogHeroMedia", 0, ec, "DialogTitle", 0, em], 386650)
}, 418568, e => {
    "use strict";
    var t = e.i(646424),
        r = e.i(519003);
    e.i(350223);
    var a = e.i(874296);
    let n = a.object({
        gpcVersion: a.number(),
        cooldownPeriodInMs: a.number(),
        cooldownPeriodFuzzyInMs: a.number()
    });
    e.s(["getGlobalPrivacyControlPolicy", 0, () => t.get((0, r.getPageBaseUrls)().apiGateway.withPath("/guac-v2/v1/bundles/user-settings-global-privacy-control-policy"), n), "postGlobalPrivacyControl", 0, () => t.postUntyped((0, r.getPageBaseUrls)().apiGateway.withPath("/user-settings-api/v1/user-settings/gpc"), "", {
        credentials: "include"
    })], 418568)
}, 233971, e => {
    "use strict";
    var t = e.i(360702),
        r = e.i(646424),
        a = e.i(519003),
        n = e.i(418568);
    e.s(["getIsYourPrivacyChoicesModalEnabled", 0, () => r.getUntyped((0, a.getPageBaseUrls)().apiGateway.withPath("/guac-v2/v1/bundles/footer-ui"), {
        credentials: "include"
    }).map(e => null != e && "object" == typeof e && !Array.isArray(e) && !0 === e.IsPrivacyChoiceModalEnabled), "getModalData", 0, e => {
        let i = !0 === window.navigator.globalPrivacyControl;
        return null == e ? (0, t.okAsync)({
            isGpcEnabled: i,
            canUserManageAdsSettings: !1,
            isAdsSellShareDataEnabled: !1
        }) : (0, n.postGlobalPrivacyControl)().andThen(() => {
            let e;
            return t.AsyncResult.all([r.getUntyped((0, a.getPageBaseUrls)().apiGateway.withPath("/user-settings-api/v1/user-settings"), {
                credentials: "include"
            }).map(e => null != e && "object" == typeof e && !Array.isArray(e) && "Enabled" === e.allowSellShareData), (e = (0, a.getPageBaseUrls)().apiGateway.withPath("/access-management/v1/upsell-feature-access").withSearchParams({
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
}, 548835, e => {
    "use strict";
    e.i(350223);
    var t = e.i(874296),
        r = e.i(245837),
        a = e.i(646424),
        n = e.i(723941),
        i = e.i(587541);
    let o = (e, t) => i.Url.parse(`${e.replace(/\/+$/,"")}${t}`).getOrThrow(),
        l = t.object({
            status: t.string()
        }),
        s = ["Unknown", "BootstrapperInstalling", "AppStarted", "AcquiringGame", "JoiningGame", "InGame", "LeftGame"],
        u = async () => {
            let {
                status: e
            } = (await a.get(o(r.default.matchmakingApi, "/v1/client-status"), l, {
                credentials: "include"
            })).getOrThrow();
            return s.find(t => t === e) ?? "Unknown"
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
        l = e.i(587541),
        s = e.i(245837),
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
                let t = await o.fetch(l.Url.parse(s.default.apiGatewayUrl).getOrThrow().withPath("/deferred-deep-link/token-api/create-token"), {
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
    var m = e.i(309937),
        p = e.i(270784),
        f = e.i(548835);
    let h = async () => ({
        authTicket: null != (0, m.authenticatedUser)() ? await (0, f.getAuthTicket)() : void 0,
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
}, 798047, (e, t, r) => {
    "use strict";

    function a(e) {
        let {
            widthInt: t,
            heightInt: r,
            blurWidth: a,
            blurHeight: n,
            blurDataURL: i,
            objectFit: o
        } = e, l = a ? 40 * a : t, s = n ? 40 * n : r, u = l && s ? `viewBox='0 0 ${l} ${s}'` : "";
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
}, 811526, (e, t, r) => {
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
}, 761805, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "getImgProps", {
        enumerable: !0,
        get: function() {
            return u
        }
    }), e.r(324668);
    let a = e.r(61509),
        n = e.r(798047),
        i = e.r(811526),
        o = ["-moz-initial", "fill", "none", "scale-down", void 0];

    function l(e) {
        return void 0 !== e.default
    }

    function s(e) {
        return void 0 === e ? e : "number" == typeof e ? Number.isFinite(e) ? e : NaN : "string" == typeof e && /^[0-9]+$/.test(e) ? parseInt(e, 10) : NaN
    }

    function u(e, t) {
        var r;
        let u, c, d, {
                src: m,
                sizes: p,
                unoptimized: f = !1,
                priority: h = !1,
                preload: g = !1,
                loading: v,
                className: y,
                quality: b,
                width: w,
                height: P,
                fill: S = !1,
                style: x,
                overrideSrc: E,
                onLoad: C,
                onLoadingComplete: I,
                placeholder: R = "empty",
                blurDataURL: _,
                fetchPriority: O,
                decoding: j = "async",
                layout: k,
                objectFit: T,
                objectPosition: A,
                lazyBoundary: N,
                lazyRoot: D,
                ...M
            } = e,
            {
                imgConf: U,
                showAltText: L,
                blurComplete: z,
                defaultLoader: $
            } = t,
            F = U || i.imageConfigDefault;
        if ("allSizes" in F) u = F;
        else {
            let e = [...F.deviceSizes, ...F.imageSizes].sort((e, t) => e - t),
                t = F.deviceSizes.sort((e, t) => e - t),
                r = F.qualities?.sort((e, t) => e - t);
            u = {
                ...F,
                allSizes: e,
                deviceSizes: t,
                qualities: r
            }
        }
        if (void 0 === $) throw Object.defineProperty(Error("images.loaderFile detected but the file is missing default export.\nRead more: https://nextjs.org/docs/messages/invalid-images-config"), "__NEXT_ERROR_CODE", {
            value: "E163",
            enumerable: !1,
            configurable: !0
        });
        let W = M.loader || $;
        delete M.loader, delete M.srcSet;
        let G = "__next_img_default" in W;
        if (G) {
            if ("custom" === u.loader) throw Object.defineProperty(Error(`Image with src "${m}" is missing "loader" prop.
Read more: https://nextjs.org/docs/messages/next-image-missing-loader`), "__NEXT_ERROR_CODE", {
                value: "E252",
                enumerable: !1,
                configurable: !0
            })
        } else {
            let e = W;
            W = t => {
                let {
                    config: r,
                    ...a
                } = t;
                return e(a)
            }
        }
        if (k) {
            "fill" === k && (S = !0);
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
            e && (x = {
                ...x,
                ...e
            });
            let t = {
                responsive: "100vw",
                fill: "100vw"
            } [k];
            t && !p && (p = t)
        }
        let B = "",
            q = s(w),
            H = s(P);
        if ((r = m) && "object" == typeof r && (l(r) || void 0 !== r.src)) {
            let e = l(m) ? m.default : m;
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
            if (c = e.blurWidth, d = e.blurHeight, _ = _ || e.blurDataURL, B = e.src, !S)
                if (q || H) {
                    if (q && !H) {
                        let t = q / e.width;
                        H = Math.round(e.height * t)
                    } else if (!q && H) {
                        let t = H / e.height;
                        q = Math.round(e.width * t)
                    }
                } else q = e.width, H = e.height
        }
        let Q = !h && !g && ("lazy" === v || void 0 === v);
        (!(m = "string" == typeof m ? m : B) || m.startsWith("data:") || m.startsWith("blob:")) && (f = !0, Q = !1), u.unoptimized && (f = !0), G && !u.dangerouslyAllowSVG && m.split("?", 1)[0].endsWith(".svg") && (f = !0);
        let V = s(b),
            X = Object.assign(S ? {
                position: "absolute",
                height: "100%",
                width: "100%",
                left: 0,
                top: 0,
                right: 0,
                bottom: 0,
                objectFit: T,
                objectPosition: A
            } : {}, L ? {} : {
                color: "transparent"
            }, x),
            K = z || "empty" === R ? null : "blur" === R ? `url("data:image/svg+xml;charset=utf-8,${(0,n.getImageBlurSvg)({widthInt:q,heightInt:H,blurWidth:c,blurHeight:d,blurDataURL:_||"",objectFit:X.objectFit})}")` : `url("${R}")`,
            J = o.includes(X.objectFit) ? "fill" === X.objectFit ? "100% 100%" : "cover" : X.objectFit,
            Z = K ? {
                backgroundSize: J,
                backgroundPosition: X.objectPosition || "50% 50%",
                backgroundRepeat: "no-repeat",
                backgroundImage: K
            } : {},
            Y = function(e) {
                let {
                    config: t,
                    src: r,
                    unoptimized: n,
                    width: i,
                    quality: o,
                    sizes: l,
                    loader: s
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
                }(t, i, l), d = u.length - 1;
                return {
                    sizes: l || "w" !== c ? l : "100vw",
                    srcSet: u.map((e, a) => `${s({config:t,src:r,quality:o,width:e})} ${"w"===c?e:a+1}${c}`).join(", "),
                    src: s({
                        config: t,
                        src: r,
                        quality: o,
                        width: u[d]
                    })
                }
            }({
                config: u,
                src: m,
                unoptimized: f,
                width: q,
                quality: V,
                sizes: p,
                loader: W
            }),
            ee = Q ? "lazy" : v;
        return {
            props: {
                ...M,
                loading: ee,
                fetchPriority: O,
                width: q,
                height: H,
                decoding: j,
                className: y,
                style: {
                    ...X,
                    ...Z
                },
                sizes: Y.sizes,
                srcSet: Y.srcSet,
                src: E || Y.src
            },
            meta: {
                unoptimized: f,
                preload: g || h,
                placeholder: R,
                fill: S
            }
        }
    }
}, 396611, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "default", {
        enumerable: !0,
        get: function() {
            return l
        }
    });
    let a = e.r(371847),
        n = "u" < typeof window,
        i = n ? () => {} : a.useLayoutEffect,
        o = n ? () => {} : a.useEffect;

    function l(e) {
        let {
            headManager: t,
            reduceComponentsToState: r
        } = e;

        function l() {
            if (t && t.mountedInstances) {
                let e = a.Children.toArray(Array.from(t.mountedInstances).filter(Boolean));
                t.updateHead(r(e))
            }
        }
        return n && (t?.mountedInstances?.add(e.children), l()), i(() => (t?.mountedInstances?.add(e.children), () => {
            t?.mountedInstances?.delete(e.children)
        })), i(() => (t && (t._pendingUpdate = l), () => {
            t && (t._pendingUpdate = l)
        })), o(() => (t && t._pendingUpdate && (t._pendingUpdate(), t._pendingUpdate = null), () => {
            t && t._pendingUpdate && (t._pendingUpdate(), t._pendingUpdate = null)
        })), null
    }
}, 631710, (e, t, r) => {
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
        l = e.r(809804),
        s = o._(e.r(371847)),
        u = i._(e.r(396611)),
        c = e.r(530272);

    function d() {
        return [(0, l.jsx)("meta", {
            charSet: "utf-8"
        }, "charset"), (0, l.jsx)("meta", {
            name: "viewport",
            content: "width=device-width"
        }, "viewport")]
    }

    function m(e, t) {
        return "string" == typeof t || "number" == typeof t ? e : t.type === s.default.Fragment ? e.concat(s.default.Children.toArray(t.props.children).reduce((e, t) => "string" == typeof t || "number" == typeof t ? e : e.concat(t), [])) : e.concat(t)
    }
    e.r(324668);
    let p = ["name", "httpEquiv", "charSet", "itemProp"];

    function f(e) {
        let t, r, a, n;
        return e.reduce(m, []).reverse().concat(d().reverse()).filter((t = new Set, r = new Set, a = new Set, n = {}, e => {
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
            return s.default.cloneElement(e, {
                key: r
            })
        })
    }
    let h = function(e) {
        let {
            children: t
        } = e, r = (0, s.useContext)(c.HeadManagerContext);
        return (0, l.jsx)(u.default, {
            reduceComponentsToState: f,
            headManager: r,
            children: t
        })
    };
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 106489, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "ImageConfigContext", {
        enumerable: !0,
        get: function() {
            return i
        }
    });
    let a = e.r(481258)._(e.r(371847)),
        n = e.r(811526),
        i = a.default.createContext(n.imageConfigDefault)
}, 728415, (e, t, r) => {
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
}, 307724, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "default", {
        enumerable: !0,
        get: function() {
            return o
        }
    });
    let a = e.r(728415),
        n = e.r(61509);

    function i(e) {
        let {
            config: t,
            src: r,
            width: i,
            quality: o
        } = e, l = (0, n.getDeploymentId)();
        if (r.startsWith("/") && !r.startsWith("//")) {
            let e = r.indexOf("?");
            if (-1 !== e) {
                let t = new URLSearchParams(r.slice(e + 1)),
                    a = t.get("dpl");
                if (a) {
                    l = a, t.delete("dpl");
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
        let s = (0, a.findClosestQuality)(o, t);
        return `${t.path}?url=${encodeURIComponent(r)}&w=${i}&q=${s}${r.startsWith("/")&&l?`&dpl=${l}`:""}`
    }
    i.__next_img_default = !0;
    let o = i
}, 699248, (e, t, r) => {
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
        i = e.r(809804),
        o = n._(e.r(371847)),
        l = a._(e.r(652447)),
        s = a._(e.r(631710)),
        u = e.r(761805),
        c = e.r(811526),
        d = e.r(106489);
    e.r(324668);
    let m = e.r(409720),
        p = a._(e.r(307724)),
        f = e.r(763426),
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
        let l = e?.src;
        e && e["data-loaded-src"] !== l && (e["data-loaded-src"] = l, ("decode" in e ? e.decode() : Promise.resolve()).catch(() => {}).then(() => {
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
            height: l,
            width: s,
            decoding: u,
            className: c,
            style: d,
            fetchPriority: m,
            placeholder: p,
            loading: h,
            unoptimized: y,
            fill: b,
            onLoadRef: w,
            onLoadingCompleteRef: P,
            setBlurComplete: S,
            setShowAltText: x,
            sizesInput: E,
            onLoad: C,
            onError: I,
            ...R
        } = e, _ = (0, o.useCallback)(e => {
            e && (I && (e.src = e.src), e.complete && g(e, p, w, P, S, y, E))
        }, [r, p, w, P, S, I, y, E]), O = (0, f.useMergedRef)(t, _);
        return (0, i.jsx)("img", {
            ...R,
            ...v(m),
            loading: h,
            width: s,
            height: l,
            decoding: u,
            "data-nimg": b ? "fill" : "1",
            className: c,
            style: d,
            sizes: n,
            srcSet: a,
            src: r,
            ref: O,
            onLoad: e => {
                g(e.currentTarget, p, w, P, S, y, E)
            },
            onError: e => {
                x(!0), "empty" !== p && S(!0), I && I(e)
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
        return t && l.default.preload ? (l.default.preload(r.src, a), null) : (0, i.jsx)(s.default, {
            children: (0, i.jsx)("link", {
                rel: "preload",
                href: r.srcSet ? void 0 : r.src,
                ...a
            }, "__nimg-" + r.src + r.srcSet + r.sizes)
        })
    }
    let w = (0, o.forwardRef)((e, t) => {
        let r = (0, o.useContext)(m.RouterContext),
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
                onLoad: l,
                onLoadingComplete: s
            } = e,
            f = (0, o.useRef)(l);
        (0, o.useEffect)(() => {
            f.current = l
        }, [l]);
        let g = (0, o.useRef)(s);
        (0, o.useEffect)(() => {
            g.current = s
        }, [s]);
        let [v, w] = (0, o.useState)(!1), [P, S] = (0, o.useState)(!1), {
            props: x,
            meta: E
        } = (0, u.getImgProps)(e, {
            defaultLoader: p.default,
            imgConf: n,
            blurComplete: v,
            showAltText: P
        });
        return (0, i.jsxs)(i.Fragment, {
            children: [(0, i.jsx)(y, {
                ...x,
                unoptimized: E.unoptimized,
                placeholder: E.placeholder,
                fill: E.fill,
                onLoadRef: f,
                onLoadingCompleteRef: g,
                setBlurComplete: w,
                setShowAltText: S,
                sizesInput: e.sizes,
                ref: t
            }), E.preload ? (0, i.jsx)(b, {
                isAppRouter: !r,
                imgAttributes: x
            }) : null]
        })
    });
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 496801, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var a = {
        default: function() {
            return c
        },
        getImageProps: function() {
            return u
        }
    };
    for (var n in a) Object.defineProperty(r, n, {
        enumerable: !0,
        get: a[n]
    });
    let i = e.r(481258),
        o = e.r(761805),
        l = e.r(699248),
        s = i._(e.r(307724));

    function u(e) {
        let {
            props: t
        } = (0, o.getImgProps)(e, {
            defaultLoader: s.default,
            imgConf: {
                deviceSizes: [640, 750, 828, 1080, 1200, 1920, 2048, 3840],
                imageSizes: [32, 48, 64, 96, 128, 256, 384],
                qualities: [75],
                path: "/_next/image",
                loader: "default",
                dangerouslyAllowSVG: !1,
                unoptimized: !0
            }
        });
        for (let [e, r] of Object.entries(t)) void 0 === r && delete t[e];
        return {
            props: t
        }
    }
    let c = l.Image
}, 931243, (e, t, r) => {
    t.exports = e.r(496801)
}, 341950, e => {
    "use strict";
    var t = e.i(808558),
        r = e.i(7312),
        a = e.i(7284),
        n = e.i(371847),
        i = e.i(493739);
    let o = {
            Large: "size-1200",
            Medium: "size-1000",
            Small: "size-800",
            XSmall: "size-600"
        },
        l = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-700"
        },
        s = {
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
        m = {
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
        f = (0, n.forwardRef)((e, f) => {
            let h, {
                className: g,
                icon: v,
                ariaLabel: y,
                isDisabled: b = !1,
                isCircular: w = !1,
                isSelected: P = !1,
                size: S = "Large",
                variant: x = "Emphasis",
                iconColor: E = "Default",
                asChild: C,
                children: I,
                ...R
            } = e;
            h = b ? c[x] : P ? d[x] : u[x];
            let _ = (0, a.default)("foundation-web-icon-button", b ? r.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", o[S], s[S][w ? "circular" : "square"], h, g),
                O = n.default.createElement(n.default.Fragment, null, n.default.createElement(t.StateLayer, null), n.default.createElement("span", {
                    className: (0, a.default)("icon", v, l[S], b ? p[E][x] : m[E][x])
                }));
            if (C) {
                let {
                    as: e,
                    ...t
                } = R, r = n.default.Children.only(I);
                return n.default.createElement(i.Slot, {
                    ref: f,
                    ...t,
                    className: _,
                    "aria-label": y,
                    "aria-disabled": b || void 0
                }, n.default.cloneElement(r, {}, O))
            }
            if ("a" === R.as) {
                let {
                    as: e,
                    href: t,
                    ...r
                } = R;
                return n.default.createElement("a", {
                    ref: f,
                    ...r,
                    "aria-label": y,
                    "aria-disabled": b,
                    href: b ? void 0 : t,
                    className: _
                }, O)
            }
            let {
                as: j,
                ...k
            } = R;
            return n.default.createElement("button", {
                ref: f,
                type: "button",
                ...k,
                "aria-label": y,
                disabled: b,
                className: _
            }, O)
        });
    e.s(["IconButton", 0, f])
}, 219617, e => {
    "use strict";
    var t = e.i(7284),
        r = e.i(371847),
        a = e.i(775453),
        n = e.i(922353),
        i = e.i(9413),
        o = e.i(783660),
        l = e.i(634918),
        s = e.i(721988),
        u = e.i(411207),
        c = e.i(555876),
        d = e.i(199794),
        m = e.i(389784),
        p = e.i(158051),
        f = e.i(178511),
        h = e.i(584537),
        g = e.i(73772),
        v = e.i(700312),
        y = e.i(809804),
        b = "Popover",
        [w, P] = (0, i.createContextScope)(b, [c.createPopperScope]),
        S = (0, c.createPopperScope)(),
        [x, E] = w(b),
        C = e => {
            let {
                __scopePopover: t,
                children: a,
                open: n,
                defaultOpen: i,
                onOpenChange: o,
                modal: l = !1
            } = e, s = S(t), d = r.useRef(null), [m, p] = r.useState(!1), [f = !1, g] = (0, h.useControllableState)({
                prop: n,
                defaultProp: i,
                onChange: o
            });
            return (0, y.jsx)(c.Root, {
                ...s,
                children: (0, y.jsx)(x, {
                    scope: t,
                    contentId: (0, u.useId)(),
                    triggerRef: d,
                    open: f,
                    onOpenChange: g,
                    onOpenToggle: r.useCallback(() => g(e => !e), [g]),
                    hasCustomAnchor: m,
                    onCustomAnchorAdd: r.useCallback(() => p(!0), []),
                    onCustomAnchorRemove: r.useCallback(() => p(!1), []),
                    modal: l,
                    children: a
                })
            })
        };
    C.displayName = b;
    var I = "PopoverAnchor";
    r.forwardRef((e, t) => {
        let {
            __scopePopover: a,
            ...n
        } = e, i = E(I, a), o = S(a), {
            onCustomAnchorAdd: l,
            onCustomAnchorRemove: s
        } = i;
        return r.useEffect(() => (l(), () => s()), [l, s]), (0, y.jsx)(c.Anchor, {
            ...o,
            ...n,
            ref: t
        })
    }).displayName = I;
    var R = "PopoverTrigger",
        _ = r.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                ...i
            } = e, o = E(R, r), l = S(r), s = (0, n.useComposedRefs)(t, o.triggerRef), u = (0, y.jsx)(p.Primitive.button, {
                type: "button",
                "aria-haspopup": "dialog",
                "aria-expanded": o.open,
                "aria-controls": o.contentId,
                "data-state": F(o.open),
                ...i,
                ref: s,
                onClick: (0, a.composeEventHandlers)(e.onClick, o.onOpenToggle)
            });
            return o.hasCustomAnchor ? u : (0, y.jsx)(c.Anchor, {
                asChild: !0,
                ...l,
                children: u
            })
        });
    _.displayName = R;
    var O = "PopoverPortal",
        [j, k] = w(O, {
            forceMount: void 0
        }),
        T = e => {
            let {
                __scopePopover: t,
                forceMount: r,
                children: a,
                container: n
            } = e, i = E(O, t);
            return (0, y.jsx)(j, {
                scope: t,
                forceMount: r,
                children: (0, y.jsx)(m.Presence, {
                    present: r || i.open,
                    children: (0, y.jsx)(d.Portal, {
                        asChild: !0,
                        container: n,
                        children: a
                    })
                })
            })
        };
    T.displayName = O;
    var A = "PopoverContent",
        N = r.forwardRef((e, t) => {
            let r = k(A, e.__scopePopover),
                {
                    forceMount: a = r.forceMount,
                    ...n
                } = e,
                i = E(A, e.__scopePopover);
            return (0, y.jsx)(m.Presence, {
                present: a || i.open,
                children: i.modal ? (0, y.jsx)(M, {
                    ...n,
                    ref: t
                }) : (0, y.jsx)(U, {
                    ...n,
                    ref: t
                })
            })
        });
    N.displayName = A;
    var D = (0, f.createSlot)("PopoverContent.RemoveScroll"),
        M = r.forwardRef((e, t) => {
            let i = E(A, e.__scopePopover),
                o = r.useRef(null),
                l = (0, n.useComposedRefs)(t, o),
                s = r.useRef(!1);
            return r.useEffect(() => {
                let e = o.current;
                if (e) return (0, g.hideOthers)(e)
            }, []), (0, y.jsx)(v.RemoveScroll, {
                as: D,
                allowPinchZoom: !0,
                children: (0, y.jsx)(L, {
                    ...e,
                    ref: l,
                    trapFocus: i.open,
                    disableOutsidePointerEvents: !0,
                    onCloseAutoFocus: (0, a.composeEventHandlers)(e.onCloseAutoFocus, e => {
                        e.preventDefault(), s.current || i.triggerRef.current?.focus()
                    }),
                    onPointerDownOutside: (0, a.composeEventHandlers)(e.onPointerDownOutside, e => {
                        let t = e.detail.originalEvent,
                            r = 0 === t.button && !0 === t.ctrlKey;
                        s.current = 2 === t.button || r
                    }, {
                        checkForDefaultPrevented: !1
                    }),
                    onFocusOutside: (0, a.composeEventHandlers)(e.onFocusOutside, e => e.preventDefault(), {
                        checkForDefaultPrevented: !1
                    })
                })
            })
        }),
        U = r.forwardRef((e, t) => {
            let a = E(A, e.__scopePopover),
                n = r.useRef(!1),
                i = r.useRef(!1);
            return (0, y.jsx)(L, {
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
        L = r.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                trapFocus: a,
                onOpenAutoFocus: n,
                onCloseAutoFocus: i,
                disableOutsidePointerEvents: u,
                onEscapeKeyDown: d,
                onPointerDownOutside: m,
                onFocusOutside: p,
                onInteractOutside: f,
                ...h
            } = e, g = E(A, r), v = S(r);
            return (0, l.useFocusGuards)(), (0, y.jsx)(s.FocusScope, {
                asChild: !0,
                loop: !0,
                trapped: a,
                onMountAutoFocus: n,
                onUnmountAutoFocus: i,
                children: (0, y.jsx)(o.DismissableLayer, {
                    asChild: !0,
                    disableOutsidePointerEvents: u,
                    onInteractOutside: f,
                    onEscapeKeyDown: d,
                    onPointerDownOutside: m,
                    onFocusOutside: p,
                    onDismiss: () => g.onOpenChange(!1),
                    children: (0, y.jsx)(c.Content, {
                        "data-state": F(g.open),
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
        $ = r.forwardRef((e, t) => {
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

    function F(e) {
        return e ? "open" : "closed"
    }
    $.displayName = z, r.forwardRef((e, t) => {
        let {
            __scopePopover: r,
            ...a
        } = e, n = S(r);
        return (0, y.jsx)(c.Arrow, {
            ...n,
            ...a,
            ref: t
        })
    }).displayName = "PopoverArrow";
    let W = e => {
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
        return r.createElement($, a, t)
    }, "PopoverContent", 0, function(e) {
        let {
            side: a = "bottom",
            align: n = "center",
            sideOffset: i = 4,
            className: o,
            children: l,
            ariaLabel: s,
            onOpenAutoFocus: u,
            ...c
        } = e;
        return r.createElement(T, null, r.createElement(N, {
            side: a,
            align: n,
            sideOffset: i,
            ...c,
            "aria-label": s ?? c["aria-label"],
            onOpenAutoFocus: u ?? W,
            className: (0, t.default)("foundation-web-portal-zindex", o)
        }, l))
    }, "PopoverTrigger", 0, function(e) {
        let {
            asChild: t,
            disabled: a,
            className: n,
            children: i
        } = e;
        return r.createElement(_, {
            asChild: t,
            disabled: a,
            className: n
        }, i)
    }], 219617)
}, 813537, e => {
    "use strict";
    var t = e.i(744420),
        r = e.i(371847),
        a = e.i(745911),
        n = r["use".trim()],
        i = e.i(254351),
        o = e.i(730828),
        l = e.i(484912),
        s = e.i(809804),
        u = e.i(674123),
        c = e.i(880983);
    let d = function(e) {
        let {
            Link: c,
            config: d,
            getPathname: m,
            ...p
        } = function(e, a) {
            var u, c, d;
            let m = {
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
                p = m.pathnames,
                f = (0, r.forwardRef)(function(t, r) {
                    let a, l, {
                        href: u,
                        locale: c,
                        ...d
                    } = t;
                    "object" == typeof u ? (a = u.pathname, l = u.params) : a = u;
                    let f = (0, i.isLocalizableHref)(u),
                        g = e(),
                        v = (0, i.isPromise)(g) ? n(g) : g,
                        y = f ? h({
                            locale: c || v,
                            href: null == p ? a : {
                                pathname: a,
                                params: l
                            },
                            forcePrefix: null != c || void 0
                        }) : a;
                    return (0, s.jsx)(o.default, {
                        ref: r,
                        href: "object" == typeof u ? {
                            ...u,
                            pathname: y
                        } : y,
                        locale: c,
                        localeCookie: m.localeCookie,
                        ...d
                    })
                });

            function h(e) {
                let t, {
                    forcePrefix: r,
                    href: a,
                    locale: n
                } = e;
                return null == p ? "object" == typeof a ? (t = a.pathname, a.query && (t += (0, l.serializeSearchParams)(a.query))) : t = a : t = (0, l.compileLocalizedPathname)({
                    locale: n,
                    ...(0, l.normalizeNameOrNameWithParams)(a),
                    pathnames: m.pathnames
                }), (0, l.applyPathnamePrefix)(t, n, m, r)
            }

            function g(e) {
                return function(t) {
                    for (var r = arguments.length, a = Array(r > 1 ? r - 1 : 0), n = 1; n < r; n++) a[n - 1] = arguments[n];
                    return e(h(t), ...a)
                }
            }
            return {
                config: m,
                Link: f,
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
                    s = (0, a.useLocale)();
                return (0, r.useMemo)(() => o && d.pathnames ? (0, l.getRoute)(s, o, d.pathnames) : o, [s, o])
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
                            } = r || {}, l = [m({
                                href: t,
                                locale: a || n,
                                forcePrefix: null != a || void 0
                            })];
                            Object.keys(o).length > 0 && l.push(o), (0, u.default)(d.localeCookie, i, n, a), e(...l)
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
            getPathname: m
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
        } = e, o = null == n ? "" : r.UrlSearchParams.new(n).toString(), l = "" === o ? "" : `?${o}`, s = i ? i.startsWith("#") ? i : `#${i}` : "";
        return `${a}${l}${s}`
    }])
}, 784859, e => {
    "use strict";
    let t = void 0 === globalThis.window,
        r = void 0 !== globalThis.window;
    e.s(["isClient", 0, r, "isServer", 0, t])
}, 931070, e => {
    "use strict";
    var t = e.i(371847),
        r = e.i(744420),
        a = e.i(851460),
        n = e.i(326602),
        i = e.i(813537),
        o = e.i(784859);
    let l = () => o.isServer ? "" : window.location.hash;
    e.s(["useFragment", 0, () => {
        let [e, r] = (0, t.useState)(l());
        return (0, t.useEffect)(() => {
            let e = () => {
                r(l())
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
}, 655010, 468396, e => {
    "use strict";
    var t = e.i(959491),
        r = e.i(654902),
        a = e.i(371847);
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
    }], 655010), e.s(["INPUT_BACKGROUND_BY_VARIANT", 0, {
        Standard: "bg-none",
        Contrast: "bg-shift-200",
        Utility: "bg-none"
    }, "INPUT_STROKE_BY_VARIANT", 0, {
        Standard: "stroke-standard",
        Contrast: "stroke-none",
        Utility: "stroke-none"
    }, "INPUT_VARIANTS", 0, ["Standard", "Contrast", "Utility"]], 468396)
}, 100266, e => {
    "use strict";
    var t = e.i(371847),
        r = e.i(888104),
        a = e.i(734899);
    e.i(350223);
    var n = e.i(874296),
        i = e.i(245837),
        o = e.i(646424),
        l = e.i(587541);
    let s = n.nullish(n.string()),
        u = n.looseObject({
            userId: n.number(),
            names: n.nullish(n.looseObject({
                combinedName: s,
                username: s,
                displayName: s,
                alias: s,
                contactName: s,
                platformName: s,
                inExperienceName: s
            }))
        }),
        c = n.object({
            profileDetails: n.nullish(n.array(u))
        }),
        d = async (e, t) => {
            let r = l.Url.parse(i.default.apiGatewayUrl).getOrThrow().withPath("/user-profile-api/v1/user/profiles/get-profiles");
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
        }, m = async (e, t) => {
            let r = [...new Set(e)],
                a = [];
            for (let e = 0; e < r.length; e += 200) a.push(r.slice(e, e + 200));
            let n = await Promise.all(a.map(e => d(e, t))),
                i = {};
            for (let e of n.flat()) i[e.userId] = e;
            return i
        }, p = e => [...new Set(e)].sort(), f = {
            all: () => ["userProfiles"],
            fields: e => [...f.all(), p(e).join(",")],
            user: (e, t) => [...f.fields(e), t]
        }, h = new Map;
    e.s(["useUserProfiles", 0, function(e, n) {
        let {
            enabled: i = !0,
            staleTime: o = 3e5
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}, l = (0, t.useMemo)(() => [...new Set(e)], [e]), s = (0, r.useQueries)({
            queries: l.map(e => ({
                queryKey: f.user(n, e),
                queryFn: () => {
                    let t, r, i;
                    return r = (t = p(n)).join(","), null == (i = h.get(r)) && (i = (0, a.batchQuery)({
                        delay: 10,
                        maxSize: 200
                    }, e => m(e, t), (e, t) => e[t] ?? {
                        userId: t
                    }), h.set(r, i)), i(e)
                },
                enabled: i,
                staleTime: o
            }))
        }), u = s.map(e => e.data), c = (0, t.useRef)(null);
        if (c.current?.profiles.length !== u.length || c.current.profiles.some((e, t) => e !== u[t])) {
            let e = {};
            u.forEach(t => {
                null != t && (e[t.userId] = t)
            }), c.current = {
                profiles: u,
                data: e
            }
        }
        let d = i && s.some(e => void 0 === e.data && "error" !== e.status);
        return {
            data: c.current.data,
            isLoading: d
        }
    }, "userProfilesQueryKeys", 0, f], 100266)
}, 690255, e => {
    "use strict";
    var t = e.i(809804),
        r = e.i(371847),
        a = e.i(587541),
        n = e.i(851460),
        i = e.i(813537);
    let o = (0, r.forwardRef)((e, r) => {
        let o, {
            href: l,
            prefetch: s = "none",
            ...u
        } = e;
        return "string" == typeof l ? o = l : l instanceof a.Url ? {
            href: o
        } = l : o = {
            pathname: l.path,
            query: null == l.searchParams ? void 0 : n.UrlSearchParams.new(l.searchParams).toString(),
            hash: l.fragment
        }, (0, t.jsx)(i.Nav.Link, {
            ref: r,
            href: o,
            prefetch: "full" === s || "none" !== s && "auto",
            ...u
        })
    });
    e.s(["Link", 0, o], 690255)
}, 424333, e => {
    "use strict";
    var t = e.i(371847);
    let r = 0;
    e.s(["default", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "«r",
            a = (0, t.useRef)();
        return a.current || (r += 1, a.current = `${e}${r}`), a.current
    }])
}, 686790, e => {
    "use strict";
    var t = e.i(545819),
        r = e.i(126392),
        a = e.i(519003);
    let n = () => (0, a.getPageBaseUrls)().rootDomain;
    e.s(["isAnalyticsCookieAccepted", 0, () => !!t.get("RBXcb")?.value.split("&").find(e => "true" === e.split("=")[1]), "setTrackingRestriction", 0, e => {
        null != e && (0, r.getCurrentUser)()?.id != null && t.set("RBXcp", e ? "restricted" : "standard", {
            domain: n(),
            maxAge: 15552e3,
            sameSite: "lax"
        })
    }, "setUserConsent", 0, (e, r) => {
        let a = [];
        for (let i of r) e.includes(i) ? a.push(`${i}=true`) : (a.push(`${i}=false`), t.delete(i, {
            domain: n()
        }));
        t.set("RBXcb", a.join("&"), {
            domain: n(),
            maxAge: 15552e3
        })
    }])
}, 736536, 119300, e => {
    "use strict";
    let t = {
        MountSearchLanding: "MountSearchLanding",
        ShowSearchLanding: "ShowSearchLanding",
        UpdateSearchSessionInfo: "UpdateSearchSessionInfo",
        SetSearchLandingHasContent: "SetSearchLandingHasContent"
    };
    e.s(["ModalEvent", 0, t], 119300), e.s(["default", 0, {
        ModalEvent: t,
        mountSearchLanding: function() {
            return new Promise(() => {
                let e = new CustomEvent(t.MountSearchLanding, {
                    detail: {}
                });
                window.dispatchEvent(e)
            })
        },
        showSearchLanding: function(e) {
            return new Promise(() => {
                let r = new CustomEvent(t.ShowSearchLanding, {
                    detail: {
                        sessionInfo: e
                    }
                });
                window.dispatchEvent(r)
            })
        },
        updateSessionInfo: function(e) {
            return new Promise(() => {
                let r = new CustomEvent(t.UpdateSearchSessionInfo, {
                    detail: {
                        sessionInfo: e
                    }
                });
                window.dispatchEvent(r)
            })
        },
        setSearchLandingHasContent: function() {
            return new Promise(() => {
                let e = new CustomEvent(t.SetSearchLandingHasContent, {});
                window.dispatchEvent(e)
            })
        }
    }], 736536)
}, 868970, e => {
    "use strict";
    var t = e.i(809804),
        r = e.i(371847),
        a = e.i(723941),
        n = e.i(126392),
        i = e.i(744420);
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
        let l = t?.data ?? [],
            s = l.find(e => {
                let [t] = e;
                return t.toString() === r.toString()
            }),
            u = s?.[2] ?? 0;
        if (a && (1 & u) == 0) {
            o.add("color-mode-dark");
            let e = l.filter(e => {
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
        let c = s?.[1],
            d = (null == c ? null : n[c]) ?? i;
        o.add(d)
    }).toString();
    e.s(["default", 0, function(e) {
        let {
            userId: l,
            defaultDark: s = !1,
            nonce: u
        } = e, c = (0, r.useRef)(!1);
        return (0, i.useServerInsertedHTML)(() => {
            if (!c.current) return c.current = !0, (0, t.jsx)("script", {
                blocking: "render",
                nonce: u,
                children: `(${o})(${a.serialize({userId:(0,n.userIdToNumber)(l),defaultDark:s}).value})`
            }, "color-mode")
        }), null
    }], 868970)
}]);

//# debugId=c3a3cdb0-82b8-dbc3-37a8-3bf4ed45226e
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0kq10eax08vt6.js.map