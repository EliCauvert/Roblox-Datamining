"use strict";
(() => {
    var fe = {
            jsError: 0,
            unhandledRejection: 1
        },
        N = {
            unknown: 0,
            hit: 1,
            miss: 2
        };
    var L = {
        prod: {
            clientSettingsHost: "clientsettings.roblox.com",
            settingsFlagsHost: "clientsettingscdn.roblox.com",
            setupCdnBase: "https://setup.rbxcdn.com",
            websiteHost: "www.roblox.com"
        },
        st1: {
            clientSettingsHost: "clientsettings.sitetest1.robloxlabs.com",
            settingsFlagsHost: "clientsettingscdn.sitetest1.robloxlabs.com",
            setupCdnBase: "https://s3.amazonaws.com/setup.sitetest1.robloxlabs.com",
            websiteHost: "www.sitetest1.robloxlabs.com"
        },
        st2: {
            clientSettingsHost: "clientsettings.sitetest2.robloxlabs.com",
            settingsFlagsHost: "clientsettingscdn.sitetest2.robloxlabs.com",
            setupCdnBase: "https://s3.amazonaws.com/setup.sitetest2.robloxlabs.com",
            websiteHost: "www.sitetest2.robloxlabs.com"
        },
        st3: {
            clientSettingsHost: "clientsettings.sitetest3.robloxlabs.com",
            settingsFlagsHost: "clientsettingscdn.sitetest3.robloxlabs.com",
            setupCdnBase: "https://s3.amazonaws.com/setup.sitetest3.robloxlabs.com",
            websiteHost: "www.sitetest3.robloxlabs.com"
        }
    };

    function Te(e) {
        return typeof e == "string" && Object.prototype.hasOwnProperty.call(L, e)
    }

    function Re(e) {
        let t = e.trim().toLowerCase();
        return t === "" || t === "live" || t === "production"
    }
    var Xe = {
            0: "",
            1: "Windows",
            2: "macOS",
            3: "iOS",
            4: "Android",
            5: "Linux",
            6: "Chrome OS"
        },
        Ye = {
            Chrome: "Google Chrome",
            Chromium: "Chromium",
            Edg: "Microsoft Edge",
            Opera: "Opera",
            SamsungInternet: "Samsung Internet"
        };

    function Y(e) {
        return (e ?? "").replace(/[^A-Za-z0-9 ._-]/g, "").trim()
    }

    function D(e, t) {
        return e.match(t)?.[1] ?? ""
    }
    async function Qe(e) {
        if (!e?.getHighEntropyValues) return {};
        let t;
        try {
            let n = new Promise(r => {
                    t = setTimeout(() => r({}), 500)
                }),
                o = e.getHighEntropyValues(["model", "platformVersion", "fullVersionList"]);
            return await Promise.race([o, n])
        } catch (n) {
            return console.warn("[host-info] Client Hints unavailable", n), {}
        } finally {
            clearTimeout(t)
        }
    }

    function Me(e, t, n, o) {
        return /Android/i.test(t) || /Android/i.test(e) ? 4 : /iPhone|iPad|iPod/i.test(t) || /iPhone|iPad|iPod/i.test(e) || n === "MacIntel" && o > 1 ? 3 : /Windows/i.test(t) || /Windows NT/i.test(e) ? 1 : /Chrome OS|CrOS/i.test(t) || /CrOS/i.test(e) ? 6 : /Mac/i.test(t) || /Mac OS X/i.test(e) ? 2 : /Linux/i.test(t) || /Linux/i.test(e) ? 5 : 0
    }

    function ke() {
        let e = navigator,
            t = e.platform || "",
            n = e.userAgentData?.platform || t;
        return Me(e.userAgent || "", n, t, e.maxTouchPoints || 0)
    }

    function Ze(e, t) {
        switch (t) {
            case 4:
                return D(e, /Android ([\d.]+)/);
            case 3:
                return D(e, /OS ([\d_]+) like Mac OS X/).replace(/_/g, ".");
            case 1:
                return D(e, /Windows NT ([\d.]+)/);
            case 6:
                return D(e, /CrOS \S+ ([\d.]+)/);
            case 2:
                return D(e, /Mac OS X ([\d_.]+)/).replace(/_/g, ".");
            case 5:
            case 0:
                return ""
        }
    }

    function et(e) {
        let t = D(e, /Android [^;)]*;\s*([^;)]+?)(?: Build\/[^;)]*)?\)/);
        return t === "K" ? "" : t
    }

    function tt(e, t) {
        let n;
        return (n = e.match(/SamsungBrowser\/([\d.]+)/)) ? ["SamsungInternet", n[1]] : (n = e.match(/(?:OPR|Opera|OPX)\/([\d.]+)/)) ? ["Opera", n[1]] : (n = e.match(/Edg(?:A|iOS)?\/([\d.]+)/)) ? ["Edg", n[1]] : (n = e.match(/(?:Firefox|FxiOS)\/([\d.]+)/)) ? ["Firefox", n[1]] : (n = e.match(/Chromium\/([\d.]+)/)) ? ["Chromium", n[1]] : (n = e.match(/(?:Chrome|CriOS)\/([\d.]+)/)) ? [t.includes("Chromium") && !t.includes("Google Chrome") ? "Chromium" : "Chrome", n[1]] : (n = e.match(/Version\/([\d.]+).*Safari/)) ? ["Safari", n[1]] : ["", ""]
    }
    var nt = {
        hostOS: 0,
        osName: "",
        osVersion: "",
        deviceModel: "",
        browserName: "",
        browserVersion: "",
        mobile: !1,
        screenWidthDip: 0,
        screenHeightDip: 0,
        screenWidthPx: 0,
        screenHeightPx: 0,
        dpi: 0
    };
    async function ot(e) {
        let t = e.userAgent || "",
            n = e.userAgentData,
            o = e.platform || "",
            r = await Qe(n),
            i = r.platform || n?.platform || o,
            d = Me(t, i, o, e.maxTouchPoints || 0),
            a = d !== 0 && r.platformVersion || Ze(t, d),
            l = r.model || (d === 4 ? et(t) : ""),
            [m, p] = tt(t, (n?.brands ?? []).map(P => P.brand)),
            h = Ye[m],
            k = r.fullVersionList?.find(P => P.brand === h)?.version,
            y = window.devicePixelRatio || 0,
            j = screen.width || 0,
            A = screen.height || 0;
        return {
            hostOS: d,
            osName: Xe[d],
            osVersion: Y(a),
            deviceModel: Y(l),
            browserName: m,
            browserVersion: Y(k || p),
            mobile: r.mobile ?? n?.mobile ?? /Mobi/i.test(t),
            screenWidthDip: j,
            screenHeightDip: A,
            screenWidthPx: Math.round(j * y),
            screenHeightPx: Math.round(A * y),
            dpi: Math.round(96 * y)
        }
    }
    var We = {
        gpuVendor: "",
        gpuRenderer: ""
    };

    function rt() {
        let e = document.createElement("canvas").getContext("webgl2");
        if (!e) return We;
        try {
            let t = e.getExtension("WEBGL_debug_renderer_info"),
                n = e.getParameter(t ? t.UNMASKED_VENDOR_WEBGL : e.VENDOR),
                o = e.getParameter(t ? t.UNMASKED_RENDERER_WEBGL : e.RENDERER);
            return {
                gpuVendor: Y(String(n ?? "")),
                gpuRenderer: Y(String(o ?? ""))
            }
        } finally {
            e.getExtension("WEBGL_lose_context")?.loseContext()
        }
    }
    async function Fe() {
        let e = navigator,
            t = nt;
        try {
            t = await ot(e)
        } catch (o) {
            console.warn("[host-info] parsing failed; reporting empty values", o)
        }
        let n = We;
        try {
            n = rt()
        } catch (o) {
            console.warn("[host-info] GPU query failed; reporting empty values", o)
        }
        return {
            ...t,
            ...n,
            memoryMB: Math.round((e.deviceMemory || 0) * 1024),
            cpuLogicalCount: e.hardwareConcurrency || 0
        }
    }
    var it = "WebClientApp",
        st = {
            4: "AndroidWebClientApp",
            3: "iOSWebClientApp",
            1: "WindowsWebClientApp",
            2: "MacWebClientApp"
        };
    async function Ue(e, t) {
        let n = {
            applicationSettings: {}
        };
        e in L || console.error(`[ClientSettings] Unknown server environment "${e}" \u2014 defaulting to production flags`);
        let o = e in L ? L[e] : L.prod,
            r = st[ke()] ?? it,
            i = `/v2/settings/application/${r}`,
            d = t !== null && !Re(t) ? `${i}/bucket/${encodeURIComponent(t)}` : i,
            a = `https://${o.settingsFlagsHost}${d}`,
            l = `${o.settingsFlagsHost} (${r}, ${e}, ${t||"production"})`;
        try {
            let m = await fetch(a);
            if (m.ok) {
                let p = await m.json();
                if (p?.applicationSettings) return console.log(`[Flags] Fetched ${Object.keys(p.applicationSettings).length} preloaded flag(s) from ${l}`), p;
                console.warn(`[Flags] ${l} returned no applicationSettings; using engine defaults`)
            } else console.warn(`[Flags] ${l} HTTP ${m.status}; using engine defaults`)
        } catch (m) {
            console.warn(`[Flags] ${l} fetch failed; using engine defaults:`, m)
        }
        return n
    }
    var at = ["_PlaceFilter", "_UniverseFilter", "_DataCenterFilter"],
        se = null,
        Be = new Set;

    function Oe(e) {
        se = {
            ...e.applicationSettings
        }
    }

    function lt(e) {
        if (se === null) throw new Error(`[FastFlags] ${e} read before initFastFlags`);
        if (!Be.has(e)) {
            Be.add(e);
            for (let t of at)`${e}${t}` in se && console.warn(`[FastFlags] ${e}${t} is ignored by the frontend; ${e} uses only its unfiltered value`)
        }
        return se[e]
    }

    function he(e) {
        let t = `FFlag${e}`;
        return () => {
            let n = lt(t);
            return n === "true" || n === "True"
        }
    }
    var He = "rbxIxpSettings.v1";

    function Ne(e) {
        let t = null;
        try {
            t = localStorage.getItem(He)
        } catch (n) {
            console.warn("[IXP] Could not read the IXP cache:", n)
        }
        t && (e.set_cached_ixp_settings(t), console.log(`[IXP] Loaded cached IXP settings (${t.length} bytes)`))
    }

    function De(e) {
        try {
            localStorage.setItem(He, e)
        } catch (t) {
            console.warn("[IXP] Could not write the IXP cache:", t)
        }
    }
    async function $e() {
        console.info("[WebGPU] Requesting high-performance adapter");
        let e = navigator.gpu;
        if (!e) throw new Error("WebGPU is unavailable in this browser.");
        let t = await e.requestAdapter({
            powerPreference: "high-performance"
        });
        if (!t) throw new Error("The browser did not provide a WebGPU adapter.");
        if (console.info("[WebGPU] Adapter features:", [...t.features].sort().join(", ")), !t.features.has("texture-compression-bc") && !t.features.has("texture-compression-etc2")) throw new Error("WebGPU requires BC or ETC2 texture compression.");
        let n = ["texture-compression-bc", "texture-compression-bc-sliced-3d", "texture-compression-etc2", "texture-compression-astc", "texture-formats-tier1", "rg11b10ufloat-renderable", "float32-filterable", "timestamp-query"],
            o = n.filter(i => t.features.has(i) && (i !== "texture-compression-bc-sliced-3d" || t.features.has("texture-compression-bc")));
        console.info("[WebGPU] Feature query:", n.map(i => `${i}=${t.features.has(i)}`).join(", ")), console.info("[WebGPU] Requesting device features:", o.join(", "));
        let r = await t.requestDevice({
            requiredFeatures: o
        });
        return console.info("[WebGPU] Device initialized with features:", [...r.features].sort().join(", ")), r
    }

    function Ge(e) {
        let t = new URLSearchParams(e),
            n = {},
            o = t.get("renderer")?.toLowerCase();
        return o === "webgl" || o === "webgpu" ? n.renderer = o : o !== void 0 && console.warn(`[RenderQueryParams] Ignoring renderer="${o}"; expected webgl or webgpu`), n
    }
    var be = [250, 500, 1e3, 2e3],
        ct = 600,
        Q = new URLSearchParams(window.location.search).get("errorPromptModal") !== "0",
        we = 1;

    function xe(e, t, n) {
        let o = new URL(e.includes("://") ? e : `https://${e}`),
            r = o.hostname.split(".");
        return r[0] === "www" ? r[0] = t : r.unshift(t), o.hostname = r.join("."), o.pathname = n, o.search = "", o.hash = "", o.href
    }

    function dt(e, t) {
        return new Promise((n, o) => {
            let r = window.setTimeout(n, e);
            t.addEventListener("abort", () => {
                window.clearTimeout(r), o(new DOMException("Loading screen request cancelled", "AbortError"))
            }, {
                once: !0
            })
        })
    }
    var ae = class {
        constructor() {
            this.root = document.getElementById("loading-overlay");
            this.background = document.getElementById("loading-background-image");
            this.icon = document.getElementById("loading-experience-icon");
            this.iconShell = document.getElementById("loading-icon-shell");
            this.title = document.getElementById("loading-experience-title");
            this.creator = document.getElementById("loading-experience-creator");
            this.verifiedBadge = document.getElementById("loading-verified-badge");
            this.status = document.getElementById("status");
            this.errorPanel = document.querySelector(".loading-error-panel");
            this.errorTitle = document.getElementById("loading-error-title");
            this.errorMessage = document.getElementById("loading-error-message");
            this.errorCode = document.getElementById("loading-error-code");
            this.errorLeaveButton = document.getElementById("loading-error-leave");
            this.cancelButton = document.getElementById("loading-cancel");
            this.abortController = new AbortController;
            this.loadPromise = null;
            this.dismissAnimationFrame = null;
            this.dismissTimeout = null;
            this.dismissed = !1;
            this.hiddenAfterSuccess = !1;
            this.experienceLoaded = !1;
            this.statusPriority = 0;
            this.failureSourcePriority = -1;
            let t = () => {
                window.close(), window.location.replace("about:blank")
            };
            this.cancelButton?.addEventListener("click", t), this.errorLeaveButton?.addEventListener("click", t)
        }
        prepare(t) {
            this.failureSourcePriority = -1, this.statusPriority = 0, this.dismissed = !1, this.hiddenAfterSuccess = !1, this.experienceLoaded = !1, this.cancelPendingDismissal(), this.root && (this.setRootHidden(!1), this.root.classList.remove("loading-failed", "loading-exiting"), this.root.setAttribute("aria-label", "Loading Roblox"), this.root.setAttribute("aria-busy", "true")), this.errorPanel && (this.errorPanel.hidden = !0), this.errorMessage && (this.errorMessage.textContent = ""), this.errorCode && (this.errorCode.textContent = ""), this.title && (this.title.textContent = t ? "Joining experience" : "Roblox")
        }
        setStatus(t) {
            this.setStatusWithPriority(t, 0)
        }
        setEngineStatus(t) {
            this.setStatusWithPriority(t, 1)
        }
        clearEngineStatus() {
            this.clearStatusWithPriority(1)
        }
        setStatusWithPriority(t, n) {
            let o = t.trim();
            !o || !this.status || n < this.statusPriority || (this.statusPriority = n, this.status.textContent = o, this.status.removeAttribute("aria-valuenow"), this.status.removeAttribute("title"))
        }
        clearStatus() {
            this.clearStatusWithPriority(0)
        }
        clearStatusWithPriority(t) {
            !this.status || t < this.statusPriority || this.statusPriority === 2 || (this.statusPriority = 0, this.status.textContent = "", this.status.removeAttribute("aria-valuenow"))
        }
        setDownloadProgress(t, n) {
            let o = r => (r / 1048576).toFixed(1);
            this.setStatus(n > 0 ? `Downloading Roblox\u2026 ${o(t)} / ${o(n)} MB (${Math.round(t/n*100)}%)` : `Downloading Roblox\u2026 ${o(t)} MB`), this.status && this.statusPriority === 0 && n > 0 && this.status.setAttribute("aria-valuenow", String(Math.round(t / n * 100)))
        }
        showFailure(t) {
            this.showFailureDetails(t, null, "browser", we)
        }
        showEngineFailure(t) {
            let n = t.source === "gui-service" ? 3 : 2;
            this.showFailureDetails(t.message || "Unable to join the experience.", t.errorCode, t.source, n, t.statusCode)
        }
        loadExperience(t, n) {
            return this.loadPromise ? this.loadPromise : (this.loadPromise = this.loadExperienceData(t, n).catch(o => {
                o instanceof DOMException && o.name === "AbortError" || console.warn("[LoadingScreen] Experience presentation data unavailable:", o)
            }), this.loadPromise)
        }
        dismiss() {
            this.dismissed || this.hasEngineFailure() || (this.dismissed = !0, this.abortController.abort(), this.cancelPendingDismissal(), this.root?.setAttribute("aria-busy", "false"), this.root?.classList.add("loading-exiting"), this.dismissTimeout = window.setTimeout(() => {
                this.dismissTimeout = null, this.hiddenAfterSuccess = !0, this.setRootHidden(!0)
            }, ct))
        }
        dismissAfterRenderedFrame() {
            this.experienceLoaded = !0, !(this.dismissed || this.dismissAnimationFrame !== null || this.hasEngineFailure()) && (this.dismissAnimationFrame = window.requestAnimationFrame(() => {
                this.dismissAnimationFrame = window.requestAnimationFrame(() => {
                    this.dismissAnimationFrame = null, this.dismiss()
                })
            }))
        }
        showFailureDetails(t, n, o, r, i = null) {
            if (this.hiddenAfterSuccess || r < this.failureSourcePriority || this.experienceLoaded && r <= we) return;
            this.failureSourcePriority = r, this.statusPriority = 2, this.dismissed = !1, this.cancelPendingDismissal();
            let d = n !== null && Number.isInteger(n) && n > 0,
                a = t.trim() || "Unable to join the experience.",
                l = d ? `${a}
Error Code: ${n}` : a;
            this.status && (this.status.textContent = l, this.status.removeAttribute("aria-valuenow"), this.status.title = [`Source: ${o}`, ...i !== null ? [`Join status: ${i}`] : []].join("; ")), Q && this.errorTitle && (this.errorTitle.textContent = o === "teleport" ? "Teleport Failed" : o === "browser" ? "Error" : "Join Error"), Q && this.errorMessage && (this.errorMessage.textContent = a), Q && this.errorCode && (this.errorCode.textContent = o === "browser" ? "" : `(Error Code: ${d?n:-1})`), this.errorPanel && (this.errorPanel.hidden = !Q), this.root && (this.setRootHidden(!1), this.root.classList.remove("loading-exiting"), this.root.classList.toggle("loading-failed", Q), this.root.setAttribute("aria-label", "Unable to join Roblox"), this.root.setAttribute("aria-busy", "false"))
        }
        hasEngineFailure() {
            return this.failureSourcePriority > we
        }
        setRootHidden(t) {
            this.root && (this.root.hidden = t, this.root.style.display = t ? "none" : "")
        }
        cancelPendingDismissal() {
            this.dismissAnimationFrame !== null && (window.cancelAnimationFrame(this.dismissAnimationFrame), this.dismissAnimationFrame = null), this.dismissTimeout !== null && (window.clearTimeout(this.dismissTimeout), this.dismissTimeout = null)
        }
        async loadExperienceData(t, n) {
            let o = xe(n.robloxBaseUrl, "economy", `/v2/assets/${t}/details`),
                r = xe(n.robloxBaseUrl, "apis", `/universes/v1/places/${t}/universe`),
                i = this.fetchJson(o, n).then(a => this.applyProductInfo(a)),
                d = this.fetchJson(r, n).then(async a => {
                    if (typeof a.universeId != "number" || a.universeId <= 0) return;
                    let l = xe(n.robloxBaseUrl, "thumbnails", "/"),
                        m = new URL("/v1/games/icons", l);
                    m.search = new URLSearchParams({
                        universeIds: String(a.universeId),
                        returnPolicy: "PlaceHolder",
                        size: "256x256",
                        format: "Png",
                        isCircular: "false"
                    }).toString();
                    let p = new URL("/v1/games/multiget/thumbnails", l);
                    p.search = new URLSearchParams({
                        universeIds: String(a.universeId),
                        countPerUniverse: "1",
                        defaults: "true",
                        size: "768x432",
                        format: "Png",
                        isCircular: "false"
                    }).toString(), await Promise.all([this.reportPresentationFailure("experience icon", this.fetchThumbnailUrl(m.href, n, h => h.data?.[0]).then(h => this.applyImage(this.icon, this.iconShell, h))), this.reportPresentationFailure("experience background", this.fetchThumbnailUrl(p.href, n, h => h.data?.[0]?.thumbnails?.[0]).then(h => this.applyImage(this.background, this.background?.parentElement ?? null, h)))])
                });
            await Promise.all([this.reportPresentationFailure("experience details", i), this.reportPresentationFailure("experience artwork", d)])
        }
        async fetchJson(t, n) {
            let o = n.proxy ? n.proxy.url(t) : t,
                r = await fetch(o, {
                    credentials: "include",
                    signal: this.abortController.signal,
                    ...n.proxy ? {
                        headers: n.proxy.authHeaders()
                    } : {}
                });
            if (!r.ok) throw new Error(`${new URL(t).hostname} returned HTTP ${r.status}`);
            return r.json()
        }
        async fetchThumbnailUrl(t, n, o) {
            for (let r = 0; r <= be.length; ++r) {
                let i = o(await this.fetchJson(t, n));
                if (i?.state === "Completed" && typeof i.imageUrl == "string") return i.imageUrl;
                if (i?.state !== "Pending" || r === be.length) throw new Error(`${new URL(t).pathname} returned thumbnail state ${String(i?.state)}`);
                await dt(be[r], this.abortController.signal)
            }
            return null
        }
        applyProductInfo(t) {
            this.title && typeof t.Name == "string" && t.Name && (this.title.textContent = t.Name);
            let n = t.Creator?.Name;
            this.creator && typeof n == "string" && n && (this.creator.textContent = n, this.creator.hidden = !1), this.verifiedBadge && t.Creator?.HasVerifiedBadge === !0 && (this.verifiedBadge.hidden = !1)
        }
        applyImage(t, n, o) {
            !t || !n || !o || (t.addEventListener("load", () => {
                n.classList.add("loading-image-ready")
            }, {
                once: !0
            }), t.addEventListener("error", () => {
                console.warn(`[LoadingScreen] Browser rejected image ${o}`), t.removeAttribute("src")
            }, {
                once: !0
            }), t.src = o)
        }
        async reportPresentationFailure(t, n) {
            try {
                await n
            } catch (o) {
                if (o instanceof DOMException && o.name === "AbortError") throw o;
                console.warn(`[LoadingScreen] Failed to load ${t}:`, o)
            }
        }
    };
    var ve = `rbxfsindex 1
`;

    function je(e) {
        let t = new TextDecoder;
        if (t.decode(e.subarray(0, ve.length)) !== ve) throw new Error("WebClient.fsindex.txt: unsupported header");
        let n = [],
            o = new Uint8Array(0),
            r = ve.length,
            i = a => {
                let l = e.indexOf(a, r);
                if (l < 0) throw new Error("WebClient.fsindex.txt: truncated line");
                let m = e.subarray(r, l);
                return r = l + 1, m
            },
            d = a => {
                let l = t.decode(a);
                if (!/^[0-9]+$/.test(l)) throw new Error("WebClient.fsindex.txt: malformed line");
                return Number(l)
            };
        for (; r < e.length;) {
            let a = d(i(9)),
                l = i(9);
            if (l.includes(10)) throw new Error("WebClient.fsindex.txt: malformed line");
            let m = d(i(10));
            if (a > o.length) throw new Error("WebClient.fsindex.txt: malformed line");
            let p = new Uint8Array(a + l.length);
            p.set(o.subarray(0, a)), p.set(l, a), n.push({
                path: t.decode(p),
                size: m
            }), o = p
        }
        return n
    }
    Error.stackTraceLimit = 1 / 0;
    var ut = he("WasmPreferWebGPU"),
        mt = he("WebClientRenderQueryParams"),
        gt = Fe(),
        f = new ae;
    window.__onEngineLoadingStatus = e => {
        e.kind === "failure" ? (console.error("[LoadingScreen] Engine failure:", e), f.showEngineFailure(e)) : e.message.trim() ? f.setEngineStatus(e.message) : f.clearEngineStatus()
    };

    function _e() {
        return navigator.userAgent.includes("Android")
    }
    if (!_e()) document.querySelector("#canvas").classList.add("fullscreencanvas");
    else {
        let e = document.createElement("meta");
        e.name = "viewport", e.content = "width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0", document.getElementsByTagName("head")[0].appendChild(e), document.querySelector("#canvas").classList.add("mobilecanvas")
    }
    var G = (() => {
            let e = window.__wasmLoaderContext;
            if (!e) throw new Error("window.__wasmLoaderContext is missing; WasmPlayer.js must be loaded by WasmLoader.js");
            return e
        })(),
        U = G.engineBase,
        Ve = Te(G.server) ? G.server : "prod",
        b = window.__wasmDevSettings,
        Se = window.location.origin,
        pt = "roblox-webclient-active",
        Z = "roblox-webclient-active-tab-v1";

    function ft() {
        return typeof crypto.randomUUID == "function" ? crypto.randomUUID() : `${Date.now().toString(36)}-${Math.random().toString(36).slice(2)}`
    }

    function ye(e) {
        if (e === null) return null;
        try {
            let t = JSON.parse(e);
            return typeof t.ownerId != "string" ? null : {
                ownerId: t.ownerId
            }
        } catch {
            return null
        }
    }

    function ht() {
        let e = document.getElementById("loading-overlay");
        e?.classList.add("tab-lock-contended"), e?.setAttribute("aria-busy", "false"), document.getElementById("canvas")?.classList.add("tab-lock-contended");
        let t = document.getElementById("status");
        t && (t.textContent = "Roblox is already running in another tab. Close that tab, then reload this one.")
    }
    async function bt() {
        return "locks" in navigator ? new Promise(e => {
            let t = !1,
                n = o => {
                    t || (t = !0, e(o))
                };
            navigator.locks.request(pt, {
                ifAvailable: !0
            }, o => {
                if (o === null) {
                    n("contended");
                    return
                }
                let r, i = new Promise(d => {
                    r = d
                });
                return n({
                    release: r
                }), i
            }).catch(o => {
                console.warn("[WasmPlayer] navigator.locks failed; trying localStorage lease:", o), n(null)
            })
        }) : null
    }

    function wt() {
        let e;
        try {
            if (e = window.localStorage, ye(e.getItem(Z)) !== null) return {
                kind: "contended"
            }
        } catch (r) {
            return console.warn("[WasmPlayer] localStorage is unavailable for tab coordination:", r), {
                kind: "unavailable"
            }
        }
        let t = ft(),
            n = !1,
            o = () => {
                if (!n) {
                    n = !0;
                    try {
                        ye(e.getItem(Z))?.ownerId === t && e.removeItem(Z)
                    } catch (r) {
                        console.warn("[WasmPlayer] Failed to release localStorage tab lock:", r)
                    }
                }
            };
        try {
            if (e.setItem(Z, JSON.stringify({
                    ownerId: t
                })), ye(e.getItem(Z))?.ownerId !== t) return {
                kind: "contended"
            }
        } catch (r) {
            return console.warn("[WasmPlayer] Failed to acquire localStorage tab lock:", r), {
                kind: "unavailable"
            }
        }
        return window.addEventListener("pagehide", o, {
            once: !0
        }), {
            kind: "acquired",
            lease: {
                release: o
            },
            mechanism: "local-storage"
        }
    }
    async function xt() {
        let e = await bt();
        return e === "contended" ? {
            kind: "contended"
        } : e !== null ? {
            kind: "acquired",
            lease: e,
            mechanism: "navigator-locks"
        } : wt()
    }
    var vt = "/v1/locales/user-localization-locus-supported-locales";

    function yt(e) {
        let t = new URL(e.includes("://") ? e : `https://${e}`),
            n = t.hostname.split(".");
        return n[0] === "www" ? n[0] = "locale" : n[0] !== "locale" && n.unshift("locale"), t.hostname = n.join("."), t.pathname = vt, t.search = "", t.hash = "", t.href
    }

    function qe(e) {
        if (typeof e != "object" || e === null) return "";
        let t = e.locale;
        return typeof t == "string" ? t.trim() : ""
    }
    async function Pt(e, t) {
        let n = yt(e),
            o = t ? t.url(n) : n;
        try {
            let r = await fetch(o, {
                credentials: "include",
                ...t ? {
                    headers: t.authHeaders()
                } : {}
            });
            if (!r.ok) throw new Error(`HTTP ${r.status}`);
            let i = await r.json(),
                d = {
                    robloxLocaleId: qe(i.generalExperience),
                    gameLocaleId: qe(i.ugc)
                };
            if (!d.robloxLocaleId) throw new Error("response did not contain generalExperience.locale");
            return console.log(`[Locale] Account locales loaded: Roblox=${d.robloxLocaleId}, UGC=${d.gameLocaleId||"<fallback>"}`), d
        } catch (r) {
            return console.warn("[Locale] Account locale fetch failed; engine defaults will be used:", r), {
                robloxLocaleId: "",
                gameLocaleId: ""
            }
        }
    }

    function Et(e) {
        let n = `; ${document.cookie}`.split(`; ${e}=`);
        return n.length === 2 ? n.pop()?.split(";").shift() ?? null : null
    }
    var _t = "RBXEventTrackerV2",
        St = (() => {
            let e = Et(_t);
            return e == null ? null : new URLSearchParams(e).get("browserid")
        })();
    console.log(`Loading WasmPlayer: Engine Base URL is ${U}, channel ${G.channel??"<none>"}`);
    console.log(`Loading WasmPlayer: Page Base URL is ${Se}`);
    var Ce = `${U}/WebClient.js`,
        Ct = (() => {
            let e = new URL(G.workerStubUrl ?? `${Se}/stub.js`);
            return e.searchParams.set("src", Ce), e.href
        })(),
        le = {
            fileLocations: {
                "WebClient.js": Ce,
                "WebClient.wasm": `${U}/WebClient.wasm`,
                "WebClient.fsindex.txt": `${U}/WebClient.fsindex.txt`,
                "audio-processor-fast.js": `${U}/audio-processor-fast.js`,
                "stub.js": Ct
            }
        },
        ee = e => {
            let t = new URL(Ce).origin;
            return e == "stub.js" && Se == t && (console.log("Redirecting WebWorker to primary script"), e = "WebClient.js"), console.log(`${e} ${le.fileLocations[e]}`), le.fileLocations[e]
        },
        Pe = null,
        Ee = null;

    function ze(e) {
        return Ee = e, (async () => {
            let t = await fetch(e);
            if (!t.ok || !t.body) throw new Error(`WebClient.wasm fetch failed: HTTP ${t.status}`);
            let n = t.headers.get("Content-Encoding") ? 0 : Number(t.headers.get("Content-Length")) || 0,
                o = 0,
                r = !1,
                i = 0,
                d = () => {
                    r || (n && o > n && (n = 0), f.setDownloadProgress(o, n), i = requestAnimationFrame(d))
                };
            i = requestAnimationFrame(d);
            let a = new TransformStream({
                    transform(m, p) {
                        o += m.length, p.enqueue(m)
                    }
                }),
                l = new Response(t.body.pipeThrough(a), {
                    headers: {
                        "Content-Type": "application/wasm"
                    }
                });
            try {
                return await WebAssembly.compileStreaming(l)
            } finally {
                r = !0, cancelAnimationFrame(i), f.clearStatus()
            }
        })()
    }

    function It() {
        if (!Ee) return N.unknown;
        let e = performance.getEntriesByName(new URL(Ee, document.baseURI).href, "resource")[0];
        return !e || e.responseStart === 0 || e.decodedBodySize === 0 ? N.unknown : e.deliveryType === "cache" ? N.hit : e.deliveryType === "" ? N.miss : N.unknown
    }
    async function Je(e, t, n, o, r, i, d, a, l, m) {
        var p = document.getElementById("server"),
            h = document.getElementById("proxyenabled");
        p.innerText = t, h.innerText = d ? "Enabled" : "Disabled";
        let k = mt() ? Ge(window.location.search) : {},
            y = k.renderer !== void 0 ? k.renderer === "webgpu" : ut();
        k.renderer !== void 0 && (i.applicationSettings.FFlagWasmPreferWebGPU = y ? "True" : "False"), console.info(`[WasmPlayer] Selected ${y?"WebGPU":"WebGL"}`);
        let j = y ? await $e() : void 0;
        if (!y) {
            let v = e.getContext("webgl2", {
                powerPreference: "high-performance"
            }).getSupportedExtensions();
            console.log("Available WebGL Extensions:"), console.log(v), v.forEach(F => console.log(`- ${F}`))
        }
        let A = {
                WebLogin: "2",
                RobloxLocaleId: r.robloxLocaleId,
                GameLocaleId: r.gameLocaleId
            },
            P = parseInt(i.applicationSettings.FIntWasmMemoryPages ?? "32768"),
            te = P * (64 * 1024);
        console.log(`Wasm Memory Bytes = ${te} Pages = ${P}`);
        let ce = new WebAssembly.Memory({
                initial: P,
                maximum: P,
                shared: !0
            }),
            T = await gt,
            S = performance.now();
        console.log(`[WASM-TIMING] createWebClient starting at ${S.toFixed(1)}ms from page load`);
        var s = {
            wasmMemory: ce,
            preinitializedWebGPUDevice: j,
            hostInfo: T,
            locateFile: ee,
            mainScriptUrlOrBlob: ee("stub.js"),
            instantiateWasm: (u, v) => ((Pe ?? ze(le.fileLocations["WebClient.wasm"])).then(I => WebAssembly.instantiate(I, u).then(V => v(V, I))).catch(I => {
                console.error("[wasm] instantiate failed", I), f.showFailure("Unable to start Roblox. Check the console and reload.")
            }), {}),
            audioProcessorUrl: ee("audio-processor-fast.js"),
            encoder: new TextEncoder,
            decoder: new TextDecoder,
            fontMap: {},
            preInit: [function() {
                let u = performance.now();
                window.__wasmPreInitTime = u, console.log(`[WASM-TIMING] preInit (before global ctors): +${(u-S).toFixed(1)}ms`)
            }],
            preRun: [function() {
                let u = performance.now();
                console.log(`[WASM-TIMING] preRun (before main): +${(u-S).toFixed(1)}ms`)
            }],
            onRuntimeInitialized: function() {
                let u = performance.now(),
                    v = window.__wasmPreInitTime ?? S;
                console.log(`[WASM-TIMING] onRuntimeInitialized: +${(u-S).toFixed(1)}ms total, ${(u-v).toFixed(1)}ms since preInit (includes global ctors)`), i.applicationSettings.FFlagWasmDeeplinkGameJoinTimingTelemetry?.toLowerCase() === "true" && (window.__webClientWasmCacheState = It());
                let F = s.cwrap("rbx_fs_add_file", "number", ["string", "array", "number"]),
                    I = s.cwrap("rbx_fs_load_index", "number", ["number", "number"]);
                s.cwrap("rbx_fs_set_base_url", null, ["string"])(U);
                let H = s._malloc(l.length);
                if (!H) throw new Error(`Could not allocate ${l.length} bytes for WebClient.fsindex.txt`);
                s.HEAPU8.set(l, H);
                let q = I(H, l.length);
                if (s._free(H), q < 0) throw new Error("WebClient.fsindex.txt is malformed");
                console.log(`Indexed ${q} assets`);
                let pe = window.__prefetchedAssets;
                if (pe) {
                    let C = s.cwrap("rbx_fs_preload_asset", "number", ["string", "number", "number"]);
                    for (let [M, E] of pe) {
                        let w = new Uint8Array(E),
                            _ = s._malloc(w.length);
                        _ && (s.HEAPU8.set(w, _), C(M, _, w.length) !== 0 && s._free(_))
                    }
                    console.log(`Preloaded ${pe.size} assets into VFS`), window.__prefetchedAssets = null
                }
                let oe = (C, M) => {
                        let E = s.encoder.encode(M);
                        F(C, E, E.length)
                    },
                    re = JSON.stringify(A);
                oe("/appData/LocalStorage/appStorage.json", re), oe("/appData/LocalStorage/sitetest1.robloxlabs.com_appStorage.json", re), oe("/appData/LocalStorage/sitetest2.robloxlabs.com_appStorage.json", re), oe("/appData/LocalStorage/sitetest3.robloxlabs.com_appStorage.json", re), s.set_roblox_base_url(`https://${t}/`), m !== null && (s.set_channel(m), console.log(`[WasmPlayer] Engine channel set to "${m||"production"}"`)), s.set_pretend_platform(_e() ? "mobile" : "desktop"), i.applicationSettings.BaseUrl = "https://" + t, s.set_preloaded_flags(JSON.stringify(i)), Ne(s), s.set_account_locales(r.robloxLocaleId, r.gameLocaleId), a && s.set_place_id(a), s.set_browser_tracker_id(St ?? "");
                let Ie = document.getElementById("input-container"),
                    z = document.getElementById("input-textarea"),
                    J = document.getElementById("input-input");
                if (z && J) {
                    let C = s.cwrap("on_virtual_text_changed", null, ["number", "number", "number"]),
                        M = s.cwrap("on_return_pressed", null, []),
                        E = w => {
                            let _ = w.target,
                                K = _.value,
                                X = _.selectionStart ?? 0,
                                ie = _.selectionEnd ?? 0,
                                Ae = s.encoder.encode(K.substring(0, X)).length,
                                Ke = X == ie ? Ae : s.encoder.encode(K.substring(0, ie)).length;
                            s.pendingBytes = s.encoder.encode(K), C(s.pendingBytes.length, Ae, Ke)
                        };
                    z.addEventListener("input", E), z.addEventListener("click", E), J.addEventListener("input", E), J.addEventListener("click", E), J.addEventListener("keydown", w => {
                        w.key === "Enter" && (w.preventDefault(), M())
                    }), z.addEventListener("keydown", w => {
                        if (w.key !== "Enter") return;
                        !!s.currentInputMultiline || (w.preventDefault(), M())
                    }), Ie !== null && (s.inputContainer = Ie), s.textAreaElement = z, s.inputElement = J
                } else console.error('Could not find element with id "input-textarea" or "input-input"');
                document.addEventListener("fullscreenchange", () => {
                    s.notify_fullscreen_change(!!document.fullscreenElement)
                });

                function Le() {
                    let C = `(resolution: ${window.devicePixelRatio}dppx)`;
                    window.matchMedia(C).addEventListener("change", function() {
                        console.log("pixel ratio change observed"), s.update_pixel_ratio(s.getEffectiveDevicePixelRatio()), Le()
                    }, {
                        once: !0
                    })
                }
                if (Le(), "virtualKeyboard" in navigator) {
                    let C = navigator.virtualKeyboard,
                        M = s.cwrap("update_virtual_keyboard_bounds", null, ["number", "number", "number", "number"]);
                    C.overlaysContent = !0, C.addEventListener("geometrychange", E => {
                        let {
                            left: w,
                            bottom: _,
                            width: K,
                            height: X
                        } = E.target.boundingRect, ie = _ - X;
                        M(w, ie, K, X)
                    })
                }
            },
            print: (...u) => {
                console.log(u.join(" "))
            },
            canvas: (e.addEventListener("webglcontextlost", u => {
                alert("WebGL context lost. You will need to reload the page."), u.preventDefault()
            }, !1), e),
            setStatus: u => {
                var I;
                if ((I = s.setStatus).last ?? (I.last = {
                        time: Date.now(),
                        text: ""
                    }), u !== s.setStatus.last.text) {
                    var v = u.match(/([^(]+)\((\d+(\.\d+)?)\/(\d+)\)/),
                        F = Date.now();
                    if (!(v && F - s.setStatus.last.time < 30))
                        if (s.setStatus.last.time = F, s.setStatus.last.text = u, v) {
                            let V = v[1].trim(),
                                H = Number(v[2]),
                                q = Number(v[4]);
                            f.setStatus(q > 0 ? `${V} ${Math.round(H/q*100)}%` : V)
                        } else u ? f.setStatus(u) : f.clearStatus()
                }
            },
            totalDependencies: 0,
            monitorRunDependencies: u => {
                s.totalDependencies = Math.max(s.totalDependencies, u), s.setStatus(u ? "Preparing... (" + (s.totalDependencies - u) + "/" + s.totalDependencies + ")" : "All downloads complete.")
            },
            logReadFiles: !0,
            saveIxpSettings: De
        };
        let de = ["pointerdown", "keydown", "touchstart"],
            c = () => {
                for (let u of de) window.removeEventListener(u, c, !0);
                try {
                    s.resume_audio()
                } catch {}
            };
        for (let u of de) window.addEventListener(u, c, {
            capture: !0,
            passive: !0
        });
        let R = navigator.userAgentData?.mobile ?? /Mobi|Android/i.test(navigator.userAgent),
            x = parseFloat(new URLSearchParams(window.location.search).get("renderScale") || ""),
            B = Number.isFinite(x) && x > 0,
            ne = B ? x : 1,
            ue = B ? 1 / 0 : R ? 1.31 : 1 / 0;
        s.getEffectiveDevicePixelRatio = () => Math.min(window.devicePixelRatio || 1, ue) * ne, s.isMobileDevice = () => R;
        let O = !1;
        new ResizeObserver(() => {
            O = !0
        }).observe(e), s.applyPendingResize = () => {
            if (!O) return !1;
            O = !1;
            let u = s.getEffectiveDevicePixelRatio();
            return e.width = Math.round(e.clientWidth * u), e.height = Math.round(e.clientHeight * u), !0
        }, window.onerror = () => {
            f.showFailure("Roblox encountered a problem. Check the console and reload."), s.setStatus = u => {
                u && console.error("[post-exception status] " + u)
            }
        }, window.Module = s;
        let ge = await createWebClient(s),
            W = performance.now();
        return console.log(`[WASM-TIMING] createWebClient resolved: +${(W-S).toFixed(1)}ms total`), ge
    }
    window.__resolveGameExit = e => {
        console.log("[WasmPlayer] gameExit (no listener):", e)
    };
    var $ = window;
    $.__downloadMicroProfile = (e, t, n) => {
        let o = new Blob([e], {
                type: n
            }),
            r = URL.createObjectURL(o),
            i = document.createElement("a");
        i.href = r, i.download = t, i.style.display = "none", document.body.appendChild(i), i.click(), i.remove(), setTimeout(() => URL.revokeObjectURL(r), 6e4)
    };
    $.startMicroProfile = () => {
        if (!window.Module?.start_microprofile_capture) {
            console.error("[MicroProfile] engine not ready");
            return
        }
        window.Module.start_microprofile_capture(), console.log("[MicroProfile] capture started")
    };
    $.stopMicroProfile = () => {
        if (!window.Module?.stop_microprofile_capture) {
            console.error("[MicroProfile] engine not ready");
            return
        }
        window.Module.stop_microprofile_capture(), console.log("[MicroProfile] capture stopped")
    };
    $.dumpMicroProfile = async (e = 5, t = 600) => {
        if (!window.Module?.dump_microprofile_html) {
            console.error("[MicroProfile] engine not ready");
            return
        }
        let n = !1;
        e > 0 && (window.Module.start_microprofile_capture(), n = !0, console.log(`[MicroProfile] capturing for ${e}s, then dumping...`), await new Promise(l => setTimeout(l, e * 1e3)));
        let o = performance.now(),
            r = window.Module.dump_microprofile_html(t),
            i = (performance.now() - o).toFixed(0);
        if (n && window.Module.stop_microprofile_capture(), !r || r.length === 0) {
            console.error("[MicroProfile] empty dump \u2014 capture may not have been active");
            return
        }
        console.log(`[MicroProfile] dumped ${(r.length/1024).toFixed(0)}KB in ${i}ms`), $.__lastMicroProfileHtml = r;
        let a = `MicroProfile_${new Date().toISOString().replace(/[:.]/g,"-")}.html`;
        $.__downloadMicroProfile?.(r, a, "text/html;charset=utf-8"), console.log(`[MicroProfile] triggered download: ${a}
[MicroProfile] desktop chrome://inspect alternative: copy(window.__lastMicroProfileHtml)`)
    };
    var Lt = ["rbxPerfDeviceId.v1", "rbxDeviceProbe.v1", "rbxPerfSamples.v1"];

    function At() {
        try {
            for (let e of Lt) localStorage.removeItem(e)
        } catch {}
    }

    function Tt(e) {
        console.error("[WasmPlayer] non-clean exit, keeping tab open:", e);
        let t = document.createElement("div");
        t.style.cssText = ["position:fixed", "inset:0", "z-index:1000", "background:rgba(0,0,0,0.85)", "color:#fff", "font-family:monospace", "font-size:14px", "display:flex", "flex-direction:column", "align-items:center", "justify-content:center", "padding:24px", "gap:12px", "text-align:center"].join(";");
        let n = document.createElement("div");
        n.textContent = e.reason === "crash" ? "Engine crashed" : `Exit: ${e.reason}`, n.style.cssText = "font-size:20px;font-weight:bold;color:#ff7070";
        let o = document.createElement("pre"),
            r = [e.errorType ? `type: ${e.errorType}` : null, e.errorMessage ? `message: ${e.errorMessage}` : null, e.statusCode !== void 0 ? `statusCode: ${e.statusCode}` : null].filter(Boolean);
        o.textContent = r.join(`
`) || "(no details)", o.style.cssText = "max-width:80vw;max-height:50vh;overflow:auto;white-space:pre-wrap;text-align:left;background:#111;padding:12px;border-radius:6px";
        let i = document.createElement("div");
        i.textContent = "Open devtools console for full logs. The tab is intentionally left open.", i.style.cssText = "opacity:0.75";
        let d = document.createElement("div");
        d.style.cssText = "display:flex;gap:8px";
        let a = document.createElement("button");
        a.textContent = "Reload", a.onclick = () => window.location.reload();
        let l = document.createElement("button");
        l.textContent = "Close tab", l.onclick = () => {
            window.close(), window.location.replace("about:blank")
        };
        for (let m of [a, l]) m.style.cssText = "padding:6px 14px;font:inherit;cursor:pointer";
        d.append(a, l), t.append(n, o, i, d), document.body.appendChild(t)
    }
    async function Rt(e) {
        let t = !1,
            n = new Promise(o => {
                window.__resolveGameExit = r => {
                    t || (t = !0, o(r))
                }
            });
        return await Je(e.canvas, e.robloxBaseUrl, e.websiteBaseUrl, e.authCookie, e.accountLocales, e.flags, e.enableProxy, e.placeId, e.assetIndex, e.channel), n
    }(async () => {
        let e = await xt();
        if (e.kind === "contended") {
            ht();
            return
        }
        e.kind === "unavailable" ? console.warn("[WasmPlayer] Tab mutex unavailable; continuing without cross-tab coordination.") : console.log(`[WasmPlayer] Acquired tab mutex via ${e.mechanism}`);
        let t = performance.now(),
            n = 0;
        setInterval(() => {
            let c = performance.now(),
                g = (c - t).toFixed(1);
            t = c, console.log(`[MAIN] heartbeat #${++n} t=${c.toFixed(1)}ms delta=${g}ms`)
        }, 500), window.addEventListener("unhandledrejection", c => {
            let g = c.reason;
            if (console.error("[UNHANDLED-REJECTION]", g), g && g.stack && console.error("[UNHANDLED-REJECTION stack]", g.stack), g && typeof g == "object")
                for (let R of Object.getOwnPropertyNames(g)) console.error("  ." + R + " =", g[R]);
            window.Module?._web_client_record_browser_event?.(fe.unhandledRejection)
        }), window.addEventListener("error", c => {
            console.error("[WINDOW-ERROR]", c.message, c.filename + ":" + c.lineno + ":" + c.colno), c.error && c.error.stack && console.error("[WINDOW-ERROR stack]", c.error.stack), window.Module?._web_client_record_browser_event?.(fe.jsError)
        }), At();
        let o = new URLSearchParams(window.location.search),
            r = window.location.hostname,
            i = r == "roblox.com" || r.endsWith(".roblox.com") || r.endsWith(".robloxlabs.com"),
            d = L[Ve].websiteHost,
            a = b?.baseUrl ?? d,
            l = o.has("placeId") ? Number(o.get("placeId")) : void 0,
            m = l !== void 0 && Number.isSafeInteger(l) && l > 0 ? l : void 0;
        if (i && !m) {
            window.location.replace(`https://${d}`);
            return
        }
        let p = i ? void 0 : b?.apiProxy;
        f.prepare(m), f.setStatus(m ? "Preparing experience\u2026" : "Preparing Roblox\u2026"), m && f.loadExperience(m, {
            robloxBaseUrl: a,
            proxy: p
        });
        let h = G.channel,
            k = Ue(Ve, h);
        window.__onDefaultLoadingScreenRemoved = () => f.dismissAfterRenderedFrame();
        var y = document.getElementById("canvas");
        console.log(window.devicePixelRatio), Pe = ze(le.fileLocations["WebClient.wasm"]), Pe.catch(c => {
            console.error("[wasm] engine load failed", c), f.showFailure("Failed to load Roblox. Please reload the page.")
        }), await (c => new Promise((g, R) => {
            let x = document.createElement("script");
            x.crossOrigin = "anonymous", x.src = c, x.onload = () => g(x), x.onerror = () => R(new Error(`Script load error for ${c}`)), document.head.appendChild(x)
        }))(ee("WebClient.js"));
        let A = "";
        if (i) try {
            if (!(await fetch(`https://${d.replace(/^www\./,"users.")}/v1/users/authenticated`, {
                    credentials: "include"
                })).ok) {
                console.log("[Auth] No active session, redirecting to login"), window.location.href = `https://${d}/login`;
                return
            }
        } catch (c) {
            console.warn("[Auth] Auth check failed, proceeding anyway:", c)
        } else if (b) {
            if (b.authCookie == "" || b.isCookieFromPool()) {
                let g = await b.allocateCookieFromPool();
                if (!g && b.isCookieFromPool() && (console.log("[CookiePool] Lease expired, retrying allocation..."), b.setAuthCookie(""), g = await b.allocateCookieFromPool()), g) console.log(`[CookiePool] Lease active: ${g.username}`), b.setAuthCookie(g.cookie);
                else if (b.authCookie == "") {
                    console.log("[CookiePool] No cookie available, redirecting to settings"), window.location.href = window.location.href.replace("WebClient.html", "WasmSettings.html");
                    return
                }
            } else console.log("[CookiePool] Using user-supplied cookie (skipping pool)");
            A = b.authCookie
        } let P = p !== void 0,
            te = window.location.origin;
        (window.location + "").replace("/WebClient/WebClient.html", "");
        let ce = Pt(a, p),
            [T, S, s] = await Promise.all([k, fetch(ee("WebClient.fsindex.txt")).then(async c => {
                if (!c.ok) throw new Error(`WebClient.fsindex.txt: HTTP ${c.status}`);
                return new Uint8Array(await c.arrayBuffer())
            }), ce]);
        if (b && Object.assign(T.applicationSettings, b.getFlagOverrides()), _e() || (T.applicationSettings.FFlagHideCursorForNonMouseUsers = "False"), Oe(T), T.applicationSettings.FFlagWasmPrefetchAllAssets === "true") {
            let c = je(S),
                g = window.__prefetchedAssets = new Map;
            await new Promise(x => {
                let B = 0,
                    ne = 0,
                    ue = 0,
                    O = () => {
                        for (; B < 20 && ne < c.length;) {
                            B++;
                            let me = c[ne++],
                                ge = `${U}${me.path}`;
                            fetch(ge).then(W => W.ok ? W.arrayBuffer() : null).then(W => {
                                W && g.set(me.path, W)
                            }).finally(() => {
                                B--, ++ue === c.length ? x() : O()
                            })
                        }
                    };
                O()
            }), console.log(`Prefetch completed: ${c.length} assets`)
        } else console.log("No prefetch: assets will be fetched on-demand");
        if (m) {
            let c = await Rt({
                canvas: y,
                robloxBaseUrl: a,
                websiteBaseUrl: te,
                authCookie: A,
                accountLocales: s,
                flags: T,
                enableProxy: P,
                placeId: m,
                assetIndex: S,
                channel: h
            });
            window.opener && window.opener.postMessage({
                type: "gameExit",
                ...c
            }, "*"), c.reason === "leave" || c.reason === "native_exit" ? (f.dismiss(), setTimeout(() => {
                window.close(), window.location.replace("about:blank")
            }, 50)) : c.reason !== "join_failed" && Tt(c)
        } else await Je(y, a, te, A, s, T, P, m, S, h), f.dismiss()
    })().catch(e => {
        console.error("[WasmPlayer] startup failed:", e), f.showFailure("Unable to start Roblox. Check the console and reload.")
    });
})();

;
! function() {
    try {
        var g = globalThis,
            s = new g.Error().stack;
        s && ((g._sentryDebugIds = g._sentryDebugIds || {})[s] = "bb0fe127-0cf3-5fa8-9021-da4ac48e7a27")
    } catch (e) {}
}();
//# debugId=bb0fe127-0cf3-5fa8-9021-da4ac48e7a27