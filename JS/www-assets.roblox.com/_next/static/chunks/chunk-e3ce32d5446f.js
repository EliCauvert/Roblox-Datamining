;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "008b38c9-7568-a1f5-8c04-e9972bfd5147")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 139047, e => {
    "use strict";
    var r = e.i(245837),
        t = e.i(10224);
    let n = async (e, n) => {
        let l = ((e, t) => {
            let {
                apiGatewayUrl: n
            } = r.default, l = "/guac-v2/v1/bundles/<behaviour-name>".replace("<behaviour-name>", e), i = t?.toString() ?? "";
            return `${n}${l}${""===i?"":`?${i}`}`
        })(e, n);
        return (await (0, t.get)({
            url: l,
            withCredentials: !0
        })).data
    };
    e.s(["callBehaviour", 0, n])
}, 998159, e => {
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
        l = "captcha-v2-block-script",
        i = "_px3";
    e.s(["BLOCK_SCRIPT_ID", 0, l, "CHALLENGE_ID_STORAGE_KEY", 0, "CaptchaV2ChallengeId", "DEFAULT_ACTION_TYPE", 0, "ACTION_TYPE_INVALID", "EVENT_CONSTANTS", 0, {
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
            challengeAbandoned: "ChallengeAbandoned",
            abrLoaded: "AbrLoaded",
            abrFailed: "AbrFailed",
            abrSucceeded: "AbrSucceeded",
            abrAccepted: "AbrAccepted",
            abrRejected: "AbrRejected"
        },
        sequence: {
            challengeSolveTime: "ChallengeSolveTime",
            sensorFinishTime: "SensorFinishTime"
        }
    }, "PX_CAPTCHA_CONTAINER_ID", 0, n, "SENSOR_COOKIE_NAME", 0, i, "SENSOR_LOAD_DELAY", 0, 2e3, "SENSOR_POLL_INTERVAL", 0, 50, "SENSOR_SCRIPT_ID", 0, t, "SENSOR_SCRIPT_URL", 0, r, "TRANSLATION_NAMESPACES", 0, ["Feature.CaptchaV2Challenge"]], 394752);
    let a = {
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
        o = e => {
            if (null !== document.getElementById(t)) return void e?.();
            let n = document.createElement("script");
            n.id = t, n.type = "text/javascript", n.src = r, n.async = !0;
            let l = document.querySelector("script[nonce]")?.nonce;
            l && (n.nonce = l), e && (n.onload = e), document.head.appendChild(n)
        },
        s = () => document.cookie.split("; ").some(e => e.startsWith(`${i}=`));
    e.s(["clearCaptchaSuccessCallback", 0, () => {
        delete window._pxOnCaptchaSuccess
    }, "preloadSensor", 0, () => {
        let e = () => o();
        "function" == typeof window.requestIdleCallback ? window.requestIdleCallback(e) : window.setTimeout(e, 0)
    }, "setCaptchaSuccessCallback", 0, e => {
        window._pxOnCaptchaSuccess = e
    }, "startCustomChallenge", 0, (e, r) => {
        let {
            buttonLabel: t,
            onCaptchaEvent: i
        } = r, o = window;
        o._pxAppId = e.appId, o._pxJsClientSrc = e.jsClientSrc, o._pxFirstPartyEnabled = e.firstPartyEnabled, o._pxVid = e.vid, o._pxUuid = e.uuid, o._pxHostUrl = e.hostUrl, void 0 !== e.blockedUrl && (o._pxBlockedUrl = e.blockedUrl);
        let s = `_${e.appId}`;
        window[s] = {
            challenge: {
                view: {
                    ...a
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
            i && e.Events.on("captcha", i)
        }, document.getElementById(l)?.remove();
        let d = document.createElement("script");
        return d.id = l, d.type = "text/javascript", d.src = e.blockScript, d.async = !0, document.head.appendChild(d), () => {
            d.remove(), document.getElementById(n)?.replaceChildren(), delete o._pxAppId, delete o._pxJsClientSrc, delete o._pxFirstPartyEnabled, delete o._pxVid, delete o._pxUuid, delete o._pxHostUrl, delete o._pxBlockedUrl, Reflect.deleteProperty(window, s), Reflect.deleteProperty(window, u)
        }
    }, "waitForSensorReady", 0, e => {
        let r = 0,
            t = 0,
            n = !1,
            l = () => {
                window.clearInterval(r), window.clearTimeout(t)
            },
            i = r => {
                n || (n = !0, l(), e(r))
            };
        return t = window.setTimeout(i, 2e3, !1), o(() => {
            if (!n) {
                if (s()) return void i(!0);
                r = window.setInterval(() => {
                    s() && i(!0)
                }, 50)
            }
        }), l
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
    var l = e.i(874296),
        i = e.i(245837),
        a = e.i(357355),
        o = e.i(646424),
        s = e.i(587541);
    let u = ["click", "dblclick", "focus", "hover", "keypress", "mousedown", "mouseenter", "mouseover", "scroll", "touchmove", "touchstart"],
        d = ["blur"],
        c = l.object({
            isEnabled: l.optional(l.boolean()),
            rolloutPercentage: l.optional(l.number()),
            intervalTimeMs: l.optional(l.number())
        }),
        f = () => s.Url.parse(i.default.apiGatewayUrl).getOrThrow(),
        m = async e => {
            let r = await o.get(f().withPath("/guac-v2/v1/bundles/user-heartbeats"), c, {
                credentials: "include"
            });
            if (r.isErr()) return "configFailed";
            let t = r.value;
            return !0 !== t.isEnabled || e % 100 >= (t.rolloutPercentage ?? 0) ? "gatedOff" : t.intervalTimeMs ?? 3e4
        }, p = async () => (await o.postUntyped(f().withPath("/user-heartbeats-api/pulse"), {
            clientSideTimestampEpochMs: Date.now(),
            sessionInfo: {
                sessionId: /sessionid=([a-f0-9-]{36})/.exec(a.document?.cookie ?? "")?.[1] ?? "unknown"
            },
            locationInfo: {
                websiteLocationInfo: {
                    url: a.window?.location.href ?? ""
                }
            }
        }, {
            credentials: "include"
        })).isOk();
    var h = e.i(981498);
    e.s(["default", 0, function() {
        return (0, r.useEffect)(() => {
            var e;
            let r, l, i, o, s, c, f, b, v = (0, n.getCurrentUser)()?.id,
                g = null == v ? null : (0, t.parseInt)(v);
            return null == g ? void 0 : (e = e => {
                (0, h.trackAppShellCounter)("PresenceHeartbeat", {
                    outcome: e
                })
            }, l = !1, i = !1, o = !1, s = 3e4, c = () => {
                i = !0, o = !1, p().then(r => {
                    e?.(r ? "sent" : "failed")
                }), r = setTimeout(() => {
                    o ? c() : i = !1
                }, s)
            }, f = () => {
                i ? o = !0 : c()
            }, b = () => {
                o = !1
            }, m(g).then(r => {
                if (!l) {
                    if ("string" == typeof r) return void e?.(r);
                    s = r, e?.("started"), u.forEach(e => {
                        a.window?.addEventListener(e, f, {
                            passive: !0
                        })
                    }), d.forEach(e => {
                        a.window?.addEventListener(e, b)
                    }), c()
                }
            }), () => {
                l = !0, clearTimeout(r), u.forEach(e => {
                    a.window?.removeEventListener(e, f)
                }), d.forEach(e => {
                    a.window?.removeEventListener(e, b)
                })
            })
        }, []), null
    }], 206181)
}, 383924, e => {
    "use strict";
    var r = e.i(371847),
        t = e.i(126392),
        n = e.i(981498);
    let l = !1;
    e.s(["default", 0, function() {
        return (0, r.useEffect)(() => {
            l || (l = !0, (0, n.trackAppShellCounter)("ShellStart", {
                auth_state: null == (0, t.getCurrentUser)() ? "unauthenticated" : "authenticated"
            }))
        }, []), null
    }])
}, 724385, e => {
    "use strict";
    var r = e.i(809804),
        t = e.i(371847),
        n = e.i(652447),
        l = e.i(432464),
        i = e.i(645180);
    e.s(["default", 0, function() {
        return (0, t.useSyncExternalStore)(i.subscribe, i.getSnapshot, i.getServerSnapshot).map(e => {
            let {
                key: t,
                container: i,
                app: a
            } = e;
            return (0, n.createPortal)((0, r.jsx)(l.ErrorBoundary, {
                children: a
            }), i, String(t))
        })
    }])
}, 834591, e => {
    "use strict";
    var r = e.i(371847),
        t = e.i(357355),
        n = e.i(5673);
    let l = () => {
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
        return (0, r.useEffect)(l, []), null
    }], 834591)
}, 910219, e => {
    "use strict";
    var r = e.i(371847),
        t = e.i(357355),
        n = e.i(341332),
        l = e.i(998159);
    let i = () => {
        let e = (0, n.getDeviceMeta)();
        return (0, l.currentBrowser)() === l.Browser.Chrome && null !== e && !e.isInApp && (e.isDesktop && ((0, n.isWindows)() || (0, n.isMac)()) || e.isAndroidDevice)
    };
    var a = e.i(883355);
    let o = {
            requiredFeatures: ["wasmSimd", "wasmExceptions", "jspi", "bulkMemory", "atomics", "webWorkers", "webgl2", "can2GBAlloc"],
            minDeviceMemoryGiB: 4,
            minEffectiveCores: 4,
            minSingleThreadScore: 0,
            minWebgl2FillPassesPerMs: 0,
            requireWebgl2Renders: !0
        },
        s = (e, r) => r.minDeviceMemoryGiB > 0 && (e ?? 0) < r.minDeviceMemoryGiB,
        u = (e, r) => {
            let t, n = (t = e.features, r.requiredFeatures.filter(e => !Object.hasOwn(t, e) || !t[e]).map(e => `feature:${e}`));
            return s(e.memory.deviceMemoryGiB, r) && n.push("minDeviceMemoryGiB"), e.cpu.effectiveCores < r.minEffectiveCores && n.push("minEffectiveCores"), e.cpu.singleThreadScore < r.minSingleThreadScore && n.push("minSingleThreadScore"), e.gpu.fillPassesPerMs < r.minWebgl2FillPassesPerMs && n.push("minWebgl2FillPassesPerMs"), r.requireWebgl2Renders && !e.gpu.webgl2Renders && n.push("requireWebgl2Renders"), n
        },
        d = {
            enabled: !1,
            requiredSpec: o,
            timeoutMs: 1e4
        },
        c = d,
        f = e => "number" == typeof e && Number.isFinite(e) && e >= 0,
        m = "RBX_WASM_DEVICE_PROBE",
        p = `${m}_`,
        h = e => {
            try {
                let r = JSON.parse(e ?? "null");
                if ("object" != typeof r || null === r) return null;
                let t = Reflect.get(r, "measuredAt"),
                    n = "number" == typeof t ? t : Reflect.get(r, "failedAt");
                return "number" == typeof n && Number.isFinite(n) ? n : null
            } catch {
                return null
            }
        },
        b = "RBX_WASM_DEVICE_PROBE_V1_P3",
        v = ["wasmSimd", "wasmExceptions", "jspi", "bulkMemory", "bigInt", "sharedArrayBuffer", "crossOriginIsolated", "atomics", "webWorkers", "webgl2", "webSocket", "fetch", "audioContext", "audioWorklet", "opfs", "textDecoder", "can2GBAlloc", "can4GBAlloc"],
        g = [
            ["Edge", /\bEdg(?:e|A|iOS)?\/(\d+)/],
            ["Opera", /\bOPR\/(\d+)/],
            ["SamsungBrowser", /\bSamsungBrowser\/(\d+)/],
            ["Firefox", /\b(?:Firefox|FxiOS)\/(\d+)/],
            ["Chrome", /\b(?:Chrome|CriOS)\/(\d+)/],
            ["Safari", /\bVersion\/(\d+)\b.*\bSafari\//]
        ],
        w = () => {
            let e = t.navigator?.userAgent ?? "";
            for (let [r, t] of g) {
                let n = t.exec(e)?.[1];
                if (null != n) return `${r}/${n}`
            }
            return "unknown"
        },
        S = e => "object" == typeof e && null !== e && !Array.isArray(e),
        y = e => "number" == typeof e && Number.isFinite(e),
        E = e => {
            let {
                isolated: r,
                cpu: t,
                gpu: n,
                memory: l
            } = e, i = (e => {
                if (!S(e)) return null;
                let r = {};
                for (let t of v) {
                    let n = e[t];
                    if ("boolean" != typeof n) return null;
                    r[t] = n
                }
                return r
            })(e.features);
            return "boolean" == typeof r && null != i && S(t) && y(t.effectiveCores) && y(t.singleThreadScore) && S(n) && "boolean" == typeof n.webgl2Renders && y(n.fillPassesPerMs) && S(l) && (null === l.deviceMemoryGiB || y(l.deviceMemoryGiB)) && y(l.maxSharedAllocMiB) ? {
                isolated: r,
                features: i,
                cpu: {
                    effectiveCores: t.effectiveCores,
                    singleThreadScore: t.singleThreadScore
                },
                gpu: {
                    webgl2Renders: n.webgl2Renders,
                    fillPassesPerMs: n.fillPassesPerMs
                },
                memory: {
                    deviceMemoryGiB: l.deviceMemoryGiB,
                    maxSharedAllocMiB: l.maxSharedAllocMiB
                }
            } : null
        },
        C = new Set(["minDeviceMemoryGiB", "minEffectiveCores", "minSingleThreadScore", "minWebgl2FillPassesPerMs", "requireWebgl2Renders", "softwareRenderer"]),
        A = new Set(v.map(e => `feature:${e}`)),
        R = e => C.has(e) || A.has(e),
        P = e => {
            let r = (0, a.getItem)(b);
            if (!S(r) || r.browser !== w() || !y(r.measuredAt)) return null;
            let {
                measuredAt: t
            } = r, n = Math.min(y(r.expiresAt) ? r.expiresAt : t + 1728e5, t + 6048e5);
            return e >= t && e < n ? E(r) : null
        },
        x = (e, r) => {
            let t = 0 === u(e, c.requiredSpec).length;
            (0, a.setItem)(b, {
                measuredAt: r,
                expiresAt: r + (t ? 6048e5 : 1728e5),
                browser: w(),
                ...e
            })
        },
        I = new Set(["error", "timeout", "crashed"]),
        M = () => {
            let e = (0, a.getItem)(b);
            return S(e) && e.browser === w() && y(e.failedAt) && y(e.failureCount) && !(e.failureCount < 1) && I.has(e.reason) ? {
                browser: e.browser,
                failedAt: e.failedAt,
                failureCount: e.failureCount,
                reason: e.reason,
                ...!0 === e.crashReported && {
                    crashReported: !0
                }
            } : null
        },
        _ = (e, r) => {
            let t = M();
            if (null == t) return null;
            let n = e - t.failedAt,
                l = t.failureCount >= 2 ? 6048e5 : 36e5;
            return n >= 0 && n < l && !("crashed" === t.reason && n < r) ? t : null
        },
        k = (e, r, t) => (0, a.setItem)(b, {
            browser: w(),
            failedAt: t,
            failureCount: r,
            reason: e
        }).isOk(),
        T = e => {
            null == e ? (0, a.removeItem)(b) : (0, a.setItem)(b, e)
        };
    var B = e.i(139047);
    let F = "RBX_WASM_WEB_PLAY_NOT_OFFERED",
        D = "RBX_WASM_WEB_PLAY_REGION_UNKNOWN",
        O = (e, r, n) => {
            try {
                let l = Number(t.window?.sessionStorage.getItem(e)),
                    i = n - l;
                return Number.isFinite(l) && l > 0 && i >= 0 && i < r
            } catch {
                return !1
            }
        },
        N = () => e.A(301475).then(e => e.deviceProbeTelemetry),
        L = () => !0,
        q = L,
        W = null,
        j = [],
        G = "unloaded",
        U = (e, r) => {
            let [t, n] = r;
            try {
                e[t](n)
            } catch {}
        },
        $ = (e, r) => {
            try {
                let t = [e, r];
                if (null != W) return void U(W, t);
                if ("failed" === G) return;
                j.push(t), "unloaded" === G && (G = "loading", Promise.resolve().then(N).then(e => {
                    W = e;
                    let r = j;
                    for (let t of (j = [], r)) U(e, t)
                }, () => {
                    G = "failed", j = []
                }))
            } catch {}
        },
        V = () => {
            try {
                return q()
            } catch {
                return !1
            }
        },
        z = "RBX_DEVICE_PROBE_STARTS",
        X = () => {
            let e = (0, a.getItem)(z);
            if ("object" != typeof e || null === e || Reflect.get(e, "browser") !== w()) return null;
            let r = Reflect.get(e, "startedAt");
            return {
                startedAt: Array.isArray(r) ? r : [],
                skipReported: !0 === Reflect.get(e, "skipReported")
            }
        },
        H = (e, r) => (e?.startedAt ?? []).filter(e => "number" == typeof e && r - e >= 0 && r - e < 864e5),
        Y = null,
        K = (e, r) => {
            let t = _(e, r);
            return null != t && $("probeSkipped", {
                reason: t.reason,
                browser: t.browser
            }), null != t
        },
        J = async e => {
            let r = t.navigator?.locks;
            return null == r ? e(c.timeoutMs) : await r.request("rbx-device-probe", () => e(0))
        }, Q = async () => {
            let e = await (() => {
                var e;
                let r = t.window;
                if (null == r) return Promise.resolve("unknown");
                let n = O(F, 864e5, e = Date.now()) ? "notOffered" : O(D, 9e5, e) ? "unknown" : null;
                return null != n ? Promise.resolve(n) : (r.rbxDeviceProbeRegionAnswer ??= new Promise(e => {
                    let r, n = !1,
                        l = l => {
                            n || (n = !0, clearTimeout(r), "offered" !== l && ((e, r) => {
                                try {
                                    t.window?.sessionStorage.setItem(e, String(r))
                                } catch {}
                            })("notOffered" === l ? F : D, Date.now()), e(l))
                        };
                    r = setTimeout(() => {
                        l("unknown")
                    }, 5e3), (0, B.callBehaviour)("wasm").then(e => {
                        l((e => {
                            switch (e?.wasmClientAvailable) {
                                case !0:
                                    return "offered";
                                case !1:
                                    return "notOffered";
                                default:
                                    return "unknown"
                            }
                        })(e))
                    }, () => {
                        l("unknown")
                    })
                }), r.rbxDeviceProbeRegionAnswer)
            })();
            return "offered" !== e ? ("notOffered" === e && (0, a.removeItem)(b), null) : (await new Promise(e => {
                let r = t.document;
                if (r?.visibilityState !== "hidden") return void e();
                let n = () => {
                    "hidden" !== r.visibilityState && (r.removeEventListener("visibilitychange", n), e())
                };
                r.addEventListener("visibilitychange", n)
            }), J(async e => {
                var r;
                let n, l, i, o = P(Date.now());
                if (null != o) return o;
                if (K(Date.now(), e) || !c.enabled || t.document?.visibilityState === "hidden") return null;
                let d = {
                        deviceMemoryGiB: "number" == typeof(n = null == t.navigator ? void 0 : Reflect.get(t.navigator, "deviceMemory")) && n > 0 ? n : null,
                        reportedCores: Math.max(t.navigator?.hardwareConcurrency ?? 1, 1)
                    },
                    f = (r = c.requiredSpec, l = [], s(d.deviceMemoryGiB, r) && l.push("minDeviceMemoryGiB"), d.reportedCores < r.minEffectiveCores && l.push("minEffectiveCores"), l);
                if (f.length > 0) {
                    let e = (e => {
                        let {
                            deviceMemoryGiB: r
                        } = e;
                        return {
                            isolated: !1,
                            features: Object.fromEntries(v.map(e => [e, !1])),
                            cpu: {
                                effectiveCores: 0,
                                singleThreadScore: 0
                            },
                            gpu: {
                                webgl2Renders: !1,
                                fillPassesPerMs: 0
                            },
                            memory: {
                                deviceMemoryGiB: r,
                                maxSharedAllocMiB: 0
                            }
                        }
                    })(d);
                    return x(e, Date.now()), $("probeCompleted", {
                        durationMs: 0,
                        browser: w(),
                        isolated: null,
                        failedRules: f
                    }), e
                }
                if ((e => {
                        let {
                            reached: r,
                            firstSkip: t
                        } = (e => {
                            let r = X(),
                                t = H(r, e);
                            if (t.length < 2) return {
                                reached: !1,
                                firstSkip: !1
                            };
                            let n = r?.skipReported !== !0;
                            return n && (0, a.setItem)(z, {
                                browser: w(),
                                startedAt: t,
                                skipReported: !0
                            }), {
                                reached: !0,
                                firstSkip: n
                            }
                        })(e);
                        return t && $("probeSkipped", {
                            reason: "attemptCap",
                            browser: w()
                        }), r
                    })(Date.now())) return null;
                let m = M(),
                    p = (m?.failureCount ?? 0) + 1,
                    h = Date.now();
                if (!(0, a.setItem)(z, {
                        browser: w(),
                        startedAt: [...H(X(), h), h].slice(-2)
                    }).isOk() || !k("crashed", p, h)) return null;
                let b = w();
                $("probeStarted", {
                    browser: b
                }), m?.reason === "crashed" && !0 !== m.crashReported && h - m.failedAt >= e && ($("probeFailed", {
                    reason: "crashed",
                    durationMs: null,
                    browser: b,
                    isolated: null
                }), m = {
                    ...m,
                    crashReported: !0
                });
                let g = await (i = c.timeoutMs, new Promise(e => {
                        let r = t.window,
                            n = t.document;
                        if (null == r || null == n) return void e({
                            ok: !1,
                            reason: "error"
                        });
                        let l = n.createElement("iframe"),
                            a = [],
                            o = r => {
                                for (let e of a) e();
                                l.remove(), e(r)
                            };
                        l.src = `/device-probe?v=${encodeURIComponent("1.5.0")}`, l.title = "Device probe", l.tabIndex = -1, l.setAttribute("aria-hidden", "true"), l.style.cssText = "position:fixed;top:0;left:0;width:1px;height:1px;border:0;opacity:0;pointer-events:none";
                        let s = "u" < typeof performance ? 0 : performance.now(),
                            u = () => {
                                let e;
                                e = l.src, "u" > typeof performance && "function" == typeof performance.getEntriesByName && performance.getEntriesByName(e).some(e => e.startTime >= s && "responseStatus" in e && "number" == typeof e.responseStatus && e.responseStatus >= 400) && o({
                                    ok: !1,
                                    reason: "error"
                                })
                            },
                            d = e => {
                                let t = e.data;
                                e.origin === r.location.origin && null != e.source && e.source === l.contentWindow && "object" == typeof t && null !== t && "rbx-device-probe:result" === t.type && 3 === t.version && o(!0 === t.ok ? {
                                    ok: !0,
                                    scores: t.scores
                                } : {
                                    ok: !1,
                                    reason: "error"
                                })
                            },
                            c = () => {
                                "hidden" === n.visibilityState && o({
                                    ok: !1,
                                    reason: "hidden"
                                })
                            };
                        l.addEventListener("load", u), n.body.append(l), r.addEventListener("message", d), n.addEventListener("visibilitychange", c);
                        let f = setTimeout(() => {
                            o({
                                ok: !1,
                                reason: "timeout"
                            })
                        }, i);
                        a.push(() => {
                            clearTimeout(f), l.removeEventListener("load", u), r.removeEventListener("message", d), n.removeEventListener("visibilitychange", c)
                        })
                    })).catch(() => ({
                        ok: !1,
                        reason: "error"
                    })),
                    y = Date.now() - h,
                    C = g.ok ? (e => {
                        var r;
                        if (!S(e) || !S(e.features) || !S(e.cpu)) return null;
                        let t = null == (r = e.earlyStop) ? null : S(r) && Array.isArray(r.failedRules) && 0 !== r.failedRules.length && r.failedRules.every(R) ? r.failedRules : void 0;
                        if (void 0 === t) return null;
                        let {
                            measuredWhileVisible: n
                        } = e.cpu, l = S(e.gpu) && S(e.gpu.webgl2) ? e.gpu.webgl2 : {}, i = E({
                            isolated: e.features.crossOriginIsolated,
                            features: e.features,
                            cpu: e.cpu,
                            gpu: {
                                webgl2Renders: l.renders,
                                fillPassesPerMs: l.fillPassesPerMs
                            },
                            memory: e.memory
                        });
                        return null == i || "boolean" != typeof n ? null : null != t ? {
                            measurement: i,
                            measuredWhileVisible: n,
                            earlyStop: t
                        } : i.cpu.effectiveCores < 1 || "error" === l.renderer ? null : {
                            measurement: i,
                            measuredWhileVisible: n,
                            earlyStop: null
                        }
                    })(g.scores) : null;
                if (null == C) {
                    let e = g.ok ? "error" : g.reason;
                    return "hidden" === e ? T(m) : k(e, p, Date.now()), $("probeFailed", {
                        reason: e,
                        durationMs: y,
                        browser: b,
                        isolated: null
                    }), null
                }
                let {
                    measurement: A,
                    measuredWhileVisible: I,
                    earlyStop: _
                } = C, {
                    isolated: B
                } = A;
                return I ? (x(A, Date.now()), $("probeCompleted", {
                    durationMs: y,
                    browser: b,
                    isolated: B,
                    failedRules: _ ?? u(A, c.requiredSpec)
                }), A) : (T(m), $("probeFailed", {
                    reason: "throttled",
                    durationMs: y,
                    browser: b,
                    isolated: B
                }), null)
            }))
        }, Z = async () => {
            try {
                return await Q()
            } catch {
                return $("probeFailed", {
                    reason: "error",
                    durationMs: null,
                    browser: w(),
                    isolated: null
                }), null
            }
        }, ee = async () => {
            try {
                if (!V()) return !1;
                let e = P(Date.now());
                if (null == e && (K(Date.now(), c.timeoutMs) || !c.enabled || (Y ??= Z().finally(() => {
                        Y = null
                    }), e = await Y, !V()))) return !1;
                return null != e && 0 === u(e, c.requiredSpec).length
            } catch {
                return !1
            }
        };
    e.s(["default", 0, function() {
        return (0, r.useEffect)(() => {
            (() => {
                let e, r, n = t.window;
                if (null == n || !0 === n.rbxDeviceProbeBackgroundRun || (n.rbxDeviceProbeBackgroundRun = !0, n.top !== n)) return;
                q = i ?? L;
                var l, s, b, v, g = Date.now();
                try {
                    let e = t.window?.localStorage;
                    null != e && (e => {
                        for (let r of (e => {
                                let r = [];
                                for (let t = 0; t < e.length; t += 1) {
                                    let n = e.key(t);
                                    (n === m || n?.startsWith(p) === !0) && r.push(n)
                                }
                                return r
                            })(e)) {
                            let t = r === m ? null : h(e.getItem(r)),
                                n = null == t ? NaN : g - t;
                            n >= -6e4 && n < 6048e5 || e.removeItem(r)
                        }
                    })(e)
                } catch {}
                if (l = Date.now(), (0, a.hasItem)(z) && 0 === H(X(), l).length && (0, a.removeItem)(z), s = Date.now(), e = M(), e?.reason === "crashed" && e.failureCount >= 2 && !0 !== e.crashReported && s - e.failedAt >= c.timeoutMs && ($("probeFailed", {
                        reason: "crashed",
                        durationMs: null,
                        browser: e.browser,
                        isolated: null
                    }), T({
                        ...e,
                        crashReported: !0
                    })), null !== (() => {
                        try {
                            if (!V()) return !1;
                            let e = Date.now(),
                                r = P(e);
                            if (null == r) return null == _(e, c.timeoutMs) && null;
                            return 0 === u(r, c.requiredSpec).length
                        } catch {
                            return null
                        }
                    })()) return;
                c = {
                    enabled: !0 === (b = {
                        enabled: !0
                    }).enabled,
                    requiredSpec: null == b.requiredSpec ? o : {
                        requiredFeatures: Array.isArray((v = b.requiredSpec).requiredFeatures) && v.requiredFeatures.every(e => "string" == typeof e) ? v.requiredFeatures : o.requiredFeatures,
                        minDeviceMemoryGiB: f(v.minDeviceMemoryGiB) ? v.minDeviceMemoryGiB : o.minDeviceMemoryGiB,
                        minEffectiveCores: f(v.minEffectiveCores) ? v.minEffectiveCores : o.minEffectiveCores,
                        minSingleThreadScore: f(v.minSingleThreadScore) ? v.minSingleThreadScore : o.minSingleThreadScore,
                        minWebgl2FillPassesPerMs: f(v.minWebgl2FillPassesPerMs) ? v.minWebgl2FillPassesPerMs : o.minWebgl2FillPassesPerMs,
                        requireWebgl2Renders: "boolean" == typeof v.requireWebgl2Renders ? v.requireWebgl2Renders : o.requireWebgl2Renders
                    },
                    timeoutMs: f(r = b.timeoutMs) && r > 0 ? b.timeoutMs : d.timeoutMs
                };
                let w = () => {
                    ee()
                };
                t.document?.readyState === "complete" ? w() : n.addEventListener("load", w, {
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
        l = e.i(865581),
        i = e.i(432464),
        a = e.i(55336);
    let o = (0, l.default)(() => e.A(80066), {
        loadableGenerated: {
            modules: [391651]
        },
        ssr: !1,
        loading: () => null
    });
    e.s(["default", 0, function() {
        return (0, t.useSyncExternalStore)(a.subscribe, a.getSnapshot, a.getServerSnapshot) ? (0, n.createPortal)((0, r.jsx)(i.ErrorBoundary, {
            children: (0, r.jsx)(o, {})
        }), document.body) : null
    }])
}, 860834, e => {
    e.v(r => Promise.all(["static/chunks/01sqoc6rh7hn6.js", "static/chunks/0o41rrf.qz-eb.js"].map(r => e.l(r))).then(() => r(60484)))
}, 301475, e => {
    e.v(r => Promise.all(["static/chunks/07hmcr403d5.p.js"].map(r => e.l(r))).then(() => r(14383)))
}, 80066, e => {
    e.v(r => Promise.all(["static/chunks/01r0jfmp8mzaq.js", "static/chunks/0q4qnajlx1fcy.js", "static/chunks/0bz--g2k-igct.js"].map(r => e.l(r))).then(() => r(391651)))
}]);

//# debugId=008b38c9-7568-a1f5-8c04-e9972bfd5147
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/17.qruhdtyt~4.js.map