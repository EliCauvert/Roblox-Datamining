;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "e2a1283f-4831-1e26-09a7-90d4c4e5a288")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 297452, 992486, e => {
    "use strict";
    let t, n = ["top", "right", "bottom", "left"],
        r = n.reduce((e, t) => e.concat(t, t + "-start", t + "-end"), []),
        i = Math.min,
        o = Math.max,
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

    function f(e) {
        return e.split("-")[0]
    }

    function d(e) {
        return e.split("-")[1]
    }

    function p(e) {
        return "x" === e ? "y" : "x"
    }

    function m(e) {
        return "y" === e ? "height" : "width"
    }

    function g(e) {
        let t = e[0];
        return "t" === t || "b" === t ? "y" : "x"
    }

    function h(e, t, n) {
        void 0 === n && (n = !1);
        let r = d(e),
            i = p(g(e)),
            o = m(i),
            l = "x" === i ? r === (n ? "end" : "start") ? "right" : "left" : "start" === r ? "bottom" : "top";
        return t.reference[o] > t.floating[o] && (l = E(l)), [l, E(l)]
    }

    function v(e) {
        return e.includes("start") ? e.replace("start", "end") : e.replace("end", "start")
    }
    let y = ["left", "right"],
        b = ["right", "left"],
        w = ["top", "bottom"],
        x = ["bottom", "top"];

    function E(e) {
        let t = f(e);
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

    function S(e, t, n) {
        let r, {
                reference: i,
                floating: o
            } = e,
            l = g(t),
            a = p(g(t)),
            s = m(a),
            u = f(t),
            c = "y" === l,
            h = i.x + i.width / 2 - o.width / 2,
            v = i.y + i.height / 2 - o.height / 2,
            y = i[s] / 2 - o[s] / 2;
        switch (u) {
            case "top":
                r = {
                    x: h,
                    y: i.y - o.height
                };
                break;
            case "bottom":
                r = {
                    x: h,
                    y: i.y + i.height
                };
                break;
            case "right":
                r = {
                    x: i.x + i.width,
                    y: v
                };
                break;
            case "left":
                r = {
                    x: i.x - o.width,
                    y: v
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
    async function O(e, t) {
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
            boundary: u = "clippingAncestors",
            rootBoundary: f = "viewport",
            elementContext: d = "floating",
            altBoundary: p = !1,
            padding: m = 0
        } = c(t, e), g = C(m), h = a[p ? "floating" === d ? "reference" : "floating" : d], v = R(await o.getClippingRect({
            element: null == (n = await (null == o.isElement ? void 0 : o.isElement(h))) || n ? h : h.contextElement || await (null == o.getDocumentElement ? void 0 : o.getDocumentElement(a.floating)),
            boundary: u,
            rootBoundary: f,
            strategy: s
        })), y = "floating" === d ? {
            x: r,
            y: i,
            width: l.floating.width,
            height: l.floating.height
        } : l.reference, b = await (null == o.getOffsetParent ? void 0 : o.getOffsetParent(a.floating)), w = await (null == o.isElement ? void 0 : o.isElement(b)) && await (null == o.getScale ? void 0 : o.getScale(b)) || {
            x: 1,
            y: 1
        }, x = R(o.convertOffsetParentRelativeRectToViewportRelativeRect ? await o.convertOffsetParentRelativeRectToViewportRelativeRect({
            elements: a,
            rect: y,
            offsetParent: b,
            strategy: s
        }) : y);
        return {
            top: (v.top - x.top + g.top) / w.y,
            bottom: (x.bottom - v.bottom + g.bottom) / w.y,
            left: (v.left - x.left + g.left) / w.x,
            right: (x.right - v.right + g.right) / w.x
        }
    }
    let L = async (e, t, n) => {
        let {
            placement: r = "bottom",
            strategy: i = "absolute",
            middleware: o = [],
            platform: l
        } = n, a = l.detectOverflow ? l : {
            ...l,
            detectOverflow: O
        }, s = await (null == l.isRTL ? void 0 : l.isRTL(t)), u = await l.getElementRects({
            reference: e,
            floating: t,
            strategy: i
        }), {
            x: c,
            y: f
        } = S(u, r, s), d = r, p = 0, m = {};
        for (let n = 0; n < o.length; n++) {
            let g = o[n];
            if (!g) continue;
            let {
                name: h,
                fn: v
            } = g, {
                x: y,
                y: b,
                data: w,
                reset: x
            } = await v({
                x: c,
                y: f,
                initialPlacement: r,
                placement: d,
                strategy: i,
                middlewareData: m,
                rects: u,
                platform: a,
                elements: {
                    reference: e,
                    floating: t
                }
            });
            c = null != y ? y : c, f = null != b ? b : f, m[h] = {
                ...m[h],
                ...w
            }, x && p < 50 && (p++, "object" == typeof x && (x.placement && (d = x.placement), x.rects && (u = !0 === x.rects ? await l.getElementRects({
                reference: e,
                floating: t,
                strategy: i
            }) : x.rects), {
                x: c,
                y: f
            } = S(u, d, s)), n = -1)
        }
        return {
            x: c,
            y: f,
            placement: d,
            strategy: i,
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

    function A(e) {
        return n.some(t => e[t] >= 0)
    }

    function P(e) {
        let t = i(...e.map(e => e.left)),
            n = i(...e.map(e => e.top));
        return {
            x: t,
            y: n,
            width: o(...e.map(e => e.right)) - t,
            height: o(...e.map(e => e.bottom)) - n
        }
    }
    let N = new Set(["left", "top"]);
    async function _(e, t) {
        let {
            placement: n,
            platform: r,
            elements: i
        } = e, o = await (null == r.isRTL ? void 0 : r.isRTL(i.floating)), l = f(n), a = d(n), s = "y" === g(n), u = N.has(l) ? -1 : 1, p = o && s ? -1 : 1, m = c(t, e), {
            mainAxis: h,
            crossAxis: v,
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
        return a && "number" == typeof y && (v = "end" === a ? -1 * y : y), s ? {
            x: v * p,
            y: h * u
        } : {
            x: h * u,
            y: v * p
        }
    }

    function D() {
        return "u" > typeof window
    }

    function M(e) {
        return z(e) ? (e.nodeName || "").toLowerCase() : "#document"
    }

    function k(e) {
        var t;
        return (null == e || null == (t = e.ownerDocument) ? void 0 : t.defaultView) || window
    }

    function j(e) {
        var t;
        return null == (t = (z(e) ? e.ownerDocument : e.document) || window.document) ? void 0 : t.documentElement
    }

    function z(e) {
        return !!D() && (e instanceof Node || e instanceof k(e).Node)
    }

    function W(e) {
        return !!D() && (e instanceof Element || e instanceof k(e).Element)
    }

    function H(e) {
        return !!D() && (e instanceof HTMLElement || e instanceof k(e).HTMLElement)
    }

    function I(e) {
        return !(!D() || "u" < typeof ShadowRoot) && (e instanceof ShadowRoot || e instanceof k(e).ShadowRoot)
    }

    function F(e) {
        let {
            overflow: t,
            overflowX: n,
            overflowY: r,
            display: i
        } = G(e);
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
    let U = /transform|translate|scale|rotate|perspective|filter/,
        V = /paint|layout|strict|content/,
        X = e => !!e && "none" !== e;

    function $(e) {
        let t = W(e) ? G(e) : e;
        return X(t.transform) || X(t.translate) || X(t.scale) || X(t.rotate) || X(t.perspective) || !Y() && (X(t.backdropFilter) || X(t.filter)) || U.test(t.willChange || "") || V.test(t.contain || "")
    }

    function Y() {
        return null == t && (t = "u" > typeof CSS && CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")), t
    }

    function q(e) {
        return /^(html|body|#document)$/.test(M(e))
    }

    function G(e) {
        return k(e).getComputedStyle(e)
    }

    function K(e) {
        return W(e) ? {
            scrollLeft: e.scrollLeft,
            scrollTop: e.scrollTop
        } : {
            scrollLeft: e.scrollX,
            scrollTop: e.scrollY
        }
    }

    function Z(e) {
        if ("html" === M(e)) return e;
        let t = e.assignedSlot || e.parentNode || I(e) && e.host || j(e);
        return I(t) ? t.host : t
    }

    function J(e, t, n) {
        var r;
        void 0 === t && (t = []), void 0 === n && (n = !0);
        let i = function e(t) {
                let n = Z(t);
                return q(n) ? t.ownerDocument ? t.ownerDocument.body : t.body : H(n) && F(n) ? n : e(n)
            }(e),
            o = i === (null == (r = e.ownerDocument) ? void 0 : r.body),
            l = k(i);
        if (!o) return t.concat(i, J(i, [], n));
        {
            let e = Q(l);
            return t.concat(l, l.visualViewport || [], F(i) ? i : [], e && n ? J(e) : [])
        }
    }

    function Q(e) {
        return e.parent && Object.getPrototypeOf(e.parent) ? e.frameElement : null
    }

    function ee(e) {
        let t = G(e),
            n = parseFloat(t.width) || 0,
            r = parseFloat(t.height) || 0,
            i = H(e),
            o = i ? e.offsetWidth : n,
            a = i ? e.offsetHeight : r,
            s = l(n) !== o || l(r) !== a;
        return s && (n = o, r = a), {
            width: n,
            height: r,
            $: s
        }
    }

    function et(e) {
        return W(e) ? e : e.contextElement
    }

    function en(e) {
        let t = et(e);
        if (!H(t)) return s(1);
        let n = t.getBoundingClientRect(),
            {
                width: r,
                height: i,
                $: o
            } = ee(t),
            a = (o ? l(n.width) : n.width) / r,
            u = (o ? l(n.height) : n.height) / i;
        return a && Number.isFinite(a) || (a = 1), u && Number.isFinite(u) || (u = 1), {
            x: a,
            y: u
        }
    }
    let er = s(0);

    function ei(e) {
        let t = k(e);
        return Y() && t.visualViewport ? {
            x: t.visualViewport.offsetLeft,
            y: t.visualViewport.offsetTop
        } : er
    }

    function eo(e, t, n, r) {
        var i;
        void 0 === t && (t = !1), void 0 === n && (n = !1);
        let o = e.getBoundingClientRect(),
            l = et(e),
            a = s(1);
        t && (r ? W(r) && (a = en(r)) : a = en(e));
        let u = (void 0 === (i = n) && (i = !1), r && (!i || r === k(l)) && i) ? ei(l) : s(0),
            c = (o.left + u.x) / a.x,
            f = (o.top + u.y) / a.y,
            d = o.width / a.x,
            p = o.height / a.y;
        if (l) {
            let e = k(l),
                t = r && W(r) ? k(r) : r,
                n = e,
                i = Q(n);
            for (; i && r && t !== n;) {
                let e = en(i),
                    t = i.getBoundingClientRect(),
                    r = G(i),
                    o = t.left + (i.clientLeft + parseFloat(r.paddingLeft)) * e.x,
                    l = t.top + (i.clientTop + parseFloat(r.paddingTop)) * e.y;
                c *= e.x, f *= e.y, d *= e.x, p *= e.y, c += o, f += l, i = Q(n = k(i))
            }
        }
        return R({
            width: d,
            height: p,
            x: c,
            y: f
        })
    }

    function el(e, t) {
        let n = K(e).scrollLeft;
        return t ? t.left + n : eo(j(e)).left + n
    }

    function ea(e, t) {
        let n = e.getBoundingClientRect();
        return {
            x: n.left + t.scrollLeft - el(e, n),
            y: n.top + t.scrollTop
        }
    }

    function es(e, t, n) {
        var r;
        let i;
        if ("viewport" === t) i = function(e, t) {
            let n = k(e),
                r = j(e),
                i = n.visualViewport,
                o = r.clientWidth,
                l = r.clientHeight,
                a = 0,
                s = 0;
            if (i) {
                o = i.width, l = i.height;
                let e = Y();
                (!e || e && "fixed" === t) && (a = i.offsetLeft, s = i.offsetTop)
            }
            let u = el(r);
            if (u <= 0) {
                let e = r.ownerDocument,
                    t = e.body,
                    n = getComputedStyle(t),
                    i = "CSS1Compat" === e.compatMode && parseFloat(n.marginLeft) + parseFloat(n.marginRight) || 0,
                    l = Math.abs(r.clientWidth - t.clientWidth - i);
                l <= 25 && (o -= l)
            } else u <= 25 && (o += u);
            return {
                width: o,
                height: l,
                x: a,
                y: s
            }
        }(e, n);
        else if ("document" === t) {
            let t, n, l, a, s, u, c;
            r = j(e), t = j(r), n = K(r), l = r.ownerDocument.body, a = o(t.scrollWidth, t.clientWidth, l.scrollWidth, l.clientWidth), s = o(t.scrollHeight, t.clientHeight, l.scrollHeight, l.clientHeight), u = -n.scrollLeft + el(r), c = -n.scrollTop, "rtl" === G(l).direction && (u += o(t.clientWidth, l.clientWidth) - a), i = {
                width: a,
                height: s,
                x: u,
                y: c
            }
        } else if (W(t)) {
            let e, r, o, l, a, u;
            r = (e = eo(t, !0, "fixed" === n)).top + t.clientTop, o = e.left + t.clientLeft, l = H(t) ? en(t) : s(1), a = t.clientWidth * l.x, u = t.clientHeight * l.y, i = {
                width: a,
                height: u,
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
        return R(i)
    }

    function eu(e) {
        return "static" === G(e).position
    }

    function ec(e, t) {
        if (!H(e) || "fixed" === G(e).position) return null;
        if (t) return t(e);
        let n = e.offsetParent;
        return j(e) === n && (n = n.ownerDocument.body), n
    }

    function ef(e, t) {
        var n;
        let r = k(e);
        if (B(e)) return r;
        if (!H(e)) {
            let t = Z(e);
            for (; t && !q(t);) {
                if (W(t) && !eu(t)) return t;
                t = Z(t)
            }
            return r
        }
        let i = ec(e, t);
        for (; i && (n = i, /^(table|td|th)$/.test(M(n))) && eu(i);) i = ec(i, t);
        return i && q(i) && eu(i) && !$(i) ? r : i || function(e) {
            let t = Z(e);
            for (; H(t) && !q(t);) {
                if ($(t)) return t;
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
                let r = H(t),
                    i = j(t),
                    o = "fixed" === n,
                    l = eo(e, !0, o, t),
                    a = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    u = s(0);
                if (r || !r && !o)
                    if (("body" !== M(t) || F(i)) && (a = K(t)), r) {
                        let e = eo(t, !0, o, t);
                        u.x = e.x + t.clientLeft, u.y = e.y + t.clientTop
                    } else i && (u.x = el(i));
                o && !r && i && (u.x = el(i));
                let c = !i || r || o ? s(0) : ea(i, a);
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
            } = e, o = "fixed" === i, l = j(r), a = !!t && B(t.floating);
            if (r === l || a && o) return n;
            let u = {
                    scrollLeft: 0,
                    scrollTop: 0
                },
                c = s(1),
                f = s(0),
                d = H(r);
            if ((d || !d && !o) && (("body" !== M(r) || F(l)) && (u = K(r)), d)) {
                let e = eo(r);
                c = en(r), f.x = e.x + r.clientLeft, f.y = e.y + r.clientTop
            }
            let p = !l || d || o ? s(0) : ea(l, u);
            return {
                width: n.width * c.x,
                height: n.height * c.y,
                x: n.x * c.x - u.scrollLeft * c.x + f.x + p.x,
                y: n.y * c.y - u.scrollTop * c.y + f.y + p.y
            }
        },
        getDocumentElement: j,
        getClippingRect: function(e) {
            let {
                element: t,
                boundary: n,
                rootBoundary: r,
                strategy: l
            } = e, a = [..."clippingAncestors" === n ? B(t) ? [] : function(e, t) {
                let n = t.get(e);
                if (n) return n;
                let r = J(e, [], !1).filter(e => W(e) && "body" !== M(e)),
                    i = null,
                    o = "fixed" === G(e).position,
                    l = o ? Z(e) : e;
                for (; W(l) && !q(l);) {
                    let t = G(l),
                        n = $(l);
                    n || "fixed" !== t.position || (i = null), (o ? n || i : !(!n && "static" === t.position && i && ("absolute" === i.position || "fixed" === i.position) || F(l) && !n && function e(t, n) {
                        let r = Z(t);
                        return !(r === n || !W(r) || q(r)) && ("fixed" === G(r).position || e(r, n))
                    }(e, l))) ? i = t : r = r.filter(e => e !== l), l = Z(l)
                }
                return t.set(e, r), r
            }(t, this._c) : [].concat(n), r], s = es(t, a[0], l), u = s.top, c = s.right, f = s.bottom, d = s.left;
            for (let e = 1; e < a.length; e++) {
                let n = es(t, a[e], l);
                u = o(n.top, u), c = i(n.right, c), f = i(n.bottom, f), d = o(n.left, d)
            }
            return {
                width: c - d,
                height: f - u,
                x: d,
                y: u
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
        isElement: W,
        isRTL: function(e) {
            return "rtl" === G(e).direction
        }
    };

    function em(e, t) {
        return e.x === t.x && e.y === t.y && e.width === t.width && e.height === t.height
    }
    let eg = function(e) {
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
                    } = t, s = await _(t, e);
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
        },
        eh = function(e) {
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
                        mainAxis: s = !0,
                        crossAxis: u = !1,
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
                        ...m
                    } = c(e, t), h = {
                        x: n,
                        y: r
                    }, v = await a.detectOverflow(t, m), y = g(f(l)), b = p(y), w = h[b], x = h[y];
                    if (s) {
                        let e = "y" === b ? "top" : "left",
                            t = "y" === b ? "bottom" : "right",
                            n = w + v[e],
                            r = w - v[t];
                        w = o(n, i(w, r))
                    }
                    if (u) {
                        let e = "y" === y ? "top" : "left",
                            t = "y" === y ? "bottom" : "right",
                            n = x + v[e],
                            r = x - v[t];
                        x = o(n, i(x, r))
                    }
                    let E = d.fn({
                        ...t,
                        [b]: w,
                        [y]: x
                    });
                    return {
                        ...E,
                        data: {
                            x: E.x - n,
                            y: E.y - r,
                            enabled: {
                                [b]: s,
                                [y]: u
                            }
                        }
                    }
                }
            }
        },
        ev = function(e) {
            return void 0 === e && (e = {}), {
                name: "flip",
                options: e,
                async fn(t) {
                    var n, r, i, o, l;
                    let a, s, u, {
                            placement: p,
                            middlewareData: m,
                            rects: C,
                            initialPlacement: R,
                            platform: S,
                            elements: O
                        } = t,
                        {
                            mainAxis: L = !0,
                            crossAxis: T = !0,
                            fallbackPlacements: A,
                            fallbackStrategy: P = "bestFit",
                            fallbackAxisSideDirection: N = "none",
                            flipAlignment: _ = !0,
                            ...D
                        } = c(e, t);
                    if (null != (n = m.arrow) && n.alignmentOffset) return {};
                    let M = f(p),
                        k = g(R),
                        j = f(R) === R,
                        z = await (null == S.isRTL ? void 0 : S.isRTL(O.floating)),
                        W = A || (j || !_ ? [E(R)] : (a = E(R), [v(R), a, v(a)])),
                        H = "none" !== N;
                    !A && H && W.push(...(s = d(R), u = function(e, t, n) {
                        switch (e) {
                            case "top":
                            case "bottom":
                                if (n) return t ? b : y;
                                return t ? y : b;
                            case "left":
                            case "right":
                                return t ? w : x;
                            default:
                                return []
                        }
                    }(f(R), "start" === N, z), s && (u = u.map(e => e + "-" + s), _ && (u = u.concat(u.map(v)))), u));
                    let I = [R, ...W],
                        F = await S.detectOverflow(t, D),
                        B = [],
                        U = (null == (r = m.flip) ? void 0 : r.overflows) || [];
                    if (L && B.push(F[M]), T) {
                        let e = h(p, C, z);
                        B.push(F[e[0]], F[e[1]])
                    }
                    if (U = [...U, {
                            placement: p,
                            overflows: B
                        }], !B.every(e => e <= 0)) {
                        let e = ((null == (i = m.flip) ? void 0 : i.index) || 0) + 1,
                            t = I[e];
                        if (t && ("alignment" !== T || k === g(t) || U.every(e => g(e.placement) !== k || e.overflows[0] > 0))) return {
                            data: {
                                index: e,
                                overflows: U
                            },
                            reset: {
                                placement: t
                            }
                        };
                        let n = null == (o = U.filter(e => e.overflows[0] <= 0).sort((e, t) => e.overflows[1] - t.overflows[1])[0]) ? void 0 : o.placement;
                        if (!n) switch (P) {
                            case "bestFit": {
                                let e = null == (l = U.filter(e => {
                                    if (H) {
                                        let t = g(e.placement);
                                        return t === k || "y" === t
                                    }
                                    return !0
                                }).map(e => [e.placement, e.overflows.filter(e => e > 0).reduce((e, t) => e + t, 0)]).sort((e, t) => e[1] - t[1])[0]) ? void 0 : l[0];
                                e && (n = e);
                                break
                            }
                            case "initialPlacement":
                                n = R
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
                            placement: s,
                            rects: u,
                            platform: p,
                            elements: m
                        } = t,
                        {
                            apply: h = () => {},
                            ...v
                        } = c(e, t),
                        y = await p.detectOverflow(t, v),
                        b = f(s),
                        w = d(s),
                        x = "y" === g(s),
                        {
                            width: E,
                            height: C
                        } = u.floating;
                    "top" === b || "bottom" === b ? (l = b, a = w === (await (null == p.isRTL ? void 0 : p.isRTL(m.floating)) ? "start" : "end") ? "left" : "right") : (a = b, l = "end" === w ? "top" : "bottom");
                    let R = C - y.top - y.bottom,
                        S = E - y.left - y.right,
                        O = i(C - y[l], R),
                        L = i(E - y[a], S),
                        T = !t.middlewareData.shift,
                        A = O,
                        P = L;
                    if (null != (n = t.middlewareData.shift) && n.enabled.x && (P = S), null != (r = t.middlewareData.shift) && r.enabled.y && (A = R), T && !w) {
                        let e = o(y.left, 0),
                            t = o(y.right, 0),
                            n = o(y.top, 0),
                            r = o(y.bottom, 0);
                        x ? P = E - 2 * (0 !== e || 0 !== t ? e + t : o(y.left, y.right)) : A = C - 2 * (0 !== n || 0 !== r ? n + r : o(y.top, y.bottom))
                    }
                    await h({
                        ...t,
                        availableWidth: P,
                        availableHeight: A
                    });
                    let N = await p.getDimensions(m.floating);
                    return E !== N.width || C !== N.height ? {
                        reset: {
                            rects: !0
                        }
                    } : {}
                }
            }
        },
        eb = function(e) {
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
                            let e = T(await r.detectOverflow(t, {
                                ...o,
                                elementContext: "reference"
                            }), n.reference);
                            return {
                                data: {
                                    referenceHiddenOffsets: e,
                                    referenceHidden: A(e)
                                }
                            }
                        }
                        case "escaped": {
                            let e = T(await r.detectOverflow(t, {
                                ...o,
                                altBoundary: !0
                            }), n.floating);
                            return {
                                data: {
                                    escapedOffsets: e,
                                    escaped: A(e)
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
                    placement: l,
                    rects: a,
                    platform: s,
                    elements: u,
                    middlewareData: f
                } = t, {
                    element: h,
                    padding: v = 0
                } = c(e, t) || {};
                if (null == h) return {};
                let y = C(v),
                    b = {
                        x: n,
                        y: r
                    },
                    w = p(g(l)),
                    x = m(w),
                    E = await s.getDimensions(h),
                    R = "y" === w,
                    S = R ? "clientHeight" : "clientWidth",
                    O = a.reference[x] + a.reference[w] - b[w] - a.floating[x],
                    L = b[w] - a.reference[w],
                    T = await (null == s.getOffsetParent ? void 0 : s.getOffsetParent(h)),
                    A = T ? T[S] : 0;
                A && await (null == s.isElement ? void 0 : s.isElement(T)) || (A = u.floating[S] || a.floating[x]);
                let P = A / 2 - E[x] / 2 - 1,
                    N = i(y[R ? "top" : "left"], P),
                    _ = i(y[R ? "bottom" : "right"], P),
                    D = A - E[x] - _,
                    M = A / 2 - E[x] / 2 + (O / 2 - L / 2),
                    k = o(N, i(M, D)),
                    j = !f.arrow && null != d(l) && M !== k && a.reference[x] / 2 - (M < N ? N : _) - E[x] / 2 < 0,
                    z = j ? M < N ? M - N : M - D : 0;
                return {
                    [w]: b[w] + z,
                    data: {
                        [w]: k,
                        centerOffset: M - k - z,
                        ...j && {
                            alignmentOffset: z
                        }
                    },
                    reset: j
                }
            }
        }),
        ex = function(e) {
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
                        crossAxis: u = !0
                    } = c(e, t), d = {
                        x: n,
                        y: r
                    }, m = g(i), h = p(m), v = d[h], y = d[m], b = c(a, t), w = "number" == typeof b ? {
                        mainAxis: b,
                        crossAxis: 0
                    } : {
                        mainAxis: 0,
                        crossAxis: 0,
                        ...b
                    };
                    if (s) {
                        let e = "y" === h ? "height" : "width",
                            t = o.reference[h] - o.floating[e] + w.mainAxis,
                            n = o.reference[h] + o.reference[e] - w.mainAxis;
                        v < t ? v = t : v > n && (v = n)
                    }
                    if (u) {
                        var x, E;
                        let e = "y" === h ? "width" : "height",
                            t = N.has(f(i)),
                            n = o.reference[m] - o.floating[e] + (t && (null == (x = l.offset) ? void 0 : x[m]) || 0) + (t ? 0 : w.crossAxis),
                            r = o.reference[m] + o.reference[e] + (t ? 0 : (null == (E = l.offset) ? void 0 : E[m]) || 0) - (t ? w.crossAxis : 0);
                        y < n ? y = n : y > r && (y = r)
                    }
                    return {
                        [h]: v,
                        [m]: y
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
            return L(e, t, {
                ...i,
                platform: o
            })
        };
    e.s(["arrow", 0, ew, "autoPlacement", 0, function(e) {
        return void 0 === e && (e = {}), {
            name: "autoPlacement",
            options: e,
            async fn(t) {
                var n, i, o, l;
                let {
                    rects: a,
                    middlewareData: s,
                    placement: u,
                    platform: p,
                    elements: m
                } = t, {
                    crossAxis: g = !1,
                    alignment: y,
                    allowedPlacements: b = r,
                    autoAlignment: w = !0,
                    ...x
                } = c(e, t), E = void 0 !== y || b === r ? ((l = y || null) ? [...b.filter(e => d(e) === l), ...b.filter(e => d(e) !== l)] : b.filter(e => f(e) === e)).filter(e => !l || d(e) === l || !!w && v(e) !== e) : b, C = await p.detectOverflow(t, x), R = (null == (n = s.autoPlacement) ? void 0 : n.index) || 0, S = E[R];
                if (null == S) return {};
                let O = h(S, a, await (null == p.isRTL ? void 0 : p.isRTL(m.floating)));
                if (u !== S) return {
                    reset: {
                        placement: E[0]
                    }
                };
                let L = [C[f(S)], C[O[0]], C[O[1]]],
                    T = [...(null == (i = s.autoPlacement) ? void 0 : i.overflows) || [], {
                        placement: S,
                        overflows: L
                    }],
                    A = E[R + 1];
                if (A) return {
                    data: {
                        index: R + 1,
                        overflows: T
                    },
                    reset: {
                        placement: A
                    }
                };
                let P = T.map(e => {
                        let t = d(e.placement);
                        return [e.placement, t && g ? e.overflows.slice(0, 2).reduce((e, t) => e + t, 0) : e.overflows[0], e.overflows]
                    }).sort((e, t) => e[1] - t[1]),
                    N = (null == (o = P.filter(e => e[2].slice(0, d(e[0]) ? 2 : 3).every(e => e <= 0))[0]) ? void 0 : o[0]) || P[0][0];
                return N !== u ? {
                    data: {
                        index: R + 1,
                        overflows: T
                    },
                    reset: {
                        placement: N
                    }
                } : {}
            }
        }
    }, "autoUpdate", 0, function(e, t, n, r) {
        let l;
        void 0 === r && (r = {});
        let {
            ancestorScroll: s = !0,
            ancestorResize: u = !0,
            elementResize: c = "function" == typeof ResizeObserver,
            layoutShift: f = "function" == typeof IntersectionObserver,
            animationFrame: d = !1
        } = r, p = et(e), m = s || u ? [...p ? J(p) : [], ...t ? J(t) : []] : [];
        m.forEach(e => {
            s && e.addEventListener("scroll", n, {
                passive: !0
            }), u && e.addEventListener("resize", n)
        });
        let g = p && f ? function(e, t) {
                let n, r = null,
                    l = j(e);

                function s() {
                    var e;
                    clearTimeout(n), null == (e = r) || e.disconnect(), r = null
                }
                return ! function u(c, f) {
                    void 0 === c && (c = !1), void 0 === f && (f = 1), s();
                    let d = e.getBoundingClientRect(),
                        {
                            left: p,
                            top: m,
                            width: g,
                            height: h
                        } = d;
                    if (c || t(), !g || !h) return;
                    let v = {
                            rootMargin: -a(m) + "px " + -a(l.clientWidth - (p + g)) + "px " + -a(l.clientHeight - (m + h)) + "px " + -a(p) + "px",
                            threshold: o(0, i(1, f)) || 1
                        },
                        y = !0;

                    function b(t) {
                        let r = t[0].intersectionRatio;
                        if (r !== f) {
                            if (!y) return u();
                            r ? u(!1, r) : n = setTimeout(() => {
                                u(!1, 1e-7)
                            }, 1e3)
                        }
                        1 !== r || em(d, e.getBoundingClientRect()) || u(), y = !1
                    }
                    try {
                        r = new IntersectionObserver(b, {
                            ...v,
                            root: l.ownerDocument
                        })
                    } catch (e) {
                        r = new IntersectionObserver(b, v)
                    }
                    r.observe(e)
                }(!0), s
            }(p, n) : null,
            h = -1,
            v = null;
        c && (v = new ResizeObserver(e => {
            let [r] = e;
            r && r.target === p && v && t && (v.unobserve(t), cancelAnimationFrame(h), h = requestAnimationFrame(() => {
                var e;
                null == (e = v) || e.observe(t)
            })), n()
        }), p && !d && v.observe(p), t && v.observe(t));
        let y = d ? eo(e) : null;
        return d && function t() {
            let r = eo(e);
            y && !em(y, r) && n(), y = r, l = requestAnimationFrame(t)
        }(), n(), () => {
            var e;
            m.forEach(e => {
                s && e.removeEventListener("scroll", n), u && e.removeEventListener("resize", n)
            }), null == g || g(), null == (e = v) || e.disconnect(), v = null, d && cancelAnimationFrame(l)
        }
    }, "computePosition", 0, eE, "flip", 0, ev, "hide", 0, eb, "inline", 0, function(e) {
        return void 0 === e && (e = {}), {
            name: "inline",
            options: e,
            async fn(t) {
                let {
                    placement: n,
                    elements: r,
                    rects: l,
                    platform: a,
                    strategy: s
                } = t, {
                    padding: u = 2,
                    x: d,
                    y: p
                } = c(e, t), m = Array.from(await (null == a.getClientRects ? void 0 : a.getClientRects(r.reference)) || []), h = function(e) {
                    let t = e.slice().sort((e, t) => e.y - t.y),
                        n = [],
                        r = null;
                    for (let e = 0; e < t.length; e++) {
                        let i = t[e];
                        !r || i.y - r.y > r.height / 2 ? n.push([i]) : n[n.length - 1].push(i), r = i
                    }
                    return n.map(e => R(P(e)))
                }(m), v = R(P(m)), y = C(u), b = await a.getElementRects({
                    reference: {
                        getBoundingClientRect: function() {
                            if (2 === h.length && h[0].left > h[1].right && null != d && null != p) return h.find(e => d > e.left - y.left && d < e.right + y.right && p > e.top - y.top && p < e.bottom + y.bottom) || v;
                            if (h.length >= 2) {
                                if ("y" === g(n)) {
                                    let e = h[0],
                                        t = h[h.length - 1],
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
                                    t = o(...h.map(e => e.right)),
                                    r = i(...h.map(e => e.left)),
                                    l = h.filter(n => e ? n.left === r : n.right === t),
                                    a = l[0].top,
                                    s = l[l.length - 1].bottom;
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
                            return v
                        }
                    },
                    floating: r.floating,
                    strategy: s
                });
                return l.reference.x !== b.reference.x || l.reference.y !== b.reference.y || l.reference.width !== b.reference.width || l.reference.height !== b.reference.height ? {
                    reset: {
                        rects: b
                    }
                } : {}
            }
        }
    }, "limitShift", 0, ex, "offset", 0, eg, "shift", 0, eh, "size", 0, ey], 992486);
    var eC = e.i(416340),
        eR = e.i(149285),
        eS = "u" > typeof document ? eC.useLayoutEffect : function() {};

    function eO(e, t) {
        let n, r, i;
        if (e === t) return !0;
        if (typeof e != typeof t) return !1;
        if ("function" == typeof e && e.toString() === t.toString()) return !0;
        if (e && t && "object" == typeof e) {
            if (Array.isArray(e)) {
                if ((n = e.length) !== t.length) return !1;
                for (r = n; 0 != r--;)
                    if (!eO(e[r], t[r])) return !1;
                return !0
            }
            if ((n = (i = Object.keys(e)).length) !== Object.keys(t).length) return !1;
            for (r = n; 0 != r--;)
                if (!({}).hasOwnProperty.call(t, i[r])) return !1;
            for (r = n; 0 != r--;) {
                let n = i[r];
                if (("_owner" !== n || !e.$$typeof) && !eO(e[n], t[n])) return !1
            }
            return !0
        }
        return e != e && t != t
    }

    function eL(e) {
        return "u" < typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
    }

    function eT(e, t) {
        let n = eL(e);
        return Math.round(t * n) / n
    }

    function eA(e) {
        let t = eC.useRef(e);
        return eS(() => {
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
        let n = ev(e);
        return {
            name: n.name,
            fn: n.fn,
            options: [e, t]
        }
    }, "hide", 0, (e, t) => {
        let n = eb(e);
        return {
            name: n.name,
            fn: n.fn,
            options: [e, t]
        }
    }, "limitShift", 0, (e, t) => ({
        fn: ex(e).fn,
        options: [e, t]
    }), "offset", 0, (e, t) => {
        let n = eg(e);
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
            platform: i,
            elements: {
                reference: o,
                floating: l
            } = {},
            transform: a = !0,
            whileElementsMounted: s,
            open: u
        } = e, [c, f] = eC.useState({
            x: 0,
            y: 0,
            strategy: n,
            placement: t,
            middlewareData: {},
            isPositioned: !1
        }), [d, p] = eC.useState(r);
        eO(d, r) || p(r);
        let [m, g] = eC.useState(null), [h, v] = eC.useState(null), y = eC.useCallback(e => {
            e !== E.current && (E.current = e, g(e))
        }, []), b = eC.useCallback(e => {
            e !== C.current && (C.current = e, v(e))
        }, []), w = o || m, x = l || h, E = eC.useRef(null), C = eC.useRef(null), R = eC.useRef(c), S = null != s, O = eA(s), L = eA(i), T = eA(u), A = eC.useCallback(() => {
            if (!E.current || !C.current) return;
            let e = {
                placement: t,
                strategy: n,
                middleware: d
            };
            L.current && (e.platform = L.current), eE(E.current, C.current, e).then(e => {
                let t = {
                    ...e,
                    isPositioned: !1 !== T.current
                };
                P.current && !eO(R.current, t) && (R.current = t, eR.flushSync(() => {
                    f(t)
                }))
            })
        }, [d, t, n, L, T]);
        eS(() => {
            !1 === u && R.current.isPositioned && (R.current.isPositioned = !1, f(e => ({
                ...e,
                isPositioned: !1
            })))
        }, [u]);
        let P = eC.useRef(!1);
        eS(() => (P.current = !0, () => {
            P.current = !1
        }), []), eS(() => {
            if (w && (E.current = w), x && (C.current = x), w && x) {
                if (O.current) return O.current(w, x, A);
                A()
            }
        }, [w, x, A, O, S]);
        let N = eC.useMemo(() => ({
                reference: E,
                floating: C,
                setReference: y,
                setFloating: b
            }), [y, b]),
            _ = eC.useMemo(() => ({
                reference: w,
                floating: x
            }), [w, x]),
            D = eC.useMemo(() => {
                let e = {
                    position: n,
                    left: 0,
                    top: 0
                };
                if (!_.floating) return e;
                let t = eT(_.floating, c.x),
                    r = eT(_.floating, c.y);
                return a ? {
                    ...e,
                    transform: "translate(" + t + "px, " + r + "px)",
                    ...eL(_.floating) >= 1.5 && {
                        willChange: "transform"
                    }
                } : {
                    position: n,
                    left: t,
                    top: r
                }
            }, [n, a, _.floating, c.x, c.y]);
        return eC.useMemo(() => ({
            ...c,
            update: A,
            refs: N,
            elements: _,
            floatingStyles: D
        }), [c, A, N, _, D])
    }], 297452)
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
}, 78892, e => {
    "use strict";
    var t = e.i(416340);

    function n(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function r() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return e => {
            let r = !1,
                i = t.map(t => {
                    let i = n(t, e);
                    return r || "function" != typeof i || (r = !0), i
                });
            if (r) return () => {
                for (let e = 0; e < i.length; e++) {
                    let r = i[e];
                    "function" == typeof r ? r() : n(t[e], null)
                }
            }
        }
    }
    e.s(["composeRefs", 0, r, "useComposedRefs", 0, function() {
        for (var e = arguments.length, n = Array(e), i = 0; i < e; i++) n[i] = arguments[i];
        return t.useCallback(r(...n), n)
    }])
}, 600317, 76992, e => {
    "use strict";
    var t = e.i(416340);
    e.i(149285);
    var n = e.i(78892),
        r = e.i(221628);

    function i(e) {
        var i;
        let o, a = (i = e, (o = t.forwardRef((e, r) => {
                let {
                    children: i,
                    ...o
                } = e;
                if (t.isValidElement(i)) {
                    var l, a, s;
                    let e, u, c = (u = (e = null == (a = Object.getOwnPropertyDescriptor((l = i).props, "ref")) ? void 0 : a.get) && "isReactWarning" in e && e.isReactWarning) ? l.ref : (u = (e = null == (s = Object.getOwnPropertyDescriptor(l, "ref")) ? void 0 : s.get) && "isReactWarning" in e && e.isReactWarning) ? l.props.ref : l.props.ref || l.ref,
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
                    return i.type !== t.Fragment && (f.ref = r ? (0, n.composeRefs)(r, c) : c), t.cloneElement(i, f)
                }
                return t.Children.count(i) > 1 ? t.Children.only(null) : null
            })).displayName = "".concat(i, ".SlotClone"), o),
            s = t.forwardRef((e, n) => {
                let {
                    children: i,
                    ...o
                } = e, s = t.Children.toArray(i), u = s.find(l);
                if (u) {
                    let e = u.props.children,
                        i = s.map(n => n !== u ? n : t.Children.count(e) > 1 ? t.Children.only(null) : t.isValidElement(e) ? e.props.children : null);
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
        return s.displayName = "".concat(e, ".Slot"), s
    }
    var o = Symbol("radix.slottable");

    function l(e) {
        return t.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === o
    }
    e.s(["createSlot", 0, i], 76992);
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
    e.s(["Primitive", 0, a], 600317)
}, 23342, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(78892),
        r = e.i(221628),
        i = Symbol.for("react.lazy"),
        o = t[" use ".trim().toString()];

    function l(e) {
        var t;
        return null != e && "object" == typeof e && "$$typeof" in e && e.$$typeof === i && "_payload" in e && "object" == typeof(t = e._payload) && null !== t && "then" in t
    }

    function a(e) {
        var i;
        let a, s = (i = e, (a = t.forwardRef((e, r) => {
                let {
                    children: i,
                    ...a
                } = e;
                if (l(i) && "function" == typeof o && (i = o(i._payload)), t.isValidElement(i)) {
                    var s, u, c;
                    let e, o, l = (o = (e = null == (u = Object.getOwnPropertyDescriptor((s = i).props, "ref")) ? void 0 : u.get) && "isReactWarning" in e && e.isReactWarning) ? s.ref : (o = (e = null == (c = Object.getOwnPropertyDescriptor(s, "ref")) ? void 0 : c.get) && "isReactWarning" in e && e.isReactWarning) ? s.props.ref : s.props.ref || s.ref,
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
                        }(a, i.props);
                    return i.type !== t.Fragment && (f.ref = r ? (0, n.composeRefs)(r, l) : l), t.cloneElement(i, f)
                }
                return t.Children.count(i) > 1 ? t.Children.only(null) : null
            })).displayName = "".concat(i, ".SlotClone"), a),
            u = t.forwardRef((e, n) => {
                let {
                    children: i,
                    ...a
                } = e;
                l(i) && "function" == typeof o && (i = o(i._payload));
                let u = t.Children.toArray(i),
                    f = u.find(c);
                if (f) {
                    let e = f.props.children,
                        i = u.map(n => n !== f ? n : t.Children.count(e) > 1 ? t.Children.only(null) : t.isValidElement(e) ? e.props.children : null);
                    return (0, r.jsx)(s, {
                        ...a,
                        ref: n,
                        children: t.isValidElement(e) ? t.cloneElement(e, void 0, i) : null
                    })
                }
                return (0, r.jsx)(s, {
                    ...a,
                    ref: n,
                    children: i
                })
            });
        return u.displayName = "".concat(e, ".Slot"), u
    }
    var s = a("Slot"),
        u = Symbol("radix.slottable");

    function c(e) {
        return t.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === u
    }
    e.s(["Slot", 0, s, "createSlot", 0, a])
}, 199786, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(723570);
    t[" useEffectEvent ".trim().toString()], t[" useInsertionEffect ".trim().toString()];
    var r = t[" useInsertionEffect ".trim().toString()] || n.useLayoutEffect;
    Symbol("RADIX:SYNC_STATE"), e.s(["useControllableState", 0, function(e) {
        let {
            prop: n,
            defaultProp: i,
            onChange: o = () => {},
            caller: l
        } = e, [a, s, u] = function(e) {
            let {
                defaultProp: n,
                onChange: i
            } = e, [o, l] = t.useState(n), a = t.useRef(o), s = t.useRef(i);
            return r(() => {
                s.current = i
            }, [i]), t.useEffect(() => {
                if (a.current !== o) {
                    var e;
                    null == (e = s.current) || e.call(s, o), a.current = o
                }
            }, [o, a]), [o, l, s]
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
        let [r, i] = t.useState(void 0);
        return (0, n.useLayoutEffect)(() => {
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
}, 278862, e => {
    "use strict";
    var t = e.i(999210),
        n = e.i(640409),
        r = e.i(288354),
        i = e.i(562991),
        o = e.i(197649),
        l = e.i(416340),
        a = e.i(23342);
    let s = {
            Large: 24,
            Medium: 20,
            Small: 16,
            XSmall: 12
        },
        u = {
            Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
            Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
            Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
            XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
        },
        c = {
            Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-alert", "content-action-alert"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        f = {
            Emphasis: ["bg-action-standard", "content-action-standard"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-standard", "content-action-standard"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-standard", "content-action-standard"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        d = (0, l.forwardRef)((e, d) => {
            let {
                children: p,
                className: m,
                style: g,
                isDisabled: h = !1,
                isLoading: v = !1,
                icon: y,
                size: b = "Large",
                variant: w = "Emphasis",
                asChild: x,
                ...E
            } = e, C = (0, o.default)("foundation-web-button", h ? n.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", u[b], h ? f[w] : c[w], m), R = {
                textDecoration: "none",
                ...g
            }, S = e => l.default.createElement(l.default.Fragment, null, l.default.createElement(t.StateLayer, null), v && l.default.createElement("div", {
                "aria-hidden": "true",
                className: "absolute flex"
            }, l.default.createElement(r.LoadingSpinner, {
                width: s[b],
                height: s[b]
            })), l.default.createElement("span", {
                className: (0, o.default)("flex items-center min-width-0", "Large" === b || "Medium" === b ? "gap-small" : "gap-xsmall", v && "invisible")
            }, y && l.default.createElement(i.Icon, {
                name: y,
                size: b
            }), l.default.createElement("span", {
                className: "padding-y-xsmall text-truncate-end text-no-wrap"
            }, e)));
            if (x) {
                let {
                    as: e,
                    ...t
                } = E, n = l.default.Children.only(p);
                return l.default.createElement(a.Slot, {
                    ref: d,
                    ...t,
                    className: C,
                    style: R,
                    "aria-disabled": h || void 0
                }, l.default.cloneElement(n, {}, S(n.props.children)))
            }
            if ("a" === E.as) {
                let {
                    as: e,
                    href: t,
                    ...n
                } = E;
                return l.default.createElement("a", {
                    ref: d,
                    ...n,
                    "aria-disabled": h,
                    href: h ? void 0 : t,
                    className: C,
                    style: R
                }, S(p))
            }
            let {
                as: O,
                ...L
            } = E;
            return l.default.createElement("button", {
                ref: d,
                type: "button",
                ...L,
                disabled: h,
                className: C,
                style: R
            }, S(p))
        });
    e.s(["Button", 0, d])
}, 562991, e => {
    "use strict";
    var t = e.i(197649),
        n = e.i(416340);
    let r = {
            XSmall: "size-[var(--icon-size-xsmall)]",
            Small: "size-[var(--icon-size-small)]",
            Medium: "size-[var(--icon-size-medium)]",
            Large: "size-[var(--icon-size-large)]",
            XLarge: "size-[var(--icon-size-xlarge)]",
            XXLarge: "size-[var(--icon-size-xxlarge)]"
        },
        i = n.default.forwardRef((e, i) => {
            let {
                name: o,
                size: l = "Medium",
                className: a,
                children: s,
                ...u
            } = e;
            return n.default.createElement("span", {
                ref: i,
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.default)("grow-0 shrink-0 basis-auto icon", o, r[l], a),
                ...u
            })
        });
    i.displayName = "Icon", e.s(["Icon", 0, i])
}, 489098, e => {
    "use strict";
    var t = e.i(999210),
        n = e.i(640409),
        r = e.i(197649),
        i = e.i(416340),
        o = e.i(23342);
    let l = {
            Large: "size-1200",
            Medium: "size-1000",
            Small: "size-800",
            XSmall: "size-600"
        },
        a = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-700"
        },
        s = {
            Large: {
                circular: "radius-circle",
                square: "radius-medium"
            },
            Medium: {
                circular: "radius-circle",
                square: "radius-medium"
            },
            Small: {
                circular: "radius-circle",
                square: "radius-medium"
            },
            XSmall: {
                circular: "radius-circle",
                square: "radius-small"
            }
        },
        u = {
            Emphasis: "bg-action-emphasis",
            Standard: "bg-action-standard",
            Alert: "bg-action-alert",
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-0"
        },
        c = {
            Emphasis: "bg-action-standard",
            Standard: "bg-action-standard",
            Alert: "bg-action-standard",
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-0"
        },
        f = {
            Emphasis: "bg-action-emphasis",
            Standard: "bg-action-standard",
            Alert: "bg-action-standard",
            Utility: "bg-shift-300",
            OverMedia: "bg-over-media-0"
        },
        d = {
            Default: {
                Emphasis: "content-action-emphasis",
                Standard: "content-action-standard",
                Alert: "content-action-alert",
                Utility: "content-emphasis",
                OverMedia: "content-emphasis"
            },
            Inverse: {
                Emphasis: "content-inverse-action-emphasis",
                Standard: "content-inverse-action-standard",
                Alert: "content-inverse-action-alert",
                Utility: "content-inverse-emphasis",
                OverMedia: "content-inverse-emphasis"
            }
        },
        p = {
            Default: {
                Emphasis: "content-action-standard",
                Standard: "content-action-standard",
                Alert: "content-action-standard",
                Utility: "content-emphasis",
                OverMedia: "content-emphasis"
            },
            Inverse: {
                Emphasis: "content-inverse-action-standard",
                Standard: "content-inverse-action-standard",
                Alert: "content-inverse-action-standard",
                Utility: "content-inverse-emphasis",
                OverMedia: "content-inverse-emphasis"
            }
        },
        m = (0, i.forwardRef)((e, m) => {
            let g, {
                className: h,
                icon: v,
                ariaLabel: y,
                isDisabled: b = !1,
                isCircular: w = !1,
                isSelected: x = !1,
                size: E = "Large",
                variant: C = "Emphasis",
                iconColor: R = "Default",
                asChild: S,
                children: O,
                ...L
            } = e;
            g = b ? c[C] : x ? f[C] : u[C];
            let T = (0, r.default)("foundation-web-icon-button", b ? n.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", l[E], s[E][w ? "circular" : "square"], g, h),
                A = i.default.createElement(i.default.Fragment, null, i.default.createElement(t.StateLayer, null), i.default.createElement("span", {
                    className: (0, r.default)("icon", v, a[E], b ? p[R][C] : d[R][C])
                }));
            if (S) {
                let {
                    as: e,
                    ...t
                } = L, n = i.default.Children.only(O);
                return i.default.createElement(o.Slot, {
                    ref: m,
                    ...t,
                    className: T,
                    "aria-label": y,
                    "aria-disabled": b || void 0
                }, i.default.cloneElement(n, {}, A))
            }
            if ("a" === L.as) {
                let {
                    as: e,
                    href: t,
                    ...n
                } = L;
                return i.default.createElement("a", {
                    ref: m,
                    ...n,
                    "aria-label": y,
                    "aria-disabled": b,
                    href: b ? void 0 : t,
                    className: T
                }, A)
            }
            let {
                as: P,
                ...N
            } = L;
            return i.default.createElement("button", {
                ref: m,
                type: "button",
                ...N,
                "aria-label": y,
                disabled: b,
                className: T
            }, A)
        });
    e.s(["IconButton", 0, m])
}, 508019, 989665, e => {
    "use strict";
    var t = e.i(766876),
        n = e.i(197649),
        r = e.i(416340),
        i = e.i(357716),
        o = e.i(195560),
        l = e.i(978437),
        a = e.i(326301),
        s = e.i(636598),
        u = e.i(297452),
        c = e.i(992486),
        f = e.i(791634),
        d = e.i(221628),
        p = r.forwardRef((e, t) => {
            let {
                children: n,
                width: r = 10,
                height: i = 5,
                ...o
            } = e;
            return (0, d.jsx)(f.Primitive.svg, {
                ...o,
                ref: t,
                width: r,
                height: i,
                viewBox: "0 0 30 10",
                preserveAspectRatio: "none",
                children: e.asChild ? n : (0, d.jsx)("polygon", {
                    points: "0,0 30,0 15,10"
                })
            })
        });
    p.displayName = "Arrow";
    var m = e.i(448970),
        g = e.i(993032),
        h = "Popper",
        [v, y] = (0, l.createContextScope)(h),
        [b, w] = v(h),
        x = e => {
            let {
                __scopePopper: t,
                children: n
            } = e, [i, o] = r.useState(null);
            return (0, d.jsx)(b, {
                scope: t,
                anchor: i,
                onAnchorChange: o,
                children: n
            })
        };
    x.displayName = h;
    var E = "PopperAnchor",
        C = r.forwardRef((e, t) => {
            let {
                __scopePopper: n,
                virtualRef: i,
                ...l
            } = e, a = w(E, n), s = r.useRef(null), u = (0, o.useComposedRefs)(t, s);
            return r.useEffect(() => {
                a.onAnchorChange((null == i ? void 0 : i.current) || s.current)
            }), i ? null : (0, d.jsx)(f.Primitive.div, {
                ...l,
                ref: u
            })
        });
    C.displayName = E;
    var R = "PopperContent",
        [S, O] = v(R),
        L = r.forwardRef((e, t) => {
            var n, i, l, a, s, p, h, v;
            let {
                __scopePopper: y,
                side: b = "bottom",
                sideOffset: x = 0,
                align: E = "center",
                alignOffset: C = 0,
                arrowPadding: O = 0,
                avoidCollisions: L = !0,
                collisionBoundary: T = [],
                collisionPadding: A = 0,
                sticky: P = "partial",
                hideWhenDetached: M = !1,
                updatePositionStrategy: k = "optimized",
                onPlaced: j,
                ...z
            } = e, W = w(R, y), [H, I] = r.useState(null), F = (0, o.useComposedRefs)(t, e => I(e)), [B, U] = r.useState(null), V = function(e) {
                let [t, n] = r.useState(void 0);
                return (0, g.useLayoutEffect)(() => {
                    if (e) {
                        n({
                            width: e.offsetWidth,
                            height: e.offsetHeight
                        });
                        let t = new ResizeObserver(t => {
                            let r, i;
                            if (!Array.isArray(t) || !t.length) return;
                            let o = t[0];
                            if ("borderBoxSize" in o) {
                                let e = o.borderBoxSize,
                                    t = Array.isArray(e) ? e[0] : e;
                                r = t.inlineSize, i = t.blockSize
                            } else r = e.offsetWidth, i = e.offsetHeight;
                            n({
                                width: r,
                                height: i
                            })
                        });
                        return t.observe(e, {
                            box: "border-box"
                        }), () => t.unobserve(e)
                    }
                    n(void 0)
                }, [e]), t
            }(B), X = null != (n = null == V ? void 0 : V.width) ? n : 0, $ = null != (i = null == V ? void 0 : V.height) ? i : 0, Y = "number" == typeof A ? A : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...A
            }, q = Array.isArray(T) ? T : [T], G = q.length > 0, K = {
                padding: Y,
                boundary: q.filter(N),
                altBoundary: G
            }, {
                refs: Z,
                floatingStyles: J,
                placement: Q,
                isPositioned: ee,
                middlewareData: et
            } = (0, u.useFloating)({
                strategy: "fixed",
                placement: b + ("center" !== E ? "-" + E : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return (0, c.autoUpdate)(...t, {
                        animationFrame: "always" === k
                    })
                },
                elements: {
                    reference: W.anchor
                },
                middleware: [(0, u.offset)({
                    mainAxis: x + $,
                    alignmentAxis: C
                }), L && (0, u.shift)({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === P ? (0, u.limitShift)() : void 0,
                    ...K
                }), L && (0, u.flip)({
                    ...K
                }), (0, u.size)({
                    ...K,
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
                }), B && (0, u.arrow)({
                    element: B,
                    padding: O
                }), _({
                    arrowWidth: X,
                    arrowHeight: $
                }), M && (0, u.hide)({
                    strategy: "referenceHidden",
                    ...K
                })]
            }), [en, er] = D(Q), ei = (0, m.useCallbackRef)(j);
            (0, g.useLayoutEffect)(() => {
                ee && (null == ei || ei())
            }, [ee, ei]);
            let eo = null == (l = et.arrow) ? void 0 : l.x,
                el = null == (a = et.arrow) ? void 0 : a.y,
                ea = (null == (s = et.arrow) ? void 0 : s.centerOffset) !== 0,
                [es, eu] = r.useState();
            return (0, g.useLayoutEffect)(() => {
                H && eu(window.getComputedStyle(H).zIndex)
            }, [H]), (0, d.jsx)("div", {
                ref: Z.setFloating,
                "data-radix-popper-content-wrapper": "",
                style: {
                    ...J,
                    transform: ee ? J.transform : "translate(0, -200%)",
                    minWidth: "max-content",
                    zIndex: es,
                    "--radix-popper-transform-origin": [null == (p = et.transformOrigin) ? void 0 : p.x, null == (h = et.transformOrigin) ? void 0 : h.y].join(" "),
                    ...(null == (v = et.hide) ? void 0 : v.referenceHidden) && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, d.jsx)(S, {
                    scope: y,
                    placedSide: en,
                    onArrowChange: U,
                    arrowX: eo,
                    arrowY: el,
                    shouldHideArrow: ea,
                    children: (0, d.jsx)(f.Primitive.div, {
                        "data-side": en,
                        "data-align": er,
                        ...z,
                        ref: F,
                        style: {
                            ...z.style,
                            animation: ee ? void 0 : "none"
                        }
                    })
                })
            })
        });
    L.displayName = R;
    var T = "PopperArrow",
        A = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        P = r.forwardRef(function(e, t) {
            let {
                __scopePopper: n,
                ...r
            } = e, i = O(T, n), o = A[i.placedSide];
            return (0, d.jsx)("span", {
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
                children: (0, d.jsx)(p, {
                    ...r,
                    ref: t,
                    style: {
                        ...r.style,
                        display: "block"
                    }
                })
            })
        });

    function N(e) {
        return null !== e
    }
    P.displayName = T;
    var _ = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            var n, r, i, o, l;
            let {
                placement: a,
                rects: s,
                middlewareData: u
            } = t, c = (null == (i = u.arrow) ? void 0 : i.centerOffset) !== 0, f = c ? 0 : e.arrowWidth, d = c ? 0 : e.arrowHeight, [p, m] = D(a), g = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [m], h = (null != (n = null == (o = u.arrow) ? void 0 : o.x) ? n : 0) + f / 2, v = (null != (r = null == (l = u.arrow) ? void 0 : l.y) ? r : 0) + d / 2, y = "", b = "";
            return "bottom" === p ? (y = c ? g : "".concat(h, "px"), b = "".concat(-d, "px")) : "top" === p ? (y = c ? g : "".concat(h, "px"), b = "".concat(s.floating.height + d, "px")) : "right" === p ? (y = "".concat(-d, "px"), b = c ? g : "".concat(v, "px")) : "left" === p && (y = "".concat(s.floating.width + d, "px"), b = c ? g : "".concat(v, "px")), {
                data: {
                    x: y,
                    y: b
                }
            }
        }
    });

    function D(e) {
        let [t, n = "center"] = e.split("-");
        return [t, n]
    }
    var M = e.i(149285),
        k = r.forwardRef((e, t) => {
            var n, i;
            let {
                container: o,
                ...l
            } = e, [a, s] = r.useState(!1);
            (0, g.useLayoutEffect)(() => s(!0), []);
            let u = o || a && (null == (i = globalThis) || null == (n = i.document) ? void 0 : n.body);
            return u ? M.default.createPortal((0, d.jsx)(f.Primitive.div, {
                ...l,
                ref: t
            }), u) : null
        });
    k.displayName = "Portal";
    var j = e => {
        var t, n, i;
        let l, a, {
                present: s,
                children: u
            } = e,
            c = function(e) {
                var t, n;
                let [i, o] = r.useState(), l = r.useRef({}), a = r.useRef(e), s = r.useRef("none"), [u, c] = (t = e ? "mounted" : "unmounted", n = {
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
                    let e = z(l.current);
                    s.current = "mounted" === u ? e : "none"
                }, [u]), (0, g.useLayoutEffect)(() => {
                    let t = l.current,
                        n = a.current;
                    if (n !== e) {
                        let r = s.current,
                            i = z(t);
                        e ? c("MOUNT") : "none" === i || (null == t ? void 0 : t.display) === "none" ? c("UNMOUNT") : n && r !== i ? c("ANIMATION_OUT") : c("UNMOUNT"), a.current = e
                    }
                }, [e, c]), (0, g.useLayoutEffect)(() => {
                    if (i) {
                        var e;
                        let t, n = null != (e = i.ownerDocument.defaultView) ? e : window,
                            r = e => {
                                let r = z(l.current).includes(e.animationName);
                                if (e.target === i && r && (c("ANIMATION_END"), !a.current)) {
                                    let e = i.style.animationFillMode;
                                    i.style.animationFillMode = "forwards", t = n.setTimeout(() => {
                                        "forwards" === i.style.animationFillMode && (i.style.animationFillMode = e)
                                    })
                                }
                            },
                            o = e => {
                                e.target === i && (s.current = z(l.current))
                            };
                        return i.addEventListener("animationstart", o), i.addEventListener("animationcancel", r), i.addEventListener("animationend", r), () => {
                            n.clearTimeout(t), i.removeEventListener("animationstart", o), i.removeEventListener("animationcancel", r), i.removeEventListener("animationend", r)
                        }
                    }
                    c("ANIMATION_END")
                }, [i, c]), {
                    isPresent: ["mounted", "unmountSuspended"].includes(u),
                    ref: r.useCallback(e => {
                        e && (l.current = getComputedStyle(e)), o(e)
                    }, [])
                }
            }(s),
            f = "function" == typeof u ? u({
                present: c.isPresent
            }) : r.Children.only(u),
            d = (0, o.useComposedRefs)(c.ref, (a = (l = null == (n = Object.getOwnPropertyDescriptor((t = f).props, "ref")) ? void 0 : n.get) && "isReactWarning" in l && l.isReactWarning) ? t.ref : (a = (l = null == (i = Object.getOwnPropertyDescriptor(t, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? t.props.ref : t.props.ref || t.ref);
        return "function" == typeof u || c.isPresent ? r.cloneElement(f, {
            ref: d
        }) : null
    };

    function z(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    j.displayName = "Presence";
    var W = e.i(362496),
        H = r.forwardRef((e, t) => (0, d.jsx)(f.Primitive.span, {
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
    H.displayName = "VisuallyHidden";
    var [I, F] = (0, l.createContextScope)("Tooltip", [y]), B = y(), U = "TooltipProvider", V = "tooltip.open", [X, $] = I(U), Y = e => {
        let {
            __scopeTooltip: t,
            delayDuration: n = 700,
            skipDelayDuration: i = 300,
            disableHoverableContent: o = !1,
            children: l
        } = e, [a, s] = r.useState(!0), u = r.useRef(!1), c = r.useRef(0);
        return r.useEffect(() => {
            let e = c.current;
            return () => window.clearTimeout(e)
        }, []), (0, d.jsx)(X, {
            scope: t,
            isOpenDelayed: a,
            delayDuration: n,
            onOpen: r.useCallback(() => {
                window.clearTimeout(c.current), s(!1)
            }, []),
            onClose: r.useCallback(() => {
                window.clearTimeout(c.current), c.current = window.setTimeout(() => s(!0), i)
            }, [i]),
            isPointerInTransitRef: u,
            onPointerInTransitChange: r.useCallback(e => {
                u.current = e
            }, []),
            disableHoverableContent: o,
            children: l
        })
    };
    Y.displayName = U;
    var q = "Tooltip",
        [G, K] = I(q),
        Z = e => {
            let {
                __scopeTooltip: t,
                children: n,
                open: i,
                defaultOpen: o = !1,
                onOpenChange: l,
                disableHoverableContent: a,
                delayDuration: u
            } = e, c = $(q, e.__scopeTooltip), f = B(t), [p, g] = r.useState(null), h = (0, s.useId)(), v = r.useRef(0), y = null != a ? a : c.disableHoverableContent, b = null != u ? u : c.delayDuration, w = r.useRef(!1), [E = !1, C] = function(e) {
                let {
                    prop: t,
                    defaultProp: n,
                    onChange: i = () => {}
                } = e, [o, l] = function(e) {
                    let {
                        defaultProp: t,
                        onChange: n
                    } = e, i = r.useState(t), [o] = i, l = r.useRef(o), a = (0, m.useCallbackRef)(n);
                    return r.useEffect(() => {
                        l.current !== o && (a(o), l.current = o)
                    }, [o, l, a]), i
                }({
                    defaultProp: n,
                    onChange: i
                }), a = void 0 !== t, s = a ? t : o, u = (0, m.useCallbackRef)(i);
                return [s, r.useCallback(e => {
                    if (a) {
                        let n = "function" == typeof e ? e(t) : e;
                        n !== t && u(n)
                    } else l(e)
                }, [a, t, l, u])]
            }({
                prop: i,
                defaultProp: o,
                onChange: e => {
                    e ? (c.onOpen(), document.dispatchEvent(new CustomEvent(V))) : c.onClose(), null == l || l(e)
                }
            }), R = r.useMemo(() => E ? w.current ? "delayed-open" : "instant-open" : "closed", [E]), S = r.useCallback(() => {
                window.clearTimeout(v.current), v.current = 0, w.current = !1, C(!0)
            }, [C]), O = r.useCallback(() => {
                window.clearTimeout(v.current), v.current = 0, C(!1)
            }, [C]), L = r.useCallback(() => {
                window.clearTimeout(v.current), v.current = window.setTimeout(() => {
                    w.current = !0, C(!0), v.current = 0
                }, b)
            }, [b, C]);
            return r.useEffect(() => () => {
                v.current && (window.clearTimeout(v.current), v.current = 0)
            }, []), (0, d.jsx)(x, {
                ...f,
                children: (0, d.jsx)(G, {
                    scope: t,
                    contentId: h,
                    open: E,
                    stateAttribute: R,
                    trigger: p,
                    onTriggerChange: g,
                    onTriggerEnter: r.useCallback(() => {
                        c.isOpenDelayed ? L() : S()
                    }, [c.isOpenDelayed, L, S]),
                    onTriggerLeave: r.useCallback(() => {
                        y ? O() : (window.clearTimeout(v.current), v.current = 0)
                    }, [O, y]),
                    onOpen: S,
                    onClose: O,
                    disableHoverableContent: y,
                    children: n
                })
            })
        };
    Z.displayName = q;
    var J = "TooltipTrigger",
        Q = r.forwardRef((e, t) => {
            let {
                __scopeTooltip: n,
                ...l
            } = e, a = K(J, n), s = $(J, n), u = B(n), c = r.useRef(null), p = (0, o.useComposedRefs)(t, c, a.onTriggerChange), m = r.useRef(!1), g = r.useRef(!1), h = r.useCallback(() => m.current = !1, []);
            return r.useEffect(() => () => document.removeEventListener("pointerup", h), [h]), (0, d.jsx)(C, {
                asChild: !0,
                ...u,
                children: (0, d.jsx)(f.Primitive.button, {
                    "aria-describedby": a.open ? a.contentId : void 0,
                    "data-state": a.stateAttribute,
                    ...l,
                    ref: p,
                    onPointerMove: (0, i.composeEventHandlers)(e.onPointerMove, e => {
                        "touch" !== e.pointerType && (g.current || s.isPointerInTransitRef.current || (a.onTriggerEnter(), g.current = !0))
                    }),
                    onPointerLeave: (0, i.composeEventHandlers)(e.onPointerLeave, () => {
                        a.onTriggerLeave(), g.current = !1
                    }),
                    onPointerDown: (0, i.composeEventHandlers)(e.onPointerDown, () => {
                        m.current = !0, document.addEventListener("pointerup", h, {
                            once: !0
                        })
                    }),
                    onFocus: (0, i.composeEventHandlers)(e.onFocus, () => {
                        m.current || a.onOpen()
                    }),
                    onBlur: (0, i.composeEventHandlers)(e.onBlur, a.onClose),
                    onClick: (0, i.composeEventHandlers)(e.onClick, a.onClose)
                })
            })
        });
    Q.displayName = J;
    var ee = "TooltipPortal",
        [et, en] = I(ee, {
            forceMount: void 0
        }),
        er = e => {
            let {
                __scopeTooltip: t,
                forceMount: n,
                children: r,
                container: i
            } = e, o = K(ee, t);
            return (0, d.jsx)(et, {
                scope: t,
                forceMount: n,
                children: (0, d.jsx)(j, {
                    present: n || o.open,
                    children: (0, d.jsx)(k, {
                        asChild: !0,
                        container: i,
                        children: r
                    })
                })
            })
        };
    er.displayName = ee;
    var ei = "TooltipContent",
        eo = r.forwardRef((e, t) => {
            let n = en(ei, e.__scopeTooltip),
                {
                    forceMount: r = n.forceMount,
                    side: i = "top",
                    ...o
                } = e,
                l = K(ei, e.__scopeTooltip);
            return (0, d.jsx)(j, {
                present: r || l.open,
                children: l.disableHoverableContent ? (0, d.jsx)(eu, {
                    side: i,
                    ...o,
                    ref: t
                }) : (0, d.jsx)(el, {
                    side: i,
                    ...o,
                    ref: t
                })
            })
        }),
        el = r.forwardRef((e, t) => {
            let n = K(ei, e.__scopeTooltip),
                i = $(ei, e.__scopeTooltip),
                l = r.useRef(null),
                a = (0, o.useComposedRefs)(t, l),
                [s, u] = r.useState(null),
                {
                    trigger: c,
                    onClose: f
                } = n,
                p = l.current,
                {
                    onPointerInTransitChange: m
                } = i,
                g = r.useCallback(() => {
                    u(null), m(!1)
                }, [m]),
                h = r.useCallback((e, t) => {
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
                    }(n))), m(!0)
                }, [m]);
            return r.useEffect(() => () => g(), [g]), r.useEffect(() => {
                if (c && p) {
                    let e = e => h(e, p),
                        t = e => h(e, c);
                    return c.addEventListener("pointerleave", e), p.addEventListener("pointerleave", t), () => {
                        c.removeEventListener("pointerleave", e), p.removeEventListener("pointerleave", t)
                    }
                }
            }, [c, p, h, g]), r.useEffect(() => {
                if (s) {
                    let e = e => {
                        let t = e.target,
                            n = {
                                x: e.clientX,
                                y: e.clientY
                            },
                            r = (null == c ? void 0 : c.contains(t)) || (null == p ? void 0 : p.contains(t)),
                            i = ! function(e, t) {
                                let {
                                    x: n,
                                    y: r
                                } = e, i = !1;
                                for (let e = 0, o = t.length - 1; e < t.length; o = e++) {
                                    let l = t[e].x,
                                        a = t[e].y,
                                        s = t[o].x,
                                        u = t[o].y;
                                    a > r != u > r && n < (s - l) * (r - a) / (u - a) + l && (i = !i)
                                }
                                return i
                            }(n, s);
                        r ? g() : i && (g(), f())
                    };
                    return document.addEventListener("pointermove", e), () => document.removeEventListener("pointermove", e)
                }
            }, [c, p, s, f, g]), (0, d.jsx)(eu, {
                ...e,
                ref: a
            })
        }),
        [ea, es] = I(q, {
            isInside: !1
        }),
        eu = r.forwardRef((e, t) => {
            let {
                __scopeTooltip: n,
                children: i,
                "aria-label": o,
                onEscapeKeyDown: l,
                onPointerDownOutside: s,
                ...u
            } = e, c = K(ei, n), f = B(n), {
                onClose: p
            } = c;
            return r.useEffect(() => (document.addEventListener(V, p), () => document.removeEventListener(V, p)), [p]), r.useEffect(() => {
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
            }, [c.trigger, p]), (0, d.jsx)(a.DismissableLayer, {
                asChild: !0,
                disableOutsidePointerEvents: !1,
                onEscapeKeyDown: l,
                onPointerDownOutside: s,
                onFocusOutside: e => e.preventDefault(),
                onDismiss: p,
                children: (0, d.jsxs)(L, {
                    "data-state": c.stateAttribute,
                    ...f,
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
                    children: [(0, d.jsx)(W.Slottable, {
                        children: i
                    }), (0, d.jsx)(ea, {
                        scope: n,
                        isInside: !0,
                        children: (0, d.jsx)(H, {
                            id: c.contentId,
                            role: "tooltip",
                            children: o || i
                        })
                    })]
                })
            })
        });
    eo.displayName = ei;
    var ec = "TooltipArrow",
        ef = r.forwardRef((e, t) => {
            let {
                __scopeTooltip: n,
                ...r
            } = e, i = B(n);
            return es(ec, n).isInside ? null : (0, d.jsx)(P, {
                ...i,
                ...r,
                ref: t
            })
        });
    ef.displayName = ec, e.s(["Arrow", 0, ef, "Content", 0, eo, "Portal", 0, er, "Provider", 0, Y, "Root", 0, Z, "Trigger", 0, Q], 989665), e.s(["Tooltip", 0, function(e) {
        let {
            position: i,
            hasBeak: o = !0,
            title: l,
            description: a,
            ariaLabel: s,
            delayDurationMs: u = 500,
            children: c,
            open: f,
            onOpenChange: d,
            contentClassName: p
        } = e, [m, g] = i.split("-"), h = null != s ? s : "string" == typeof l && null == a ? l : void 0;
        return r.createElement(Y, {
            delayDuration: u
        }, r.createElement(Z, {
            open: f,
            onOpenChange: d
        }, c, r.createElement(er, null, r.createElement(eo, {
            side: m,
            align: g,
            "aria-label": h,
            className: (0, n.default)("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", p),
            sideOffset: 5
        }, o && r.createElement(ef, {
            asChild: !0
        }, r.createElement(t.Beak, {
            className: "content-[var(--inverse-surface-0)]"
        })), r.createElement("div", {
            className: "flex flex-col text-truncate-split"
        }, r.createElement("div", {
            className: "text-caption-medium content-inverse-default"
        }, l), a && r.createElement("div", {
            className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
        }, a))))))
    }, "TooltipTrigger", 0, function(e) {
        let {
            children: t,
            asChild: n,
            className: i
        } = e;
        return r.createElement(Q, {
            asChild: n,
            className: i
        }, t)
    }], 508019)
}, 766876, 357716, 195560, 978437, 362496, 791634, 448970, 326301, 993032, 636598, e => {
    "use strict";
    var t, n, r = e.i(197649),
        i = e.i(416340);

    function o(e, t) {
        let {
            checkForDefaultPrevented: n = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(r) {
            if (null == e || e(r), !1 === n || !r.defaultPrevented) return null == t ? void 0 : t(r)
        }
    }

    function l(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function a() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        return e => {
            let n = !1,
                r = t.map(t => {
                    let r = l(t, e);
                    return n || "function" != typeof r || (n = !0), r
                });
            if (n) return () => {
                for (let e = 0; e < r.length; e++) {
                    let n = r[e];
                    "function" == typeof n ? n() : l(t[e], null)
                }
            }
        }
    }

    function s() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        return i.useCallback(a(...t), t)
    }
    e.s(["Beak", 0, function(e) {
        let {
            className: t
        } = e;
        return i.default.createElement("svg", {
            xmlns: "http://www.w3.org/2000/svg",
            width: "13",
            height: "6",
            viewBox: "0 0 13 6",
            fill: "none",
            className: (0, r.default)("block", t),
            style: {
                marginTop: -1
            }
        }, i.default.createElement("path", {
            d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
            fill: "currentColor"
        }))
    }], 766876), e.s(["composeEventHandlers", 0, o], 357716), e.s(["composeRefs", 0, a, "useComposedRefs", 0, s], 195560);
    var u = e.i(221628);
    e.s(["createContextScope", 0, function(e) {
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
                var s;
                let u = (null == a || null == (s = a[e]) ? void 0 : s[l]) || o,
                    c = i.useContext(u);
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
    }], 978437);
    var c = e.i(149285),
        f = i.forwardRef((e, t) => {
            let {
                children: n,
                ...r
            } = e, o = i.Children.toArray(n), l = o.find(m);
            if (l) {
                let e = l.props.children,
                    n = o.map(t => t !== l ? t : i.Children.count(e) > 1 ? i.Children.only(null) : i.isValidElement(e) ? e.props.children : null);
                return (0, u.jsx)(d, {
                    ...r,
                    ref: t,
                    children: i.isValidElement(e) ? i.cloneElement(e, void 0, n) : null
                })
            }
            return (0, u.jsx)(d, {
                ...r,
                ref: t,
                children: n
            })
        });
    f.displayName = "Slot";
    var d = i.forwardRef((e, t) => {
        let {
            children: n,
            ...r
        } = e;
        if (i.isValidElement(n)) {
            var o, l, s;
            let e, u, c = (u = (e = null == (l = Object.getOwnPropertyDescriptor((o = n).props, "ref")) ? void 0 : l.get) && "isReactWarning" in e && e.isReactWarning) ? o.ref : (u = (e = null == (s = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : s.get) && "isReactWarning" in e && e.isReactWarning) ? o.props.ref : o.props.ref || o.ref;
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
                ref: t ? a(t, c) : c
            })
        }
        return i.Children.count(n) > 1 ? i.Children.only(null) : null
    });
    d.displayName = "SlotClone";
    var p = e => {
        let {
            children: t
        } = e;
        return (0, u.jsx)(u.Fragment, {
            children: t
        })
    };

    function m(e) {
        return i.isValidElement(e) && e.type === p
    }
    e.s(["Slot", 0, f, "Slottable", 0, p], 362496);
    var g = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, t) => {
        let n = i.forwardRef((e, n) => {
            let {
                asChild: r,
                ...i
            } = e, o = r ? f : t;
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

    function h(e, t) {
        e && c.flushSync(() => e.dispatchEvent(t))
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
    e.s(["Primitive", 0, g, "dispatchDiscreteCustomEvent", 0, h], 791634), e.s(["useCallbackRef", 0, v], 448970);
    var y = "dismissableLayer.update",
        b = i.createContext({
            layers: new Set,
            layersWithOutsidePointerEventsDisabled: new Set,
            branches: new Set
        }),
        w = i.forwardRef((e, n) => {
            var r, l;
            let {
                disableOutsidePointerEvents: a = !1,
                onEscapeKeyDown: c,
                onPointerDownOutside: f,
                onFocusOutside: d,
                onInteractOutside: p,
                onDismiss: m,
                ...h
            } = e, w = i.useContext(b), [C, R] = i.useState(null), S = null != (r = null == C ? void 0 : C.ownerDocument) ? r : null == (l = globalThis) ? void 0 : l.document, [, O] = i.useState({}), L = s(n, e => R(e)), T = Array.from(w.layers), [A] = [...w.layersWithOutsidePointerEventsDisabled].slice(-1), P = T.indexOf(A), N = C ? T.indexOf(C) : -1, _ = w.layersWithOutsidePointerEventsDisabled.size > 0, D = N >= P, M = function(e) {
                var t;
                let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    r = v(e),
                    o = i.useRef(!1),
                    l = i.useRef(() => {});
                return i.useEffect(() => {
                    let e = e => {
                            if (e.target && !o.current) {
                                let t = function() {
                                        E("dismissableLayer.pointerDownOutside", r, i, {
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
                    n = [...w.branches].some(e => e.contains(t));
                D && !n && (null == f || f(e), null == p || p(e), e.defaultPrevented || null == m || m())
            }, S), k = function(e) {
                var t;
                let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    r = v(e),
                    o = i.useRef(!1);
                return i.useEffect(() => {
                    let e = e => {
                        e.target && !o.current && E("dismissableLayer.focusOutside", r, {
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
                ![...w.branches].some(e => e.contains(t)) && (null == d || d(e), null == p || p(e), e.defaultPrevented || null == m || m())
            }, S);
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
                N === w.layers.size - 1 && (null == c || c(e), !e.defaultPrevented && m && (e.preventDefault(), m()))
            }, S), i.useEffect(() => {
                if (C) return a && (0 === w.layersWithOutsidePointerEventsDisabled.size && (t = S.body.style.pointerEvents, S.body.style.pointerEvents = "none"), w.layersWithOutsidePointerEventsDisabled.add(C)), w.layers.add(C), x(), () => {
                    a && 1 === w.layersWithOutsidePointerEventsDisabled.size && (S.body.style.pointerEvents = t)
                }
            }, [C, S, a, w]), i.useEffect(() => () => {
                C && (w.layers.delete(C), w.layersWithOutsidePointerEventsDisabled.delete(C), x())
            }, [C, w]), i.useEffect(() => {
                let e = () => O({});
                return document.addEventListener(y, e), () => document.removeEventListener(y, e)
            }, []), (0, u.jsx)(g.div, {
                ...h,
                ref: L,
                style: {
                    pointerEvents: _ ? D ? "auto" : "none" : void 0,
                    ...e.style
                },
                onFocusCapture: o(e.onFocusCapture, k.onFocusCapture),
                onBlurCapture: o(e.onBlurCapture, k.onBlurCapture),
                onPointerDownCapture: o(e.onPointerDownCapture, M.onPointerDownCapture)
            })
        });

    function x() {
        let e = new CustomEvent(y);
        document.dispatchEvent(e)
    }

    function E(e, t, n, r) {
        let {
            discrete: i
        } = r, o = n.originalEvent.target, l = new CustomEvent(e, {
            bubbles: !1,
            cancelable: !0,
            detail: n
        });
        t && o.addEventListener(e, t, {
            once: !0
        }), i ? h(o, l) : o.dispatchEvent(l)
    }
    w.displayName = "DismissableLayer", i.forwardRef((e, t) => {
        let n = i.useContext(b),
            r = i.useRef(null),
            o = s(t, r);
        return i.useEffect(() => {
            let e = r.current;
            if (e) return n.branches.add(e), () => {
                n.branches.delete(e)
            }
        }, [n.branches]), (0, u.jsx)(g.div, {
            ...e,
            ref: o
        })
    }).displayName = "DismissableLayerBranch", e.s(["DismissableLayer", 0, w], 326301);
    var C = (null == (n = globalThis) ? void 0 : n.document) ? i.useLayoutEffect : () => {};
    e.s(["useLayoutEffect", 0, C], 993032);
    var R = i["useId".toString()] || (() => void 0),
        S = 0;
    e.s(["useId", 0, function(e) {
        let [t, n] = i.useState(R());
        return C(() => {
            e || n(e => null != e ? e : String(S++))
        }, [e]), e || (t ? "radix-".concat(t) : "")
    }], 636598)
}, 288354, e => {
    "use strict";
    var t = e.i(416340);
    e.s(["LoadingSpinner", 0, e => {
        let {
            width: n,
            height: r
        } = e;
        return t.default.createElement("svg", {
            className: "foundation-web-loading-spinner",
            width: n,
            height: r,
            viewBox: "0 0 20 20",
            fill: "none",
            xmlns: "http://www.w3.org/2000/svg"
        }, t.default.createElement("path", {
            fillRule: "evenodd",
            clipRule: "evenodd",
            fill: "currentColor",
            d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
        }))
    }])
}, 999210, e => {
    "use strict";
    var t = e.i(197649),
        n = e.i(416340);
    e.s(["StateLayer", 0, e => {
        let {
            className: r
        } = e;
        return n.default.createElement("div", {
            "aria-hidden": !0,
            "data-testid": "foundation-web-state-layer",
            className: (0, t.default)("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", r)
        })
    }, "interactable", 0, "relative clip group/interactable focus-visible:outline-focus disabled:outline-none"])
}, 640409, e => {
    "use strict";
    e.s(["disabledOpacity", 0, "opacity-[0.5]"])
}, 197649, e => {
    "use strict";

    function t() {
        for (var e, t, n = 0, r = "", i = arguments.length; n < i; n++)(e = arguments[n]) && (t = function e(t) {
            var n, r, i = "";
            if ("string" == typeof t || "number" == typeof t) i += t;
            else if ("object" == typeof t)
                if (Array.isArray(t)) {
                    var o = t.length;
                    for (n = 0; n < o; n++) t[n] && (r = e(t[n])) && (i && (i += " "), i += r)
                } else
                    for (r in t) t[r] && (i && (i += " "), i += r);
            return i
        }(e)) && (r && (r += " "), r += t);
        return r
    }
    e.s(["clsx", 0, t, "default", 0, t])
}, 678604, (e, t, n) => {
    "use strict";
    var r = e.r(416340);

    function i(e) {
        var t = "https://react.dev/errors/" + e;
        if (1 < arguments.length) {
            t += "?args[]=" + encodeURIComponent(arguments[1]);
            for (var n = 2; n < arguments.length; n++) t += "&args[]=" + encodeURIComponent(arguments[n])
        }
        return "Minified React error #" + e + "; visit " + t + " for the full message or use the non-minified dev environment for full errors and additional helpful warnings."
    }

    function o() {}
    var l = {
            d: {
                f: o,
                r: function() {
                    throw Error(i(522))
                },
                D: o,
                C: o,
                L: o,
                m: o,
                X: o,
                S: o,
                M: o
            },
            p: 0,
            findDOMNode: null
        },
        a = Symbol.for("react.portal"),
        s = r.__CLIENT_INTERNALS_DO_NOT_USE_OR_WARN_USERS_THEY_CANNOT_UPGRADE;

    function u(e, t) {
        return "font" === e ? "" : "string" == typeof t ? "use-credentials" === t ? t : "" : void 0
    }
    n.__DOM_INTERNALS_DO_NOT_USE_OR_WARN_USERS_THEY_CANNOT_UPGRADE = l, n.createPortal = function(e, t) {
        var n = 2 < arguments.length && void 0 !== arguments[2] ? arguments[2] : null;
        if (!t || 1 !== t.nodeType && 9 !== t.nodeType && 11 !== t.nodeType) throw Error(i(299));
        return function(e, t, n) {
            var r = 3 < arguments.length && void 0 !== arguments[3] ? arguments[3] : null;
            return {
                $$typeof: a,
                key: null == r ? null : "" + r,
                children: e,
                containerInfo: t,
                implementation: n
            }
        }(e, t, null, n)
    }, n.flushSync = function(e) {
        var t = s.T,
            n = l.p;
        try {
            if (s.T = null, l.p = 2, e) return e()
        } finally {
            s.T = t, l.p = n, l.d.f()
        }
    }, n.preconnect = function(e, t) {
        "string" == typeof e && (t = t ? "string" == typeof(t = t.crossOrigin) ? "use-credentials" === t ? t : "" : void 0 : null, l.d.C(e, t))
    }, n.prefetchDNS = function(e) {
        "string" == typeof e && l.d.D(e)
    }, n.preinit = function(e, t) {
        if ("string" == typeof e && t && "string" == typeof t.as) {
            var n = t.as,
                r = u(n, t.crossOrigin),
                i = "string" == typeof t.integrity ? t.integrity : void 0,
                o = "string" == typeof t.fetchPriority ? t.fetchPriority : void 0;
            "style" === n ? l.d.S(e, "string" == typeof t.precedence ? t.precedence : void 0, {
                crossOrigin: r,
                integrity: i,
                fetchPriority: o
            }) : "script" === n && l.d.X(e, {
                crossOrigin: r,
                integrity: i,
                fetchPriority: o,
                nonce: "string" == typeof t.nonce ? t.nonce : void 0
            })
        }
    }, n.preinitModule = function(e, t) {
        if ("string" == typeof e)
            if ("object" == typeof t && null !== t) {
                if (null == t.as || "script" === t.as) {
                    var n = u(t.as, t.crossOrigin);
                    l.d.M(e, {
                        crossOrigin: n,
                        integrity: "string" == typeof t.integrity ? t.integrity : void 0,
                        nonce: "string" == typeof t.nonce ? t.nonce : void 0
                    })
                }
            } else null == t && l.d.M(e)
    }, n.preload = function(e, t) {
        if ("string" == typeof e && "object" == typeof t && null !== t && "string" == typeof t.as) {
            var n = t.as,
                r = u(n, t.crossOrigin);
            l.d.L(e, n, {
                crossOrigin: r,
                integrity: "string" == typeof t.integrity ? t.integrity : void 0,
                nonce: "string" == typeof t.nonce ? t.nonce : void 0,
                type: "string" == typeof t.type ? t.type : void 0,
                fetchPriority: "string" == typeof t.fetchPriority ? t.fetchPriority : void 0,
                referrerPolicy: "string" == typeof t.referrerPolicy ? t.referrerPolicy : void 0,
                imageSrcSet: "string" == typeof t.imageSrcSet ? t.imageSrcSet : void 0,
                imageSizes: "string" == typeof t.imageSizes ? t.imageSizes : void 0,
                media: "string" == typeof t.media ? t.media : void 0
            })
        }
    }, n.preloadModule = function(e, t) {
        if ("string" == typeof e)
            if (t) {
                var n = u(t.as, t.crossOrigin);
                l.d.m(e, {
                    as: "string" == typeof t.as && "script" !== t.as ? t.as : void 0,
                    crossOrigin: n,
                    integrity: "string" == typeof t.integrity ? t.integrity : void 0
                })
            } else l.d.m(e)
    }, n.requestFormReset = function(e) {
        l.d.r(e)
    }, n.unstable_batchedUpdates = function(e, t) {
        return e(t)
    }, n.useFormState = function(e, t, n) {
        return s.H.useFormState(e, t, n)
    }, n.useFormStatus = function() {
        return s.H.useHostTransitionStatus()
    }, n.version = "19.2.6"
}, 149285, (e, t, n) => {
    "use strict";
    ! function e() {
        if ("u" > typeof __REACT_DEVTOOLS_GLOBAL_HOOK__ && "function" == typeof __REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE) try {
            __REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE(e)
        } catch (e) {
            console.error(e)
        }
    }(), t.exports = e.r(678604)
}]);

//# debugId=e2a1283f-4831-1e26-09a7-90d4c4e5a288
//# sourceMappingURL=0dbn80a2msg_1.js.map