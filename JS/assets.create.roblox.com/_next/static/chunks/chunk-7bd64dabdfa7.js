;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "d057bdbb-dbef-e5cd-7836-4f47c81d0c87")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 714724, e => {
    "use strict";
    var t = new WeakMap,
        n = new WeakMap,
        r = {},
        o = 0,
        i = function(e) {
            return e && (e.host || i(e.parentNode))
        },
        a = function(e, a, u, c) {
            var l = (Array.isArray(e) ? e : [e]).map(function(e) {
                if (a.contains(e)) return e;
                var t = i(e);
                return t && a.contains(t) ? t : (console.error("aria-hidden", e, "in not contained inside", a, ". Doing nothing"), null)
            }).filter(function(e) {
                return !!e
            });
            r[u] || (r[u] = new WeakMap);
            var s = r[u],
                d = [],
                f = new Set,
                v = new Set(l),
                p = function(e) {
                    !e || f.has(e) || (f.add(e), p(e.parentNode))
                };
            l.forEach(p);
            var m = function(e) {
                !e || v.has(e) || Array.prototype.forEach.call(e.children, function(e) {
                    if (f.has(e)) m(e);
                    else try {
                        var r = e.getAttribute(c),
                            o = null !== r && "false" !== r,
                            i = (t.get(e) || 0) + 1,
                            a = (s.get(e) || 0) + 1;
                        t.set(e, i), s.set(e, a), d.push(e), 1 === i && o && n.set(e, !0), 1 === a && e.setAttribute(u, "true"), o || e.setAttribute(c, "true")
                    } catch (t) {
                        console.error("aria-hidden: cannot operate on ", e, t)
                    }
                })
            };
            return m(a), f.clear(), o++,
                function() {
                    d.forEach(function(e) {
                        var r = t.get(e) - 1,
                            o = s.get(e) - 1;
                        t.set(e, r), s.set(e, o), r || (n.has(e) || e.removeAttribute(c), n.delete(e)), o || e.removeAttribute(u)
                    }), --o || (t = new WeakMap, t = new WeakMap, n = new WeakMap, r = {})
                }
        };
    e.s(["f", 0, function(e, t, n) {
        void 0 === n && (n = "data-aria-hidden");
        var r = Array.from(Array.isArray(e) ? e : [e]),
            o = t || ("u" < typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
        return o ? (r.push.apply(r, Array.from(o.querySelectorAll("[aria-live], script"))), a(r, o, n, "aria-hidden")) : function() {
            return null
        }
    }])
}, 633089, e => {
    "use strict";
    var t, n, r, o, i, a, u, c = function() {
        return (c = Object.assign || function(e) {
            for (var t, n = 1, r = arguments.length; n < r; n++)
                for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
            return e
        }).apply(this, arguments)
    };

    function l(e, t) {
        var n = {};
        for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && 0 > t.indexOf(r) && (n[r] = e[r]);
        if (null != e && "function" == typeof Object.getOwnPropertySymbols)
            for (var o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) 0 > t.indexOf(r[o]) && Object.prototype.propertyIsEnumerable.call(e, r[o]) && (n[r[o]] = e[r[o]]);
        return n
    }
    var s = ("function" == typeof SuppressedError && SuppressedError, e.i(643766)),
        d = "right-scroll-bar-position",
        f = "width-before-scroll-bar";

    function v(e, t) {
        return "function" == typeof e ? e(t) : e && (e.current = t), e
    }
    var p = "u" > typeof window ? s.useLayoutEffect : s.useEffect,
        m = new WeakMap,
        h = (void 0 === t && (t = {}), (void 0 === n && (n = function(e) {
            return e
        }), r = [], o = !1, i = {
            read: function() {
                if (o) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                return r.length ? r[r.length - 1] : null
            },
            useMedium: function(e) {
                var t = n(e, o);
                return r.push(t),
                    function() {
                        r = r.filter(function(e) {
                            return e !== t
                        })
                    }
            },
            assignSyncMedium: function(e) {
                for (o = !0; r.length;) {
                    var t = r;
                    r = [], t.forEach(e)
                }
                r = {
                    push: function(t) {
                        return e(t)
                    },
                    filter: function() {
                        return r
                    }
                }
            },
            assignMedium: function(e) {
                o = !0;
                var t = [];
                if (r.length) {
                    var n = r;
                    r = [], n.forEach(e), t = r
                }
                var i = function() {
                        var n = t;
                        t = [], n.forEach(e)
                    },
                    a = function() {
                        return Promise.resolve().then(i)
                    };
                a(), r = {
                    push: function(e) {
                        t.push(e), a()
                    },
                    filter: function(e) {
                        return t = t.filter(e), r
                    }
                }
            }
        }).options = c({
            async: !0,
            ssr: !1
        }, t), i),
        y = function() {},
        g = s.forwardRef(function(e, t) {
            var n, r, o, i, a = s.useRef(null),
                u = s.useState({
                    onScrollCapture: y,
                    onWheelCapture: y,
                    onTouchMoveCapture: y
                }),
                d = u[0],
                f = u[1],
                g = e.forwardProps,
                E = e.children,
                b = e.className,
                w = e.removeScrollBar,
                N = e.enabled,
                C = e.shards,
                S = e.sideCar,
                T = e.noRelative,
                R = e.noIsolation,
                O = e.inert,
                L = e.allowPinchZoom,
                P = e.as,
                M = e.gapMode,
                A = l(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                x = (n = [a, t], r = function(e) {
                    return n.forEach(function(t) {
                        return v(t, e)
                    })
                }, (o = (0, s.useState)(function() {
                    return {
                        value: null,
                        callback: r,
                        facade: {
                            get current() {
                                return o.value
                            },
                            set current(e) {
                                var t = o.value;
                                t !== e && (o.value = e, o.callback(e, t))
                            }
                        }
                    }
                })[0]).callback = r, i = o.facade, p(function() {
                    var e = m.get(i);
                    if (e) {
                        var t = new Set(e),
                            r = new Set(n),
                            o = i.current;
                        t.forEach(function(e) {
                            r.has(e) || v(e, null)
                        }), r.forEach(function(e) {
                            t.has(e) || v(e, o)
                        })
                    }
                    m.set(i, n)
                }, [n]), i),
                k = c(c({}, A), d);
            return s.createElement(s.Fragment, null, N && s.createElement(S, {
                sideCar: h,
                removeScrollBar: w,
                shards: C,
                noRelative: T,
                noIsolation: R,
                inert: O,
                setCallbacks: f,
                allowPinchZoom: !!L,
                lockRef: a,
                gapMode: M
            }), g ? s.cloneElement(s.Children.only(E), c(c({}, k), {
                ref: x
            })) : s.createElement(void 0 === P ? "div" : P, c({}, k, {
                className: b,
                ref: x
            }), E))
        });
    g.defaultProps = {
        enabled: !0,
        removeScrollBar: !0,
        inert: !1
    }, g.classNames = {
        fullWidth: f,
        zeroRight: d
    };
    var E = function(e) {
        var t = e.sideCar,
            n = l(e, ["sideCar"]);
        if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
        var r = t.read();
        if (!r) throw Error("Sidecar medium not found");
        return s.createElement(r, c({}, n))
    };
    E.isSideCarExport = !0;
    var b = function() {
            var e = 0,
                t = null;
            return {
                add: function(n) {
                    if (0 == e && (t = function() {
                            if (!document) return null;
                            var e = document.createElement("style");
                            e.type = "text/css";
                            var t = u || ("u" > typeof __webpack_nonce__ ? __webpack_nonce__ : void 0);
                            return t && e.setAttribute("nonce", t), e
                        }())) {
                        var r, o;
                        (r = t).styleSheet ? r.styleSheet.cssText = n : r.appendChild(document.createTextNode(n)), o = t, (document.head || document.getElementsByTagName("head")[0]).appendChild(o)
                    }
                    e++
                },
                remove: function() {
                    --e || !t || (t.parentNode && t.parentNode.removeChild(t), t = null)
                }
            }
        },
        w = function() {
            var e = b();
            return function(t, n) {
                s.useEffect(function() {
                    return e.add(t),
                        function() {
                            e.remove()
                        }
                }, [t && n])
            }
        },
        N = function() {
            var e = w();
            return function(t) {
                return e(t.styles, t.dynamic), null
            }
        },
        C = {
            left: 0,
            top: 0,
            right: 0,
            gap: 0
        },
        S = function(e) {
            return parseInt(e || "", 10) || 0
        },
        T = function(e) {
            var t = window.getComputedStyle(document.body),
                n = t["padding" === e ? "paddingLeft" : "marginLeft"],
                r = t["padding" === e ? "paddingTop" : "marginTop"],
                o = t["padding" === e ? "paddingRight" : "marginRight"];
            return [S(n), S(r), S(o)]
        },
        R = function(e) {
            if (void 0 === e && (e = "margin"), "u" < typeof window) return C;
            var t = T(e),
                n = document.documentElement.clientWidth,
                r = window.innerWidth;
            return {
                left: t[0],
                top: t[1],
                right: t[2],
                gap: Math.max(0, r - n + t[2] - t[0])
            }
        },
        O = N(),
        L = "data-scroll-locked",
        P = function(e, t, n, r) {
            var o = e.left,
                i = e.top,
                a = e.right,
                u = e.gap;
            return void 0 === n && (n = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(r, ";\n   padding-right: ").concat(u, "px ").concat(r, ";\n  }\n  body[").concat(L, "] {\n    overflow: hidden ").concat(r, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(r, ";"), "margin" === n && "\n    padding-left: ".concat(o, "px;\n    padding-top: ").concat(i, "px;\n    padding-right: ").concat(a, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(u, "px ").concat(r, ";\n    "), "padding" === n && "padding-right: ".concat(u, "px ").concat(r, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(d, " {\n    right: ").concat(u, "px ").concat(r, ";\n  }\n  \n  .").concat(f, " {\n    margin-right: ").concat(u, "px ").concat(r, ";\n  }\n  \n  .").concat(d, " .").concat(d, " {\n    right: 0 ").concat(r, ";\n  }\n  \n  .").concat(f, " .").concat(f, " {\n    margin-right: 0 ").concat(r, ";\n  }\n  \n  body[").concat(L, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(u, "px;\n  }\n")
        },
        M = function() {
            var e = parseInt(document.body.getAttribute(L) || "0", 10);
            return isFinite(e) ? e : 0
        },
        A = function() {
            s.useEffect(function() {
                return document.body.setAttribute(L, (M() + 1).toString()),
                    function() {
                        var e = M() - 1;
                        e <= 0 ? document.body.removeAttribute(L) : document.body.setAttribute(L, e.toString())
                    }
            }, [])
        },
        x = function(e) {
            var t = e.noRelative,
                n = e.noImportant,
                r = e.gapMode,
                o = void 0 === r ? "margin" : r;
            A();
            var i = s.useMemo(function() {
                return R(o)
            }, [o]);
            return s.createElement(O, {
                styles: P(i, !t, o, n ? "" : "!important")
            })
        },
        k = !1;
    if ("u" > typeof window) try {
        var D = Object.defineProperty({}, "passive", {
            get: function() {
                return k = !0, !0
            }
        });
        window.addEventListener("test", D, D), window.removeEventListener("test", D, D)
    } catch (e) {
        k = !1
    }
    var j = !!k && {
            passive: !1
        },
        I = function(e, t) {
            if (!(e instanceof Element)) return !1;
            var n = window.getComputedStyle(e);
            return "hidden" !== n[t] && (n.overflowY !== n.overflowX || "TEXTAREA" === e.tagName || "visible" !== n[t])
        },
        W = function(e, t) {
            var n = t.ownerDocument,
                r = t;
            do {
                if ("u" > typeof ShadowRoot && r instanceof ShadowRoot && (r = r.host), _(e, r)) {
                    var o = F(e, r);
                    if (o[1] > o[2]) return !0
                }
                r = r.parentNode
            } while (r && r !== n.body) return !1
        },
        _ = function(e, t) {
            return "v" === e ? I(t, "overflowY") : I(t, "overflowX")
        },
        F = function(e, t) {
            return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
        },
        B = function(e, t, n, r, o) {
            var i, a = (i = window.getComputedStyle(t).direction, "h" === e && "rtl" === i ? -1 : 1),
                u = a * r,
                c = n.target,
                l = t.contains(c),
                s = !1,
                d = u > 0,
                f = 0,
                v = 0;
            do {
                if (!c) break;
                var p = F(e, c),
                    m = p[0],
                    h = p[1] - p[2] - a * m;
                (m || h) && _(e, c) && (f += h, v += m);
                var y = c.parentNode;
                c = y && y.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? y.host : y
            } while (!l && c !== document.body || l && (t.contains(c) || t === c)) return d && (o && 1 > Math.abs(f) || !o && u > f) ? s = !0 : !d && (o && 1 > Math.abs(v) || !o && -u > v) && (s = !0), s
        },
        U = function(e) {
            return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
        },
        K = function(e) {
            return [e.deltaX, e.deltaY]
        },
        V = function(e) {
            return e && "current" in e ? e.current : e
        },
        X = 0,
        Y = [];
    let z = (a = function(e) {
        var t = s.useRef([]),
            n = s.useRef([0, 0]),
            r = s.useRef(),
            o = s.useState(X++)[0],
            i = s.useState(N)[0],
            a = s.useRef(e);
        s.useEffect(function() {
            a.current = e
        }, [e]), s.useEffect(function() {
            if (e.inert) {
                document.body.classList.add("block-interactivity-".concat(o));
                var t = (function(e, t, n) {
                    if (n || 2 == arguments.length)
                        for (var r, o = 0, i = t.length; o < i; o++) !r && o in t || (r || (r = Array.prototype.slice.call(t, 0, o)), r[o] = t[o]);
                    return e.concat(r || Array.prototype.slice.call(t))
                })([e.lockRef.current], (e.shards || []).map(V), !0).filter(Boolean);
                return t.forEach(function(e) {
                        return e.classList.add("allow-interactivity-".concat(o))
                    }),
                    function() {
                        document.body.classList.remove("block-interactivity-".concat(o)), t.forEach(function(e) {
                            return e.classList.remove("allow-interactivity-".concat(o))
                        })
                    }
            }
        }, [e.inert, e.lockRef.current, e.shards]);
        var u = s.useCallback(function(e, t) {
                if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !a.current.allowPinchZoom;
                var o, i = U(e),
                    u = n.current,
                    c = "deltaX" in e ? e.deltaX : u[0] - i[0],
                    l = "deltaY" in e ? e.deltaY : u[1] - i[1],
                    s = e.target,
                    d = Math.abs(c) > Math.abs(l) ? "h" : "v";
                if ("touches" in e && "h" === d && "range" === s.type) return !1;
                var f = window.getSelection(),
                    v = f && f.anchorNode;
                if (v && (v === s || v.contains(s))) return !1;
                var p = W(d, s);
                if (!p) return !0;
                if (p ? o = d : (o = "v" === d ? "h" : "v", p = W(d, s)), !p) return !1;
                if (!r.current && "changedTouches" in e && (c || l) && (r.current = o), !o) return !0;
                var m = r.current || o;
                return B(m, t, e, "h" === m ? c : l, !0)
            }, []),
            c = s.useCallback(function(e) {
                if (Y.length && Y[Y.length - 1] === i) {
                    var n = "deltaY" in e ? K(e) : U(e),
                        r = t.current.filter(function(t) {
                            var r;
                            return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (r = t.delta, r[0] === n[0] && r[1] === n[1])
                        })[0];
                    if (r && r.should) {
                        e.cancelable && e.preventDefault();
                        return
                    }
                    if (!r) {
                        var o = (a.current.shards || []).map(V).filter(Boolean).filter(function(t) {
                            return t.contains(e.target)
                        });
                        (o.length > 0 ? u(e, o[0]) : !a.current.noIsolation) && e.cancelable && e.preventDefault()
                    }
                }
            }, []),
            l = s.useCallback(function(e, n, r, o) {
                var i = {
                    name: e,
                    delta: n,
                    target: r,
                    should: o,
                    shadowParent: function(e) {
                        for (var t = null; null !== e;) e instanceof ShadowRoot && (t = e.host, e = e.host), e = e.parentNode;
                        return t
                    }(r)
                };
                t.current.push(i), setTimeout(function() {
                    t.current = t.current.filter(function(e) {
                        return e !== i
                    })
                }, 1)
            }, []),
            d = s.useCallback(function(e) {
                n.current = U(e), r.current = void 0
            }, []),
            f = s.useCallback(function(t) {
                l(t.type, K(t), t.target, u(t, e.lockRef.current))
            }, []),
            v = s.useCallback(function(t) {
                l(t.type, U(t), t.target, u(t, e.lockRef.current))
            }, []);
        s.useEffect(function() {
            return Y.push(i), e.setCallbacks({
                    onScrollCapture: f,
                    onWheelCapture: f,
                    onTouchMoveCapture: v
                }), document.addEventListener("wheel", c, j), document.addEventListener("touchmove", c, j), document.addEventListener("touchstart", d, j),
                function() {
                    Y = Y.filter(function(e) {
                        return e !== i
                    }), document.removeEventListener("wheel", c, j), document.removeEventListener("touchmove", c, j), document.removeEventListener("touchstart", d, j)
                }
        }, []);
        var p = e.removeScrollBar,
            m = e.inert;
        return s.createElement(s.Fragment, null, m ? s.createElement(i, {
            styles: "\n  .block-interactivity-".concat(o, " {pointer-events: none;}\n  .allow-interactivity-").concat(o, " {pointer-events: all;}\n")
        }) : null, p ? s.createElement(x, {
            noRelative: e.noRelative,
            gapMode: e.gapMode
        }) : null)
    }, h.useMedium(a), E);
    var Z = s.forwardRef(function(e, t) {
        return s.createElement(g, c({}, e, {
            ref: t,
            sideCar: z
        }))
    });
    Z.classNames = g.classNames, e.s(["f", 0, Z], 633089)
}, 7724, e => {
    "use strict";
    e.s(["f", 0, function(e, t) {
        let {
            checkForDefaultPrevented: n = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(r) {
            if (null == e || e(r), !1 === n || !r.defaultPrevented) return null == t ? void 0 : t(r)
        }
    }])
}, 859726, 206350, e => {
    "use strict";
    var t, n = e.i(643766),
        r = e.i(785517);
    e.s(["e", 0, function(e, t) {
        let o = n.createContext(t),
            i = e => {
                let {
                    children: t,
                    ...i
                } = e, a = n.useMemo(() => i, Object.values(i));
                return (0, r.jsx)(o.Provider, {
                    value: a,
                    children: t
                })
            };
        return i.displayName = e + "Provider", [i, function(r) {
            let i = n.useContext(o);
            if (i) return i;
            if (void 0 !== t) return t;
            throw Error("`".concat(r, "` must be used within `").concat(e, "`"))
        }]
    }, "c", 0, function(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
            o = [],
            i = () => {
                let t = o.map(e => n.createContext(e));
                return function(r) {
                    let o = (null == r ? void 0 : r[e]) || t;
                    return n.useMemo(() => ({
                        ["__scope".concat(e)]: {
                            ...r,
                            [e]: o
                        }
                    }), [r, o])
                }
            };
        return i.scopeName = e, [function(t, i) {
            let a = n.createContext(i),
                u = o.length;
            o = [...o, i];
            let c = t => {
                var o;
                let {
                    scope: i,
                    children: c,
                    ...l
                } = t, s = (null == i || null == (o = i[e]) ? void 0 : o[u]) || a, d = n.useMemo(() => l, Object.values(l));
                return (0, r.jsx)(s.Provider, {
                    value: d,
                    children: c
                })
            };
            return c.displayName = t + "Provider", [c, function(r, o) {
                var c;
                let l = (null == o || null == (c = o[e]) ? void 0 : c[u]) || a,
                    s = n.useContext(l);
                if (s) return s;
                if (void 0 !== i) return i;
                throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
            }]
        }, function() {
            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
            let o = t[0];
            if (1 === t.length) return o;
            let i = () => {
                let e = t.map(e => ({
                    useScope: e(),
                    scopeName: e.scopeName
                }));
                return function(t) {
                    let r = e.reduce((e, n) => {
                        let {
                            useScope: r,
                            scopeName: o
                        } = n, i = r(t)["__scope".concat(o)];
                        return {
                            ...e,
                            ...i
                        }
                    }, {});
                    return n.useMemo(() => ({
                        ["__scope".concat(o.scopeName)]: r
                    }), [r])
                }
            };
            return i.scopeName = o.scopeName, i
        }(i, ...t)]
    }], 859726);
    var o = (null == (t = globalThis) ? void 0 : t.document) ? n.useLayoutEffect : () => {};
    e.s(["f", 0, o], 206350)
}, 434378, e => {
    "use strict";
    var t, n = e.i(643766),
        r = e.i(7724),
        o = e.i(760869),
        i = e.i(120297),
        a = e.i(103649),
        u = e.i(785517),
        c = "dismissableLayer.update",
        l = n.createContext({
            layers: new Set,
            layersWithOutsidePointerEventsDisabled: new Set,
            branches: new Set
        }),
        s = n.forwardRef((e, s) => {
            var v, p;
            let {
                disableOutsidePointerEvents: m = !1,
                onEscapeKeyDown: h,
                onPointerDownOutside: y,
                onFocusOutside: g,
                onInteractOutside: E,
                onDismiss: b,
                ...w
            } = e, N = n.useContext(l), [C, S] = n.useState(null), T = null != (v = null == C ? void 0 : C.ownerDocument) ? v : null == (p = globalThis) ? void 0 : p.document, [, R] = n.useState({}), O = (0, i.j)(s, e => S(e)), L = Array.from(N.layers), [P] = [...N.layersWithOutsidePointerEventsDisabled].slice(-1), M = L.indexOf(P), A = C ? L.indexOf(C) : -1, x = N.layersWithOutsidePointerEventsDisabled.size > 0, k = A >= M, D = function(e) {
                var t;
                let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    o = (0, a.f)(e),
                    i = n.useRef(!1),
                    u = n.useRef(() => {});
                return n.useEffect(() => {
                    let e = e => {
                            if (e.target && !i.current) {
                                let t = function() {
                                        f("dismissableLayer.pointerDownOutside", o, n, {
                                            discrete: !0
                                        })
                                    },
                                    n = {
                                        originalEvent: e
                                    };
                                "touch" === e.pointerType ? (r.removeEventListener("click", u.current), u.current = t, r.addEventListener("click", u.current, {
                                    once: !0
                                })) : t()
                            } else r.removeEventListener("click", u.current);
                            i.current = !1
                        },
                        t = window.setTimeout(() => {
                            r.addEventListener("pointerdown", e)
                        }, 0);
                    return () => {
                        window.clearTimeout(t), r.removeEventListener("pointerdown", e), r.removeEventListener("click", u.current)
                    }
                }, [r, o]), {
                    onPointerDownCapture: () => i.current = !0
                }
            }(e => {
                let t = e.target,
                    n = [...N.branches].some(e => e.contains(t));
                k && !n && (null == y || y(e), null == E || E(e), e.defaultPrevented || null == b || b())
            }, T), j = function(e) {
                var t;
                let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    o = (0, a.f)(e),
                    i = n.useRef(!1);
                return n.useEffect(() => {
                    let e = e => {
                        e.target && !i.current && f("dismissableLayer.focusOutside", o, {
                            originalEvent: e
                        }, {
                            discrete: !1
                        })
                    };
                    return r.addEventListener("focusin", e), () => r.removeEventListener("focusin", e)
                }, [r, o]), {
                    onFocusCapture: () => i.current = !0,
                    onBlurCapture: () => i.current = !1
                }
            }(e => {
                let t = e.target;
                ![...N.branches].some(e => e.contains(t)) && (null == g || g(e), null == E || E(e), e.defaultPrevented || null == b || b())
            }, T);
            return ! function(e) {
                var t;
                let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (t = globalThis) ? void 0 : t.document,
                    o = (0, a.f)(e);
                n.useEffect(() => {
                    let e = e => {
                        "Escape" === e.key && o(e)
                    };
                    return r.addEventListener("keydown", e, {
                        capture: !0
                    }), () => r.removeEventListener("keydown", e, {
                        capture: !0
                    })
                }, [o, r])
            }(e => {
                A === N.layers.size - 1 && (null == h || h(e), !e.defaultPrevented && b && (e.preventDefault(), b()))
            }, T), n.useEffect(() => {
                if (C) return m && (0 === N.layersWithOutsidePointerEventsDisabled.size && (t = T.body.style.pointerEvents, T.body.style.pointerEvents = "none"), N.layersWithOutsidePointerEventsDisabled.add(C)), N.layers.add(C), d(), () => {
                    m && 1 === N.layersWithOutsidePointerEventsDisabled.size && (T.body.style.pointerEvents = t)
                }
            }, [C, T, m, N]), n.useEffect(() => () => {
                C && (N.layers.delete(C), N.layersWithOutsidePointerEventsDisabled.delete(C), d())
            }, [C, N]), n.useEffect(() => {
                let e = () => R({});
                return document.addEventListener(c, e), () => document.removeEventListener(c, e)
            }, []), (0, u.jsx)(o.V.div, {
                ...w,
                ref: O,
                style: {
                    pointerEvents: x ? k ? "auto" : "none" : void 0,
                    ...e.style
                },
                onFocusCapture: (0, r.f)(e.onFocusCapture, j.onFocusCapture),
                onBlurCapture: (0, r.f)(e.onBlurCapture, j.onBlurCapture),
                onPointerDownCapture: (0, r.f)(e.onPointerDownCapture, D.onPointerDownCapture)
            })
        });

    function d() {
        let e = new CustomEvent(c);
        document.dispatchEvent(e)
    }

    function f(e, t, n, r) {
        let {
            discrete: i
        } = r, a = n.originalEvent.target, u = new CustomEvent(e, {
            bubbles: !1,
            cancelable: !0,
            detail: n
        });
        t && a.addEventListener(e, t, {
            once: !0
        }), i ? (0, o.u)(a, u) : a.dispatchEvent(u)
    }
    s.displayName = "DismissableLayer", n.forwardRef((e, t) => {
        let r = n.useContext(l),
            a = n.useRef(null),
            c = (0, i.j)(t, a);
        return n.useEffect(() => {
            let e = a.current;
            if (e) return r.branches.add(e), () => {
                r.branches.delete(e)
            }
        }, [r.branches]), (0, u.jsx)(o.V.div, {
            ...e,
            ref: c
        })
    }).displayName = "DismissableLayerBranch", e.s(["f", 0, s], 434378)
}, 505953, e => {
    "use strict";
    var t = e.i(643766),
        n = 0;

    function r() {
        let e = document.createElement("span");
        return e.setAttribute("data-radix-focus-guard", ""), e.tabIndex = 0, e.style.outline = "none", e.style.opacity = "0", e.style.position = "fixed", e.style.pointerEvents = "none", e
    }
    e.s(["f", 0, function() {
        t.useEffect(() => {
            var e, t;
            let o = document.querySelectorAll("[data-radix-focus-guard]");
            return document.body.insertAdjacentElement("afterbegin", null != (e = o[0]) ? e : r()), document.body.insertAdjacentElement("beforeend", null != (t = o[1]) ? t : r()), n++, () => {
                1 === n && document.querySelectorAll("[data-radix-focus-guard]").forEach(e => e.remove()), n--
            }
        }, [])
    }])
}, 615951, e => {
    "use strict";
    let t;
    var n = e.i(643766),
        r = e.i(120297),
        o = e.i(760869),
        i = e.i(103649),
        a = e.i(785517),
        u = "focusScope.autoFocusOnMount",
        c = "focusScope.autoFocusOnUnmount",
        l = {
            bubbles: !1,
            cancelable: !0
        },
        s = n.forwardRef((e, t) => {
            let {
                loop: s = !1,
                trapped: m = !1,
                onMountAutoFocus: h,
                onUnmountAutoFocus: y,
                ...g
            } = e, [E, b] = n.useState(null), w = (0, i.f)(h), N = (0, i.f)(y), C = n.useRef(null), S = (0, r.j)(t, e => b(e)), T = n.useRef({
                paused: !1,
                pause() {
                    this.paused = !0
                },
                resume() {
                    this.paused = !1
                }
            }).current;
            n.useEffect(() => {
                if (m) {
                    let e = function(e) {
                            if (T.paused || !E) return;
                            let t = e.target;
                            E.contains(t) ? C.current = t : v(C.current, {
                                select: !0
                            })
                        },
                        t = function(e) {
                            if (T.paused || !E) return;
                            let t = e.relatedTarget;
                            null !== t && (E.contains(t) || v(C.current, {
                                select: !0
                            }))
                        };
                    document.addEventListener("focusin", e), document.addEventListener("focusout", t);
                    let n = new MutationObserver(function(e) {
                        if (document.activeElement === document.body)
                            for (let t of e) t.removedNodes.length > 0 && v(E)
                    });
                    return E && n.observe(E, {
                        childList: !0,
                        subtree: !0
                    }), () => {
                        document.removeEventListener("focusin", e), document.removeEventListener("focusout", t), n.disconnect()
                    }
                }
            }, [m, E, T.paused]), n.useEffect(() => {
                if (E) {
                    p.add(T);
                    let e = document.activeElement;
                    if (!E.contains(e)) {
                        let t = new CustomEvent(u, l);
                        E.addEventListener(u, w), E.dispatchEvent(t), t.defaultPrevented || (function(e) {
                            let {
                                select: t = !1
                            } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, n = document.activeElement;
                            for (let r of e)
                                if (v(r, {
                                        select: t
                                    }), document.activeElement !== n) return
                        }(d(E).filter(e => "A" !== e.tagName), {
                            select: !0
                        }), document.activeElement === e && v(E))
                    }
                    return () => {
                        E.removeEventListener(u, w), setTimeout(() => {
                            let t = new CustomEvent(c, l);
                            E.addEventListener(c, N), E.dispatchEvent(t), t.defaultPrevented || v(null != e ? e : document.body, {
                                select: !0
                            }), E.removeEventListener(c, N), p.remove(T)
                        }, 0)
                    }
                }
            }, [E, w, N, T]);
            let R = n.useCallback(e => {
                if (!s && !m || T.paused) return;
                let t = "Tab" === e.key && !e.altKey && !e.ctrlKey && !e.metaKey,
                    n = document.activeElement;
                if (t && n) {
                    var r;
                    let t, o = e.currentTarget,
                        [i, a] = [f(t = d(r = o), r), f(t.reverse(), r)];
                    i && a ? e.shiftKey || n !== a ? e.shiftKey && n === i && (e.preventDefault(), s && v(a, {
                        select: !0
                    })) : (e.preventDefault(), s && v(i, {
                        select: !0
                    })) : n === o && e.preventDefault()
                }
            }, [s, m, T.paused]);
            return (0, a.jsx)(o.V.div, {
                tabIndex: -1,
                ...g,
                ref: S,
                onKeyDown: R
            })
        });

    function d(e) {
        let t = [],
            n = document.createTreeWalker(e, NodeFilter.SHOW_ELEMENT, {
                acceptNode: e => {
                    let t = "INPUT" === e.tagName && "hidden" === e.type;
                    return e.disabled || e.hidden || t ? NodeFilter.FILTER_SKIP : e.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                }
            });
        for (; n.nextNode();) t.push(n.currentNode);
        return t
    }

    function f(e, t) {
        for (let n of e)
            if (! function(e, t) {
                    let {
                        upTo: n
                    } = t;
                    if ("hidden" === getComputedStyle(e).visibility) return !0;
                    for (; e && (void 0 === n || e !== n);) {
                        if ("none" === getComputedStyle(e).display) return !0;
                        e = e.parentElement
                    }
                    return !1
                }(n, {
                    upTo: t
                })) return n
    }

    function v(e) {
        let {
            select: t = !1
        } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        if (e && e.focus) {
            var n;
            let r = document.activeElement;
            e.focus({
                preventScroll: !0
            }), e !== r && (n = e) instanceof HTMLInputElement && "select" in n && t && e.select()
        }
    }
    s.displayName = "FocusScope";
    var p = (t = [], {
        add(e) {
            let n = t[0];
            e !== n && (null == n || n.pause()), (t = m(t, e)).unshift(e)
        },
        remove(e) {
            var n;
            null == (n = (t = m(t, e))[0]) || n.resume()
        }
    });

    function m(e, t) {
        let n = [...e],
            r = n.indexOf(t);
        return -1 !== r && n.splice(r, 1), n
    }
    e.s(["f", 0, s])
}, 257165, e => {
    "use strict";
    var t = e.i(643766),
        n = e.i(206350),
        r = t[" useId ".trim().toString()] || (() => void 0),
        o = 0;
    e.s(["f", 0, function(e) {
        let [i, a] = t.useState(r());
        return (0, n.f)(() => {
            e || a(e => null != e ? e : String(o++))
        }, [e]), e || (i ? "radix-".concat(i) : "")
    }])
}, 517365, e => {
    "use strict";
    var t = e.i(643766),
        n = e.i(860663),
        r = e.i(760869),
        o = e.i(206350),
        i = e.i(785517),
        a = t.forwardRef((e, a) => {
            var u, c;
            let {
                container: l,
                ...s
            } = e, [d, f] = t.useState(!1);
            (0, o.f)(() => f(!0), []);
            let v = l || d && (null == (c = globalThis) || null == (u = c.document) ? void 0 : u.body);
            return v ? n.default.createPortal((0, i.jsx)(r.V.div, {
                ...s,
                ref: a
            }), v) : null
        });
    a.displayName = "Portal", e.s(["f", 0, a])
}, 644227, e => {
    "use strict";
    var t = e.i(643766),
        n = e.i(120297),
        r = e.i(206350),
        o = e => {
            var o, a, u;
            let c, l, {
                    present: s,
                    children: d
                } = e,
                f = function(e) {
                    var n, o;
                    let [a, u] = t.useState(), c = t.useRef({}), l = t.useRef(e), s = t.useRef("none"), [d, f] = (n = e ? "mounted" : "unmounted", o = {
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
                        let n = o[e][t];
                        return null != n ? n : e
                    }, n));
                    return t.useEffect(() => {
                        let e = i(c.current);
                        s.current = "mounted" === d ? e : "none"
                    }, [d]), (0, r.f)(() => {
                        let t = c.current,
                            n = l.current;
                        if (n !== e) {
                            let r = s.current,
                                o = i(t);
                            e ? f("MOUNT") : "none" === o || (null == t ? void 0 : t.display) === "none" ? f("UNMOUNT") : n && r !== o ? f("ANIMATION_OUT") : f("UNMOUNT"), l.current = e
                        }
                    }, [e, f]), (0, r.f)(() => {
                        if (a) {
                            var e;
                            let t, n = null != (e = a.ownerDocument.defaultView) ? e : window,
                                r = e => {
                                    let r = i(c.current).includes(e.animationName);
                                    if (e.target === a && r && (f("ANIMATION_END"), !l.current)) {
                                        let e = a.style.animationFillMode;
                                        a.style.animationFillMode = "forwards", t = n.setTimeout(() => {
                                            "forwards" === a.style.animationFillMode && (a.style.animationFillMode = e)
                                        })
                                    }
                                },
                                o = e => {
                                    e.target === a && (s.current = i(c.current))
                                };
                            return a.addEventListener("animationstart", o), a.addEventListener("animationcancel", r), a.addEventListener("animationend", r), () => {
                                n.clearTimeout(t), a.removeEventListener("animationstart", o), a.removeEventListener("animationcancel", r), a.removeEventListener("animationend", r)
                            }
                        }
                        f("ANIMATION_END")
                    }, [a, f]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: t.useCallback(e => {
                            e && (c.current = getComputedStyle(e)), u(e)
                        }, [])
                    }
                }(s),
                v = "function" == typeof d ? d({
                    present: f.isPresent
                }) : t.Children.only(d),
                p = (0, n.j)(f.ref, (l = (c = null == (a = Object.getOwnPropertyDescriptor((o = v).props, "ref")) ? void 0 : a.get) && "isReactWarning" in c && c.isReactWarning) ? o.ref : (l = (c = null == (u = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : u.get) && "isReactWarning" in c && c.isReactWarning) ? o.props.ref : o.props.ref || o.ref);
            return "function" == typeof d || f.isPresent ? t.cloneElement(v, {
                ref: p
            }) : null
        };

    function i(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    o.displayName = "Presence", e.s(["f", 0, o])
}, 760869, 393225, e => {
    "use strict";
    var t = e.i(643766),
        n = e.i(860663),
        r = e.i(120297),
        o = e.i(785517);

    function i(e) {
        var n;
        let i, a = (n = e, (i = t.forwardRef((e, n) => {
                let {
                    children: o,
                    ...i
                } = e;
                if (t.isValidElement(o)) {
                    var a, u, c;
                    let e, l, s = (l = (e = null == (u = Object.getOwnPropertyDescriptor((a = o).props, "ref")) ? void 0 : u.get) && "isReactWarning" in e && e.isReactWarning) ? a.ref : (l = (e = null == (c = Object.getOwnPropertyDescriptor(a, "ref")) ? void 0 : c.get) && "isReactWarning" in e && e.isReactWarning) ? a.props.ref : a.props.ref || a.ref,
                        d = function(e, t) {
                            let n = {
                                ...t
                            };
                            for (let r in t) {
                                let o = e[r],
                                    i = t[r];
                                /^on[A-Z]/.test(r) ? o && i ? n[r] = function() {
                                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                    i(...t), o(...t)
                                } : o && (n[r] = o) : "style" === r ? n[r] = {
                                    ...o,
                                    ...i
                                } : "className" === r && (n[r] = [o, i].filter(Boolean).join(" "))
                            }
                            return {
                                ...e,
                                ...n
                            }
                        }(i, o.props);
                    return o.type !== t.Fragment && (d.ref = n ? (0, r.Q)(n, s) : s), t.cloneElement(o, d)
                }
                return t.Children.count(o) > 1 ? t.Children.only(null) : null
            })).displayName = "".concat(n, ".SlotClone"), i),
            c = t.forwardRef((e, n) => {
                let {
                    children: r,
                    ...i
                } = e, c = t.Children.toArray(r), l = c.find(u);
                if (l) {
                    let e = l.props.children,
                        r = c.map(n => n !== l ? n : t.Children.count(e) > 1 ? t.Children.only(null) : t.isValidElement(e) ? e.props.children : null);
                    return (0, o.jsx)(a, {
                        ...i,
                        ref: n,
                        children: t.isValidElement(e) ? t.cloneElement(e, void 0, r) : null
                    })
                }
                return (0, o.jsx)(a, {
                    ...i,
                    ref: n,
                    children: r
                })
            });
        return c.displayName = "".concat(e, ".Slot"), c
    }
    var a = Symbol("radix.slottable");

    function u(e) {
        return t.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === a
    }
    e.s(["f", 0, i], 393225);
    var c = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, n) => {
        let r = i("Primitive.".concat(n)),
            a = t.forwardRef((e, t) => {
                let {
                    asChild: i,
                    ...a
                } = e;
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, o.jsx)(i ? r : n, {
                    ...a,
                    ref: t
                })
            });
        return a.displayName = "Primitive.".concat(n), {
            ...e,
            [n]: a
        }
    }, {});
    e.s(["V", 0, c, "u", 0, function(e, t) {
        e && n.flushSync(() => e.dispatchEvent(t))
    }], 760869)
}, 103649, e => {
    "use strict";
    var t = e.i(643766);
    e.s(["f", 0, function(e) {
        let n = t.useRef(e);
        return t.useEffect(() => {
            n.current = e
        }), t.useMemo(() => function() {
            for (var e, t = arguments.length, r = Array(t), o = 0; o < t; o++) r[o] = arguments[o];
            return null == (e = n.current) ? void 0 : e.call(n, ...r)
        }, [])
    }])
}, 493430, e => {
    "use strict";
    var t = e.i(643766),
        n = e.i(103649);
    e.s(["f", 0, function(e) {
        let {
            prop: r,
            defaultProp: o,
            onChange: i = () => {}
        } = e, [a, u] = function(e) {
            let {
                defaultProp: r,
                onChange: o
            } = e, i = t.useState(r), [a] = i, u = t.useRef(a), c = (0, n.f)(o);
            return t.useEffect(() => {
                u.current !== a && (c(a), u.current = a)
            }, [a, u, c]), i
        }({
            defaultProp: o,
            onChange: i
        }), c = void 0 !== r, l = c ? r : a, s = (0, n.f)(i);
        return [l, t.useCallback(e => {
            if (c) {
                let t = "function" == typeof e ? e(r) : e;
                t !== r && s(t)
            } else u(e)
        }, [c, r, u, s])]
    }])
}]);

//# debugId=d057bdbb-dbef-e5cd-7836-4f47c81d0c87
//# sourceMappingURL=3px7m1s9lv1_x.js.map