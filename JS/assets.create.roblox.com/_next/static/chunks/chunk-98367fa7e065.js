;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "00757cfb-31f6-1234-d803-9513c10f9a04")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 980891, 350303, e => {
    "use strict";
    let t, n = ["top", "right", "bottom", "left"],
        r = n.reduce((e, t) => e.concat(t, t + "-start", t + "-end"), []),
        i = Math.min,
        o = Math.max,
        l = Math.round,
        f = Math.floor,
        u = e => ({
            x: e,
            y: e
        }),
        a = {
            left: "right",
            right: "left",
            bottom: "top",
            top: "bottom"
        };

    function c(e, t) {
        return "function" == typeof e ? e(t) : e
    }

    function s(e) {
        return e.split("-")[0]
    }

    function d(e) {
        return e.split("-")[1]
    }

    function h(e) {
        return "x" === e ? "y" : "x"
    }

    function m(e) {
        return "y" === e ? "height" : "width"
    }

    function p(e) {
        let t = e[0];
        return "t" === t || "b" === t ? "y" : "x"
    }

    function g(e, t, n) {
        void 0 === n && (n = !1);
        let r = d(e),
            i = h(p(e)),
            o = m(i),
            l = "x" === i ? r === (n ? "end" : "start") ? "right" : "left" : "start" === r ? "bottom" : "top";
        return t.reference[o] > t.floating[o] && (l = R(l)), [l, R(l)]
    }

    function y(e) {
        return e.includes("start") ? e.replace("start", "end") : e.replace("end", "start")
    }
    let w = ["left", "right"],
        v = ["right", "left"],
        x = ["top", "bottom"],
        b = ["bottom", "top"];

    function R(e) {
        let t = s(e);
        return a[t] + e.slice(t.length)
    }

    function A(e) {
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
            l = p(t),
            f = h(p(t)),
            u = m(f),
            a = s(t),
            c = "y" === l,
            g = i.x + i.width / 2 - o.width / 2,
            y = i.y + i.height / 2 - o.height / 2,
            w = i[u] / 2 - o[u] / 2;
        switch (a) {
            case "top":
                r = {
                    x: g,
                    y: i.y - o.height
                };
                break;
            case "bottom":
                r = {
                    x: g,
                    y: i.y + i.height
                };
                break;
            case "right":
                r = {
                    x: i.x + i.width,
                    y: y
                };
                break;
            case "left":
                r = {
                    x: i.x - o.width,
                    y: y
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
                r[f] -= w * (n && c ? -1 : 1);
                break;
            case "end":
                r[f] += w * (n && c ? -1 : 1)
        }
        return r
    }
    async function S(e, t) {
        var n;
        void 0 === t && (t = {});
        let {
            x: r,
            y: i,
            platform: o,
            rects: l,
            elements: f,
            strategy: u
        } = e, {
            boundary: a = "clippingAncestors",
            rootBoundary: s = "viewport",
            elementContext: d = "floating",
            altBoundary: h = !1,
            padding: m = 0
        } = c(t, e), p = A(m), g = f[h ? "floating" === d ? "reference" : "floating" : d], y = E(await o.getClippingRect({
            element: null == (n = await (null == o.isElement ? void 0 : o.isElement(g))) || n ? g : g.contextElement || await (null == o.getDocumentElement ? void 0 : o.getDocumentElement(f.floating)),
            boundary: a,
            rootBoundary: s,
            strategy: u
        })), w = "floating" === d ? {
            x: r,
            y: i,
            width: l.floating.width,
            height: l.floating.height
        } : l.reference, v = await (null == o.getOffsetParent ? void 0 : o.getOffsetParent(f.floating)), x = await (null == o.isElement ? void 0 : o.isElement(v)) && await (null == o.getScale ? void 0 : o.getScale(v)) || {
            x: 1,
            y: 1
        }, b = E(o.convertOffsetParentRelativeRectToViewportRelativeRect ? await o.convertOffsetParentRelativeRectToViewportRelativeRect({
            elements: f,
            rect: w,
            offsetParent: v,
            strategy: u
        }) : w);
        return {
            top: (y.top - b.top + p.top) / x.y,
            bottom: (b.bottom - y.bottom + p.bottom) / x.y,
            left: (y.left - b.left + p.left) / x.x,
            right: (b.right - y.right + p.right) / x.x
        }
    }
    let C = async (e, t, n) => {
        let {
            placement: r = "bottom",
            strategy: i = "absolute",
            middleware: o = [],
            platform: l
        } = n, f = l.detectOverflow ? l : {
            ...l,
            detectOverflow: S
        }, u = await (null == l.isRTL ? void 0 : l.isRTL(t)), a = await l.getElementRects({
            reference: e,
            floating: t,
            strategy: i
        }), {
            x: c,
            y: s
        } = T(a, r, u), d = r, h = 0, m = {};
        for (let n = 0; n < o.length; n++) {
            let p = o[n];
            if (!p) continue;
            let {
                name: g,
                fn: y
            } = p, {
                x: w,
                y: v,
                data: x,
                reset: b
            } = await y({
                x: c,
                y: s,
                initialPlacement: r,
                placement: d,
                strategy: i,
                middlewareData: m,
                rects: a,
                platform: f,
                elements: {
                    reference: e,
                    floating: t
                }
            });
            c = null != w ? w : c, s = null != v ? v : s, m[g] = {
                ...m[g],
                ...x
            }, b && h < 50 && (h++, "object" == typeof b && (b.placement && (d = b.placement), b.rects && (a = !0 === b.rects ? await l.getElementRects({
                reference: e,
                floating: t,
                strategy: i
            }) : b.rects), {
                x: c,
                y: s
            } = T(a, d, u)), n = -1)
        }
        return {
            x: c,
            y: s,
            placement: d,
            strategy: i,
            middlewareData: m
        }
    };

    function O(e, t) {
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
    let D = new Set(["left", "top"]);
    async function W(e, t) {
        let {
            placement: n,
            platform: r,
            elements: i
        } = e, o = await (null == r.isRTL ? void 0 : r.isRTL(i.floating)), l = s(n), f = d(n), u = "y" === p(n), a = D.has(l) ? -1 : 1, h = o && u ? -1 : 1, m = c(t, e), {
            mainAxis: g,
            crossAxis: y,
            alignmentAxis: w
        } = "number" == typeof m ? {
            mainAxis: m,
            crossAxis: 0,
            alignmentAxis: null
        } : {
            mainAxis: m.mainAxis || 0,
            crossAxis: m.crossAxis || 0,
            alignmentAxis: m.alignmentAxis
        };
        return f && "number" == typeof w && (y = "end" === f ? -1 * w : w), u ? {
            x: y * h,
            y: g * a
        } : {
            x: g * a,
            y: y * h
        }
    }

    function k() {
        return "u" > typeof window
    }

    function H(e) {
        return V(e) ? (e.nodeName || "").toLowerCase() : "#document"
    }

    function F(e) {
        var t;
        return (null == e || null == (t = e.ownerDocument) ? void 0 : t.defaultView) || window
    }

    function M(e) {
        var t;
        return null == (t = (V(e) ? e.ownerDocument : e.document) || window.document) ? void 0 : t.documentElement
    }

    function V(e) {
        return !!k() && (e instanceof Node || e instanceof F(e).Node)
    }

    function B(e) {
        return !!k() && (e instanceof Element || e instanceof F(e).Element)
    }

    function j(e) {
        return !!k() && (e instanceof HTMLElement || e instanceof F(e).HTMLElement)
    }

    function N(e) {
        return !(!k() || "u" < typeof ShadowRoot) && (e instanceof ShadowRoot || e instanceof F(e).ShadowRoot)
    }

    function _(e) {
        let {
            overflow: t,
            overflowX: n,
            overflowY: r,
            display: i
        } = Y(e);
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
    let I = /transform|translate|scale|rotate|perspective|filter/,
        $ = /paint|layout|strict|content/,
        q = e => !!e && "none" !== e;

    function K(e) {
        let t = B(e) ? Y(e) : e;
        return q(t.transform) || q(t.translate) || q(t.scale) || q(t.rotate) || q(t.perspective) || !U() && (q(t.backdropFilter) || q(t.filter)) || I.test(t.willChange || "") || $.test(t.contain || "")
    }

    function U() {
        return null == t && (t = "u" > typeof CSS && CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")), t
    }

    function X(e) {
        return /^(html|body|#document)$/.test(H(e))
    }

    function Y(e) {
        return F(e).getComputedStyle(e)
    }

    function Q(e) {
        return B(e) ? {
            scrollLeft: e.scrollLeft,
            scrollTop: e.scrollTop
        } : {
            scrollLeft: e.scrollX,
            scrollTop: e.scrollY
        }
    }

    function Z(e) {
        if ("html" === H(e)) return e;
        let t = e.assignedSlot || e.parentNode || N(e) && e.host || M(e);
        return N(t) ? t.host : t
    }

    function G(e, t, n) {
        var r;
        void 0 === t && (t = []), void 0 === n && (n = !0);
        let i = function e(t) {
                let n = Z(t);
                return X(n) ? t.ownerDocument ? t.ownerDocument.body : t.body : j(n) && _(n) ? n : e(n)
            }(e),
            o = i === (null == (r = e.ownerDocument) ? void 0 : r.body),
            l = F(i);
        if (!o) return t.concat(i, G(i, [], n));
        {
            let e = J(l);
            return t.concat(l, l.visualViewport || [], _(i) ? i : [], e && n ? G(e) : [])
        }
    }

    function J(e) {
        return e.parent && Object.getPrototypeOf(e.parent) ? e.frameElement : null
    }

    function ee(e) {
        let t = Y(e),
            n = parseFloat(t.width) || 0,
            r = parseFloat(t.height) || 0,
            i = j(e),
            o = i ? e.offsetWidth : n,
            f = i ? e.offsetHeight : r,
            u = l(n) !== o || l(r) !== f;
        return u && (n = o, r = f), {
            width: n,
            height: r,
            $: u
        }
    }

    function et(e) {
        return B(e) ? e : e.contextElement
    }

    function en(e) {
        let t = et(e);
        if (!j(t)) return u(1);
        let n = t.getBoundingClientRect(),
            {
                width: r,
                height: i,
                $: o
            } = ee(t),
            f = (o ? l(n.width) : n.width) / r,
            a = (o ? l(n.height) : n.height) / i;
        return f && Number.isFinite(f) || (f = 1), a && Number.isFinite(a) || (a = 1), {
            x: f,
            y: a
        }
    }
    let er = u(0);

    function ei(e) {
        let t = F(e);
        return U() && t.visualViewport ? {
            x: t.visualViewport.offsetLeft,
            y: t.visualViewport.offsetTop
        } : er
    }

    function eo(e, t, n, r) {
        var i;
        void 0 === t && (t = !1), void 0 === n && (n = !1);
        let o = e.getBoundingClientRect(),
            l = et(e),
            f = u(1);
        t && (r ? B(r) && (f = en(r)) : f = en(e));
        let a = (void 0 === (i = n) && (i = !1), r && (!i || r === F(l)) && i) ? ei(l) : u(0),
            c = (o.left + a.x) / f.x,
            s = (o.top + a.y) / f.y,
            d = o.width / f.x,
            h = o.height / f.y;
        if (l) {
            let e = F(l),
                t = r && B(r) ? F(r) : r,
                n = e,
                i = J(n);
            for (; i && r && t !== n;) {
                let e = en(i),
                    t = i.getBoundingClientRect(),
                    r = Y(i),
                    o = t.left + (i.clientLeft + parseFloat(r.paddingLeft)) * e.x,
                    l = t.top + (i.clientTop + parseFloat(r.paddingTop)) * e.y;
                c *= e.x, s *= e.y, d *= e.x, h *= e.y, c += o, s += l, i = J(n = F(i))
            }
        }
        return E({
            width: d,
            height: h,
            x: c,
            y: s
        })
    }

    function el(e, t) {
        let n = Q(e).scrollLeft;
        return t ? t.left + n : eo(M(e)).left + n
    }

    function ef(e, t) {
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
            let n = F(e),
                r = M(e),
                i = n.visualViewport,
                o = r.clientWidth,
                l = r.clientHeight,
                f = 0,
                u = 0;
            if (i) {
                o = i.width, l = i.height;
                let e = U();
                (!e || e && "fixed" === t) && (f = i.offsetLeft, u = i.offsetTop)
            }
            let a = el(r);
            if (a <= 0) {
                let e = r.ownerDocument,
                    t = e.body,
                    n = getComputedStyle(t),
                    i = "CSS1Compat" === e.compatMode && parseFloat(n.marginLeft) + parseFloat(n.marginRight) || 0,
                    l = Math.abs(r.clientWidth - t.clientWidth - i);
                l <= 25 && (o -= l)
            } else a <= 25 && (o += a);
            return {
                width: o,
                height: l,
                x: f,
                y: u
            }
        }(e, n);
        else if ("document" === t) {
            let t, n, l, f, u, a, c;
            r = M(e), t = M(r), n = Q(r), l = r.ownerDocument.body, f = o(t.scrollWidth, t.clientWidth, l.scrollWidth, l.clientWidth), u = o(t.scrollHeight, t.clientHeight, l.scrollHeight, l.clientHeight), a = -n.scrollLeft + el(r), c = -n.scrollTop, "rtl" === Y(l).direction && (a += o(t.clientWidth, l.clientWidth) - f), i = {
                width: f,
                height: u,
                x: a,
                y: c
            }
        } else if (B(t)) {
            let e, r, o, l, f, a;
            r = (e = eo(t, !0, "fixed" === n)).top + t.clientTop, o = e.left + t.clientLeft, l = j(t) ? en(t) : u(1), f = t.clientWidth * l.x, a = t.clientHeight * l.y, i = {
                width: f,
                height: a,
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
        return E(i)
    }

    function ea(e) {
        return "static" === Y(e).position
    }

    function ec(e, t) {
        if (!j(e) || "fixed" === Y(e).position) return null;
        if (t) return t(e);
        let n = e.offsetParent;
        return M(e) === n && (n = n.ownerDocument.body), n
    }

    function es(e, t) {
        var n;
        let r = F(e);
        if (z(e)) return r;
        if (!j(e)) {
            let t = Z(e);
            for (; t && !X(t);) {
                if (B(t) && !ea(t)) return t;
                t = Z(t)
            }
            return r
        }
        let i = ec(e, t);
        for (; i && (n = i, /^(table|td|th)$/.test(H(n))) && ea(i);) i = ec(i, t);
        return i && X(i) && ea(i) && !K(i) ? r : i || function(e) {
            let t = Z(e);
            for (; j(t) && !X(t);) {
                if (K(t)) return t;
                if (z(t)) break;
                t = Z(t)
            }
            return null
        }(e) || r
    }
    let ed = async function(e) {
        let t = this.getOffsetParent || es,
            n = this.getDimensions,
            r = await n(e.floating);
        return {
            reference: function(e, t, n) {
                let r = j(t),
                    i = M(t),
                    o = "fixed" === n,
                    l = eo(e, !0, o, t),
                    f = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    a = u(0);
                if (r || !r && !o)
                    if (("body" !== H(t) || _(i)) && (f = Q(t)), r) {
                        let e = eo(t, !0, o, t);
                        a.x = e.x + t.clientLeft, a.y = e.y + t.clientTop
                    } else i && (a.x = el(i));
                o && !r && i && (a.x = el(i));
                let c = !i || r || o ? u(0) : ef(i, f);
                return {
                    x: l.left + f.scrollLeft - a.x - c.x,
                    y: l.top + f.scrollTop - a.y - c.y,
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
    }, eh = {
        convertOffsetParentRelativeRectToViewportRelativeRect: function(e) {
            let {
                elements: t,
                rect: n,
                offsetParent: r,
                strategy: i
            } = e, o = "fixed" === i, l = M(r), f = !!t && z(t.floating);
            if (r === l || f && o) return n;
            let a = {
                    scrollLeft: 0,
                    scrollTop: 0
                },
                c = u(1),
                s = u(0),
                d = j(r);
            if ((d || !d && !o) && (("body" !== H(r) || _(l)) && (a = Q(r)), d)) {
                let e = eo(r);
                c = en(r), s.x = e.x + r.clientLeft, s.y = e.y + r.clientTop
            }
            let h = !l || d || o ? u(0) : ef(l, a);
            return {
                width: n.width * c.x,
                height: n.height * c.y,
                x: n.x * c.x - a.scrollLeft * c.x + s.x + h.x,
                y: n.y * c.y - a.scrollTop * c.y + s.y + h.y
            }
        },
        getDocumentElement: M,
        getClippingRect: function(e) {
            let {
                element: t,
                boundary: n,
                rootBoundary: r,
                strategy: l
            } = e, f = [..."clippingAncestors" === n ? z(t) ? [] : function(e, t) {
                let n = t.get(e);
                if (n) return n;
                let r = G(e, [], !1).filter(e => B(e) && "body" !== H(e)),
                    i = null,
                    o = "fixed" === Y(e).position,
                    l = o ? Z(e) : e;
                for (; B(l) && !X(l);) {
                    let t = Y(l),
                        n = K(l);
                    n || "fixed" !== t.position || (i = null), (o ? n || i : !(!n && "static" === t.position && i && ("absolute" === i.position || "fixed" === i.position) || _(l) && !n && function e(t, n) {
                        let r = Z(t);
                        return !(r === n || !B(r) || X(r)) && ("fixed" === Y(r).position || e(r, n))
                    }(e, l))) ? i = t : r = r.filter(e => e !== l), l = Z(l)
                }
                return t.set(e, r), r
            }(t, this._c) : [].concat(n), r], u = eu(t, f[0], l), a = u.top, c = u.right, s = u.bottom, d = u.left;
            for (let e = 1; e < f.length; e++) {
                let n = eu(t, f[e], l);
                a = o(n.top, a), c = i(n.right, c), s = i(n.bottom, s), d = o(n.left, d)
            }
            return {
                width: c - d,
                height: s - a,
                x: d,
                y: a
            }
        },
        getOffsetParent: es,
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
        isElement: B,
        isRTL: function(e) {
            return "rtl" === Y(e).direction
        }
    };

    function em(e, t) {
        return e.x === t.x && e.y === t.y && e.width === t.width && e.height === t.height
    }
    let ep = function(e) {
            return void 0 === e && (e = 0), {
                name: "offset",
                options: e,
                async fn(t) {
                    var n, r;
                    let {
                        x: i,
                        y: o,
                        placement: l,
                        middlewareData: f
                    } = t, u = await W(t, e);
                    return l === (null == (n = f.offset) ? void 0 : n.placement) && null != (r = f.arrow) && r.alignmentOffset ? {} : {
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
        eg = function(e) {
            return void 0 === e && (e = {}), {
                name: "shift",
                options: e,
                async fn(t) {
                    let {
                        x: n,
                        y: r,
                        placement: l,
                        platform: f
                    } = t, {
                        mainAxis: u = !0,
                        crossAxis: a = !1,
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
                    } = c(e, t), g = {
                        x: n,
                        y: r
                    }, y = await f.detectOverflow(t, m), w = p(s(l)), v = h(w), x = g[v], b = g[w];
                    if (u) {
                        let e = "y" === v ? "top" : "left",
                            t = "y" === v ? "bottom" : "right",
                            n = x + y[e],
                            r = x - y[t];
                        x = o(n, i(x, r))
                    }
                    if (a) {
                        let e = "y" === w ? "top" : "left",
                            t = "y" === w ? "bottom" : "right",
                            n = b + y[e],
                            r = b - y[t];
                        b = o(n, i(b, r))
                    }
                    let R = d.fn({
                        ...t,
                        [v]: x,
                        [w]: b
                    });
                    return {
                        ...R,
                        data: {
                            x: R.x - n,
                            y: R.y - r,
                            enabled: {
                                [v]: u,
                                [w]: a
                            }
                        }
                    }
                }
            }
        },
        ey = function(e) {
            return void 0 === e && (e = {}), {
                name: "flip",
                options: e,
                async fn(t) {
                    var n, r, i, o, l;
                    let f, u, a, {
                            placement: h,
                            middlewareData: m,
                            rects: A,
                            initialPlacement: E,
                            platform: T,
                            elements: S
                        } = t,
                        {
                            mainAxis: C = !0,
                            crossAxis: O = !0,
                            fallbackPlacements: L,
                            fallbackStrategy: P = "bestFit",
                            fallbackAxisSideDirection: D = "none",
                            flipAlignment: W = !0,
                            ...k
                        } = c(e, t);
                    if (null != (n = m.arrow) && n.alignmentOffset) return {};
                    let H = s(h),
                        F = p(E),
                        M = s(E) === E,
                        V = await (null == T.isRTL ? void 0 : T.isRTL(S.floating)),
                        B = L || (M || !W ? [R(E)] : (f = R(E), [y(E), f, y(f)])),
                        j = "none" !== D;
                    !L && j && B.push(...(u = d(E), a = function(e, t, n) {
                        switch (e) {
                            case "top":
                            case "bottom":
                                if (n) return t ? v : w;
                                return t ? w : v;
                            case "left":
                            case "right":
                                return t ? x : b;
                            default:
                                return []
                        }
                    }(s(E), "start" === D, V), u && (a = a.map(e => e + "-" + u), W && (a = a.concat(a.map(y)))), a));
                    let N = [E, ...B],
                        _ = await T.detectOverflow(t, k),
                        z = [],
                        I = (null == (r = m.flip) ? void 0 : r.overflows) || [];
                    if (C && z.push(_[H]), O) {
                        let e = g(h, A, V);
                        z.push(_[e[0]], _[e[1]])
                    }
                    if (I = [...I, {
                            placement: h,
                            overflows: z
                        }], !z.every(e => e <= 0)) {
                        let e = ((null == (i = m.flip) ? void 0 : i.index) || 0) + 1,
                            t = N[e];
                        if (t && ("alignment" !== O || F === p(t) || I.every(e => p(e.placement) !== F || e.overflows[0] > 0))) return {
                            data: {
                                index: e,
                                overflows: I
                            },
                            reset: {
                                placement: t
                            }
                        };
                        let n = null == (o = I.filter(e => e.overflows[0] <= 0).sort((e, t) => e.overflows[1] - t.overflows[1])[0]) ? void 0 : o.placement;
                        if (!n) switch (P) {
                            case "bestFit": {
                                let e = null == (l = I.filter(e => {
                                    if (j) {
                                        let t = p(e.placement);
                                        return t === F || "y" === t
                                    }
                                    return !0
                                }).map(e => [e.placement, e.overflows.filter(e => e > 0).reduce((e, t) => e + t, 0)]).sort((e, t) => e[1] - t[1])[0]) ? void 0 : l[0];
                                e && (n = e);
                                break
                            }
                            case "initialPlacement":
                                n = E
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
        },
        ew = function(e) {
            return void 0 === e && (e = {}), {
                name: "size",
                options: e,
                async fn(t) {
                    var n, r;
                    let l, f, {
                            placement: u,
                            rects: a,
                            platform: h,
                            elements: m
                        } = t,
                        {
                            apply: g = () => {},
                            ...y
                        } = c(e, t),
                        w = await h.detectOverflow(t, y),
                        v = s(u),
                        x = d(u),
                        b = "y" === p(u),
                        {
                            width: R,
                            height: A
                        } = a.floating;
                    "top" === v || "bottom" === v ? (l = v, f = x === (await (null == h.isRTL ? void 0 : h.isRTL(m.floating)) ? "start" : "end") ? "left" : "right") : (f = v, l = "end" === x ? "top" : "bottom");
                    let E = A - w.top - w.bottom,
                        T = R - w.left - w.right,
                        S = i(A - w[l], E),
                        C = i(R - w[f], T),
                        O = !t.middlewareData.shift,
                        L = S,
                        P = C;
                    if (null != (n = t.middlewareData.shift) && n.enabled.x && (P = T), null != (r = t.middlewareData.shift) && r.enabled.y && (L = E), O && !x) {
                        let e = o(w.left, 0),
                            t = o(w.right, 0),
                            n = o(w.top, 0),
                            r = o(w.bottom, 0);
                        b ? P = R - 2 * (0 !== e || 0 !== t ? e + t : o(w.left, w.right)) : L = A - 2 * (0 !== n || 0 !== r ? n + r : o(w.top, w.bottom))
                    }
                    await g({
                        ...t,
                        availableWidth: P,
                        availableHeight: L
                    });
                    let D = await h.getDimensions(m.floating);
                    return R !== D.width || A !== D.height ? {
                        reset: {
                            rects: !0
                        }
                    } : {}
                }
            }
        },
        ev = function(e) {
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
                            let e = O(await r.detectOverflow(t, {
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
                            let e = O(await r.detectOverflow(t, {
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
                    rects: f,
                    platform: u,
                    elements: a,
                    middlewareData: s
                } = t, {
                    element: g,
                    padding: y = 0
                } = c(e, t) || {};
                if (null == g) return {};
                let w = A(y),
                    v = {
                        x: n,
                        y: r
                    },
                    x = h(p(l)),
                    b = m(x),
                    R = await u.getDimensions(g),
                    E = "y" === x,
                    T = E ? "clientHeight" : "clientWidth",
                    S = f.reference[b] + f.reference[x] - v[x] - f.floating[b],
                    C = v[x] - f.reference[x],
                    O = await (null == u.getOffsetParent ? void 0 : u.getOffsetParent(g)),
                    L = O ? O[T] : 0;
                L && await (null == u.isElement ? void 0 : u.isElement(O)) || (L = a.floating[T] || f.floating[b]);
                let P = L / 2 - R[b] / 2 - 1,
                    D = i(w[E ? "top" : "left"], P),
                    W = i(w[E ? "bottom" : "right"], P),
                    k = L - R[b] - W,
                    H = L / 2 - R[b] / 2 + (S / 2 - C / 2),
                    F = o(D, i(H, k)),
                    M = !s.arrow && null != d(l) && H !== F && f.reference[b] / 2 - (H < D ? D : W) - R[b] / 2 < 0,
                    V = M ? H < D ? H - D : H - k : 0;
                return {
                    [x]: v[x] + V,
                    data: {
                        [x]: F,
                        centerOffset: H - F - V,
                        ...M && {
                            alignmentOffset: V
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
                        x: n,
                        y: r,
                        placement: i,
                        rects: o,
                        middlewareData: l
                    } = t, {
                        offset: f = 0,
                        mainAxis: u = !0,
                        crossAxis: a = !0
                    } = c(e, t), d = {
                        x: n,
                        y: r
                    }, m = p(i), g = h(m), y = d[g], w = d[m], v = c(f, t), x = "number" == typeof v ? {
                        mainAxis: v,
                        crossAxis: 0
                    } : {
                        mainAxis: 0,
                        crossAxis: 0,
                        ...v
                    };
                    if (u) {
                        let e = "y" === g ? "height" : "width",
                            t = o.reference[g] - o.floating[e] + x.mainAxis,
                            n = o.reference[g] + o.reference[e] - x.mainAxis;
                        y < t ? y = t : y > n && (y = n)
                    }
                    if (a) {
                        var b, R;
                        let e = "y" === g ? "width" : "height",
                            t = D.has(s(i)),
                            n = o.reference[m] - o.floating[e] + (t && (null == (b = l.offset) ? void 0 : b[m]) || 0) + (t ? 0 : x.crossAxis),
                            r = o.reference[m] + o.reference[e] + (t ? 0 : (null == (R = l.offset) ? void 0 : R[m]) || 0) - (t ? x.crossAxis : 0);
                        w < n ? w = n : w > r && (w = r)
                    }
                    return {
                        [g]: y,
                        [m]: w
                    }
                }
            }
        },
        eR = (e, t, n) => {
            let r = new Map,
                i = {
                    platform: eh,
                    ...n
                },
                o = {
                    ...i.platform,
                    _c: r
                };
            return C(e, t, {
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
                    rects: f,
                    middlewareData: u,
                    placement: a,
                    platform: h,
                    elements: m
                } = t, {
                    crossAxis: p = !1,
                    alignment: w,
                    allowedPlacements: v = r,
                    autoAlignment: x = !0,
                    ...b
                } = c(e, t), R = void 0 !== w || v === r ? ((l = w || null) ? [...v.filter(e => d(e) === l), ...v.filter(e => d(e) !== l)] : v.filter(e => s(e) === e)).filter(e => !l || d(e) === l || !!x && y(e) !== e) : v, A = await h.detectOverflow(t, b), E = (null == (n = u.autoPlacement) ? void 0 : n.index) || 0, T = R[E];
                if (null == T) return {};
                let S = g(T, f, await (null == h.isRTL ? void 0 : h.isRTL(m.floating)));
                if (a !== T) return {
                    reset: {
                        placement: R[0]
                    }
                };
                let C = [A[s(T)], A[S[0]], A[S[1]]],
                    O = [...(null == (i = u.autoPlacement) ? void 0 : i.overflows) || [], {
                        placement: T,
                        overflows: C
                    }],
                    L = R[E + 1];
                if (L) return {
                    data: {
                        index: E + 1,
                        overflows: O
                    },
                    reset: {
                        placement: L
                    }
                };
                let P = O.map(e => {
                        let t = d(e.placement);
                        return [e.placement, t && p ? e.overflows.slice(0, 2).reduce((e, t) => e + t, 0) : e.overflows[0], e.overflows]
                    }).sort((e, t) => e[1] - t[1]),
                    D = (null == (o = P.filter(e => e[2].slice(0, d(e[0]) ? 2 : 3).every(e => e <= 0))[0]) ? void 0 : o[0]) || P[0][0];
                return D !== a ? {
                    data: {
                        index: E + 1,
                        overflows: O
                    },
                    reset: {
                        placement: D
                    }
                } : {}
            }
        }
    }, "n", 0, function(e, t, n, r) {
        let l;
        void 0 === r && (r = {});
        let {
            ancestorScroll: u = !0,
            ancestorResize: a = !0,
            elementResize: c = "function" == typeof ResizeObserver,
            layoutShift: s = "function" == typeof IntersectionObserver,
            animationFrame: d = !1
        } = r, h = et(e), m = u || a ? [...h ? G(h) : [], ...t ? G(t) : []] : [];
        m.forEach(e => {
            u && e.addEventListener("scroll", n, {
                passive: !0
            }), a && e.addEventListener("resize", n)
        });
        let p = h && s ? function(e, t) {
                let n, r = null,
                    l = M(e);

                function u() {
                    var e;
                    clearTimeout(n), null == (e = r) || e.disconnect(), r = null
                }
                return ! function a(c, s) {
                    void 0 === c && (c = !1), void 0 === s && (s = 1), u();
                    let d = e.getBoundingClientRect(),
                        {
                            left: h,
                            top: m,
                            width: p,
                            height: g
                        } = d;
                    if (c || t(), !p || !g) return;
                    let y = {
                            rootMargin: -f(m) + "px " + -f(l.clientWidth - (h + p)) + "px " + -f(l.clientHeight - (m + g)) + "px " + -f(h) + "px",
                            threshold: o(0, i(1, s)) || 1
                        },
                        w = !0;

                    function v(t) {
                        let r = t[0].intersectionRatio;
                        if (r !== s) {
                            if (!w) return a();
                            r ? a(!1, r) : n = setTimeout(() => {
                                a(!1, 1e-7)
                            }, 1e3)
                        }
                        1 !== r || em(d, e.getBoundingClientRect()) || a(), w = !1
                    }
                    try {
                        r = new IntersectionObserver(v, {
                            ...y,
                            root: l.ownerDocument
                        })
                    } catch (e) {
                        r = new IntersectionObserver(v, y)
                    }
                    r.observe(e)
                }(!0), u
            }(h, n) : null,
            g = -1,
            y = null;
        c && (y = new ResizeObserver(e => {
            let [r] = e;
            r && r.target === h && y && t && (y.unobserve(t), cancelAnimationFrame(g), g = requestAnimationFrame(() => {
                var e;
                null == (e = y) || e.observe(t)
            })), n()
        }), h && !d && y.observe(h), t && y.observe(t));
        let w = d ? eo(e) : null;
        return d && function t() {
            let r = eo(e);
            w && !em(w, r) && n(), w = r, l = requestAnimationFrame(t)
        }(), n(), () => {
            var e;
            m.forEach(e => {
                u && e.removeEventListener("scroll", n), a && e.removeEventListener("resize", n)
            }), null == p || p(), null == (e = y) || e.disconnect(), y = null, d && cancelAnimationFrame(l)
        }
    }, "A", 0, eR, "x", 0, ey, "c", 0, ev, "g", 0, function(e) {
        return void 0 === e && (e = {}), {
            name: "inline",
            options: e,
            async fn(t) {
                let {
                    placement: n,
                    elements: r,
                    rects: l,
                    platform: f,
                    strategy: u
                } = t, {
                    padding: a = 2,
                    x: d,
                    y: h
                } = c(e, t), m = Array.from(await (null == f.getClientRects ? void 0 : f.getClientRects(r.reference)) || []), g = function(e) {
                    let t = e.slice().sort((e, t) => e.y - t.y),
                        n = [],
                        r = null;
                    for (let e = 0; e < t.length; e++) {
                        let i = t[e];
                        !r || i.y - r.y > r.height / 2 ? n.push([i]) : n[n.length - 1].push(i), r = i
                    }
                    return n.map(e => E(P(e)))
                }(m), y = E(P(m)), w = A(a), v = await f.getElementRects({
                    reference: {
                        getBoundingClientRect: function() {
                            if (2 === g.length && g[0].left > g[1].right && null != d && null != h) return g.find(e => d > e.left - w.left && d < e.right + w.right && h > e.top - w.top && h < e.bottom + w.bottom) || y;
                            if (g.length >= 2) {
                                if ("y" === p(n)) {
                                    let e = g[0],
                                        t = g[g.length - 1],
                                        r = "top" === s(n),
                                        i = e.top,
                                        o = t.bottom,
                                        l = r ? e.left : t.left,
                                        f = r ? e.right : t.right;
                                    return {
                                        top: i,
                                        bottom: o,
                                        left: l,
                                        right: f,
                                        width: f - l,
                                        height: o - i,
                                        x: l,
                                        y: i
                                    }
                                }
                                let e = "left" === s(n),
                                    t = o(...g.map(e => e.right)),
                                    r = i(...g.map(e => e.left)),
                                    l = g.filter(n => e ? n.left === r : n.right === t),
                                    f = l[0].top,
                                    u = l[l.length - 1].bottom;
                                return {
                                    top: f,
                                    bottom: u,
                                    left: r,
                                    right: t,
                                    width: t - r,
                                    height: u - f,
                                    x: r,
                                    y: f
                                }
                            }
                            return y
                        }
                    },
                    floating: r.floating,
                    strategy: u
                });
                return l.reference.x !== v.reference.x || l.reference.y !== v.reference.y || l.reference.width !== v.reference.width || l.reference.height !== v.reference.height ? {
                    reset: {
                        rects: v
                    }
                } : {}
            }
        }
    }, "o", 0, eb, "T", 0, ep, "e", 0, eg, "q", 0, ew], 350303);
    var eA = e.i(643766),
        eE = e.i(860663),
        eT = "u" > typeof document ? eA.useLayoutEffect : function() {};

    function eS(e, t) {
        let n, r, i;
        if (e === t) return !0;
        if (typeof e != typeof t) return !1;
        if ("function" == typeof e && e.toString() === t.toString()) return !0;
        if (e && t && "object" == typeof e) {
            if (Array.isArray(e)) {
                if ((n = e.length) !== t.length) return !1;
                for (r = n; 0 != r--;)
                    if (!eS(e[r], t[r])) return !1;
                return !0
            }
            if ((n = (i = Object.keys(e)).length) !== Object.keys(t).length) return !1;
            for (r = n; 0 != r--;)
                if (!({}).hasOwnProperty.call(t, i[r])) return !1;
            for (r = n; 0 != r--;) {
                let n = i[r];
                if (("_owner" !== n || !e.$$typeof) && !eS(e[n], t[n])) return !1
            }
            return !0
        }
        return e != e && t != t
    }

    function eC(e) {
        return "u" < typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
    }

    function eO(e, t) {
        let n = eC(e);
        return Math.round(t * n) / n
    }

    function eL(e) {
        let t = eA.useRef(e);
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
        let n = ey(e);
        return {
            name: n.name,
            fn: n.fn,
            options: [e, t]
        }
    }, "c", 0, (e, t) => {
        let n = ev(e);
        return {
            name: n.name,
            fn: n.fn,
            options: [e, t]
        }
    }, "n", 0, (e, t) => ({
        fn: eb(e).fn,
        options: [e, t]
    }), "T", 0, (e, t) => {
        let n = ep(e);
        return {
            name: n.name,
            fn: n.fn,
            options: [e, t]
        }
    }, "e", 0, (e, t) => {
        let n = eg(e);
        return {
            name: n.name,
            fn: n.fn,
            options: [e, t]
        }
    }, "o", 0, (e, t) => {
        let n = ew(e);
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
            transform: f = !0,
            whileElementsMounted: u,
            open: a
        } = e, [c, s] = eA.useState({
            x: 0,
            y: 0,
            strategy: n,
            placement: t,
            middlewareData: {},
            isPositioned: !1
        }), [d, h] = eA.useState(r);
        eS(d, r) || h(r);
        let [m, p] = eA.useState(null), [g, y] = eA.useState(null), w = eA.useCallback(e => {
            e !== R.current && (R.current = e, p(e))
        }, []), v = eA.useCallback(e => {
            e !== A.current && (A.current = e, y(e))
        }, []), x = o || m, b = l || g, R = eA.useRef(null), A = eA.useRef(null), E = eA.useRef(c), T = null != u, S = eL(u), C = eL(i), O = eL(a), L = eA.useCallback(() => {
            if (!R.current || !A.current) return;
            let e = {
                placement: t,
                strategy: n,
                middleware: d
            };
            C.current && (e.platform = C.current), eR(R.current, A.current, e).then(e => {
                let t = {
                    ...e,
                    isPositioned: !1 !== O.current
                };
                P.current && !eS(E.current, t) && (E.current = t, eE.flushSync(() => {
                    s(t)
                }))
            })
        }, [d, t, n, C, O]);
        eT(() => {
            !1 === a && E.current.isPositioned && (E.current.isPositioned = !1, s(e => ({
                ...e,
                isPositioned: !1
            })))
        }, [a]);
        let P = eA.useRef(!1);
        eT(() => (P.current = !0, () => {
            P.current = !1
        }), []), eT(() => {
            if (x && (R.current = x), b && (A.current = b), x && b) {
                if (S.current) return S.current(x, b, L);
                L()
            }
        }, [x, b, L, S, T]);
        let D = eA.useMemo(() => ({
                reference: R,
                floating: A,
                setReference: w,
                setFloating: v
            }), [w, v]),
            W = eA.useMemo(() => ({
                reference: x,
                floating: b
            }), [x, b]),
            k = eA.useMemo(() => {
                let e = {
                    position: n,
                    left: 0,
                    top: 0
                };
                if (!W.floating) return e;
                let t = eO(W.floating, c.x),
                    r = eO(W.floating, c.y);
                return f ? {
                    ...e,
                    transform: "translate(" + t + "px, " + r + "px)",
                    ...eC(W.floating) >= 1.5 && {
                        willChange: "transform"
                    }
                } : {
                    position: n,
                    left: t,
                    top: r
                }
            }, [n, f, W.floating, c.x, c.y]);
        return eA.useMemo(() => ({
            ...c,
            update: L,
            refs: D,
            elements: W,
            floatingStyles: k
        }), [c, L, D, W, k])
    }], 980891)
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
        let o, f = (i = e, (o = t.forwardRef((e, r) => {
                let {
                    children: i,
                    ...o
                } = e;
                if (t.isValidElement(i)) {
                    var l, f, u;
                    let e, a, c = (a = (e = null == (f = Object.getOwnPropertyDescriptor((l = i).props, "ref")) ? void 0 : f.get) && "isReactWarning" in e && e.isReactWarning) ? l.ref : (a = (e = null == (u = Object.getOwnPropertyDescriptor(l, "ref")) ? void 0 : u.get) && "isReactWarning" in e && e.isReactWarning) ? l.props.ref : l.props.ref || l.ref,
                        s = function(e, t) {
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
                    return i.type !== t.Fragment && (s.ref = r ? (0, n.Q)(r, c) : c), t.cloneElement(i, s)
                }
                return t.Children.count(i) > 1 ? t.Children.only(null) : null
            })).displayName = "".concat(i, ".SlotClone"), o),
            u = t.forwardRef((e, n) => {
                let {
                    children: i,
                    ...o
                } = e, u = t.Children.toArray(i), a = u.find(l);
                if (a) {
                    let e = a.props.children,
                        i = u.map(n => n !== a ? n : t.Children.count(e) > 1 ? t.Children.only(null) : t.isValidElement(e) ? e.props.children : null);
                    return (0, r.jsx)(f, {
                        ...o,
                        ref: n,
                        children: t.isValidElement(e) ? t.cloneElement(e, void 0, i) : null
                    })
                }
                return (0, r.jsx)(f, {
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
    var f = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce((e, n) => {
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
    e.s(["f", 0, f], 546633)
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
        } = e, [f, u, a] = function(e) {
            let {
                defaultProp: n,
                onChange: i
            } = e, [o, l] = t.useState(n), f = t.useRef(o), u = t.useRef(i);
            return r(() => {
                u.current = i
            }, [i]), t.useEffect(() => {
                if (f.current !== o) {
                    var e;
                    null == (e = u.current) || e.call(u, o), f.current = o
                }
            }, [o, f]), [o, l, u]
        }({
            defaultProp: i,
            onChange: o
        }), c = void 0 !== n, s = c ? n : f;
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
        return [s, t.useCallback(e => {
            if (c) {
                let r = "function" == typeof e ? e(n) : e;
                if (r !== n) {
                    var t;
                    null == (t = a.current) || t.call(a, r)
                }
            } else u(e)
        }, [c, n, u, a])]
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

//# debugId=00757cfb-31f6-1234-d803-9513c10f9a04
//# sourceMappingURL=3y_k8v92p2nqf.js.map