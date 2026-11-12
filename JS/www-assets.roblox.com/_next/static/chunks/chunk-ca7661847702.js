;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "2b2d419e-06d5-1236-4a86-ee891d54ed3a")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 145420, e => {
    "use strict";
    var t = e.i(245837),
        n = e.i(646424),
        r = e.i(587541);
    let i = () => r.Url.parse(t.default.metricsApi).getOrThrow().withPath("/v1/games/report-event"),
        o = () => r.Url.parse(`https://assetgame.${t.default.domain}`).getOrThrow().withPath("/game/report-stats"),
        l = (e, t, r) => {
            try {
                n.postUntyped(e().withSearchParams({
                    name: t,
                    ...r
                }), "", {
                    credentials: "include",
                    keepalive: !0,
                    signal: AbortSignal.timeout(3e4)
                })
            } catch {}
        },
        a = new Map,
        s = (e, t) => {
            let n = Date.now();
            t.forEach(t => {
                let r = a.get(t);
                void 0 !== r && (a.delete(t), l(o, `${t}_${e}`, {
                    value: String(n - r)
                }))
            })
        };
    e.s(["endCancel", 0, function() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        s("Cancel", t)
    }, "endFailure", 0, function() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        s("Failure", t)
    }, "endSuccess", 0, function() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        s("Success", t)
    }, "fireEvent", 0, function() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        t.forEach(e => {
            l(i, e)
        })
    }, "start", 0, function() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        let r = Date.now();
        t.forEach(e => a.set(e, r))
    }])
}, 778579, 57099, e => {
    "use strict";
    var t = e.i(357355),
        n = e.i(145420),
        r = e.i(880983),
        i = e.i(889375);
    let o = {
            pathname: "",
            context: "unknown"
        },
        l = (e, n, l, a, s, c) => {
            let f;
            if (null == t.window) return;
            let {
                pathname: u
            } = t.window.location;
            o.pathname !== u && (o = {
                pathname: u,
                context: "unknown"
            }), null != n && "" !== n && "unknown" !== n && (o.context = n), (0, i.sendEvent)(e, o.context, {
                lType: "protocol",
                pid: l ?? void 0,
                refuid: a ?? void 0,
                pg: (f = (0, r.stripLocalePrefix)(u).toLowerCase()).endsWith("profile") ? "profile" : f.startsWith("/develop") ? "develop" : f.startsWith("/discover") ? "games" : "gameDetail",
                joinAttemptId: s ?? void 0,
                ...null == c ? {} : {
                    actionType: c
                }
            })
        },
        a = {
            startClientAttempted: "clientStartAttempt",
            startClientSucceeded: "clientStartSuccessWeb",
            beginInstall: "installBegin",
            successfulInstall: "installSuccess",
            manualDownload: "manualDownload"
        },
        s = {
            startClientAttempted: ["GameLaunchAttempt_<os>", "GameLaunchAttempt_<os>_<launchmethod>"],
            startClientSucceeded: ["GameLaunchSuccessWeb_<os>", "GameLaunchSuccessWeb_<os>_<launchmethod>"]
        };
    e.s(["logGameLaunchEvent", 0, (e, t, r) => {
        let {
            launchMethod: i,
            params: o
        } = r, c = "Windows" === e ? "Win32" : e;
        (0, n.fireEvent)(...(s[t] ?? []).map(e => e.replace("<os>", c).replace("<launchmethod>", i))), l(a[t], null, "placeId" in o ? o.placeId : void 0)
    }, "sendGamePlayEvent", 0, l], 57099);
    let c = (e, t, n, r) => {
        let o = Object.fromEntries(Object.entries(n).filter(e => {
            let [t] = e;
            return "ctx" !== t
        }));
        (0, i.sendEvent)(e, t, o)
    };
    e.s(["eventTypes", 0, {
        formInteraction: "formInteraction",
        modalAction: "modalAction",
        pageLoad: "pageLoad",
        buttonClick: "buttonClick"
    }, "sendEvent", 0, (e, t) => {
        let {
            name: n,
            type: r,
            context: i,
            requiredParams: o
        } = e, l = {
            btn: n,
            ...t
        };
        Array.isArray(o) && o.forEach(e => {
            Object.hasOwn(l, e) || console.error(`A required event parameter '${e}' is not provided`)
        }), c(r, i, l)
    }, "sendEventWithTarget", 0, c, "sendGamePlayEvent", 0, (e, t, n, r, i) => {
        l("gamePlayIntent", e, t, n, r, i)
    }, "targetTypes", 0, {
        DEFAULT: 0,
        WWW: 1,
        STUDIO: 2,
        DIAGNOSTIC: 3
    }], 778579)
}, 10224, e => {
    "use strict";
    var t, n, r = e.i(868275),
        i = e.i(357355),
        o = e.i(646424),
        l = e.i(849735),
        a = e.i(552566),
        s = e.i(723941),
        c = e.i(587541),
        f = e.i(815079),
        u = ((t = {})[t.ok = 200] = "ok", t[t.accepted = 202] = "accepted", t[t.movedPermanently = 301] = "movedPermanently", t[t.badRequest = 400] = "badRequest", t[t.unauthorized = 401] = "unauthorized", t[t.forbidden = 403] = "forbidden", t[t.notFound = 404] = "notFound", t[t.methodNotAllowed = 405] = "methodNotAllowed", t[t.conflict = 409] = "conflict", t[t.payloadTooLarge = 413] = "payloadTooLarge", t[t.tooManyAttempts = 429] = "tooManyAttempts", t[t.serverError = 500] = "serverError", t[t.serviceUnavailable = 503] = "serviceUnavailable", t),
        d = ((n = {}).GET = "get", n.HEAD = "head", n.POST = "post", n.PUT = "put", n.DELETE = "delete", n.OPTIONS = "options", n.PATCH = "patch", n);
    class h extends Error {
        constructor(e, t, n, i) {
            super(e), (0, r._)(this, "config", void 0), (0, r._)(this, "response", void 0), (0, r._)(this, "code", void 0), (0, r._)(this, "isAxiosError", void 0), this.config = t, this.response = n, this.code = i, this.isAxiosError = !0, this.name = "AxiosError"
        }
    }
    let p = [...c.defaultUrlOptions.domainAllowlist, ".rbxcdn.com"],
        m = e => "string" == typeof e || "number" == typeof e || "boolean" == typeof e ? String(e) : (0, s.serialize)(e).getOrThrow(),
        g = (e, t, n, r, i) => {
            let o;
            return {
                data: (e => {
                    if (0 === e.length) return "";
                    let t = (0, s.deserializeUntyped)(e);
                    return t.isErr() ? e : t.value
                })(i),
                status: t,
                statusText: n,
                headers: (o = {}, r.forEach((e, t) => {
                    o[t] = e
                }), o),
                config: e
            }
        },
        w = async (e, t, n, r) => {
            let a, u = (a = new Headers, t.noCache && (a.set("Cache-Control", "no-cache, no-store, must-revalidate"), a.set("Pragma", "no-cache"), a.set("Expires", "0")), Object.entries(t.headers ?? {}).forEach(e => {
                    let [t, n] = e;
                    null != n && a.set(t, String(n))
                }), t.noPragma && a.delete("Pragma"), null != t.authBearerToken && a.set("X-Auth-Bearer-Token", t.authBearerToken), {
                    headers: a,
                    includeBodyOnError: !0,
                    ...t.withCredentials ? {
                        credentials: "include"
                    } : {},
                    ...null != t.timeout && t.timeout > 0 ? {
                        signal: AbortSignal.timeout(t.timeout)
                    } : {}
                }),
                d = new Headers(u.headers),
                w = "GET" === e || "DELETE" === e ? void 0 : ((e, t) => {
                    if (null != e) return "string" == typeof e || e instanceof ArrayBuffer || ArrayBuffer.isView(e) ? e : null != i.window && e instanceof i.window.Document ? (t.set("Content-Type", "application/xml"), new i.window.XMLSerializer().serializeToString(e)) : Array.isArray(e) || Object.getPrototypeOf(e) === Object.prototype ? (t.has("Content-Type") || t.set("Content-Type", "application/json"), (0, s.serialize)(e).getOrThrow()) : e
                })(n, d),
                y = void 0 === r ? t : {
                    ...t,
                    params: r
                };
            try {
                let n = await o.fetch(((e, t) => {
                    var n;
                    let r, o = (n = e.url, r = /^([a-z]+:\/\/|\/\/)/i.test(n) ? n.startsWith("//") ? `https:${n}` : n : new URL(n, f.wwwRoblox.href).href, c.Url.parseWithOptions(r, {
                        domainAllowlist: p
                    }).getOrThrow());
                    if (null == t) return o;
                    let l = null != i.window && t instanceof i.window.URLSearchParams ? [...t.entries()] : Object.entries(t).flatMap(e => {
                        let [t, n] = e;
                        return null == n ? [] : Array.isArray(n) ? n.map(e => [`${t}[]`, m(e)]) : [
                            [t, m(n)]
                        ]
                    });
                    return o.withSearchParamsAppended(l)
                })(t, r), {
                    ...u,
                    method: e,
                    headers: d,
                    body: w
                }).getOrThrow();
                return g(y, n.status, n.statusText, n.headers, await n.text())
            } catch (n) {
                if (!(n instanceof l.HttpError)) throw n;
                let e = g(y, n.response.status, n.response.statusText, n.response.headers, n.response.body ?? "");
                if (t.fullError) return Promise.reject(new h(n.message, t, e));
                return Promise.reject(e)
            }
        }, y = e => {
            let t = [];
            if (!e || "object" != typeof e) return [];
            let {
                errors: n
            } = e;
            return n instanceof Array ? (n.forEach(e => {
                if (!e || "object" != typeof e) return;
                let {
                    code: n
                } = e;
                "number" == typeof n && t.push(n)
            }), t) : []
        };
    e.s(["AxiosError", 0, h, "HttpRequestMethods", () => d, "HttpResponseCodes", () => u, "delete", 0, (e, t) => w("DELETE", e, void 0, t ?? e.params), "get", 0, (e, t) => w("GET", e, void 0, t ?? e.params), "getApiErrorCodes", 0, y, "isCancelled", 0, e => e instanceof a.AbortError || e instanceof Error && "AbortError" === e.name, "parseErrorCode", 0, e => {
        let t = y(e);
        return "object" == typeof e && null != e && y(e.data).forEach(e => {
            t.push(e)
        }), t[0] ?? null
    }, "patch", 0, (e, t) => w("PATCH", e, t, e.params), "post", 0, (e, t) => w("POST", e, t, e.params), "put", 0, (e, t) => w("PUT", e, t, e.params)])
}, 422957, e => {
    "use strict";
    let t = ["top", "right", "bottom", "left"],
        n = t.reduce((e, t) => e.concat(t, t + "-start", t + "-end"), []),
        r = Math.min,
        i = Math.max,
        o = Math.round,
        l = Math.floor,
        a = e => ({
            x: e,
            y: e
        }),
        s = {
            left: "right",
            right: "left",
            bottom: "top",
            top: "bottom"
        },
        c = {
            start: "end",
            end: "start"
        };

    function f(e, t) {
        return "function" == typeof e ? e(t) : e
    }

    function u(e) {
        return e.split("-")[0]
    }

    function d(e) {
        return e.split("-")[1]
    }

    function h(e) {
        return "x" === e ? "y" : "x"
    }

    function p(e) {
        return "y" === e ? "height" : "width"
    }
    let m = new Set(["top", "bottom"]);

    function g(e) {
        return m.has(u(e)) ? "y" : "x"
    }

    function w(e, t, n) {
        void 0 === n && (n = !1);
        let r = d(e),
            i = h(g(e)),
            o = p(i),
            l = "x" === i ? r === (n ? "end" : "start") ? "right" : "left" : "start" === r ? "bottom" : "top";
        return t.reference[o] > t.floating[o] && (l = E(l)), [l, E(l)]
    }

    function y(e) {
        return e.replace(/start|end/g, e => c[e])
    }
    let v = ["left", "right"],
        x = ["right", "left"],
        b = ["top", "bottom"],
        A = ["bottom", "top"];

    function E(e) {
        return e.replace(/left|right|bottom|top/g, e => s[e])
    }

    function T(e) {
        return "number" != typeof e ? {
            top: 0,
            right: 0,
            bottom: 0,
            left: 0,
            ...e
        } : {
            top: e,
            right: e,
            bottom: e,
            left: e
        }
    }

    function R(e) {
        let {
            x: t,
            y: n,
            width: r,
            height: i
        } = e;
        return {
            width: r,
            height: i,
            top: n,
            left: t,
            right: t + r,
            bottom: n + i,
            x: t,
            y: n
        }
    }

    function L(e, t, n) {
        let r, {
                reference: i,
                floating: o
            } = e,
            l = g(t),
            a = h(g(t)),
            s = p(a),
            c = u(t),
            f = "y" === l,
            m = i.x + i.width / 2 - o.width / 2,
            w = i.y + i.height / 2 - o.height / 2,
            y = i[s] / 2 - o[s] / 2;
        switch (c) {
            case "top":
                r = {
                    x: m,
                    y: i.y - o.height
                };
                break;
            case "bottom":
                r = {
                    x: m,
                    y: i.y + i.height
                };
                break;
            case "right":
                r = {
                    x: i.x + i.width,
                    y: w
                };
                break;
            case "left":
                r = {
                    x: i.x - o.width,
                    y: w
                };
                break;
            default:
                r = {
                    x: i.x,
                    y: i.y
                }
        }
        switch (d(t)) {
            case "start":
                r[a] -= y * (n && f ? -1 : 1);
                break;
            case "end":
                r[a] += y * (n && f ? -1 : 1)
        }
        return r
    }
    let S = async (e, t, n) => {
        let {
            placement: r = "bottom",
            strategy: i = "absolute",
            middleware: o = [],
            platform: l
        } = n, a = o.filter(Boolean), s = await (null == l.isRTL ? void 0 : l.isRTL(t)), c = await l.getElementRects({
            reference: e,
            floating: t,
            strategy: i
        }), {
            x: f,
            y: u
        } = L(c, r, s), d = r, h = {}, p = 0;
        for (let n = 0; n < a.length; n++) {
            let {
                name: o,
                fn: m
            } = a[n], {
                x: g,
                y: w,
                data: y,
                reset: v
            } = await m({
                x: f,
                y: u,
                initialPlacement: r,
                placement: d,
                strategy: i,
                middlewareData: h,
                rects: c,
                platform: l,
                elements: {
                    reference: e,
                    floating: t
                }
            });
            f = null != g ? g : f, u = null != w ? w : u, h = {
                ...h,
                [o]: {
                    ...h[o],
                    ...y
                }
            }, v && p <= 50 && (p++, "object" == typeof v && (v.placement && (d = v.placement), v.rects && (c = !0 === v.rects ? await l.getElementRects({
                reference: e,
                floating: t,
                strategy: i
            }) : v.rects), {
                x: f,
                y: u
            } = L(c, d, s)), n = -1)
        }
        return {
            x: f,
            y: u,
            placement: d,
            strategy: i,
            middlewareData: h
        }
    };
    async function C(e, t) {
        var n;
        void 0 === t && (t = {});
        let {
            x: r,
            y: i,
            platform: o,
            rects: l,
            elements: a,
            strategy: s
        } = e, {
            boundary: c = "clippingAncestors",
            rootBoundary: u = "viewport",
            elementContext: d = "floating",
            altBoundary: h = !1,
            padding: p = 0
        } = f(t, e), m = T(p), g = a[h ? "floating" === d ? "reference" : "floating" : d], w = R(await o.getClippingRect({
            element: null == (n = await (null == o.isElement ? void 0 : o.isElement(g))) || n ? g : g.contextElement || await (null == o.getDocumentElement ? void 0 : o.getDocumentElement(a.floating)),
            boundary: c,
            rootBoundary: u,
            strategy: s
        })), y = "floating" === d ? {
            x: r,
            y: i,
            width: l.floating.width,
            height: l.floating.height
        } : l.reference, v = await (null == o.getOffsetParent ? void 0 : o.getOffsetParent(a.floating)), x = await (null == o.isElement ? void 0 : o.isElement(v)) && await (null == o.getScale ? void 0 : o.getScale(v)) || {
            x: 1,
            y: 1
        }, b = R(o.convertOffsetParentRelativeRectToViewportRelativeRect ? await o.convertOffsetParentRelativeRectToViewportRelativeRect({
            elements: a,
            rect: y,
            offsetParent: v,
            strategy: s
        }) : y);
        return {
            top: (w.top - b.top + m.top) / x.y,
            bottom: (b.bottom - w.bottom + m.bottom) / x.y,
            left: (w.left - b.left + m.left) / x.x,
            right: (b.right - w.right + m.right) / x.x
        }
    }

    function O(e, t) {
        return {
            top: e.top - t.height,
            right: e.right - t.width,
            bottom: e.bottom - t.height,
            left: e.left - t.width
        }
    }

    function P(e) {
        return t.some(t => e[t] >= 0)
    }

    function D(e) {
        let t = r(...e.map(e => e.left)),
            n = r(...e.map(e => e.top));
        return {
            x: t,
            y: n,
            width: i(...e.map(e => e.right)) - t,
            height: i(...e.map(e => e.bottom)) - n
        }
    }
    let W = new Set(["left", "top"]);
    async function H(e, t) {
        let {
            placement: n,
            platform: r,
            elements: i
        } = e, o = await (null == r.isRTL ? void 0 : r.isRTL(i.floating)), l = u(n), a = d(n), s = "y" === g(n), c = W.has(l) ? -1 : 1, h = o && s ? -1 : 1, p = f(t, e), {
            mainAxis: m,
            crossAxis: w,
            alignmentAxis: y
        } = "number" == typeof p ? {
            mainAxis: p,
            crossAxis: 0,
            alignmentAxis: null
        } : {
            mainAxis: p.mainAxis || 0,
            crossAxis: p.crossAxis || 0,
            alignmentAxis: p.alignmentAxis
        };
        return a && "number" == typeof y && (w = "end" === a ? -1 * y : y), s ? {
            x: w * h,
            y: m * c
        } : {
            x: m * c,
            y: w * h
        }
    }

    function k() {
        return "u" > typeof window
    }

    function F(e) {
        return U(e) ? (e.nodeName || "").toLowerCase() : "#document"
    }

    function B(e) {
        var t;
        return (null == e || null == (t = e.ownerDocument) ? void 0 : t.defaultView) || window
    }

    function j(e) {
        var t;
        return null == (t = (U(e) ? e.ownerDocument : e.document) || window.document) ? void 0 : t.documentElement
    }

    function U(e) {
        return !!k() && (e instanceof Node || e instanceof B(e).Node)
    }

    function M(e) {
        return !!k() && (e instanceof Element || e instanceof B(e).Element)
    }

    function I(e) {
        return !!k() && (e instanceof HTMLElement || e instanceof B(e).HTMLElement)
    }

    function _(e) {
        return !(!k() || "u" < typeof ShadowRoot) && (e instanceof ShadowRoot || e instanceof B(e).ShadowRoot)
    }
    let z = new Set(["inline", "contents"]);

    function G(e) {
        let {
            overflow: t,
            overflowX: n,
            overflowY: r,
            display: i
        } = ee(e);
        return /auto|scroll|overlay|hidden|clip/.test(t + r + n) && !z.has(i)
    }
    let N = new Set(["table", "td", "th"]),
        V = [":popover-open", ":modal"];

    function $(e) {
        return V.some(t => {
            try {
                return e.matches(t)
            } catch (e) {
                return !1
            }
        })
    }
    let q = ["transform", "translate", "scale", "rotate", "perspective"],
        X = ["transform", "translate", "scale", "rotate", "perspective", "filter"],
        K = ["paint", "layout", "strict", "content"];

    function Y(e) {
        let t = J(),
            n = M(e) ? ee(e) : e;
        return q.some(e => !!n[e] && "none" !== n[e]) || !!n.containerType && "normal" !== n.containerType || !t && !!n.backdropFilter && "none" !== n.backdropFilter || !t && !!n.filter && "none" !== n.filter || X.some(e => (n.willChange || "").includes(e)) || K.some(e => (n.contain || "").includes(e))
    }

    function J() {
        return !("u" < typeof CSS) && !!CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")
    }
    let Q = new Set(["html", "body", "#document"]);

    function Z(e) {
        return Q.has(F(e))
    }

    function ee(e) {
        return B(e).getComputedStyle(e)
    }

    function et(e) {
        return M(e) ? {
            scrollLeft: e.scrollLeft,
            scrollTop: e.scrollTop
        } : {
            scrollLeft: e.scrollX,
            scrollTop: e.scrollY
        }
    }

    function en(e) {
        if ("html" === F(e)) return e;
        let t = e.assignedSlot || e.parentNode || _(e) && e.host || j(e);
        return _(t) ? t.host : t
    }

    function er(e, t, n) {
        var r;
        void 0 === t && (t = []), void 0 === n && (n = !0);
        let i = function e(t) {
                let n = en(t);
                return Z(n) ? t.ownerDocument ? t.ownerDocument.body : t.body : I(n) && G(n) ? n : e(n)
            }(e),
            o = i === (null == (r = e.ownerDocument) ? void 0 : r.body),
            l = B(i);
        if (o) {
            let e = ei(l);
            return t.concat(l, l.visualViewport || [], G(i) ? i : [], e && n ? er(e) : [])
        }
        return t.concat(i, er(i, [], n))
    }

    function ei(e) {
        return e.parent && Object.getPrototypeOf(e.parent) ? e.frameElement : null
    }

    function eo(e) {
        let t = ee(e),
            n = parseFloat(t.width) || 0,
            r = parseFloat(t.height) || 0,
            i = I(e),
            l = i ? e.offsetWidth : n,
            a = i ? e.offsetHeight : r,
            s = o(n) !== l || o(r) !== a;
        return s && (n = l, r = a), {
            width: n,
            height: r,
            $: s
        }
    }

    function el(e) {
        return M(e) ? e : e.contextElement
    }

    function ea(e) {
        let t = el(e);
        if (!I(t)) return a(1);
        let n = t.getBoundingClientRect(),
            {
                width: r,
                height: i,
                $: l
            } = eo(t),
            s = (l ? o(n.width) : n.width) / r,
            c = (l ? o(n.height) : n.height) / i;
        return s && Number.isFinite(s) || (s = 1), c && Number.isFinite(c) || (c = 1), {
            x: s,
            y: c
        }
    }
    let es = a(0);

    function ec(e) {
        let t = B(e);
        return J() && t.visualViewport ? {
            x: t.visualViewport.offsetLeft,
            y: t.visualViewport.offsetTop
        } : es
    }

    function ef(e, t, n, r) {
        var i;
        void 0 === t && (t = !1), void 0 === n && (n = !1);
        let o = e.getBoundingClientRect(),
            l = el(e),
            s = a(1);
        t && (r ? M(r) && (s = ea(r)) : s = ea(e));
        let c = (void 0 === (i = n) && (i = !1), r && (!i || r === B(l)) && i) ? ec(l) : a(0),
            f = (o.left + c.x) / s.x,
            u = (o.top + c.y) / s.y,
            d = o.width / s.x,
            h = o.height / s.y;
        if (l) {
            let e = B(l),
                t = r && M(r) ? B(r) : r,
                n = e,
                i = ei(n);
            for (; i && r && t !== n;) {
                let e = ea(i),
                    t = i.getBoundingClientRect(),
                    r = ee(i),
                    o = t.left + (i.clientLeft + parseFloat(r.paddingLeft)) * e.x,
                    l = t.top + (i.clientTop + parseFloat(r.paddingTop)) * e.y;
                f *= e.x, u *= e.y, d *= e.x, h *= e.y, f += o, u += l, i = ei(n = B(i))
            }
        }
        return R({
            width: d,
            height: h,
            x: f,
            y: u
        })
    }

    function eu(e, t) {
        let n = et(e).scrollLeft;
        return t ? t.left + n : ef(j(e)).left + n
    }

    function ed(e, t) {
        let n = e.getBoundingClientRect();
        return {
            x: n.left + t.scrollLeft - eu(e, n),
            y: n.top + t.scrollTop
        }
    }
    let eh = new Set(["absolute", "fixed"]);

    function ep(e, t, n) {
        var r;
        let o;
        if ("viewport" === t) o = function(e, t) {
            let n = B(e),
                r = j(e),
                i = n.visualViewport,
                o = r.clientWidth,
                l = r.clientHeight,
                a = 0,
                s = 0;
            if (i) {
                o = i.width, l = i.height;
                let e = J();
                (!e || e && "fixed" === t) && (a = i.offsetLeft, s = i.offsetTop)
            }
            let c = eu(r);
            if (c <= 0) {
                let e = r.ownerDocument,
                    t = e.body,
                    n = getComputedStyle(t),
                    i = "CSS1Compat" === e.compatMode && parseFloat(n.marginLeft) + parseFloat(n.marginRight) || 0,
                    l = Math.abs(r.clientWidth - t.clientWidth - i);
                l <= 25 && (o -= l)
            } else c <= 25 && (o += c);
            return {
                width: o,
                height: l,
                x: a,
                y: s
            }
        }(e, n);
        else if ("document" === t) {
            let t, n, l, a, s, c, f;
            r = j(e), t = j(r), n = et(r), l = r.ownerDocument.body, a = i(t.scrollWidth, t.clientWidth, l.scrollWidth, l.clientWidth), s = i(t.scrollHeight, t.clientHeight, l.scrollHeight, l.clientHeight), c = -n.scrollLeft + eu(r), f = -n.scrollTop, "rtl" === ee(l).direction && (c += i(t.clientWidth, l.clientWidth) - a), o = {
                width: a,
                height: s,
                x: c,
                y: f
            }
        } else if (M(t)) {
            let e, r, i, l, s, c;
            r = (e = ef(t, !0, "fixed" === n)).top + t.clientTop, i = e.left + t.clientLeft, l = I(t) ? ea(t) : a(1), s = t.clientWidth * l.x, c = t.clientHeight * l.y, o = {
                width: s,
                height: c,
                x: i * l.x,
                y: r * l.y
            }
        } else {
            let n = ec(e);
            o = {
                x: t.x - n.x,
                y: t.y - n.y,
                width: t.width,
                height: t.height
            }
        }
        return R(o)
    }

    function em(e) {
        return "static" === ee(e).position
    }

    function eg(e, t) {
        if (!I(e) || "fixed" === ee(e).position) return null;
        if (t) return t(e);
        let n = e.offsetParent;
        return j(e) === n && (n = n.ownerDocument.body), n
    }

    function ew(e, t) {
        var n;
        let r = B(e);
        if ($(e)) return r;
        if (!I(e)) {
            let t = en(e);
            for (; t && !Z(t);) {
                if (M(t) && !em(t)) return t;
                t = en(t)
            }
            return r
        }
        let i = eg(e, t);
        for (; i && (n = i, N.has(F(n))) && em(i);) i = eg(i, t);
        return i && Z(i) && em(i) && !Y(i) ? r : i || function(e) {
            let t = en(e);
            for (; I(t) && !Z(t);) {
                if (Y(t)) return t;
                if ($(t)) break;
                t = en(t)
            }
            return null
        }(e) || r
    }
    let ey = async function(e) {
        let t = this.getOffsetParent || ew,
            n = this.getDimensions,
            r = await n(e.floating);
        return {
            reference: function(e, t, n) {
                let r = I(t),
                    i = j(t),
                    o = "fixed" === n,
                    l = ef(e, !0, o, t),
                    s = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    c = a(0);
                if (r || !r && !o)
                    if (("body" !== F(t) || G(i)) && (s = et(t)), r) {
                        let e = ef(t, !0, o, t);
                        c.x = e.x + t.clientLeft, c.y = e.y + t.clientTop
                    } else i && (c.x = eu(i));
                o && !r && i && (c.x = eu(i));
                let f = !i || r || o ? a(0) : ed(i, s);
                return {
                    x: l.left + s.scrollLeft - c.x - f.x,
                    y: l.top + s.scrollTop - c.y - f.y,
                    width: l.width,
                    height: l.height
                }
            }(e.reference, await t(e.floating), e.strategy),
            floating: {
                x: 0,
                y: 0,
                width: r.width,
                height: r.height
            }
        }
    }, ev = {
        convertOffsetParentRelativeRectToViewportRelativeRect: function(e) {
            let {
                elements: t,
                rect: n,
                offsetParent: r,
                strategy: i
            } = e, o = "fixed" === i, l = j(r), s = !!t && $(t.floating);
            if (r === l || s && o) return n;
            let c = {
                    scrollLeft: 0,
                    scrollTop: 0
                },
                f = a(1),
                u = a(0),
                d = I(r);
            if ((d || !d && !o) && (("body" !== F(r) || G(l)) && (c = et(r)), I(r))) {
                let e = ef(r);
                f = ea(r), u.x = e.x + r.clientLeft, u.y = e.y + r.clientTop
            }
            let h = !l || d || o ? a(0) : ed(l, c);
            return {
                width: n.width * f.x,
                height: n.height * f.y,
                x: n.x * f.x - c.scrollLeft * f.x + u.x + h.x,
                y: n.y * f.y - c.scrollTop * f.y + u.y + h.y
            }
        },
        getDocumentElement: j,
        getClippingRect: function(e) {
            let {
                element: t,
                boundary: n,
                rootBoundary: o,
                strategy: l
            } = e, a = [..."clippingAncestors" === n ? $(t) ? [] : function(e, t) {
                let n = t.get(e);
                if (n) return n;
                let r = er(e, [], !1).filter(e => M(e) && "body" !== F(e)),
                    i = null,
                    o = "fixed" === ee(e).position,
                    l = o ? en(e) : e;
                for (; M(l) && !Z(l);) {
                    let t = ee(l),
                        n = Y(l);
                    n || "fixed" !== t.position || (i = null), (o ? !n && !i : !n && "static" === t.position && !!i && eh.has(i.position) || G(l) && !n && function e(t, n) {
                        let r = en(t);
                        return !(r === n || !M(r) || Z(r)) && ("fixed" === ee(r).position || e(r, n))
                    }(e, l)) ? r = r.filter(e => e !== l) : i = t, l = en(l)
                }
                return t.set(e, r), r
            }(t, this._c) : [].concat(n), o], s = a[0], c = a.reduce((e, n) => {
                let o = ep(t, n, l);
                return e.top = i(o.top, e.top), e.right = r(o.right, e.right), e.bottom = r(o.bottom, e.bottom), e.left = i(o.left, e.left), e
            }, ep(t, s, l));
            return {
                width: c.right - c.left,
                height: c.bottom - c.top,
                x: c.left,
                y: c.top
            }
        },
        getOffsetParent: ew,
        getElementRects: ey,
        getClientRects: function(e) {
            return Array.from(e.getClientRects())
        },
        getDimensions: function(e) {
            let {
                width: t,
                height: n
            } = eo(e);
            return {
                width: t,
                height: n
            }
        },
        getScale: ea,
        isElement: M,
        isRTL: function(e) {
            return "rtl" === ee(e).direction
        }
    };

    function ex(e, t) {
        return e.x === t.x && e.y === t.y && e.width === t.width && e.height === t.height
    }
    e.s(["arrow", 0, e => ({
        name: "arrow",
        options: e,
        async fn(t) {
            let {
                x: n,
                y: o,
                placement: l,
                rects: a,
                platform: s,
                elements: c,
                middlewareData: u
            } = t, {
                element: m,
                padding: w = 0
            } = f(e, t) || {};
            if (null == m) return {};
            let y = T(w),
                v = {
                    x: n,
                    y: o
                },
                x = h(g(l)),
                b = p(x),
                A = await s.getDimensions(m),
                E = "y" === x,
                R = E ? "clientHeight" : "clientWidth",
                L = a.reference[b] + a.reference[x] - v[x] - a.floating[b],
                S = v[x] - a.reference[x],
                C = await (null == s.getOffsetParent ? void 0 : s.getOffsetParent(m)),
                O = C ? C[R] : 0;
            O && await (null == s.isElement ? void 0 : s.isElement(C)) || (O = c.floating[R] || a.floating[b]);
            let P = O / 2 - A[b] / 2 - 1,
                D = r(y[E ? "top" : "left"], P),
                W = r(y[E ? "bottom" : "right"], P),
                H = O - A[b] - W,
                k = O / 2 - A[b] / 2 + (L / 2 - S / 2),
                F = i(D, r(k, H)),
                B = !u.arrow && null != d(l) && k !== F && a.reference[b] / 2 - (k < D ? D : W) - A[b] / 2 < 0,
                j = B ? k < D ? k - D : k - H : 0;
            return {
                [x]: v[x] + j,
                data: {
                    [x]: F,
                    centerOffset: k - F - j,
                    ...B && {
                        alignmentOffset: j
                    }
                },
                reset: B
            }
        }
    }), "autoPlacement", 0, function(e) {
        return void 0 === e && (e = {}), {
            name: "autoPlacement",
            options: e,
            async fn(t) {
                var r, i, o, l;
                let {
                    rects: a,
                    middlewareData: s,
                    placement: c,
                    platform: h,
                    elements: p
                } = t, {
                    crossAxis: m = !1,
                    alignment: g,
                    allowedPlacements: v = n,
                    autoAlignment: x = !0,
                    ...b
                } = f(e, t), A = void 0 !== g || v === n ? ((l = g || null) ? [...v.filter(e => d(e) === l), ...v.filter(e => d(e) !== l)] : v.filter(e => u(e) === e)).filter(e => !l || d(e) === l || !!x && y(e) !== e) : v, E = await C(t, b), T = (null == (r = s.autoPlacement) ? void 0 : r.index) || 0, R = A[T];
                if (null == R) return {};
                let L = w(R, a, await (null == h.isRTL ? void 0 : h.isRTL(p.floating)));
                if (c !== R) return {
                    reset: {
                        placement: A[0]
                    }
                };
                let S = [E[u(R)], E[L[0]], E[L[1]]],
                    O = [...(null == (i = s.autoPlacement) ? void 0 : i.overflows) || [], {
                        placement: R,
                        overflows: S
                    }],
                    P = A[T + 1];
                if (P) return {
                    data: {
                        index: T + 1,
                        overflows: O
                    },
                    reset: {
                        placement: P
                    }
                };
                let D = O.map(e => {
                        let t = d(e.placement);
                        return [e.placement, t && m ? e.overflows.slice(0, 2).reduce((e, t) => e + t, 0) : e.overflows[0], e.overflows]
                    }).sort((e, t) => e[1] - t[1]),
                    W = (null == (o = D.filter(e => e[2].slice(0, d(e[0]) ? 2 : 3).every(e => e <= 0))[0]) ? void 0 : o[0]) || D[0][0];
                return W !== c ? {
                    data: {
                        index: T + 1,
                        overflows: O
                    },
                    reset: {
                        placement: W
                    }
                } : {}
            }
        }
    }, "autoUpdate", 0, function(e, t, n, o) {
        let a;
        void 0 === o && (o = {});
        let {
            ancestorScroll: s = !0,
            ancestorResize: c = !0,
            elementResize: f = "function" == typeof ResizeObserver,
            layoutShift: u = "function" == typeof IntersectionObserver,
            animationFrame: d = !1
        } = o, h = el(e), p = s || c ? [...h ? er(h) : [], ...er(t)] : [];
        p.forEach(e => {
            s && e.addEventListener("scroll", n, {
                passive: !0
            }), c && e.addEventListener("resize", n)
        });
        let m = h && u ? function(e, t) {
                let n, o = null,
                    a = j(e);

                function s() {
                    var e;
                    clearTimeout(n), null == (e = o) || e.disconnect(), o = null
                }
                return ! function c(f, u) {
                    void 0 === f && (f = !1), void 0 === u && (u = 1), s();
                    let d = e.getBoundingClientRect(),
                        {
                            left: h,
                            top: p,
                            width: m,
                            height: g
                        } = d;
                    if (f || t(), !m || !g) return;
                    let w = {
                            rootMargin: -l(p) + "px " + -l(a.clientWidth - (h + m)) + "px " + -l(a.clientHeight - (p + g)) + "px " + -l(h) + "px",
                            threshold: i(0, r(1, u)) || 1
                        },
                        y = !0;

                    function v(t) {
                        let r = t[0].intersectionRatio;
                        if (r !== u) {
                            if (!y) return c();
                            r ? c(!1, r) : n = setTimeout(() => {
                                c(!1, 1e-7)
                            }, 1e3)
                        }
                        1 !== r || ex(d, e.getBoundingClientRect()) || c(), y = !1
                    }
                    try {
                        o = new IntersectionObserver(v, {
                            ...w,
                            root: a.ownerDocument
                        })
                    } catch (e) {
                        o = new IntersectionObserver(v, w)
                    }
                    o.observe(e)
                }(!0), s
            }(h, n) : null,
            g = -1,
            w = null;
        f && (w = new ResizeObserver(e => {
            let [r] = e;
            r && r.target === h && w && (w.unobserve(t), cancelAnimationFrame(g), g = requestAnimationFrame(() => {
                var e;
                null == (e = w) || e.observe(t)
            })), n()
        }), h && !d && w.observe(h), w.observe(t));
        let y = d ? ef(e) : null;
        return d && function t() {
            let r = ef(e);
            y && !ex(y, r) && n(), y = r, a = requestAnimationFrame(t)
        }(), n(), () => {
            var e;
            p.forEach(e => {
                s && e.removeEventListener("scroll", n), c && e.removeEventListener("resize", n)
            }), null == m || m(), null == (e = w) || e.disconnect(), w = null, d && cancelAnimationFrame(a)
        }
    }, "computePosition", 0, (e, t, n) => {
        let r = new Map,
            i = {
                platform: ev,
                ...n
            },
            o = {
                ...i.platform,
                _c: r
            };
        return S(e, t, {
            ...i,
            platform: o
        })
    }, "flip", 0, function(e) {
        return void 0 === e && (e = {}), {
            name: "flip",
            options: e,
            async fn(t) {
                var n, r, i, o, l;
                let a, s, c, {
                        placement: h,
                        middlewareData: p,
                        rects: m,
                        initialPlacement: T,
                        platform: R,
                        elements: L
                    } = t,
                    {
                        mainAxis: S = !0,
                        crossAxis: O = !0,
                        fallbackPlacements: P,
                        fallbackStrategy: D = "bestFit",
                        fallbackAxisSideDirection: W = "none",
                        flipAlignment: H = !0,
                        ...k
                    } = f(e, t);
                if (null != (n = p.arrow) && n.alignmentOffset) return {};
                let F = u(h),
                    B = g(T),
                    j = u(T) === T,
                    U = await (null == R.isRTL ? void 0 : R.isRTL(L.floating)),
                    M = P || (j || !H ? [E(T)] : (a = E(T), [y(T), a, y(a)])),
                    I = "none" !== W;
                !P && I && M.push(...(s = d(T), c = function(e, t, n) {
                    switch (e) {
                        case "top":
                        case "bottom":
                            if (n) return t ? x : v;
                            return t ? v : x;
                        case "left":
                        case "right":
                            return t ? b : A;
                        default:
                            return []
                    }
                }(u(T), "start" === W, U), s && (c = c.map(e => e + "-" + s), H && (c = c.concat(c.map(y)))), c));
                let _ = [T, ...M],
                    z = await C(t, k),
                    G = [],
                    N = (null == (r = p.flip) ? void 0 : r.overflows) || [];
                if (S && G.push(z[F]), O) {
                    let e = w(h, m, U);
                    G.push(z[e[0]], z[e[1]])
                }
                if (N = [...N, {
                        placement: h,
                        overflows: G
                    }], !G.every(e => e <= 0)) {
                    let e = ((null == (i = p.flip) ? void 0 : i.index) || 0) + 1,
                        t = _[e];
                    if (t && ("alignment" !== O || B === g(t) || N.every(e => g(e.placement) !== B || e.overflows[0] > 0))) return {
                        data: {
                            index: e,
                            overflows: N
                        },
                        reset: {
                            placement: t
                        }
                    };
                    let n = null == (o = N.filter(e => e.overflows[0] <= 0).sort((e, t) => e.overflows[1] - t.overflows[1])[0]) ? void 0 : o.placement;
                    if (!n) switch (D) {
                        case "bestFit": {
                            let e = null == (l = N.filter(e => {
                                if (I) {
                                    let t = g(e.placement);
                                    return t === B || "y" === t
                                }
                                return !0
                            }).map(e => [e.placement, e.overflows.filter(e => e > 0).reduce((e, t) => e + t, 0)]).sort((e, t) => e[1] - t[1])[0]) ? void 0 : l[0];
                            e && (n = e);
                            break
                        }
                        case "initialPlacement":
                            n = T
                    }
                    if (h !== n) return {
                        reset: {
                            placement: n
                        }
                    }
                }
                return {}
            }
        }
    }, "hide", 0, function(e) {
        return void 0 === e && (e = {}), {
            name: "hide",
            options: e,
            async fn(t) {
                let {
                    rects: n
                } = t, {
                    strategy: r = "referenceHidden",
                    ...i
                } = f(e, t);
                switch (r) {
                    case "referenceHidden": {
                        let e = O(await C(t, {
                            ...i,
                            elementContext: "reference"
                        }), n.reference);
                        return {
                            data: {
                                referenceHiddenOffsets: e,
                                referenceHidden: P(e)
                            }
                        }
                    }
                    case "escaped": {
                        let e = O(await C(t, {
                            ...i,
                            altBoundary: !0
                        }), n.floating);
                        return {
                            data: {
                                escapedOffsets: e,
                                escaped: P(e)
                            }
                        }
                    }
                    default:
                        return {}
                }
            }
        }
    }, "inline", 0, function(e) {
        return void 0 === e && (e = {}), {
            name: "inline",
            options: e,
            async fn(t) {
                let {
                    placement: n,
                    elements: o,
                    rects: l,
                    platform: a,
                    strategy: s
                } = t, {
                    padding: c = 2,
                    x: d,
                    y: h
                } = f(e, t), p = Array.from(await (null == a.getClientRects ? void 0 : a.getClientRects(o.reference)) || []), m = function(e) {
                    let t = e.slice().sort((e, t) => e.y - t.y),
                        n = [],
                        r = null;
                    for (let e = 0; e < t.length; e++) {
                        let i = t[e];
                        !r || i.y - r.y > r.height / 2 ? n.push([i]) : n[n.length - 1].push(i), r = i
                    }
                    return n.map(e => R(D(e)))
                }(p), w = R(D(p)), y = T(c), v = await a.getElementRects({
                    reference: {
                        getBoundingClientRect: function() {
                            if (2 === m.length && m[0].left > m[1].right && null != d && null != h) return m.find(e => d > e.left - y.left && d < e.right + y.right && h > e.top - y.top && h < e.bottom + y.bottom) || w;
                            if (m.length >= 2) {
                                if ("y" === g(n)) {
                                    let e = m[0],
                                        t = m[m.length - 1],
                                        r = "top" === u(n),
                                        i = e.top,
                                        o = t.bottom,
                                        l = r ? e.left : t.left,
                                        a = r ? e.right : t.right;
                                    return {
                                        top: i,
                                        bottom: o,
                                        left: l,
                                        right: a,
                                        width: a - l,
                                        height: o - i,
                                        x: l,
                                        y: i
                                    }
                                }
                                let e = "left" === u(n),
                                    t = i(...m.map(e => e.right)),
                                    o = r(...m.map(e => e.left)),
                                    l = m.filter(n => e ? n.left === o : n.right === t),
                                    a = l[0].top,
                                    s = l[l.length - 1].bottom;
                                return {
                                    top: a,
                                    bottom: s,
                                    left: o,
                                    right: t,
                                    width: t - o,
                                    height: s - a,
                                    x: o,
                                    y: a
                                }
                            }
                            return w
                        }
                    },
                    floating: o.floating,
                    strategy: s
                });
                return l.reference.x !== v.reference.x || l.reference.y !== v.reference.y || l.reference.width !== v.reference.width || l.reference.height !== v.reference.height ? {
                    reset: {
                        rects: v
                    }
                } : {}
            }
        }
    }, "limitShift", 0, function(e) {
        return void 0 === e && (e = {}), {
            options: e,
            fn(t) {
                let {
                    x: n,
                    y: r,
                    placement: i,
                    rects: o,
                    middlewareData: l
                } = t, {
                    offset: a = 0,
                    mainAxis: s = !0,
                    crossAxis: c = !0
                } = f(e, t), d = {
                    x: n,
                    y: r
                }, p = g(i), m = h(p), w = d[m], y = d[p], v = f(a, t), x = "number" == typeof v ? {
                    mainAxis: v,
                    crossAxis: 0
                } : {
                    mainAxis: 0,
                    crossAxis: 0,
                    ...v
                };
                if (s) {
                    let e = "y" === m ? "height" : "width",
                        t = o.reference[m] - o.floating[e] + x.mainAxis,
                        n = o.reference[m] + o.reference[e] - x.mainAxis;
                    w < t ? w = t : w > n && (w = n)
                }
                if (c) {
                    var b, A;
                    let e = "y" === m ? "width" : "height",
                        t = W.has(u(i)),
                        n = o.reference[p] - o.floating[e] + (t && (null == (b = l.offset) ? void 0 : b[p]) || 0) + (t ? 0 : x.crossAxis),
                        r = o.reference[p] + o.reference[e] + (t ? 0 : (null == (A = l.offset) ? void 0 : A[p]) || 0) - (t ? x.crossAxis : 0);
                    y < n ? y = n : y > r && (y = r)
                }
                return {
                    [m]: w,
                    [p]: y
                }
            }
        }
    }, "offset", 0, function(e) {
        return void 0 === e && (e = 0), {
            name: "offset",
            options: e,
            async fn(t) {
                var n, r;
                let {
                    x: i,
                    y: o,
                    placement: l,
                    middlewareData: a
                } = t, s = await H(t, e);
                return l === (null == (n = a.offset) ? void 0 : n.placement) && null != (r = a.arrow) && r.alignmentOffset ? {} : {
                    x: i + s.x,
                    y: o + s.y,
                    data: {
                        ...s,
                        placement: l
                    }
                }
            }
        }
    }, "shift", 0, function(e) {
        return void 0 === e && (e = {}), {
            name: "shift",
            options: e,
            async fn(t) {
                let {
                    x: n,
                    y: o,
                    placement: l
                } = t, {
                    mainAxis: a = !0,
                    crossAxis: s = !1,
                    limiter: c = {
                        fn: e => {
                            let {
                                x: t,
                                y: n
                            } = e;
                            return {
                                x: t,
                                y: n
                            }
                        }
                    },
                    ...d
                } = f(e, t), p = {
                    x: n,
                    y: o
                }, m = await C(t, d), w = g(u(l)), y = h(w), v = p[y], x = p[w];
                if (a) {
                    let e = "y" === y ? "top" : "left",
                        t = "y" === y ? "bottom" : "right",
                        n = v + m[e],
                        o = v - m[t];
                    v = i(n, r(v, o))
                }
                if (s) {
                    let e = "y" === w ? "top" : "left",
                        t = "y" === w ? "bottom" : "right",
                        n = x + m[e],
                        o = x - m[t];
                    x = i(n, r(x, o))
                }
                let b = c.fn({
                    ...t,
                    [y]: v,
                    [w]: x
                });
                return {
                    ...b,
                    data: {
                        x: b.x - n,
                        y: b.y - o,
                        enabled: {
                            [y]: a,
                            [w]: s
                        }
                    }
                }
            }
        }
    }, "size", 0, function(e) {
        return void 0 === e && (e = {}), {
            name: "size",
            options: e,
            async fn(t) {
                var n, o;
                let l, a, {
                        placement: s,
                        rects: c,
                        platform: h,
                        elements: p
                    } = t,
                    {
                        apply: m = () => {},
                        ...w
                    } = f(e, t),
                    y = await C(t, w),
                    v = u(s),
                    x = d(s),
                    b = "y" === g(s),
                    {
                        width: A,
                        height: E
                    } = c.floating;
                "top" === v || "bottom" === v ? (l = v, a = x === (await (null == h.isRTL ? void 0 : h.isRTL(p.floating)) ? "start" : "end") ? "left" : "right") : (a = v, l = "end" === x ? "top" : "bottom");
                let T = E - y.top - y.bottom,
                    R = A - y.left - y.right,
                    L = r(E - y[l], T),
                    S = r(A - y[a], R),
                    O = !t.middlewareData.shift,
                    P = L,
                    D = S;
                if (null != (n = t.middlewareData.shift) && n.enabled.x && (D = R), null != (o = t.middlewareData.shift) && o.enabled.y && (P = T), O && !x) {
                    let e = i(y.left, 0),
                        t = i(y.right, 0),
                        n = i(y.top, 0),
                        r = i(y.bottom, 0);
                    b ? D = A - 2 * (0 !== e || 0 !== t ? e + t : i(y.left, y.right)) : P = E - 2 * (0 !== n || 0 !== r ? n + r : i(y.top, y.bottom))
                }
                await m({
                    ...t,
                    availableWidth: D,
                    availableHeight: P
                });
                let W = await h.getDimensions(p.floating);
                return A !== W.width || E !== W.height ? {
                    reset: {
                        rects: !0
                    }
                } : {}
            }
        }
    }], 422957)
}, 178896, e => {
    "use strict";
    e.s(["composeEventHandlers", 0, function(e, t) {
        let {
            checkForDefaultPrevented: n = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(r) {
            if (e?.(r), !1 === n || !r.defaultPrevented) return t?.(r)
        }
    }])
}]);

//# debugId=2b2d419e-06d5-1236-4a86-ee891d54ed3a
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/03274j.cyznop.js.map