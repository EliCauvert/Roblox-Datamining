;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "7d8e2a0b-c153-3612-2399-6d61b3aba382")
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

    function m(e) {
        return "y" === e ? "height" : "width"
    }

    function h(e) {
        let t = e[0];
        return "t" === t || "b" === t ? "y" : "x"
    }

    function v(e, t, n) {
        void 0 === n && (n = !1);
        let r = d(e),
            i = p(h(e)),
            o = m(i),
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
            l = h(t),
            a = p(h(t)),
            u = m(a),
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
    async function P(e, t) {
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
            padding: m = 0
        } = c(t, e), h = R(m), v = a[p ? "floating" === d ? "reference" : "floating" : d], g = C(await o.getClippingRect({
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
            top: (g.top - b.top + h.top) / x.y,
            bottom: (b.bottom - g.bottom + h.bottom) / x.y,
            left: (g.left - b.left + h.left) / x.x,
            right: (b.right - g.right + h.right) / x.x
        }
    }
    let S = async (e, t, n) => {
        let {
            placement: r = "bottom",
            strategy: i = "absolute",
            middleware: o = [],
            platform: l
        } = n, a = l.detectOverflow ? l : {
            ...l,
            detectOverflow: P
        }, u = await (null == l.isRTL ? void 0 : l.isRTL(t)), s = await l.getElementRects({
            reference: e,
            floating: t,
            strategy: i
        }), {
            x: c,
            y: f
        } = T(s, r, u), d = r, p = 0, m = {};
        for (let n = 0; n < o.length; n++) {
            let h = o[n];
            if (!h) continue;
            let {
                name: v,
                fn: g
            } = h, {
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
                middlewareData: m,
                rects: s,
                platform: a,
                elements: {
                    reference: e,
                    floating: t
                }
            });
            c = null != y ? y : c, f = null != w ? w : f, m[v] = {
                ...m[v],
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
            middlewareData: m
        }
    };

    function L(e, t) {
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

    function O(e) {
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
    async function D(e, t) {
        let {
            placement: n,
            platform: r,
            elements: i
        } = e, o = await (null == r.isRTL ? void 0 : r.isRTL(i.floating)), l = f(n), a = d(n), u = "y" === h(n), s = N.has(l) ? -1 : 1, p = o && u ? -1 : 1, m = c(t, e), {
            mainAxis: v,
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
        return a && "number" == typeof y && (g = "end" === a ? -1 * y : y), u ? {
            x: g * p,
            y: v * s
        } : {
            x: v * s,
            y: g * p
        }
    }

    function j() {
        return "u" > typeof window
    }

    function k(e) {
        return H(e) ? (e.nodeName || "").toLowerCase() : "#document"
    }

    function M(e) {
        var t;
        return (null == e || null == (t = e.ownerDocument) ? void 0 : t.defaultView) || window
    }

    function W(e) {
        var t;
        return null == (t = (H(e) ? e.ownerDocument : e.document) || window.document) ? void 0 : t.documentElement
    }

    function H(e) {
        return !!j() && (e instanceof Node || e instanceof M(e).Node)
    }

    function F(e) {
        return !!j() && (e instanceof Element || e instanceof M(e).Element)
    }

    function _(e) {
        return !!j() && (e instanceof HTMLElement || e instanceof M(e).HTMLElement)
    }

    function I(e) {
        return !(!j() || "u" < typeof ShadowRoot) && (e instanceof ShadowRoot || e instanceof M(e).ShadowRoot)
    }

    function B(e) {
        let {
            overflow: t,
            overflowX: n,
            overflowY: r,
            display: i
        } = K(e);
        return /auto|scroll|overlay|hidden|clip/.test(t + r + n) && "inline" !== i && "contents" !== i
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
        Y = e => !!e && "none" !== e;

    function X(e) {
        let t = F(e) ? K(e) : e;
        return Y(t.transform) || Y(t.translate) || Y(t.scale) || Y(t.rotate) || Y(t.perspective) || !$() && (Y(t.backdropFilter) || Y(t.filter)) || V.test(t.willChange || "") || U.test(t.contain || "")
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

    function Z(e) {
        return F(e) ? {
            scrollLeft: e.scrollLeft,
            scrollTop: e.scrollTop
        } : {
            scrollLeft: e.scrollX,
            scrollTop: e.scrollY
        }
    }

    function G(e) {
        if ("html" === k(e)) return e;
        let t = e.assignedSlot || e.parentNode || I(e) && e.host || W(e);
        return I(t) ? t.host : t
    }

    function J(e, t, n) {
        var r;
        void 0 === t && (t = []), void 0 === n && (n = !0);
        let i = function e(t) {
                let n = G(t);
                return q(n) ? t.ownerDocument ? t.ownerDocument.body : t.body : _(n) && B(n) ? n : e(n)
            }(e),
            o = i === (null == (r = e.ownerDocument) ? void 0 : r.body),
            l = M(i);
        if (!o) return t.concat(i, J(i, [], n));
        {
            let e = Q(l);
            return t.concat(l, l.visualViewport || [], B(i) ? i : [], e && n ? J(e) : [])
        }
    }

    function Q(e) {
        return e.parent && Object.getPrototypeOf(e.parent) ? e.frameElement : null
    }

    function ee(e) {
        let t = K(e),
            n = parseFloat(t.width) || 0,
            r = parseFloat(t.height) || 0,
            i = _(e),
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
        if (!_(t)) return u(1);
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
                i = Q(n);
            for (; i && r && t !== n;) {
                let e = en(i),
                    t = i.getBoundingClientRect(),
                    r = K(i),
                    o = t.left + (i.clientLeft + parseFloat(r.paddingLeft)) * e.x,
                    l = t.top + (i.clientTop + parseFloat(r.paddingTop)) * e.y;
                c *= e.x, f *= e.y, d *= e.x, p *= e.y, c += o, f += l, i = Q(n = M(i))
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
        let n = Z(e).scrollLeft;
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
            r = W(e), t = W(r), n = Z(r), l = r.ownerDocument.body, a = o(t.scrollWidth, t.clientWidth, l.scrollWidth, l.clientWidth), u = o(t.scrollHeight, t.clientHeight, l.scrollHeight, l.clientHeight), s = -n.scrollLeft + el(r), c = -n.scrollTop, "rtl" === K(l).direction && (s += o(t.clientWidth, l.clientWidth) - a), i = {
                width: a,
                height: u,
                x: s,
                y: c
            }
        } else if (F(t)) {
            let e, r, o, l, a, s;
            r = (e = eo(t, !0, "fixed" === n)).top + t.clientTop, o = e.left + t.clientLeft, l = _(t) ? en(t) : u(1), a = t.clientWidth * l.x, s = t.clientHeight * l.y, i = {
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
        if (!_(e) || "fixed" === K(e).position) return null;
        if (t) return t(e);
        let n = e.offsetParent;
        return W(e) === n && (n = n.ownerDocument.body), n
    }

    function ef(e, t) {
        var n;
        let r = M(e);
        if (z(e)) return r;
        if (!_(e)) {
            let t = G(e);
            for (; t && !q(t);) {
                if (F(t) && !es(t)) return t;
                t = G(t)
            }
            return r
        }
        let i = ec(e, t);
        for (; i && (n = i, /^(table|td|th)$/.test(k(n))) && es(i);) i = ec(i, t);
        return i && q(i) && es(i) && !X(i) ? r : i || function(e) {
            let t = G(e);
            for (; _(t) && !q(t);) {
                if (X(t)) return t;
                if (z(t)) break;
                t = G(t)
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
                let r = _(t),
                    i = W(t),
                    o = "fixed" === n,
                    l = eo(e, !0, o, t),
                    a = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    s = u(0);
                if (r || !r && !o)
                    if (("body" !== k(t) || B(i)) && (a = Z(t)), r) {
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
            } = e, o = "fixed" === i, l = W(r), a = !!t && z(t.floating);
            if (r === l || a && o) return n;
            let s = {
                    scrollLeft: 0,
                    scrollTop: 0
                },
                c = u(1),
                f = u(0),
                d = _(r);
            if ((d || !d && !o) && (("body" !== k(r) || B(l)) && (s = Z(r)), d)) {
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
            } = e, a = [..."clippingAncestors" === n ? z(t) ? [] : function(e, t) {
                let n = t.get(e);
                if (n) return n;
                let r = J(e, [], !1).filter(e => F(e) && "body" !== k(e)),
                    i = null,
                    o = "fixed" === K(e).position,
                    l = o ? G(e) : e;
                for (; F(l) && !q(l);) {
                    let t = K(l),
                        n = X(l);
                    n || "fixed" !== t.position || (i = null), (o ? n || i : !(!n && "static" === t.position && i && ("absolute" === i.position || "fixed" === i.position) || B(l) && !n && function e(t, n) {
                        let r = G(t);
                        return !(r === n || !F(r) || q(r)) && ("fixed" === K(r).position || e(r, n))
                    }(e, l))) ? i = t : r = r.filter(e => e !== l), l = G(l)
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

    function em(e, t) {
        return e.x === t.x && e.y === t.y && e.width === t.width && e.height === t.height
    }
    let eh = function(e) {
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
                    } = t, u = await D(t, e);
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
                        ...m
                    } = c(e, t), v = {
                        x: n,
                        y: r
                    }, g = await a.detectOverflow(t, m), y = h(f(l)), w = p(y), x = v[w], b = v[y];
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
                            middlewareData: m,
                            rects: R,
                            initialPlacement: C,
                            platform: T,
                            elements: P
                        } = t,
                        {
                            mainAxis: S = !0,
                            crossAxis: L = !0,
                            fallbackPlacements: A,
                            fallbackStrategy: O = "bestFit",
                            fallbackAxisSideDirection: N = "none",
                            flipAlignment: D = !0,
                            ...j
                        } = c(e, t);
                    if (null != (n = m.arrow) && n.alignmentOffset) return {};
                    let k = f(p),
                        M = h(C),
                        W = f(C) === C,
                        H = await (null == T.isRTL ? void 0 : T.isRTL(P.floating)),
                        F = A || (W || !D ? [E(C)] : (a = E(C), [g(C), a, g(a)])),
                        _ = "none" !== N;
                    !A && _ && F.push(...(u = d(C), s = function(e, t, n) {
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
                    }(f(C), "start" === N, H), u && (s = s.map(e => e + "-" + u), D && (s = s.concat(s.map(g)))), s));
                    let I = [C, ...F],
                        B = await T.detectOverflow(t, j),
                        z = [],
                        V = (null == (r = m.flip) ? void 0 : r.overflows) || [];
                    if (S && z.push(B[k]), L) {
                        let e = v(p, R, H);
                        z.push(B[e[0]], B[e[1]])
                    }
                    if (V = [...V, {
                            placement: p,
                            overflows: z
                        }], !z.every(e => e <= 0)) {
                        let e = ((null == (i = m.flip) ? void 0 : i.index) || 0) + 1,
                            t = I[e];
                        if (t && ("alignment" !== L || M === h(t) || V.every(e => h(e.placement) !== M || e.overflows[0] > 0))) return {
                            data: {
                                index: e,
                                overflows: V
                            },
                            reset: {
                                placement: t
                            }
                        };
                        let n = null == (o = V.filter(e => e.overflows[0] <= 0).sort((e, t) => e.overflows[1] - t.overflows[1])[0]) ? void 0 : o.placement;
                        if (!n) switch (O) {
                            case "bestFit": {
                                let e = null == (l = V.filter(e => {
                                    if (_) {
                                        let t = h(e.placement);
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
                            elements: m
                        } = t,
                        {
                            apply: v = () => {},
                            ...g
                        } = c(e, t),
                        y = await p.detectOverflow(t, g),
                        w = f(u),
                        x = d(u),
                        b = "y" === h(u),
                        {
                            width: E,
                            height: R
                        } = s.floating;
                    "top" === w || "bottom" === w ? (l = w, a = x === (await (null == p.isRTL ? void 0 : p.isRTL(m.floating)) ? "start" : "end") ? "left" : "right") : (a = w, l = "end" === x ? "top" : "bottom");
                    let C = R - y.top - y.bottom,
                        T = E - y.left - y.right,
                        P = i(R - y[l], C),
                        S = i(E - y[a], T),
                        L = !t.middlewareData.shift,
                        A = P,
                        O = S;
                    if (null != (n = t.middlewareData.shift) && n.enabled.x && (O = T), null != (r = t.middlewareData.shift) && r.enabled.y && (A = C), L && !x) {
                        let e = o(y.left, 0),
                            t = o(y.right, 0),
                            n = o(y.top, 0),
                            r = o(y.bottom, 0);
                        b ? O = E - 2 * (0 !== e || 0 !== t ? e + t : o(y.left, y.right)) : A = R - 2 * (0 !== n || 0 !== r ? n + r : o(y.top, y.bottom))
                    }
                    await v({
                        ...t,
                        availableWidth: O,
                        availableHeight: A
                    });
                    let N = await p.getDimensions(m.floating);
                    return E !== N.width || R !== N.height ? {
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
                            let e = L(await r.detectOverflow(t, {
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
                            let e = L(await r.detectOverflow(t, {
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
                    x = p(h(l)),
                    b = m(x),
                    E = await u.getDimensions(v),
                    C = "y" === x,
                    T = C ? "clientHeight" : "clientWidth",
                    P = a.reference[b] + a.reference[x] - w[x] - a.floating[b],
                    S = w[x] - a.reference[x],
                    L = await (null == u.getOffsetParent ? void 0 : u.getOffsetParent(v)),
                    A = L ? L[T] : 0;
                A && await (null == u.isElement ? void 0 : u.isElement(L)) || (A = s.floating[T] || a.floating[b]);
                let O = A / 2 - E[b] / 2 - 1,
                    N = i(y[C ? "top" : "left"], O),
                    D = i(y[C ? "bottom" : "right"], O),
                    j = A - E[b] - D,
                    k = A / 2 - E[b] / 2 + (P / 2 - S / 2),
                    M = o(N, i(k, j)),
                    W = !f.arrow && null != d(l) && k !== M && a.reference[b] / 2 - (k < N ? N : D) - E[b] / 2 < 0,
                    H = W ? k < N ? k - N : k - j : 0;
                return {
                    [x]: w[x] + H,
                    data: {
                        [x]: M,
                        centerOffset: k - M - H,
                        ...W && {
                            alignmentOffset: H
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
                    }, m = h(i), v = p(m), g = d[v], y = d[m], w = c(a, t), x = "number" == typeof w ? {
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
                            t = N.has(f(i)),
                            n = o.reference[m] - o.floating[e] + (t && (null == (b = l.offset) ? void 0 : b[m]) || 0) + (t ? 0 : x.crossAxis),
                            r = o.reference[m] + o.reference[e] + (t ? 0 : (null == (E = l.offset) ? void 0 : E[m]) || 0) - (t ? x.crossAxis : 0);
                        y < n ? y = n : y > r && (y = r)
                    }
                    return {
                        [v]: g,
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
            return S(e, t, {
                ...i,
                platform: o
            })
        };
    e.s(["arrow", 0, ex, "autoPlacement", 0, function(e) {
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
                    elements: m
                } = t, {
                    crossAxis: h = !1,
                    alignment: y,
                    allowedPlacements: w = r,
                    autoAlignment: x = !0,
                    ...b
                } = c(e, t), E = void 0 !== y || w === r ? ((l = y || null) ? [...w.filter(e => d(e) === l), ...w.filter(e => d(e) !== l)] : w.filter(e => f(e) === e)).filter(e => !l || d(e) === l || !!x && g(e) !== e) : w, R = await p.detectOverflow(t, b), C = (null == (n = u.autoPlacement) ? void 0 : n.index) || 0, T = E[C];
                if (null == T) return {};
                let P = v(T, a, await (null == p.isRTL ? void 0 : p.isRTL(m.floating)));
                if (s !== T) return {
                    reset: {
                        placement: E[0]
                    }
                };
                let S = [R[f(T)], R[P[0]], R[P[1]]],
                    L = [...(null == (i = u.autoPlacement) ? void 0 : i.overflows) || [], {
                        placement: T,
                        overflows: S
                    }],
                    A = E[C + 1];
                if (A) return {
                    data: {
                        index: C + 1,
                        overflows: L
                    },
                    reset: {
                        placement: A
                    }
                };
                let O = L.map(e => {
                        let t = d(e.placement);
                        return [e.placement, t && h ? e.overflows.slice(0, 2).reduce((e, t) => e + t, 0) : e.overflows[0], e.overflows]
                    }).sort((e, t) => e[1] - t[1]),
                    N = (null == (o = O.filter(e => e[2].slice(0, d(e[0]) ? 2 : 3).every(e => e <= 0))[0]) ? void 0 : o[0]) || O[0][0];
                return N !== s ? {
                    data: {
                        index: C + 1,
                        overflows: L
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
            ancestorScroll: u = !0,
            ancestorResize: s = !0,
            elementResize: c = "function" == typeof ResizeObserver,
            layoutShift: f = "function" == typeof IntersectionObserver,
            animationFrame: d = !1
        } = r, p = et(e), m = u || s ? [...p ? J(p) : [], ...t ? J(t) : []] : [];
        m.forEach(e => {
            u && e.addEventListener("scroll", n, {
                passive: !0
            }), s && e.addEventListener("resize", n)
        });
        let h = p && f ? function(e, t) {
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
                            top: m,
                            width: h,
                            height: v
                        } = d;
                    if (c || t(), !h || !v) return;
                    let g = {
                            rootMargin: -a(m) + "px " + -a(l.clientWidth - (p + h)) + "px " + -a(l.clientHeight - (m + v)) + "px " + -a(p) + "px",
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
                        1 !== r || em(d, e.getBoundingClientRect()) || s(), y = !1
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
            y && !em(y, r) && n(), y = r, l = requestAnimationFrame(t)
        }(), n(), () => {
            var e;
            m.forEach(e => {
                u && e.removeEventListener("scroll", n), s && e.removeEventListener("resize", n)
            }), null == h || h(), null == (e = g) || e.disconnect(), g = null, d && cancelAnimationFrame(l)
        }
    }, "computePosition", 0, eE, "flip", 0, eg, "hide", 0, ew, "inline", 0, function(e) {
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
                } = c(e, t), m = Array.from(await (null == a.getClientRects ? void 0 : a.getClientRects(r.reference)) || []), v = function(e) {
                    let t = e.slice().sort((e, t) => e.y - t.y),
                        n = [],
                        r = null;
                    for (let e = 0; e < t.length; e++) {
                        let i = t[e];
                        !r || i.y - r.y > r.height / 2 ? n.push([i]) : n[n.length - 1].push(i), r = i
                    }
                    return n.map(e => C(O(e)))
                }(m), g = C(O(m)), y = R(s), w = await a.getElementRects({
                    reference: {
                        getBoundingClientRect: function() {
                            if (2 === v.length && v[0].left > v[1].right && null != d && null != p) return v.find(e => d > e.left - y.left && d < e.right + y.right && p > e.top - y.top && p < e.bottom + y.bottom) || g;
                            if (v.length >= 2) {
                                if ("y" === h(n)) {
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
    }, "limitShift", 0, eb, "offset", 0, eh, "shift", 0, ev, "size", 0, ey], 992486);
    var eR = e.i(416340),
        eC = e.i(149285),
        eT = "u" > typeof document ? eR.useLayoutEffect : function() {};

    function eP(e, t) {
        let n, r, i;
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
            if ((n = (i = Object.keys(e)).length) !== Object.keys(t).length) return !1;
            for (r = n; 0 != r--;)
                if (!({}).hasOwnProperty.call(t, i[r])) return !1;
            for (r = n; 0 != r--;) {
                let n = i[r];
                if (("_owner" !== n || !e.$$typeof) && !eP(e[n], t[n])) return !1
            }
            return !0
        }
        return e != e && t != t
    }

    function eS(e) {
        return "u" < typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
    }

    function eL(e, t) {
        let n = eS(e);
        return Math.round(t * n) / n
    }

    function eA(e) {
        let t = eR.useRef(e);
        return eT(() => {
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
    }, "flip", 0, (e, t) => {
        let n = eg(e);
        return {
            name: n.name,
            fn: n.fn,
            options: [e, t]
        }
    }, "hide", 0, (e, t) => {
        let n = ew(e);
        return {
            name: n.name,
            fn: n.fn,
            options: [e, t]
        }
    }, "limitShift", 0, (e, t) => ({
        fn: eb(e).fn,
        options: [e, t]
    }), "offset", 0, (e, t) => {
        let n = eh(e);
        return {
            name: n.name,
            fn: n.fn,
            options: [e, t]
        }
    }, "shift", 0, (e, t) => {
        let n = ev(e);
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
        eP(d, r) || p(r);
        let [m, h] = eR.useState(null), [v, g] = eR.useState(null), y = eR.useCallback(e => {
            e !== E.current && (E.current = e, h(e))
        }, []), w = eR.useCallback(e => {
            e !== R.current && (R.current = e, g(e))
        }, []), x = o || m, b = l || v, E = eR.useRef(null), R = eR.useRef(null), C = eR.useRef(c), T = null != u, P = eA(u), S = eA(i), L = eA(s), A = eR.useCallback(() => {
            if (!E.current || !R.current) return;
            let e = {
                placement: t,
                strategy: n,
                middleware: d
            };
            S.current && (e.platform = S.current), eE(E.current, R.current, e).then(e => {
                let t = {
                    ...e,
                    isPositioned: !1 !== L.current
                };
                O.current && !eP(C.current, t) && (C.current = t, eC.flushSync(() => {
                    f(t)
                }))
            })
        }, [d, t, n, S, L]);
        eT(() => {
            !1 === s && C.current.isPositioned && (C.current.isPositioned = !1, f(e => ({
                ...e,
                isPositioned: !1
            })))
        }, [s]);
        let O = eR.useRef(!1);
        eT(() => (O.current = !0, () => {
            O.current = !1
        }), []), eT(() => {
            if (x && (E.current = x), b && (R.current = b), x && b) {
                if (P.current) return P.current(x, b, A);
                A()
            }
        }, [x, b, A, P, T]);
        let N = eR.useMemo(() => ({
                reference: E,
                floating: R,
                setReference: y,
                setFloating: w
            }), [y, w]),
            D = eR.useMemo(() => ({
                reference: x,
                floating: b
            }), [x, b]),
            j = eR.useMemo(() => {
                let e = {
                    position: n,
                    left: 0,
                    top: 0
                };
                if (!D.floating) return e;
                let t = eL(D.floating, c.x),
                    r = eL(D.floating, c.y);
                return a ? {
                    ...e,
                    transform: "translate(" + t + "px, " + r + "px)",
                    ...eS(D.floating) >= 1.5 && {
                        willChange: "transform"
                    }
                } : {
                    position: n,
                    left: t,
                    top: r
                }
            }, [n, a, D.floating, c.x, c.y]);
        return eR.useMemo(() => ({
            ...c,
            update: A,
            refs: N,
            elements: D,
            floatingStyles: j
        }), [c, A, N, D, j])
    }], 297452)
}, 357716, 195560, 978437, 362496, 791634, 448970, 326301, 993032, 636598, e => {
    "use strict";

    function t(e, t) {
        let {
            checkForDefaultPrevented: n = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(r) {
            if (null == e || e(r), !1 === n || !r.defaultPrevented) return null == t ? void 0 : t(r)
        }
    }
    e.s(["composeEventHandlers", 0, t], 357716);
    var n, r, i = e.i(416340);

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
    e.s(["composeRefs", 0, l, "useComposedRefs", 0, a], 195560);
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
    }], 978437);
    var s = e.i(149285),
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
    e.s(["Slot", 0, c, "Slottable", 0, d], 362496);
    var m = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, t) => {
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

    function h(e, t) {
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
    e.s(["Primitive", 0, m, "dispatchDiscreteCustomEvent", 0, h], 791634), e.s(["useCallbackRef", 0, v], 448970);
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
                onDismiss: h,
                ...w
            } = e, E = i.useContext(y), [R, C] = i.useState(null), T = null != (o = null == R ? void 0 : R.ownerDocument) ? o : null == (l = globalThis) ? void 0 : l.document, [, P] = i.useState({}), S = a(r, e => C(e)), L = Array.from(E.layers), [A] = [...E.layersWithOutsidePointerEventsDisabled].slice(-1), O = L.indexOf(A), N = R ? L.indexOf(R) : -1, D = E.layersWithOutsidePointerEventsDisabled.size > 0, j = N >= O, k = function(e) {
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
                j && !n && (null == f || f(e), null == p || p(e), e.defaultPrevented || null == h || h())
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
                ![...E.branches].some(e => e.contains(t)) && (null == d || d(e), null == p || p(e), e.defaultPrevented || null == h || h())
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
                N === E.layers.size - 1 && (null == c || c(e), !e.defaultPrevented && h && (e.preventDefault(), h()))
            }, T), i.useEffect(() => {
                if (R) return s && (0 === E.layersWithOutsidePointerEventsDisabled.size && (n = T.body.style.pointerEvents, T.body.style.pointerEvents = "none"), E.layersWithOutsidePointerEventsDisabled.add(R)), E.layers.add(R), x(), () => {
                    s && 1 === E.layersWithOutsidePointerEventsDisabled.size && (T.body.style.pointerEvents = n)
                }
            }, [R, T, s, E]), i.useEffect(() => () => {
                R && (E.layers.delete(R), E.layersWithOutsidePointerEventsDisabled.delete(R), x())
            }, [R, E]), i.useEffect(() => {
                let e = () => P({});
                return document.addEventListener(g, e), () => document.removeEventListener(g, e)
            }, []), (0, u.jsx)(m.div, {
                ...w,
                ref: S,
                style: {
                    pointerEvents: D ? j ? "auto" : "none" : void 0,
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
        }), i ? h(o, l) : o.dispatchEvent(l)
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
        }, [n.branches]), (0, u.jsx)(m.div, {
            ...e,
            ref: o
        })
    }).displayName = "DismissableLayerBranch", e.s(["DismissableLayer", 0, w], 326301);
    var E = (null == (r = globalThis) ? void 0 : r.document) ? i.useLayoutEffect : () => {};
    e.s(["useLayoutEffect", 0, E], 993032);
    var R = i["useId".toString()] || (() => void 0),
        C = 0;
    e.s(["useId", 0, function(e) {
        let [t, n] = i.useState(R());
        return E(() => {
            e || n(e => null != e ? e : String(C++))
        }, [e]), e || (t ? "radix-".concat(t) : "")
    }], 636598)
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
                    return i.type !== t.Fragment && (f.ref = r ? (0, n.composeRefs)(r, c) : c), t.cloneElement(i, f)
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
}, 989665, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(357716),
        r = e.i(195560),
        i = e.i(978437),
        o = e.i(326301),
        l = e.i(636598),
        a = e.i(297452),
        u = e.i(992486),
        s = e.i(791634),
        c = e.i(221628),
        f = t.forwardRef((e, t) => {
            let {
                children: n,
                width: r = 10,
                height: i = 5,
                ...o
            } = e;
            return (0, c.jsx)(s.Primitive.svg, {
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
    var d = e.i(448970),
        p = e.i(993032),
        m = "Popper",
        [h, v] = (0, i.createContextScope)(m),
        [g, y] = h(m),
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
    w.displayName = m;
    var x = "PopperAnchor",
        b = t.forwardRef((e, n) => {
            let {
                __scopePopper: i,
                virtualRef: o,
                ...l
            } = e, a = y(x, i), u = t.useRef(null), f = (0, r.useComposedRefs)(n, u);
            return t.useEffect(() => {
                a.onAnchorChange((null == o ? void 0 : o.current) || u.current)
            }), o ? null : (0, c.jsx)(s.Primitive.div, {
                ...l,
                ref: f
            })
        });
    b.displayName = x;
    var E = "PopperContent",
        [R, C] = h(E),
        T = t.forwardRef((e, n) => {
            var i, o, l, f, m, h, v, g;
            let {
                __scopePopper: w,
                side: x = "bottom",
                sideOffset: b = 0,
                align: C = "center",
                alignOffset: T = 0,
                arrowPadding: P = 0,
                avoidCollisions: S = !0,
                collisionBoundary: L = [],
                collisionPadding: D = 0,
                sticky: j = "partial",
                hideWhenDetached: k = !1,
                updatePositionStrategy: M = "optimized",
                onPlaced: W,
                ...H
            } = e, F = y(E, w), [_, I] = t.useState(null), B = (0, r.useComposedRefs)(n, e => I(e)), [z, V] = t.useState(null), U = function(e) {
                let [n, r] = t.useState(void 0);
                return (0, p.useLayoutEffect)(() => {
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
            }(z), Y = null != (i = null == U ? void 0 : U.width) ? i : 0, X = null != (o = null == U ? void 0 : U.height) ? o : 0, $ = "number" == typeof D ? D : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...D
            }, q = Array.isArray(L) ? L : [L], K = q.length > 0, Z = {
                padding: $,
                boundary: q.filter(A),
                altBoundary: K
            }, {
                refs: G,
                floatingStyles: J,
                placement: Q,
                isPositioned: ee,
                middlewareData: et
            } = (0, a.useFloating)({
                strategy: "fixed",
                placement: x + ("center" !== C ? "-" + C : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return (0, u.autoUpdate)(...t, {
                        animationFrame: "always" === M
                    })
                },
                elements: {
                    reference: F.anchor
                },
                middleware: [(0, a.offset)({
                    mainAxis: b + X,
                    alignmentAxis: T
                }), S && (0, a.shift)({
                    mainAxis: !0,
                    crossAxis: !1,
                    limiter: "partial" === j ? (0, a.limitShift)() : void 0,
                    ...Z
                }), S && (0, a.flip)({
                    ...Z
                }), (0, a.size)({
                    ...Z,
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
                }), z && (0, a.arrow)({
                    element: z,
                    padding: P
                }), O({
                    arrowWidth: Y,
                    arrowHeight: X
                }), k && (0, a.hide)({
                    strategy: "referenceHidden",
                    ...Z
                })]
            }), [en, er] = N(Q), ei = (0, d.useCallbackRef)(W);
            (0, p.useLayoutEffect)(() => {
                ee && (null == ei || ei())
            }, [ee, ei]);
            let eo = null == (l = et.arrow) ? void 0 : l.x,
                el = null == (f = et.arrow) ? void 0 : f.y,
                ea = (null == (m = et.arrow) ? void 0 : m.centerOffset) !== 0,
                [eu, es] = t.useState();
            return (0, p.useLayoutEffect)(() => {
                _ && es(window.getComputedStyle(_).zIndex)
            }, [_]), (0, c.jsx)("div", {
                ref: G.setFloating,
                "data-radix-popper-content-wrapper": "",
                style: {
                    ...J,
                    transform: ee ? J.transform : "translate(0, -200%)",
                    minWidth: "max-content",
                    zIndex: eu,
                    "--radix-popper-transform-origin": [null == (h = et.transformOrigin) ? void 0 : h.x, null == (v = et.transformOrigin) ? void 0 : v.y].join(" "),
                    ...(null == (g = et.hide) ? void 0 : g.referenceHidden) && {
                        visibility: "hidden",
                        pointerEvents: "none"
                    }
                },
                dir: e.dir,
                children: (0, c.jsx)(R, {
                    scope: w,
                    placedSide: en,
                    onArrowChange: V,
                    arrowX: eo,
                    arrowY: el,
                    shouldHideArrow: ea,
                    children: (0, c.jsx)(s.Primitive.div, {
                        "data-side": en,
                        "data-align": er,
                        ...H,
                        ref: B,
                        style: {
                            ...H.style,
                            animation: ee ? void 0 : "none"
                        }
                    })
                })
            })
        });
    T.displayName = E;
    var P = "PopperArrow",
        S = {
            top: "bottom",
            right: "left",
            bottom: "top",
            left: "right"
        },
        L = t.forwardRef(function(e, t) {
            let {
                __scopePopper: n,
                ...r
            } = e, i = C(P, n), o = S[i.placedSide];
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

    function A(e) {
        return null !== e
    }
    L.displayName = P;
    var O = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            var n, r, i, o, l;
            let {
                placement: a,
                rects: u,
                middlewareData: s
            } = t, c = (null == (i = s.arrow) ? void 0 : i.centerOffset) !== 0, f = c ? 0 : e.arrowWidth, d = c ? 0 : e.arrowHeight, [p, m] = N(a), h = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [m], v = (null != (n = null == (o = s.arrow) ? void 0 : o.x) ? n : 0) + f / 2, g = (null != (r = null == (l = s.arrow) ? void 0 : l.y) ? r : 0) + d / 2, y = "", w = "";
            return "bottom" === p ? (y = c ? h : "".concat(v, "px"), w = "".concat(-d, "px")) : "top" === p ? (y = c ? h : "".concat(v, "px"), w = "".concat(u.floating.height + d, "px")) : "right" === p ? (y = "".concat(-d, "px"), w = c ? h : "".concat(g, "px")) : "left" === p && (y = "".concat(u.floating.width + d, "px"), w = c ? h : "".concat(g, "px")), {
                data: {
                    x: y,
                    y: w
                }
            }
        }
    });

    function N(e) {
        let [t, n = "center"] = e.split("-");
        return [t, n]
    }
    var D = e.i(149285),
        j = t.forwardRef((e, n) => {
            var r, i;
            let {
                container: o,
                ...l
            } = e, [a, u] = t.useState(!1);
            (0, p.useLayoutEffect)(() => u(!0), []);
            let f = o || a && (null == (i = globalThis) || null == (r = i.document) ? void 0 : r.body);
            return f ? D.default.createPortal((0, c.jsx)(s.Primitive.div, {
                ...l,
                ref: n
            }), f) : null
        });
    j.displayName = "Portal";
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
                }, [s]), (0, p.useLayoutEffect)(() => {
                    let t = l.current,
                        n = a.current;
                    if (n !== e) {
                        let r = u.current,
                            i = M(t);
                        e ? c("MOUNT") : "none" === i || (null == t ? void 0 : t.display) === "none" ? c("UNMOUNT") : n && r !== i ? c("ANIMATION_OUT") : c("UNMOUNT"), a.current = e
                    }
                }, [e, c]), (0, p.useLayoutEffect)(() => {
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
            d = (0, r.useComposedRefs)(c.ref, (a = (l = null == (i = Object.getOwnPropertyDescriptor((n = f).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? n.ref : (a = (l = null == (o = Object.getOwnPropertyDescriptor(n, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? n.props.ref : n.props.ref || n.ref);
        return "function" == typeof s || c.isPresent ? t.cloneElement(f, {
            ref: d
        }) : null
    };

    function M(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    k.displayName = "Presence";
    var W = e.i(362496),
        H = t.forwardRef((e, t) => (0, c.jsx)(s.Primitive.span, {
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
    var [F, _] = (0, i.createContextScope)("Tooltip", [v]), I = v(), B = "TooltipProvider", z = "tooltip.open", [V, U] = F(B), Y = e => {
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
        }, []), (0, c.jsx)(V, {
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
    Y.displayName = B;
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
            } = e, f = U(X, e.__scopeTooltip), p = I(n), [m, h] = t.useState(null), v = (0, l.useId)(), g = t.useRef(0), y = null != u ? u : f.disableHoverableContent, x = null != s ? s : f.delayDuration, b = t.useRef(!1), [E = !1, R] = function(e) {
                let {
                    prop: n,
                    defaultProp: r,
                    onChange: i = () => {}
                } = e, [o, l] = function(e) {
                    let {
                        defaultProp: n,
                        onChange: r
                    } = e, i = t.useState(n), [o] = i, l = t.useRef(o), a = (0, d.useCallbackRef)(r);
                    return t.useEffect(() => {
                        l.current !== o && (a(o), l.current = o)
                    }, [o, l, a]), i
                }({
                    defaultProp: r,
                    onChange: i
                }), a = void 0 !== n, u = a ? n : o, s = (0, d.useCallbackRef)(i);
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
                    e ? (f.onOpen(), document.dispatchEvent(new CustomEvent(z))) : f.onClose(), null == a || a(e)
                }
            }), C = t.useMemo(() => E ? b.current ? "delayed-open" : "instant-open" : "closed", [E]), T = t.useCallback(() => {
                window.clearTimeout(g.current), g.current = 0, b.current = !1, R(!0)
            }, [R]), P = t.useCallback(() => {
                window.clearTimeout(g.current), g.current = 0, R(!1)
            }, [R]), S = t.useCallback(() => {
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
                    trigger: m,
                    onTriggerChange: h,
                    onTriggerEnter: t.useCallback(() => {
                        f.isOpenDelayed ? S() : T()
                    }, [f.isOpenDelayed, S, T]),
                    onTriggerLeave: t.useCallback(() => {
                        y ? P() : (window.clearTimeout(g.current), g.current = 0)
                    }, [P, y]),
                    onOpen: T,
                    onClose: P,
                    disableHoverableContent: y,
                    children: r
                })
            })
        };
    K.displayName = X;
    var Z = "TooltipTrigger",
        G = t.forwardRef((e, i) => {
            let {
                __scopeTooltip: o,
                ...l
            } = e, a = q(Z, o), u = U(Z, o), f = I(o), d = t.useRef(null), p = (0, r.useComposedRefs)(i, d, a.onTriggerChange), m = t.useRef(!1), h = t.useRef(!1), v = t.useCallback(() => m.current = !1, []);
            return t.useEffect(() => () => document.removeEventListener("pointerup", v), [v]), (0, c.jsx)(b, {
                asChild: !0,
                ...f,
                children: (0, c.jsx)(s.Primitive.button, {
                    "aria-describedby": a.open ? a.contentId : void 0,
                    "data-state": a.stateAttribute,
                    ...l,
                    ref: p,
                    onPointerMove: (0, n.composeEventHandlers)(e.onPointerMove, e => {
                        "touch" !== e.pointerType && (h.current || u.isPointerInTransitRef.current || (a.onTriggerEnter(), h.current = !0))
                    }),
                    onPointerLeave: (0, n.composeEventHandlers)(e.onPointerLeave, () => {
                        a.onTriggerLeave(), h.current = !1
                    }),
                    onPointerDown: (0, n.composeEventHandlers)(e.onPointerDown, () => {
                        m.current = !0, document.addEventListener("pointerup", v, {
                            once: !0
                        })
                    }),
                    onFocus: (0, n.composeEventHandlers)(e.onFocus, () => {
                        m.current || a.onOpen()
                    }),
                    onBlur: (0, n.composeEventHandlers)(e.onBlur, a.onClose),
                    onClick: (0, n.composeEventHandlers)(e.onClick, a.onClose)
                })
            })
        });
    G.displayName = Z;
    var J = "TooltipPortal",
        [Q, ee] = F(J, {
            forceMount: void 0
        }),
        et = e => {
            let {
                __scopeTooltip: t,
                forceMount: n,
                children: r,
                container: i
            } = e, o = q(J, t);
            return (0, c.jsx)(Q, {
                scope: t,
                forceMount: n,
                children: (0, c.jsx)(k, {
                    present: n || o.open,
                    children: (0, c.jsx)(j, {
                        asChild: !0,
                        container: i,
                        children: r
                    })
                })
            })
        };
    et.displayName = J;
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
                a = (0, r.useComposedRefs)(n, l),
                [u, s] = t.useState(null),
                {
                    trigger: f,
                    onClose: d
                } = i,
                p = l.current,
                {
                    onPointerInTransitChange: m
                } = o,
                h = t.useCallback(() => {
                    s(null), m(!1)
                }, [m]),
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
                    }(n))), m(!0)
                }, [m]);
            return t.useEffect(() => () => h(), [h]), t.useEffect(() => {
                if (f && p) {
                    let e = e => v(e, p),
                        t = e => v(e, f);
                    return f.addEventListener("pointerleave", e), p.addEventListener("pointerleave", t), () => {
                        f.removeEventListener("pointerleave", e), p.removeEventListener("pointerleave", t)
                    }
                }
            }, [f, p, v, h]), t.useEffect(() => {
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
                        r ? h() : i && (h(), d())
                    };
                    return document.addEventListener("pointermove", e), () => document.removeEventListener("pointermove", e)
                }
            }, [f, p, u, d, h]), (0, c.jsx)(ea, {
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
            } = e, f = q(en, r), d = I(r), {
                onClose: p
            } = f;
            return t.useEffect(() => (document.addEventListener(z, p), () => document.removeEventListener(z, p)), [p]), t.useEffect(() => {
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
            }, [f.trigger, p]), (0, c.jsx)(o.DismissableLayer, {
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
                    children: [(0, c.jsx)(W.Slottable, {
                        children: i
                    }), (0, c.jsx)(eo, {
                        scope: r,
                        isInside: !0,
                        children: (0, c.jsx)(H, {
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
            } = e, i = I(n);
            return el(eu, n).isInside ? null : (0, c.jsx)(L, {
                ...i,
                ...r,
                ref: t
            })
        });
    es.displayName = eu, e.s(["Arrow", 0, es, "Content", 0, er, "Portal", 0, et, "Provider", 0, Y, "Root", 0, K, "Trigger", 0, G], 989665)
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
}]);

//# debugId=7d8e2a0b-c153-3612-2399-6d61b3aba382
//# sourceMappingURL=1l9ijzsy468al.js.map