;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "22bf4213-3705-1d18-af3a-4853fd5e5842")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 980891, 350303, e => {
    "use strict";
    let t, n = ["top", "right", "bottom", "left"],
        r = n.reduce((e, t) => e.concat(t, t + "-start", t + "-end"), []),
        i = Math.min,
        o = Math.max,
        l = Math.round,
        a = Math.floor,
        u = e => ({
            x: e,
            y: e
        }),
        s = {
            left: "right",
            right: "left",
            bottom: "top",
            top: "bottom"
        };

    function c(e, t) {
        return "function" == typeof e ? e(t) : e
    }

    function f(e) {
        return e.split("-")[0]
    }

    function d(e) {
        return e.split("-")[1]
    }

    function p(e) {
        return "x" === e ? "y" : "x"
    }

    function h(e) {
        return "y" === e ? "height" : "width"
    }

    function m(e) {
        let t = e[0];
        return "t" === t || "b" === t ? "y" : "x"
    }

    function v(e, t, n) {
        void 0 === n && (n = !1);
        let r = d(e),
            i = p(m(e)),
            o = h(i),
            l = "x" === i ? r === (n ? "end" : "start") ? "right" : "left" : "start" === r ? "bottom" : "top";
        return t.reference[o] > t.floating[o] && (l = E(l)), [l, E(l)]
    }

    function g(e) {
        return e.includes("start") ? e.replace("start", "end") : e.replace("end", "start")
    }
    let y = ["left", "right"],
        w = ["right", "left"],
        x = ["top", "bottom"],
        b = ["bottom", "top"];

    function E(e) {
        let t = f(e);
        return s[t] + e.slice(t.length)
    }

    function R(e) {
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

    function C(e) {
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

    function T(e, t, n) {
        let r, {
                reference: i,
                floating: o
            } = e,
            l = m(t),
            a = p(m(t)),
            u = h(a),
            s = f(t),
            c = "y" === l,
            v = i.x + i.width / 2 - o.width / 2,
            g = i.y + i.height / 2 - o.height / 2,
            y = i[u] / 2 - o[u] / 2;
        switch (s) {
            case "top":
                r = {
                    x: v,
                    y: i.y - o.height
                };
                break;
            case "bottom":
                r = {
                    x: v,
                    y: i.y + i.height
                };
                break;
            case "right":
                r = {
                    x: i.x + i.width,
                    y: g
                };
                break;
            case "left":
                r = {
                    x: i.x - o.width,
                    y: g
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
                r[a] -= y * (n && c ? -1 : 1);
                break;
            case "end":
                r[a] += y * (n && c ? -1 : 1)
        }
        return r
    }
    async function A(e, t) {
        var n;
        void 0 === t && (t = {});
        let {
            x: r,
            y: i,
            platform: o,
            rects: l,
            elements: a,
            strategy: u
        } = e, {
            boundary: s = "clippingAncestors",
            rootBoundary: f = "viewport",
            elementContext: d = "floating",
            altBoundary: p = !1,
            padding: h = 0
        } = c(t, e), m = R(h), v = a[p ? "floating" === d ? "reference" : "floating" : d], g = C(await o.getClippingRect({
            element: null == (n = await (null == o.isElement ? void 0 : o.isElement(v))) || n ? v : v.contextElement || await (null == o.getDocumentElement ? void 0 : o.getDocumentElement(a.floating)),
            boundary: s,
            rootBoundary: f,
            strategy: u
        })), y = "floating" === d ? {
            x: r,
            y: i,
            width: l.floating.width,
            height: l.floating.height
        } : l.reference, w = await (null == o.getOffsetParent ? void 0 : o.getOffsetParent(a.floating)), x = await (null == o.isElement ? void 0 : o.isElement(w)) && await (null == o.getScale ? void 0 : o.getScale(w)) || {
            x: 1,
            y: 1
        }, b = C(o.convertOffsetParentRelativeRectToViewportRelativeRect ? await o.convertOffsetParentRelativeRectToViewportRelativeRect({
            elements: a,
            rect: y,
            offsetParent: w,
            strategy: u
        }) : y);
        return {
            top: (g.top - b.top + m.top) / x.y,
            bottom: (b.bottom - g.bottom + m.bottom) / x.y,
            left: (g.left - b.left + m.left) / x.x,
            right: (b.right - g.right + m.right) / x.x
        }
    }
    let O = async (e, t, n) => {
        let {
            placement: r = "bottom",
            strategy: i = "absolute",
            middleware: o = [],
            platform: l
        } = n, a = l.detectOverflow ? l : {
            ...l,
            detectOverflow: A
        }, u = await (null == l.isRTL ? void 0 : l.isRTL(t)), s = await l.getElementRects({
            reference: e,
            floating: t,
            strategy: i
        }), {
            x: c,
            y: f
        } = T(s, r, u), d = r, p = 0, h = {};
        for (let n = 0; n < o.length; n++) {
            let m = o[n];
            if (!m) continue;
            let {
                name: v,
                fn: g
            } = m, {
                x: y,
                y: w,
                data: x,
                reset: b
            } = await g({
                x: c,
                y: f,
                initialPlacement: r,
                placement: d,
                strategy: i,
                middlewareData: h,
                rects: s,
                platform: a,
                elements: {
                    reference: e,
                    floating: t
                }
            });
            c = null != y ? y : c, f = null != w ? w : f, h[v] = {
                ...h[v],
                ...x
            }, b && p < 50 && (p++, "object" == typeof b && (b.placement && (d = b.placement), b.rects && (s = !0 === b.rects ? await l.getElementRects({
                reference: e,
                floating: t,
                strategy: i
            }) : b.rects), {
                x: c,
                y: f
            } = T(s, d, u)), n = -1)
        }
        return {
            x: c,
            y: f,
            placement: d,
            strategy: i,
            middlewareData: h
        }
    };

    function P(e, t) {
        return {
            top: e.top - t.height,
            right: e.right - t.width,
            bottom: e.bottom - t.height,
            left: e.left - t.width
        }
    }

    function L(e) {
        return n.some(t => e[t] >= 0)
    }

    function S(e) {
        let t = i(...e.map(e => e.left)),
            n = i(...e.map(e => e.top));
        return {
            x: t,
            y: n,
            width: o(...e.map(e => e.right)) - t,
            height: o(...e.map(e => e.bottom)) - n
        }
    }
    let j = new Set(["left", "top"]);
    async function N(e, t) {
        let {
            placement: n,
            platform: r,
            elements: i
        } = e, o = await (null == r.isRTL ? void 0 : r.isRTL(i.floating)), l = f(n), a = d(n), u = "y" === m(n), s = j.has(l) ? -1 : 1, p = o && u ? -1 : 1, h = c(t, e), {
            mainAxis: v,
            crossAxis: g,
            alignmentAxis: y
        } = "number" == typeof h ? {
            mainAxis: h,
            crossAxis: 0,
            alignmentAxis: null
        } : {
            mainAxis: h.mainAxis || 0,
            crossAxis: h.crossAxis || 0,
            alignmentAxis: h.alignmentAxis
        };
        return a && "number" == typeof y && (g = "end" === a ? -1 * y : y), u ? {
            x: g * p,
            y: v * s
        } : {
            x: v * s,
            y: g * p
        }
    }

    function D() {
        return "u" > typeof window
    }

    function k(e) {
        return _(e) ? (e.nodeName || "").toLowerCase() : "#document"
    }

    function M(e) {
        var t;
        return (null == e || null == (t = e.ownerDocument) ? void 0 : t.defaultView) || window
    }

    function W(e) {
        var t;
        return null == (t = (_(e) ? e.ownerDocument : e.document) || window.document) ? void 0 : t.documentElement
    }

    function _(e) {
        return !!D() && (e instanceof Node || e instanceof M(e).Node)
    }

    function F(e) {
        return !!D() && (e instanceof Element || e instanceof M(e).Element)
    }

    function V(e) {
        return !!D() && (e instanceof HTMLElement || e instanceof M(e).HTMLElement)
    }

    function H(e) {
        return !(!D() || "u" < typeof ShadowRoot) && (e instanceof ShadowRoot || e instanceof M(e).ShadowRoot)
    }

    function I(e) {
        let {
            overflow: t,
            overflowX: n,
            overflowY: r,
            display: i
        } = K(e);
        return /auto|scroll|overlay|hidden|clip/.test(t + r + n) && "inline" !== i && "contents" !== i
    }

    function B(e) {
        try {
            if (e.matches(":popover-open")) return !0
        } catch (e) {}
        try {
            return e.matches(":modal")
        } catch (e) {
            return !1
        }
    }
    let z = /transform|translate|scale|rotate|perspective|filter/,
        U = /paint|layout|strict|content/,
        Y = e => !!e && "none" !== e;

    function X(e) {
        let t = F(e) ? K(e) : e;
        return Y(t.transform) || Y(t.translate) || Y(t.scale) || Y(t.rotate) || Y(t.perspective) || !$() && (Y(t.backdropFilter) || Y(t.filter)) || z.test(t.willChange || "") || U.test(t.contain || "")
    }

    function $() {
        return null == t && (t = "u" > typeof CSS && CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")), t
    }

    function q(e) {
        return /^(html|body|#document)$/.test(k(e))
    }

    function K(e) {
        return M(e).getComputedStyle(e)
    }

    function Q(e) {
        return F(e) ? {
            scrollLeft: e.scrollLeft,
            scrollTop: e.scrollTop
        } : {
            scrollLeft: e.scrollX,
            scrollTop: e.scrollY
        }
    }

    function Z(e) {
        if ("html" === k(e)) return e;
        let t = e.assignedSlot || e.parentNode || H(e) && e.host || W(e);
        return H(t) ? t.host : t
    }

    function G(e, t, n) {
        var r;
        void 0 === t && (t = []), void 0 === n && (n = !0);
        let i = function e(t) {
                let n = Z(t);
                return q(n) ? t.ownerDocument ? t.ownerDocument.body : t.body : V(n) && I(n) ? n : e(n)
            }(e),
            o = i === (null == (r = e.ownerDocument) ? void 0 : r.body),
            l = M(i);
        if (!o) return t.concat(i, G(i, [], n));
        {
            let e = J(l);
            return t.concat(l, l.visualViewport || [], I(i) ? i : [], e && n ? G(e) : [])
        }
    }

    function J(e) {
        return e.parent && Object.getPrototypeOf(e.parent) ? e.frameElement : null
    }

    function ee(e) {
        let t = K(e),
            n = parseFloat(t.width) || 0,
            r = parseFloat(t.height) || 0,
            i = V(e),
            o = i ? e.offsetWidth : n,
            a = i ? e.offsetHeight : r,
            u = l(n) !== o || l(r) !== a;
        return u && (n = o, r = a), {
            width: n,
            height: r,
            $: u
        }
    }

    function et(e) {
        return F(e) ? e : e.contextElement
    }

    function en(e) {
        let t = et(e);
        if (!V(t)) return u(1);
        let n = t.getBoundingClientRect(),
            {
                width: r,
                height: i,
                $: o
            } = ee(t),
            a = (o ? l(n.width) : n.width) / r,
            s = (o ? l(n.height) : n.height) / i;
        return a && Number.isFinite(a) || (a = 1), s && Number.isFinite(s) || (s = 1), {
            x: a,
            y: s
        }
    }
    let er = u(0);

    function ei(e) {
        let t = M(e);
        return $() && t.visualViewport ? {
            x: t.visualViewport.offsetLeft,
            y: t.visualViewport.offsetTop
        } : er
    }

    function eo(e, t, n, r) {
        var i;
        void 0 === t && (t = !1), void 0 === n && (n = !1);
        let o = e.getBoundingClientRect(),
            l = et(e),
            a = u(1);
        t && (r ? F(r) && (a = en(r)) : a = en(e));
        let s = (void 0 === (i = n) && (i = !1), r && (!i || r === M(l)) && i) ? ei(l) : u(0),
            c = (o.left + s.x) / a.x,
            f = (o.top + s.y) / a.y,
            d = o.width / a.x,
            p = o.height / a.y;
        if (l) {
            let e = M(l),
                t = r && F(r) ? M(r) : r,
                n = e,
                i = J(n);
            for (; i && r && t !== n;) {
                let e = en(i),
                    t = i.getBoundingClientRect(),
                    r = K(i),
                    o = t.left + (i.clientLeft + parseFloat(r.paddingLeft)) * e.x,
                    l = t.top + (i.clientTop + parseFloat(r.paddingTop)) * e.y;
                c *= e.x, f *= e.y, d *= e.x, p *= e.y, c += o, f += l, i = J(n = M(i))
            }
        }
        return C({
            width: d,
            height: p,
            x: c,
            y: f
        })
    }

    function el(e, t) {
        let n = Q(e).scrollLeft;
        return t ? t.left + n : eo(W(e)).left + n
    }

    function ea(e, t) {
        let n = e.getBoundingClientRect();
        return {
            x: n.left + t.scrollLeft - el(e, n),
            y: n.top + t.scrollTop
        }
    }

    function eu(e, t, n) {
        var r;
        let i;
        if ("viewport" === t) i = function(e, t) {
            let n = M(e),
                r = W(e),
                i = n.visualViewport,
                o = r.clientWidth,
                l = r.clientHeight,
                a = 0,
                u = 0;
            if (i) {
                o = i.width, l = i.height;
                let e = $();
                (!e || e && "fixed" === t) && (a = i.offsetLeft, u = i.offsetTop)
            }
            let s = el(r);
            if (s <= 0) {
                let e = r.ownerDocument,
                    t = e.body,
                    n = getComputedStyle(t),
                    i = "CSS1Compat" === e.compatMode && parseFloat(n.marginLeft) + parseFloat(n.marginRight) || 0,
                    l = Math.abs(r.clientWidth - t.clientWidth - i);
                l <= 25 && (o -= l)
            } else s <= 25 && (o += s);
            return {
                width: o,
                height: l,
                x: a,
                y: u
            }
        }(e, n);
        else if ("document" === t) {
            let t, n, l, a, u, s, c;
            r = W(e), t = W(r), n = Q(r), l = r.ownerDocument.body, a = o(t.scrollWidth, t.clientWidth, l.scrollWidth, l.clientWidth), u = o(t.scrollHeight, t.clientHeight, l.scrollHeight, l.clientHeight), s = -n.scrollLeft + el(r), c = -n.scrollTop, "rtl" === K(l).direction && (s += o(t.clientWidth, l.clientWidth) - a), i = {
                width: a,
                height: u,
                x: s,
                y: c
            }
        } else if (F(t)) {
            let e, r, o, l, a, s;
            r = (e = eo(t, !0, "fixed" === n)).top + t.clientTop, o = e.left + t.clientLeft, l = V(t) ? en(t) : u(1), a = t.clientWidth * l.x, s = t.clientHeight * l.y, i = {
                width: a,
                height: s,
                x: o * l.x,
                y: r * l.y
            }
        } else {
            let n = ei(e);
            i = {
                x: t.x - n.x,
                y: t.y - n.y,
                width: t.width,
                height: t.height
            }
        }
        return C(i)
    }

    function es(e) {
        return "static" === K(e).position
    }

    function ec(e, t) {
        if (!V(e) || "fixed" === K(e).position) return null;
        if (t) return t(e);
        let n = e.offsetParent;
        return W(e) === n && (n = n.ownerDocument.body), n
    }

    function ef(e, t) {
        var n;
        let r = M(e);
        if (B(e)) return r;
        if (!V(e)) {
            let t = Z(e);
            for (; t && !q(t);) {
                if (F(t) && !es(t)) return t;
                t = Z(t)
            }
            return r
        }
        let i = ec(e, t);
        for (; i && (n = i, /^(table|td|th)$/.test(k(n))) && es(i);) i = ec(i, t);
        return i && q(i) && es(i) && !X(i) ? r : i || function(e) {
            let t = Z(e);
            for (; V(t) && !q(t);) {
                if (X(t)) return t;
                if (B(t)) break;
                t = Z(t)
            }
            return null
        }(e) || r
    }
    let ed = async function(e) {
        let t = this.getOffsetParent || ef,
            n = this.getDimensions,
            r = await n(e.floating);
        return {
            reference: function(e, t, n) {
                let r = V(t),
                    i = W(t),
                    o = "fixed" === n,
                    l = eo(e, !0, o, t),
                    a = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    s = u(0);
                if (r || !r && !o)
                    if (("body" !== k(t) || I(i)) && (a = Q(t)), r) {
                        let e = eo(t, !0, o, t);
                        s.x = e.x + t.clientLeft, s.y = e.y + t.clientTop
                    } else i && (s.x = el(i));
                o && !r && i && (s.x = el(i));
                let c = !i || r || o ? u(0) : ea(i, a);
                return {
                    x: l.left + a.scrollLeft - s.x - c.x,
                    y: l.top + a.scrollTop - s.y - c.y,
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
    }, ep = {
        convertOffsetParentRelativeRectToViewportRelativeRect: function(e) {
            let {
                elements: t,
                rect: n,
                offsetParent: r,
                strategy: i
            } = e, o = "fixed" === i, l = W(r), a = !!t && B(t.floating);
            if (r === l || a && o) return n;
            let s = {
                    scrollLeft: 0,
                    scrollTop: 0
                },
                c = u(1),
                f = u(0),
                d = V(r);
            if ((d || !d && !o) && (("body" !== k(r) || I(l)) && (s = Q(r)), d)) {
                let e = eo(r);
                c = en(r), f.x = e.x + r.clientLeft, f.y = e.y + r.clientTop
            }
            let p = !l || d || o ? u(0) : ea(l, s);
            return {
                width: n.width * c.x,
                height: n.height * c.y,
                x: n.x * c.x - s.scrollLeft * c.x + f.x + p.x,
                y: n.y * c.y - s.scrollTop * c.y + f.y + p.y
            }
        },
        getDocumentElement: W,
        getClippingRect: function(e) {
            let {
                element: t,
                boundary: n,
                rootBoundary: r,
                strategy: l
            } = e, a = [..."clippingAncestors" === n ? B(t) ? [] : function(e, t) {
                let n = t.get(e);
                if (n) return n;
                let r = G(e, [], !1).filter(e => F(e) && "body" !== k(e)),
                    i = null,
                    o = "fixed" === K(e).position,
                    l = o ? Z(e) : e;
                for (; F(l) && !q(l);) {
                    let t = K(l),
                        n = X(l);
                    n || "fixed" !== t.position || (i = null), (o ? n || i : !(!n && "static" === t.position && i && ("absolute" === i.position || "fixed" === i.position) || I(l) && !n && function e(t, n) {
                        let r = Z(t);
                        return !(r === n || !F(r) || q(r)) && ("fixed" === K(r).position || e(r, n))
                    }(e, l))) ? i = t : r = r.filter(e => e !== l), l = Z(l)
                }
                return t.set(e, r), r
            }(t, this._c) : [].concat(n), r], u = eu(t, a[0], l), s = u.top, c = u.right, f = u.bottom, d = u.left;
            for (let e = 1; e < a.length; e++) {
                let n = eu(t, a[e], l);
                s = o(n.top, s), c = i(n.right, c), f = i(n.bottom, f), d = o(n.left, d)
            }
            return {
                width: c - d,
                height: f - s,
                x: d,
                y: s
            }
        },
        getOffsetParent: ef,
        getElementRects: ed,
        getClientRects: function(e) {
            return Array.from(e.getClientRects())
        },
        getDimensions: function(e) {
            let {
                width: t,
                height: n
            } = ee(e);
            return {
                width: t,
                height: n
            }
        },
        getScale: en,
        isElement: F,
        isRTL: function(e) {
            return "rtl" === K(e).direction
        }
    };

    function eh(e, t) {
        return e.x === t.x && e.y === t.y && e.width === t.width && e.height === t.height
    }
    let em = function(e) {
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
                    } = t, u = await N(t, e);
                    return l === (null == (n = a.offset) ? void 0 : n.placement) && null != (r = a.arrow) && r.alignmentOffset ? {} : {
                        x: i + u.x,
                        y: o + u.y,
                        data: {
                            ...u,
                            placement: l
                        }
                    }
                }
            }
        },
        ev = function(e) {
            return void 0 === e && (e = {}), {
                name: "shift",
                options: e,
                async fn(t) {
                    let {
                        x: n,
                        y: r,
                        placement: l,
                        platform: a
                    } = t, {
                        mainAxis: u = !0,
                        crossAxis: s = !1,
                        limiter: d = {
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
                        ...h
                    } = c(e, t), v = {
                        x: n,
                        y: r
                    }, g = await a.detectOverflow(t, h), y = m(f(l)), w = p(y), x = v[w], b = v[y];
                    if (u) {
                        let e = "y" === w ? "top" : "left",
                            t = "y" === w ? "bottom" : "right",
                            n = x + g[e],
                            r = x - g[t];
                        x = o(n, i(x, r))
                    }
                    if (s) {
                        let e = "y" === y ? "top" : "left",
                            t = "y" === y ? "bottom" : "right",
                            n = b + g[e],
                            r = b - g[t];
                        b = o(n, i(b, r))
                    }
                    let E = d.fn({
                        ...t,
                        [w]: x,
                        [y]: b
                    });
                    return {
                        ...E,
                        data: {
                            x: E.x - n,
                            y: E.y - r,
                            enabled: {
                                [w]: u,
                                [y]: s
                            }
                        }
                    }
                }
            }
        },
        eg = function(e) {
            return void 0 === e && (e = {}), {
                name: "flip",
                options: e,
                async fn(t) {
                    var n, r, i, o, l;
                    let a, u, s, {
                            placement: p,
                            middlewareData: h,
                            rects: R,
                            initialPlacement: C,
                            platform: T,
                            elements: A
                        } = t,
                        {
                            mainAxis: O = !0,
                            crossAxis: P = !0,
                            fallbackPlacements: L,
                            fallbackStrategy: S = "bestFit",
                            fallbackAxisSideDirection: j = "none",
                            flipAlignment: N = !0,
                            ...D
                        } = c(e, t);
                    if (null != (n = h.arrow) && n.alignmentOffset) return {};
                    let k = f(p),
                        M = m(C),
                        W = f(C) === C,
                        _ = await (null == T.isRTL ? void 0 : T.isRTL(A.floating)),
                        F = L || (W || !N ? [E(C)] : (a = E(C), [g(C), a, g(a)])),
                        V = "none" !== j;
                    !L && V && F.push(...(u = d(C), s = function(e, t, n) {
                        switch (e) {
                            case "top":
                            case "bottom":
                                if (n) return t ? w : y;
                                return t ? y : w;
                            case "left":
                            case "right":
                                return t ? x : b;
                            default:
                                return []
                        }
                    }(f(C), "start" === j, _), u && (s = s.map(e => e + "-" + u), N && (s = s.concat(s.map(g)))), s));
                    let H = [C, ...F],
                        I = await T.detectOverflow(t, D),
                        B = [],
                        z = (null == (r = h.flip) ? void 0 : r.overflows) || [];
                    if (O && B.push(I[k]), P) {
                        let e = v(p, R, _);
                        B.push(I[e[0]], I[e[1]])
                    }
                    if (z = [...z, {
                            placement: p,
                            overflows: B
                        }], !B.every(e => e <= 0)) {
                        let e = ((null == (i = h.flip) ? void 0 : i.index) || 0) + 1,
                            t = H[e];
                        if (t && ("alignment" !== P || M === m(t) || z.every(e => m(e.placement) !== M || e.overflows[0] > 0))) return {
                            data: {
                                index: e,
                                overflows: z
                            },
                            reset: {
                                placement: t
                            }
                        };
                        let n = null == (o = z.filter(e => e.overflows[0] <= 0).sort((e, t) => e.overflows[1] - t.overflows[1])[0]) ? void 0 : o.placement;
                        if (!n) switch (S) {
                            case "bestFit": {
                                let e = null == (l = z.filter(e => {
                                    if (V) {
                                        let t = m(e.placement);
                                        return t === M || "y" === t
                                    }
                                    return !0
                                }).map(e => [e.placement, e.overflows.filter(e => e > 0).reduce((e, t) => e + t, 0)]).sort((e, t) => e[1] - t[1])[0]) ? void 0 : l[0];
                                e && (n = e);
                                break
                            }
                            case "initialPlacement":
                                n = C
                        }
                        if (p !== n) return {
                            reset: {
                                placement: n
                            }
                        }
                    }
                    return {}
                }
            }
        },
        ey = function(e) {
            return void 0 === e && (e = {}), {
                name: "size",
                options: e,
                async fn(t) {
                    var n, r;
                    let l, a, {
                            placement: u,
                            rects: s,
                            platform: p,
                            elements: h
                        } = t,
                        {
                            apply: v = () => {},
                            ...g
                        } = c(e, t),
                        y = await p.detectOverflow(t, g),
                        w = f(u),
                        x = d(u),
                        b = "y" === m(u),
                        {
                            width: E,
                            height: R
                        } = s.floating;
                    "top" === w || "bottom" === w ? (l = w, a = x === (await (null == p.isRTL ? void 0 : p.isRTL(h.floating)) ? "start" : "end") ? "left" : "right") : (a = w, l = "end" === x ? "top" : "bottom");
                    let C = R - y.top - y.bottom,
                        T = E - y.left - y.right,
                        A = i(R - y[l], C),
                        O = i(E - y[a], T),
                        P = !t.middlewareData.shift,
                        L = A,
                        S = O;
                    if (null != (n = t.middlewareData.shift) && n.enabled.x && (S = T), null != (r = t.middlewareData.shift) && r.enabled.y && (L = C), P && !x) {
                        let e = o(y.left, 0),
                            t = o(y.right, 0),
                            n = o(y.top, 0),
                            r = o(y.bottom, 0);
                        b ? S = E - 2 * (0 !== e || 0 !== t ? e + t : o(y.left, y.right)) : L = R - 2 * (0 !== n || 0 !== r ? n + r : o(y.top, y.bottom))
                    }
                    await v({
                        ...t,
                        availableWidth: S,
                        availableHeight: L
                    });
                    let j = await p.getDimensions(h.floating);
                    return E !== j.width || R !== j.height ? {
                        reset: {
                            rects: !0
                        }
                    } : {}
                }
            }
        },
        ew = function(e) {
            return void 0 === e && (e = {}), {
                name: "hide",
                options: e,
                async fn(t) {
                    let {
                        rects: n,
                        platform: r
                    } = t, {
                        strategy: i = "referenceHidden",
                        ...o
                    } = c(e, t);
                    switch (i) {
                        case "referenceHidden": {
                            let e = P(await r.detectOverflow(t, {
                                ...o,
                                elementContext: "reference"
                            }), n.reference);
                            return {
                                data: {
                                    referenceHiddenOffsets: e,
                                    referenceHidden: L(e)
                                }
                            }
                        }
                        case "escaped": {
                            let e = P(await r.detectOverflow(t, {
                                ...o,
                                altBoundary: !0
                            }), n.floating);
                            return {
                                data: {
                                    escapedOffsets: e,
                                    escaped: L(e)
                                }
                            }
                        }
                        default:
                            return {}
                    }
                }
            }
        },
        ex = e => ({
            name: "arrow",
            options: e,
            async fn(t) {
                let {
                    x: n,
                    y: r,
                    placement: l,
                    rects: a,
                    platform: u,
                    elements: s,
                    middlewareData: f
                } = t, {
                    element: v,
                    padding: g = 0
                } = c(e, t) || {};
                if (null == v) return {};
                let y = R(g),
                    w = {
                        x: n,
                        y: r
                    },
                    x = p(m(l)),
                    b = h(x),
                    E = await u.getDimensions(v),
                    C = "y" === x,
                    T = C ? "clientHeight" : "clientWidth",
                    A = a.reference[b] + a.reference[x] - w[x] - a.floating[b],
                    O = w[x] - a.reference[x],
                    P = await (null == u.getOffsetParent ? void 0 : u.getOffsetParent(v)),
                    L = P ? P[T] : 0;
                L && await (null == u.isElement ? void 0 : u.isElement(P)) || (L = s.floating[T] || a.floating[b]);
                let S = L / 2 - E[b] / 2 - 1,
                    j = i(y[C ? "top" : "left"], S),
                    N = i(y[C ? "bottom" : "right"], S),
                    D = L - E[b] - N,
                    k = L / 2 - E[b] / 2 + (A / 2 - O / 2),
                    M = o(j, i(k, D)),
                    W = !f.arrow && null != d(l) && k !== M && a.reference[b] / 2 - (k < j ? j : N) - E[b] / 2 < 0,
                    _ = W ? k < j ? k - j : k - D : 0;
                return {
                    [x]: w[x] + _,
                    data: {
                        [x]: M,
                        centerOffset: k - M - _,
                        ...W && {
                            alignmentOffset: _
                        }
                    },
                    reset: W
                }
            }
        }),
        eb = function(e) {
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
                        mainAxis: u = !0,
                        crossAxis: s = !0
                    } = c(e, t), d = {
                        x: n,
                        y: r
                    }, h = m(i), v = p(h), g = d[v], y = d[h], w = c(a, t), x = "number" == typeof w ? {
                        mainAxis: w,
                        crossAxis: 0
                    } : {
                        mainAxis: 0,
                        crossAxis: 0,
                        ...w
                    };
                    if (u) {
                        let e = "y" === v ? "height" : "width",
                            t = o.reference[v] - o.floating[e] + x.mainAxis,
                            n = o.reference[v] + o.reference[e] - x.mainAxis;
                        g < t ? g = t : g > n && (g = n)
                    }
                    if (s) {
                        var b, E;
                        let e = "y" === v ? "width" : "height",
                            t = j.has(f(i)),
                            n = o.reference[h] - o.floating[e] + (t && (null == (b = l.offset) ? void 0 : b[h]) || 0) + (t ? 0 : x.crossAxis),
                            r = o.reference[h] + o.reference[e] + (t ? 0 : (null == (E = l.offset) ? void 0 : E[h]) || 0) - (t ? x.crossAxis : 0);
                        y < n ? y = n : y > r && (y = r)
                    }
                    return {
                        [v]: g,
                        [h]: y
                    }
                }
            }
        },
        eE = (e, t, n) => {
            let r = new Map,
                i = {
                    platform: ep,
                    ...n
                },
                o = {
                    ...i.platform,
                    _c: r
                };
            return O(e, t, {
                ...i,
                platform: o
            })
        };
    e.s(["P", 0, ex, "p", 0, function(e) {
        return void 0 === e && (e = {}), {
            name: "autoPlacement",
            options: e,
            async fn(t) {
                var n, i, o, l;
                let {
                    rects: a,
                    middlewareData: u,
                    placement: s,
                    platform: p,
                    elements: h
                } = t, {
                    crossAxis: m = !1,
                    alignment: y,
                    allowedPlacements: w = r,
                    autoAlignment: x = !0,
                    ...b
                } = c(e, t), E = void 0 !== y || w === r ? ((l = y || null) ? [...w.filter(e => d(e) === l), ...w.filter(e => d(e) !== l)] : w.filter(e => f(e) === e)).filter(e => !l || d(e) === l || !!x && g(e) !== e) : w, R = await p.detectOverflow(t, b), C = (null == (n = u.autoPlacement) ? void 0 : n.index) || 0, T = E[C];
                if (null == T) return {};
                let A = v(T, a, await (null == p.isRTL ? void 0 : p.isRTL(h.floating)));
                if (s !== T) return {
                    reset: {
                        placement: E[0]
                    }
                };
                let O = [R[f(T)], R[A[0]], R[A[1]]],
                    P = [...(null == (i = u.autoPlacement) ? void 0 : i.overflows) || [], {
                        placement: T,
                        overflows: O
                    }],
                    L = E[C + 1];
                if (L) return {
                    data: {
                        index: C + 1,
                        overflows: P
                    },
                    reset: {
                        placement: L
                    }
                };
                let S = P.map(e => {
                        let t = d(e.placement);
                        return [e.placement, t && m ? e.overflows.slice(0, 2).reduce((e, t) => e + t, 0) : e.overflows[0], e.overflows]
                    }).sort((e, t) => e[1] - t[1]),
                    j = (null == (o = S.filter(e => e[2].slice(0, d(e[0]) ? 2 : 3).every(e => e <= 0))[0]) ? void 0 : o[0]) || S[0][0];
                return j !== s ? {
                    data: {
                        index: C + 1,
                        overflows: P
                    },
                    reset: {
                        placement: j
                    }
                } : {}
            }
        }
    }, "n", 0, function(e, t, n, r) {
        let l;
        void 0 === r && (r = {});
        let {
            ancestorScroll: u = !0,
            ancestorResize: s = !0,
            elementResize: c = "function" == typeof ResizeObserver,
            layoutShift: f = "function" == typeof IntersectionObserver,
            animationFrame: d = !1
        } = r, p = et(e), h = u || s ? [...p ? G(p) : [], ...t ? G(t) : []] : [];
        h.forEach(e => {
            u && e.addEventListener("scroll", n, {
                passive: !0
            }), s && e.addEventListener("resize", n)
        });
        let m = p && f ? function(e, t) {
                let n, r = null,
                    l = W(e);

                function u() {
                    var e;
                    clearTimeout(n), null == (e = r) || e.disconnect(), r = null
                }
                return ! function s(c, f) {
                    void 0 === c && (c = !1), void 0 === f && (f = 1), u();
                    let d = e.getBoundingClientRect(),
                        {
                            left: p,
                            top: h,
                            width: m,
                            height: v
                        } = d;
                    if (c || t(), !m || !v) return;
                    let g = {
                            rootMargin: -a(h) + "px " + -a(l.clientWidth - (p + m)) + "px " + -a(l.clientHeight - (h + v)) + "px " + -a(p) + "px",
                            threshold: o(0, i(1, f)) || 1
                        },
                        y = !0;

                    function w(t) {
                        let r = t[0].intersectionRatio;
                        if (r !== f) {
                            if (!y) return s();
                            r ? s(!1, r) : n = setTimeout(() => {
                                s(!1, 1e-7)
                            }, 1e3)
                        }
                        1 !== r || eh(d, e.getBoundingClientRect()) || s(), y = !1
                    }
                    try {
                        r = new IntersectionObserver(w, {
                            ...g,
                            root: l.ownerDocument
                        })
                    } catch (e) {
                        r = new IntersectionObserver(w, g)
                    }
                    r.observe(e)
                }(!0), u
            }(p, n) : null,
            v = -1,
            g = null;
        c && (g = new ResizeObserver(e => {
            let [r] = e;
            r && r.target === p && g && t && (g.unobserve(t), cancelAnimationFrame(v), v = requestAnimationFrame(() => {
                var e;
                null == (e = g) || e.observe(t)
            })), n()
        }), p && !d && g.observe(p), t && g.observe(t));
        let y = d ? eo(e) : null;
        return d && function t() {
            let r = eo(e);
            y && !eh(y, r) && n(), y = r, l = requestAnimationFrame(t)
        }(), n(), () => {
            var e;
            h.forEach(e => {
                u && e.removeEventListener("scroll", n), s && e.removeEventListener("resize", n)
            }), null == m || m(), null == (e = g) || e.disconnect(), g = null, d && cancelAnimationFrame(l)
        }
    }, "A", 0, eE, "x", 0, eg, "c", 0, ew, "g", 0, function(e) {
        return void 0 === e && (e = {}), {
            name: "inline",
            options: e,
            async fn(t) {
                let {
                    placement: n,
                    elements: r,
                    rects: l,
                    platform: a,
                    strategy: u
                } = t, {
                    padding: s = 2,
                    x: d,
                    y: p
                } = c(e, t), h = Array.from(await (null == a.getClientRects ? void 0 : a.getClientRects(r.reference)) || []), v = function(e) {
                    let t = e.slice().sort((e, t) => e.y - t.y),
                        n = [],
                        r = null;
                    for (let e = 0; e < t.length; e++) {
                        let i = t[e];
                        !r || i.y - r.y > r.height / 2 ? n.push([i]) : n[n.length - 1].push(i), r = i
                    }
                    return n.map(e => C(S(e)))
                }(h), g = C(S(h)), y = R(s), w = await a.getElementRects({
                    reference: {
                        getBoundingClientRect: function() {
                            if (2 === v.length && v[0].left > v[1].right && null != d && null != p) return v.find(e => d > e.left - y.left && d < e.right + y.right && p > e.top - y.top && p < e.bottom + y.bottom) || g;
                            if (v.length >= 2) {
                                if ("y" === m(n)) {
                                    let e = v[0],
                                        t = v[v.length - 1],
                                        r = "top" === f(n),
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
                                let e = "left" === f(n),
                                    t = o(...v.map(e => e.right)),
                                    r = i(...v.map(e => e.left)),
                                    l = v.filter(n => e ? n.left === r : n.right === t),
                                    a = l[0].top,
                                    u = l[l.length - 1].bottom;
                                return {
                                    top: a,
                                    bottom: u,
                                    left: r,
                                    right: t,
                                    width: t - r,
                                    height: u - a,
                                    x: r,
                                    y: a
                                }
                            }
                            return g
                        }
                    },
                    floating: r.floating,
                    strategy: u
                });
                return l.reference.x !== w.reference.x || l.reference.y !== w.reference.y || l.reference.width !== w.reference.width || l.reference.height !== w.reference.height ? {
                    reset: {
                        rects: w
                    }
                } : {}
            }
        }
    }, "o", 0, eb, "T", 0, em, "e", 0, ev, "q", 0, ey], 350303);
    var eR = e.i(643766),
        eC = e.i(860663),
        eT = "u" > typeof document ? eR.useLayoutEffect : function() {};

    function eA(e, t) {
        let n, r, i;
        if (e === t) return !0;
        if (typeof e != typeof t) return !1;
        if ("function" == typeof e && e.toString() === t.toString()) return !0;
        if (e && t && "object" == typeof e) {
            if (Array.isArray(e)) {
                if ((n = e.length) !== t.length) return !1;
                for (r = n; 0 != r--;)
                    if (!eA(e[r], t[r])) return !1;
                return !0
            }
            if ((n = (i = Object.keys(e)).length) !== Object.keys(t).length) return !1;
            for (r = n; 0 != r--;)
                if (!({}).hasOwnProperty.call(t, i[r])) return !1;
            for (r = n; 0 != r--;) {
                let n = i[r];
                if (("_owner" !== n || !e.$$typeof) && !eA(e[n], t[n])) return !1
            }
            return !0
        }
        return e != e && t != t
    }

    function eO(e) {
        return "u" < typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
    }

    function eP(e, t) {
        let n = eO(e);
        return Math.round(t * n) / n
    }

    function eL(e) {
        let t = eR.useRef(e);
        return eT(() => {
            t.current = e
        }), t
    }
    e.s(["P", 0, (e, t) => {
        let n = {
            name: "arrow",
            options: e,
            fn(t) {
                let {
                    element: n,
                    padding: r
                } = "function" == typeof e ? e(t) : e;
                return n && ({}).hasOwnProperty.call(n, "current") ? null != n.current ? ex({
                    element: n.current,
                    padding: r
                }).fn(t) : {} : n ? ex({
                    element: n,
                    padding: r
                }).fn(t) : {}
            }
        };
        return {
            name: n.name,
            fn: n.fn,
            options: [e, t]
        }
    }, "x", 0, (e, t) => {
        let n = eg(e);
        return {
            name: n.name,
            fn: n.fn,
            options: [e, t]
        }
    }, "c", 0, (e, t) => {
        let n = ew(e);
        return {
            name: n.name,
            fn: n.fn,
            options: [e, t]
        }
    }, "n", 0, (e, t) => ({
        fn: eb(e).fn,
        options: [e, t]
    }), "T", 0, (e, t) => {
        let n = em(e);
        return {
            name: n.name,
            fn: n.fn,
            options: [e, t]
        }
    }, "e", 0, (e, t) => {
        let n = ev(e);
        return {
            name: n.name,
            fn: n.fn,
            options: [e, t]
        }
    }, "o", 0, (e, t) => {
        let n = ey(e);
        return {
            name: n.name,
            fn: n.fn,
            options: [e, t]
        }
    }, "E", 0, function(e) {
        void 0 === e && (e = {});
        let {
            placement: t = "bottom",
            strategy: n = "absolute",
            middleware: r = [],
            platform: i,
            elements: {
                reference: o,
                floating: l
            } = {},
            transform: a = !0,
            whileElementsMounted: u,
            open: s
        } = e, [c, f] = eR.useState({
            x: 0,
            y: 0,
            strategy: n,
            placement: t,
            middlewareData: {},
            isPositioned: !1
        }), [d, p] = eR.useState(r);
        eA(d, r) || p(r);
        let [h, m] = eR.useState(null), [v, g] = eR.useState(null), y = eR.useCallback(e => {
            e !== E.current && (E.current = e, m(e))
        }, []), w = eR.useCallback(e => {
            e !== R.current && (R.current = e, g(e))
        }, []), x = o || h, b = l || v, E = eR.useRef(null), R = eR.useRef(null), C = eR.useRef(c), T = null != u, A = eL(u), O = eL(i), P = eL(s), L = eR.useCallback(() => {
            if (!E.current || !R.current) return;
            let e = {
                placement: t,
                strategy: n,
                middleware: d
            };
            O.current && (e.platform = O.current), eE(E.current, R.current, e).then(e => {
                let t = {
                    ...e,
                    isPositioned: !1 !== P.current
                };
                S.current && !eA(C.current, t) && (C.current = t, eC.flushSync(() => {
                    f(t)
                }))
            })
        }, [d, t, n, O, P]);
        eT(() => {
            !1 === s && C.current.isPositioned && (C.current.isPositioned = !1, f(e => ({
                ...e,
                isPositioned: !1
            })))
        }, [s]);
        let S = eR.useRef(!1);
        eT(() => (S.current = !0, () => {
            S.current = !1
        }), []), eT(() => {
            if (x && (E.current = x), b && (R.current = b), x && b) {
                if (A.current) return A.current(x, b, L);
                L()
            }
        }, [x, b, L, A, T]);
        let j = eR.useMemo(() => ({
                reference: E,
                floating: R,
                setReference: y,
                setFloating: w
            }), [y, w]),
            N = eR.useMemo(() => ({
                reference: x,
                floating: b
            }), [x, b]),
            D = eR.useMemo(() => {
                let e = {
                    position: n,
                    left: 0,
                    top: 0
                };
                if (!N.floating) return e;
                let t = eP(N.floating, c.x),
                    r = eP(N.floating, c.y);
                return a ? {
                    ...e,
                    transform: "translate(" + t + "px, " + r + "px)",
                    ...eO(N.floating) >= 1.5 && {
                        willChange: "transform"
                    }
                } : {
                    position: n,
                    left: t,
                    top: r
                }
            }, [n, a, N.floating, c.x, c.y]);
        return eR.useMemo(() => ({
            ...c,
            update: L,
            refs: j,
            elements: N,
            floatingStyles: D
        }), [c, L, j, N, D])
    }], 980891)
}, 754416, 983363, 987410, 169829, 729208, 806416, 819205, 620225, 820215, e => {
    "use strict";

    function t(e, t) {
        let {
            checkForDefaultPrevented: n = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(r) {
            if (null == e || e(r), !1 === n || !r.defaultPrevented) return null == t ? void 0 : t(r)
        }
    }
    e.s(["f", 0, t], 754416);
    var n, r, i = e.i(643766);

    function o(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function l() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        return e => {
            let n = !1,
                r = t.map(t => {
                    let r = o(t, e);
                    return n || "function" != typeof r || (n = !0), r
                });
            if (n) return () => {
                for (let e = 0; e < r.length; e++) {
                    let n = r[e];
                    "function" == typeof n ? n() : o(t[e], null)
                }
            }
        }
    }

    function a() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        return i.useCallback(l(...t), t)
    }
    e.s(["Q", 0, l, "j", 0, a], 983363);
    var u = e.i(785517);
    e.s(["f", 0, function(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
            n = [],
            r = () => {
                let t = n.map(e => i.createContext(e));
                return function(n) {
                    let r = (null == n ? void 0 : n[e]) || t;
                    return i.useMemo(() => ({
                        ["__scope".concat(e)]: {
                            ...n,
                            [e]: r
                        }
                    }), [n, r])
                }
            };
        return r.scopeName = e, [function(t, r) {
            let o = i.createContext(r),
                l = n.length;
            n = [...n, r];
            let a = t => {
                var n;
                let {
                    scope: r,
                    children: a,
                    ...s
                } = t, c = (null == r || null == (n = r[e]) ? void 0 : n[l]) || o, f = i.useMemo(() => s, Object.values(s));
                return (0, u.jsx)(c.Provider, {
                    value: f,
                    children: a
                })
            };
            return a.displayName = t + "Provider", [a, function(n, a) {
                var u;
                let s = (null == a || null == (u = a[e]) ? void 0 : u[l]) || o,
                    c = i.useContext(s);
                if (c) return c;
                if (void 0 !== r) return r;
                throw Error("`".concat(n, "` must be used within `").concat(t, "`"))
            }]
        }, function() {
            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
            let r = t[0];
            if (1 === t.length) return r;
            let o = () => {
                let e = t.map(e => ({
                    useScope: e(),
                    scopeName: e.scopeName
                }));
                return function(t) {
                    let n = e.reduce((e, n) => {
                        let {
                            useScope: r,
                            scopeName: i
                        } = n, o = r(t)["__scope".concat(i)];
                        return {
                            ...e,
                            ...o
                        }
                    }, {});
                    return i.useMemo(() => ({
                        ["__scope".concat(r.scopeName)]: n
                    }), [n])
                }
            };
            return o.scopeName = r.scopeName, o
        }(r, ...t)]
    }], 987410);
    var s = e.i(860663),
        c = i.forwardRef((e, t) => {
            let {
                children: n,
                ...r
            } = e, o = i.Children.toArray(n), l = o.find(p);
            if (l) {
                let e = l.props.children,
                    n = o.map(t => t !== l ? t : i.Children.count(e) > 1 ? i.Children.only(null) : i.isValidElement(e) ? e.props.children : null);
                return (0, u.jsx)(f, {
                    ...r,
                    ref: t,
                    children: i.isValidElement(e) ? i.cloneElement(e, void 0, n) : null
                })
            }
            return (0, u.jsx)(f, {
                ...r,
                ref: t,
                children: n
            })
        });
    c.displayName = "Slot";
    var f = i.forwardRef((e, t) => {
        let {
            children: n,
            ...r
        } = e;
        if (i.isValidElement(n)) {
            var o, a, u;
            let e, s, c = (s = (e = null == (a = Object.getOwnPropertyDescriptor((o = n).props, "ref")) ? void 0 : a.get) && "isReactWarning" in e && e.isReactWarning) ? o.ref : (s = (e = null == (u = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : u.get) && "isReactWarning" in e && e.isReactWarning) ? o.props.ref : o.props.ref || o.ref;
            return i.cloneElement(n, {
                ... function(e, t) {
                    let n = {
                        ...t
                    };
                    for (let r in t) {
                        let i = e[r],
                            o = t[r];
                        /^on[A-Z]/.test(r) ? i && o ? n[r] = function() {
                            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                            o(...t), i(...t)
                        } : i && (n[r] = i) : "style" === r ? n[r] = {
                            ...i,
                            ...o
                        } : "className" === r && (n[r] = [i, o].filter(Boolean).join(" "))
                    }
                    return {
                        ...e,
                        ...n
                    }
                }(r, n.props),
                ref: t ? l(t, c) : c
            })
        }
        return i.Children.count(n) > 1 ? i.Children.only(null) : null
    });
    f.displayName = "SlotClone";
    var d = e => {
        let {
            children: t
        } = e;
        return (0, u.jsx)(u.Fragment, {
            children: t
        })
    };

    function p(e) {
        return i.isValidElement(e) && e.type === d
    }
    e.s(["M", 0, c, "V", 0, d], 169829);
    var h = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, t) => {
        let n = i.forwardRef((e, n) => {
            let {
                asChild: r,
                ...i
            } = e, o = r ? c : t;
            return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, u.jsx)(o, {
                ...i,
                ref: n
            })
        });
        return n.displayName = "Primitive.".concat(t), {
            ...e,
            [t]: n
        }
    }, {});

    function m(e, t) {
        e && s.flushSync(() => e.dispatchEvent(t))
    }

    function v(e) {
        let t = i.useRef(e);
        return i.useEffect(() => {
            t.current = e
        }), i.useMemo(() => function() {
            for (var e, n = arguments.length, r = Array(n), i = 0; i < n; i++) r[i] = arguments[i];
            return null == (e = t.current) ? void 0 : e.call(t, ...r)
        }, [])
    }
    e.s(["V", 0, h, "u", 0, m], 729208), e.s(["f", 0, v], 806416);
    var g = "dismissableLayer.update",
        y = i.createContext({
            layers: new Set,
            layersWithOutsidePointerEventsDisabled: new Set,
            branches: new Set
        }),
        w = i.forwardRef((e, r) => {
            var o, l;
            let {
                disableOutsidePointerEvents: s = !1,
                onEscapeKeyDown: c,
                onPointerDownOutside: f,
                onFocusOutside: d,
                onInteractOutside: p,
                onDismiss: m,
                ...w
            } = e, E = i.useContext(y), [R, C] = i.useState(null), T = null != (o = null == R ? void 0 : R.ownerDocument) ? o : null == (l = globalThis) ? void 0 : l.document, [, A] = i.useState({}), O = a(r, e => C(e)), P = Array.from(E.layers), [L] = [...E.layersWithOutsidePointerEventsDisabled].slice(-1), S = P.indexOf(L), j = R ? P.indexOf(R) : -1, N = E.layersWithOutsidePointerEventsDisabled.size > 0, D = j >= S, k = function(e) {
                var t;
                let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    r = v(e),
                    o = i.useRef(!1),
                    l = i.useRef(() => {});
                return i.useEffect(() => {
                    let e = e => {
                            if (e.target && !o.current) {
                                let t = function() {
                                        b("dismissableLayer.pointerDownOutside", r, i, {
                                            discrete: !0
                                        })
                                    },
                                    i = {
                                        originalEvent: e
                                    };
                                "touch" === e.pointerType ? (n.removeEventListener("click", l.current), l.current = t, n.addEventListener("click", l.current, {
                                    once: !0
                                })) : t()
                            } else n.removeEventListener("click", l.current);
                            o.current = !1
                        },
                        t = window.setTimeout(() => {
                            n.addEventListener("pointerdown", e)
                        }, 0);
                    return () => {
                        window.clearTimeout(t), n.removeEventListener("pointerdown", e), n.removeEventListener("click", l.current)
                    }
                }, [n, r]), {
                    onPointerDownCapture: () => o.current = !0
                }
            }(e => {
                let t = e.target,
                    n = [...E.branches].some(e => e.contains(t));
                D && !n && (null == f || f(e), null == p || p(e), e.defaultPrevented || null == m || m())
            }, T), M = function(e) {
                var t;
                let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    r = v(e),
                    o = i.useRef(!1);
                return i.useEffect(() => {
                    let e = e => {
                        e.target && !o.current && b("dismissableLayer.focusOutside", r, {
                            originalEvent: e
                        }, {
                            discrete: !1
                        })
                    };
                    return n.addEventListener("focusin", e), () => n.removeEventListener("focusin", e)
                }, [n, r]), {
                    onFocusCapture: () => o.current = !0,
                    onBlurCapture: () => o.current = !1
                }
            }(e => {
                let t = e.target;
                ![...E.branches].some(e => e.contains(t)) && (null == d || d(e), null == p || p(e), e.defaultPrevented || null == m || m())
            }, T);
            return ! function(e) {
                var t;
                let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    r = v(e);
                i.useEffect(() => {
                    let e = e => {
                        "Escape" === e.key && r(e)
                    };
                    return n.addEventListener("keydown", e, {
                        capture: !0
                    }), () => n.removeEventListener("keydown", e, {
                        capture: !0
                    })
                }, [r, n])
            }(e => {
                j === E.layers.size - 1 && (null == c || c(e), !e.defaultPrevented && m && (e.preventDefault(), m()))
            }, T), i.useEffect(() => {
                if (R) return s && (0 === E.layersWithOutsidePointerEventsDisabled.size && (n = T.body.style.pointerEvents, T.body.style.pointerEvents = "none"), E.layersWithOutsidePointerEventsDisabled.add(R)), E.layers.add(R), x(), () => {
                    s && 1 === E.layersWithOutsidePointerEventsDisabled.size && (T.body.style.pointerEvents = n)
                }
            }, [R, T, s, E]), i.useEffect(() => () => {
                R && (E.layers.delete(R), E.layersWithOutsidePointerEventsDisabled.delete(R), x())
            }, [R, E]), i.useEffect(() => {
                let e = () => A({});
                return document.addEventListener(g, e), () => document.removeEventListener(g, e)
            }, []), (0, u.jsx)(h.div, {
                ...w,
                ref: O,
                style: {
                    pointerEvents: N ? D ? "auto" : "none" : void 0,
                    ...e.style
                },
                onFocusCapture: t(e.onFocusCapture, M.onFocusCapture),
                onBlurCapture: t(e.onBlurCapture, M.onBlurCapture),
                onPointerDownCapture: t(e.onPointerDownCapture, k.onPointerDownCapture)
            })
        });

    function x() {
        let e = new CustomEvent(g);
        document.dispatchEvent(e)
    }

    function b(e, t, n, r) {
        let {
            discrete: i
        } = r, o = n.originalEvent.target, l = new CustomEvent(e, {
            bubbles: !1,
            cancelable: !0,
            detail: n
        });
        t && o.addEventListener(e, t, {
            once: !0
        }), i ? m(o, l) : o.dispatchEvent(l)
    }
    w.displayName = "DismissableLayer", i.forwardRef((e, t) => {
        let n = i.useContext(y),
            r = i.useRef(null),
            o = a(t, r);
        return i.useEffect(() => {
            let e = r.current;
            if (e) return n.branches.add(e), () => {
                n.branches.delete(e)
            }
        }, [n.branches]), (0, u.jsx)(h.div, {
            ...e,
            ref: o
        })
    }).displayName = "DismissableLayerBranch", e.s(["f", 0, w], 819205);
    var E = (null == (r = globalThis) ? void 0 : r.document) ? i.useLayoutEffect : () => {};
    e.s(["f", 0, E], 620225);
    var R = i["useId".toString()] || (() => void 0),
        C = 0;
    e.s(["f", 0, function(e) {
        let [t, n] = i.useState(R());
        return E(() => {
            e || n(e => null != e ? e : String(C++))
        }, [e]), e || (t ? "radix-".concat(t) : "")
    }], 820215)
}, 950020, e => {
    "use strict";
    "u" > typeof window && window.document && window.document.createElement, e.s(["f", 0, function(e, t) {
        let {
            checkForDefaultPrevented: n = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(r) {
            if (null == e || e(r), !1 === n || !r.defaultPrevented) return null == t ? void 0 : t(r)
        }
    }])
}, 546633, 831153, e => {
    "use strict";
    var t = e.i(643766);
    e.i(860663);
    var n = e.i(120297),
        r = e.i(785517);

    function i(e) {
        var i;
        let o, a = (i = e, (o = t.forwardRef((e, r) => {
                let {
                    children: i,
                    ...o
                } = e;
                if (t.isValidElement(i)) {
                    var l, a, u;
                    let e, s, c = (s = (e = null == (a = Object.getOwnPropertyDescriptor((l = i).props, "ref")) ? void 0 : a.get) && "isReactWarning" in e && e.isReactWarning) ? l.ref : (s = (e = null == (u = Object.getOwnPropertyDescriptor(l, "ref")) ? void 0 : u.get) && "isReactWarning" in e && e.isReactWarning) ? l.props.ref : l.props.ref || l.ref,
                        f = function(e, t) {
                            let n = {
                                ...t
                            };
                            for (let r in t) {
                                let i = e[r],
                                    o = t[r];
                                /^on[A-Z]/.test(r) ? i && o ? n[r] = function() {
                                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                    let r = o(...t);
                                    return i(...t), r
                                } : i && (n[r] = i) : "style" === r ? n[r] = {
                                    ...i,
                                    ...o
                                } : "className" === r && (n[r] = [i, o].filter(Boolean).join(" "))
                            }
                            return {
                                ...e,
                                ...n
                            }
                        }(o, i.props);
                    return i.type !== t.Fragment && (f.ref = r ? (0, n.Q)(r, c) : c), t.cloneElement(i, f)
                }
                return t.Children.count(i) > 1 ? t.Children.only(null) : null
            })).displayName = "".concat(i, ".SlotClone"), o),
            u = t.forwardRef((e, n) => {
                let {
                    children: i,
                    ...o
                } = e, u = t.Children.toArray(i), s = u.find(l);
                if (s) {
                    let e = s.props.children,
                        i = u.map(n => n !== s ? n : t.Children.count(e) > 1 ? t.Children.only(null) : t.isValidElement(e) ? e.props.children : null);
                    return (0, r.jsx)(a, {
                        ...o,
                        ref: n,
                        children: t.isValidElement(e) ? t.cloneElement(e, void 0, i) : null
                    })
                }
                return (0, r.jsx)(a, {
                    ...o,
                    ref: n,
                    children: i
                })
            });
        return u.displayName = "".concat(e, ".Slot"), u
    }
    var o = Symbol("radix.slottable");

    function l(e) {
        return t.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === o
    }
    e.s(["f", 0, i], 831153);
    var a = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce((e, n) => {
        let o = i("Primitive.".concat(n)),
            l = t.forwardRef((e, t) => {
                let {
                    asChild: i,
                    ...l
                } = e;
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, r.jsx)(i ? o : n, {
                    ...l,
                    ref: t
                })
            });
        return l.displayName = "Primitive.".concat(n), {
            ...e,
            [n]: l
        }
    }, {});
    e.s(["f", 0, a], 546633)
}, 866491, e => {
    "use strict";
    var t = e.i(643766),
        n = e.i(754416),
        r = e.i(983363),
        i = e.i(987410),
        o = e.i(819205),
        l = e.i(820215),
        a = e.i(980891),
        u = e.i(350303),
        s = e.i(729208),
        c = e.i(785517),
        f = t.forwardRef((e, t) => {
            let {
                children: n,
                width: r = 10,
                height: i = 5,
                ...o
            } = e;
            return (0, c.jsx)(s.V.svg, {
                ...o,
                ref: t,
                width: r,
                height: i,
                viewBox: "0 0 30 10",
                preserveAspectRatio: "none",
                children: e.asChild ? n : (0, c.jsx)("polygon", {
                    points: "0,0 30,0 15,10"
                })
            })
        });
    f.displayName = "Arrow";
    var d = e.i(806416),
        p = e.i(620225),
        h = "Popper",
        [m, v] = (0, i.f)(h),
        [g, y] = m(h),
        w = e => {
            let {
                __scopePopper: n,
                children: r
            } = e, [i, o] = t.useState(null);
            return (0, c.jsx)(g, {
                scope: n,
                anchor: i,
                onAnchorChange: o,
                children: r
            })
        };
    w.displayName = h;
    var x = "PopperAnchor",
        b = t.forwardRef((e, n) => {
            let {
                __scopePopper: i,
                virtualRef: o,
                ...l
            } = e, a = y(x, i), u = t.useRef(null), f = (0, r.j)(n, u);
            return t.useEffect(() => {
                a.onAnchorChange((null == o ? void 0 : o.current) || u.current)
            }), o ? null : (0, c.jsx)(s.V.div, {
                ...l,
                ref: f
            })
        });
    b.displayName = x;
    var E = "PopperContent",
        [R, C] = m(E),
        T = t.forwardRef((e, n) => {
            var i, o, l, f, h, m, v, g;
            let {
                __scopePopper: w,
                side: x = "bottom",
                sideOffset: b = 0,
                align: C = "center",
                alignOffset: T = 0,
                arrowPadding: A = 0,
                avoidCollisions: O = !0,
                collisionBoundary: P = [],
                collisionPadding: N = 0,
                sticky: D = "partial",
                hideWhenDetached: k = !1,
                updatePositionStrategy: M = "optimized",
                onPlaced: W,
                ..._
            } = e, F = y(E, w), [V, H] = t.useState(null), I = (0, r.j)(n, e => H(e)), [B, z] = t.useState(null), U = function(e) {
                let [n, r] = t.useState(void 0);
                return (0, p.f)(() => {
                    if (e) {
                        r({
                            width: e.offsetWidth,
                            height: e.offsetHeight
                        });
                        let t = new ResizeObserver(t => {
                            let n, i;
                            if (!Array.isArray(t) || !t.length) return;
                            let o = t[0];
                            if ("borderBoxSize" in o) {
                                let e = o.borderBoxSize,
                                    t = Array.isArray(e) ? e[0] : e;
                                n = t.inlineSize, i = t.blockSize
                            } else n = e.offsetWidth, i = e.offsetHeight;
                            r({
                                width: n,
                                height: i
                            })
                        });
                        return t.observe(e, {
                            box: "border-box"
                        }), () => t.unobserve(e)
                    }
                    r(void 0)
                }, [e]), n
            }(B), Y = null != (i = null == U ? void 0 : U.width) ? i : 0, X = null != (o = null == U ? void 0 : U.height) ? o : 0, $ = "number" == typeof N ? N : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...N
            }, q = Array.isArray(P) ? P : [P], K = q.length > 0, Q = {
                padding: $,
                boundary: q.filter(L),
                altBoundary: K
            }, {
                refs: Z,
                floatingStyles: G,
                placement: J,
                isPositioned: ee,
                middlewareData: et
            } = (0, a.E)({
                strategy: "fixed",
                placement: x + ("center" !== C ? "-" + C : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return (0, u.n)(...t, {
                        animationFrame: "always" === M
                    })
                },
                elements: {
                    reference: F.anchor
                },
                middleware: [(0, a.T)({
                    mainAxis: b + X,
                    alignmentAxis: T
                }), O && (0, a.e)({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === D ? (0, a.n)() : void 0,
                    ...Q
                }), O && (0, a.x)({
                    ...Q
                }), (0, a.o)({
                    ...Q,
                    apply: e => {
                        let {
                            elements: t,
                            rects: n,
                            availableWidth: r,
                            availableHeight: i
                        } = e, {
                            width: o,
                            height: l
                        } = n.reference, a = t.floating.style;
                        a.setProperty("--radix-popper-available-width", "".concat(r, "px")), a.setProperty("--radix-popper-available-height", "".concat(i, "px")), a.setProperty("--radix-popper-anchor-width", "".concat(o, "px")), a.setProperty("--radix-popper-anchor-height", "".concat(l, "px"))
                    }
                }), B && (0, a.P)({
                    element: B,
                    padding: A
                }), S({
                    arrowWidth: Y,
                    arrowHeight: X
                }), k && (0, a.c)({
                    strategy: "referenceHidden",
                    ...Q
                })]
            }), [en, er] = j(J), ei = (0, d.f)(W);
            (0, p.f)(() => {
                ee && (null == ei || ei())
            }, [ee, ei]);
            let eo = null == (l = et.arrow) ? void 0 : l.x,
                el = null == (f = et.arrow) ? void 0 : f.y,
                ea = (null == (h = et.arrow) ? void 0 : h.centerOffset) !== 0,
                [eu, es] = t.useState();
            return (0, p.f)(() => {
                V && es(window.getComputedStyle(V).zIndex)
            }, [V]), (0, c.jsx)("div", {
                ref: Z.setFloating,
                "data-radix-popper-content-wrapper": "",
                style: {
                    ...G,
                    transform: ee ? G.transform : "translate(0, -200%)",
                    minWidth: "max-content",
                    zIndex: eu,
                    "--radix-popper-transform-origin": [null == (m = et.transformOrigin) ? void 0 : m.x, null == (v = et.transformOrigin) ? void 0 : v.y].join(" "),
                    ...(null == (g = et.hide) ? void 0 : g.referenceHidden) && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, c.jsx)(R, {
                    scope: w,
                    placedSide: en,
                    onArrowChange: z,
                    arrowX: eo,
                    arrowY: el,
                    shouldHideArrow: ea,
                    children: (0, c.jsx)(s.V.div, {
                        "data-side": en,
                        "data-align": er,
                        ..._,
                        ref: I,
                        style: {
                            ..._.style,
                            animation: ee ? void 0 : "none"
                        }
                    })
                })
            })
        });
    T.displayName = E;
    var A = "PopperArrow",
        O = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        P = t.forwardRef(function(e, t) {
            let {
                __scopePopper: n,
                ...r
            } = e, i = C(A, n), o = O[i.placedSide];
            return (0, c.jsx)("span", {
                ref: i.onArrowChange,
                style: {
                    position: "absolute",
                    left: i.arrowX,
                    top: i.arrowY,
                    [o]: 0,
                    transformOrigin: {
                        top: "",
                        right: "0 0",
                        bottom: "center 0",
                        left: "100% 0"
                    } [i.placedSide],
                    transform: {
                        top: "translateY(100%)",
                        right: "translateY(50%) rotate(90deg) translateX(-50%)",
                        bottom: "rotate(180deg)",
                        left: "translateY(50%) rotate(-90deg) translateX(50%)"
                    } [i.placedSide],
                    visibility: i.shouldHideArrow ? "hidden" : void 0
                },
                children: (0, c.jsx)(f, {
                    ...r,
                    ref: t,
                    style: {
                        ...r.style,
                        display: "block"
                    }
                })
            })
        });

    function L(e) {
        return null !== e
    }
    P.displayName = A;
    var S = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            var n, r, i, o, l;
            let {
                placement: a,
                rects: u,
                middlewareData: s
            } = t, c = (null == (i = s.arrow) ? void 0 : i.centerOffset) !== 0, f = c ? 0 : e.arrowWidth, d = c ? 0 : e.arrowHeight, [p, h] = j(a), m = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [h], v = (null != (n = null == (o = s.arrow) ? void 0 : o.x) ? n : 0) + f / 2, g = (null != (r = null == (l = s.arrow) ? void 0 : l.y) ? r : 0) + d / 2, y = "", w = "";
            return "bottom" === p ? (y = c ? m : "".concat(v, "px"), w = "".concat(-d, "px")) : "top" === p ? (y = c ? m : "".concat(v, "px"), w = "".concat(u.floating.height + d, "px")) : "right" === p ? (y = "".concat(-d, "px"), w = c ? m : "".concat(g, "px")) : "left" === p && (y = "".concat(u.floating.width + d, "px"), w = c ? m : "".concat(g, "px")), {
                data: {
                    x: y,
                    y: w
                }
            }
        }
    });

    function j(e) {
        let [t, n = "center"] = e.split("-");
        return [t, n]
    }
    var N = e.i(860663),
        D = t.forwardRef((e, n) => {
            var r, i;
            let {
                container: o,
                ...l
            } = e, [a, u] = t.useState(!1);
            (0, p.f)(() => u(!0), []);
            let f = o || a && (null == (i = globalThis) || null == (r = i.document) ? void 0 : r.body);
            return f ? N.default.createPortal((0, c.jsx)(s.V.div, {
                ...l,
                ref: n
            }), f) : null
        });
    D.displayName = "Portal";
    var k = e => {
        var n, i, o;
        let l, a, {
                present: u,
                children: s
            } = e,
            c = function(e) {
                var n, r;
                let [i, o] = t.useState(), l = t.useRef({}), a = t.useRef(e), u = t.useRef("none"), [s, c] = (n = e ? "mounted" : "unmounted", r = {
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
                }, t.useReducer((e, t) => {
                    let n = r[e][t];
                    return null != n ? n : e
                }, n));
                return t.useEffect(() => {
                    let e = M(l.current);
                    u.current = "mounted" === s ? e : "none"
                }, [s]), (0, p.f)(() => {
                    let t = l.current,
                        n = a.current;
                    if (n !== e) {
                        let r = u.current,
                            i = M(t);
                        e ? c("MOUNT") : "none" === i || (null == t ? void 0 : t.display) === "none" ? c("UNMOUNT") : n && r !== i ? c("ANIMATION_OUT") : c("UNMOUNT"), a.current = e
                    }
                }, [e, c]), (0, p.f)(() => {
                    if (i) {
                        var e;
                        let t, n = null != (e = i.ownerDocument.defaultView) ? e : window,
                            r = e => {
                                let r = M(l.current).includes(e.animationName);
                                if (e.target === i && r && (c("ANIMATION_END"), !a.current)) {
                                    let e = i.style.animationFillMode;
                                    i.style.animationFillMode = "forwards", t = n.setTimeout(() => {
                                        "forwards" === i.style.animationFillMode && (i.style.animationFillMode = e)
                                    })
                                }
                            },
                            o = e => {
                                e.target === i && (u.current = M(l.current))
                            };
                        return i.addEventListener("animationstart", o), i.addEventListener("animationcancel", r), i.addEventListener("animationend", r), () => {
                            n.clearTimeout(t), i.removeEventListener("animationstart", o), i.removeEventListener("animationcancel", r), i.removeEventListener("animationend", r)
                        }
                    }
                    c("ANIMATION_END")
                }, [i, c]), {
                    isPresent: ["mounted", "unmountSuspended"].includes(s),
                    ref: t.useCallback(e => {
                        e && (l.current = getComputedStyle(e)), o(e)
                    }, [])
                }
            }(u),
            f = "function" == typeof s ? s({
                present: c.isPresent
            }) : t.Children.only(s),
            d = (0, r.j)(c.ref, (a = (l = null == (i = Object.getOwnPropertyDescriptor((n = f).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? n.ref : (a = (l = null == (o = Object.getOwnPropertyDescriptor(n, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? n.props.ref : n.props.ref || n.ref);
        return "function" == typeof s || c.isPresent ? t.cloneElement(f, {
            ref: d
        }) : null
    };

    function M(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    k.displayName = "Presence";
    var W = e.i(169829),
        _ = t.forwardRef((e, t) => (0, c.jsx)(s.V.span, {
            ...e,
            ref: t,
            style: {
                position: "absolute",
                border: 0,
                width: 1,
                height: 1,
                padding: 0,
                margin: -1,
                overflow: "hidden",
                clip: "rect(0, 0, 0, 0)",
                whiteSpace: "nowrap",
                wordWrap: "normal",
                ...e.style
            }
        }));
    _.displayName = "VisuallyHidden";
    var [F, V] = (0, i.f)("Tooltip", [v]), H = v(), I = "TooltipProvider", B = "tooltip.open", [z, U] = F(I), Y = e => {
        let {
            __scopeTooltip: n,
            delayDuration: r = 700,
            skipDelayDuration: i = 300,
            disableHoverableContent: o = !1,
            children: l
        } = e, [a, u] = t.useState(!0), s = t.useRef(!1), f = t.useRef(0);
        return t.useEffect(() => {
            let e = f.current;
            return () => window.clearTimeout(e)
        }, []), (0, c.jsx)(z, {
            scope: n,
            isOpenDelayed: a,
            delayDuration: r,
            onOpen: t.useCallback(() => {
                window.clearTimeout(f.current), u(!1)
            }, []),
            onClose: t.useCallback(() => {
                window.clearTimeout(f.current), f.current = window.setTimeout(() => u(!0), i)
            }, [i]),
            isPointerInTransitRef: s,
            onPointerInTransitChange: t.useCallback(e => {
                s.current = e
            }, []),
            disableHoverableContent: o,
            children: l
        })
    };
    Y.displayName = I;
    var X = "Tooltip",
        [$, q] = F(X),
        K = e => {
            let {
                __scopeTooltip: n,
                children: r,
                open: i,
                defaultOpen: o = !1,
                onOpenChange: a,
                disableHoverableContent: u,
                delayDuration: s
            } = e, f = U(X, e.__scopeTooltip), p = H(n), [h, m] = t.useState(null), v = (0, l.f)(), g = t.useRef(0), y = null != u ? u : f.disableHoverableContent, x = null != s ? s : f.delayDuration, b = t.useRef(!1), [E = !1, R] = function(e) {
                let {
                    prop: n,
                    defaultProp: r,
                    onChange: i = () => {}
                } = e, [o, l] = function(e) {
                    let {
                        defaultProp: n,
                        onChange: r
                    } = e, i = t.useState(n), [o] = i, l = t.useRef(o), a = (0, d.f)(r);
                    return t.useEffect(() => {
                        l.current !== o && (a(o), l.current = o)
                    }, [o, l, a]), i
                }({
                    defaultProp: r,
                    onChange: i
                }), a = void 0 !== n, u = a ? n : o, s = (0, d.f)(i);
                return [u, t.useCallback(e => {
                    if (a) {
                        let t = "function" == typeof e ? e(n) : e;
                        t !== n && s(t)
                    } else l(e)
                }, [a, n, l, s])]
            }({
                prop: i,
                defaultProp: o,
                onChange: e => {
                    e ? (f.onOpen(), document.dispatchEvent(new CustomEvent(B))) : f.onClose(), null == a || a(e)
                }
            }), C = t.useMemo(() => E ? b.current ? "delayed-open" : "instant-open" : "closed", [E]), T = t.useCallback(() => {
                window.clearTimeout(g.current), g.current = 0, b.current = !1, R(!0)
            }, [R]), A = t.useCallback(() => {
                window.clearTimeout(g.current), g.current = 0, R(!1)
            }, [R]), O = t.useCallback(() => {
                window.clearTimeout(g.current), g.current = window.setTimeout(() => {
                    b.current = !0, R(!0), g.current = 0
                }, x)
            }, [x, R]);
            return t.useEffect(() => () => {
                g.current && (window.clearTimeout(g.current), g.current = 0)
            }, []), (0, c.jsx)(w, {
                ...p,
                children: (0, c.jsx)($, {
                    scope: n,
                    contentId: v,
                    open: E,
                    stateAttribute: C,
                    trigger: h,
                    onTriggerChange: m,
                    onTriggerEnter: t.useCallback(() => {
                        f.isOpenDelayed ? O() : T()
                    }, [f.isOpenDelayed, O, T]),
                    onTriggerLeave: t.useCallback(() => {
                        y ? A() : (window.clearTimeout(g.current), g.current = 0)
                    }, [A, y]),
                    onOpen: T,
                    onClose: A,
                    disableHoverableContent: y,
                    children: r
                })
            })
        };
    K.displayName = X;
    var Q = "TooltipTrigger",
        Z = t.forwardRef((e, i) => {
            let {
                __scopeTooltip: o,
                ...l
            } = e, a = q(Q, o), u = U(Q, o), f = H(o), d = t.useRef(null), p = (0, r.j)(i, d, a.onTriggerChange), h = t.useRef(!1), m = t.useRef(!1), v = t.useCallback(() => h.current = !1, []);
            return t.useEffect(() => () => document.removeEventListener("pointerup", v), [v]), (0, c.jsx)(b, {
                asChild: !0,
                ...f,
                children: (0, c.jsx)(s.V.button, {
                    "aria-describedby": a.open ? a.contentId : void 0,
                    "data-state": a.stateAttribute,
                    ...l,
                    ref: p,
                    onPointerMove: (0, n.f)(e.onPointerMove, e => {
                        "touch" !== e.pointerType && (m.current || u.isPointerInTransitRef.current || (a.onTriggerEnter(), m.current = !0))
                    }),
                    onPointerLeave: (0, n.f)(e.onPointerLeave, () => {
                        a.onTriggerLeave(), m.current = !1
                    }),
                    onPointerDown: (0, n.f)(e.onPointerDown, () => {
                        h.current = !0, document.addEventListener("pointerup", v, {
                            once: !0
                        })
                    }),
                    onFocus: (0, n.f)(e.onFocus, () => {
                        h.current || a.onOpen()
                    }),
                    onBlur: (0, n.f)(e.onBlur, a.onClose),
                    onClick: (0, n.f)(e.onClick, a.onClose)
                })
            })
        });
    Z.displayName = Q;
    var G = "TooltipPortal",
        [J, ee] = F(G, {
            forceMount: void 0
        }),
        et = e => {
            let {
                __scopeTooltip: t,
                forceMount: n,
                children: r,
                container: i
            } = e, o = q(G, t);
            return (0, c.jsx)(J, {
                scope: t,
                forceMount: n,
                children: (0, c.jsx)(k, {
                    present: n || o.open,
                    children: (0, c.jsx)(D, {
                        asChild: !0,
                        container: i,
                        children: r
                    })
                })
            })
        };
    et.displayName = G;
    var en = "TooltipContent",
        er = t.forwardRef((e, t) => {
            let n = ee(en, e.__scopeTooltip),
                {
                    forceMount: r = n.forceMount,
                    side: i = "top",
                    ...o
                } = e,
                l = q(en, e.__scopeTooltip);
            return (0, c.jsx)(k, {
                present: r || l.open,
                children: l.disableHoverableContent ? (0, c.jsx)(ea, {
                    side: i,
                    ...o,
                    ref: t
                }) : (0, c.jsx)(ei, {
                    side: i,
                    ...o,
                    ref: t
                })
            })
        }),
        ei = t.forwardRef((e, n) => {
            let i = q(en, e.__scopeTooltip),
                o = U(en, e.__scopeTooltip),
                l = t.useRef(null),
                a = (0, r.j)(n, l),
                [u, s] = t.useState(null),
                {
                    trigger: f,
                    onClose: d
                } = i,
                p = l.current,
                {
                    onPointerInTransitChange: h
                } = o,
                m = t.useCallback(() => {
                    s(null), h(!1)
                }, [h]),
                v = t.useCallback((e, t) => {
                    let n, r = e.currentTarget,
                        i = {
                            x: e.clientX,
                            y: e.clientY
                        },
                        o = function(e, t) {
                            let n = Math.abs(t.top - e.y),
                                r = Math.abs(t.bottom - e.y),
                                i = Math.abs(t.right - e.x),
                                o = Math.abs(t.left - e.x);
                            switch (Math.min(n, r, i, o)) {
                                case o:
                                    return "left";
                                case i:
                                    return "right";
                                case n:
                                    return "top";
                                case r:
                                    return "bottom";
                                default:
                                    throw Error("unreachable")
                            }
                        }(i, r.getBoundingClientRect());
                    s(((n = [... function(e, t) {
                        let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 5,
                            r = [];
                        switch (t) {
                            case "top":
                                r.push({
                                    x: e.x - n,
                                    y: e.y + n
                                }, {
                                    x: e.x + n,
                                    y: e.y + n
                                });
                                break;
                            case "bottom":
                                r.push({
                                    x: e.x - n,
                                    y: e.y - n
                                }, {
                                    x: e.x + n,
                                    y: e.y - n
                                });
                                break;
                            case "left":
                                r.push({
                                    x: e.x + n,
                                    y: e.y - n
                                }, {
                                    x: e.x + n,
                                    y: e.y + n
                                });
                                break;
                            case "right":
                                r.push({
                                    x: e.x - n,
                                    y: e.y - n
                                }, {
                                    x: e.x - n,
                                    y: e.y + n
                                })
                        }
                        return r
                    }(i, o), ... function(e) {
                        let {
                            top: t,
                            right: n,
                            bottom: r,
                            left: i
                        } = e;
                        return [{
                            x: i,
                            y: t
                        }, {
                            x: n,
                            y: t
                        }, {
                            x: n,
                            y: r
                        }, {
                            x: i,
                            y: r
                        }]
                    }(t.getBoundingClientRect())].slice()).sort((e, t) => e.x < t.x ? -1 : e.x > t.x ? 1 : e.y < t.y ? -1 : 1 * !!(e.y > t.y)), function(e) {
                        if (e.length <= 1) return e.slice();
                        let t = [];
                        for (let n = 0; n < e.length; n++) {
                            let r = e[n];
                            for (; t.length >= 2;) {
                                let e = t[t.length - 1],
                                    n = t[t.length - 2];
                                if ((e.x - n.x) * (r.y - n.y) >= (e.y - n.y) * (r.x - n.x)) t.pop();
                                else break
                            }
                            t.push(r)
                        }
                        t.pop();
                        let n = [];
                        for (let t = e.length - 1; t >= 0; t--) {
                            let r = e[t];
                            for (; n.length >= 2;) {
                                let e = n[n.length - 1],
                                    t = n[n.length - 2];
                                if ((e.x - t.x) * (r.y - t.y) >= (e.y - t.y) * (r.x - t.x)) n.pop();
                                else break
                            }
                            n.push(r)
                        }
                        return (n.pop(), 1 === t.length && 1 === n.length && t[0].x === n[0].x && t[0].y === n[0].y) ? t : t.concat(n)
                    }(n))), h(!0)
                }, [h]);
            return t.useEffect(() => () => m(), [m]), t.useEffect(() => {
                if (f && p) {
                    let e = e => v(e, p),
                        t = e => v(e, f);
                    return f.addEventListener("pointerleave", e), p.addEventListener("pointerleave", t), () => {
                        f.removeEventListener("pointerleave", e), p.removeEventListener("pointerleave", t)
                    }
                }
            }, [f, p, v, m]), t.useEffect(() => {
                if (u) {
                    let e = e => {
                        let t = e.target,
                            n = {
                                x: e.clientX,
                                y: e.clientY
                            },
                            r = (null == f ? void 0 : f.contains(t)) || (null == p ? void 0 : p.contains(t)),
                            i = ! function(e, t) {
                                let {
                                    x: n,
                                    y: r
                                } = e, i = !1;
                                for (let e = 0, o = t.length - 1; e < t.length; o = e++) {
                                    let l = t[e].x,
                                        a = t[e].y,
                                        u = t[o].x,
                                        s = t[o].y;
                                    a > r != s > r && n < (u - l) * (r - a) / (s - a) + l && (i = !i)
                                }
                                return i
                            }(n, u);
                        r ? m() : i && (m(), d())
                    };
                    return document.addEventListener("pointermove", e), () => document.removeEventListener("pointermove", e)
                }
            }, [f, p, u, d, m]), (0, c.jsx)(ea, {
                ...e,
                ref: a
            })
        }),
        [eo, el] = F(X, {
            isInside: !1
        }),
        ea = t.forwardRef((e, n) => {
            let {
                __scopeTooltip: r,
                children: i,
                "aria-label": l,
                onEscapeKeyDown: a,
                onPointerDownOutside: u,
                ...s
            } = e, f = q(en, r), d = H(r), {
                onClose: p
            } = f;
            return t.useEffect(() => (document.addEventListener(B, p), () => document.removeEventListener(B, p)), [p]), t.useEffect(() => {
                if (f.trigger) {
                    let e = e => {
                        let t = e.target;
                        (null == t ? void 0 : t.contains(f.trigger)) && p()
                    };
                    return window.addEventListener("scroll", e, {
                        capture: !0
                    }), () => window.removeEventListener("scroll", e, {
                        capture: !0
                    })
                }
            }, [f.trigger, p]), (0, c.jsx)(o.f, {
                asChild: !0,
                disableOutsidePointerEvents: !1,
                onEscapeKeyDown: a,
                onPointerDownOutside: u,
                onFocusOutside: e => e.preventDefault(),
                onDismiss: p,
                children: (0, c.jsxs)(T, {
                    "data-state": f.stateAttribute,
                    ...d,
                    ...s,
                    ref: n,
                    style: {
                        ...s.style,
                        "--radix-tooltip-content-transform-origin": "var(--radix-popper-transform-origin)",
                        "--radix-tooltip-content-available-width": "var(--radix-popper-available-width)",
                        "--radix-tooltip-content-available-height": "var(--radix-popper-available-height)",
                        "--radix-tooltip-trigger-width": "var(--radix-popper-anchor-width)",
                        "--radix-tooltip-trigger-height": "var(--radix-popper-anchor-height)"
                    },
                    children: [(0, c.jsx)(W.V, {
                        children: i
                    }), (0, c.jsx)(eo, {
                        scope: r,
                        isInside: !0,
                        children: (0, c.jsx)(_, {
                            id: f.contentId,
                            role: "tooltip",
                            children: l || i
                        })
                    })]
                })
            })
        });
    er.displayName = en;
    var eu = "TooltipArrow",
        es = t.forwardRef((e, t) => {
            let {
                __scopeTooltip: n,
                ...r
            } = e, i = H(n);
            return el(eu, n).isInside ? null : (0, c.jsx)(P, {
                ...i,
                ...r,
                ref: t
            })
        });
    es.displayName = eu, e.s(["j", 0, es, "c", 0, er, "z", 0, et, "g", 0, Y, "F", 0, K, "d", 0, Z], 866491)
}, 517952, e => {
    "use strict";
    var t = e.i(643766),
        n = e.i(206350);
    t[" useEffectEvent ".trim().toString()], t[" useInsertionEffect ".trim().toString()];
    var r = t[" useInsertionEffect ".trim().toString()] || n.f;
    Symbol("RADIX:SYNC_STATE"), e.s(["f", 0, function(e) {
        let {
            prop: n,
            defaultProp: i,
            onChange: o = () => {},
            caller: l
        } = e, [a, u, s] = function(e) {
            let {
                defaultProp: n,
                onChange: i
            } = e, [o, l] = t.useState(n), a = t.useRef(o), u = t.useRef(i);
            return r(() => {
                u.current = i
            }, [i]), t.useEffect(() => {
                if (a.current !== o) {
                    var e;
                    null == (e = u.current) || e.call(u, o), a.current = o
                }
            }, [o, a]), [o, l, u]
        }({
            defaultProp: i,
            onChange: o
        }), c = void 0 !== n, f = c ? n : a;
        {
            let e = t.useRef(void 0 !== n);
            t.useEffect(() => {
                let t = e.current;
                if (t !== c) {
                    let e = c ? "controlled" : "uncontrolled";
                    console.warn("".concat(l, " is changing from ").concat(t ? "controlled" : "uncontrolled", " to ").concat(e, ". Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component."))
                }
                e.current = c
            }, [c, l])
        }
        return [f, t.useCallback(e => {
            if (c) {
                let r = "function" == typeof e ? e(n) : e;
                if (r !== n) {
                    var t;
                    null == (t = s.current) || t.call(s, r)
                }
            } else u(e)
        }, [c, n, u, s])]
    }], 517952)
}, 179510, e => {
    "use strict";
    var t = e.i(643766);
    e.s(["f", 0, function(e) {
        let n = t.useRef({
            value: e,
            previous: e
        });
        return t.useMemo(() => (n.current.value !== e && (n.current.previous = n.current.value, n.current.value = e), n.current.previous), [e])
    }])
}, 842769, e => {
    "use strict";
    var t = e.i(643766),
        n = e.i(206350);
    e.s(["f", 0, function(e) {
        let [r, i] = t.useState(void 0);
        return (0, n.f)(() => {
            if (e) {
                i({
                    width: e.offsetWidth,
                    height: e.offsetHeight
                });
                let t = new ResizeObserver(t => {
                    let n, r;
                    if (!Array.isArray(t) || !t.length) return;
                    let o = t[0];
                    if ("borderBoxSize" in o) {
                        let e = o.borderBoxSize,
                            t = Array.isArray(e) ? e[0] : e;
                        n = t.inlineSize, r = t.blockSize
                    } else n = e.offsetWidth, r = e.offsetHeight;
                    i({
                        width: n,
                        height: r
                    })
                });
                return t.observe(e, {
                    box: "border-box"
                }), () => t.unobserve(e)
            }
            i(void 0)
        }, [e]), r
    }])
}]);

//# debugId=22bf4213-3705-1d18-af3a-4853fd5e5842
//# sourceMappingURL=0bbu7gi1-1qrf.js.map