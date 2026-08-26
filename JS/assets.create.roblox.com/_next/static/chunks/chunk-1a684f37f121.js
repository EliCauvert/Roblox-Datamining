;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "d51388e5-0d8b-6ac5-1563-4d15fa5417ff")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 297452, 992486, t => {
    "use strict";
    let e, n = ["top", "right", "bottom", "left"],
        r = n.reduce((t, e) => t.concat(e, e + "-start", e + "-end"), []),
        i = Math.min,
        o = Math.max,
        l = Math.round,
        f = Math.floor,
        a = t => ({
            x: t,
            y: t
        }),
        u = {
            left: "right",
            right: "left",
            bottom: "top",
            top: "bottom"
        };

    function c(t, e) {
        return "function" == typeof t ? t(e) : t
    }

    function s(t) {
        return t.split("-")[0]
    }

    function d(t) {
        return t.split("-")[1]
    }

    function h(t) {
        return "x" === t ? "y" : "x"
    }

    function m(t) {
        return "y" === t ? "height" : "width"
    }

    function p(t) {
        let e = t[0];
        return "t" === e || "b" === e ? "y" : "x"
    }

    function g(t, e, n) {
        void 0 === n && (n = !1);
        let r = d(t),
            i = h(p(t)),
            o = m(i),
            l = "x" === i ? r === (n ? "end" : "start") ? "right" : "left" : "start" === r ? "bottom" : "top";
        return e.reference[o] > e.floating[o] && (l = R(l)), [l, R(l)]
    }

    function w(t) {
        return t.includes("start") ? t.replace("start", "end") : t.replace("end", "start")
    }
    let y = ["left", "right"],
        v = ["right", "left"],
        x = ["top", "bottom"],
        b = ["bottom", "top"];

    function R(t) {
        let e = s(t);
        return u[e] + t.slice(e.length)
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

    function L(t) {
        let {
            x: e,
            y: n,
            width: r,
            height: i
        } = t;
        return {
            width: r,
            height: i,
            top: n,
            left: e,
            right: e + r,
            bottom: n + i,
            x: e,
            y: n
        }
    }

    function A(t, e, n) {
        let r, {
                reference: i,
                floating: o
            } = t,
            l = p(e),
            f = h(p(e)),
            a = m(f),
            u = s(e),
            c = "y" === l,
            g = i.x + i.width / 2 - o.width / 2,
            w = i.y + i.height / 2 - o.height / 2,
            y = i[a] / 2 - o[a] / 2;
        switch (u) {
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
        switch (d(e)) {
            case "start":
                r[f] -= y * (n && c ? -1 : 1);
                break;
            case "end":
                r[f] += y * (n && c ? -1 : 1)
        }
        return r
    }
    async function O(t, e) {
        var n;
        void 0 === e && (e = {});
        let {
            x: r,
            y: i,
            platform: o,
            rects: l,
            elements: f,
            strategy: a
        } = t, {
            boundary: u = "clippingAncestors",
            rootBoundary: s = "viewport",
            elementContext: d = "floating",
            altBoundary: h = !1,
            padding: m = 0
        } = c(e, t), p = T(m), g = f[h ? "floating" === d ? "reference" : "floating" : d], w = L(await o.getClippingRect({
            element: null == (n = await (null == o.isElement ? void 0 : o.isElement(g))) || n ? g : g.contextElement || await (null == o.getDocumentElement ? void 0 : o.getDocumentElement(f.floating)),
            boundary: u,
            rootBoundary: s,
            strategy: a
        })), y = "floating" === d ? {
            x: r,
            y: i,
            width: l.floating.width,
            height: l.floating.height
        } : l.reference, v = await (null == o.getOffsetParent ? void 0 : o.getOffsetParent(f.floating)), x = await (null == o.isElement ? void 0 : o.isElement(v)) && await (null == o.getScale ? void 0 : o.getScale(v)) || {
            x: 1,
            y: 1
        }, b = L(o.convertOffsetParentRelativeRectToViewportRelativeRect ? await o.convertOffsetParentRelativeRectToViewportRelativeRect({
            elements: f,
            rect: y,
            offsetParent: v,
            strategy: a
        }) : y);
        return {
            top: (w.top - b.top + p.top) / x.y,
            bottom: (b.bottom - w.bottom + p.bottom) / x.y,
            left: (w.left - b.left + p.left) / x.x,
            right: (b.right - w.right + p.right) / x.x
        }
    }
    let C = async (t, e, n) => {
        let {
            placement: r = "bottom",
            strategy: i = "absolute",
            middleware: o = [],
            platform: l
        } = n, f = l.detectOverflow ? l : {
            ...l,
            detectOverflow: O
        }, a = await (null == l.isRTL ? void 0 : l.isRTL(e)), u = await l.getElementRects({
            reference: t,
            floating: e,
            strategy: i
        }), {
            x: c,
            y: s
        } = A(u, r, a), d = r, h = 0, m = {};
        for (let n = 0; n < o.length; n++) {
            let p = o[n];
            if (!p) continue;
            let {
                name: g,
                fn: w
            } = p, {
                x: y,
                y: v,
                data: x,
                reset: b
            } = await w({
                x: c,
                y: s,
                initialPlacement: r,
                placement: d,
                strategy: i,
                middlewareData: m,
                rects: u,
                platform: f,
                elements: {
                    reference: t,
                    floating: e
                }
            });
            c = null != y ? y : c, s = null != v ? v : s, m[g] = {
                ...m[g],
                ...x
            }, b && h < 50 && (h++, "object" == typeof b && (b.placement && (d = b.placement), b.rects && (u = !0 === b.rects ? await l.getElementRects({
                reference: t,
                floating: e,
                strategy: i
            }) : b.rects), {
                x: c,
                y: s
            } = A(u, d, a)), n = -1)
        }
        return {
            x: c,
            y: s,
            placement: d,
            strategy: i,
            middlewareData: m
        }
    };

    function E(t, e) {
        return {
            top: t.top - e.height,
            right: t.right - e.width,
            bottom: t.bottom - e.height,
            left: t.left - e.width
        }
    }

    function P(t) {
        return n.some(e => t[e] >= 0)
    }

    function S(t) {
        let e = i(...t.map(t => t.left)),
            n = i(...t.map(t => t.top));
        return {
            x: e,
            y: n,
            width: o(...t.map(t => t.right)) - e,
            height: o(...t.map(t => t.bottom)) - n
        }
    }
    let D = new Set(["left", "top"]);
    async function k(t, e) {
        let {
            placement: n,
            platform: r,
            elements: i
        } = t, o = await (null == r.isRTL ? void 0 : r.isRTL(i.floating)), l = s(n), f = d(n), a = "y" === p(n), u = D.has(l) ? -1 : 1, h = o && a ? -1 : 1, m = c(e, t), {
            mainAxis: g,
            crossAxis: w,
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
        return f && "number" == typeof y && (w = "end" === f ? -1 * y : y), a ? {
            x: w * h,
            y: g * u
        } : {
            x: g * u,
            y: w * h
        }
    }

    function F() {
        return "u" > typeof window
    }

    function H(t) {
        return B(t) ? (t.nodeName || "").toLowerCase() : "#document"
    }

    function M(t) {
        var e;
        return (null == t || null == (e = t.ownerDocument) ? void 0 : e.defaultView) || window
    }

    function W(t) {
        var e;
        return null == (e = (B(t) ? t.ownerDocument : t.document) || window.document) ? void 0 : e.documentElement
    }

    function B(t) {
        return !!F() && (t instanceof Node || t instanceof M(t).Node)
    }

    function V(t) {
        return !!F() && (t instanceof Element || t instanceof M(t).Element)
    }

    function z(t) {
        return !!F() && (t instanceof HTMLElement || t instanceof M(t).HTMLElement)
    }

    function j(t) {
        return !(!F() || "u" < typeof ShadowRoot) && (t instanceof ShadowRoot || t instanceof M(t).ShadowRoot)
    }

    function N(t) {
        let {
            overflow: e,
            overflowX: n,
            overflowY: r,
            display: i
        } = Y(t);
        return /auto|scroll|overlay|hidden|clip/.test(e + r + n) && "inline" !== i && "contents" !== i
    }

    function _(t) {
        try {
            if (t.matches(":popover-open")) return !0
        } catch (t) {}
        try {
            return t.matches(":modal")
        } catch (t) {
            return !1
        }
    }
    let $ = /transform|translate|scale|rotate|perspective|filter/,
        I = /paint|layout|strict|content/,
        U = t => !!t && "none" !== t;

    function q(t) {
        let e = V(t) ? Y(t) : t;
        return U(e.transform) || U(e.translate) || U(e.scale) || U(e.rotate) || U(e.perspective) || !K() && (U(e.backdropFilter) || U(e.filter)) || $.test(e.willChange || "") || I.test(e.contain || "")
    }

    function K() {
        return null == e && (e = "u" > typeof CSS && CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")), e
    }

    function X(t) {
        return /^(html|body|#document)$/.test(H(t))
    }

    function Y(t) {
        return M(t).getComputedStyle(t)
    }

    function G(t) {
        return V(t) ? {
            scrollLeft: t.scrollLeft,
            scrollTop: t.scrollTop
        } : {
            scrollLeft: t.scrollX,
            scrollTop: t.scrollY
        }
    }

    function J(t) {
        if ("html" === H(t)) return t;
        let e = t.assignedSlot || t.parentNode || j(t) && t.host || W(t);
        return j(e) ? e.host : e
    }

    function Q(t, e, n) {
        var r;
        void 0 === e && (e = []), void 0 === n && (n = !0);
        let i = function t(e) {
                let n = J(e);
                return X(n) ? e.ownerDocument ? e.ownerDocument.body : e.body : z(n) && N(n) ? n : t(n)
            }(t),
            o = i === (null == (r = t.ownerDocument) ? void 0 : r.body),
            l = M(i);
        if (!o) return e.concat(i, Q(i, [], n));
        {
            let t = Z(l);
            return e.concat(l, l.visualViewport || [], N(i) ? i : [], t && n ? Q(t) : [])
        }
    }

    function Z(t) {
        return t.parent && Object.getPrototypeOf(t.parent) ? t.frameElement : null
    }

    function tt(t) {
        let e = Y(t),
            n = parseFloat(e.width) || 0,
            r = parseFloat(e.height) || 0,
            i = z(t),
            o = i ? t.offsetWidth : n,
            f = i ? t.offsetHeight : r,
            a = l(n) !== o || l(r) !== f;
        return a && (n = o, r = f), {
            width: n,
            height: r,
            $: a
        }
    }

    function te(t) {
        return V(t) ? t : t.contextElement
    }

    function tn(t) {
        let e = te(t);
        if (!z(e)) return a(1);
        let n = e.getBoundingClientRect(),
            {
                width: r,
                height: i,
                $: o
            } = tt(e),
            f = (o ? l(n.width) : n.width) / r,
            u = (o ? l(n.height) : n.height) / i;
        return f && Number.isFinite(f) || (f = 1), u && Number.isFinite(u) || (u = 1), {
            x: f,
            y: u
        }
    }
    let tr = a(0);

    function ti(t) {
        let e = M(t);
        return K() && e.visualViewport ? {
            x: e.visualViewport.offsetLeft,
            y: e.visualViewport.offsetTop
        } : tr
    }

    function to(t, e, n, r) {
        var i;
        void 0 === e && (e = !1), void 0 === n && (n = !1);
        let o = t.getBoundingClientRect(),
            l = te(t),
            f = a(1);
        e && (r ? V(r) && (f = tn(r)) : f = tn(t));
        let u = (void 0 === (i = n) && (i = !1), r && (!i || r === M(l)) && i) ? ti(l) : a(0),
            c = (o.left + u.x) / f.x,
            s = (o.top + u.y) / f.y,
            d = o.width / f.x,
            h = o.height / f.y;
        if (l) {
            let t = M(l),
                e = r && V(r) ? M(r) : r,
                n = t,
                i = Z(n);
            for (; i && r && e !== n;) {
                let t = tn(i),
                    e = i.getBoundingClientRect(),
                    r = Y(i),
                    o = e.left + (i.clientLeft + parseFloat(r.paddingLeft)) * t.x,
                    l = e.top + (i.clientTop + parseFloat(r.paddingTop)) * t.y;
                c *= t.x, s *= t.y, d *= t.x, h *= t.y, c += o, s += l, i = Z(n = M(i))
            }
        }
        return L({
            width: d,
            height: h,
            x: c,
            y: s
        })
    }

    function tl(t, e) {
        let n = G(t).scrollLeft;
        return e ? e.left + n : to(W(t)).left + n
    }

    function tf(t, e) {
        let n = t.getBoundingClientRect();
        return {
            x: n.left + e.scrollLeft - tl(t, n),
            y: n.top + e.scrollTop
        }
    }

    function ta(t, e, n) {
        var r;
        let i;
        if ("viewport" === e) i = function(t, e) {
            let n = M(t),
                r = W(t),
                i = n.visualViewport,
                o = r.clientWidth,
                l = r.clientHeight,
                f = 0,
                a = 0;
            if (i) {
                o = i.width, l = i.height;
                let t = K();
                (!t || t && "fixed" === e) && (f = i.offsetLeft, a = i.offsetTop)
            }
            let u = tl(r);
            if (u <= 0) {
                let t = r.ownerDocument,
                    e = t.body,
                    n = getComputedStyle(e),
                    i = "CSS1Compat" === t.compatMode && parseFloat(n.marginLeft) + parseFloat(n.marginRight) || 0,
                    l = Math.abs(r.clientWidth - e.clientWidth - i);
                l <= 25 && (o -= l)
            } else u <= 25 && (o += u);
            return {
                width: o,
                height: l,
                x: f,
                y: a
            }
        }(t, n);
        else if ("document" === e) {
            let e, n, l, f, a, u, c;
            r = W(t), e = W(r), n = G(r), l = r.ownerDocument.body, f = o(e.scrollWidth, e.clientWidth, l.scrollWidth, l.clientWidth), a = o(e.scrollHeight, e.clientHeight, l.scrollHeight, l.clientHeight), u = -n.scrollLeft + tl(r), c = -n.scrollTop, "rtl" === Y(l).direction && (u += o(e.clientWidth, l.clientWidth) - f), i = {
                width: f,
                height: a,
                x: u,
                y: c
            }
        } else if (V(e)) {
            let t, r, o, l, f, u;
            r = (t = to(e, !0, "fixed" === n)).top + e.clientTop, o = t.left + e.clientLeft, l = z(e) ? tn(e) : a(1), f = e.clientWidth * l.x, u = e.clientHeight * l.y, i = {
                width: f,
                height: u,
                x: o * l.x,
                y: r * l.y
            }
        } else {
            let n = ti(t);
            i = {
                x: e.x - n.x,
                y: e.y - n.y,
                width: e.width,
                height: e.height
            }
        }
        return L(i)
    }

    function tu(t) {
        return "static" === Y(t).position
    }

    function tc(t, e) {
        if (!z(t) || "fixed" === Y(t).position) return null;
        if (e) return e(t);
        let n = t.offsetParent;
        return W(t) === n && (n = n.ownerDocument.body), n
    }

    function ts(t, e) {
        var n;
        let r = M(t);
        if (_(t)) return r;
        if (!z(t)) {
            let e = J(t);
            for (; e && !X(e);) {
                if (V(e) && !tu(e)) return e;
                e = J(e)
            }
            return r
        }
        let i = tc(t, e);
        for (; i && (n = i, /^(table|td|th)$/.test(H(n))) && tu(i);) i = tc(i, e);
        return i && X(i) && tu(i) && !q(i) ? r : i || function(t) {
            let e = J(t);
            for (; z(e) && !X(e);) {
                if (q(e)) return e;
                if (_(e)) break;
                e = J(e)
            }
            return null
        }(t) || r
    }
    let td = async function(t) {
        let e = this.getOffsetParent || ts,
            n = this.getDimensions,
            r = await n(t.floating);
        return {
            reference: function(t, e, n) {
                let r = z(e),
                    i = W(e),
                    o = "fixed" === n,
                    l = to(t, !0, o, e),
                    f = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    u = a(0);
                if (r || !r && !o)
                    if (("body" !== H(e) || N(i)) && (f = G(e)), r) {
                        let t = to(e, !0, o, e);
                        u.x = t.x + e.clientLeft, u.y = t.y + e.clientTop
                    } else i && (u.x = tl(i));
                o && !r && i && (u.x = tl(i));
                let c = !i || r || o ? a(0) : tf(i, f);
                return {
                    x: l.left + f.scrollLeft - u.x - c.x,
                    y: l.top + f.scrollTop - u.y - c.y,
                    width: l.width,
                    height: l.height
                }
            }(t.reference, await e(t.floating), t.strategy),
            floating: {
                x: 0,
                y: 0,
                width: r.width,
                height: r.height
            }
        }
    }, th = {
        convertOffsetParentRelativeRectToViewportRelativeRect: function(t) {
            let {
                elements: e,
                rect: n,
                offsetParent: r,
                strategy: i
            } = t, o = "fixed" === i, l = W(r), f = !!e && _(e.floating);
            if (r === l || f && o) return n;
            let u = {
                    scrollLeft: 0,
                    scrollTop: 0
                },
                c = a(1),
                s = a(0),
                d = z(r);
            if ((d || !d && !o) && (("body" !== H(r) || N(l)) && (u = G(r)), d)) {
                let t = to(r);
                c = tn(r), s.x = t.x + r.clientLeft, s.y = t.y + r.clientTop
            }
            let h = !l || d || o ? a(0) : tf(l, u);
            return {
                width: n.width * c.x,
                height: n.height * c.y,
                x: n.x * c.x - u.scrollLeft * c.x + s.x + h.x,
                y: n.y * c.y - u.scrollTop * c.y + s.y + h.y
            }
        },
        getDocumentElement: W,
        getClippingRect: function(t) {
            let {
                element: e,
                boundary: n,
                rootBoundary: r,
                strategy: l
            } = t, f = [..."clippingAncestors" === n ? _(e) ? [] : function(t, e) {
                let n = e.get(t);
                if (n) return n;
                let r = Q(t, [], !1).filter(t => V(t) && "body" !== H(t)),
                    i = null,
                    o = "fixed" === Y(t).position,
                    l = o ? J(t) : t;
                for (; V(l) && !X(l);) {
                    let e = Y(l),
                        n = q(l);
                    n || "fixed" !== e.position || (i = null), (o ? n || i : !(!n && "static" === e.position && i && ("absolute" === i.position || "fixed" === i.position) || N(l) && !n && function t(e, n) {
                        let r = J(e);
                        return !(r === n || !V(r) || X(r)) && ("fixed" === Y(r).position || t(r, n))
                    }(t, l))) ? i = e : r = r.filter(t => t !== l), l = J(l)
                }
                return e.set(t, r), r
            }(e, this._c) : [].concat(n), r], a = ta(e, f[0], l), u = a.top, c = a.right, s = a.bottom, d = a.left;
            for (let t = 1; t < f.length; t++) {
                let n = ta(e, f[t], l);
                u = o(n.top, u), c = i(n.right, c), s = i(n.bottom, s), d = o(n.left, d)
            }
            return {
                width: c - d,
                height: s - u,
                x: d,
                y: u
            }
        },
        getOffsetParent: ts,
        getElementRects: td,
        getClientRects: function(t) {
            return Array.from(t.getClientRects())
        },
        getDimensions: function(t) {
            let {
                width: e,
                height: n
            } = tt(t);
            return {
                width: e,
                height: n
            }
        },
        getScale: tn,
        isElement: V,
        isRTL: function(t) {
            return "rtl" === Y(t).direction
        }
    };

    function tm(t, e) {
        return t.x === e.x && t.y === e.y && t.width === e.width && t.height === e.height
    }
    let tp = function(t) {
            return void 0 === t && (t = 0), {
                name: "offset",
                options: t,
                async fn(e) {
                    var n, r;
                    let {
                        x: i,
                        y: o,
                        placement: l,
                        middlewareData: f
                    } = e, a = await k(e, t);
                    return l === (null == (n = f.offset) ? void 0 : n.placement) && null != (r = f.arrow) && r.alignmentOffset ? {} : {
                        x: i + a.x,
                        y: o + a.y,
                        data: {
                            ...a,
                            placement: l
                        }
                    }
                }
            }
        },
        tg = function(t) {
            return void 0 === t && (t = {}), {
                name: "shift",
                options: t,
                async fn(e) {
                    let {
                        x: n,
                        y: r,
                        placement: l,
                        platform: f
                    } = e, {
                        mainAxis: a = !0,
                        crossAxis: u = !1,
                        limiter: d = {
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
                        ...m
                    } = c(t, e), g = {
                        x: n,
                        y: r
                    }, w = await f.detectOverflow(e, m), y = p(s(l)), v = h(y), x = g[v], b = g[y];
                    if (a) {
                        let t = "y" === v ? "top" : "left",
                            e = "y" === v ? "bottom" : "right",
                            n = x + w[t],
                            r = x - w[e];
                        x = o(n, i(x, r))
                    }
                    if (u) {
                        let t = "y" === y ? "top" : "left",
                            e = "y" === y ? "bottom" : "right",
                            n = b + w[t],
                            r = b - w[e];
                        b = o(n, i(b, r))
                    }
                    let R = d.fn({
                        ...e,
                        [v]: x,
                        [y]: b
                    });
                    return {
                        ...R,
                        data: {
                            x: R.x - n,
                            y: R.y - r,
                            enabled: {
                                [v]: a,
                                [y]: u
                            }
                        }
                    }
                }
            }
        },
        tw = function(t) {
            return void 0 === t && (t = {}), {
                name: "flip",
                options: t,
                async fn(e) {
                    var n, r, i, o, l;
                    let f, a, u, {
                            placement: h,
                            middlewareData: m,
                            rects: T,
                            initialPlacement: L,
                            platform: A,
                            elements: O
                        } = e,
                        {
                            mainAxis: C = !0,
                            crossAxis: E = !0,
                            fallbackPlacements: P,
                            fallbackStrategy: S = "bestFit",
                            fallbackAxisSideDirection: D = "none",
                            flipAlignment: k = !0,
                            ...F
                        } = c(t, e);
                    if (null != (n = m.arrow) && n.alignmentOffset) return {};
                    let H = s(h),
                        M = p(L),
                        W = s(L) === L,
                        B = await (null == A.isRTL ? void 0 : A.isRTL(O.floating)),
                        V = P || (W || !k ? [R(L)] : (f = R(L), [w(L), f, w(f)])),
                        z = "none" !== D;
                    !P && z && V.push(...(a = d(L), u = function(t, e, n) {
                        switch (t) {
                            case "top":
                            case "bottom":
                                if (n) return e ? v : y;
                                return e ? y : v;
                            case "left":
                            case "right":
                                return e ? x : b;
                            default:
                                return []
                        }
                    }(s(L), "start" === D, B), a && (u = u.map(t => t + "-" + a), k && (u = u.concat(u.map(w)))), u));
                    let j = [L, ...V],
                        N = await A.detectOverflow(e, F),
                        _ = [],
                        $ = (null == (r = m.flip) ? void 0 : r.overflows) || [];
                    if (C && _.push(N[H]), E) {
                        let t = g(h, T, B);
                        _.push(N[t[0]], N[t[1]])
                    }
                    if ($ = [...$, {
                            placement: h,
                            overflows: _
                        }], !_.every(t => t <= 0)) {
                        let t = ((null == (i = m.flip) ? void 0 : i.index) || 0) + 1,
                            e = j[t];
                        if (e && ("alignment" !== E || M === p(e) || $.every(t => p(t.placement) !== M || t.overflows[0] > 0))) return {
                            data: {
                                index: t,
                                overflows: $
                            },
                            reset: {
                                placement: e
                            }
                        };
                        let n = null == (o = $.filter(t => t.overflows[0] <= 0).sort((t, e) => t.overflows[1] - e.overflows[1])[0]) ? void 0 : o.placement;
                        if (!n) switch (S) {
                            case "bestFit": {
                                let t = null == (l = $.filter(t => {
                                    if (z) {
                                        let e = p(t.placement);
                                        return e === M || "y" === e
                                    }
                                    return !0
                                }).map(t => [t.placement, t.overflows.filter(t => t > 0).reduce((t, e) => t + e, 0)]).sort((t, e) => t[1] - e[1])[0]) ? void 0 : l[0];
                                t && (n = t);
                                break
                            }
                            case "initialPlacement":
                                n = L
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
        ty = function(t) {
            return void 0 === t && (t = {}), {
                name: "size",
                options: t,
                async fn(e) {
                    var n, r;
                    let l, f, {
                            placement: a,
                            rects: u,
                            platform: h,
                            elements: m
                        } = e,
                        {
                            apply: g = () => {},
                            ...w
                        } = c(t, e),
                        y = await h.detectOverflow(e, w),
                        v = s(a),
                        x = d(a),
                        b = "y" === p(a),
                        {
                            width: R,
                            height: T
                        } = u.floating;
                    "top" === v || "bottom" === v ? (l = v, f = x === (await (null == h.isRTL ? void 0 : h.isRTL(m.floating)) ? "start" : "end") ? "left" : "right") : (f = v, l = "end" === x ? "top" : "bottom");
                    let L = T - y.top - y.bottom,
                        A = R - y.left - y.right,
                        O = i(T - y[l], L),
                        C = i(R - y[f], A),
                        E = !e.middlewareData.shift,
                        P = O,
                        S = C;
                    if (null != (n = e.middlewareData.shift) && n.enabled.x && (S = A), null != (r = e.middlewareData.shift) && r.enabled.y && (P = L), E && !x) {
                        let t = o(y.left, 0),
                            e = o(y.right, 0),
                            n = o(y.top, 0),
                            r = o(y.bottom, 0);
                        b ? S = R - 2 * (0 !== t || 0 !== e ? t + e : o(y.left, y.right)) : P = T - 2 * (0 !== n || 0 !== r ? n + r : o(y.top, y.bottom))
                    }
                    await g({
                        ...e,
                        availableWidth: S,
                        availableHeight: P
                    });
                    let D = await h.getDimensions(m.floating);
                    return R !== D.width || T !== D.height ? {
                        reset: {
                            rects: !0
                        }
                    } : {}
                }
            }
        },
        tv = function(t) {
            return void 0 === t && (t = {}), {
                name: "hide",
                options: t,
                async fn(e) {
                    let {
                        rects: n,
                        platform: r
                    } = e, {
                        strategy: i = "referenceHidden",
                        ...o
                    } = c(t, e);
                    switch (i) {
                        case "referenceHidden": {
                            let t = E(await r.detectOverflow(e, {
                                ...o,
                                elementContext: "reference"
                            }), n.reference);
                            return {
                                data: {
                                    referenceHiddenOffsets: t,
                                    referenceHidden: P(t)
                                }
                            }
                        }
                        case "escaped": {
                            let t = E(await r.detectOverflow(e, {
                                ...o,
                                altBoundary: !0
                            }), n.floating);
                            return {
                                data: {
                                    escapedOffsets: t,
                                    escaped: P(t)
                                }
                            }
                        }
                        default:
                            return {}
                    }
                }
            }
        },
        tx = t => ({
            name: "arrow",
            options: t,
            async fn(e) {
                let {
                    x: n,
                    y: r,
                    placement: l,
                    rects: f,
                    platform: a,
                    elements: u,
                    middlewareData: s
                } = e, {
                    element: g,
                    padding: w = 0
                } = c(t, e) || {};
                if (null == g) return {};
                let y = T(w),
                    v = {
                        x: n,
                        y: r
                    },
                    x = h(p(l)),
                    b = m(x),
                    R = await a.getDimensions(g),
                    L = "y" === x,
                    A = L ? "clientHeight" : "clientWidth",
                    O = f.reference[b] + f.reference[x] - v[x] - f.floating[b],
                    C = v[x] - f.reference[x],
                    E = await (null == a.getOffsetParent ? void 0 : a.getOffsetParent(g)),
                    P = E ? E[A] : 0;
                P && await (null == a.isElement ? void 0 : a.isElement(E)) || (P = u.floating[A] || f.floating[b]);
                let S = P / 2 - R[b] / 2 - 1,
                    D = i(y[L ? "top" : "left"], S),
                    k = i(y[L ? "bottom" : "right"], S),
                    F = P - R[b] - k,
                    H = P / 2 - R[b] / 2 + (O / 2 - C / 2),
                    M = o(D, i(H, F)),
                    W = !s.arrow && null != d(l) && H !== M && f.reference[b] / 2 - (H < D ? D : k) - R[b] / 2 < 0,
                    B = W ? H < D ? H - D : H - F : 0;
                return {
                    [x]: v[x] + B,
                    data: {
                        [x]: M,
                        centerOffset: H - M - B,
                        ...W && {
                            alignmentOffset: B
                        }
                    },
                    reset: W
                }
            }
        }),
        tb = function(t) {
            return void 0 === t && (t = {}), {
                options: t,
                fn(e) {
                    let {
                        x: n,
                        y: r,
                        placement: i,
                        rects: o,
                        middlewareData: l
                    } = e, {
                        offset: f = 0,
                        mainAxis: a = !0,
                        crossAxis: u = !0
                    } = c(t, e), d = {
                        x: n,
                        y: r
                    }, m = p(i), g = h(m), w = d[g], y = d[m], v = c(f, e), x = "number" == typeof v ? {
                        mainAxis: v,
                        crossAxis: 0
                    } : {
                        mainAxis: 0,
                        crossAxis: 0,
                        ...v
                    };
                    if (a) {
                        let t = "y" === g ? "height" : "width",
                            e = o.reference[g] - o.floating[t] + x.mainAxis,
                            n = o.reference[g] + o.reference[t] - x.mainAxis;
                        w < e ? w = e : w > n && (w = n)
                    }
                    if (u) {
                        var b, R;
                        let t = "y" === g ? "width" : "height",
                            e = D.has(s(i)),
                            n = o.reference[m] - o.floating[t] + (e && (null == (b = l.offset) ? void 0 : b[m]) || 0) + (e ? 0 : x.crossAxis),
                            r = o.reference[m] + o.reference[t] + (e ? 0 : (null == (R = l.offset) ? void 0 : R[m]) || 0) - (e ? x.crossAxis : 0);
                        y < n ? y = n : y > r && (y = r)
                    }
                    return {
                        [g]: w,
                        [m]: y
                    }
                }
            }
        },
        tR = (t, e, n) => {
            let r = new Map,
                i = {
                    platform: th,
                    ...n
                },
                o = {
                    ...i.platform,
                    _c: r
                };
            return C(t, e, {
                ...i,
                platform: o
            })
        };
    t.s(["arrow", 0, tx, "autoPlacement", 0, function(t) {
        return void 0 === t && (t = {}), {
            name: "autoPlacement",
            options: t,
            async fn(e) {
                var n, i, o, l;
                let {
                    rects: f,
                    middlewareData: a,
                    placement: u,
                    platform: h,
                    elements: m
                } = e, {
                    crossAxis: p = !1,
                    alignment: y,
                    allowedPlacements: v = r,
                    autoAlignment: x = !0,
                    ...b
                } = c(t, e), R = void 0 !== y || v === r ? ((l = y || null) ? [...v.filter(t => d(t) === l), ...v.filter(t => d(t) !== l)] : v.filter(t => s(t) === t)).filter(t => !l || d(t) === l || !!x && w(t) !== t) : v, T = await h.detectOverflow(e, b), L = (null == (n = a.autoPlacement) ? void 0 : n.index) || 0, A = R[L];
                if (null == A) return {};
                let O = g(A, f, await (null == h.isRTL ? void 0 : h.isRTL(m.floating)));
                if (u !== A) return {
                    reset: {
                        placement: R[0]
                    }
                };
                let C = [T[s(A)], T[O[0]], T[O[1]]],
                    E = [...(null == (i = a.autoPlacement) ? void 0 : i.overflows) || [], {
                        placement: A,
                        overflows: C
                    }],
                    P = R[L + 1];
                if (P) return {
                    data: {
                        index: L + 1,
                        overflows: E
                    },
                    reset: {
                        placement: P
                    }
                };
                let S = E.map(t => {
                        let e = d(t.placement);
                        return [t.placement, e && p ? t.overflows.slice(0, 2).reduce((t, e) => t + e, 0) : t.overflows[0], t.overflows]
                    }).sort((t, e) => t[1] - e[1]),
                    D = (null == (o = S.filter(t => t[2].slice(0, d(t[0]) ? 2 : 3).every(t => t <= 0))[0]) ? void 0 : o[0]) || S[0][0];
                return D !== u ? {
                    data: {
                        index: L + 1,
                        overflows: E
                    },
                    reset: {
                        placement: D
                    }
                } : {}
            }
        }
    }, "autoUpdate", 0, function(t, e, n, r) {
        let l;
        void 0 === r && (r = {});
        let {
            ancestorScroll: a = !0,
            ancestorResize: u = !0,
            elementResize: c = "function" == typeof ResizeObserver,
            layoutShift: s = "function" == typeof IntersectionObserver,
            animationFrame: d = !1
        } = r, h = te(t), m = a || u ? [...h ? Q(h) : [], ...e ? Q(e) : []] : [];
        m.forEach(t => {
            a && t.addEventListener("scroll", n, {
                passive: !0
            }), u && t.addEventListener("resize", n)
        });
        let p = h && s ? function(t, e) {
                let n, r = null,
                    l = W(t);

                function a() {
                    var t;
                    clearTimeout(n), null == (t = r) || t.disconnect(), r = null
                }
                return ! function u(c, s) {
                    void 0 === c && (c = !1), void 0 === s && (s = 1), a();
                    let d = t.getBoundingClientRect(),
                        {
                            left: h,
                            top: m,
                            width: p,
                            height: g
                        } = d;
                    if (c || e(), !p || !g) return;
                    let w = {
                            rootMargin: -f(m) + "px " + -f(l.clientWidth - (h + p)) + "px " + -f(l.clientHeight - (m + g)) + "px " + -f(h) + "px",
                            threshold: o(0, i(1, s)) || 1
                        },
                        y = !0;

                    function v(e) {
                        let r = e[0].intersectionRatio;
                        if (r !== s) {
                            if (!y) return u();
                            r ? u(!1, r) : n = setTimeout(() => {
                                u(!1, 1e-7)
                            }, 1e3)
                        }
                        1 !== r || tm(d, t.getBoundingClientRect()) || u(), y = !1
                    }
                    try {
                        r = new IntersectionObserver(v, {
                            ...w,
                            root: l.ownerDocument
                        })
                    } catch (t) {
                        r = new IntersectionObserver(v, w)
                    }
                    r.observe(t)
                }(!0), a
            }(h, n) : null,
            g = -1,
            w = null;
        c && (w = new ResizeObserver(t => {
            let [r] = t;
            r && r.target === h && w && e && (w.unobserve(e), cancelAnimationFrame(g), g = requestAnimationFrame(() => {
                var t;
                null == (t = w) || t.observe(e)
            })), n()
        }), h && !d && w.observe(h), e && w.observe(e));
        let y = d ? to(t) : null;
        return d && function e() {
            let r = to(t);
            y && !tm(y, r) && n(), y = r, l = requestAnimationFrame(e)
        }(), n(), () => {
            var t;
            m.forEach(t => {
                a && t.removeEventListener("scroll", n), u && t.removeEventListener("resize", n)
            }), null == p || p(), null == (t = w) || t.disconnect(), w = null, d && cancelAnimationFrame(l)
        }
    }, "computePosition", 0, tR, "flip", 0, tw, "hide", 0, tv, "inline", 0, function(t) {
        return void 0 === t && (t = {}), {
            name: "inline",
            options: t,
            async fn(e) {
                let {
                    placement: n,
                    elements: r,
                    rects: l,
                    platform: f,
                    strategy: a
                } = e, {
                    padding: u = 2,
                    x: d,
                    y: h
                } = c(t, e), m = Array.from(await (null == f.getClientRects ? void 0 : f.getClientRects(r.reference)) || []), g = function(t) {
                    let e = t.slice().sort((t, e) => t.y - e.y),
                        n = [],
                        r = null;
                    for (let t = 0; t < e.length; t++) {
                        let i = e[t];
                        !r || i.y - r.y > r.height / 2 ? n.push([i]) : n[n.length - 1].push(i), r = i
                    }
                    return n.map(t => L(S(t)))
                }(m), w = L(S(m)), y = T(u), v = await f.getElementRects({
                    reference: {
                        getBoundingClientRect: function() {
                            if (2 === g.length && g[0].left > g[1].right && null != d && null != h) return g.find(t => d > t.left - y.left && d < t.right + y.right && h > t.top - y.top && h < t.bottom + y.bottom) || w;
                            if (g.length >= 2) {
                                if ("y" === p(n)) {
                                    let t = g[0],
                                        e = g[g.length - 1],
                                        r = "top" === s(n),
                                        i = t.top,
                                        o = e.bottom,
                                        l = r ? t.left : e.left,
                                        f = r ? t.right : e.right;
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
                                let t = "left" === s(n),
                                    e = o(...g.map(t => t.right)),
                                    r = i(...g.map(t => t.left)),
                                    l = g.filter(n => t ? n.left === r : n.right === e),
                                    f = l[0].top,
                                    a = l[l.length - 1].bottom;
                                return {
                                    top: f,
                                    bottom: a,
                                    left: r,
                                    right: e,
                                    width: e - r,
                                    height: a - f,
                                    x: r,
                                    y: f
                                }
                            }
                            return w
                        }
                    },
                    floating: r.floating,
                    strategy: a
                });
                return l.reference.x !== v.reference.x || l.reference.y !== v.reference.y || l.reference.width !== v.reference.width || l.reference.height !== v.reference.height ? {
                    reset: {
                        rects: v
                    }
                } : {}
            }
        }
    }, "limitShift", 0, tb, "offset", 0, tp, "shift", 0, tg, "size", 0, ty], 992486);
    var tT = t.i(416340),
        tL = t.i(149285),
        tA = "u" > typeof document ? tT.useLayoutEffect : function() {};

    function tO(t, e) {
        let n, r, i;
        if (t === e) return !0;
        if (typeof t != typeof e) return !1;
        if ("function" == typeof t && t.toString() === e.toString()) return !0;
        if (t && e && "object" == typeof t) {
            if (Array.isArray(t)) {
                if ((n = t.length) !== e.length) return !1;
                for (r = n; 0 != r--;)
                    if (!tO(t[r], e[r])) return !1;
                return !0
            }
            if ((n = (i = Object.keys(t)).length) !== Object.keys(e).length) return !1;
            for (r = n; 0 != r--;)
                if (!({}).hasOwnProperty.call(e, i[r])) return !1;
            for (r = n; 0 != r--;) {
                let n = i[r];
                if (("_owner" !== n || !t.$$typeof) && !tO(t[n], e[n])) return !1
            }
            return !0
        }
        return t != t && e != e
    }

    function tC(t) {
        return "u" < typeof window ? 1 : (t.ownerDocument.defaultView || window).devicePixelRatio || 1
    }

    function tE(t, e) {
        let n = tC(t);
        return Math.round(e * n) / n
    }

    function tP(t) {
        let e = tT.useRef(t);
        return tA(() => {
            e.current = t
        }), e
    }
    t.s(["arrow", 0, (t, e) => {
        let n = {
            name: "arrow",
            options: t,
            fn(e) {
                let {
                    element: n,
                    padding: r
                } = "function" == typeof t ? t(e) : t;
                return n && ({}).hasOwnProperty.call(n, "current") ? null != n.current ? tx({
                    element: n.current,
                    padding: r
                }).fn(e) : {} : n ? tx({
                    element: n,
                    padding: r
                }).fn(e) : {}
            }
        };
        return {
            name: n.name,
            fn: n.fn,
            options: [t, e]
        }
    }, "flip", 0, (t, e) => {
        let n = tw(t);
        return {
            name: n.name,
            fn: n.fn,
            options: [t, e]
        }
    }, "hide", 0, (t, e) => {
        let n = tv(t);
        return {
            name: n.name,
            fn: n.fn,
            options: [t, e]
        }
    }, "limitShift", 0, (t, e) => ({
        fn: tb(t).fn,
        options: [t, e]
    }), "offset", 0, (t, e) => {
        let n = tp(t);
        return {
            name: n.name,
            fn: n.fn,
            options: [t, e]
        }
    }, "shift", 0, (t, e) => {
        let n = tg(t);
        return {
            name: n.name,
            fn: n.fn,
            options: [t, e]
        }
    }, "size", 0, (t, e) => {
        let n = ty(t);
        return {
            name: n.name,
            fn: n.fn,
            options: [t, e]
        }
    }, "useFloating", 0, function(t) {
        void 0 === t && (t = {});
        let {
            placement: e = "bottom",
            strategy: n = "absolute",
            middleware: r = [],
            platform: i,
            elements: {
                reference: o,
                floating: l
            } = {},
            transform: f = !0,
            whileElementsMounted: a,
            open: u
        } = t, [c, s] = tT.useState({
            x: 0,
            y: 0,
            strategy: n,
            placement: e,
            middlewareData: {},
            isPositioned: !1
        }), [d, h] = tT.useState(r);
        tO(d, r) || h(r);
        let [m, p] = tT.useState(null), [g, w] = tT.useState(null), y = tT.useCallback(t => {
            t !== R.current && (R.current = t, p(t))
        }, []), v = tT.useCallback(t => {
            t !== T.current && (T.current = t, w(t))
        }, []), x = o || m, b = l || g, R = tT.useRef(null), T = tT.useRef(null), L = tT.useRef(c), A = null != a, O = tP(a), C = tP(i), E = tP(u), P = tT.useCallback(() => {
            if (!R.current || !T.current) return;
            let t = {
                placement: e,
                strategy: n,
                middleware: d
            };
            C.current && (t.platform = C.current), tR(R.current, T.current, t).then(t => {
                let e = {
                    ...t,
                    isPositioned: !1 !== E.current
                };
                S.current && !tO(L.current, e) && (L.current = e, tL.flushSync(() => {
                    s(e)
                }))
            })
        }, [d, e, n, C, E]);
        tA(() => {
            !1 === u && L.current.isPositioned && (L.current.isPositioned = !1, s(t => ({
                ...t,
                isPositioned: !1
            })))
        }, [u]);
        let S = tT.useRef(!1);
        tA(() => (S.current = !0, () => {
            S.current = !1
        }), []), tA(() => {
            if (x && (R.current = x), b && (T.current = b), x && b) {
                if (O.current) return O.current(x, b, P);
                P()
            }
        }, [x, b, P, O, A]);
        let D = tT.useMemo(() => ({
                reference: R,
                floating: T,
                setReference: y,
                setFloating: v
            }), [y, v]),
            k = tT.useMemo(() => ({
                reference: x,
                floating: b
            }), [x, b]),
            F = tT.useMemo(() => {
                let t = {
                    position: n,
                    left: 0,
                    top: 0
                };
                if (!k.floating) return t;
                let e = tE(k.floating, c.x),
                    r = tE(k.floating, c.y);
                return f ? {
                    ...t,
                    transform: "translate(" + e + "px, " + r + "px)",
                    ...tC(k.floating) >= 1.5 && {
                        willChange: "transform"
                    }
                } : {
                    position: n,
                    left: e,
                    top: r
                }
            }, [n, f, k.floating, c.x, c.y]);
        return tT.useMemo(() => ({
            ...c,
            update: P,
            refs: D,
            elements: k,
            floatingStyles: F
        }), [c, P, D, k, F])
    }], 297452)
}]);

//# debugId=d51388e5-0d8b-6ac5-1563-4d15fa5417ff
//# sourceMappingURL=3moirvcn0jhpm.js.map