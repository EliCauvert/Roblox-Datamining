;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "1e59c807-edd2-df2b-6996-99fdb3f18977")
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

    function S(e, t, n) {
        let r, {
                reference: i,
                floating: o
            } = e,
            l = h(t),
            a = p(h(t)),
            s = m(a),
            u = f(t),
            c = "y" === l,
            v = i.x + i.width / 2 - o.width / 2,
            g = i.y + i.height / 2 - o.height / 2,
            y = i[s] / 2 - o[s] / 2;
        switch (u) {
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
    async function T(e, t) {
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
        } = c(t, e), h = R(m), v = a[p ? "floating" === d ? "reference" : "floating" : d], g = C(await o.getClippingRect({
            element: null == (n = await (null == o.isElement ? void 0 : o.isElement(v))) || n ? v : v.contextElement || await (null == o.getDocumentElement ? void 0 : o.getDocumentElement(a.floating)),
            boundary: u,
            rootBoundary: f,
            strategy: s
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
            strategy: s
        }) : y);
        return {
            top: (g.top - b.top + h.top) / x.y,
            bottom: (b.bottom - g.bottom + h.bottom) / x.y,
            left: (g.left - b.left + h.left) / x.x,
            right: (b.right - g.right + h.right) / x.x
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
            detectOverflow: T
        }, s = await (null == l.isRTL ? void 0 : l.isRTL(t)), u = await l.getElementRects({
            reference: e,
            floating: t,
            strategy: i
        }), {
            x: c,
            y: f
        } = S(u, r, s), d = r, p = 0, m = {};
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
                rects: u,
                platform: a,
                elements: {
                    reference: e,
                    floating: t
                }
            });
            c = null != y ? y : c, f = null != w ? w : f, m[v] = {
                ...m[v],
                ...x
            }, b && p < 50 && (p++, "object" == typeof b && (b.placement && (d = b.placement), b.rects && (u = !0 === b.rects ? await l.getElementRects({
                reference: e,
                floating: t,
                strategy: i
            }) : b.rects), {
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

    function O(e, t) {
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
    async function D(e, t) {
        let {
            placement: n,
            platform: r,
            elements: i
        } = e, o = await (null == r.isRTL ? void 0 : r.isRTL(i.floating)), l = f(n), a = d(n), s = "y" === h(n), u = N.has(l) ? -1 : 1, p = o && s ? -1 : 1, m = c(t, e), {
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
        return a && "number" == typeof y && (g = "end" === a ? -1 * y : y), s ? {
            x: g * p,
            y: v * u
        } : {
            x: v * u,
            y: g * p
        }
    }

    function k() {
        return "u" > typeof window
    }

    function M(e) {
        return z(e) ? (e.nodeName || "").toLowerCase() : "#document"
    }

    function j(e) {
        var t;
        return (null == e || null == (t = e.ownerDocument) ? void 0 : t.defaultView) || window
    }

    function W(e) {
        var t;
        return null == (t = (z(e) ? e.ownerDocument : e.document) || window.document) ? void 0 : t.documentElement
    }

    function z(e) {
        return !!k() && (e instanceof Node || e instanceof j(e).Node)
    }

    function H(e) {
        return !!k() && (e instanceof Element || e instanceof j(e).Element)
    }

    function F(e) {
        return !!k() && (e instanceof HTMLElement || e instanceof j(e).HTMLElement)
    }

    function I(e) {
        return !(!k() || "u" < typeof ShadowRoot) && (e instanceof ShadowRoot || e instanceof j(e).ShadowRoot)
    }

    function _(e) {
        let {
            overflow: t,
            overflowX: n,
            overflowY: r,
            display: i
        } = Z(e);
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

    function Y(e) {
        let t = H(e) ? Z(e) : e;
        return X(t.transform) || X(t.translate) || X(t.scale) || X(t.rotate) || X(t.perspective) || !q() && (X(t.backdropFilter) || X(t.filter)) || U.test(t.willChange || "") || V.test(t.contain || "")
    }

    function q() {
        return null == t && (t = "u" > typeof CSS && CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")), t
    }

    function $(e) {
        return /^(html|body|#document)$/.test(M(e))
    }

    function Z(e) {
        return j(e).getComputedStyle(e)
    }

    function K(e) {
        return H(e) ? {
            scrollLeft: e.scrollLeft,
            scrollTop: e.scrollTop
        } : {
            scrollLeft: e.scrollX,
            scrollTop: e.scrollY
        }
    }

    function G(e) {
        if ("html" === M(e)) return e;
        let t = e.assignedSlot || e.parentNode || I(e) && e.host || W(e);
        return I(t) ? t.host : t
    }

    function J(e, t, n) {
        var r;
        void 0 === t && (t = []), void 0 === n && (n = !0);
        let i = function e(t) {
                let n = G(t);
                return $(n) ? t.ownerDocument ? t.ownerDocument.body : t.body : F(n) && _(n) ? n : e(n)
            }(e),
            o = i === (null == (r = e.ownerDocument) ? void 0 : r.body),
            l = j(i);
        if (!o) return t.concat(i, J(i, [], n));
        {
            let e = Q(l);
            return t.concat(l, l.visualViewport || [], _(i) ? i : [], e && n ? J(e) : [])
        }
    }

    function Q(e) {
        return e.parent && Object.getPrototypeOf(e.parent) ? e.frameElement : null
    }

    function ee(e) {
        let t = Z(e),
            n = parseFloat(t.width) || 0,
            r = parseFloat(t.height) || 0,
            i = F(e),
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
        return H(e) ? e : e.contextElement
    }

    function en(e) {
        let t = et(e);
        if (!F(t)) return s(1);
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
        let t = j(e);
        return q() && t.visualViewport ? {
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
        t && (r ? H(r) && (a = en(r)) : a = en(e));
        let u = (void 0 === (i = n) && (i = !1), r && (!i || r === j(l)) && i) ? ei(l) : s(0),
            c = (o.left + u.x) / a.x,
            f = (o.top + u.y) / a.y,
            d = o.width / a.x,
            p = o.height / a.y;
        if (l) {
            let e = j(l),
                t = r && H(r) ? j(r) : r,
                n = e,
                i = Q(n);
            for (; i && r && t !== n;) {
                let e = en(i),
                    t = i.getBoundingClientRect(),
                    r = Z(i),
                    o = t.left + (i.clientLeft + parseFloat(r.paddingLeft)) * e.x,
                    l = t.top + (i.clientTop + parseFloat(r.paddingTop)) * e.y;
                c *= e.x, f *= e.y, d *= e.x, p *= e.y, c += o, f += l, i = Q(n = j(i))
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
        let n = K(e).scrollLeft;
        return t ? t.left + n : eo(W(e)).left + n
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
            let n = j(e),
                r = W(e),
                i = n.visualViewport,
                o = r.clientWidth,
                l = r.clientHeight,
                a = 0,
                s = 0;
            if (i) {
                o = i.width, l = i.height;
                let e = q();
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
            r = W(e), t = W(r), n = K(r), l = r.ownerDocument.body, a = o(t.scrollWidth, t.clientWidth, l.scrollWidth, l.clientWidth), s = o(t.scrollHeight, t.clientHeight, l.scrollHeight, l.clientHeight), u = -n.scrollLeft + el(r), c = -n.scrollTop, "rtl" === Z(l).direction && (u += o(t.clientWidth, l.clientWidth) - a), i = {
                width: a,
                height: s,
                x: u,
                y: c
            }
        } else if (H(t)) {
            let e, r, o, l, a, u;
            r = (e = eo(t, !0, "fixed" === n)).top + t.clientTop, o = e.left + t.clientLeft, l = F(t) ? en(t) : s(1), a = t.clientWidth * l.x, u = t.clientHeight * l.y, i = {
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
        return C(i)
    }

    function eu(e) {
        return "static" === Z(e).position
    }

    function ec(e, t) {
        if (!F(e) || "fixed" === Z(e).position) return null;
        if (t) return t(e);
        let n = e.offsetParent;
        return W(e) === n && (n = n.ownerDocument.body), n
    }

    function ef(e, t) {
        var n;
        let r = j(e);
        if (B(e)) return r;
        if (!F(e)) {
            let t = G(e);
            for (; t && !$(t);) {
                if (H(t) && !eu(t)) return t;
                t = G(t)
            }
            return r
        }
        let i = ec(e, t);
        for (; i && (n = i, /^(table|td|th)$/.test(M(n))) && eu(i);) i = ec(i, t);
        return i && $(i) && eu(i) && !Y(i) ? r : i || function(e) {
            let t = G(e);
            for (; F(t) && !$(t);) {
                if (Y(t)) return t;
                if (B(t)) break;
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
                let r = F(t),
                    i = W(t),
                    o = "fixed" === n,
                    l = eo(e, !0, o, t),
                    a = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    u = s(0);
                if (r || !r && !o)
                    if (("body" !== M(t) || _(i)) && (a = K(t)), r) {
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
            } = e, o = "fixed" === i, l = W(r), a = !!t && B(t.floating);
            if (r === l || a && o) return n;
            let u = {
                    scrollLeft: 0,
                    scrollTop: 0
                },
                c = s(1),
                f = s(0),
                d = F(r);
            if ((d || !d && !o) && (("body" !== M(r) || _(l)) && (u = K(r)), d)) {
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
                let r = J(e, [], !1).filter(e => H(e) && "body" !== M(e)),
                    i = null,
                    o = "fixed" === Z(e).position,
                    l = o ? G(e) : e;
                for (; H(l) && !$(l);) {
                    let t = Z(l),
                        n = Y(l);
                    n || "fixed" !== t.position || (i = null), (o ? n || i : !(!n && "static" === t.position && i && ("absolute" === i.position || "fixed" === i.position) || _(l) && !n && function e(t, n) {
                        let r = G(t);
                        return !(r === n || !H(r) || $(r)) && ("fixed" === Z(r).position || e(r, n))
                    }(e, l))) ? i = t : r = r.filter(e => e !== l), l = G(l)
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
        isElement: H,
        isRTL: function(e) {
            return "rtl" === Z(e).direction
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
                    } = t, s = await D(t, e);
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
                    } = c(e, t), v = {
                        x: n,
                        y: r
                    }, g = await a.detectOverflow(t, m), y = h(f(l)), w = p(y), x = v[w], b = v[y];
                    if (s) {
                        let e = "y" === w ? "top" : "left",
                            t = "y" === w ? "bottom" : "right",
                            n = x + g[e],
                            r = x - g[t];
                        x = o(n, i(x, r))
                    }
                    if (u) {
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
                    var n, r, i, o, l;
                    let a, s, u, {
                            placement: p,
                            middlewareData: m,
                            rects: R,
                            initialPlacement: C,
                            platform: S,
                            elements: T
                        } = t,
                        {
                            mainAxis: L = !0,
                            crossAxis: O = !0,
                            fallbackPlacements: A,
                            fallbackStrategy: P = "bestFit",
                            fallbackAxisSideDirection: N = "none",
                            flipAlignment: D = !0,
                            ...k
                        } = c(e, t);
                    if (null != (n = m.arrow) && n.alignmentOffset) return {};
                    let M = f(p),
                        j = h(C),
                        W = f(C) === C,
                        z = await (null == S.isRTL ? void 0 : S.isRTL(T.floating)),
                        H = A || (W || !D ? [E(C)] : (a = E(C), [g(C), a, g(a)])),
                        F = "none" !== N;
                    !A && F && H.push(...(s = d(C), u = function(e, t, n) {
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
                    }(f(C), "start" === N, z), s && (u = u.map(e => e + "-" + s), D && (u = u.concat(u.map(g)))), u));
                    let I = [C, ...H],
                        _ = await S.detectOverflow(t, k),
                        B = [],
                        U = (null == (r = m.flip) ? void 0 : r.overflows) || [];
                    if (L && B.push(_[M]), O) {
                        let e = v(p, R, z);
                        B.push(_[e[0]], _[e[1]])
                    }
                    if (U = [...U, {
                            placement: p,
                            overflows: B
                        }], !B.every(e => e <= 0)) {
                        let e = ((null == (i = m.flip) ? void 0 : i.index) || 0) + 1,
                            t = I[e];
                        if (t && ("alignment" !== O || j === h(t) || U.every(e => h(e.placement) !== j || e.overflows[0] > 0))) return {
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
                                    if (F) {
                                        let t = h(e.placement);
                                        return t === j || "y" === t
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
                            placement: s,
                            rects: u,
                            platform: p,
                            elements: m
                        } = t,
                        {
                            apply: v = () => {},
                            ...g
                        } = c(e, t),
                        y = await p.detectOverflow(t, g),
                        w = f(s),
                        x = d(s),
                        b = "y" === h(s),
                        {
                            width: E,
                            height: R
                        } = u.floating;
                    "top" === w || "bottom" === w ? (l = w, a = x === (await (null == p.isRTL ? void 0 : p.isRTL(m.floating)) ? "start" : "end") ? "left" : "right") : (a = w, l = "end" === x ? "top" : "bottom");
                    let C = R - y.top - y.bottom,
                        S = E - y.left - y.right,
                        T = i(R - y[l], C),
                        L = i(E - y[a], S),
                        O = !t.middlewareData.shift,
                        A = T,
                        P = L;
                    if (null != (n = t.middlewareData.shift) && n.enabled.x && (P = S), null != (r = t.middlewareData.shift) && r.enabled.y && (A = C), O && !x) {
                        let e = o(y.left, 0),
                            t = o(y.right, 0),
                            n = o(y.top, 0),
                            r = o(y.bottom, 0);
                        b ? P = E - 2 * (0 !== e || 0 !== t ? e + t : o(y.left, y.right)) : A = R - 2 * (0 !== n || 0 !== r ? n + r : o(y.top, y.bottom))
                    }
                    await v({
                        ...t,
                        availableWidth: P,
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
                            let e = O(await r.detectOverflow(t, {
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
                            let e = O(await r.detectOverflow(t, {
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
                    platform: s,
                    elements: u,
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
                    E = await s.getDimensions(v),
                    C = "y" === x,
                    S = C ? "clientHeight" : "clientWidth",
                    T = a.reference[b] + a.reference[x] - w[x] - a.floating[b],
                    L = w[x] - a.reference[x],
                    O = await (null == s.getOffsetParent ? void 0 : s.getOffsetParent(v)),
                    A = O ? O[S] : 0;
                A && await (null == s.isElement ? void 0 : s.isElement(O)) || (A = u.floating[S] || a.floating[b]);
                let P = A / 2 - E[b] / 2 - 1,
                    N = i(y[C ? "top" : "left"], P),
                    D = i(y[C ? "bottom" : "right"], P),
                    k = A - E[b] - D,
                    M = A / 2 - E[b] / 2 + (T / 2 - L / 2),
                    j = o(N, i(M, k)),
                    W = !f.arrow && null != d(l) && M !== j && a.reference[b] / 2 - (M < N ? N : D) - E[b] / 2 < 0,
                    z = W ? M < N ? M - N : M - k : 0;
                return {
                    [x]: w[x] + z,
                    data: {
                        [x]: j,
                        centerOffset: M - j - z,
                        ...W && {
                            alignmentOffset: z
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
                        mainAxis: s = !0,
                        crossAxis: u = !0
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
                    if (s) {
                        let e = "y" === v ? "height" : "width",
                            t = o.reference[v] - o.floating[e] + x.mainAxis,
                            n = o.reference[v] + o.reference[e] - x.mainAxis;
                        g < t ? g = t : g > n && (g = n)
                    }
                    if (u) {
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
            return L(e, t, {
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
                    middlewareData: s,
                    placement: u,
                    platform: p,
                    elements: m
                } = t, {
                    crossAxis: h = !1,
                    alignment: y,
                    allowedPlacements: w = r,
                    autoAlignment: x = !0,
                    ...b
                } = c(e, t), E = void 0 !== y || w === r ? ((l = y || null) ? [...w.filter(e => d(e) === l), ...w.filter(e => d(e) !== l)] : w.filter(e => f(e) === e)).filter(e => !l || d(e) === l || !!x && g(e) !== e) : w, R = await p.detectOverflow(t, b), C = (null == (n = s.autoPlacement) ? void 0 : n.index) || 0, S = E[C];
                if (null == S) return {};
                let T = v(S, a, await (null == p.isRTL ? void 0 : p.isRTL(m.floating)));
                if (u !== S) return {
                    reset: {
                        placement: E[0]
                    }
                };
                let L = [R[f(S)], R[T[0]], R[T[1]]],
                    O = [...(null == (i = s.autoPlacement) ? void 0 : i.overflows) || [], {
                        placement: S,
                        overflows: L
                    }],
                    A = E[C + 1];
                if (A) return {
                    data: {
                        index: C + 1,
                        overflows: O
                    },
                    reset: {
                        placement: A
                    }
                };
                let P = O.map(e => {
                        let t = d(e.placement);
                        return [e.placement, t && h ? e.overflows.slice(0, 2).reduce((e, t) => e + t, 0) : e.overflows[0], e.overflows]
                    }).sort((e, t) => e[1] - t[1]),
                    N = (null == (o = P.filter(e => e[2].slice(0, d(e[0]) ? 2 : 3).every(e => e <= 0))[0]) ? void 0 : o[0]) || P[0][0];
                return N !== u ? {
                    data: {
                        index: C + 1,
                        overflows: O
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
        let h = p && f ? function(e, t) {
                let n, r = null,
                    l = W(e);

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
                            if (!y) return u();
                            r ? u(!1, r) : n = setTimeout(() => {
                                u(!1, 1e-7)
                            }, 1e3)
                        }
                        1 !== r || em(d, e.getBoundingClientRect()) || u(), y = !1
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
                }(!0), s
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
                s && e.removeEventListener("scroll", n), u && e.removeEventListener("resize", n)
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
                    strategy: s
                } = t, {
                    padding: u = 2,
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
                    return n.map(e => C(P(e)))
                }(m), g = C(P(m)), y = R(u), w = await a.getElementRects({
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
                            return g
                        }
                    },
                    floating: r.floating,
                    strategy: s
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
        eS = "u" > typeof document ? eR.useLayoutEffect : function() {};

    function eT(e, t) {
        let n, r, i;
        if (e === t) return !0;
        if (typeof e != typeof t) return !1;
        if ("function" == typeof e && e.toString() === t.toString()) return !0;
        if (e && t && "object" == typeof e) {
            if (Array.isArray(e)) {
                if ((n = e.length) !== t.length) return !1;
                for (r = n; 0 != r--;)
                    if (!eT(e[r], t[r])) return !1;
                return !0
            }
            if ((n = (i = Object.keys(e)).length) !== Object.keys(t).length) return !1;
            for (r = n; 0 != r--;)
                if (!({}).hasOwnProperty.call(t, i[r])) return !1;
            for (r = n; 0 != r--;) {
                let n = i[r];
                if (("_owner" !== n || !e.$$typeof) && !eT(e[n], t[n])) return !1
            }
            return !0
        }
        return e != e && t != t
    }

    function eL(e) {
        return "u" < typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
    }

    function eO(e, t) {
        let n = eL(e);
        return Math.round(t * n) / n
    }

    function eA(e) {
        let t = eR.useRef(e);
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
            whileElementsMounted: s,
            open: u
        } = e, [c, f] = eR.useState({
            x: 0,
            y: 0,
            strategy: n,
            placement: t,
            middlewareData: {},
            isPositioned: !1
        }), [d, p] = eR.useState(r);
        eT(d, r) || p(r);
        let [m, h] = eR.useState(null), [v, g] = eR.useState(null), y = eR.useCallback(e => {
            e !== E.current && (E.current = e, h(e))
        }, []), w = eR.useCallback(e => {
            e !== R.current && (R.current = e, g(e))
        }, []), x = o || m, b = l || v, E = eR.useRef(null), R = eR.useRef(null), C = eR.useRef(c), S = null != s, T = eA(s), L = eA(i), O = eA(u), A = eR.useCallback(() => {
            if (!E.current || !R.current) return;
            let e = {
                placement: t,
                strategy: n,
                middleware: d
            };
            L.current && (e.platform = L.current), eE(E.current, R.current, e).then(e => {
                let t = {
                    ...e,
                    isPositioned: !1 !== O.current
                };
                P.current && !eT(C.current, t) && (C.current = t, eC.flushSync(() => {
                    f(t)
                }))
            })
        }, [d, t, n, L, O]);
        eS(() => {
            !1 === u && C.current.isPositioned && (C.current.isPositioned = !1, f(e => ({
                ...e,
                isPositioned: !1
            })))
        }, [u]);
        let P = eR.useRef(!1);
        eS(() => (P.current = !0, () => {
            P.current = !1
        }), []), eS(() => {
            if (x && (E.current = x), b && (R.current = b), x && b) {
                if (T.current) return T.current(x, b, A);
                A()
            }
        }, [x, b, A, T, S]);
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
            k = eR.useMemo(() => {
                let e = {
                    position: n,
                    left: 0,
                    top: 0
                };
                if (!D.floating) return e;
                let t = eO(D.floating, c.x),
                    r = eO(D.floating, c.y);
                return a ? {
                    ...e,
                    transform: "translate(" + t + "px, " + r + "px)",
                    ...eL(D.floating) >= 1.5 && {
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
            floatingStyles: k
        }), [c, A, N, D, k])
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
            let h, {
                className: v,
                icon: g,
                ariaLabel: y,
                isDisabled: w = !1,
                isCircular: x = !1,
                isSelected: b = !1,
                size: E = "Large",
                variant: R = "Emphasis",
                iconColor: C = "Default",
                asChild: S,
                children: T,
                ...L
            } = e;
            h = w ? c[R] : b ? f[R] : u[R];
            let O = (0, r.default)("foundation-web-icon-button", w ? n.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", l[E], s[E][x ? "circular" : "square"], h, v),
                A = i.default.createElement(i.default.Fragment, null, i.default.createElement(t.StateLayer, null), i.default.createElement("span", {
                    className: (0, r.default)("icon", g, a[E], w ? p[C][R] : d[C][R])
                }));
            if (S) {
                let {
                    as: e,
                    ...t
                } = L, n = i.default.Children.only(T);
                return i.default.createElement(o.Slot, {
                    ref: m,
                    ...t,
                    className: O,
                    "aria-label": y,
                    "aria-disabled": w || void 0
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
                    "aria-disabled": w,
                    href: w ? void 0 : t,
                    className: O
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
                disabled: w,
                className: O
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
        h = e.i(993032),
        v = "Popper",
        [g, y] = (0, l.createContextScope)(v),
        [w, x] = g(v),
        b = e => {
            let {
                __scopePopper: t,
                children: n
            } = e, [i, o] = r.useState(null);
            return (0, d.jsx)(w, {
                scope: t,
                anchor: i,
                onAnchorChange: o,
                children: n
            })
        };
    b.displayName = v;
    var E = "PopperAnchor",
        R = r.forwardRef((e, t) => {
            let {
                __scopePopper: n,
                virtualRef: i,
                ...l
            } = e, a = x(E, n), s = r.useRef(null), u = (0, o.useComposedRefs)(t, s);
            return r.useEffect(() => {
                a.onAnchorChange((null == i ? void 0 : i.current) || s.current)
            }), i ? null : (0, d.jsx)(f.Primitive.div, {
                ...l,
                ref: u
            })
        });
    R.displayName = E;
    var C = "PopperContent",
        [S, T] = g(C),
        L = r.forwardRef((e, t) => {
            var n, i, l, a, s, p, v, g;
            let {
                __scopePopper: y,
                side: w = "bottom",
                sideOffset: b = 0,
                align: E = "center",
                alignOffset: R = 0,
                arrowPadding: T = 0,
                avoidCollisions: L = !0,
                collisionBoundary: O = [],
                collisionPadding: A = 0,
                sticky: P = "partial",
                hideWhenDetached: M = !1,
                updatePositionStrategy: j = "optimized",
                onPlaced: W,
                ...z
            } = e, H = x(C, y), [F, I] = r.useState(null), _ = (0, o.useComposedRefs)(t, e => I(e)), [B, U] = r.useState(null), V = function(e) {
                let [t, n] = r.useState(void 0);
                return (0, h.useLayoutEffect)(() => {
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
            }(B), X = null != (n = null == V ? void 0 : V.width) ? n : 0, Y = null != (i = null == V ? void 0 : V.height) ? i : 0, q = "number" == typeof A ? A : {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                ...A
            }, $ = Array.isArray(O) ? O : [O], Z = $.length > 0, K = {
                padding: q,
                boundary: $.filter(N),
                altBoundary: Z
            }, {
                refs: G,
                floatingStyles: J,
                placement: Q,
                isPositioned: ee,
                middlewareData: et
            } = (0, u.useFloating)({
                strategy: "fixed",
                placement: w + ("center" !== E ? "-" + E : ""),
                whileElementsMounted: function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return (0, c.autoUpdate)(...t, {
                        animationFrame: "always" === j
                    })
                },
                elements: {
                    reference: H.anchor
                },
                middleware: [(0, u.offset)({
                    mainAxis: b + Y,
                    alignmentAxis: R
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
                    padding: T
                }), D({
                    arrowWidth: X,
                    arrowHeight: Y
                }), M && (0, u.hide)({
                    strategy: "referenceHidden",
                    ...K
                })]
            }), [en, er] = k(Q), ei = (0, m.useCallbackRef)(W);
            (0, h.useLayoutEffect)(() => {
                ee && (null == ei || ei())
            }, [ee, ei]);
            let eo = null == (l = et.arrow) ? void 0 : l.x,
                el = null == (a = et.arrow) ? void 0 : a.y,
                ea = (null == (s = et.arrow) ? void 0 : s.centerOffset) !== 0,
                [es, eu] = r.useState();
            return (0, h.useLayoutEffect)(() => {
                F && eu(window.getComputedStyle(F).zIndex)
            }, [F]), (0, d.jsx)("div", {
                ref: G.setFloating,
                "data-radix-popper-content-wrapper": "",
                style: {
                    ...J,
                    transform: ee ? J.transform : "translate(0, -200%)",
                    minWidth: "max-content",
                    zIndex: es,
                    "--radix-popper-transform-origin": [null == (p = et.transformOrigin) ? void 0 : p.x, null == (v = et.transformOrigin) ? void 0 : v.y].join(" "),
                    ...(null == (g = et.hide) ? void 0 : g.referenceHidden) && {
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
                        ref: _,
                        style: {
                            ...z.style,
                            animation: ee ? void 0 : "none"
                        }
                    })
                })
            })
        });
    L.displayName = C;
    var O = "PopperArrow",
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
            } = e, i = T(O, n), o = A[i.placedSide];
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
    P.displayName = O;
    var D = e => ({
        name: "transformOrigin",
        options: e,
        fn(t) {
            var n, r, i, o, l;
            let {
                placement: a,
                rects: s,
                middlewareData: u
            } = t, c = (null == (i = u.arrow) ? void 0 : i.centerOffset) !== 0, f = c ? 0 : e.arrowWidth, d = c ? 0 : e.arrowHeight, [p, m] = k(a), h = {
                start: "0%",
                center: "50%",
                end: "100%"
            } [m], v = (null != (n = null == (o = u.arrow) ? void 0 : o.x) ? n : 0) + f / 2, g = (null != (r = null == (l = u.arrow) ? void 0 : l.y) ? r : 0) + d / 2, y = "", w = "";
            return "bottom" === p ? (y = c ? h : "".concat(v, "px"), w = "".concat(-d, "px")) : "top" === p ? (y = c ? h : "".concat(v, "px"), w = "".concat(s.floating.height + d, "px")) : "right" === p ? (y = "".concat(-d, "px"), w = c ? h : "".concat(g, "px")) : "left" === p && (y = "".concat(s.floating.width + d, "px"), w = c ? h : "".concat(g, "px")), {
                data: {
                    x: y,
                    y: w
                }
            }
        }
    });

    function k(e) {
        let [t, n = "center"] = e.split("-");
        return [t, n]
    }
    var M = e.i(149285),
        j = r.forwardRef((e, t) => {
            var n, i;
            let {
                container: o,
                ...l
            } = e, [a, s] = r.useState(!1);
            (0, h.useLayoutEffect)(() => s(!0), []);
            let u = o || a && (null == (i = globalThis) || null == (n = i.document) ? void 0 : n.body);
            return u ? M.default.createPortal((0, d.jsx)(f.Primitive.div, {
                ...l,
                ref: t
            }), u) : null
        });
    j.displayName = "Portal";
    var W = e => {
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
                }, [u]), (0, h.useLayoutEffect)(() => {
                    let t = l.current,
                        n = a.current;
                    if (n !== e) {
                        let r = s.current,
                            i = z(t);
                        e ? c("MOUNT") : "none" === i || (null == t ? void 0 : t.display) === "none" ? c("UNMOUNT") : n && r !== i ? c("ANIMATION_OUT") : c("UNMOUNT"), a.current = e
                    }
                }, [e, c]), (0, h.useLayoutEffect)(() => {
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
    W.displayName = "Presence";
    var H = e.i(362496),
        F = r.forwardRef((e, t) => (0, d.jsx)(f.Primitive.span, {
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
    F.displayName = "VisuallyHidden";
    var [I, _] = (0, l.createContextScope)("Tooltip", [y]), B = y(), U = "TooltipProvider", V = "tooltip.open", [X, Y] = I(U), q = e => {
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
    q.displayName = U;
    var $ = "Tooltip",
        [Z, K] = I($),
        G = e => {
            let {
                __scopeTooltip: t,
                children: n,
                open: i,
                defaultOpen: o = !1,
                onOpenChange: l,
                disableHoverableContent: a,
                delayDuration: u
            } = e, c = Y($, e.__scopeTooltip), f = B(t), [p, h] = r.useState(null), v = (0, s.useId)(), g = r.useRef(0), y = null != a ? a : c.disableHoverableContent, w = null != u ? u : c.delayDuration, x = r.useRef(!1), [E = !1, R] = function(e) {
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
            }), C = r.useMemo(() => E ? x.current ? "delayed-open" : "instant-open" : "closed", [E]), S = r.useCallback(() => {
                window.clearTimeout(g.current), g.current = 0, x.current = !1, R(!0)
            }, [R]), T = r.useCallback(() => {
                window.clearTimeout(g.current), g.current = 0, R(!1)
            }, [R]), L = r.useCallback(() => {
                window.clearTimeout(g.current), g.current = window.setTimeout(() => {
                    x.current = !0, R(!0), g.current = 0
                }, w)
            }, [w, R]);
            return r.useEffect(() => () => {
                g.current && (window.clearTimeout(g.current), g.current = 0)
            }, []), (0, d.jsx)(b, {
                ...f,
                children: (0, d.jsx)(Z, {
                    scope: t,
                    contentId: v,
                    open: E,
                    stateAttribute: C,
                    trigger: p,
                    onTriggerChange: h,
                    onTriggerEnter: r.useCallback(() => {
                        c.isOpenDelayed ? L() : S()
                    }, [c.isOpenDelayed, L, S]),
                    onTriggerLeave: r.useCallback(() => {
                        y ? T() : (window.clearTimeout(g.current), g.current = 0)
                    }, [T, y]),
                    onOpen: S,
                    onClose: T,
                    disableHoverableContent: y,
                    children: n
                })
            })
        };
    G.displayName = $;
    var J = "TooltipTrigger",
        Q = r.forwardRef((e, t) => {
            let {
                __scopeTooltip: n,
                ...l
            } = e, a = K(J, n), s = Y(J, n), u = B(n), c = r.useRef(null), p = (0, o.useComposedRefs)(t, c, a.onTriggerChange), m = r.useRef(!1), h = r.useRef(!1), v = r.useCallback(() => m.current = !1, []);
            return r.useEffect(() => () => document.removeEventListener("pointerup", v), [v]), (0, d.jsx)(R, {
                asChild: !0,
                ...u,
                children: (0, d.jsx)(f.Primitive.button, {
                    "aria-describedby": a.open ? a.contentId : void 0,
                    "data-state": a.stateAttribute,
                    ...l,
                    ref: p,
                    onPointerMove: (0, i.composeEventHandlers)(e.onPointerMove, e => {
                        "touch" !== e.pointerType && (h.current || s.isPointerInTransitRef.current || (a.onTriggerEnter(), h.current = !0))
                    }),
                    onPointerLeave: (0, i.composeEventHandlers)(e.onPointerLeave, () => {
                        a.onTriggerLeave(), h.current = !1
                    }),
                    onPointerDown: (0, i.composeEventHandlers)(e.onPointerDown, () => {
                        m.current = !0, document.addEventListener("pointerup", v, {
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
                children: (0, d.jsx)(W, {
                    present: n || o.open,
                    children: (0, d.jsx)(j, {
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
            return (0, d.jsx)(W, {
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
                i = Y(ei, e.__scopeTooltip),
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
                h = r.useCallback(() => {
                    u(null), m(!1)
                }, [m]),
                v = r.useCallback((e, t) => {
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
            return r.useEffect(() => () => h(), [h]), r.useEffect(() => {
                if (c && p) {
                    let e = e => v(e, p),
                        t = e => v(e, c);
                    return c.addEventListener("pointerleave", e), p.addEventListener("pointerleave", t), () => {
                        c.removeEventListener("pointerleave", e), p.removeEventListener("pointerleave", t)
                    }
                }
            }, [c, p, v, h]), r.useEffect(() => {
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
                        r ? h() : i && (h(), f())
                    };
                    return document.addEventListener("pointermove", e), () => document.removeEventListener("pointermove", e)
                }
            }, [c, p, s, f, h]), (0, d.jsx)(eu, {
                ...e,
                ref: a
            })
        }),
        [ea, es] = I($, {
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
                    children: [(0, d.jsx)(H.Slottable, {
                        children: i
                    }), (0, d.jsx)(ea, {
                        scope: n,
                        isInside: !0,
                        children: (0, d.jsx)(F, {
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
    ef.displayName = ec, e.s(["Arrow", 0, ef, "Content", 0, eo, "Portal", 0, er, "Provider", 0, q, "Root", 0, G, "Trigger", 0, Q], 989665), e.s(["Tooltip", 0, function(e) {
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
        } = e, [m, h] = i.split("-"), v = null != s ? s : "string" == typeof l && null == a ? l : void 0;
        return r.createElement(q, {
            delayDuration: u
        }, r.createElement(G, {
            open: f,
            onOpenChange: d
        }, c, r.createElement(er, null, r.createElement(eo, {
            side: m,
            align: h,
            "aria-label": v,
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
    var h = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, t) => {
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

    function v(e, t) {
        e && c.flushSync(() => e.dispatchEvent(t))
    }

    function g(e) {
        let t = i.useRef(e);
        return i.useEffect(() => {
            t.current = e
        }), i.useMemo(() => function() {
            for (var e, n = arguments.length, r = Array(n), i = 0; i < n; i++) r[i] = arguments[i];
            return null == (e = t.current) ? void 0 : e.call(t, ...r)
        }, [])
    }
    e.s(["Primitive", 0, h, "dispatchDiscreteCustomEvent", 0, v], 791634), e.s(["useCallbackRef", 0, g], 448970);
    var y = "dismissableLayer.update",
        w = i.createContext({
            layers: new Set,
            layersWithOutsidePointerEventsDisabled: new Set,
            branches: new Set
        }),
        x = i.forwardRef((e, n) => {
            var r, l;
            let {
                disableOutsidePointerEvents: a = !1,
                onEscapeKeyDown: c,
                onPointerDownOutside: f,
                onFocusOutside: d,
                onInteractOutside: p,
                onDismiss: m,
                ...v
            } = e, x = i.useContext(w), [R, C] = i.useState(null), S = null != (r = null == R ? void 0 : R.ownerDocument) ? r : null == (l = globalThis) ? void 0 : l.document, [, T] = i.useState({}), L = s(n, e => C(e)), O = Array.from(x.layers), [A] = [...x.layersWithOutsidePointerEventsDisabled].slice(-1), P = O.indexOf(A), N = R ? O.indexOf(R) : -1, D = x.layersWithOutsidePointerEventsDisabled.size > 0, k = N >= P, M = function(e) {
                var t;
                let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    r = g(e),
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
                    n = [...x.branches].some(e => e.contains(t));
                k && !n && (null == f || f(e), null == p || p(e), e.defaultPrevented || null == m || m())
            }, S), j = function(e) {
                var t;
                let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    r = g(e),
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
                ![...x.branches].some(e => e.contains(t)) && (null == d || d(e), null == p || p(e), e.defaultPrevented || null == m || m())
            }, S);
            return ! function(e) {
                var t;
                let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    r = g(e);
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
                N === x.layers.size - 1 && (null == c || c(e), !e.defaultPrevented && m && (e.preventDefault(), m()))
            }, S), i.useEffect(() => {
                if (R) return a && (0 === x.layersWithOutsidePointerEventsDisabled.size && (t = S.body.style.pointerEvents, S.body.style.pointerEvents = "none"), x.layersWithOutsidePointerEventsDisabled.add(R)), x.layers.add(R), b(), () => {
                    a && 1 === x.layersWithOutsidePointerEventsDisabled.size && (S.body.style.pointerEvents = t)
                }
            }, [R, S, a, x]), i.useEffect(() => () => {
                R && (x.layers.delete(R), x.layersWithOutsidePointerEventsDisabled.delete(R), b())
            }, [R, x]), i.useEffect(() => {
                let e = () => T({});
                return document.addEventListener(y, e), () => document.removeEventListener(y, e)
            }, []), (0, u.jsx)(h.div, {
                ...v,
                ref: L,
                style: {
                    pointerEvents: D ? k ? "auto" : "none" : void 0,
                    ...e.style
                },
                onFocusCapture: o(e.onFocusCapture, j.onFocusCapture),
                onBlurCapture: o(e.onBlurCapture, j.onBlurCapture),
                onPointerDownCapture: o(e.onPointerDownCapture, M.onPointerDownCapture)
            })
        });

    function b() {
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
        }), i ? v(o, l) : o.dispatchEvent(l)
    }
    x.displayName = "DismissableLayer", i.forwardRef((e, t) => {
        let n = i.useContext(w),
            r = i.useRef(null),
            o = s(t, r);
        return i.useEffect(() => {
            let e = r.current;
            if (e) return n.branches.add(e), () => {
                n.branches.delete(e)
            }
        }, [n.branches]), (0, u.jsx)(h.div, {
            ...e,
            ref: o
        })
    }).displayName = "DismissableLayerBranch", e.s(["DismissableLayer", 0, x], 326301);
    var R = (null == (n = globalThis) ? void 0 : n.document) ? i.useLayoutEffect : () => {};
    e.s(["useLayoutEffect", 0, R], 993032);
    var C = i["useId".toString()] || (() => void 0),
        S = 0;
    e.s(["useId", 0, function(e) {
        let [t, n] = i.useState(C());
        return R(() => {
            e || n(e => null != e ? e : String(S++))
        }, [e]), e || (t ? "radix-".concat(t) : "")
    }], 636598)
}]);

//# debugId=1e59c807-edd2-df2b-6996-99fdb3f18977
//# sourceMappingURL=1fahqges9x9f5.js.map