;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "73b6c4f8-6705-a3e6-6cbc-7d91a154d760")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 376054, 303069, 463075, 136927, 550475, t => {
    "use strict";

    function e(t, e, n) {
        if (!e.has(t)) throw TypeError("attempted to " + n + " private field on non-instance");
        return e.get(t)
    }

    function n(t, e) {
        if (e.has(t)) throw TypeError("Cannot initialize the same private elements twice on an object")
    }
    t.s(["_", 0, e], 303069), t.s(["_", 0, function(t, n) {
        var i = e(t, n, "get");
        return i.get ? i.get.call(t) : i.value
    }], 376054), t.s(["_", 0, n], 463075), t.s(["_", 0, function(t, e, i) {
        n(t, e), e.set(t, i)
    }], 136927), t.s(["_", 0, function(t, n, i) {
        var r = e(t, n, "set");
        if (r.set) r.set.call(t, i);
        else {
            if (!r.writable) throw TypeError("attempted to set read only private field");
            r.value = i
        }
        return i
    }], 550475)
}, 422957, t => {
    "use strict";
    let e = ["top", "right", "bottom", "left"],
        n = e.reduce((t, e) => t.concat(e, e + "-start", e + "-end"), []),
        i = Math.min,
        r = Math.max,
        o = Math.round,
        l = Math.floor,
        a = t => ({
            x: t,
            y: t
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

    function u(t, e) {
        return "function" == typeof t ? t(e) : t
    }

    function f(t) {
        return t.split("-")[0]
    }

    function h(t) {
        return t.split("-")[1]
    }

    function d(t) {
        return "x" === t ? "y" : "x"
    }

    function p(t) {
        return "y" === t ? "height" : "width"
    }
    let m = new Set(["top", "bottom"]);

    function g(t) {
        return m.has(f(t)) ? "y" : "x"
    }

    function w(t, e, n) {
        void 0 === n && (n = !1);
        let i = h(t),
            r = d(g(t)),
            o = p(r),
            l = "x" === r ? i === (n ? "end" : "start") ? "right" : "left" : "start" === i ? "bottom" : "top";
        return e.reference[o] > e.floating[o] && (l = _(l)), [l, _(l)]
    }

    function y(t) {
        return t.replace(/start|end/g, t => c[t])
    }
    let v = ["left", "right"],
        x = ["right", "left"],
        b = ["top", "bottom"],
        R = ["bottom", "top"];

    function _(t) {
        return t.replace(/left|right|bottom|top/g, t => s[t])
    }

    function T(t) {
        return "number" != typeof t ? {
            top: 0,
            right: 0,
            bottom: 0,
            left: 0,
            ...t
        } : {
            top: t,
            right: t,
            bottom: t,
            left: t
        }
    }

    function A(t) {
        let {
            x: e,
            y: n,
            width: i,
            height: r
        } = t;
        return {
            width: i,
            height: r,
            top: n,
            left: e,
            right: e + i,
            bottom: n + r,
            x: e,
            y: n
        }
    }

    function L(t, e, n) {
        let i, {
                reference: r,
                floating: o
            } = t,
            l = g(e),
            a = d(g(e)),
            s = p(a),
            c = f(e),
            u = "y" === l,
            m = r.x + r.width / 2 - o.width / 2,
            w = r.y + r.height / 2 - o.height / 2,
            y = r[s] / 2 - o[s] / 2;
        switch (c) {
            case "top":
                i = {
                    x: m,
                    y: r.y - o.height
                };
                break;
            case "bottom":
                i = {
                    x: m,
                    y: r.y + r.height
                };
                break;
            case "right":
                i = {
                    x: r.x + r.width,
                    y: w
                };
                break;
            case "left":
                i = {
                    x: r.x - o.width,
                    y: w
                };
                break;
            default:
                i = {
                    x: r.x,
                    y: r.y
                }
        }
        switch (h(e)) {
            case "start":
                i[a] -= y * (n && u ? -1 : 1);
                break;
            case "end":
                i[a] += y * (n && u ? -1 : 1)
        }
        return i
    }
    let E = async (t, e, n) => {
        let {
            placement: i = "bottom",
            strategy: r = "absolute",
            middleware: o = [],
            platform: l
        } = n, a = o.filter(Boolean), s = await (null == l.isRTL ? void 0 : l.isRTL(e)), c = await l.getElementRects({
            reference: t,
            floating: e,
            strategy: r
        }), {
            x: u,
            y: f
        } = L(c, i, s), h = i, d = {}, p = 0;
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
                x: u,
                y: f,
                initialPlacement: i,
                placement: h,
                strategy: r,
                middlewareData: d,
                rects: c,
                platform: l,
                elements: {
                    reference: t,
                    floating: e
                }
            });
            u = null != g ? g : u, f = null != w ? w : f, d = {
                ...d,
                [o]: {
                    ...d[o],
                    ...y
                }
            }, v && p <= 50 && (p++, "object" == typeof v && (v.placement && (h = v.placement), v.rects && (c = !0 === v.rects ? await l.getElementRects({
                reference: t,
                floating: e,
                strategy: r
            }) : v.rects), {
                x: u,
                y: f
            } = L(c, h, s)), n = -1)
        }
        return {
            x: u,
            y: f,
            placement: h,
            strategy: r,
            middlewareData: d
        }
    };
    async function C(t, e) {
        var n;
        void 0 === e && (e = {});
        let {
            x: i,
            y: r,
            platform: o,
            rects: l,
            elements: a,
            strategy: s
        } = t, {
            boundary: c = "clippingAncestors",
            rootBoundary: f = "viewport",
            elementContext: h = "floating",
            altBoundary: d = !1,
            padding: p = 0
        } = u(e, t), m = T(p), g = a[d ? "floating" === h ? "reference" : "floating" : h], w = A(await o.getClippingRect({
            element: null == (n = await (null == o.isElement ? void 0 : o.isElement(g))) || n ? g : g.contextElement || await (null == o.getDocumentElement ? void 0 : o.getDocumentElement(a.floating)),
            boundary: c,
            rootBoundary: f,
            strategy: s
        })), y = "floating" === h ? {
            x: i,
            y: r,
            width: l.floating.width,
            height: l.floating.height
        } : l.reference, v = await (null == o.getOffsetParent ? void 0 : o.getOffsetParent(a.floating)), x = await (null == o.isElement ? void 0 : o.isElement(v)) && await (null == o.getScale ? void 0 : o.getScale(v)) || {
            x: 1,
            y: 1
        }, b = A(o.convertOffsetParentRelativeRectToViewportRelativeRect ? await o.convertOffsetParentRelativeRectToViewportRelativeRect({
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

    function P(t, e) {
        return {
            top: t.top - e.height,
            right: t.right - e.width,
            bottom: t.bottom - e.height,
            left: t.left - e.width
        }
    }

    function S(t) {
        return e.some(e => t[e] >= 0)
    }

    function O(t) {
        let e = i(...t.map(t => t.left)),
            n = i(...t.map(t => t.top));
        return {
            x: e,
            y: n,
            width: r(...t.map(t => t.right)) - e,
            height: r(...t.map(t => t.bottom)) - n
        }
    }
    let D = new Set(["left", "top"]);
    async function M(t, e) {
        let {
            placement: n,
            platform: i,
            elements: r
        } = t, o = await (null == i.isRTL ? void 0 : i.isRTL(r.floating)), l = f(n), a = h(n), s = "y" === g(n), c = D.has(l) ? -1 : 1, d = o && s ? -1 : 1, p = u(e, t), {
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
            x: w * d,
            y: m * c
        } : {
            x: m * c,
            y: w * d
        }
    }

    function F() {
        return "u" > typeof window
    }

    function k(t) {
        return B(t) ? (t.nodeName || "").toLowerCase() : "#document"
    }

    function W(t) {
        var e;
        return (null == t || null == (e = t.ownerDocument) ? void 0 : e.defaultView) || window
    }

    function H(t) {
        var e;
        return null == (e = (B(t) ? t.ownerDocument : t.document) || window.document) ? void 0 : e.documentElement
    }

    function B(t) {
        return !!F() && (t instanceof Node || t instanceof W(t).Node)
    }

    function j(t) {
        return !!F() && (t instanceof Element || t instanceof W(t).Element)
    }

    function V(t) {
        return !!F() && (t instanceof HTMLElement || t instanceof W(t).HTMLElement)
    }

    function N(t) {
        return !(!F() || "u" < typeof ShadowRoot) && (t instanceof ShadowRoot || t instanceof W(t).ShadowRoot)
    }
    let z = new Set(["inline", "contents"]);

    function G(t) {
        let {
            overflow: e,
            overflowX: n,
            overflowY: i,
            display: r
        } = tt(t);
        return /auto|scroll|overlay|hidden|clip/.test(e + i + n) && !z.has(r)
    }
    let I = new Set(["table", "td", "th"]),
        K = [":popover-open", ":modal"];

    function U(t) {
        return K.some(e => {
            try {
                return t.matches(e)
            } catch (t) {
                return !1
            }
        })
    }
    let q = ["transform", "translate", "scale", "rotate", "perspective"],
        X = ["transform", "translate", "scale", "rotate", "perspective", "filter"],
        Y = ["paint", "layout", "strict", "content"];

    function $(t) {
        let e = J(),
            n = j(t) ? tt(t) : t;
        return q.some(t => !!n[t] && "none" !== n[t]) || !!n.containerType && "normal" !== n.containerType || !e && !!n.backdropFilter && "none" !== n.backdropFilter || !e && !!n.filter && "none" !== n.filter || X.some(t => (n.willChange || "").includes(t)) || Y.some(t => (n.contain || "").includes(t))
    }

    function J() {
        return !("u" < typeof CSS) && !!CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")
    }
    let Q = new Set(["html", "body", "#document"]);

    function Z(t) {
        return Q.has(k(t))
    }

    function tt(t) {
        return W(t).getComputedStyle(t)
    }

    function te(t) {
        return j(t) ? {
            scrollLeft: t.scrollLeft,
            scrollTop: t.scrollTop
        } : {
            scrollLeft: t.scrollX,
            scrollTop: t.scrollY
        }
    }

    function tn(t) {
        if ("html" === k(t)) return t;
        let e = t.assignedSlot || t.parentNode || N(t) && t.host || H(t);
        return N(e) ? e.host : e
    }

    function ti(t, e, n) {
        var i;
        void 0 === e && (e = []), void 0 === n && (n = !0);
        let r = function t(e) {
                let n = tn(e);
                return Z(n) ? e.ownerDocument ? e.ownerDocument.body : e.body : V(n) && G(n) ? n : t(n)
            }(t),
            o = r === (null == (i = t.ownerDocument) ? void 0 : i.body),
            l = W(r);
        if (o) {
            let t = tr(l);
            return e.concat(l, l.visualViewport || [], G(r) ? r : [], t && n ? ti(t) : [])
        }
        return e.concat(r, ti(r, [], n))
    }

    function tr(t) {
        return t.parent && Object.getPrototypeOf(t.parent) ? t.frameElement : null
    }

    function to(t) {
        let e = tt(t),
            n = parseFloat(e.width) || 0,
            i = parseFloat(e.height) || 0,
            r = V(t),
            l = r ? t.offsetWidth : n,
            a = r ? t.offsetHeight : i,
            s = o(n) !== l || o(i) !== a;
        return s && (n = l, i = a), {
            width: n,
            height: i,
            $: s
        }
    }

    function tl(t) {
        return j(t) ? t : t.contextElement
    }

    function ta(t) {
        let e = tl(t);
        if (!V(e)) return a(1);
        let n = e.getBoundingClientRect(),
            {
                width: i,
                height: r,
                $: l
            } = to(e),
            s = (l ? o(n.width) : n.width) / i,
            c = (l ? o(n.height) : n.height) / r;
        return s && Number.isFinite(s) || (s = 1), c && Number.isFinite(c) || (c = 1), {
            x: s,
            y: c
        }
    }
    let ts = a(0);

    function tc(t) {
        let e = W(t);
        return J() && e.visualViewport ? {
            x: e.visualViewport.offsetLeft,
            y: e.visualViewport.offsetTop
        } : ts
    }

    function tu(t, e, n, i) {
        var r;
        void 0 === e && (e = !1), void 0 === n && (n = !1);
        let o = t.getBoundingClientRect(),
            l = tl(t),
            s = a(1);
        e && (i ? j(i) && (s = ta(i)) : s = ta(t));
        let c = (void 0 === (r = n) && (r = !1), i && (!r || i === W(l)) && r) ? tc(l) : a(0),
            u = (o.left + c.x) / s.x,
            f = (o.top + c.y) / s.y,
            h = o.width / s.x,
            d = o.height / s.y;
        if (l) {
            let t = W(l),
                e = i && j(i) ? W(i) : i,
                n = t,
                r = tr(n);
            for (; r && i && e !== n;) {
                let t = ta(r),
                    e = r.getBoundingClientRect(),
                    i = tt(r),
                    o = e.left + (r.clientLeft + parseFloat(i.paddingLeft)) * t.x,
                    l = e.top + (r.clientTop + parseFloat(i.paddingTop)) * t.y;
                u *= t.x, f *= t.y, h *= t.x, d *= t.y, u += o, f += l, r = tr(n = W(r))
            }
        }
        return A({
            width: h,
            height: d,
            x: u,
            y: f
        })
    }

    function tf(t, e) {
        let n = te(t).scrollLeft;
        return e ? e.left + n : tu(H(t)).left + n
    }

    function th(t, e) {
        let n = t.getBoundingClientRect();
        return {
            x: n.left + e.scrollLeft - tf(t, n),
            y: n.top + e.scrollTop
        }
    }
    let td = new Set(["absolute", "fixed"]);

    function tp(t, e, n) {
        var i;
        let o;
        if ("viewport" === e) o = function(t, e) {
            let n = W(t),
                i = H(t),
                r = n.visualViewport,
                o = i.clientWidth,
                l = i.clientHeight,
                a = 0,
                s = 0;
            if (r) {
                o = r.width, l = r.height;
                let t = J();
                (!t || t && "fixed" === e) && (a = r.offsetLeft, s = r.offsetTop)
            }
            let c = tf(i);
            if (c <= 0) {
                let t = i.ownerDocument,
                    e = t.body,
                    n = getComputedStyle(e),
                    r = "CSS1Compat" === t.compatMode && parseFloat(n.marginLeft) + parseFloat(n.marginRight) || 0,
                    l = Math.abs(i.clientWidth - e.clientWidth - r);
                l <= 25 && (o -= l)
            } else c <= 25 && (o += c);
            return {
                width: o,
                height: l,
                x: a,
                y: s
            }
        }(t, n);
        else if ("document" === e) {
            let e, n, l, a, s, c, u;
            i = H(t), e = H(i), n = te(i), l = i.ownerDocument.body, a = r(e.scrollWidth, e.clientWidth, l.scrollWidth, l.clientWidth), s = r(e.scrollHeight, e.clientHeight, l.scrollHeight, l.clientHeight), c = -n.scrollLeft + tf(i), u = -n.scrollTop, "rtl" === tt(l).direction && (c += r(e.clientWidth, l.clientWidth) - a), o = {
                width: a,
                height: s,
                x: c,
                y: u
            }
        } else if (j(e)) {
            let t, i, r, l, s, c;
            i = (t = tu(e, !0, "fixed" === n)).top + e.clientTop, r = t.left + e.clientLeft, l = V(e) ? ta(e) : a(1), s = e.clientWidth * l.x, c = e.clientHeight * l.y, o = {
                width: s,
                height: c,
                x: r * l.x,
                y: i * l.y
            }
        } else {
            let n = tc(t);
            o = {
                x: e.x - n.x,
                y: e.y - n.y,
                width: e.width,
                height: e.height
            }
        }
        return A(o)
    }

    function tm(t) {
        return "static" === tt(t).position
    }

    function tg(t, e) {
        if (!V(t) || "fixed" === tt(t).position) return null;
        if (e) return e(t);
        let n = t.offsetParent;
        return H(t) === n && (n = n.ownerDocument.body), n
    }

    function tw(t, e) {
        var n;
        let i = W(t);
        if (U(t)) return i;
        if (!V(t)) {
            let e = tn(t);
            for (; e && !Z(e);) {
                if (j(e) && !tm(e)) return e;
                e = tn(e)
            }
            return i
        }
        let r = tg(t, e);
        for (; r && (n = r, I.has(k(n))) && tm(r);) r = tg(r, e);
        return r && Z(r) && tm(r) && !$(r) ? i : r || function(t) {
            let e = tn(t);
            for (; V(e) && !Z(e);) {
                if ($(e)) return e;
                if (U(e)) break;
                e = tn(e)
            }
            return null
        }(t) || i
    }
    let ty = async function(t) {
        let e = this.getOffsetParent || tw,
            n = this.getDimensions,
            i = await n(t.floating);
        return {
            reference: function(t, e, n) {
                let i = V(e),
                    r = H(e),
                    o = "fixed" === n,
                    l = tu(t, !0, o, e),
                    s = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    c = a(0);
                if (i || !i && !o)
                    if (("body" !== k(e) || G(r)) && (s = te(e)), i) {
                        let t = tu(e, !0, o, e);
                        c.x = t.x + e.clientLeft, c.y = t.y + e.clientTop
                    } else r && (c.x = tf(r));
                o && !i && r && (c.x = tf(r));
                let u = !r || i || o ? a(0) : th(r, s);
                return {
                    x: l.left + s.scrollLeft - c.x - u.x,
                    y: l.top + s.scrollTop - c.y - u.y,
                    width: l.width,
                    height: l.height
                }
            }(t.reference, await e(t.floating), t.strategy),
            floating: {
                x: 0,
                y: 0,
                width: i.width,
                height: i.height
            }
        }
    }, tv = {
        convertOffsetParentRelativeRectToViewportRelativeRect: function(t) {
            let {
                elements: e,
                rect: n,
                offsetParent: i,
                strategy: r
            } = t, o = "fixed" === r, l = H(i), s = !!e && U(e.floating);
            if (i === l || s && o) return n;
            let c = {
                    scrollLeft: 0,
                    scrollTop: 0
                },
                u = a(1),
                f = a(0),
                h = V(i);
            if ((h || !h && !o) && (("body" !== k(i) || G(l)) && (c = te(i)), V(i))) {
                let t = tu(i);
                u = ta(i), f.x = t.x + i.clientLeft, f.y = t.y + i.clientTop
            }
            let d = !l || h || o ? a(0) : th(l, c);
            return {
                width: n.width * u.x,
                height: n.height * u.y,
                x: n.x * u.x - c.scrollLeft * u.x + f.x + d.x,
                y: n.y * u.y - c.scrollTop * u.y + f.y + d.y
            }
        },
        getDocumentElement: H,
        getClippingRect: function(t) {
            let {
                element: e,
                boundary: n,
                rootBoundary: o,
                strategy: l
            } = t, a = [..."clippingAncestors" === n ? U(e) ? [] : function(t, e) {
                let n = e.get(t);
                if (n) return n;
                let i = ti(t, [], !1).filter(t => j(t) && "body" !== k(t)),
                    r = null,
                    o = "fixed" === tt(t).position,
                    l = o ? tn(t) : t;
                for (; j(l) && !Z(l);) {
                    let e = tt(l),
                        n = $(l);
                    n || "fixed" !== e.position || (r = null), (o ? !n && !r : !n && "static" === e.position && !!r && td.has(r.position) || G(l) && !n && function t(e, n) {
                        let i = tn(e);
                        return !(i === n || !j(i) || Z(i)) && ("fixed" === tt(i).position || t(i, n))
                    }(t, l)) ? i = i.filter(t => t !== l) : r = e, l = tn(l)
                }
                return e.set(t, i), i
            }(e, this._c) : [].concat(n), o], s = a[0], c = a.reduce((t, n) => {
                let o = tp(e, n, l);
                return t.top = r(o.top, t.top), t.right = i(o.right, t.right), t.bottom = i(o.bottom, t.bottom), t.left = r(o.left, t.left), t
            }, tp(e, s, l));
            return {
                width: c.right - c.left,
                height: c.bottom - c.top,
                x: c.left,
                y: c.top
            }
        },
        getOffsetParent: tw,
        getElementRects: ty,
        getClientRects: function(t) {
            return Array.from(t.getClientRects())
        },
        getDimensions: function(t) {
            let {
                width: e,
                height: n
            } = to(t);
            return {
                width: e,
                height: n
            }
        },
        getScale: ta,
        isElement: j,
        isRTL: function(t) {
            return "rtl" === tt(t).direction
        }
    };

    function tx(t, e) {
        return t.x === e.x && t.y === e.y && t.width === e.width && t.height === e.height
    }
    t.s(["arrow", 0, t => ({
        name: "arrow",
        options: t,
        async fn(e) {
            let {
                x: n,
                y: o,
                placement: l,
                rects: a,
                platform: s,
                elements: c,
                middlewareData: f
            } = e, {
                element: m,
                padding: w = 0
            } = u(t, e) || {};
            if (null == m) return {};
            let y = T(w),
                v = {
                    x: n,
                    y: o
                },
                x = d(g(l)),
                b = p(x),
                R = await s.getDimensions(m),
                _ = "y" === x,
                A = _ ? "clientHeight" : "clientWidth",
                L = a.reference[b] + a.reference[x] - v[x] - a.floating[b],
                E = v[x] - a.reference[x],
                C = await (null == s.getOffsetParent ? void 0 : s.getOffsetParent(m)),
                P = C ? C[A] : 0;
            P && await (null == s.isElement ? void 0 : s.isElement(C)) || (P = c.floating[A] || a.floating[b]);
            let S = P / 2 - R[b] / 2 - 1,
                O = i(y[_ ? "top" : "left"], S),
                D = i(y[_ ? "bottom" : "right"], S),
                M = P - R[b] - D,
                F = P / 2 - R[b] / 2 + (L / 2 - E / 2),
                k = r(O, i(F, M)),
                W = !f.arrow && null != h(l) && F !== k && a.reference[b] / 2 - (F < O ? O : D) - R[b] / 2 < 0,
                H = W ? F < O ? F - O : F - M : 0;
            return {
                [x]: v[x] + H,
                data: {
                    [x]: k,
                    centerOffset: F - k - H,
                    ...W && {
                        alignmentOffset: H
                    }
                },
                reset: W
            }
        }
    }), "autoPlacement", 0, function(t) {
        return void 0 === t && (t = {}), {
            name: "autoPlacement",
            options: t,
            async fn(e) {
                var i, r, o, l;
                let {
                    rects: a,
                    middlewareData: s,
                    placement: c,
                    platform: d,
                    elements: p
                } = e, {
                    crossAxis: m = !1,
                    alignment: g,
                    allowedPlacements: v = n,
                    autoAlignment: x = !0,
                    ...b
                } = u(t, e), R = void 0 !== g || v === n ? ((l = g || null) ? [...v.filter(t => h(t) === l), ...v.filter(t => h(t) !== l)] : v.filter(t => f(t) === t)).filter(t => !l || h(t) === l || !!x && y(t) !== t) : v, _ = await C(e, b), T = (null == (i = s.autoPlacement) ? void 0 : i.index) || 0, A = R[T];
                if (null == A) return {};
                let L = w(A, a, await (null == d.isRTL ? void 0 : d.isRTL(p.floating)));
                if (c !== A) return {
                    reset: {
                        placement: R[0]
                    }
                };
                let E = [_[f(A)], _[L[0]], _[L[1]]],
                    P = [...(null == (r = s.autoPlacement) ? void 0 : r.overflows) || [], {
                        placement: A,
                        overflows: E
                    }],
                    S = R[T + 1];
                if (S) return {
                    data: {
                        index: T + 1,
                        overflows: P
                    },
                    reset: {
                        placement: S
                    }
                };
                let O = P.map(t => {
                        let e = h(t.placement);
                        return [t.placement, e && m ? t.overflows.slice(0, 2).reduce((t, e) => t + e, 0) : t.overflows[0], t.overflows]
                    }).sort((t, e) => t[1] - e[1]),
                    D = (null == (o = O.filter(t => t[2].slice(0, h(t[0]) ? 2 : 3).every(t => t <= 0))[0]) ? void 0 : o[0]) || O[0][0];
                return D !== c ? {
                    data: {
                        index: T + 1,
                        overflows: P
                    },
                    reset: {
                        placement: D
                    }
                } : {}
            }
        }
    }, "autoUpdate", 0, function(t, e, n, o) {
        let a;
        void 0 === o && (o = {});
        let {
            ancestorScroll: s = !0,
            ancestorResize: c = !0,
            elementResize: u = "function" == typeof ResizeObserver,
            layoutShift: f = "function" == typeof IntersectionObserver,
            animationFrame: h = !1
        } = o, d = tl(t), p = s || c ? [...d ? ti(d) : [], ...ti(e)] : [];
        p.forEach(t => {
            s && t.addEventListener("scroll", n, {
                passive: !0
            }), c && t.addEventListener("resize", n)
        });
        let m = d && f ? function(t, e) {
                let n, o = null,
                    a = H(t);

                function s() {
                    var t;
                    clearTimeout(n), null == (t = o) || t.disconnect(), o = null
                }
                return ! function c(u, f) {
                    void 0 === u && (u = !1), void 0 === f && (f = 1), s();
                    let h = t.getBoundingClientRect(),
                        {
                            left: d,
                            top: p,
                            width: m,
                            height: g
                        } = h;
                    if (u || e(), !m || !g) return;
                    let w = {
                            rootMargin: -l(p) + "px " + -l(a.clientWidth - (d + m)) + "px " + -l(a.clientHeight - (p + g)) + "px " + -l(d) + "px",
                            threshold: r(0, i(1, f)) || 1
                        },
                        y = !0;

                    function v(e) {
                        let i = e[0].intersectionRatio;
                        if (i !== f) {
                            if (!y) return c();
                            i ? c(!1, i) : n = setTimeout(() => {
                                c(!1, 1e-7)
                            }, 1e3)
                        }
                        1 !== i || tx(h, t.getBoundingClientRect()) || c(), y = !1
                    }
                    try {
                        o = new IntersectionObserver(v, {
                            ...w,
                            root: a.ownerDocument
                        })
                    } catch (t) {
                        o = new IntersectionObserver(v, w)
                    }
                    o.observe(t)
                }(!0), s
            }(d, n) : null,
            g = -1,
            w = null;
        u && (w = new ResizeObserver(t => {
            let [i] = t;
            i && i.target === d && w && (w.unobserve(e), cancelAnimationFrame(g), g = requestAnimationFrame(() => {
                var t;
                null == (t = w) || t.observe(e)
            })), n()
        }), d && !h && w.observe(d), w.observe(e));
        let y = h ? tu(t) : null;
        return h && function e() {
            let i = tu(t);
            y && !tx(y, i) && n(), y = i, a = requestAnimationFrame(e)
        }(), n(), () => {
            var t;
            p.forEach(t => {
                s && t.removeEventListener("scroll", n), c && t.removeEventListener("resize", n)
            }), null == m || m(), null == (t = w) || t.disconnect(), w = null, h && cancelAnimationFrame(a)
        }
    }, "computePosition", 0, (t, e, n) => {
        let i = new Map,
            r = {
                platform: tv,
                ...n
            },
            o = {
                ...r.platform,
                _c: i
            };
        return E(t, e, {
            ...r,
            platform: o
        })
    }, "flip", 0, function(t) {
        return void 0 === t && (t = {}), {
            name: "flip",
            options: t,
            async fn(e) {
                var n, i, r, o, l;
                let a, s, c, {
                        placement: d,
                        middlewareData: p,
                        rects: m,
                        initialPlacement: T,
                        platform: A,
                        elements: L
                    } = e,
                    {
                        mainAxis: E = !0,
                        crossAxis: P = !0,
                        fallbackPlacements: S,
                        fallbackStrategy: O = "bestFit",
                        fallbackAxisSideDirection: D = "none",
                        flipAlignment: M = !0,
                        ...F
                    } = u(t, e);
                if (null != (n = p.arrow) && n.alignmentOffset) return {};
                let k = f(d),
                    W = g(T),
                    H = f(T) === T,
                    B = await (null == A.isRTL ? void 0 : A.isRTL(L.floating)),
                    j = S || (H || !M ? [_(T)] : (a = _(T), [y(T), a, y(a)])),
                    V = "none" !== D;
                !S && V && j.push(...(s = h(T), c = function(t, e, n) {
                    switch (t) {
                        case "top":
                        case "bottom":
                            if (n) return e ? x : v;
                            return e ? v : x;
                        case "left":
                        case "right":
                            return e ? b : R;
                        default:
                            return []
                    }
                }(f(T), "start" === D, B), s && (c = c.map(t => t + "-" + s), M && (c = c.concat(c.map(y)))), c));
                let N = [T, ...j],
                    z = await C(e, F),
                    G = [],
                    I = (null == (i = p.flip) ? void 0 : i.overflows) || [];
                if (E && G.push(z[k]), P) {
                    let t = w(d, m, B);
                    G.push(z[t[0]], z[t[1]])
                }
                if (I = [...I, {
                        placement: d,
                        overflows: G
                    }], !G.every(t => t <= 0)) {
                    let t = ((null == (r = p.flip) ? void 0 : r.index) || 0) + 1,
                        e = N[t];
                    if (e && ("alignment" !== P || W === g(e) || I.every(t => g(t.placement) !== W || t.overflows[0] > 0))) return {
                        data: {
                            index: t,
                            overflows: I
                        },
                        reset: {
                            placement: e
                        }
                    };
                    let n = null == (o = I.filter(t => t.overflows[0] <= 0).sort((t, e) => t.overflows[1] - e.overflows[1])[0]) ? void 0 : o.placement;
                    if (!n) switch (O) {
                        case "bestFit": {
                            let t = null == (l = I.filter(t => {
                                if (V) {
                                    let e = g(t.placement);
                                    return e === W || "y" === e
                                }
                                return !0
                            }).map(t => [t.placement, t.overflows.filter(t => t > 0).reduce((t, e) => t + e, 0)]).sort((t, e) => t[1] - e[1])[0]) ? void 0 : l[0];
                            t && (n = t);
                            break
                        }
                        case "initialPlacement":
                            n = T
                    }
                    if (d !== n) return {
                        reset: {
                            placement: n
                        }
                    }
                }
                return {}
            }
        }
    }, "hide", 0, function(t) {
        return void 0 === t && (t = {}), {
            name: "hide",
            options: t,
            async fn(e) {
                let {
                    rects: n
                } = e, {
                    strategy: i = "referenceHidden",
                    ...r
                } = u(t, e);
                switch (i) {
                    case "referenceHidden": {
                        let t = P(await C(e, {
                            ...r,
                            elementContext: "reference"
                        }), n.reference);
                        return {
                            data: {
                                referenceHiddenOffsets: t,
                                referenceHidden: S(t)
                            }
                        }
                    }
                    case "escaped": {
                        let t = P(await C(e, {
                            ...r,
                            altBoundary: !0
                        }), n.floating);
                        return {
                            data: {
                                escapedOffsets: t,
                                escaped: S(t)
                            }
                        }
                    }
                    default:
                        return {}
                }
            }
        }
    }, "inline", 0, function(t) {
        return void 0 === t && (t = {}), {
            name: "inline",
            options: t,
            async fn(e) {
                let {
                    placement: n,
                    elements: o,
                    rects: l,
                    platform: a,
                    strategy: s
                } = e, {
                    padding: c = 2,
                    x: h,
                    y: d
                } = u(t, e), p = Array.from(await (null == a.getClientRects ? void 0 : a.getClientRects(o.reference)) || []), m = function(t) {
                    let e = t.slice().sort((t, e) => t.y - e.y),
                        n = [],
                        i = null;
                    for (let t = 0; t < e.length; t++) {
                        let r = e[t];
                        !i || r.y - i.y > i.height / 2 ? n.push([r]) : n[n.length - 1].push(r), i = r
                    }
                    return n.map(t => A(O(t)))
                }(p), w = A(O(p)), y = T(c), v = await a.getElementRects({
                    reference: {
                        getBoundingClientRect: function() {
                            if (2 === m.length && m[0].left > m[1].right && null != h && null != d) return m.find(t => h > t.left - y.left && h < t.right + y.right && d > t.top - y.top && d < t.bottom + y.bottom) || w;
                            if (m.length >= 2) {
                                if ("y" === g(n)) {
                                    let t = m[0],
                                        e = m[m.length - 1],
                                        i = "top" === f(n),
                                        r = t.top,
                                        o = e.bottom,
                                        l = i ? t.left : e.left,
                                        a = i ? t.right : e.right;
                                    return {
                                        top: r,
                                        bottom: o,
                                        left: l,
                                        right: a,
                                        width: a - l,
                                        height: o - r,
                                        x: l,
                                        y: r
                                    }
                                }
                                let t = "left" === f(n),
                                    e = r(...m.map(t => t.right)),
                                    o = i(...m.map(t => t.left)),
                                    l = m.filter(n => t ? n.left === o : n.right === e),
                                    a = l[0].top,
                                    s = l[l.length - 1].bottom;
                                return {
                                    top: a,
                                    bottom: s,
                                    left: o,
                                    right: e,
                                    width: e - o,
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
    }, "limitShift", 0, function(t) {
        return void 0 === t && (t = {}), {
            options: t,
            fn(e) {
                let {
                    x: n,
                    y: i,
                    placement: r,
                    rects: o,
                    middlewareData: l
                } = e, {
                    offset: a = 0,
                    mainAxis: s = !0,
                    crossAxis: c = !0
                } = u(t, e), h = {
                    x: n,
                    y: i
                }, p = g(r), m = d(p), w = h[m], y = h[p], v = u(a, e), x = "number" == typeof v ? {
                    mainAxis: v,
                    crossAxis: 0
                } : {
                    mainAxis: 0,
                    crossAxis: 0,
                    ...v
                };
                if (s) {
                    let t = "y" === m ? "height" : "width",
                        e = o.reference[m] - o.floating[t] + x.mainAxis,
                        n = o.reference[m] + o.reference[t] - x.mainAxis;
                    w < e ? w = e : w > n && (w = n)
                }
                if (c) {
                    var b, R;
                    let t = "y" === m ? "width" : "height",
                        e = D.has(f(r)),
                        n = o.reference[p] - o.floating[t] + (e && (null == (b = l.offset) ? void 0 : b[p]) || 0) + (e ? 0 : x.crossAxis),
                        i = o.reference[p] + o.reference[t] + (e ? 0 : (null == (R = l.offset) ? void 0 : R[p]) || 0) - (e ? x.crossAxis : 0);
                    y < n ? y = n : y > i && (y = i)
                }
                return {
                    [m]: w,
                    [p]: y
                }
            }
        }
    }, "offset", 0, function(t) {
        return void 0 === t && (t = 0), {
            name: "offset",
            options: t,
            async fn(e) {
                var n, i;
                let {
                    x: r,
                    y: o,
                    placement: l,
                    middlewareData: a
                } = e, s = await M(e, t);
                return l === (null == (n = a.offset) ? void 0 : n.placement) && null != (i = a.arrow) && i.alignmentOffset ? {} : {
                    x: r + s.x,
                    y: o + s.y,
                    data: {
                        ...s,
                        placement: l
                    }
                }
            }
        }
    }, "shift", 0, function(t) {
        return void 0 === t && (t = {}), {
            name: "shift",
            options: t,
            async fn(e) {
                let {
                    x: n,
                    y: o,
                    placement: l
                } = e, {
                    mainAxis: a = !0,
                    crossAxis: s = !1,
                    limiter: c = {
                        fn: t => {
                            let {
                                x: e,
                                y: n
                            } = t;
                            return {
                                x: e,
                                y: n
                            }
                        }
                    },
                    ...h
                } = u(t, e), p = {
                    x: n,
                    y: o
                }, m = await C(e, h), w = g(f(l)), y = d(w), v = p[y], x = p[w];
                if (a) {
                    let t = "y" === y ? "top" : "left",
                        e = "y" === y ? "bottom" : "right",
                        n = v + m[t],
                        o = v - m[e];
                    v = r(n, i(v, o))
                }
                if (s) {
                    let t = "y" === w ? "top" : "left",
                        e = "y" === w ? "bottom" : "right",
                        n = x + m[t],
                        o = x - m[e];
                    x = r(n, i(x, o))
                }
                let b = c.fn({
                    ...e,
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
    }, "size", 0, function(t) {
        return void 0 === t && (t = {}), {
            name: "size",
            options: t,
            async fn(e) {
                var n, o;
                let l, a, {
                        placement: s,
                        rects: c,
                        platform: d,
                        elements: p
                    } = e,
                    {
                        apply: m = () => {},
                        ...w
                    } = u(t, e),
                    y = await C(e, w),
                    v = f(s),
                    x = h(s),
                    b = "y" === g(s),
                    {
                        width: R,
                        height: _
                    } = c.floating;
                "top" === v || "bottom" === v ? (l = v, a = x === (await (null == d.isRTL ? void 0 : d.isRTL(p.floating)) ? "start" : "end") ? "left" : "right") : (a = v, l = "end" === x ? "top" : "bottom");
                let T = _ - y.top - y.bottom,
                    A = R - y.left - y.right,
                    L = i(_ - y[l], T),
                    E = i(R - y[a], A),
                    P = !e.middlewareData.shift,
                    S = L,
                    O = E;
                if (null != (n = e.middlewareData.shift) && n.enabled.x && (O = A), null != (o = e.middlewareData.shift) && o.enabled.y && (S = T), P && !x) {
                    let t = r(y.left, 0),
                        e = r(y.right, 0),
                        n = r(y.top, 0),
                        i = r(y.bottom, 0);
                    b ? O = R - 2 * (0 !== t || 0 !== e ? t + e : r(y.left, y.right)) : S = _ - 2 * (0 !== n || 0 !== i ? n + i : r(y.top, y.bottom))
                }
                await m({
                    ...e,
                    availableWidth: O,
                    availableHeight: S
                });
                let D = await d.getDimensions(p.floating);
                return R !== D.width || _ !== D.height ? {
                    reset: {
                        rects: !0
                    }
                } : {}
            }
        }
    }], 422957)
}, 178896, t => {
    "use strict";
    t.s(["composeEventHandlers", 0, function(t, e) {
        let {
            checkForDefaultPrevented: n = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(i) {
            if (t?.(i), !1 === n || !i.defaultPrevented) return e?.(i)
        }
    }])
}, 51449, t => {
    "use strict";
    var e, n, i, r, o, l = t.i(376054),
        a = t.i(136927),
        s = t.i(550475),
        c = t.i(42297),
        u = t.i(474754),
        f = t.i(259864),
        h = t.i(539392),
        d = t.i(313805),
        p = (e = new WeakMap, n = new WeakMap, i = new WeakMap, r = new WeakMap, o = new WeakSet, class extends h.Removable {
            setOptions(t) {
                this.options = t, this.updateGcTime(this.options.gcTime)
            }
            get meta() {
                return this.options.meta
            }
            addObserver(t) {
                (0, l._)(this, n).includes(t) || ((0, l._)(this, n).push(t), this.clearGcTimeout(), (0, l._)(this, i).notify({
                    type: "observerAdded",
                    mutation: this,
                    observer: t
                }))
            }
            removeObserver(t) {
                (0, s._)(this, n, (0, l._)(this, n).filter(e => e !== t)), this.scheduleGc(), (0, l._)(this, i).notify({
                    type: "observerRemoved",
                    mutation: this,
                    observer: t
                })
            }
            optionalRemove() {
                (0, l._)(this, n).length || ("pending" === this.state.status ? this.scheduleGc() : (0, l._)(this, i).remove(this))
            }
            continue () {
                return (0, l._)(this, r)?.continue() ?? this.execute(this.state.variables)
            }
            async execute(t) {
                let n = () => {
                        (0, c._)(this, o, g).call(this, {
                            type: "continue"
                        })
                    },
                    a = {
                        client: (0, l._)(this, e),
                        meta: this.options.meta,
                        mutationKey: this.options.mutationKey
                    };
                (0, s._)(this, r, (0, d.createRetryer)({
                    fn: () => this.options.mutationFn ? this.options.mutationFn(t, a) : Promise.reject(Error("No mutationFn found")),
                    onFail: (t, e) => {
                        (0, c._)(this, o, g).call(this, {
                            type: "failed",
                            failureCount: t,
                            error: e
                        })
                    },
                    onPause: () => {
                        (0, c._)(this, o, g).call(this, {
                            type: "pause"
                        })
                    },
                    onContinue: n,
                    retry: this.options.retry ?? 0,
                    retryDelay: this.options.retryDelay,
                    networkMode: this.options.networkMode,
                    canRun: () => (0, l._)(this, i).canRun(this)
                }));
                let u = "pending" === this.state.status,
                    f = !(0, l._)(this, r).canStart();
                try {
                    if (u) n();
                    else {
                        (0, c._)(this, o, g).call(this, {
                            type: "pending",
                            variables: t,
                            isPaused: f
                        }), (0, l._)(this, i).config.onMutate && await (0, l._)(this, i).config.onMutate(t, this, a);
                        let e = await this.options.onMutate?.(t, a);
                        e !== this.state.context && (0, c._)(this, o, g).call(this, {
                            type: "pending",
                            context: e,
                            variables: t,
                            isPaused: f
                        })
                    }
                    let e = await (0, l._)(this, r).start();
                    return await (0, l._)(this, i).config.onSuccess?.(e, t, this.state.context, this, a), await this.options.onSuccess?.(e, t, this.state.context, a), await (0, l._)(this, i).config.onSettled?.(e, null, this.state.variables, this.state.context, this, a), await this.options.onSettled?.(e, null, t, this.state.context, a), (0, c._)(this, o, g).call(this, {
                        type: "success",
                        data: e
                    }), e
                } catch (e) {
                    try {
                        await (0, l._)(this, i).config.onError?.(e, t, this.state.context, this, a)
                    } catch (t) {
                        Promise.reject(t)
                    }
                    try {
                        await this.options.onError?.(e, t, this.state.context, a)
                    } catch (t) {
                        Promise.reject(t)
                    }
                    try {
                        await (0, l._)(this, i).config.onSettled?.(void 0, e, this.state.variables, this.state.context, this, a)
                    } catch (t) {
                        Promise.reject(t)
                    }
                    try {
                        await this.options.onSettled?.(void 0, e, t, this.state.context, a)
                    } catch (t) {
                        Promise.reject(t)
                    }
                    throw (0, c._)(this, o, g).call(this, {
                        type: "error",
                        error: e
                    }), e
                } finally {
                    (0, l._)(this, i).runNext(this)
                }
            }
            constructor(t) {
                super(), (0, u._)(this, o), (0, a._)(this, e, {
                    writable: !0,
                    value: void 0
                }), (0, a._)(this, n, {
                    writable: !0,
                    value: void 0
                }), (0, a._)(this, i, {
                    writable: !0,
                    value: void 0
                }), (0, a._)(this, r, {
                    writable: !0,
                    value: void 0
                }), (0, s._)(this, e, t.client), this.mutationId = t.mutationId, (0, s._)(this, i, t.mutationCache), (0, s._)(this, n, []), this.state = t.state || m(), this.setOptions(t.options), this.scheduleGc()
            }
        });

    function m() {
        return {
            context: void 0,
            data: void 0,
            error: null,
            failureCount: 0,
            failureReason: null,
            isPaused: !1,
            status: "idle",
            variables: void 0,
            submittedAt: 0
        }
    }

    function g(t) {
        this.state = (e => {
            switch (t.type) {
                case "failed":
                    return {
                        ...e, failureCount: t.failureCount, failureReason: t.error
                    };
                case "pause":
                    return {
                        ...e, isPaused: !0
                    };
                case "continue":
                    return {
                        ...e, isPaused: !1
                    };
                case "pending":
                    return {
                        ...e, context: t.context, data: void 0, failureCount: 0, failureReason: null, error: null, isPaused: t.isPaused, status: "pending", variables: t.variables, submittedAt: Date.now()
                    };
                case "success":
                    return {
                        ...e, data: t.data, failureCount: 0, failureReason: null, error: null, status: "success", isPaused: !1
                    };
                case "error":
                    return {
                        ...e, data: void 0, error: t.error, failureCount: e.failureCount + 1, failureReason: t.error, isPaused: !1, status: "error"
                    }
            }
        })(this.state), f.notifyManager.batch(() => {
            (0, l._)(this, n).forEach(e => {
                e.onMutationUpdate(t)
            }), (0, l._)(this, i).notify({
                mutation: this,
                type: "updated",
                action: t
            })
        })
    }
    t.s(["Mutation", 0, p, "getDefaultState", 0, m])
}]);

//# debugId=73b6c4f8-6705-a3e6-6cbc-7d91a154d760
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/10p-c-yrnfa~h.js.map