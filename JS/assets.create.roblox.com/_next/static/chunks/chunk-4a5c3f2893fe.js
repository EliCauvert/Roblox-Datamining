;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "8f771108-70c7-b57a-40ac-764d9bb89d01")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 460423, e => {
    "use strict";
    var t = e.i(913826);
    e.s(["z", 0, t])
}, 828200, 377007, e => {
    "use strict";
    var t = e.i(785517),
        n = (0, e.i(266062).c)((0, t.jsx)("path", {
            d: "M19 6.41 17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"
        }), "Close");
    e.s(["C", 0, n], 377007), e.s(["f", 0, n], 828200)
}, 779767, 948538, e => {
    "use strict";
    var t, n, o, r, i, a = e.i(225226),
        s = e.i(643766),
        l = e.i(231543),
        c = e.i(130933),
        u = e.i(433659),
        p = e.i(179183),
        d = e.i(365434),
        f = e.i(415014),
        h = e.i(677484),
        m = e.i(785517),
        v = e.i(49167),
        y = e.i(920310);
    e.i(386856), e.i(100489), e.i(475252);
    var b = e.i(611785),
        g = e.i(621083),
        w = e.i(908257),
        A = e.i(268953),
        x = {};
    Object.defineProperty(x, "__esModule", {
        value: !0
    });
    var R = x.default = void 0,
        I = function(e) {
            if (e && e.__esModule) return e;
            if (null === e || "object" != typeof e && "function" != typeof e) return {
                default: e
            };
            var t = S(void 0);
            if (t && t.has(e)) return t.get(e);
            var n = {
                    __proto__: null
                },
                o = Object.defineProperty && Object.getOwnPropertyDescriptor;
            for (var r in e)
                if ("default" !== r && Object.prototype.hasOwnProperty.call(e, r)) {
                    var i = o ? Object.getOwnPropertyDescriptor(e, r) : null;
                    i && (i.get || i.set) ? Object.defineProperty(n, r, i) : n[r] = e[r]
                } return n.default = e, t && t.set(e, n), n
        }(s.default),
        P = d.f;

    function S(e) {
        if ("function" != typeof WeakMap) return null;
        var t = new WeakMap,
            n = new WeakMap;
        return (S = function(e) {
            return e ? n : t
        })(e)
    }
    R = x.default = function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : null,
            t = I.useContext(P.ThemeContext);
        return t && 0 !== Object.keys(t).length ? t : e
    };
    var q = "bottom",
        k = "right",
        C = "left",
        T = "auto",
        U = ["top", q, k, C],
        E = "start",
        K = "viewport",
        z = "popper",
        O = U.reduce(function(e, t) {
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
    var B = Math.max,
        N = Math.min,
        H = Math.round;

    function W() {
        var e = navigator.userAgentData;
        return null != e && e.brands && Array.isArray(e.brands) ? e.brands.map(function(e) {
            return e.brand + "/" + e.version
        }).join(" ") : navigator.userAgent
    }

    function J() {
        return !/^((?!chrome|android).)*safari/i.test(W())
    }

    function X(e, t, n) {
        void 0 === t && (t = !1), void 0 === n && (n = !1);
        var o = e.getBoundingClientRect(),
            r = 1,
            i = 1;
        t && j(e) && (r = e.offsetWidth > 0 && H(o.width) / e.offsetWidth || 1, i = e.offsetHeight > 0 && H(o.height) / e.offsetHeight || 1);
        var a = (G(e) ? V(e) : window).visualViewport,
            s = !J() && n,
            l = (o.left + (s && a ? a.offsetLeft : 0)) / r,
            c = (o.top + (s && a ? a.offsetTop : 0)) / i,
            u = o.width / r,
            p = o.height / i;
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
            n = e.offsetWidth,
            o = e.offsetHeight;
        return 1 >= Math.abs(t.width - n) && (n = t.width), 1 >= Math.abs(t.height - o) && (o = t.height), {
            x: e.offsetLeft,
            y: e.offsetTop,
            width: n,
            height: o
        }
    }

    function $(e, t) {
        var n = t.getRootNode && t.getRootNode();
        if (e.contains(t)) return !0;
        if (n && D(n)) {
            var o = t;
            do {
                if (o && e.isSameNode(o)) return !0;
                o = o.parentNode || o.host
            } while (o)
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

    function en(e) {
        for (var t = V(e), n = et(e); n && ["table", "td", "th"].indexOf(M(n)) >= 0 && "static" === Q(n).position;) n = et(n);
        return n && ("html" === M(n) || "body" === M(n) && "static" === Q(n).position) ? t : n || function(e) {
            var t = /firefox/i.test(W());
            if (/Trident/i.test(W()) && j(e) && "fixed" === Q(e).position) return null;
            var n = ee(e);
            for (D(n) && (n = n.host); j(n) && 0 > ["html", "body"].indexOf(M(n));) {
                var o = Q(n);
                if ("none" !== o.transform || "none" !== o.perspective || "paint" === o.contain || -1 !== ["transform", "perspective"].indexOf(o.willChange) || t && "filter" === o.willChange || t && o.filter && "none" !== o.filter) return n;
                n = n.parentNode
            }
            return null
        }(e) || t
    }

    function eo(e) {
        return ["top", "bottom"].indexOf(e) >= 0 ? "x" : "y"
    }

    function er(e, t, n) {
        return B(e, N(t, n))
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
        return t.reduce(function(t, n) {
            return t[n] = e, t
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
        var t, n = e.popper,
            o = e.popperRect,
            r = e.placement,
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
            g = C,
            w = "top",
            A = window;
        if (c) {
            var x = en(n),
                R = "clientHeight",
                I = "clientWidth";
            x === V(n) && "static" !== Q(x = Z(n)).position && "absolute" === s && (R = "scrollHeight", I = "scrollWidth"), ("top" === r || (r === C || r === k) && "end" === i) && (w = q, m -= (p && x === A && A.visualViewport ? A.visualViewport.height : x[R]) - o.height, m *= l ? 1 : -1), (r === C || ("top" === r || r === q) && "end" === i) && (g = k, f -= (p && x === A && A.visualViewport ? A.visualViewport.width : x[I]) - o.width, f *= l ? 1 : -1)
        }
        var P, S, T, U, E, K, z = Object.assign({
                position: s
            }, c && el),
            O = !0 === u ? (P = {
                x: f,
                y: m
            }, S = V(n), T = P.x, U = P.y, {
                x: H(T * (E = S.devicePixelRatio || 1)) / E || 0,
                y: H(U * E) / E || 0
            }) : {
                x: f,
                y: m
            };
        return f = O.x, m = O.y, l ? Object.assign({}, z, ((K = {})[w] = b ? "0" : "", K[g] = y ? "0" : "", K.transform = 1 >= (A.devicePixelRatio || 1) ? "translate(" + f + "px, " + m + "px)" : "translate3d(" + f + "px, " + m + "px, 0)", K)) : Object.assign({}, z, ((t = {})[w] = b ? m + "px" : "", t[g] = y ? f + "px" : "", t.transform = "", t))
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
            n = t.overflow,
            o = t.overflowX,
            r = t.overflowY;
        return /auto|scroll|overlay|hidden/.test(n + r + o)
    }

    function eb(e, t) {
        void 0 === t && (t = []);
        var n, o = function e(t) {
                return ["html", "body", "#document"].indexOf(M(t)) >= 0 ? t.ownerDocument.body : j(t) && ey(t) ? t : e(ee(t))
            }(e),
            r = o === (null == (n = e.ownerDocument) ? void 0 : n.body),
            i = V(o),
            a = r ? [i].concat(i.visualViewport || [], ey(o) ? o : []) : o,
            s = t.concat(a);
        return r ? s : s.concat(eb(ee(a)))
    }

    function eg(e) {
        return Object.assign({}, e, {
            left: e.x,
            top: e.y,
            right: e.x + e.width,
            bottom: e.y + e.height
        })
    }

    function ew(e, t, n) {
        var o, r, i, a, s, l, c, u, p, d;
        return t === K ? eg(function(e, t) {
            var n = V(e),
                o = Z(e),
                r = n.visualViewport,
                i = o.clientWidth,
                a = o.clientHeight,
                s = 0,
                l = 0;
            if (r) {
                i = r.width, a = r.height;
                var c = J();
                (c || !c && "fixed" === t) && (s = r.offsetLeft, l = r.offsetTop)
            }
            return {
                width: i,
                height: a,
                x: s + ev(e),
                y: l
            }
        }(e, n)) : G(t) ? ((o = X(t, !1, "fixed" === n)).top = o.top + t.clientTop, o.left = o.left + t.clientLeft, o.bottom = o.top + t.clientHeight, o.right = o.left + t.clientWidth, o.width = t.clientWidth, o.height = t.clientHeight, o.x = o.left, o.y = o.top, o) : eg((r = Z(e), a = Z(r), s = em(r), l = null == (i = r.ownerDocument) ? void 0 : i.body, c = B(a.scrollWidth, a.clientWidth, l ? l.scrollWidth : 0, l ? l.clientWidth : 0), u = B(a.scrollHeight, a.clientHeight, l ? l.scrollHeight : 0, l ? l.clientHeight : 0), p = -s.scrollLeft + ev(r), d = -s.scrollTop, "rtl" === Q(l || a).direction && (p += B(a.clientWidth, l ? l.clientWidth : 0) - c), {
            width: c,
            height: u,
            x: p,
            y: d
        }))
    }

    function eA(e) {
        var t, n = e.reference,
            o = e.element,
            r = e.placement,
            i = r ? F(r) : null,
            a = r ? es(r) : null,
            s = n.x + n.width / 2 - o.width / 2,
            l = n.y + n.height / 2 - o.height / 2;
        switch (i) {
            case "top":
                t = {
                    x: s,
                    y: n.y - o.height
                };
                break;
            case q:
                t = {
                    x: s,
                    y: n.y + n.height
                };
                break;
            case k:
                t = {
                    x: n.x + n.width,
                    y: l
                };
                break;
            case C:
                t = {
                    x: n.x - o.width,
                    y: l
                };
                break;
            default:
                t = {
                    x: n.x,
                    y: n.y
                }
        }
        var c = i ? eo(i) : null;
        if (null != c) {
            var u = "y" === c ? "height" : "width";
            switch (a) {
                case E:
                    t[c] = t[c] - (n[u] / 2 - o[u] / 2);
                    break;
                case "end":
                    t[c] = t[c] + (n[u] / 2 - o[u] / 2)
            }
        }
        return t
    }

    function ex(e, t) {
        void 0 === t && (t = {});
        var n, o, r, i, a, s, l, c, u = t,
            p = u.placement,
            d = void 0 === p ? e.placement : p,
            f = u.strategy,
            h = void 0 === f ? e.strategy : f,
            m = u.boundary,
            v = u.rootBoundary,
            y = u.elementContext,
            b = void 0 === y ? z : y,
            g = u.altBoundary,
            w = u.padding,
            A = void 0 === w ? 0 : w,
            x = ei("number" != typeof A ? A : ea(A, U)),
            R = e.rects.popper,
            I = e.elements[void 0 !== g && g ? b === z ? "reference" : z : b],
            P = (n = G(I) ? I : I.contextElement || Z(e.elements.popper), o = void 0 === m ? "clippingParents" : m, r = void 0 === v ? K : v, l = (s = [].concat("clippingParents" === o ? (i = eb(ee(n)), G(a = ["absolute", "fixed"].indexOf(Q(n).position) >= 0 && j(n) ? en(n) : n) ? i.filter(function(e) {
                return G(e) && $(e, a) && "body" !== M(e)
            }) : []) : [].concat(o), [r]))[0], (c = s.reduce(function(e, t) {
                var o = ew(n, t, h);
                return e.top = B(o.top, e.top), e.right = N(o.right, e.right), e.bottom = N(o.bottom, e.bottom), e.left = B(o.left, e.left), e
            }, ew(n, l, h))).width = c.right - c.left, c.height = c.bottom - c.top, c.x = c.left, c.y = c.top, c),
            S = X(e.elements.reference),
            C = eA({
                reference: S,
                element: R,
                strategy: "absolute",
                placement: d
            }),
            T = eg(Object.assign({}, R, C)),
            E = b === z ? T : S,
            O = {
                top: P.top - E.top + x.top,
                bottom: E.bottom - P.bottom + x.bottom,
                left: P.left - E.left + x.left,
                right: E.right - P.right + x.right
            },
            _ = e.modifiersData.offset;
        if (b === z && _) {
            var L = _[d];
            Object.keys(O).forEach(function(e) {
                var t = [k, q].indexOf(e) >= 0 ? 1 : -1,
                    n = ["top", q].indexOf(e) >= 0 ? "y" : "x";
                O[e] += L[n] * t
            })
        }
        return O
    }

    function eR(e, t, n) {
        return void 0 === n && (n = {
            x: 0,
            y: 0
        }), {
            top: e.top - t.height - n.y,
            right: e.right - t.width + n.x,
            bottom: e.bottom - t.height + n.y,
            left: e.left - t.width - n.x
        }
    }

    function eI(e) {
        return ["top", k, q, C].some(function(t) {
            return e[t] >= 0
        })
    }
    var eP = {
        placement: "bottom",
        modifiers: [],
        strategy: "absolute"
    };

    function eS() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        return !t.some(function(e) {
            return !(e && "function" == typeof e.getBoundingClientRect)
        })
    }
    var eq = (o = void 0 === (n = (t = {
        defaultModifiers: [{
            name: "eventListeners",
            enabled: !0,
            phase: "write",
            fn: function() {},
            effect: function(e) {
                var t = e.state,
                    n = e.instance,
                    o = e.options,
                    r = o.scroll,
                    i = void 0 === r || r,
                    a = o.resize,
                    s = void 0 === a || a,
                    l = V(t.elements.popper),
                    c = [].concat(t.scrollParents.reference, t.scrollParents.popper);
                return i && c.forEach(function(e) {
                        e.addEventListener("scroll", n.update, eu)
                    }), s && l.addEventListener("resize", n.update, eu),
                    function() {
                        i && c.forEach(function(e) {
                            e.removeEventListener("scroll", n.update, eu)
                        }), s && l.removeEventListener("resize", n.update, eu)
                    }
            },
            data: {}
        }, {
            name: "popperOffsets",
            enabled: !0,
            phase: "read",
            fn: function(e) {
                var t = e.state,
                    n = e.name;
                t.modifiersData[n] = eA({
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
                    n = e.options,
                    o = n.gpuAcceleration,
                    r = n.adaptive,
                    i = n.roundOffsets,
                    a = void 0 === i || i,
                    s = {
                        placement: F(t.placement),
                        variation: es(t.placement),
                        popper: t.elements.popper,
                        popperRect: t.rects.popper,
                        gpuAcceleration: void 0 === o || o,
                        isFixed: "fixed" === t.options.strategy
                    };
                null != t.modifiersData.popperOffsets && (t.styles.popper = Object.assign({}, t.styles.popper, ec(Object.assign({}, s, {
                    offsets: t.modifiersData.popperOffsets,
                    position: t.options.strategy,
                    adaptive: void 0 === r || r,
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
                    var n = t.styles[e] || {},
                        o = t.attributes[e] || {},
                        r = t.elements[e];
                    j(r) && M(r) && (Object.assign(r.style, n), Object.keys(o).forEach(function(e) {
                        var t = o[e];
                        !1 === t ? r.removeAttribute(e) : r.setAttribute(e, !0 === t ? "" : t)
                    }))
                })
            },
            effect: function(e) {
                var t = e.state,
                    n = {
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
                return Object.assign(t.elements.popper.style, n.popper), t.styles = n, t.elements.arrow && Object.assign(t.elements.arrow.style, n.arrow),
                    function() {
                        Object.keys(t.elements).forEach(function(e) {
                            var o = t.elements[e],
                                r = t.attributes[e] || {},
                                i = Object.keys(t.styles.hasOwnProperty(e) ? t.styles[e] : n[e]).reduce(function(e, t) {
                                    return e[t] = "", e
                                }, {});
                            j(o) && M(o) && (Object.assign(o.style, i), Object.keys(r).forEach(function(e) {
                                o.removeAttribute(e)
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
                    n = e.options,
                    o = e.name,
                    r = n.offset,
                    i = void 0 === r ? [0, 0] : r,
                    a = _.reduce(function(e, n) {
                        var o, r, a, s, l, c;
                        return e[n] = (o = t.rects, a = [C, "top"].indexOf(r = F(n)) >= 0 ? -1 : 1, l = (s = "function" == typeof i ? i(Object.assign({}, o, {
                            placement: n
                        })) : i)[0], c = s[1], l = l || 0, c = (c || 0) * a, [C, k].indexOf(r) >= 0 ? {
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
                null != t.modifiersData.popperOffsets && (t.modifiersData.popperOffsets.x += l, t.modifiersData.popperOffsets.y += c), t.modifiersData[o] = a
            }
        }, {
            name: "flip",
            enabled: !0,
            phase: "main",
            fn: function(e) {
                var t = e.state,
                    n = e.options,
                    o = e.name;
                if (!t.modifiersData[o]._skip) {
                    for (var r = n.mainAxis, i = void 0 === r || r, a = n.altAxis, s = void 0 === a || a, l = n.fallbackPlacements, c = n.padding, u = n.boundary, p = n.rootBoundary, d = n.altBoundary, f = n.flipVariations, h = void 0 === f || f, m = n.allowedAutoPlacements, v = t.options.placement, y = F(v), b = l || (y !== v && h ? function(e) {
                            if (F(e) === T) return [];
                            var t = ed(e);
                            return [eh(e), t, eh(t)]
                        }(v) : [ed(v)]), g = [v].concat(b).reduce(function(e, n) {
                            var o, r, i, a, s, l, d, f, v, y, b, g;
                            return e.concat(F(n) === T ? (r = (o = {
                                placement: n,
                                boundary: u,
                                rootBoundary: p,
                                padding: c,
                                flipVariations: h,
                                allowedAutoPlacements: m
                            }).placement, i = o.boundary, a = o.rootBoundary, s = o.padding, l = o.flipVariations, f = void 0 === (d = o.allowedAutoPlacements) ? _ : d, 0 === (b = (y = (v = es(r)) ? l ? O : O.filter(function(e) {
                                return es(e) === v
                            }) : U).filter(function(e) {
                                return f.indexOf(e) >= 0
                            })).length && (b = y), Object.keys(g = b.reduce(function(e, n) {
                                return e[n] = ex(t, {
                                    placement: n,
                                    boundary: i,
                                    rootBoundary: a,
                                    padding: s
                                })[F(n)], e
                            }, {})).sort(function(e, t) {
                                return g[e] - g[t]
                            })) : n)
                        }, []), w = t.rects.reference, A = t.rects.popper, x = new Map, R = !0, I = g[0], P = 0; P < g.length; P++) {
                        var S = g[P],
                            K = F(S),
                            z = es(S) === E,
                            L = ["top", q].indexOf(K) >= 0,
                            M = L ? "width" : "height",
                            V = ex(t, {
                                placement: S,
                                boundary: u,
                                rootBoundary: p,
                                altBoundary: d,
                                padding: c
                            }),
                            G = L ? z ? k : C : z ? q : "top";
                        w[M] > A[M] && (G = ed(G));
                        var j = ed(G),
                            D = [];
                        if (i && D.push(V[K] <= 0), s && D.push(V[G] <= 0, V[j] <= 0), D.every(function(e) {
                                return e
                            })) {
                            I = S, R = !1;
                            break
                        }
                        x.set(S, D)
                    }
                    if (R)
                        for (var B = function(e) {
                                var t = g.find(function(t) {
                                    var n = x.get(t);
                                    if (n) return n.slice(0, e).every(function(e) {
                                        return e
                                    })
                                });
                                if (t) return I = t, "break"
                            }, N = h ? 3 : 1; N > 0 && "break" !== B(N); N--);
                    t.placement !== I && (t.modifiersData[o]._skip = !0, t.placement = I, t.reset = !0)
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
                    n = e.options,
                    o = e.name,
                    r = n.mainAxis,
                    i = n.altAxis,
                    a = n.boundary,
                    s = n.rootBoundary,
                    l = n.altBoundary,
                    c = n.padding,
                    u = n.tether,
                    p = void 0 === u || u,
                    d = n.tetherOffset,
                    f = void 0 === d ? 0 : d,
                    h = ex(t, {
                        boundary: a,
                        rootBoundary: s,
                        padding: c,
                        altBoundary: l
                    }),
                    m = F(t.placement),
                    v = es(t.placement),
                    y = !v,
                    b = eo(m),
                    g = "x" === b ? "y" : "x",
                    w = t.modifiersData.popperOffsets,
                    A = t.rects.reference,
                    x = t.rects.popper,
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
                    if (void 0 === r || r) {
                        var T, U = "y" === b ? "top" : C,
                            K = "y" === b ? q : k,
                            z = "y" === b ? "height" : "width",
                            O = w[b],
                            _ = O + h[U],
                            L = O - h[K],
                            M = p ? -x[z] / 2 : 0,
                            V = v === E ? A[z] : x[z],
                            G = v === E ? -x[z] : -A[z],
                            j = t.elements.arrow,
                            D = p && j ? Y(j) : {
                                width: 0,
                                height: 0
                            },
                            H = t.modifiersData["arrow#persistent"] ? t.modifiersData["arrow#persistent"].padding : {
                                top: 0,
                                right: 0,
                                bottom: 0,
                                left: 0
                            },
                            W = H[U],
                            J = H[K],
                            X = er(0, A[z], D[z]),
                            $ = y ? A[z] / 2 - M - X - W - I.mainAxis : V - X - W - I.mainAxis,
                            Q = y ? -A[z] / 2 + M + X + J + I.mainAxis : G + X + J + I.mainAxis,
                            Z = t.elements.arrow && en(t.elements.arrow),
                            ee = Z ? "y" === b ? Z.clientTop || 0 : Z.clientLeft || 0 : 0,
                            et = null != (T = null == P ? void 0 : P[b]) ? T : 0,
                            ei = er(p ? N(_, O + $ - et - ee) : _, O, p ? B(L, O + Q - et) : L);
                        w[b] = ei, S[b] = ei - O
                    }
                    if (void 0 !== i && i) {
                        var ea, el, ec = "x" === b ? "top" : C,
                            eu = "x" === b ? q : k,
                            ep = w[g],
                            ed = "y" === g ? "height" : "width",
                            ef = ep + h[ec],
                            eh = ep - h[eu],
                            em = -1 !== ["top", C].indexOf(m),
                            ev = null != (el = null == P ? void 0 : P[g]) ? el : 0,
                            ey = em ? ef : ep - A[ed] - x[ed] - ev + I.altAxis,
                            eb = em ? ep + A[ed] + x[ed] - ev - I.altAxis : eh,
                            eg = p && em ? (ea = er(ey, ep, eb)) > eb ? eb : ea : er(p ? ey : ef, ep, p ? eb : eh);
                        w[g] = eg, S[g] = eg - ep
                    }
                    t.modifiersData[o] = S
                }
            },
            requiresIfExists: ["offset"]
        }, {
            name: "arrow",
            enabled: !0,
            phase: "main",
            fn: function(e) {
                var t, n = e.state,
                    o = e.name,
                    r = e.options,
                    i = n.elements.arrow,
                    a = n.modifiersData.popperOffsets,
                    s = F(n.placement),
                    l = eo(s),
                    c = [C, k].indexOf(s) >= 0 ? "height" : "width";
                if (i && a) {
                    var u, p = (u = r.padding, ei("number" != typeof(u = "function" == typeof u ? u(Object.assign({}, n.rects, {
                            placement: n.placement
                        })) : u) ? u : ea(u, U))),
                        d = Y(i),
                        f = "y" === l ? "top" : C,
                        h = "y" === l ? q : k,
                        m = n.rects.reference[c] + n.rects.reference[l] - a[l] - n.rects.popper[c],
                        v = a[l] - n.rects.reference[l],
                        y = en(i),
                        b = y ? "y" === l ? y.clientHeight || 0 : y.clientWidth || 0 : 0,
                        g = p[f],
                        w = b - d[c] - p[h],
                        A = b / 2 - d[c] / 2 + (m / 2 - v / 2),
                        x = er(g, A, w);
                    n.modifiersData[o] = ((t = {})[l] = x, t.centerOffset = x - A, t)
                }
            },
            effect: function(e) {
                var t = e.state,
                    n = e.options.element,
                    o = void 0 === n ? "[data-popper-arrow]" : n;
                null != o && ("string" != typeof o || (o = t.elements.popper.querySelector(o))) && $(t.elements.popper, o) && (t.elements.arrow = o)
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
                    n = e.name,
                    o = t.rects.reference,
                    r = t.rects.popper,
                    i = t.modifiersData.preventOverflow,
                    a = ex(t, {
                        elementContext: "reference"
                    }),
                    s = ex(t, {
                        altBoundary: !0
                    }),
                    l = eR(a, o),
                    c = eR(s, r, i),
                    u = eI(l),
                    p = eI(c);
                t.modifiersData[n] = {
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
    }).defaultModifiers) ? [] : n, i = void 0 === (r = t.defaultOptions) ? eP : r, function(e, t, n) {
        void 0 === n && (n = i);
        var r, a, s = {
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
                setOptions: function(n) {
                    var r = "function" == typeof n ? n(s.options) : n;
                    p(), s.options = Object.assign({}, i, s.options, r), s.scrollParents = {
                        reference: G(e) ? eb(e) : e.contextElement ? eb(e.contextElement) : [],
                        popper: eb(t)
                    };
                    var a, c, d, f, h, m, v = (a = Object.keys(m = [].concat(o, s.options.modifiers).reduce(function(e, t) {
                        var n = e[t.name];
                        return e[t.name] = n ? Object.assign({}, n, t, {
                            options: Object.assign({}, n.options, t.options),
                            data: Object.assign({}, n.data, t.data)
                        }) : t, e
                    }, {})).map(function(e) {
                        return m[e]
                    }), c = new Map, d = new Set, f = [], a.forEach(function(e) {
                        c.set(e.name, e)
                    }), a.forEach(function(e) {
                        d.has(e.name) || function e(t) {
                            d.add(t.name), [].concat(t.requires || [], t.requiresIfExists || []).forEach(function(t) {
                                if (!d.has(t)) {
                                    var n = c.get(t);
                                    n && e(n)
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
                            n = e.options,
                            o = e.effect;
                        if ("function" == typeof o) {
                            var r = o({
                                state: s,
                                name: t,
                                instance: u,
                                options: void 0 === n ? {} : n
                            });
                            l.push(r || function() {})
                        }
                    }), u.update()
                },
                forceUpdate: function() {
                    if (!c) {
                        var e = s.elements,
                            t = e.reference,
                            n = e.popper;
                        if (eS(t, n)) {
                            s.rects = {
                                reference: (o = en(n), r = "fixed" === s.options.strategy, p = j(o), d = j(o) && (a = H((i = o.getBoundingClientRect()).width) / o.offsetWidth || 1, l = H(i.height) / o.offsetHeight || 1, 1 !== a || 1 !== l), f = Z(o), h = X(t, d, r), m = {
                                    scrollLeft: 0,
                                    scrollTop: 0
                                }, v = {
                                    x: 0,
                                    y: 0
                                }, (p || !p && !r) && (("body" !== M(o) || ey(f)) && (m = o !== V(o) && j(o) ? {
                                    scrollLeft: o.scrollLeft,
                                    scrollTop: o.scrollTop
                                } : em(o)), j(o) ? ((v = X(o, !0)).x += o.clientLeft, v.y += o.clientTop) : f && (v.x = ev(f))), {
                                    x: h.left + m.scrollLeft - v.x,
                                    y: h.top + m.scrollTop - v.y,
                                    width: h.width,
                                    height: h.height
                                }),
                                popper: Y(n)
                            }, s.reset = !1, s.placement = s.options.placement, s.orderedModifiers.forEach(function(e) {
                                return s.modifiersData[e.name] = Object.assign({}, e.data)
                            });
                            for (var o, r, i, a, l, p, d, f, h, m, v, y = 0; y < s.orderedModifiers.length; y++)
                                if (!0 !== s.reset) {
                                    var b = s.orderedModifiers[y],
                                        g = b.fn,
                                        w = b.options,
                                        A = void 0 === w ? {} : w,
                                        x = b.name;
                                    "function" == typeof g && (s = g({
                                        state: s,
                                        options: A,
                                        name: x,
                                        instance: u
                                    }) || s)
                                } else s.reset = !1, y = -1
                        }
                    }
                },
                update: (r = function() {
                    return new Promise(function(e) {
                        u.forceUpdate(), e(s)
                    })
                }, function() {
                    return a || (a = new Promise(function(e) {
                        Promise.resolve().then(function() {
                            a = void 0, e(r())
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
        return u.setOptions(n).then(function(e) {
            !c && n.onFirstUpdate && n.onFirstUpdate(e)
        }), u
    });

    function ek(e) {
        return (0, u.g)("MuiPopper", e)
    }(0, h.g)("MuiPopper", ["root"]);
    let eC = ["anchorEl", "children", "direction", "disablePortal", "modifiers", "open", "placement", "popperOptions", "popperRef", "slotProps", "slots", "TransitionProps", "ownerState"],
        eT = ["anchorEl", "children", "container", "direction", "disablePortal", "keepMounted", "modifiers", "open", "placement", "popperOptions", "popperRef", "style", "transition", "slotProps", "slots"];

    function eU(e) {
        return "function" == typeof e ? e() : e
    }
    let eE = {},
        eK = s.forwardRef(function(e, t) {
            var n;
            let {
                anchorEl: o,
                children: r,
                direction: i,
                disablePortal: a,
                modifiers: l,
                open: c,
                placement: f,
                popperOptions: h,
                popperRef: v,
                slotProps: y = {},
                slots: A = {},
                TransitionProps: x
            } = e, R = (0, u._)(e, eC), I = s.useRef(null), P = (0, b.u)(I, t), S = s.useRef(null), q = (0, b.u)(S, v), k = s.useRef(q);
            (0, g.u)(() => {
                k.current = q
            }, [q]), s.useImperativeHandle(v, () => S.current, []);
            let C = function(e, t) {
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
                [T, U] = s.useState(C),
                [E, K] = s.useState(eU(o));
            s.useEffect(() => {
                S.current && S.current.forceUpdate()
            }), s.useEffect(() => {
                o && K(eU(o))
            }, [o]), (0, g.u)(() => {
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
                    placement: C
                }, h, {
                    modifiers: e
                }));
                return k.current(t), () => {
                    t.destroy(), k.current(null)
                }
            }, [E, a, l, c, h, C]);
            let z = {
                placement: T
            };
            null !== x && (z.TransitionProps = x);
            let O = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, d.a)({
                        root: ["root"]
                    }, ek, t)
                })(e),
                _ = null != (n = A.root) ? n : "div",
                L = (0, w.u)({
                    elementType: _,
                    externalSlotProps: y.root,
                    externalForwardedProps: R,
                    additionalProps: {
                        role: "tooltip",
                        ref: P
                    },
                    ownerState: e,
                    className: O.root
                });
            return (0, m.jsx)(_, (0, p._)({}, L, {
                children: "function" == typeof r ? r(z) : r
            }))
        }),
        ez = s.forwardRef(function(e, t) {
            let n, {
                    anchorEl: o,
                    children: r,
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
                    transition: A = !1,
                    slotProps: x = {},
                    slots: R = {}
                } = e,
                I = (0, u._)(e, eT),
                [P, S] = s.useState(!0);
            if (!c && !f && (!A || P)) return null;
            if (i) n = i;
            else if (o) {
                let e = eU(o);
                n = e && void 0 !== e.nodeType ? (0, v.o)(e).body : (0, v.o)(null).body
            }
            let q = A ? {
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
                container: n,
                children: (0, m.jsx)(eK, (0, p._)({
                    anchorEl: o,
                    direction: a,
                    disablePortal: l,
                    modifiers: d,
                    ref: t,
                    open: A ? !P : f,
                    placement: h,
                    popperOptions: b,
                    popperRef: g,
                    slotProps: x,
                    slots: R
                }, I, {
                    style: (0, p._)({
                        position: "fixed",
                        top: 0,
                        left: 0,
                        display: f || !c || A && !P ? void 0 : "none"
                    }, w),
                    TransitionProps: q,
                    children: r
                }))
            })
        }),
        eO = ["anchorEl", "component", "components", "componentsProps", "container", "disablePortal", "keepMounted", "modifiers", "open", "placement", "popperOptions", "popperRef", "transition", "slots", "slotProps"],
        e_ = (0, d.s)(ez, {
            name: "MuiPopper",
            slot: "Root",
            overridesResolver: (e, t) => t.root
        })({}),
        eL = s.forwardRef(function(e, t) {
            var n;
            let o = R(),
                r = (0, A.u)({
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
                    slots: x,
                    slotProps: I
                } = r,
                P = (0, u._)(r, eO),
                S = null != (n = null == x ? void 0 : x.root) ? n : null == s ? void 0 : s.Root,
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
                direction: null == o ? void 0 : o.direction,
                slots: {
                    root: S
                },
                slotProps: null != I ? I : l
            }, q, {
                ref: t
            }))
        });
    e.s(["M", 0, eL], 948538);
    var eM = e.i(657698),
        eV = e.i(535545),
        eG = e.i(546538),
        ej = e.i(144796),
        eD = e.i(370961),
        eF = e.i(929960),
        eB = e.i(839592),
        eN = e.i(550934),
        eH = e.i(219155);

    function eW(e) {
        return (0, u.g)("MuiTooltip", e)
    }
    e.i(648335);
    var eJ = (0, h.g)("MuiTooltip", ["popper", "popperInteractive", "popperArrow", "popperClose", "tooltip", "tooltipArrow", "touch", "tooltipPlacementLeft", "tooltipPlacementRight", "tooltipPlacementTop", "tooltipPlacementBottom", "arrow"]);
    let eX = ["arrow", "children", "classes", "components", "componentsProps", "describeChild", "disableFocusListener", "disableHoverListener", "disableInteractive", "disableTouchListener", "enterDelay", "enterNextDelay", "enterTouchDelay", "followCursor", "id", "leaveDelay", "leaveTouchDelay", "onClose", "onOpen", "open", "placement", "PopperComponent", "PopperProps", "slotProps", "slots", "title", "TransitionComponent", "TransitionProps"],
        eY = (0, d.s)(eL, {
            name: "MuiTooltip",
            slot: "Popper",
            overridesResolver: (e, t) => {
                let {
                    ownerState: n
                } = e;
                return [t.popper, !n.disableInteractive && t.popperInteractive, n.arrow && t.popperArrow, !n.open && t.popperClose]
            }
        })(e => {
            let {
                theme: t,
                ownerState: n,
                open: o
            } = e;
            return (0, p._)({
                zIndex: (t.vars || t).zIndex.tooltip,
                pointerEvents: "none"
            }, !n.disableInteractive && {
                pointerEvents: "auto"
            }, !o && {
                pointerEvents: "none"
            }, n.arrow && {
                ['&[data-popper-placement*="bottom"] .'.concat(eJ.arrow)]: {
                    top: 0,
                    marginTop: "-0.71em",
                    "&::before": {
                        transformOrigin: "0 100%"
                    }
                },
                ['&[data-popper-placement*="top"] .'.concat(eJ.arrow)]: {
                    bottom: 0,
                    marginBottom: "-0.71em",
                    "&::before": {
                        transformOrigin: "100% 0"
                    }
                },
                ['&[data-popper-placement*="right"] .'.concat(eJ.arrow)]: (0, p._)({}, n.isRtl ? {
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
                ['&[data-popper-placement*="left"] .'.concat(eJ.arrow)]: (0, p._)({}, n.isRtl ? {
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
                    ownerState: n
                } = e;
                return [t.tooltip, n.touch && t.touch, n.arrow && t.tooltipArrow, t["tooltipPlacement".concat((0, u.a)(n.placement.split("-")[0]))]]
            }
        })(e => {
            let {
                theme: t,
                ownerState: n
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
            }, n.arrow && {
                position: "relative",
                margin: 0
            }, n.touch && {
                padding: "8px 16px",
                fontSize: t.typography.pxToRem(14),
                lineHeight: Math.round(16 / 14 * 1e5) / 1e5 + "em",
                fontWeight: t.typography.fontWeightRegular
            }, {
                [".".concat(eJ.popper, '[data-popper-placement*="left"] &')]: (0, p._)({
                    transformOrigin: "right center"
                }, n.isRtl ? (0, p._)({
                    marginLeft: "14px"
                }, n.touch && {
                    marginLeft: "24px"
                }) : (0, p._)({
                    marginRight: "14px"
                }, n.touch && {
                    marginRight: "24px"
                })),
                [".".concat(eJ.popper, '[data-popper-placement*="right"] &')]: (0, p._)({
                    transformOrigin: "left center"
                }, n.isRtl ? (0, p._)({
                    marginRight: "14px"
                }, n.touch && {
                    marginRight: "24px"
                }) : (0, p._)({
                    marginLeft: "14px"
                }, n.touch && {
                    marginLeft: "24px"
                })),
                [".".concat(eJ.popper, '[data-popper-placement*="top"] &')]: (0, p._)({
                    transformOrigin: "center bottom",
                    marginBottom: "14px"
                }, n.touch && {
                    marginBottom: "24px"
                }),
                [".".concat(eJ.popper, '[data-popper-placement*="bottom"] &')]: (0, p._)({
                    transformOrigin: "center top",
                    marginTop: "14px"
                }, n.touch && {
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
        return function(n) {
            for (var o = arguments.length, r = Array(o > 1 ? o - 1 : 0), i = 1; i < o; i++) r[i - 1] = arguments[i];
            t && t(n, ...r), e(n, ...r)
        }
    }
    let e4 = s.forwardRef(function(e, t) {
        var n, o, r, i, a, l, c, h, v, y, g, w, x, R, I, P, S, q, k;
        let C = (0, A.u)({
                props: e,
                name: "MuiTooltip"
            }),
            {
                arrow: T = !1,
                children: U,
                components: E = {},
                componentsProps: K = {},
                describeChild: z = !1,
                disableFocusListener: O = !1,
                disableHoverListener: _ = !1,
                disableInteractive: L = !1,
                disableTouchListener: M = !1,
                enterDelay: V = 100,
                enterNextDelay: G = 0,
                enterTouchDelay: j = 700,
                followCursor: D = !1,
                id: F,
                leaveDelay: B = 0,
                leaveTouchDelay: N = 1500,
                onClose: H,
                onOpen: W,
                open: J,
                placement: X = "bottom",
                PopperComponent: Y,
                PopperProps: $ = {},
                slotProps: Q = {},
                slots: Z = {},
                title: ee,
                TransitionComponent: et = eN.G,
                TransitionProps: en
            } = C,
            eo = (0, u._)(C, eX),
            er = s.isValidElement(U) ? U : (0, m.jsx)("span", {
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
                controlled: J,
                default: !1,
                name: "Tooltip",
                state: "open"
            }),
            eg = ey,
            ew = (0, ej.u)(F),
            eA = s.useRef(),
            ex = (0, eD.u)(() => {
                void 0 !== eA.current && (document.body.style.WebkitUserSelect = eA.current, eA.current = void 0), ev.clear()
            });
        s.useEffect(() => ex, [ex]);
        let eR = e => {
                e0.clear(), eZ = !0, eb(!0), W && !eg && W(e)
            },
            eI = (0, eD.u)(e => {
                e0.start(800 + B, () => {
                    eZ = !1
                }), eb(!1), H && eg && H(e), ef.start(ei.transitions.duration.shortest, () => {
                    ep.current = !1
                })
            }),
            eP = e => {
                ep.current && "touchstart" !== e.type || (es && es.removeAttribute("title"), eh.clear(), em.clear(), V || eZ && G ? eh.start(eZ ? G : V, () => {
                    eR(e)
                }) : eR(e))
            },
            eS = e => {
                eh.clear(), em.start(B, () => {
                    eI(e)
                })
            },
            {
                isFocusVisibleRef: eq,
                onBlur: ek,
                onFocus: eC,
                ref: eT
            } = (0, eF.u)(),
            [, eU] = s.useState(!1),
            eE = e => {
                ek(e), !1 === eq.current && (eU(!1), eS(e))
            },
            eK = e => {
                es || el(e.currentTarget), eC(e), !0 === eq.current && (eU(!0), eP(e))
            },
            ez = e => {
                ep.current = !0;
                let t = er.props;
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
        let eO = (0, b.u)((0, eB.g)(er), eT, el, t);
        ee || 0 === ee || (eg = !1);
        let e_ = s.useRef(),
            eJ = {},
            e4 = "string" == typeof ee;
        z ? (eJ.title = eg || !e4 || _ ? null : ee, eJ["aria-describedby"] = eg ? ew : null) : (eJ["aria-label"] = e4 ? ee : null, eJ["aria-labelledby"] = eg && !e4 ? ew : null);
        let e5 = (0, p._)({}, eJ, eo, er.props, {
                className: (0, d.c)(eo.className, er.props.className),
                onTouchStart: ez,
                ref: eO
            }, D ? {
                onMouseMove: e => {
                    let t = er.props;
                    t.onMouseMove && t.onMouseMove(e), e1 = {
                        x: e.clientX,
                        y: e.clientY
                    }, e_.current && e_.current.update()
                }
            } : {}),
            e3 = {};
        M || (e5.onTouchStart = e => {
            ez(e), em.clear(), ef.clear(), ex(), eA.current = document.body.style.WebkitUserSelect, document.body.style.WebkitUserSelect = "none", ev.start(j, () => {
                document.body.style.WebkitUserSelect = eA.current, eP(e)
            })
        }, e5.onTouchEnd = e => {
            er.props.onTouchEnd && er.props.onTouchEnd(e), ex(), em.start(N, () => {
                eI(e)
            })
        }), _ || (e5.onMouseOver = e2(eP, e5.onMouseOver), e5.onMouseLeave = e2(eS, e5.onMouseLeave), ed || (e3.onMouseOver = eP, e3.onMouseLeave = eS)), O || (e5.onFocus = e2(eK, e5.onFocus), e5.onBlur = e2(eE, e5.onBlur), ed || (e3.onFocus = eK, e3.onBlur = eE));
        let e6 = s.useMemo(() => {
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
            e7 = (0, p._)({}, C, {
                isRtl: ea,
                arrow: T,
                disableInteractive: ed,
                placement: X,
                PopperComponentProp: Y,
                touch: ep.current
            }),
            e8 = (e => {
                let {
                    classes: t,
                    disableInteractive: n,
                    arrow: o,
                    touch: r,
                    placement: i
                } = e, a = {
                    popper: ["popper", !n && "popperInteractive", o && "popperArrow"],
                    tooltip: ["tooltip", o && "tooltipArrow", r && "touch", "tooltipPlacement".concat((0, u.a)(i.split("-")[0]))],
                    arrow: ["arrow"]
                };
                return (0, d.a)(a, eW, t)
            })(e7),
            e9 = null != (n = null != (o = Z.popper) ? o : E.Popper) ? n : eY,
            te = null != (r = null != (i = null != (a = Z.transition) ? a : E.Transition) ? i : et) ? r : eN.G,
            tt = null != (l = null != (c = Z.tooltip) ? c : E.Tooltip) ? l : e$,
            tn = null != (h = null != (v = Z.arrow) ? v : E.Arrow) ? h : eQ,
            to = (0, eH.a)(e9, (0, p._)({}, $, null != (y = Q.popper) ? y : K.popper, {
                className: (0, d.c)(e8.popper, null == $ ? void 0 : $.className, null == (g = null != (w = Q.popper) ? w : K.popper) ? void 0 : g.className)
            }), e7),
            tr = (0, eH.a)(te, (0, p._)({}, en, null != (x = Q.transition) ? x : K.transition), e7),
            ti = (0, eH.a)(tt, (0, p._)({}, null != (R = Q.tooltip) ? R : K.tooltip, {
                className: (0, d.c)(e8.tooltip, null == (I = null != (P = Q.tooltip) ? P : K.tooltip) ? void 0 : I.className)
            }), e7),
            ta = (0, eH.a)(tn, (0, p._)({}, null != (S = Q.arrow) ? S : K.arrow, {
                className: (0, d.c)(e8.arrow, null == (q = null != (k = Q.arrow) ? k : K.arrow) ? void 0 : q.className)
            }), e7);
        return (0, m.jsxs)(s.Fragment, {
            children: [s.cloneElement(er, e5), (0, m.jsx)(e9, (0, p._)({
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
            }, e3, to, {
                popperOptions: e6,
                children: e => {
                    let {
                        TransitionProps: t
                    } = e;
                    return (0, m.jsx)(te, (0, p._)({
                        timeout: ei.transitions.duration.shorter
                    }, t, tr, {
                        children: (0, m.jsxs)(tt, (0, p._)({}, ti, {
                            children: [ee, T ? (0, m.jsx)(tn, (0, p._)({}, ta, {
                                ref: eu
                            })) : null]
                        }))
                    }))
                }
            }))]
        })
    });
    var e5 = (0, l.f)({
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
        e3 = (0, s.forwardRef)(function(e, t) {
            var n = e.classes,
                o = e.className,
                r = (0, a.a)(e, ["classes", "className"]),
                i = e5(void 0, {
                    props: {
                        classes: (0, c.f)(n, o)
                    }
                });
            return s.default.createElement(e4, (0, a._)({}, r, {
                classes: i.classes,
                ref: t
            }))
        });
    e.s(["f", 0, e3], 779767)
}, 676061, 759815, e => {
    "use strict";
    let t, n, o, r, i, a;
    var s = e.i(225226),
        l = e.i(643766),
        c = e.i(231543),
        u = e.i(130933),
        p = e.i(856165),
        d = e.i(433659),
        f = e.i(179183),
        h = e.i(365434),
        m = e.i(415014),
        v = e.i(677484),
        y = e.i(785517),
        b = e.i(268953),
        g = e.i(397439);

    function w() {
        let e = (0, p._)(["\n  0% {\n    left: -35%;\n    right: 100%;\n  }\n\n  60% {\n    left: 100%;\n    right: -90%;\n  }\n\n  100% {\n    left: 100%;\n    right: -90%;\n  }\n"]);
        return w = function() {
            return e
        }, e
    }

    function A() {
        let e = (0, p._)(["\n  0% {\n    left: -200%;\n    right: 100%;\n  }\n\n  60% {\n    left: 107%;\n    right: -8%;\n  }\n\n  100% {\n    left: 107%;\n    right: -8%;\n  }\n"]);
        return A = function() {
            return e
        }, e
    }

    function x() {
        let e = (0, p._)(["\n  0% {\n    opacity: 1;\n    background-position: 0 -23px;\n  }\n\n  60% {\n    opacity: 0;\n    background-position: 0 -23px;\n  }\n\n  100% {\n    opacity: 1;\n    background-position: -200px -23px;\n  }\n"]);
        return x = function() {
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
        k = (0, g.q)(t || (t = w())),
        C = (0, g.q)(n || (n = A())),
        T = (0, g.q)(o || (o = x())),
        U = (e, t) => "inherit" === t ? "currentColor" : e.vars ? e.vars.palette.LinearProgress["".concat(t, "Bg")] : "light" === e.palette.mode ? (0, d.l)(e.palette[t].main, .62) : (0, d.j)(e.palette[t].main, .5),
        E = (0, h.s)("span", {
            name: "MuiLinearProgress",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: n
                } = e;
                return [t.root, t["color".concat((0, d.a)(n.color))], t[n.variant]]
            }
        })(e => {
            let {
                ownerState: t,
                theme: n
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
                backgroundColor: U(n, t.color)
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
        K = (0, h.s)("span", {
            name: "MuiLinearProgress",
            slot: "Dashed",
            overridesResolver: (e, t) => {
                let {
                    ownerState: n
                } = e;
                return [t.dashed, t["dashedColor".concat((0, d.a)(n.color))]]
            }
        })(e => {
            let {
                ownerState: t,
                theme: n
            } = e, o = U(n, t.color);
            return (0, f._)({
                position: "absolute",
                marginTop: 0,
                height: "100%",
                width: "100%"
            }, "inherit" === t.color && {
                opacity: .3
            }, {
                backgroundImage: "radial-gradient(".concat(o, " 0%, ").concat(o, " 16%, transparent 42%)"),
                backgroundSize: "10px 10px",
                backgroundPosition: "0 -23px"
            })
        }, (0, g.m)(r || (r = R()), T)),
        z = (0, h.s)("span", {
            name: "MuiLinearProgress",
            slot: "Bar1",
            overridesResolver: (e, t) => {
                let {
                    ownerState: n
                } = e;
                return [t.bar, t["barColor".concat((0, d.a)(n.color))], ("indeterminate" === n.variant || "query" === n.variant) && t.bar1Indeterminate, "determinate" === n.variant && t.bar1Determinate, "buffer" === n.variant && t.bar1Buffer]
            }
        })(e => {
            let {
                ownerState: t,
                theme: n
            } = e;
            return (0, f._)({
                width: "100%",
                position: "absolute",
                left: 0,
                bottom: 0,
                top: 0,
                transition: "transform 0.2s linear",
                transformOrigin: "left",
                backgroundColor: "inherit" === t.color ? "currentColor" : (n.vars || n).palette[t.color].main
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
            return ("indeterminate" === t.variant || "query" === t.variant) && (0, g.m)(i || (i = I()), k)
        }),
        O = (0, h.s)("span", {
            name: "MuiLinearProgress",
            slot: "Bar2",
            overridesResolver: (e, t) => {
                let {
                    ownerState: n
                } = e;
                return [t.bar, t["barColor".concat((0, d.a)(n.color))], ("indeterminate" === n.variant || "query" === n.variant) && t.bar2Indeterminate, "buffer" === n.variant && t.bar2Buffer]
            }
        })(e => {
            let {
                ownerState: t,
                theme: n
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
                backgroundColor: "inherit" === t.color ? "currentColor" : (n.vars || n).palette[t.color].main
            }, "inherit" === t.color && {
                opacity: .3
            }, "buffer" === t.variant && {
                backgroundColor: U(n, t.color),
                transition: "transform .4s linear"
            })
        }, e => {
            let {
                ownerState: t
            } = e;
            return ("indeterminate" === t.variant || "query" === t.variant) && (0, g.m)(a || (a = P()), C)
        }),
        _ = l.forwardRef(function(e, t) {
            let n = (0, b.u)({
                    props: e,
                    name: "MuiLinearProgress"
                }),
                {
                    className: o,
                    color: r = "primary",
                    value: i,
                    valueBuffer: a,
                    variant: s = "indeterminate"
                } = n,
                l = (0, d._)(n, q),
                c = (0, f._)({}, n, {
                    color: r,
                    variant: s
                }),
                u = (e => {
                    let {
                        classes: t,
                        variant: n,
                        color: o
                    } = e, r = {
                        root: ["root", "color".concat((0, d.a)(o)), n],
                        dashed: ["dashed", "dashedColor".concat((0, d.a)(o))],
                        bar1: ["bar", "barColor".concat((0, d.a)(o)), ("indeterminate" === n || "query" === n) && "bar1Indeterminate", "determinate" === n && "bar1Determinate", "buffer" === n && "bar1Buffer"],
                        bar2: ["bar", "buffer" !== n && "barColor".concat((0, d.a)(o)), "buffer" === n && "color".concat((0, d.a)(o)), ("indeterminate" === n || "query" === n) && "bar2Indeterminate", "buffer" === n && "bar2Buffer"]
                    };
                    return (0, h.a)(r, S, t)
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
                className: (0, h.c)(u.root, o),
                ownerState: c,
                role: "progressbar"
            }, v, {
                ref: t
            }, l, {
                children: ["buffer" === s ? (0, y.jsx)(K, {
                    className: u.dashed,
                    ownerState: c
                }) : null, (0, y.jsx)(z, {
                    className: u.bar1,
                    ownerState: c,
                    style: g
                }), "determinate" === s ? null : (0, y.jsx)(O, {
                    className: u.bar2,
                    ownerState: c,
                    style: w
                })]
            }))
        });
    e.s(["M", 0, _], 759815);
    var L = (0, c.f)({
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
            var n = e.classes,
                o = e.className,
                r = (0, s.a)(e, ["classes", "className"]),
                i = L(void 0, {
                    props: {
                        classes: (0, u.f)(n, o)
                    }
                });
            return l.default.createElement(_, (0, s._)({}, r, {
                classes: i.classes,
                ref: t
            }))
        });
    e.s(["f", 0, M], 676061)
}, 775444, e => {
    "use strict";
    var t = e.i(869702);
    e.s(["f", () => t.pE])
}, 215680, 386877, e => {
    "use strict";
    var t = e.i(225226),
        n = e.i(643766),
        o = e.i(231543),
        r = e.i(130933),
        i = e.i(927828),
        a = e.i(190663);
    e.i(785517);
    var s = (0, o.f)({
            name: "IconButton"
        })(function(e, n) {
            var o, r, s, l, c, u, p, d, f, h, m = n.color,
                v = n.variant,
                y = {
                    color: e.palette.actionV2.primaryBrand.fill
                },
                b = {
                    color: e.palette.content.standard
                },
                g = {
                    color: e.palette.content.alert.important
                };
            return "contained" === v && (Object.assign(y, ((o = {
                color: e.palette.content.static.light,
                backgroundColor: e.palette.actionV2.primaryBrand.fill
            })["&:hover, &.".concat(i.b.focusVisible, " .").concat(i.t.root)] = {
                backgroundColor: e.palette.actionV2.primaryBrand.containedHoverFocus
            }, o)), Object.assign(b, ((r = {
                color: e.palette.content.inverse,
                backgroundColor: e.palette.actionV2.primary.fill
            })["&:hover, &.".concat(i.b.focusVisible, " .").concat(i.t.root)] = {
                backgroundColor: e.palette.actionV2.primary.containedHoverFocus
            }, r)), Object.assign(g, ((s = {
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
        l = (0, n.forwardRef)(function(e, o) {
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
                        classes: (0, r.f)(l, c)
                    }
                }),
                m = "onMediaLight" === p || "onMediaDark" === p ? "default" : p;
            return n.default.createElement(a.I, (0, t._)({}, f, {
                classes: h.classes,
                color: m,
                ref: o
            }), i)
        });
    e.s(["f", 0, l], 386877), e.s(["f", 0, l], 215680)
}, 581577, 532308, e => {
    "use strict";
    let t;
    var n = e.i(643766),
        o = e.i(252842),
        r = e.i(67243),
        i = e.i(870999),
        a = e.i(47277),
        s = e.i(676061),
        l = e.i(215680),
        c = e.i(828200),
        u = e.i(433285),
        p = e.i(148792),
        d = e.i(415858),
        f = function(e, t) {
            return (f = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function h(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        f(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }

    function m(e, t, n, o) {
        return new(n || (n = Promise))(function(r, i) {
            function a(e) {
                try {
                    l(o.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function s(e) {
                try {
                    l(o.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function l(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(a, s)
            }
            l((o = o.apply(e, t || [])).next())
        })
    }

    function v(e, t) {
        var n, o, r, i = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
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
                if (n) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                    if (n = 1, o && (r = 2 & c[0] ? o.return : c[0] ? o.throw || ((r = o.return) && r.call(o), 0) : o.next) && !(r = r.call(o, c[1])).done) return r;
                    switch (o = 0, r && (c = [2 & c[0], r.value]), c[0]) {
                        case 0:
                        case 1:
                            r = c;
                            break;
                        case 4:
                            return i.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            i.label++, o = c[1], c = [0];
                            continue;
                        case 7:
                            c = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = i.trys).length > 0 && r[r.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === c[0] && (!r || c[1] > r[0] && c[1] < r[3])) {
                                i.label = c[1];
                                break
                            }
                            if (6 === c[0] && i.label < r[1]) {
                                i.label = r[1], r = c;
                                break
                            }
                            if (r && i.label < r[2]) {
                                i.label = r[2], i.ops.push(c);
                                break
                            }
                            r[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    c = t.call(e, i)
                } catch (e) {
                    c = [6, e], o = 0
                } finally {
                    n = r = 0
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
            resources: (0, d.A)(t.resources, b)
        }
    }

    function A(e) {
        if (void 0 !== e) return null === e ? null : {
            owner: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    id: e.id,
                    type: e.type
                }
            }(e.owner),
            resources: (0, d.A)(e.resources, g)
        }
    }

    function x(e) {
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

    function k(e, t) {
        return null == e ? e : {
            requestedCategory: (0, d.u)(e, "requestedCategory") ? e.requestedCategory : void 0,
            videoUri: (0, d.u)(e, "videoUri") ? e.videoUri : void 0,
            categoryJustification: (0, d.u)(e, "categoryJustification") ? e.categoryJustification : void 0
        }
    }

    function C(e, t) {
        return null == e ? e : {
            lastApprovedVersionNumber: (0, d.u)(e, "lastApprovedVersionNumber") ? e.lastApprovedVersionNumber : void 0,
            versionNumber: e.versionNumber,
            isInReview: e.isInReview
        }
    }

    function T(e) {
        var t;
        return null == (t = e) ? t : {
            redirectUris: t.redirectUris,
            allowedScopes: t.allowedScopes.map(S),
            versionInfo: C(t.versionInfo),
            isBanned: t.isBanned,
            createdUtc: new Date(t.createdUtc),
            updatedUtc: new Date(t.updatedUtc),
            reviewSubmission: (0, d.u)(t, "reviewSubmission") ? k(t.reviewSubmission) : void 0,
            applicationId: t.applicationId,
            owner: y(t.owner),
            name: t.name,
            summary: t.summary,
            tosUri: (0, d.u)(t, "tosUri") ? t.tosUri : void 0,
            privacyUri: (0, d.u)(t, "privacyUri") ? t.privacyUri : void 0,
            entryPointUri: (0, d.u)(t, "entryPointUri") ? t.entryPointUri : void 0,
            imageAssetId: (0, d.u)(t, "imageAssetId") ? t.imageAssetId : void 0,
            isFirstParty: (0, d.u)(t, "isFirstParty") ? t.isFirstParty : void 0
        }
    }

    function U(e, t) {
        return null == e ? e : {
            applications: e.applications.map(T),
            nextPageCursor: (0, d.u)(e, "nextPageCursor") ? e.nextPageCursor : void 0
        }
    }

    function E(e) {
        var t, n;
        return null == (t = e) ? t : {
            authorizationId: t.authorizationId,
            application: null == (n = t.application) ? n : {
                applicationId: n.applicationId,
                owner: y(n.owner),
                name: n.name,
                summary: n.summary,
                tosUri: (0, d.u)(n, "tosUri") ? n.tosUri : void 0,
                privacyUri: (0, d.u)(n, "privacyUri") ? n.privacyUri : void 0,
                entryPointUri: (0, d.u)(n, "entryPointUri") ? n.entryPointUri : void 0,
                imageAssetId: (0, d.u)(n, "imageAssetId") ? n.imageAssetId : void 0,
                isFirstParty: (0, d.u)(n, "isFirstParty") ? n.isFirstParty : void 0
            },
            scopes: t.scopes.map(S),
            resourceInfo: t.resourceInfo.map(w),
            createdUtc: new Date(t.createdUtc),
            refreshedUtc: new Date(t.refreshedUtc)
        }
    }

    function K(e, t) {
        return null == e ? e : {
            applicationSecret: e.applicationSecret,
            redirectUris: e.redirectUris,
            allowedScopes: e.allowedScopes.map(S),
            versionInfo: C(e.versionInfo),
            isBanned: e.isBanned,
            createdUtc: new Date(e.createdUtc),
            updatedUtc: new Date(e.updatedUtc),
            reviewSubmission: (0, d.u)(e, "reviewSubmission") ? k(e.reviewSubmission) : void 0,
            applicationId: e.applicationId,
            owner: y(e.owner),
            name: e.name,
            summary: e.summary,
            tosUri: (0, d.u)(e, "tosUri") ? e.tosUri : void 0,
            privacyUri: (0, d.u)(e, "privacyUri") ? e.privacyUri : void 0,
            entryPointUri: (0, d.u)(e, "entryPointUri") ? e.entryPointUri : void 0,
            imageAssetId: (0, d.u)(e, "imageAssetId") ? e.imageAssetId : void 0,
            isFirstParty: (0, d.u)(e, "isFirstParty") ? e.isFirstParty : void 0
        }
    }

    function z(e, t) {
        return null == e ? e : {
            resourceInfos: e.resource_infos.map(w)
        }
    }

    function O(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            translationKey: (0, d.u)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function _(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            translationKey: (0, d.u)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function L(e) {
        var t;
        return null == (t = e) ? t : {
            scopeType: t.scopeType,
            operation: t.operation,
            targetType: (0, d.u)(t, "targetType") ? t.targetType : void 0,
            translationKey: (0, d.u)(t, "translationKey") ? t.translationKey : void 0,
            riskLevel: (0, d.u)(t, "riskLevel") ? t.riskLevel : void 0,
            groupAllowed: (0, d.u)(t, "groupAllowed") ? t.groupAllowed : void 0,
            firstPartyOAuthOnly: (0, d.u)(t, "firstPartyOAuthOnly") ? t.firstPartyOAuthOnly : void 0,
            categories: (0, d.u)(t, "categories") ? t.categories : void 0
        }
    }

    function M(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            translationKey: (0, d.u)(t, "translationKey") ? t.translationKey : void 0
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
            translationKey: (0, d.u)(t, "translationKey") ? t.translationKey : void 0,
            descriptionTranslationKey: (0, d.u)(t, "descriptionTranslationKey") ? t.descriptionTranslationKey : void 0,
            riskLevel: (0, d.u)(t, "riskLevel") ? t.riskLevel : void 0
        }
    }

    function D(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            environments: (0, d.u)(t, "environments") ? null === t.environments ? null : t.environments.map(G) : void 0,
            targetType: (0, d.u)(t, "targetType") ? t.targetType : void 0,
            operations: t.operations,
            translationKey: (0, d.u)(t, "translationKey") ? t.translationKey : void 0,
            product: (0, d.u)(t, "product") ? t.product : void 0,
            operationOverrides: t.operationOverrides.map(j),
            authenticationSystems: t.authenticationSystems.map(V),
            groupAllowedOperations: (0, d.u)(t, "groupAllowedOperations") ? t.groupAllowedOperations : void 0
        }
    }

    function F(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            type: t.type,
            constraints: t.constraints,
            translationKey: (0, d.u)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function B(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            requiredParts: t.requiredParts,
            optionalParts: t.optionalParts,
            translationKey: (0, d.u)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function N(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            translationKey: (0, d.u)(t, "translationKey") ? t.translationKey : void 0,
            product: (0, d.u)(t, "product") ? t.product : void 0
        }
    }

    function H(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            type: (0, d.u)(t, "type") ? t.type : void 0,
            constraints: (0, d.u)(t, "constraints") ? t.constraints : void 0,
            translationKey: (0, d.u)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function W(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            requiredParts: (0, d.u)(t, "requiredParts") ? t.requiredParts : void 0,
            optionalParts: (0, d.u)(t, "optionalParts") ? t.optionalParts : void 0,
            translationKey: (0, d.u)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function J(e) {
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
            enc: (0, d.u)(t, "enc") ? t.enc : void 0,
            kty: t.kty,
            kid: t.kid,
            use: t.use,
            n: (0, d.u)(t, "n") ? t.n : void 0,
            e: (0, d.u)(t, "e") ? t.e : void 0,
            d: (0, d.u)(t, "d") ? t.d : void 0,
            p: (0, d.u)(t, "p") ? t.p : void 0,
            q: (0, d.u)(t, "q") ? t.q : void 0,
            dp: (0, d.u)(t, "dp") ? t.dp : void 0,
            dq: (0, d.u)(t, "dq") ? t.dq : void 0,
            qi: (0, d.u)(t, "qi") ? t.qi : void 0,
            crv: (0, d.u)(t, "crv") ? t.crv : void 0,
            x: (0, d.u)(t, "x") ? t.x : void 0,
            y: (0, d.u)(t, "y") ? t.y : void 0,
            k: (0, d.u)(t, "k") ? t.k : void 0
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
                    var n, o, r;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new d.w("groupId", "Required parameter requestParameters.groupId was null or undefined when calling applicationCreateApplicationForGroup.");
                                if (null === e.applicationCreateApplicationForUserRequest || void 0 === e.applicationCreateApplicationForUserRequest) throw new d.w("applicationCreateApplicationForUserRequest", "Required parameter requestParameters.applicationCreateApplicationForUserRequest was null or undefined when calling applicationCreateApplicationForGroup.");
                                return n = {}, (o = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/groups/{groupId}/applications".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/applications",
                                    method: "POST",
                                    headers: o,
                                    query: n,
                                    body: X(e.applicationCreateApplicationForUserRequest)
                                }, t)];
                            case 1:
                                return r = i.sent(), [2, new d.H(r, function(e) {
                                    return K(e)
                                })]
                        }
                    })
                })
            }, t.prototype.applicationCreateApplicationForGroup = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.applicationCreateApplicationForGroupRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.applicationCreateApplicationForUserRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, o, r;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new d.w("userId", "Required parameter requestParameters.userId was null or undefined when calling applicationCreateApplicationForUser.");
                                if (null === e.applicationCreateApplicationForUserRequest || void 0 === e.applicationCreateApplicationForUserRequest) throw new d.w("applicationCreateApplicationForUserRequest", "Required parameter requestParameters.applicationCreateApplicationForUserRequest was null or undefined when calling applicationCreateApplicationForUser.");
                                return n = {}, (o = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/users/{userId}/applications".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/users/{userId}/applications",
                                    method: "POST",
                                    headers: o,
                                    query: n,
                                    body: X(e.applicationCreateApplicationForUserRequest)
                                }, t)];
                            case 1:
                                return r = i.sent(), [2, new d.H(r, function(e) {
                                    return K(e)
                                })]
                        }
                    })
                })
            }, t.prototype.applicationCreateApplicationForUser = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.applicationCreateApplicationForUserRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.applicationDeleteApplicationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, o, r;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.w("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationDeleteApplication.");
                                return n = {}, o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/{applicationId}".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}",
                                    method: "DELETE",
                                    headers: o,
                                    query: n
                                }, t)];
                            case 1:
                                return r = i.sent(), [2, new d.V(r)]
                        }
                    })
                })
            }, t.prototype.applicationDeleteApplication = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.applicationDeleteApplicationRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.applicationGetApplicationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, o, r;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.w("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationGetApplication.");
                                return n = {}, o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/{applicationId}".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}",
                                    method: "GET",
                                    headers: o,
                                    query: n
                                }, t)];
                            case 1:
                                return r = i.sent(), [2, new d.H(r, function(e) {
                                    return T(e)
                                })]
                        }
                    })
                })
            }, t.prototype.applicationGetApplication = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.applicationGetApplicationRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.applicationGetApplicationManagementMetadataRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, o, r;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/metadata",
                                    schemaPath: "/v1/applications/metadata",
                                    method: "GET",
                                    headers: o,
                                    query: n
                                }, t)];
                            case 1:
                                return r = i.sent(), [2, new d.H(r, function(e) {
                                    return null == e ? e : {
                                        isCreateUserApplicationsAllowed: e.isCreateUserApplicationsAllowed,
                                        isViewUserApplicationsAllowed: e.isViewUserApplicationsAllowed,
                                        isUpdateUserApplicationsAllowed: e.isUpdateUserApplicationsAllowed,
                                        isDeleteUserApplicationsAllowed: e.isDeleteUserApplicationsAllowed,
                                        actions: e.actions.map(x),
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
                    return void 0 === e && (e = {}), v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.applicationGetApplicationManagementMetadataRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.applicationListApplicationsForGroupRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, o, r;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new d.w("groupId", "Required parameter requestParameters.groupId was null or undefined when calling applicationListApplicationsForGroup.");
                                return n = {}, void 0 !== e.limit && (n.limit = e.limit), void 0 !== e.sortOrder && (n.sortOrder = e.sortOrder), void 0 !== e.cursor && (n.cursor = e.cursor), o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/groups/{groupId}/applications".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/applications",
                                    method: "GET",
                                    headers: o,
                                    query: n
                                }, t)];
                            case 1:
                                return r = i.sent(), [2, new d.H(r, function(e) {
                                    return U(e)
                                })]
                        }
                    })
                })
            }, t.prototype.applicationListApplicationsForGroup = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.applicationListApplicationsForGroupRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.applicationListApplicationsForUserRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, o, r;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new d.w("userId", "Required parameter requestParameters.userId was null or undefined when calling applicationListApplicationsForUser.");
                                return n = {}, void 0 !== e.limit && (n.limit = e.limit), void 0 !== e.sortOrder && (n.sortOrder = e.sortOrder), void 0 !== e.cursor && (n.cursor = e.cursor), o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/users/{userId}/applications".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/users/{userId}/applications",
                                    method: "GET",
                                    headers: o,
                                    query: n
                                }, t)];
                            case 1:
                                return r = i.sent(), [2, new d.H(r, function(e) {
                                    return U(e)
                                })]
                        }
                    })
                })
            }, t.prototype.applicationListApplicationsForUser = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.applicationListApplicationsForUserRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.applicationPrivatizeApplicationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, o, r;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.w("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationPrivatizeApplication.");
                                return n = {}, o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/{applicationId}/privatize".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}/privatize",
                                    method: "PATCH",
                                    headers: o,
                                    query: n
                                }, t)];
                            case 1:
                                return r = i.sent(), [2, new d.V(r)]
                        }
                    })
                })
            }, t.prototype.applicationPrivatizeApplication = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.applicationPrivatizeApplicationRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.applicationPublishApplicationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, o, r;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.w("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationPublishApplication.");
                                return n = {}, o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/{applicationId}/publish".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}/publish",
                                    method: "PATCH",
                                    headers: o,
                                    query: n
                                }, t)];
                            case 1:
                                return r = i.sent(), [2, new d.V(r)]
                        }
                    })
                })
            }, t.prototype.applicationPublishApplication = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.applicationPublishApplicationRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.applicationRegenerateApplicationSecretRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, o, r;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.w("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationRegenerateApplicationSecret.");
                                return n = {}, o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/{applicationId}/secret".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}/secret",
                                    method: "POST",
                                    headers: o,
                                    query: n
                                }, t)];
                            case 1:
                                return r = i.sent(), [2, new d.H(r, function(e) {
                                    return null == e ? e : {
                                        applicationSecret: e.applicationSecret
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.applicationRegenerateApplicationSecret = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.applicationRegenerateApplicationSecretRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.applicationUpdateApplicationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, o, r;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.w("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationUpdateApplication.");
                                if (null === e.applicationUpdateApplicationRequest || void 0 === e.applicationUpdateApplicationRequest) throw new d.w("applicationUpdateApplicationRequest", "Required parameter requestParameters.applicationUpdateApplicationRequest was null or undefined when calling applicationUpdateApplication.");
                                return n = {}, (o = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/{applicationId}".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}",
                                    method: "PATCH",
                                    headers: o,
                                    query: n,
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
                                return r = i.sent(), [2, new d.H(r, function(e) {
                                    return T(e)
                                })]
                        }
                    })
                })
            }, t.prototype.applicationUpdateApplication = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.applicationUpdateApplicationRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.applicationUploadApplicationImageRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, o, r, i;
                    return v(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.w("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationUploadApplicationImage.");
                                if (null === e.imageFile || void 0 === e.imageFile) throw new d.w("imageFile", "Required parameter requestParameters.imageFile was null or undefined when calling applicationUploadApplicationImage.");
                                return n = {}, o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), r = (0, d.I)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.imageFile && r.append("imageFile", e.imageFile), [4, this.request({
                                    path: "/v1/applications/{applicationId}/image".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}/image",
                                    method: "POST",
                                    headers: o,
                                    query: n,
                                    body: r
                                }, t)];
                            case 1:
                                return i = a.sent(), [2, new d.H(i, function(e) {
                                    return null == e ? e : {
                                        imageAssetId: (0, d.u)(e, "imageAssetId") ? e.imageAssetId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.applicationUploadApplicationImage = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.applicationUploadApplicationImageRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.applicationValidateApplicationNameRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, o, r;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.name || void 0 === e.name) throw new d.w("name", "Required parameter requestParameters.name was null or undefined when calling applicationValidateApplicationName.");
                                return n = {}, void 0 !== e.name && (n.name = e.name), void 0 !== e.applicationId && (n.applicationId = e.applicationId), o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/names/validate",
                                    schemaPath: "/v1/applications/names/validate",
                                    method: "GET",
                                    headers: o,
                                    query: n
                                }, t)];
                            case 1:
                                return r = i.sent(), [2, new d.V(r)]
                        }
                    })
                })
            }, t.prototype.applicationValidateApplicationName = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.applicationValidateApplicationNameRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.applicationValidateApplicationSummaryRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, o, r;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.summary || void 0 === e.summary) throw new d.w("summary", "Required parameter requestParameters.summary was null or undefined when calling applicationValidateApplicationSummary.");
                                return n = {}, void 0 !== e.summary && (n.summary = e.summary), o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/summary/validate",
                                    schemaPath: "/v1/applications/summary/validate",
                                    method: "GET",
                                    headers: o,
                                    query: n
                                }, t)];
                            case 1:
                                return r = i.sent(), [2, new d.V(r)]
                        }
                    })
                })
            }, t.prototype.applicationValidateApplicationSummary = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.applicationValidateApplicationSummaryRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t
        }(d._),
        Z = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return h(t, e), t.prototype.authorizationDeleteAuthorizationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, o, r;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.authorizationId || void 0 === e.authorizationId) throw new d.w("authorizationId", "Required parameter requestParameters.authorizationId was null or undefined when calling authorizationDeleteAuthorization.");
                                return n = {}, o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations/{authorizationId}".replace("{".concat("authorizationId", "}"), encodeURIComponent(String(e.authorizationId))),
                                    schemaPath: "/v1/authorizations/{authorizationId}",
                                    method: "DELETE",
                                    headers: o,
                                    query: n
                                }, t)];
                            case 1:
                                return r = i.sent(), [2, new d.V(r)]
                        }
                    })
                })
            }, t.prototype.authorizationDeleteAuthorization = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.authorizationDeleteAuthorizationRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.authorizationGetAuthorizationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, o, r;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.authorizationId || void 0 === e.authorizationId) throw new d.w("authorizationId", "Required parameter requestParameters.authorizationId was null or undefined when calling authorizationGetAuthorization.");
                                return n = {}, o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations/{authorizationId}".replace("{".concat("authorizationId", "}"), encodeURIComponent(String(e.authorizationId))),
                                    schemaPath: "/v1/authorizations/{authorizationId}",
                                    method: "GET",
                                    headers: o,
                                    query: n
                                }, t)];
                            case 1:
                                return r = i.sent(), [2, new d.H(r, function(e) {
                                    return E(e)
                                })]
                        }
                    })
                })
            }, t.prototype.authorizationGetAuthorization = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.authorizationGetAuthorizationRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.authorizationGetAuthorizationResourcesRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, o, r;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.w("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling authorizationGetAuthorizationResources.");
                                if (null === e.partialScopes || void 0 === e.partialScopes) throw new d.w("partialScopes", "Required parameter requestParameters.partialScopes was null or undefined when calling authorizationGetAuthorizationResources.");
                                return n = {}, void 0 !== e.applicationId && (n.applicationId = e.applicationId), void 0 !== e.partialScopes && (n.partialScopes = e.partialScopes), o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations/resources",
                                    schemaPath: "/v1/authorizations/resources",
                                    method: "GET",
                                    headers: o,
                                    query: n
                                }, t)];
                            case 1:
                                return r = i.sent(), [2, new d.H(r, function(e) {
                                    return z(e)
                                })]
                        }
                    })
                })
            }, t.prototype.authorizationGetAuthorizationResources = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.authorizationGetAuthorizationResourcesRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.authorizationListAuthorizationsRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, o, r;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, void 0 !== e.limit && (n.limit = e.limit), void 0 !== e.sortOrder && (n.sortOrder = e.sortOrder), void 0 !== e.cursor && (n.cursor = e.cursor), o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations",
                                    schemaPath: "/v1/authorizations",
                                    method: "GET",
                                    headers: o,
                                    query: n
                                }, t)];
                            case 1:
                                return r = i.sent(), [2, new d.H(r, function(e) {
                                    return null == e ? e : {
                                        authorizations: e.authorizations.map(E),
                                        nextPageCursor: (0, d.u)(e, "nextPageCursor") ? e.nextPageCursor : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.authorizationListAuthorizations = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.authorizationListAuthorizationsRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(d._),
        ee = (function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            h(t, e), t.prototype.certificateGetAccessTokenCertificatesRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, o, r;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/certificates/access-tokens",
                                    schemaPath: "/v1/certificates/access-tokens",
                                    method: "GET",
                                    headers: o,
                                    query: n
                                }, t)];
                            case 1:
                                return r = i.sent(), [2, new d.H(r, function(e) {
                                    return $(e)
                                })]
                        }
                    })
                })
            }, t.prototype.certificateGetAccessTokenCertificates = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.certificateGetAccessTokenCertificatesRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.certificateGetDefaultCertificatesRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, o, r;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/certs",
                                    schemaPath: "/v1/certs",
                                    method: "GET",
                                    headers: o,
                                    query: n
                                }, t)];
                            case 1:
                                return r = i.sent(), [2, new d.H(r, function(e) {
                                    return $(e)
                                })]
                        }
                    })
                })
            }, t.prototype.certificateGetDefaultCertificates = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.certificateGetDefaultCertificatesRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.certificateGetIdentityTokenCertificatesRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, o, r;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/certificates/identity-tokens",
                                    schemaPath: "/v1/certificates/identity-tokens",
                                    method: "GET",
                                    headers: o,
                                    query: n
                                }, t)];
                            case 1:
                                return r = i.sent(), [2, new d.H(r, function(e) {
                                    return $(e)
                                })]
                        }
                    })
                })
            }, t.prototype.certificateGetIdentityTokenCertificates = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.certificateGetIdentityTokenCertificatesRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }
        }(d._), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return h(t, e), t.prototype.discoveryGetDiscoveryConfigurationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, o, r;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/.well-known/openid-configuration",
                                    schemaPath: "/.well-known/openid-configuration",
                                    method: "GET",
                                    headers: o,
                                    query: n
                                }, t)];
                            case 1:
                                return r = i.sent(), [2, new d.H(r, function(e) {
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
                    return void 0 === e && (e = {}), v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.discoveryGetDiscoveryConfigurationRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(d._)),
        et = (function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            h(t, e), t.prototype.externalVerificationSetExternalVerificationTypesRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, o, r;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.externalVerificationSetExternalVerificationTypesRequest || void 0 === e.externalVerificationSetExternalVerificationTypesRequest) throw new d.w("externalVerificationSetExternalVerificationTypesRequest", "Required parameter requestParameters.externalVerificationSetExternalVerificationTypesRequest was null or undefined when calling externalVerificationSetExternalVerificationTypes.");
                                return n = {}, (o = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/verification-types",
                                    schemaPath: "/v1/verification-types",
                                    method: "POST",
                                    headers: o,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            token: e.token
                                        }
                                    }(e.externalVerificationSetExternalVerificationTypesRequest)
                                }, t)];
                            case 1:
                                return r = i.sent(), [2, new d.V(r)]
                        }
                    })
                })
            }, t.prototype.externalVerificationSetExternalVerificationTypes = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.externalVerificationSetExternalVerificationTypesRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }
        }(d._), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return h(t, e), t.prototype.permissionRequestCreateAuthorizationGrantRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, o, r;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.permissionRequestCreateAuthorizationGrantRequest || void 0 === e.permissionRequestCreateAuthorizationGrantRequest) throw new d.w("permissionRequestCreateAuthorizationGrantRequest", "Required parameter requestParameters.permissionRequestCreateAuthorizationGrantRequest was null or undefined when calling permissionRequestCreateAuthorizationGrant.");
                                return n = {}, (o = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations",
                                    schemaPath: "/v1/authorizations",
                                    method: "POST",
                                    headers: o,
                                    query: n,
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
                                            resourceInfos: void 0 === e.resourceInfos ? void 0 : null === e.resourceInfos ? null : e.resourceInfos.map(A)
                                        }
                                    }(e.permissionRequestCreateAuthorizationGrantRequest)
                                }, t)];
                            case 1:
                                return r = i.sent(), [2, new d.H(r, function(e) {
                                    return null == e ? e : {
                                        location: e.location
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.permissionRequestCreateAuthorizationGrant = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.permissionRequestCreateAuthorizationGrantRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.permissionRequestCreateMagicAuthorizationGrantRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, o, r;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.permissionRequestCreateMagicAuthorizationGrantRequest || void 0 === e.permissionRequestCreateMagicAuthorizationGrantRequest) throw new d.w("permissionRequestCreateMagicAuthorizationGrantRequest", "Required parameter requestParameters.permissionRequestCreateMagicAuthorizationGrantRequest was null or undefined when calling permissionRequestCreateMagicAuthorizationGrant.");
                                return n = {}, (o = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations/magic",
                                    schemaPath: "/v1/authorizations/magic",
                                    method: "POST",
                                    headers: o,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            clientId: e.clientId,
                                            scopes: e.scopes.map(q),
                                            nonce: e.nonce
                                        }
                                    }(e.permissionRequestCreateMagicAuthorizationGrantRequest)
                                }, t)];
                            case 1:
                                return r = i.sent(), [2, new d.H(r, function(e) {
                                    return null == e ? e : {
                                        code: e.code
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.permissionRequestCreateMagicAuthorizationGrant = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.permissionRequestCreateMagicAuthorizationGrantRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.permissionRequestGetAuthorizationEndpointRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, o, r;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, void 0 !== e.clientId && (n.client_id = e.clientId), void 0 !== e.responseType && (n.response_type = e.responseType), void 0 !== e.redirectUri && (n.redirect_uri = e.redirectUri), void 0 !== e.scope && (n.scope = e.scope), void 0 !== e.state && (n.state = e.state), void 0 !== e.nonce && (n.nonce = e.nonce), void 0 !== e.prompt && (n.prompt = e.prompt), void 0 !== e.codeChallenge && (n.code_challenge = e.codeChallenge), void 0 !== e.codeChallengeMethod && (n.code_challenge_method = e.codeChallengeMethod), void 0 !== e.rlt && (n.rlt = e.rlt), void 0 !== e.studioTraceId && (n.studio_trace_id = e.studioTraceId), o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorize",
                                    schemaPath: "/v1/authorize",
                                    method: "GET",
                                    headers: o,
                                    query: n
                                }, t)];
                            case 1:
                                return r = i.sent(), [2, new d.V(r)]
                        }
                    })
                })
            }, t.prototype.permissionRequestGetAuthorizationEndpoint = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.permissionRequestGetAuthorizationEndpointRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.permissionRequestValidatePermissionRequestRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, o, r;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.clientId || void 0 === e.clientId) throw new d.w("clientId", "Required parameter requestParameters.clientId was null or undefined when calling permissionRequestValidatePermissionRequest.");
                                if (null === e.redirectUri || void 0 === e.redirectUri) throw new d.w("redirectUri", "Required parameter requestParameters.redirectUri was null or undefined when calling permissionRequestValidatePermissionRequest.");
                                if (null === e.scopes || void 0 === e.scopes) throw new d.w("scopes", "Required parameter requestParameters.scopes was null or undefined when calling permissionRequestValidatePermissionRequest.");
                                if (null === e.responseTypes || void 0 === e.responseTypes) throw new d.w("responseTypes", "Required parameter requestParameters.responseTypes was null or undefined when calling permissionRequestValidatePermissionRequest.");
                                return n = {}, void 0 !== e.clientId && (n.clientId = e.clientId), void 0 !== e.redirectUri && (n.redirectUri = e.redirectUri), void 0 !== e.scopes && (n.scopes = e.scopes), void 0 !== e.responseTypes && (n.responseTypes = e.responseTypes), void 0 !== e.prompts && (n.prompts = e.prompts), void 0 !== e.rlt && (n.rlt = e.rlt), o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/permission-request",
                                    schemaPath: "/v1/permission-request",
                                    method: "GET",
                                    headers: o,
                                    query: n
                                }, t)];
                            case 1:
                                return r = i.sent(), [2, new d.H(r, function(e) {
                                    return null == e ? e : {
                                        scopes: e.scopes.map(S),
                                        responseTypes: e.responseTypes.map(I),
                                        promptTypes: e.promptTypes.map(R),
                                        userAgreements: e.userAgreements.map(J),
                                        applicationId: e.applicationId,
                                        owner: y(e.owner),
                                        name: e.name,
                                        summary: e.summary,
                                        tosUri: (0, d.u)(e, "tosUri") ? e.tosUri : void 0,
                                        privacyUri: (0, d.u)(e, "privacyUri") ? e.privacyUri : void 0,
                                        entryPointUri: (0, d.u)(e, "entryPointUri") ? e.entryPointUri : void 0,
                                        imageAssetId: (0, d.u)(e, "imageAssetId") ? e.imageAssetId : void 0,
                                        isFirstParty: (0, d.u)(e, "isFirstParty") ? e.isFirstParty : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.permissionRequestValidatePermissionRequest = function(e, t) {
                return m(this, void 0, void 0, function() {
                    return v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.permissionRequestValidatePermissionRequestRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(d._)),
        en = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return h(t, e), t.prototype.scopeGetScopeConfigurationRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, o, r;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, void 0 !== e.returnBetaScopes && (n.returnBetaScopes = e.returnBetaScopes), o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/scope-configuration",
                                    schemaPath: "/v1/scope-configuration",
                                    method: "GET",
                                    headers: o,
                                    query: n
                                }, t)];
                            case 1:
                                return r = i.sent(), [2, new d.H(r, function(e) {
                                    return null == e ? e : {
                                        scopeTypes: e.scopeTypes.map(D),
                                        targetTypes: e.targetTypes.map(B),
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
                    return void 0 === e && (e = {}), v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.scopeGetScopeConfigurationRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.scopeGetScopesRaw = function(e, t) {
                return m(this, void 0, void 0, function() {
                    var n, o, r;
                    return v(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/scopes",
                                    schemaPath: "/v1/scopes",
                                    method: "GET",
                                    headers: o,
                                    query: n
                                }, t)];
                            case 1:
                                return r = i.sent(), [2, new d.H(r, function(e) {
                                    return null == e ? e : {
                                        scopes: e.scopes.map(L),
                                        scopeTypes: e.scopeTypes.map(N),
                                        targetTypes: e.targetTypes.map(W),
                                        targetParts: e.targetParts.map(H),
                                        products: e.products.map(_),
                                        operations: e.operations.map(O),
                                        oidcScopes: e.oidcScopes
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.scopeGetScopes = function() {
                return m(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), v(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.scopeGetScopesRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(d._);
    (function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        h(t, e), t.prototype.tokenGetTokenAuthorizationResourcesRaw = function(e, t) {
            return m(this, void 0, void 0, function() {
                var n, o, r, i;
                return v(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.token || void 0 === e.token) throw new d.w("token", "Required parameter requestParameters.token was null or undefined when calling tokenGetTokenAuthorizationResources.");
                            return n = {}, o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), (0, d.I)([{
                                contentType: "application/x-www-form-urlencoded"
                            }]), r = new URLSearchParams, void 0 !== e.token && r.append("token", e.token), void 0 !== e.clientId && r.append("client_id", e.clientId), void 0 !== e.clientSecret && r.append("client_secret", e.clientSecret), [4, this.request({
                                path: "/v1/token/resources",
                                schemaPath: "/v1/token/resources",
                                method: "POST",
                                headers: o,
                                query: n,
                                body: r
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new d.H(i, function(e) {
                                return z(e)
                            })]
                    }
                })
            })
        }, t.prototype.tokenGetTokenAuthorizationResources = function(e, t) {
            return m(this, void 0, void 0, function() {
                return v(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.tokenGetTokenAuthorizationResourcesRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.tokenIntrospectTokenRaw = function(e, t) {
            return m(this, void 0, void 0, function() {
                var n, o, r, i;
                return v(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.token || void 0 === e.token) throw new d.w("token", "Required parameter requestParameters.token was null or undefined when calling tokenIntrospectToken.");
                            return n = {}, o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), (0, d.I)([{
                                contentType: "application/x-www-form-urlencoded"
                            }]), r = new URLSearchParams, void 0 !== e.token && r.append("token", e.token), void 0 !== e.clientId && r.append("client_id", e.clientId), void 0 !== e.clientSecret && r.append("client_secret", e.clientSecret), [4, this.request({
                                path: "/v1/token/introspect",
                                schemaPath: "/v1/token/introspect",
                                method: "POST",
                                headers: o,
                                query: n,
                                body: r
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new d.H(i, function(e) {
                                return null == e ? e : {
                                    active: e.active,
                                    jti: (0, d.u)(e, "jti") ? e.jti : void 0,
                                    iss: (0, d.u)(e, "iss") ? e.iss : void 0,
                                    tokenType: (0, d.u)(e, "token_type") ? e.token_type : void 0,
                                    clientId: (0, d.u)(e, "client_id") ? e.client_id : void 0,
                                    aud: (0, d.u)(e, "aud") ? e.aud : void 0,
                                    sub: (0, d.u)(e, "sub") ? e.sub : void 0,
                                    scope: (0, d.u)(e, "scope") ? e.scope : void 0,
                                    exp: (0, d.u)(e, "exp") ? e.exp : void 0,
                                    iat: (0, d.u)(e, "iat") ? e.iat : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.tokenIntrospectToken = function(e, t) {
            return m(this, void 0, void 0, function() {
                return v(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.tokenIntrospectTokenRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.tokenRevokeTokenRaw = function(e, t) {
            return m(this, void 0, void 0, function() {
                var n, o, r, i;
                return v(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.token || void 0 === e.token) throw new d.w("token", "Required parameter requestParameters.token was null or undefined when calling tokenRevokeToken.");
                            return n = {}, o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), (0, d.I)([{
                                contentType: "application/x-www-form-urlencoded"
                            }]), r = new URLSearchParams, void 0 !== e.token && r.append("token", e.token), void 0 !== e.clientId && r.append("client_id", e.clientId), void 0 !== e.clientSecret && r.append("client_secret", e.clientSecret), [4, this.request({
                                path: "/v1/token/revoke",
                                schemaPath: "/v1/token/revoke",
                                method: "POST",
                                headers: o,
                                query: n,
                                body: r
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new d.V(i)]
                    }
                })
            })
        }, t.prototype.tokenRevokeToken = function(e, t) {
            return m(this, void 0, void 0, function() {
                return v(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.tokenRevokeTokenRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, t.prototype.tokenUseAuthorizationGrantRaw = function(e, t) {
            return m(this, void 0, void 0, function() {
                var n, o, r, i;
                return v(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.grantType || void 0 === e.grantType) throw new d.w("grantType", "Required parameter requestParameters.grantType was null or undefined when calling tokenUseAuthorizationGrant.");
                            return n = {}, o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), (0, d.I)([{
                                contentType: "application/x-www-form-urlencoded"
                            }]), r = new URLSearchParams, void 0 !== e.grantType && r.append("grant_type", e.grantType), void 0 !== e.code && r.append("code", e.code), void 0 !== e.codeVerifier && r.append("code_verifier", e.codeVerifier), void 0 !== e.refreshToken && r.append("refresh_token", e.refreshToken), void 0 !== e.clientId && r.append("client_id", e.clientId), void 0 !== e.clientSecret && r.append("client_secret", e.clientSecret), [4, this.request({
                                path: "/v1/token",
                                schemaPath: "/v1/token",
                                method: "POST",
                                headers: o,
                                query: n,
                                body: r
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new d.H(i, function(e) {
                                return null == e ? e : {
                                    accessToken: e.access_token,
                                    refreshToken: (0, d.u)(e, "refresh_token") ? e.refresh_token : void 0,
                                    tokenType: e.token_type,
                                    expiresIn: e.expires_in,
                                    idToken: (0, d.u)(e, "id_token") ? e.id_token : void 0,
                                    scope: (0, d.u)(e, "scope") ? e.scope : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.tokenUseAuthorizationGrant = function(e, t) {
            return m(this, void 0, void 0, function() {
                return v(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.tokenUseAuthorizationGrantRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    })(d._),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        h(t, e), t.prototype.userInfoGetUserInfoRaw = function(e, t) {
            return m(this, void 0, void 0, function() {
                var n, o, r;
                return v(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/userinfo",
                                schemaPath: "/v1/userinfo",
                                method: "GET",
                                headers: o,
                                query: n
                            }, t)];
                        case 1:
                            return r = i.sent(), [2, new d.H(r, function(e) {
                                return null == e ? e : {
                                    sub: e.sub,
                                    name: (0, d.u)(e, "name") ? e.name : void 0,
                                    nickname: (0, d.u)(e, "nickname") ? e.nickname : void 0,
                                    preferredUsername: (0, d.u)(e, "preferred_username") ? e.preferred_username : void 0,
                                    createdAt: (0, d.u)(e, "created_at") ? e.created_at : void 0,
                                    profile: (0, d.u)(e, "profile") ? e.profile : void 0,
                                    picture: (0, d.u)(e, "picture") ? e.picture : void 0,
                                    email: (0, d.u)(e, "email") ? e.email : void 0,
                                    emailVerified: (0, d.u)(e, "email_verified") ? e.email_verified : void 0,
                                    verified: (0, d.u)(e, "verified") ? e.verified : void 0,
                                    ageChecked: (0, d.u)(e, "age_checked") ? e.age_checked : void 0,
                                    ageBracket: (0, d.u)(e, "age_bracket") ? e.age_bracket : void 0,
                                    premium: (0, d.u)(e, "premium") ? e.premium : void 0,
                                    roles: (0, d.u)(e, "roles") ? e.roles : void 0,
                                    internalUser: (0, d.u)(e, "internal_user") ? e.internal_user : void 0,
                                    attributes: (0, d.u)(e, "attributes") ? e.attributes : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.userInfoGetUserInfo = function() {
            return m(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), v(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.userInfoGetUserInfoRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(d._), e.s(["E", 0, Q, "o", 0, {
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
    }, "d", 0, Z, "I", 0, ee, "f", 0, et, "l", 0, en], 532308);
    let eo = (0, n.createContext)(null);
    eo.displayName = "StudioResources";
    let er = (0, r.f)()(() => ({
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
                translations: o
            } = e, {
                classes: {
                    studioIcon: r,
                    dialogText: l
                }
            } = er();
            return n.default.createElement(n.default.Fragment, null, n.default.createElement(i.f, {
                container: !0,
                "data-testid": "studio-dialog-loading",
                direction: "column",
                alignItems: "center"
            }, n.default.createElement("img", {
                width: 64,
                className: r,
                src: t,
                alt: "studio logo"
            }), n.default.createElement(a.f, {
                classes: {
                    root: l
                },
                variant: "body1",
                color: "secondary"
            }, o["Message.CheckingStudio"])), n.default.createElement(s.f, {
                title: "progress bar"
            }))
        },
        es = e => {
            let {
                logoSrc: t,
                translations: o,
                onClose: r
            } = e, {
                classes: {
                    closeIcon: s,
                    studioIcon: u,
                    dialogText: p
                }
            } = er();
            return n.default.createElement(i.f, {
                container: !0,
                "data-testid": "studio-dialog-error",
                direction: "column",
                alignItems: "center"
            }, n.default.createElement(l.f, {
                className: s,
                color: "secondary",
                "aria-label": "close",
                onClick: r,
                size: "large"
            }, n.default.createElement(c.f, null)), n.default.createElement("img", {
                width: 64,
                className: u,
                src: t,
                alt: "studio logo"
            }), n.default.createElement(a.f, {
                classes: {
                    root: p
                },
                variant: "body1",
                color: "secondary"
            }, o["Message.OpenStudioError"]))
        },
        el = e => {
            let {
                downloadUrl: t,
                logoSrc: o,
                translations: r,
                onClose: s,
                onDownload: p
            } = e, {
                classes: {
                    closeIcon: d,
                    studioIcon: f,
                    dialogText: h
                }
            } = er();
            return n.default.createElement(i.f, {
                container: !0,
                "data-testid": "studio-dialog-download",
                direction: "column",
                alignItems: "center"
            }, n.default.createElement(l.f, {
                className: d,
                color: "secondary",
                "aria-label": "close",
                onClick: s,
                size: "large"
            }, n.default.createElement(c.f, null)), n.default.createElement("img", {
                width: 64,
                className: f,
                src: o,
                alt: "studio logo"
            }), n.default.createElement(a.f, {
                classes: {
                    root: h
                },
                variant: "body1",
                color: "secondary"
            }, r["Message.StartYourCreation"]), n.default.createElement(u.f, {
                "data-testid": "cancel-studio-dialog-button",
                variant: "contained",
                onClick: () => {
                    p(), window.open(t, "_blank")
                },
                "aria-label": r["Action.DownloadStudio"]
            }, r["Action.DownloadStudio"]))
        };
    let ec = "sitetest1",
        eu = "sitetest2",
        ep = "sitetest3",
        ed = "production",
        ef = "luobu";
    var eh = ((ei = {}).Default = "Default", ei.ReturnFromLogin = "ReturnFromLogin", ei.EditPlace = "EditPlace", ei.EditPlaceRevision = "EditPlaceRevision", ei.ViewAsset = "ViewAsset", ei);
    let em = async (e, t, n) => {
        let o = "".concat(e, "/product-experimentation-platform/v1/projects/1/layers/").concat(t, "/values?parameters=").concat(n);
        return (await fetch(o, {
            headers: {
                "Content-Type": "application/json"
            },
            credentials: "include"
        })).json()
    }, ev = async e => {
        var t, n, r, i, a;
        let s = (0, o.W)();
        if (s === o.o.macOS) {
            let o = await em(e, "CreatorHubStudioInMac", "enablePersonalizedInstallerInMac,enablePersonalizedStudioLaunchInMac");
            return {
                enablePersonalizedInstaller: !1,
                enableDummyCodeInInstaller: !1,
                enablePersonalizedInstallerInMac: null != (t = o.enablePersonalizedInstallerInMac) && t,
                enablePersonalizedStudioLaunch: !1,
                enablePersonalizedStudioLaunchInMac: null != (n = o.enablePersonalizedStudioLaunchInMac) && n
            }
        }
        if (s === o.o.Windows) {
            let t = await em(e, "CreatorHubStudio", "enableDummyCodeInInstaller,enablePersonalizedInstaller,enablePersonalizedStudioLaunch");
            return {
                enablePersonalizedInstaller: null != (r = t.enablePersonalizedInstaller) && r,
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
        let n = "";
        return t.forEach(e => {
            n += String.fromCharCode(e)
        }), btoa(n)
    }
    let ew = async e => {
        let {
            clientId: t,
            bedev2BasePath: n
        } = e, o = new et(new d.x({
            basePath: "".concat(n, "/oauth"),
            credentials: "include",
            enableMrRouter: !0
        })), r = eg(64);
        try {
            let e = await ey(n);
            if (null == e ? void 0 : e.enableDummyCodeInInstaller) return eg(33).replaceAll("+", "-").replaceAll("/", "_").replace(/=+$/, "");
            if (!e || !e.enablePersonalizedInstaller && !e.enablePersonalizedInstallerInMac || "function" != typeof o.permissionRequestCreateMagicAuthorizationGrant) return;
            return (await o.permissionRequestCreateMagicAuthorizationGrant({
                permissionRequestCreateMagicAuthorizationGrantRequest: {
                    clientId: t,
                    scopes: eb,
                    nonce: r
                }
            })).code
        } catch (e) {
            return
        }
    }, eA = [{
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
    }], ex = async (e, t) => {
        let {
            clientId: n,
            bedev2BasePath: o
        } = e, r, i, a, s = new et(new d.x({
            basePath: "".concat(o, "/oauth"),
            credentials: "include",
            enableMrRouter: !0
        })), l = (i = new Uint8Array(64), globalThis.crypto.getRandomValues(i), a = "", i.forEach(e => {
            a += String.fromCharCode(e)
        }), btoa(a));
        try {
            r = await ey(o)
        } catch (e) {
            return
        }
        if (r && (r.enablePersonalizedStudioLaunch || r.enablePersonalizedStudioLaunchInMac) && "permissionRequestCreateMagicAuthorizationGrant" in s && "function" == typeof s.permissionRequestCreateMagicAuthorizationGrant) try {
            return (await s.permissionRequestCreateMagicAuthorizationGrant({
                permissionRequestCreateMagicAuthorizationGrantRequest: {
                    clientId: n,
                    scopes: eA,
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
            let e = (0, o.M)("RBXEventTrackerV2") || (0, o.M)("RBXEventTracker");
            if (e) {
                let t = e.match(/browserid=([^&]*)/i);
                if (t) return t[1] || ""
            }
            return ""
        })()), "robloxLocale:".concat(e.locale), "gameLocale:".concat(e.locale), "channel:".concat(e.channel), "browser:".concat(o.E.getCurrentBrowser()), "userId:".concat(e.userId), "distributorType:".concat(e.distributorType)];
        return void 0 !== e.authCode && "" !== e.authCode && t.push("authCode:".concat(e.authCode), "authCodeType:magic"), void 0 !== e.baseUrl && t.push("baseUrl:".concat(encodeURIComponent(e.baseUrl))), e.task === eh.ViewAsset ? (t.push("launchmode:asset"), t.push("assetid:".concat(e.assetId))) : (t.push("launchmode:edit"), e.task === eh.EditPlace && (t.push("task:".concat(e.task), "placeId:".concat(e.placeId), "universeId:".concat(e.universeId)), e.adPlacementId && (t.push("adPlacementId:".concat(e.adPlacementId)), e.referrerId && t.push("referrerId:".concat(e.referrerId)))), e.task === eh.EditPlaceRevision && (t.push("task:".concat(e.task), "placeId:".concat(e.placeId), "universeId:".concat(e.universeId), "placeversion:".concat(e.placeVersion)), e.scriptUniqueId && t.push("openscriptfromid:".concat(e.scriptUniqueId)), e.scriptPath && t.push("openscriptpath:".concat(e.scriptPath)), null != e.startLine && null != e.endLine && t.push("startline:".concat(e.startLine), "endline:".concat(e.endLine)), null != e.startCharacter && null != e.endCharacter && t.push("startcharacter:".concat(e.startCharacter), "endcharacter:".concat(e.endCharacter))), (e.task === eh.Default || e.task === eh.ReturnFromLogin) && t.push("task:".concat(e.task))), t.join("+")
    }, eI = (0, r.f)()(e => ({
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
        ek = "https://setup.c.robloxdev.cn",
        eC = "".concat(ek, "/cjv/RobloxStudioInstallerCJV.exe"),
        eT = "".concat(ek, "/mac/cjv/RobloxStudioCJV.dmg");
    e.s(["e", 0, eh, "S", 0, e => {
        let {
            resources: t,
            children: o
        } = e;
        return n.default.createElement(eo.Provider, {
            value: t
        }, o)
    }, "q", 0, function(e) {
        let {
            logoSrc: t,
            environment: n,
            target: r,
            fetchers: i,
            errorHandler: a
        } = e, s, l = r === ef ? eq[n] : eS[n];
        return {
            logoSrc: t,
            downloadURL: (s = (0, o.W)(), r === ef ? s === o.o.macOS ? eT : eC : n === ed ? "https://www.roblox.com/download/studio" : "https://www.".concat(n, ".robloxlabs.com/download/studio")),
            bedev2BasePath: n === ed ? "https://apis.roblox.com" : "https://apis.".concat(n, ".robloxlabs.com"),
            clientId: l,
            async fetchUserChannel() {
                let e = await i.userChannel();
                return void 0 === e || "LIVE" === e.toUpperCase() ? "" : e
            },
            onError(e, t) {
                null == a || a(e, t)
            }
        }
    }, "T", 0, (e, t) => {
        let r = (0, o.W)(),
            i = function() {
                let e = (0, n.useContext)(eo);
                if (null === e) throw Error("Cannot load required studio resources, please make sure the provider has been properly set up");
                return e
            }(),
            {
                classes: {
                    dialog: a
                }
            } = eI(),
            [s, l] = (0, n.useState)(),
            [c, u] = (0, n.useState)(),
            d = (0, n.useRef)(s),
            f = (0, n.useRef)(void 0),
            h = (0, n.useCallback)(async () => {
                let e = await ew(i);
                return void 0 === e ? i.downloadURL : "".concat(i.downloadURL, "?code=").concat(e)
            }, [i]),
            m = (0, n.useCallback)(async () => void 0 === c ? void 0 : eP(c), [c]),
            v = (0, n.useCallback)(e => {
                f.current = e
            }, []),
            y = (0, n.useCallback)(e => {
                d.current = e, l(e)
            }, []),
            b = (0, n.useRef)(t);
        (0, n.useEffect)(() => {
            b.current = t
        }, [t]);
        let g = (0, n.useCallback)(() => {
                var e, t;
                let n = f.current;
                v(void 0), y(void 0), void 0 !== n && (null == (t = b.current) || null == (e = t.close) || e.call(t, n))
            }, [v, y]),
            w = (0, n.useCallback)(() => {
                "Download" === d.current && g()
            }, [g]);
        (0, n.useEffect)(() => (window.addEventListener("blur", w), () => {
            window.removeEventListener("blur", w)
        }), [w]);
        let A = (0, n.useCallback)(async (e, n) => {
                let {
                    userId: o,
                    locale: r,
                    protocolScheme: a,
                    distributorType: s,
                    baseUrl: l
                } = n;
                try {
                    var c, p, d, f;
                    let n, h;
                    v(e), y("Loading"), null == t || null == (p = t.startAttempt) || p.call(t, e);
                    let [m, b, g] = await Promise.all([i.fetchUserChannel(), ew(i), ex(i, t => i.onError(t, e))]);
                    u(b);
                    let w = {
                            userId: null != (c = null == o ? void 0 : o.toString()) ? c : "",
                            locale: r,
                            protocolScheme: a,
                            distributorType: s,
                            baseUrl: l,
                            channel: m,
                            authCode: g
                        },
                        A = "";
                    switch (e.task) {
                        case eh.EditPlace:
                            A = eR({
                                ...w,
                                task: e.task,
                                universeId: e.universeId,
                                placeId: e.placeId,
                                adPlacementId: e.adPlacementId,
                                referrerId: e.referrerId
                            });
                            break;
                        case eh.EditPlaceRevision:
                            A = eR({
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
                            A = eR({
                                ...w,
                                task: e.task,
                                assetId: e.assetId
                            });
                            break;
                        case eh.Default:
                        case eh.ReturnFromLogin:
                            A = eR({
                                ...w,
                                task: e.task
                            })
                    }
                    f = A, (n = document.querySelector('[data-testid="studio-protocol-iframe"]')) && n.remove(), (h = document.createElement("iframe")).style.display = "none", h.src = f, h.setAttribute("data-testid", "studio-protocol-iframe"), document.body.appendChild(h);
                    let x = void 0 !== g && "" !== g,
                        R = x ? await eP(g).catch(() => "hash_failed") : void 0;
                    null == t || null == (d = t.startSuccess) || d.call(t, e, {
                        hasAuthCode: x,
                        authCodeHash: R
                    }), await new Promise(e => {
                        setTimeout(e, 3e3)
                    }), y("Download")
                } catch (t) {
                    y("Error"), i.onError(t instanceof Error ? t : Error(String(t)), e)
                }
            }, [t, v, y, i]),
            x = void 0 === c ? i.downloadURL : "".concat(i.downloadURL, "?code=").concat(c);
        return {
            open: A,
            dialog: (0, n.useMemo)(() => n.default.createElement(p.f, {
                classes: {
                    paper: a
                },
                maxWidth: "XSmall",
                open: void 0 !== s
            }, "Loading" === s && n.default.createElement(ea, {
                logoSrc: i.logoSrc,
                translations: e
            }), "Error" === s && n.default.createElement(es, {
                onClose: g,
                logoSrc: i.logoSrc,
                translations: e
            }), "Download" === s && n.default.createElement(el, {
                onClose: g,
                onDownload: () => {
                    var e;
                    void 0 !== f.current && (null == t || null == (e = t.download) || e.call(t, f.current, {
                        getDownloadCode: m
                    }))
                },
                downloadUrl: x,
                logoSrc: i.logoSrc,
                translations: e
            })), [g, a, s, m, x, t, i.logoSrc, e]),
            isCompatible: r === o.o.Windows || r === o.o.macOS,
            getStudioDownloadUrlAsync: h
        }
    }], 581577)
}]);

//# debugId=8f771108-70c7-b57a-40ac-764d9bb89d01
//# sourceMappingURL=0da84uv39s58e.js.map