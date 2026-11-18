;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "dd4a06b6-cd35-0290-5cc3-b1059bafdada")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 998159, e => {
    "use strict";
    var r, t = ((r = {}).Edge = "edge", r.IE = "ie", r.Chrome = "chrome", r.Opera = "opera", r.Safari = "safari", r.Firefox = "firefox", r.Unknown = "", r);
    e.s(["Browser", () => t, "currentBrowser", 0, () => {
        if (navigator?.userAgent !== void 0) {
            let {
                userAgent: e
            } = navigator;
            if (null !== /Edge\/([0-9._]+)/.exec(e) || null !== /EdgA?\/([0-9.]+)/.exec(e)) return "edge";
            if (null !== /(?!Chrom.*OPR)Chrom(?:e|ium)\/([0-9.]+)(:?\s|$)/.exec(e)) return "chrome";
            if (null !== /Firefox\/([0-9.]+)(?:\s|$)/.exec(e)) return "firefox";
            if (null !== /Opera\/([0-9.]+)(?:\s|$)/.exec(e) || null !== /OPR\/([0-9.]+)(:?\s|$)/.exec(e)) return "opera";
            if (null !== /Trident\/7\.0.*rv:([0-9.]+).*\).*Gecko$/.exec(e) || null !== /MSIE\s([0-9.]+);.*Trident\/[4-7].0/.exec(e) || null !== /MSIE\s(7\.0)/.exec(e)) return "ie";
            if (null !== /Version\/([0-9._]+).*Safari/.exec(e)) return "safari"
        }
        return ""
    }])
}, 5673, 394752, e => {
    "use strict";
    let r = e.i(245837).default.domain.includes("sitetest") ? "//client.px-cloud.net/PXDU9eCzTY/main.min.js" : "//client.px-cloud.net/PXbf8PROpW/main.min.js",
        t = "captcha-v2-sensor",
        n = "px-captcha",
        i = "captcha-v2-block-script",
        l = "_px3";
    e.s(["BLOCK_SCRIPT_ID", 0, i, "CHALLENGE_ID_STORAGE_KEY", 0, "CaptchaV2ChallengeId", "DEFAULT_ACTION_TYPE", 0, "ACTION_TYPE_INVALID", "EVENT_CONSTANTS", 0, {
        eventName: "accountSecurityChallengeCaptchaV2Event",
        context: {
            challengeInitialized: "challengeInitialized",
            sensorFinished: "sensorFinished",
            challengeDisplayed: "challengeDisplayed",
            challengeCompleted: "challengeCompleted",
            challengeInvalidated: "challengeInvalidated",
            challengeAbandoned: "challengeAbandoned",
            abrLoaded: "abrLoaded",
            abrFailed: "abrFailed",
            abrSucceeded: "abrSucceeded",
            abrAccepted: "abrAccepted",
            abrRejected: "abrRejected"
        }
    }, "FEATURE_NAME", 0, "CaptchaV2", "METRICS_CONSTANTS", 0, {
        event: {
            challengeInitialized: "ChallengeInitialized",
            sensorFinished: "SensorFinished",
            challengeDisplayed: "ChallengeDisplayed",
            challengeCompleted: "ChallengeCompleted",
            challengeInvalidated: "ChallengeInvalidated",
            challengeAbandoned: "ChallengeAbandoned"
        },
        sequence: {
            challengeSolveTime: "ChallengeSolveTime",
            sensorFinishTime: "SensorFinishTime"
        }
    }, "PX_CAPTCHA_CONTAINER_ID", 0, n, "SENSOR_COOKIE_NAME", 0, l, "SENSOR_LOAD_DELAY", 0, 2e3, "SENSOR_POLL_INTERVAL", 0, 50, "SENSOR_SCRIPT_ID", 0, t, "SENSOR_SCRIPT_URL", 0, r, "TRANSLATION_NAMESPACES", 0, ["Feature.CaptchaV2Challenge"]], 394752);
    let o = {
            width: "100%",
            height: 40,
            backgroundColor: "#233679",
            fillColor: "#335FFF",
            borderColor: "#233679",
            borderWidth: 0,
            innerMargin: 0,
            textColor: "#FFFFFF",
            borderRadius: 8,
            css: ["https://cdn.foundation.roblox.com/current/human-captcha/challenge.css"],
            textFont: "Builder Sans, Helvetica Neue, Helvetica, Arial, Lucida Grande, sans-serif",
            texSize: 14,
            fontWeight: 600,
            textTransform: "none",
            animation: !1
        },
        a = e => {
            if (null !== document.getElementById(t)) return void e?.();
            let n = document.createElement("script");
            n.id = t, n.type = "text/javascript", n.src = r, n.async = !0;
            let i = document.querySelector("script[nonce]")?.nonce;
            i && (n.nonce = i), e && (n.onload = e), document.head.appendChild(n)
        },
        s = () => document.cookie.split("; ").some(e => e.startsWith(`${l}=`));
    e.s(["clearCaptchaSuccessCallback", 0, () => {
        delete window._pxOnCaptchaSuccess
    }, "preloadSensor", 0, () => {
        let e = () => a();
        "function" == typeof window.requestIdleCallback ? window.requestIdleCallback(e) : window.setTimeout(e, 0)
    }, "setCaptchaSuccessCallback", 0, e => {
        window._pxOnCaptchaSuccess = e
    }, "startCustomChallenge", 0, (e, r) => {
        let {
            buttonLabel: t,
            onCaptchaEvent: l
        } = r, a = window;
        a._pxAppId = e.appId, a._pxJsClientSrc = e.jsClientSrc, a._pxFirstPartyEnabled = e.firstPartyEnabled, a._pxVid = e.vid, a._pxUuid = e.uuid, a._pxHostUrl = e.hostUrl, void 0 !== e.blockedUrl && (a._pxBlockedUrl = e.blockedUrl);
        let s = `_${e.appId}`;
        window[s] = {
            challenge: {
                view: {
                    ...o
                },
                translation: {
                    default: {
                        btn: t
                    }
                },
                context: {
                    failed: {
                        color: "transparent",
                        fontSize: "0px"
                    }
                }
            }
        };
        let u = `${e.appId}_asyncInit`;
        window[u] = e => {
            l && e.Events.on("captcha", l)
        }, document.getElementById(i)?.remove();
        let d = document.createElement("script");
        return d.id = i, d.type = "text/javascript", d.src = e.blockScript, d.async = !0, document.head.appendChild(d), () => {
            d.remove(), document.getElementById(n)?.replaceChildren(), delete a._pxAppId, delete a._pxJsClientSrc, delete a._pxFirstPartyEnabled, delete a._pxVid, delete a._pxUuid, delete a._pxHostUrl, delete a._pxBlockedUrl, Reflect.deleteProperty(window, s), Reflect.deleteProperty(window, u)
        }
    }, "waitForSensorReady", 0, e => {
        let r = 0,
            t = 0,
            n = !1,
            i = () => {
                window.clearInterval(r), window.clearTimeout(t)
            },
            l = r => {
                n || (n = !0, i(), e(r))
            };
        return t = window.setTimeout(l, 2e3, !1), a(() => {
            if (!n) {
                if (s()) return void l(!0);
                r = window.setInterval(() => {
                    s() && l(!0)
                }, 50)
            }
        }), i
    }], 5673)
}, 178595, e => {
    "use strict";
    var r = e.i(371847),
        t = e.i(217827);
    e.s(["default", 0, function() {
        return (0, r.useEffect)(() => (0, t.startRealtime)(), []), null
    }])
}, 206181, e => {
    "use strict";
    var r = e.i(371847),
        t = e.i(645020),
        n = e.i(126392);
    e.i(350223);
    var i = e.i(874296),
        l = e.i(245837),
        o = e.i(357355),
        a = e.i(646424),
        s = e.i(587541);
    let u = ["click", "dblclick", "focus", "hover", "keypress", "mousedown", "mouseenter", "mouseover", "scroll", "touchmove", "touchstart"],
        d = ["blur"],
        c = i.object({
            isEnabled: i.optional(i.boolean()),
            rolloutPercentage: i.optional(i.number()),
            intervalTimeMs: i.optional(i.number())
        }),
        m = () => s.Url.parse(l.default.apiGatewayUrl).getOrThrow(),
        p = async e => {
            let r = await a.get(m().withPath("/guac-v2/v1/bundles/user-heartbeats"), c, {
                credentials: "include"
            });
            if (r.isErr()) return "configFailed";
            let t = r.value;
            return !0 !== t.isEnabled || e % 100 >= (t.rolloutPercentage ?? 0) ? "gatedOff" : t.intervalTimeMs ?? 3e4
        }, f = async () => (await a.postUntyped(m().withPath("/user-heartbeats-api/pulse"), {
            clientSideTimestampEpochMs: Date.now(),
            sessionInfo: {
                sessionId: /sessionid=([a-f0-9-]{36})/.exec(o.document?.cookie ?? "")?.[1] ?? "unknown"
            },
            locationInfo: {
                websiteLocationInfo: {
                    url: o.window?.location.href ?? ""
                }
            }
        }, {
            credentials: "include"
        })).isOk();
    var h = e.i(981498);
    e.s(["default", 0, function() {
        return (0, r.useEffect)(() => {
            var e;
            let r, i, l, a, s, c, m, b, v = (0, n.getCurrentUser)()?.id,
                g = null == v ? null : (0, t.parseInt)(v);
            return null == g ? void 0 : (e = e => {
                (0, h.trackAppShellCounter)("PresenceHeartbeat", {
                    outcome: e
                })
            }, i = !1, l = !1, a = !1, s = 3e4, c = () => {
                l = !0, a = !1, f().then(r => {
                    e?.(r ? "sent" : "failed")
                }), r = setTimeout(() => {
                    a ? c() : l = !1
                }, s)
            }, m = () => {
                l ? a = !0 : c()
            }, b = () => {
                a = !1
            }, p(g).then(r => {
                if (!i) {
                    if ("string" == typeof r) return void e?.(r);
                    s = r, e?.("started"), u.forEach(e => {
                        o.window?.addEventListener(e, m, {
                            passive: !0
                        })
                    }), d.forEach(e => {
                        o.window?.addEventListener(e, b)
                    }), c()
                }
            }), () => {
                i = !0, clearTimeout(r), u.forEach(e => {
                    o.window?.removeEventListener(e, m)
                }), d.forEach(e => {
                    o.window?.removeEventListener(e, b)
                })
            })
        }, []), null
    }], 206181)
}, 383924, e => {
    "use strict";
    var r = e.i(371847),
        t = e.i(126392),
        n = e.i(981498);
    let i = !1;
    e.s(["default", 0, function() {
        return (0, r.useEffect)(() => {
            i || (i = !0, (0, n.trackAppShellCounter)("ShellStart", {
                auth_state: null == (0, t.getCurrentUser)() ? "unauthenticated" : "authenticated"
            }))
        }, []), null
    }])
}, 724385, e => {
    "use strict";
    var r = e.i(809804),
        t = e.i(371847),
        n = e.i(652447),
        i = e.i(432464),
        l = e.i(645180);
    e.s(["default", 0, function() {
        return (0, t.useSyncExternalStore)(l.subscribe, l.getSnapshot, l.getServerSnapshot).map(e => {
            let {
                key: t,
                container: l,
                app: o
            } = e;
            return (0, n.createPortal)((0, r.jsx)(i.ErrorBoundary, {
                children: o
            }), l, String(t))
        })
    }])
}, 834591, e => {
    "use strict";
    var r = e.i(371847),
        t = e.i(357355),
        n = e.i(5673);
    let i = () => {
        if (null == t.document || null == t.window) return;
        if ("complete" === t.document.readyState) return void(0, n.preloadSensor)();
        let e = () => {
            (0, n.preloadSensor)()
        };
        return t.window.addEventListener("load", e, {
            once: !0
        }), () => {
            t.window?.removeEventListener("load", e)
        }
    };
    e.s(["default", 0, function() {
        return (0, r.useEffect)(i, []), null
    }], 834591)
}, 910219, e => {
    "use strict";
    var r = e.i(371847),
        t = e.i(357355),
        n = e.i(341332),
        i = e.i(998159);
    let l = () => {
        let e = (0, n.getDeviceMeta)();
        return (0, i.currentBrowser)() === i.Browser.Chrome && null !== e && !e.isInApp && (e.isDesktop && ((0, n.isWindows)() || (0, n.isMac)()) || e.isAndroidDevice)
    };
    var o = e.i(883355);
    let a = "RBX_WASM_DEVICE_PROBE_V1_P3",
        s = ["wasmSimd", "wasmExceptions", "jspi", "bulkMemory", "bigInt", "sharedArrayBuffer", "crossOriginIsolated", "atomics", "webWorkers", "webgl2", "webSocket", "fetch", "audioContext", "audioWorklet", "opfs", "textDecoder", "can2GBAlloc", "can4GBAlloc"],
        u = [
            ["Edge", /\bEdg(?:e|A|iOS)?\/(\d+)/],
            ["Opera", /\bOPR\/(\d+)/],
            ["SamsungBrowser", /\bSamsungBrowser\/(\d+)/],
            ["Firefox", /\b(?:Firefox|FxiOS)\/(\d+)/],
            ["Chrome", /\b(?:Chrome|CriOS)\/(\d+)/],
            ["Safari", /\bVersion\/(\d+)\b.*\bSafari\//]
        ],
        d = () => {
            let e = t.navigator?.userAgent ?? "";
            for (let [r, t] of u) {
                let n = t.exec(e)?.[1];
                if (null != n) return `${r}/${n}`
            }
            return "unknown"
        },
        c = e => "object" == typeof e && null !== e && !Array.isArray(e),
        m = e => "number" == typeof e && Number.isFinite(e),
        p = e => {
            let {
                isolated: r,
                cpu: t,
                gpu: n,
                memory: i
            } = e, l = (e => {
                if (!c(e)) return null;
                let r = {};
                for (let t of s) {
                    let n = e[t];
                    if ("boolean" != typeof n) return null;
                    r[t] = n
                }
                return r
            })(e.features);
            return "boolean" == typeof r && null != l && c(t) && m(t.effectiveCores) && m(t.singleThreadScore) && c(n) && "boolean" == typeof n.webgl2Renders && m(n.fillPassesPerMs) && c(i) && (null === i.deviceMemoryGiB || m(i.deviceMemoryGiB)) && m(i.maxSharedAllocMiB) ? {
                isolated: r,
                features: l,
                cpu: {
                    effectiveCores: t.effectiveCores,
                    singleThreadScore: t.singleThreadScore
                },
                gpu: {
                    webgl2Renders: n.webgl2Renders,
                    fillPassesPerMs: n.fillPassesPerMs
                },
                memory: {
                    deviceMemoryGiB: i.deviceMemoryGiB,
                    maxSharedAllocMiB: i.maxSharedAllocMiB
                }
            } : null
        },
        f = e => {
            let r = (0, o.getItem)(a);
            if (!c(r) || r.browser !== d() || !m(r.measuredAt)) return null;
            let t = e - r.measuredAt;
            return t >= 0 && t < 1728e5 ? p(r) : null
        },
        h = new Set(["error", "timeout", "crashed"]),
        b = () => {
            let e = (0, o.getItem)(a);
            return c(e) && e.browser === d() && m(e.failedAt) && m(e.failureCount) && !(e.failureCount < 1) && h.has(e.reason) ? {
                browser: e.browser,
                failedAt: e.failedAt,
                failureCount: e.failureCount,
                reason: e.reason
            } : null
        },
        v = (e, r) => {
            let t = b();
            if (null == t) return !1;
            let n = e - t.failedAt,
                i = t.failureCount >= 2 ? 864e5 : 36e5;
            return n >= 0 && n < i && !("crashed" === t.reason && n < r)
        },
        g = (e, r, t) => ((0, o.removeItem)("RBX_WASM_DEVICE_PROBE"), (0, o.setItem)(a, {
            browser: d(),
            failedAt: t,
            failureCount: r,
            reason: e
        }).isOk()),
        S = e => {
            null == e ? (0, o.removeItem)(a) : (0, o.setItem)(a, e)
        },
        w = {
            requiredFeatures: ["wasmSimd", "wasmExceptions", "jspi", "bulkMemory", "atomics", "webWorkers", "webgl2", "can2GBAlloc"],
            minDeviceMemoryGiB: 4,
            minEffectiveCores: 4,
            minSingleThreadScore: 0,
            minWebgl2FillPassesPerMs: 0,
            requireWebgl2Renders: !0
        },
        y = (e, r) => {
            let t = r.requiredFeatures.filter(r => !Object.hasOwn(e.features, r) || !e.features[r]).map(e => `feature:${e}`),
                {
                    deviceMemoryGiB: n
                } = e.memory;
            return r.minDeviceMemoryGiB > 0 && (n ?? 0) < r.minDeviceMemoryGiB && t.push("minDeviceMemoryGiB"), e.cpu.effectiveCores < r.minEffectiveCores && t.push("minEffectiveCores"), e.cpu.singleThreadScore < r.minSingleThreadScore && t.push("minSingleThreadScore"), e.gpu.fillPassesPerMs < r.minWebgl2FillPassesPerMs && t.push("minWebgl2FillPassesPerMs"), r.requireWebgl2Renders && !e.gpu.webgl2Renders && t.push("requireWebgl2Renders"), t
        },
        E = {
            enabled: !1,
            requiredSpec: w,
            timeoutMs: 1e4
        },
        C = E,
        x = e => "number" == typeof e && Number.isFinite(e) && e >= 0,
        P = () => !0,
        A = {
            probeFailed: () => void 0,
            specNotMet: () => void 0,
            probeCompleted: () => void 0
        },
        I = P,
        M = (e, r) => {
            try {
                A[e](r)
            } catch {}
        },
        T = () => {
            try {
                return I()
            } catch {
                return !1
            }
        },
        _ = null,
        F = async e => {
            let r = t.navigator?.locks;
            return null == r ? e(C.timeoutMs) : await r.request("rbx-device-probe", () => e(0))
        }, k = async () => (await new Promise(e => {
            let r = t.document;
            if (r?.visibilityState !== "hidden") return void e();
            let n = () => {
                "hidden" !== r.visibilityState && (r.removeEventListener("visibilitychange", n), e())
            };
            r.addEventListener("visibilitychange", n)
        }), F(async e => {
            var r;
            let n, i = f(Date.now());
            if (null != i) return i;
            if (v(Date.now(), e) || !C.enabled) return null;
            let l = d();
            if (t.document?.visibilityState === "hidden") return M("probeFailed", {
                reason: "hidden",
                durationMs: 0,
                browser: l,
                isolated: null
            }), null;
            let s = b(),
                u = (s?.failureCount ?? 0) + 1,
                m = Date.now();
            if (!g("crashed", u, m)) return null;
            let h = await (n = C.timeoutMs, new Promise(e => {
                    let r = t.window,
                        i = t.document;
                    if (null == r || null == i) return void e({
                        ok: !1,
                        reason: "error"
                    });
                    let l = i.createElement("iframe"),
                        o = [],
                        a = r => {
                            for (let e of o) e();
                            l.remove(), e(r)
                        };
                    l.src = `/device-probe?v=${encodeURIComponent("1.2.0")}`, l.title = "Device probe", l.tabIndex = -1, l.setAttribute("aria-hidden", "true"), l.style.cssText = "position:fixed;top:0;left:0;width:1px;height:1px;border:0;opacity:0;pointer-events:none";
                    let s = "u" < typeof performance ? 0 : performance.now(),
                        u = () => {
                            let e;
                            e = l.src, "u" > typeof performance && "function" == typeof performance.getEntriesByName && performance.getEntriesByName(e).some(e => e.startTime >= s && "responseStatus" in e && "number" == typeof e.responseStatus && e.responseStatus >= 400) && a({
                                ok: !1,
                                reason: "error"
                            })
                        },
                        d = e => {
                            let t = e.data;
                            e.origin === r.location.origin && null != e.source && e.source === l.contentWindow && "object" == typeof t && null !== t && "rbx-device-probe:result" === t.type && 3 === t.version && a(!0 === t.ok ? {
                                ok: !0,
                                scores: t.scores
                            } : {
                                ok: !1,
                                reason: "error"
                            })
                        },
                        c = () => {
                            "hidden" === i.visibilityState && a({
                                ok: !1,
                                reason: "hidden"
                            })
                        };
                    l.addEventListener("load", u), i.body.append(l), r.addEventListener("message", d), i.addEventListener("visibilitychange", c);
                    let m = setTimeout(() => {
                        a({
                            ok: !1,
                            reason: "timeout"
                        })
                    }, n);
                    o.push(() => {
                        clearTimeout(m), l.removeEventListener("load", u), r.removeEventListener("message", d), i.removeEventListener("visibilitychange", c)
                    })
                })).catch(() => ({
                    ok: !1,
                    reason: "error"
                })),
                w = Date.now() - m,
                E = h.ok ? (e => {
                    if (!c(e) || !c(e.features) || !c(e.cpu)) return null;
                    let {
                        measuredWhileVisible: r
                    } = e.cpu, t = c(e.gpu) && c(e.gpu.webgl2) ? e.gpu.webgl2 : {}, n = p({
                        isolated: e.features.crossOriginIsolated,
                        features: e.features,
                        cpu: e.cpu,
                        gpu: {
                            webgl2Renders: t.renders,
                            fillPassesPerMs: t.fillPassesPerMs
                        },
                        memory: e.memory
                    });
                    return null == n || "boolean" != typeof r || n.cpu.effectiveCores < 1 || "error" === t.renderer ? null : {
                        measurement: n,
                        measuredWhileVisible: r
                    }
                })(h.scores) : null;
            if (null == E) {
                let e = h.ok ? "error" : h.reason;
                return "hidden" === e ? S(s) : g(e, u, Date.now()), M("probeFailed", {
                    reason: e,
                    durationMs: w,
                    browser: l,
                    isolated: null
                }), null
            }
            let {
                measurement: x,
                measuredWhileVisible: P
            } = E, {
                isolated: A
            } = x;
            if (!P) return S(s), M("probeFailed", {
                reason: "throttled",
                durationMs: w,
                browser: l,
                isolated: A
            }), null;
            r = Date.now(), (0, o.setItem)(a, {
                measuredAt: r,
                browser: d(),
                ...x
            }), M("probeCompleted", {
                durationMs: w,
                browser: l,
                isolated: A,
                scores: x
            });
            let I = y(x, C.requiredSpec);
            return I.length > 0 && M("specNotMet", {
                failedRules: I,
                browser: l,
                isolated: A,
                scores: x
            }), x
        })), R = async () => {
            try {
                return await k()
            } catch {
                return M("probeFailed", {
                    reason: "error",
                    durationMs: 0,
                    browser: d(),
                    isolated: null
                }), null
            }
        }, B = async () => {
            try {
                if (!T()) return !1;
                let e = f(Date.now());
                if (null == e && (v(Date.now(), C.timeoutMs) || !C.enabled || (_ ??= R().finally(() => {
                        _ = null
                    }), e = await _, !T()))) return !1;
                return null != e && 0 === y(e, C.requiredSpec).length
            } catch {
                return !1
            }
        };
    e.s(["default", 0, function() {
        return (0, r.useEffect)(() => {
            (() => {
                var e, r;
                let n, i = t.window;
                if (null == i || !0 === i.rbxDeviceProbeBackgroundRun || (i.rbxDeviceProbeBackgroundRun = !0, i.top !== i) || (I = l ?? P, null !== (() => {
                        try {
                            if (!T()) return !1;
                            let e = Date.now(),
                                r = f(e);
                            if (null == r) return !v(e, C.timeoutMs) && null;
                            return 0 === y(r, C.requiredSpec).length
                        } catch {
                            return null
                        }
                    })())) return;
                C = {
                    enabled: !0 === (e = {
                        enabled: !0
                    }).enabled,
                    requiredSpec: null == e.requiredSpec ? w : {
                        requiredFeatures: Array.isArray((r = e.requiredSpec).requiredFeatures) && r.requiredFeatures.every(e => "string" == typeof e) ? r.requiredFeatures : w.requiredFeatures,
                        minDeviceMemoryGiB: x(r.minDeviceMemoryGiB) ? r.minDeviceMemoryGiB : w.minDeviceMemoryGiB,
                        minEffectiveCores: x(r.minEffectiveCores) ? r.minEffectiveCores : w.minEffectiveCores,
                        minSingleThreadScore: x(r.minSingleThreadScore) ? r.minSingleThreadScore : w.minSingleThreadScore,
                        minWebgl2FillPassesPerMs: x(r.minWebgl2FillPassesPerMs) ? r.minWebgl2FillPassesPerMs : w.minWebgl2FillPassesPerMs,
                        requireWebgl2Renders: "boolean" == typeof r.requireWebgl2Renders ? r.requireWebgl2Renders : w.requireWebgl2Renders
                    },
                    timeoutMs: x(n = e.timeoutMs) && n > 0 ? e.timeoutMs : E.timeoutMs
                };
                let o = () => {
                    B()
                };
                t.document?.readyState === "complete" ? o() : i.addEventListener("load", o, {
                    once: !0
                })
            })()
        }, []), null
    }], 910219)
}, 925195, e => {
    "use strict";
    var r = e.i(809804),
        t = e.i(371847),
        n = e.i(652447),
        i = e.i(865581),
        l = e.i(432464),
        o = e.i(55336);
    let a = (0, i.default)(() => e.A(80066), {
        loadableGenerated: {
            modules: [391651]
        },
        ssr: !1,
        loading: () => null
    });
    e.s(["default", 0, function() {
        return (0, t.useSyncExternalStore)(o.subscribe, o.getSnapshot, o.getServerSnapshot) ? (0, n.createPortal)((0, r.jsx)(l.ErrorBoundary, {
            children: (0, r.jsx)(a, {})
        }), document.body) : null
    }])
}, 26853, e => {
    "use strict";
    var r = e.i(809804),
        t = e.i(371847),
        n = e.i(577896);
    let i = (0, t.createContext)(n.defaultRootDomain);
    e.s(["DomainProvider", 0, function(e) {
        let {
            domain: t,
            children: n
        } = e;
        return (0, r.jsx)(i.Provider, {
            value: t,
            children: n
        })
    }, "usePageDomain", 0, () => (0, t.useContext)(i)])
}, 860834, e => {
    e.v(r => Promise.all(["static/chunks/01sqoc6rh7hn6.js", "static/chunks/0o41rrf.qz-eb.js"].map(r => e.l(r))).then(() => r(60484)))
}, 80066, e => {
    e.v(r => Promise.all(["static/chunks/013amlr3tfj2x.js", "static/chunks/084nx-e0ruby..js", "static/chunks/0f27m0g5rn33v.js"].map(r => e.l(r))).then(() => r(391651)))
}]);

//# debugId=dd4a06b6-cd35-0290-5cc3-b1059bafdada
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0o.2_j4zii606.js.map