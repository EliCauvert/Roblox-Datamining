;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "cc87dfe2-60de-807e-13a4-795c6b2b5a5c")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 297452, 992486, e => {
    "use strict";
    let t, r = ["top", "right", "bottom", "left"],
        n = r.reduce((e, t) => e.concat(t, t + "-start", t + "-end"), []),
        o = Math.min,
        i = Math.max,
        l = Math.round,
        a = Math.floor,
        s = e => ({
            x: e,
            y: e
        }),
        u = {
            left: "right",
            right: "left",
            bottom: "top",
            top: "bottom"
        };

    function c(e, t) {
        return "function" == typeof e ? e(t) : e
    }

    function d(e) {
        return e.split("-")[0]
    }

    function f(e) {
        return e.split("-")[1]
    }

    function p(e) {
        return "x" === e ? "y" : "x"
    }

    function m(e) {
        return "y" === e ? "height" : "width"
    }

    function v(e) {
        let t = e[0];
        return "t" === t || "b" === t ? "y" : "x"
    }

    function h(e, t, r) {
        void 0 === r && (r = !1);
        let n = f(e),
            o = p(v(e)),
            i = m(o),
            l = "x" === o ? n === (r ? "end" : "start") ? "right" : "left" : "start" === n ? "bottom" : "top";
        return t.reference[i] > t.floating[i] && (l = C(l)), [l, C(l)]
    }

    function g(e) {
        return e.includes("start") ? e.replace("start", "end") : e.replace("end", "start")
    }
    let y = ["left", "right"],
        w = ["right", "left"],
        x = ["top", "bottom"],
        b = ["bottom", "top"];

    function C(e) {
        let t = d(e);
        return u[t] + e.slice(t.length)
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

    function E(e) {
        let {
            x: t,
            y: r,
            width: n,
            height: o
        } = e;
        return {
            width: n,
            height: o,
            top: r,
            left: t,
            right: t + n,
            bottom: r + o,
            x: t,
            y: r
        }
    }

    function S(e, t, r) {
        let n, {
                reference: o,
                floating: i
            } = e,
            l = v(t),
            a = p(v(t)),
            s = m(a),
            u = d(t),
            c = "y" === l,
            h = o.x + o.width / 2 - i.width / 2,
            g = o.y + o.height / 2 - i.height / 2,
            y = o[s] / 2 - i[s] / 2;
        switch (u) {
            case "top":
                n = {
                    x: h,
                    y: o.y - i.height
                };
                break;
            case "bottom":
                n = {
                    x: h,
                    y: o.y + o.height
                };
                break;
            case "right":
                n = {
                    x: o.x + o.width,
                    y: g
                };
                break;
            case "left":
                n = {
                    x: o.x - i.width,
                    y: g
                };
                break;
            default:
                n = {
                    x: o.x,
                    y: o.y
                }
        }
        switch (f(t)) {
            case "start":
                n[a] -= y * (r && c ? -1 : 1);
                break;
            case "end":
                n[a] += y * (r && c ? -1 : 1)
        }
        return n
    }
    async function P(e, t) {
        var r;
        void 0 === t && (t = {});
        let {
            x: n,
            y: o,
            platform: i,
            rects: l,
            elements: a,
            strategy: s
        } = e, {
            boundary: u = "clippingAncestors",
            rootBoundary: d = "viewport",
            elementContext: f = "floating",
            altBoundary: p = !1,
            padding: m = 0
        } = c(t, e), v = R(m), h = a[p ? "floating" === f ? "reference" : "floating" : f], g = E(await i.getClippingRect({
            element: null == (r = await (null == i.isElement ? void 0 : i.isElement(h))) || r ? h : h.contextElement || await (null == i.getDocumentElement ? void 0 : i.getDocumentElement(a.floating)),
            boundary: u,
            rootBoundary: d,
            strategy: s
        })), y = "floating" === f ? {
            x: n,
            y: o,
            width: l.floating.width,
            height: l.floating.height
        } : l.reference, w = await (null == i.getOffsetParent ? void 0 : i.getOffsetParent(a.floating)), x = await (null == i.isElement ? void 0 : i.isElement(w)) && await (null == i.getScale ? void 0 : i.getScale(w)) || {
            x: 1,
            y: 1
        }, b = E(i.convertOffsetParentRelativeRectToViewportRelativeRect ? await i.convertOffsetParentRelativeRectToViewportRelativeRect({
            elements: a,
            rect: y,
            offsetParent: w,
            strategy: s
        }) : y);
        return {
            top: (g.top - b.top + v.top) / x.y,
            bottom: (b.bottom - g.bottom + v.bottom) / x.y,
            left: (g.left - b.left + v.left) / x.x,
            right: (b.right - g.right + v.right) / x.x
        }
    }
    let A = async (e, t, r) => {
        let {
            placement: n = "bottom",
            strategy: o = "absolute",
            middleware: i = [],
            platform: l
        } = r, a = l.detectOverflow ? l : {
            ...l,
            detectOverflow: P
        }, s = await (null == l.isRTL ? void 0 : l.isRTL(t)), u = await l.getElementRects({
            reference: e,
            floating: t,
            strategy: o
        }), {
            x: c,
            y: d
        } = S(u, n, s), f = n, p = 0, m = {};
        for (let r = 0; r < i.length; r++) {
            let v = i[r];
            if (!v) continue;
            let {
                name: h,
                fn: g
            } = v, {
                x: y,
                y: w,
                data: x,
                reset: b
            } = await g({
                x: c,
                y: d,
                initialPlacement: n,
                placement: f,
                strategy: o,
                middlewareData: m,
                rects: u,
                platform: a,
                elements: {
                    reference: e,
                    floating: t
                }
            });
            c = null != y ? y : c, d = null != w ? w : d, m[h] = {
                ...m[h],
                ...x
            }, b && p < 50 && (p++, "object" == typeof b && (b.placement && (f = b.placement), b.rects && (u = !0 === b.rects ? await l.getElementRects({
                reference: e,
                floating: t,
                strategy: o
            }) : b.rects), {
                x: c,
                y: d
            } = S(u, f, s)), r = -1)
        }
        return {
            x: c,
            y: d,
            placement: f,
            strategy: o,
            middlewareData: m
        }
    };

    function T(e, t) {
        return {
            top: e.top - t.height,
            right: e.right - t.width,
            bottom: e.bottom - t.height,
            left: e.left - t.width
        }
    }

    function j(e) {
        return r.some(t => e[t] >= 0)
    }

    function L(e) {
        let t = o(...e.map(e => e.left)),
            r = o(...e.map(e => e.top));
        return {
            x: t,
            y: r,
            width: i(...e.map(e => e.right)) - t,
            height: i(...e.map(e => e.bottom)) - r
        }
    }
    let O = new Set(["left", "top"]);
    async function N(e, t) {
        let {
            placement: r,
            platform: n,
            elements: o
        } = e, i = await (null == n.isRTL ? void 0 : n.isRTL(o.floating)), l = d(r), a = f(r), s = "y" === v(r), u = O.has(l) ? -1 : 1, p = i && s ? -1 : 1, m = c(t, e), {
            mainAxis: h,
            crossAxis: g,
            alignmentAxis: y
        } = "number" == typeof m ? {
            mainAxis: m,
            crossAxis: 0,
            alignmentAxis: null
        } : {
            mainAxis: m.mainAxis || 0,
            crossAxis: m.crossAxis || 0,
            alignmentAxis: m.alignmentAxis
        };
        return a && "number" == typeof y && (g = "end" === a ? -1 * y : y), s ? {
            x: g * p,
            y: h * u
        } : {
            x: h * u,
            y: g * p
        }
    }

    function D() {
        return "u" > typeof window
    }

    function k(e) {
        return H(e) ? (e.nodeName || "").toLowerCase() : "#document"
    }

    function I(e) {
        var t;
        return (null == e || null == (t = e.ownerDocument) ? void 0 : t.defaultView) || window
    }

    function M(e) {
        var t;
        return null == (t = (H(e) ? e.ownerDocument : e.document) || window.document) ? void 0 : t.documentElement
    }

    function H(e) {
        return !!D() && (e instanceof Node || e instanceof I(e).Node)
    }

    function F(e) {
        return !!D() && (e instanceof Element || e instanceof I(e).Element)
    }

    function _(e) {
        return !!D() && (e instanceof HTMLElement || e instanceof I(e).HTMLElement)
    }

    function B(e) {
        return !(!D() || "u" < typeof ShadowRoot) && (e instanceof ShadowRoot || e instanceof I(e).ShadowRoot)
    }

    function W(e) {
        let {
            overflow: t,
            overflowX: r,
            overflowY: n,
            display: o
        } = q(e);
        return /auto|scroll|overlay|hidden|clip/.test(t + n + r) && "inline" !== o && "contents" !== o
    }

    function z(e) {
        try {
            if (e.matches(":popover-open")) return !0
        } catch (e) {}
        try {
            return e.matches(":modal")
        } catch (e) {
            return !1
        }
    }
    let V = /transform|translate|scale|rotate|perspective|filter/,
        U = /paint|layout|strict|content/,
        K = e => !!e && "none" !== e;

    function Y(e) {
        let t = F(e) ? q(e) : e;
        return K(t.transform) || K(t.translate) || K(t.scale) || K(t.rotate) || K(t.perspective) || !X() && (K(t.backdropFilter) || K(t.filter)) || V.test(t.willChange || "") || U.test(t.contain || "")
    }

    function X() {
        return null == t && (t = "u" > typeof CSS && CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")), t
    }

    function G(e) {
        return /^(html|body|#document)$/.test(k(e))
    }

    function q(e) {
        return I(e).getComputedStyle(e)
    }

    function Z(e) {
        return F(e) ? {
            scrollLeft: e.scrollLeft,
            scrollTop: e.scrollTop
        } : {
            scrollLeft: e.scrollX,
            scrollTop: e.scrollY
        }
    }

    function $(e) {
        if ("html" === k(e)) return e;
        let t = e.assignedSlot || e.parentNode || B(e) && e.host || M(e);
        return B(t) ? t.host : t
    }

    function J(e, t, r) {
        var n;
        void 0 === t && (t = []), void 0 === r && (r = !0);
        let o = function e(t) {
                let r = $(t);
                return G(r) ? t.ownerDocument ? t.ownerDocument.body : t.body : _(r) && W(r) ? r : e(r)
            }(e),
            i = o === (null == (n = e.ownerDocument) ? void 0 : n.body),
            l = I(o);
        if (!i) return t.concat(o, J(o, [], r));
        {
            let e = Q(l);
            return t.concat(l, l.visualViewport || [], W(o) ? o : [], e && r ? J(e) : [])
        }
    }

    function Q(e) {
        return e.parent && Object.getPrototypeOf(e.parent) ? e.frameElement : null
    }

    function ee(e) {
        let t = q(e),
            r = parseFloat(t.width) || 0,
            n = parseFloat(t.height) || 0,
            o = _(e),
            i = o ? e.offsetWidth : r,
            a = o ? e.offsetHeight : n,
            s = l(r) !== i || l(n) !== a;
        return s && (r = i, n = a), {
            width: r,
            height: n,
            $: s
        }
    }

    function et(e) {
        return F(e) ? e : e.contextElement
    }

    function er(e) {
        let t = et(e);
        if (!_(t)) return s(1);
        let r = t.getBoundingClientRect(),
            {
                width: n,
                height: o,
                $: i
            } = ee(t),
            a = (i ? l(r.width) : r.width) / n,
            u = (i ? l(r.height) : r.height) / o;
        return a && Number.isFinite(a) || (a = 1), u && Number.isFinite(u) || (u = 1), {
            x: a,
            y: u
        }
    }
    let en = s(0);

    function eo(e) {
        let t = I(e);
        return X() && t.visualViewport ? {
            x: t.visualViewport.offsetLeft,
            y: t.visualViewport.offsetTop
        } : en
    }

    function ei(e, t, r, n) {
        var o;
        void 0 === t && (t = !1), void 0 === r && (r = !1);
        let i = e.getBoundingClientRect(),
            l = et(e),
            a = s(1);
        t && (n ? F(n) && (a = er(n)) : a = er(e));
        let u = (void 0 === (o = r) && (o = !1), n && (!o || n === I(l)) && o) ? eo(l) : s(0),
            c = (i.left + u.x) / a.x,
            d = (i.top + u.y) / a.y,
            f = i.width / a.x,
            p = i.height / a.y;
        if (l) {
            let e = I(l),
                t = n && F(n) ? I(n) : n,
                r = e,
                o = Q(r);
            for (; o && n && t !== r;) {
                let e = er(o),
                    t = o.getBoundingClientRect(),
                    n = q(o),
                    i = t.left + (o.clientLeft + parseFloat(n.paddingLeft)) * e.x,
                    l = t.top + (o.clientTop + parseFloat(n.paddingTop)) * e.y;
                c *= e.x, d *= e.y, f *= e.x, p *= e.y, c += i, d += l, o = Q(r = I(o))
            }
        }
        return E({
            width: f,
            height: p,
            x: c,
            y: d
        })
    }

    function el(e, t) {
        let r = Z(e).scrollLeft;
        return t ? t.left + r : ei(M(e)).left + r
    }

    function ea(e, t) {
        let r = e.getBoundingClientRect();
        return {
            x: r.left + t.scrollLeft - el(e, r),
            y: r.top + t.scrollTop
        }
    }

    function es(e, t, r) {
        var n;
        let o;
        if ("viewport" === t) o = function(e, t) {
            let r = I(e),
                n = M(e),
                o = r.visualViewport,
                i = n.clientWidth,
                l = n.clientHeight,
                a = 0,
                s = 0;
            if (o) {
                i = o.width, l = o.height;
                let e = X();
                (!e || e && "fixed" === t) && (a = o.offsetLeft, s = o.offsetTop)
            }
            let u = el(n);
            if (u <= 0) {
                let e = n.ownerDocument,
                    t = e.body,
                    r = getComputedStyle(t),
                    o = "CSS1Compat" === e.compatMode && parseFloat(r.marginLeft) + parseFloat(r.marginRight) || 0,
                    l = Math.abs(n.clientWidth - t.clientWidth - o);
                l <= 25 && (i -= l)
            } else u <= 25 && (i += u);
            return {
                width: i,
                height: l,
                x: a,
                y: s
            }
        }(e, r);
        else if ("document" === t) {
            let t, r, l, a, s, u, c;
            n = M(e), t = M(n), r = Z(n), l = n.ownerDocument.body, a = i(t.scrollWidth, t.clientWidth, l.scrollWidth, l.clientWidth), s = i(t.scrollHeight, t.clientHeight, l.scrollHeight, l.clientHeight), u = -r.scrollLeft + el(n), c = -r.scrollTop, "rtl" === q(l).direction && (u += i(t.clientWidth, l.clientWidth) - a), o = {
                width: a,
                height: s,
                x: u,
                y: c
            }
        } else if (F(t)) {
            let e, n, i, l, a, u;
            n = (e = ei(t, !0, "fixed" === r)).top + t.clientTop, i = e.left + t.clientLeft, l = _(t) ? er(t) : s(1), a = t.clientWidth * l.x, u = t.clientHeight * l.y, o = {
                width: a,
                height: u,
                x: i * l.x,
                y: n * l.y
            }
        } else {
            let r = eo(e);
            o = {
                x: t.x - r.x,
                y: t.y - r.y,
                width: t.width,
                height: t.height
            }
        }
        return E(o)
    }

    function eu(e) {
        return "static" === q(e).position
    }

    function ec(e, t) {
        if (!_(e) || "fixed" === q(e).position) return null;
        if (t) return t(e);
        let r = e.offsetParent;
        return M(e) === r && (r = r.ownerDocument.body), r
    }

    function ed(e, t) {
        var r;
        let n = I(e);
        if (z(e)) return n;
        if (!_(e)) {
            let t = $(e);
            for (; t && !G(t);) {
                if (F(t) && !eu(t)) return t;
                t = $(t)
            }
            return n
        }
        let o = ec(e, t);
        for (; o && (r = o, /^(table|td|th)$/.test(k(r))) && eu(o);) o = ec(o, t);
        return o && G(o) && eu(o) && !Y(o) ? n : o || function(e) {
            let t = $(e);
            for (; _(t) && !G(t);) {
                if (Y(t)) return t;
                if (z(t)) break;
                t = $(t)
            }
            return null
        }(e) || n
    }
    let ef = async function(e) {
        let t = this.getOffsetParent || ed,
            r = this.getDimensions,
            n = await r(e.floating);
        return {
            reference: function(e, t, r) {
                let n = _(t),
                    o = M(t),
                    i = "fixed" === r,
                    l = ei(e, !0, i, t),
                    a = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    u = s(0);
                if (n || !n && !i)
                    if (("body" !== k(t) || W(o)) && (a = Z(t)), n) {
                        let e = ei(t, !0, i, t);
                        u.x = e.x + t.clientLeft, u.y = e.y + t.clientTop
                    } else o && (u.x = el(o));
                i && !n && o && (u.x = el(o));
                let c = !o || n || i ? s(0) : ea(o, a);
                return {
                    x: l.left + a.scrollLeft - u.x - c.x,
                    y: l.top + a.scrollTop - u.y - c.y,
                    width: l.width,
                    height: l.height
                }
            }(e.reference, await t(e.floating), e.strategy),
            floating: {
                x: 0,
                y: 0,
                width: n.width,
                height: n.height
            }
        }
    }, ep = {
        convertOffsetParentRelativeRectToViewportRelativeRect: function(e) {
            let {
                elements: t,
                rect: r,
                offsetParent: n,
                strategy: o
            } = e, i = "fixed" === o, l = M(n), a = !!t && z(t.floating);
            if (n === l || a && i) return r;
            let u = {
                    scrollLeft: 0,
                    scrollTop: 0
                },
                c = s(1),
                d = s(0),
                f = _(n);
            if ((f || !f && !i) && (("body" !== k(n) || W(l)) && (u = Z(n)), f)) {
                let e = ei(n);
                c = er(n), d.x = e.x + n.clientLeft, d.y = e.y + n.clientTop
            }
            let p = !l || f || i ? s(0) : ea(l, u);
            return {
                width: r.width * c.x,
                height: r.height * c.y,
                x: r.x * c.x - u.scrollLeft * c.x + d.x + p.x,
                y: r.y * c.y - u.scrollTop * c.y + d.y + p.y
            }
        },
        getDocumentElement: M,
        getClippingRect: function(e) {
            let {
                element: t,
                boundary: r,
                rootBoundary: n,
                strategy: l
            } = e, a = [..."clippingAncestors" === r ? z(t) ? [] : function(e, t) {
                let r = t.get(e);
                if (r) return r;
                let n = J(e, [], !1).filter(e => F(e) && "body" !== k(e)),
                    o = null,
                    i = "fixed" === q(e).position,
                    l = i ? $(e) : e;
                for (; F(l) && !G(l);) {
                    let t = q(l),
                        r = Y(l);
                    r || "fixed" !== t.position || (o = null), (i ? r || o : !(!r && "static" === t.position && o && ("absolute" === o.position || "fixed" === o.position) || W(l) && !r && function e(t, r) {
                        let n = $(t);
                        return !(n === r || !F(n) || G(n)) && ("fixed" === q(n).position || e(n, r))
                    }(e, l))) ? o = t : n = n.filter(e => e !== l), l = $(l)
                }
                return t.set(e, n), n
            }(t, this._c) : [].concat(r), n], s = es(t, a[0], l), u = s.top, c = s.right, d = s.bottom, f = s.left;
            for (let e = 1; e < a.length; e++) {
                let r = es(t, a[e], l);
                u = i(r.top, u), c = o(r.right, c), d = o(r.bottom, d), f = i(r.left, f)
            }
            return {
                width: c - f,
                height: d - u,
                x: f,
                y: u
            }
        },
        getOffsetParent: ed,
        getElementRects: ef,
        getClientRects: function(e) {
            return Array.from(e.getClientRects())
        },
        getDimensions: function(e) {
            let {
                width: t,
                height: r
            } = ee(e);
            return {
                width: t,
                height: r
            }
        },
        getScale: er,
        isElement: F,
        isRTL: function(e) {
            return "rtl" === q(e).direction
        }
    };

    function em(e, t) {
        return e.x === t.x && e.y === t.y && e.width === t.width && e.height === t.height
    }
    let ev = function(e) {
            return void 0 === e && (e = 0), {
                name: "offset",
                options: e,
                async fn(t) {
                    var r, n;
                    let {
                        x: o,
                        y: i,
                        placement: l,
                        middlewareData: a
                    } = t, s = await N(t, e);
                    return l === (null == (r = a.offset) ? void 0 : r.placement) && null != (n = a.arrow) && n.alignmentOffset ? {} : {
                        x: o + s.x,
                        y: i + s.y,
                        data: {
                            ...s,
                            placement: l
                        }
                    }
                }
            }
        },
        eh = function(e) {
            return void 0 === e && (e = {}), {
                name: "shift",
                options: e,
                async fn(t) {
                    let {
                        x: r,
                        y: n,
                        placement: l,
                        platform: a
                    } = t, {
                        mainAxis: s = !0,
                        crossAxis: u = !1,
                        limiter: f = {
                            fn: e => {
                                let {
                                    x: t,
                                    y: r
                                } = e;
                                return {
                                    x: t,
                                    y: r
                                }
                            }
                        },
                        ...m
                    } = c(e, t), h = {
                        x: r,
                        y: n
                    }, g = await a.detectOverflow(t, m), y = v(d(l)), w = p(y), x = h[w], b = h[y];
                    if (s) {
                        let e = "y" === w ? "top" : "left",
                            t = "y" === w ? "bottom" : "right",
                            r = x + g[e],
                            n = x - g[t];
                        x = i(r, o(x, n))
                    }
                    if (u) {
                        let e = "y" === y ? "top" : "left",
                            t = "y" === y ? "bottom" : "right",
                            r = b + g[e],
                            n = b - g[t];
                        b = i(r, o(b, n))
                    }
                    let C = f.fn({
                        ...t,
                        [w]: x,
                        [y]: b
                    });
                    return {
                        ...C,
                        data: {
                            x: C.x - r,
                            y: C.y - n,
                            enabled: {
                                [w]: s,
                                [y]: u
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
                    var r, n, o, i, l;
                    let a, s, u, {
                            placement: p,
                            middlewareData: m,
                            rects: R,
                            initialPlacement: E,
                            platform: S,
                            elements: P
                        } = t,
                        {
                            mainAxis: A = !0,
                            crossAxis: T = !0,
                            fallbackPlacements: j,
                            fallbackStrategy: L = "bestFit",
                            fallbackAxisSideDirection: O = "none",
                            flipAlignment: N = !0,
                            ...D
                        } = c(e, t);
                    if (null != (r = m.arrow) && r.alignmentOffset) return {};
                    let k = d(p),
                        I = v(E),
                        M = d(E) === E,
                        H = await (null == S.isRTL ? void 0 : S.isRTL(P.floating)),
                        F = j || (M || !N ? [C(E)] : (a = C(E), [g(E), a, g(a)])),
                        _ = "none" !== O;
                    !j && _ && F.push(...(s = f(E), u = function(e, t, r) {
                        switch (e) {
                            case "top":
                            case "bottom":
                                if (r) return t ? w : y;
                                return t ? y : w;
                            case "left":
                            case "right":
                                return t ? x : b;
                            default:
                                return []
                        }
                    }(d(E), "start" === O, H), s && (u = u.map(e => e + "-" + s), N && (u = u.concat(u.map(g)))), u));
                    let B = [E, ...F],
                        W = await S.detectOverflow(t, D),
                        z = [],
                        V = (null == (n = m.flip) ? void 0 : n.overflows) || [];
                    if (A && z.push(W[k]), T) {
                        let e = h(p, R, H);
                        z.push(W[e[0]], W[e[1]])
                    }
                    if (V = [...V, {
                            placement: p,
                            overflows: z
                        }], !z.every(e => e <= 0)) {
                        let e = ((null == (o = m.flip) ? void 0 : o.index) || 0) + 1,
                            t = B[e];
                        if (t && ("alignment" !== T || I === v(t) || V.every(e => v(e.placement) !== I || e.overflows[0] > 0))) return {
                            data: {
                                index: e,
                                overflows: V
                            },
                            reset: {
                                placement: t
                            }
                        };
                        let r = null == (i = V.filter(e => e.overflows[0] <= 0).sort((e, t) => e.overflows[1] - t.overflows[1])[0]) ? void 0 : i.placement;
                        if (!r) switch (L) {
                            case "bestFit": {
                                let e = null == (l = V.filter(e => {
                                    if (_) {
                                        let t = v(e.placement);
                                        return t === I || "y" === t
                                    }
                                    return !0
                                }).map(e => [e.placement, e.overflows.filter(e => e > 0).reduce((e, t) => e + t, 0)]).sort((e, t) => e[1] - t[1])[0]) ? void 0 : l[0];
                                e && (r = e);
                                break
                            }
                            case "initialPlacement":
                                r = E
                        }
                        if (p !== r) return {
                            reset: {
                                placement: r
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
                    var r, n;
                    let l, a, {
                            placement: s,
                            rects: u,
                            platform: p,
                            elements: m
                        } = t,
                        {
                            apply: h = () => {},
                            ...g
                        } = c(e, t),
                        y = await p.detectOverflow(t, g),
                        w = d(s),
                        x = f(s),
                        b = "y" === v(s),
                        {
                            width: C,
                            height: R
                        } = u.floating;
                    "top" === w || "bottom" === w ? (l = w, a = x === (await (null == p.isRTL ? void 0 : p.isRTL(m.floating)) ? "start" : "end") ? "left" : "right") : (a = w, l = "end" === x ? "top" : "bottom");
                    let E = R - y.top - y.bottom,
                        S = C - y.left - y.right,
                        P = o(R - y[l], E),
                        A = o(C - y[a], S),
                        T = !t.middlewareData.shift,
                        j = P,
                        L = A;
                    if (null != (r = t.middlewareData.shift) && r.enabled.x && (L = S), null != (n = t.middlewareData.shift) && n.enabled.y && (j = E), T && !x) {
                        let e = i(y.left, 0),
                            t = i(y.right, 0),
                            r = i(y.top, 0),
                            n = i(y.bottom, 0);
                        b ? L = C - 2 * (0 !== e || 0 !== t ? e + t : i(y.left, y.right)) : j = R - 2 * (0 !== r || 0 !== n ? r + n : i(y.top, y.bottom))
                    }
                    await h({
                        ...t,
                        availableWidth: L,
                        availableHeight: j
                    });
                    let O = await p.getDimensions(m.floating);
                    return C !== O.width || R !== O.height ? {
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
                        rects: r,
                        platform: n
                    } = t, {
                        strategy: o = "referenceHidden",
                        ...i
                    } = c(e, t);
                    switch (o) {
                        case "referenceHidden": {
                            let e = T(await n.detectOverflow(t, {
                                ...i,
                                elementContext: "reference"
                            }), r.reference);
                            return {
                                data: {
                                    referenceHiddenOffsets: e,
                                    referenceHidden: j(e)
                                }
                            }
                        }
                        case "escaped": {
                            let e = T(await n.detectOverflow(t, {
                                ...i,
                                altBoundary: !0
                            }), r.floating);
                            return {
                                data: {
                                    escapedOffsets: e,
                                    escaped: j(e)
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
                    x: r,
                    y: n,
                    placement: l,
                    rects: a,
                    platform: s,
                    elements: u,
                    middlewareData: d
                } = t, {
                    element: h,
                    padding: g = 0
                } = c(e, t) || {};
                if (null == h) return {};
                let y = R(g),
                    w = {
                        x: r,
                        y: n
                    },
                    x = p(v(l)),
                    b = m(x),
                    C = await s.getDimensions(h),
                    E = "y" === x,
                    S = E ? "clientHeight" : "clientWidth",
                    P = a.reference[b] + a.reference[x] - w[x] - a.floating[b],
                    A = w[x] - a.reference[x],
                    T = await (null == s.getOffsetParent ? void 0 : s.getOffsetParent(h)),
                    j = T ? T[S] : 0;
                j && await (null == s.isElement ? void 0 : s.isElement(T)) || (j = u.floating[S] || a.floating[b]);
                let L = j / 2 - C[b] / 2 - 1,
                    O = o(y[E ? "top" : "left"], L),
                    N = o(y[E ? "bottom" : "right"], L),
                    D = j - C[b] - N,
                    k = j / 2 - C[b] / 2 + (P / 2 - A / 2),
                    I = i(O, o(k, D)),
                    M = !d.arrow && null != f(l) && k !== I && a.reference[b] / 2 - (k < O ? O : N) - C[b] / 2 < 0,
                    H = M ? k < O ? k - O : k - D : 0;
                return {
                    [x]: w[x] + H,
                    data: {
                        [x]: I,
                        centerOffset: k - I - H,
                        ...M && {
                            alignmentOffset: H
                        }
                    },
                    reset: M
                }
            }
        }),
        eb = function(e) {
            return void 0 === e && (e = {}), {
                options: e,
                fn(t) {
                    let {
                        x: r,
                        y: n,
                        placement: o,
                        rects: i,
                        middlewareData: l
                    } = t, {
                        offset: a = 0,
                        mainAxis: s = !0,
                        crossAxis: u = !0
                    } = c(e, t), f = {
                        x: r,
                        y: n
                    }, m = v(o), h = p(m), g = f[h], y = f[m], w = c(a, t), x = "number" == typeof w ? {
                        mainAxis: w,
                        crossAxis: 0
                    } : {
                        mainAxis: 0,
                        crossAxis: 0,
                        ...w
                    };
                    if (s) {
                        let e = "y" === h ? "height" : "width",
                            t = i.reference[h] - i.floating[e] + x.mainAxis,
                            r = i.reference[h] + i.reference[e] - x.mainAxis;
                        g < t ? g = t : g > r && (g = r)
                    }
                    if (u) {
                        var b, C;
                        let e = "y" === h ? "width" : "height",
                            t = O.has(d(o)),
                            r = i.reference[m] - i.floating[e] + (t && (null == (b = l.offset) ? void 0 : b[m]) || 0) + (t ? 0 : x.crossAxis),
                            n = i.reference[m] + i.reference[e] + (t ? 0 : (null == (C = l.offset) ? void 0 : C[m]) || 0) - (t ? x.crossAxis : 0);
                        y < r ? y = r : y > n && (y = n)
                    }
                    return {
                        [h]: g,
                        [m]: y
                    }
                }
            }
        },
        eC = (e, t, r) => {
            let n = new Map,
                o = {
                    platform: ep,
                    ...r
                },
                i = {
                    ...o.platform,
                    _c: n
                };
            return A(e, t, {
                ...o,
                platform: i
            })
        };
    e.s(["arrow", 0, ex, "autoPlacement", 0, function(e) {
        return void 0 === e && (e = {}), {
            name: "autoPlacement",
            options: e,
            async fn(t) {
                var r, o, i, l;
                let {
                    rects: a,
                    middlewareData: s,
                    placement: u,
                    platform: p,
                    elements: m
                } = t, {
                    crossAxis: v = !1,
                    alignment: y,
                    allowedPlacements: w = n,
                    autoAlignment: x = !0,
                    ...b
                } = c(e, t), C = void 0 !== y || w === n ? ((l = y || null) ? [...w.filter(e => f(e) === l), ...w.filter(e => f(e) !== l)] : w.filter(e => d(e) === e)).filter(e => !l || f(e) === l || !!x && g(e) !== e) : w, R = await p.detectOverflow(t, b), E = (null == (r = s.autoPlacement) ? void 0 : r.index) || 0, S = C[E];
                if (null == S) return {};
                let P = h(S, a, await (null == p.isRTL ? void 0 : p.isRTL(m.floating)));
                if (u !== S) return {
                    reset: {
                        placement: C[0]
                    }
                };
                let A = [R[d(S)], R[P[0]], R[P[1]]],
                    T = [...(null == (o = s.autoPlacement) ? void 0 : o.overflows) || [], {
                        placement: S,
                        overflows: A
                    }],
                    j = C[E + 1];
                if (j) return {
                    data: {
                        index: E + 1,
                        overflows: T
                    },
                    reset: {
                        placement: j
                    }
                };
                let L = T.map(e => {
                        let t = f(e.placement);
                        return [e.placement, t && v ? e.overflows.slice(0, 2).reduce((e, t) => e + t, 0) : e.overflows[0], e.overflows]
                    }).sort((e, t) => e[1] - t[1]),
                    O = (null == (i = L.filter(e => e[2].slice(0, f(e[0]) ? 2 : 3).every(e => e <= 0))[0]) ? void 0 : i[0]) || L[0][0];
                return O !== u ? {
                    data: {
                        index: E + 1,
                        overflows: T
                    },
                    reset: {
                        placement: O
                    }
                } : {}
            }
        }
    }, "autoUpdate", 0, function(e, t, r, n) {
        let l;
        void 0 === n && (n = {});
        let {
            ancestorScroll: s = !0,
            ancestorResize: u = !0,
            elementResize: c = "function" == typeof ResizeObserver,
            layoutShift: d = "function" == typeof IntersectionObserver,
            animationFrame: f = !1
        } = n, p = et(e), m = s || u ? [...p ? J(p) : [], ...t ? J(t) : []] : [];
        m.forEach(e => {
            s && e.addEventListener("scroll", r, {
                passive: !0
            }), u && e.addEventListener("resize", r)
        });
        let v = p && d ? function(e, t) {
                let r, n = null,
                    l = M(e);

                function s() {
                    var e;
                    clearTimeout(r), null == (e = n) || e.disconnect(), n = null
                }
                return ! function u(c, d) {
                    void 0 === c && (c = !1), void 0 === d && (d = 1), s();
                    let f = e.getBoundingClientRect(),
                        {
                            left: p,
                            top: m,
                            width: v,
                            height: h
                        } = f;
                    if (c || t(), !v || !h) return;
                    let g = {
                            rootMargin: -a(m) + "px " + -a(l.clientWidth - (p + v)) + "px " + -a(l.clientHeight - (m + h)) + "px " + -a(p) + "px",
                            threshold: i(0, o(1, d)) || 1
                        },
                        y = !0;

                    function w(t) {
                        let n = t[0].intersectionRatio;
                        if (n !== d) {
                            if (!y) return u();
                            n ? u(!1, n) : r = setTimeout(() => {
                                u(!1, 1e-7)
                            }, 1e3)
                        }
                        1 !== n || em(f, e.getBoundingClientRect()) || u(), y = !1
                    }
                    try {
                        n = new IntersectionObserver(w, {
                            ...g,
                            root: l.ownerDocument
                        })
                    } catch (e) {
                        n = new IntersectionObserver(w, g)
                    }
                    n.observe(e)
                }(!0), s
            }(p, r) : null,
            h = -1,
            g = null;
        c && (g = new ResizeObserver(e => {
            let [n] = e;
            n && n.target === p && g && t && (g.unobserve(t), cancelAnimationFrame(h), h = requestAnimationFrame(() => {
                var e;
                null == (e = g) || e.observe(t)
            })), r()
        }), p && !f && g.observe(p), t && g.observe(t));
        let y = f ? ei(e) : null;
        return f && function t() {
            let n = ei(e);
            y && !em(y, n) && r(), y = n, l = requestAnimationFrame(t)
        }(), r(), () => {
            var e;
            m.forEach(e => {
                s && e.removeEventListener("scroll", r), u && e.removeEventListener("resize", r)
            }), null == v || v(), null == (e = g) || e.disconnect(), g = null, f && cancelAnimationFrame(l)
        }
    }, "computePosition", 0, eC, "flip", 0, eg, "hide", 0, ew, "inline", 0, function(e) {
        return void 0 === e && (e = {}), {
            name: "inline",
            options: e,
            async fn(t) {
                let {
                    placement: r,
                    elements: n,
                    rects: l,
                    platform: a,
                    strategy: s
                } = t, {
                    padding: u = 2,
                    x: f,
                    y: p
                } = c(e, t), m = Array.from(await (null == a.getClientRects ? void 0 : a.getClientRects(n.reference)) || []), h = function(e) {
                    let t = e.slice().sort((e, t) => e.y - t.y),
                        r = [],
                        n = null;
                    for (let e = 0; e < t.length; e++) {
                        let o = t[e];
                        !n || o.y - n.y > n.height / 2 ? r.push([o]) : r[r.length - 1].push(o), n = o
                    }
                    return r.map(e => E(L(e)))
                }(m), g = E(L(m)), y = R(u), w = await a.getElementRects({
                    reference: {
                        getBoundingClientRect: function() {
                            if (2 === h.length && h[0].left > h[1].right && null != f && null != p) return h.find(e => f > e.left - y.left && f < e.right + y.right && p > e.top - y.top && p < e.bottom + y.bottom) || g;
                            if (h.length >= 2) {
                                if ("y" === v(r)) {
                                    let e = h[0],
                                        t = h[h.length - 1],
                                        n = "top" === d(r),
                                        o = e.top,
                                        i = t.bottom,
                                        l = n ? e.left : t.left,
                                        a = n ? e.right : t.right;
                                    return {
                                        top: o,
                                        bottom: i,
                                        left: l,
                                        right: a,
                                        width: a - l,
                                        height: i - o,
                                        x: l,
                                        y: o
                                    }
                                }
                                let e = "left" === d(r),
                                    t = i(...h.map(e => e.right)),
                                    n = o(...h.map(e => e.left)),
                                    l = h.filter(r => e ? r.left === n : r.right === t),
                                    a = l[0].top,
                                    s = l[l.length - 1].bottom;
                                return {
                                    top: a,
                                    bottom: s,
                                    left: n,
                                    right: t,
                                    width: t - n,
                                    height: s - a,
                                    x: n,
                                    y: a
                                }
                            }
                            return g
                        }
                    },
                    floating: n.floating,
                    strategy: s
                });
                return l.reference.x !== w.reference.x || l.reference.y !== w.reference.y || l.reference.width !== w.reference.width || l.reference.height !== w.reference.height ? {
                    reset: {
                        rects: w
                    }
                } : {}
            }
        }
    }, "limitShift", 0, eb, "offset", 0, ev, "shift", 0, eh, "size", 0, ey], 992486);
    var eR = e.i(416340),
        eE = e.i(149285),
        eS = "u" > typeof document ? eR.useLayoutEffect : function() {};

    function eP(e, t) {
        let r, n, o;
        if (e === t) return !0;
        if (typeof e != typeof t) return !1;
        if ("function" == typeof e && e.toString() === t.toString()) return !0;
        if (e && t && "object" == typeof e) {
            if (Array.isArray(e)) {
                if ((r = e.length) !== t.length) return !1;
                for (n = r; 0 != n--;)
                    if (!eP(e[n], t[n])) return !1;
                return !0
            }
            if ((r = (o = Object.keys(e)).length) !== Object.keys(t).length) return !1;
            for (n = r; 0 != n--;)
                if (!({}).hasOwnProperty.call(t, o[n])) return !1;
            for (n = r; 0 != n--;) {
                let r = o[n];
                if (("_owner" !== r || !e.$$typeof) && !eP(e[r], t[r])) return !1
            }
            return !0
        }
        return e != e && t != t
    }

    function eA(e) {
        return "u" < typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
    }

    function eT(e, t) {
        let r = eA(e);
        return Math.round(t * r) / r
    }

    function ej(e) {
        let t = eR.useRef(e);
        return eS(() => {
            t.current = e
        }), t
    }
    e.s(["arrow", 0, (e, t) => {
        let r = {
            name: "arrow",
            options: e,
            fn(t) {
                let {
                    element: r,
                    padding: n
                } = "function" == typeof e ? e(t) : e;
                return r && ({}).hasOwnProperty.call(r, "current") ? null != r.current ? ex({
                    element: r.current,
                    padding: n
                }).fn(t) : {} : r ? ex({
                    element: r,
                    padding: n
                }).fn(t) : {}
            }
        };
        return {
            name: r.name,
            fn: r.fn,
            options: [e, t]
        }
    }, "flip", 0, (e, t) => {
        let r = eg(e);
        return {
            name: r.name,
            fn: r.fn,
            options: [e, t]
        }
    }, "hide", 0, (e, t) => {
        let r = ew(e);
        return {
            name: r.name,
            fn: r.fn,
            options: [e, t]
        }
    }, "limitShift", 0, (e, t) => ({
        fn: eb(e).fn,
        options: [e, t]
    }), "offset", 0, (e, t) => {
        let r = ev(e);
        return {
            name: r.name,
            fn: r.fn,
            options: [e, t]
        }
    }, "shift", 0, (e, t) => {
        let r = eh(e);
        return {
            name: r.name,
            fn: r.fn,
            options: [e, t]
        }
    }, "size", 0, (e, t) => {
        let r = ey(e);
        return {
            name: r.name,
            fn: r.fn,
            options: [e, t]
        }
    }, "useFloating", 0, function(e) {
        void 0 === e && (e = {});
        let {
            placement: t = "bottom",
            strategy: r = "absolute",
            middleware: n = [],
            platform: o,
            elements: {
                reference: i,
                floating: l
            } = {},
            transform: a = !0,
            whileElementsMounted: s,
            open: u
        } = e, [c, d] = eR.useState({
            x: 0,
            y: 0,
            strategy: r,
            placement: t,
            middlewareData: {},
            isPositioned: !1
        }), [f, p] = eR.useState(n);
        eP(f, n) || p(n);
        let [m, v] = eR.useState(null), [h, g] = eR.useState(null), y = eR.useCallback(e => {
            e !== C.current && (C.current = e, v(e))
        }, []), w = eR.useCallback(e => {
            e !== R.current && (R.current = e, g(e))
        }, []), x = i || m, b = l || h, C = eR.useRef(null), R = eR.useRef(null), E = eR.useRef(c), S = null != s, P = ej(s), A = ej(o), T = ej(u), j = eR.useCallback(() => {
            if (!C.current || !R.current) return;
            let e = {
                placement: t,
                strategy: r,
                middleware: f
            };
            A.current && (e.platform = A.current), eC(C.current, R.current, e).then(e => {
                let t = {
                    ...e,
                    isPositioned: !1 !== T.current
                };
                L.current && !eP(E.current, t) && (E.current = t, eE.flushSync(() => {
                    d(t)
                }))
            })
        }, [f, t, r, A, T]);
        eS(() => {
            !1 === u && E.current.isPositioned && (E.current.isPositioned = !1, d(e => ({
                ...e,
                isPositioned: !1
            })))
        }, [u]);
        let L = eR.useRef(!1);
        eS(() => (L.current = !0, () => {
            L.current = !1
        }), []), eS(() => {
            if (x && (C.current = x), b && (R.current = b), x && b) {
                if (P.current) return P.current(x, b, j);
                j()
            }
        }, [x, b, j, P, S]);
        let O = eR.useMemo(() => ({
                reference: C,
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
                    position: r,
                    left: 0,
                    top: 0
                };
                if (!N.floating) return e;
                let t = eT(N.floating, c.x),
                    n = eT(N.floating, c.y);
                return a ? {
                    ...e,
                    transform: "translate(" + t + "px, " + n + "px)",
                    ...eA(N.floating) >= 1.5 && {
                        willChange: "transform"
                    }
                } : {
                    position: r,
                    left: t,
                    top: n
                }
            }, [r, a, N.floating, c.x, c.y]);
        return eR.useMemo(() => ({
            ...c,
            update: j,
            refs: O,
            elements: N,
            floatingStyles: D
        }), [c, j, O, N, D])
    }], 297452)
}, 305607, 539206, e => {
    "use strict";
    e.s(["clamp", 0, function(e, t) {
        let [r, n] = t;
        return Math.min(n, Math.max(r, e))
    }], 305607);
    var t = e.i(416340),
        r = e.i(608652),
        n = e.i(78892),
        o = e.i(699704),
        i = e.i(221628);
    e.s(["createCollection", 0, function(e) {
        let l = e + "CollectionProvider",
            [a, s] = (0, r.createContextScope)(l),
            [u, c] = a(l, {
                collectionRef: {
                    current: null
                },
                itemMap: new Map
            }),
            d = e => {
                let {
                    scope: r,
                    children: n
                } = e, o = t.default.useRef(null), l = t.default.useRef(new Map).current;
                return (0, i.jsx)(u, {
                    scope: r,
                    itemMap: l,
                    collectionRef: o,
                    children: n
                })
            };
        d.displayName = l;
        let f = e + "CollectionSlot",
            p = (0, o.createSlot)(f),
            m = t.default.forwardRef((e, t) => {
                let {
                    scope: r,
                    children: o
                } = e, l = c(f, r), a = (0, n.useComposedRefs)(t, l.collectionRef);
                return (0, i.jsx)(p, {
                    ref: a,
                    children: o
                })
            });
        m.displayName = f;
        let v = e + "CollectionItemSlot",
            h = "data-radix-collection-item",
            g = (0, o.createSlot)(v),
            y = t.default.forwardRef((e, r) => {
                let {
                    scope: o,
                    children: l,
                    ...a
                } = e, s = t.default.useRef(null), u = (0, n.useComposedRefs)(r, s), d = c(v, o);
                return t.default.useEffect(() => (d.itemMap.set(s, {
                    ref: s,
                    ...a
                }), () => void d.itemMap.delete(s))), (0, i.jsx)(g, {
                    ...{
                        [h]: ""
                    },
                    ref: u,
                    children: l
                })
            });
        return y.displayName = v, [{
            Provider: d,
            Slot: m,
            ItemSlot: y
        }, function(r) {
            let n = c(e + "CollectionConsumer", r);
            return t.default.useCallback(() => {
                let e = n.collectionRef.current;
                if (!e) return [];
                let t = Array.from(e.querySelectorAll("[".concat(h, "]")));
                return Array.from(n.itemMap.values()).sort((e, r) => t.indexOf(e.ref.current) - t.indexOf(r.ref.current))
            }, [n.collectionRef, n.itemMap])
        }, s]
    }], 539206)
}, 174617, e => {
    "use strict";
    "u" > typeof window && window.document && window.document.createElement, e.s(["composeEventHandlers", 0, function(e, t) {
        let {
            checkForDefaultPrevented: r = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(n) {
            if (null == e || e(n), !1 === r || !n.defaultPrevented) return null == t ? void 0 : t(n)
        }
    }])
}, 742187, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(594278),
        n = e.i(221628),
        o = t.forwardRef((e, t) => {
            let {
                children: o,
                width: i = 10,
                height: l = 5,
                ...a
            } = e;
            return (0, n.jsx)(r.Primitive.svg, {
                ...a,
                ref: t,
                width: i,
                height: l,
                viewBox: "0 0 30 10",
                preserveAspectRatio: "none",
                children: e.asChild ? o : (0, n.jsx)("polygon", {
                    points: "0,0 30,0 15,10"
                })
            })
        });
    o.displayName = "Arrow", e.s(["Root", 0, o])
}, 508785, e => {
    "use strict";
    e.i(711300), e.i(634203), e.i(35877);
    var t = e.i(416340),
        r = e.i(608652),
        n = e.i(78892),
        o = e.i(76992),
        i = e.i(221628);
    e.s(["createCollection", 0, function(e) {
        let l = e + "CollectionProvider",
            [a, s] = (0, r.createContextScope)(l),
            [u, c] = a(l, {
                collectionRef: {
                    current: null
                },
                itemMap: new Map
            }),
            d = e => {
                let {
                    scope: r,
                    children: n
                } = e, o = t.default.useRef(null), l = t.default.useRef(new Map).current;
                return (0, i.jsx)(u, {
                    scope: r,
                    itemMap: l,
                    collectionRef: o,
                    children: n
                })
            };
        d.displayName = l;
        let f = e + "CollectionSlot",
            p = (0, o.createSlot)(f),
            m = t.default.forwardRef((e, t) => {
                let {
                    scope: r,
                    children: o
                } = e, l = c(f, r), a = (0, n.useComposedRefs)(t, l.collectionRef);
                return (0, i.jsx)(p, {
                    ref: a,
                    children: o
                })
            });
        m.displayName = f;
        let v = e + "CollectionItemSlot",
            h = "data-radix-collection-item",
            g = (0, o.createSlot)(v),
            y = t.default.forwardRef((e, r) => {
                let {
                    scope: o,
                    children: l,
                    ...a
                } = e, s = t.default.useRef(null), u = (0, n.useComposedRefs)(r, s), d = c(v, o);
                return t.default.useEffect(() => (d.itemMap.set(s, {
                    ref: s,
                    ...a
                }), () => void d.itemMap.delete(s))), (0, i.jsx)(g, {
                    ...{
                        [h]: ""
                    },
                    ref: u,
                    children: l
                })
            });
        return y.displayName = v, [{
            Provider: d,
            Slot: m,
            ItemSlot: y
        }, function(r) {
            let n = c(e + "CollectionConsumer", r);
            return t.default.useCallback(() => {
                let e = n.collectionRef.current;
                if (!e) return [];
                let t = Array.from(e.querySelectorAll("[".concat(h, "]")));
                return Array.from(n.itemMap.values()).sort((e, r) => t.indexOf(e.ref.current) - t.indexOf(r.ref.current))
            }, [n.collectionRef, n.itemMap])
        }, s]
    }])
}, 974539, e => {
    "use strict";
    var t = e.i(416340);
    e.i(221628);
    var r = t.createContext(void 0);
    e.s(["useDirection", 0, function(e) {
        let n = t.useContext(r);
        return e || n || "ltr"
    }])
}, 734463, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(19655),
        n = e.i(78892),
        o = e.i(608652),
        i = e.i(598943),
        l = e.i(793808),
        a = e.i(44265),
        s = e.i(40266),
        u = e.i(524887),
        c = e.i(763960),
        d = e.i(226972),
        f = e.i(594278),
        p = e.i(699704),
        m = e.i(428156),
        v = e.i(3300),
        h = e.i(813593),
        g = e.i(221628),
        y = "Popover",
        [w, x] = (0, o.createContextScope)(y, [u.createPopperScope]),
        b = (0, u.createPopperScope)(),
        [C, R] = w(y),
        E = e => {
            let {
                __scopePopover: r,
                children: n,
                open: o,
                defaultOpen: i,
                onOpenChange: l,
                modal: a = !1
            } = e, c = b(r), d = t.useRef(null), [f, p] = t.useState(!1), [v = !1, h] = (0, m.useControllableState)({
                prop: o,
                defaultProp: i,
                onChange: l
            });
            return (0, g.jsx)(u.Root, {
                ...c,
                children: (0, g.jsx)(C, {
                    scope: r,
                    contentId: (0, s.useId)(),
                    triggerRef: d,
                    open: v,
                    onOpenChange: h,
                    onOpenToggle: t.useCallback(() => h(e => !e), [h]),
                    hasCustomAnchor: f,
                    onCustomAnchorAdd: t.useCallback(() => p(!0), []),
                    onCustomAnchorRemove: t.useCallback(() => p(!1), []),
                    modal: a,
                    children: n
                })
            })
        };
    E.displayName = y;
    var S = "PopoverAnchor",
        P = t.forwardRef((e, r) => {
            let {
                __scopePopover: n,
                ...o
            } = e, i = R(S, n), l = b(n), {
                onCustomAnchorAdd: a,
                onCustomAnchorRemove: s
            } = i;
            return t.useEffect(() => (a(), () => s()), [a, s]), (0, g.jsx)(u.Anchor, {
                ...l,
                ...o,
                ref: r
            })
        });
    P.displayName = S;
    var A = "PopoverTrigger",
        T = t.forwardRef((e, t) => {
            let {
                __scopePopover: o,
                ...i
            } = e, l = R(A, o), a = b(o), s = (0, n.useComposedRefs)(t, l.triggerRef), c = (0, g.jsx)(f.Primitive.button, {
                type: "button",
                "aria-haspopup": "dialog",
                "aria-expanded": l.open,
                "aria-controls": l.contentId,
                "data-state": z(l.open),
                ...i,
                ref: s,
                onClick: (0, r.composeEventHandlers)(e.onClick, l.onOpenToggle)
            });
            return l.hasCustomAnchor ? c : (0, g.jsx)(u.Anchor, {
                asChild: !0,
                ...a,
                children: c
            })
        });
    T.displayName = A;
    var j = "PopoverPortal",
        [L, O] = w(j, {
            forceMount: void 0
        }),
        N = e => {
            let {
                __scopePopover: t,
                forceMount: r,
                children: n,
                container: o
            } = e, i = R(j, t);
            return (0, g.jsx)(L, {
                scope: t,
                forceMount: r,
                children: (0, g.jsx)(d.Presence, {
                    present: r || i.open,
                    children: (0, g.jsx)(c.Portal, {
                        asChild: !0,
                        container: o,
                        children: n
                    })
                })
            })
        };
    N.displayName = j;
    var D = "PopoverContent",
        k = t.forwardRef((e, t) => {
            let r = O(D, e.__scopePopover),
                {
                    forceMount: n = r.forceMount,
                    ...o
                } = e,
                i = R(D, e.__scopePopover);
            return (0, g.jsx)(d.Presence, {
                present: n || i.open,
                children: i.modal ? (0, g.jsx)(M, {
                    ...o,
                    ref: t
                }) : (0, g.jsx)(H, {
                    ...o,
                    ref: t
                })
            })
        });
    k.displayName = D;
    var I = (0, p.createSlot)("PopoverContent.RemoveScroll"),
        M = t.forwardRef((e, o) => {
            let i = R(D, e.__scopePopover),
                l = t.useRef(null),
                a = (0, n.useComposedRefs)(o, l),
                s = t.useRef(!1);
            return t.useEffect(() => {
                let e = l.current;
                if (e) return (0, v.hideOthers)(e)
            }, []), (0, g.jsx)(h.RemoveScroll, {
                as: I,
                allowPinchZoom: !0,
                children: (0, g.jsx)(F, {
                    ...e,
                    ref: a,
                    trapFocus: i.open,
                    disableOutsidePointerEvents: !0,
                    onCloseAutoFocus: (0, r.composeEventHandlers)(e.onCloseAutoFocus, e => {
                        var t;
                        e.preventDefault(), s.current || null == (t = i.triggerRef.current) || t.focus()
                    }),
                    onPointerDownOutside: (0, r.composeEventHandlers)(e.onPointerDownOutside, e => {
                        let t = e.detail.originalEvent,
                            r = 0 === t.button && !0 === t.ctrlKey;
                        s.current = 2 === t.button || r
                    }, {
                        checkForDefaultPrevented: !1
                    }),
                    onFocusOutside: (0, r.composeEventHandlers)(e.onFocusOutside, e => e.preventDefault(), {
                        checkForDefaultPrevented: !1
                    })
                })
            })
        }),
        H = t.forwardRef((e, r) => {
            let n = R(D, e.__scopePopover),
                o = t.useRef(!1),
                i = t.useRef(!1);
            return (0, g.jsx)(F, {
                ...e,
                ref: r,
                trapFocus: !1,
                disableOutsidePointerEvents: !1,
                onCloseAutoFocus: t => {
                    var r, l;
                    null == (r = e.onCloseAutoFocus) || r.call(e, t), t.defaultPrevented || (o.current || null == (l = n.triggerRef.current) || l.focus(), t.preventDefault()), o.current = !1, i.current = !1
                },
                onInteractOutside: t => {
                    var r, l;
                    null == (r = e.onInteractOutside) || r.call(e, t), t.defaultPrevented || (o.current = !0, "pointerdown" === t.detail.originalEvent.type && (i.current = !0));
                    let a = t.target;
                    (null == (l = n.triggerRef.current) ? void 0 : l.contains(a)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && i.current && t.preventDefault()
                }
            })
        }),
        F = t.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                trapFocus: n,
                onOpenAutoFocus: o,
                onCloseAutoFocus: s,
                disableOutsidePointerEvents: c,
                onEscapeKeyDown: d,
                onPointerDownOutside: f,
                onFocusOutside: p,
                onInteractOutside: m,
                ...v
            } = e, h = R(D, r), y = b(r);
            return (0, l.useFocusGuards)(), (0, g.jsx)(a.FocusScope, {
                asChild: !0,
                loop: !0,
                trapped: n,
                onMountAutoFocus: o,
                onUnmountAutoFocus: s,
                children: (0, g.jsx)(i.DismissableLayer, {
                    asChild: !0,
                    disableOutsidePointerEvents: c,
                    onInteractOutside: m,
                    onEscapeKeyDown: d,
                    onPointerDownOutside: f,
                    onFocusOutside: p,
                    onDismiss: () => h.onOpenChange(!1),
                    children: (0, g.jsx)(u.Content, {
                        "data-state": z(h.open),
                        role: "dialog",
                        id: h.contentId,
                        ...y,
                        ...v,
                        ref: t,
                        style: {
                            ...v.style,
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
        _ = "PopoverClose",
        B = t.forwardRef((e, t) => {
            let {
                __scopePopover: n,
                ...o
            } = e, i = R(_, n);
            return (0, g.jsx)(f.Primitive.button, {
                type: "button",
                ...o,
                ref: t,
                onClick: (0, r.composeEventHandlers)(e.onClick, () => i.onOpenChange(!1))
            })
        });
    B.displayName = _;
    var W = t.forwardRef((e, t) => {
        let {
            __scopePopover: r,
            ...n
        } = e, o = b(r);
        return (0, g.jsx)(u.Arrow, {
            ...o,
            ...n,
            ref: t
        })
    });

    function z(e) {
        return e ? "open" : "closed"
    }
    W.displayName = "PopoverArrow", e.s(["Anchor", 0, P, "Arrow", 0, W, "Close", 0, B, "Content", 0, k, "Portal", 0, N, "Root", 0, E, "Trigger", 0, T])
}, 524887, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(297452),
        n = e.i(992486),
        o = e.i(742187),
        i = e.i(78892),
        l = e.i(608652),
        a = e.i(594278),
        s = e.i(886449),
        u = e.i(723570),
        c = e.i(692166),
        d = e.i(221628),
        f = "Popper",
        [p, m] = (0, l.createContextScope)(f),
        [v, h] = p(f),
        g = e => {
            let {
                __scopePopper: r,
                children: n
            } = e, [o, i] = t.useState(null);
            return (0, d.jsx)(v, {
                scope: r,
                anchor: o,
                onAnchorChange: i,
                children: n
            })
        };
    g.displayName = f;
    var y = "PopperAnchor",
        w = t.forwardRef((e, r) => {
            let {
                __scopePopper: n,
                virtualRef: o,
                ...l
            } = e, s = h(y, n), u = t.useRef(null), c = (0, i.useComposedRefs)(r, u);
            return t.useEffect(() => {
                s.onAnchorChange((null == o ? void 0 : o.current) || u.current)
            }), o ? null : (0, d.jsx)(a.Primitive.div, {
                ...l,
                ref: c
            })
        });
    w.displayName = y;
    var x = "PopperContent",
        [b, C] = p(x),
        R = t.forwardRef((e, o) => {
            var l, f, p, m, v, g, y, w;
            let {
                __scopePopper: C,
                side: R = "bottom",
                sideOffset: E = 0,
                align: S = "center",
                alignOffset: P = 0,
                arrowPadding: L = 0,
                avoidCollisions: O = !0,
                collisionBoundary: N = [],
                collisionPadding: D = 0,
                sticky: k = "partial",
                hideWhenDetached: I = !1,
                updatePositionStrategy: M = "optimized",
                onPlaced: H,
                ...F
            } = e, _ = h(x, C), [B, W] = t.useState(null), z = (0, i.useComposedRefs)(o, e => W(e)), [V, U] = t.useState(null), K = (0, c.useSize)(V), Y = null != (l = null == K ? void 0 : K.width) ? l : 0, X = null != (f = null == K ? void 0 : K.height) ? f : 0, G = "number" == typeof D ? D : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...D
            }, q = Array.isArray(N) ? N : [N], Z = q.length > 0, $ = {
                padding: G,
                boundary: q.filter(A),
                altBoundary: Z
            }, {
                refs: J,
                floatingStyles: Q,
                placement: ee,
                isPositioned: et,
                middlewareData: er
            } = (0, r.useFloating)({
                strategy: "fixed",
                placement: R + ("center" !== S ? "-" + S : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return (0, n.autoUpdate)(...t, {
                        animationFrame: "always" === M
                    })
                },
                elements: {
                    reference: _.anchor
                },
                middleware: [(0, r.offset)({
                    mainAxis: E + X,
                    alignmentAxis: P
                }), O && (0, r.shift)({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === k ? (0, r.limitShift)() : void 0,
                    ...$
                }), O && (0, r.flip)({
                    ...$
                }), (0, r.size)({
                    ...$,
                    apply: e => {
                        let {
                            elements: t,
                            rects: r,
                            availableWidth: n,
                            availableHeight: o
                        } = e, {
                            width: i,
                            height: l
                        } = r.reference, a = t.floating.style;
                        a.setProperty("--radix-popper-available-width", "".concat(n, "px")), a.setProperty("--radix-popper-available-height", "".concat(o, "px")), a.setProperty("--radix-popper-anchor-width", "".concat(i, "px")), a.setProperty("--radix-popper-anchor-height", "".concat(l, "px"))
                    }
                }), V && (0, r.arrow)({
                    element: V,
                    padding: L
                }), T({
                    arrowWidth: Y,
                    arrowHeight: X
                }), I && (0, r.hide)({
                    strategy: "referenceHidden",
                    ...$
                })]
            }), [en, eo] = j(ee), ei = (0, s.useCallbackRef)(H);
            (0, u.useLayoutEffect)(() => {
                et && (null == ei || ei())
            }, [et, ei]);
            let el = null == (p = er.arrow) ? void 0 : p.x,
                ea = null == (m = er.arrow) ? void 0 : m.y,
                es = (null == (v = er.arrow) ? void 0 : v.centerOffset) !== 0,
                [eu, ec] = t.useState();
            return (0, u.useLayoutEffect)(() => {
                B && ec(window.getComputedStyle(B).zIndex)
            }, [B]), (0, d.jsx)("div", {
                ref: J.setFloating,
                "data-radix-popper-content-wrapper": "",
                style: {
                    ...Q,
                    transform: et ? Q.transform : "translate(0, -200%)",
                    minWidth: "max-content",
                    zIndex: eu,
                    "--radix-popper-transform-origin": [null == (g = er.transformOrigin) ? void 0 : g.x, null == (y = er.transformOrigin) ? void 0 : y.y].join(" "),
                    ...(null == (w = er.hide) ? void 0 : w.referenceHidden) && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, d.jsx)(b, {
                    scope: C,
                    placedSide: en,
                    onArrowChange: U,
                    arrowX: el,
                    arrowY: ea,
                    shouldHideArrow: es,
                    children: (0, d.jsx)(a.Primitive.div, {
                        "data-side": en,
                        "data-align": eo,
                        ...F,
                        ref: z,
                        style: {
                            ...F.style,
                            animation: et ? void 0 : "none"
                        }
                    })
                })
            })
        });
    R.displayName = x;
    var E = "PopperArrow",
        S = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        P = t.forwardRef(function(e, t) {
            let {
                __scopePopper: r,
                ...n
            } = e, i = C(E, r), l = S[i.placedSide];
            return (0, d.jsx)("span", {
                ref: i.onArrowChange,
                style: {
                    position: "absolute",
                    left: i.arrowX,
                    top: i.arrowY,
                    [l]: 0,
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
                children: (0, d.jsx)(o.Root, {
                    ...n,
                    ref: t,
                    style: {
                        ...n.style,
                        display: "block"
                    }
                })
            })
        });

    function A(e) {
        return null !== e
    }
    P.displayName = E;
    var T = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            var r, n, o, i, l;
            let {
                placement: a,
                rects: s,
                middlewareData: u
            } = t, c = (null == (o = u.arrow) ? void 0 : o.centerOffset) !== 0, d = c ? 0 : e.arrowWidth, f = c ? 0 : e.arrowHeight, [p, m] = j(a), v = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [m], h = (null != (r = null == (i = u.arrow) ? void 0 : i.x) ? r : 0) + d / 2, g = (null != (n = null == (l = u.arrow) ? void 0 : l.y) ? n : 0) + f / 2, y = "", w = "";
            return "bottom" === p ? (y = c ? v : "".concat(h, "px"), w = "".concat(-f, "px")) : "top" === p ? (y = c ? v : "".concat(h, "px"), w = "".concat(s.floating.height + f, "px")) : "right" === p ? (y = "".concat(-f, "px"), w = c ? v : "".concat(g, "px")) : "left" === p && (y = "".concat(s.floating.width + f, "px"), w = c ? v : "".concat(g, "px")), {
                data: {
                    x: y,
                    y: w
                }
            }
        }
    });

    function j(e) {
        let [t, r = "center"] = e.split("-");
        return [t, r]
    }
    e.s(["Anchor", 0, w, "Arrow", 0, P, "Content", 0, R, "Root", 0, g, "createPopperScope", 0, m])
}, 600317, e => {
    "use strict";
    var t = e.i(416340);
    e.i(149285);
    var r = e.i(76992),
        n = e.i(221628),
        o = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce((e, o) => {
            let i = (0, r.createSlot)("Primitive.".concat(o)),
                l = t.forwardRef((e, t) => {
                    let {
                        asChild: r,
                        ...l
                    } = e;
                    return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, n.jsx)(r ? i : o, {
                        ...l,
                        ref: t
                    })
                });
            return l.displayName = "Primitive.".concat(o), {
                ...e,
                [o]: l
            }
        }, {});
    e.s(["Primitive", 0, o])
}, 142953, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(174617),
        n = e.i(508785),
        o = e.i(78892),
        i = e.i(608652),
        l = e.i(40266),
        a = e.i(600317),
        s = e.i(886449),
        u = e.i(199786),
        c = e.i(974539),
        d = e.i(221628),
        f = "rovingFocusGroup.onEntryFocus",
        p = {
            bubbles: !1,
            cancelable: !0
        },
        m = "RovingFocusGroup",
        [v, h, g] = (0, n.createCollection)(m),
        [y, w] = (0, i.createContextScope)(m, [g]),
        [x, b] = y(m),
        C = t.forwardRef((e, t) => (0, d.jsx)(v.Provider, {
            scope: e.__scopeRovingFocusGroup,
            children: (0, d.jsx)(v.Slot, {
                scope: e.__scopeRovingFocusGroup,
                children: (0, d.jsx)(R, {
                    ...e,
                    ref: t
                })
            })
        }));
    C.displayName = m;
    var R = t.forwardRef((e, n) => {
            let {
                __scopeRovingFocusGroup: i,
                orientation: l,
                loop: v = !1,
                dir: g,
                currentTabStopId: y,
                defaultCurrentTabStopId: w,
                onCurrentTabStopIdChange: b,
                onEntryFocus: C,
                preventScrollOnEntryFocus: R = !1,
                ...E
            } = e, S = t.useRef(null), P = (0, o.useComposedRefs)(n, S), T = (0, c.useDirection)(g), [j, L] = (0, u.useControllableState)({
                prop: y,
                defaultProp: null != w ? w : null,
                onChange: b,
                caller: m
            }), [O, N] = t.useState(!1), D = (0, s.useCallbackRef)(C), k = h(i), I = t.useRef(!1), [M, H] = t.useState(0);
            return t.useEffect(() => {
                let e = S.current;
                if (e) return e.addEventListener(f, D), () => e.removeEventListener(f, D)
            }, [D]), (0, d.jsx)(x, {
                scope: i,
                orientation: l,
                dir: T,
                loop: v,
                currentTabStopId: j,
                onItemFocus: t.useCallback(e => L(e), [L]),
                onItemShiftTab: t.useCallback(() => N(!0), []),
                onFocusableItemAdd: t.useCallback(() => H(e => e + 1), []),
                onFocusableItemRemove: t.useCallback(() => H(e => e - 1), []),
                children: (0, d.jsx)(a.Primitive.div, {
                    tabIndex: O || 0 === M ? -1 : 0,
                    "data-orientation": l,
                    ...E,
                    ref: P,
                    style: {
                        outline: "none",
                        ...e.style
                    },
                    onMouseDown: (0, r.composeEventHandlers)(e.onMouseDown, () => {
                        I.current = !0
                    }),
                    onFocus: (0, r.composeEventHandlers)(e.onFocus, e => {
                        let t = !I.current;
                        if (e.target === e.currentTarget && t && !O) {
                            let t = new CustomEvent(f, p);
                            if (e.currentTarget.dispatchEvent(t), !t.defaultPrevented) {
                                let e = k().filter(e => e.focusable);
                                A([e.find(e => e.active), e.find(e => e.id === j), ...e].filter(Boolean).map(e => e.ref.current), R)
                            }
                        }
                        I.current = !1
                    }),
                    onBlur: (0, r.composeEventHandlers)(e.onBlur, () => N(!1))
                })
            })
        }),
        E = "RovingFocusGroupItem",
        S = t.forwardRef((e, n) => {
            let {
                __scopeRovingFocusGroup: o,
                focusable: i = !0,
                active: s = !1,
                tabStopId: u,
                children: c,
                ...f
            } = e, p = (0, l.useId)(), m = u || p, g = b(E, o), y = g.currentTabStopId === m, w = h(o), {
                onFocusableItemAdd: x,
                onFocusableItemRemove: C,
                currentTabStopId: R
            } = g;
            return t.useEffect(() => {
                if (i) return x(), () => C()
            }, [i, x, C]), (0, d.jsx)(v.ItemSlot, {
                scope: o,
                id: m,
                focusable: i,
                active: s,
                children: (0, d.jsx)(a.Primitive.span, {
                    tabIndex: y ? 0 : -1,
                    "data-orientation": g.orientation,
                    ...f,
                    ref: n,
                    onMouseDown: (0, r.composeEventHandlers)(e.onMouseDown, e => {
                        i ? g.onItemFocus(m) : e.preventDefault()
                    }),
                    onFocus: (0, r.composeEventHandlers)(e.onFocus, () => g.onItemFocus(m)),
                    onKeyDown: (0, r.composeEventHandlers)(e.onKeyDown, e => {
                        if ("Tab" === e.key && e.shiftKey) return void g.onItemShiftTab();
                        if (e.target !== e.currentTarget) return;
                        let t = function(e, t, r) {
                            var n;
                            let o = (n = e.key, "rtl" !== r ? n : "ArrowLeft" === n ? "ArrowRight" : "ArrowRight" === n ? "ArrowLeft" : n);
                            if (!("vertical" === t && ["ArrowLeft", "ArrowRight"].includes(o)) && !("horizontal" === t && ["ArrowUp", "ArrowDown"].includes(o))) return P[o]
                        }(e, g.orientation, g.dir);
                        if (void 0 !== t) {
                            if (e.metaKey || e.ctrlKey || e.altKey || e.shiftKey) return;
                            e.preventDefault();
                            let o = w().filter(e => e.focusable).map(e => e.ref.current);
                            if ("last" === t) o.reverse();
                            else if ("prev" === t || "next" === t) {
                                var r, n;
                                "prev" === t && o.reverse();
                                let i = o.indexOf(e.currentTarget);
                                o = g.loop ? (r = o, n = i + 1, r.map((e, t) => r[(n + t) % r.length])) : o.slice(i + 1)
                            }
                            setTimeout(() => A(o))
                        }
                    }),
                    children: "function" == typeof c ? c({
                        isCurrentTabStop: y,
                        hasTabStop: null != R
                    }) : c
                })
            })
        });
    S.displayName = E;
    var P = {
        ArrowLeft: "prev",
        ArrowUp: "prev",
        ArrowRight: "next",
        ArrowDown: "next",
        PageUp: "first",
        Home: "first",
        PageDown: "last",
        End: "last"
    };

    function A(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
            r = document.activeElement;
        for (let n of e)
            if (n === r || (n.focus({
                    preventScroll: t
                }), document.activeElement !== r)) return
    }
    e.s(["Item", 0, S, "Root", 0, C, "createRovingFocusGroupScope", 0, w])
}, 563921, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(149285),
        n = e.i(305607),
        o = e.i(19655),
        i = e.i(539206),
        l = e.i(78892),
        a = e.i(608652),
        s = e.i(974539),
        u = e.i(598943),
        c = e.i(793808),
        d = e.i(44265),
        f = e.i(40266),
        p = e.i(524887),
        m = e.i(763960),
        v = e.i(594278),
        h = e.i(699704),
        g = e.i(886449),
        y = e.i(428156),
        w = e.i(723570),
        x = e.i(300792),
        b = e.i(221628),
        C = t.forwardRef((e, t) => (0, b.jsx)(v.Primitive.span, {
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
    C.displayName = "VisuallyHidden";
    var R = e.i(3300),
        E = e.i(813593),
        S = [" ", "Enter", "ArrowUp", "ArrowDown"],
        P = [" ", "Enter"],
        A = "Select",
        [T, j, L] = (0, i.createCollection)(A),
        [O, N] = (0, a.createContextScope)(A, [L, p.createPopperScope]),
        D = (0, p.createPopperScope)(),
        [k, I] = O(A),
        [M, H] = O(A),
        F = e => {
            let {
                __scopeSelect: r,
                children: n,
                open: o,
                defaultOpen: i,
                onOpenChange: l,
                value: a,
                defaultValue: u,
                onValueChange: c,
                dir: d,
                name: m,
                autoComplete: v,
                disabled: h,
                required: g,
                form: w
            } = e, x = D(r), [C, R] = t.useState(null), [E, S] = t.useState(null), [P, A] = t.useState(!1), j = (0, s.useDirection)(d), [L = !1, O] = (0, y.useControllableState)({
                prop: o,
                defaultProp: i,
                onChange: l
            }), [N, I] = (0, y.useControllableState)({
                prop: a,
                defaultProp: u,
                onChange: c
            }), H = t.useRef(null), F = !C || w || !!C.closest("form"), [_, B] = t.useState(new Set), W = Array.from(_).map(e => e.props.value).join(";");
            return (0, b.jsx)(p.Root, {
                ...x,
                children: (0, b.jsxs)(k, {
                    required: g,
                    scope: r,
                    trigger: C,
                    onTriggerChange: R,
                    valueNode: E,
                    onValueNodeChange: S,
                    valueNodeHasChildren: P,
                    onValueNodeHasChildrenChange: A,
                    contentId: (0, f.useId)(),
                    value: N,
                    onValueChange: I,
                    open: L,
                    onOpenChange: O,
                    dir: j,
                    triggerPointerDownPosRef: H,
                    disabled: h,
                    children: [(0, b.jsx)(T.Provider, {
                        scope: r,
                        children: (0, b.jsx)(M, {
                            scope: e.__scopeSelect,
                            onNativeOptionAdd: t.useCallback(e => {
                                B(t => new Set(t).add(e))
                            }, []),
                            onNativeOptionRemove: t.useCallback(e => {
                                B(t => {
                                    let r = new Set(t);
                                    return r.delete(e), r
                                })
                            }, []),
                            children: n
                        })
                    }), F ? (0, b.jsxs)(ew, {
                        "aria-hidden": !0,
                        required: g,
                        tabIndex: -1,
                        name: m,
                        autoComplete: v,
                        value: N,
                        onChange: e => I(e.target.value),
                        disabled: h,
                        form: w,
                        children: [void 0 === N ? (0, b.jsx)("option", {
                            value: ""
                        }) : null, Array.from(_)]
                    }, W) : null]
                })
            })
        };
    F.displayName = A;
    var _ = "SelectTrigger",
        B = t.forwardRef((e, r) => {
            let {
                __scopeSelect: n,
                disabled: i = !1,
                ...a
            } = e, s = D(n), u = I(_, n), c = u.disabled || i, d = (0, l.useComposedRefs)(r, u.onTriggerChange), f = j(n), m = t.useRef("touch"), [h, g, y] = ex(e => {
                let t = f().filter(e => !e.disabled),
                    r = t.find(e => e.value === u.value),
                    n = eb(t, e, r);
                void 0 !== n && u.onValueChange(n.value)
            }), w = e => {
                c || (u.onOpenChange(!0), y()), e && (u.triggerPointerDownPosRef.current = {
                    x: Math.round(e.pageX),
                    y: Math.round(e.pageY)
                })
            };
            return (0, b.jsx)(p.Anchor, {
                asChild: !0,
                ...s,
                children: (0, b.jsx)(v.Primitive.button, {
                    type: "button",
                    role: "combobox",
                    "aria-controls": u.contentId,
                    "aria-expanded": u.open,
                    "aria-required": u.required,
                    "aria-autocomplete": "none",
                    dir: u.dir,
                    "data-state": u.open ? "open" : "closed",
                    disabled: c,
                    "data-disabled": c ? "" : void 0,
                    "data-placeholder": ey(u.value) ? "" : void 0,
                    ...a,
                    ref: d,
                    onClick: (0, o.composeEventHandlers)(a.onClick, e => {
                        e.currentTarget.focus(), "mouse" !== m.current && w(e)
                    }),
                    onPointerDown: (0, o.composeEventHandlers)(a.onPointerDown, e => {
                        m.current = e.pointerType;
                        let t = e.target;
                        t.hasPointerCapture(e.pointerId) && t.releasePointerCapture(e.pointerId), 0 === e.button && !1 === e.ctrlKey && "mouse" === e.pointerType && (w(e), e.preventDefault())
                    }),
                    onKeyDown: (0, o.composeEventHandlers)(a.onKeyDown, e => {
                        let t = "" !== h.current;
                        e.ctrlKey || e.altKey || e.metaKey || 1 !== e.key.length || g(e.key), (!t || " " !== e.key) && S.includes(e.key) && (w(), e.preventDefault())
                    })
                })
            })
        });
    B.displayName = _;
    var W = "SelectValue",
        z = t.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                className: n,
                style: o,
                children: i,
                placeholder: a = "",
                ...s
            } = e, u = I(W, r), {
                onValueNodeHasChildrenChange: c
            } = u, d = void 0 !== i, f = (0, l.useComposedRefs)(t, u.onValueNodeChange);
            return (0, w.useLayoutEffect)(() => {
                c(d)
            }, [c, d]), (0, b.jsx)(v.Primitive.span, {
                ...s,
                ref: f,
                style: {
                    pointerEvents: "none"
                },
                children: ey(u.value) ? (0, b.jsx)(b.Fragment, {
                    children: a
                }) : i
            })
        });
    z.displayName = W;
    var V = t.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            children: n,
            ...o
        } = e;
        return (0, b.jsx)(v.Primitive.span, {
            "aria-hidden": !0,
            ...o,
            ref: t,
            children: n || "▼"
        })
    });
    V.displayName = "SelectIcon";
    var U = e => (0, b.jsx)(m.Portal, {
        asChild: !0,
        ...e
    });
    U.displayName = "SelectPortal";
    var K = "SelectContent",
        Y = t.forwardRef((e, n) => {
            let o = I(K, e.__scopeSelect),
                [i, l] = t.useState();
            return ((0, w.useLayoutEffect)(() => {
                l(new DocumentFragment)
            }, []), o.open) ? (0, b.jsx)(Z, {
                ...e,
                ref: n
            }) : i ? r.createPortal((0, b.jsx)(X, {
                scope: e.__scopeSelect,
                children: (0, b.jsx)(T.Slot, {
                    scope: e.__scopeSelect,
                    children: (0, b.jsx)("div", {
                        children: e.children
                    })
                })
            }), i) : null
        });
    Y.displayName = K;
    var [X, G] = O(K), q = (0, h.createSlot)("SelectContent.RemoveScroll"), Z = t.forwardRef((e, r) => {
        let {
            __scopeSelect: n,
            position: i = "item-aligned",
            onCloseAutoFocus: a,
            onEscapeKeyDown: s,
            onPointerDownOutside: f,
            side: p,
            sideOffset: m,
            align: v,
            alignOffset: h,
            arrowPadding: g,
            collisionBoundary: y,
            collisionPadding: w,
            sticky: x,
            hideWhenDetached: C,
            avoidCollisions: S,
            ...P
        } = e, A = I(K, n), [T, L] = t.useState(null), [O, N] = t.useState(null), D = (0, l.useComposedRefs)(r, e => L(e)), [k, M] = t.useState(null), [H, F] = t.useState(null), _ = j(n), [B, W] = t.useState(!1), z = t.useRef(!1);
        t.useEffect(() => {
            if (T) return (0, R.hideOthers)(T)
        }, [T]), (0, c.useFocusGuards)();
        let V = t.useCallback(e => {
                let [t, ...r] = _().map(e => e.ref.current), [n] = r.slice(-1), o = document.activeElement;
                for (let r of e)
                    if (r === o || (null == r || r.scrollIntoView({
                            block: "nearest"
                        }), r === t && O && (O.scrollTop = 0), r === n && O && (O.scrollTop = O.scrollHeight), null == r || r.focus(), document.activeElement !== o)) return
            }, [_, O]),
            U = t.useCallback(() => V([k, T]), [V, k, T]);
        t.useEffect(() => {
            B && U()
        }, [B, U]);
        let {
            onOpenChange: Y,
            triggerPointerDownPosRef: G
        } = A;
        t.useEffect(() => {
            if (T) {
                let e = {
                        x: 0,
                        y: 0
                    },
                    t = t => {
                        var r, n, o, i;
                        e = {
                            x: Math.abs(Math.round(t.pageX) - (null != (r = null == (o = G.current) ? void 0 : o.x) ? r : 0)),
                            y: Math.abs(Math.round(t.pageY) - (null != (n = null == (i = G.current) ? void 0 : i.y) ? n : 0))
                        }
                    },
                    r = r => {
                        e.x <= 10 && e.y <= 10 ? r.preventDefault() : T.contains(r.target) || Y(!1), document.removeEventListener("pointermove", t), G.current = null
                    };
                return null !== G.current && (document.addEventListener("pointermove", t), document.addEventListener("pointerup", r, {
                    capture: !0,
                    once: !0
                })), () => {
                    document.removeEventListener("pointermove", t), document.removeEventListener("pointerup", r, {
                        capture: !0
                    })
                }
            }
        }, [T, Y, G]), t.useEffect(() => {
            let e = () => Y(!1);
            return window.addEventListener("blur", e), window.addEventListener("resize", e), () => {
                window.removeEventListener("blur", e), window.removeEventListener("resize", e)
            }
        }, [Y]);
        let [Z, Q] = ex(e => {
            let t = _().filter(e => !e.disabled),
                r = t.find(e => e.ref.current === document.activeElement),
                n = eb(t, e, r);
            n && setTimeout(() => n.ref.current.focus())
        }), ee = t.useCallback((e, t, r) => {
            let n = !z.current && !r;
            (void 0 !== A.value && A.value === t || n) && (M(e), n && (z.current = !0))
        }, [A.value]), et = t.useCallback(() => null == T ? void 0 : T.focus(), [T]), er = t.useCallback((e, t, r) => {
            let n = !z.current && !r;
            (void 0 !== A.value && A.value === t || n) && F(e)
        }, [A.value]), en = "popper" === i ? J : $, eo = en === J ? {
            side: p,
            sideOffset: m,
            align: v,
            alignOffset: h,
            arrowPadding: g,
            collisionBoundary: y,
            collisionPadding: w,
            sticky: x,
            hideWhenDetached: C,
            avoidCollisions: S
        } : {};
        return (0, b.jsx)(X, {
            scope: n,
            content: T,
            viewport: O,
            onViewportChange: N,
            itemRefCallback: ee,
            selectedItem: k,
            onItemLeave: et,
            itemTextRefCallback: er,
            focusSelectedItem: U,
            selectedItemText: H,
            position: i,
            isPositioned: B,
            searchRef: Z,
            children: (0, b.jsx)(E.RemoveScroll, {
                as: q,
                allowPinchZoom: !0,
                children: (0, b.jsx)(d.FocusScope, {
                    asChild: !0,
                    trapped: A.open,
                    onMountAutoFocus: e => {
                        e.preventDefault()
                    },
                    onUnmountAutoFocus: (0, o.composeEventHandlers)(a, e => {
                        var t;
                        null == (t = A.trigger) || t.focus({
                            preventScroll: !0
                        }), e.preventDefault()
                    }),
                    children: (0, b.jsx)(u.DismissableLayer, {
                        asChild: !0,
                        disableOutsidePointerEvents: !0,
                        onEscapeKeyDown: s,
                        onPointerDownOutside: f,
                        onFocusOutside: e => e.preventDefault(),
                        onDismiss: () => A.onOpenChange(!1),
                        children: (0, b.jsx)(en, {
                            role: "listbox",
                            id: A.contentId,
                            "data-state": A.open ? "open" : "closed",
                            dir: A.dir,
                            onContextMenu: e => e.preventDefault(),
                            ...P,
                            ...eo,
                            onPlaced: () => W(!0),
                            ref: D,
                            style: {
                                display: "flex",
                                flexDirection: "column",
                                outline: "none",
                                ...P.style
                            },
                            onKeyDown: (0, o.composeEventHandlers)(P.onKeyDown, e => {
                                let t = e.ctrlKey || e.altKey || e.metaKey;
                                if ("Tab" === e.key && e.preventDefault(), t || 1 !== e.key.length || Q(e.key), ["ArrowUp", "ArrowDown", "Home", "End"].includes(e.key)) {
                                    let t = _().filter(e => !e.disabled).map(e => e.ref.current);
                                    if (["ArrowUp", "End"].includes(e.key) && (t = t.slice().reverse()), ["ArrowUp", "ArrowDown"].includes(e.key)) {
                                        let r = e.target,
                                            n = t.indexOf(r);
                                        t = t.slice(n + 1)
                                    }
                                    setTimeout(() => V(t)), e.preventDefault()
                                }
                            })
                        })
                    })
                })
            })
        })
    });
    Z.displayName = "SelectContentImpl";
    var $ = t.forwardRef((e, r) => {
        let {
            __scopeSelect: o,
            onPlaced: i,
            ...a
        } = e, s = I(K, o), u = G(K, o), [c, d] = t.useState(null), [f, p] = t.useState(null), m = (0, l.useComposedRefs)(r, e => p(e)), h = j(o), g = t.useRef(!1), y = t.useRef(!0), {
            viewport: x,
            selectedItem: C,
            selectedItemText: R,
            focusSelectedItem: E
        } = u, S = t.useCallback(() => {
            if (s.trigger && s.valueNode && c && f && x && C && R) {
                let e = s.trigger.getBoundingClientRect(),
                    t = f.getBoundingClientRect(),
                    r = s.valueNode.getBoundingClientRect(),
                    o = R.getBoundingClientRect();
                if ("rtl" !== s.dir) {
                    let i = o.left - t.left,
                        l = r.left - i,
                        a = e.left - l,
                        s = e.width + a,
                        u = Math.max(s, t.width),
                        d = window.innerWidth - 10,
                        f = (0, n.clamp)(l, [10, Math.max(10, d - u)]);
                    c.style.minWidth = s + "px", c.style.left = f + "px"
                } else {
                    let i = t.right - o.right,
                        l = window.innerWidth - r.right - i,
                        a = window.innerWidth - e.right - l,
                        s = e.width + a,
                        u = Math.max(s, t.width),
                        d = window.innerWidth - 10,
                        f = (0, n.clamp)(l, [10, Math.max(10, d - u)]);
                    c.style.minWidth = s + "px", c.style.right = f + "px"
                }
                let l = h(),
                    a = window.innerHeight - 20,
                    u = x.scrollHeight,
                    d = window.getComputedStyle(f),
                    p = parseInt(d.borderTopWidth, 10),
                    m = parseInt(d.paddingTop, 10),
                    v = parseInt(d.borderBottomWidth, 10),
                    y = p + m + u + parseInt(d.paddingBottom, 10) + v,
                    w = Math.min(5 * C.offsetHeight, y),
                    b = window.getComputedStyle(x),
                    E = parseInt(b.paddingTop, 10),
                    S = parseInt(b.paddingBottom, 10),
                    P = e.top + e.height / 2 - 10,
                    A = C.offsetHeight / 2,
                    T = p + m + (C.offsetTop + A);
                if (T <= P) {
                    let e = l.length > 0 && C === l[l.length - 1].ref.current;
                    c.style.bottom = "0px";
                    let t = Math.max(a - P, A + (e ? S : 0) + (f.clientHeight - x.offsetTop - x.offsetHeight) + v);
                    c.style.height = T + t + "px"
                } else {
                    let e = l.length > 0 && C === l[0].ref.current;
                    c.style.top = "0px";
                    let t = Math.max(P, p + x.offsetTop + (e ? E : 0) + A);
                    c.style.height = t + (y - T) + "px", x.scrollTop = T - P + x.offsetTop
                }
                c.style.margin = "".concat(10, "px 0"), c.style.minHeight = w + "px", c.style.maxHeight = a + "px", null == i || i(), requestAnimationFrame(() => g.current = !0)
            }
        }, [h, s.trigger, s.valueNode, c, f, x, C, R, s.dir, i]);
        (0, w.useLayoutEffect)(() => S(), [S]);
        let [P, A] = t.useState();
        (0, w.useLayoutEffect)(() => {
            f && A(window.getComputedStyle(f).zIndex)
        }, [f]);
        let T = t.useCallback(e => {
            e && !0 === y.current && (S(), null == E || E(), y.current = !1)
        }, [S, E]);
        return (0, b.jsx)(Q, {
            scope: o,
            contentWrapper: c,
            shouldExpandOnScrollRef: g,
            onScrollButtonChange: T,
            children: (0, b.jsx)("div", {
                ref: d,
                style: {
                    display: "flex",
                    flexDirection: "column",
                    position: "fixed",
                    zIndex: P
                },
                children: (0, b.jsx)(v.Primitive.div, {
                    ...a,
                    ref: m,
                    style: {
                        boxSizing: "border-box",
                        maxHeight: "100%",
                        ...a.style
                    }
                })
            })
        })
    });
    $.displayName = "SelectItemAlignedPosition";
    var J = t.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            align: n = "start",
            collisionPadding: o = 10,
            ...i
        } = e, l = D(r);
        return (0, b.jsx)(p.Content, {
            ...l,
            ...i,
            ref: t,
            align: n,
            collisionPadding: o,
            style: {
                boxSizing: "border-box",
                ...i.style,
                "--radix-select-content-transform-origin": "var(--radix-popper-transform-origin)",
                "--radix-select-content-available-width": "var(--radix-popper-available-width)",
                "--radix-select-content-available-height": "var(--radix-popper-available-height)",
                "--radix-select-trigger-width": "var(--radix-popper-anchor-width)",
                "--radix-select-trigger-height": "var(--radix-popper-anchor-height)"
            }
        })
    });
    J.displayName = "SelectPopperPosition";
    var [Q, ee] = O(K, {}), et = "SelectViewport", er = t.forwardRef((e, r) => {
        let {
            __scopeSelect: n,
            nonce: i,
            ...a
        } = e, s = G(et, n), u = ee(et, n), c = (0, l.useComposedRefs)(r, s.onViewportChange), d = t.useRef(0);
        return (0, b.jsxs)(b.Fragment, {
            children: [(0, b.jsx)("style", {
                dangerouslySetInnerHTML: {
                    __html: "[data-radix-select-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-select-viewport]::-webkit-scrollbar{display:none}"
                },
                nonce: i
            }), (0, b.jsx)(T.Slot, {
                scope: n,
                children: (0, b.jsx)(v.Primitive.div, {
                    "data-radix-select-viewport": "",
                    role: "presentation",
                    ...a,
                    ref: c,
                    style: {
                        position: "relative",
                        flex: 1,
                        overflow: "hidden auto",
                        ...a.style
                    },
                    onScroll: (0, o.composeEventHandlers)(a.onScroll, e => {
                        let t = e.currentTarget,
                            {
                                contentWrapper: r,
                                shouldExpandOnScrollRef: n
                            } = u;
                        if ((null == n ? void 0 : n.current) && r) {
                            let e = Math.abs(d.current - t.scrollTop);
                            if (e > 0) {
                                let n = window.innerHeight - 20,
                                    o = Math.max(parseFloat(r.style.minHeight), parseFloat(r.style.height));
                                if (o < n) {
                                    let i = o + e,
                                        l = Math.min(n, i),
                                        a = i - l;
                                    r.style.height = l + "px", "0px" === r.style.bottom && (t.scrollTop = a > 0 ? a : 0, r.style.justifyContent = "flex-end")
                                }
                            }
                        }
                        d.current = t.scrollTop
                    })
                })
            })]
        })
    });
    er.displayName = et;
    var en = "SelectGroup",
        [eo, ei] = O(en);
    t.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e, o = (0, f.useId)();
        return (0, b.jsx)(eo, {
            scope: r,
            id: o,
            children: (0, b.jsx)(v.Primitive.div, {
                role: "group",
                "aria-labelledby": o,
                ...n,
                ref: t
            })
        })
    }).displayName = en;
    var el = "SelectLabel";
    t.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e, o = ei(el, r);
        return (0, b.jsx)(v.Primitive.div, {
            id: o.id,
            ...n,
            ref: t
        })
    }).displayName = el;
    var ea = "SelectItem",
        [es, eu] = O(ea),
        ec = t.forwardRef((e, r) => {
            let {
                __scopeSelect: n,
                value: i,
                disabled: a = !1,
                textValue: s,
                ...u
            } = e, c = I(ea, n), d = G(ea, n), p = c.value === i, [m, h] = t.useState(null != s ? s : ""), [g, y] = t.useState(!1), w = (0, l.useComposedRefs)(r, e => {
                var t;
                return null == (t = d.itemRefCallback) ? void 0 : t.call(d, e, i, a)
            }), x = (0, f.useId)(), C = t.useRef("touch"), R = () => {
                a || (c.onValueChange(i), c.onOpenChange(!1))
            };
            if ("" === i) throw Error("A <Select.Item /> must have a value prop that is not an empty string. This is because the Select value can be set to an empty string to clear the selection and show the placeholder.");
            return (0, b.jsx)(es, {
                scope: n,
                value: i,
                disabled: a,
                textId: x,
                isSelected: p,
                onItemTextChange: t.useCallback(e => {
                    h(t => {
                        var r;
                        return t || (null != (r = null == e ? void 0 : e.textContent) ? r : "").trim()
                    })
                }, []),
                children: (0, b.jsx)(T.ItemSlot, {
                    scope: n,
                    value: i,
                    disabled: a,
                    textValue: m,
                    children: (0, b.jsx)(v.Primitive.div, {
                        role: "option",
                        "aria-labelledby": x,
                        "data-highlighted": g ? "" : void 0,
                        "aria-selected": p && g,
                        "data-state": p ? "checked" : "unchecked",
                        "aria-disabled": a || void 0,
                        "data-disabled": a ? "" : void 0,
                        tabIndex: a ? void 0 : -1,
                        ...u,
                        ref: w,
                        onFocus: (0, o.composeEventHandlers)(u.onFocus, () => y(!0)),
                        onBlur: (0, o.composeEventHandlers)(u.onBlur, () => y(!1)),
                        onClick: (0, o.composeEventHandlers)(u.onClick, () => {
                            "mouse" !== C.current && R()
                        }),
                        onPointerUp: (0, o.composeEventHandlers)(u.onPointerUp, () => {
                            "mouse" === C.current && R()
                        }),
                        onPointerDown: (0, o.composeEventHandlers)(u.onPointerDown, e => {
                            C.current = e.pointerType
                        }),
                        onPointerMove: (0, o.composeEventHandlers)(u.onPointerMove, e => {
                            if (C.current = e.pointerType, a) {
                                var t;
                                null == (t = d.onItemLeave) || t.call(d)
                            } else "mouse" === C.current && e.currentTarget.focus({
                                preventScroll: !0
                            })
                        }),
                        onPointerLeave: (0, o.composeEventHandlers)(u.onPointerLeave, e => {
                            if (e.currentTarget === document.activeElement) {
                                var t;
                                null == (t = d.onItemLeave) || t.call(d)
                            }
                        }),
                        onKeyDown: (0, o.composeEventHandlers)(u.onKeyDown, e => {
                            var t;
                            ((null == (t = d.searchRef) ? void 0 : t.current) === "" || " " !== e.key) && (P.includes(e.key) && R(), " " === e.key && e.preventDefault())
                        })
                    })
                })
            })
        });
    ec.displayName = ea;
    var ed = "SelectItemText",
        ef = t.forwardRef((e, n) => {
            let {
                __scopeSelect: o,
                className: i,
                style: a,
                ...s
            } = e, u = I(ed, o), c = G(ed, o), d = eu(ed, o), f = H(ed, o), [p, m] = t.useState(null), h = (0, l.useComposedRefs)(n, e => m(e), d.onItemTextChange, e => {
                var t;
                return null == (t = c.itemTextRefCallback) ? void 0 : t.call(c, e, d.value, d.disabled)
            }), g = null == p ? void 0 : p.textContent, y = t.useMemo(() => (0, b.jsx)("option", {
                value: d.value,
                disabled: d.disabled,
                children: g
            }, d.value), [d.disabled, d.value, g]), {
                onNativeOptionAdd: x,
                onNativeOptionRemove: C
            } = f;
            return (0, w.useLayoutEffect)(() => (x(y), () => C(y)), [x, C, y]), (0, b.jsxs)(b.Fragment, {
                children: [(0, b.jsx)(v.Primitive.span, {
                    id: d.textId,
                    ...s,
                    ref: h
                }), d.isSelected && u.valueNode && !u.valueNodeHasChildren ? r.createPortal(s.children, u.valueNode) : null]
            })
        });
    ef.displayName = ed;
    var ep = "SelectItemIndicator";
    t.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e;
        return eu(ep, r).isSelected ? (0, b.jsx)(v.Primitive.span, {
            "aria-hidden": !0,
            ...n,
            ref: t
        }) : null
    }).displayName = ep;
    var em = "SelectScrollUpButton";
    t.forwardRef((e, r) => {
        let n = G(em, e.__scopeSelect),
            o = ee(em, e.__scopeSelect),
            [i, a] = t.useState(!1),
            s = (0, l.useComposedRefs)(r, o.onScrollButtonChange);
        return (0, w.useLayoutEffect)(() => {
            if (n.viewport && n.isPositioned) {
                let e = function() {
                        a(t.scrollTop > 0)
                    },
                    t = n.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [n.viewport, n.isPositioned]), i ? (0, b.jsx)(eh, {
            ...e,
            ref: s,
            onAutoScroll: () => {
                let {
                    viewport: e,
                    selectedItem: t
                } = n;
                e && t && (e.scrollTop = e.scrollTop - t.offsetHeight)
            }
        }) : null
    }).displayName = em;
    var ev = "SelectScrollDownButton";
    t.forwardRef((e, r) => {
        let n = G(ev, e.__scopeSelect),
            o = ee(ev, e.__scopeSelect),
            [i, a] = t.useState(!1),
            s = (0, l.useComposedRefs)(r, o.onScrollButtonChange);
        return (0, w.useLayoutEffect)(() => {
            if (n.viewport && n.isPositioned) {
                let e = function() {
                        let e = t.scrollHeight - t.clientHeight;
                        a(Math.ceil(t.scrollTop) < e)
                    },
                    t = n.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [n.viewport, n.isPositioned]), i ? (0, b.jsx)(eh, {
            ...e,
            ref: s,
            onAutoScroll: () => {
                let {
                    viewport: e,
                    selectedItem: t
                } = n;
                e && t && (e.scrollTop = e.scrollTop + t.offsetHeight)
            }
        }) : null
    }).displayName = ev;
    var eh = t.forwardRef((e, r) => {
        let {
            __scopeSelect: n,
            onAutoScroll: i,
            ...l
        } = e, a = G("SelectScrollButton", n), s = t.useRef(null), u = j(n), c = t.useCallback(() => {
            null !== s.current && (window.clearInterval(s.current), s.current = null)
        }, []);
        return t.useEffect(() => () => c(), [c]), (0, w.useLayoutEffect)(() => {
            var e;
            let t = u().find(e => e.ref.current === document.activeElement);
            null == t || null == (e = t.ref.current) || e.scrollIntoView({
                block: "nearest"
            })
        }, [u]), (0, b.jsx)(v.Primitive.div, {
            "aria-hidden": !0,
            ...l,
            ref: r,
            style: {
                flexShrink: 0,
                ...l.style
            },
            onPointerDown: (0, o.composeEventHandlers)(l.onPointerDown, () => {
                null === s.current && (s.current = window.setInterval(i, 50))
            }),
            onPointerMove: (0, o.composeEventHandlers)(l.onPointerMove, () => {
                var e;
                null == (e = a.onItemLeave) || e.call(a), null === s.current && (s.current = window.setInterval(i, 50))
            }),
            onPointerLeave: (0, o.composeEventHandlers)(l.onPointerLeave, () => {
                c()
            })
        })
    });
    t.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e;
        return (0, b.jsx)(v.Primitive.div, {
            "aria-hidden": !0,
            ...n,
            ref: t
        })
    }).displayName = "SelectSeparator";
    var eg = "SelectArrow";

    function ey(e) {
        return "" === e || void 0 === e
    }
    t.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e, o = D(r), i = I(eg, r), l = G(eg, r);
        return i.open && "popper" === l.position ? (0, b.jsx)(p.Arrow, {
            ...o,
            ...n,
            ref: t
        }) : null
    }).displayName = eg;
    var ew = t.forwardRef((e, r) => {
        let {
            value: n,
            ...o
        } = e, i = t.useRef(null), a = (0, l.useComposedRefs)(r, i), s = (0, x.usePrevious)(n);
        return t.useEffect(() => {
            let e = i.current,
                t = Object.getOwnPropertyDescriptor(window.HTMLSelectElement.prototype, "value").set;
            if (s !== n && t) {
                let r = new Event("change", {
                    bubbles: !0
                });
                t.call(e, n), e.dispatchEvent(r)
            }
        }, [s, n]), (0, b.jsx)(C, {
            asChild: !0,
            children: (0, b.jsx)("select", {
                ...o,
                ref: a,
                defaultValue: n
            })
        })
    });

    function ex(e) {
        let r = (0, g.useCallbackRef)(e),
            n = t.useRef(""),
            o = t.useRef(0),
            i = t.useCallback(e => {
                let t = n.current + e;
                r(t),
                    function e(t) {
                        n.current = t, window.clearTimeout(o.current), "" !== t && (o.current = window.setTimeout(() => e(""), 1e3))
                    }(t)
            }, [r]),
            l = t.useCallback(() => {
                n.current = "", window.clearTimeout(o.current)
            }, []);
        return t.useEffect(() => () => window.clearTimeout(o.current), []), [n, i, l]
    }

    function eb(e, t, r) {
        var n, o;
        let i = t.length > 1 && Array.from(t).every(e => e === t[0]) ? t[0] : t,
            l = r ? e.indexOf(r) : -1,
            a = (n = e, o = Math.max(l, 0), n.map((e, t) => n[(o + t) % n.length]));
        1 === i.length && (a = a.filter(e => e !== r));
        let s = a.find(e => e.textValue.toLowerCase().startsWith(i.toLowerCase()));
        return s !== r ? s : void 0
    }
    ew.displayName = "BubbleSelect", e.s(["Content", 0, Y, "Icon", 0, V, "Item", 0, ec, "ItemText", 0, ef, "Portal", 0, U, "Root", 0, F, "Trigger", 0, B, "Value", 0, z, "Viewport", 0, er], 563921)
}, 76992, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(78892),
        n = e.i(221628),
        o = Symbol("radix.slottable");

    function i(e) {
        return t.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === o
    }
    e.s(["createSlot", 0, function(e) {
        var o;
        let l, a = (o = e, (l = t.forwardRef((e, n) => {
                let {
                    children: o,
                    ...i
                } = e;
                if (t.isValidElement(o)) {
                    var l, a, s;
                    let e, u, c = (u = (e = null == (a = Object.getOwnPropertyDescriptor((l = o).props, "ref")) ? void 0 : a.get) && "isReactWarning" in e && e.isReactWarning) ? l.ref : (u = (e = null == (s = Object.getOwnPropertyDescriptor(l, "ref")) ? void 0 : s.get) && "isReactWarning" in e && e.isReactWarning) ? l.props.ref : l.props.ref || l.ref,
                        d = function(e, t) {
                            let r = {
                                ...t
                            };
                            for (let n in t) {
                                let o = e[n],
                                    i = t[n];
                                /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                    let n = i(...t);
                                    return o(...t), n
                                } : o && (r[n] = o) : "style" === n ? r[n] = {
                                    ...o,
                                    ...i
                                } : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                            }
                            return {
                                ...e,
                                ...r
                            }
                        }(i, o.props);
                    return o.type !== t.Fragment && (d.ref = n ? (0, r.composeRefs)(n, c) : c), t.cloneElement(o, d)
                }
                return t.Children.count(o) > 1 ? t.Children.only(null) : null
            })).displayName = "".concat(o, ".SlotClone"), l),
            s = t.forwardRef((e, r) => {
                let {
                    children: o,
                    ...l
                } = e, s = t.Children.toArray(o), u = s.find(i);
                if (u) {
                    let e = u.props.children,
                        o = s.map(r => r !== u ? r : t.Children.count(e) > 1 ? t.Children.only(null) : t.isValidElement(e) ? e.props.children : null);
                    return (0, n.jsx)(a, {
                        ...l,
                        ref: r,
                        children: t.isValidElement(e) ? t.cloneElement(e, void 0, o) : null
                    })
                }
                return (0, n.jsx)(a, {
                    ...l,
                    ref: r,
                    children: o
                })
            });
        return s.displayName = "".concat(e, ".Slot"), s
    }])
}, 199786, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(723570);
    t[" useEffectEvent ".trim().toString()], t[" useInsertionEffect ".trim().toString()];
    var n = t[" useInsertionEffect ".trim().toString()] || r.useLayoutEffect;
    Symbol("RADIX:SYNC_STATE"), e.s(["useControllableState", 0, function(e) {
        let {
            prop: r,
            defaultProp: o,
            onChange: i = () => {},
            caller: l
        } = e, [a, s, u] = function(e) {
            let {
                defaultProp: r,
                onChange: o
            } = e, [i, l] = t.useState(r), a = t.useRef(i), s = t.useRef(o);
            return n(() => {
                s.current = o
            }, [o]), t.useEffect(() => {
                if (a.current !== i) {
                    var e;
                    null == (e = s.current) || e.call(s, i), a.current = i
                }
            }, [i, a]), [i, l, s]
        }({
            defaultProp: o,
            onChange: i
        }), c = void 0 !== r, d = c ? r : a;
        {
            let e = t.useRef(void 0 !== r);
            t.useEffect(() => {
                let t = e.current;
                if (t !== c) {
                    let e = c ? "controlled" : "uncontrolled";
                    console.warn("".concat(l, " is changing from ").concat(t ? "controlled" : "uncontrolled", " to ").concat(e, ". Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component."))
                }
                e.current = c
            }, [c, l])
        }
        return [d, t.useCallback(e => {
            if (c) {
                let n = "function" == typeof e ? e(r) : e;
                if (n !== r) {
                    var t;
                    null == (t = u.current) || t.call(u, n)
                }
            } else s(e)
        }, [c, r, s, u])]
    }], 199786)
}, 300792, e => {
    "use strict";
    var t = e.i(416340);
    e.s(["usePrevious", 0, function(e) {
        let r = t.useRef({
            value: e,
            previous: e
        });
        return t.useMemo(() => (r.current.value !== e && (r.current.previous = r.current.value, r.current.value = e), r.current.previous), [e])
    }])
}, 692166, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(723570);
    e.s(["useSize", 0, function(e) {
        let [n, o] = t.useState(void 0);
        return (0, r.useLayoutEffect)(() => {
            if (e) {
                o({
                    width: e.offsetWidth,
                    height: e.offsetHeight
                });
                let t = new ResizeObserver(t => {
                    let r, n;
                    if (!Array.isArray(t) || !t.length) return;
                    let i = t[0];
                    if ("borderBoxSize" in i) {
                        let e = i.borderBoxSize,
                            t = Array.isArray(e) ? e[0] : e;
                        r = t.inlineSize, n = t.blockSize
                    } else r = e.offsetWidth, n = e.offsetHeight;
                    o({
                        width: r,
                        height: n
                    })
                });
                return t.observe(e, {
                    box: "border-box"
                }), () => t.unobserve(e)
            }
            o(void 0)
        }, [e]), n
    }])
}, 508019, 989665, e => {
    "use strict";
    var t = e.i(766876),
        r = e.i(197649),
        n = e.i(416340),
        o = e.i(357716),
        i = e.i(195560),
        l = e.i(978437),
        a = e.i(326301),
        s = e.i(636598),
        u = e.i(297452),
        c = e.i(992486),
        d = e.i(791634),
        f = e.i(221628),
        p = n.forwardRef((e, t) => {
            let {
                children: r,
                width: n = 10,
                height: o = 5,
                ...i
            } = e;
            return (0, f.jsx)(d.Primitive.svg, {
                ...i,
                ref: t,
                width: n,
                height: o,
                viewBox: "0 0 30 10",
                preserveAspectRatio: "none",
                children: e.asChild ? r : (0, f.jsx)("polygon", {
                    points: "0,0 30,0 15,10"
                })
            })
        });
    p.displayName = "Arrow";
    var m = e.i(448970),
        v = e.i(993032),
        h = "Popper",
        [g, y] = (0, l.createContextScope)(h),
        [w, x] = g(h),
        b = e => {
            let {
                __scopePopper: t,
                children: r
            } = e, [o, i] = n.useState(null);
            return (0, f.jsx)(w, {
                scope: t,
                anchor: o,
                onAnchorChange: i,
                children: r
            })
        };
    b.displayName = h;
    var C = "PopperAnchor",
        R = n.forwardRef((e, t) => {
            let {
                __scopePopper: r,
                virtualRef: o,
                ...l
            } = e, a = x(C, r), s = n.useRef(null), u = (0, i.useComposedRefs)(t, s);
            return n.useEffect(() => {
                a.onAnchorChange((null == o ? void 0 : o.current) || s.current)
            }), o ? null : (0, f.jsx)(d.Primitive.div, {
                ...l,
                ref: u
            })
        });
    R.displayName = C;
    var E = "PopperContent",
        [S, P] = g(E),
        A = n.forwardRef((e, t) => {
            var r, o, l, a, s, p, h, g;
            let {
                __scopePopper: y,
                side: w = "bottom",
                sideOffset: b = 0,
                align: C = "center",
                alignOffset: R = 0,
                arrowPadding: P = 0,
                avoidCollisions: A = !0,
                collisionBoundary: T = [],
                collisionPadding: j = 0,
                sticky: L = "partial",
                hideWhenDetached: k = !1,
                updatePositionStrategy: I = "optimized",
                onPlaced: M,
                ...H
            } = e, F = x(E, y), [_, B] = n.useState(null), W = (0, i.useComposedRefs)(t, e => B(e)), [z, V] = n.useState(null), U = function(e) {
                let [t, r] = n.useState(void 0);
                return (0, v.useLayoutEffect)(() => {
                    if (e) {
                        r({
                            width: e.offsetWidth,
                            height: e.offsetHeight
                        });
                        let t = new ResizeObserver(t => {
                            let n, o;
                            if (!Array.isArray(t) || !t.length) return;
                            let i = t[0];
                            if ("borderBoxSize" in i) {
                                let e = i.borderBoxSize,
                                    t = Array.isArray(e) ? e[0] : e;
                                n = t.inlineSize, o = t.blockSize
                            } else n = e.offsetWidth, o = e.offsetHeight;
                            r({
                                width: n,
                                height: o
                            })
                        });
                        return t.observe(e, {
                            box: "border-box"
                        }), () => t.unobserve(e)
                    }
                    r(void 0)
                }, [e]), t
            }(z), K = null != (r = null == U ? void 0 : U.width) ? r : 0, Y = null != (o = null == U ? void 0 : U.height) ? o : 0, X = "number" == typeof j ? j : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...j
            }, G = Array.isArray(T) ? T : [T], q = G.length > 0, Z = {
                padding: X,
                boundary: G.filter(O),
                altBoundary: q
            }, {
                refs: $,
                floatingStyles: J,
                placement: Q,
                isPositioned: ee,
                middlewareData: et
            } = (0, u.useFloating)({
                strategy: "fixed",
                placement: w + ("center" !== C ? "-" + C : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return (0, c.autoUpdate)(...t, {
                        animationFrame: "always" === I
                    })
                },
                elements: {
                    reference: F.anchor
                },
                middleware: [(0, u.offset)({
                    mainAxis: b + Y,
                    alignmentAxis: R
                }), A && (0, u.shift)({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === L ? (0, u.limitShift)() : void 0,
                    ...Z
                }), A && (0, u.flip)({
                    ...Z
                }), (0, u.size)({
                    ...Z,
                    apply: e => {
                        let {
                            elements: t,
                            rects: r,
                            availableWidth: n,
                            availableHeight: o
                        } = e, {
                            width: i,
                            height: l
                        } = r.reference, a = t.floating.style;
                        a.setProperty("--radix-popper-available-width", "".concat(n, "px")), a.setProperty("--radix-popper-available-height", "".concat(o, "px")), a.setProperty("--radix-popper-anchor-width", "".concat(i, "px")), a.setProperty("--radix-popper-anchor-height", "".concat(l, "px"))
                    }
                }), z && (0, u.arrow)({
                    element: z,
                    padding: P
                }), N({
                    arrowWidth: K,
                    arrowHeight: Y
                }), k && (0, u.hide)({
                    strategy: "referenceHidden",
                    ...Z
                })]
            }), [er, en] = D(Q), eo = (0, m.useCallbackRef)(M);
            (0, v.useLayoutEffect)(() => {
                ee && (null == eo || eo())
            }, [ee, eo]);
            let ei = null == (l = et.arrow) ? void 0 : l.x,
                el = null == (a = et.arrow) ? void 0 : a.y,
                ea = (null == (s = et.arrow) ? void 0 : s.centerOffset) !== 0,
                [es, eu] = n.useState();
            return (0, v.useLayoutEffect)(() => {
                _ && eu(window.getComputedStyle(_).zIndex)
            }, [_]), (0, f.jsx)("div", {
                ref: $.setFloating,
                "data-radix-popper-content-wrapper": "",
                style: {
                    ...J,
                    transform: ee ? J.transform : "translate(0, -200%)",
                    minWidth: "max-content",
                    zIndex: es,
                    "--radix-popper-transform-origin": [null == (p = et.transformOrigin) ? void 0 : p.x, null == (h = et.transformOrigin) ? void 0 : h.y].join(" "),
                    ...(null == (g = et.hide) ? void 0 : g.referenceHidden) && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, f.jsx)(S, {
                    scope: y,
                    placedSide: er,
                    onArrowChange: V,
                    arrowX: ei,
                    arrowY: el,
                    shouldHideArrow: ea,
                    children: (0, f.jsx)(d.Primitive.div, {
                        "data-side": er,
                        "data-align": en,
                        ...H,
                        ref: W,
                        style: {
                            ...H.style,
                            animation: ee ? void 0 : "none"
                        }
                    })
                })
            })
        });
    A.displayName = E;
    var T = "PopperArrow",
        j = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        L = n.forwardRef(function(e, t) {
            let {
                __scopePopper: r,
                ...n
            } = e, o = P(T, r), i = j[o.placedSide];
            return (0, f.jsx)("span", {
                ref: o.onArrowChange,
                style: {
                    position: "absolute",
                    left: o.arrowX,
                    top: o.arrowY,
                    [i]: 0,
                    transformOrigin: {
                        top: "",
                        right: "0 0",
                        bottom: "center 0",
                        left: "100% 0"
                    } [o.placedSide],
                    transform: {
                        top: "translateY(100%)",
                        right: "translateY(50%) rotate(90deg) translateX(-50%)",
                        bottom: "rotate(180deg)",
                        left: "translateY(50%) rotate(-90deg) translateX(50%)"
                    } [o.placedSide],
                    visibility: o.shouldHideArrow ? "hidden" : void 0
                },
                children: (0, f.jsx)(p, {
                    ...n,
                    ref: t,
                    style: {
                        ...n.style,
                        display: "block"
                    }
                })
            })
        });

    function O(e) {
        return null !== e
    }
    L.displayName = T;
    var N = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            var r, n, o, i, l;
            let {
                placement: a,
                rects: s,
                middlewareData: u
            } = t, c = (null == (o = u.arrow) ? void 0 : o.centerOffset) !== 0, d = c ? 0 : e.arrowWidth, f = c ? 0 : e.arrowHeight, [p, m] = D(a), v = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [m], h = (null != (r = null == (i = u.arrow) ? void 0 : i.x) ? r : 0) + d / 2, g = (null != (n = null == (l = u.arrow) ? void 0 : l.y) ? n : 0) + f / 2, y = "", w = "";
            return "bottom" === p ? (y = c ? v : "".concat(h, "px"), w = "".concat(-f, "px")) : "top" === p ? (y = c ? v : "".concat(h, "px"), w = "".concat(s.floating.height + f, "px")) : "right" === p ? (y = "".concat(-f, "px"), w = c ? v : "".concat(g, "px")) : "left" === p && (y = "".concat(s.floating.width + f, "px"), w = c ? v : "".concat(g, "px")), {
                data: {
                    x: y,
                    y: w
                }
            }
        }
    });

    function D(e) {
        let [t, r = "center"] = e.split("-");
        return [t, r]
    }
    var k = e.i(149285),
        I = n.forwardRef((e, t) => {
            var r, o;
            let {
                container: i,
                ...l
            } = e, [a, s] = n.useState(!1);
            (0, v.useLayoutEffect)(() => s(!0), []);
            let u = i || a && (null == (o = globalThis) || null == (r = o.document) ? void 0 : r.body);
            return u ? k.default.createPortal((0, f.jsx)(d.Primitive.div, {
                ...l,
                ref: t
            }), u) : null
        });
    I.displayName = "Portal";
    var M = e => {
        var t, r, o;
        let l, a, {
                present: s,
                children: u
            } = e,
            c = function(e) {
                var t, r;
                let [o, i] = n.useState(), l = n.useRef({}), a = n.useRef(e), s = n.useRef("none"), [u, c] = (t = e ? "mounted" : "unmounted", r = {
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
                }, n.useReducer((e, t) => {
                    let n = r[e][t];
                    return null != n ? n : e
                }, t));
                return n.useEffect(() => {
                    let e = H(l.current);
                    s.current = "mounted" === u ? e : "none"
                }, [u]), (0, v.useLayoutEffect)(() => {
                    let t = l.current,
                        r = a.current;
                    if (r !== e) {
                        let n = s.current,
                            o = H(t);
                        e ? c("MOUNT") : "none" === o || (null == t ? void 0 : t.display) === "none" ? c("UNMOUNT") : r && n !== o ? c("ANIMATION_OUT") : c("UNMOUNT"), a.current = e
                    }
                }, [e, c]), (0, v.useLayoutEffect)(() => {
                    if (o) {
                        var e;
                        let t, r = null != (e = o.ownerDocument.defaultView) ? e : window,
                            n = e => {
                                let n = H(l.current).includes(e.animationName);
                                if (e.target === o && n && (c("ANIMATION_END"), !a.current)) {
                                    let e = o.style.animationFillMode;
                                    o.style.animationFillMode = "forwards", t = r.setTimeout(() => {
                                        "forwards" === o.style.animationFillMode && (o.style.animationFillMode = e)
                                    })
                                }
                            },
                            i = e => {
                                e.target === o && (s.current = H(l.current))
                            };
                        return o.addEventListener("animationstart", i), o.addEventListener("animationcancel", n), o.addEventListener("animationend", n), () => {
                            r.clearTimeout(t), o.removeEventListener("animationstart", i), o.removeEventListener("animationcancel", n), o.removeEventListener("animationend", n)
                        }
                    }
                    c("ANIMATION_END")
                }, [o, c]), {
                    isPresent: ["mounted", "unmountSuspended"].includes(u),
                    ref: n.useCallback(e => {
                        e && (l.current = getComputedStyle(e)), i(e)
                    }, [])
                }
            }(s),
            d = "function" == typeof u ? u({
                present: c.isPresent
            }) : n.Children.only(u),
            f = (0, i.useComposedRefs)(c.ref, (a = (l = null == (r = Object.getOwnPropertyDescriptor((t = d).props, "ref")) ? void 0 : r.get) && "isReactWarning" in l && l.isReactWarning) ? t.ref : (a = (l = null == (o = Object.getOwnPropertyDescriptor(t, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? t.props.ref : t.props.ref || t.ref);
        return "function" == typeof u || c.isPresent ? n.cloneElement(d, {
            ref: f
        }) : null
    };

    function H(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    M.displayName = "Presence";
    var F = e.i(362496),
        _ = n.forwardRef((e, t) => (0, f.jsx)(d.Primitive.span, {
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
    var [B, W] = (0, l.createContextScope)("Tooltip", [y]), z = y(), V = "TooltipProvider", U = "tooltip.open", [K, Y] = B(V), X = e => {
        let {
            __scopeTooltip: t,
            delayDuration: r = 700,
            skipDelayDuration: o = 300,
            disableHoverableContent: i = !1,
            children: l
        } = e, [a, s] = n.useState(!0), u = n.useRef(!1), c = n.useRef(0);
        return n.useEffect(() => {
            let e = c.current;
            return () => window.clearTimeout(e)
        }, []), (0, f.jsx)(K, {
            scope: t,
            isOpenDelayed: a,
            delayDuration: r,
            onOpen: n.useCallback(() => {
                window.clearTimeout(c.current), s(!1)
            }, []),
            onClose: n.useCallback(() => {
                window.clearTimeout(c.current), c.current = window.setTimeout(() => s(!0), o)
            }, [o]),
            isPointerInTransitRef: u,
            onPointerInTransitChange: n.useCallback(e => {
                u.current = e
            }, []),
            disableHoverableContent: i,
            children: l
        })
    };
    X.displayName = V;
    var G = "Tooltip",
        [q, Z] = B(G),
        $ = e => {
            let {
                __scopeTooltip: t,
                children: r,
                open: o,
                defaultOpen: i = !1,
                onOpenChange: l,
                disableHoverableContent: a,
                delayDuration: u
            } = e, c = Y(G, e.__scopeTooltip), d = z(t), [p, v] = n.useState(null), h = (0, s.useId)(), g = n.useRef(0), y = null != a ? a : c.disableHoverableContent, w = null != u ? u : c.delayDuration, x = n.useRef(!1), [C = !1, R] = function(e) {
                let {
                    prop: t,
                    defaultProp: r,
                    onChange: o = () => {}
                } = e, [i, l] = function(e) {
                    let {
                        defaultProp: t,
                        onChange: r
                    } = e, o = n.useState(t), [i] = o, l = n.useRef(i), a = (0, m.useCallbackRef)(r);
                    return n.useEffect(() => {
                        l.current !== i && (a(i), l.current = i)
                    }, [i, l, a]), o
                }({
                    defaultProp: r,
                    onChange: o
                }), a = void 0 !== t, s = a ? t : i, u = (0, m.useCallbackRef)(o);
                return [s, n.useCallback(e => {
                    if (a) {
                        let r = "function" == typeof e ? e(t) : e;
                        r !== t && u(r)
                    } else l(e)
                }, [a, t, l, u])]
            }({
                prop: o,
                defaultProp: i,
                onChange: e => {
                    e ? (c.onOpen(), document.dispatchEvent(new CustomEvent(U))) : c.onClose(), null == l || l(e)
                }
            }), E = n.useMemo(() => C ? x.current ? "delayed-open" : "instant-open" : "closed", [C]), S = n.useCallback(() => {
                window.clearTimeout(g.current), g.current = 0, x.current = !1, R(!0)
            }, [R]), P = n.useCallback(() => {
                window.clearTimeout(g.current), g.current = 0, R(!1)
            }, [R]), A = n.useCallback(() => {
                window.clearTimeout(g.current), g.current = window.setTimeout(() => {
                    x.current = !0, R(!0), g.current = 0
                }, w)
            }, [w, R]);
            return n.useEffect(() => () => {
                g.current && (window.clearTimeout(g.current), g.current = 0)
            }, []), (0, f.jsx)(b, {
                ...d,
                children: (0, f.jsx)(q, {
                    scope: t,
                    contentId: h,
                    open: C,
                    stateAttribute: E,
                    trigger: p,
                    onTriggerChange: v,
                    onTriggerEnter: n.useCallback(() => {
                        c.isOpenDelayed ? A() : S()
                    }, [c.isOpenDelayed, A, S]),
                    onTriggerLeave: n.useCallback(() => {
                        y ? P() : (window.clearTimeout(g.current), g.current = 0)
                    }, [P, y]),
                    onOpen: S,
                    onClose: P,
                    disableHoverableContent: y,
                    children: r
                })
            })
        };
    $.displayName = G;
    var J = "TooltipTrigger",
        Q = n.forwardRef((e, t) => {
            let {
                __scopeTooltip: r,
                ...l
            } = e, a = Z(J, r), s = Y(J, r), u = z(r), c = n.useRef(null), p = (0, i.useComposedRefs)(t, c, a.onTriggerChange), m = n.useRef(!1), v = n.useRef(!1), h = n.useCallback(() => m.current = !1, []);
            return n.useEffect(() => () => document.removeEventListener("pointerup", h), [h]), (0, f.jsx)(R, {
                asChild: !0,
                ...u,
                children: (0, f.jsx)(d.Primitive.button, {
                    "aria-describedby": a.open ? a.contentId : void 0,
                    "data-state": a.stateAttribute,
                    ...l,
                    ref: p,
                    onPointerMove: (0, o.composeEventHandlers)(e.onPointerMove, e => {
                        "touch" !== e.pointerType && (v.current || s.isPointerInTransitRef.current || (a.onTriggerEnter(), v.current = !0))
                    }),
                    onPointerLeave: (0, o.composeEventHandlers)(e.onPointerLeave, () => {
                        a.onTriggerLeave(), v.current = !1
                    }),
                    onPointerDown: (0, o.composeEventHandlers)(e.onPointerDown, () => {
                        m.current = !0, document.addEventListener("pointerup", h, {
                            once: !0
                        })
                    }),
                    onFocus: (0, o.composeEventHandlers)(e.onFocus, () => {
                        m.current || a.onOpen()
                    }),
                    onBlur: (0, o.composeEventHandlers)(e.onBlur, a.onClose),
                    onClick: (0, o.composeEventHandlers)(e.onClick, a.onClose)
                })
            })
        });
    Q.displayName = J;
    var ee = "TooltipPortal",
        [et, er] = B(ee, {
            forceMount: void 0
        }),
        en = e => {
            let {
                __scopeTooltip: t,
                forceMount: r,
                children: n,
                container: o
            } = e, i = Z(ee, t);
            return (0, f.jsx)(et, {
                scope: t,
                forceMount: r,
                children: (0, f.jsx)(M, {
                    present: r || i.open,
                    children: (0, f.jsx)(I, {
                        asChild: !0,
                        container: o,
                        children: n
                    })
                })
            })
        };
    en.displayName = ee;
    var eo = "TooltipContent",
        ei = n.forwardRef((e, t) => {
            let r = er(eo, e.__scopeTooltip),
                {
                    forceMount: n = r.forceMount,
                    side: o = "top",
                    ...i
                } = e,
                l = Z(eo, e.__scopeTooltip);
            return (0, f.jsx)(M, {
                present: n || l.open,
                children: l.disableHoverableContent ? (0, f.jsx)(eu, {
                    side: o,
                    ...i,
                    ref: t
                }) : (0, f.jsx)(el, {
                    side: o,
                    ...i,
                    ref: t
                })
            })
        }),
        el = n.forwardRef((e, t) => {
            let r = Z(eo, e.__scopeTooltip),
                o = Y(eo, e.__scopeTooltip),
                l = n.useRef(null),
                a = (0, i.useComposedRefs)(t, l),
                [s, u] = n.useState(null),
                {
                    trigger: c,
                    onClose: d
                } = r,
                p = l.current,
                {
                    onPointerInTransitChange: m
                } = o,
                v = n.useCallback(() => {
                    u(null), m(!1)
                }, [m]),
                h = n.useCallback((e, t) => {
                    let r, n = e.currentTarget,
                        o = {
                            x: e.clientX,
                            y: e.clientY
                        },
                        i = function(e, t) {
                            let r = Math.abs(t.top - e.y),
                                n = Math.abs(t.bottom - e.y),
                                o = Math.abs(t.right - e.x),
                                i = Math.abs(t.left - e.x);
                            switch (Math.min(r, n, o, i)) {
                                case i:
                                    return "left";
                                case o:
                                    return "right";
                                case r:
                                    return "top";
                                case n:
                                    return "bottom";
                                default:
                                    throw Error("unreachable")
                            }
                        }(o, n.getBoundingClientRect());
                    u(((r = [... function(e, t) {
                        let r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 5,
                            n = [];
                        switch (t) {
                            case "top":
                                n.push({
                                    x: e.x - r,
                                    y: e.y + r
                                }, {
                                    x: e.x + r,
                                    y: e.y + r
                                });
                                break;
                            case "bottom":
                                n.push({
                                    x: e.x - r,
                                    y: e.y - r
                                }, {
                                    x: e.x + r,
                                    y: e.y - r
                                });
                                break;
                            case "left":
                                n.push({
                                    x: e.x + r,
                                    y: e.y - r
                                }, {
                                    x: e.x + r,
                                    y: e.y + r
                                });
                                break;
                            case "right":
                                n.push({
                                    x: e.x - r,
                                    y: e.y - r
                                }, {
                                    x: e.x - r,
                                    y: e.y + r
                                })
                        }
                        return n
                    }(o, i), ... function(e) {
                        let {
                            top: t,
                            right: r,
                            bottom: n,
                            left: o
                        } = e;
                        return [{
                            x: o,
                            y: t
                        }, {
                            x: r,
                            y: t
                        }, {
                            x: r,
                            y: n
                        }, {
                            x: o,
                            y: n
                        }]
                    }(t.getBoundingClientRect())].slice()).sort((e, t) => e.x < t.x ? -1 : e.x > t.x ? 1 : e.y < t.y ? -1 : 1 * !!(e.y > t.y)), function(e) {
                        if (e.length <= 1) return e.slice();
                        let t = [];
                        for (let r = 0; r < e.length; r++) {
                            let n = e[r];
                            for (; t.length >= 2;) {
                                let e = t[t.length - 1],
                                    r = t[t.length - 2];
                                if ((e.x - r.x) * (n.y - r.y) >= (e.y - r.y) * (n.x - r.x)) t.pop();
                                else break
                            }
                            t.push(n)
                        }
                        t.pop();
                        let r = [];
                        for (let t = e.length - 1; t >= 0; t--) {
                            let n = e[t];
                            for (; r.length >= 2;) {
                                let e = r[r.length - 1],
                                    t = r[r.length - 2];
                                if ((e.x - t.x) * (n.y - t.y) >= (e.y - t.y) * (n.x - t.x)) r.pop();
                                else break
                            }
                            r.push(n)
                        }
                        return (r.pop(), 1 === t.length && 1 === r.length && t[0].x === r[0].x && t[0].y === r[0].y) ? t : t.concat(r)
                    }(r))), m(!0)
                }, [m]);
            return n.useEffect(() => () => v(), [v]), n.useEffect(() => {
                if (c && p) {
                    let e = e => h(e, p),
                        t = e => h(e, c);
                    return c.addEventListener("pointerleave", e), p.addEventListener("pointerleave", t), () => {
                        c.removeEventListener("pointerleave", e), p.removeEventListener("pointerleave", t)
                    }
                }
            }, [c, p, h, v]), n.useEffect(() => {
                if (s) {
                    let e = e => {
                        let t = e.target,
                            r = {
                                x: e.clientX,
                                y: e.clientY
                            },
                            n = (null == c ? void 0 : c.contains(t)) || (null == p ? void 0 : p.contains(t)),
                            o = ! function(e, t) {
                                let {
                                    x: r,
                                    y: n
                                } = e, o = !1;
                                for (let e = 0, i = t.length - 1; e < t.length; i = e++) {
                                    let l = t[e].x,
                                        a = t[e].y,
                                        s = t[i].x,
                                        u = t[i].y;
                                    a > n != u > n && r < (s - l) * (n - a) / (u - a) + l && (o = !o)
                                }
                                return o
                            }(r, s);
                        n ? v() : o && (v(), d())
                    };
                    return document.addEventListener("pointermove", e), () => document.removeEventListener("pointermove", e)
                }
            }, [c, p, s, d, v]), (0, f.jsx)(eu, {
                ...e,
                ref: a
            })
        }),
        [ea, es] = B(G, {
            isInside: !1
        }),
        eu = n.forwardRef((e, t) => {
            let {
                __scopeTooltip: r,
                children: o,
                "aria-label": i,
                onEscapeKeyDown: l,
                onPointerDownOutside: s,
                ...u
            } = e, c = Z(eo, r), d = z(r), {
                onClose: p
            } = c;
            return n.useEffect(() => (document.addEventListener(U, p), () => document.removeEventListener(U, p)), [p]), n.useEffect(() => {
                if (c.trigger) {
                    let e = e => {
                        let t = e.target;
                        (null == t ? void 0 : t.contains(c.trigger)) && p()
                    };
                    return window.addEventListener("scroll", e, {
                        capture: !0
                    }), () => window.removeEventListener("scroll", e, {
                        capture: !0
                    })
                }
            }, [c.trigger, p]), (0, f.jsx)(a.DismissableLayer, {
                asChild: !0,
                disableOutsidePointerEvents: !1,
                onEscapeKeyDown: l,
                onPointerDownOutside: s,
                onFocusOutside: e => e.preventDefault(),
                onDismiss: p,
                children: (0, f.jsxs)(A, {
                    "data-state": c.stateAttribute,
                    ...d,
                    ...u,
                    ref: t,
                    style: {
                        ...u.style,
                        "--radix-tooltip-content-transform-origin": "var(--radix-popper-transform-origin)",
                        "--radix-tooltip-content-available-width": "var(--radix-popper-available-width)",
                        "--radix-tooltip-content-available-height": "var(--radix-popper-available-height)",
                        "--radix-tooltip-trigger-width": "var(--radix-popper-anchor-width)",
                        "--radix-tooltip-trigger-height": "var(--radix-popper-anchor-height)"
                    },
                    children: [(0, f.jsx)(F.Slottable, {
                        children: o
                    }), (0, f.jsx)(ea, {
                        scope: r,
                        isInside: !0,
                        children: (0, f.jsx)(_, {
                            id: c.contentId,
                            role: "tooltip",
                            children: i || o
                        })
                    })]
                })
            })
        });
    ei.displayName = eo;
    var ec = "TooltipArrow",
        ed = n.forwardRef((e, t) => {
            let {
                __scopeTooltip: r,
                ...n
            } = e, o = z(r);
            return es(ec, r).isInside ? null : (0, f.jsx)(L, {
                ...o,
                ...n,
                ref: t
            })
        });
    ed.displayName = ec, e.s(["Arrow", 0, ed, "Content", 0, ei, "Portal", 0, en, "Provider", 0, X, "Root", 0, $, "Trigger", 0, Q], 989665), e.s(["Tooltip", 0, function(e) {
        let {
            position: o,
            hasBeak: i = !0,
            title: l,
            description: a,
            ariaLabel: s,
            delayDurationMs: u = 500,
            children: c,
            open: d,
            onOpenChange: f,
            contentClassName: p
        } = e, [m, v] = o.split("-"), h = null != s ? s : "string" == typeof l && null == a ? l : void 0;
        return n.createElement(X, {
            delayDuration: u
        }, n.createElement($, {
            open: d,
            onOpenChange: f
        }, c, n.createElement(en, null, n.createElement(ei, {
            side: m,
            align: v,
            "aria-label": h,
            className: (0, r.default)("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", p),
            sideOffset: 5
        }, i && n.createElement(ed, {
            asChild: !0
        }, n.createElement(t.Beak, {
            className: "content-[var(--inverse-surface-0)]"
        })), n.createElement("div", {
            className: "flex flex-col text-truncate-split"
        }, n.createElement("div", {
            className: "text-caption-medium content-inverse-default"
        }, l), a && n.createElement("div", {
            className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
        }, a))))))
    }, "TooltipTrigger", 0, function(e) {
        let {
            children: t,
            asChild: r,
            className: o
        } = e;
        return n.createElement(Q, {
            asChild: r,
            className: o
        }, t)
    }], 508019)
}, 766876, 357716, 195560, 978437, 362496, 791634, 448970, 326301, 993032, 636598, e => {
    "use strict";
    var t, r, n = e.i(197649),
        o = e.i(416340);

    function i(e, t) {
        let {
            checkForDefaultPrevented: r = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(n) {
            if (null == e || e(n), !1 === r || !n.defaultPrevented) return null == t ? void 0 : t(n)
        }
    }

    function l(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function a() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return e => {
            let r = !1,
                n = t.map(t => {
                    let n = l(t, e);
                    return r || "function" != typeof n || (r = !0), n
                });
            if (r) return () => {
                for (let e = 0; e < n.length; e++) {
                    let r = n[e];
                    "function" == typeof r ? r() : l(t[e], null)
                }
            }
        }
    }

    function s() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return o.useCallback(a(...t), t)
    }
    e.s(["Beak", 0, function(e) {
        let {
            className: t
        } = e;
        return o.default.createElement("svg", {
            xmlns: "http://www.w3.org/2000/svg",
            width: "13",
            height: "6",
            viewBox: "0 0 13 6",
            fill: "none",
            className: (0, n.default)("block", t),
            style: {
                marginTop: -1
            }
        }, o.default.createElement("path", {
            d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
            fill: "currentColor"
        }))
    }], 766876), e.s(["composeEventHandlers", 0, i], 357716), e.s(["composeRefs", 0, a, "useComposedRefs", 0, s], 195560);
    var u = e.i(221628);
    e.s(["createContextScope", 0, function(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
            r = [],
            n = () => {
                let t = r.map(e => o.createContext(e));
                return function(r) {
                    let n = (null == r ? void 0 : r[e]) || t;
                    return o.useMemo(() => ({
                        ["__scope".concat(e)]: {
                            ...r,
                            [e]: n
                        }
                    }), [r, n])
                }
            };
        return n.scopeName = e, [function(t, n) {
            let i = o.createContext(n),
                l = r.length;
            r = [...r, n];
            let a = t => {
                var r;
                let {
                    scope: n,
                    children: a,
                    ...s
                } = t, c = (null == n || null == (r = n[e]) ? void 0 : r[l]) || i, d = o.useMemo(() => s, Object.values(s));
                return (0, u.jsx)(c.Provider, {
                    value: d,
                    children: a
                })
            };
            return a.displayName = t + "Provider", [a, function(r, a) {
                var s;
                let u = (null == a || null == (s = a[e]) ? void 0 : s[l]) || i,
                    c = o.useContext(u);
                if (c) return c;
                if (void 0 !== n) return n;
                throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
            }]
        }, function() {
            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
            let n = t[0];
            if (1 === t.length) return n;
            let i = () => {
                let e = t.map(e => ({
                    useScope: e(),
                    scopeName: e.scopeName
                }));
                return function(t) {
                    let r = e.reduce((e, r) => {
                        let {
                            useScope: n,
                            scopeName: o
                        } = r, i = n(t)["__scope".concat(o)];
                        return {
                            ...e,
                            ...i
                        }
                    }, {});
                    return o.useMemo(() => ({
                        ["__scope".concat(n.scopeName)]: r
                    }), [r])
                }
            };
            return i.scopeName = n.scopeName, i
        }(n, ...t)]
    }], 978437);
    var c = e.i(149285),
        d = o.forwardRef((e, t) => {
            let {
                children: r,
                ...n
            } = e, i = o.Children.toArray(r), l = i.find(m);
            if (l) {
                let e = l.props.children,
                    r = i.map(t => t !== l ? t : o.Children.count(e) > 1 ? o.Children.only(null) : o.isValidElement(e) ? e.props.children : null);
                return (0, u.jsx)(f, {
                    ...n,
                    ref: t,
                    children: o.isValidElement(e) ? o.cloneElement(e, void 0, r) : null
                })
            }
            return (0, u.jsx)(f, {
                ...n,
                ref: t,
                children: r
            })
        });
    d.displayName = "Slot";
    var f = o.forwardRef((e, t) => {
        let {
            children: r,
            ...n
        } = e;
        if (o.isValidElement(r)) {
            var i, l, s;
            let e, u, c = (u = (e = null == (l = Object.getOwnPropertyDescriptor((i = r).props, "ref")) ? void 0 : l.get) && "isReactWarning" in e && e.isReactWarning) ? i.ref : (u = (e = null == (s = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : s.get) && "isReactWarning" in e && e.isReactWarning) ? i.props.ref : i.props.ref || i.ref;
            return o.cloneElement(r, {
                ... function(e, t) {
                    let r = {
                        ...t
                    };
                    for (let n in t) {
                        let o = e[n],
                            i = t[n];
                        /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                            i(...t), o(...t)
                        } : o && (r[n] = o) : "style" === n ? r[n] = {
                            ...o,
                            ...i
                        } : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                    }
                    return {
                        ...e,
                        ...r
                    }
                }(n, r.props),
                ref: t ? a(t, c) : c
            })
        }
        return o.Children.count(r) > 1 ? o.Children.only(null) : null
    });
    f.displayName = "SlotClone";
    var p = e => {
        let {
            children: t
        } = e;
        return (0, u.jsx)(u.Fragment, {
            children: t
        })
    };

    function m(e) {
        return o.isValidElement(e) && e.type === p
    }
    e.s(["Slot", 0, d, "Slottable", 0, p], 362496);
    var v = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, t) => {
        let r = o.forwardRef((e, r) => {
            let {
                asChild: n,
                ...o
            } = e, i = n ? d : t;
            return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, u.jsx)(i, {
                ...o,
                ref: r
            })
        });
        return r.displayName = "Primitive.".concat(t), {
            ...e,
            [t]: r
        }
    }, {});

    function h(e, t) {
        e && c.flushSync(() => e.dispatchEvent(t))
    }

    function g(e) {
        let t = o.useRef(e);
        return o.useEffect(() => {
            t.current = e
        }), o.useMemo(() => function() {
            for (var e, r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
            return null == (e = t.current) ? void 0 : e.call(t, ...n)
        }, [])
    }
    e.s(["Primitive", 0, v, "dispatchDiscreteCustomEvent", 0, h], 791634), e.s(["useCallbackRef", 0, g], 448970);
    var y = "dismissableLayer.update",
        w = o.createContext({
            layers: new Set,
            layersWithOutsidePointerEventsDisabled: new Set,
            branches: new Set
        }),
        x = o.forwardRef((e, r) => {
            var n, l;
            let {
                disableOutsidePointerEvents: a = !1,
                onEscapeKeyDown: c,
                onPointerDownOutside: d,
                onFocusOutside: f,
                onInteractOutside: p,
                onDismiss: m,
                ...h
            } = e, x = o.useContext(w), [R, E] = o.useState(null), S = null != (n = null == R ? void 0 : R.ownerDocument) ? n : null == (l = globalThis) ? void 0 : l.document, [, P] = o.useState({}), A = s(r, e => E(e)), T = Array.from(x.layers), [j] = [...x.layersWithOutsidePointerEventsDisabled].slice(-1), L = T.indexOf(j), O = R ? T.indexOf(R) : -1, N = x.layersWithOutsidePointerEventsDisabled.size > 0, D = O >= L, k = function(e) {
                var t;
                let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    n = g(e),
                    i = o.useRef(!1),
                    l = o.useRef(() => {});
                return o.useEffect(() => {
                    let e = e => {
                            if (e.target && !i.current) {
                                let t = function() {
                                        C("dismissableLayer.pointerDownOutside", n, o, {
                                            discrete: !0
                                        })
                                    },
                                    o = {
                                        originalEvent: e
                                    };
                                "touch" === e.pointerType ? (r.removeEventListener("click", l.current), l.current = t, r.addEventListener("click", l.current, {
                                    once: !0
                                })) : t()
                            } else r.removeEventListener("click", l.current);
                            i.current = !1
                        },
                        t = window.setTimeout(() => {
                            r.addEventListener("pointerdown", e)
                        }, 0);
                    return () => {
                        window.clearTimeout(t), r.removeEventListener("pointerdown", e), r.removeEventListener("click", l.current)
                    }
                }, [r, n]), {
                    onPointerDownCapture: () => i.current = !0
                }
            }(e => {
                let t = e.target,
                    r = [...x.branches].some(e => e.contains(t));
                D && !r && (null == d || d(e), null == p || p(e), e.defaultPrevented || null == m || m())
            }, S), I = function(e) {
                var t;
                let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    n = g(e),
                    i = o.useRef(!1);
                return o.useEffect(() => {
                    let e = e => {
                        e.target && !i.current && C("dismissableLayer.focusOutside", n, {
                            originalEvent: e
                        }, {
                            discrete: !1
                        })
                    };
                    return r.addEventListener("focusin", e), () => r.removeEventListener("focusin", e)
                }, [r, n]), {
                    onFocusCapture: () => i.current = !0,
                    onBlurCapture: () => i.current = !1
                }
            }(e => {
                let t = e.target;
                ![...x.branches].some(e => e.contains(t)) && (null == f || f(e), null == p || p(e), e.defaultPrevented || null == m || m())
            }, S);
            return ! function(e) {
                var t;
                let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    n = g(e);
                o.useEffect(() => {
                    let e = e => {
                        "Escape" === e.key && n(e)
                    };
                    return r.addEventListener("keydown", e, {
                        capture: !0
                    }), () => r.removeEventListener("keydown", e, {
                        capture: !0
                    })
                }, [n, r])
            }(e => {
                O === x.layers.size - 1 && (null == c || c(e), !e.defaultPrevented && m && (e.preventDefault(), m()))
            }, S), o.useEffect(() => {
                if (R) return a && (0 === x.layersWithOutsidePointerEventsDisabled.size && (t = S.body.style.pointerEvents, S.body.style.pointerEvents = "none"), x.layersWithOutsidePointerEventsDisabled.add(R)), x.layers.add(R), b(), () => {
                    a && 1 === x.layersWithOutsidePointerEventsDisabled.size && (S.body.style.pointerEvents = t)
                }
            }, [R, S, a, x]), o.useEffect(() => () => {
                R && (x.layers.delete(R), x.layersWithOutsidePointerEventsDisabled.delete(R), b())
            }, [R, x]), o.useEffect(() => {
                let e = () => P({});
                return document.addEventListener(y, e), () => document.removeEventListener(y, e)
            }, []), (0, u.jsx)(v.div, {
                ...h,
                ref: A,
                style: {
                    pointerEvents: N ? D ? "auto" : "none" : void 0,
                    ...e.style
                },
                onFocusCapture: i(e.onFocusCapture, I.onFocusCapture),
                onBlurCapture: i(e.onBlurCapture, I.onBlurCapture),
                onPointerDownCapture: i(e.onPointerDownCapture, k.onPointerDownCapture)
            })
        });

    function b() {
        let e = new CustomEvent(y);
        document.dispatchEvent(e)
    }

    function C(e, t, r, n) {
        let {
            discrete: o
        } = n, i = r.originalEvent.target, l = new CustomEvent(e, {
            bubbles: !1,
            cancelable: !0,
            detail: r
        });
        t && i.addEventListener(e, t, {
            once: !0
        }), o ? h(i, l) : i.dispatchEvent(l)
    }
    x.displayName = "DismissableLayer", o.forwardRef((e, t) => {
        let r = o.useContext(w),
            n = o.useRef(null),
            i = s(t, n);
        return o.useEffect(() => {
            let e = n.current;
            if (e) return r.branches.add(e), () => {
                r.branches.delete(e)
            }
        }, [r.branches]), (0, u.jsx)(v.div, {
            ...e,
            ref: i
        })
    }).displayName = "DismissableLayerBranch", e.s(["DismissableLayer", 0, x], 326301);
    var R = (null == (r = globalThis) ? void 0 : r.document) ? o.useLayoutEffect : () => {};
    e.s(["useLayoutEffect", 0, R], 993032);
    var E = o["useId".toString()] || (() => void 0),
        S = 0;
    e.s(["useId", 0, function(e) {
        let [t, r] = o.useState(E());
        return R(() => {
            e || r(e => null != e ? e : String(S++))
        }, [e]), e || (t ? "radix-".concat(t) : "")
    }], 636598)
}]);

//# debugId=cc87dfe2-60de-807e-13a4-795c6b2b5a5c
//# sourceMappingURL=44ao16anztghk.js.map