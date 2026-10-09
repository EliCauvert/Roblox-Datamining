;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "dda5a953-f277-2209-c1ac-e2a057387c76")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 297452, 992486, e => {
    "use strict";
    let t, n = ["top", "right", "bottom", "left"],
        r = n.reduce((e, t) => e.concat(t, t + "-start", t + "-end"), []),
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

    function h(e, t, n) {
        void 0 === n && (n = !1);
        let r = f(e),
            o = p(v(e)),
            l = m(o),
            i = "x" === o ? r === (n ? "end" : "start") ? "right" : "left" : "start" === r ? "bottom" : "top";
        return t.reference[l] > t.floating[l] && (i = E(i)), [i, E(i)]
    }

    function g(e) {
        return e.includes("start") ? e.replace("start", "end") : e.replace("end", "start")
    }
    let y = ["left", "right"],
        x = ["right", "left"],
        w = ["top", "bottom"],
        b = ["bottom", "top"];

    function E(e) {
        let t = d(e);
        return u[t] + e.slice(t.length)
    }

    function C(e) {
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
            y: n,
            width: r,
            height: o
        } = e;
        return {
            width: r,
            height: o,
            top: n,
            left: t,
            right: t + r,
            bottom: n + o,
            x: t,
            y: n
        }
    }

    function R(e, t, n) {
        let r, {
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
                r = {
                    x: h,
                    y: o.y - l.height
                };
                break;
            case "bottom":
                r = {
                    x: h,
                    y: o.y + o.height
                };
                break;
            case "right":
                r = {
                    x: o.x + o.width,
                    y: g
                };
                break;
            case "left":
                r = {
                    x: o.x - l.width,
                    y: g
                };
                break;
            default:
                r = {
                    x: o.x,
                    y: o.y
                }
        }
        switch (f(t)) {
            case "start":
                r[a] -= y * (n && c ? -1 : 1);
                break;
            case "end":
                r[a] += y * (n && c ? -1 : 1)
        }
        return r
    }
    async function P(e, t) {
        var n;
        void 0 === t && (t = {});
        let {
            x: r,
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
        } = c(t, e), v = C(m), h = a[p ? "floating" === f ? "reference" : "floating" : f], g = S(await l.getClippingRect({
            element: null == (n = await (null == l.isElement ? void 0 : l.isElement(h))) || n ? h : h.contextElement || await (null == l.getDocumentElement ? void 0 : l.getDocumentElement(a.floating)),
            boundary: u,
            rootBoundary: d,
            strategy: s
        })), y = "floating" === f ? {
            x: r,
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
    let T = async (e, t, n) => {
        let {
            placement: r = "bottom",
            strategy: o = "absolute",
            middleware: l = [],
            platform: i
        } = n, a = i.detectOverflow ? i : {
            ...i,
            detectOverflow: P
        }, s = await (null == i.isRTL ? void 0 : i.isRTL(t)), u = await i.getElementRects({
            reference: e,
            floating: t,
            strategy: o
        }), {
            x: c,
            y: d
        } = R(u, r, s), f = r, p = 0, m = {};
        for (let n = 0; n < l.length; n++) {
            let v = l[n];
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
                initialPlacement: r,
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
            } = R(u, f, s)), n = -1)
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

    function L(e) {
        return n.some(t => e[t] >= 0)
    }

    function N(e) {
        let t = o(...e.map(e => e.left)),
            n = o(...e.map(e => e.top));
        return {
            x: t,
            y: n,
            width: l(...e.map(e => e.right)) - t,
            height: l(...e.map(e => e.bottom)) - n
        }
    }
    let j = new Set(["left", "top"]);
    async function O(e, t) {
        let {
            placement: n,
            platform: r,
            elements: o
        } = e, l = await (null == r.isRTL ? void 0 : r.isRTL(o.floating)), i = d(n), a = f(n), s = "y" === v(n), u = j.has(i) ? -1 : 1, p = l && s ? -1 : 1, m = c(t, e), {
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

    function k() {
        return "u" > typeof window
    }

    function D(e) {
        return H(e) ? (e.nodeName || "").toLowerCase() : "#document"
    }

    function M(e) {
        var t;
        return (null == e || null == (t = e.ownerDocument) ? void 0 : t.defaultView) || window
    }

    function I(e) {
        var t;
        return null == (t = (H(e) ? e.ownerDocument : e.document) || window.document) ? void 0 : t.documentElement
    }

    function H(e) {
        return !!k() && (e instanceof Node || e instanceof M(e).Node)
    }

    function F(e) {
        return !!k() && (e instanceof Element || e instanceof M(e).Element)
    }

    function _(e) {
        return !!k() && (e instanceof HTMLElement || e instanceof M(e).HTMLElement)
    }

    function B(e) {
        return !(!k() || "u" < typeof ShadowRoot) && (e instanceof ShadowRoot || e instanceof M(e).ShadowRoot)
    }

    function W(e) {
        let {
            overflow: t,
            overflowX: n,
            overflowY: r,
            display: o
        } = q(e);
        return /auto|scroll|overlay|hidden|clip/.test(t + r + n) && "inline" !== o && "contents" !== o
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
        return /^(html|body|#document)$/.test(D(e))
    }

    function q(e) {
        return M(e).getComputedStyle(e)
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
        if ("html" === D(e)) return e;
        let t = e.assignedSlot || e.parentNode || B(e) && e.host || I(e);
        return B(t) ? t.host : t
    }

    function J(e, t, n) {
        var r;
        void 0 === t && (t = []), void 0 === n && (n = !0);
        let o = function e(t) {
                let n = $(t);
                return G(n) ? t.ownerDocument ? t.ownerDocument.body : t.body : _(n) && W(n) ? n : e(n)
            }(e),
            l = o === (null == (r = e.ownerDocument) ? void 0 : r.body),
            i = M(o);
        if (!l) return t.concat(o, J(o, [], n));
        {
            let e = Q(i);
            return t.concat(i, i.visualViewport || [], W(o) ? o : [], e && n ? J(e) : [])
        }
    }

    function Q(e) {
        return e.parent && Object.getPrototypeOf(e.parent) ? e.frameElement : null
    }

    function ee(e) {
        let t = q(e),
            n = parseFloat(t.width) || 0,
            r = parseFloat(t.height) || 0,
            o = _(e),
            l = o ? e.offsetWidth : n,
            a = o ? e.offsetHeight : r,
            s = i(n) !== l || i(r) !== a;
        return s && (n = l, r = a), {
            width: n,
            height: r,
            $: s
        }
    }

    function et(e) {
        return F(e) ? e : e.contextElement
    }

    function en(e) {
        let t = et(e);
        if (!_(t)) return s(1);
        let n = t.getBoundingClientRect(),
            {
                width: r,
                height: o,
                $: l
            } = ee(t),
            a = (l ? i(n.width) : n.width) / r,
            u = (l ? i(n.height) : n.height) / o;
        return a && Number.isFinite(a) || (a = 1), u && Number.isFinite(u) || (u = 1), {
            x: a,
            y: u
        }
    }
    let er = s(0);

    function eo(e) {
        let t = M(e);
        return Y() && t.visualViewport ? {
            x: t.visualViewport.offsetLeft,
            y: t.visualViewport.offsetTop
        } : er
    }

    function el(e, t, n, r) {
        var o;
        void 0 === t && (t = !1), void 0 === n && (n = !1);
        let l = e.getBoundingClientRect(),
            i = et(e),
            a = s(1);
        t && (r ? F(r) && (a = en(r)) : a = en(e));
        let u = (void 0 === (o = n) && (o = !1), r && (!o || r === M(i)) && o) ? eo(i) : s(0),
            c = (l.left + u.x) / a.x,
            d = (l.top + u.y) / a.y,
            f = l.width / a.x,
            p = l.height / a.y;
        if (i) {
            let e = M(i),
                t = r && F(r) ? M(r) : r,
                n = e,
                o = Q(n);
            for (; o && r && t !== n;) {
                let e = en(o),
                    t = o.getBoundingClientRect(),
                    r = q(o),
                    l = t.left + (o.clientLeft + parseFloat(r.paddingLeft)) * e.x,
                    i = t.top + (o.clientTop + parseFloat(r.paddingTop)) * e.y;
                c *= e.x, d *= e.y, f *= e.x, p *= e.y, c += l, d += i, o = Q(n = M(o))
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
        let n = Z(e).scrollLeft;
        return t ? t.left + n : el(I(e)).left + n
    }

    function ea(e, t) {
        let n = e.getBoundingClientRect();
        return {
            x: n.left + t.scrollLeft - ei(e, n),
            y: n.top + t.scrollTop
        }
    }

    function es(e, t, n) {
        var r;
        let o;
        if ("viewport" === t) o = function(e, t) {
            let n = M(e),
                r = I(e),
                o = n.visualViewport,
                l = r.clientWidth,
                i = r.clientHeight,
                a = 0,
                s = 0;
            if (o) {
                l = o.width, i = o.height;
                let e = Y();
                (!e || e && "fixed" === t) && (a = o.offsetLeft, s = o.offsetTop)
            }
            let u = ei(r);
            if (u <= 0) {
                let e = r.ownerDocument,
                    t = e.body,
                    n = getComputedStyle(t),
                    o = "CSS1Compat" === e.compatMode && parseFloat(n.marginLeft) + parseFloat(n.marginRight) || 0,
                    i = Math.abs(r.clientWidth - t.clientWidth - o);
                i <= 25 && (l -= i)
            } else u <= 25 && (l += u);
            return {
                width: l,
                height: i,
                x: a,
                y: s
            }
        }(e, n);
        else if ("document" === t) {
            let t, n, i, a, s, u, c;
            r = I(e), t = I(r), n = Z(r), i = r.ownerDocument.body, a = l(t.scrollWidth, t.clientWidth, i.scrollWidth, i.clientWidth), s = l(t.scrollHeight, t.clientHeight, i.scrollHeight, i.clientHeight), u = -n.scrollLeft + ei(r), c = -n.scrollTop, "rtl" === q(i).direction && (u += l(t.clientWidth, i.clientWidth) - a), o = {
                width: a,
                height: s,
                x: u,
                y: c
            }
        } else if (F(t)) {
            let e, r, l, i, a, u;
            r = (e = el(t, !0, "fixed" === n)).top + t.clientTop, l = e.left + t.clientLeft, i = _(t) ? en(t) : s(1), a = t.clientWidth * i.x, u = t.clientHeight * i.y, o = {
                width: a,
                height: u,
                x: l * i.x,
                y: r * i.y
            }
        } else {
            let n = eo(e);
            o = {
                x: t.x - n.x,
                y: t.y - n.y,
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
        let n = e.offsetParent;
        return I(e) === n && (n = n.ownerDocument.body), n
    }

    function ed(e, t) {
        var n;
        let r = M(e);
        if (z(e)) return r;
        if (!_(e)) {
            let t = $(e);
            for (; t && !G(t);) {
                if (F(t) && !eu(t)) return t;
                t = $(t)
            }
            return r
        }
        let o = ec(e, t);
        for (; o && (n = o, /^(table|td|th)$/.test(D(n))) && eu(o);) o = ec(o, t);
        return o && G(o) && eu(o) && !X(o) ? r : o || function(e) {
            let t = $(e);
            for (; _(t) && !G(t);) {
                if (X(t)) return t;
                if (z(t)) break;
                t = $(t)
            }
            return null
        }(e) || r
    }
    let ef = async function(e) {
        let t = this.getOffsetParent || ed,
            n = this.getDimensions,
            r = await n(e.floating);
        return {
            reference: function(e, t, n) {
                let r = _(t),
                    o = I(t),
                    l = "fixed" === n,
                    i = el(e, !0, l, t),
                    a = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    u = s(0);
                if (r || !r && !l)
                    if (("body" !== D(t) || W(o)) && (a = Z(t)), r) {
                        let e = el(t, !0, l, t);
                        u.x = e.x + t.clientLeft, u.y = e.y + t.clientTop
                    } else o && (u.x = ei(o));
                l && !r && o && (u.x = ei(o));
                let c = !o || r || l ? s(0) : ea(o, a);
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
                strategy: o
            } = e, l = "fixed" === o, i = I(r), a = !!t && z(t.floating);
            if (r === i || a && l) return n;
            let u = {
                    scrollLeft: 0,
                    scrollTop: 0
                },
                c = s(1),
                d = s(0),
                f = _(r);
            if ((f || !f && !l) && (("body" !== D(r) || W(i)) && (u = Z(r)), f)) {
                let e = el(r);
                c = en(r), d.x = e.x + r.clientLeft, d.y = e.y + r.clientTop
            }
            let p = !i || f || l ? s(0) : ea(i, u);
            return {
                width: n.width * c.x,
                height: n.height * c.y,
                x: n.x * c.x - u.scrollLeft * c.x + d.x + p.x,
                y: n.y * c.y - u.scrollTop * c.y + d.y + p.y
            }
        },
        getDocumentElement: I,
        getClippingRect: function(e) {
            let {
                element: t,
                boundary: n,
                rootBoundary: r,
                strategy: i
            } = e, a = [..."clippingAncestors" === n ? z(t) ? [] : function(e, t) {
                let n = t.get(e);
                if (n) return n;
                let r = J(e, [], !1).filter(e => F(e) && "body" !== D(e)),
                    o = null,
                    l = "fixed" === q(e).position,
                    i = l ? $(e) : e;
                for (; F(i) && !G(i);) {
                    let t = q(i),
                        n = X(i);
                    n || "fixed" !== t.position || (o = null), (l ? n || o : !(!n && "static" === t.position && o && ("absolute" === o.position || "fixed" === o.position) || W(i) && !n && function e(t, n) {
                        let r = $(t);
                        return !(r === n || !F(r) || G(r)) && ("fixed" === q(r).position || e(r, n))
                    }(e, i))) ? o = t : r = r.filter(e => e !== i), i = $(i)
                }
                return t.set(e, r), r
            }(t, this._c) : [].concat(n), r], s = es(t, a[0], i), u = s.top, c = s.right, d = s.bottom, f = s.left;
            for (let e = 1; e < a.length; e++) {
                let n = es(t, a[e], i);
                u = l(n.top, u), c = o(n.right, c), d = o(n.bottom, d), f = l(n.left, f)
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
                    var n, r;
                    let {
                        x: o,
                        y: l,
                        placement: i,
                        middlewareData: a
                    } = t, s = await O(t, e);
                    return i === (null == (n = a.offset) ? void 0 : n.placement) && null != (r = a.arrow) && r.alignmentOffset ? {} : {
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
                        x: n,
                        y: r,
                        placement: i,
                        platform: a
                    } = t, {
                        mainAxis: s = !0,
                        crossAxis: u = !1,
                        limiter: f = {
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
                        ...m
                    } = c(e, t), h = {
                        x: n,
                        y: r
                    }, g = await a.detectOverflow(t, m), y = v(d(i)), x = p(y), w = h[x], b = h[y];
                    if (s) {
                        let e = "y" === x ? "top" : "left",
                            t = "y" === x ? "bottom" : "right",
                            n = w + g[e],
                            r = w - g[t];
                        w = l(n, o(w, r))
                    }
                    if (u) {
                        let e = "y" === y ? "top" : "left",
                            t = "y" === y ? "bottom" : "right",
                            n = b + g[e],
                            r = b - g[t];
                        b = l(n, o(b, r))
                    }
                    let E = f.fn({
                        ...t,
                        [x]: w,
                        [y]: b
                    });
                    return {
                        ...E,
                        data: {
                            x: E.x - n,
                            y: E.y - r,
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
                    var n, r, o, l, i;
                    let a, s, u, {
                            placement: p,
                            middlewareData: m,
                            rects: C,
                            initialPlacement: S,
                            platform: R,
                            elements: P
                        } = t,
                        {
                            mainAxis: T = !0,
                            crossAxis: A = !0,
                            fallbackPlacements: L,
                            fallbackStrategy: N = "bestFit",
                            fallbackAxisSideDirection: j = "none",
                            flipAlignment: O = !0,
                            ...k
                        } = c(e, t);
                    if (null != (n = m.arrow) && n.alignmentOffset) return {};
                    let D = d(p),
                        M = v(S),
                        I = d(S) === S,
                        H = await (null == R.isRTL ? void 0 : R.isRTL(P.floating)),
                        F = L || (I || !O ? [E(S)] : (a = E(S), [g(S), a, g(a)])),
                        _ = "none" !== j;
                    !L && _ && F.push(...(s = f(S), u = function(e, t, n) {
                        switch (e) {
                            case "top":
                            case "bottom":
                                if (n) return t ? x : y;
                                return t ? y : x;
                            case "left":
                            case "right":
                                return t ? w : b;
                            default:
                                return []
                        }
                    }(d(S), "start" === j, H), s && (u = u.map(e => e + "-" + s), O && (u = u.concat(u.map(g)))), u));
                    let B = [S, ...F],
                        W = await R.detectOverflow(t, k),
                        z = [],
                        V = (null == (r = m.flip) ? void 0 : r.overflows) || [];
                    if (T && z.push(W[D]), A) {
                        let e = h(p, C, H);
                        z.push(W[e[0]], W[e[1]])
                    }
                    if (V = [...V, {
                            placement: p,
                            overflows: z
                        }], !z.every(e => e <= 0)) {
                        let e = ((null == (o = m.flip) ? void 0 : o.index) || 0) + 1,
                            t = B[e];
                        if (t && ("alignment" !== A || M === v(t) || V.every(e => v(e.placement) !== M || e.overflows[0] > 0))) return {
                            data: {
                                index: e,
                                overflows: V
                            },
                            reset: {
                                placement: t
                            }
                        };
                        let n = null == (l = V.filter(e => e.overflows[0] <= 0).sort((e, t) => e.overflows[1] - t.overflows[1])[0]) ? void 0 : l.placement;
                        if (!n) switch (N) {
                            case "bestFit": {
                                let e = null == (i = V.filter(e => {
                                    if (_) {
                                        let t = v(e.placement);
                                        return t === M || "y" === t
                                    }
                                    return !0
                                }).map(e => [e.placement, e.overflows.filter(e => e > 0).reduce((e, t) => e + t, 0)]).sort((e, t) => e[1] - t[1])[0]) ? void 0 : i[0];
                                e && (n = e);
                                break
                            }
                            case "initialPlacement":
                                n = S
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
                            width: E,
                            height: C
                        } = u.floating;
                    "top" === x || "bottom" === x ? (i = x, a = w === (await (null == p.isRTL ? void 0 : p.isRTL(m.floating)) ? "start" : "end") ? "left" : "right") : (a = x, i = "end" === w ? "top" : "bottom");
                    let S = C - y.top - y.bottom,
                        R = E - y.left - y.right,
                        P = o(C - y[i], S),
                        T = o(E - y[a], R),
                        A = !t.middlewareData.shift,
                        L = P,
                        N = T;
                    if (null != (n = t.middlewareData.shift) && n.enabled.x && (N = R), null != (r = t.middlewareData.shift) && r.enabled.y && (L = S), A && !w) {
                        let e = l(y.left, 0),
                            t = l(y.right, 0),
                            n = l(y.top, 0),
                            r = l(y.bottom, 0);
                        b ? N = E - 2 * (0 !== e || 0 !== t ? e + t : l(y.left, y.right)) : L = C - 2 * (0 !== n || 0 !== r ? n + r : l(y.top, y.bottom))
                    }
                    await h({
                        ...t,
                        availableWidth: N,
                        availableHeight: L
                    });
                    let j = await p.getDimensions(m.floating);
                    return E !== j.width || C !== j.height ? {
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
                        rects: n,
                        platform: r
                    } = t, {
                        strategy: o = "referenceHidden",
                        ...l
                    } = c(e, t);
                    switch (o) {
                        case "referenceHidden": {
                            let e = A(await r.detectOverflow(t, {
                                ...l,
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
                            let e = A(await r.detectOverflow(t, {
                                ...l,
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
        ew = e => ({
            name: "arrow",
            options: e,
            async fn(t) {
                let {
                    x: n,
                    y: r,
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
                let y = C(g),
                    x = {
                        x: n,
                        y: r
                    },
                    w = p(v(i)),
                    b = m(w),
                    E = await s.getDimensions(h),
                    S = "y" === w,
                    R = S ? "clientHeight" : "clientWidth",
                    P = a.reference[b] + a.reference[w] - x[w] - a.floating[b],
                    T = x[w] - a.reference[w],
                    A = await (null == s.getOffsetParent ? void 0 : s.getOffsetParent(h)),
                    L = A ? A[R] : 0;
                L && await (null == s.isElement ? void 0 : s.isElement(A)) || (L = u.floating[R] || a.floating[b]);
                let N = L / 2 - E[b] / 2 - 1,
                    j = o(y[S ? "top" : "left"], N),
                    O = o(y[S ? "bottom" : "right"], N),
                    k = L - E[b] - O,
                    D = L / 2 - E[b] / 2 + (P / 2 - T / 2),
                    M = l(j, o(D, k)),
                    I = !d.arrow && null != f(i) && D !== M && a.reference[b] / 2 - (D < j ? j : O) - E[b] / 2 < 0,
                    H = I ? D < j ? D - j : D - k : 0;
                return {
                    [w]: x[w] + H,
                    data: {
                        [w]: M,
                        centerOffset: D - M - H,
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
                        x: n,
                        y: r,
                        placement: o,
                        rects: l,
                        middlewareData: i
                    } = t, {
                        offset: a = 0,
                        mainAxis: s = !0,
                        crossAxis: u = !0
                    } = c(e, t), f = {
                        x: n,
                        y: r
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
                            n = l.reference[h] + l.reference[e] - w.mainAxis;
                        g < t ? g = t : g > n && (g = n)
                    }
                    if (u) {
                        var b, E;
                        let e = "y" === h ? "width" : "height",
                            t = j.has(d(o)),
                            n = l.reference[m] - l.floating[e] + (t && (null == (b = i.offset) ? void 0 : b[m]) || 0) + (t ? 0 : w.crossAxis),
                            r = l.reference[m] + l.reference[e] + (t ? 0 : (null == (E = i.offset) ? void 0 : E[m]) || 0) - (t ? w.crossAxis : 0);
                        y < n ? y = n : y > r && (y = r)
                    }
                    return {
                        [h]: g,
                        [m]: y
                    }
                }
            }
        },
        eE = (e, t, n) => {
            let r = new Map,
                o = {
                    platform: ep,
                    ...n
                },
                l = {
                    ...o.platform,
                    _c: r
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
                var n, o, l, i;
                let {
                    rects: a,
                    middlewareData: s,
                    placement: u,
                    platform: p,
                    elements: m
                } = t, {
                    crossAxis: v = !1,
                    alignment: y,
                    allowedPlacements: x = r,
                    autoAlignment: w = !0,
                    ...b
                } = c(e, t), E = void 0 !== y || x === r ? ((i = y || null) ? [...x.filter(e => f(e) === i), ...x.filter(e => f(e) !== i)] : x.filter(e => d(e) === e)).filter(e => !i || f(e) === i || !!w && g(e) !== e) : x, C = await p.detectOverflow(t, b), S = (null == (n = s.autoPlacement) ? void 0 : n.index) || 0, R = E[S];
                if (null == R) return {};
                let P = h(R, a, await (null == p.isRTL ? void 0 : p.isRTL(m.floating)));
                if (u !== R) return {
                    reset: {
                        placement: E[0]
                    }
                };
                let T = [C[d(R)], C[P[0]], C[P[1]]],
                    A = [...(null == (o = s.autoPlacement) ? void 0 : o.overflows) || [], {
                        placement: R,
                        overflows: T
                    }],
                    L = E[S + 1];
                if (L) return {
                    data: {
                        index: S + 1,
                        overflows: A
                    },
                    reset: {
                        placement: L
                    }
                };
                let N = A.map(e => {
                        let t = f(e.placement);
                        return [e.placement, t && v ? e.overflows.slice(0, 2).reduce((e, t) => e + t, 0) : e.overflows[0], e.overflows]
                    }).sort((e, t) => e[1] - t[1]),
                    j = (null == (l = N.filter(e => e[2].slice(0, f(e[0]) ? 2 : 3).every(e => e <= 0))[0]) ? void 0 : l[0]) || N[0][0];
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
    }, "autoUpdate", 0, function(e, t, n, r) {
        let i;
        void 0 === r && (r = {});
        let {
            ancestorScroll: s = !0,
            ancestorResize: u = !0,
            elementResize: c = "function" == typeof ResizeObserver,
            layoutShift: d = "function" == typeof IntersectionObserver,
            animationFrame: f = !1
        } = r, p = et(e), m = s || u ? [...p ? J(p) : [], ...t ? J(t) : []] : [];
        m.forEach(e => {
            s && e.addEventListener("scroll", n, {
                passive: !0
            }), u && e.addEventListener("resize", n)
        });
        let v = p && d ? function(e, t) {
                let n, r = null,
                    i = I(e);

                function s() {
                    var e;
                    clearTimeout(n), null == (e = r) || e.disconnect(), r = null
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
                        let r = t[0].intersectionRatio;
                        if (r !== d) {
                            if (!y) return u();
                            r ? u(!1, r) : n = setTimeout(() => {
                                u(!1, 1e-7)
                            }, 1e3)
                        }
                        1 !== r || em(f, e.getBoundingClientRect()) || u(), y = !1
                    }
                    try {
                        r = new IntersectionObserver(x, {
                            ...g,
                            root: i.ownerDocument
                        })
                    } catch (e) {
                        r = new IntersectionObserver(x, g)
                    }
                    r.observe(e)
                }(!0), s
            }(p, n) : null,
            h = -1,
            g = null;
        c && (g = new ResizeObserver(e => {
            let [r] = e;
            r && r.target === p && g && t && (g.unobserve(t), cancelAnimationFrame(h), h = requestAnimationFrame(() => {
                var e;
                null == (e = g) || e.observe(t)
            })), n()
        }), p && !f && g.observe(p), t && g.observe(t));
        let y = f ? el(e) : null;
        return f && function t() {
            let r = el(e);
            y && !em(y, r) && n(), y = r, i = requestAnimationFrame(t)
        }(), n(), () => {
            var e;
            m.forEach(e => {
                s && e.removeEventListener("scroll", n), u && e.removeEventListener("resize", n)
            }), null == v || v(), null == (e = g) || e.disconnect(), g = null, f && cancelAnimationFrame(i)
        }
    }, "computePosition", 0, eE, "flip", 0, eg, "hide", 0, ex, "inline", 0, function(e) {
        return void 0 === e && (e = {}), {
            name: "inline",
            options: e,
            async fn(t) {
                let {
                    placement: n,
                    elements: r,
                    rects: i,
                    platform: a,
                    strategy: s
                } = t, {
                    padding: u = 2,
                    x: f,
                    y: p
                } = c(e, t), m = Array.from(await (null == a.getClientRects ? void 0 : a.getClientRects(r.reference)) || []), h = function(e) {
                    let t = e.slice().sort((e, t) => e.y - t.y),
                        n = [],
                        r = null;
                    for (let e = 0; e < t.length; e++) {
                        let o = t[e];
                        !r || o.y - r.y > r.height / 2 ? n.push([o]) : n[n.length - 1].push(o), r = o
                    }
                    return n.map(e => S(N(e)))
                }(m), g = S(N(m)), y = C(u), x = await a.getElementRects({
                    reference: {
                        getBoundingClientRect: function() {
                            if (2 === h.length && h[0].left > h[1].right && null != f && null != p) return h.find(e => f > e.left - y.left && f < e.right + y.right && p > e.top - y.top && p < e.bottom + y.bottom) || g;
                            if (h.length >= 2) {
                                if ("y" === v(n)) {
                                    let e = h[0],
                                        t = h[h.length - 1],
                                        r = "top" === d(n),
                                        o = e.top,
                                        l = t.bottom,
                                        i = r ? e.left : t.left,
                                        a = r ? e.right : t.right;
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
                                let e = "left" === d(n),
                                    t = l(...h.map(e => e.right)),
                                    r = o(...h.map(e => e.left)),
                                    i = h.filter(n => e ? n.left === r : n.right === t),
                                    a = i[0].top,
                                    s = i[i.length - 1].bottom;
                                return {
                                    top: a,
                                    bottom: s,
                                    left: r,
                                    right: t,
                                    width: t - r,
                                    height: s - a,
                                    x: r,
                                    y: a
                                }
                            }
                            return g
                        }
                    },
                    floating: r.floating,
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
    var eC = e.i(416340),
        eS = e.i(149285),
        eR = "u" > typeof document ? eC.useLayoutEffect : function() {};

    function eP(e, t) {
        let n, r, o;
        if (e === t) return !0;
        if (typeof e != typeof t) return !1;
        if ("function" == typeof e && e.toString() === t.toString()) return !0;
        if (e && t && "object" == typeof e) {
            if (Array.isArray(e)) {
                if ((n = e.length) !== t.length) return !1;
                for (r = n; 0 != r--;)
                    if (!eP(e[r], t[r])) return !1;
                return !0
            }
            if ((n = (o = Object.keys(e)).length) !== Object.keys(t).length) return !1;
            for (r = n; 0 != r--;)
                if (!({}).hasOwnProperty.call(t, o[r])) return !1;
            for (r = n; 0 != r--;) {
                let n = o[r];
                if (("_owner" !== n || !e.$$typeof) && !eP(e[n], t[n])) return !1
            }
            return !0
        }
        return e != e && t != t
    }

    function eT(e) {
        return "u" < typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
    }

    function eA(e, t) {
        let n = eT(e);
        return Math.round(t * n) / n
    }

    function eL(e) {
        let t = eC.useRef(e);
        return eR(() => {
            t.current = e
        }), t
    }
    e.s(["arrow", 0, (e, t) => {
        let n = {
            name: "arrow",
            options: e,
            fn(t) {
                let {
                    element: n,
                    padding: r
                } = "function" == typeof e ? e(t) : e;
                return n && ({}).hasOwnProperty.call(n, "current") ? null != n.current ? ew({
                    element: n.current,
                    padding: r
                }).fn(t) : {} : n ? ew({
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
    }, "flip", 0, (e, t) => {
        let n = eg(e);
        return {
            name: n.name,
            fn: n.fn,
            options: [e, t]
        }
    }, "hide", 0, (e, t) => {
        let n = ex(e);
        return {
            name: n.name,
            fn: n.fn,
            options: [e, t]
        }
    }, "limitShift", 0, (e, t) => ({
        fn: eb(e).fn,
        options: [e, t]
    }), "offset", 0, (e, t) => {
        let n = ev(e);
        return {
            name: n.name,
            fn: n.fn,
            options: [e, t]
        }
    }, "shift", 0, (e, t) => {
        let n = eh(e);
        return {
            name: n.name,
            fn: n.fn,
            options: [e, t]
        }
    }, "size", 0, (e, t) => {
        let n = ey(e);
        return {
            name: n.name,
            fn: n.fn,
            options: [e, t]
        }
    }, "useFloating", 0, function(e) {
        void 0 === e && (e = {});
        let {
            placement: t = "bottom",
            strategy: n = "absolute",
            middleware: r = [],
            platform: o,
            elements: {
                reference: l,
                floating: i
            } = {},
            transform: a = !0,
            whileElementsMounted: s,
            open: u
        } = e, [c, d] = eC.useState({
            x: 0,
            y: 0,
            strategy: n,
            placement: t,
            middlewareData: {},
            isPositioned: !1
        }), [f, p] = eC.useState(r);
        eP(f, r) || p(r);
        let [m, v] = eC.useState(null), [h, g] = eC.useState(null), y = eC.useCallback(e => {
            e !== E.current && (E.current = e, v(e))
        }, []), x = eC.useCallback(e => {
            e !== C.current && (C.current = e, g(e))
        }, []), w = l || m, b = i || h, E = eC.useRef(null), C = eC.useRef(null), S = eC.useRef(c), R = null != s, P = eL(s), T = eL(o), A = eL(u), L = eC.useCallback(() => {
            if (!E.current || !C.current) return;
            let e = {
                placement: t,
                strategy: n,
                middleware: f
            };
            T.current && (e.platform = T.current), eE(E.current, C.current, e).then(e => {
                let t = {
                    ...e,
                    isPositioned: !1 !== A.current
                };
                N.current && !eP(S.current, t) && (S.current = t, eS.flushSync(() => {
                    d(t)
                }))
            })
        }, [f, t, n, T, A]);
        eR(() => {
            !1 === u && S.current.isPositioned && (S.current.isPositioned = !1, d(e => ({
                ...e,
                isPositioned: !1
            })))
        }, [u]);
        let N = eC.useRef(!1);
        eR(() => (N.current = !0, () => {
            N.current = !1
        }), []), eR(() => {
            if (w && (E.current = w), b && (C.current = b), w && b) {
                if (P.current) return P.current(w, b, L);
                L()
            }
        }, [w, b, L, P, R]);
        let j = eC.useMemo(() => ({
                reference: E,
                floating: C,
                setReference: y,
                setFloating: x
            }), [y, x]),
            O = eC.useMemo(() => ({
                reference: w,
                floating: b
            }), [w, b]),
            k = eC.useMemo(() => {
                let e = {
                    position: n,
                    left: 0,
                    top: 0
                };
                if (!O.floating) return e;
                let t = eA(O.floating, c.x),
                    r = eA(O.floating, c.y);
                return a ? {
                    ...e,
                    transform: "translate(" + t + "px, " + r + "px)",
                    ...eT(O.floating) >= 1.5 && {
                        willChange: "transform"
                    }
                } : {
                    position: n,
                    left: t,
                    top: r
                }
            }, [n, a, O.floating, c.x, c.y]);
        return eC.useMemo(() => ({
            ...c,
            update: L,
            refs: j,
            elements: O,
            floatingStyles: k
        }), [c, L, j, O, k])
    }], 297452)
}, 305607, e => {
    "use strict";
    e.s(["clamp", 0, function(e, t) {
        let [n, r] = t;
        return Math.min(r, Math.max(n, e))
    }])
}, 174617, e => {
    "use strict";
    "u" > typeof window && window.document && window.document.createElement, e.s(["composeEventHandlers", 0, function(e, t) {
        let {
            checkForDefaultPrevented: n = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(r) {
            if (null == e || e(r), !1 === n || !r.defaultPrevented) return null == t ? void 0 : t(r)
        }
    }])
}, 742187, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(594278),
        r = e.i(221628),
        o = t.forwardRef((e, t) => {
            let {
                children: o,
                width: l = 10,
                height: i = 5,
                ...a
            } = e;
            return (0, r.jsx)(n.Primitive.svg, {
                ...a,
                ref: t,
                width: l,
                height: i,
                viewBox: "0 0 30 10",
                preserveAspectRatio: "none",
                children: e.asChild ? o : (0, r.jsx)("polygon", {
                    points: "0,0 30,0 15,10"
                })
            })
        });
    o.displayName = "Arrow", e.s(["Root", 0, o])
}, 539206, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(608652),
        r = e.i(78892),
        o = e.i(699704),
        l = e.i(221628);
    e.s(["createCollection", 0, function(e) {
        let i = e + "CollectionProvider",
            [a, s] = (0, n.createContextScope)(i),
            [u, c] = a(i, {
                collectionRef: {
                    current: null
                },
                itemMap: new Map
            }),
            d = e => {
                let {
                    scope: n,
                    children: r
                } = e, o = t.default.useRef(null), i = t.default.useRef(new Map).current;
                return (0, l.jsx)(u, {
                    scope: n,
                    itemMap: i,
                    collectionRef: o,
                    children: r
                })
            };
        d.displayName = i;
        let f = e + "CollectionSlot",
            p = (0, o.createSlot)(f),
            m = t.default.forwardRef((e, t) => {
                let {
                    scope: n,
                    children: o
                } = e, i = c(f, n), a = (0, r.useComposedRefs)(t, i.collectionRef);
                return (0, l.jsx)(p, {
                    ref: a,
                    children: o
                })
            });
        m.displayName = f;
        let v = e + "CollectionItemSlot",
            h = "data-radix-collection-item",
            g = (0, o.createSlot)(v),
            y = t.default.forwardRef((e, n) => {
                let {
                    scope: o,
                    children: i,
                    ...a
                } = e, s = t.default.useRef(null), u = (0, r.useComposedRefs)(n, s), d = c(v, o);
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
        }, function(n) {
            let r = c(e + "CollectionConsumer", n);
            return t.default.useCallback(() => {
                let e = r.collectionRef.current;
                if (!e) return [];
                let t = Array.from(e.querySelectorAll("[".concat(h, "]")));
                return Array.from(r.itemMap.values()).sort((e, n) => t.indexOf(e.ref.current) - t.indexOf(n.ref.current))
            }, [r.collectionRef, r.itemMap])
        }, s]
    }])
}, 508785, e => {
    "use strict";
    e.i(711300), e.i(634203), e.i(35877);
    var t = e.i(416340),
        n = e.i(608652),
        r = e.i(78892),
        o = e.i(76992),
        l = e.i(221628);
    e.s(["createCollection", 0, function(e) {
        let i = e + "CollectionProvider",
            [a, s] = (0, n.createContextScope)(i),
            [u, c] = a(i, {
                collectionRef: {
                    current: null
                },
                itemMap: new Map
            }),
            d = e => {
                let {
                    scope: n,
                    children: r
                } = e, o = t.default.useRef(null), i = t.default.useRef(new Map).current;
                return (0, l.jsx)(u, {
                    scope: n,
                    itemMap: i,
                    collectionRef: o,
                    children: r
                })
            };
        d.displayName = i;
        let f = e + "CollectionSlot",
            p = (0, o.createSlot)(f),
            m = t.default.forwardRef((e, t) => {
                let {
                    scope: n,
                    children: o
                } = e, i = c(f, n), a = (0, r.useComposedRefs)(t, i.collectionRef);
                return (0, l.jsx)(p, {
                    ref: a,
                    children: o
                })
            });
        m.displayName = f;
        let v = e + "CollectionItemSlot",
            h = "data-radix-collection-item",
            g = (0, o.createSlot)(v),
            y = t.default.forwardRef((e, n) => {
                let {
                    scope: o,
                    children: i,
                    ...a
                } = e, s = t.default.useRef(null), u = (0, r.useComposedRefs)(n, s), d = c(v, o);
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
        }, function(n) {
            let r = c(e + "CollectionConsumer", n);
            return t.default.useCallback(() => {
                let e = r.collectionRef.current;
                if (!e) return [];
                let t = Array.from(e.querySelectorAll("[".concat(h, "]")));
                return Array.from(r.itemMap.values()).sort((e, n) => t.indexOf(e.ref.current) - t.indexOf(n.ref.current))
            }, [r.collectionRef, r.itemMap])
        }, s]
    }])
}, 974539, e => {
    "use strict";
    var t = e.i(416340);
    e.i(221628);
    var n = t.createContext(void 0);
    e.s(["useDirection", 0, function(e) {
        let r = t.useContext(n);
        return e || r || "ltr"
    }])
}, 524887, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(297452),
        r = e.i(992486),
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
                __scopePopper: n,
                children: r
            } = e, [o, l] = t.useState(null);
            return (0, d.jsx)(v, {
                scope: n,
                anchor: o,
                onAnchorChange: l,
                children: r
            })
        };
    g.displayName = f;
    var y = "PopperAnchor",
        x = t.forwardRef((e, n) => {
            let {
                __scopePopper: r,
                virtualRef: o,
                ...i
            } = e, s = h(y, r), u = t.useRef(null), c = (0, l.useComposedRefs)(n, u);
            return t.useEffect(() => {
                s.onAnchorChange((null == o ? void 0 : o.current) || u.current)
            }), o ? null : (0, d.jsx)(a.Primitive.div, {
                ...i,
                ref: c
            })
        });
    x.displayName = y;
    var w = "PopperContent",
        [b, E] = p(w),
        C = t.forwardRef((e, o) => {
            var i, f, p, m, v, g, y, x;
            let {
                __scopePopper: E,
                side: C = "bottom",
                sideOffset: S = 0,
                align: R = "center",
                alignOffset: P = 0,
                arrowPadding: N = 0,
                avoidCollisions: j = !0,
                collisionBoundary: O = [],
                collisionPadding: k = 0,
                sticky: D = "partial",
                hideWhenDetached: M = !1,
                updatePositionStrategy: I = "optimized",
                onPlaced: H,
                ...F
            } = e, _ = h(w, E), [B, W] = t.useState(null), z = (0, l.useComposedRefs)(o, e => W(e)), [V, U] = t.useState(null), K = (0, c.useSize)(V), X = null != (i = null == K ? void 0 : K.width) ? i : 0, Y = null != (f = null == K ? void 0 : K.height) ? f : 0, G = "number" == typeof k ? k : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...k
            }, q = Array.isArray(O) ? O : [O], Z = q.length > 0, $ = {
                padding: G,
                boundary: q.filter(T),
                altBoundary: Z
            }, {
                refs: J,
                floatingStyles: Q,
                placement: ee,
                isPositioned: et,
                middlewareData: en
            } = (0, n.useFloating)({
                strategy: "fixed",
                placement: C + ("center" !== R ? "-" + R : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return (0, r.autoUpdate)(...t, {
                        animationFrame: "always" === I
                    })
                },
                elements: {
                    reference: _.anchor
                },
                middleware: [(0, n.offset)({
                    mainAxis: S + Y,
                    alignmentAxis: P
                }), j && (0, n.shift)({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === D ? (0, n.limitShift)() : void 0,
                    ...$
                }), j && (0, n.flip)({
                    ...$
                }), (0, n.size)({
                    ...$,
                    apply: e => {
                        let {
                            elements: t,
                            rects: n,
                            availableWidth: r,
                            availableHeight: o
                        } = e, {
                            width: l,
                            height: i
                        } = n.reference, a = t.floating.style;
                        a.setProperty("--radix-popper-available-width", "".concat(r, "px")), a.setProperty("--radix-popper-available-height", "".concat(o, "px")), a.setProperty("--radix-popper-anchor-width", "".concat(l, "px")), a.setProperty("--radix-popper-anchor-height", "".concat(i, "px"))
                    }
                }), V && (0, n.arrow)({
                    element: V,
                    padding: N
                }), A({
                    arrowWidth: X,
                    arrowHeight: Y
                }), M && (0, n.hide)({
                    strategy: "referenceHidden",
                    ...$
                })]
            }), [er, eo] = L(ee), el = (0, s.useCallbackRef)(H);
            (0, u.useLayoutEffect)(() => {
                et && (null == el || el())
            }, [et, el]);
            let ei = null == (p = en.arrow) ? void 0 : p.x,
                ea = null == (m = en.arrow) ? void 0 : m.y,
                es = (null == (v = en.arrow) ? void 0 : v.centerOffset) !== 0,
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
                    "--radix-popper-transform-origin": [null == (g = en.transformOrigin) ? void 0 : g.x, null == (y = en.transformOrigin) ? void 0 : y.y].join(" "),
                    ...(null == (x = en.hide) ? void 0 : x.referenceHidden) && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, d.jsx)(b, {
                    scope: E,
                    placedSide: er,
                    onArrowChange: U,
                    arrowX: ei,
                    arrowY: ea,
                    shouldHideArrow: es,
                    children: (0, d.jsx)(a.Primitive.div, {
                        "data-side": er,
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
    C.displayName = w;
    var S = "PopperArrow",
        R = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        P = t.forwardRef(function(e, t) {
            let {
                __scopePopper: n,
                ...r
            } = e, l = E(S, n), i = R[l.placedSide];
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
                    ...r,
                    ref: t,
                    style: {
                        ...r.style,
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
            var n, r, o, l, i;
            let {
                placement: a,
                rects: s,
                middlewareData: u
            } = t, c = (null == (o = u.arrow) ? void 0 : o.centerOffset) !== 0, d = c ? 0 : e.arrowWidth, f = c ? 0 : e.arrowHeight, [p, m] = L(a), v = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [m], h = (null != (n = null == (l = u.arrow) ? void 0 : l.x) ? n : 0) + d / 2, g = (null != (r = null == (i = u.arrow) ? void 0 : i.y) ? r : 0) + f / 2, y = "", x = "";
            return "bottom" === p ? (y = c ? v : "".concat(h, "px"), x = "".concat(-f, "px")) : "top" === p ? (y = c ? v : "".concat(h, "px"), x = "".concat(s.floating.height + f, "px")) : "right" === p ? (y = "".concat(-f, "px"), x = c ? v : "".concat(g, "px")) : "left" === p && (y = "".concat(s.floating.width + f, "px"), x = c ? v : "".concat(g, "px")), {
                data: {
                    x: y,
                    y: x
                }
            }
        }
    });

    function L(e) {
        let [t, n = "center"] = e.split("-");
        return [t, n]
    }
    e.s(["Anchor", 0, x, "Arrow", 0, P, "Content", 0, C, "Root", 0, g, "createPopperScope", 0, m])
}, 600317, e => {
    "use strict";
    var t = e.i(416340);
    e.i(149285);
    var n = e.i(76992),
        r = e.i(221628),
        o = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce((e, o) => {
            let l = (0, n.createSlot)("Primitive.".concat(o)),
                i = t.forwardRef((e, t) => {
                    let {
                        asChild: n,
                        ...i
                    } = e;
                    return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, r.jsx)(n ? l : o, {
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
        n = e.i(174617),
        r = e.i(508785),
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
        [v, h, g] = (0, r.createCollection)(m),
        [y, x] = (0, l.createContextScope)(m, [g]),
        [w, b] = y(m),
        E = t.forwardRef((e, t) => (0, d.jsx)(v.Provider, {
            scope: e.__scopeRovingFocusGroup,
            children: (0, d.jsx)(v.Slot, {
                scope: e.__scopeRovingFocusGroup,
                children: (0, d.jsx)(C, {
                    ...e,
                    ref: t
                })
            })
        }));
    E.displayName = m;
    var C = t.forwardRef((e, r) => {
            let {
                __scopeRovingFocusGroup: l,
                orientation: i,
                loop: v = !1,
                dir: g,
                currentTabStopId: y,
                defaultCurrentTabStopId: x,
                onCurrentTabStopIdChange: b,
                onEntryFocus: E,
                preventScrollOnEntryFocus: C = !1,
                ...S
            } = e, R = t.useRef(null), P = (0, o.useComposedRefs)(r, R), A = (0, c.useDirection)(g), [L, N] = (0, u.useControllableState)({
                prop: y,
                defaultProp: null != x ? x : null,
                onChange: b,
                caller: m
            }), [j, O] = t.useState(!1), k = (0, s.useCallbackRef)(E), D = h(l), M = t.useRef(!1), [I, H] = t.useState(0);
            return t.useEffect(() => {
                let e = R.current;
                if (e) return e.addEventListener(f, k), () => e.removeEventListener(f, k)
            }, [k]), (0, d.jsx)(w, {
                scope: l,
                orientation: i,
                dir: A,
                loop: v,
                currentTabStopId: L,
                onItemFocus: t.useCallback(e => N(e), [N]),
                onItemShiftTab: t.useCallback(() => O(!0), []),
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
                    onMouseDown: (0, n.composeEventHandlers)(e.onMouseDown, () => {
                        M.current = !0
                    }),
                    onFocus: (0, n.composeEventHandlers)(e.onFocus, e => {
                        let t = !M.current;
                        if (e.target === e.currentTarget && t && !j) {
                            let t = new CustomEvent(f, p);
                            if (e.currentTarget.dispatchEvent(t), !t.defaultPrevented) {
                                let e = D().filter(e => e.focusable);
                                T([e.find(e => e.active), e.find(e => e.id === L), ...e].filter(Boolean).map(e => e.ref.current), C)
                            }
                        }
                        M.current = !1
                    }),
                    onBlur: (0, n.composeEventHandlers)(e.onBlur, () => O(!1))
                })
            })
        }),
        S = "RovingFocusGroupItem",
        R = t.forwardRef((e, r) => {
            let {
                __scopeRovingFocusGroup: o,
                focusable: l = !0,
                active: s = !1,
                tabStopId: u,
                children: c,
                ...f
            } = e, p = (0, i.useId)(), m = u || p, g = b(S, o), y = g.currentTabStopId === m, x = h(o), {
                onFocusableItemAdd: w,
                onFocusableItemRemove: E,
                currentTabStopId: C
            } = g;
            return t.useEffect(() => {
                if (l) return w(), () => E()
            }, [l, w, E]), (0, d.jsx)(v.ItemSlot, {
                scope: o,
                id: m,
                focusable: l,
                active: s,
                children: (0, d.jsx)(a.Primitive.span, {
                    tabIndex: y ? 0 : -1,
                    "data-orientation": g.orientation,
                    ...f,
                    ref: r,
                    onMouseDown: (0, n.composeEventHandlers)(e.onMouseDown, e => {
                        l ? g.onItemFocus(m) : e.preventDefault()
                    }),
                    onFocus: (0, n.composeEventHandlers)(e.onFocus, () => g.onItemFocus(m)),
                    onKeyDown: (0, n.composeEventHandlers)(e.onKeyDown, e => {
                        if ("Tab" === e.key && e.shiftKey) return void g.onItemShiftTab();
                        if (e.target !== e.currentTarget) return;
                        let t = function(e, t, n) {
                            var r;
                            let o = (r = e.key, "rtl" !== n ? r : "ArrowLeft" === r ? "ArrowRight" : "ArrowRight" === r ? "ArrowLeft" : r);
                            if (!("vertical" === t && ["ArrowLeft", "ArrowRight"].includes(o)) && !("horizontal" === t && ["ArrowUp", "ArrowDown"].includes(o))) return P[o]
                        }(e, g.orientation, g.dir);
                        if (void 0 !== t) {
                            if (e.metaKey || e.ctrlKey || e.altKey || e.shiftKey) return;
                            e.preventDefault();
                            let o = x().filter(e => e.focusable).map(e => e.ref.current);
                            if ("last" === t) o.reverse();
                            else if ("prev" === t || "next" === t) {
                                var n, r;
                                "prev" === t && o.reverse();
                                let l = o.indexOf(e.currentTarget);
                                o = g.loop ? (n = o, r = l + 1, n.map((e, t) => n[(r + t) % n.length])) : o.slice(l + 1)
                            }
                            setTimeout(() => T(o))
                        }
                    }),
                    children: "function" == typeof c ? c({
                        isCurrentTabStop: y,
                        hasTabStop: null != C
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
            n = document.activeElement;
        for (let r of e)
            if (r === n || (r.focus({
                    preventScroll: t
                }), document.activeElement !== n)) return
    }
    e.s(["Item", 0, R, "Root", 0, E, "createRovingFocusGroupScope", 0, x])
}, 76992, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(78892),
        r = e.i(221628),
        o = Symbol("radix.slottable");

    function l(e) {
        return t.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === o
    }
    e.s(["createSlot", 0, function(e) {
        var o;
        let i, a = (o = e, (i = t.forwardRef((e, r) => {
                let {
                    children: o,
                    ...l
                } = e;
                if (t.isValidElement(o)) {
                    var i, a, s;
                    let e, u, c = (u = (e = null == (a = Object.getOwnPropertyDescriptor((i = o).props, "ref")) ? void 0 : a.get) && "isReactWarning" in e && e.isReactWarning) ? i.ref : (u = (e = null == (s = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : s.get) && "isReactWarning" in e && e.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                        d = function(e, t) {
                            let n = {
                                ...t
                            };
                            for (let r in t) {
                                let o = e[r],
                                    l = t[r];
                                /^on[A-Z]/.test(r) ? o && l ? n[r] = function() {
                                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                    let r = l(...t);
                                    return o(...t), r
                                } : o && (n[r] = o) : "style" === r ? n[r] = {
                                    ...o,
                                    ...l
                                } : "className" === r && (n[r] = [o, l].filter(Boolean).join(" "))
                            }
                            return {
                                ...e,
                                ...n
                            }
                        }(l, o.props);
                    return o.type !== t.Fragment && (d.ref = r ? (0, n.composeRefs)(r, c) : c), t.cloneElement(o, d)
                }
                return t.Children.count(o) > 1 ? t.Children.only(null) : null
            })).displayName = "".concat(o, ".SlotClone"), i),
            s = t.forwardRef((e, n) => {
                let {
                    children: o,
                    ...i
                } = e, s = t.Children.toArray(o), u = s.find(l);
                if (u) {
                    let e = u.props.children,
                        o = s.map(n => n !== u ? n : t.Children.count(e) > 1 ? t.Children.only(null) : t.isValidElement(e) ? e.props.children : null);
                    return (0, r.jsx)(a, {
                        ...i,
                        ref: n,
                        children: t.isValidElement(e) ? t.cloneElement(e, void 0, o) : null
                    })
                }
                return (0, r.jsx)(a, {
                    ...i,
                    ref: n,
                    children: o
                })
            });
        return s.displayName = "".concat(e, ".Slot"), s
    }])
}, 199786, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(723570);
    t[" useEffectEvent ".trim().toString()], t[" useInsertionEffect ".trim().toString()];
    var r = t[" useInsertionEffect ".trim().toString()] || n.useLayoutEffect;
    Symbol("RADIX:SYNC_STATE"), e.s(["useControllableState", 0, function(e) {
        let {
            prop: n,
            defaultProp: o,
            onChange: l = () => {},
            caller: i
        } = e, [a, s, u] = function(e) {
            let {
                defaultProp: n,
                onChange: o
            } = e, [l, i] = t.useState(n), a = t.useRef(l), s = t.useRef(o);
            return r(() => {
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
        }), c = void 0 !== n, d = c ? n : a;
        {
            let e = t.useRef(void 0 !== n);
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
                let r = "function" == typeof e ? e(n) : e;
                if (r !== n) {
                    var t;
                    null == (t = u.current) || t.call(u, r)
                }
            } else s(e)
        }, [c, n, s, u])]
    }], 199786)
}, 300792, e => {
    "use strict";
    var t = e.i(416340);
    e.s(["usePrevious", 0, function(e) {
        let n = t.useRef({
            value: e,
            previous: e
        });
        return t.useMemo(() => (n.current.value !== e && (n.current.previous = n.current.value, n.current.value = e), n.current.previous), [e])
    }])
}, 692166, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(723570);
    e.s(["useSize", 0, function(e) {
        let [r, o] = t.useState(void 0);
        return (0, n.useLayoutEffect)(() => {
            if (e) {
                o({
                    width: e.offsetWidth,
                    height: e.offsetHeight
                });
                let t = new ResizeObserver(t => {
                    let n, r;
                    if (!Array.isArray(t) || !t.length) return;
                    let l = t[0];
                    if ("borderBoxSize" in l) {
                        let e = l.borderBoxSize,
                            t = Array.isArray(e) ? e[0] : e;
                        n = t.inlineSize, r = t.blockSize
                    } else n = e.offsetWidth, r = e.offsetHeight;
                    o({
                        width: n,
                        height: r
                    })
                });
                return t.observe(e, {
                    box: "border-box"
                }), () => t.unobserve(e)
            }
            o(void 0)
        }, [e]), r
    }])
}, 316413, 563921, e => {
    "use strict";
    var t = e.i(140625),
        n = e.i(408832),
        r = e.i(148380),
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
        E = e.i(886449),
        C = e.i(428156),
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
        L = e.i(813593),
        N = [" ", "Enter", "ArrowUp", "ArrowDown"],
        j = [" ", "Enter"],
        O = "Select",
        [k, D, M] = (0, c.createCollection)(O),
        [I, H] = (0, f.createContextScope)(O, [M, y.createPopperScope]),
        F = (0, y.createPopperScope)(),
        [_, B] = I(O),
        [W, z] = I(O),
        V = e => {
            let {
                __scopeSelect: t,
                children: n,
                open: r,
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
            } = e, x = F(t), [w, b] = i.useState(null), [E, S] = i.useState(null), [R, T] = i.useState(!1), A = (0, p.useDirection)(c), [L = !1, N] = (0, C.useControllableState)({
                prop: r,
                defaultProp: o,
                onChange: l
            }), [j, O] = (0, C.useControllableState)({
                prop: a,
                defaultProp: s,
                onChange: u
            }), D = i.useRef(null), M = !w || h || !!w.closest("form"), [I, H] = i.useState(new Set), B = Array.from(I).map(e => e.props.value).join(";");
            return (0, P.jsx)(y.Root, {
                ...x,
                children: (0, P.jsxs)(_, {
                    required: v,
                    scope: t,
                    trigger: w,
                    onTriggerChange: b,
                    valueNode: E,
                    onValueNodeChange: S,
                    valueNodeHasChildren: R,
                    onValueNodeHasChildrenChange: T,
                    contentId: (0, g.useId)(),
                    value: j,
                    onValueChange: O,
                    open: L,
                    onOpenChange: N,
                    dir: A,
                    triggerPointerDownPosRef: D,
                    disabled: m,
                    children: [(0, P.jsx)(k.Provider, {
                        scope: t,
                        children: (0, P.jsx)(W, {
                            scope: e.__scopeSelect,
                            onNativeOptionAdd: i.useCallback(e => {
                                H(t => new Set(t).add(e))
                            }, []),
                            onNativeOptionRemove: i.useCallback(e => {
                                H(t => {
                                    let n = new Set(t);
                                    return n.delete(e), n
                                })
                            }, []),
                            children: n
                        })
                    }), M ? (0, P.jsxs)(eS, {
                        "aria-hidden": !0,
                        required: v,
                        tabIndex: -1,
                        name: d,
                        autoComplete: f,
                        value: j,
                        onChange: e => O(e.target.value),
                        disabled: m,
                        form: h,
                        children: [void 0 === j ? (0, P.jsx)("option", {
                            value: ""
                        }) : null, Array.from(I)]
                    }, B) : null]
                })
            })
        };
    V.displayName = O;
    var U = "SelectTrigger",
        K = i.forwardRef((e, t) => {
            let {
                __scopeSelect: n,
                disabled: r = !1,
                ...o
            } = e, l = F(n), a = B(U, n), s = a.disabled || r, c = (0, d.useComposedRefs)(t, a.onTriggerChange), f = D(n), p = i.useRef("touch"), [m, v, h] = eR(e => {
                let t = f().filter(e => !e.disabled),
                    n = t.find(e => e.value === a.value),
                    r = eP(t, e, n);
                void 0 !== r && a.onValueChange(r.value)
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
                    "data-placeholder": eC(a.value) ? "" : void 0,
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
                        e.ctrlKey || e.altKey || e.metaKey || 1 !== e.key.length || v(e.key), (!t || " " !== e.key) && N.includes(e.key) && (g(), e.preventDefault())
                    })
                })
            })
        });
    K.displayName = U;
    var X = "SelectValue",
        Y = i.forwardRef((e, t) => {
            let {
                __scopeSelect: n,
                className: r,
                style: o,
                children: l,
                placeholder: i = "",
                ...a
            } = e, s = B(X, n), {
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
                children: eC(s.value) ? (0, P.jsx)(P.Fragment, {
                    children: i
                }) : l
            })
        });
    Y.displayName = X;
    var G = i.forwardRef((e, t) => {
        let {
            __scopeSelect: n,
            children: r,
            ...o
        } = e;
        return (0, P.jsx)(w.Primitive.span, {
            "aria-hidden": !0,
            ...o,
            ref: t,
            children: r || "▼"
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
            let n = B(Z, e.__scopeSelect),
                [r, o] = i.useState();
            return ((0, S.useLayoutEffect)(() => {
                o(new DocumentFragment)
            }, []), n.open) ? (0, P.jsx)(et, {
                ...e,
                ref: t
            }) : r ? a.createPortal((0, P.jsx)(J, {
                scope: e.__scopeSelect,
                children: (0, P.jsx)(k.Slot, {
                    scope: e.__scopeSelect,
                    children: (0, P.jsx)("div", {
                        children: e.children
                    })
                })
            }), r) : null
        });
    $.displayName = Z;
    var [J, Q] = I(Z), ee = (0, b.createSlot)("SelectContent.RemoveScroll"), et = i.forwardRef((e, t) => {
        let {
            __scopeSelect: n,
            position: r = "item-aligned",
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
            avoidCollisions: E,
            ...C
        } = e, S = B(Z, n), [R, T] = i.useState(null), [N, j] = i.useState(null), O = (0, d.useComposedRefs)(t, e => T(e)), [k, M] = i.useState(null), [I, H] = i.useState(null), F = D(n), [_, W] = i.useState(!1), z = i.useRef(!1);
        i.useEffect(() => {
            if (R) return (0, A.hideOthers)(R)
        }, [R]), (0, v.useFocusGuards)();
        let V = i.useCallback(e => {
                let [t, ...n] = F().map(e => e.ref.current), [r] = n.slice(-1), o = document.activeElement;
                for (let n of e)
                    if (n === o || (null == n || n.scrollIntoView({
                            block: "nearest"
                        }), n === t && N && (N.scrollTop = 0), n === r && N && (N.scrollTop = N.scrollHeight), null == n || n.focus(), document.activeElement !== o)) return
            }, [F, N]),
            U = i.useCallback(() => V([k, R]), [V, k, R]);
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
                        var n, r, o, l;
                        e = {
                            x: Math.abs(Math.round(t.pageX) - (null != (n = null == (o = X.current) ? void 0 : o.x) ? n : 0)),
                            y: Math.abs(Math.round(t.pageY) - (null != (r = null == (l = X.current) ? void 0 : l.y) ? r : 0))
                        }
                    },
                    n = n => {
                        e.x <= 10 && e.y <= 10 ? n.preventDefault() : R.contains(n.target) || K(!1), document.removeEventListener("pointermove", t), X.current = null
                    };
                return null !== X.current && (document.addEventListener("pointermove", t), document.addEventListener("pointerup", n, {
                    capture: !0,
                    once: !0
                })), () => {
                    document.removeEventListener("pointermove", t), document.removeEventListener("pointerup", n, {
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
                n = t.find(e => e.ref.current === document.activeElement),
                r = eP(t, e, n);
            r && setTimeout(() => r.ref.current.focus())
        }), q = i.useCallback((e, t, n) => {
            let r = !z.current && !n;
            (void 0 !== S.value && S.value === t || r) && (M(e), r && (z.current = !0))
        }, [S.value]), $ = i.useCallback(() => null == R ? void 0 : R.focus(), [R]), Q = i.useCallback((e, t, n) => {
            let r = !z.current && !n;
            (void 0 !== S.value && S.value === t || r) && H(e)
        }, [S.value]), et = "popper" === r ? er : en, eo = et === er ? {
            side: s,
            sideOffset: c,
            align: f,
            alignOffset: p,
            arrowPadding: g,
            collisionBoundary: y,
            collisionPadding: x,
            sticky: w,
            hideWhenDetached: b,
            avoidCollisions: E
        } : {};
        return (0, P.jsx)(J, {
            scope: n,
            content: R,
            viewport: N,
            onViewportChange: j,
            itemRefCallback: q,
            selectedItem: k,
            onItemLeave: $,
            itemTextRefCallback: Q,
            focusSelectedItem: U,
            selectedItemText: I,
            position: r,
            isPositioned: _,
            searchRef: Y,
            children: (0, P.jsx)(L.RemoveScroll, {
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
                            ...C,
                            ...eo,
                            onPlaced: () => W(!0),
                            ref: O,
                            style: {
                                display: "flex",
                                flexDirection: "column",
                                outline: "none",
                                ...C.style
                            },
                            onKeyDown: (0, u.composeEventHandlers)(C.onKeyDown, e => {
                                let t = e.ctrlKey || e.altKey || e.metaKey;
                                if ("Tab" === e.key && e.preventDefault(), t || 1 !== e.key.length || G(e.key), ["ArrowUp", "ArrowDown", "Home", "End"].includes(e.key)) {
                                    let t = F().filter(e => !e.disabled).map(e => e.ref.current);
                                    if (["ArrowUp", "End"].includes(e.key) && (t = t.slice().reverse()), ["ArrowUp", "ArrowDown"].includes(e.key)) {
                                        let n = e.target,
                                            r = t.indexOf(n);
                                        t = t.slice(r + 1)
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
    var en = i.forwardRef((e, t) => {
        let {
            __scopeSelect: n,
            onPlaced: r,
            ...o
        } = e, l = B(Z, n), a = Q(Z, n), [u, c] = i.useState(null), [f, p] = i.useState(null), m = (0, d.useComposedRefs)(t, e => p(e)), v = D(n), h = i.useRef(!1), g = i.useRef(!0), {
            viewport: y,
            selectedItem: x,
            selectedItemText: b,
            focusSelectedItem: E
        } = a, C = i.useCallback(() => {
            if (l.trigger && l.valueNode && u && f && y && x && b) {
                let e = l.trigger.getBoundingClientRect(),
                    t = f.getBoundingClientRect(),
                    n = l.valueNode.getBoundingClientRect(),
                    o = b.getBoundingClientRect();
                if ("rtl" !== l.dir) {
                    let r = o.left - t.left,
                        l = n.left - r,
                        i = e.left - l,
                        a = e.width + i,
                        c = Math.max(a, t.width),
                        d = window.innerWidth - 10,
                        f = (0, s.clamp)(l, [10, Math.max(10, d - c)]);
                    u.style.minWidth = a + "px", u.style.left = f + "px"
                } else {
                    let r = t.right - o.right,
                        l = window.innerWidth - n.right - r,
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
                    E = Math.min(5 * x.offsetHeight, w),
                    C = window.getComputedStyle(y),
                    S = parseInt(C.paddingTop, 10),
                    R = parseInt(C.paddingBottom, 10),
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
                u.style.margin = "".concat(10, "px 0"), u.style.minHeight = E + "px", u.style.maxHeight = a + "px", null == r || r(), requestAnimationFrame(() => h.current = !0)
            }
        }, [v, l.trigger, l.valueNode, u, f, y, x, b, l.dir, r]);
        (0, S.useLayoutEffect)(() => C(), [C]);
        let [R, T] = i.useState();
        (0, S.useLayoutEffect)(() => {
            f && T(window.getComputedStyle(f).zIndex)
        }, [f]);
        let A = i.useCallback(e => {
            e && !0 === g.current && (C(), null == E || E(), g.current = !1)
        }, [C, E]);
        return (0, P.jsx)(eo, {
            scope: n,
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
    en.displayName = "SelectItemAlignedPosition";
    var er = i.forwardRef((e, t) => {
        let {
            __scopeSelect: n,
            align: r = "start",
            collisionPadding: o = 10,
            ...l
        } = e, i = F(n);
        return (0, P.jsx)(y.Content, {
            ...i,
            ...l,
            ref: t,
            align: r,
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
    er.displayName = "SelectPopperPosition";
    var [eo, el] = I(Z, {}), ei = "SelectViewport", ea = i.forwardRef((e, t) => {
        let {
            __scopeSelect: n,
            nonce: r,
            ...o
        } = e, l = Q(ei, n), a = el(ei, n), s = (0, d.useComposedRefs)(t, l.onViewportChange), c = i.useRef(0);
        return (0, P.jsxs)(P.Fragment, {
            children: [(0, P.jsx)("style", {
                dangerouslySetInnerHTML: {
                    __html: "[data-radix-select-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-select-viewport]::-webkit-scrollbar{display:none}"
                },
                nonce: r
            }), (0, P.jsx)(k.Slot, {
                scope: n,
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
                                contentWrapper: n,
                                shouldExpandOnScrollRef: r
                            } = a;
                        if ((null == r ? void 0 : r.current) && n) {
                            let e = Math.abs(c.current - t.scrollTop);
                            if (e > 0) {
                                let r = window.innerHeight - 20,
                                    o = Math.max(parseFloat(n.style.minHeight), parseFloat(n.style.height));
                                if (o < r) {
                                    let l = o + e,
                                        i = Math.min(r, l),
                                        a = l - i;
                                    n.style.height = i + "px", "0px" === n.style.bottom && (t.scrollTop = a > 0 ? a : 0, n.style.justifyContent = "flex-end")
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
            __scopeSelect: n,
            ...r
        } = e, o = (0, g.useId)();
        return (0, P.jsx)(eu, {
            scope: n,
            id: o,
            children: (0, P.jsx)(w.Primitive.div, {
                role: "group",
                "aria-labelledby": o,
                ...r,
                ref: t
            })
        })
    }).displayName = es;
    var ed = "SelectLabel";
    i.forwardRef((e, t) => {
        let {
            __scopeSelect: n,
            ...r
        } = e, o = ec(ed, n);
        return (0, P.jsx)(w.Primitive.div, {
            id: o.id,
            ...r,
            ref: t
        })
    }).displayName = ed;
    var ef = "SelectItem",
        [ep, em] = I(ef),
        ev = i.forwardRef((e, t) => {
            let {
                __scopeSelect: n,
                value: r,
                disabled: o = !1,
                textValue: l,
                ...a
            } = e, s = B(ef, n), c = Q(ef, n), f = s.value === r, [p, m] = i.useState(null != l ? l : ""), [v, h] = i.useState(!1), y = (0, d.useComposedRefs)(t, e => {
                var t;
                return null == (t = c.itemRefCallback) ? void 0 : t.call(c, e, r, o)
            }), x = (0, g.useId)(), b = i.useRef("touch"), E = () => {
                o || (s.onValueChange(r), s.onOpenChange(!1))
            };
            if ("" === r) throw Error("A <Select.Item /> must have a value prop that is not an empty string. This is because the Select value can be set to an empty string to clear the selection and show the placeholder.");
            return (0, P.jsx)(ep, {
                scope: n,
                value: r,
                disabled: o,
                textId: x,
                isSelected: f,
                onItemTextChange: i.useCallback(e => {
                    m(t => {
                        var n;
                        return t || (null != (n = null == e ? void 0 : e.textContent) ? n : "").trim()
                    })
                }, []),
                children: (0, P.jsx)(k.ItemSlot, {
                    scope: n,
                    value: r,
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
                            "mouse" !== b.current && E()
                        }),
                        onPointerUp: (0, u.composeEventHandlers)(a.onPointerUp, () => {
                            "mouse" === b.current && E()
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
                            ((null == (t = c.searchRef) ? void 0 : t.current) === "" || " " !== e.key) && (j.includes(e.key) && E(), " " === e.key && e.preventDefault())
                        })
                    })
                })
            })
        });
    ev.displayName = ef;
    var eh = "SelectItemText",
        eg = i.forwardRef((e, t) => {
            let {
                __scopeSelect: n,
                className: r,
                style: o,
                ...l
            } = e, s = B(eh, n), u = Q(eh, n), c = em(eh, n), f = z(eh, n), [p, m] = i.useState(null), v = (0, d.useComposedRefs)(t, e => m(e), c.onItemTextChange, e => {
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
            __scopeSelect: n,
            ...r
        } = e;
        return em(ey, n).isSelected ? (0, P.jsx)(w.Primitive.span, {
            "aria-hidden": !0,
            ...r,
            ref: t
        }) : null
    }).displayName = ey;
    var ex = "SelectScrollUpButton";
    i.forwardRef((e, t) => {
        let n = Q(ex, e.__scopeSelect),
            r = el(ex, e.__scopeSelect),
            [o, l] = i.useState(!1),
            a = (0, d.useComposedRefs)(t, r.onScrollButtonChange);
        return (0, S.useLayoutEffect)(() => {
            if (n.viewport && n.isPositioned) {
                let e = function() {
                        l(t.scrollTop > 0)
                    },
                    t = n.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [n.viewport, n.isPositioned]), o ? (0, P.jsx)(eb, {
            ...e,
            ref: a,
            onAutoScroll: () => {
                let {
                    viewport: e,
                    selectedItem: t
                } = n;
                e && t && (e.scrollTop = e.scrollTop - t.offsetHeight)
            }
        }) : null
    }).displayName = ex;
    var ew = "SelectScrollDownButton";
    i.forwardRef((e, t) => {
        let n = Q(ew, e.__scopeSelect),
            r = el(ew, e.__scopeSelect),
            [o, l] = i.useState(!1),
            a = (0, d.useComposedRefs)(t, r.onScrollButtonChange);
        return (0, S.useLayoutEffect)(() => {
            if (n.viewport && n.isPositioned) {
                let e = function() {
                        let e = t.scrollHeight - t.clientHeight;
                        l(Math.ceil(t.scrollTop) < e)
                    },
                    t = n.viewport;
                return e(), t.addEventListener("scroll", e), () => t.removeEventListener("scroll", e)
            }
        }, [n.viewport, n.isPositioned]), o ? (0, P.jsx)(eb, {
            ...e,
            ref: a,
            onAutoScroll: () => {
                let {
                    viewport: e,
                    selectedItem: t
                } = n;
                e && t && (e.scrollTop = e.scrollTop + t.offsetHeight)
            }
        }) : null
    }).displayName = ew;
    var eb = i.forwardRef((e, t) => {
        let {
            __scopeSelect: n,
            onAutoScroll: r,
            ...o
        } = e, l = Q("SelectScrollButton", n), a = i.useRef(null), s = D(n), c = i.useCallback(() => {
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
                null === a.current && (a.current = window.setInterval(r, 50))
            }),
            onPointerMove: (0, u.composeEventHandlers)(o.onPointerMove, () => {
                var e;
                null == (e = l.onItemLeave) || e.call(l), null === a.current && (a.current = window.setInterval(r, 50))
            }),
            onPointerLeave: (0, u.composeEventHandlers)(o.onPointerLeave, () => {
                c()
            })
        })
    });
    i.forwardRef((e, t) => {
        let {
            __scopeSelect: n,
            ...r
        } = e;
        return (0, P.jsx)(w.Primitive.div, {
            "aria-hidden": !0,
            ...r,
            ref: t
        })
    }).displayName = "SelectSeparator";
    var eE = "SelectArrow";

    function eC(e) {
        return "" === e || void 0 === e
    }
    i.forwardRef((e, t) => {
        let {
            __scopeSelect: n,
            ...r
        } = e, o = F(n), l = B(eE, n), i = Q(eE, n);
        return l.open && "popper" === i.position ? (0, P.jsx)(y.Arrow, {
            ...o,
            ...r,
            ref: t
        }) : null
    }).displayName = eE;
    var eS = i.forwardRef((e, t) => {
        let {
            value: n,
            ...r
        } = e, o = i.useRef(null), l = (0, d.useComposedRefs)(t, o), a = (0, R.usePrevious)(n);
        return i.useEffect(() => {
            let e = o.current,
                t = Object.getOwnPropertyDescriptor(window.HTMLSelectElement.prototype, "value").set;
            if (a !== n && t) {
                let r = new Event("change", {
                    bubbles: !0
                });
                t.call(e, n), e.dispatchEvent(r)
            }
        }, [a, n]), (0, P.jsx)(T, {
            asChild: !0,
            children: (0, P.jsx)("select", {
                ...r,
                ref: l,
                defaultValue: n
            })
        })
    });

    function eR(e) {
        let t = (0, E.useCallbackRef)(e),
            n = i.useRef(""),
            r = i.useRef(0),
            o = i.useCallback(e => {
                let o = n.current + e;
                t(o),
                    function e(t) {
                        n.current = t, window.clearTimeout(r.current), "" !== t && (r.current = window.setTimeout(() => e(""), 1e3))
                    }(o)
            }, [t]),
            l = i.useCallback(() => {
                n.current = "", window.clearTimeout(r.current)
            }, []);
        return i.useEffect(() => () => window.clearTimeout(r.current), []), [n, o, l]
    }

    function eP(e, t, n) {
        var r, o;
        let l = t.length > 1 && Array.from(t).every(e => e === t[0]) ? t[0] : t,
            i = n ? e.indexOf(n) : -1,
            a = (r = e, o = Math.max(i, 0), r.map((e, t) => r[(o + t) % r.length]));
        1 === l.length && (a = a.filter(e => e !== n));
        let s = a.find(e => e.textValue.toLowerCase().startsWith(l.toLowerCase()));
        return s !== n ? s : void 0
    }
    eS.displayName = "BubbleSelect", e.s(["Content", 0, $, "Icon", 0, G, "Item", 0, ev, "ItemText", 0, eg, "Portal", 0, q, "Root", 0, V, "Trigger", 0, K, "Value", 0, Y, "Viewport", 0, ea], 563921);
    let eT = (0, i.createContext)(null),
        eA = {
            XSmall: "size-300",
            Small: "size-400",
            Medium: "size-500",
            Large: "size-600"
        },
        eL = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        eN = {
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
        eO = {
            XSmall: "gap-xsmall",
            Small: "gap-small",
            Medium: "gap-small",
            Large: "gap-small"
        },
        ek = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        eD = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        eM = (0, i.forwardRef)((e, a) => {
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
                children: E
            } = e, C = (0, n.default)(), S = (0, i.useMemo)(() => ({
                size: p
            }), [p]), R = s ? i.default.createElement("span", {
                id: C,
                className: (0, l.default)(eN[p], "content-emphasis")
            }, s) : null;
            return i.default.createElement(eT.Provider, {
                value: S
            }, i.default.createElement("div", {
                className: (0, l.default)("flex flex-col", g && ["opacity-[0.5]", "pointer-events-none"], eO[p], f)
            }, R && (u ? i.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, R, i.default.createElement(r.LabelTooltip, u)) : R), i.default.createElement(V, {
                value: v,
                disabled: g,
                onValueChange: w,
                onOpenChange: b
            }, i.default.createElement(K, {
                className: (0, l.default)("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", o.INPUT_BACKGROUND_BY_VARIANT[m], o.INPUT_STROKE_BY_VARIANT[m], ek[p], eD[p], eL[p], ej[p], y ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", void 0 === v ? "content-muted" : "content-default"),
                ref: a,
                "aria-labelledby": s ? C : c,
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
            }, E))), x && i.default.createElement("span", {
                className: (0, l.default)("text-caption-small", {
                    "content-system-alert": y,
                    "content-default": !y
                })
            }, x)))
        });
    eM.displayName = "Dropdown", e.s(["Dropdown", 0, eM, "DropdownContext", 0, eT], 316413)
}, 95899, e => {
    "use strict";
    var t = e.i(140625),
        n = e.i(316413),
        r = e.i(197649),
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
        } = e, d = (0, o.useContext)(n.DropdownContext), f = d ? "dropdown" : "standalone", p = null != (t = null != c ? c : null == d ? void 0 : d.size) ? t : "Medium", m = (0, o.useMemo)(() => ({
            size: p,
            mode: f
        }), [p, f]), v = (0, r.default)("foundation-web-menu bg-surface-100 stroke-standard stroke-default shadow-transient-high", s[p], u), g = "standalone" === f ? o.default.createElement(a.Root, {
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
        let n, {
                value: s,
                leading: u,
                title: h,
                description: y,
                trailing: x,
                disabled: w,
                className: b,
                onSelect: E,
                asChild: C,
                children: S,
                ...R
            } = e,
            {
                size: P,
                mode: T
            } = g(),
            A = (0, r.default)(t.interactable, "foundation-web-menu-item flex items-center content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full", m[P], c[P], d[P], f[P], v[P], w && "opacity-[0.5]", w && "pointer-events-none", b),
            L = o.default.createElement("span", {
                className: "foundation-web-menu-item-title text-no-wrap text-truncate-split content-emphasis"
            }, h);
        switch (T) {
            case "dropdown":
                L = o.default.createElement(i.ItemText, {
                    asChild: !0
                }, L);
                break;
            case "standalone":
                break;
            default:
                console.error("Invalid menu mode:", T)
        }
        let N = o.default.createElement(o.default.Fragment, null, !w && o.default.createElement(t.StateLayer, null), u, o.default.createElement("div", {
            className: (0, r.default)("grow-1 text-truncate-split flex flex-col", p[P])
        }, L, y && o.default.createElement("div", {
            className: "foundation-web-menu-item-description content-muted"
        }, y)), x);
        if (C) {
            let {
                as: e,
                ...r
            } = R, i = o.default.Children.only(S), a = void 0 === h && i.props.children;
            n = o.default.createElement(l.Slot, {
                ...r,
                role: "standalone" === T ? "menuitem" : void 0,
                "aria-disabled": w || void 0,
                className: A,
                style: {
                    outlineOffset: 0
                },
                onClick: w ? void 0 : E
            }, a ? o.default.cloneElement(i, {}, o.default.createElement(o.default.Fragment, null, !w && o.default.createElement(t.StateLayer, null), i.props.children)) : o.default.cloneElement(i, {}, N))
        } else if ("a" === R.as) {
            let {
                as: e,
                href: t,
                ...r
            } = R;
            n = o.default.createElement("a", {
                ...r,
                role: "standalone" === T ? "menuitem" : void 0,
                "aria-disabled": w,
                href: w ? void 0 : t,
                className: A,
                style: {
                    outlineOffset: 0,
                    textDecoration: "none"
                },
                onClick: w ? void 0 : E
            }, N)
        } else {
            let {
                as: e,
                ...t
            } = R;
            n = o.default.createElement("button", {
                type: "button",
                ...t,
                role: "standalone" === T ? "menuitem" : void 0,
                "aria-disabled": w,
                className: A,
                style: {
                    outlineOffset: 0
                },
                onClick: w ? void 0 : E
            }, N)
        }
        return "dropdown" === T ? o.default.createElement(i.Item, {
            value: s,
            disabled: w,
            asChild: !0
        }, n) : o.default.createElement(a.Item, {
            asChild: !0,
            focusable: !0,
            tabStopId: s
        }, n)
    }, "MenuLabel", 0, e => {
        let {
            title: t,
            description: n,
            leading: l,
            trailing: i,
            disabled: a,
            className: s
        } = e, {
            size: u
        } = g(), v = (0, r.default)("foundation-web-menu-label flex items-center content-default text-truncate-split text-align-x-left width-full", m[u], c[u], d[u], f[u], a && "opacity-[0.5]", s);
        return o.default.createElement("div", {
            role: "none",
            className: v
        }, l, o.default.createElement("div", {
            className: (0, r.default)("grow-1 text-truncate-split flex flex-col", p[u])
        }, o.default.createElement("span", {
            className: "foundation-web-menu-label-title text-no-wrap text-truncate-split content-emphasis"
        }, t), n && o.default.createElement("div", {
            className: "foundation-web-menu-label-description content-muted"
        }, n)), i)
    }, "MenuSection", 0, e => {
        let {
            children: t,
            className: n
        } = e, {
            size: l
        } = g();
        return o.default.createElement("div", {
            role: "group",
            className: (0, r.default)(u[l], n)
        }, t)
    }, "MenuSeparator", 0, e => {
        let {
            className: t
        } = e;
        return o.default.createElement("div", {
            role: "separator",
            className: (0, r.default)("foundation-web-menu-separator", t)
        })
    }])
}, 905943, 734463, e => {
    "use strict";
    var t = e.i(197649),
        n = e.i(416340),
        r = e.i(19655),
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
        E = (0, c.createPopperScope)(),
        [C, S] = w(x),
        R = e => {
            let {
                __scopePopover: t,
                children: r,
                open: o,
                defaultOpen: l,
                onOpenChange: i,
                modal: a = !1
            } = e, s = E(t), d = n.useRef(null), [f, p] = n.useState(!1), [m = !1, h] = (0, v.useControllableState)({
                prop: o,
                defaultProp: l,
                onChange: i
            });
            return (0, y.jsx)(c.Root, {
                ...s,
                children: (0, y.jsx)(C, {
                    scope: t,
                    contentId: (0, u.useId)(),
                    triggerRef: d,
                    open: m,
                    onOpenChange: h,
                    onOpenToggle: n.useCallback(() => h(e => !e), [h]),
                    hasCustomAnchor: f,
                    onCustomAnchorAdd: n.useCallback(() => p(!0), []),
                    onCustomAnchorRemove: n.useCallback(() => p(!1), []),
                    modal: a,
                    children: r
                })
            })
        };
    R.displayName = x;
    var P = "PopoverAnchor",
        T = n.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                ...o
            } = e, l = S(P, r), i = E(r), {
                onCustomAnchorAdd: a,
                onCustomAnchorRemove: s
            } = l;
            return n.useEffect(() => (a(), () => s()), [a, s]), (0, y.jsx)(c.Anchor, {
                ...i,
                ...o,
                ref: t
            })
        });
    T.displayName = P;
    var A = "PopoverTrigger",
        L = n.forwardRef((e, t) => {
            let {
                __scopePopover: n,
                ...l
            } = e, i = S(A, n), a = E(n), s = (0, o.useComposedRefs)(t, i.triggerRef), u = (0, y.jsx)(p.Primitive.button, {
                type: "button",
                "aria-haspopup": "dialog",
                "aria-expanded": i.open,
                "aria-controls": i.contentId,
                "data-state": V(i.open),
                ...l,
                ref: s,
                onClick: (0, r.composeEventHandlers)(e.onClick, i.onOpenToggle)
            });
            return i.hasCustomAnchor ? u : (0, y.jsx)(c.Anchor, {
                asChild: !0,
                ...a,
                children: u
            })
        });
    L.displayName = A;
    var N = "PopoverPortal",
        [j, O] = w(N, {
            forceMount: void 0
        }),
        k = e => {
            let {
                __scopePopover: t,
                forceMount: n,
                children: r,
                container: o
            } = e, l = S(N, t);
            return (0, y.jsx)(j, {
                scope: t,
                forceMount: n,
                children: (0, y.jsx)(f.Presence, {
                    present: n || l.open,
                    children: (0, y.jsx)(d.Portal, {
                        asChild: !0,
                        container: o,
                        children: r
                    })
                })
            })
        };
    k.displayName = N;
    var D = "PopoverContent",
        M = n.forwardRef((e, t) => {
            let n = O(D, e.__scopePopover),
                {
                    forceMount: r = n.forceMount,
                    ...o
                } = e,
                l = S(D, e.__scopePopover);
            return (0, y.jsx)(f.Presence, {
                present: r || l.open,
                children: l.modal ? (0, y.jsx)(H, {
                    ...o,
                    ref: t
                }) : (0, y.jsx)(F, {
                    ...o,
                    ref: t
                })
            })
        });
    M.displayName = D;
    var I = (0, m.createSlot)("PopoverContent.RemoveScroll"),
        H = n.forwardRef((e, t) => {
            let l = S(D, e.__scopePopover),
                i = n.useRef(null),
                a = (0, o.useComposedRefs)(t, i),
                s = n.useRef(!1);
            return n.useEffect(() => {
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
                    onCloseAutoFocus: (0, r.composeEventHandlers)(e.onCloseAutoFocus, e => {
                        var t;
                        e.preventDefault(), s.current || null == (t = l.triggerRef.current) || t.focus()
                    }),
                    onPointerDownOutside: (0, r.composeEventHandlers)(e.onPointerDownOutside, e => {
                        let t = e.detail.originalEvent,
                            n = 0 === t.button && !0 === t.ctrlKey;
                        s.current = 2 === t.button || n
                    }, {
                        checkForDefaultPrevented: !1
                    }),
                    onFocusOutside: (0, r.composeEventHandlers)(e.onFocusOutside, e => e.preventDefault(), {
                        checkForDefaultPrevented: !1
                    })
                })
            })
        }),
        F = n.forwardRef((e, t) => {
            let r = S(D, e.__scopePopover),
                o = n.useRef(!1),
                l = n.useRef(!1);
            return (0, y.jsx)(_, {
                ...e,
                ref: t,
                trapFocus: !1,
                disableOutsidePointerEvents: !1,
                onCloseAutoFocus: t => {
                    var n, i;
                    null == (n = e.onCloseAutoFocus) || n.call(e, t), t.defaultPrevented || (o.current || null == (i = r.triggerRef.current) || i.focus(), t.preventDefault()), o.current = !1, l.current = !1
                },
                onInteractOutside: t => {
                    var n, i;
                    null == (n = e.onInteractOutside) || n.call(e, t), t.defaultPrevented || (o.current = !0, "pointerdown" === t.detail.originalEvent.type && (l.current = !0));
                    let a = t.target;
                    (null == (i = r.triggerRef.current) ? void 0 : i.contains(a)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && l.current && t.preventDefault()
                }
            })
        }),
        _ = n.forwardRef((e, t) => {
            let {
                __scopePopover: n,
                trapFocus: r,
                onOpenAutoFocus: o,
                onCloseAutoFocus: l,
                disableOutsidePointerEvents: u,
                onEscapeKeyDown: d,
                onPointerDownOutside: f,
                onFocusOutside: p,
                onInteractOutside: m,
                ...v
            } = e, h = S(D, n), g = E(n);
            return (0, a.useFocusGuards)(), (0, y.jsx)(s.FocusScope, {
                asChild: !0,
                loop: !0,
                trapped: r,
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
        W = n.forwardRef((e, t) => {
            let {
                __scopePopover: n,
                ...o
            } = e, l = S(B, n);
            return (0, y.jsx)(p.Primitive.button, {
                type: "button",
                ...o,
                ref: t,
                onClick: (0, r.composeEventHandlers)(e.onClick, () => l.onOpenChange(!1))
            })
        });
    W.displayName = B;
    var z = n.forwardRef((e, t) => {
        let {
            __scopePopover: n,
            ...r
        } = e, o = E(n);
        return (0, y.jsx)(c.Arrow, {
            ...o,
            ...r,
            ref: t
        })
    });

    function V(e) {
        return e ? "open" : "closed"
    }
    z.displayName = "PopoverArrow", e.s(["Anchor", 0, T, "Arrow", 0, z, "Close", 0, W, "Content", 0, M, "Portal", 0, k, "Root", 0, R, "Trigger", 0, L], 734463);
    let U = e => {
        var t, n, r, o, l, i;
        let a = null != (t = null == (r = (o = window).matchMedia) || null == (n = r.call(o, "(pointer: coarse)")) ? void 0 : n.matches) && t,
            s = null == (l = document.activeElement) ? void 0 : l.matches(":focus-visible");
        if (a && !s) return void e.preventDefault();
        let u = null == (i = e.currentTarget) ? void 0 : i.querySelector('[role="menuitem"]:not([aria-disabled="true"])');
        u && (e.preventDefault(), u.focus())
    };
    e.s(["Popover", 0, function(e) {
        let {
            open: t,
            defaultOpen: r,
            onOpenChange: o,
            children: l
        } = e;
        return n.createElement(R, {
            open: t,
            defaultOpen: r,
            onOpenChange: o
        }, l)
    }, "PopoverAnchor", 0, function(e) {
        let {
            asChild: t,
            className: r,
            children: o
        } = e;
        return n.createElement(T, {
            asChild: t,
            className: r
        }, o)
    }, "PopoverClose", 0, function(e) {
        let {
            children: t,
            ...r
        } = e;
        return n.createElement(W, r, t)
    }, "PopoverContent", 0, function(e) {
        let {
            side: r = "bottom",
            align: o = "center",
            sideOffset: l = 4,
            className: i,
            children: a,
            ariaLabel: s,
            onOpenAutoFocus: u,
            ...c
        } = e;
        return n.createElement(k, null, n.createElement(M, {
            side: r,
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
            disabled: r,
            className: o,
            children: l
        } = e;
        return n.createElement(L, {
            asChild: t,
            disabled: r,
            className: o
        }, l)
    }], 905943)
}, 515351, e => {
    "use strict";
    var t = e.i(606944),
        n = e.i(197649),
        r = e.i(416340),
        o = e.i(357716),
        l = e.i(195560),
        i = e.i(978437),
        a = e.i(326301),
        s = e.i(636598),
        u = e.i(297452),
        c = e.i(992486),
        d = e.i(791634),
        f = e.i(221628),
        p = r.forwardRef((e, t) => {
            let {
                children: n,
                width: r = 10,
                height: o = 5,
                ...l
            } = e;
            return (0, f.jsx)(d.Primitive.svg, {
                ...l,
                ref: t,
                width: r,
                height: o,
                viewBox: "0 0 30 10",
                preserveAspectRatio: "none",
                children: e.asChild ? n : (0, f.jsx)("polygon", {
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
                children: n
            } = e, [o, l] = r.useState(null);
            return (0, f.jsx)(x, {
                scope: t,
                anchor: o,
                onAnchorChange: l,
                children: n
            })
        };
    b.displayName = h;
    var E = "PopperAnchor",
        C = r.forwardRef((e, t) => {
            let {
                __scopePopper: n,
                virtualRef: o,
                ...i
            } = e, a = w(E, n), s = r.useRef(null), u = (0, l.useComposedRefs)(t, s);
            return r.useEffect(() => {
                a.onAnchorChange((null == o ? void 0 : o.current) || s.current)
            }), o ? null : (0, f.jsx)(d.Primitive.div, {
                ...i,
                ref: u
            })
        });
    C.displayName = E;
    var S = "PopperContent",
        [R, P] = g(S),
        T = r.forwardRef((e, t) => {
            var n, o, i, a, s, p, h, g;
            let {
                __scopePopper: y,
                side: x = "bottom",
                sideOffset: b = 0,
                align: E = "center",
                alignOffset: C = 0,
                arrowPadding: P = 0,
                avoidCollisions: T = !0,
                collisionBoundary: A = [],
                collisionPadding: L = 0,
                sticky: N = "partial",
                hideWhenDetached: D = !1,
                updatePositionStrategy: M = "optimized",
                onPlaced: I,
                ...H
            } = e, F = w(S, y), [_, B] = r.useState(null), W = (0, l.useComposedRefs)(t, e => B(e)), [z, V] = r.useState(null), U = function(e) {
                let [t, n] = r.useState(void 0);
                return (0, v.useLayoutEffect)(() => {
                    if (e) {
                        n({
                            width: e.offsetWidth,
                            height: e.offsetHeight
                        });
                        let t = new ResizeObserver(t => {
                            let r, o;
                            if (!Array.isArray(t) || !t.length) return;
                            let l = t[0];
                            if ("borderBoxSize" in l) {
                                let e = l.borderBoxSize,
                                    t = Array.isArray(e) ? e[0] : e;
                                r = t.inlineSize, o = t.blockSize
                            } else r = e.offsetWidth, o = e.offsetHeight;
                            n({
                                width: r,
                                height: o
                            })
                        });
                        return t.observe(e, {
                            box: "border-box"
                        }), () => t.unobserve(e)
                    }
                    n(void 0)
                }, [e]), t
            }(z), K = null != (n = null == U ? void 0 : U.width) ? n : 0, X = null != (o = null == U ? void 0 : U.height) ? o : 0, Y = "number" == typeof L ? L : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...L
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
                placement: x + ("center" !== E ? "-" + E : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return (0, c.autoUpdate)(...t, {
                        animationFrame: "always" === M
                    })
                },
                elements: {
                    reference: F.anchor
                },
                middleware: [(0, u.offset)({
                    mainAxis: b + X,
                    alignmentAxis: C
                }), T && (0, u.shift)({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === N ? (0, u.limitShift)() : void 0,
                    ...Z
                }), T && (0, u.flip)({
                    ...Z
                }), (0, u.size)({
                    ...Z,
                    apply: e => {
                        let {
                            elements: t,
                            rects: n,
                            availableWidth: r,
                            availableHeight: o
                        } = e, {
                            width: l,
                            height: i
                        } = n.reference, a = t.floating.style;
                        a.setProperty("--radix-popper-available-width", "".concat(r, "px")), a.setProperty("--radix-popper-available-height", "".concat(o, "px")), a.setProperty("--radix-popper-anchor-width", "".concat(l, "px")), a.setProperty("--radix-popper-anchor-height", "".concat(i, "px"))
                    }
                }), z && (0, u.arrow)({
                    element: z,
                    padding: P
                }), O({
                    arrowWidth: K,
                    arrowHeight: X
                }), D && (0, u.hide)({
                    strategy: "referenceHidden",
                    ...Z
                })]
            }), [en, er] = k(Q), eo = (0, m.useCallbackRef)(I);
            (0, v.useLayoutEffect)(() => {
                ee && (null == eo || eo())
            }, [ee, eo]);
            let el = null == (i = et.arrow) ? void 0 : i.x,
                ei = null == (a = et.arrow) ? void 0 : a.y,
                ea = (null == (s = et.arrow) ? void 0 : s.centerOffset) !== 0,
                [es, eu] = r.useState();
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
                    placedSide: en,
                    onArrowChange: V,
                    arrowX: el,
                    arrowY: ei,
                    shouldHideArrow: ea,
                    children: (0, f.jsx)(d.Primitive.div, {
                        "data-side": en,
                        "data-align": er,
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
        L = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        N = r.forwardRef(function(e, t) {
            let {
                __scopePopper: n,
                ...r
            } = e, o = P(A, n), l = L[o.placedSide];
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
                    ...r,
                    ref: t,
                    style: {
                        ...r.style,
                        display: "block"
                    }
                })
            })
        });

    function j(e) {
        return null !== e
    }
    N.displayName = A;
    var O = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            var n, r, o, l, i;
            let {
                placement: a,
                rects: s,
                middlewareData: u
            } = t, c = (null == (o = u.arrow) ? void 0 : o.centerOffset) !== 0, d = c ? 0 : e.arrowWidth, f = c ? 0 : e.arrowHeight, [p, m] = k(a), v = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [m], h = (null != (n = null == (l = u.arrow) ? void 0 : l.x) ? n : 0) + d / 2, g = (null != (r = null == (i = u.arrow) ? void 0 : i.y) ? r : 0) + f / 2, y = "", x = "";
            return "bottom" === p ? (y = c ? v : "".concat(h, "px"), x = "".concat(-f, "px")) : "top" === p ? (y = c ? v : "".concat(h, "px"), x = "".concat(s.floating.height + f, "px")) : "right" === p ? (y = "".concat(-f, "px"), x = c ? v : "".concat(g, "px")) : "left" === p && (y = "".concat(s.floating.width + f, "px"), x = c ? v : "".concat(g, "px")), {
                data: {
                    x: y,
                    y: x
                }
            }
        }
    });

    function k(e) {
        let [t, n = "center"] = e.split("-");
        return [t, n]
    }
    var D = e.i(149285),
        M = r.forwardRef((e, t) => {
            var n, o;
            let {
                container: l,
                ...i
            } = e, [a, s] = r.useState(!1);
            (0, v.useLayoutEffect)(() => s(!0), []);
            let u = l || a && (null == (o = globalThis) || null == (n = o.document) ? void 0 : n.body);
            return u ? D.default.createPortal((0, f.jsx)(d.Primitive.div, {
                ...i,
                ref: t
            }), u) : null
        });
    M.displayName = "Portal";
    var I = e => {
        var t, n, o;
        let i, a, {
                present: s,
                children: u
            } = e,
            c = function(e) {
                var t, n;
                let [o, l] = r.useState(), i = r.useRef({}), a = r.useRef(e), s = r.useRef("none"), [u, c] = (t = e ? "mounted" : "unmounted", n = {
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
                }, r.useReducer((e, t) => {
                    let r = n[e][t];
                    return null != r ? r : e
                }, t));
                return r.useEffect(() => {
                    let e = H(i.current);
                    s.current = "mounted" === u ? e : "none"
                }, [u]), (0, v.useLayoutEffect)(() => {
                    let t = i.current,
                        n = a.current;
                    if (n !== e) {
                        let r = s.current,
                            o = H(t);
                        e ? c("MOUNT") : "none" === o || (null == t ? void 0 : t.display) === "none" ? c("UNMOUNT") : n && r !== o ? c("ANIMATION_OUT") : c("UNMOUNT"), a.current = e
                    }
                }, [e, c]), (0, v.useLayoutEffect)(() => {
                    if (o) {
                        var e;
                        let t, n = null != (e = o.ownerDocument.defaultView) ? e : window,
                            r = e => {
                                let r = H(i.current).includes(e.animationName);
                                if (e.target === o && r && (c("ANIMATION_END"), !a.current)) {
                                    let e = o.style.animationFillMode;
                                    o.style.animationFillMode = "forwards", t = n.setTimeout(() => {
                                        "forwards" === o.style.animationFillMode && (o.style.animationFillMode = e)
                                    })
                                }
                            },
                            l = e => {
                                e.target === o && (s.current = H(i.current))
                            };
                        return o.addEventListener("animationstart", l), o.addEventListener("animationcancel", r), o.addEventListener("animationend", r), () => {
                            n.clearTimeout(t), o.removeEventListener("animationstart", l), o.removeEventListener("animationcancel", r), o.removeEventListener("animationend", r)
                        }
                    }
                    c("ANIMATION_END")
                }, [o, c]), {
                    isPresent: ["mounted", "unmountSuspended"].includes(u),
                    ref: r.useCallback(e => {
                        e && (i.current = getComputedStyle(e)), l(e)
                    }, [])
                }
            }(s),
            d = "function" == typeof u ? u({
                present: c.isPresent
            }) : r.Children.only(u),
            f = (0, l.useComposedRefs)(c.ref, (a = (i = null == (n = Object.getOwnPropertyDescriptor((t = d).props, "ref")) ? void 0 : n.get) && "isReactWarning" in i && i.isReactWarning) ? t.ref : (a = (i = null == (o = Object.getOwnPropertyDescriptor(t, "ref")) ? void 0 : o.get) && "isReactWarning" in i && i.isReactWarning) ? t.props.ref : t.props.ref || t.ref);
        return "function" == typeof u || c.isPresent ? r.cloneElement(d, {
            ref: f
        }) : null
    };

    function H(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    I.displayName = "Presence";
    var F = e.i(362496),
        _ = r.forwardRef((e, t) => (0, f.jsx)(d.Primitive.span, {
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
            delayDuration: n = 700,
            skipDelayDuration: o = 300,
            disableHoverableContent: l = !1,
            children: i
        } = e, [a, s] = r.useState(!0), u = r.useRef(!1), c = r.useRef(0);
        return r.useEffect(() => {
            let e = c.current;
            return () => window.clearTimeout(e)
        }, []), (0, f.jsx)(K, {
            scope: t,
            isOpenDelayed: a,
            delayDuration: n,
            onOpen: r.useCallback(() => {
                window.clearTimeout(c.current), s(!1)
            }, []),
            onClose: r.useCallback(() => {
                window.clearTimeout(c.current), c.current = window.setTimeout(() => s(!0), o)
            }, [o]),
            isPointerInTransitRef: u,
            onPointerInTransitChange: r.useCallback(e => {
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
                children: n,
                open: o,
                defaultOpen: l = !1,
                onOpenChange: i,
                disableHoverableContent: a,
                delayDuration: u
            } = e, c = X(G, e.__scopeTooltip), d = z(t), [p, v] = r.useState(null), h = (0, s.useId)(), g = r.useRef(0), y = null != a ? a : c.disableHoverableContent, x = null != u ? u : c.delayDuration, w = r.useRef(!1), [E = !1, C] = function(e) {
                let {
                    prop: t,
                    defaultProp: n,
                    onChange: o = () => {}
                } = e, [l, i] = function(e) {
                    let {
                        defaultProp: t,
                        onChange: n
                    } = e, o = r.useState(t), [l] = o, i = r.useRef(l), a = (0, m.useCallbackRef)(n);
                    return r.useEffect(() => {
                        i.current !== l && (a(l), i.current = l)
                    }, [l, i, a]), o
                }({
                    defaultProp: n,
                    onChange: o
                }), a = void 0 !== t, s = a ? t : l, u = (0, m.useCallbackRef)(o);
                return [s, r.useCallback(e => {
                    if (a) {
                        let n = "function" == typeof e ? e(t) : e;
                        n !== t && u(n)
                    } else i(e)
                }, [a, t, i, u])]
            }({
                prop: o,
                defaultProp: l,
                onChange: e => {
                    e ? (c.onOpen(), document.dispatchEvent(new CustomEvent(U))) : c.onClose(), null == i || i(e)
                }
            }), S = r.useMemo(() => E ? w.current ? "delayed-open" : "instant-open" : "closed", [E]), R = r.useCallback(() => {
                window.clearTimeout(g.current), g.current = 0, w.current = !1, C(!0)
            }, [C]), P = r.useCallback(() => {
                window.clearTimeout(g.current), g.current = 0, C(!1)
            }, [C]), T = r.useCallback(() => {
                window.clearTimeout(g.current), g.current = window.setTimeout(() => {
                    w.current = !0, C(!0), g.current = 0
                }, x)
            }, [x, C]);
            return r.useEffect(() => () => {
                g.current && (window.clearTimeout(g.current), g.current = 0)
            }, []), (0, f.jsx)(b, {
                ...d,
                children: (0, f.jsx)(q, {
                    scope: t,
                    contentId: h,
                    open: E,
                    stateAttribute: S,
                    trigger: p,
                    onTriggerChange: v,
                    onTriggerEnter: r.useCallback(() => {
                        c.isOpenDelayed ? T() : R()
                    }, [c.isOpenDelayed, T, R]),
                    onTriggerLeave: r.useCallback(() => {
                        y ? P() : (window.clearTimeout(g.current), g.current = 0)
                    }, [P, y]),
                    onOpen: R,
                    onClose: P,
                    disableHoverableContent: y,
                    children: n
                })
            })
        };
    $.displayName = G;
    var J = "TooltipTrigger",
        Q = r.forwardRef((e, t) => {
            let {
                __scopeTooltip: n,
                ...i
            } = e, a = Z(J, n), s = X(J, n), u = z(n), c = r.useRef(null), p = (0, l.useComposedRefs)(t, c, a.onTriggerChange), m = r.useRef(!1), v = r.useRef(!1), h = r.useCallback(() => m.current = !1, []);
            return r.useEffect(() => () => document.removeEventListener("pointerup", h), [h]), (0, f.jsx)(C, {
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
        [et, en] = B(ee, {
            forceMount: void 0
        }),
        er = e => {
            let {
                __scopeTooltip: t,
                forceMount: n,
                children: r,
                container: o
            } = e, l = Z(ee, t);
            return (0, f.jsx)(et, {
                scope: t,
                forceMount: n,
                children: (0, f.jsx)(I, {
                    present: n || l.open,
                    children: (0, f.jsx)(M, {
                        asChild: !0,
                        container: o,
                        children: r
                    })
                })
            })
        };
    er.displayName = ee;
    var eo = "TooltipContent",
        el = r.forwardRef((e, t) => {
            let n = en(eo, e.__scopeTooltip),
                {
                    forceMount: r = n.forceMount,
                    side: o = "top",
                    ...l
                } = e,
                i = Z(eo, e.__scopeTooltip);
            return (0, f.jsx)(I, {
                present: r || i.open,
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
        ei = r.forwardRef((e, t) => {
            let n = Z(eo, e.__scopeTooltip),
                o = X(eo, e.__scopeTooltip),
                i = r.useRef(null),
                a = (0, l.useComposedRefs)(t, i),
                [s, u] = r.useState(null),
                {
                    trigger: c,
                    onClose: d
                } = n,
                p = i.current,
                {
                    onPointerInTransitChange: m
                } = o,
                v = r.useCallback(() => {
                    u(null), m(!1)
                }, [m]),
                h = r.useCallback((e, t) => {
                    let n, r = e.currentTarget,
                        o = {
                            x: e.clientX,
                            y: e.clientY
                        },
                        l = function(e, t) {
                            let n = Math.abs(t.top - e.y),
                                r = Math.abs(t.bottom - e.y),
                                o = Math.abs(t.right - e.x),
                                l = Math.abs(t.left - e.x);
                            switch (Math.min(n, r, o, l)) {
                                case l:
                                    return "left";
                                case o:
                                    return "right";
                                case n:
                                    return "top";
                                case r:
                                    return "bottom";
                                default:
                                    throw Error("unreachable")
                            }
                        }(o, r.getBoundingClientRect());
                    u(((n = [... function(e, t) {
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
                    }(o, l), ... function(e) {
                        let {
                            top: t,
                            right: n,
                            bottom: r,
                            left: o
                        } = e;
                        return [{
                            x: o,
                            y: t
                        }, {
                            x: n,
                            y: t
                        }, {
                            x: n,
                            y: r
                        }, {
                            x: o,
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
                    }(n))), m(!0)
                }, [m]);
            return r.useEffect(() => () => v(), [v]), r.useEffect(() => {
                if (c && p) {
                    let e = e => h(e, p),
                        t = e => h(e, c);
                    return c.addEventListener("pointerleave", e), p.addEventListener("pointerleave", t), () => {
                        c.removeEventListener("pointerleave", e), p.removeEventListener("pointerleave", t)
                    }
                }
            }, [c, p, h, v]), r.useEffect(() => {
                if (s) {
                    let e = e => {
                        let t = e.target,
                            n = {
                                x: e.clientX,
                                y: e.clientY
                            },
                            r = (null == c ? void 0 : c.contains(t)) || (null == p ? void 0 : p.contains(t)),
                            o = ! function(e, t) {
                                let {
                                    x: n,
                                    y: r
                                } = e, o = !1;
                                for (let e = 0, l = t.length - 1; e < t.length; l = e++) {
                                    let i = t[e].x,
                                        a = t[e].y,
                                        s = t[l].x,
                                        u = t[l].y;
                                    a > r != u > r && n < (s - i) * (r - a) / (u - a) + i && (o = !o)
                                }
                                return o
                            }(n, s);
                        r ? v() : o && (v(), d())
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
        eu = r.forwardRef((e, t) => {
            let {
                __scopeTooltip: n,
                children: o,
                "aria-label": l,
                onEscapeKeyDown: i,
                onPointerDownOutside: s,
                ...u
            } = e, c = Z(eo, n), d = z(n), {
                onClose: p
            } = c;
            return r.useEffect(() => (document.addEventListener(U, p), () => document.removeEventListener(U, p)), [p]), r.useEffect(() => {
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
                        scope: n,
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
        ed = r.forwardRef((e, t) => {
            let {
                __scopeTooltip: n,
                ...r
            } = e, o = z(n);
            return es(ec, n).isInside ? null : (0, f.jsx)(N, {
                ...o,
                ...r,
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
        return r.createElement(Y, {
            delayDuration: u
        }, r.createElement($, {
            open: d,
            onOpenChange: f
        }, c, r.createElement(er, null, r.createElement(el, {
            side: m,
            align: v,
            "aria-label": h,
            className: (0, n.default)("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", p),
            sideOffset: 5
        }, l && r.createElement(ed, {
            asChild: !0
        }, r.createElement(t.Beak, {
            className: "content-[var(--inverse-surface-0)]"
        })), r.createElement("div", {
            className: "flex flex-col text-truncate-split"
        }, r.createElement("div", {
            className: "text-caption-medium content-inverse-default"
        }, i), a && r.createElement("div", {
            className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
        }, a))))))
    }, "TooltipTrigger", 0, function(e) {
        let {
            children: t,
            asChild: n,
            className: o
        } = e;
        return r.createElement(Q, {
            asChild: n,
            className: o
        }, t)
    }], 515351)
}, 606944, 357716, 195560, 978437, 362496, 791634, 448970, 326301, 993032, 636598, e => {
    "use strict";
    var t, n, r = e.i(197649),
        o = e.i(416340);

    function l(e, t) {
        let {
            checkForDefaultPrevented: n = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(r) {
            if (null == e || e(r), !1 === n || !r.defaultPrevented) return null == t ? void 0 : t(r)
        }
    }

    function i(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function a() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        return e => {
            let n = !1,
                r = t.map(t => {
                    let r = i(t, e);
                    return n || "function" != typeof r || (n = !0), r
                });
            if (n) return () => {
                for (let e = 0; e < r.length; e++) {
                    let n = r[e];
                    "function" == typeof n ? n() : i(t[e], null)
                }
            }
        }
    }

    function s() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
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
            className: (0, r.default)("block", t),
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
            n = [],
            r = () => {
                let t = n.map(e => o.createContext(e));
                return function(n) {
                    let r = (null == n ? void 0 : n[e]) || t;
                    return o.useMemo(() => ({
                        ["__scope".concat(e)]: {
                            ...n,
                            [e]: r
                        }
                    }), [n, r])
                }
            };
        return r.scopeName = e, [function(t, r) {
            let l = o.createContext(r),
                i = n.length;
            n = [...n, r];
            let a = t => {
                var n;
                let {
                    scope: r,
                    children: a,
                    ...s
                } = t, c = (null == r || null == (n = r[e]) ? void 0 : n[i]) || l, d = o.useMemo(() => s, Object.values(s));
                return (0, u.jsx)(c.Provider, {
                    value: d,
                    children: a
                })
            };
            return a.displayName = t + "Provider", [a, function(n, a) {
                var s;
                let u = (null == a || null == (s = a[e]) ? void 0 : s[i]) || l,
                    c = o.useContext(u);
                if (c) return c;
                if (void 0 !== r) return r;
                throw Error("`".concat(n, "` must be used within `").concat(t, "`"))
            }]
        }, function() {
            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
            let r = t[0];
            if (1 === t.length) return r;
            let l = () => {
                let e = t.map(e => ({
                    useScope: e(),
                    scopeName: e.scopeName
                }));
                return function(t) {
                    let n = e.reduce((e, n) => {
                        let {
                            useScope: r,
                            scopeName: o
                        } = n, l = r(t)["__scope".concat(o)];
                        return {
                            ...e,
                            ...l
                        }
                    }, {});
                    return o.useMemo(() => ({
                        ["__scope".concat(r.scopeName)]: n
                    }), [n])
                }
            };
            return l.scopeName = r.scopeName, l
        }(r, ...t)]
    }], 978437);
    var c = e.i(149285),
        d = o.forwardRef((e, t) => {
            let {
                children: n,
                ...r
            } = e, l = o.Children.toArray(n), i = l.find(m);
            if (i) {
                let e = i.props.children,
                    n = l.map(t => t !== i ? t : o.Children.count(e) > 1 ? o.Children.only(null) : o.isValidElement(e) ? e.props.children : null);
                return (0, u.jsx)(f, {
                    ...r,
                    ref: t,
                    children: o.isValidElement(e) ? o.cloneElement(e, void 0, n) : null
                })
            }
            return (0, u.jsx)(f, {
                ...r,
                ref: t,
                children: n
            })
        });
    d.displayName = "Slot";
    var f = o.forwardRef((e, t) => {
        let {
            children: n,
            ...r
        } = e;
        if (o.isValidElement(n)) {
            var l, i, s;
            let e, u, c = (u = (e = null == (i = Object.getOwnPropertyDescriptor((l = n).props, "ref")) ? void 0 : i.get) && "isReactWarning" in e && e.isReactWarning) ? l.ref : (u = (e = null == (s = Object.getOwnPropertyDescriptor(l, "ref")) ? void 0 : s.get) && "isReactWarning" in e && e.isReactWarning) ? l.props.ref : l.props.ref || l.ref;
            return o.cloneElement(n, {
                ... function(e, t) {
                    let n = {
                        ...t
                    };
                    for (let r in t) {
                        let o = e[r],
                            l = t[r];
                        /^on[A-Z]/.test(r) ? o && l ? n[r] = function() {
                            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                            l(...t), o(...t)
                        } : o && (n[r] = o) : "style" === r ? n[r] = {
                            ...o,
                            ...l
                        } : "className" === r && (n[r] = [o, l].filter(Boolean).join(" "))
                    }
                    return {
                        ...e,
                        ...n
                    }
                }(r, n.props),
                ref: t ? a(t, c) : c
            })
        }
        return o.Children.count(n) > 1 ? o.Children.only(null) : null
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
        let n = o.forwardRef((e, n) => {
            let {
                asChild: r,
                ...o
            } = e, l = r ? d : t;
            return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, u.jsx)(l, {
                ...o,
                ref: n
            })
        });
        return n.displayName = "Primitive.".concat(t), {
            ...e,
            [t]: n
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
            for (var e, n = arguments.length, r = Array(n), o = 0; o < n; o++) r[o] = arguments[o];
            return null == (e = t.current) ? void 0 : e.call(t, ...r)
        }, [])
    }
    e.s(["Primitive", 0, v, "dispatchDiscreteCustomEvent", 0, h], 791634), e.s(["useCallbackRef", 0, g], 448970);
    var y = "dismissableLayer.update",
        x = o.createContext({
            layers: new Set,
            layersWithOutsidePointerEventsDisabled: new Set,
            branches: new Set
        }),
        w = o.forwardRef((e, n) => {
            var r, i;
            let {
                disableOutsidePointerEvents: a = !1,
                onEscapeKeyDown: c,
                onPointerDownOutside: d,
                onFocusOutside: f,
                onInteractOutside: p,
                onDismiss: m,
                ...h
            } = e, w = o.useContext(x), [C, S] = o.useState(null), R = null != (r = null == C ? void 0 : C.ownerDocument) ? r : null == (i = globalThis) ? void 0 : i.document, [, P] = o.useState({}), T = s(n, e => S(e)), A = Array.from(w.layers), [L] = [...w.layersWithOutsidePointerEventsDisabled].slice(-1), N = A.indexOf(L), j = C ? A.indexOf(C) : -1, O = w.layersWithOutsidePointerEventsDisabled.size > 0, k = j >= N, D = function(e) {
                var t;
                let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    r = g(e),
                    l = o.useRef(!1),
                    i = o.useRef(() => {});
                return o.useEffect(() => {
                    let e = e => {
                            if (e.target && !l.current) {
                                let t = function() {
                                        E("dismissableLayer.pointerDownOutside", r, o, {
                                            discrete: !0
                                        })
                                    },
                                    o = {
                                        originalEvent: e
                                    };
                                "touch" === e.pointerType ? (n.removeEventListener("click", i.current), i.current = t, n.addEventListener("click", i.current, {
                                    once: !0
                                })) : t()
                            } else n.removeEventListener("click", i.current);
                            l.current = !1
                        },
                        t = window.setTimeout(() => {
                            n.addEventListener("pointerdown", e)
                        }, 0);
                    return () => {
                        window.clearTimeout(t), n.removeEventListener("pointerdown", e), n.removeEventListener("click", i.current)
                    }
                }, [n, r]), {
                    onPointerDownCapture: () => l.current = !0
                }
            }(e => {
                let t = e.target,
                    n = [...w.branches].some(e => e.contains(t));
                k && !n && (null == d || d(e), null == p || p(e), e.defaultPrevented || null == m || m())
            }, R), M = function(e) {
                var t;
                let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    r = g(e),
                    l = o.useRef(!1);
                return o.useEffect(() => {
                    let e = e => {
                        e.target && !l.current && E("dismissableLayer.focusOutside", r, {
                            originalEvent: e
                        }, {
                            discrete: !1
                        })
                    };
                    return n.addEventListener("focusin", e), () => n.removeEventListener("focusin", e)
                }, [n, r]), {
                    onFocusCapture: () => l.current = !0,
                    onBlurCapture: () => l.current = !1
                }
            }(e => {
                let t = e.target;
                ![...w.branches].some(e => e.contains(t)) && (null == f || f(e), null == p || p(e), e.defaultPrevented || null == m || m())
            }, R);
            return ! function(e) {
                var t;
                let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    r = g(e);
                o.useEffect(() => {
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
                j === w.layers.size - 1 && (null == c || c(e), !e.defaultPrevented && m && (e.preventDefault(), m()))
            }, R), o.useEffect(() => {
                if (C) return a && (0 === w.layersWithOutsidePointerEventsDisabled.size && (t = R.body.style.pointerEvents, R.body.style.pointerEvents = "none"), w.layersWithOutsidePointerEventsDisabled.add(C)), w.layers.add(C), b(), () => {
                    a && 1 === w.layersWithOutsidePointerEventsDisabled.size && (R.body.style.pointerEvents = t)
                }
            }, [C, R, a, w]), o.useEffect(() => () => {
                C && (w.layers.delete(C), w.layersWithOutsidePointerEventsDisabled.delete(C), b())
            }, [C, w]), o.useEffect(() => {
                let e = () => P({});
                return document.addEventListener(y, e), () => document.removeEventListener(y, e)
            }, []), (0, u.jsx)(v.div, {
                ...h,
                ref: T,
                style: {
                    pointerEvents: O ? k ? "auto" : "none" : void 0,
                    ...e.style
                },
                onFocusCapture: l(e.onFocusCapture, M.onFocusCapture),
                onBlurCapture: l(e.onBlurCapture, M.onBlurCapture),
                onPointerDownCapture: l(e.onPointerDownCapture, D.onPointerDownCapture)
            })
        });

    function b() {
        let e = new CustomEvent(y);
        document.dispatchEvent(e)
    }

    function E(e, t, n, r) {
        let {
            discrete: o
        } = r, l = n.originalEvent.target, i = new CustomEvent(e, {
            bubbles: !1,
            cancelable: !0,
            detail: n
        });
        t && l.addEventListener(e, t, {
            once: !0
        }), o ? h(l, i) : l.dispatchEvent(i)
    }
    w.displayName = "DismissableLayer", o.forwardRef((e, t) => {
        let n = o.useContext(x),
            r = o.useRef(null),
            l = s(t, r);
        return o.useEffect(() => {
            let e = r.current;
            if (e) return n.branches.add(e), () => {
                n.branches.delete(e)
            }
        }, [n.branches]), (0, u.jsx)(v.div, {
            ...e,
            ref: l
        })
    }).displayName = "DismissableLayerBranch", e.s(["DismissableLayer", 0, w], 326301);
    var C = (null == (n = globalThis) ? void 0 : n.document) ? o.useLayoutEffect : () => {};
    e.s(["useLayoutEffect", 0, C], 993032);
    var S = o["useId".toString()] || (() => void 0),
        R = 0;
    e.s(["useId", 0, function(e) {
        let [t, n] = o.useState(S());
        return C(() => {
            e || n(e => null != e ? e : String(R++))
        }, [e]), e || (t ? "radix-".concat(t) : "")
    }], 636598)
}, 148380, e => {
    "use strict";
    var t = e.i(75584),
        n = e.i(515351),
        r = e.i(416340);
    e.s(["LabelTooltip", 0, e => {
        let {
            title: o,
            description: l,
            position: i = "top-center"
        } = e;
        return r.default.createElement(n.Tooltip, {
            position: i,
            title: o,
            description: l
        }, r.default.createElement(n.TooltipTrigger, {
            asChild: !0
        }, r.default.createElement("span", {
            role: "button",
            tabIndex: 0,
            "aria-label": o,
            className: "flex items-center content-muted",
            "data-testid": "label-tooltip-trigger"
        }, r.default.createElement(t.Icon, {
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
}]);

//# debugId=dda5a953-f277-2209-c1ac-e2a057387c76
//# sourceMappingURL=394v8hvhp2rpq.js.map