"use strict";
(self.webpackChunk_N_E = self.webpackChunk_N_E || []).push([
    [774], {
        1774: (e, n, t) => {
            t.r(n), t.d(n, {
                default: () => A
            });
            var a, i = t(7876),
                r = t(4232),
                o = t(9099),
                s = t(5873),
                l = t(2781);
            let c = e => "wasmJoinId:".concat(e);
            async function d(e, n) {
                return e ? await (0, s.uK)(e, {
                    userId: n
                }) ? void 0 : l.fO.INVALID_JOIN_ID : l.fO.NO_JOIN_ID
            }

            function u(e) {
                let n = new URLSearchParams(e);
                return n.delete(s.uW), n.set("wasmRedirect", "1"), "/games/start?".concat(n.toString())
            }
            let f = "roblox.com";
            async function m() {
                try {
                    let e = await fetch("https://users.".concat(f, "/v1/users/authenticated"), {
                        credentials: "include"
                    });
                    if (401 === e.status || 403 === e.status) return {
                        status: "signedOut"
                    };
                    if (!e.ok) return {
                        status: "unknown"
                    };
                    let {
                        id: n
                    } = await e.json();
                    return "number" == typeof n ? {
                        status: "signedIn",
                        userId: n
                    } : {
                        status: "unknown"
                    }
                } catch (e) {
                    return {
                        status: "unknown"
                    }
                }
            }
            async function g(e) {
                if (!e || !/^[0-9]+$/.test(e)) return !1;
                try {
                    let n = await fetch("https://apis.".concat(f, "/guac-v2/v1/playtest-access/").concat(e), {
                        credentials: "include"
                    });
                    if (!n.ok) return !1;
                    let {
                        hasAccess: t
                    } = await n.json();
                    return !0 === t
                } catch (e) {
                    return !1
                }
            }
            async function p(e, n) {
                try {
                    var t, a;
                    let i = await fetch("https://locale.".concat(f, "/v1/locales/user-localization-locus-supported-locales"), {
                            credentials: "include"
                        }),
                        {
                            generalExperience: r
                        } = await i.json(),
                        o = null == r ? void 0 : r.locale;
                    if (!o || "en_us" === o) return;
                    let s = await fetch("https://translations-cdn.".concat(f, "/10/latest/").concat(encodeURIComponent(o), "/").concat(e, ".json"));
                    if (!s.ok) return;
                    let l = null == (t = (await s.json())[n]) ? void 0 : t.localizedString;
                    if (!l) return;
                    return {
                        text: l,
                        lang: o.replace("_", "-"),
                        isRightToLeft: (null == r || null == (a = r.language) ? void 0 : a.isRightToLeft) === !0
                    }
                } catch (e) {
                    return
                }
            }

            function h() {
                var e;
                let [n, t] = (0, r.useState)(), a = null == n ? void 0 : n.translation;
                return (0, r.useEffect)(() => {
                    let e;
                    return Promise.race([p("Feature.ExperienceDetails", "PlayOnWebLoadingScreen.Label.BetaNotice"), new Promise(n => {
                        e = setTimeout(() => n(void 0), 1500)
                    })]).then(n => {
                        clearTimeout(e), t({
                            translation: n
                        })
                    }), () => clearTimeout(e)
                }, []), (0, i.jsxs)("div", {
                    className: "loading-beta-notice",
                    role: "note",
                    "data-pending": !n || void 0,
                    lang: null == a ? void 0 : a.lang,
                    dir: (null == a ? void 0 : a.isRightToLeft) ? "rtl" : void 0,
                    children: [(0, i.jsxs)("svg", {
                        className: "loading-beta-notice-icon",
                        viewBox: "0 0 20 20",
                        "aria-hidden": "true",
                        focusable: "false",
                        children: [(0, i.jsx)("circle", {
                            cx: "10",
                            cy: "10",
                            r: "10",
                            fill: "#335fff"
                        }), (0, i.jsx)("circle", {
                            cx: "10",
                            cy: "5.75",
                            r: "1.25",
                            fill: "#fff"
                        }), (0, i.jsx)("rect", {
                            x: "8.875",
                            y: "8.25",
                            width: "2.25",
                            height: "7",
                            rx: "1.125",
                            fill: "#fff"
                        })]
                    }), (0, i.jsx)("p", {
                        children: null != (e = null == a ? void 0 : a.text) ? e : "Playing Roblox in your browser is in beta. Some features may be missing, and performance may vary."
                    })]
                })
            }

            function v(e) {
                var n;
                let t = "".concat(e, "=");
                return null == (n = document.cookie.split("; ").find(e => e.startsWith(t))) ? void 0 : n.slice(t.length)
            }

            function w(e) {
                let n = v(e);
                return void 0 === n ? void 0 : decodeURIComponent(n)
            }
            async function y() {
                let e = await fetch("https://apis.".concat(f, "/guac-v2/v1/bundles/cookie-policy"), {
                    credentials: "include",
                    signal: AbortSignal.timeout(1e3)
                });
                if (!e.ok) throw Error("cookie policy HTTP ".concat(e.status));
                return await e.json()
            }

            function b() {
                return {
                    consent: function(e, n) {
                        var t;
                        let a = null == e || null == (t = e.split("&").map(e => e.split("=")).find(e => {
                            let [t] = e;
                            return t === n
                        })) ? void 0 : t[1];
                        return void 0 === a ? void 0 : "true" === a
                    }(w("RBXcb"), "RBXSessionTracking"),
                    restricted: "restricted" === w("RBXcp")
                }
            }
            async function x() {
                try {
                    let e = b();
                    if (e.restricted || !1 === e.consent) return !1;
                    let n = await y(),
                        {
                            consent: t,
                            restricted: a
                        } = b();
                    if (a || !1 !== n.RestrictNonEssentialTrackingConsent) return !1;
                    if (void 0 !== t) return t;
                    return !1 === n.ShouldDisplayCookieBannerV3
                } catch (e) {
                    return !1
                }
            }
            let j = ["RBXcb", "RBXcp"];

            function N() {
                return j.map(v).join("|")
            }
            var S = t(5364);
            let E = {
                    name: "roblox-wasm-play-page",
                    version: "1.0.0"
                },
                _ = Number.parseFloat(null != (a = S.env.NEXT_PUBLIC_SENTRY_UPLOAD_PERCENTAGE) ? a : ""),
                I = Number.isNaN(_) ? 100 : _,
                R = {
                    info: [],
                    warning: [],
                    error: []
                },
                k = new Set,
                C = 0,
                O = !1;

            function T(e) {
                if (e instanceof Error) return "".concat(e.name, ": ").concat(e.message);
                if ("string" == typeof e) return e;
                try {
                    var n;
                    return null != (n = JSON.stringify(e)) ? n : String(e)
                } catch (n) {
                    return String(e)
                }
            }

            function L(e) {
                var n;
                let t = e.match(/(?:at\s+(?:(.+?)\s+\()?|^(.*)@).*?wasm-function\[(\d+)\]:0x([0-9a-f]+)/i);
                if (t) {
                    let e = "wasm-function[".concat(t[3], "]");
                    return {
                        function: t[1] || t[2] || e,
                        module: e
                    }
                }
                let a = null != (n = e.match(/at\s+(?:(.+?)\s+\()?(.+?):(\d+):(\d+)\)?$/)) ? n : e.match(/^(.*)@(.+?):(\d+):(\d+)$/);
                return a ? {
                    function: a[1] || "<anonymous>",
                    filename: a[2],
                    lineno: Number(a[3]),
                    colno: Number(a[4])
                } : null
            }

            function U(e, n, t) {
                var a, i;
                let r = e instanceof Error ? e.name : "Error",
                    o = e instanceof Error ? e.message : T(e),
                    s = "".concat(r, ": ").concat(o);
                if (!(e instanceof Error && (e instanceof WebAssembly.RuntimeError || (null != (a = e.stack) ? a : "").includes("wasm-function[")) || C >= 5 || k.has(s))) {
                    C += 1, k.add(s);
                    try {
                        let a = e instanceof Error && null != (i = e.stack) ? i : "",
                            s = new URLSearchParams(window.location.search).get("placeId"),
                            {
                                release: l,
                                dist: c,
                                tags: d
                            } = function() {
                                var e, n, t, a, i;
                                let r = null != (t = null == (e = window.robloxWasmHostConfig) ? void 0 : e.server) ? t : "prod",
                                    o = window.__wasmLoaderContext,
                                    s = null == o || null == (n = o.engineBase.match(/\/(version-[0-9a-f]+)-RobloxWebClient/)) ? void 0 : n[1],
                                    l = navigator;
                                return {
                                    release: function(e, n) {
                                        try {
                                            var t;
                                            let a = JSON.parse(null != (t = localStorage.getItem("clientVersion_".concat(e))) ? t : "null");
                                            if (n && (null == a ? void 0 : a.clientVersionUpload) === n && a.version) return String(a.version)
                                        } catch (e) {}
                                    }(r, s),
                                    dist: (null == o ? void 0 : o.channel) || "production",
                                    tags: {
                                        application: "RobloxWasmPlayer",
                                        "application.version": "1.0.0",
                                        "uname.sysname": "Web",
                                        language: "javascript",
                                        server: r,
                                        "engine.upload": null != s ? s : "unknown",
                                        "device.memory_gb": String(null != (a = l.deviceMemory) ? a : "unknown"),
                                        "device.cores": String(null != (i = l.hardwareConcurrency) ? i : "unknown"),
                                        cross_origin_isolated: String(window.crossOriginIsolated)
                                    }
                                }
                            }(),
                            u = crypto.randomUUID().replace(/-/g, ""),
                            f = {
                                event_id: u,
                                timestamp: Date.now() / 1e3,
                                platform: "javascript",
                                level: "onerror" === n ? "fatal" : "error",
                                environment: "roblox.com" === t ? "production" : t.split(".")[0],
                                release: l,
                                dist: c,
                                sdk: E,
                                request: {
                                    url: "".concat(window.location.origin).concat(window.location.pathname)
                                },
                                exception: {
                                    values: [{
                                        type: r,
                                        value: o,
                                        mechanism: {
                                            type: n,
                                            handled: !1
                                        },
                                        stacktrace: {
                                            frames: a.split("\n").map(L).filter(e => null !== e).reverse()
                                        }
                                    }]
                                },
                                breadcrumbs: {
                                    values: Object.values(R).flat().sort((e, n) => e.timestamp - n.timestamp)
                                },
                                tags: {
                                    ...d,
                                    ...s ? {
                                        placeId: s
                                    } : {}
                                },
                                extra: {
                                    rawStack: a
                                }
                            },
                            m = () => "".concat([JSON.stringify({
                                event_id: u,
                                sent_at: new Date().toISOString()
                            }), JSON.stringify({
                                type: "event"
                            }), JSON.stringify(f)].join("\n"), "\n"),
                            g = e => new TextEncoder().encode(e).byteLength > 61440,
                            p = m();
                        for (; g(p) && f.breadcrumbs.values.length > 0;) f.breadcrumbs.values.splice(0, 10), p = m();
                        if (g(p)) return;
                        fetch("https://sentry-relay.rbxinfra.com/api/26/envelope/?sentry_key=fd31d5d821fe2ac98694d57ca0c93b76&sentry_version=7&sentry_client=roblox-wasm-play-page/1.0.0", {
                            method: "POST",
                            headers: {
                                "Content-Type": "text/plain;charset=UTF-8"
                            },
                            credentials: "omit",
                            body: p,
                            keepalive: !0
                        }).catch(() => {})
                    } catch (e) {}
                }
            }
            var W = t(7418);
            let P = new(t(7657))._({
                baseUrl: "https://apis.".concat(f)
            });

            function D(e, n) {
                P.sendEvent(l.Vc, {
                    localTimestamp: new Date().toISOString(),
                    url: window.location.href,
                    reason: e
                });
                let t = BigInt(Date.now());
                P.sendEvent(W.l, {
                    batchTimestampMilliseconds: t,
                    counters: [{
                        name: "WasmPlay_Redirect",
                        value: 1,
                        eventTimestampMillisecond: t,
                        attributes: {
                            stringAttributes: {
                                reason: l.fO[e]
                            }
                        }
                    }]
                }), window.location.replace("https://www.".concat(f).concat(n))
            }
            var B = t(525);
            async function J(e) {
                var n;
                let {
                    universeId: t
                } = await (await fetch("https://apis.".concat(f, "/universes/v1/places/").concat(e, "/universe"), {
                    credentials: "include"
                })).json();
                if (!t) return;
                let {
                    data: a
                } = await (await fetch("https://games.".concat(f, "/v1/games?universeIds=").concat(t), {
                    credentials: "include"
                })).json();
                (null == a || null == (n = a[0]) ? void 0 : n.name) && (document.title = a[0].name)
            }

            function A() {
                let e = (0, o.useRouter)();
                return (0, r.useEffect)(() => {
                    if (!e.isReady || !(s.uW in e.query)) return;
                    let n = {
                        ...e.query
                    };
                    delete n[s.uW], e.replace({
                        pathname: e.pathname,
                        query: n
                    }, void 0, {
                        shallow: !0
                    })
                }, [e]), (0, r.useEffect)(() => {
                    let {
                        search: e
                    } = window.location, n = function(e) {
                        let n = new URLSearchParams(e),
                            t = n.get(s.uW),
                            a = n.get("placeId");
                        if (t || !a) return t;
                        try {
                            return window.sessionStorage.getItem(c(a))
                        } catch (e) {
                            return null
                        }
                    }(e), t = new URLSearchParams(e).get("placeId");
                    if (n && t) try {
                        window.sessionStorage.setItem(c(t), n)
                    } catch (e) {}! function(e) {
                        if (!O && (O = !0, !(100 * Math.random() >= I))) {
                            let n = {
                                log: "info",
                                info: "info",
                                warn: "warning",
                                error: "error"
                            };
                            Object.keys(n).forEach(e => {
                                let t = console[e].bind(console);
                                console[e] = function() {
                                    for (var a = arguments.length, i = Array(a), r = 0; r < a; r++) i[r] = arguments[r];
                                    let o = R[n[e]];
                                    o.push({
                                        timestamp: Date.now() / 1e3,
                                        category: "console",
                                        level: n[e],
                                        message: i.map(T).join(" ").slice(0, 500)
                                    }), o.length > 20 && o.shift(), t(...i)
                                }
                            }), window.addEventListener("error", n => {
                                var t;
                                return U(null != (t = n.error) ? t : n.message, "onerror", e)
                            }), window.addEventListener("unhandledrejection", n => U(n.reason, "onunhandledrejection", e))
                        }
                    }(f), P.sendEvent(B.e, {
                        localTimestamp: new Date().toISOString(),
                        url: window.location.href
                    });
                    let a = "prod";
                    window.robloxWasmHostConfig = {
                        server: a,
                        useCdnBinary: !0,
                        workerStubUrl: "".concat("/4cf83f8627d9609709ef5165081e6f27acdfe5d8/assets", "/webclient/stub.js")
                    };
                    let i = x(),
                        r = N(),
                        o = "version-f4a4dba57f874ad0";
                    o && localStorage.setItem("clientVersion_".concat(a), JSON.stringify({
                        clientVersionUpload: o,
                        version: "",
                        channelName: "",
                        cachedAt: Date.now()
                    })), m().then(async t => {
                        var a;
                        if ("signedOut" === t.status) {
                            let n = encodeURIComponent(u(e));
                            D(l.fO.SIGNED_OUT, "/login?returnUrl=".concat(n));
                            return
                        }
                        if ("unknown" === t.status) return void D(l.fO.UNKNOWN_AUTHENTICATED_ERROR, u(e));
                        let o = await d(n, t.userId);
                        if (void 0 !== o && !await g(new URLSearchParams(e).get("placeId"))) return void D(o, u(e));
                        let s = new URLSearchParams(window.location.search).get("placeId");
                        s && /^[0-9]+$/.test(s) && J(s).catch(() => {}), null == (a = document.getElementById("loading-overlay")) || a.classList.remove("loading-auth-pending");
                        let c = await i;
                        window.robloxWasmHostConfig && (window.robloxWasmHostConfig.canStoreTelemetry = c);
                        let f = document.createElement("script");
                        f.src = "".concat("/4cf83f8627d9609709ef5165081e6f27acdfe5d8/assets", "/webclient/WasmLoader.js"), document.body.appendChild(f),
                            function(e, n, t) {
                                let a = e,
                                    i = 0,
                                    r = () => {
                                        let e = i += 1;
                                        x().then(n => {
                                            e === i && n !== a && (a = n, t(n))
                                        })
                                    },
                                    o = N(),
                                    {
                                        cookieStore: s
                                    } = globalThis;
                                if (s) s.addEventListener("change", e => {
                                    let {
                                        changed: n,
                                        deleted: t
                                    } = e;
                                    [...n, ...t].some(e => {
                                        let {
                                            name: n
                                        } = e;
                                        return j.includes(n)
                                    }) && r()
                                });
                                else {
                                    let e = o;
                                    setInterval(() => {
                                        let n = N();
                                        n !== e && (e = n, r())
                                    }, 2e3)
                                }
                                o !== n && r()
                            }(c, r, e => {
                                window.robloxWasmHostConfig && (window.robloxWasmHostConfig.canStoreTelemetry = e), window.__wasmLoaderContext && (window.__wasmLoaderContext.canStoreTelemetry = e), window.dispatchEvent(new CustomEvent("wasmhostconfigchange", {
                                    detail: {
                                        canStoreTelemetry: e
                                    }
                                }))
                            })
                    })
                }, []), (0, i.jsxs)(r.Fragment, {
                    children: [(0, i.jsxs)("div", {
                        id: "input-container",
                        children: [(0, i.jsx)("textarea", {
                            id: "input-textarea",
                            autoCapitalize: "off"
                        }), (0, i.jsx)("input", {
                            id: "input-input",
                            autoCapitalize: "off"
                        })]
                    }), (0, i.jsxs)("div", {
                        className: "emscripten_border",
                        children: [(0, i.jsx)("canvas", {
                            className: "emscripten",
                            id: "canvas",
                            onContextMenu: e => e.preventDefault(),
                            tabIndex: -1
                        }), (0, i.jsxs)("div", {
                            id: "loading-overlay",
                            className: "loading-auth-pending",
                            role: "dialog",
                            "aria-label": "Loading Roblox",
                            "aria-busy": "true",
                            children: [(0, i.jsx)("div", {
                                className: "loading-background",
                                "aria-hidden": "true",
                                children: (0, i.jsx)("img", {
                                    id: "loading-background-image",
                                    alt: "",
                                    crossOrigin: "anonymous"
                                })
                            }), (0, i.jsx)("div", {
                                className: "loading-dark-gradient",
                                "aria-hidden": "true"
                            }), (0, i.jsxs)("div", {
                                className: "loading-content",
                                children: [(0, i.jsx)(h, {}), (0, i.jsxs)("section", {
                                    className: "loading-info-card",
                                    "aria-labelledby": "loading-experience-title",
                                    children: [(0, i.jsx)("div", {
                                        id: "loading-icon-shell",
                                        "aria-hidden": "true",
                                        children: (0, i.jsx)("img", {
                                            id: "loading-experience-icon",
                                            alt: "",
                                            crossOrigin: "anonymous"
                                        })
                                    }), (0, i.jsx)("h1", {
                                        id: "loading-experience-title",
                                        children: "Joining experience"
                                    }), (0, i.jsxs)("div", {
                                        className: "loading-creator-line",
                                        children: [(0, i.jsx)("span", {
                                            id: "loading-experience-creator",
                                            hidden: !0
                                        }), (0, i.jsx)("span", {
                                            id: "loading-verified-badge",
                                            role: "img",
                                            "aria-label": "Verified creator",
                                            title: "Verified creator",
                                            hidden: !0
                                        })]
                                    })]
                                })]
                            }), (0, i.jsxs)("section", {
                                className: "loading-error-panel",
                                role: "alertdialog",
                                "aria-modal": "true",
                                "aria-labelledby": "loading-error-title",
                                "aria-describedby": "loading-error-message loading-error-code",
                                hidden: !0,
                                children: [(0, i.jsx)("header", {
                                    className: "loading-error-header",
                                    children: (0, i.jsx)("h1", {
                                        id: "loading-error-title",
                                        children: "Join Error"
                                    })
                                }), (0, i.jsx)("div", {
                                    className: "loading-error-divider",
                                    "aria-hidden": "true"
                                }), (0, i.jsxs)("div", {
                                    className: "loading-error-body",
                                    children: [(0, i.jsxs)("div", {
                                        className: "loading-error-copy",
                                        children: [(0, i.jsx)("p", {
                                            id: "loading-error-message"
                                        }), (0, i.jsx)("p", {
                                            id: "loading-error-code"
                                        })]
                                    }), (0, i.jsx)("button", {
                                        id: "loading-error-leave",
                                        type: "button",
                                        children: "Leave"
                                    })]
                                })]
                            }), (0, i.jsx)("div", {
                                id: "status",
                                role: "status",
                                "aria-live": "polite",
                                children: "Preparing Roblox…"
                            }), (0, i.jsx)("div", {
                                className: "loading-status-spinner",
                                "aria-hidden": "true"
                            }), (0, i.jsx)("button", {
                                id: "loading-cancel",
                                type: "button",
                                "aria-label": "Cancel loading",
                                title: "Cancel"
                            })]
                        })]
                    }), (0, i.jsxs)("div", {
                        className: "emscripten",
                        hidden: !0,
                        children: [(0, i.jsx)("span", {
                            id: "server"
                        }), (0, i.jsx)("span", {
                            id: "proxyenabled"
                        })]
                    })]
                })
            }
        }
    }
]);