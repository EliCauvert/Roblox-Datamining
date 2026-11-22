(self.webpackChunk_N_E = self.webpackChunk_N_E || []).push([
    [51], {
        4631: (e, n, a) => {
            "use strict";
            a.d(n, {
                A: () => l
            });
            var t = a(7418),
                i = a(2781),
                r = a(8212),
                o = a(6055);

            function l(e, n) {
                r.A.sendEvent(i.Vc, {
                    localTimestamp: new Date().toISOString(),
                    url: window.location.href,
                    reason: e
                });
                let a = BigInt(Date.now());
                r.A.sendEvent(t.l, {
                    batchTimestampMilliseconds: a,
                    counters: [{
                        name: "WasmPlay_Redirect",
                        value: 1,
                        eventTimestampMillisecond: a,
                        attributes: {
                            stringAttributes: {
                                reason: i.fO[e]
                            }
                        }
                    }]
                }), window.location.replace("https://www.".concat(o.A).concat(n))
            }
        },
        6055: (e, n, a) => {
            "use strict";
            a.d(n, {
                A: () => t
            });
            let t = "roblox.com"
        },
        8051: (e, n, a) => {
            "use strict";
            a.r(n), a.d(n, {
                default: () => L
            });
            var t, i = a(7876),
                r = a(4232),
                o = a(9099),
                l = a(5873),
                s = a(2781),
                c = a(6055);
            async function d(e, n) {
                try {
                    var a, t;
                    let i = await fetch("https://locale.".concat(c.A, "/v1/locales/user-localization-locus-supported-locales"), {
                            credentials: "include"
                        }),
                        {
                            generalExperience: r
                        } = await i.json(),
                        o = null == r ? void 0 : r.locale;
                    if (!o || "en_us" === o) return;
                    let l = await fetch("https://translations-cdn.".concat(c.A, "/10/latest/").concat(encodeURIComponent(o), "/").concat(e, ".json"));
                    if (!l.ok) return;
                    let s = null == (a = (await l.json())[n]) ? void 0 : a.localizedString;
                    if (!s) return;
                    return {
                        text: s,
                        lang: o.replace("_", "-"),
                        isRightToLeft: (null == r || null == (t = r.language) ? void 0 : t.isRightToLeft) === !0
                    }
                } catch (e) {
                    return
                }
            }

            function u() {
                var e;
                let [n, a] = (0, r.useState)(), t = null == n ? void 0 : n.translation;
                return (0, r.useEffect)(() => {
                    let e;
                    return Promise.race([d("Feature.ExperienceDetails", "PlayOnWebLoadingScreen.Label.BetaNotice"), new Promise(n => {
                        e = setTimeout(() => n(void 0), 1500)
                    })]).then(n => {
                        clearTimeout(e), a({
                            translation: n
                        })
                    }), () => clearTimeout(e)
                }, []), (0, i.jsxs)("div", {
                    className: "loading-beta-notice",
                    role: "note",
                    "data-pending": !n || void 0,
                    lang: null == t ? void 0 : t.lang,
                    dir: (null == t ? void 0 : t.isRightToLeft) ? "rtl" : void 0,
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
                        children: null != (e = null == t ? void 0 : t.text) ? e : "Playing Roblox in your browser is in beta. Some features may be missing, and performance may vary."
                    })]
                })
            }
            var g = a(5364);
            let m = {
                    name: "roblox-wasm-play-page",
                    version: "1.0.0"
                },
                h = Number.parseFloat(null != (t = g.env.NEXT_PUBLIC_SENTRY_UPLOAD_PERCENTAGE) ? t : ""),
                v = Number.isNaN(h) ? 100 : h,
                f = {
                    info: [],
                    warning: [],
                    error: []
                },
                p = new Set,
                b = 0,
                y = !1;

            function w(e) {
                if (e instanceof Error) return "".concat(e.name, ": ").concat(e.message);
                if ("string" == typeof e) return e;
                try {
                    var n;
                    return null != (n = JSON.stringify(e)) ? n : String(e)
                } catch (n) {
                    return String(e)
                }
            }

            function x(e) {
                var n;
                let a = e.match(/(?:at\s+(?:(.+?)\s+\()?|^(.*)@).*?wasm-function\[(\d+)\]:0x([0-9a-f]+)/i);
                if (a) {
                    let e = "wasm-function[".concat(a[3], "]");
                    return {
                        function: a[1] || a[2] || e,
                        module: e
                    }
                }
                let t = null != (n = e.match(/at\s+(?:(.+?)\s+\()?(.+?):(\d+):(\d+)\)?$/)) ? n : e.match(/^(.*)@(.+?):(\d+):(\d+)$/);
                return t ? {
                    function: t[1] || "<anonymous>",
                    filename: t[2],
                    lineno: Number(t[3]),
                    colno: Number(t[4])
                } : null
            }

            function j(e, n, a) {
                var t, i;
                let r = e instanceof Error ? e.name : "Error",
                    o = e instanceof Error ? e.message : w(e),
                    l = "".concat(r, ": ").concat(o);
                if (!(e instanceof Error && (e instanceof WebAssembly.RuntimeError || (null != (t = e.stack) ? t : "").includes("wasm-function[")) || b >= 5 || p.has(l))) {
                    b += 1, p.add(l);
                    try {
                        let t = e instanceof Error && null != (i = e.stack) ? i : "",
                            l = new URLSearchParams(window.location.search).get("placeId"),
                            {
                                release: s,
                                dist: c,
                                tags: d
                            } = function() {
                                var e, n, a, t, i;
                                let r = null != (a = null == (e = window.robloxWasmHostConfig) ? void 0 : e.server) ? a : "prod",
                                    o = window.__wasmLoaderContext,
                                    l = null == o || null == (n = o.engineBase.match(/\/(version-[0-9a-f]+)-RobloxWebClient/)) ? void 0 : n[1],
                                    s = navigator;
                                return {
                                    release: function(e, n) {
                                        try {
                                            var a;
                                            let t = JSON.parse(null != (a = localStorage.getItem("clientVersion_".concat(e))) ? a : "null");
                                            if (n && (null == t ? void 0 : t.clientVersionUpload) === n && t.version) return String(t.version)
                                        } catch (e) {}
                                    }(r, l),
                                    dist: (null == o ? void 0 : o.channel) || "production",
                                    tags: {
                                        application: "RobloxWasmPlayer",
                                        "application.version": "1.0.0",
                                        "uname.sysname": "Web",
                                        language: "javascript",
                                        server: r,
                                        "engine.upload": null != l ? l : "unknown",
                                        "device.memory_gb": String(null != (t = s.deviceMemory) ? t : "unknown"),
                                        "device.cores": String(null != (i = s.hardwareConcurrency) ? i : "unknown"),
                                        cross_origin_isolated: String(window.crossOriginIsolated)
                                    }
                                }
                            }(),
                            u = crypto.randomUUID().replace(/-/g, ""),
                            g = {
                                event_id: u,
                                timestamp: Date.now() / 1e3,
                                platform: "javascript",
                                level: "onerror" === n ? "fatal" : "error",
                                environment: "roblox.com" === a ? "production" : a.split(".")[0],
                                release: s,
                                dist: c,
                                sdk: m,
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
                                            frames: t.split("\n").map(x).filter(e => null !== e).reverse()
                                        }
                                    }]
                                },
                                breadcrumbs: {
                                    values: Object.values(f).flat().sort((e, n) => e.timestamp - n.timestamp)
                                },
                                tags: {
                                    ...d,
                                    ...l ? {
                                        placeId: l
                                    } : {}
                                },
                                extra: {
                                    rawStack: t
                                }
                            },
                            h = () => "".concat([JSON.stringify({
                                event_id: u,
                                sent_at: new Date().toISOString()
                            }), JSON.stringify({
                                type: "event"
                            }), JSON.stringify(g)].join("\n"), "\n"),
                            v = e => new TextEncoder().encode(e).byteLength > 61440,
                            p = h();
                        for (; v(p) && g.breadcrumbs.values.length > 0;) g.breadcrumbs.values.splice(0, 10), p = h();
                        if (v(p)) return;
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
            var N = a(4631),
                S = a(6845),
                E = a(5852),
                A = a(9792),
                I = a(7426),
                W = a(3934);
            let R = (0, S.w)("CiBldmVudHN0cmVhbS93YXNtL3BhZ2VfbG9hZC5wcm90bxIXZXZlbnRzdHJlYW0uZXZlbnRpbmdlc3Qi6wMKEVdlYkNsaWVudFBhZ2VMb2FkEjMKHWluZ2VzdF90aW1lc3RhbXBfbWlsbGlzZWNvbmRzGAEgASgDQgeKvpIBAggBSACIAQESJwoPbG9jYWxfdGltZXN0YW1wGAIgASgJQgmivpIBBAoCbHRIAYgBARItCg91c2VyX2V2ZW50X2Jhc2UYAyABKAsyFC5ldmVudC5Vc2VyRXZlbnRCYXNlEhwKA3VybBgEIAEoCUIKor6SAQUKA3VybEgCiAEBOuwByvySAScKDGluZ2VzdF9wcm90bxIOd2FzbV9wYWdlX2xvYWQiB2RzLGhvdXLS/JIBFjIUZGktZXZlbnQtZm9yd2FyZGVyLTTa/JIBBgjoBxCAEOL8kgFLIgN3d3c6LgoEVXNlchISQ29uc3VtZXIgUGxhdGZvcm1zGg9XZWIgYW5kIEJhY2tlbmQguRNCCyNjcC1iYWNrZW5kSgdQSDNQS01Y6vySAT4KIGV2ZW50c3RyZWFtL3dhc20vcGFnZV9sb2FkLnByb3RvEhgKA3d3dxIRd2ViQ2xpZW50UGFnZUxvYWQYB/r8kgECCAFCIAoeX2luZ2VzdF90aW1lc3RhbXBfbWlsbGlzZWNvbmRzQhIKEF9sb2NhbF90aW1lc3RhbXBCBgoEX3VybEI7WjlnaXRodWIucmJ4LmNvbS9yb2Jsb3gvc2NoZW1hLXByb3RvZ2VuL2dvL2V2ZW50c3RyZWFtL3dhc21iBnByb3RvMw", [A.dQ, I.$, W.zO]),
                C = (0, E.Z)(R, 0);
            var Z = a(8212);
            async function B(e) {
                var n;
                let {
                    universeId: a
                } = await (await fetch("https://apis.".concat(c.A, "/universes/v1/places/").concat(e, "/universe"), {
                    credentials: "include"
                })).json();
                if (!a) return;
                let {
                    data: t
                } = await (await fetch("https://games.".concat(c.A, "/v1/games?universeIds=").concat(a), {
                    credentials: "include"
                })).json();
                (null == t || null == (n = t[0]) ? void 0 : n.name) && (document.title = t[0].name)
            }
            async function V() {
                try {
                    let e = await fetch("https://users.".concat(c.A, "/v1/users/authenticated"), {
                        credentials: "include"
                    });
                    return 401 === e.status || 403 === e.status
                } catch (e) {
                    return !1
                }
            }

            function L() {
                let e = (0, o.useRouter)();
                return (0, r.useEffect)(() => {
                    if (!e.isReady || !(l.uW in e.query)) return;
                    let n = {
                        ...e.query
                    };
                    delete n[l.uW], e.replace({
                        pathname: e.pathname,
                        query: n
                    }, void 0, {
                        shallow: !0
                    })
                }, [e]), (0, r.useEffect)(() => {
                    ! function(e) {
                        if (!y && (y = !0, !(100 * Math.random() >= v))) {
                            let n = {
                                log: "info",
                                info: "info",
                                warn: "warning",
                                error: "error"
                            };
                            Object.keys(n).forEach(e => {
                                let a = console[e].bind(console);
                                console[e] = function() {
                                    for (var t = arguments.length, i = Array(t), r = 0; r < t; r++) i[r] = arguments[r];
                                    let o = f[n[e]];
                                    o.push({
                                        timestamp: Date.now() / 1e3,
                                        category: "console",
                                        level: n[e],
                                        message: i.map(w).join(" ").slice(0, 500)
                                    }), o.length > 20 && o.shift(), a(...i)
                                }
                            }), window.addEventListener("error", n => {
                                var a;
                                return j(null != (a = n.error) ? a : n.message, "onerror", e)
                            }), window.addEventListener("unhandledrejection", n => j(n.reason, "onunhandledrejection", e))
                        }
                    }(c.A), Z.A.sendEvent(C, {
                        localTimestamp: new Date().toISOString(),
                        url: window.location.href
                    });
                    let e = "prod";
                    window.robloxWasmHostConfig = {
                        server: e,
                        useCdnBinary: !0,
                        workerStubUrl: "".concat("/6536749aa05e452da9c4d6ed4b464613ff9ba84a/assets", "/webclient/stub.js")
                    };
                    let n = "version-f4a4dba57f874ad0";
                    n && localStorage.setItem("clientVersion_".concat(e), JSON.stringify({
                        clientVersionUpload: n,
                        version: "",
                        channelName: "",
                        cachedAt: Date.now()
                    })), V().then(e => {
                        var n;
                        if (e) {
                            let e = encodeURIComponent(window.location.href);
                            (0, N.A)(s.fO.SIGNED_OUT, "/login?returnUrl=".concat(e));
                            return
                        }
                        let a = new URLSearchParams(window.location.search).get("placeId");
                        a && /^[0-9]+$/.test(a) && B(a).catch(() => {}), null == (n = document.getElementById("loading-overlay")) || n.classList.remove("loading-auth-pending");
                        let t = document.createElement("script");
                        t.src = "".concat("/6536749aa05e452da9c4d6ed4b464613ff9ba84a/assets", "/webclient/WasmLoader.js"), document.body.appendChild(t)
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
                                children: [(0, i.jsx)(u, {}), (0, i.jsxs)("section", {
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
        },
        8212: (e, n, a) => {
            "use strict";
            a.d(n, {
                A: () => r
            });
            var t = a(7657),
                i = a(6055);
            let r = new t._({
                baseUrl: "https://apis.".concat(i.A)
            })
        },
        9099: (e, n, a) => {
            e.exports = a(6296)
        }
    }
]);