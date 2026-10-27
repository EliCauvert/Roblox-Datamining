;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "ebede7e8-8881-bf74-8df3-028630fc6d00")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 298886, e => {
    "use strict";
    var t = e.i(221628),
        r = (0, e.i(588393).c)((0, t.jsx)("path", {
            d: "M19 6.41 17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"
        }), "Close");
    e.s(["C", 0, r])
}, 930669, e => {
    "use strict";
    var t = e.i(298886);
    e.s(["CloseIcon", () => t.C])
}, 46591, 356983, e => {
    "use strict";
    var t, r, n, o, i, a = e.i(30941),
        s = e.i(416340),
        l = e.i(936993),
        c = e.i(129210),
        u = e.i(169336),
        p = e.i(477763),
        d = e.i(226319),
        f = e.i(91375),
        h = e.i(928277),
        m = e.i(221628),
        v = e.i(882638),
        y = e.i(90190);
    e.i(802400), e.i(118371), e.i(333032);
    var b = e.i(823079),
        g = e.i(756684),
        w = e.i(747310),
        x = e.i(442632),
        A = {};
    Object.defineProperty(A, "__esModule", {
        value: !0
    });
    var R = A.default = void 0,
        I = function(e) {
            if (e && e.__esModule) return e;
            if (null === e || "object" != typeof e && "function" != typeof e) return {
                default: e
            };
            var t = S(void 0);
            if (t && t.has(e)) return t.get(e);
            var r = {
                    __proto__: null
                },
                n = Object.defineProperty && Object.getOwnPropertyDescriptor;
            for (var o in e)
                if ("default" !== o && Object.prototype.hasOwnProperty.call(e, o)) {
                    var i = n ? Object.getOwnPropertyDescriptor(e, o) : null;
                    i && (i.get || i.set) ? Object.defineProperty(r, o, i) : r[o] = e[o]
                } return r.default = e, t && t.set(e, r), r
        }(s.default),
        P = d.f;

    function S(e) {
        if ("function" != typeof WeakMap) return null;
        var t = new WeakMap,
            r = new WeakMap;
        return (S = function(e) {
            return e ? r : t
        })(e)
    }
    R = A.default = function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : null,
            t = I.useContext(P.ThemeContext);
        return t && 0 !== Object.keys(t).length ? t : e
    };
    var q = "bottom",
        C = "right",
        k = "left",
        T = "auto",
        U = ["top", q, C, k],
        E = "start",
        O = "viewport",
        K = "popper",
        z = U.reduce(function(e, t) {
            return e.concat([t + "-" + E, t + "-end"])
        }, []),
        _ = [].concat(U, [T]).reduce(function(e, t) {
            return e.concat([t, t + "-" + E, t + "-end"])
        }, []),
        L = ["beforeRead", "read", "afterRead", "beforeMain", "main", "afterMain", "beforeWrite", "write", "afterWrite"];

    function M(e) {
        return e ? (e.nodeName || "").toLowerCase() : null
    }

    function V(e) {
        if (null == e) return window;
        if ("[object Window]" !== e.toString()) {
            var t = e.ownerDocument;
            return t && t.defaultView || window
        }
        return e
    }

    function G(e) {
        return e instanceof V(e).Element || e instanceof Element
    }

    function j(e) {
        return e instanceof V(e).HTMLElement || e instanceof HTMLElement
    }

    function D(e) {
        return "u" > typeof ShadowRoot && (e instanceof V(e).ShadowRoot || e instanceof ShadowRoot)
    }

    function F(e) {
        return e.split("-")[0]
    }
    var N = Math.max,
        B = Math.min,
        W = Math.round;

    function J() {
        var e = navigator.userAgentData;
        return null != e && e.brands && Array.isArray(e.brands) ? e.brands.map(function(e) {
            return e.brand + "/" + e.version
        }).join(" ") : navigator.userAgent
    }

    function H() {
        return !/^((?!chrome|android).)*safari/i.test(J())
    }

    function X(e, t, r) {
        void 0 === t && (t = !1), void 0 === r && (r = !1);
        var n = e.getBoundingClientRect(),
            o = 1,
            i = 1;
        t && j(e) && (o = e.offsetWidth > 0 && W(n.width) / e.offsetWidth || 1, i = e.offsetHeight > 0 && W(n.height) / e.offsetHeight || 1);
        var a = (G(e) ? V(e) : window).visualViewport,
            s = !H() && r,
            l = (n.left + (s && a ? a.offsetLeft : 0)) / o,
            c = (n.top + (s && a ? a.offsetTop : 0)) / i,
            u = n.width / o,
            p = n.height / i;
        return {
            width: u,
            height: p,
            top: c,
            right: l + u,
            bottom: c + p,
            left: l,
            x: l,
            y: c
        }
    }

    function Y(e) {
        var t = X(e),
            r = e.offsetWidth,
            n = e.offsetHeight;
        return 1 >= Math.abs(t.width - r) && (r = t.width), 1 >= Math.abs(t.height - n) && (n = t.height), {
            x: e.offsetLeft,
            y: e.offsetTop,
            width: r,
            height: n
        }
    }

    function $(e, t) {
        var r = t.getRootNode && t.getRootNode();
        if (e.contains(t)) return !0;
        if (r && D(r)) {
            var n = t;
            do {
                if (n && e.isSameNode(n)) return !0;
                n = n.parentNode || n.host
            } while (n)
        }
        return !1
    }

    function Q(e) {
        return V(e).getComputedStyle(e)
    }

    function Z(e) {
        return ((G(e) ? e.ownerDocument : e.document) || window.document).documentElement
    }

    function ee(e) {
        return "html" === M(e) ? e : e.assignedSlot || e.parentNode || (D(e) ? e.host : null) || Z(e)
    }

    function et(e) {
        return j(e) && "fixed" !== Q(e).position ? e.offsetParent : null
    }

    function er(e) {
        for (var t = V(e), r = et(e); r && ["table", "td", "th"].indexOf(M(r)) >= 0 && "static" === Q(r).position;) r = et(r);
        return r && ("html" === M(r) || "body" === M(r) && "static" === Q(r).position) ? t : r || function(e) {
            var t = /firefox/i.test(J());
            if (/Trident/i.test(J()) && j(e) && "fixed" === Q(e).position) return null;
            var r = ee(e);
            for (D(r) && (r = r.host); j(r) && 0 > ["html", "body"].indexOf(M(r));) {
                var n = Q(r);
                if ("none" !== n.transform || "none" !== n.perspective || "paint" === n.contain || -1 !== ["transform", "perspective"].indexOf(n.willChange) || t && "filter" === n.willChange || t && n.filter && "none" !== n.filter) return r;
                r = r.parentNode
            }
            return null
        }(e) || t
    }

    function en(e) {
        return ["top", "bottom"].indexOf(e) >= 0 ? "x" : "y"
    }

    function eo(e, t, r) {
        return N(e, B(t, r))
    }

    function ei(e) {
        return Object.assign({}, {
            top: 0,
            right: 0,
            bottom: 0,
            left: 0
        }, e)
    }

    function ea(e, t) {
        return t.reduce(function(t, r) {
            return t[r] = e, t
        }, {})
    }

    function es(e) {
        return e.split("-")[1]
    }
    var el = {
        top: "auto",
        right: "auto",
        bottom: "auto",
        left: "auto"
    };

    function ec(e) {
        var t, r = e.popper,
            n = e.popperRect,
            o = e.placement,
            i = e.variation,
            a = e.offsets,
            s = e.position,
            l = e.gpuAcceleration,
            c = e.adaptive,
            u = e.roundOffsets,
            p = e.isFixed,
            d = a.x,
            f = void 0 === d ? 0 : d,
            h = a.y,
            m = void 0 === h ? 0 : h,
            v = "function" == typeof u ? u({
                x: f,
                y: m
            }) : {
                x: f,
                y: m
            };
        f = v.x, m = v.y;
        var y = a.hasOwnProperty("x"),
            b = a.hasOwnProperty("y"),
            g = k,
            w = "top",
            x = window;
        if (c) {
            var A = er(r),
                R = "clientHeight",
                I = "clientWidth";
            A === V(r) && "static" !== Q(A = Z(r)).position && "absolute" === s && (R = "scrollHeight", I = "scrollWidth"), ("top" === o || (o === k || o === C) && "end" === i) && (w = q, m -= (p && A === x && x.visualViewport ? x.visualViewport.height : A[R]) - n.height, m *= l ? 1 : -1), (o === k || ("top" === o || o === q) && "end" === i) && (g = C, f -= (p && A === x && x.visualViewport ? x.visualViewport.width : A[I]) - n.width, f *= l ? 1 : -1)
        }
        var P, S, T, U, E, O, K = Object.assign({
                position: s
            }, c && el),
            z = !0 === u ? (P = {
                x: f,
                y: m
            }, S = V(r), T = P.x, U = P.y, {
                x: W(T * (E = S.devicePixelRatio || 1)) / E || 0,
                y: W(U * E) / E || 0
            }) : {
                x: f,
                y: m
            };
        return f = z.x, m = z.y, l ? Object.assign({}, K, ((O = {})[w] = b ? "0" : "", O[g] = y ? "0" : "", O.transform = 1 >= (x.devicePixelRatio || 1) ? "translate(" + f + "px, " + m + "px)" : "translate3d(" + f + "px, " + m + "px, 0)", O)) : Object.assign({}, K, ((t = {})[w] = b ? m + "px" : "", t[g] = y ? f + "px" : "", t.transform = "", t))
    }
    var eu = {
            passive: !0
        },
        ep = {
            left: "right",
            right: "left",
            bottom: "top",
            top: "bottom"
        };

    function ed(e) {
        return e.replace(/left|right|bottom|top/g, function(e) {
            return ep[e]
        })
    }
    var ef = {
        start: "end",
        end: "start"
    };

    function eh(e) {
        return e.replace(/start|end/g, function(e) {
            return ef[e]
        })
    }

    function em(e) {
        var t = V(e);
        return {
            scrollLeft: t.pageXOffset,
            scrollTop: t.pageYOffset
        }
    }

    function ev(e) {
        return X(Z(e)).left + em(e).scrollLeft
    }

    function ey(e) {
        var t = Q(e),
            r = t.overflow,
            n = t.overflowX,
            o = t.overflowY;
        return /auto|scroll|overlay|hidden/.test(r + o + n)
    }

    function eb(e, t) {
        void 0 === t && (t = []);
        var r, n = function e(t) {
                return ["html", "body", "#document"].indexOf(M(t)) >= 0 ? t.ownerDocument.body : j(t) && ey(t) ? t : e(ee(t))
            }(e),
            o = n === (null == (r = e.ownerDocument) ? void 0 : r.body),
            i = V(n),
            a = o ? [i].concat(i.visualViewport || [], ey(n) ? n : []) : n,
            s = t.concat(a);
        return o ? s : s.concat(eb(ee(a)))
    }

    function eg(e) {
        return Object.assign({}, e, {
            left: e.x,
            top: e.y,
            right: e.x + e.width,
            bottom: e.y + e.height
        })
    }

    function ew(e, t, r) {
        var n, o, i, a, s, l, c, u, p, d;
        return t === O ? eg(function(e, t) {
            var r = V(e),
                n = Z(e),
                o = r.visualViewport,
                i = n.clientWidth,
                a = n.clientHeight,
                s = 0,
                l = 0;
            if (o) {
                i = o.width, a = o.height;
                var c = H();
                (c || !c && "fixed" === t) && (s = o.offsetLeft, l = o.offsetTop)
            }
            return {
                width: i,
                height: a,
                x: s + ev(e),
                y: l
            }
        }(e, r)) : G(t) ? ((n = X(t, !1, "fixed" === r)).top = n.top + t.clientTop, n.left = n.left + t.clientLeft, n.bottom = n.top + t.clientHeight, n.right = n.left + t.clientWidth, n.width = t.clientWidth, n.height = t.clientHeight, n.x = n.left, n.y = n.top, n) : eg((o = Z(e), a = Z(o), s = em(o), l = null == (i = o.ownerDocument) ? void 0 : i.body, c = N(a.scrollWidth, a.clientWidth, l ? l.scrollWidth : 0, l ? l.clientWidth : 0), u = N(a.scrollHeight, a.clientHeight, l ? l.scrollHeight : 0, l ? l.clientHeight : 0), p = -s.scrollLeft + ev(o), d = -s.scrollTop, "rtl" === Q(l || a).direction && (p += N(a.clientWidth, l ? l.clientWidth : 0) - c), {
            width: c,
            height: u,
            x: p,
            y: d
        }))
    }

    function ex(e) {
        var t, r = e.reference,
            n = e.element,
            o = e.placement,
            i = o ? F(o) : null,
            a = o ? es(o) : null,
            s = r.x + r.width / 2 - n.width / 2,
            l = r.y + r.height / 2 - n.height / 2;
        switch (i) {
            case "top":
                t = {
                    x: s,
                    y: r.y - n.height
                };
                break;
            case q:
                t = {
                    x: s,
                    y: r.y + r.height
                };
                break;
            case C:
                t = {
                    x: r.x + r.width,
                    y: l
                };
                break;
            case k:
                t = {
                    x: r.x - n.width,
                    y: l
                };
                break;
            default:
                t = {
                    x: r.x,
                    y: r.y
                }
        }
        var c = i ? en(i) : null;
        if (null != c) {
            var u = "y" === c ? "height" : "width";
            switch (a) {
                case E:
                    t[c] = t[c] - (r[u] / 2 - n[u] / 2);
                    break;
                case "end":
                    t[c] = t[c] + (r[u] / 2 - n[u] / 2)
            }
        }
        return t
    }

    function eA(e, t) {
        void 0 === t && (t = {});
        var r, n, o, i, a, s, l, c, u = t,
            p = u.placement,
            d = void 0 === p ? e.placement : p,
            f = u.strategy,
            h = void 0 === f ? e.strategy : f,
            m = u.boundary,
            v = u.rootBoundary,
            y = u.elementContext,
            b = void 0 === y ? K : y,
            g = u.altBoundary,
            w = u.padding,
            x = void 0 === w ? 0 : w,
            A = ei("number" != typeof x ? x : ea(x, U)),
            R = e.rects.popper,
            I = e.elements[void 0 !== g && g ? b === K ? "reference" : K : b],
            P = (r = G(I) ? I : I.contextElement || Z(e.elements.popper), n = void 0 === m ? "clippingParents" : m, o = void 0 === v ? O : v, l = (s = [].concat("clippingParents" === n ? (i = eb(ee(r)), G(a = ["absolute", "fixed"].indexOf(Q(r).position) >= 0 && j(r) ? er(r) : r) ? i.filter(function(e) {
                return G(e) && $(e, a) && "body" !== M(e)
            }) : []) : [].concat(n), [o]))[0], (c = s.reduce(function(e, t) {
                var n = ew(r, t, h);
                return e.top = N(n.top, e.top), e.right = B(n.right, e.right), e.bottom = B(n.bottom, e.bottom), e.left = N(n.left, e.left), e
            }, ew(r, l, h))).width = c.right - c.left, c.height = c.bottom - c.top, c.x = c.left, c.y = c.top, c),
            S = X(e.elements.reference),
            k = ex({
                reference: S,
                element: R,
                strategy: "absolute",
                placement: d
            }),
            T = eg(Object.assign({}, R, k)),
            E = b === K ? T : S,
            z = {
                top: P.top - E.top + A.top,
                bottom: E.bottom - P.bottom + A.bottom,
                left: P.left - E.left + A.left,
                right: E.right - P.right + A.right
            },
            _ = e.modifiersData.offset;
        if (b === K && _) {
            var L = _[d];
            Object.keys(z).forEach(function(e) {
                var t = [C, q].indexOf(e) >= 0 ? 1 : -1,
                    r = ["top", q].indexOf(e) >= 0 ? "y" : "x";
                z[e] += L[r] * t
            })
        }
        return z
    }

    function eR(e, t, r) {
        return void 0 === r && (r = {
            x: 0,
            y: 0
        }), {
            top: e.top - t.height - r.y,
            right: e.right - t.width + r.x,
            bottom: e.bottom - t.height + r.y,
            left: e.left - t.width - r.x
        }
    }

    function eI(e) {
        return ["top", C, q, k].some(function(t) {
            return e[t] >= 0
        })
    }
    var eP = {
        placement: "bottom",
        modifiers: [],
        strategy: "absolute"
    };

    function eS() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return !t.some(function(e) {
            return !(e && "function" == typeof e.getBoundingClientRect)
        })
    }
    var eq = (n = void 0 === (r = (t = {
        defaultModifiers: [{
            name: "eventListeners",
            enabled: !0,
            phase: "write",
            fn: function() {},
            effect: function(e) {
                var t = e.state,
                    r = e.instance,
                    n = e.options,
                    o = n.scroll,
                    i = void 0 === o || o,
                    a = n.resize,
                    s = void 0 === a || a,
                    l = V(t.elements.popper),
                    c = [].concat(t.scrollParents.reference, t.scrollParents.popper);
                return i && c.forEach(function(e) {
                        e.addEventListener("scroll", r.update, eu)
                    }), s && l.addEventListener("resize", r.update, eu),
                    function() {
                        i && c.forEach(function(e) {
                            e.removeEventListener("scroll", r.update, eu)
                        }), s && l.removeEventListener("resize", r.update, eu)
                    }
            },
            data: {}
        }, {
            name: "popperOffsets",
            enabled: !0,
            phase: "read",
            fn: function(e) {
                var t = e.state,
                    r = e.name;
                t.modifiersData[r] = ex({
                    reference: t.rects.reference,
                    element: t.rects.popper,
                    strategy: "absolute",
                    placement: t.placement
                })
            },
            data: {}
        }, {
            name: "computeStyles",
            enabled: !0,
            phase: "beforeWrite",
            fn: function(e) {
                var t = e.state,
                    r = e.options,
                    n = r.gpuAcceleration,
                    o = r.adaptive,
                    i = r.roundOffsets,
                    a = void 0 === i || i,
                    s = {
                        placement: F(t.placement),
                        variation: es(t.placement),
                        popper: t.elements.popper,
                        popperRect: t.rects.popper,
                        gpuAcceleration: void 0 === n || n,
                        isFixed: "fixed" === t.options.strategy
                    };
                null != t.modifiersData.popperOffsets && (t.styles.popper = Object.assign({}, t.styles.popper, ec(Object.assign({}, s, {
                    offsets: t.modifiersData.popperOffsets,
                    position: t.options.strategy,
                    adaptive: void 0 === o || o,
                    roundOffsets: a
                })))), null != t.modifiersData.arrow && (t.styles.arrow = Object.assign({}, t.styles.arrow, ec(Object.assign({}, s, {
                    offsets: t.modifiersData.arrow,
                    position: "absolute",
                    adaptive: !1,
                    roundOffsets: a
                })))), t.attributes.popper = Object.assign({}, t.attributes.popper, {
                    "data-popper-placement": t.placement
                })
            },
            data: {}
        }, {
            name: "applyStyles",
            enabled: !0,
            phase: "write",
            fn: function(e) {
                var t = e.state;
                Object.keys(t.elements).forEach(function(e) {
                    var r = t.styles[e] || {},
                        n = t.attributes[e] || {},
                        o = t.elements[e];
                    j(o) && M(o) && (Object.assign(o.style, r), Object.keys(n).forEach(function(e) {
                        var t = n[e];
                        !1 === t ? o.removeAttribute(e) : o.setAttribute(e, !0 === t ? "" : t)
                    }))
                })
            },
            effect: function(e) {
                var t = e.state,
                    r = {
                        popper: {
                            position: t.options.strategy,
                            left: "0",
                            top: "0",
                            margin: "0"
                        },
                        arrow: {
                            position: "absolute"
                        },
                        reference: {}
                    };
                return Object.assign(t.elements.popper.style, r.popper), t.styles = r, t.elements.arrow && Object.assign(t.elements.arrow.style, r.arrow),
                    function() {
                        Object.keys(t.elements).forEach(function(e) {
                            var n = t.elements[e],
                                o = t.attributes[e] || {},
                                i = Object.keys(t.styles.hasOwnProperty(e) ? t.styles[e] : r[e]).reduce(function(e, t) {
                                    return e[t] = "", e
                                }, {});
                            j(n) && M(n) && (Object.assign(n.style, i), Object.keys(o).forEach(function(e) {
                                n.removeAttribute(e)
                            }))
                        })
                    }
            },
            requires: ["computeStyles"]
        }, {
            name: "offset",
            enabled: !0,
            phase: "main",
            requires: ["popperOffsets"],
            fn: function(e) {
                var t = e.state,
                    r = e.options,
                    n = e.name,
                    o = r.offset,
                    i = void 0 === o ? [0, 0] : o,
                    a = _.reduce(function(e, r) {
                        var n, o, a, s, l, c;
                        return e[r] = (n = t.rects, a = [k, "top"].indexOf(o = F(r)) >= 0 ? -1 : 1, l = (s = "function" == typeof i ? i(Object.assign({}, n, {
                            placement: r
                        })) : i)[0], c = s[1], l = l || 0, c = (c || 0) * a, [k, C].indexOf(o) >= 0 ? {
                            x: c,
                            y: l
                        } : {
                            x: l,
                            y: c
                        }), e
                    }, {}),
                    s = a[t.placement],
                    l = s.x,
                    c = s.y;
                null != t.modifiersData.popperOffsets && (t.modifiersData.popperOffsets.x += l, t.modifiersData.popperOffsets.y += c), t.modifiersData[n] = a
            }
        }, {
            name: "flip",
            enabled: !0,
            phase: "main",
            fn: function(e) {
                var t = e.state,
                    r = e.options,
                    n = e.name;
                if (!t.modifiersData[n]._skip) {
                    for (var o = r.mainAxis, i = void 0 === o || o, a = r.altAxis, s = void 0 === a || a, l = r.fallbackPlacements, c = r.padding, u = r.boundary, p = r.rootBoundary, d = r.altBoundary, f = r.flipVariations, h = void 0 === f || f, m = r.allowedAutoPlacements, v = t.options.placement, y = F(v), b = l || (y !== v && h ? function(e) {
                            if (F(e) === T) return [];
                            var t = ed(e);
                            return [eh(e), t, eh(t)]
                        }(v) : [ed(v)]), g = [v].concat(b).reduce(function(e, r) {
                            var n, o, i, a, s, l, d, f, v, y, b, g;
                            return e.concat(F(r) === T ? (o = (n = {
                                placement: r,
                                boundary: u,
                                rootBoundary: p,
                                padding: c,
                                flipVariations: h,
                                allowedAutoPlacements: m
                            }).placement, i = n.boundary, a = n.rootBoundary, s = n.padding, l = n.flipVariations, f = void 0 === (d = n.allowedAutoPlacements) ? _ : d, 0 === (b = (y = (v = es(o)) ? l ? z : z.filter(function(e) {
                                return es(e) === v
                            }) : U).filter(function(e) {
                                return f.indexOf(e) >= 0
                            })).length && (b = y), Object.keys(g = b.reduce(function(e, r) {
                                return e[r] = eA(t, {
                                    placement: r,
                                    boundary: i,
                                    rootBoundary: a,
                                    padding: s
                                })[F(r)], e
                            }, {})).sort(function(e, t) {
                                return g[e] - g[t]
                            })) : r)
                        }, []), w = t.rects.reference, x = t.rects.popper, A = new Map, R = !0, I = g[0], P = 0; P < g.length; P++) {
                        var S = g[P],
                            O = F(S),
                            K = es(S) === E,
                            L = ["top", q].indexOf(O) >= 0,
                            M = L ? "width" : "height",
                            V = eA(t, {
                                placement: S,
                                boundary: u,
                                rootBoundary: p,
                                altBoundary: d,
                                padding: c
                            }),
                            G = L ? K ? C : k : K ? q : "top";
                        w[M] > x[M] && (G = ed(G));
                        var j = ed(G),
                            D = [];
                        if (i && D.push(V[O] <= 0), s && D.push(V[G] <= 0, V[j] <= 0), D.every(function(e) {
                                return e
                            })) {
                            I = S, R = !1;
                            break
                        }
                        A.set(S, D)
                    }
                    if (R)
                        for (var N = function(e) {
                                var t = g.find(function(t) {
                                    var r = A.get(t);
                                    if (r) return r.slice(0, e).every(function(e) {
                                        return e
                                    })
                                });
                                if (t) return I = t, "break"
                            }, B = h ? 3 : 1; B > 0 && "break" !== N(B); B--);
                    t.placement !== I && (t.modifiersData[n]._skip = !0, t.placement = I, t.reset = !0)
                }
            },
            requiresIfExists: ["offset"],
            data: {
                _skip: !1
            }
        }, {
            name: "preventOverflow",
            enabled: !0,
            phase: "main",
            fn: function(e) {
                var t = e.state,
                    r = e.options,
                    n = e.name,
                    o = r.mainAxis,
                    i = r.altAxis,
                    a = r.boundary,
                    s = r.rootBoundary,
                    l = r.altBoundary,
                    c = r.padding,
                    u = r.tether,
                    p = void 0 === u || u,
                    d = r.tetherOffset,
                    f = void 0 === d ? 0 : d,
                    h = eA(t, {
                        boundary: a,
                        rootBoundary: s,
                        padding: c,
                        altBoundary: l
                    }),
                    m = F(t.placement),
                    v = es(t.placement),
                    y = !v,
                    b = en(m),
                    g = "x" === b ? "y" : "x",
                    w = t.modifiersData.popperOffsets,
                    x = t.rects.reference,
                    A = t.rects.popper,
                    R = "function" == typeof f ? f(Object.assign({}, t.rects, {
                        placement: t.placement
                    })) : f,
                    I = "number" == typeof R ? {
                        mainAxis: R,
                        altAxis: R
                    } : Object.assign({
                        mainAxis: 0,
                        altAxis: 0
                    }, R),
                    P = t.modifiersData.offset ? t.modifiersData.offset[t.placement] : null,
                    S = {
                        x: 0,
                        y: 0
                    };
                if (w) {
                    if (void 0 === o || o) {
                        var T, U = "y" === b ? "top" : k,
                            O = "y" === b ? q : C,
                            K = "y" === b ? "height" : "width",
                            z = w[b],
                            _ = z + h[U],
                            L = z - h[O],
                            M = p ? -A[K] / 2 : 0,
                            V = v === E ? x[K] : A[K],
                            G = v === E ? -A[K] : -x[K],
                            j = t.elements.arrow,
                            D = p && j ? Y(j) : {
                                width: 0,
                                height: 0
                            },
                            W = t.modifiersData["arrow#persistent"] ? t.modifiersData["arrow#persistent"].padding : {
                                top: 0,
                                right: 0,
                                bottom: 0,
                                left: 0
                            },
                            J = W[U],
                            H = W[O],
                            X = eo(0, x[K], D[K]),
                            $ = y ? x[K] / 2 - M - X - J - I.mainAxis : V - X - J - I.mainAxis,
                            Q = y ? -x[K] / 2 + M + X + H + I.mainAxis : G + X + H + I.mainAxis,
                            Z = t.elements.arrow && er(t.elements.arrow),
                            ee = Z ? "y" === b ? Z.clientTop || 0 : Z.clientLeft || 0 : 0,
                            et = null != (T = null == P ? void 0 : P[b]) ? T : 0,
                            ei = eo(p ? B(_, z + $ - et - ee) : _, z, p ? N(L, z + Q - et) : L);
                        w[b] = ei, S[b] = ei - z
                    }
                    if (void 0 !== i && i) {
                        var ea, el, ec = "x" === b ? "top" : k,
                            eu = "x" === b ? q : C,
                            ep = w[g],
                            ed = "y" === g ? "height" : "width",
                            ef = ep + h[ec],
                            eh = ep - h[eu],
                            em = -1 !== ["top", k].indexOf(m),
                            ev = null != (el = null == P ? void 0 : P[g]) ? el : 0,
                            ey = em ? ef : ep - x[ed] - A[ed] - ev + I.altAxis,
                            eb = em ? ep + x[ed] + A[ed] - ev - I.altAxis : eh,
                            eg = p && em ? (ea = eo(ey, ep, eb)) > eb ? eb : ea : eo(p ? ey : ef, ep, p ? eb : eh);
                        w[g] = eg, S[g] = eg - ep
                    }
                    t.modifiersData[n] = S
                }
            },
            requiresIfExists: ["offset"]
        }, {
            name: "arrow",
            enabled: !0,
            phase: "main",
            fn: function(e) {
                var t, r = e.state,
                    n = e.name,
                    o = e.options,
                    i = r.elements.arrow,
                    a = r.modifiersData.popperOffsets,
                    s = F(r.placement),
                    l = en(s),
                    c = [k, C].indexOf(s) >= 0 ? "height" : "width";
                if (i && a) {
                    var u, p = (u = o.padding, ei("number" != typeof(u = "function" == typeof u ? u(Object.assign({}, r.rects, {
                            placement: r.placement
                        })) : u) ? u : ea(u, U))),
                        d = Y(i),
                        f = "y" === l ? "top" : k,
                        h = "y" === l ? q : C,
                        m = r.rects.reference[c] + r.rects.reference[l] - a[l] - r.rects.popper[c],
                        v = a[l] - r.rects.reference[l],
                        y = er(i),
                        b = y ? "y" === l ? y.clientHeight || 0 : y.clientWidth || 0 : 0,
                        g = p[f],
                        w = b - d[c] - p[h],
                        x = b / 2 - d[c] / 2 + (m / 2 - v / 2),
                        A = eo(g, x, w);
                    r.modifiersData[n] = ((t = {})[l] = A, t.centerOffset = A - x, t)
                }
            },
            effect: function(e) {
                var t = e.state,
                    r = e.options.element,
                    n = void 0 === r ? "[data-popper-arrow]" : r;
                null != n && ("string" != typeof n || (n = t.elements.popper.querySelector(n))) && $(t.elements.popper, n) && (t.elements.arrow = n)
            },
            requires: ["popperOffsets"],
            requiresIfExists: ["preventOverflow"]
        }, {
            name: "hide",
            enabled: !0,
            phase: "main",
            requiresIfExists: ["preventOverflow"],
            fn: function(e) {
                var t = e.state,
                    r = e.name,
                    n = t.rects.reference,
                    o = t.rects.popper,
                    i = t.modifiersData.preventOverflow,
                    a = eA(t, {
                        elementContext: "reference"
                    }),
                    s = eA(t, {
                        altBoundary: !0
                    }),
                    l = eR(a, n),
                    c = eR(s, o, i),
                    u = eI(l),
                    p = eI(c);
                t.modifiersData[r] = {
                    referenceClippingOffsets: l,
                    popperEscapeOffsets: c,
                    isReferenceHidden: u,
                    hasPopperEscaped: p
                }, t.attributes.popper = Object.assign({}, t.attributes.popper, {
                    "data-popper-reference-hidden": u,
                    "data-popper-escaped": p
                })
            }
        }]
    }).defaultModifiers) ? [] : r, i = void 0 === (o = t.defaultOptions) ? eP : o, function(e, t, r) {
        void 0 === r && (r = i);
        var o, a, s = {
                placement: "bottom",
                orderedModifiers: [],
                options: Object.assign({}, eP, i),
                modifiersData: {},
                elements: {
                    reference: e,
                    popper: t
                },
                attributes: {},
                styles: {}
            },
            l = [],
            c = !1,
            u = {
                state: s,
                setOptions: function(r) {
                    var o = "function" == typeof r ? r(s.options) : r;
                    p(), s.options = Object.assign({}, i, s.options, o), s.scrollParents = {
                        reference: G(e) ? eb(e) : e.contextElement ? eb(e.contextElement) : [],
                        popper: eb(t)
                    };
                    var a, c, d, f, h, m, v = (a = Object.keys(m = [].concat(n, s.options.modifiers).reduce(function(e, t) {
                        var r = e[t.name];
                        return e[t.name] = r ? Object.assign({}, r, t, {
                            options: Object.assign({}, r.options, t.options),
                            data: Object.assign({}, r.data, t.data)
                        }) : t, e
                    }, {})).map(function(e) {
                        return m[e]
                    }), c = new Map, d = new Set, f = [], a.forEach(function(e) {
                        c.set(e.name, e)
                    }), a.forEach(function(e) {
                        d.has(e.name) || function e(t) {
                            d.add(t.name), [].concat(t.requires || [], t.requiresIfExists || []).forEach(function(t) {
                                if (!d.has(t)) {
                                    var r = c.get(t);
                                    r && e(r)
                                }
                            }), f.push(t)
                        }(e)
                    }), h = f, L.reduce(function(e, t) {
                        return e.concat(h.filter(function(e) {
                            return e.phase === t
                        }))
                    }, []));
                    return s.orderedModifiers = v.filter(function(e) {
                        return e.enabled
                    }), s.orderedModifiers.forEach(function(e) {
                        var t = e.name,
                            r = e.options,
                            n = e.effect;
                        if ("function" == typeof n) {
                            var o = n({
                                state: s,
                                name: t,
                                instance: u,
                                options: void 0 === r ? {} : r
                            });
                            l.push(o || function() {})
                        }
                    }), u.update()
                },
                forceUpdate: function() {
                    if (!c) {
                        var e = s.elements,
                            t = e.reference,
                            r = e.popper;
                        if (eS(t, r)) {
                            s.rects = {
                                reference: (n = er(r), o = "fixed" === s.options.strategy, p = j(n), d = j(n) && (a = W((i = n.getBoundingClientRect()).width) / n.offsetWidth || 1, l = W(i.height) / n.offsetHeight || 1, 1 !== a || 1 !== l), f = Z(n), h = X(t, d, o), m = {
                                    scrollLeft: 0,
                                    scrollTop: 0
                                }, v = {
                                    x: 0,
                                    y: 0
                                }, (p || !p && !o) && (("body" !== M(n) || ey(f)) && (m = n !== V(n) && j(n) ? {
                                    scrollLeft: n.scrollLeft,
                                    scrollTop: n.scrollTop
                                } : em(n)), j(n) ? ((v = X(n, !0)).x += n.clientLeft, v.y += n.clientTop) : f && (v.x = ev(f))), {
                                    x: h.left + m.scrollLeft - v.x,
                                    y: h.top + m.scrollTop - v.y,
                                    width: h.width,
                                    height: h.height
                                }),
                                popper: Y(r)
                            }, s.reset = !1, s.placement = s.options.placement, s.orderedModifiers.forEach(function(e) {
                                return s.modifiersData[e.name] = Object.assign({}, e.data)
                            });
                            for (var n, o, i, a, l, p, d, f, h, m, v, y = 0; y < s.orderedModifiers.length; y++)
                                if (!0 !== s.reset) {
                                    var b = s.orderedModifiers[y],
                                        g = b.fn,
                                        w = b.options,
                                        x = void 0 === w ? {} : w,
                                        A = b.name;
                                    "function" == typeof g && (s = g({
                                        state: s,
                                        options: x,
                                        name: A,
                                        instance: u
                                    }) || s)
                                } else s.reset = !1, y = -1
                        }
                    }
                },
                update: (o = function() {
                    return new Promise(function(e) {
                        u.forceUpdate(), e(s)
                    })
                }, function() {
                    return a || (a = new Promise(function(e) {
                        Promise.resolve().then(function() {
                            a = void 0, e(o())
                        })
                    })), a
                }),
                destroy: function() {
                    p(), c = !0
                }
            };
        if (!eS(e, t)) return u;

        function p() {
            l.forEach(function(e) {
                return e()
            }), l = []
        }
        return u.setOptions(r).then(function(e) {
            !c && r.onFirstUpdate && r.onFirstUpdate(e)
        }), u
    });

    function eC(e) {
        return (0, u.g)("MuiPopper", e)
    }(0, h.g)("MuiPopper", ["root"]);
    let ek = ["anchorEl", "children", "direction", "disablePortal", "modifiers", "open", "placement", "popperOptions", "popperRef", "slotProps", "slots", "TransitionProps", "ownerState"],
        eT = ["anchorEl", "children", "container", "direction", "disablePortal", "keepMounted", "modifiers", "open", "placement", "popperOptions", "popperRef", "style", "transition", "slotProps", "slots"];

    function eU(e) {
        return "function" == typeof e ? e() : e
    }
    let eE = {},
        eO = s.forwardRef(function(e, t) {
            var r;
            let {
                anchorEl: n,
                children: o,
                direction: i,
                disablePortal: a,
                modifiers: l,
                open: c,
                placement: f,
                popperOptions: h,
                popperRef: v,
                slotProps: y = {},
                slots: x = {},
                TransitionProps: A
            } = e, R = (0, u._)(e, ek), I = s.useRef(null), P = (0, b.u)(I, t), S = s.useRef(null), q = (0, b.u)(S, v), C = s.useRef(q);
            (0, g.u)(() => {
                C.current = q
            }, [q]), s.useImperativeHandle(v, () => S.current, []);
            let k = function(e, t) {
                    if ("ltr" === t) return e;
                    switch (e) {
                        case "bottom-end":
                            return "bottom-start";
                        case "bottom-start":
                            return "bottom-end";
                        case "top-end":
                            return "top-start";
                        case "top-start":
                            return "top-end";
                        default:
                            return e
                    }
                }(f, i),
                [T, U] = s.useState(k),
                [E, O] = s.useState(eU(n));
            s.useEffect(() => {
                S.current && S.current.forceUpdate()
            }), s.useEffect(() => {
                n && O(eU(n))
            }, [n]), (0, g.u)(() => {
                if (!E || !c) return;
                let e = [{
                    name: "preventOverflow",
                    options: {
                        altBoundary: a
                    }
                }, {
                    name: "flip",
                    options: {
                        altBoundary: a
                    }
                }, {
                    name: "onUpdate",
                    enabled: !0,
                    phase: "afterWrite",
                    fn: e => {
                        let {
                            state: t
                        } = e;
                        U(t.placement)
                    }
                }];
                null != l && (e = e.concat(l)), h && null != h.modifiers && (e = e.concat(h.modifiers));
                let t = eq(E, I.current, (0, p._)({
                    placement: k
                }, h, {
                    modifiers: e
                }));
                return C.current(t), () => {
                    t.destroy(), C.current(null)
                }
            }, [E, a, l, c, h, k]);
            let K = {
                placement: T
            };
            null !== A && (K.TransitionProps = A);
            let z = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, d.a)({
                        root: ["root"]
                    }, eC, t)
                })(e),
                _ = null != (r = x.root) ? r : "div",
                L = (0, w.u)({
                    elementType: _,
                    externalSlotProps: y.root,
                    externalForwardedProps: R,
                    additionalProps: {
                        role: "tooltip",
                        ref: P
                    },
                    ownerState: e,
                    className: z.root
                });
            return (0, m.jsx)(_, (0, p._)({}, L, {
                children: "function" == typeof o ? o(K) : o
            }))
        }),
        eK = s.forwardRef(function(e, t) {
            let r, {
                    anchorEl: n,
                    children: o,
                    container: i,
                    direction: a = "ltr",
                    disablePortal: l = !1,
                    keepMounted: c = !1,
                    modifiers: d,
                    open: f,
                    placement: h = "bottom",
                    popperOptions: b = eE,
                    popperRef: g,
                    style: w,
                    transition: x = !1,
                    slotProps: A = {},
                    slots: R = {}
                } = e,
                I = (0, u._)(e, eT),
                [P, S] = s.useState(!0);
            if (!c && !f && (!x || P)) return null;
            if (i) r = i;
            else if (n) {
                let e = eU(n);
                r = e && void 0 !== e.nodeType ? (0, v.o)(e).body : (0, v.o)(null).body
            }
            let q = x ? {
                in: f,
                onEnter: () => {
                    S(!1)
                },
                onExited: () => {
                    S(!0)
                }
            } : void 0;
            return (0, m.jsx)(y.P, {
                disablePortal: l,
                container: r,
                children: (0, m.jsx)(eO, (0, p._)({
                    anchorEl: n,
                    direction: a,
                    disablePortal: l,
                    modifiers: d,
                    ref: t,
                    open: x ? !P : f,
                    placement: h,
                    popperOptions: b,
                    popperRef: g,
                    slotProps: A,
                    slots: R
                }, I, {
                    style: (0, p._)({
                        position: "fixed",
                        top: 0,
                        left: 0,
                        display: f || !c || x && !P ? void 0 : "none"
                    }, w),
                    TransitionProps: q,
                    children: o
                }))
            })
        }),
        ez = ["anchorEl", "component", "components", "componentsProps", "container", "disablePortal", "keepMounted", "modifiers", "open", "placement", "popperOptions", "popperRef", "transition", "slots", "slotProps"],
        e_ = (0, d.s)(eK, {
            name: "MuiPopper",
            slot: "Root",
            overridesResolver: (e, t) => t.root
        })({}),
        eL = s.forwardRef(function(e, t) {
            var r;
            let n = R(),
                o = (0, x.u)({
                    props: e,
                    name: "MuiPopper"
                }),
                {
                    anchorEl: i,
                    component: a,
                    components: s,
                    componentsProps: l,
                    container: c,
                    disablePortal: d,
                    keepMounted: f,
                    modifiers: h,
                    open: v,
                    placement: y,
                    popperOptions: b,
                    popperRef: g,
                    transition: w,
                    slots: A,
                    slotProps: I
                } = o,
                P = (0, u._)(o, ez),
                S = null != (r = null == A ? void 0 : A.root) ? r : null == s ? void 0 : s.Root,
                q = (0, p._)({
                    anchorEl: i,
                    container: c,
                    disablePortal: d,
                    keepMounted: f,
                    modifiers: h,
                    open: v,
                    placement: y,
                    popperOptions: b,
                    popperRef: g,
                    transition: w
                }, P);
            return (0, m.jsx)(e_, (0, p._)({
                as: a,
                direction: null == n ? void 0 : n.direction,
                slots: {
                    root: S
                },
                slotProps: null != I ? I : l
            }, q, {
                ref: t
            }))
        });
    e.s(["M", 0, eL], 356983);
    var eM = e.i(745984),
        eV = e.i(249707),
        eG = e.i(506391),
        ej = e.i(127633),
        eD = e.i(564349),
        eF = e.i(576070),
        eN = e.i(329102),
        eB = e.i(819139),
        eW = e.i(548601);

    function eJ(e) {
        return (0, u.g)("MuiTooltip", e)
    }
    e.i(596779);
    var eH = (0, h.g)("MuiTooltip", ["popper", "popperInteractive", "popperArrow", "popperClose", "tooltip", "tooltipArrow", "touch", "tooltipPlacementLeft", "tooltipPlacementRight", "tooltipPlacementTop", "tooltipPlacementBottom", "arrow"]);
    let eX = ["arrow", "children", "classes", "components", "componentsProps", "describeChild", "disableFocusListener", "disableHoverListener", "disableInteractive", "disableTouchListener", "enterDelay", "enterNextDelay", "enterTouchDelay", "followCursor", "id", "leaveDelay", "leaveTouchDelay", "onClose", "onOpen", "open", "placement", "PopperComponent", "PopperProps", "slotProps", "slots", "title", "TransitionComponent", "TransitionProps"],
        eY = (0, d.s)(eL, {
            name: "MuiTooltip",
            slot: "Popper",
            overridesResolver: (e, t) => {
                let {
                    ownerState: r
                } = e;
                return [t.popper, !r.disableInteractive && t.popperInteractive, r.arrow && t.popperArrow, !r.open && t.popperClose]
            }
        })(e => {
            let {
                theme: t,
                ownerState: r,
                open: n
            } = e;
            return (0, p._)({
                zIndex: (t.vars || t).zIndex.tooltip,
                pointerEvents: "none"
            }, !r.disableInteractive && {
                pointerEvents: "auto"
            }, !n && {
                pointerEvents: "none"
            }, r.arrow && {
                ['&[data-popper-placement*="bottom"] .'.concat(eH.arrow)]: {
                    top: 0,
                    marginTop: "-0.71em",
                    "&::before": {
                        transformOrigin: "0 100%"
                    }
                },
                ['&[data-popper-placement*="top"] .'.concat(eH.arrow)]: {
                    bottom: 0,
                    marginBottom: "-0.71em",
                    "&::before": {
                        transformOrigin: "100% 0"
                    }
                },
                ['&[data-popper-placement*="right"] .'.concat(eH.arrow)]: (0, p._)({}, r.isRtl ? {
                    right: 0,
                    marginRight: "-0.71em"
                } : {
                    left: 0,
                    marginLeft: "-0.71em"
                }, {
                    height: "1em",
                    width: "0.71em",
                    "&::before": {
                        transformOrigin: "100% 100%"
                    }
                }),
                ['&[data-popper-placement*="left"] .'.concat(eH.arrow)]: (0, p._)({}, r.isRtl ? {
                    left: 0,
                    marginLeft: "-0.71em"
                } : {
                    right: 0,
                    marginRight: "-0.71em"
                }, {
                    height: "1em",
                    width: "0.71em",
                    "&::before": {
                        transformOrigin: "0 0"
                    }
                })
            })
        }),
        e$ = (0, d.s)("div", {
            name: "MuiTooltip",
            slot: "Tooltip",
            overridesResolver: (e, t) => {
                let {
                    ownerState: r
                } = e;
                return [t.tooltip, r.touch && t.touch, r.arrow && t.tooltipArrow, t["tooltipPlacement".concat((0, u.a)(r.placement.split("-")[0]))]]
            }
        })(e => {
            let {
                theme: t,
                ownerState: r
            } = e;
            return (0, p._)({
                backgroundColor: t.vars ? t.vars.palette.Tooltip.bg : (0, u.b)(t.palette.grey[700], .92),
                borderRadius: (t.vars || t).shape.borderRadius,
                color: (t.vars || t).palette.common.white,
                fontFamily: t.typography.fontFamily,
                padding: "4px 8px",
                fontSize: t.typography.pxToRem(11),
                maxWidth: 300,
                margin: 2,
                wordWrap: "break-word",
                fontWeight: t.typography.fontWeightMedium
            }, r.arrow && {
                position: "relative",
                margin: 0
            }, r.touch && {
                padding: "8px 16px",
                fontSize: t.typography.pxToRem(14),
                lineHeight: Math.round(16 / 14 * 1e5) / 1e5 + "em",
                fontWeight: t.typography.fontWeightRegular
            }, {
                [".".concat(eH.popper, '[data-popper-placement*="left"] &')]: (0, p._)({
                    transformOrigin: "right center"
                }, r.isRtl ? (0, p._)({
                    marginLeft: "14px"
                }, r.touch && {
                    marginLeft: "24px"
                }) : (0, p._)({
                    marginRight: "14px"
                }, r.touch && {
                    marginRight: "24px"
                })),
                [".".concat(eH.popper, '[data-popper-placement*="right"] &')]: (0, p._)({
                    transformOrigin: "left center"
                }, r.isRtl ? (0, p._)({
                    marginRight: "14px"
                }, r.touch && {
                    marginRight: "24px"
                }) : (0, p._)({
                    marginLeft: "14px"
                }, r.touch && {
                    marginLeft: "24px"
                })),
                [".".concat(eH.popper, '[data-popper-placement*="top"] &')]: (0, p._)({
                    transformOrigin: "center bottom",
                    marginBottom: "14px"
                }, r.touch && {
                    marginBottom: "24px"
                }),
                [".".concat(eH.popper, '[data-popper-placement*="bottom"] &')]: (0, p._)({
                    transformOrigin: "center top",
                    marginTop: "14px"
                }, r.touch && {
                    marginTop: "24px"
                })
            })
        }),
        eQ = (0, d.s)("span", {
            name: "MuiTooltip",
            slot: "Arrow",
            overridesResolver: (e, t) => t.arrow
        })(e => {
            let {
                theme: t
            } = e;
            return {
                overflow: "hidden",
                position: "absolute",
                width: "1em",
                height: "0.71em",
                boxSizing: "border-box",
                color: t.vars ? t.vars.palette.Tooltip.bg : (0, u.b)(t.palette.grey[700], .9),
                "&::before": {
                    content: '""',
                    margin: "auto",
                    display: "block",
                    width: "100%",
                    height: "100%",
                    backgroundColor: "currentColor",
                    transform: "rotate(45deg)"
                }
            }
        }),
        eZ = !1,
        e0 = new eV.T,
        e1 = {
            x: 0,
            y: 0
        };

    function e2(e, t) {
        return function(r) {
            for (var n = arguments.length, o = Array(n > 1 ? n - 1 : 0), i = 1; i < n; i++) o[i - 1] = arguments[i];
            t && t(r, ...o), e(r, ...o)
        }
    }
    let e4 = s.forwardRef(function(e, t) {
        var r, n, o, i, a, l, c, h, v, y, g, w, A, R, I, P, S, q, C;
        let k = (0, x.u)({
                props: e,
                name: "MuiTooltip"
            }),
            {
                arrow: T = !1,
                children: U,
                components: E = {},
                componentsProps: O = {},
                describeChild: K = !1,
                disableFocusListener: z = !1,
                disableHoverListener: _ = !1,
                disableInteractive: L = !1,
                disableTouchListener: M = !1,
                enterDelay: V = 100,
                enterNextDelay: G = 0,
                enterTouchDelay: j = 700,
                followCursor: D = !1,
                id: F,
                leaveDelay: N = 0,
                leaveTouchDelay: B = 1500,
                onClose: W,
                onOpen: J,
                open: H,
                placement: X = "bottom",
                PopperComponent: Y,
                PopperProps: $ = {},
                slotProps: Q = {},
                slots: Z = {},
                title: ee,
                TransitionComponent: et = eB.G,
                TransitionProps: er
            } = k,
            en = (0, u._)(k, eX),
            eo = s.isValidElement(U) ? U : (0, m.jsx)("span", {
                children: U
            }),
            ei = (0, eM.u)(),
            ea = (0, f.u)(),
            [es, el] = s.useState(),
            [ec, eu] = s.useState(null),
            ep = s.useRef(!1),
            ed = L || D,
            ef = (0, eV.u)(),
            eh = (0, eV.u)(),
            em = (0, eV.u)(),
            ev = (0, eV.u)(),
            [ey, eb] = (0, eG.u)({
                controlled: H,
                default: !1,
                name: "Tooltip",
                state: "open"
            }),
            eg = ey,
            ew = (0, ej.u)(F),
            ex = s.useRef(),
            eA = (0, eD.u)(() => {
                void 0 !== ex.current && (document.body.style.WebkitUserSelect = ex.current, ex.current = void 0), ev.clear()
            });
        s.useEffect(() => eA, [eA]);
        let eR = e => {
                e0.clear(), eZ = !0, eb(!0), J && !eg && J(e)
            },
            eI = (0, eD.u)(e => {
                e0.start(800 + N, () => {
                    eZ = !1
                }), eb(!1), W && eg && W(e), ef.start(ei.transitions.duration.shortest, () => {
                    ep.current = !1
                })
            }),
            eP = e => {
                ep.current && "touchstart" !== e.type || (es && es.removeAttribute("title"), eh.clear(), em.clear(), V || eZ && G ? eh.start(eZ ? G : V, () => {
                    eR(e)
                }) : eR(e))
            },
            eS = e => {
                eh.clear(), em.start(N, () => {
                    eI(e)
                })
            },
            {
                isFocusVisibleRef: eq,
                onBlur: eC,
                onFocus: ek,
                ref: eT
            } = (0, eF.u)(),
            [, eU] = s.useState(!1),
            eE = e => {
                eC(e), !1 === eq.current && (eU(!1), eS(e))
            },
            eO = e => {
                es || el(e.currentTarget), ek(e), !0 === eq.current && (eU(!0), eP(e))
            },
            eK = e => {
                ep.current = !0;
                let t = eo.props;
                t.onTouchStart && t.onTouchStart(e)
            };
        s.useEffect(() => {
            if (eg) return document.addEventListener("keydown", e), () => {
                document.removeEventListener("keydown", e)
            };

            function e(e) {
                "Escape" !== e.key && "Esc" !== e.key || eI(e)
            }
        }, [eI, eg]);
        let ez = (0, b.u)((0, eN.g)(eo), eT, el, t);
        ee || 0 === ee || (eg = !1);
        let e_ = s.useRef(),
            eH = {},
            e4 = "string" == typeof ee;
        K ? (eH.title = eg || !e4 || _ ? null : ee, eH["aria-describedby"] = eg ? ew : null) : (eH["aria-label"] = e4 ? ee : null, eH["aria-labelledby"] = eg && !e4 ? ew : null);
        let e3 = (0, p._)({}, eH, en, eo.props, {
                className: (0, d.c)(en.className, eo.props.className),
                onTouchStart: eK,
                ref: ez
            }, D ? {
                onMouseMove: e => {
                    let t = eo.props;
                    t.onMouseMove && t.onMouseMove(e), e1 = {
                        x: e.clientX,
                        y: e.clientY
                    }, e_.current && e_.current.update()
                }
            } : {}),
            e6 = {};
        M || (e3.onTouchStart = e => {
            eK(e), em.clear(), ef.clear(), eA(), ex.current = document.body.style.WebkitUserSelect, document.body.style.WebkitUserSelect = "none", ev.start(j, () => {
                document.body.style.WebkitUserSelect = ex.current, eP(e)
            })
        }, e3.onTouchEnd = e => {
            eo.props.onTouchEnd && eo.props.onTouchEnd(e), eA(), em.start(B, () => {
                eI(e)
            })
        }), _ || (e3.onMouseOver = e2(eP, e3.onMouseOver), e3.onMouseLeave = e2(eS, e3.onMouseLeave), ed || (e6.onMouseOver = eP, e6.onMouseLeave = eS)), z || (e3.onFocus = e2(eO, e3.onFocus), e3.onBlur = e2(eE, e3.onBlur), ed || (e6.onFocus = eO, e6.onBlur = eE));
        let e9 = s.useMemo(() => {
                var e;
                let t = [{
                    name: "arrow",
                    enabled: !!ec,
                    options: {
                        element: ec,
                        padding: 4
                    }
                }];
                return null != (e = $.popperOptions) && e.modifiers && (t = t.concat($.popperOptions.modifiers)), (0, p._)({}, $.popperOptions, {
                    modifiers: t
                })
            }, [ec, $]),
            e5 = (0, p._)({}, k, {
                isRtl: ea,
                arrow: T,
                disableInteractive: ed,
                placement: X,
                PopperComponentProp: Y,
                touch: ep.current
            }),
            e7 = (e => {
                let {
                    classes: t,
                    disableInteractive: r,
                    arrow: n,
                    touch: o,
                    placement: i
                } = e, a = {
                    popper: ["popper", !r && "popperInteractive", n && "popperArrow"],
                    tooltip: ["tooltip", n && "tooltipArrow", o && "touch", "tooltipPlacement".concat((0, u.a)(i.split("-")[0]))],
                    arrow: ["arrow"]
                };
                return (0, d.a)(a, eJ, t)
            })(e5),
            e8 = null != (r = null != (n = Z.popper) ? n : E.Popper) ? r : eY,
            te = null != (o = null != (i = null != (a = Z.transition) ? a : E.Transition) ? i : et) ? o : eB.G,
            tt = null != (l = null != (c = Z.tooltip) ? c : E.Tooltip) ? l : e$,
            tr = null != (h = null != (v = Z.arrow) ? v : E.Arrow) ? h : eQ,
            tn = (0, eW.a)(e8, (0, p._)({}, $, null != (y = Q.popper) ? y : O.popper, {
                className: (0, d.c)(e7.popper, null == $ ? void 0 : $.className, null == (g = null != (w = Q.popper) ? w : O.popper) ? void 0 : g.className)
            }), e5),
            to = (0, eW.a)(te, (0, p._)({}, er, null != (A = Q.transition) ? A : O.transition), e5),
            ti = (0, eW.a)(tt, (0, p._)({}, null != (R = Q.tooltip) ? R : O.tooltip, {
                className: (0, d.c)(e7.tooltip, null == (I = null != (P = Q.tooltip) ? P : O.tooltip) ? void 0 : I.className)
            }), e5),
            ta = (0, eW.a)(tr, (0, p._)({}, null != (S = Q.arrow) ? S : O.arrow, {
                className: (0, d.c)(e7.arrow, null == (q = null != (C = Q.arrow) ? C : O.arrow) ? void 0 : q.className)
            }), e5);
        return (0, m.jsxs)(s.Fragment, {
            children: [s.cloneElement(eo, e3), (0, m.jsx)(e8, (0, p._)({
                as: null != Y ? Y : eL,
                placement: X,
                anchorEl: D ? {
                    getBoundingClientRect: () => ({
                        top: e1.y,
                        left: e1.x,
                        right: e1.x,
                        bottom: e1.y,
                        width: 0,
                        height: 0
                    })
                } : es,
                popperRef: e_,
                open: !!es && eg,
                id: ew,
                transition: !0
            }, e6, tn, {
                popperOptions: e9,
                children: e => {
                    let {
                        TransitionProps: t
                    } = e;
                    return (0, m.jsx)(te, (0, p._)({
                        timeout: ei.transitions.duration.shorter
                    }, t, to, {
                        children: (0, m.jsxs)(tt, (0, p._)({}, ti, {
                            children: [ee, T ? (0, m.jsx)(tr, (0, p._)({}, ta, {
                                ref: eu
                            })) : null]
                        }))
                    }))
                }
            }))]
        })
    });
    var e3 = (0, l.default)({
            name: "Tooltip"
        })(function(e) {
            return {
                tooltip: (0, a._)({
                    color: e.palette.content.inverse,
                    backgroundColor: e.palette.actionV2.primary.fill
                }, e.typography.tooltip),
                arrow: {
                    color: e.palette.actionV2.primary.fill
                }
            }
        }),
        e6 = (0, s.forwardRef)(function(e, t) {
            var r = e.classes,
                n = e.className,
                o = (0, a.a)(e, ["classes", "className"]),
                i = e3(void 0, {
                    props: {
                        classes: (0, c.default)(r, n)
                    }
                });
            return s.default.createElement(e4, (0, a._)({}, o, {
                classes: i.classes,
                ref: t
            }))
        });
    e.s(["Tooltip", 0, e6], 46591)
}, 222634, 382655, e => {
    "use strict";
    let t, r, n, o, i, a;
    var s = e.i(30941),
        l = e.i(416340),
        c = e.i(936993),
        u = e.i(129210),
        p = e.i(569384),
        d = e.i(169336),
        f = e.i(477763),
        h = e.i(226319),
        m = e.i(91375),
        v = e.i(928277),
        y = e.i(221628),
        b = e.i(442632),
        g = e.i(945589);

    function w() {
        let e = (0, p._)(["\n  0% {\n    left: -35%;\n    right: 100%;\n  }\n\n  60% {\n    left: 100%;\n    right: -90%;\n  }\n\n  100% {\n    left: 100%;\n    right: -90%;\n  }\n"]);
        return w = function() {
            return e
        }, e
    }

    function x() {
        let e = (0, p._)(["\n  0% {\n    left: -200%;\n    right: 100%;\n  }\n\n  60% {\n    left: 107%;\n    right: -8%;\n  }\n\n  100% {\n    left: 107%;\n    right: -8%;\n  }\n"]);
        return x = function() {
            return e
        }, e
    }

    function A() {
        let e = (0, p._)(["\n  0% {\n    opacity: 1;\n    background-position: 0 -23px;\n  }\n\n  60% {\n    opacity: 0;\n    background-position: 0 -23px;\n  }\n\n  100% {\n    opacity: 1;\n    background-position: -200px -23px;\n  }\n"]);
        return A = function() {
            return e
        }, e
    }

    function R() {
        let e = (0, p._)(["\n    animation: ", " 3s infinite linear;\n  "]);
        return R = function() {
            return e
        }, e
    }

    function I() {
        let e = (0, p._)(["\n      width: auto;\n      animation: ", " 2.1s cubic-bezier(0.65, 0.815, 0.735, 0.395) infinite;\n    "]);
        return I = function() {
            return e
        }, e
    }

    function P() {
        let e = (0, p._)(["\n      width: auto;\n      animation: ", " 2.1s cubic-bezier(0.165, 0.84, 0.44, 1) 1.15s infinite;\n    "]);
        return P = function() {
            return e
        }, e
    }

    function S(e) {
        return (0, d.g)("MuiLinearProgress", e)
    }(0, v.g)("MuiLinearProgress", ["root", "colorPrimary", "colorSecondary", "determinate", "indeterminate", "buffer", "query", "dashed", "dashedColorPrimary", "dashedColorSecondary", "bar", "barColorPrimary", "barColorSecondary", "bar1Indeterminate", "bar1Determinate", "bar1Buffer", "bar2Indeterminate", "bar2Buffer"]);
    let q = ["className", "color", "value", "valueBuffer", "variant"],
        C = (0, g.keyframes)(t || (t = w())),
        k = (0, g.keyframes)(r || (r = x())),
        T = (0, g.keyframes)(n || (n = A())),
        U = (e, t) => "inherit" === t ? "currentColor" : e.vars ? e.vars.palette.LinearProgress["".concat(t, "Bg")] : "light" === e.palette.mode ? (0, d.l)(e.palette[t].main, .62) : (0, d.j)(e.palette[t].main, .5),
        E = (0, h.s)("span", {
            name: "MuiLinearProgress",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: r
                } = e;
                return [t.root, t["color".concat((0, d.a)(r.color))], t[r.variant]]
            }
        })(e => {
            let {
                ownerState: t,
                theme: r
            } = e;
            return (0, f._)({
                position: "relative",
                overflow: "hidden",
                display: "block",
                height: 4,
                zIndex: 0,
                "@media print": {
                    colorAdjust: "exact"
                },
                backgroundColor: U(r, t.color)
            }, "inherit" === t.color && "buffer" !== t.variant && {
                backgroundColor: "none",
                "&::before": {
                    content: '""',
                    position: "absolute",
                    left: 0,
                    top: 0,
                    right: 0,
                    bottom: 0,
                    backgroundColor: "currentColor",
                    opacity: .3
                }
            }, "buffer" === t.variant && {
                backgroundColor: "transparent"
            }, "query" === t.variant && {
                transform: "rotate(180deg)"
            })
        }),
        O = (0, h.s)("span", {
            name: "MuiLinearProgress",
            slot: "Dashed",
            overridesResolver: (e, t) => {
                let {
                    ownerState: r
                } = e;
                return [t.dashed, t["dashedColor".concat((0, d.a)(r.color))]]
            }
        })(e => {
            let {
                ownerState: t,
                theme: r
            } = e, n = U(r, t.color);
            return (0, f._)({
                position: "absolute",
                marginTop: 0,
                height: "100%",
                width: "100%"
            }, "inherit" === t.color && {
                opacity: .3
            }, {
                backgroundImage: "radial-gradient(".concat(n, " 0%, ").concat(n, " 16%, transparent 42%)"),
                backgroundSize: "10px 10px",
                backgroundPosition: "0 -23px"
            })
        }, (0, g.css)(o || (o = R()), T)),
        K = (0, h.s)("span", {
            name: "MuiLinearProgress",
            slot: "Bar1",
            overridesResolver: (e, t) => {
                let {
                    ownerState: r
                } = e;
                return [t.bar, t["barColor".concat((0, d.a)(r.color))], ("indeterminate" === r.variant || "query" === r.variant) && t.bar1Indeterminate, "determinate" === r.variant && t.bar1Determinate, "buffer" === r.variant && t.bar1Buffer]
            }
        })(e => {
            let {
                ownerState: t,
                theme: r
            } = e;
            return (0, f._)({
                width: "100%",
                position: "absolute",
                left: 0,
                bottom: 0,
                top: 0,
                transition: "transform 0.2s linear",
                transformOrigin: "left",
                backgroundColor: "inherit" === t.color ? "currentColor" : (r.vars || r).palette[t.color].main
            }, "determinate" === t.variant && {
                transition: "transform .4s linear"
            }, "buffer" === t.variant && {
                zIndex: 1,
                transition: "transform .4s linear"
            })
        }, e => {
            let {
                ownerState: t
            } = e;
            return ("indeterminate" === t.variant || "query" === t.variant) && (0, g.css)(i || (i = I()), C)
        }),
        z = (0, h.s)("span", {
            name: "MuiLinearProgress",
            slot: "Bar2",
            overridesResolver: (e, t) => {
                let {
                    ownerState: r
                } = e;
                return [t.bar, t["barColor".concat((0, d.a)(r.color))], ("indeterminate" === r.variant || "query" === r.variant) && t.bar2Indeterminate, "buffer" === r.variant && t.bar2Buffer]
            }
        })(e => {
            let {
                ownerState: t,
                theme: r
            } = e;
            return (0, f._)({
                width: "100%",
                position: "absolute",
                left: 0,
                bottom: 0,
                top: 0,
                transition: "transform 0.2s linear",
                transformOrigin: "left"
            }, "buffer" !== t.variant && {
                backgroundColor: "inherit" === t.color ? "currentColor" : (r.vars || r).palette[t.color].main
            }, "inherit" === t.color && {
                opacity: .3
            }, "buffer" === t.variant && {
                backgroundColor: U(r, t.color),
                transition: "transform .4s linear"
            })
        }, e => {
            let {
                ownerState: t
            } = e;
            return ("indeterminate" === t.variant || "query" === t.variant) && (0, g.css)(a || (a = P()), k)
        }),
        _ = l.forwardRef(function(e, t) {
            let r = (0, b.u)({
                    props: e,
                    name: "MuiLinearProgress"
                }),
                {
                    className: n,
                    color: o = "primary",
                    value: i,
                    valueBuffer: a,
                    variant: s = "indeterminate"
                } = r,
                l = (0, d._)(r, q),
                c = (0, f._)({}, r, {
                    color: o,
                    variant: s
                }),
                u = (e => {
                    let {
                        classes: t,
                        variant: r,
                        color: n
                    } = e, o = {
                        root: ["root", "color".concat((0, d.a)(n)), r],
                        dashed: ["dashed", "dashedColor".concat((0, d.a)(n))],
                        bar1: ["bar", "barColor".concat((0, d.a)(n)), ("indeterminate" === r || "query" === r) && "bar1Indeterminate", "determinate" === r && "bar1Determinate", "buffer" === r && "bar1Buffer"],
                        bar2: ["bar", "buffer" !== r && "barColor".concat((0, d.a)(n)), "buffer" === r && "color".concat((0, d.a)(n)), ("indeterminate" === r || "query" === r) && "bar2Indeterminate", "buffer" === r && "bar2Buffer"]
                    };
                    return (0, h.a)(o, S, t)
                })(c),
                p = (0, m.u)(),
                v = {},
                g = {},
                w = {};
            if (("determinate" === s || "buffer" === s) && void 0 !== i) {
                v["aria-valuenow"] = Math.round(i), v["aria-valuemin"] = 0, v["aria-valuemax"] = 100;
                let e = i - 100;
                p && (e = -e), g.transform = "translateX(".concat(e, "%)")
            }
            if ("buffer" === s && void 0 !== a) {
                let e = (a || 0) - 100;
                p && (e = -e), w.transform = "translateX(".concat(e, "%)")
            }
            return (0, y.jsxs)(E, (0, f._)({
                className: (0, h.c)(u.root, n),
                ownerState: c,
                role: "progressbar"
            }, v, {
                ref: t
            }, l, {
                children: ["buffer" === s ? (0, y.jsx)(O, {
                    className: u.dashed,
                    ownerState: c
                }) : null, (0, y.jsx)(K, {
                    className: u.bar1,
                    ownerState: c,
                    style: g
                }), "determinate" === s ? null : (0, y.jsx)(z, {
                    className: u.bar2,
                    ownerState: c,
                    style: w
                })]
            }))
        });
    e.s(["M", 0, _], 382655);
    var L = (0, c.default)({
            name: "LinearProgress"
        })(function(e) {
            var t = e.palette.components.divider;
            return {
                colorSecondary: {
                    backgroundColor: t
                },
                buffer: {
                    backgroundColor: "transparent"
                },
                dashedColorSecondary: {
                    backgroundImage: "linear-gradient(to right, ".concat(t, ", ").concat(t, " 50%, transparent 50%, transparent 100%)")
                },
                dashedColorPrimary: {
                    backgroundImage: "linear-gradient(to right, ".concat(e.palette.actionV2.primaryBrand.fill, ", ").concat(e.palette.actionV2.primaryBrand.fill, " 50%, transparent 50%, transparent 100%)")
                },
                colorPrimary: {
                    backgroundColor: e.palette.components.linearProgress.backgroundSecondary
                }
            }
        }),
        M = (0, l.forwardRef)(function(e, t) {
            var r = e.classes,
                n = e.className,
                o = (0, s.a)(e, ["classes", "className"]),
                i = L(void 0, {
                    props: {
                        classes: (0, u.default)(r, n)
                    }
                });
            return l.default.createElement(_, (0, s._)({}, o, {
                classes: i.classes,
                ref: t
            }))
        });
    e.s(["LinearProgress", 0, M], 222634)
}, 223914, e => {
    "use strict";
    var t = e.i(484613);
    e.s(["WarningIcon", () => t.Warning])
}, 948463, e => {
    "use strict";
    var t = e.i(30941),
        r = e.i(416340),
        n = e.i(936993),
        o = e.i(129210),
        i = e.i(759599),
        a = e.i(466127);
    e.i(221628);
    var s = (0, n.default)({
            name: "IconButton"
        })(function(e, r) {
            var n, o, s, l, c, u, p, d, f, h, m = r.color,
                v = r.variant,
                y = {
                    color: e.palette.actionV2.primaryBrand.fill
                },
                b = {
                    color: e.palette.content.standard
                },
                g = {
                    color: e.palette.content.alert.important
                };
            return "contained" === v && (Object.assign(y, ((n = {
                color: e.palette.content.static.light,
                backgroundColor: e.palette.actionV2.primaryBrand.fill
            })["&:hover, &.".concat(i.b.focusVisible, " .").concat(i.t.root)] = {
                backgroundColor: e.palette.actionV2.primaryBrand.containedHoverFocus
            }, n)), Object.assign(b, ((o = {
                color: e.palette.content.inverse,
                backgroundColor: e.palette.actionV2.primary.fill
            })["&:hover, &.".concat(i.b.focusVisible, " .").concat(i.t.root)] = {
                backgroundColor: e.palette.actionV2.primary.containedHoverFocus
            }, o)), Object.assign(g, ((s = {
                color: e.palette.content.static.light,
                backgroundColor: e.palette.actionV2.important.fill
            })["&:hover, &.".concat(i.b.focusVisible, " .").concat(i.t.root)] = {
                backgroundColor: e.palette.actionV2.important.containedHoverFocus
            }, s))), "onMediaLight" === m || "onMediaDark" === m ? ((l = {
                backdropFilter: "blur(5px)",
                "-webkit-backdrop-filter": "blur(5px)",
                color: e.palette.content.static.light,
                backgroundColor: "transparent",
                "&:hover": {
                    backgroundColor: e.palette.components.mediaButtons[m].hover
                }
            })["&.".concat(i.b.focusVisible)] = {
                zIndex: 0,
                backgroundColor: e.palette.components.mediaButtons[m].focus
            }, l["&.".concat(i.b.focusVisible, " .").concat(i.t.root)] = {
                zIndex: -1,
                color: e.palette.components.mediaButtons[m].focus
            }, l["&.".concat(a.i.disabled)] = {
                color: e.palette.states.disabled
            }, h = l, "contained" === v && Object.assign(h, ((c = {
                backgroundColor: e.palette.components.mediaButtons[m].fill
            })["&.".concat(a.i.disabled)] = (0, t._)((0, t._)({}, h["&.".concat(a.i.disabled)]), {
                backgroundColor: e.palette.components.mediaButtons[m].fill
            }), c))) : ((u = {})["&.".concat(i.b.focusVisible)] = {
                zIndex: 0
            }, u["&.".concat(i.b.focusVisible, " .").concat(i.t.root)] = {
                zIndex: -1
            }, u["&.".concat(a.i.disabled)] = {
                color: e.palette.states.disabled
            }, h = u, "default" === m && Object.assign(h, ((p = {
                color: e.palette.states.active,
                "&:hover": {
                    color: e.palette.content.standard,
                    backgroundColor: e.palette.states.hover
                }
            })["&.".concat(i.b.focusVisible, " .").concat(i.t.root)] = {
                color: e.palette.content.standard,
                backgroundColor: e.palette.states.focus
            }, p)), "contained" === v && Object.assign(h, ((d = {
                backgroundColor: e.palette.actionV2.secondary.fill,
                "&:hover": (0, t._)((0, t._)({}, h["&:hover"]), {
                    backgroundColor: e.palette.actionV2.secondary.containedHoverFocus
                })
            })["&.".concat(a.i.disabled)] = (0, t._)((0, t._)({}, h["&.".concat(a.i.disabled)]), {
                backgroundColor: e.palette.states.disabledBackground
            }), d)), "outlined" === v && Object.assign(h, (0, t._)((0, t._)({}, e.border.radius.circle), ((f = {
                border: "1px solid ".concat(e.palette.surface.outline),
                "&:hover": (0, t._)((0, t._)({}, h["&:hover"]), {
                    backgroundColor: e.palette.states.hover
                })
            })["&.".concat(i.b.focusVisible, " .").concat(i.t.root)] = {
                backgroundColor: e.palette.states.focus
            }, f)))), {
                root: h,
                colorPrimary: y,
                colorSecondary: b,
                colorError: g,
                sizeSmall: {
                    padding: 4
                }
            }
        }),
        l = (0, r.forwardRef)(function(e, n) {
            var i = e.children,
                l = e.classes,
                c = e.className,
                u = e.color,
                p = void 0 === u ? "primary" : u,
                d = e.variant,
                f = (0, t.a)(e, ["children", "classes", "className", "color", "variant"]),
                h = s({
                    color: p,
                    variant: void 0 === d ? "default" : d
                }, {
                    props: {
                        classes: (0, o.default)(l, c)
                    }
                }),
                m = "onMediaLight" === p || "onMediaDark" === p ? "default" : p;
            return r.default.createElement(a.I, (0, t._)({}, f, {
                classes: h.classes,
                color: m,
                ref: n
            }), i)
        });
    e.s(["default", 0, l])
}, 401631, e => {
    "use strict";
    var t = e.i(948463);
    e.s(["IconButton", () => t.default])
}, 581577, 280162, e => {
    "use strict";
    let t;
    var r = e.i(416340),
        n = e.i(252842),
        o = e.i(695763),
        i = e.i(537683),
        a = e.i(611043),
        s = e.i(222634),
        l = e.i(401631),
        c = e.i(930669),
        u = e.i(848427),
        p = e.i(547710),
        d = e.i(677753),
        f = function(e, t) {
            return (f = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
            })(e, t)
        };

    function h(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function r() {
            this.constructor = e
        }
        f(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
    }

    function m(e, t, r, n) {
        return new(r || (r = Promise))(function(o, i) {
            function a(e) {
                try {
                    l(n.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function s(e) {
                try {
                    l(n.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function l(e) {
                var t;
                e.done ? o(e.value) : ((t = e.value) instanceof r ? t : new r(function(e) {
                    e(t)
                })).then(a, s)
            }
            l((n = n.apply(e, t || [])).next())
        })
    }

    function v(e, t) {
        var r, n, o, i = {
                label: 0,
                sent: function() {
                    if (1 & o[0]) throw o[1];
                    return o[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function s(s) {
            return function(l) {
                var c = [s, l];
                if (r) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                    if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                    switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                        case 0:
                        case 1:
                            o = c;
                            break;
                        case 4:
                            return i.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            i.label++, n = c[1], c = [0];
                            continue;
                        case 7:
                            c = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                i.label = c[1];
                                break
                            }
                            if (6 === c[0] && i.label < o[1]) {
                                i.label = o[1], o = c;
                                break
                            }
                            if (o && i.label < o[2]) {
                                i.label = o[2], i.ops.push(c);
                                break
                            }
                            o[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    c = t.call(e, i)
                } catch (e) {
                    c = [6, e], n = 0
                } finally {
                    r = o = 0
                }
                if (5 & c[0]) throw c[1];
                return {
                    value: c[0] ? c[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function y(e, t) {
        return null == e ? e : {
            id: e.id,
            type: e.type
        }
    }

    function b(e) {
        var t;
        return null == (t = e) ? t : {
            ids: t.ids
        }
    }

    function g(e) {
        if (void 0 !== e) return null === e ? null : {
            ids: e.ids
        }
    }

    function w(e) {
        var t;
        return null == (t = e) ? t : {
            owner: y(t.owner),
            resources: (0, d.mapValues)(t.resources, b)
        }
    }

    function x(e) {
        if (void 0 !== e) return null === e ? null : {
            owner: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    id: e.id,
                    type: e.type
                }
            }(e.owner),
            resources: (0, d.mapValues)(e.resources, g)
        }
    }

    function A(e) {
        return e
    }

    function R(e) {
        return e
    }

    function I(e) {
        return e
    }

    function P(e) {
        return e
    }

    function S(e) {
        var t;
        return null == (t = e) ? t : {
            scopeType: t.scopeType,
            operations: t.operations
        }
    }

    function q(e) {
        if (void 0 !== e) return null === e ? null : {
            scopeType: e.scopeType,
            operations: e.operations
        }
    }

    function C(e, t) {
        return null == e ? e : {
            requestedCategory: (0, d.exists)(e, "requestedCategory") ? e.requestedCategory : void 0,
            videoUri: (0, d.exists)(e, "videoUri") ? e.videoUri : void 0,
            categoryJustification: (0, d.exists)(e, "categoryJustification") ? e.categoryJustification : void 0
        }
    }

    function k(e, t) {
        return null == e ? e : {
            lastApprovedVersionNumber: (0, d.exists)(e, "lastApprovedVersionNumber") ? e.lastApprovedVersionNumber : void 0,
            versionNumber: e.versionNumber,
            isInReview: e.isInReview
        }
    }

    function T(e) {
        var t;
        return null == (t = e) ? t : {
            redirectUris: t.redirectUris,
            allowedScopes: t.allowedScopes.map(S),
            versionInfo: k(t.versionInfo),
            isBanned: t.isBanned,
            createdUtc: new Date(t.createdUtc),
            updatedUtc: new Date(t.updatedUtc),
            reviewSubmission: (0, d.exists)(t, "reviewSubmission") ? C(t.reviewSubmission) : void 0,
            applicationId: t.applicationId,
            owner: y(t.owner),
            name: t.name,
            summary: t.summary,
            tosUri: (0, d.exists)(t, "tosUri") ? t.tosUri : void 0,
            privacyUri: (0, d.exists)(t, "privacyUri") ? t.privacyUri : void 0,
            entryPointUri: (0, d.exists)(t, "entryPointUri") ? t.entryPointUri : void 0,
            imageAssetId: (0, d.exists)(t, "imageAssetId") ? t.imageAssetId : void 0,
            isFirstParty: (0, d.exists)(t, "isFirstParty") ? t.isFirstParty : void 0
        }
    }

    function U(e, t) {
        return null == e ? e : {
            applications: e.applications.map(T),
            nextPageCursor: (0, d.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0
        }
    }

    function E(e) {
        var t, r;
        return null == (t = e) ? t : {
            authorizationId: t.authorizationId,
            application: null == (r = t.application) ? r : {
                applicationId: r.applicationId,
                owner: y(r.owner),
                name: r.name,
                summary: r.summary,
                tosUri: (0, d.exists)(r, "tosUri") ? r.tosUri : void 0,
                privacyUri: (0, d.exists)(r, "privacyUri") ? r.privacyUri : void 0,
                entryPointUri: (0, d.exists)(r, "entryPointUri") ? r.entryPointUri : void 0,
                imageAssetId: (0, d.exists)(r, "imageAssetId") ? r.imageAssetId : void 0,
                isFirstParty: (0, d.exists)(r, "isFirstParty") ? r.isFirstParty : void 0
            },
            scopes: t.scopes.map(S),
            resourceInfo: t.resourceInfo.map(w),
            createdUtc: new Date(t.createdUtc),
            refreshedUtc: new Date(t.refreshedUtc)
        }
    }

    function O(e, t) {
        return null == e ? e : {
            applicationSecret: e.applicationSecret,
            redirectUris: e.redirectUris,
            allowedScopes: e.allowedScopes.map(S),
            versionInfo: k(e.versionInfo),
            isBanned: e.isBanned,
            createdUtc: new Date(e.createdUtc),
            updatedUtc: new Date(e.updatedUtc),
            reviewSubmission: (0, d.exists)(e, "reviewSubmission") ? C(e.reviewSubmission) : void 0,
            applicationId: e.applicationId,
            owner: y(e.owner),
            name: e.name,
            summary: e.summary,
            tosUri: (0, d.exists)(e, "tosUri") ? e.tosUri : void 0,
            privacyUri: (0, d.exists)(e, "privacyUri") ? e.privacyUri : void 0,
            entryPointUri: (0, d.exists)(e, "entryPointUri") ? e.entryPointUri : void 0,
            imageAssetId: (0, d.exists)(e, "imageAssetId") ? e.imageAssetId : void 0,
            isFirstParty: (0, d.exists)(e, "isFirstParty") ? e.isFirstParty : void 0
        }
    }

    function K(e, t) {
        return null == e ? e : {
            resourceInfos: e.resource_infos.map(w)
        }
    }

    function z(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function _(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function L(e) {
        var t;
        return null == (t = e) ? t : {
            scopeType: t.scopeType,
            operation: t.operation,
            targetType: (0, d.exists)(t, "targetType") ? t.targetType : void 0,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0,
            riskLevel: (0, d.exists)(t, "riskLevel") ? t.riskLevel : void 0,
            groupAllowed: (0, d.exists)(t, "groupAllowed") ? t.groupAllowed : void 0,
            firstPartyOAuthOnly: (0, d.exists)(t, "firstPartyOAuthOnly") ? t.firstPartyOAuthOnly : void 0,
            categories: (0, d.exists)(t, "categories") ? t.categories : void 0
        }
    }

    function M(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function V(e) {
        return e
    }

    function G(e) {
        return e
    }

    function j(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0,
            descriptionTranslationKey: (0, d.exists)(t, "descriptionTranslationKey") ? t.descriptionTranslationKey : void 0,
            riskLevel: (0, d.exists)(t, "riskLevel") ? t.riskLevel : void 0
        }
    }

    function D(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            environments: (0, d.exists)(t, "environments") ? null === t.environments ? null : t.environments.map(G) : void 0,
            targetType: (0, d.exists)(t, "targetType") ? t.targetType : void 0,
            operations: t.operations,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0,
            product: (0, d.exists)(t, "product") ? t.product : void 0,
            operationOverrides: t.operationOverrides.map(j),
            authenticationSystems: t.authenticationSystems.map(V),
            groupAllowedOperations: (0, d.exists)(t, "groupAllowedOperations") ? t.groupAllowedOperations : void 0
        }
    }

    function F(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            type: t.type,
            constraints: t.constraints,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function N(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            requiredParts: t.requiredParts,
            optionalParts: t.optionalParts,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function B(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0,
            product: (0, d.exists)(t, "product") ? t.product : void 0
        }
    }

    function W(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            type: (0, d.exists)(t, "type") ? t.type : void 0,
            constraints: (0, d.exists)(t, "constraints") ? t.constraints : void 0,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function J(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            requiredParts: (0, d.exists)(t, "requiredParts") ? t.requiredParts : void 0,
            optionalParts: (0, d.exists)(t, "optionalParts") ? t.optionalParts : void 0,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function H(e) {
        var t;
        return null == (t = e) ? t : {
            id: t.id,
            agreementType: t.agreementType,
            clientType: t.clientType,
            regulationType: t.regulationType,
            displayUrl: t.displayUrl
        }
    }

    function X(e) {
        if (void 0 !== e) return null === e ? null : {
            name: e.name,
            summary: e.summary,
            redirectUris: e.redirectUris,
            allowedScopes: void 0 === e.allowedScopes ? void 0 : null === e.allowedScopes ? null : e.allowedScopes.map(q),
            tosUri: e.tosUri,
            privacyUri: e.privacyUri,
            entryPointUri: e.entryPointUri
        }
    }

    function Y(e) {
        var t;
        return null == (t = e) ? t : {
            alg: t.alg,
            enc: (0, d.exists)(t, "enc") ? t.enc : void 0,
            kty: t.kty,
            kid: t.kid,
            use: t.use,
            n: (0, d.exists)(t, "n") ? t.n : void 0,
            e: (0, d.exists)(t, "e") ? t.e : void 0,
            d: (0, d.exists)(t, "d") ? t.d : void 0,
            p: (0, d.exists)(t, "p") ? t.p : void 0,
            q: (0, d.exists)(t, "q") ? t.q : void 0,
            dp: (0, d.exists)(t, "dp") ? t.dp : void 0,
            dq: (0, d.exists)(t, "dq") ? t.dq : void 0,
            qi: (0, d.exists)(t, "qi") ? t.qi : void 0,
            crv: (0, d.exists)(t, "crv") ? t.crv : void 0,
            x: (0, d.exists)(t, "x") ? t.x : void 0,
            y: (0, d.exists)(t, "y") ? t.y : void 0,
            k: (0, d.exists)(t, "k") ? t.k : void 0
        }
    }

    function $(e, t) {
        return null == e ? e : {
            keys: e.keys.map(Y)
        }
    }
    var Q = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return h(t, e), t.prototype.applicationCreateApplicationForGroupRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new d.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling applicationCreateApplicationForGroup.");
                                if (null === e.applicationCreateApplicationForUserRequest || void 0 === e.applicationCreateApplicationForUserRequest) throw new d.RequiredError("applicationCreateApplicationForUserRequest", "Required parameter requestParameters.applicationCreateApplicationForUserRequest was null or undefined when calling applicationCreateApplicationForGroup.");
                                return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/groups/{groupId}/applications".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/applications",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: X(e.applicationCreateApplicationForUserRequest)
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return O(e)
                                })]
                        }
                    })
                })
            }, t.prototype.applicationCreateApplicationForGroup = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.applicationCreateApplicationForGroupRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.applicationCreateApplicationForUserRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new d.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling applicationCreateApplicationForUser.");
                                if (null === e.applicationCreateApplicationForUserRequest || void 0 === e.applicationCreateApplicationForUserRequest) throw new d.RequiredError("applicationCreateApplicationForUserRequest", "Required parameter requestParameters.applicationCreateApplicationForUserRequest was null or undefined when calling applicationCreateApplicationForUser.");
                                return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/users/{userId}/applications".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/users/{userId}/applications",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: X(e.applicationCreateApplicationForUserRequest)
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return O(e)
                                })]
                        }
                    })
                })
            }, t.prototype.applicationCreateApplicationForUser = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.applicationCreateApplicationForUserRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.applicationDeleteApplicationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationDeleteApplication.");
                                return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/{applicationId}".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}",
                                    method: "DELETE",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.applicationDeleteApplication = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.applicationDeleteApplicationRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, t.prototype.applicationGetApplicationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationGetApplication.");
                                return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/{applicationId}".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return T(e)
                                })]
                        }
                    })
                })
            }, t.prototype.applicationGetApplication = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.applicationGetApplicationRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.applicationGetApplicationManagementMetadataRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/metadata",
                                    schemaPath: "/v1/applications/metadata",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        isCreateUserApplicationsAllowed: e.isCreateUserApplicationsAllowed,
                                        isViewUserApplicationsAllowed: e.isViewUserApplicationsAllowed,
                                        isUpdateUserApplicationsAllowed: e.isUpdateUserApplicationsAllowed,
                                        isDeleteUserApplicationsAllowed: e.isDeleteUserApplicationsAllowed,
                                        actions: e.actions.map(A),
                                        minNameLength: e.minNameLength,
                                        maxNameLength: e.maxNameLength,
                                        maxSummaryLength: e.maxSummaryLength,
                                        maxRedirectUriCount: e.maxRedirectUriCount,
                                        maxRedirectUriLength: e.maxRedirectUriLength,
                                        maxActiveApplications: e.maxActiveApplications,
                                        maxVideoUriLength: e.maxVideoUriLength,
                                        maxCategoryJustificationLength: e.maxCategoryJustificationLength
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.applicationGetApplicationManagementMetadata = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.applicationGetApplicationManagementMetadataRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.applicationListApplicationsForGroupRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new d.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling applicationListApplicationsForGroup.");
                                return r = {}, void 0 !== e.limit && (r.limit = e.limit), void 0 !== e.sortOrder && (r.sortOrder = e.sortOrder), void 0 !== e.cursor && (r.cursor = e.cursor), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/groups/{groupId}/applications".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/applications",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return U(e)
                                })]
                        }
                    })
                })
            }, t.prototype.applicationListApplicationsForGroup = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.applicationListApplicationsForGroupRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.applicationListApplicationsForUserRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new d.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling applicationListApplicationsForUser.");
                                return r = {}, void 0 !== e.limit && (r.limit = e.limit), void 0 !== e.sortOrder && (r.sortOrder = e.sortOrder), void 0 !== e.cursor && (r.cursor = e.cursor), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/users/{userId}/applications".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/users/{userId}/applications",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return U(e)
                                })]
                        }
                    })
                })
            }, t.prototype.applicationListApplicationsForUser = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.applicationListApplicationsForUserRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.applicationPrivatizeApplicationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationPrivatizeApplication.");
                                return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/{applicationId}/privatize".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}/privatize",
                                    method: "PATCH",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.applicationPrivatizeApplication = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.applicationPrivatizeApplicationRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, t.prototype.applicationPublishApplicationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationPublishApplication.");
                                return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/{applicationId}/publish".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}/publish",
                                    method: "PATCH",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.applicationPublishApplication = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.applicationPublishApplicationRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, t.prototype.applicationRegenerateApplicationSecretRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationRegenerateApplicationSecret.");
                                return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/{applicationId}/secret".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}/secret",
                                    method: "POST",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        applicationSecret: e.applicationSecret
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.applicationRegenerateApplicationSecret = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.applicationRegenerateApplicationSecretRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.applicationUpdateApplicationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationUpdateApplication.");
                                if (null === e.applicationUpdateApplicationRequest || void 0 === e.applicationUpdateApplicationRequest) throw new d.RequiredError("applicationUpdateApplicationRequest", "Required parameter requestParameters.applicationUpdateApplicationRequest was null or undefined when calling applicationUpdateApplication.");
                                return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/{applicationId}".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}",
                                    method: "PATCH",
                                    headers: n,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            name: e.name,
                                            summary: e.summary,
                                            redirectUris: e.redirectUris,
                                            allowedScopes: void 0 === e.allowedScopes ? void 0 : null === e.allowedScopes ? null : e.allowedScopes.map(q),
                                            tosUri: e.tosUri,
                                            privacyUri: e.privacyUri,
                                            entryPointUri: e.entryPointUri,
                                            reviewSubmission: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    requestedCategory: e.requestedCategory,
                                                    videoUri: e.videoUri,
                                                    categoryJustification: e.categoryJustification
                                                }
                                            }(e.reviewSubmission)
                                        }
                                    }(e.applicationUpdateApplicationRequest)
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return T(e)
                                })]
                        }
                    })
                })
            }, t.prototype.applicationUpdateApplication = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.applicationUpdateApplicationRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.applicationUploadApplicationImageRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o, i;
                    return v(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationUploadApplicationImage.");
                                if (null === e.imageFile || void 0 === e.imageFile) throw new d.RequiredError("imageFile", "Required parameter requestParameters.imageFile was null or undefined when calling applicationUploadApplicationImage.");
                                return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), o = (0, d.canConsumeForm)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.imageFile && o.append("imageFile", e.imageFile), [4, this.request({
                                    path: "/v1/applications/{applicationId}/image".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}/image",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: o
                                }, t)];
                            case 1:
                                return i = a.sent(), [2, new d.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        imageAssetId: (0, d.exists)(e, "imageAssetId") ? e.imageAssetId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.applicationUploadApplicationImage = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.applicationUploadApplicationImageRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.applicationValidateApplicationNameRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.name || void 0 === e.name) throw new d.RequiredError("name", "Required parameter requestParameters.name was null or undefined when calling applicationValidateApplicationName.");
                                return r = {}, void 0 !== e.name && (r.name = e.name), void 0 !== e.applicationId && (r.applicationId = e.applicationId), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/names/validate",
                                    schemaPath: "/v1/applications/names/validate",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.applicationValidateApplicationName = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.applicationValidateApplicationNameRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, t.prototype.applicationValidateApplicationSummaryRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.summary || void 0 === e.summary) throw new d.RequiredError("summary", "Required parameter requestParameters.summary was null or undefined when calling applicationValidateApplicationSummary.");
                                return r = {}, void 0 !== e.summary && (r.summary = e.summary), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/summary/validate",
                                    schemaPath: "/v1/applications/summary/validate",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.applicationValidateApplicationSummary = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.applicationValidateApplicationSummaryRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, t
        }(d.BaseAPI),
        Z = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return h(t, e), t.prototype.authorizationDeleteAuthorizationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.authorizationId || void 0 === e.authorizationId) throw new d.RequiredError("authorizationId", "Required parameter requestParameters.authorizationId was null or undefined when calling authorizationDeleteAuthorization.");
                                return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations/{authorizationId}".replace("{".concat("authorizationId", "}"), encodeURIComponent(String(e.authorizationId))),
                                    schemaPath: "/v1/authorizations/{authorizationId}",
                                    method: "DELETE",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.authorizationDeleteAuthorization = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.authorizationDeleteAuthorizationRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, t.prototype.authorizationGetAuthorizationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.authorizationId || void 0 === e.authorizationId) throw new d.RequiredError("authorizationId", "Required parameter requestParameters.authorizationId was null or undefined when calling authorizationGetAuthorization.");
                                return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations/{authorizationId}".replace("{".concat("authorizationId", "}"), encodeURIComponent(String(e.authorizationId))),
                                    schemaPath: "/v1/authorizations/{authorizationId}",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return E(e)
                                })]
                        }
                    })
                })
            }, t.prototype.authorizationGetAuthorization = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.authorizationGetAuthorizationRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.authorizationGetAuthorizationResourcesRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling authorizationGetAuthorizationResources.");
                                if (null === e.partialScopes || void 0 === e.partialScopes) throw new d.RequiredError("partialScopes", "Required parameter requestParameters.partialScopes was null or undefined when calling authorizationGetAuthorizationResources.");
                                return r = {}, void 0 !== e.applicationId && (r.applicationId = e.applicationId), void 0 !== e.partialScopes && (r.partialScopes = e.partialScopes), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations/resources",
                                    schemaPath: "/v1/authorizations/resources",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return K(e)
                                })]
                        }
                    })
                })
            }, t.prototype.authorizationGetAuthorizationResources = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.authorizationGetAuthorizationResourcesRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.authorizationListAuthorizationsRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return r = {}, void 0 !== e.limit && (r.limit = e.limit), void 0 !== e.sortOrder && (r.sortOrder = e.sortOrder), void 0 !== e.cursor && (r.cursor = e.cursor), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations",
                                    schemaPath: "/v1/authorizations",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        authorizations: e.authorizations.map(E),
                                        nextPageCursor: (0, d.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.authorizationListAuthorizations = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.authorizationListAuthorizationsRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t
        }(d.BaseAPI),
        ee = (function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            h(t, e), t.prototype.certificateGetAccessTokenCertificatesRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/certificates/access-tokens",
                                    schemaPath: "/v1/certificates/access-tokens",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return $(e)
                                })]
                        }
                    })
                })
            }, t.prototype.certificateGetAccessTokenCertificates = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.certificateGetAccessTokenCertificatesRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.certificateGetDefaultCertificatesRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/certs",
                                    schemaPath: "/v1/certs",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return $(e)
                                })]
                        }
                    })
                })
            }, t.prototype.certificateGetDefaultCertificates = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.certificateGetDefaultCertificatesRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.certificateGetIdentityTokenCertificatesRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/certificates/identity-tokens",
                                    schemaPath: "/v1/certificates/identity-tokens",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return $(e)
                                })]
                        }
                    })
                })
            }, t.prototype.certificateGetIdentityTokenCertificates = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.certificateGetIdentityTokenCertificatesRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }
        }(d.BaseAPI), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return h(t, e), t.prototype.discoveryGetDiscoveryConfigurationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/.well-known/openid-configuration",
                                    schemaPath: "/.well-known/openid-configuration",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        issuer: e.issuer,
                                        authorizationEndpoint: e.authorization_endpoint,
                                        tokenEndpoint: e.token_endpoint,
                                        introspectionEndpoint: e.introspection_endpoint,
                                        revocationEndpoint: e.revocation_endpoint,
                                        resourcesEndpoint: e.resources_endpoint,
                                        userinfoEndpoint: e.userinfo_endpoint,
                                        jwksUri: e.jwks_uri,
                                        registrationEndpoint: e.registration_endpoint,
                                        serviceDocumentation: e.service_documentation,
                                        scopesSupported: e.scopes_supported,
                                        responseTypesSupported: e.response_types_supported,
                                        subjectTypesSupported: e.subject_types_supported,
                                        idTokenSigningAlgValuesSupported: e.id_token_signing_alg_values_supported,
                                        claimsSupported: e.claims_supported,
                                        tokenEndpointAuthMethodsSupported: e.token_endpoint_auth_methods_supported
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.discoveryGetDiscoveryConfiguration = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.discoveryGetDiscoveryConfigurationRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t
        }(d.BaseAPI)),
        et = (function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            h(t, e), t.prototype.externalVerificationSetExternalVerificationTypesRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.externalVerificationSetExternalVerificationTypesRequest || void 0 === e.externalVerificationSetExternalVerificationTypesRequest) throw new d.RequiredError("externalVerificationSetExternalVerificationTypesRequest", "Required parameter requestParameters.externalVerificationSetExternalVerificationTypesRequest was null or undefined when calling externalVerificationSetExternalVerificationTypes.");
                                return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/verification-types",
                                    schemaPath: "/v1/verification-types",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            token: e.token
                                        }
                                    }(e.externalVerificationSetExternalVerificationTypesRequest)
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.externalVerificationSetExternalVerificationTypes = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.externalVerificationSetExternalVerificationTypesRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }
        }(d.BaseAPI), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return h(t, e), t.prototype.permissionRequestCreateAuthorizationGrantRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.permissionRequestCreateAuthorizationGrantRequest || void 0 === e.permissionRequestCreateAuthorizationGrantRequest) throw new d.RequiredError("permissionRequestCreateAuthorizationGrantRequest", "Required parameter requestParameters.permissionRequestCreateAuthorizationGrantRequest was null or undefined when calling permissionRequestCreateAuthorizationGrant.");
                                return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations",
                                    schemaPath: "/v1/authorizations",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            clientId: e.clientId,
                                            responseTypes: e.responseTypes.map(P),
                                            redirectUri: e.redirectUri,
                                            scopes: e.scopes.map(q),
                                            state: e.state,
                                            nonce: e.nonce,
                                            codeChallenge: e.codeChallenge,
                                            codeChallengeMethod: e.codeChallengeMethod,
                                            resourceInfos: void 0 === e.resourceInfos ? void 0 : null === e.resourceInfos ? null : e.resourceInfos.map(x)
                                        }
                                    }(e.permissionRequestCreateAuthorizationGrantRequest)
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        location: e.location
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.permissionRequestCreateAuthorizationGrant = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.permissionRequestCreateAuthorizationGrantRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.permissionRequestCreateMagicAuthorizationGrantRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.permissionRequestCreateMagicAuthorizationGrantRequest || void 0 === e.permissionRequestCreateMagicAuthorizationGrantRequest) throw new d.RequiredError("permissionRequestCreateMagicAuthorizationGrantRequest", "Required parameter requestParameters.permissionRequestCreateMagicAuthorizationGrantRequest was null or undefined when calling permissionRequestCreateMagicAuthorizationGrant.");
                                return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations/magic",
                                    schemaPath: "/v1/authorizations/magic",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            clientId: e.clientId,
                                            scopes: e.scopes.map(q),
                                            nonce: e.nonce
                                        }
                                    }(e.permissionRequestCreateMagicAuthorizationGrantRequest)
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        code: e.code
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.permissionRequestCreateMagicAuthorizationGrant = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.permissionRequestCreateMagicAuthorizationGrantRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.permissionRequestGetAuthorizationEndpointRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return r = {}, void 0 !== e.clientId && (r.client_id = e.clientId), void 0 !== e.responseType && (r.response_type = e.responseType), void 0 !== e.redirectUri && (r.redirect_uri = e.redirectUri), void 0 !== e.scope && (r.scope = e.scope), void 0 !== e.state && (r.state = e.state), void 0 !== e.nonce && (r.nonce = e.nonce), void 0 !== e.prompt && (r.prompt = e.prompt), void 0 !== e.codeChallenge && (r.code_challenge = e.codeChallenge), void 0 !== e.codeChallengeMethod && (r.code_challenge_method = e.codeChallengeMethod), void 0 !== e.rlt && (r.rlt = e.rlt), void 0 !== e.studioTraceId && (r.studio_trace_id = e.studioTraceId), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorize",
                                    schemaPath: "/v1/authorize",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.permissionRequestGetAuthorizationEndpoint = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.permissionRequestGetAuthorizationEndpointRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, t.prototype.permissionRequestValidatePermissionRequestRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.clientId || void 0 === e.clientId) throw new d.RequiredError("clientId", "Required parameter requestParameters.clientId was null or undefined when calling permissionRequestValidatePermissionRequest.");
                                if (null === e.redirectUri || void 0 === e.redirectUri) throw new d.RequiredError("redirectUri", "Required parameter requestParameters.redirectUri was null or undefined when calling permissionRequestValidatePermissionRequest.");
                                if (null === e.scopes || void 0 === e.scopes) throw new d.RequiredError("scopes", "Required parameter requestParameters.scopes was null or undefined when calling permissionRequestValidatePermissionRequest.");
                                if (null === e.responseTypes || void 0 === e.responseTypes) throw new d.RequiredError("responseTypes", "Required parameter requestParameters.responseTypes was null or undefined when calling permissionRequestValidatePermissionRequest.");
                                return r = {}, void 0 !== e.clientId && (r.clientId = e.clientId), void 0 !== e.redirectUri && (r.redirectUri = e.redirectUri), void 0 !== e.scopes && (r.scopes = e.scopes), void 0 !== e.responseTypes && (r.responseTypes = e.responseTypes), void 0 !== e.prompts && (r.prompts = e.prompts), void 0 !== e.rlt && (r.rlt = e.rlt), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/permission-request",
                                    schemaPath: "/v1/permission-request",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        scopes: e.scopes.map(S),
                                        responseTypes: e.responseTypes.map(I),
                                        promptTypes: e.promptTypes.map(R),
                                        userAgreements: e.userAgreements.map(H),
                                        applicationId: e.applicationId,
                                        owner: y(e.owner),
                                        name: e.name,
                                        summary: e.summary,
                                        tosUri: (0, d.exists)(e, "tosUri") ? e.tosUri : void 0,
                                        privacyUri: (0, d.exists)(e, "privacyUri") ? e.privacyUri : void 0,
                                        entryPointUri: (0, d.exists)(e, "entryPointUri") ? e.entryPointUri : void 0,
                                        imageAssetId: (0, d.exists)(e, "imageAssetId") ? e.imageAssetId : void 0,
                                        isFirstParty: (0, d.exists)(e, "isFirstParty") ? e.isFirstParty : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.permissionRequestValidatePermissionRequest = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.permissionRequestValidatePermissionRequestRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t
        }(d.BaseAPI)),
        er = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return h(t, e), t.prototype.scopeGetScopeConfigurationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return r = {}, void 0 !== e.returnBetaScopes && (r.returnBetaScopes = e.returnBetaScopes), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/scope-configuration",
                                    schemaPath: "/v1/scope-configuration",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        scopeTypes: e.scopeTypes.map(D),
                                        targetTypes: e.targetTypes.map(N),
                                        targetParts: e.targetParts.map(F),
                                        products: e.products.map(M),
                                        oidcScopes: e.oidcScopes
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.scopeGetScopeConfiguration = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.scopeGetScopeConfigurationRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t.prototype.scopeGetScopesRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var r, n, o;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/scopes",
                                    schemaPath: "/v1/scopes",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        scopes: e.scopes.map(L),
                                        scopeTypes: e.scopeTypes.map(B),
                                        targetTypes: e.targetTypes.map(J),
                                        targetParts: e.targetParts.map(W),
                                        products: e.products.map(_),
                                        operations: e.operations.map(z),
                                        oidcScopes: e.oidcScopes
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.scopeGetScopes = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.scopeGetScopesRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, t
        }(d.BaseAPI);
    (function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        h(t, e), t.prototype.tokenGetTokenAuthorizationResourcesRaw = function(e, t) {
            return m(this, void 0, void 0, function() {
                var r, n, o, i;
                return v(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.token || void 0 === e.token) throw new d.RequiredError("token", "Required parameter requestParameters.token was null or undefined when calling tokenGetTokenAuthorizationResources.");
                            return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), (0, d.canConsumeForm)([{
                                contentType: "application/x-www-form-urlencoded"
                            }]), o = new URLSearchParams, void 0 !== e.token && o.append("token", e.token), void 0 !== e.clientId && o.append("client_id", e.clientId), void 0 !== e.clientSecret && o.append("client_secret", e.clientSecret), [4, this.request({
                                path: "/v1/token/resources",
                                schemaPath: "/v1/token/resources",
                                method: "POST",
                                headers: n,
                                query: r,
                                body: o
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new d.JSONApiResponse(i, function(e) {
                                return K(e)
                            })]
                    }
                })
            })
        }, t.prototype.tokenGetTokenAuthorizationResources = function(e, t) {
            return m(this, void 0, void 0, function() {
                return v(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.tokenGetTokenAuthorizationResourcesRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.tokenIntrospectTokenRaw = function(e, t) {
            return m(this, void 0, void 0, function() {
                var r, n, o, i;
                return v(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.token || void 0 === e.token) throw new d.RequiredError("token", "Required parameter requestParameters.token was null or undefined when calling tokenIntrospectToken.");
                            return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), (0, d.canConsumeForm)([{
                                contentType: "application/x-www-form-urlencoded"
                            }]), o = new URLSearchParams, void 0 !== e.token && o.append("token", e.token), void 0 !== e.clientId && o.append("client_id", e.clientId), void 0 !== e.clientSecret && o.append("client_secret", e.clientSecret), [4, this.request({
                                path: "/v1/token/introspect",
                                schemaPath: "/v1/token/introspect",
                                method: "POST",
                                headers: n,
                                query: r,
                                body: o
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new d.JSONApiResponse(i, function(e) {
                                return null == e ? e : {
                                    active: e.active,
                                    jti: (0, d.exists)(e, "jti") ? e.jti : void 0,
                                    iss: (0, d.exists)(e, "iss") ? e.iss : void 0,
                                    tokenType: (0, d.exists)(e, "token_type") ? e.token_type : void 0,
                                    clientId: (0, d.exists)(e, "client_id") ? e.client_id : void 0,
                                    aud: (0, d.exists)(e, "aud") ? e.aud : void 0,
                                    sub: (0, d.exists)(e, "sub") ? e.sub : void 0,
                                    scope: (0, d.exists)(e, "scope") ? e.scope : void 0,
                                    exp: (0, d.exists)(e, "exp") ? e.exp : void 0,
                                    iat: (0, d.exists)(e, "iat") ? e.iat : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.tokenIntrospectToken = function(e, t) {
            return m(this, void 0, void 0, function() {
                return v(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.tokenIntrospectTokenRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.tokenRevokeTokenRaw = function(e, t) {
            return m(this, void 0, void 0, function() {
                var r, n, o, i;
                return v(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.token || void 0 === e.token) throw new d.RequiredError("token", "Required parameter requestParameters.token was null or undefined when calling tokenRevokeToken.");
                            return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), (0, d.canConsumeForm)([{
                                contentType: "application/x-www-form-urlencoded"
                            }]), o = new URLSearchParams, void 0 !== e.token && o.append("token", e.token), void 0 !== e.clientId && o.append("client_id", e.clientId), void 0 !== e.clientSecret && o.append("client_secret", e.clientSecret), [4, this.request({
                                path: "/v1/token/revoke",
                                schemaPath: "/v1/token/revoke",
                                method: "POST",
                                headers: n,
                                query: r,
                                body: o
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new d.VoidApiResponse(i)]
                    }
                })
            })
        }, t.prototype.tokenRevokeToken = function(e, t) {
            return m(this, void 0, void 0, function() {
                return v(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.tokenRevokeTokenRaw(e, t)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, t.prototype.tokenUseAuthorizationGrantRaw = function(e, t) {
            return m(this, void 0, void 0, function() {
                var r, n, o, i;
                return v(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.grantType || void 0 === e.grantType) throw new d.RequiredError("grantType", "Required parameter requestParameters.grantType was null or undefined when calling tokenUseAuthorizationGrant.");
                            return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), (0, d.canConsumeForm)([{
                                contentType: "application/x-www-form-urlencoded"
                            }]), o = new URLSearchParams, void 0 !== e.grantType && o.append("grant_type", e.grantType), void 0 !== e.code && o.append("code", e.code), void 0 !== e.codeVerifier && o.append("code_verifier", e.codeVerifier), void 0 !== e.refreshToken && o.append("refresh_token", e.refreshToken), void 0 !== e.clientId && o.append("client_id", e.clientId), void 0 !== e.clientSecret && o.append("client_secret", e.clientSecret), [4, this.request({
                                path: "/v1/token",
                                schemaPath: "/v1/token",
                                method: "POST",
                                headers: n,
                                query: r,
                                body: o
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new d.JSONApiResponse(i, function(e) {
                                return null == e ? e : {
                                    accessToken: e.access_token,
                                    refreshToken: (0, d.exists)(e, "refresh_token") ? e.refresh_token : void 0,
                                    tokenType: e.token_type,
                                    expiresIn: e.expires_in,
                                    idToken: (0, d.exists)(e, "id_token") ? e.id_token : void 0,
                                    scope: (0, d.exists)(e, "scope") ? e.scope : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.tokenUseAuthorizationGrant = function(e, t) {
            return m(this, void 0, void 0, function() {
                return v(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.tokenUseAuthorizationGrantRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }
    })(d.BaseAPI),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        h(t, e), t.prototype.userInfoGetUserInfoRaw = function(e, t) {
            return m(this, void 0, void 0, function() {
                var r, n, o;
                return v(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/userinfo",
                                schemaPath: "/v1/userinfo",
                                method: "GET",
                                headers: n,
                                query: r
                            }, t)];
                        case 1:
                            return o = i.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    sub: e.sub,
                                    name: (0, d.exists)(e, "name") ? e.name : void 0,
                                    nickname: (0, d.exists)(e, "nickname") ? e.nickname : void 0,
                                    preferredUsername: (0, d.exists)(e, "preferred_username") ? e.preferred_username : void 0,
                                    createdAt: (0, d.exists)(e, "created_at") ? e.created_at : void 0,
                                    profile: (0, d.exists)(e, "profile") ? e.profile : void 0,
                                    picture: (0, d.exists)(e, "picture") ? e.picture : void 0,
                                    email: (0, d.exists)(e, "email") ? e.email : void 0,
                                    emailVerified: (0, d.exists)(e, "email_verified") ? e.email_verified : void 0,
                                    verified: (0, d.exists)(e, "verified") ? e.verified : void 0,
                                    ageChecked: (0, d.exists)(e, "age_checked") ? e.age_checked : void 0,
                                    ageBracket: (0, d.exists)(e, "age_bracket") ? e.age_bracket : void 0,
                                    premium: (0, d.exists)(e, "premium") ? e.premium : void 0,
                                    roles: (0, d.exists)(e, "roles") ? e.roles : void 0,
                                    internalUser: (0, d.exists)(e, "internal_user") ? e.internal_user : void 0,
                                    attributes: (0, d.exists)(e, "attributes") ? e.attributes : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.userInfoGetUserInfo = function() {
            return m(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), v(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.userInfoGetUserInfoRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }
    }(d.BaseAPI), e.s(["ApplicationApi", 0, Q, "ApplicationAuthorizationsApiModelsEnumErrorCode", 0, {
        InternalError: "InternalError",
        NotAuthenticated: "NotAuthenticated",
        MissingArgument: "MissingArgument",
        DuplicateValuesArgument: "DuplicateValuesArgument",
        InvalidArgument: "InvalidArgument",
        InvalidRequest: "InvalidRequest",
        ArgumentExceedsLimit: "ArgumentExceedsLimit",
        AuthorizationUnauthorizedAccess: "AuthorizationUnauthorizedAccess",
        AuthorizationNotFound: "AuthorizationNotFound",
        ApplicationUnauthorizedAccess: "ApplicationUnauthorizedAccess",
        ApplicationNotFound: "ApplicationNotFound",
        TargetUnauthorizedAccess: "TargetUnauthorizedAccess",
        TargetNotFound: "TargetNotFound",
        ApplicationNameTaken: "ApplicationNameTaken",
        TextInappropriate: "TextInappropriate",
        InvalidScope: "InvalidScope",
        MalformedRedirectUri: "MalformedRedirectUri",
        IllegalSchemeRedirectUri: "IllegalSchemeRedirectUri",
        RedirectUriMismatch: "RedirectUriMismatch",
        ScopeMismatch: "ScopeMismatch",
        AccessDenied: "AccessDenied",
        SettingsChangeRequired: "SettingsChangeRequired",
        LuobuCreatorMobileBindingMissing: "LuobuCreatorMobileBindingMissing",
        AgeCheckRequired: "AgeCheckRequired",
        EmailVerificationRequired: "EmailVerificationRequired",
        InvalidPromptValue: "InvalidPromptValue",
        InvalidResponseTypeValue: "InvalidResponseTypeValue",
        IllegalPrompt: "IllegalPrompt",
        InteractionRequired: "InteractionRequired",
        LoginRequired: "LoginRequired",
        AccountSelectionRequired: "AccountSelectionRequired",
        ConsentRequired: "ConsentRequired",
        GroupNotFound: "GroupNotFound",
        Conflict: "Conflict",
        UnauthorizedAccess: "UnauthorizedAccess",
        ActiveApplicationLimitExceeded: "ActiveApplicationLimitExceeded",
        AuthorizationLimitExceeded: "AuthorizationLimitExceeded",
        InvalidImageFile: "InvalidImageFile",
        ApplicationStatusConflict: "ApplicationStatusConflict",
        InvalidOrigin: "InvalidOrigin",
        InvalidVerificationToken: "InvalidVerificationToken",
        PublishLimitExceeded: "PublishLimitExceeded",
        ApplicationModerated: "ApplicationModerated",
        ReviewSubmissionRequired: "ReviewSubmissionRequired"
    }, "AuthorizationApi", 0, Z, "DiscoveryApi", 0, ee, "PermissionRequestApi", 0, et, "ScopeApi", 0, er], 280162);
    let en = (0, r.createContext)(null);
    en.displayName = "StudioResources";
    let eo = (0, o.makeStyles)()(() => ({
        closeIcon: {
            position: "absolute",
            right: 8,
            top: 8
        },
        studioIcon: {
            width: 80
        },
        dialogText: {
            marginTop: 20,
            marginBottom: 20,
            textAlign: "center"
        }
    }));
    var ei, ea = e => {
            let {
                logoSrc: t,
                translations: n
            } = e, {
                classes: {
                    studioIcon: o,
                    dialogText: l
                }
            } = eo();
            return r.default.createElement(r.default.Fragment, null, r.default.createElement(i.Grid, {
                container: !0,
                "data-testid": "studio-dialog-loading",
                direction: "column",
                alignItems: "center"
            }, r.default.createElement("img", {
                width: 64,
                className: o,
                src: t,
                alt: "studio logo"
            }), r.default.createElement(a.Typography, {
                classes: {
                    root: l
                },
                variant: "body1",
                color: "secondary"
            }, n["Message.CheckingStudio"])), r.default.createElement(s.LinearProgress, {
                title: "progress bar"
            }))
        },
        es = e => {
            let {
                logoSrc: t,
                translations: n,
                onClose: o
            } = e, {
                classes: {
                    closeIcon: s,
                    studioIcon: u,
                    dialogText: p
                }
            } = eo();
            return r.default.createElement(i.Grid, {
                container: !0,
                "data-testid": "studio-dialog-error",
                direction: "column",
                alignItems: "center"
            }, r.default.createElement(l.IconButton, {
                className: s,
                color: "secondary",
                "aria-label": "close",
                onClick: o,
                size: "large"
            }, r.default.createElement(c.CloseIcon, null)), r.default.createElement("img", {
                width: 64,
                className: u,
                src: t,
                alt: "studio logo"
            }), r.default.createElement(a.Typography, {
                classes: {
                    root: p
                },
                variant: "body1",
                color: "secondary"
            }, n["Message.OpenStudioError"]))
        },
        el = e => {
            let {
                downloadUrl: t,
                logoSrc: n,
                translations: o,
                onClose: s,
                onDownload: p
            } = e, {
                classes: {
                    closeIcon: d,
                    studioIcon: f,
                    dialogText: h
                }
            } = eo();
            return r.default.createElement(i.Grid, {
                container: !0,
                "data-testid": "studio-dialog-download",
                direction: "column",
                alignItems: "center"
            }, r.default.createElement(l.IconButton, {
                className: d,
                color: "secondary",
                "aria-label": "close",
                onClick: s,
                size: "large"
            }, r.default.createElement(c.CloseIcon, null)), r.default.createElement("img", {
                width: 64,
                className: f,
                src: n,
                alt: "studio logo"
            }), r.default.createElement(a.Typography, {
                classes: {
                    root: h
                },
                variant: "body1",
                color: "secondary"
            }, o["Message.StartYourCreation"]), r.default.createElement(u.Button, {
                "data-testid": "cancel-studio-dialog-button",
                variant: "contained",
                onClick: () => {
                    p(), window.open(t, "_blank")
                },
                "aria-label": o["Action.DownloadStudio"]
            }, o["Action.DownloadStudio"]))
        };
    let ec = "sitetest1",
        eu = "sitetest2",
        ep = "sitetest3",
        ed = "production",
        ef = "luobu";
    var eh = ((ei = {}).Default = "Default", ei.ReturnFromLogin = "ReturnFromLogin", ei.EditPlace = "EditPlace", ei.EditPlaceRevision = "EditPlaceRevision", ei.ViewAsset = "ViewAsset", ei);
    let em = async (e, t, r) => {
        let n = "".concat(e, "/product-experimentation-platform/v1/projects/1/layers/").concat(t, "/values?parameters=").concat(r);
        return (await fetch(n, {
            headers: {
                "Content-Type": "application/json"
            },
            credentials: "include"
        })).json()
    }, ev = async e => {
        var t, r, o, i, a;
        let s = (0, n.getCurrentPlatform)();
        if (s === n.Platform.macOS) {
            let n = await em(e, "CreatorHubStudioInMac", "enablePersonalizedInstallerInMac,enablePersonalizedStudioLaunchInMac");
            return {
                enablePersonalizedInstaller: !1,
                enableDummyCodeInInstaller: !1,
                enablePersonalizedInstallerInMac: null != (t = n.enablePersonalizedInstallerInMac) && t,
                enablePersonalizedStudioLaunch: !1,
                enablePersonalizedStudioLaunchInMac: null != (r = n.enablePersonalizedStudioLaunchInMac) && r
            }
        }
        if (s === n.Platform.Windows) {
            let t = await em(e, "CreatorHubStudio", "enableDummyCodeInInstaller,enablePersonalizedInstaller,enablePersonalizedStudioLaunch");
            return {
                enablePersonalizedInstaller: null != (o = t.enablePersonalizedInstaller) && o,
                enableDummyCodeInInstaller: null != (i = t.enableDummyCodeInInstaller) && i,
                enablePersonalizedInstallerInMac: !1,
                enablePersonalizedStudioLaunch: null != (a = t.enablePersonalizedStudioLaunch) && a,
                enablePersonalizedStudioLaunchInMac: !1
            }
        }
        return {
            enablePersonalizedInstaller: !1,
            enableDummyCodeInInstaller: !1,
            enablePersonalizedInstallerInMac: !1,
            enablePersonalizedStudioLaunch: !1,
            enablePersonalizedStudioLaunchInMac: !1
        }
    }, ey = async e => null != t ? t : t = ev(e), eb = [{
        scopeType: "openid",
        operations: ["read"]
    }, {
        scopeType: "credentials",
        operations: ["read"]
    }, {
        scopeType: "profile",
        operations: ["read"]
    }, {
        scopeType: "age",
        operations: ["read"]
    }, {
        scopeType: "roles",
        operations: ["read"]
    }, {
        scopeType: "premium",
        operations: ["read"]
    }, {
        scopeType: "verification",
        operations: ["read"]
    }];

    function eg(e) {
        let t = new Uint8Array(e);
        globalThis.crypto.getRandomValues(t);
        let r = "";
        return t.forEach(e => {
            r += String.fromCharCode(e)
        }), btoa(r)
    }
    let ew = async e => {
        let {
            clientId: t,
            bedev2BasePath: r
        } = e, n = new et(new d.Configuration({
            basePath: "".concat(r, "/oauth"),
            credentials: "include",
            enableMrRouter: !0
        })), o = eg(64);
        try {
            let e = await ey(r);
            if (null == e ? void 0 : e.enableDummyCodeInInstaller) return eg(33).replaceAll("+", "-").replaceAll("/", "_").replace(/=+$/, "");
            if (!e || !e.enablePersonalizedInstaller && !e.enablePersonalizedInstallerInMac || "function" != typeof n.permissionRequestCreateMagicAuthorizationGrant) return;
            return (await n.permissionRequestCreateMagicAuthorizationGrant({
                permissionRequestCreateMagicAuthorizationGrantRequest: {
                    clientId: t,
                    scopes: eb,
                    nonce: o
                }
            })).code
        } catch (e) {
            return
        }
    }, ex = [{
        scopeType: "openid",
        operations: ["read"]
    }, {
        scopeType: "credentials",
        operations: ["read"]
    }, {
        scopeType: "profile",
        operations: ["read"]
    }, {
        scopeType: "age",
        operations: ["read"]
    }, {
        scopeType: "roles",
        operations: ["read"]
    }, {
        scopeType: "premium",
        operations: ["read"]
    }, {
        scopeType: "verification",
        operations: ["read"]
    }], eA = async (e, t) => {
        let {
            clientId: r,
            bedev2BasePath: n
        } = e, o, i, a, s = new et(new d.Configuration({
            basePath: "".concat(n, "/oauth"),
            credentials: "include",
            enableMrRouter: !0
        })), l = (i = new Uint8Array(64), globalThis.crypto.getRandomValues(i), a = "", i.forEach(e => {
            a += String.fromCharCode(e)
        }), btoa(a));
        try {
            o = await ey(n)
        } catch (e) {
            return
        }
        if (o && (o.enablePersonalizedStudioLaunch || o.enablePersonalizedStudioLaunchInMac) && "permissionRequestCreateMagicAuthorizationGrant" in s && "function" == typeof s.permissionRequestCreateMagicAuthorizationGrant) try {
            return (await s.permissionRequestCreateMagicAuthorizationGrant({
                permissionRequestCreateMagicAuthorizationGrantRequest: {
                    clientId: r,
                    scopes: ex,
                    nonce: l
                }
            })).code
        } catch (e) {
            try {
                null == t || t(e instanceof Error ? e : Error(String(e)))
            } catch (e) {}
            return
        }
    }, eR = e => {
        let t = ["".concat(e.protocolScheme, ":1"), "launchtime:".concat(Date.now()), "avatar", "browsertrackerid:".concat((() => {
            let e = (0, n.getCookieValueByKey)("RBXEventTrackerV2") || (0, n.getCookieValueByKey)("RBXEventTracker");
            if (e) {
                let t = e.match(/browserid=([^&]*)/i);
                if (t) return t[1] || ""
            }
            return ""
        })()), "robloxLocale:".concat(e.locale), "gameLocale:".concat(e.locale), "channel:".concat(e.channel), "browser:".concat(n.device.getCurrentBrowser()), "userId:".concat(e.userId), "distributorType:".concat(e.distributorType)];
        return void 0 !== e.authCode && "" !== e.authCode && t.push("authCode:".concat(e.authCode), "authCodeType:magic"), void 0 !== e.baseUrl && t.push("baseUrl:".concat(encodeURIComponent(e.baseUrl))), e.task === eh.ViewAsset ? (t.push("launchmode:asset"), t.push("assetid:".concat(e.assetId))) : (t.push("launchmode:edit"), e.task === eh.EditPlace && (t.push("task:".concat(e.task), "placeId:".concat(e.placeId), "universeId:".concat(e.universeId)), e.adPlacementId && (t.push("adPlacementId:".concat(e.adPlacementId)), e.referrerId && t.push("referrerId:".concat(e.referrerId)))), e.task === eh.EditPlaceRevision && (t.push("task:".concat(e.task), "placeId:".concat(e.placeId), "universeId:".concat(e.universeId), "placeversion:".concat(e.placeVersion)), e.scriptUniqueId && t.push("openscriptfromid:".concat(e.scriptUniqueId)), e.scriptPath && t.push("openscriptpath:".concat(e.scriptPath)), null != e.startLine && null != e.endLine && t.push("startline:".concat(e.startLine), "endline:".concat(e.endLine)), null != e.startCharacter && null != e.endCharacter && t.push("startcharacter:".concat(e.startCharacter), "endcharacter:".concat(e.endCharacter))), (e.task === eh.Default || e.task === eh.ReturnFromLogin) && t.push("task:".concat(e.task))), t.join("+")
    }, eI = (0, o.makeStyles)()(e => ({
        dialog: {
            backgroundColor: e.palette.background.media,
            padding: "40px 20px 30px 20px",
            minWidth: 400
        }
    }));
    async function eP(e) {
        return Array.from(new Uint8Array(await crypto.subtle.digest("SHA-1", new TextEncoder().encode(e)))).map(e => e.toString(16).padStart(2, "0")).join("")
    }
    let eS = {
            [ec]: "5248896133416875863",
            [eu]: "3992715735343249042",
            [ep]: "5462362171564719537",
            [ed]: "7968549422692352298"
        },
        eq = {
            [ec]: "6593031293946509533",
            [eu]: "6280195288255344888",
            [ep]: "5437780827214302073",
            [ed]: "6154550030602747221"
        },
        eC = "https://setup.c.robloxdev.cn",
        ek = "".concat(eC, "/cjv/RobloxStudioInstallerCJV.exe"),
        eT = "".concat(eC, "/mac/cjv/RobloxStudioCJV.dmg");
    e.s(["EStudioTaskType", 0, eh, "StudioResourcesProvider", 0, e => {
        let {
            resources: t,
            children: n
        } = e;
        return r.default.createElement(en.Provider, {
            value: t
        }, n)
    }, "createStudioResources", 0, function(e) {
        let {
            logoSrc: t,
            environment: r,
            target: o,
            fetchers: i,
            errorHandler: a
        } = e, s, l = o === ef ? eq[r] : eS[r];
        return {
            logoSrc: t,
            downloadURL: (s = (0, n.getCurrentPlatform)(), o === ef ? s === n.Platform.macOS ? eT : ek : r === ed ? "https://www.roblox.com/download/studio" : "https://www.".concat(r, ".robloxlabs.com/download/studio")),
            bedev2BasePath: r === ed ? "https://apis.roblox.com" : "https://apis.".concat(r, ".robloxlabs.com"),
            clientId: l,
            async fetchUserChannel() {
                let e = await i.userChannel();
                return void 0 === e || "LIVE" === e.toUpperCase() ? "" : e
            },
            onError(e, t) {
                null == a || a(e, t)
            }
        }
    }, "useStudio", 0, (e, t) => {
        let o = (0, n.getCurrentPlatform)(),
            i = function() {
                let e = (0, r.useContext)(en);
                if (null === e) throw Error("Cannot load required studio resources, please make sure the provider has been properly set up");
                return e
            }(),
            {
                classes: {
                    dialog: a
                }
            } = eI(),
            [s, l] = (0, r.useState)(),
            [c, u] = (0, r.useState)(),
            d = (0, r.useRef)(s),
            f = (0, r.useRef)(void 0),
            h = (0, r.useCallback)(async () => {
                let e = await ew(i);
                return void 0 === e ? i.downloadURL : "".concat(i.downloadURL, "?code=").concat(e)
            }, [i]),
            m = (0, r.useCallback)(async () => void 0 === c ? void 0 : eP(c), [c]),
            v = (0, r.useCallback)(e => {
                f.current = e
            }, []),
            y = (0, r.useCallback)(e => {
                d.current = e, l(e)
            }, []),
            b = (0, r.useRef)(t);
        (0, r.useEffect)(() => {
            b.current = t
        }, [t]);
        let g = (0, r.useCallback)(() => {
                var e, t;
                let r = f.current;
                v(void 0), y(void 0), void 0 !== r && (null == (t = b.current) || null == (e = t.close) || e.call(t, r))
            }, [v, y]),
            w = (0, r.useCallback)(() => {
                "Download" === d.current && g()
            }, [g]);
        (0, r.useEffect)(() => (window.addEventListener("blur", w), () => {
            window.removeEventListener("blur", w)
        }), [w]);
        let x = (0, r.useCallback)(async (e, r) => {
                let {
                    userId: n,
                    locale: o,
                    protocolScheme: a,
                    distributorType: s,
                    baseUrl: l
                } = r;
                try {
                    var c, p, d, f;
                    let r, h;
                    v(e), y("Loading"), null == t || null == (p = t.startAttempt) || p.call(t, e);
                    let [m, b, g] = await Promise.all([i.fetchUserChannel(), ew(i), eA(i, t => i.onError(t, e))]);
                    u(b);
                    let w = {
                            userId: null != (c = null == n ? void 0 : n.toString()) ? c : "",
                            locale: o,
                            protocolScheme: a,
                            distributorType: s,
                            baseUrl: l,
                            channel: m,
                            authCode: g
                        },
                        x = "";
                    switch (e.task) {
                        case eh.EditPlace:
                            x = eR({
                                ...w,
                                task: e.task,
                                universeId: e.universeId,
                                placeId: e.placeId,
                                adPlacementId: e.adPlacementId,
                                referrerId: e.referrerId
                            });
                            break;
                        case eh.EditPlaceRevision:
                            x = eR({
                                ...w,
                                task: e.task,
                                universeId: e.universeId,
                                placeId: e.placeId,
                                placeVersion: e.placeVersion,
                                scriptUniqueId: e.scriptUniqueId,
                                scriptPath: e.scriptPath,
                                startLine: e.startLine,
                                endLine: e.endLine,
                                startCharacter: e.startCharacter,
                                endCharacter: e.endCharacter
                            });
                            break;
                        case eh.ViewAsset:
                            x = eR({
                                ...w,
                                task: e.task,
                                assetId: e.assetId
                            });
                            break;
                        case eh.Default:
                        case eh.ReturnFromLogin:
                            x = eR({
                                ...w,
                                task: e.task
                            })
                    }
                    f = x, (r = document.querySelector('[data-testid="studio-protocol-iframe"]')) && r.remove(), (h = document.createElement("iframe")).style.display = "none", h.src = f, h.setAttribute("data-testid", "studio-protocol-iframe"), document.body.appendChild(h);
                    let A = void 0 !== g && "" !== g,
                        R = A ? await eP(g).catch(() => "hash_failed") : void 0;
                    null == t || null == (d = t.startSuccess) || d.call(t, e, {
                        hasAuthCode: A,
                        authCodeHash: R
                    }), await new Promise(e => {
                        setTimeout(e, 3e3)
                    }), y("Download")
                } catch (t) {
                    y("Error"), i.onError(t instanceof Error ? t : Error(String(t)), e)
                }
            }, [t, v, y, i]),
            A = void 0 === c ? i.downloadURL : "".concat(i.downloadURL, "?code=").concat(c);
        return {
            open: x,
            dialog: (0, r.useMemo)(() => r.default.createElement(p.Dialog, {
                classes: {
                    paper: a
                },
                maxWidth: "XSmall",
                open: void 0 !== s
            }, "Loading" === s && r.default.createElement(ea, {
                logoSrc: i.logoSrc,
                translations: e
            }), "Error" === s && r.default.createElement(es, {
                onClose: g,
                logoSrc: i.logoSrc,
                translations: e
            }), "Download" === s && r.default.createElement(el, {
                onClose: g,
                onDownload: () => {
                    var e;
                    void 0 !== f.current && (null == t || null == (e = t.download) || e.call(t, f.current, {
                        getDownloadCode: m
                    }))
                },
                downloadUrl: A,
                logoSrc: i.logoSrc,
                translations: e
            })), [g, a, s, m, A, t, i.logoSrc, e]),
            isCompatible: o === n.Platform.Windows || o === n.Platform.macOS,
            getStudioDownloadUrlAsync: h
        }
    }], 581577)
}]);

//# debugId=ebede7e8-8881-bf74-8df3-028630fc6d00
//# sourceMappingURL=2perkqcjvfxsv.js.map