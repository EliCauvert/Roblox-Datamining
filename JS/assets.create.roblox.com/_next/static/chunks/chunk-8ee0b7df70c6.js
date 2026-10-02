;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "8ed6f078-f61a-424f-1bb9-9acccd0cd6c8")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 297452, 992486, e => {
    "use strict";
    let t, r = ["top", "right", "bottom", "left"],
        n = r.reduce((e, t) => e.concat(t, t + "-start", t + "-end"), []),
        o = Math.min,
        l = Math.max,
        i = Math.round,
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
            l = m(o),
            i = "x" === o ? n === (r ? "end" : "start") ? "right" : "left" : "start" === n ? "bottom" : "top";
        return t.reference[l] > t.floating[l] && (i = C(i)), [i, C(i)]
    }

    function g(e) {
        return e.includes("start") ? e.replace("start", "end") : e.replace("end", "start")
    }
    let y = ["left", "right"],
        x = ["right", "left"],
        w = ["top", "bottom"],
        b = ["bottom", "top"];

    function C(e) {
        let t = d(e);
        return u[t] + e.slice(t.length)
    }

    function E(e) {
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

    function S(e) {
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

    function R(e, t, r) {
        let n, {
                reference: o,
                floating: l
            } = e,
            i = v(t),
            a = p(v(t)),
            s = m(a),
            u = d(t),
            c = "y" === i,
            h = o.x + o.width / 2 - l.width / 2,
            g = o.y + o.height / 2 - l.height / 2,
            y = o[s] / 2 - l[s] / 2;
        switch (u) {
            case "top":
                n = {
                    x: h,
                    y: o.y - l.height
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
                    x: o.x - l.width,
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
            platform: l,
            rects: i,
            elements: a,
            strategy: s
        } = e, {
            boundary: u = "clippingAncestors",
            rootBoundary: d = "viewport",
            elementContext: f = "floating",
            altBoundary: p = !1,
            padding: m = 0
        } = c(t, e), v = E(m), h = a[p ? "floating" === f ? "reference" : "floating" : f], g = S(await l.getClippingRect({
            element: null == (r = await (null == l.isElement ? void 0 : l.isElement(h))) || r ? h : h.contextElement || await (null == l.getDocumentElement ? void 0 : l.getDocumentElement(a.floating)),
            boundary: u,
            rootBoundary: d,
            strategy: s
        })), y = "floating" === f ? {
            x: n,
            y: o,
            width: i.floating.width,
            height: i.floating.height
        } : i.reference, x = await (null == l.getOffsetParent ? void 0 : l.getOffsetParent(a.floating)), w = await (null == l.isElement ? void 0 : l.isElement(x)) && await (null == l.getScale ? void 0 : l.getScale(x)) || {
            x: 1,
            y: 1
        }, b = S(l.convertOffsetParentRelativeRectToViewportRelativeRect ? await l.convertOffsetParentRelativeRectToViewportRelativeRect({
            elements: a,
            rect: y,
            offsetParent: x,
            strategy: s
        }) : y);
        return {
            top: (g.top - b.top + v.top) / w.y,
            bottom: (b.bottom - g.bottom + v.bottom) / w.y,
            left: (g.left - b.left + v.left) / w.x,
            right: (b.right - g.right + v.right) / w.x
        }
    }
    let T = async (e, t, r) => {
        let {
            placement: n = "bottom",
            strategy: o = "absolute",
            middleware: l = [],
            platform: i
        } = r, a = i.detectOverflow ? i : {
            ...i,
            detectOverflow: P
        }, s = await (null == i.isRTL ? void 0 : i.isRTL(t)), u = await i.getElementRects({
            reference: e,
            floating: t,
            strategy: o
        }), {
            x: c,
            y: d
        } = R(u, n, s), f = n, p = 0, m = {};
        for (let r = 0; r < l.length; r++) {
            let v = l[r];
            if (!v) continue;
            let {
                name: h,
                fn: g
            } = v, {
                x: y,
                y: x,
                data: w,
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
            c = null != y ? y : c, d = null != x ? x : d, m[h] = {
                ...m[h],
                ...w
            }, b && p < 50 && (p++, "object" == typeof b && (b.placement && (f = b.placement), b.rects && (u = !0 === b.rects ? await i.getElementRects({
                reference: e,
                floating: t,
                strategy: o
            }) : b.rects), {
                x: c,
                y: d
            } = R(u, f, s)), r = -1)
        }
        return {
            x: c,
            y: d,
            placement: f,
            strategy: o,
            middlewareData: m
        }
    };

    function A(e, t) {
        return {
            top: e.top - t.height,
            right: e.right - t.width,
            bottom: e.bottom - t.height,
            left: e.left - t.width
        }
    }

    function N(e) {
        return r.some(t => e[t] >= 0)
    }

    function L(e) {
        let t = o(...e.map(e => e.left)),
            r = o(...e.map(e => e.top));
        return {
            x: t,
            y: r,
            width: l(...e.map(e => e.right)) - t,
            height: l(...e.map(e => e.bottom)) - r
        }
    }
    let j = new Set(["left", "top"]);
    async function k(e, t) {
        let {
            placement: r,
            platform: n,
            elements: o
        } = e, l = await (null == n.isRTL ? void 0 : n.isRTL(o.floating)), i = d(r), a = f(r), s = "y" === v(r), u = j.has(i) ? -1 : 1, p = l && s ? -1 : 1, m = c(t, e), {
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

    function O() {
        return "u" > typeof window
    }

    function M(e) {
        return H(e) ? (e.nodeName || "").toLowerCase() : "#document"
    }

    function D(e) {
        var t;
        return (null == e || null == (t = e.ownerDocument) ? void 0 : t.defaultView) || window
    }

    function I(e) {
        var t;
        return null == (t = (H(e) ? e.ownerDocument : e.document) || window.document) ? void 0 : t.documentElement
    }

    function H(e) {
        return !!O() && (e instanceof Node || e instanceof D(e).Node)
    }

    function F(e) {
        return !!O() && (e instanceof Element || e instanceof D(e).Element)
    }

    function _(e) {
        return !!O() && (e instanceof HTMLElement || e instanceof D(e).HTMLElement)
    }

    function B(e) {
        return !(!O() || "u" < typeof ShadowRoot) && (e instanceof ShadowRoot || e instanceof D(e).ShadowRoot)
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

    function X(e) {
        let t = F(e) ? q(e) : e;
        return K(t.transform) || K(t.translate) || K(t.scale) || K(t.rotate) || K(t.perspective) || !Y() && (K(t.backdropFilter) || K(t.filter)) || V.test(t.willChange || "") || U.test(t.contain || "")
    }

    function Y() {
        return null == t && (t = "u" > typeof CSS && CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")), t
    }

    function G(e) {
        return /^(html|body|#document)$/.test(M(e))
    }

    function q(e) {
        return D(e).getComputedStyle(e)
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
        if ("html" === M(e)) return e;
        let t = e.assignedSlot || e.parentNode || B(e) && e.host || I(e);
        return B(t) ? t.host : t
    }

    function J(e, t, r) {
        var n;
        void 0 === t && (t = []), void 0 === r && (r = !0);
        let o = function e(t) {
                let r = $(t);
                return G(r) ? t.ownerDocument ? t.ownerDocument.body : t.body : _(r) && W(r) ? r : e(r)
            }(e),
            l = o === (null == (n = e.ownerDocument) ? void 0 : n.body),
            i = D(o);
        if (!l) return t.concat(o, J(o, [], r));
        {
            let e = Q(i);
            return t.concat(i, i.visualViewport || [], W(o) ? o : [], e && r ? J(e) : [])
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
            l = o ? e.offsetWidth : r,
            a = o ? e.offsetHeight : n,
            s = i(r) !== l || i(n) !== a;
        return s && (r = l, n = a), {
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
                $: l
            } = ee(t),
            a = (l ? i(r.width) : r.width) / n,
            u = (l ? i(r.height) : r.height) / o;
        return a && Number.isFinite(a) || (a = 1), u && Number.isFinite(u) || (u = 1), {
            x: a,
            y: u
        }
    }
    let en = s(0);

    function eo(e) {
        let t = D(e);
        return Y() && t.visualViewport ? {
            x: t.visualViewport.offsetLeft,
            y: t.visualViewport.offsetTop
        } : en
    }

    function el(e, t, r, n) {
        var o;
        void 0 === t && (t = !1), void 0 === r && (r = !1);
        let l = e.getBoundingClientRect(),
            i = et(e),
            a = s(1);
        t && (n ? F(n) && (a = er(n)) : a = er(e));
        let u = (void 0 === (o = r) && (o = !1), n && (!o || n === D(i)) && o) ? eo(i) : s(0),
            c = (l.left + u.x) / a.x,
            d = (l.top + u.y) / a.y,
            f = l.width / a.x,
            p = l.height / a.y;
        if (i) {
            let e = D(i),
                t = n && F(n) ? D(n) : n,
                r = e,
                o = Q(r);
            for (; o && n && t !== r;) {
                let e = er(o),
                    t = o.getBoundingClientRect(),
                    n = q(o),
                    l = t.left + (o.clientLeft + parseFloat(n.paddingLeft)) * e.x,
                    i = t.top + (o.clientTop + parseFloat(n.paddingTop)) * e.y;
                c *= e.x, d *= e.y, f *= e.x, p *= e.y, c += l, d += i, o = Q(r = D(o))
            }
        }
        return S({
            width: f,
            height: p,
            x: c,
            y: d
        })
    }

    function ei(e, t) {
        let r = Z(e).scrollLeft;
        return t ? t.left + r : el(I(e)).left + r
    }

    function ea(e, t) {
        let r = e.getBoundingClientRect();
        return {
            x: r.left + t.scrollLeft - ei(e, r),
            y: r.top + t.scrollTop
        }
    }

    function es(e, t, r) {
        var n;
        let o;
        if ("viewport" === t) o = function(e, t) {
            let r = D(e),
                n = I(e),
                o = r.visualViewport,
                l = n.clientWidth,
                i = n.clientHeight,
                a = 0,
                s = 0;
            if (o) {
                l = o.width, i = o.height;
                let e = Y();
                (!e || e && "fixed" === t) && (a = o.offsetLeft, s = o.offsetTop)
            }
            let u = ei(n);
            if (u <= 0) {
                let e = n.ownerDocument,
                    t = e.body,
                    r = getComputedStyle(t),
                    o = "CSS1Compat" === e.compatMode && parseFloat(r.marginLeft) + parseFloat(r.marginRight) || 0,
                    i = Math.abs(n.clientWidth - t.clientWidth - o);
                i <= 25 && (l -= i)
            } else u <= 25 && (l += u);
            return {
                width: l,
                height: i,
                x: a,
                y: s
            }
        }(e, r);
        else if ("document" === t) {
            let t, r, i, a, s, u, c;
            n = I(e), t = I(n), r = Z(n), i = n.ownerDocument.body, a = l(t.scrollWidth, t.clientWidth, i.scrollWidth, i.clientWidth), s = l(t.scrollHeight, t.clientHeight, i.scrollHeight, i.clientHeight), u = -r.scrollLeft + ei(n), c = -r.scrollTop, "rtl" === q(i).direction && (u += l(t.clientWidth, i.clientWidth) - a), o = {
                width: a,
                height: s,
                x: u,
                y: c
            }
        } else if (F(t)) {
            let e, n, l, i, a, u;
            n = (e = el(t, !0, "fixed" === r)).top + t.clientTop, l = e.left + t.clientLeft, i = _(t) ? er(t) : s(1), a = t.clientWidth * i.x, u = t.clientHeight * i.y, o = {
                width: a,
                height: u,
                x: l * i.x,
                y: n * i.y
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
        return S(o)
    }

    function eu(e) {
        return "static" === q(e).position
    }

    function ec(e, t) {
        if (!_(e) || "fixed" === q(e).position) return null;
        if (t) return t(e);
        let r = e.offsetParent;
        return I(e) === r && (r = r.ownerDocument.body), r
    }

    function ed(e, t) {
        var r;
        let n = D(e);
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
        for (; o && (r = o, /^(table|td|th)$/.test(M(r))) && eu(o);) o = ec(o, t);
        return o && G(o) && eu(o) && !X(o) ? n : o || function(e) {
            let t = $(e);
            for (; _(t) && !G(t);) {
                if (X(t)) return t;
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
                    o = I(t),
                    l = "fixed" === r,
                    i = el(e, !0, l, t),
                    a = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    u = s(0);
                if (n || !n && !l)
                    if (("body" !== M(t) || W(o)) && (a = Z(t)), n) {
                        let e = el(t, !0, l, t);
                        u.x = e.x + t.clientLeft, u.y = e.y + t.clientTop
                    } else o && (u.x = ei(o));
                l && !n && o && (u.x = ei(o));
                let c = !o || n || l ? s(0) : ea(o, a);
                return {
                    x: i.left + a.scrollLeft - u.x - c.x,
                    y: i.top + a.scrollTop - u.y - c.y,
                    width: i.width,
                    height: i.height
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
            } = e, l = "fixed" === o, i = I(n), a = !!t && z(t.floating);
            if (n === i || a && l) return r;
            let u = {
                    scrollLeft: 0,
                    scrollTop: 0
                },
                c = s(1),
                d = s(0),
                f = _(n);
            if ((f || !f && !l) && (("body" !== M(n) || W(i)) && (u = Z(n)), f)) {
                let e = el(n);
                c = er(n), d.x = e.x + n.clientLeft, d.y = e.y + n.clientTop
            }
            let p = !i || f || l ? s(0) : ea(i, u);
            return {
                width: r.width * c.x,
                height: r.height * c.y,
                x: r.x * c.x - u.scrollLeft * c.x + d.x + p.x,
                y: r.y * c.y - u.scrollTop * c.y + d.y + p.y
            }
        },
        getDocumentElement: I,
        getClippingRect: function(e) {
            let {
                element: t,
                boundary: r,
                rootBoundary: n,
                strategy: i
            } = e, a = [..."clippingAncestors" === r ? z(t) ? [] : function(e, t) {
                let r = t.get(e);
                if (r) return r;
                let n = J(e, [], !1).filter(e => F(e) && "body" !== M(e)),
                    o = null,
                    l = "fixed" === q(e).position,
                    i = l ? $(e) : e;
                for (; F(i) && !G(i);) {
                    let t = q(i),
                        r = X(i);
                    r || "fixed" !== t.position || (o = null), (l ? r || o : !(!r && "static" === t.position && o && ("absolute" === o.position || "fixed" === o.position) || W(i) && !r && function e(t, r) {
                        let n = $(t);
                        return !(n === r || !F(n) || G(n)) && ("fixed" === q(n).position || e(n, r))
                    }(e, i))) ? o = t : n = n.filter(e => e !== i), i = $(i)
                }
                return t.set(e, n), n
            }(t, this._c) : [].concat(r), n], s = es(t, a[0], i), u = s.top, c = s.right, d = s.bottom, f = s.left;
            for (let e = 1; e < a.length; e++) {
                let r = es(t, a[e], i);
                u = l(r.top, u), c = o(r.right, c), d = o(r.bottom, d), f = l(r.left, f)
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
                        y: l,
                        placement: i,
                        middlewareData: a
                    } = t, s = await k(t, e);
                    return i === (null == (r = a.offset) ? void 0 : r.placement) && null != (n = a.arrow) && n.alignmentOffset ? {} : {
                        x: o + s.x,
                        y: l + s.y,
                        data: {
                            ...s,
                            placement: i
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
                        placement: i,
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
                    }, g = await a.detectOverflow(t, m), y = v(d(i)), x = p(y), w = h[x], b = h[y];
                    if (s) {
                        let e = "y" === x ? "top" : "left",
                            t = "y" === x ? "bottom" : "right",
                            r = w + g[e],
                            n = w - g[t];
                        w = l(r, o(w, n))
                    }
                    if (u) {
                        let e = "y" === y ? "top" : "left",
                            t = "y" === y ? "bottom" : "right",
                            r = b + g[e],
                            n = b - g[t];
                        b = l(r, o(b, n))
                    }
                    let C = f.fn({
                        ...t,
                        [x]: w,
                        [y]: b
                    });
                    return {
                        ...C,
                        data: {
                            x: C.x - r,
                            y: C.y - n,
                            enabled: {
                                [x]: s,
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
                    var r, n, o, l, i;
                    let a, s, u, {
                            placement: p,
                            middlewareData: m,
                            rects: E,
                            initialPlacement: S,
                            platform: R,
                            elements: P
                        } = t,
                        {
                            mainAxis: T = !0,
                            crossAxis: A = !0,
                            fallbackPlacements: N,
                            fallbackStrategy: L = "bestFit",
                            fallbackAxisSideDirection: j = "none",
                            flipAlignment: k = !0,
                            ...O
                        } = c(e, t);
                    if (null != (r = m.arrow) && r.alignmentOffset) return {};
                    let M = d(p),
                        D = v(S),
                        I = d(S) === S,
                        H = await (null == R.isRTL ? void 0 : R.isRTL(P.floating)),
                        F = N || (I || !k ? [C(S)] : (a = C(S), [g(S), a, g(a)])),
                        _ = "none" !== j;
                    !N && _ && F.push(...(s = f(S), u = function(e, t, r) {
                        switch (e) {
                            case "top":
                            case "bottom":
                                if (r) return t ? x : y;
                                return t ? y : x;
                            case "left":
                            case "right":
                                return t ? w : b;
                            default:
                                return []
                        }
                    }(d(S), "start" === j, H), s && (u = u.map(e => e + "-" + s), k && (u = u.concat(u.map(g)))), u));
                    let B = [S, ...F],
                        W = await R.detectOverflow(t, O),
                        z = [],
                        V = (null == (n = m.flip) ? void 0 : n.overflows) || [];
                    if (T && z.push(W[M]), A) {
                        let e = h(p, E, H);
                        z.push(W[e[0]], W[e[1]])
                    }
                    if (V = [...V, {
                            placement: p,
                            overflows: z
                        }], !z.every(e => e <= 0)) {
                        let e = ((null == (o = m.flip) ? void 0 : o.index) || 0) + 1,
                            t = B[e];
                        if (t && ("alignment" !== A || D === v(t) || V.every(e => v(e.placement) !== D || e.overflows[0] > 0))) return {
                            data: {
                                index: e,
                                overflows: V
                            },
                            reset: {
                                placement: t
                            }
                        };
                        let r = null == (l = V.filter(e => e.overflows[0] <= 0).sort((e, t) => e.overflows[1] - t.overflows[1])[0]) ? void 0 : l.placement;
                        if (!r) switch (L) {
                            case "bestFit": {
                                let e = null == (i = V.filter(e => {
                                    if (_) {
                                        let t = v(e.placement);
                                        return t === D || "y" === t
                                    }
                                    return !0
                                }).map(e => [e.placement, e.overflows.filter(e => e > 0).reduce((e, t) => e + t, 0)]).sort((e, t) => e[1] - t[1])[0]) ? void 0 : i[0];
                                e && (r = e);
                                break
                            }
                            case "initialPlacement":
                                r = S
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
                    let i, a, {
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
                        x = d(s),
                        w = f(s),
                        b = "y" === v(s),
                        {
                            width: C,
                            height: E
                        } = u.floating;
                    "top" === x || "bottom" === x ? (i = x, a = w === (await (null == p.isRTL ? void 0 : p.isRTL(m.floating)) ? "start" : "end") ? "left" : "right") : (a = x, i = "end" === w ? "top" : "bottom");
                    let S = E - y.top - y.bottom,
                        R = C - y.left - y.right,
                        P = o(E - y[i], S),
                        T = o(C - y[a], R),
                        A = !t.middlewareData.shift,
                        N = P,
                        L = T;
                    if (null != (r = t.middlewareData.shift) && r.enabled.x && (L = R), null != (n = t.middlewareData.shift) && n.enabled.y && (N = S), A && !w) {
                        let e = l(y.left, 0),
                            t = l(y.right, 0),
                            r = l(y.top, 0),
                            n = l(y.bottom, 0);
                        b ? L = C - 2 * (0 !== e || 0 !== t ? e + t : l(y.left, y.right)) : N = E - 2 * (0 !== r || 0 !== n ? r + n : l(y.top, y.bottom))
                    }
                    await h({
                        ...t,
                        availableWidth: L,
                        availableHeight: N
                    });
                    let j = await p.getDimensions(m.floating);
                    return C !== j.width || E !== j.height ? {
                        reset: {
                            rects: !0
                        }
                    } : {}
                }
            }
        },
        ex = function(e) {
            return void 0 === e && (e = {}), {
                name: "hide",
                options: e,
                async fn(t) {
                    let {
                        rects: r,
                        platform: n
                    } = t, {
                        strategy: o = "referenceHidden",
                        ...l
                    } = c(e, t);
                    switch (o) {
                        case "referenceHidden": {
                            let e = A(await n.detectOverflow(t, {
                                ...l,
                                elementContext: "reference"
                            }), r.reference);
                            return {
                                data: {
                                    referenceHiddenOffsets: e,
                                    referenceHidden: N(e)
                                }
                            }
                        }
                        case "escaped": {
                            let e = A(await n.detectOverflow(t, {
                                ...l,
                                altBoundary: !0
                            }), r.floating);
                            return {
                                data: {
                                    escapedOffsets: e,
                                    escaped: N(e)
                                }
                            }
                        }
                        default:
                            return {}
                    }
                }
            }
        },
        ew = e => ({
            name: "arrow",
            options: e,
            async fn(t) {
                let {
                    x: r,
                    y: n,
                    placement: i,
                    rects: a,
                    platform: s,
                    elements: u,
                    middlewareData: d
                } = t, {
                    element: h,
                    padding: g = 0
                } = c(e, t) || {};
                if (null == h) return {};
                let y = E(g),
                    x = {
                        x: r,
                        y: n
                    },
                    w = p(v(i)),
                    b = m(w),
                    C = await s.getDimensions(h),
                    S = "y" === w,
                    R = S ? "clientHeight" : "clientWidth",
                    P = a.reference[b] + a.reference[w] - x[w] - a.floating[b],
                    T = x[w] - a.reference[w],
                    A = await (null == s.getOffsetParent ? void 0 : s.getOffsetParent(h)),
                    N = A ? A[R] : 0;
                N && await (null == s.isElement ? void 0 : s.isElement(A)) || (N = u.floating[R] || a.floating[b]);
                let L = N / 2 - C[b] / 2 - 1,
                    j = o(y[S ? "top" : "left"], L),
                    k = o(y[S ? "bottom" : "right"], L),
                    O = N - C[b] - k,
                    M = N / 2 - C[b] / 2 + (P / 2 - T / 2),
                    D = l(j, o(M, O)),
                    I = !d.arrow && null != f(i) && M !== D && a.reference[b] / 2 - (M < j ? j : k) - C[b] / 2 < 0,
                    H = I ? M < j ? M - j : M - O : 0;
                return {
                    [w]: x[w] + H,
                    data: {
                        [w]: D,
                        centerOffset: M - D - H,
                        ...I && {
                            alignmentOffset: H
                        }
                    },
                    reset: I
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
                        rects: l,
                        middlewareData: i
                    } = t, {
                        offset: a = 0,
                        mainAxis: s = !0,
                        crossAxis: u = !0
                    } = c(e, t), f = {
                        x: r,
                        y: n
                    }, m = v(o), h = p(m), g = f[h], y = f[m], x = c(a, t), w = "number" == typeof x ? {
                        mainAxis: x,
                        crossAxis: 0
                    } : {
                        mainAxis: 0,
                        crossAxis: 0,
                        ...x
                    };
                    if (s) {
                        let e = "y" === h ? "height" : "width",
                            t = l.reference[h] - l.floating[e] + w.mainAxis,
                            r = l.reference[h] + l.reference[e] - w.mainAxis;
                        g < t ? g = t : g > r && (g = r)
                    }
                    if (u) {
                        var b, C;
                        let e = "y" === h ? "width" : "height",
                            t = j.has(d(o)),
                            r = l.reference[m] - l.floating[e] + (t && (null == (b = i.offset) ? void 0 : b[m]) || 0) + (t ? 0 : w.crossAxis),
                            n = l.reference[m] + l.reference[e] + (t ? 0 : (null == (C = i.offset) ? void 0 : C[m]) || 0) - (t ? w.crossAxis : 0);
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
                l = {
                    ...o.platform,
                    _c: n
                };
            return T(e, t, {
                ...o,
                platform: l
            })
        };
    e.s(["arrow", 0, ew, "autoPlacement", 0, function(e) {
        return void 0 === e && (e = {}), {
            name: "autoPlacement",
            options: e,
            async fn(t) {
                var r, o, l, i;
                let {
                    rects: a,
                    middlewareData: s,
                    placement: u,
                    platform: p,
                    elements: m
                } = t, {
                    crossAxis: v = !1,
                    alignment: y,
                    allowedPlacements: x = n,
                    autoAlignment: w = !0,
                    ...b
                } = c(e, t), C = void 0 !== y || x === n ? ((i = y || null) ? [...x.filter(e => f(e) === i), ...x.filter(e => f(e) !== i)] : x.filter(e => d(e) === e)).filter(e => !i || f(e) === i || !!w && g(e) !== e) : x, E = await p.detectOverflow(t, b), S = (null == (r = s.autoPlacement) ? void 0 : r.index) || 0, R = C[S];
                if (null == R) return {};
                let P = h(R, a, await (null == p.isRTL ? void 0 : p.isRTL(m.floating)));
                if (u !== R) return {
                    reset: {
                        placement: C[0]
                    }
                };
                let T = [E[d(R)], E[P[0]], E[P[1]]],
                    A = [...(null == (o = s.autoPlacement) ? void 0 : o.overflows) || [], {
                        placement: R,
                        overflows: T
                    }],
                    N = C[S + 1];
                if (N) return {
                    data: {
                        index: S + 1,
                        overflows: A
                    },
                    reset: {
                        placement: N
                    }
                };
                let L = A.map(e => {
                        let t = f(e.placement);
                        return [e.placement, t && v ? e.overflows.slice(0, 2).reduce((e, t) => e + t, 0) : e.overflows[0], e.overflows]
                    }).sort((e, t) => e[1] - t[1]),
                    j = (null == (l = L.filter(e => e[2].slice(0, f(e[0]) ? 2 : 3).every(e => e <= 0))[0]) ? void 0 : l[0]) || L[0][0];
                return j !== u ? {
                    data: {
                        index: S + 1,
                        overflows: A
                    },
                    reset: {
                        placement: j
                    }
                } : {}
            }
        }
    }, "autoUpdate", 0, function(e, t, r, n) {
        let i;
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
                    i = I(e);

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
                            rootMargin: -a(m) + "px " + -a(i.clientWidth - (p + v)) + "px " + -a(i.clientHeight - (m + h)) + "px " + -a(p) + "px",
                            threshold: l(0, o(1, d)) || 1
                        },
                        y = !0;

                    function x(t) {
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
                        n = new IntersectionObserver(x, {
                            ...g,
                            root: i.ownerDocument
                        })
                    } catch (e) {
                        n = new IntersectionObserver(x, g)
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
        let y = f ? el(e) : null;
        return f && function t() {
            let n = el(e);
            y && !em(y, n) && r(), y = n, i = requestAnimationFrame(t)
        }(), r(), () => {
            var e;
            m.forEach(e => {
                s && e.removeEventListener("scroll", r), u && e.removeEventListener("resize", r)
            }), null == v || v(), null == (e = g) || e.disconnect(), g = null, f && cancelAnimationFrame(i)
        }
    }, "computePosition", 0, eC, "flip", 0, eg, "hide", 0, ex, "inline", 0, function(e) {
        return void 0 === e && (e = {}), {
            name: "inline",
            options: e,
            async fn(t) {
                let {
                    placement: r,
                    elements: n,
                    rects: i,
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
                    return r.map(e => S(L(e)))
                }(m), g = S(L(m)), y = E(u), x = await a.getElementRects({
                    reference: {
                        getBoundingClientRect: function() {
                            if (2 === h.length && h[0].left > h[1].right && null != f && null != p) return h.find(e => f > e.left - y.left && f < e.right + y.right && p > e.top - y.top && p < e.bottom + y.bottom) || g;
                            if (h.length >= 2) {
                                if ("y" === v(r)) {
                                    let e = h[0],
                                        t = h[h.length - 1],
                                        n = "top" === d(r),
                                        o = e.top,
                                        l = t.bottom,
                                        i = n ? e.left : t.left,
                                        a = n ? e.right : t.right;
                                    return {
                                        top: o,
                                        bottom: l,
                                        left: i,
                                        right: a,
                                        width: a - i,
                                        height: l - o,
                                        x: i,
                                        y: o
                                    }
                                }
                                let e = "left" === d(r),
                                    t = l(...h.map(e => e.right)),
                                    n = o(...h.map(e => e.left)),
                                    i = h.filter(r => e ? r.left === n : r.right === t),
                                    a = i[0].top,
                                    s = i[i.length - 1].bottom;
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
                return i.reference.x !== x.reference.x || i.reference.y !== x.reference.y || i.reference.width !== x.reference.width || i.reference.height !== x.reference.height ? {
                    reset: {
                        rects: x
                    }
                } : {}
            }
        }
    }, "limitShift", 0, eb, "offset", 0, ev, "shift", 0, eh, "size", 0, ey], 992486);
    var eE = e.i(416340),
        eS = e.i(149285),
        eR = "u" > typeof document ? eE.useLayoutEffect : function() {};

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

    function eT(e) {
        return "u" < typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
    }

    function eA(e, t) {
        let r = eT(e);
        return Math.round(t * r) / r
    }

    function eN(e) {
        let t = eE.useRef(e);
        return eR(() => {
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
                return r && ({}).hasOwnProperty.call(r, "current") ? null != r.current ? ew({
                    element: r.current,
                    padding: n
                }).fn(t) : {} : r ? ew({
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
        let r = ex(e);
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
                reference: l,
                floating: i
            } = {},
            transform: a = !0,
            whileElementsMounted: s,
            open: u
        } = e, [c, d] = eE.useState({
            x: 0,
            y: 0,
            strategy: r,
            placement: t,
            middlewareData: {},
            isPositioned: !1
        }), [f, p] = eE.useState(n);
        eP(f, n) || p(n);
        let [m, v] = eE.useState(null), [h, g] = eE.useState(null), y = eE.useCallback(e => {
            e !== C.current && (C.current = e, v(e))
        }, []), x = eE.useCallback(e => {
            e !== E.current && (E.current = e, g(e))
        }, []), w = l || m, b = i || h, C = eE.useRef(null), E = eE.useRef(null), S = eE.useRef(c), R = null != s, P = eN(s), T = eN(o), A = eN(u), N = eE.useCallback(() => {
            if (!C.current || !E.current) return;
            let e = {
                placement: t,
                strategy: r,
                middleware: f
            };
            T.current && (e.platform = T.current), eC(C.current, E.current, e).then(e => {
                let t = {
                    ...e,
                    isPositioned: !1 !== A.current
                };
                L.current && !eP(S.current, t) && (S.current = t, eS.flushSync(() => {
                    d(t)
                }))
            })
        }, [f, t, r, T, A]);
        eR(() => {
            !1 === u && S.current.isPositioned && (S.current.isPositioned = !1, d(e => ({
                ...e,
                isPositioned: !1
            })))
        }, [u]);
        let L = eE.useRef(!1);
        eR(() => (L.current = !0, () => {
            L.current = !1
        }), []), eR(() => {
            if (w && (C.current = w), b && (E.current = b), w && b) {
                if (P.current) return P.current(w, b, N);
                N()
            }
        }, [w, b, N, P, R]);
        let j = eE.useMemo(() => ({
                reference: C,
                floating: E,
                setReference: y,
                setFloating: x
            }), [y, x]),
            k = eE.useMemo(() => ({
                reference: w,
                floating: b
            }), [w, b]),
            O = eE.useMemo(() => {
                let e = {
                    position: r,
                    left: 0,
                    top: 0
                };
                if (!k.floating) return e;
                let t = eA(k.floating, c.x),
                    n = eA(k.floating, c.y);
                return a ? {
                    ...e,
                    transform: "translate(" + t + "px, " + n + "px)",
                    ...eT(k.floating) >= 1.5 && {
                        willChange: "transform"
                    }
                } : {
                    position: r,
                    left: t,
                    top: n
                }
            }, [r, a, k.floating, c.x, c.y]);
        return eE.useMemo(() => ({
            ...c,
            update: N,
            refs: j,
            elements: k,
            floatingStyles: O
        }), [c, N, j, k, O])
    }], 297452)
}, 305607, e => {
    "use strict";
    e.s(["clamp", 0, function(e, t) {
        let [r, n] = t;
        return Math.min(n, Math.max(r, e))
    }])
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
                width: l = 10,
                height: i = 5,
                ...a
            } = e;
            return (0, n.jsx)(r.Primitive.svg, {
                ...a,
                ref: t,
                width: l,
                height: i,
                viewBox: "0 0 30 10",
                preserveAspectRatio: "none",
                children: e.asChild ? o : (0, n.jsx)("polygon", {
                    points: "0,0 30,0 15,10"
                })
            })
        });
    o.displayName = "Arrow", e.s(["Root", 0, o])
}, 539206, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(608652),
        n = e.i(78892),
        o = e.i(699704),
        l = e.i(221628);
    e.s(["createCollection", 0, function(e) {
        let i = e + "CollectionProvider",
            [a, s] = (0, r.createContextScope)(i),
            [u, c] = a(i, {
                collectionRef: {
                    current: null
                },
                itemMap: new Map
            }),
            d = e => {
                let {
                    scope: r,
                    children: n
                } = e, o = t.default.useRef(null), i = t.default.useRef(new Map).current;
                return (0, l.jsx)(u, {
                    scope: r,
                    itemMap: i,
                    collectionRef: o,
                    children: n
                })
            };
        d.displayName = i;
        let f = e + "CollectionSlot",
            p = (0, o.createSlot)(f),
            m = t.default.forwardRef((e, t) => {
                let {
                    scope: r,
                    children: o
                } = e, i = c(f, r), a = (0, n.useComposedRefs)(t, i.collectionRef);
                return (0, l.jsx)(p, {
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
                    children: i,
                    ...a
                } = e, s = t.default.useRef(null), u = (0, n.useComposedRefs)(r, s), d = c(v, o);
                return t.default.useEffect(() => (d.itemMap.set(s, {
                    ref: s,
                    ...a
                }), () => void d.itemMap.delete(s))), (0, l.jsx)(g, {
                    ...{
                        [h]: ""
                    },
                    ref: u,
                    children: i
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
}, 508785, e => {
    "use strict";
    e.i(711300), e.i(634203), e.i(35877);
    var t = e.i(416340),
        r = e.i(608652),
        n = e.i(78892),
        o = e.i(76992),
        l = e.i(221628);
    e.s(["createCollection", 0, function(e) {
        let i = e + "CollectionProvider",
            [a, s] = (0, r.createContextScope)(i),
            [u, c] = a(i, {
                collectionRef: {
                    current: null
                },
                itemMap: new Map
            }),
            d = e => {
                let {
                    scope: r,
                    children: n
                } = e, o = t.default.useRef(null), i = t.default.useRef(new Map).current;
                return (0, l.jsx)(u, {
                    scope: r,
                    itemMap: i,
                    collectionRef: o,
                    children: n
                })
            };
        d.displayName = i;
        let f = e + "CollectionSlot",
            p = (0, o.createSlot)(f),
            m = t.default.forwardRef((e, t) => {
                let {
                    scope: r,
                    children: o
                } = e, i = c(f, r), a = (0, n.useComposedRefs)(t, i.collectionRef);
                return (0, l.jsx)(p, {
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
                    children: i,
                    ...a
                } = e, s = t.default.useRef(null), u = (0, n.useComposedRefs)(r, s), d = c(v, o);
                return t.default.useEffect(() => (d.itemMap.set(s, {
                    ref: s,
                    ...a
                }), () => void d.itemMap.delete(s))), (0, l.jsx)(g, {
                    ...{
                        [h]: ""
                    },
                    ref: u,
                    children: i
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
}, 524887, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(297452),
        n = e.i(992486),
        o = e.i(742187),
        l = e.i(78892),
        i = e.i(608652),
        a = e.i(594278),
        s = e.i(886449),
        u = e.i(723570),
        c = e.i(692166),
        d = e.i(221628),
        f = "Popper",
        [p, m] = (0, i.createContextScope)(f),
        [v, h] = p(f),
        g = e => {
            let {
                __scopePopper: r,
                children: n
            } = e, [o, l] = t.useState(null);
            return (0, d.jsx)(v, {
                scope: r,
                anchor: o,
                onAnchorChange: l,
                children: n
            })
        };
    g.displayName = f;
    var y = "PopperAnchor",
        x = t.forwardRef((e, r) => {
            let {
                __scopePopper: n,
                virtualRef: o,
                ...i
            } = e, s = h(y, n), u = t.useRef(null), c = (0, l.useComposedRefs)(r, u);
            return t.useEffect(() => {
                s.onAnchorChange((null == o ? void 0 : o.current) || u.current)
            }), o ? null : (0, d.jsx)(a.Primitive.div, {
                ...i,
                ref: c
            })
        });
    x.displayName = y;
    var w = "PopperContent",
        [b, C] = p(w),
        E = t.forwardRef((e, o) => {
            var i, f, p, m, v, g, y, x;
            let {
                __scopePopper: C,
                side: E = "bottom",
                sideOffset: S = 0,
                align: R = "center",
                alignOffset: P = 0,
                arrowPadding: L = 0,
                avoidCollisions: j = !0,
                collisionBoundary: k = [],
                collisionPadding: O = 0,
                sticky: M = "partial",
                hideWhenDetached: D = !1,
                updatePositionStrategy: I = "optimized",
                onPlaced: H,
                ...F
            } = e, _ = h(w, C), [B, W] = t.useState(null), z = (0, l.useComposedRefs)(o, e => W(e)), [V, U] = t.useState(null), K = (0, c.useSize)(V), X = null != (i = null == K ? void 0 : K.width) ? i : 0, Y = null != (f = null == K ? void 0 : K.height) ? f : 0, G = "number" == typeof O ? O : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...O
            }, q = Array.isArray(k) ? k : [k], Z = q.length > 0, $ = {
                padding: G,
                boundary: q.filter(T),
                altBoundary: Z
            }, {
                refs: J,
                floatingStyles: Q,
                placement: ee,
                isPositioned: et,
                middlewareData: er
            } = (0, r.useFloating)({
                strategy: "fixed",
                placement: E + ("center" !== R ? "-" + R : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return (0, n.autoUpdate)(...t, {
                        animationFrame: "always" === I
                    })
                },
                elements: {
                    reference: _.anchor
                },
                middleware: [(0, r.offset)({
                    mainAxis: S + Y,
                    alignmentAxis: P
                }), j && (0, r.shift)({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === M ? (0, r.limitShift)() : void 0,
                    ...$
                }), j && (0, r.flip)({
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
                            width: l,
                            height: i
                        } = r.reference, a = t.floating.style;
                        a.setProperty("--radix-popper-available-width", "".concat(n, "px")), a.setProperty("--radix-popper-available-height", "".concat(o, "px")), a.setProperty("--radix-popper-anchor-width", "".concat(l, "px")), a.setProperty("--radix-popper-anchor-height", "".concat(i, "px"))
                    }
                }), V && (0, r.arrow)({
                    element: V,
                    padding: L
                }), A({
                    arrowWidth: X,
                    arrowHeight: Y
                }), D && (0, r.hide)({
                    strategy: "referenceHidden",
                    ...$
                })]
            }), [en, eo] = N(ee), el = (0, s.useCallbackRef)(H);
            (0, u.useLayoutEffect)(() => {
                et && (null == el || el())
            }, [et, el]);
            let ei = null == (p = er.arrow) ? void 0 : p.x,
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
                    ...(null == (x = er.hide) ? void 0 : x.referenceHidden) && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, d.jsx)(b, {
                    scope: C,
                    placedSide: en,
                    onArrowChange: U,
                    arrowX: ei,
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
    E.displayName = w;
    var S = "PopperArrow",
        R = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        P = t.forwardRef(function(e, t) {
            let {
                __scopePopper: r,
                ...n
            } = e, l = C(S, r), i = R[l.placedSide];
            return (0, d.jsx)("span", {
                ref: l.onArrowChange,
                style: {
                    position: "absolute",
                    left: l.arrowX,
                    top: l.arrowY,
                    [i]: 0,
                    transformOrigin: {
                        top: "",
                        right: "0 0",
                        bottom: "center 0",
                        left: "100% 0"
                    } [l.placedSide],
                    transform: {
                        top: "translateY(100%)",
                        right: "translateY(50%) rotate(90deg) translateX(-50%)",
                        bottom: "rotate(180deg)",
                        left: "translateY(50%) rotate(-90deg) translateX(50%)"
                    } [l.placedSide],
                    visibility: l.shouldHideArrow ? "hidden" : void 0
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

    function T(e) {
        return null !== e
    }
    P.displayName = S;
    var A = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            var r, n, o, l, i;
            let {
                placement: a,
                rects: s,
                middlewareData: u
            } = t, c = (null == (o = u.arrow) ? void 0 : o.centerOffset) !== 0, d = c ? 0 : e.arrowWidth, f = c ? 0 : e.arrowHeight, [p, m] = N(a), v = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [m], h = (null != (r = null == (l = u.arrow) ? void 0 : l.x) ? r : 0) + d / 2, g = (null != (n = null == (i = u.arrow) ? void 0 : i.y) ? n : 0) + f / 2, y = "", x = "";
            return "bottom" === p ? (y = c ? v : "".concat(h, "px"), x = "".concat(-f, "px")) : "top" === p ? (y = c ? v : "".concat(h, "px"), x = "".concat(s.floating.height + f, "px")) : "right" === p ? (y = "".concat(-f, "px"), x = c ? v : "".concat(g, "px")) : "left" === p && (y = "".concat(s.floating.width + f, "px"), x = c ? v : "".concat(g, "px")), {
                data: {
                    x: y,
                    y: x
                }
            }
        }
    });

    function N(e) {
        let [t, r = "center"] = e.split("-");
        return [t, r]
    }
    e.s(["Anchor", 0, x, "Arrow", 0, P, "Content", 0, E, "Root", 0, g, "createPopperScope", 0, m])
}, 600317, e => {
    "use strict";
    var t = e.i(416340);
    e.i(149285);
    var r = e.i(76992),
        n = e.i(221628),
        o = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce((e, o) => {
            let l = (0, r.createSlot)("Primitive.".concat(o)),
                i = t.forwardRef((e, t) => {
                    let {
                        asChild: r,
                        ...i
                    } = e;
                    return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, n.jsx)(r ? l : o, {
                        ...i,
                        ref: t
                    })
                });
            return i.displayName = "Primitive.".concat(o), {
                ...e,
                [o]: i
            }
        }, {});
    e.s(["Primitive", 0, o])
}, 142953, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(174617),
        n = e.i(508785),
        o = e.i(78892),
        l = e.i(608652),
        i = e.i(40266),
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
        [y, x] = (0, l.createContextScope)(m, [g]),
        [w, b] = y(m),
        C = t.forwardRef((e, t) => (0, d.jsx)(v.Provider, {
            scope: e.__scopeRovingFocusGroup,
            children: (0, d.jsx)(v.Slot, {
                scope: e.__scopeRovingFocusGroup,
                children: (0, d.jsx)(E, {
                    ...e,
                    ref: t
                })
            })
        }));
    C.displayName = m;
    var E = t.forwardRef((e, n) => {
            let {
                __scopeRovingFocusGroup: l,
                orientation: i,
                loop: v = !1,
                dir: g,
                currentTabStopId: y,
                defaultCurrentTabStopId: x,
                onCurrentTabStopIdChange: b,
                onEntryFocus: C,
                preventScrollOnEntryFocus: E = !1,
                ...S
            } = e, R = t.useRef(null), P = (0, o.useComposedRefs)(n, R), A = (0, c.useDirection)(g), [N, L] = (0, u.useControllableState)({
                prop: y,
                defaultProp: null != x ? x : null,
                onChange: b,
                caller: m
            }), [j, k] = t.useState(!1), O = (0, s.useCallbackRef)(C), M = h(l), D = t.useRef(!1), [I, H] = t.useState(0);
            return t.useEffect(() => {
                let e = R.current;
                if (e) return e.addEventListener(f, O), () => e.removeEventListener(f, O)
            }, [O]), (0, d.jsx)(w, {
                scope: l,
                orientation: i,
                dir: A,
                loop: v,
                currentTabStopId: N,
                onItemFocus: t.useCallback(e => L(e), [L]),
                onItemShiftTab: t.useCallback(() => k(!0), []),
                onFocusableItemAdd: t.useCallback(() => H(e => e + 1), []),
                onFocusableItemRemove: t.useCallback(() => H(e => e - 1), []),
                children: (0, d.jsx)(a.Primitive.div, {
                    tabIndex: j || 0 === I ? -1 : 0,
                    "data-orientation": i,
                    ...S,
                    ref: P,
                    style: {
                        outline: "none",
                        ...e.style
                    },
                    onMouseDown: (0, r.composeEventHandlers)(e.onMouseDown, () => {
                        D.current = !0
                    }),
                    onFocus: (0, r.composeEventHandlers)(e.onFocus, e => {
                        let t = !D.current;
                        if (e.target === e.currentTarget && t && !j) {
                            let t = new CustomEvent(f, p);
                            if (e.currentTarget.dispatchEvent(t), !t.defaultPrevented) {
                                let e = M().filter(e => e.focusable);
                                T([e.find(e => e.active), e.find(e => e.id === N), ...e].filter(Boolean).map(e => e.ref.current), E)
                            }
                        }
                        D.current = !1
                    }),
                    onBlur: (0, r.composeEventHandlers)(e.onBlur, () => k(!1))
                })
            })
        }),
        S = "RovingFocusGroupItem",
        R = t.forwardRef((e, n) => {
            let {
                __scopeRovingFocusGroup: o,
                focusable: l = !0,
                active: s = !1,
                tabStopId: u,
                children: c,
                ...f
            } = e, p = (0, i.useId)(), m = u || p, g = b(S, o), y = g.currentTabStopId === m, x = h(o), {
                onFocusableItemAdd: w,
                onFocusableItemRemove: C,
                currentTabStopId: E
            } = g;
            return t.useEffect(() => {
                if (l) return w(), () => C()
            }, [l, w, C]), (0, d.jsx)(v.ItemSlot, {
                scope: o,
                id: m,
                focusable: l,
                active: s,
                children: (0, d.jsx)(a.Primitive.span, {
                    tabIndex: y ? 0 : -1,
                    "data-orientation": g.orientation,
                    ...f,
                    ref: n,
                    onMouseDown: (0, r.composeEventHandlers)(e.onMouseDown, e => {
                        l ? g.onItemFocus(m) : e.preventDefault()
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
                            let o = x().filter(e => e.focusable).map(e => e.ref.current);
                            if ("last" === t) o.reverse();
                            else if ("prev" === t || "next" === t) {
                                var r, n;
                                "prev" === t && o.reverse();
                                let l = o.indexOf(e.currentTarget);
                                o = g.loop ? (r = o, n = l + 1, r.map((e, t) => r[(n + t) % r.length])) : o.slice(l + 1)
                            }
                            setTimeout(() => T(o))
                        }
                    }),
                    children: "function" == typeof c ? c({
                        isCurrentTabStop: y,
                        hasTabStop: null != E
                    }) : c
                })
            })
        });
    R.displayName = S;
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

    function T(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
            r = document.activeElement;
        for (let n of e)
            if (n === r || (n.focus({
                    preventScroll: t
                }), document.activeElement !== r)) return
    }
    e.s(["Item", 0, R, "Root", 0, C, "createRovingFocusGroupScope", 0, x])
}, 76992, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(78892),
        n = e.i(221628),
        o = Symbol("radix.slottable");

    function l(e) {
        return t.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === o
    }
    e.s(["createSlot", 0, function(e) {
        var o;
        let i, a = (o = e, (i = t.forwardRef((e, n) => {
                let {
                    children: o,
                    ...l
                } = e;
                if (t.isValidElement(o)) {
                    var i, a, s;
                    let e, u, c = (u = (e = null == (a = Object.getOwnPropertyDescriptor((i = o).props, "ref")) ? void 0 : a.get) && "isReactWarning" in e && e.isReactWarning) ? i.ref : (u = (e = null == (s = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : s.get) && "isReactWarning" in e && e.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                        d = function(e, t) {
                            let r = {
                                ...t
                            };
                            for (let n in t) {
                                let o = e[n],
                                    l = t[n];
                                /^on[A-Z]/.test(n) ? o && l ? r[n] = function() {
                                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                    let n = l(...t);
                                    return o(...t), n
                                } : o && (r[n] = o) : "style" === n ? r[n] = {
                                    ...o,
                                    ...l
                                } : "className" === n && (r[n] = [o, l].filter(Boolean).join(" "))
                            }
                            return {
                                ...e,
                                ...r
                            }
                        }(l, o.props);
                    return o.type !== t.Fragment && (d.ref = n ? (0, r.composeRefs)(n, c) : c), t.cloneElement(o, d)
                }
                return t.Children.count(o) > 1 ? t.Children.only(null) : null
            })).displayName = "".concat(o, ".SlotClone"), i),
            s = t.forwardRef((e, r) => {
                let {
                    children: o,
                    ...i
                } = e, s = t.Children.toArray(o), u = s.find(l);
                if (u) {
                    let e = u.props.children,
                        o = s.map(r => r !== u ? r : t.Children.count(e) > 1 ? t.Children.only(null) : t.isValidElement(e) ? e.props.children : null);
                    return (0, n.jsx)(a, {
                        ...i,
                        ref: r,
                        children: t.isValidElement(e) ? t.cloneElement(e, void 0, o) : null
                    })
                }
                return (0, n.jsx)(a, {
                    ...i,
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
            onChange: l = () => {},
            caller: i
        } = e, [a, s, u] = function(e) {
            let {
                defaultProp: r,
                onChange: o
            } = e, [l, i] = t.useState(r), a = t.useRef(l), s = t.useRef(o);
            return n(() => {
                s.current = o
            }, [o]), t.useEffect(() => {
                if (a.current !== l) {
                    var e;
                    null == (e = s.current) || e.call(s, l), a.current = l
                }
            }, [l, a]), [l, i, s]
        }({
            defaultProp: o,
            onChange: l
        }), c = void 0 !== r, d = c ? r : a;
        {
            let e = t.useRef(void 0 !== r);
            t.useEffect(() => {
                let t = e.current;
                if (t !== c) {
                    let e = c ? "controlled" : "uncontrolled";
                    console.warn("".concat(i, " is changing from ").concat(t ? "controlled" : "uncontrolled", " to ").concat(e, ". Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component."))
                }
                e.current = c
            }, [c, i])
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
                    let l = t[0];
                    if ("borderBoxSize" in l) {
                        let e = l.borderBoxSize,
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
}, 316413, 563921, e => {
    "use strict";
    var t = e.i(140625),
        r = e.i(408832),
        n = e.i(148380),
        o = e.i(750615),
        l = e.i(197649),
        i = e.i(416340),
        a = e.i(149285),
        s = e.i(305607),
        u = e.i(19655),
        c = e.i(539206),
        d = e.i(78892),
        f = e.i(608652),
        p = e.i(974539),
        m = e.i(598943),
        v = e.i(793808),
        h = e.i(44265),
        g = e.i(40266),
        y = e.i(524887),
        x = e.i(763960),
        w = e.i(594278),
        b = e.i(699704),
        C = e.i(886449),
        E = e.i(428156),
        S = e.i(723570),
        R = e.i(300792),
        P = e.i(221628),
        T = i.forwardRef((e, t) => (0, P.jsx)(w.Primitive.span, {
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
    T.displayName = "VisuallyHidden";
    var A = e.i(3300),
        N = e.i(813593),
        L = [" ", "Enter", "ArrowUp", "ArrowDown"],
        j = [" ", "Enter"],
        k = "Select",
        [O, M, D] = (0, c.createCollection)(k),
        [I, H] = (0, f.createContextScope)(k, [D, y.createPopperScope]),
        F = (0, y.createPopperScope)(),
        [_, B] = I(k),
        [W, z] = I(k),
        V = e => {
            let {
                __scopeSelect: t,
                children: r,
                open: n,
                defaultOpen: o,
                onOpenChange: l,
                value: a,
                defaultValue: s,
                onValueChange: u,
                dir: c,
                name: d,
                autoComplete: f,
                disabled: m,
                required: v,
                form: h
            } = e, x = F(t), [w, b] = i.useState(null), [C, S] = i.useState(null), [R, T] = i.useState(!1), A = (0, p.useDirection)(c), [N = !1, L] = (0, E.useControllableState)({
                prop: n,
                defaultProp: o,
                onChange: l
            }), [j, k] = (0, E.useControllableState)({
                prop: a,
                defaultProp: s,
                onChange: u
            }), M = i.useRef(null), D = !w || h || !!w.closest("form"), [I, H] = i.useState(new Set), B = Array.from(I).map(e => e.props.value).join(";");
            return (0, P.jsx)(y.Root, {
                ...x,
                children: (0, P.jsxs)(_, {
                    required: v,
                    scope: t,
                    trigger: w,
                    onTriggerChange: b,
                    valueNode: C,
                    onValueNodeChange: S,
                    valueNodeHasChildren: R,
                    onValueNodeHasChildrenChange: T,
                    contentId: (0, g.useId)(),
                    value: j,
                    onValueChange: k,
                    open: N,
                    onOpenChange: L,
                    dir: A,
                    triggerPointerDownPosRef: M,
                    disabled: m,
                    children: [(0, P.jsx)(O.Provider, {
                        scope: t,
                        children: (0, P.jsx)(W, {
                            scope: e.__scopeSelect,
                            onNativeOptionAdd: i.useCallback(e => {
                                H(t => new Set(t).add(e))
                            }, []),
                            onNativeOptionRemove: i.useCallback(e => {
                                H(t => {
                                    let r = new Set(t);
                                    return r.delete(e), r
                                })
                            }, []),
                            children: r
                        })
                    }), D ? (0, P.jsxs)(eS, {
                        "aria-hidden": !0,
                        required: v,
                        tabIndex: -1,
                        name: d,
                        autoComplete: f,
                        value: j,
                        onChange: e => k(e.target.value),
                        disabled: m,
                        form: h,
                        children: [void 0 === j ? (0, P.jsx)("option", {
                            value: ""
                        }) : null, Array.from(I)]
                    }, B) : null]
                })
            })
        };
    V.displayName = k;
    var U = "SelectTrigger",
        K = i.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                disabled: n = !1,
                ...o
            } = e, l = F(r), a = B(U, r), s = a.disabled || n, c = (0, d.useComposedRefs)(t, a.onTriggerChange), f = M(r), p = i.useRef("touch"), [m, v, h] = eR(e => {
                let t = f().filter(e => !e.disabled),
                    r = t.find(e => e.value === a.value),
                    n = eP(t, e, r);
                void 0 !== n && a.onValueChange(n.value)
            }), g = e => {
                s || (a.onOpenChange(!0), h()), e && (a.triggerPointerDownPosRef.current = {
                    x: Math.round(e.pageX),
                    y: Math.round(e.pageY)
                })
            };
            return (0, P.jsx)(y.Anchor, {
                asChild: !0,
                ...l,
                children: (0, P.jsx)(w.Primitive.button, {
                    type: "button",
                    role: "combobox",
                    "aria-controls": a.contentId,
                    "aria-expanded": a.open,
                    "aria-required": a.required,
                    "aria-autocomplete": "none",
                    dir: a.dir,
                    "data-state": a.open ? "open" : "closed",
                    disabled: s,
                    "data-disabled": s ? "" : void 0,
                    "data-placeholder": eE(a.value) ? "" : void 0,
                    ...o,
                    ref: c,
                    onClick: (0, u.composeEventHandlers)(o.onClick, e => {
                        e.currentTarget.focus(), "mouse" !== p.current && g(e)
                    }),
                    onPointerDown: (0, u.composeEventHandlers)(o.onPointerDown, e => {
                        p.current = e.pointerType;
                        let t = e.target;
                        t.hasPointerCapture(e.pointerId) && t.releasePointerCapture(e.pointerId), 0 === e.button && !1 === e.ctrlKey && "mouse" === e.pointerType && (g(e), e.preventDefault())
                    }),
                    onKeyDown: (0, u.composeEventHandlers)(o.onKeyDown, e => {
                        let t = "" !== m.current;
                        e.ctrlKey || e.altKey || e.metaKey || 1 !== e.key.length || v(e.key), (!t || " " !== e.key) && L.includes(e.key) && (g(), e.preventDefault())
                    })
                })
            })
        });
    K.displayName = U;
    var X = "SelectValue",
        Y = i.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                className: n,
                style: o,
                children: l,
                placeholder: i = "",
                ...a
            } = e, s = B(X, r), {
                onValueNodeHasChildrenChange: u
            } = s, c = void 0 !== l, f = (0, d.useComposedRefs)(t, s.onValueNodeChange);
            return (0, S.useLayoutEffect)(() => {
                u(c)
            }, [u, c]), (0, P.jsx)(w.Primitive.span, {
                ...a,
                ref: f,
                style: {
                    pointerEvents: "none"
                },
                children: eE(s.value) ? (0, P.jsx)(P.Fragment, {
                    children: i
                }) : l
            })
        });
    Y.displayName = X;
    var G = i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            children: n,
            ...o
        } = e;
        return (0, P.jsx)(w.Primitive.span, {
            "aria-hidden": !0,
            ...o,
            ref: t,
            children: n || "▼"
        })
    });
    G.displayName = "SelectIcon";
    var q = e => (0, P.jsx)(x.Portal, {
        asChild: !0,
        ...e
    });
    q.displayName = "SelectPortal";
    var Z = "SelectContent",
        $ = i.forwardRef((e, t) => {
            let r = B(Z, e.__scopeSelect),
                [n, o] = i.useState();
            return ((0, S.useLayoutEffect)(() => {
                o(new DocumentFragment)
            }, []), r.open) ? (0, P.jsx)(et, {
                ...e,
                ref: t
            }) : n ? a.createPortal((0, P.jsx)(J, {
                scope: e.__scopeSelect,
                children: (0, P.jsx)(O.Slot, {
                    scope: e.__scopeSelect,
                    children: (0, P.jsx)("div", {
                        children: e.children
                    })
                })
            }), n) : null
        });
    $.displayName = Z;
    var [J, Q] = I(Z), ee = (0, b.createSlot)("SelectContent.RemoveScroll"), et = i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            position: n = "item-aligned",
            onCloseAutoFocus: o,
            onEscapeKeyDown: l,
            onPointerDownOutside: a,
            side: s,
            sideOffset: c,
            align: f,
            alignOffset: p,
            arrowPadding: g,
            collisionBoundary: y,
            collisionPadding: x,
            sticky: w,
            hideWhenDetached: b,
            avoidCollisions: C,
            ...E
        } = e, S = B(Z, r), [R, T] = i.useState(null), [L, j] = i.useState(null), k = (0, d.useComposedRefs)(t, e => T(e)), [O, D] = i.useState(null), [I, H] = i.useState(null), F = M(r), [_, W] = i.useState(!1), z = i.useRef(!1);
        i.useEffect(() => {
            if (R) return (0, A.hideOthers)(R)
        }, [R]), (0, v.useFocusGuards)();
        let V = i.useCallback(e => {
                let [t, ...r] = F().map(e => e.ref.current), [n] = r.slice(-1), o = document.activeElement;
                for (let r of e)
                    if (r === o || (null == r || r.scrollIntoView({
                            block: "nearest"
                        }), r === t && L && (L.scrollTop = 0), r === n && L && (L.scrollTop = L.scrollHeight), null == r || r.focus(), document.activeElement !== o)) return
            }, [F, L]),
            U = i.useCallback(() => V([O, R]), [V, O, R]);
        i.useEffect(() => {
            _ && U()
        }, [_, U]);
        let {
            onOpenChange: K,
            triggerPointerDownPosRef: X
        } = S;
        i.useEffect(() => {
            if (R) {
                let e = {
                        x: 0,
                        y: 0
                    },
                    t = t => {
                        var r, n, o, l;
                        e = {
                            x: Math.abs(Math.round(t.pageX) - (null != (r = null == (o = X.current) ? void 0 : o.x) ? r : 0)),
                            y: Math.abs(Math.round(t.pageY) - (null != (n = null == (l = X.current) ? void 0 : l.y) ? n : 0))
                        }
                    },
                    r = r => {
                        e.x <= 10 && e.y <= 10 ? r.preventDefault() : R.contains(r.target) || K(!1), document.removeEventListener("pointermove", t), X.current = null
                    };
                return null !== X.current && (document.addEventListener("pointermove", t), document.addEventListener("pointerup", r, {
                    capture: !0,
                    once: !0
                })), () => {
                    document.removeEventListener("pointermove", t), document.removeEventListener("pointerup", r, {
                        capture: !0
                    })
                }
            }
        }, [R, K, X]), i.useEffect(() => {
            let e = () => K(!1);
            return window.addEventListener("blur", e), window.addEventListener("resize", e), () => {
                window.removeEventListener("blur", e), window.removeEventListener("resize", e)
            }
        }, [K]);
        let [Y, G] = eR(e => {
            let t = F().filter(e => !e.disabled),
                r = t.find(e => e.ref.current === document.activeElement),
                n = eP(t, e, r);
            n && setTimeout(() => n.ref.current.focus())
        }), q = i.useCallback((e, t, r) => {
            let n = !z.current && !r;
            (void 0 !== S.value && S.value === t || n) && (D(e), n && (z.current = !0))
        }, [S.value]), $ = i.useCallback(() => null == R ? void 0 : R.focus(), [R]), Q = i.useCallback((e, t, r) => {
            let n = !z.current && !r;
            (void 0 !== S.value && S.value === t || n) && H(e)
        }, [S.value]), et = "popper" === n ? en : er, eo = et === en ? {
            side: s,
            sideOffset: c,
            align: f,
            alignOffset: p,
            arrowPadding: g,
            collisionBoundary: y,
            collisionPadding: x,
            sticky: w,
            hideWhenDetached: b,
            avoidCollisions: C
        } : {};
        return (0, P.jsx)(J, {
            scope: r,
            content: R,
            viewport: L,
            onViewportChange: j,
            itemRefCallback: q,
            selectedItem: O,
            onItemLeave: $,
            itemTextRefCallback: Q,
            focusSelectedItem: U,
            selectedItemText: I,
            position: n,
            isPositioned: _,
            searchRef: Y,
            children: (0, P.jsx)(N.RemoveScroll, {
                as: ee,
                allowPinchZoom: !0,
                children: (0, P.jsx)(h.FocusScope, {
                    asChild: !0,
                    trapped: S.open,
                    onMountAutoFocus: e => {
                        e.preventDefault()
                    },
                    onUnmountAutoFocus: (0, u.composeEventHandlers)(o, e => {
                        var t;
                        null == (t = S.trigger) || t.focus({
                            preventScroll: !0
                        }), e.preventDefault()
                    }),
                    children: (0, P.jsx)(m.DismissableLayer, {
                        asChild: !0,
                        disableOutsidePointerEvents: !0,
                        onEscapeKeyDown: l,
                        onPointerDownOutside: a,
                        onFocusOutside: e => e.preventDefault(),
                        onDismiss: () => S.onOpenChange(!1),
                        children: (0, P.jsx)(et, {
                            role: "listbox",
                            id: S.contentId,
                            "data-state": S.open ? "open" : "closed",
                            dir: S.dir,
                            onContextMenu: e => e.preventDefault(),
                            ...E,
                            ...eo,
                            onPlaced: () => W(!0),
                            ref: k,
                            style: {
                                display: "flex",
                                flexDirection: "column",
                                outline: "none",
                                ...E.style
                            },
                            onKeyDown: (0, u.composeEventHandlers)(E.onKeyDown, e => {
                                let t = e.ctrlKey || e.altKey || e.metaKey;
                                if ("Tab" === e.key && e.preventDefault(), t || 1 !== e.key.length || G(e.key), ["ArrowUp", "ArrowDown", "Home", "End"].includes(e.key)) {
                                    let t = F().filter(e => !e.disabled).map(e => e.ref.current);
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
    et.displayName = "SelectContentImpl";
    var er = i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            onPlaced: n,
            ...o
        } = e, l = B(Z, r), a = Q(Z, r), [u, c] = i.useState(null), [f, p] = i.useState(null), m = (0, d.useComposedRefs)(t, e => p(e)), v = M(r), h = i.useRef(!1), g = i.useRef(!0), {
            viewport: y,
            selectedItem: x,
            selectedItemText: b,
            focusSelectedItem: C
        } = a, E = i.useCallback(() => {
            if (l.trigger && l.valueNode && u && f && y && x && b) {
                let e = l.trigger.getBoundingClientRect(),
                    t = f.getBoundingClientRect(),
                    r = l.valueNode.getBoundingClientRect(),
                    o = b.getBoundingClientRect();
                if ("rtl" !== l.dir) {
                    let n = o.left - t.left,
                        l = r.left - n,
                        i = e.left - l,
                        a = e.width + i,
                        c = Math.max(a, t.width),
                        d = window.innerWidth - 10,
                        f = (0, s.clamp)(l, [10, Math.max(10, d - c)]);
                    u.style.minWidth = a + "px", u.style.left = f + "px"
                } else {
                    let n = t.right - o.right,
                        l = window.innerWidth - r.right - n,
                        i = window.innerWidth - e.right - l,
                        a = e.width + i,
                        c = Math.max(a, t.width),
                        d = window.innerWidth - 10,
                        f = (0, s.clamp)(l, [10, Math.max(10, d - c)]);
                    u.style.minWidth = a + "px", u.style.right = f + "px"
                }
                let i = v(),
                    a = window.innerHeight - 20,
                    c = y.scrollHeight,
                    d = window.getComputedStyle(f),
                    p = parseInt(d.borderTopWidth, 10),
                    m = parseInt(d.paddingTop, 10),
                    g = parseInt(d.borderBottomWidth, 10),
                    w = p + m + c + parseInt(d.paddingBottom, 10) + g,
                    C = Math.min(5 * x.offsetHeight, w),
                    E = window.getComputedStyle(y),
                    S = parseInt(E.paddingTop, 10),
                    R = parseInt(E.paddingBottom, 10),
                    P = e.top + e.height / 2 - 10,
                    T = x.offsetHeight / 2,
                    A = p + m + (x.offsetTop + T);
                if (A <= P) {
                    let e = i.length > 0 && x === i[i.length - 1].ref.current;
                    u.style.bottom = "0px";
                    let t = Math.max(a - P, T + (e ? R : 0) + (f.clientHeight - y.offsetTop - y.offsetHeight) + g);
                    u.style.height = A + t + "px"
                } else {
                    let e = i.length > 0 && x === i[0].ref.current;
                    u.style.top = "0px";
                    let t = Math.max(P, p + y.offsetTop + (e ? S : 0) + T);
                    u.style.height = t + (w - A) + "px", y.scrollTop = A - P + y.offsetTop
                }
                u.style.margin = "".concat(10, "px 0"), u.style.minHeight = C + "px", u.style.maxHeight = a + "px", null == n || n(), requestAnimationFrame(() => h.current = !0)
            }
        }, [v, l.trigger, l.valueNode, u, f, y, x, b, l.dir, n]);
        (0, S.useLayoutEffect)(() => E(), [E]);
        let [R, T] = i.useState();
        (0, S.useLayoutEffect)(() => {
            f && T(window.getComputedStyle(f).zIndex)
        }, [f]);
        let A = i.useCallback(e => {
            e && !0 === g.current && (E(), null == C || C(), g.current = !1)
        }, [E, C]);
        return (0, P.jsx)(eo, {
            scope: r,
            contentWrapper: u,
            shouldExpandOnScrollRef: h,
            onScrollButtonChange: A,
            children: (0, P.jsx)("div", {
                ref: c,
                style: {
                    display: "flex",
                    flexDirection: "column",
                    position: "fixed",
                    zIndex: R
                },
                children: (0, P.jsx)(w.Primitive.div, {
                    ...o,
                    ref: m,
                    style: {
                        boxSizing: "border-box",
                        maxHeight: "100%",
                        ...o.style
                    }
                })
            })
        })
    });
    er.displayName = "SelectItemAlignedPosition";
    var en = i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            align: n = "start",
            collisionPadding: o = 10,
            ...l
        } = e, i = F(r);
        return (0, P.jsx)(y.Content, {
            ...i,
            ...l,
            ref: t,
            align: n,
            collisionPadding: o,
            style: {
                boxSizing: "border-box",
                ...l.style,
                "--radix-select-content-transform-origin": "var(--radix-popper-transform-origin)",
                "--radix-select-content-available-width": "var(--radix-popper-available-width)",
                "--radix-select-content-available-height": "var(--radix-popper-available-height)",
                "--radix-select-trigger-width": "var(--radix-popper-anchor-width)",
                "--radix-select-trigger-height": "var(--radix-popper-anchor-height)"
            }
        })
    });
    en.displayName = "SelectPopperPosition";
    var [eo, el] = I(Z, {}), ei = "SelectViewport", ea = i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            nonce: n,
            ...o
        } = e, l = Q(ei, r), a = el(ei, r), s = (0, d.useComposedRefs)(t, l.onViewportChange), c = i.useRef(0);
        return (0, P.jsxs)(P.Fragment, {
            children: [(0, P.jsx)("style", {
                dangerouslySetInnerHTML: {
                    __html: "[data-radix-select-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-select-viewport]::-webkit-scrollbar{display:none}"
                },
                nonce: n
            }), (0, P.jsx)(O.Slot, {
                scope: r,
                children: (0, P.jsx)(w.Primitive.div, {
                    "data-radix-select-viewport": "",
                    role: "presentation",
                    ...o,
                    ref: s,
                    style: {
                        position: "relative",
                        flex: 1,
                        overflow: "hidden auto",
                        ...o.style
                    },
                    onScroll: (0, u.composeEventHandlers)(o.onScroll, e => {
                        let t = e.currentTarget,
                            {
                                contentWrapper: r,
                                shouldExpandOnScrollRef: n
                            } = a;
                        if ((null == n ? void 0 : n.current) && r) {
                            let e = Math.abs(c.current - t.scrollTop);
                            if (e > 0) {
                                let n = window.innerHeight - 20,
                                    o = Math.max(parseFloat(r.style.minHeight), parseFloat(r.style.height));
                                if (o < n) {
                                    let l = o + e,
                                        i = Math.min(n, l),
                                        a = l - i;
                                    r.style.height = i + "px", "0px" === r.style.bottom && (t.scrollTop = a > 0 ? a : 0, r.style.justifyContent = "flex-end")
                                }
                            }
                        }
                        c.current = t.scrollTop
                    })
                })
            })]
        })
    });
    ea.displayName = ei;
    var es = "SelectGroup",
        [eu, ec] = I(es);
    i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e, o = (0, g.useId)();
        return (0, P.jsx)(eu, {
            scope: r,
            id: o,
            children: (0, P.jsx)(w.Primitive.div, {
                role: "group",
                "aria-labelledby": o,
                ...n,
                ref: t
            })
        })
    }).displayName = es;
    var ed = "SelectLabel";
    i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e, o = ec(ed, r);
        return (0, P.jsx)(w.Primitive.div, {
            id: o.id,
            ...n,
            ref: t
        })
    }).displayName = ed;
    var ef = "SelectItem",
        [ep, em] = I(ef),
        ev = i.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                value: n,
                disabled: o = !1,
                textValue: l,
                ...a
            } = e, s = B(ef, r), c = Q(ef, r), f = s.value === n, [p, m] = i.useState(null != l ? l : ""), [v, h] = i.useState(!1), y = (0, d.useComposedRefs)(t, e => {
                var t;
                return null == (t = c.itemRefCallback) ? void 0 : t.call(c, e, n, o)
            }), x = (0, g.useId)(), b = i.useRef("touch"), C = () => {
                o || (s.onValueChange(n), s.onOpenChange(!1))
            };
            if ("" === n) throw Error("A <Select.Item /> must have a value prop that is not an empty string. This is because the Select value can be set to an empty string to clear the selection and show the placeholder.");
            return (0, P.jsx)(ep, {
                scope: r,
                value: n,
                disabled: o,
                textId: x,
                isSelected: f,
                onItemTextChange: i.useCallback(e => {
                    m(t => {
                        var r;
                        return t || (null != (r = null == e ? void 0 : e.textContent) ? r : "").trim()
                    })
                }, []),
                children: (0, P.jsx)(O.ItemSlot, {
                    scope: r,
                    value: n,
                    disabled: o,
                    textValue: p,
                    children: (0, P.jsx)(w.Primitive.div, {
                        role: "option",
                        "aria-labelledby": x,
                        "data-highlighted": v ? "" : void 0,
                        "aria-selected": f && v,
                        "data-state": f ? "checked" : "unchecked",
                        "aria-disabled": o || void 0,
                        "data-disabled": o ? "" : void 0,
                        tabIndex: o ? void 0 : -1,
                        ...a,
                        ref: y,
                        onFocus: (0, u.composeEventHandlers)(a.onFocus, () => h(!0)),
                        onBlur: (0, u.composeEventHandlers)(a.onBlur, () => h(!1)),
                        onClick: (0, u.composeEventHandlers)(a.onClick, () => {
                            "mouse" !== b.current && C()
                        }),
                        onPointerUp: (0, u.composeEventHandlers)(a.onPointerUp, () => {
                            "mouse" === b.current && C()
                        }),
                        onPointerDown: (0, u.composeEventHandlers)(a.onPointerDown, e => {
                            b.current = e.pointerType
                        }),
                        onPointerMove: (0, u.composeEventHandlers)(a.onPointerMove, e => {
                            if (b.current = e.pointerType, o) {
                                var t;
                                null == (t = c.onItemLeave) || t.call(c)
                            } else "mouse" === b.current && e.currentTarget.focus({
                                preventScroll: !0
                            })
                        }),
                        onPointerLeave: (0, u.composeEventHandlers)(a.onPointerLeave, e => {
                            if (e.currentTarget === document.activeElement) {
                                var t;
                                null == (t = c.onItemLeave) || t.call(c)
                            }
                        }),
                        onKeyDown: (0, u.composeEventHandlers)(a.onKeyDown, e => {
                            var t;
                            ((null == (t = c.searchRef) ? void 0 : t.current) === "" || " " !== e.key) && (j.includes(e.key) && C(), " " === e.key && e.preventDefault())
                        })
                    })
                })
            })
        });
    ev.displayName = ef;
    var eh = "SelectItemText",
        eg = i.forwardRef((e, t) => {
            let {
                __scopeSelect: r,
                className: n,
                style: o,
                ...l
            } = e, s = B(eh, r), u = Q(eh, r), c = em(eh, r), f = z(eh, r), [p, m] = i.useState(null), v = (0, d.useComposedRefs)(t, e => m(e), c.onItemTextChange, e => {
                var t;
                return null == (t = u.itemTextRefCallback) ? void 0 : t.call(u, e, c.value, c.disabled)
            }), h = null == p ? void 0 : p.textContent, g = i.useMemo(() => (0, P.jsx)("option", {
                value: c.value,
                disabled: c.disabled,
                children: h
            }, c.value), [c.disabled, c.value, h]), {
                onNativeOptionAdd: y,
                onNativeOptionRemove: x
            } = f;
            return (0, S.useLayoutEffect)(() => (y(g), () => x(g)), [y, x, g]), (0, P.jsxs)(P.Fragment, {
                children: [(0, P.jsx)(w.Primitive.span, {
                    id: c.textId,
                    ...l,
                    ref: v
                }), c.isSelected && s.valueNode && !s.valueNodeHasChildren ? a.createPortal(l.children, s.valueNode) : null]
            })
        });
    eg.displayName = eh;
    var ey = "SelectItemIndicator";
    i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e;
        return em(ey, r).isSelected ? (0, P.jsx)(w.Primitive.span, {
            "aria-hidden": !0,
            ...n,
            ref: t
        }) : null
    }).displayName = ey;
    var ex = "SelectScrollUpButton";
    i.forwardRef((e, t) => {
        let r = Q(ex, e.__scopeSelect),
            n = el(ex, e.__scopeSelect),
            [o, l] = i.useState(!1),
            a = (0, d.useComposedRefs)(t, n.onScrollButtonChange);
        return (0, S.useLayoutEffect)(() => {
            if (r.viewport && r.isPositioned) {
                let e = function() {
                        l(t.scrollTop > 0)
                    },
                    t = r.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [r.viewport, r.isPositioned]), o ? (0, P.jsx)(eb, {
            ...e,
            ref: a,
            onAutoScroll: () => {
                let {
                    viewport: e,
                    selectedItem: t
                } = r;
                e && t && (e.scrollTop = e.scrollTop - t.offsetHeight)
            }
        }) : null
    }).displayName = ex;
    var ew = "SelectScrollDownButton";
    i.forwardRef((e, t) => {
        let r = Q(ew, e.__scopeSelect),
            n = el(ew, e.__scopeSelect),
            [o, l] = i.useState(!1),
            a = (0, d.useComposedRefs)(t, n.onScrollButtonChange);
        return (0, S.useLayoutEffect)(() => {
            if (r.viewport && r.isPositioned) {
                let e = function() {
                        let e = t.scrollHeight - t.clientHeight;
                        l(Math.ceil(t.scrollTop) < e)
                    },
                    t = r.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [r.viewport, r.isPositioned]), o ? (0, P.jsx)(eb, {
            ...e,
            ref: a,
            onAutoScroll: () => {
                let {
                    viewport: e,
                    selectedItem: t
                } = r;
                e && t && (e.scrollTop = e.scrollTop + t.offsetHeight)
            }
        }) : null
    }).displayName = ew;
    var eb = i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            onAutoScroll: n,
            ...o
        } = e, l = Q("SelectScrollButton", r), a = i.useRef(null), s = M(r), c = i.useCallback(() => {
            null !== a.current && (window.clearInterval(a.current), a.current = null)
        }, []);
        return i.useEffect(() => () => c(), [c]), (0, S.useLayoutEffect)(() => {
            var e;
            let t = s().find(e => e.ref.current === document.activeElement);
            null == t || null == (e = t.ref.current) || e.scrollIntoView({
                block: "nearest"
            })
        }, [s]), (0, P.jsx)(w.Primitive.div, {
            "aria-hidden": !0,
            ...o,
            ref: t,
            style: {
                flexShrink: 0,
                ...o.style
            },
            onPointerDown: (0, u.composeEventHandlers)(o.onPointerDown, () => {
                null === a.current && (a.current = window.setInterval(n, 50))
            }),
            onPointerMove: (0, u.composeEventHandlers)(o.onPointerMove, () => {
                var e;
                null == (e = l.onItemLeave) || e.call(l), null === a.current && (a.current = window.setInterval(n, 50))
            }),
            onPointerLeave: (0, u.composeEventHandlers)(o.onPointerLeave, () => {
                c()
            })
        })
    });
    i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e;
        return (0, P.jsx)(w.Primitive.div, {
            "aria-hidden": !0,
            ...n,
            ref: t
        })
    }).displayName = "SelectSeparator";
    var eC = "SelectArrow";

    function eE(e) {
        return "" === e || void 0 === e
    }
    i.forwardRef((e, t) => {
        let {
            __scopeSelect: r,
            ...n
        } = e, o = F(r), l = B(eC, r), i = Q(eC, r);
        return l.open && "popper" === i.position ? (0, P.jsx)(y.Arrow, {
            ...o,
            ...n,
            ref: t
        }) : null
    }).displayName = eC;
    var eS = i.forwardRef((e, t) => {
        let {
            value: r,
            ...n
        } = e, o = i.useRef(null), l = (0, d.useComposedRefs)(t, o), a = (0, R.usePrevious)(r);
        return i.useEffect(() => {
            let e = o.current,
                t = Object.getOwnPropertyDescriptor(window.HTMLSelectElement.prototype, "value").set;
            if (a !== r && t) {
                let n = new Event("change", {
                    bubbles: !0
                });
                t.call(e, r), e.dispatchEvent(n)
            }
        }, [a, r]), (0, P.jsx)(T, {
            asChild: !0,
            children: (0, P.jsx)("select", {
                ...n,
                ref: l,
                defaultValue: r
            })
        })
    });

    function eR(e) {
        let t = (0, C.useCallbackRef)(e),
            r = i.useRef(""),
            n = i.useRef(0),
            o = i.useCallback(e => {
                let o = r.current + e;
                t(o),
                    function e(t) {
                        r.current = t, window.clearTimeout(n.current), "" !== t && (n.current = window.setTimeout(() => e(""), 1e3))
                    }(o)
            }, [t]),
            l = i.useCallback(() => {
                r.current = "", window.clearTimeout(n.current)
            }, []);
        return i.useEffect(() => () => window.clearTimeout(n.current), []), [r, o, l]
    }

    function eP(e, t, r) {
        var n, o;
        let l = t.length > 1 && Array.from(t).every(e => e === t[0]) ? t[0] : t,
            i = r ? e.indexOf(r) : -1,
            a = (n = e, o = Math.max(i, 0), n.map((e, t) => n[(o + t) % n.length]));
        1 === l.length && (a = a.filter(e => e !== r));
        let s = a.find(e => e.textValue.toLowerCase().startsWith(l.toLowerCase()));
        return s !== r ? s : void 0
    }
    eS.displayName = "BubbleSelect", e.s(["Content", 0, $, "Icon", 0, G, "Item", 0, ev, "ItemText", 0, eg, "Portal", 0, q, "Root", 0, V, "Trigger", 0, K, "Value", 0, Y, "Viewport", 0, ea], 563921);
    let eT = (0, i.createContext)(null),
        eA = {
            XSmall: "size-300",
            Small: "size-400",
            Medium: "size-500",
            Large: "size-600"
        },
        eN = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        eL = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium",
            Large: "text-title-large"
        },
        ej = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        ek = {
            XSmall: "gap-xsmall",
            Small: "gap-small",
            Medium: "gap-small",
            Large: "gap-small"
        },
        eO = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        eM = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        eD = (0, i.forwardRef)((e, a) => {
            let {
                label: s,
                labelTooltip: u,
                ariaLabelledBy: c,
                ariaLabel: d,
                className: f,
                size: p,
                variant: m = "Standard",
                value: v,
                placeholder: h,
                isDisabled: g,
                hasError: y,
                hint: x,
                onValueChange: w,
                onOpenChange: b,
                children: C
            } = e, E = (0, r.default)(), S = (0, i.useMemo)(() => ({
                size: p
            }), [p]), R = s ? i.default.createElement("span", {
                id: E,
                className: (0, l.default)(eL[p], "content-emphasis")
            }, s) : null;
            return i.default.createElement(eT.Provider, {
                value: S
            }, i.default.createElement("div", {
                className: (0, l.default)("flex flex-col", g && ["opacity-[0.5]", "pointer-events-none"], ek[p], f)
            }, R && (u ? i.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, R, i.default.createElement(n.LabelTooltip, u)) : R), i.default.createElement(V, {
                value: v,
                disabled: g,
                onValueChange: w,
                onOpenChange: b
            }, i.default.createElement(K, {
                className: (0, l.default)("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", o.INPUT_BACKGROUND_BY_VARIANT[m], o.INPUT_STROKE_BY_VARIANT[m], eO[p], eM[p], eN[p], ej[p], y ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", void 0 === v ? "content-muted" : "content-default"),
                ref: a,
                "aria-labelledby": s ? E : c,
                "aria-label": d
            }, i.default.createElement(t.StateLayer, null), i.default.createElement("div", {
                className: "grow-1 text-truncate-split text-align-x-left"
            }, i.default.createElement(Y, {
                placeholder: h
            })), i.default.createElement(G, {
                className: (0, l.default)(eA[p], "icon icon-regular-chevron-large-down content-default")
            })), i.default.createElement(q, null, i.default.createElement($, {
                position: "popper",
                className: "padding-y-small foundation-web-portal-zindex",
                style: {
                    maxHeight: "var(--radix-select-content-available-height)"
                }
            }, C))), x && i.default.createElement("span", {
                className: (0, l.default)("text-caption-small", {
                    "content-system-alert": y,
                    "content-default": !y
                })
            }, x)))
        });
    eD.displayName = "Dropdown", e.s(["Dropdown", 0, eD, "DropdownContext", 0, eT], 316413)
}, 95899, e => {
    "use strict";
    var t = e.i(140625),
        r = e.i(316413),
        n = e.i(197649),
        o = e.i(416340),
        l = e.i(23342),
        i = e.i(563921),
        a = e.i(142953);
    let s = {
            XSmall: "radius-medium",
            Small: "radius-large",
            Medium: "radius-large",
            Large: "radius-large"
        },
        u = {
            XSmall: "padding-xsmall",
            Small: "padding-small",
            Medium: "padding-small",
            Large: "padding-small"
        },
        c = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        d = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-small",
            Large: "padding-y-medium"
        },
        f = {
            XSmall: "gap-x-medium",
            Small: "gap-x-medium",
            Medium: "gap-x-medium",
            Large: "gap-x-large"
        },
        p = {
            XSmall: "gap-y-xxsmall",
            Small: "gap-y-xxsmall",
            Medium: "gap-y-xsmall",
            Large: "gap-y-xsmall"
        },
        m = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        v = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        h = (0, o.createContext)(null),
        g = () => {
            let e = (0, o.useContext)(h);
            if (!e) throw Error("Menu components must be used within a Menu");
            return e
        };
    e.s(["Menu", 0, e => {
        var t;
        let {
            children: l,
            className: u,
            size: c
        } = e, d = (0, o.useContext)(r.DropdownContext), f = d ? "dropdown" : "standalone", p = null != (t = null != c ? c : null == d ? void 0 : d.size) ? t : "Medium", m = (0, o.useMemo)(() => ({
            size: p,
            mode: f
        }), [p, f]), v = (0, n.default)("foundation-web-menu bg-surface-100 stroke-standard stroke-default shadow-transient-high", s[p], u), g = "standalone" === f ? o.default.createElement(a.Root, {
            asChild: !0,
            orientation: "vertical",
            loop: !0
        }, o.default.createElement("div", {
            role: "menu",
            tabIndex: -1,
            className: v
        }, l)) : o.default.createElement("div", {
            className: v
        }, l);
        return o.default.createElement(h.Provider, {
            value: m
        }, "dropdown" === f ? o.default.createElement(i.Viewport, {
            asChild: !0,
            style: {
                width: "var(--radix-popper-anchor-width)"
            }
        }, g) : g)
    }, "MenuItem", 0, e => {
        let r, {
                value: s,
                leading: u,
                title: h,
                description: y,
                trailing: x,
                disabled: w,
                className: b,
                onSelect: C,
                asChild: E,
                children: S,
                ...R
            } = e,
            {
                size: P,
                mode: T
            } = g(),
            A = (0, n.default)(t.interactable, "foundation-web-menu-item flex items-center content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full", m[P], c[P], d[P], f[P], v[P], w && "opacity-[0.5]", w && "pointer-events-none", b),
            N = o.default.createElement("span", {
                className: "foundation-web-menu-item-title text-no-wrap text-truncate-split content-emphasis"
            }, h);
        switch (T) {
            case "dropdown":
                N = o.default.createElement(i.ItemText, {
                    asChild: !0
                }, N);
                break;
            case "standalone":
                break;
            default:
                console.error("Invalid menu mode:", T)
        }
        let L = o.default.createElement(o.default.Fragment, null, !w && o.default.createElement(t.StateLayer, null), u, o.default.createElement("div", {
            className: (0, n.default)("grow-1 text-truncate-split flex flex-col", p[P])
        }, N, y && o.default.createElement("div", {
            className: "foundation-web-menu-item-description content-muted"
        }, y)), x);
        if (E) {
            let {
                as: e,
                ...n
            } = R, i = o.default.Children.only(S), a = void 0 === h && i.props.children;
            r = o.default.createElement(l.Slot, {
                ...n,
                role: "standalone" === T ? "menuitem" : void 0,
                "aria-disabled": w || void 0,
                className: A,
                style: {
                    outlineOffset: 0
                },
                onClick: w ? void 0 : C
            }, a ? o.default.cloneElement(i, {}, o.default.createElement(o.default.Fragment, null, !w && o.default.createElement(t.StateLayer, null), i.props.children)) : o.default.cloneElement(i, {}, L))
        } else if ("a" === R.as) {
            let {
                as: e,
                href: t,
                ...n
            } = R;
            r = o.default.createElement("a", {
                ...n,
                role: "standalone" === T ? "menuitem" : void 0,
                "aria-disabled": w,
                href: w ? void 0 : t,
                className: A,
                style: {
                    outlineOffset: 0,
                    textDecoration: "none"
                },
                onClick: w ? void 0 : C
            }, L)
        } else {
            let {
                as: e,
                ...t
            } = R;
            r = o.default.createElement("button", {
                type: "button",
                ...t,
                role: "standalone" === T ? "menuitem" : void 0,
                "aria-disabled": w,
                className: A,
                style: {
                    outlineOffset: 0
                },
                onClick: w ? void 0 : C
            }, L)
        }
        return "dropdown" === T ? o.default.createElement(i.Item, {
            value: s,
            disabled: w,
            asChild: !0
        }, r) : o.default.createElement(a.Item, {
            asChild: !0,
            focusable: !0,
            tabStopId: s
        }, r)
    }, "MenuLabel", 0, e => {
        let {
            title: t,
            description: r,
            leading: l,
            trailing: i,
            disabled: a,
            className: s
        } = e, {
            size: u
        } = g(), v = (0, n.default)("foundation-web-menu-label flex items-center content-default text-truncate-split text-align-x-left width-full", m[u], c[u], d[u], f[u], a && "opacity-[0.5]", s);
        return o.default.createElement("div", {
            role: "none",
            className: v
        }, l, o.default.createElement("div", {
            className: (0, n.default)("grow-1 text-truncate-split flex flex-col", p[u])
        }, o.default.createElement("span", {
            className: "foundation-web-menu-label-title text-no-wrap text-truncate-split content-emphasis"
        }, t), r && o.default.createElement("div", {
            className: "foundation-web-menu-label-description content-muted"
        }, r)), i)
    }, "MenuSection", 0, e => {
        let {
            children: t,
            className: r
        } = e, {
            size: l
        } = g();
        return o.default.createElement("div", {
            role: "group",
            className: (0, n.default)(u[l], r)
        }, t)
    }, "MenuSeparator", 0, e => {
        let {
            className: t
        } = e;
        return o.default.createElement("div", {
            role: "separator",
            className: (0, n.default)("foundation-web-menu-separator", t)
        })
    }])
}, 905943, 734463, e => {
    "use strict";
    var t = e.i(197649),
        r = e.i(416340),
        n = e.i(19655),
        o = e.i(78892),
        l = e.i(608652),
        i = e.i(598943),
        a = e.i(793808),
        s = e.i(44265),
        u = e.i(40266),
        c = e.i(524887),
        d = e.i(763960),
        f = e.i(226972),
        p = e.i(594278),
        m = e.i(699704),
        v = e.i(428156),
        h = e.i(3300),
        g = e.i(813593),
        y = e.i(221628),
        x = "Popover",
        [w, b] = (0, l.createContextScope)(x, [c.createPopperScope]),
        C = (0, c.createPopperScope)(),
        [E, S] = w(x),
        R = e => {
            let {
                __scopePopover: t,
                children: n,
                open: o,
                defaultOpen: l,
                onOpenChange: i,
                modal: a = !1
            } = e, s = C(t), d = r.useRef(null), [f, p] = r.useState(!1), [m = !1, h] = (0, v.useControllableState)({
                prop: o,
                defaultProp: l,
                onChange: i
            });
            return (0, y.jsx)(c.Root, {
                ...s,
                children: (0, y.jsx)(E, {
                    scope: t,
                    contentId: (0, u.useId)(),
                    triggerRef: d,
                    open: m,
                    onOpenChange: h,
                    onOpenToggle: r.useCallback(() => h(e => !e), [h]),
                    hasCustomAnchor: f,
                    onCustomAnchorAdd: r.useCallback(() => p(!0), []),
                    onCustomAnchorRemove: r.useCallback(() => p(!1), []),
                    modal: a,
                    children: n
                })
            })
        };
    R.displayName = x;
    var P = "PopoverAnchor",
        T = r.forwardRef((e, t) => {
            let {
                __scopePopover: n,
                ...o
            } = e, l = S(P, n), i = C(n), {
                onCustomAnchorAdd: a,
                onCustomAnchorRemove: s
            } = l;
            return r.useEffect(() => (a(), () => s()), [a, s]), (0, y.jsx)(c.Anchor, {
                ...i,
                ...o,
                ref: t
            })
        });
    T.displayName = P;
    var A = "PopoverTrigger",
        N = r.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                ...l
            } = e, i = S(A, r), a = C(r), s = (0, o.useComposedRefs)(t, i.triggerRef), u = (0, y.jsx)(p.Primitive.button, {
                type: "button",
                "aria-haspopup": "dialog",
                "aria-expanded": i.open,
                "aria-controls": i.contentId,
                "data-state": V(i.open),
                ...l,
                ref: s,
                onClick: (0, n.composeEventHandlers)(e.onClick, i.onOpenToggle)
            });
            return i.hasCustomAnchor ? u : (0, y.jsx)(c.Anchor, {
                asChild: !0,
                ...a,
                children: u
            })
        });
    N.displayName = A;
    var L = "PopoverPortal",
        [j, k] = w(L, {
            forceMount: void 0
        }),
        O = e => {
            let {
                __scopePopover: t,
                forceMount: r,
                children: n,
                container: o
            } = e, l = S(L, t);
            return (0, y.jsx)(j, {
                scope: t,
                forceMount: r,
                children: (0, y.jsx)(f.Presence, {
                    present: r || l.open,
                    children: (0, y.jsx)(d.Portal, {
                        asChild: !0,
                        container: o,
                        children: n
                    })
                })
            })
        };
    O.displayName = L;
    var M = "PopoverContent",
        D = r.forwardRef((e, t) => {
            let r = k(M, e.__scopePopover),
                {
                    forceMount: n = r.forceMount,
                    ...o
                } = e,
                l = S(M, e.__scopePopover);
            return (0, y.jsx)(f.Presence, {
                present: n || l.open,
                children: l.modal ? (0, y.jsx)(H, {
                    ...o,
                    ref: t
                }) : (0, y.jsx)(F, {
                    ...o,
                    ref: t
                })
            })
        });
    D.displayName = M;
    var I = (0, m.createSlot)("PopoverContent.RemoveScroll"),
        H = r.forwardRef((e, t) => {
            let l = S(M, e.__scopePopover),
                i = r.useRef(null),
                a = (0, o.useComposedRefs)(t, i),
                s = r.useRef(!1);
            return r.useEffect(() => {
                let e = i.current;
                if (e) return (0, h.hideOthers)(e)
            }, []), (0, y.jsx)(g.RemoveScroll, {
                as: I,
                allowPinchZoom: !0,
                children: (0, y.jsx)(_, {
                    ...e,
                    ref: a,
                    trapFocus: l.open,
                    disableOutsidePointerEvents: !0,
                    onCloseAutoFocus: (0, n.composeEventHandlers)(e.onCloseAutoFocus, e => {
                        var t;
                        e.preventDefault(), s.current || null == (t = l.triggerRef.current) || t.focus()
                    }),
                    onPointerDownOutside: (0, n.composeEventHandlers)(e.onPointerDownOutside, e => {
                        let t = e.detail.originalEvent,
                            r = 0 === t.button && !0 === t.ctrlKey;
                        s.current = 2 === t.button || r
                    }, {
                        checkForDefaultPrevented: !1
                    }),
                    onFocusOutside: (0, n.composeEventHandlers)(e.onFocusOutside, e => e.preventDefault(), {
                        checkForDefaultPrevented: !1
                    })
                })
            })
        }),
        F = r.forwardRef((e, t) => {
            let n = S(M, e.__scopePopover),
                o = r.useRef(!1),
                l = r.useRef(!1);
            return (0, y.jsx)(_, {
                ...e,
                ref: t,
                trapFocus: !1,
                disableOutsidePointerEvents: !1,
                onCloseAutoFocus: t => {
                    var r, i;
                    null == (r = e.onCloseAutoFocus) || r.call(e, t), t.defaultPrevented || (o.current || null == (i = n.triggerRef.current) || i.focus(), t.preventDefault()), o.current = !1, l.current = !1
                },
                onInteractOutside: t => {
                    var r, i;
                    null == (r = e.onInteractOutside) || r.call(e, t), t.defaultPrevented || (o.current = !0, "pointerdown" === t.detail.originalEvent.type && (l.current = !0));
                    let a = t.target;
                    (null == (i = n.triggerRef.current) ? void 0 : i.contains(a)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && l.current && t.preventDefault()
                }
            })
        }),
        _ = r.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                trapFocus: n,
                onOpenAutoFocus: o,
                onCloseAutoFocus: l,
                disableOutsidePointerEvents: u,
                onEscapeKeyDown: d,
                onPointerDownOutside: f,
                onFocusOutside: p,
                onInteractOutside: m,
                ...v
            } = e, h = S(M, r), g = C(r);
            return (0, a.useFocusGuards)(), (0, y.jsx)(s.FocusScope, {
                asChild: !0,
                loop: !0,
                trapped: n,
                onMountAutoFocus: o,
                onUnmountAutoFocus: l,
                children: (0, y.jsx)(i.DismissableLayer, {
                    asChild: !0,
                    disableOutsidePointerEvents: u,
                    onInteractOutside: m,
                    onEscapeKeyDown: d,
                    onPointerDownOutside: f,
                    onFocusOutside: p,
                    onDismiss: () => h.onOpenChange(!1),
                    children: (0, y.jsx)(c.Content, {
                        "data-state": V(h.open),
                        role: "dialog",
                        id: h.contentId,
                        ...g,
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
        B = "PopoverClose",
        W = r.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                ...o
            } = e, l = S(B, r);
            return (0, y.jsx)(p.Primitive.button, {
                type: "button",
                ...o,
                ref: t,
                onClick: (0, n.composeEventHandlers)(e.onClick, () => l.onOpenChange(!1))
            })
        });
    W.displayName = B;
    var z = r.forwardRef((e, t) => {
        let {
            __scopePopover: r,
            ...n
        } = e, o = C(r);
        return (0, y.jsx)(c.Arrow, {
            ...o,
            ...n,
            ref: t
        })
    });

    function V(e) {
        return e ? "open" : "closed"
    }
    z.displayName = "PopoverArrow", e.s(["Anchor", 0, T, "Arrow", 0, z, "Close", 0, W, "Content", 0, D, "Portal", 0, O, "Root", 0, R, "Trigger", 0, N], 734463);
    let U = e => {
        var t, r, n, o, l, i;
        let a = null != (t = null == (n = (o = window).matchMedia) || null == (r = n.call(o, "(pointer: coarse)")) ? void 0 : r.matches) && t,
            s = null == (l = document.activeElement) ? void 0 : l.matches(":focus-visible");
        if (a && !s) return void e.preventDefault();
        let u = null == (i = e.currentTarget) ? void 0 : i.querySelector('[role="menuitem"]:not([aria-disabled="true"])');
        u && (e.preventDefault(), u.focus())
    };
    e.s(["Popover", 0, function(e) {
        let {
            open: t,
            defaultOpen: n,
            onOpenChange: o,
            children: l
        } = e;
        return r.createElement(R, {
            open: t,
            defaultOpen: n,
            onOpenChange: o
        }, l)
    }, "PopoverAnchor", 0, function(e) {
        let {
            asChild: t,
            className: n,
            children: o
        } = e;
        return r.createElement(T, {
            asChild: t,
            className: n
        }, o)
    }, "PopoverClose", 0, function(e) {
        let {
            children: t,
            ...n
        } = e;
        return r.createElement(W, n, t)
    }, "PopoverContent", 0, function(e) {
        let {
            side: n = "bottom",
            align: o = "center",
            sideOffset: l = 4,
            className: i,
            children: a,
            ariaLabel: s,
            onOpenAutoFocus: u,
            ...c
        } = e;
        return r.createElement(O, null, r.createElement(D, {
            side: n,
            align: o,
            sideOffset: l,
            ...c,
            "aria-label": null != s ? s : c["aria-label"],
            onOpenAutoFocus: null != u ? u : U,
            className: (0, t.default)("foundation-web-portal-zindex", i)
        }, a))
    }, "PopoverTrigger", 0, function(e) {
        let {
            asChild: t,
            disabled: n,
            className: o,
            children: l
        } = e;
        return r.createElement(N, {
            asChild: t,
            disabled: n,
            className: o
        }, l)
    }], 905943)
}, 515351, e => {
    "use strict";
    var t = e.i(606944),
        r = e.i(197649),
        n = e.i(416340),
        o = e.i(357716),
        l = e.i(195560),
        i = e.i(978437),
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
                ...l
            } = e;
            return (0, f.jsx)(d.Primitive.svg, {
                ...l,
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
        [g, y] = (0, i.createContextScope)(h),
        [x, w] = g(h),
        b = e => {
            let {
                __scopePopper: t,
                children: r
            } = e, [o, l] = n.useState(null);
            return (0, f.jsx)(x, {
                scope: t,
                anchor: o,
                onAnchorChange: l,
                children: r
            })
        };
    b.displayName = h;
    var C = "PopperAnchor",
        E = n.forwardRef((e, t) => {
            let {
                __scopePopper: r,
                virtualRef: o,
                ...i
            } = e, a = w(C, r), s = n.useRef(null), u = (0, l.useComposedRefs)(t, s);
            return n.useEffect(() => {
                a.onAnchorChange((null == o ? void 0 : o.current) || s.current)
            }), o ? null : (0, f.jsx)(d.Primitive.div, {
                ...i,
                ref: u
            })
        });
    E.displayName = C;
    var S = "PopperContent",
        [R, P] = g(S),
        T = n.forwardRef((e, t) => {
            var r, o, i, a, s, p, h, g;
            let {
                __scopePopper: y,
                side: x = "bottom",
                sideOffset: b = 0,
                align: C = "center",
                alignOffset: E = 0,
                arrowPadding: P = 0,
                avoidCollisions: T = !0,
                collisionBoundary: A = [],
                collisionPadding: N = 0,
                sticky: L = "partial",
                hideWhenDetached: M = !1,
                updatePositionStrategy: D = "optimized",
                onPlaced: I,
                ...H
            } = e, F = w(S, y), [_, B] = n.useState(null), W = (0, l.useComposedRefs)(t, e => B(e)), [z, V] = n.useState(null), U = function(e) {
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
                            let l = t[0];
                            if ("borderBoxSize" in l) {
                                let e = l.borderBoxSize,
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
            }(z), K = null != (r = null == U ? void 0 : U.width) ? r : 0, X = null != (o = null == U ? void 0 : U.height) ? o : 0, Y = "number" == typeof N ? N : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...N
            }, G = Array.isArray(A) ? A : [A], q = G.length > 0, Z = {
                padding: Y,
                boundary: G.filter(j),
                altBoundary: q
            }, {
                refs: $,
                floatingStyles: J,
                placement: Q,
                isPositioned: ee,
                middlewareData: et
            } = (0, u.useFloating)({
                strategy: "fixed",
                placement: x + ("center" !== C ? "-" + C : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return (0, c.autoUpdate)(...t, {
                        animationFrame: "always" === D
                    })
                },
                elements: {
                    reference: F.anchor
                },
                middleware: [(0, u.offset)({
                    mainAxis: b + X,
                    alignmentAxis: E
                }), T && (0, u.shift)({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === L ? (0, u.limitShift)() : void 0,
                    ...Z
                }), T && (0, u.flip)({
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
                            width: l,
                            height: i
                        } = r.reference, a = t.floating.style;
                        a.setProperty("--radix-popper-available-width", "".concat(n, "px")), a.setProperty("--radix-popper-available-height", "".concat(o, "px")), a.setProperty("--radix-popper-anchor-width", "".concat(l, "px")), a.setProperty("--radix-popper-anchor-height", "".concat(i, "px"))
                    }
                }), z && (0, u.arrow)({
                    element: z,
                    padding: P
                }), k({
                    arrowWidth: K,
                    arrowHeight: X
                }), M && (0, u.hide)({
                    strategy: "referenceHidden",
                    ...Z
                })]
            }), [er, en] = O(Q), eo = (0, m.useCallbackRef)(I);
            (0, v.useLayoutEffect)(() => {
                ee && (null == eo || eo())
            }, [ee, eo]);
            let el = null == (i = et.arrow) ? void 0 : i.x,
                ei = null == (a = et.arrow) ? void 0 : a.y,
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
                children: (0, f.jsx)(R, {
                    scope: y,
                    placedSide: er,
                    onArrowChange: V,
                    arrowX: el,
                    arrowY: ei,
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
    T.displayName = S;
    var A = "PopperArrow",
        N = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        L = n.forwardRef(function(e, t) {
            let {
                __scopePopper: r,
                ...n
            } = e, o = P(A, r), l = N[o.placedSide];
            return (0, f.jsx)("span", {
                ref: o.onArrowChange,
                style: {
                    position: "absolute",
                    left: o.arrowX,
                    top: o.arrowY,
                    [l]: 0,
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

    function j(e) {
        return null !== e
    }
    L.displayName = A;
    var k = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            var r, n, o, l, i;
            let {
                placement: a,
                rects: s,
                middlewareData: u
            } = t, c = (null == (o = u.arrow) ? void 0 : o.centerOffset) !== 0, d = c ? 0 : e.arrowWidth, f = c ? 0 : e.arrowHeight, [p, m] = O(a), v = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [m], h = (null != (r = null == (l = u.arrow) ? void 0 : l.x) ? r : 0) + d / 2, g = (null != (n = null == (i = u.arrow) ? void 0 : i.y) ? n : 0) + f / 2, y = "", x = "";
            return "bottom" === p ? (y = c ? v : "".concat(h, "px"), x = "".concat(-f, "px")) : "top" === p ? (y = c ? v : "".concat(h, "px"), x = "".concat(s.floating.height + f, "px")) : "right" === p ? (y = "".concat(-f, "px"), x = c ? v : "".concat(g, "px")) : "left" === p && (y = "".concat(s.floating.width + f, "px"), x = c ? v : "".concat(g, "px")), {
                data: {
                    x: y,
                    y: x
                }
            }
        }
    });

    function O(e) {
        let [t, r = "center"] = e.split("-");
        return [t, r]
    }
    var M = e.i(149285),
        D = n.forwardRef((e, t) => {
            var r, o;
            let {
                container: l,
                ...i
            } = e, [a, s] = n.useState(!1);
            (0, v.useLayoutEffect)(() => s(!0), []);
            let u = l || a && (null == (o = globalThis) || null == (r = o.document) ? void 0 : r.body);
            return u ? M.default.createPortal((0, f.jsx)(d.Primitive.div, {
                ...i,
                ref: t
            }), u) : null
        });
    D.displayName = "Portal";
    var I = e => {
        var t, r, o;
        let i, a, {
                present: s,
                children: u
            } = e,
            c = function(e) {
                var t, r;
                let [o, l] = n.useState(), i = n.useRef({}), a = n.useRef(e), s = n.useRef("none"), [u, c] = (t = e ? "mounted" : "unmounted", r = {
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
                    let e = H(i.current);
                    s.current = "mounted" === u ? e : "none"
                }, [u]), (0, v.useLayoutEffect)(() => {
                    let t = i.current,
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
                                let n = H(i.current).includes(e.animationName);
                                if (e.target === o && n && (c("ANIMATION_END"), !a.current)) {
                                    let e = o.style.animationFillMode;
                                    o.style.animationFillMode = "forwards", t = r.setTimeout(() => {
                                        "forwards" === o.style.animationFillMode && (o.style.animationFillMode = e)
                                    })
                                }
                            },
                            l = e => {
                                e.target === o && (s.current = H(i.current))
                            };
                        return o.addEventListener("animationstart", l), o.addEventListener("animationcancel", n), o.addEventListener("animationend", n), () => {
                            r.clearTimeout(t), o.removeEventListener("animationstart", l), o.removeEventListener("animationcancel", n), o.removeEventListener("animationend", n)
                        }
                    }
                    c("ANIMATION_END")
                }, [o, c]), {
                    isPresent: ["mounted", "unmountSuspended"].includes(u),
                    ref: n.useCallback(e => {
                        e && (i.current = getComputedStyle(e)), l(e)
                    }, [])
                }
            }(s),
            d = "function" == typeof u ? u({
                present: c.isPresent
            }) : n.Children.only(u),
            f = (0, l.useComposedRefs)(c.ref, (a = (i = null == (r = Object.getOwnPropertyDescriptor((t = d).props, "ref")) ? void 0 : r.get) && "isReactWarning" in i && i.isReactWarning) ? t.ref : (a = (i = null == (o = Object.getOwnPropertyDescriptor(t, "ref")) ? void 0 : o.get) && "isReactWarning" in i && i.isReactWarning) ? t.props.ref : t.props.ref || t.ref);
        return "function" == typeof u || c.isPresent ? n.cloneElement(d, {
            ref: f
        }) : null
    };

    function H(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    I.displayName = "Presence";
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
    var [B, W] = (0, i.createContextScope)("Tooltip", [y]), z = y(), V = "TooltipProvider", U = "tooltip.open", [K, X] = B(V), Y = e => {
        let {
            __scopeTooltip: t,
            delayDuration: r = 700,
            skipDelayDuration: o = 300,
            disableHoverableContent: l = !1,
            children: i
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
            disableHoverableContent: l,
            children: i
        })
    };
    Y.displayName = V;
    var G = "Tooltip",
        [q, Z] = B(G),
        $ = e => {
            let {
                __scopeTooltip: t,
                children: r,
                open: o,
                defaultOpen: l = !1,
                onOpenChange: i,
                disableHoverableContent: a,
                delayDuration: u
            } = e, c = X(G, e.__scopeTooltip), d = z(t), [p, v] = n.useState(null), h = (0, s.useId)(), g = n.useRef(0), y = null != a ? a : c.disableHoverableContent, x = null != u ? u : c.delayDuration, w = n.useRef(!1), [C = !1, E] = function(e) {
                let {
                    prop: t,
                    defaultProp: r,
                    onChange: o = () => {}
                } = e, [l, i] = function(e) {
                    let {
                        defaultProp: t,
                        onChange: r
                    } = e, o = n.useState(t), [l] = o, i = n.useRef(l), a = (0, m.useCallbackRef)(r);
                    return n.useEffect(() => {
                        i.current !== l && (a(l), i.current = l)
                    }, [l, i, a]), o
                }({
                    defaultProp: r,
                    onChange: o
                }), a = void 0 !== t, s = a ? t : l, u = (0, m.useCallbackRef)(o);
                return [s, n.useCallback(e => {
                    if (a) {
                        let r = "function" == typeof e ? e(t) : e;
                        r !== t && u(r)
                    } else i(e)
                }, [a, t, i, u])]
            }({
                prop: o,
                defaultProp: l,
                onChange: e => {
                    e ? (c.onOpen(), document.dispatchEvent(new CustomEvent(U))) : c.onClose(), null == i || i(e)
                }
            }), S = n.useMemo(() => C ? w.current ? "delayed-open" : "instant-open" : "closed", [C]), R = n.useCallback(() => {
                window.clearTimeout(g.current), g.current = 0, w.current = !1, E(!0)
            }, [E]), P = n.useCallback(() => {
                window.clearTimeout(g.current), g.current = 0, E(!1)
            }, [E]), T = n.useCallback(() => {
                window.clearTimeout(g.current), g.current = window.setTimeout(() => {
                    w.current = !0, E(!0), g.current = 0
                }, x)
            }, [x, E]);
            return n.useEffect(() => () => {
                g.current && (window.clearTimeout(g.current), g.current = 0)
            }, []), (0, f.jsx)(b, {
                ...d,
                children: (0, f.jsx)(q, {
                    scope: t,
                    contentId: h,
                    open: C,
                    stateAttribute: S,
                    trigger: p,
                    onTriggerChange: v,
                    onTriggerEnter: n.useCallback(() => {
                        c.isOpenDelayed ? T() : R()
                    }, [c.isOpenDelayed, T, R]),
                    onTriggerLeave: n.useCallback(() => {
                        y ? P() : (window.clearTimeout(g.current), g.current = 0)
                    }, [P, y]),
                    onOpen: R,
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
                ...i
            } = e, a = Z(J, r), s = X(J, r), u = z(r), c = n.useRef(null), p = (0, l.useComposedRefs)(t, c, a.onTriggerChange), m = n.useRef(!1), v = n.useRef(!1), h = n.useCallback(() => m.current = !1, []);
            return n.useEffect(() => () => document.removeEventListener("pointerup", h), [h]), (0, f.jsx)(E, {
                asChild: !0,
                ...u,
                children: (0, f.jsx)(d.Primitive.button, {
                    "aria-describedby": a.open ? a.contentId : void 0,
                    "data-state": a.stateAttribute,
                    ...i,
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
            } = e, l = Z(ee, t);
            return (0, f.jsx)(et, {
                scope: t,
                forceMount: r,
                children: (0, f.jsx)(I, {
                    present: r || l.open,
                    children: (0, f.jsx)(D, {
                        asChild: !0,
                        container: o,
                        children: n
                    })
                })
            })
        };
    en.displayName = ee;
    var eo = "TooltipContent",
        el = n.forwardRef((e, t) => {
            let r = er(eo, e.__scopeTooltip),
                {
                    forceMount: n = r.forceMount,
                    side: o = "top",
                    ...l
                } = e,
                i = Z(eo, e.__scopeTooltip);
            return (0, f.jsx)(I, {
                present: n || i.open,
                children: i.disableHoverableContent ? (0, f.jsx)(eu, {
                    side: o,
                    ...l,
                    ref: t
                }) : (0, f.jsx)(ei, {
                    side: o,
                    ...l,
                    ref: t
                })
            })
        }),
        ei = n.forwardRef((e, t) => {
            let r = Z(eo, e.__scopeTooltip),
                o = X(eo, e.__scopeTooltip),
                i = n.useRef(null),
                a = (0, l.useComposedRefs)(t, i),
                [s, u] = n.useState(null),
                {
                    trigger: c,
                    onClose: d
                } = r,
                p = i.current,
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
                        l = function(e, t) {
                            let r = Math.abs(t.top - e.y),
                                n = Math.abs(t.bottom - e.y),
                                o = Math.abs(t.right - e.x),
                                l = Math.abs(t.left - e.x);
                            switch (Math.min(r, n, o, l)) {
                                case l:
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
                    }(o, l), ... function(e) {
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
                                for (let e = 0, l = t.length - 1; e < t.length; l = e++) {
                                    let i = t[e].x,
                                        a = t[e].y,
                                        s = t[l].x,
                                        u = t[l].y;
                                    a > n != u > n && r < (s - i) * (n - a) / (u - a) + i && (o = !o)
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
                "aria-label": l,
                onEscapeKeyDown: i,
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
                onEscapeKeyDown: i,
                onPointerDownOutside: s,
                onFocusOutside: e => e.preventDefault(),
                onDismiss: p,
                children: (0, f.jsxs)(T, {
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
                            children: l || o
                        })
                    })]
                })
            })
        });
    el.displayName = eo;
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
    ed.displayName = ec, e.s(["Tooltip", 0, function(e) {
        let {
            position: o,
            hasBeak: l = !0,
            title: i,
            description: a,
            ariaLabel: s,
            delayDurationMs: u = 500,
            children: c,
            open: d,
            onOpenChange: f,
            contentClassName: p
        } = e, [m, v] = o.split("-"), h = null != s ? s : "string" == typeof i && null == a ? i : void 0;
        return n.createElement(Y, {
            delayDuration: u
        }, n.createElement($, {
            open: d,
            onOpenChange: f
        }, c, n.createElement(en, null, n.createElement(el, {
            side: m,
            align: v,
            "aria-label": h,
            className: (0, r.default)("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", p),
            sideOffset: 5
        }, l && n.createElement(ed, {
            asChild: !0
        }, n.createElement(t.Beak, {
            className: "content-[var(--inverse-surface-0)]"
        })), n.createElement("div", {
            className: "flex flex-col text-truncate-split"
        }, n.createElement("div", {
            className: "text-caption-medium content-inverse-default"
        }, i), a && n.createElement("div", {
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
    }], 515351)
}, 606944, 357716, 195560, 978437, 362496, 791634, 448970, 326301, 993032, 636598, e => {
    "use strict";
    var t, r, n = e.i(197649),
        o = e.i(416340);

    function l(e, t) {
        let {
            checkForDefaultPrevented: r = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(n) {
            if (null == e || e(n), !1 === r || !n.defaultPrevented) return null == t ? void 0 : t(n)
        }
    }

    function i(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function a() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return e => {
            let r = !1,
                n = t.map(t => {
                    let n = i(t, e);
                    return r || "function" != typeof n || (r = !0), n
                });
            if (r) return () => {
                for (let e = 0; e < n.length; e++) {
                    let r = n[e];
                    "function" == typeof r ? r() : i(t[e], null)
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
    }], 606944), e.s(["composeEventHandlers", 0, l], 357716), e.s(["composeRefs", 0, a, "useComposedRefs", 0, s], 195560);
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
            let l = o.createContext(n),
                i = r.length;
            r = [...r, n];
            let a = t => {
                var r;
                let {
                    scope: n,
                    children: a,
                    ...s
                } = t, c = (null == n || null == (r = n[e]) ? void 0 : r[i]) || l, d = o.useMemo(() => s, Object.values(s));
                return (0, u.jsx)(c.Provider, {
                    value: d,
                    children: a
                })
            };
            return a.displayName = t + "Provider", [a, function(r, a) {
                var s;
                let u = (null == a || null == (s = a[e]) ? void 0 : s[i]) || l,
                    c = o.useContext(u);
                if (c) return c;
                if (void 0 !== n) return n;
                throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
            }]
        }, function() {
            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
            let n = t[0];
            if (1 === t.length) return n;
            let l = () => {
                let e = t.map(e => ({
                    useScope: e(),
                    scopeName: e.scopeName
                }));
                return function(t) {
                    let r = e.reduce((e, r) => {
                        let {
                            useScope: n,
                            scopeName: o
                        } = r, l = n(t)["__scope".concat(o)];
                        return {
                            ...e,
                            ...l
                        }
                    }, {});
                    return o.useMemo(() => ({
                        ["__scope".concat(n.scopeName)]: r
                    }), [r])
                }
            };
            return l.scopeName = n.scopeName, l
        }(n, ...t)]
    }], 978437);
    var c = e.i(149285),
        d = o.forwardRef((e, t) => {
            let {
                children: r,
                ...n
            } = e, l = o.Children.toArray(r), i = l.find(m);
            if (i) {
                let e = i.props.children,
                    r = l.map(t => t !== i ? t : o.Children.count(e) > 1 ? o.Children.only(null) : o.isValidElement(e) ? e.props.children : null);
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
            var l, i, s;
            let e, u, c = (u = (e = null == (i = Object.getOwnPropertyDescriptor((l = r).props, "ref")) ? void 0 : i.get) && "isReactWarning" in e && e.isReactWarning) ? l.ref : (u = (e = null == (s = Object.getOwnPropertyDescriptor(l, "ref")) ? void 0 : s.get) && "isReactWarning" in e && e.isReactWarning) ? l.props.ref : l.props.ref || l.ref;
            return o.cloneElement(r, {
                ... function(e, t) {
                    let r = {
                        ...t
                    };
                    for (let n in t) {
                        let o = e[n],
                            l = t[n];
                        /^on[A-Z]/.test(n) ? o && l ? r[n] = function() {
                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                            l(...t), o(...t)
                        } : o && (r[n] = o) : "style" === n ? r[n] = {
                            ...o,
                            ...l
                        } : "className" === n && (r[n] = [o, l].filter(Boolean).join(" "))
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
            } = e, l = n ? d : t;
            return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, u.jsx)(l, {
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
        x = o.createContext({
            layers: new Set,
            layersWithOutsidePointerEventsDisabled: new Set,
            branches: new Set
        }),
        w = o.forwardRef((e, r) => {
            var n, i;
            let {
                disableOutsidePointerEvents: a = !1,
                onEscapeKeyDown: c,
                onPointerDownOutside: d,
                onFocusOutside: f,
                onInteractOutside: p,
                onDismiss: m,
                ...h
            } = e, w = o.useContext(x), [E, S] = o.useState(null), R = null != (n = null == E ? void 0 : E.ownerDocument) ? n : null == (i = globalThis) ? void 0 : i.document, [, P] = o.useState({}), T = s(r, e => S(e)), A = Array.from(w.layers), [N] = [...w.layersWithOutsidePointerEventsDisabled].slice(-1), L = A.indexOf(N), j = E ? A.indexOf(E) : -1, k = w.layersWithOutsidePointerEventsDisabled.size > 0, O = j >= L, M = function(e) {
                var t;
                let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    n = g(e),
                    l = o.useRef(!1),
                    i = o.useRef(() => {});
                return o.useEffect(() => {
                    let e = e => {
                            if (e.target && !l.current) {
                                let t = function() {
                                        C("dismissableLayer.pointerDownOutside", n, o, {
                                            discrete: !0
                                        })
                                    },
                                    o = {
                                        originalEvent: e
                                    };
                                "touch" === e.pointerType ? (r.removeEventListener("click", i.current), i.current = t, r.addEventListener("click", i.current, {
                                    once: !0
                                })) : t()
                            } else r.removeEventListener("click", i.current);
                            l.current = !1
                        },
                        t = window.setTimeout(() => {
                            r.addEventListener("pointerdown", e)
                        }, 0);
                    return () => {
                        window.clearTimeout(t), r.removeEventListener("pointerdown", e), r.removeEventListener("click", i.current)
                    }
                }, [r, n]), {
                    onPointerDownCapture: () => l.current = !0
                }
            }(e => {
                let t = e.target,
                    r = [...w.branches].some(e => e.contains(t));
                O && !r && (null == d || d(e), null == p || p(e), e.defaultPrevented || null == m || m())
            }, R), D = function(e) {
                var t;
                let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    n = g(e),
                    l = o.useRef(!1);
                return o.useEffect(() => {
                    let e = e => {
                        e.target && !l.current && C("dismissableLayer.focusOutside", n, {
                            originalEvent: e
                        }, {
                            discrete: !1
                        })
                    };
                    return r.addEventListener("focusin", e), () => r.removeEventListener("focusin", e)
                }, [r, n]), {
                    onFocusCapture: () => l.current = !0,
                    onBlurCapture: () => l.current = !1
                }
            }(e => {
                let t = e.target;
                ![...w.branches].some(e => e.contains(t)) && (null == f || f(e), null == p || p(e), e.defaultPrevented || null == m || m())
            }, R);
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
                j === w.layers.size - 1 && (null == c || c(e), !e.defaultPrevented && m && (e.preventDefault(), m()))
            }, R), o.useEffect(() => {
                if (E) return a && (0 === w.layersWithOutsidePointerEventsDisabled.size && (t = R.body.style.pointerEvents, R.body.style.pointerEvents = "none"), w.layersWithOutsidePointerEventsDisabled.add(E)), w.layers.add(E), b(), () => {
                    a && 1 === w.layersWithOutsidePointerEventsDisabled.size && (R.body.style.pointerEvents = t)
                }
            }, [E, R, a, w]), o.useEffect(() => () => {
                E && (w.layers.delete(E), w.layersWithOutsidePointerEventsDisabled.delete(E), b())
            }, [E, w]), o.useEffect(() => {
                let e = () => P({});
                return document.addEventListener(y, e), () => document.removeEventListener(y, e)
            }, []), (0, u.jsx)(v.div, {
                ...h,
                ref: T,
                style: {
                    pointerEvents: k ? O ? "auto" : "none" : void 0,
                    ...e.style
                },
                onFocusCapture: l(e.onFocusCapture, D.onFocusCapture),
                onBlurCapture: l(e.onBlurCapture, D.onBlurCapture),
                onPointerDownCapture: l(e.onPointerDownCapture, M.onPointerDownCapture)
            })
        });

    function b() {
        let e = new CustomEvent(y);
        document.dispatchEvent(e)
    }

    function C(e, t, r, n) {
        let {
            discrete: o
        } = n, l = r.originalEvent.target, i = new CustomEvent(e, {
            bubbles: !1,
            cancelable: !0,
            detail: r
        });
        t && l.addEventListener(e, t, {
            once: !0
        }), o ? h(l, i) : l.dispatchEvent(i)
    }
    w.displayName = "DismissableLayer", o.forwardRef((e, t) => {
        let r = o.useContext(x),
            n = o.useRef(null),
            l = s(t, n);
        return o.useEffect(() => {
            let e = n.current;
            if (e) return r.branches.add(e), () => {
                r.branches.delete(e)
            }
        }, [r.branches]), (0, u.jsx)(v.div, {
            ...e,
            ref: l
        })
    }).displayName = "DismissableLayerBranch", e.s(["DismissableLayer", 0, w], 326301);
    var E = (null == (r = globalThis) ? void 0 : r.document) ? o.useLayoutEffect : () => {};
    e.s(["useLayoutEffect", 0, E], 993032);
    var S = o["useId".toString()] || (() => void 0),
        R = 0;
    e.s(["useId", 0, function(e) {
        let [t, r] = o.useState(S());
        return E(() => {
            e || r(e => null != e ? e : String(R++))
        }, [e]), e || (t ? "radix-".concat(t) : "")
    }], 636598)
}, 148380, e => {
    "use strict";
    var t = e.i(75584),
        r = e.i(515351),
        n = e.i(416340);
    e.s(["LabelTooltip", 0, e => {
        let {
            title: o,
            description: l,
            position: i = "top-center"
        } = e;
        return n.default.createElement(r.Tooltip, {
            position: i,
            title: o,
            description: l
        }, n.default.createElement(r.TooltipTrigger, {
            asChild: !0
        }, n.default.createElement("span", {
            role: "button",
            tabIndex: 0,
            "aria-label": o,
            className: "flex items-center content-muted",
            "data-testid": "label-tooltip-trigger"
        }, n.default.createElement(t.Icon, {
            name: "icon-regular-circle-i",
            size: "Small"
        }))))
    }])
}, 750615, e => {
    "use strict";
    e.s(["INPUT_BACKGROUND_BY_VARIANT", 0, {
        Standard: "bg-none",
        Contrast: "bg-shift-200",
        Utility: "bg-none"
    }, "INPUT_STROKE_BY_VARIANT", 0, {
        Standard: "stroke-standard",
        Contrast: "stroke-none",
        Utility: "stroke-none"
    }, "INPUT_VARIANTS", 0, ["Standard", "Contrast", "Utility"]])
}, 561579, e => {
    "use strict";
    var t = e.i(194250),
        r = e.i(416340),
        n = e.i(863605),
        o = e.i(154502),
        l = e.i(945146),
        i = e.i(690569),
        a = e.i(251635),
        s = e.i(787802),
        u = e.i(221628),
        c = e.i(770593),
        d = e.i(121880);

    function f(e) {
        return (0, i.g)("MuiCard", e)
    }
    e.i(407110), (0, s.g)("MuiCard", ["root"]);
    let p = ["className", "raised"],
        m = (0, a.s)(c.M, {
            name: "MuiCard",
            slot: "Root",
            overridesResolver: (e, t) => t.root
        })(() => ({
            overflow: "hidden"
        })),
        v = r.forwardRef(function(e, t) {
            let r = (0, d.u)({
                    props: e,
                    name: "MuiCard"
                }),
                {
                    className: n,
                    raised: o = !1
                } = r,
                s = (0, i._)(r, p),
                c = (0, l._)({}, r, {
                    raised: o
                }),
                v = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, a.a)({
                        root: ["root"]
                    }, f, t)
                })(c);
            return (0, u.jsx)(m, (0, l._)({
                className: (0, a.c)(v.root, n),
                elevation: o ? 8 : void 0,
                ref: t,
                ownerState: c
            }, s))
        });
    var h = (0, n.default)({
            name: "Card"
        })(function(e, r) {
            var n = r.variant;
            return {
                root: (0, t._)({
                    boxShadow: "none",
                    overflow: "hidden",
                    WebkitMaskImage: "-webkit-radial-gradient(white, black)",
                    backgroundColor: "outlined" === n ? "transparent" : e.palette.surface[200],
                    position: "relative"
                }, e.border.radius.large)
            }
        }),
        g = (0, r.forwardRef)(function(e, n) {
            var l = e.children,
                i = e.classes,
                a = e.variant,
                s = e.className,
                u = (0, t.a)(e, ["children", "classes", "variant", "className"]),
                c = h((0, t._)((0, t._)({}, u), {
                    variant: a
                }), {
                    props: {
                        classes: (0, o.default)(i, s)
                    }
                });
            return r.default.createElement(v, (0, t._)({}, u, {
                variant: "outlined" === a ? "outlined" : "elevation",
                classes: c.classes,
                ref: n
            }), l)
        });
    e.s(["C", 0, g])
}, 116873, e => {
    "use strict";
    var t = e.i(561579);
    e.s(["Card", () => t.C])
}, 783536, e => {
    "use strict";
    var t = e.i(307778),
        r = e.i(650295);
    e.s(["u", 0, function(e) {
        let {
            props: n,
            name: o,
            defaultTheme: l,
            themeId: i
        } = e, a = (0, r.u)(l);
        return i && (a = a[i] || a), (0, t.g)({
            theme: a,
            name: o,
            props: n
        })
    }])
}]);

//# debugId=8ed6f078-f61a-424f-1bb9-9acccd0cd6c8
//# sourceMappingURL=1ga498vzru-e5.js.map