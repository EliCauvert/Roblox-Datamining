! function() {
    var e = {
            89: function(e) {
                e.exports = function(e) {
                    return e && e.__esModule ? e : {
                        default: e
                    }
                }, e.exports.__esModule = !0, e.exports.default = e.exports
            },
            548: function(e, t, r) {
                "use strict";
                var n = r(89);
                t.darken = u, t.getContrastRatio = function(e, t) {
                    var r = l(e),
                        n = l(t);
                    return (Math.max(r, n) + .05) / (Math.min(r, n) + .05)
                }, t.lighten = f;
                var o = n(r(637)),
                    i = n(r(746));

                function a(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0,
                        r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 1;
                    return (0, i.default)(e, t, r)
                }

                function c(e) {
                    if (e.type) return e;
                    if ("#" === e.charAt(0)) {
                        var t, r, n;
                        return c((t = (t = e).slice(1), r = RegExp(".{1,".concat(t.length >= 6 ? 2 : 1, "}"), "g"), (n = t.match(r)) && 1 === n[0].length && (n = n.map(function(e) {
                            return e + e
                        })), n ? "rgb".concat(4 === n.length ? "a" : "", "(").concat(n.map(function(e, t) {
                            return t < 3 ? parseInt(e, 16) : Math.round(parseInt(e, 16) / 255 * 1e3) / 1e3
                        }).join(", "), ")") : ""))
                    }
                    var i, a = e.indexOf("("),
                        s = e.substring(0, a);
                    if (-1 === ["rgb", "rgba", "hsl", "hsla", "color"].indexOf(s)) throw Error((0, o.default)(9, e));
                    var l = e.substring(a + 1, e.length - 1);
                    if ("color" === s) {
                        if (i = (l = l.split(" ")).shift(), 4 === l.length && "/" === l[3].charAt(0) && (l[3] = l[3].slice(1)), -1 === ["srgb", "display-p3", "a98-rgb", "prophoto-rgb", "rec-2020"].indexOf(i)) throw Error((0, o.default)(10, i))
                    } else l = l.split(",");
                    return {
                        type: s,
                        values: l = l.map(function(e) {
                            return parseFloat(e)
                        }),
                        colorSpace: i
                    }
                }

                function s(e) {
                    var t = e.type,
                        r = e.colorSpace,
                        n = e.values;
                    return -1 !== t.indexOf("rgb") ? n = n.map(function(e, t) {
                        return t < 3 ? parseInt(e, 10) : e
                    }) : -1 !== t.indexOf("hsl") && (n[1] = "".concat(n[1], "%"), n[2] = "".concat(n[2], "%")), n = -1 !== t.indexOf("color") ? "".concat(r, " ").concat(n.join(" ")) : "".concat(n.join(", ")), "".concat(t, "(").concat(n, ")")
                }

                function l(e) {
                    var t, r, n, o, i, a, l, u, f, d = "hsl" === (e = c(e)).type || "hsla" === e.type ? c((n = (r = (t = c(t = e)).values)[0], o = r[1] / 100, a = o * Math.min(i = r[2] / 100, 1 - i), u = "rgb", f = [Math.round(255 * (l = function(e) {
                        var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : (e + n / 30) % 12;
                        return i - a * Math.max(Math.min(t - 3, 9 - t, 1), -1)
                    })(0)), Math.round(255 * l(8)), Math.round(255 * l(4))], "hsla" === t.type && (u += "a", f.push(r[3])), s({
                        type: u,
                        values: f
                    }))).values : e.values;
                    return Number((.2126 * (d = d.map(function(t) {
                        return "color" !== e.type && (t /= 255), t <= .03928 ? t / 12.92 : Math.pow((t + .055) / 1.055, 2.4)
                    }))[0] + .7152 * d[1] + .0722 * d[2]).toFixed(3))
                }

                function u(e, t) {
                    if (e = c(e), t = a(t), -1 !== e.type.indexOf("hsl")) e.values[2] *= 1 - t;
                    else if (-1 !== e.type.indexOf("rgb") || -1 !== e.type.indexOf("color"))
                        for (var r = 0; r < 3; r += 1) e.values[r] *= 1 - t;
                    return s(e)
                }

                function f(e, t) {
                    if (e = c(e), t = a(t), -1 !== e.type.indexOf("hsl")) e.values[2] += (100 - e.values[2]) * t;
                    else if (-1 !== e.type.indexOf("rgb"))
                        for (var r = 0; r < 3; r += 1) e.values[r] += (255 - e.values[r]) * t;
                    else if (-1 !== e.type.indexOf("color"))
                        for (var n = 0; n < 3; n += 1) e.values[n] += (1 - e.values[n]) * t;
                    return s(e)
                }
            },
            746: function(e, t, r) {
                "use strict";
                r.r(t), r.d(t, {
                    default: function() {
                        return n
                    }
                });
                var n = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : Number.MIN_SAFE_INTEGER,
                        r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : Number.MAX_SAFE_INTEGER;
                    return Math.max(t, Math.min(e, r))
                }
            },
            118: function(e, t, r) {
                "use strict";

                function n(e) {
                    for (var t = "https://mui.com/production-error/?code=" + e, r = 1; r < arguments.length; r += 1) t += "&args[]=" + encodeURIComponent(arguments[r]);
                    return "Minified MUI error #" + e + "; visit " + t + " for the full message."
                }
                r.d(t, {
                    Z: function() {
                        return n
                    }
                })
            },
            637: function(e, t, r) {
                "use strict";
                r.r(t), r.d(t, {
                    default: function() {
                        return n.Z
                    }
                });
                var n = r(118)
            },
            671: function(e) {
                function t(e) {
                    return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
                }!
                /*!
                	Copyright (c) 2018 Jed Watson.
                	Licensed under the MIT License (MIT), see
                	http://jedwatson.github.io/classnames
                */
                function() {
                    "use strict";
                    var r = {}.hasOwnProperty;

                    function n() {
                        for (var e = "", i = 0; i < arguments.length; i++) {
                            var a = arguments[i];
                            a && (e = o(e, function(e) {
                                if ("string" == typeof e || "number" == typeof e) return e;
                                if ((void 0 === e ? "undefined" : t(e)) !== "object") return "";
                                if (Array.isArray(e)) return n.apply(null, e);
                                if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                                var i = "";
                                for (var a in e) r.call(e, a) && e[a] && (i = o(i, a));
                                return i
                            }(a)))
                        }
                        return e
                    }

                    function o(e, t) {
                        return t ? e ? e + " " + t : e + t : e
                    }
                    e.exports ? (n.default = n, e.exports = n) : "function" == typeof define && "object" === t(define.amd) && define.amd ? define("classnames", [], function() {
                        return n
                    }) : window.classNames = n
                }()
            },
            85: function(e, t, r) {
                "use strict";
                e.exports = {}
            }
        },
        t = {};

    function r(n) {
        var o = t[n];
        if (void 0 !== o) return o.exports;
        var i = t[n] = {
            exports: {}
        };
        return e[n](i, i.exports, r), i.exports
    }
    r.m = e, r.n = function(e) {
            var t = e && e.__esModule ? function() {
                return e.default
            } : function() {
                return e
            };
            return r.d(t, {
                a: t
            }), t
        }, r.d = function(e, t) {
            for (var n in t) r.o(t, n) && !r.o(e, n) && Object.defineProperty(e, n, {
                enumerable: !0,
                get: t[n]
            })
        }, r.k = function(e) {
            return "" + e + ".css"
        }, r.g = function() {
            if ("object" == typeof globalThis) return globalThis;
            try {
                return this || Function("return this")()
            } catch (e) {
                if ("object" == typeof window) return window
            }
        }(), r.o = function(e, t) {
            return Object.prototype.hasOwnProperty.call(e, t)
        }, r.r = function(e) {
            "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(e, "__esModule", {
                value: !0
            })
        }, r.rv = function() {
            return "1.2.8"
        },
        function() {
            r.g.importScripts && (e = r.g.location + "");
            var e, t = r.g.document;
            if (!e && t && (t.currentScript && "SCRIPT" === t.currentScript.tagName.toUpperCase() && (e = t.currentScript.src), !e)) {
                var n = t.getElementsByTagName("script");
                if (n.length)
                    for (var o = n.length - 1; o > -1 && (!e || !/^http(s?):/.test(e));) e = n[o--].src
            }
            if (!e) throw Error("Automatic publicPath is not supported in this browser");
            e = e.replace(/^blob:/, "").replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/[^\/]+$/, "/"), r.p = e
        }(), r.ruid = "bundler=rspack@1.2.8",
        function() {
            "use strict";

            function e(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var t, n, o, i, a, c, s, l, u, f, d, p, y, h, v, m, g, b, x, w, O, S, j = window.ReactJSX,
                k = window.Roblox["core-scripts"].react,
                C = window.React,
                A = r.n(C),
                P = r(671),
                T = r.n(P);

            function E() {
                return (E = Object.assign ? Object.assign.bind() : function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var r = arguments[t];
                        for (var n in r)({}).hasOwnProperty.call(r, n) && (e[n] = r[n])
                    }
                    return e
                }).apply(null, arguments)
            }

            function I(e, t) {
                if (null == e) return {};
                var r = {};
                for (var n in e)
                    if (({}).hasOwnProperty.call(e, n)) {
                        if (t.includes(n)) continue;
                        r[n] = e[n]
                    } return r
            }

            function R(e) {
                if ((void 0 === e ? "undefined" : e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e) != "object" || null === e) return !1;
                var t = Object.getPrototypeOf(e);
                return (null === t || t === Object.prototype || null === Object.getPrototypeOf(t)) && !(Symbol.toStringTag in e) && !(Symbol.iterator in e)
            }

            function B(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {
                        clone: !0
                    },
                    n = r.clone ? E({}, e) : e;
                return R(e) && R(t) && Object.keys(t).forEach(function(o) {
                    C.isValidElement(t[o]) ? n[o] = t[o] : R(t[o]) && Object.prototype.hasOwnProperty.call(e, o) && R(e[o]) ? n[o] = B(e[o], t[o], r) : r.clone ? n[o] = R(t[o]) ? function e(t) {
                        if (C.isValidElement(t) || !R(t)) return t;
                        var r = {};
                        return Object.keys(t).forEach(function(n) {
                            r[n] = e(t[n])
                        }), r
                    }(t[o]) : t[o] : n[o] = t[o]
                }), n
            }
            var M = ["values", "unit", "step"],
                N = function(e) {
                    var t = Object.keys(e).map(function(t) {
                        return {
                            key: t,
                            val: e[t]
                        }
                    }) || [];
                    return t.sort(function(e, t) {
                        return e.val - t.val
                    }), t.reduce(function(e, t) {
                        var r, n, o;
                        return E({}, e, (r = {}, n = t.key, o = t.val, n in r ? Object.defineProperty(r, n, {
                            value: o,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : r[n] = o, r))
                    }, {})
                },
                W = {
                    borderRadius: 4
                };
            window.PropTypes;
            var z = {
                    xs: 0,
                    sm: 600,
                    md: 900,
                    lg: 1200,
                    xl: 1536
                },
                $ = {
                    keys: ["xs", "sm", "md", "lg", "xl"],
                    up: function(e) {
                        return "@media (min-width:".concat(z[e], "px)")
                    }
                };

            function _(e, t, r) {
                var n = e.theme || {};
                if (Array.isArray(t)) {
                    var o = n.breakpoints || $;
                    return t.reduce(function(e, n, i) {
                        return e[o.up(o.keys[i])] = r(t[i]), e
                    }, {})
                }
                if ((void 0 === t ? "undefined" : t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) == "object") {
                    var i = n.breakpoints || $;
                    return Object.keys(t).reduce(function(e, n) {
                        return -1 !== Object.keys(i.values || z).indexOf(n) ? e[i.up(n)] = r(t[n], n) : e[n] = t[n], e
                    }, {})
                }
                return r(t)
            }
            var D = r(118);

            function V(e) {
                if ("string" != typeof e) throw Error((0, D.Z)(7));
                return e.charAt(0).toUpperCase() + e.slice(1)
            }

            function L(e, t) {
                var r = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2];
                if (!t || "string" != typeof t) return null;
                if (e && e.vars && r) {
                    var n = "vars.".concat(t).split(".").reduce(function(e, t) {
                        return e && e[t] ? e[t] : null
                    }, e);
                    if (null != n) return n
                }
                return t.split(".").reduce(function(e, t) {
                    return e && null != e[t] ? e[t] : null
                }, e)
            }

            function H(e, t, r) {
                var n, o = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : r;
                return n = "function" == typeof e ? e(r) : Array.isArray(e) ? e[r] || o : L(e, r) || o, t && (n = t(n, o, e)), n
            }
            var U = function(e) {
                    var t = e.prop,
                        r = e.cssProperty,
                        n = void 0 === r ? e.prop : r,
                        o = e.themeKey,
                        i = e.transform,
                        a = function(e) {
                            if (null == e[t]) return null;
                            var r = e[t],
                                a = L(e.theme, o) || {};
                            return _(e, r, function(e) {
                                var r, o, c = H(a, i, e);
                                return (e === c && "string" == typeof e && (c = H(a, i, "".concat(t).concat("default" === e ? "" : V(e)), e)), !1 === n) ? c : (r = {}, o = c, n in r ? Object.defineProperty(r, n, {
                                    value: o,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : r[n] = o, r)
                            })
                        };
                    return a.propTypes = {}, a.filterProps = [t], a
                },
                K = function(e, t) {
                    return t ? B(e, t, {
                        clone: !1
                    }) : e
                };

            function G(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function F(e) {
                return function(e) {
                    if (Array.isArray(e)) return G(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || q(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function q(e, t) {
                if (e) {
                    if ("string" == typeof e) return G(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return G(e, t)
                }
            }
            var Z = {
                    m: "margin",
                    p: "padding"
                },
                X = {
                    t: "Top",
                    r: "Right",
                    b: "Bottom",
                    l: "Left",
                    x: ["Left", "Right"],
                    y: ["Top", "Bottom"]
                },
                Y = {
                    marginX: "mx",
                    marginY: "my",
                    paddingX: "px",
                    paddingY: "py"
                },
                J = (t = function(e) {
                    if (e.length > 2) {
                        if (!Y[e]) return [e];
                        e = Y[e]
                    }
                    var t, r = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = e.split("")) || function(e, t) {
                            var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != o) {
                                var i = [],
                                    a = !0,
                                    c = !1;
                                try {
                                    for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), i.length !== t); a = !0);
                                } catch (e) {
                                    c = !0, n = e
                                } finally {
                                    try {
                                        a || null == o.return || o.return()
                                    } finally {
                                        if (c) throw n
                                    }
                                }
                                return i
                            }
                        }(t, 2) || q(t, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        n = r[0],
                        o = r[1],
                        i = Z[n],
                        a = X[o] || "";
                    return Array.isArray(a) ? a.map(function(e) {
                        return i + e
                    }) : [i + a]
                }, n = {}, function(e) {
                    return void 0 === n[e] && (n[e] = t(e)), n[e]
                }),
                Q = ["m", "mt", "mr", "mb", "ml", "mx", "my", "margin", "marginTop", "marginRight", "marginBottom", "marginLeft", "marginX", "marginY", "marginInline", "marginInlineStart", "marginInlineEnd", "marginBlock", "marginBlockStart", "marginBlockEnd"],
                ee = ["p", "pt", "pr", "pb", "pl", "px", "py", "padding", "paddingTop", "paddingRight", "paddingBottom", "paddingLeft", "paddingX", "paddingY", "paddingInline", "paddingInlineStart", "paddingInlineEnd", "paddingBlock", "paddingBlockStart", "paddingBlockEnd"],
                et = F(Q).concat(F(ee));

            function er(e, t, r, n) {
                var o, i = null != (o = L(e, t, !1)) ? o : r;
                return "number" == typeof i ? function(e) {
                    return "string" == typeof e ? e : i * e
                } : Array.isArray(i) ? function(e) {
                    return "string" == typeof e ? e : i[e]
                } : "function" == typeof i ? i : function() {}
            }

            function en(e) {
                return er(e, "spacing", 8, "spacing")
            }

            function eo(e, t) {
                if ("string" == typeof t || null == t) return t;
                var r = e(Math.abs(t));
                return t >= 0 ? r : "number" == typeof r ? -r : "-".concat(r)
            }

            function ei(e, t) {
                var r = en(e.theme);
                return Object.keys(e).map(function(n) {
                    return function(e, t, r, n) {
                        if (-1 === t.indexOf(r)) return null;
                        var o, i = (o = J(r), function(e) {
                                return o.reduce(function(t, r) {
                                    return t[r] = eo(n, e), t
                                }, {})
                            }),
                            a = e[r];
                        return _(e, a, i)
                    }(e, t, n, r)
                }).reduce(K, {})
            }

            function ea(e) {
                return ei(e, Q)
            }

            function ec(e) {
                return ei(e, ee)
            }

            function es(e) {
                return ei(e, et)
            }
            ea.propTypes = {}, ea.filterProps = Q, ec.propTypes = {}, ec.filterProps = ee, es.propTypes = {}, es.filterProps = et;
            var el = function() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                var n = t.reduce(function(e, t) {
                        return t.filterProps.forEach(function(r) {
                            e[r] = t
                        }), e
                    }, {}),
                    o = function(e) {
                        return Object.keys(e).reduce(function(t, r) {
                            return n[r] ? K(t, n[r](e)) : t
                        }, {})
                    };
                return o.propTypes = {}, o.filterProps = t.reduce(function(e, t) {
                    return e.concat(t.filterProps)
                }, []), o
            };

            function eu(e) {
                return "number" != typeof e ? e : "".concat(e, "px solid")
            }

            function ef(e, t) {
                return U({
                    prop: e,
                    themeKey: "borders",
                    transform: t
                })
            }
            var ed = ef("border", eu),
                ep = ef("borderTop", eu),
                ey = ef("borderRight", eu),
                eh = ef("borderBottom", eu),
                ev = ef("borderLeft", eu),
                em = ef("borderColor"),
                eg = ef("borderTopColor"),
                eb = ef("borderRightColor"),
                ex = ef("borderBottomColor"),
                ew = ef("borderLeftColor"),
                eO = ef("outline", eu),
                eS = ef("outlineColor"),
                ej = function(e) {
                    if (void 0 !== e.borderRadius && null !== e.borderRadius) {
                        var t = er(e.theme, "shape.borderRadius", 4, "borderRadius");
                        return _(e, e.borderRadius, function(e) {
                            return {
                                borderRadius: eo(t, e)
                            }
                        })
                    }
                    return null
                };
            ej.propTypes = {}, ej.filterProps = ["borderRadius"], el(ed, ep, ey, eh, ev, em, eg, eb, ex, ew, ej, eO, eS);
            var ek = function(e) {
                if (void 0 !== e.gap && null !== e.gap) {
                    var t = er(e.theme, "spacing", 8, "gap");
                    return _(e, e.gap, function(e) {
                        return {
                            gap: eo(t, e)
                        }
                    })
                }
                return null
            };
            ek.propTypes = {}, ek.filterProps = ["gap"];
            var eC = function(e) {
                if (void 0 !== e.columnGap && null !== e.columnGap) {
                    var t = er(e.theme, "spacing", 8, "columnGap");
                    return _(e, e.columnGap, function(e) {
                        return {
                            columnGap: eo(t, e)
                        }
                    })
                }
                return null
            };
            eC.propTypes = {}, eC.filterProps = ["columnGap"];
            var eA = function(e) {
                if (void 0 !== e.rowGap && null !== e.rowGap) {
                    var t = er(e.theme, "spacing", 8, "rowGap");
                    return _(e, e.rowGap, function(e) {
                        return {
                            rowGap: eo(t, e)
                        }
                    })
                }
                return null
            };

            function eP(e, t) {
                return "grey" === t ? t : e
            }

            function eT(e) {
                return e <= 1 && 0 !== e ? "".concat(100 * e, "%") : e
            }
            eA.propTypes = {}, eA.filterProps = ["rowGap"], el(ek, eC, eA, U({
                prop: "gridColumn"
            }), U({
                prop: "gridRow"
            }), U({
                prop: "gridAutoFlow"
            }), U({
                prop: "gridAutoColumns"
            }), U({
                prop: "gridAutoRows"
            }), U({
                prop: "gridTemplateColumns"
            }), U({
                prop: "gridTemplateRows"
            }), U({
                prop: "gridTemplateAreas"
            }), U({
                prop: "gridArea"
            })), el(U({
                prop: "color",
                themeKey: "palette",
                transform: eP
            }), U({
                prop: "bgcolor",
                cssProperty: "backgroundColor",
                themeKey: "palette",
                transform: eP
            }), U({
                prop: "backgroundColor",
                themeKey: "palette",
                transform: eP
            }));
            var eE = U({
                    prop: "width",
                    transform: eT
                }),
                eI = function(e) {
                    return void 0 !== e.maxWidth && null !== e.maxWidth ? _(e, e.maxWidth, function(t) {
                        var r, n, o = (null == (r = e.theme) || null == (r = r.breakpoints) || null == (r = r.values) ? void 0 : r[t]) || z[t];
                        return o ? (null == (n = e.theme) || null == (n = n.breakpoints) ? void 0 : n.unit) !== "px" ? {
                            maxWidth: "".concat(o).concat(e.theme.breakpoints.unit)
                        } : {
                            maxWidth: o
                        } : {
                            maxWidth: eT(t)
                        }
                    }) : null
                };
            eI.filterProps = ["maxWidth"];
            var eR = U({
                    prop: "minWidth",
                    transform: eT
                }),
                eB = U({
                    prop: "height",
                    transform: eT
                }),
                eM = U({
                    prop: "maxHeight",
                    transform: eT
                }),
                eN = U({
                    prop: "minHeight",
                    transform: eT
                });
            U({
                prop: "size",
                cssProperty: "width",
                transform: eT
            }), U({
                prop: "size",
                cssProperty: "height",
                transform: eT
            }), el(eE, eI, eR, eB, eM, eN, U({
                prop: "boxSizing"
            }));
            var eW = {
                border: {
                    themeKey: "borders",
                    transform: eu
                },
                borderTop: {
                    themeKey: "borders",
                    transform: eu
                },
                borderRight: {
                    themeKey: "borders",
                    transform: eu
                },
                borderBottom: {
                    themeKey: "borders",
                    transform: eu
                },
                borderLeft: {
                    themeKey: "borders",
                    transform: eu
                },
                borderColor: {
                    themeKey: "palette"
                },
                borderTopColor: {
                    themeKey: "palette"
                },
                borderRightColor: {
                    themeKey: "palette"
                },
                borderBottomColor: {
                    themeKey: "palette"
                },
                borderLeftColor: {
                    themeKey: "palette"
                },
                outline: {
                    themeKey: "borders",
                    transform: eu
                },
                outlineColor: {
                    themeKey: "palette"
                },
                borderRadius: {
                    themeKey: "shape.borderRadius",
                    style: ej
                },
                color: {
                    themeKey: "palette",
                    transform: eP
                },
                bgcolor: {
                    themeKey: "palette",
                    cssProperty: "backgroundColor",
                    transform: eP
                },
                backgroundColor: {
                    themeKey: "palette",
                    transform: eP
                },
                p: {
                    style: ec
                },
                pt: {
                    style: ec
                },
                pr: {
                    style: ec
                },
                pb: {
                    style: ec
                },
                pl: {
                    style: ec
                },
                px: {
                    style: ec
                },
                py: {
                    style: ec
                },
                padding: {
                    style: ec
                },
                paddingTop: {
                    style: ec
                },
                paddingRight: {
                    style: ec
                },
                paddingBottom: {
                    style: ec
                },
                paddingLeft: {
                    style: ec
                },
                paddingX: {
                    style: ec
                },
                paddingY: {
                    style: ec
                },
                paddingInline: {
                    style: ec
                },
                paddingInlineStart: {
                    style: ec
                },
                paddingInlineEnd: {
                    style: ec
                },
                paddingBlock: {
                    style: ec
                },
                paddingBlockStart: {
                    style: ec
                },
                paddingBlockEnd: {
                    style: ec
                },
                m: {
                    style: ea
                },
                mt: {
                    style: ea
                },
                mr: {
                    style: ea
                },
                mb: {
                    style: ea
                },
                ml: {
                    style: ea
                },
                mx: {
                    style: ea
                },
                my: {
                    style: ea
                },
                margin: {
                    style: ea
                },
                marginTop: {
                    style: ea
                },
                marginRight: {
                    style: ea
                },
                marginBottom: {
                    style: ea
                },
                marginLeft: {
                    style: ea
                },
                marginX: {
                    style: ea
                },
                marginY: {
                    style: ea
                },
                marginInline: {
                    style: ea
                },
                marginInlineStart: {
                    style: ea
                },
                marginInlineEnd: {
                    style: ea
                },
                marginBlock: {
                    style: ea
                },
                marginBlockStart: {
                    style: ea
                },
                marginBlockEnd: {
                    style: ea
                },
                displayPrint: {
                    cssProperty: !1,
                    transform: function(e) {
                        return {
                            "@media print": {
                                display: e
                            }
                        }
                    }
                },
                display: {},
                overflow: {},
                textOverflow: {},
                visibility: {},
                whiteSpace: {},
                flexBasis: {},
                flexDirection: {},
                flexWrap: {},
                justifyContent: {},
                alignItems: {},
                alignContent: {},
                order: {},
                flex: {},
                flexGrow: {},
                flexShrink: {},
                alignSelf: {},
                justifyItems: {},
                justifySelf: {},
                gap: {
                    style: ek
                },
                rowGap: {
                    style: eA
                },
                columnGap: {
                    style: eC
                },
                gridColumn: {},
                gridRow: {},
                gridAutoFlow: {},
                gridAutoColumns: {},
                gridAutoRows: {},
                gridTemplateColumns: {},
                gridTemplateRows: {},
                gridTemplateAreas: {},
                gridArea: {},
                position: {},
                zIndex: {
                    themeKey: "zIndex"
                },
                top: {},
                right: {},
                bottom: {},
                left: {},
                boxShadow: {
                    themeKey: "shadows"
                },
                width: {
                    transform: eT
                },
                maxWidth: {
                    style: eI
                },
                minWidth: {
                    transform: eT
                },
                height: {
                    transform: eT
                },
                maxHeight: {
                    transform: eT
                },
                minHeight: {
                    transform: eT
                },
                boxSizing: {},
                fontFamily: {
                    themeKey: "typography"
                },
                fontSize: {
                    themeKey: "typography"
                },
                fontStyle: {
                    themeKey: "typography"
                },
                fontWeight: {
                    themeKey: "typography"
                },
                letterSpacing: {},
                textTransform: {},
                lineHeight: {},
                textAlign: {},
                typography: {
                    cssProperty: !1,
                    themeKey: "typography"
                }
            };

            function ez(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function e$(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var e_ = function() {
                function e(e, t, r, n) {
                    var o, i = (ez(o = {}, e, t), ez(o, "theme", r), o),
                        a = n[e];
                    if (!a) return ez({}, e, t);
                    var c = a.cssProperty,
                        s = void 0 === c ? e : c,
                        l = a.themeKey,
                        u = a.transform,
                        f = a.style;
                    if (null == t) return null;
                    if ("typography" === l && "inherit" === t) return ez({}, e, t);
                    var d = L(r, l) || {};
                    return f ? f(i) : _(i, t, function(t) {
                        var r = H(d, u, t);
                        return (t === r && "string" == typeof t && (r = H(d, u, "".concat(e).concat("default" === t ? "" : V(t)), t)), !1 === s) ? r : ez({}, s, r)
                    })
                }
                return function t(r) {
                    var n, o = r || {},
                        i = o.sx,
                        a = o.theme,
                        c = void 0 === a ? {} : a;
                    if (!i) return null;
                    var s = null != (n = c.unstable_sxConfig) ? n : eW;

                    function l(r) {
                        var n, o = r;
                        if ("function" == typeof r) o = r(c);
                        else if ((void 0 === r ? "undefined" : e$(r)) !== "object") return r;
                        if (!o) return null;
                        var i = function() {
                                var e, t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                                return (null == (e = t.keys) ? void 0 : e.reduce(function(e, r) {
                                    return e[t.up(r)] = {}, e
                                }, {})) || {}
                            }(c.breakpoints),
                            a = Object.keys(i),
                            l = i;
                        return Object.keys(o).forEach(function(r) {
                            var n, i = "function" == typeof(n = o[r]) ? n(c) : n;
                            if (null != i) {
                                if ((void 0 === i ? "undefined" : e$(i)) === "object") {
                                    if (s[r]) l = K(l, e(r, i, c, s));
                                    else {
                                        var a = _({
                                            theme: c
                                        }, i, function(e) {
                                            return ez({}, r, e)
                                        });
                                        (function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            var n = new Set(t.reduce(function(e, t) {
                                                return e.concat(Object.keys(t))
                                            }, []));
                                            return t.every(function(e) {
                                                return n.size === Object.keys(e).length
                                            })
                                        })(a, i) ? l[r] = t({
                                            sx: i,
                                            theme: c
                                        }): l = K(l, a)
                                    }
                                } else l = K(l, e(r, i, c, s))
                            }
                        }), n = l, a.reduce(function(e, t) {
                            var r = e[t];
                            return r && 0 !== Object.keys(r).length || delete e[t], e
                        }, n)
                    }
                    return Array.isArray(i) ? i.map(l) : l(i)
                }
            }();

            function eD(e, t) {
                if (this.vars && "function" == typeof this.getColorSchemeSelector) {
                    var r, n;
                    return r = {}, (n = this.getColorSchemeSelector(e).replace(/(\[[^\]]+\])/, "*:where($1)")) in r ? Object.defineProperty(r, n, {
                        value: t,
                        enumerable: !0,
                        configurable: !0,
                        writable: !0
                    }) : r[n] = t, r
                }
                return this.palette.mode === e ? t : {}
            }
            e_.filterProps = ["sx"];
            var eV = ["breakpoints", "palette", "spacing", "shape"],
                eL = function() {
                    for (var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}, t = arguments.length, r = Array(t > 1 ? t - 1 : 0), n = 1; n < t; n++) r[n - 1] = arguments[n];
                    var o = e.breakpoints,
                        i = e.palette,
                        a = e.spacing,
                        c = e.shape,
                        s = I(e, eV),
                        l = function(e) {
                            var t = e.values,
                                r = void 0 === t ? {
                                    xs: 0,
                                    sm: 600,
                                    md: 900,
                                    lg: 1200,
                                    xl: 1536
                                } : t,
                                n = e.unit,
                                o = void 0 === n ? "px" : n,
                                i = e.step,
                                a = void 0 === i ? 5 : i,
                                c = I(e, M),
                                s = N(r),
                                l = Object.keys(s);

                            function u(e) {
                                var t = "number" == typeof r[e] ? r[e] : e;
                                return "@media (min-width:".concat(t).concat(o, ")")
                            }

                            function f(e) {
                                var t = "number" == typeof r[e] ? r[e] : e;
                                return "@media (max-width:".concat(t - a / 100).concat(o, ")")
                            }

                            function d(e, t) {
                                var n = l.indexOf(t);
                                return "@media (min-width:".concat("number" == typeof r[e] ? r[e] : e).concat(o, ") and ") + "(max-width:".concat((-1 !== n && "number" == typeof r[l[n]] ? r[l[n]] : t) - a / 100).concat(o, ")")
                            }
                            return E({
                                keys: l,
                                values: s,
                                up: u,
                                down: f,
                                between: d,
                                only: function(e) {
                                    return l.indexOf(e) + 1 < l.length ? d(e, l[l.indexOf(e) + 1]) : u(e)
                                },
                                not: function(e) {
                                    var t = l.indexOf(e);
                                    return 0 === t ? u(l[1]) : t === l.length - 1 ? f(l[t]) : d(e, l[l.indexOf(e) + 1]).replace("@media", "@media not all and")
                                },
                                unit: o
                            }, c)
                        }(void 0 === o ? {} : o),
                        u = function() {
                            var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : 8;
                            if (e.mui) return e;
                            var t = en({
                                    spacing: e
                                }),
                                r = function() {
                                    for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                                    return (0 === r.length ? [1] : r).map(function(e) {
                                        var r = t(e);
                                        return "number" == typeof r ? "".concat(r, "px") : r
                                    }).join(" ")
                                };
                            return r.mui = !0, r
                        }(a),
                        f = B({
                            breakpoints: l,
                            direction: "ltr",
                            components: {},
                            palette: E({
                                mode: "light"
                            }, void 0 === i ? {} : i),
                            spacing: u,
                            shape: E({}, W, void 0 === c ? {} : c)
                        }, s);
                    return f.applyStyles = eD, (f = r.reduce(function(e, t) {
                        return B(e, t)
                    }, f)).unstable_sxConfig = E({}, eW, null == s ? void 0 : s.unstable_sxConfig), f.unstable_sx = function(e) {
                        return e_({
                            sx: e,
                            theme: this
                        })
                    }, f
                },
                eH = function() {
                    function e(e) {
                        var t = this;
                        this._insertTag = function(e) {
                            var r;
                            r = 0 === t.tags.length ? t.insertionPoint ? t.insertionPoint.nextSibling : t.prepend ? t.container.firstChild : t.before : t.tags[t.tags.length - 1].nextSibling, t.container.insertBefore(e, r), t.tags.push(e)
                        }, this.isSpeedy = void 0 === e.speedy || e.speedy, this.tags = [], this.ctr = 0, this.nonce = e.nonce, this.key = e.key, this.container = e.container, this.prepend = e.prepend, this.insertionPoint = e.insertionPoint, this.before = null
                    }
                    var t = e.prototype;
                    return t.hydrate = function(e) {
                        e.forEach(this._insertTag)
                    }, t.insert = function(e) {
                        if (this.ctr % (this.isSpeedy ? 65e3 : 1) == 0) {
                            var t;
                            this._insertTag(((t = document.createElement("style")).setAttribute("data-emotion", this.key), void 0 !== this.nonce && t.setAttribute("nonce", this.nonce), t.appendChild(document.createTextNode("")), t.setAttribute("data-s", ""), t))
                        }
                        var r = this.tags[this.tags.length - 1];
                        if (this.isSpeedy) {
                            var n = function(e) {
                                if (e.sheet) return e.sheet;
                                for (var t = 0; t < document.styleSheets.length; t++)
                                    if (document.styleSheets[t].ownerNode === e) return document.styleSheets[t]
                            }(r);
                            try {
                                n.insertRule(e, n.cssRules.length)
                            } catch (e) {}
                        } else r.appendChild(document.createTextNode(e));
                        this.ctr++
                    }, t.flush = function() {
                        this.tags.forEach(function(e) {
                            var t;
                            return null == (t = e.parentNode) ? void 0 : t.removeChild(e)
                        }), this.tags = [], this.ctr = 0
                    }, e
                }(),
                eU = Math.abs,
                eK = String.fromCharCode,
                eG = Object.assign;

            function eF(e, t, r) {
                return e.replace(t, r)
            }

            function eq(e, t) {
                return e.indexOf(t)
            }

            function eZ(e, t) {
                return 0 | e.charCodeAt(t)
            }

            function eX(e, t, r) {
                return e.slice(t, r)
            }

            function eY(e) {
                return e.length
            }

            function eJ(e, t) {
                return t.push(e), e
            }
            var eQ = 1,
                e0 = 1,
                e1 = 0,
                e2 = 0,
                e5 = 0,
                e4 = "";

            function e3(e, t, r, n, o, i, a) {
                return {
                    value: e,
                    root: t,
                    parent: r,
                    type: n,
                    props: o,
                    children: i,
                    line: eQ,
                    column: e0,
                    length: a,
                    return: ""
                }
            }

            function e8(e, t) {
                return eG(e3("", null, null, "", null, null, 0), e, {
                    length: -e.length
                }, t)
            }

            function e6() {
                return e5 = e2 < e1 ? eZ(e4, e2++) : 0, e0++, 10 === e5 && (e0 = 1, eQ++), e5
            }

            function e7() {
                return eZ(e4, e2)
            }

            function e9(e) {
                switch (e) {
                    case 0:
                    case 9:
                    case 10:
                    case 13:
                    case 32:
                        return 5;
                    case 33:
                    case 43:
                    case 44:
                    case 47:
                    case 62:
                    case 64:
                    case 126:
                    case 59:
                    case 123:
                    case 125:
                        return 4;
                    case 58:
                        return 3;
                    case 34:
                    case 39:
                    case 40:
                    case 91:
                        return 2;
                    case 41:
                    case 93:
                        return 1
                }
                return 0
            }

            function te(e) {
                return eQ = e0 = 1, e1 = eY(e4 = e), e2 = 0, []
            }

            function tt(e) {
                var t, r;
                return (t = e2 - 1, r = function e(t) {
                    for (; e6();) switch (e5) {
                        case t:
                            return e2;
                        case 34:
                        case 39:
                            34 !== t && 39 !== t && e(e5);
                            break;
                        case 40:
                            41 === t && e(t);
                            break;
                        case 92:
                            e6()
                    }
                    return e2
                }(91 === e ? e + 2 : 40 === e ? e + 1 : e), eX(e4, t, r)).trim()
            }
            var tr = "-ms-",
                tn = "-moz-",
                to = "-webkit-",
                ti = "comm",
                ta = "rule",
                tc = "decl",
                ts = "@keyframes";

            function tl(e, t) {
                for (var r = "", n = e.length, o = 0; o < n; o++) r += t(e[o], o, e, t) || "";
                return r
            }

            function tu(e, t, r, n) {
                switch (e.type) {
                    case "@layer":
                        if (e.children.length) break;
                    case "@import":
                    case tc:
                        return e.return = e.return || e.value;
                    case ti:
                        return "";
                    case ts:
                        return e.return = e.value + "{" + tl(e.children, n) + "}";
                    case ta:
                        e.value = e.props.join(",")
                }
                return eY(r = tl(e.children, n)) ? e.return = e.value + "{" + r + "}" : ""
            }

            function tf(e, t, r, n, o, i, a, c, s, l, u) {
                for (var f = o - 1, d = 0 === o ? i : [""], p = d.length, y = 0, h = 0, v = 0; y < n; ++y)
                    for (var m = 0, g = eX(e, f + 1, f = eU(h = a[y])), b = e; m < p; ++m)(b = (h > 0 ? d[m] + " " + g : eF(g, /&\f/g, d[m])).trim()) && (s[v++] = b);
                return e3(e, t, r, 0 === o ? ta : c, s, l, u)
            }

            function td(e, t, r, n) {
                return e3(e, t, r, tc, eX(e, 0, n), eX(e, n + 1, -1), n)
            }
            var tp = function(e, t, r) {
                    for (var n = 0, o = 0; n = o, o = e7(), 38 === n && 12 === o && (t[r] = 1), !e9(o);) e6();
                    return eX(e4, e, e2)
                },
                ty = function(e, t) {
                    var r = -1,
                        n = 44;
                    do switch (e9(n)) {
                        case 0:
                            38 === n && 12 === e7() && (t[r] = 1), e[r] += tp(e2 - 1, t, r);
                            break;
                        case 2:
                            e[r] += tt(n);
                            break;
                        case 4:
                            if (44 === n) {
                                e[++r] = 58 === e7() ? "&\f" : "", t[r] = e[r].length;
                                break
                            }
                        default:
                            e[r] += eK(n)
                    }
                    while (n = e6());
                    return e
                },
                th = function(e, t) {
                    var r;
                    return r = ty(te(e), t), e4 = "", r
                },
                tv = new WeakMap,
                tm = function(e) {
                    if ("rule" === e.type && e.parent && !(e.length < 1)) {
                        for (var t = e.value, r = e.parent, n = e.column === r.column && e.line === r.line;
                            "rule" !== r.type;)
                            if (!(r = r.parent)) return;
                        if ((1 !== e.props.length || 58 === t.charCodeAt(0) || tv.get(r)) && !n) {
                            tv.set(e, !0);
                            for (var o = [], i = th(t, o), a = r.props, c = 0, s = 0; c < i.length; c++)
                                for (var l = 0; l < a.length; l++, s++) e.props[s] = o[c] ? i[c].replace(/&\f/g, a[l]) : a[l] + " " + i[c]
                        }
                    }
                },
                tg = function(e) {
                    if ("decl" === e.type) {
                        var t = e.value;
                        108 === t.charCodeAt(0) && 98 === t.charCodeAt(2) && (e.return = "", e.value = "")
                    }
                },
                tb = [function(e, t, r, n) {
                    if (e.length > -1 && !e.return) switch (e.type) {
                        case tc:
                            e.return = function e(t, r) {
                                switch (45 ^ eZ(t, 0) ? (((r << 2 ^ eZ(t, 0)) << 2 ^ eZ(t, 1)) << 2 ^ eZ(t, 2)) << 2 ^ eZ(t, 3) : 0) {
                                    case 5103:
                                        return to + "print-" + t + t;
                                    case 5737:
                                    case 4201:
                                    case 3177:
                                    case 3433:
                                    case 1641:
                                    case 4457:
                                    case 2921:
                                    case 5572:
                                    case 6356:
                                    case 5844:
                                    case 3191:
                                    case 6645:
                                    case 3005:
                                    case 6391:
                                    case 5879:
                                    case 5623:
                                    case 6135:
                                    case 4599:
                                    case 4855:
                                    case 4215:
                                    case 6389:
                                    case 5109:
                                    case 5365:
                                    case 5621:
                                    case 3829:
                                        return to + t + t;
                                    case 5349:
                                    case 4246:
                                    case 4810:
                                    case 6968:
                                    case 2756:
                                        return to + t + tn + t + tr + t + t;
                                    case 6828:
                                    case 4268:
                                        return to + t + tr + t + t;
                                    case 6165:
                                        return to + t + tr + "flex-" + t + t;
                                    case 5187:
                                        return to + t + eF(t, /(\w+).+(:[^]+)/, to + "box-$1$2" + tr + "flex-$1$2") + t;
                                    case 5443:
                                        return to + t + tr + "flex-item-" + eF(t, /flex-|-self/, "") + t;
                                    case 4675:
                                        return to + t + tr + "flex-line-pack" + eF(t, /align-content|flex-|-self/, "") + t;
                                    case 5548:
                                        return to + t + tr + eF(t, "shrink", "negative") + t;
                                    case 5292:
                                        return to + t + tr + eF(t, "basis", "preferred-size") + t;
                                    case 6060:
                                        return to + "box-" + eF(t, "-grow", "") + to + t + tr + eF(t, "grow", "positive") + t;
                                    case 4554:
                                        return to + eF(t, /([^-])(transform)/g, "$1" + to + "$2") + t;
                                    case 6187:
                                        return eF(eF(eF(t, /(zoom-|grab)/, to + "$1"), /(image-set)/, to + "$1"), t, "") + t;
                                    case 5495:
                                    case 3959:
                                        return eF(t, /(image-set\([^]*)/, to + "$1$`$1");
                                    case 4968:
                                        return eF(eF(t, /(.+:)(flex-)?(.*)/, to + "box-pack:$3" + tr + "flex-pack:$3"), /s.+-b[^;]+/, "justify") + to + t + t;
                                    case 4095:
                                    case 3583:
                                    case 4068:
                                    case 2532:
                                        return eF(t, /(.+)-inline(.+)/, to + "$1$2") + t;
                                    case 8116:
                                    case 7059:
                                    case 5753:
                                    case 5535:
                                    case 5445:
                                    case 5701:
                                    case 4933:
                                    case 4677:
                                    case 5533:
                                    case 5789:
                                    case 5021:
                                    case 4765:
                                        if (eY(t) - 1 - r > 6) switch (eZ(t, r + 1)) {
                                            case 109:
                                                if (45 !== eZ(t, r + 4)) break;
                                            case 102:
                                                return eF(t, /(.+:)(.+)-([^]+)/, "$1" + to + "$2-$3$1" + tn + (108 == eZ(t, r + 3) ? "$3" : "$2-$3")) + t;
                                            case 115:
                                                return ~eq(t, "stretch") ? e(eF(t, "stretch", "fill-available"), r) + t : t
                                        }
                                        break;
                                    case 4949:
                                        if (115 !== eZ(t, r + 1)) break;
                                    case 6444:
                                        switch (eZ(t, eY(t) - 3 - (~eq(t, "!important") && 10))) {
                                            case 107:
                                                return eF(t, ":", ":" + to) + t;
                                            case 101:
                                                return eF(t, /(.+:)([^;!]+)(;|!.+)?/, "$1" + to + (45 === eZ(t, 14) ? "inline-" : "") + "box$3$1" + to + "$2$3$1" + tr + "$2box$3") + t
                                        }
                                        break;
                                    case 5936:
                                        switch (eZ(t, r + 11)) {
                                            case 114:
                                                return to + t + tr + eF(t, /[svh]\w+-[tblr]{2}/, "tb") + t;
                                            case 108:
                                                return to + t + tr + eF(t, /[svh]\w+-[tblr]{2}/, "tb-rl") + t;
                                            case 45:
                                                return to + t + tr + eF(t, /[svh]\w+-[tblr]{2}/, "lr") + t
                                        }
                                        return to + t + tr + t + t
                                }
                                return t
                            }(e.value, e.length);
                            break;
                        case ts:
                            return tl([e8(e, {
                                value: eF(e.value, "@", "@" + to)
                            })], n);
                        case ta:
                            if (e.length) {
                                var o, i;
                                return o = e.props, i = function(t) {
                                    var r;
                                    switch (r = t, (r = /(::plac\w+|:read-\w+)/.exec(r)) ? r[0] : r) {
                                        case ":read-only":
                                        case ":read-write":
                                            return tl([e8(e, {
                                                props: [eF(t, /:(read-\w+)/, ":" + tn + "$1")]
                                            })], n);
                                        case "::placeholder":
                                            return tl([e8(e, {
                                                props: [eF(t, /:(plac\w+)/, ":" + to + "input-$1")]
                                            }), e8(e, {
                                                props: [eF(t, /:(plac\w+)/, ":" + tn + "$1")]
                                            }), e8(e, {
                                                props: [eF(t, /:(plac\w+)/, tr + "input-$1")]
                                            })], n)
                                    }
                                    return ""
                                }, o.map(i).join("")
                            }
                    }
                }];
            C.useInsertionEffect && C.useInsertionEffect || C.useLayoutEffect;
            var tx = C.createContext("undefined" != typeof HTMLElement ? function(e) {
                var t, r, n, o, i, a, c = e.key;
                if ("css" === c) {
                    var s = document.querySelectorAll("style[data-emotion]:not([data-s])");
                    Array.prototype.forEach.call(s, function(e) {
                        -1 !== e.getAttribute("data-emotion").indexOf(" ") && (document.head.appendChild(e), e.setAttribute("data-s", ""))
                    })
                }
                var l = e.stylisPlugins || tb,
                    u = {},
                    f = [];
                r = e.container || document.head, Array.prototype.forEach.call(document.querySelectorAll('style[data-emotion^="' + c + ' "]'), function(e) {
                    for (var t = e.getAttribute("data-emotion").split(" "), r = 1; r < t.length; r++) u[t[r]] = !0;
                    f.push(e)
                });
                var d = (a = (i = [tm, tg].concat(l, [tu, (t = function(e) {
                        o.insert(e)
                    }, function(e) {
                        !e.root && (e = e.return) && t(e)
                    })])).length, function(e, t, r, n) {
                        for (var o = "", c = 0; c < a; c++) o += i[c](e, t, r, n) || "";
                        return o
                    }),
                    p = function(e) {
                        var t, r;
                        return tl((r = function e(t, r, n, o, i, a, c, s, l) {
                            for (var u, f = 0, d = 0, p = c, y = 0, h = 0, v = 0, m = 1, g = 1, b = 1, x = 0, w = "", O = i, S = a, j = o, k = w; g;) switch (v = x, x = e6()) {
                                case 40:
                                    if (108 != v && 58 == eZ(k, p - 1)) {
                                        -1 != eq(k += eF(tt(x), "&", "&\f"), "&\f") && (b = -1);
                                        break
                                    }
                                case 34:
                                case 39:
                                case 91:
                                    k += tt(x);
                                    break;
                                case 9:
                                case 10:
                                case 13:
                                case 32:
                                    k += function(e) {
                                        for (; e5 = e7();)
                                            if (e5 < 33) e6();
                                            else break;
                                        return e9(e) > 2 || e9(e5) > 3 ? "" : " "
                                    }(v);
                                    break;
                                case 92:
                                    k += function(e, t) {
                                        for (var r; --t && e6() && !(e5 < 48) && !(e5 > 102) && (!(e5 > 57) || !(e5 < 65)) && (!(e5 > 70) || !(e5 < 97)););
                                        return r = e2 + (t < 6 && 32 == e7() && 32 == e6()), eX(e4, e, r)
                                    }(e2 - 1, 7);
                                    continue;
                                case 47:
                                    switch (e7()) {
                                        case 42:
                                        case 47:
                                            eJ((u = function(e, t) {
                                                for (; e6();)
                                                    if (e + e5 === 57) break;
                                                    else if (e + e5 === 84 && 47 === e7()) break;
                                                return "/*" + eX(e4, t, e2 - 1) + "*" + eK(47 === e ? e : e6())
                                            }(e6(), e2), e3(u, r, n, ti, eK(e5), eX(u, 2, -2), 0)), l);
                                            break;
                                        default:
                                            k += "/"
                                    }
                                    break;
                                case 123 * m:
                                    s[f++] = eY(k) * b;
                                case 125 * m:
                                case 59:
                                case 0:
                                    switch (x) {
                                        case 0:
                                        case 125:
                                            g = 0;
                                        case 59 + d:
                                            -1 == b && (k = eF(k, /\f/g, "")), h > 0 && eY(k) - p && eJ(h > 32 ? td(k + ";", o, n, p - 1) : td(eF(k, " ", "") + ";", o, n, p - 2), l);
                                            break;
                                        case 59:
                                            k += ";";
                                        default:
                                            if (eJ(j = tf(k, r, n, f, d, i, s, w, O = [], S = [], p), a), 123 === x) {
                                                if (0 === d) e(k, r, j, j, O, a, p, s, S);
                                                else switch (99 === y && 110 === eZ(k, 3) ? 100 : y) {
                                                    case 100:
                                                    case 108:
                                                    case 109:
                                                    case 115:
                                                        e(t, j, j, o && eJ(tf(t, j, j, 0, 0, i, s, w, i, O = [], p), S), i, S, p, s, o ? O : S);
                                                        break;
                                                    default:
                                                        e(k, j, j, j, [""], S, 0, s, S)
                                                }
                                            }
                                    }
                                    f = d = h = 0, m = b = 1, w = k = "", p = c;
                                    break;
                                case 58:
                                    p = 1 + eY(k), h = v;
                                default:
                                    if (m < 1) {
                                        if (123 == x) --m;
                                        else if (125 == x && 0 == m++ && 125 == (e5 = e2 > 0 ? eZ(e4, --e2) : 0, e0--, 10 === e5 && (e0 = 1, eQ--), e5)) continue
                                    }
                                    switch (k += eK(x), x * m) {
                                        case 38:
                                            b = d > 0 ? 1 : (k += "\f", -1);
                                            break;
                                        case 44:
                                            s[f++] = (eY(k) - 1) * b, b = 1;
                                            break;
                                        case 64:
                                            45 === e7() && (k += tt(e6())), y = e7(), d = p = eY(w = k += function(e) {
                                                for (; !e9(e7());) e6();
                                                return eX(e4, e, e2)
                                            }(e2)), x++;
                                            break;
                                        case 45:
                                            45 === v && 2 == eY(k) && (m = 0)
                                    }
                            }
                            return a
                        }("", null, null, null, [""], t = te(t = e), 0, [0], t), e4 = "", r), d)
                    };
                n = function(e, t, r, n) {
                    o = r, p(e ? e + "{" + t.styles + "}" : t.styles), n && (y.inserted[t.name] = !0)
                };
                var y = {
                    key: c,
                    sheet: new eH({
                        key: c,
                        container: r,
                        nonce: e.nonce,
                        speedy: e.speedy,
                        prepend: e.prepend,
                        insertionPoint: e.insertionPoint
                    }),
                    nonce: e.nonce,
                    inserted: u,
                    registered: {},
                    insert: n
                };
                return y.sheet.hydrate(f), y
            }({
                key: "css"
            }) : null);
            tx.Provider;
            var tw = C.createContext({}),
                tO = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : null,
                        t = C.useContext(tw);
                    return t && 0 !== Object.keys(t).length ? t : e
                },
                tS = eL(),
                tj = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : tS;
                    return tO(e)
                };

            function tk(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var tC = r(548),
                tA = {
                    black: "#000",
                    white: "#fff"
                },
                tP = {
                    50: "#fafafa",
                    100: "#f5f5f5",
                    200: "#eeeeee",
                    300: "#e0e0e0",
                    400: "#bdbdbd",
                    500: "#9e9e9e",
                    600: "#757575",
                    700: "#616161",
                    800: "#424242",
                    900: "#212121",
                    A100: "#f5f5f5",
                    A200: "#eeeeee",
                    A400: "#bdbdbd",
                    A700: "#616161"
                },
                tT = {
                    50: "#f3e5f5",
                    100: "#e1bee7",
                    200: "#ce93d8",
                    300: "#ba68c8",
                    400: "#ab47bc",
                    500: "#9c27b0",
                    600: "#8e24aa",
                    700: "#7b1fa2",
                    800: "#6a1b9a",
                    900: "#4a148c",
                    A100: "#ea80fc",
                    A200: "#e040fb",
                    A400: "#d500f9",
                    A700: "#aa00ff"
                },
                tE = {
                    50: "#ffebee",
                    100: "#ffcdd2",
                    200: "#ef9a9a",
                    300: "#e57373",
                    400: "#ef5350",
                    500: "#f44336",
                    600: "#e53935",
                    700: "#d32f2f",
                    800: "#c62828",
                    900: "#b71c1c",
                    A100: "#ff8a80",
                    A200: "#ff5252",
                    A400: "#ff1744",
                    A700: "#d50000"
                },
                tI = {
                    50: "#fff3e0",
                    100: "#ffe0b2",
                    200: "#ffcc80",
                    300: "#ffb74d",
                    400: "#ffa726",
                    500: "#ff9800",
                    600: "#fb8c00",
                    700: "#f57c00",
                    800: "#ef6c00",
                    900: "#e65100",
                    A100: "#ffd180",
                    A200: "#ffab40",
                    A400: "#ff9100",
                    A700: "#ff6d00"
                },
                tR = {
                    50: "#e3f2fd",
                    100: "#bbdefb",
                    200: "#90caf9",
                    300: "#64b5f6",
                    400: "#42a5f5",
                    500: "#2196f3",
                    600: "#1e88e5",
                    700: "#1976d2",
                    800: "#1565c0",
                    900: "#0d47a1",
                    A100: "#82b1ff",
                    A200: "#448aff",
                    A400: "#2979ff",
                    A700: "#2962ff"
                },
                tB = {
                    50: "#e1f5fe",
                    100: "#b3e5fc",
                    200: "#81d4fa",
                    300: "#4fc3f7",
                    400: "#29b6f6",
                    500: "#03a9f4",
                    600: "#039be5",
                    700: "#0288d1",
                    800: "#0277bd",
                    900: "#01579b",
                    A100: "#80d8ff",
                    A200: "#40c4ff",
                    A400: "#00b0ff",
                    A700: "#0091ea"
                },
                tM = {
                    50: "#e8f5e9",
                    100: "#c8e6c9",
                    200: "#a5d6a7",
                    300: "#81c784",
                    400: "#66bb6a",
                    500: "#4caf50",
                    600: "#43a047",
                    700: "#388e3c",
                    800: "#2e7d32",
                    900: "#1b5e20",
                    A100: "#b9f6ca",
                    A200: "#69f0ae",
                    A400: "#00e676",
                    A700: "#00c853"
                },
                tN = ["mode", "contrastThreshold", "tonalOffset"],
                tW = {
                    text: {
                        primary: "rgba(0, 0, 0, 0.87)",
                        secondary: "rgba(0, 0, 0, 0.6)",
                        disabled: "rgba(0, 0, 0, 0.38)"
                    },
                    divider: "rgba(0, 0, 0, 0.12)",
                    background: {
                        paper: tA.white,
                        default: tA.white
                    },
                    action: {
                        active: "rgba(0, 0, 0, 0.54)",
                        hover: "rgba(0, 0, 0, 0.04)",
                        hoverOpacity: .04,
                        selected: "rgba(0, 0, 0, 0.08)",
                        selectedOpacity: .08,
                        disabled: "rgba(0, 0, 0, 0.26)",
                        disabledBackground: "rgba(0, 0, 0, 0.12)",
                        disabledOpacity: .38,
                        focus: "rgba(0, 0, 0, 0.12)",
                        focusOpacity: .12,
                        activatedOpacity: .12
                    }
                },
                tz = {
                    text: {
                        primary: tA.white,
                        secondary: "rgba(255, 255, 255, 0.7)",
                        disabled: "rgba(255, 255, 255, 0.5)",
                        icon: "rgba(255, 255, 255, 0.5)"
                    },
                    divider: "rgba(255, 255, 255, 0.12)",
                    background: {
                        paper: "#121212",
                        default: "#121212"
                    },
                    action: {
                        active: tA.white,
                        hover: "rgba(255, 255, 255, 0.08)",
                        hoverOpacity: .08,
                        selected: "rgba(255, 255, 255, 0.16)",
                        selectedOpacity: .16,
                        disabled: "rgba(255, 255, 255, 0.3)",
                        disabledBackground: "rgba(255, 255, 255, 0.12)",
                        disabledOpacity: .38,
                        focus: "rgba(255, 255, 255, 0.12)",
                        focusOpacity: .12,
                        activatedOpacity: .24
                    }
                };

            function t$(e, t, r, n) {
                var o = n.light || n,
                    i = n.dark || 1.5 * n;
                e[t] || (e.hasOwnProperty(r) ? e[t] = e[r] : "light" === t ? e.light = (0, tC.lighten)(e.main, o) : "dark" === t && (e.dark = (0, tC.darken)(e.main, i)))
            }
            var t_ = ["fontFamily", "fontSize", "fontWeightLight", "fontWeightRegular", "fontWeightMedium", "fontWeightBold", "htmlFontSize", "allVariants", "pxToRem"],
                tD = {
                    textTransform: "uppercase"
                },
                tV = '"Roboto", "Helvetica", "Arial", sans-serif';

            function tL() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return ["".concat(t[0], "px ").concat(t[1], "px ").concat(t[2], "px ").concat(t[3], "px rgba(0,0,0,").concat(.2, ")"), "".concat(t[4], "px ").concat(t[5], "px ").concat(t[6], "px ").concat(t[7], "px rgba(0,0,0,").concat(.14, ")"), "".concat(t[8], "px ").concat(t[9], "px ").concat(t[10], "px ").concat(t[11], "px rgba(0,0,0,").concat(.12, ")")].join(",")
            }
            var tH = ["none", tL(0, 2, 1, -1, 0, 1, 1, 0, 0, 1, 3, 0), tL(0, 3, 1, -2, 0, 2, 2, 0, 0, 1, 5, 0), tL(0, 3, 3, -2, 0, 3, 4, 0, 0, 1, 8, 0), tL(0, 2, 4, -1, 0, 4, 5, 0, 0, 1, 10, 0), tL(0, 3, 5, -1, 0, 5, 8, 0, 0, 1, 14, 0), tL(0, 3, 5, -1, 0, 6, 10, 0, 0, 1, 18, 0), tL(0, 4, 5, -2, 0, 7, 10, 1, 0, 2, 16, 1), tL(0, 5, 5, -3, 0, 8, 10, 1, 0, 3, 14, 2), tL(0, 5, 6, -3, 0, 9, 12, 1, 0, 3, 16, 2), tL(0, 6, 6, -3, 0, 10, 14, 1, 0, 4, 18, 3), tL(0, 6, 7, -4, 0, 11, 15, 1, 0, 4, 20, 3), tL(0, 7, 8, -4, 0, 12, 17, 2, 0, 5, 22, 4), tL(0, 7, 8, -4, 0, 13, 19, 2, 0, 5, 24, 4), tL(0, 7, 9, -4, 0, 14, 21, 2, 0, 5, 26, 4), tL(0, 8, 9, -5, 0, 15, 22, 2, 0, 6, 28, 5), tL(0, 8, 10, -5, 0, 16, 24, 2, 0, 6, 30, 5), tL(0, 8, 11, -5, 0, 17, 26, 2, 0, 6, 32, 5), tL(0, 9, 11, -5, 0, 18, 28, 2, 0, 7, 34, 6), tL(0, 9, 12, -6, 0, 19, 29, 2, 0, 7, 36, 6), tL(0, 10, 13, -6, 0, 20, 31, 3, 0, 8, 38, 7), tL(0, 10, 13, -6, 0, 21, 33, 3, 0, 8, 40, 7), tL(0, 10, 14, -6, 0, 22, 35, 3, 0, 8, 42, 7), tL(0, 11, 14, -7, 0, 23, 36, 3, 0, 9, 44, 8), tL(0, 11, 15, -7, 0, 24, 38, 3, 0, 9, 46, 8)],
                tU = ["duration", "easing", "delay"],
                tK = {
                    easeInOut: "cubic-bezier(0.4, 0, 0.2, 1)",
                    easeOut: "cubic-bezier(0.0, 0, 0.2, 1)",
                    easeIn: "cubic-bezier(0.4, 0, 1, 1)",
                    sharp: "cubic-bezier(0.4, 0, 0.6, 1)"
                },
                tG = {
                    shortest: 150,
                    shorter: 200,
                    short: 250,
                    standard: 300,
                    complex: 375,
                    enteringScreen: 225,
                    leavingScreen: 195
                };

            function tF(e) {
                return "".concat(Math.round(e), "ms")
            }

            function tq(e) {
                if (!e) return 0;
                var t = e / 36;
                return Math.round((4 + 15 * Math.pow(t, .25) + t / 5) * 10)
            }
            var tZ = {
                    mobileStepper: 1e3,
                    fab: 1050,
                    speedDial: 1050,
                    appBar: 1100,
                    drawer: 1200,
                    modal: 1300,
                    snackbar: 1400,
                    tooltip: 1500
                },
                tX = ["breakpoints", "mixins", "spacing", "palette", "transitions", "typography", "shape"],
                tY = function() {
                    for (var e, t, r, n, o, i, a, c, s, l, u, f, d, p, y, h, v, m, g, b, x, w, O, S, j, k, C, A, P = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}, T = arguments.length, R = Array(T > 1 ? T - 1 : 0), M = 1; M < T; M++) R[M - 1] = arguments[M];
                    var N = P.mixins,
                        W = P.palette,
                        z = P.transitions,
                        $ = P.typography,
                        _ = I(P, tX);
                    if (P.vars) throw Error((0, D.Z)(18));
                    var V = function(e) {
                            var t = e.mode,
                                r = void 0 === t ? "light" : t,
                                n = e.contrastThreshold,
                                o = void 0 === n ? 3 : n,
                                i = e.tonalOffset,
                                a = void 0 === i ? .2 : i,
                                c = I(e, tN),
                                s = e.primary || function() {
                                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "light";
                                    return "dark" === e ? {
                                        main: tR["200"],
                                        light: tR["50"],
                                        dark: tR["400"]
                                    } : {
                                        main: tR["700"],
                                        light: tR["400"],
                                        dark: tR["800"]
                                    }
                                }(r),
                                l = e.secondary || function() {
                                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "light";
                                    return "dark" === e ? {
                                        main: tT["200"],
                                        light: tT["50"],
                                        dark: tT["400"]
                                    } : {
                                        main: tT["500"],
                                        light: tT["300"],
                                        dark: tT["700"]
                                    }
                                }(r),
                                u = e.error || function() {
                                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "light";
                                    return "dark" === e ? {
                                        main: tE["500"],
                                        light: tE["300"],
                                        dark: tE["700"]
                                    } : {
                                        main: tE["700"],
                                        light: tE["400"],
                                        dark: tE["800"]
                                    }
                                }(r),
                                f = e.info || function() {
                                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "light";
                                    return "dark" === e ? {
                                        main: tB["400"],
                                        light: tB["300"],
                                        dark: tB["700"]
                                    } : {
                                        main: tB["700"],
                                        light: tB["500"],
                                        dark: tB["900"]
                                    }
                                }(r),
                                d = e.success || function() {
                                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "light";
                                    return "dark" === e ? {
                                        main: tM["400"],
                                        light: tM["300"],
                                        dark: tM["700"]
                                    } : {
                                        main: tM["800"],
                                        light: tM["500"],
                                        dark: tM["900"]
                                    }
                                }(r),
                                p = e.warning || function() {
                                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "light";
                                    return "dark" === e ? {
                                        main: tI["400"],
                                        light: tI["300"],
                                        dark: tI["700"]
                                    } : {
                                        main: "#ed6c02",
                                        light: tI["500"],
                                        dark: tI["900"]
                                    }
                                }(r);

                            function y(e) {
                                return (0, tC.getContrastRatio)(e, tz.text.primary) >= o ? tz.text.primary : tW.text.primary
                            }
                            var h = function(e) {
                                var t = e.color,
                                    r = e.name,
                                    n = e.mainShade,
                                    o = void 0 === n ? 500 : n,
                                    i = e.lightShade,
                                    c = e.darkShade;
                                if (!(t = E({}, t)).main && t[o] && (t.main = t[o]), !t.hasOwnProperty("main")) throw Error((0, D.Z)(11, r ? " (".concat(r, ")") : "", o));
                                if ("string" != typeof t.main) throw Error((0, D.Z)(12, r ? " (".concat(r, ")") : "", JSON.stringify(t.main)));
                                return t$(t, "light", void 0 === i ? 300 : i, a), t$(t, "dark", void 0 === c ? 700 : c, a), t.contrastText || (t.contrastText = y(t.main)), t
                            };
                            return B(E({
                                common: E({}, tA),
                                mode: r,
                                primary: h({
                                    color: s,
                                    name: "primary"
                                }),
                                secondary: h({
                                    color: l,
                                    name: "secondary",
                                    mainShade: "A400",
                                    lightShade: "A200",
                                    darkShade: "A700"
                                }),
                                error: h({
                                    color: u,
                                    name: "error"
                                }),
                                warning: h({
                                    color: p,
                                    name: "warning"
                                }),
                                info: h({
                                    color: f,
                                    name: "info"
                                }),
                                success: h({
                                    color: d,
                                    name: "success"
                                }),
                                grey: tP,
                                contrastThreshold: o,
                                getContrastText: y,
                                augmentColor: h,
                                tonalOffset: a
                            }, {
                                dark: tz,
                                light: tW
                            } [r]), c)
                        }(void 0 === W ? {} : W),
                        L = eL(P),
                        H = B(L, {
                            mixins: (e = L.breakpoints, t = void 0 === N ? {} : N, E({
                                toolbar: (tk(r = {
                                    minHeight: 56
                                }, e.up("xs"), {
                                    "@media (orientation: landscape)": {
                                        minHeight: 48
                                    }
                                }), tk(r, e.up("sm"), {
                                    minHeight: 64
                                }), r)
                            }, t)),
                            palette: V,
                            shadows: tH.slice(),
                            typography: (a = void 0 === (i = (o = "function" == typeof(n = void 0 === $ ? {} : $) ? n(V) : n).fontFamily) ? tV : i, s = void 0 === (c = o.fontSize) ? 14 : c, u = void 0 === (l = o.fontWeightLight) ? 300 : l, d = void 0 === (f = o.fontWeightRegular) ? 400 : f, y = void 0 === (p = o.fontWeightMedium) ? 500 : p, h = o.fontWeightBold, m = void 0 === (v = o.htmlFontSize) ? 16 : v, g = o.allVariants, b = o.pxToRem, x = I(o, t_), w = s / 14, O = b || function(e) {
                                return "".concat(e / m * w, "rem")
                            }, j = {
                                h1: (S = function(e, t, r, n, o) {
                                    return E({
                                        fontFamily: a,
                                        fontWeight: e,
                                        fontSize: O(t),
                                        lineHeight: r
                                    }, a === tV ? {
                                        letterSpacing: "".concat(Math.round(n / t * 1e5) / 1e5, "em")
                                    } : {}, o, g)
                                })(u, 96, 1.167, -1.5),
                                h2: S(u, 60, 1.2, -.5),
                                h3: S(d, 48, 1.167, 0),
                                h4: S(d, 34, 1.235, .25),
                                h5: S(d, 24, 1.334, 0),
                                h6: S(y, 20, 1.6, .15),
                                subtitle1: S(d, 16, 1.75, .15),
                                subtitle2: S(y, 14, 1.57, .1),
                                body1: S(d, 16, 1.5, .15),
                                body2: S(d, 14, 1.43, .15),
                                button: S(y, 14, 1.75, .4, tD),
                                caption: S(d, 12, 1.66, .4),
                                overline: S(d, 12, 2.66, 1, tD),
                                inherit: {
                                    fontFamily: "inherit",
                                    fontWeight: "inherit",
                                    fontSize: "inherit",
                                    lineHeight: "inherit",
                                    letterSpacing: "inherit"
                                }
                            }, B(E({
                                htmlFontSize: m,
                                pxToRem: O,
                                fontFamily: a,
                                fontSize: s,
                                fontWeightLight: u,
                                fontWeightRegular: d,
                                fontWeightMedium: y,
                                fontWeightBold: void 0 === h ? 700 : h
                            }, j), x, {
                                clone: !1
                            })),
                            transitions: (C = E({}, tK, (k = void 0 === z ? {} : z).easing), A = E({}, tG, k.duration), E({
                                getAutoHeightDuration: tq,
                                create: function() {
                                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : ["all"],
                                        t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                                        r = t.duration,
                                        n = void 0 === r ? A.standard : r,
                                        o = t.easing,
                                        i = void 0 === o ? C.easeInOut : o,
                                        a = t.delay,
                                        c = void 0 === a ? 0 : a;
                                    return I(t, tU), (Array.isArray(e) ? e : [e]).map(function(e) {
                                        return "".concat(e, " ").concat("string" == typeof n ? n : tF(n), " ").concat(i, " ").concat("string" == typeof c ? c : tF(c))
                                    }).join(",")
                                }
                            }, k, {
                                easing: C,
                                duration: A
                            })),
                            zIndex: E({}, tZ)
                        });
                    return H = B(H, _), (H = R.reduce(function(e, t) {
                        return B(e, t)
                    }, H)).unstable_sxConfig = E({}, eW, null == _ ? void 0 : _.unstable_sxConfig), H.unstable_sx = function(e) {
                        return e_({
                            sx: e,
                            theme: this
                        })
                    }, H
                }();

            function tJ() {
                var e = tj(tY);
                return e.$$material || e
            }

            function tQ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var t0 = Object.fromEntries ? Object.fromEntries : function(e) {
                if (!e || !e[Symbol.iterator]) throw Error("Object.fromEntries() requires a single iterable argument");
                var t = {};
                return Object.keys(e).forEach(function(r) {
                    var n, o = function(e) {
                            if (Array.isArray(e)) return e
                        }(n = e[r]) || function(e, t) {
                            var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != o) {
                                var i = [],
                                    a = !0,
                                    c = !1;
                                try {
                                    for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), i.length !== t); a = !0);
                                } catch (e) {
                                    c = !0, n = e
                                } finally {
                                    try {
                                        a || null == o.return || o.return()
                                    } finally {
                                        if (c) throw n
                                    }
                                }
                                return i
                            }
                        }(n, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return tQ(e, 2);
                                var r = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tQ(e, t)
                            }
                        }(n, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        i = o[0],
                        a = o[1];
                    t[i] = a
                }), t
            };

            function t1(e) {
                return Object.keys(e)
            }

            function t2(e, t) {
                if (!e) throw Error(t)
            }
            var t5 = function(e) {
                    for (var t = e.length, r = 0, n = ""; r < t; r++) {
                        var o = e[r];
                        if (null != o) {
                            var i = void 0;
                            switch (void 0 === o ? "undefined" : o && "undefined" != typeof Symbol && o.constructor === Symbol ? "symbol" : typeof o) {
                                case "boolean":
                                    break;
                                case "object":
                                    if (Array.isArray(o)) i = t5(o);
                                    else
                                        for (var a in t2(!0), i = "", o) o[a] && a && (i && (i += " "), i += a);
                                    break;
                                default:
                                    i = o
                            }
                            i && (n && (n += " "), n += i)
                        }
                    }
                    return n
                },
                t4 = {
                    animationIterationCount: 1,
                    aspectRatio: 1,
                    borderImageOutset: 1,
                    borderImageSlice: 1,
                    borderImageWidth: 1,
                    boxFlex: 1,
                    boxFlexGroup: 1,
                    boxOrdinalGroup: 1,
                    columnCount: 1,
                    columns: 1,
                    flex: 1,
                    flexGrow: 1,
                    flexPositive: 1,
                    flexShrink: 1,
                    flexNegative: 1,
                    flexOrder: 1,
                    gridRow: 1,
                    gridRowEnd: 1,
                    gridRowSpan: 1,
                    gridRowStart: 1,
                    gridColumn: 1,
                    gridColumnEnd: 1,
                    gridColumnSpan: 1,
                    gridColumnStart: 1,
                    msGridRow: 1,
                    msGridRowSpan: 1,
                    msGridColumn: 1,
                    msGridColumnSpan: 1,
                    fontWeight: 1,
                    lineHeight: 1,
                    opacity: 1,
                    order: 1,
                    orphans: 1,
                    scale: 1,
                    tabSize: 1,
                    widows: 1,
                    zIndex: 1,
                    zoom: 1,
                    WebkitLineClamp: 1,
                    fillOpacity: 1,
                    floodOpacity: 1,
                    stopOpacity: 1,
                    strokeDasharray: 1,
                    strokeDashoffset: 1,
                    strokeMiterlimit: 1,
                    strokeOpacity: 1,
                    strokeWidth: 1
                };

            function t3(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var t8 = /[A-Z]|^ms/g,
                t6 = /_EMO_([^_]+?)_([^]*?)_EMO_/g,
                t7 = function(e) {
                    return 45 === e.charCodeAt(1)
                },
                t9 = function(e) {
                    return null != e && "boolean" != typeof e
                },
                re = (o = function(e) {
                    return t7(e) ? e : e.replace(t8, "-$&").toLowerCase()
                }, i = Object.create(null), function(e) {
                    return void 0 === i[e] && (i[e] = o(e)), i[e]
                }),
                rt = function(e, t) {
                    switch (e) {
                        case "animation":
                        case "animationName":
                            if ("string" == typeof t) return t.replace(t6, function(e, t, r) {
                                return O = {
                                    name: t,
                                    styles: r,
                                    next: O
                                }, t
                            })
                    }
                    return 1 === t4[e] || t7(e) || "number" != typeof t || 0 === t ? t : t + "px"
                };

            function rr(e, t, r) {
                if (null == r) return "";
                if (void 0 !== r.__emotion_styles) return r;
                switch (void 0 === r ? "undefined" : t3(r)) {
                    case "boolean":
                        return "";
                    case "object":
                        if (1 === r.anim) return O = {
                            name: r.name,
                            styles: r.styles,
                            next: O
                        }, r.name;
                        if (void 0 !== r.styles) {
                            var n = r.next;
                            if (void 0 !== n)
                                for (; void 0 !== n;) O = {
                                    name: n.name,
                                    styles: n.styles,
                                    next: O
                                }, n = n.next;
                            return r.styles + ";"
                        }
                        return function(e, t, r) {
                            var n = "";
                            if (Array.isArray(r))
                                for (var o = 0; o < r.length; o++) n += rr(e, t, r[o]) + ";";
                            else
                                for (var i in r) {
                                    var a = r[i];
                                    if ((void 0 === a ? "undefined" : t3(a)) !== "object") null != t && void 0 !== t[a] ? n += i + "{" + t[a] + "}" : t9(a) && (n += re(i) + ":" + rt(i, a) + ";");
                                    else if (Array.isArray(a) && "string" == typeof a[0] && (null == t || void 0 === t[a[0]]))
                                        for (var c = 0; c < a.length; c++) t9(a[c]) && (n += re(i) + ":" + rt(i, a[c]) + ";");
                                    else {
                                        var s = rr(e, t, a);
                                        switch (i) {
                                            case "animation":
                                            case "animationName":
                                                n += re(i) + ":" + s + ";";
                                                break;
                                            default:
                                                n += i + "{" + s + "}"
                                        }
                                    }
                                }
                            return n
                        }(e, t, r);
                    case "function":
                        if (void 0 !== e) {
                            var o = O,
                                i = r(e);
                            return O = o, rr(e, t, i)
                        }
                }
                if (null == t) return r;
                var a = t[r];
                return void 0 !== a ? a : r
            }
            var rn = /label:\s*([^\s;{]+)\s*(;|$)/g,
                ro = function(e, t, r) {
                    var n = e.key + "-" + t.name;
                    !1 === r && void 0 === e.registered[n] && (e.registered[n] = t.styles)
                },
                ri = function(e, t, r) {
                    ro(e, t, r);
                    var n = e.key + "-" + t.name;
                    if (void 0 === e.inserted[t.name]) {
                        var o = t;
                        do e.insert(t === o ? "." + n : "", o, e.sheet, !0), o = o.next; while (void 0 !== o)
                    }
                };

            function ra(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rc(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var rs = (a = function(e, t, r) {
                var n, o = [],
                    i = (n = "", r.split(" ").forEach(function(t) {
                        void 0 !== e[t] ? o.push(e[t] + ";") : t && (n += t + " ")
                    }), n);
                return o.length < 2 ? r : i + t(o)
            }, {
                createCssAndCx: function(e) {
                    var t = e.cache,
                        r = function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var o = function(e, t, r) {
                                if (1 === e.length && "object" === t3(e[0]) && null !== e[0] && void 0 !== e[0].styles) return e[0];
                                var n, o = !0,
                                    i = "";
                                O = void 0;
                                var a = e[0];
                                null == a || void 0 === a.raw ? (o = !1, i += rr(void 0, t, a)) : i += a[0];
                                for (var c = 1; c < e.length; c++) i += rr(void 0, t, e[c]), o && (i += a[c]);
                                rn.lastIndex = 0;
                                for (var s = ""; null !== (n = rn.exec(i));) s += "-" + n[1];
                                return {
                                    name: function(e) {
                                        for (var t, r = 0, n = 0, o = e.length; o >= 4; ++n, o -= 4) t = (65535 & (t = 255 & e.charCodeAt(n) | (255 & e.charCodeAt(++n)) << 8 | (255 & e.charCodeAt(++n)) << 16 | (255 & e.charCodeAt(++n)) << 24)) * 0x5bd1e995 + ((t >>> 16) * 59797 << 16), t ^= t >>> 24, r = (65535 & t) * 0x5bd1e995 + ((t >>> 16) * 59797 << 16) ^ (65535 & r) * 0x5bd1e995 + ((r >>> 16) * 59797 << 16);
                                        switch (o) {
                                            case 3:
                                                r ^= (255 & e.charCodeAt(n + 2)) << 16;
                                            case 2:
                                                r ^= (255 & e.charCodeAt(n + 1)) << 8;
                                            case 1:
                                                r ^= 255 & e.charCodeAt(n), r = (65535 & r) * 0x5bd1e995 + ((r >>> 16) * 59797 << 16)
                                        }
                                        return r ^= r >>> 13, (((r = (65535 & r) * 0x5bd1e995 + ((r >>> 16) * 59797 << 16)) ^ r >>> 15) >>> 0).toString(36)
                                    }(i) + s,
                                    styles: i,
                                    next: O
                                }
                            }(r, t.registered);
                            ri(t, o, !1);
                            var i = "".concat(t.key, "-").concat(o.name);
                            e: {
                                var a = r[0];
                                if (!(a instanceof Object && !("styles" in a) && !("length" in a) && !("__emotion_styles" in a))) break e;ru.saveClassNameCSSObjectMapping(t, i, a)
                            }
                            return i
                        };
                    return {
                        css: r,
                        cx: function() {
                            for (var e = arguments.length, n = Array(e), o = 0; o < e; o++) n[o] = arguments[o];
                            var i = t5(n),
                                c = ru.fixClassName(t, i, r);
                            return a(t.registered, r, c)
                        }
                    }
                }
            }).createCssAndCx;

            function rl(e) {
                var t = e.useCache;
                return {
                    useCssAndCx: function() {
                        var e = t(),
                            r = function(e, t) {
                                var r, n = (0, C.useRef)();
                                return (!n.current || t.length !== (null === (r = n.current.prevDeps) || void 0 === r ? void 0 : r.length) || n.current.prevDeps.map(function(e, r) {
                                    return e === t[r]
                                }).indexOf(!1) >= 0) && (n.current = {
                                    v: e(),
                                    prevDeps: function(e) {
                                        if (Array.isArray(e)) return ra(e)
                                    }(t) || function(e) {
                                        if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                    }(t) || function(e, t) {
                                        if (e) {
                                            if ("string" == typeof e) return ra(e, void 0);
                                            var r = Object.prototype.toString.call(e).slice(8, -1);
                                            if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ra(e, t)
                                        }
                                    }(t) || function() {
                                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                    }()
                                }), n.current.v
                            }(function() {
                                return rs({
                                    cache: e
                                })
                            }, [e]);
                        return {
                            css: r.css,
                            cx: r.cx
                        }
                    }
                }
            }
            var ru = (c = new WeakMap, {
                saveClassNameCSSObjectMapping: function(e, t, r) {
                    var n = c.get(e);
                    void 0 === n && (n = new Map, c.set(e, n)), n.set(t, r)
                },
                fixClassName: (s = function(e) {
                    var t = !1;
                    return e.map(function(e) {
                        var r, n = function(e) {
                                if (Array.isArray(e)) return e
                            }(e) || function(e, t) {
                                var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                if (null != o) {
                                    var i = [],
                                        a = !0,
                                        c = !1;
                                    try {
                                        for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), i.length !== t); a = !0);
                                    } catch (e) {
                                        c = !0, n = e
                                    } finally {
                                        try {
                                            a || null == o.return || o.return()
                                        } finally {
                                            if (c) throw n
                                        }
                                    }
                                    return i
                                }
                            }(e, 2) || function(e, t) {
                                if (e) {
                                    if ("string" == typeof e) return rc(e, 2);
                                    var r = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rc(e, t)
                                }
                            }(e, 2) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }(),
                            o = n[0],
                            i = n[1];
                        if (void 0 === i) return o;
                        if (t) r = {
                            "&&": i
                        };
                        else
                            for (var a in r = o, i)
                                if (a.startsWith("@media")) {
                                    t = !0;
                                    break
                                } return r
                    })
                }, function(e, t, r) {
                    var n = c.get(e);
                    return t5(s(t.split(" ").map(function(e) {
                        return [e, null == n ? void 0 : n.get(e)]
                    })).map(function(e) {
                        return "string" == typeof e ? e : r(e)
                    }))
                })
            });

            function rf(e) {
                if (!(e instanceof Object) || "function" == typeof e) return e;
                var t = [];
                for (var r in e) {
                    var n = e[r],
                        o = void 0 === n ? "undefined" : n && "undefined" != typeof Symbol && n.constructor === Symbol ? "symbol" : typeof n;
                    if (!("string" === o || "number" === o && !isNaN(n) || "boolean" === o || null == n)) return e;
                    t.push("".concat(r, ":").concat(o, "_").concat(n))
                }
                return "xSqLiJdLMd9s" + t.join("|")
            }

            function rd(e, t, r) {
                if (!(t instanceof Object)) return e;
                var n = {};
                return t1(e).forEach(function(o) {
                    return n[o] = r(e[o], t[o])
                }), t1(t).forEach(function(r) {
                    if (!(r in e)) {
                        var o = t[r];
                        "string" == typeof o && (n[r] = o)
                    }
                }), n
            }
            var rp = function(e) {
                var t, r, n = e.classes,
                    o = e.theme,
                    i = e.muiStyleOverridesParams,
                    a = e.css,
                    c = e.cx,
                    s = e.name;
                t: {
                    if ("makeStyle no name" === s) {
                        s = void 0;
                        break t
                    }
                    if (void 0 !== i && void 0 === s) throw Error("To use muiStyleOverridesParams, you must specify a name using .withName('MyComponent')")
                }
                var l = void 0;
                try {
                    l = void 0 === s ? void 0 : (null === (r = null === (t = o.components) || void 0 === t ? void 0 : t[s]) || void 0 === r ? void 0 : r.styleOverrides) || void 0
                } catch (e) {}
                var u = (0, C.useMemo)(function() {
                    if (void 0 !== l) {
                        var e = {};
                        for (var t in l) {
                            var r = l[t];
                            r instanceof Object && (e[t] = a("function" == typeof r ? r(function(e) {
                                for (var t = 1; t < arguments.length; t++) {
                                    var r = null != arguments[t] ? arguments[t] : {},
                                        n = Object.keys(r);
                                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                                    }))), n.forEach(function(t) {
                                        var n;
                                        n = r[t], t in e ? Object.defineProperty(e, t, {
                                            value: n,
                                            enumerable: !0,
                                            configurable: !0,
                                            writable: !0
                                        }) : e[t] = n
                                    })
                                }
                                return e
                            }({
                                theme: o,
                                ownerState: null == i ? void 0 : i.ownerState
                            }, null == i ? void 0 : i.props)) : r))
                        }
                        return e
                    }
                }, [l, rf(null == i ? void 0 : i.props), rf(null == i ? void 0 : i.ownerState), a]);
                return {
                    classes: n = (0, C.useMemo)(function() {
                        return rd(n, u, c)
                    }, [n, u, c])
                }
            };

            function ry(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var rh = 0;

            function rv(e) {
                var t = e.useTheme,
                    r = rg({
                        cacheProvidedAtInception: e.cache
                    }).useCache,
                    n = rl({
                        useCache: r
                    }).useCssAndCx;
                return {
                    makeStyles: function(e) {
                        var o = null != e ? e : {},
                            i = o.name,
                            a = o.uniqId,
                            c = void 0 === a ? "".concat(rh++) : a,
                            s = (void 0 === i ? "undefined" : ry(i)) !== "object" ? i : Object.keys(i)[0];
                        return function(e) {
                            var o = "function" == typeof e ? e : function() {
                                return e
                            };
                            return function(e, i) {
                                var a = t(),
                                    l = n(),
                                    u = l.css,
                                    f = l.cx,
                                    d = r(),
                                    p = (0, C.useMemo)(function() {
                                        var t = {},
                                            r = o(a, e, "undefined" != typeof Proxy && new Proxy({}, {
                                                get: function(e, r) {
                                                    return (void 0 === r ? "undefined" : ry(r)) === "symbol" && t2(!1), t[r] = "".concat(d.key, "-").concat(c).concat(void 0 !== s ? "-".concat(s) : "", "-").concat(r, "-ref")
                                                }
                                            }) || {}),
                                            n = t0(t1(r).map(function(e) {
                                                var n = r[e];
                                                return n.label || (n.label = "".concat(void 0 !== s ? "".concat(s, "-") : "").concat(e)), [e, "".concat(u(n)).concat(e in t ? " ".concat(t[e]) : "")]
                                            }));
                                        return t1(t).forEach(function(e) {
                                            !(e in n) && (n[e] = t[e])
                                        }), n
                                    }, [d, u, f, a, rf(e)]),
                                    y = null == i ? void 0 : i.props.classes,
                                    h = rp({
                                        classes: p = (0, C.useMemo)(function() {
                                            return rd(p, y, f)
                                        }, [p, rf(y), f]),
                                        css: u,
                                        cx: f,
                                        name: null != s ? s : "makeStyle no name",
                                        idOfUseStyles: c,
                                        muiStyleOverridesParams: i,
                                        theme: a
                                    });
                                return void 0 !== h.classes && (p = h.classes), void 0 !== h.css && (u = h.css), void 0 !== h.cx && (f = h.cx), {
                                    classes: p,
                                    theme: a,
                                    css: u,
                                    cx: f
                                }
                            }
                        }
                    },
                    useStyles: function() {
                        var e = t(),
                            r = n();
                        return {
                            theme: e,
                            css: r.css,
                            cx: r.cx
                        }
                    }
                }
            }
            var rm = (0, C.createContext)(void 0),
                rg = function(e) {
                    var t = e.cacheProvidedAtInception;
                    return {
                        useCache: function() {
                            var e, r = (0, C.useContext)(tx),
                                n = (0, C.useContext)(rm),
                                o = null !== (e = null != t ? t : n) && void 0 !== e ? e : r;
                            if (null === o) throw Error("In order to get SSR working with tss-react you need to explicitly provide an Emotion cache.\nMUI users be aware: This is not an error strictly related to tss-react, with or without tss-react,\nMUI needs an Emotion cache to be provided for SSR to work.\nHere is the MUI documentation related to SSR setup: https://mui.com/material-ui/guides/server-rendering/\nTSS provides helper that makes the process of setting up SSR easier: https://docs.tss-react.dev/ssr");
                            return o
                        }
                    }
                };

            function rb(e) {
                return e.charAt(0).toUpperCase() + e.slice(1)
            }

            function rx(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function rw(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        rx(e, t, r[t])
                    })
                }
                return e
            }

            function rO(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function rS(e, t) {
                if (null == e) return {};
                var r, n, o = function(e, t) {
                    if (null == e) return {};
                    var r, n, o = {},
                        i = Object.keys(e);
                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                }
                return o
            }
            var rj = new WeakMap,
                rk = "getClasses should only be used in conjunction with withStyles";

            function rC(e) {
                var t = e.classes;
                if (void 0 === t) throw Error(rk);
                var r = rj.get(t);
                if (void 0 === r) throw Error(rk);
                return r
            }

            function rA(e) {
                var t = {},
                    r = {};
                return Object.keys(e).forEach(function(n) {
                    return (n.startsWith("@media") ? r : t)[n] = e[n]
                }), Object.keys(r).forEach(function(e) {
                    var n = r[e];
                    Object.keys(n).forEach(function(r) {
                        var o;
                        return t[r] = rO(rw({}, null !== (o = t[r]) && void 0 !== o ? o : {}), rx({}, e, n[r]))
                    })
                }), t
            }
            var rP = (u = ("undefined" == typeof document ? "undefined" : (l = document) && "undefined" != typeof Symbol && l.constructor === Symbol ? "symbol" : typeof l) == "object" && "function" == typeof(null == document ? void 0 : document.getElementById), f = "undefined" != typeof jest, d = "undefined" != typeof mocha, p = "undefined" != typeof __vitest_worker__, !u && !f && !d && !p);

            function rT(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function rE(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function rI(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function rR(e) {
                rB = 0, rM.splice(0, rM.length);
                var t = e.useContext,
                    r = e.usePlugin,
                    n = rg({
                        cacheProvidedAtInception: e.cache
                    }).useCache,
                    o = rl({
                        useCache: n
                    }).useCssAndCx;
                return {
                    tss: function e(t) {
                        var r = t.useContext,
                            n = t.useCache,
                            o = t.useCssAndCx,
                            i = t.usePlugin,
                            a = t.name,
                            c = t.doesUseNestedSelectors;
                        return {
                            withParams: function() {
                                return e(rT({}, t))
                            },
                            withName: function(r) {
                                return e(rE(rT({}, t), {
                                    name: (void 0 === r ? "undefined" : rI(r)) !== "object" ? r : Object.keys(r)[0]
                                }))
                            },
                            withNestedSelectors: function() {
                                return e(rE(rT({}, t), {
                                    doesUseNestedSelectors: !0
                                }))
                            },
                            create: function(e) {
                                var t = "x".concat(rB++);
                                if (void 0 !== a)
                                    for (;;) {
                                        var s = rM.find(function(e) {
                                            return e.name === a
                                        });
                                        if (void 0 === s) break;
                                        rM.splice(rM.indexOf(s), 1)
                                    }
                                var l = "function" == typeof e ? e : function() {
                                    return e
                                };
                                return function(s) {
                                    var u, f, d, p = null != s ? s : {},
                                        y = p.classesOverrides,
                                        h = function(e, t) {
                                            if (null == e) return {};
                                            var r, n, o = function(e, t) {
                                                if (null == e) return {};
                                                var r, n, o = {},
                                                    i = Object.keys(e);
                                                for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                                                return o
                                            }(e, t);
                                            if (Object.getOwnPropertySymbols) {
                                                var i = Object.getOwnPropertySymbols(e);
                                                for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                                            }
                                            return o
                                        }(p, ["classesOverrides"]),
                                        v = r(),
                                        m = o(),
                                        g = m.css,
                                        b = m.cx,
                                        x = n(),
                                        w = function(e) {
                                            var t = e.cache,
                                                r = e.cssObjectByRuleNameOrGetCssObjectByRuleName,
                                                n = e.classesOverridesRef,
                                                o = e.paramsAndPluginParamsRef,
                                                i = e.idOfUseStyles,
                                                a = e.context,
                                                c = e.getClasses;
                                            r: {
                                                var s = rN.get(t);
                                                if (void 0 === s) break r;
                                                var l = s.get(r);
                                                if (void 0 === l) break r;
                                                var u = l.get(n);
                                                if (void 0 === u) break r;
                                                var f = u.get(o);
                                                if (void 0 === f) break r;
                                                var d = f.find(function(e) {
                                                    var t = e.context;
                                                    if (t === a) return !0;
                                                    if (t1(t).length !== t1(a).length) return !1;
                                                    for (var r in t)
                                                        if (rf(t[r]) !== rf(a[r])) return !1;
                                                    return !0
                                                });
                                                if (void 0 === d) break r;
                                                if ((null == d ? void 0 : d.idOfUseStyles) !== i) {
                                                    f.splice(f.indexOf(d), 1);
                                                    break r
                                                }
                                                return d.result
                                            }
                                            var p = c();
                                            rN.has(t) || rN.set(t, new WeakMap);
                                            var y = rN.get(t);
                                            t2(void 0 !== y), y.has(r) || y.set(r, new Map);
                                            var h = y.get(r);
                                            t2(void 0 !== h), h.has(n) || (h.size > 200 && h.clear(), h.set(n, new Map));
                                            var v = h.get(n);
                                            if (t2(void 0 !== v), !v.has(o)) {
                                                n: {
                                                    var m = "string" == typeof o ? 257 : 5;
                                                    if (v.size < m) break n;v.clear()
                                                }
                                                v.set(o, [])
                                            }
                                            var g = v.get(o);
                                            return t2(void 0 !== g), g.length > 5 && (g = []), g.push({
                                                idOfUseStyles: i,
                                                context: a,
                                                result: p
                                            }), p
                                        }({
                                            cache: x,
                                            cssObjectByRuleNameOrGetCssObjectByRuleName: e,
                                            classesOverridesRef: rf(y),
                                            paramsAndPluginParamsRef: rf(h),
                                            idOfUseStyles: t,
                                            context: v,
                                            getClasses: function() {
                                                var e = {},
                                                    r = l(rT({}, s, v, c ? {
                                                        classes: "undefined" == typeof Proxy ? {} : new Proxy({}, {
                                                            get: function(r, n) {
                                                                if ((void 0 === n ? "undefined" : rI(n)) === "symbol" && t2(!1), rP && void 0 === a) throw Error('tss-react: In SSR setups, in order to use nested selectors, you must also give a unique name to the useStyle function.\nSolution: Use tss.withName("ComponentName").withNestedSelectors<...>()... to set a name.');
                                                                if (void 0 !== a) {
                                                                    var o = rM.find(function(e) {
                                                                        return e.name === a && e.idOfUseStyles === t
                                                                    });
                                                                    void 0 === o && rM.push(o = {
                                                                        name: a,
                                                                        idOfUseStyles: t,
                                                                        nestedSelectorRuleNames: new Set
                                                                    }), o.nestedSelectorRuleNames.add(n)
                                                                }
                                                                if (void 0 !== a && void 0 !== rM.find(function(e) {
                                                                        return e.name === a && e.idOfUseStyles !== t && e.nestedSelectorRuleNames.has(n)
                                                                    })) throw Error(['tss-react: There are in your codebase two different useStyles named "'.concat(a, '" that'), "both use use the nested selector ".concat(n, ".\n"), "This may lead to CSS class name collisions, causing nested selectors to target elements outside of the intended scope.\n", "Solution: Ensure each useStyles using nested selectors has a unique name.\n", 'Use: tss.withName("UniqueName").withNestedSelectors<...>()...'].join(" "));
                                                                return e[n] = "".concat(x.key, "-").concat(void 0 !== a ? a : t, "-").concat(n, "-ref")
                                                            }
                                                        })
                                                    } : {})),
                                                    n = t0(t1(r).map(function(t) {
                                                        var n = r[t];
                                                        return n.label || (n.label = "".concat(void 0 !== a ? "".concat(a, "-") : "").concat(t)), [t, "".concat(g(n)).concat(t in e ? " ".concat(e[t]) : "")]
                                                    }));
                                                return t1(e).forEach(function(t) {
                                                    !(t in n) && (n[t] = e[t])
                                                }), n = rd(n, y, b)
                                            }
                                        }),
                                        O = i(rT({
                                            classes: w,
                                            css: g,
                                            cx: b,
                                            idOfUseStyles: t,
                                            name: a
                                        }, v, h));
                                    return rT({
                                        classes: null !== (u = O.classes) && void 0 !== u ? u : w,
                                        css: null !== (f = O.css) && void 0 !== f ? f : g,
                                        cx: null !== (d = O.cx) && void 0 !== d ? d : b
                                    }, v)
                                }
                            }
                        }
                    }({
                        useContext: t,
                        useCache: n,
                        useCssAndCx: o,
                        usePlugin: null != r ? r : function(e) {
                            return {
                                classes: e.classes,
                                cx: e.cx,
                                css: e.css
                            }
                        },
                        name: void 0,
                        doesUseNestedSelectors: !1
                    })
                }
            }
            var rB = 0,
                rM = [],
                rN = new WeakMap;
            rR({
                useContext: function() {
                    return {}
                }
            }).tss.create({});
            var rW = function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var r = null != arguments[t] ? arguments[t] : {},
                            n = Object.keys(r);
                        "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                            return Object.getOwnPropertyDescriptor(r, e).enumerable
                        }))), n.forEach(function(t) {
                            var n;
                            n = r[t], t in e ? Object.defineProperty(e, t, {
                                value: n,
                                enumerable: !0,
                                configurable: !0,
                                writable: !0
                            }) : e[t] = n
                        })
                    }
                    return e
                }({}, rv(y = {
                    useTheme: tJ
                }), function(e) {
                    var t = rv({
                        useTheme: e.useTheme,
                        cache: e.cache
                    }).makeStyles;

                    function r(e, r, n) {
                        var o, i = "string" == typeof e ? (Object.defineProperty(o = function(t) {
                                var r = t.children,
                                    n = rS(t, ["children"]);
                                return (0, C.createElement)(e, n, r)
                            }, "name", {
                                value: rb(e)
                            }), o) : e,
                            a = function() {
                                var e = (null != n ? n : {}).name;
                                if (void 0 !== e) return (void 0 === e ? "undefined" : e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e) != "object" ? e : Object.keys(e)[0];
                                var t = void 0;
                                o: {
                                    var r = i.displayName;
                                    if ("string" != typeof r || "" === r) break o;t = r
                                }
                                i: if (void 0 === t) {
                                    var o = i.name;
                                    if ("string" != typeof o || "" === o) break i;
                                    t = o
                                }
                                if (void 0 !== t) return (t = (t = t.replace(/\$/g, "usd")).replace(/\(/g, "_").replace(/\)/g, "_")).replace(/[^a-zA-Z0-9-_]/g, "_")
                            }(),
                            c = t(rO(rw({}, n), {
                                name: a
                            }))("function" == typeof r ? function(e, t, n) {
                                return rA(r(e, t, n))
                            } : rA(r)),
                            s = (0, C.forwardRef)(function(t, r) {
                                var n = t.className,
                                    o = (t.classes, rS(t, ["className", "classes"])),
                                    a = c(t, {
                                        props: t
                                    }),
                                    s = a.classes,
                                    l = (0, a.cx)(s.root, n);
                                return rj.set(s, rO(rw({}, s), {
                                    root: l
                                })), A().createElement(i, rw({
                                    ref: r,
                                    className: ! function(e) {
                                        for (var t in e)
                                            if ("root" !== t) return !0;
                                        return !1
                                    }(s) ? l : n
                                }, "string" == typeof e ? {} : {
                                    classes: s
                                }, o))
                            });
                        return void 0 !== a && (s.displayName = "".concat(rb(a), "WithStyles"), Object.defineProperty(s, "name", {
                            value: s.displayName
                        })), s
                    }
                    return r.getClasses = rC, {
                        withStyles: r
                    }
                }(y)),
                rz = rW.makeStyles;
            rW.withStyles, rR({
                useContext: function() {
                    return {
                        theme: tJ()
                    }
                },
                usePlugin: rp
            }).tss.create({});
            var r$ = ((h = {}).TITLE = "Title", h.HEADER = "Header", h.SUBHEADER = "Subheader", h.CAPTIONHEADER = "CaptionHeader", h.FOOTER = "Footer", h);

            function r_(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var rD = (r_(S = {}, r$.TITLE, {
                    marginLeft: "8px",
                    fontSize: "28px",
                    iconWidth: "28px",
                    iconHeight: "28px"
                }), r_(S, r$.HEADER, {
                    marginLeft: "4px",
                    fontSize: "24px",
                    iconWidth: "16px",
                    iconHeight: "16px"
                }), r_(S, r$.SUBHEADER, {
                    marginLeft: "4px",
                    fontSize: "16px",
                    iconWidth: "16px",
                    iconHeight: "16px"
                }), r_(S, r$.CAPTIONHEADER, {
                    marginLeft: "4px",
                    fontSize: "14px",
                    iconWidth: "16px",
                    iconHeight: "16px"
                }), r_(S, r$.FOOTER, {
                    marginLeft: "2px",
                    fontSize: "12px",
                    iconWidth: "12px",
                    iconHeight: "12px"
                }), S),
                rV = function(e) {
                    var t = {
                        badge: {
                            marginLeft: rD[e].marginLeft,
                            position: "relative",
                            display: "inline-block",
                            flexGrow: 1
                        },
                        iconImg: {
                            height: rD[e].iconHeight,
                            width: rD[e].iconWidth,
                            marginBottom: "-3x"
                        },
                        textContainer: {
                            maxWidth: "calc(100% - (".concat(rD[e].iconWidth, " + ").concat(rD[e].marginLeft, "))"),
                            width: "min-content",
                            fontStyle: "normal",
                            textDecoration: "none",
                            lineHeight: "".concat(140, "%"),
                            fontSize: rD[e].fontSize,
                            display: "inline-block",
                            height: "calc(".concat(rD[e].fontSize, " * ").concat(1.4, ")")
                        },
                        imgWrapper: {
                            display: "flex",
                            justifyContent: "flex-start",
                            alignItems: "center",
                            width: "auto"
                        },
                        wrapper: {
                            position: "relative",
                            display: "flex",
                            justifyContent: "flex-start",
                            alignItems: "center",
                            width: "100%"
                        },
                        applyEllipsisTruncation: {
                            width: "100%",
                            display: "inline-block",
                            whiteSpace: "nowrap",
                            overflow: "hidden",
                            textOverflow: "ellipsis"
                        }
                    };
                    return rz()(t)()
                };

            function rL() {}
            var rH = ["Enter", " "],
                rU = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : rL;
                    return function(t) {
                        rH.includes(t.key) && e()
                    }
                },
                rK = function(e) {
                    var t, r, n = e.size,
                        o = e.src,
                        i = e.titleText,
                        a = e.additionalContainerClass,
                        c = e.overrideContainerClass,
                        s = e.additionalImgClass,
                        l = e.overrideImgClass,
                        u = e.dataAttrs,
                        f = e.onIconClick,
                        d = void 0 === f ? rL : f;
                    if (!n) throw Error("Must provide a size prop");
                    if (!i) throw Error("Must provide a titleText for accessibility");
                    if (!o) throw Error("Must provide a src prop");
                    var p = rV(n).classes,
                        y = p.iconImg,
                        h = p.imgWrapper,
                        v = c || T()(a, void 0 === h ? "" : h),
                        m = l || [s, void 0 === y ? "" : y].join(" ") || "",
                        g = rU(d);
                    return (0, j.jsx)("span", (t = function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                var n;
                                n = r[t], t in e ? Object.defineProperty(e, t, {
                                    value: n,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = n
                            })
                        }
                        return e
                    }({
                        role: "button",
                        tabIndex: 0
                    }, void 0 === u ? {} : u), r = r = {
                        "data-rblx-badge-icon": !0,
                        className: v,
                        onClick: d,
                        onKeyDown: g,
                        children: (0, j.jsx)("img", {
                            className: m,
                            src: o,
                            title: i,
                            alt: i
                        })
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(r)) : (function(e, t) {
                        var r = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var n = Object.getOwnPropertySymbols(e);
                            r.push.apply(r, n)
                        }
                        return r
                    })(Object(r)).forEach(function(e) {
                        Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(r, e))
                    }), t))
                },
                rG = /[\r\n%#()<>?\[\\\]^`{|}]/g,
                rF = function(e, t) {
                    var r = e;
                    return (r = (r = (r = "double" === t ? r.replace(/"/g, "'") : r.replace(/'/g, '"')).replace(/>\s{1,}</g, "><")).replace(/\s{2,}/g, " ")).replace(rG, encodeURIComponent)
                },
                rq = function(e) {
                    var t;
                    return t = rF(e, "double"), "data:image/svg+xml;charset=utf-8,".concat(t)
                };
            rq('<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 28 28"><path d="M28 24a4 4 0 01-4 4H14v-4h10V4H4v24a4 4 0 01-4-4V4a4 4 0 014-4h20a4 4 0 014 4zm-7-7v4h-7v-4h3v-6h-6v17H7V7h14v10z" fill="#393b3d" fill-rule="evenodd"/></svg>'), rq('<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 28 28"><defs><clipPath id="a"><path d="M28 24a4 4 0 01-4 4H14v-4h10V4H4v24a4 4 0 01-4-4V4a4 4 0 014-4h20a4 4 0 014 4zm-7-7v4h-7v-4h3v-6h-6v17H7V7h14v10z" fill="none" clip-rule="evenodd"/></clipPath></defs><g clip-path="url(#a)"><path fill="#fff" d="M-5-5h38v38H-5z"/></g></svg>');
            var rZ = rq('<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 28 28" fill="none"> <g clip-path="url(#clip0_8_46)"> <rect x="5.88818" width="22.89" height="22.89" transform="rotate(15 5.88818 0)" fill="#0066FF"/> <path fill-rule="evenodd" clip-rule="evenodd" d="M20.543 8.7508L20.549 8.7568C21.15 9.3578 21.15 10.3318 20.549 10.9328L11.817 19.6648L7.45 15.2968C6.85 14.6958 6.85 13.7218 7.45 13.1218L7.457 13.1148C8.058 12.5138 9.031 12.5138 9.633 13.1148L11.817 15.2998L18.367 8.7508C18.968 8.1498 19.942 8.1498 20.543 8.7508Z" fill="white"/> </g> <defs> <clipPath id="clip0_8_46"> <rect width="28" height="28" fill="white"/> </clipPath> </defs> </svg>'),
                rX = ((m = "data-rblx-verified-badge-icon") in(v = {}) ? Object.defineProperty(v, m, {
                    value: "",
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : v[m] = "", v),
                rY = function(e) {
                    var t = e.size,
                        r = e.titleText,
                        n = e.additionalContainerClass,
                        o = e.overrideContainerClass,
                        i = e.additionalImgClass,
                        a = e.overrideImgClass,
                        c = e.onIconClick,
                        s = void 0 === c ? rL : c;
                    if (!t) throw Error("Must provide a size prop");
                    if (!r) throw Error("Must provide a titleText for accessibility");
                    return (0, j.jsx)(rK, {
                        dataAttrs: rX,
                        size: t,
                        titleText: r,
                        additionalContainerClass: n,
                        overrideContainerClass: o,
                        additionalImgClass: i,
                        overrideImgClass: a,
                        src: rZ,
                        onIconClick: s
                    })
                };

            function rJ(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function rQ(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        rJ(e, t, r[t])
                    })
                }
                return e
            }

            function r0(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }
            var r1 = {
                    fontWeight: 500
                },
                r2 = rJ({}, "data-rblx-badge-text-container", ""),
                r5 = rJ({}, "data-rblx-badge-text-el", ""),
                r4 = rJ({}, "data-rblx-badge-icon-el", ""),
                r3 = function(e) {
                    var t = e.size,
                        r = e.titleText,
                        n = e.showVerifiedBadge,
                        o = e.text,
                        i = e.textEl,
                        a = e.badgeEl,
                        c = e.overrideTextContainerClass,
                        s = void 0 === c ? "" : c,
                        l = e.overrideWrapperClass,
                        u = e.additionalTextContainerClass,
                        f = e.additionalWrapperClass,
                        d = e.onIconClick,
                        p = void 0 === d ? rL : d;
                    if (!t) throw Error("Must provide a size prop");
                    if (!r) throw Error("Must provide a titleText for accessibility");
                    var y = rV(t).classes,
                        h = y.wrapper,
                        v = y.textContainer,
                        m = y.badge,
                        g = y.applyEllipsisTruncation,
                        b = rU(p),
                        x = s || T()(void 0 === v ? "" : v, void 0 === u ? "" : u),
                        w = (void 0 === l ? "" : l) || T()(void 0 === h ? "" : h, void 0 === f ? "" : f),
                        O = (void 0 === i ? null : i) || (0, j.jsx)("span", {
                            className: void 0 === g ? "" : g,
                            children: o
                        }),
                        S = void 0 !== n && n ? (0, j.jsx)(rY, {
                            size: t,
                            titleText: r
                        }) : null;
                    return (0, j.jsxs)("span", r0(rQ({}, r2), {
                        className: w,
                        children: [(0, j.jsx)("span", r0(rQ({}, r5), {
                            style: s ? {} : r1,
                            className: x,
                            children: O
                        })), (0, j.jsx)("span", r0(rQ({}, r4), {
                            role: "button",
                            tabIndex: 0,
                            onClick: p,
                            onKeyDown: b,
                            className: void 0 === m ? "" : m,
                            children: (void 0 === a ? null : a) || S
                        }))]
                    }))
                };
            (b = "data-rblx-premium-badge-icon") in(g = {}) ? Object.defineProperty(g, b, {
                value: "",
                enumerable: !0,
                configurable: !0,
                writable: !0
            }): g[b] = "", r(85);
            var r8 = JSON.parse('{"I":["CommonUI.Features","Feature.ProfileBadges"]}'),
                r6 = window.Roblox["core-scripts"].intl.intl,
                r7 = r.n(r6),
                r9 = window.Roblox["core-scripts"].intl.translation;

            function ne(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var nt = function() {
                var e = new(r7()),
                    t = new r9.TranslationResourceProvider(e),
                    r = r8.I.map(function(e) {
                        return t.getTranslationResource(e)
                    }),
                    n = t.mergeTranslationResources.apply(t, function(e) {
                        if (Array.isArray(e)) return ne(e)
                    }(r) || function(e) {
                        if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(r) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return ne(e, void 0);
                            var r = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ne(e, t)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }());
                return {
                    translatedVerifiedBadgeTitleText: n.get("Creator.VerifiedBadgeIconAccessibilityText") || "Verified Badge Icon",
                    translatedVerifiedBadgeModalTitleText: n.get("VerifiedBadgeInfoTitle") || "Verified Badge",
                    translatedVerifiedBadgeModalBodyText: n.get("VerifiedBadgeInfo") || "This badge verifies that the holder is a notable and authentic creator, brand, or public figure.",
                    translatedVerifiedBadgeModalLearnMoreLinkText: n.get("VerifiedBadgeInfoLink") || "Learn More",
                    translatedVerifiedBadgeUsernameChangeText: n.get("UsernameChangeWithVerifiedBadge") || "Important: This change will result in the loss of your verified badge.\n\nYour original account creation date will carry over to your new username.",
                    translatedVerifiedBadgeTwoSVChangeText: n.get("TwoSVWithVerifiedBadge") || "Disabling 2-Step Verification will result in the loss of your verified badge and make your account less secure. Are you sure you want to proceed?",
                    translatedVerifiedBadgeGroupNameChangeText: n.get("GroupNameChangeWithVerifiedBadge") || "the verified badge will be removed.",
                    translatedVerifiedBadgeDisplayNameChangeText: n.get("DisplayNameChangeWithVerifiedBadge") || "Important: This change will result in the loss of your verified badge.\n\nYour display name can only be changed once every 7 days.",
                    translatedVerifiedBadgeModalCloseButtonText: n.get("action.close") || "Close"
                }
            };

            function nr(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nn(e, t, r, n, o, i, a) {
                try {
                    var c = e[i](a),
                        s = c.value
                } catch (e) {
                    r(e);
                    return
                }
                c.done ? t(s) : Promise.resolve(s).then(n, o)
            }

            function no(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function ni(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function na(e, t) {
                if (null == e) return {};
                var r, n, o = function(e, t) {
                    if (null == e) return {};
                    var r, n, o = {},
                        i = Object.keys(e);
                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (o[r] = e[r]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                }
                return o
            }

            function nc(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            c = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            c = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (c) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return nr(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nr(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var ns = {
                    additionalcontainerclass: "additionalContainerClass",
                    overridecontainerclass: "overrideContainerClass",
                    additionalimgclass: "additionalImgClass",
                    overrideimgclass: "overrideImgClass"
                },
                nl = {
                    text: "text",
                    overridetextcontainerclass: "overrideTextContainerClass",
                    overridewrapperclass: "overrideWrapperClass",
                    additionaltextcontainerclass: "additionalTextContainerClass",
                    additionalwrapperclass: "additionalWrapperClass"
                },
                nu = (0, k.withTranslations)(function(e) {
                    var t = e.titleText,
                        r = e.translate,
                        n = na(e, ["titleText", "translate"]);
                    return (0, j.jsx)(rY, ni(no({}, n), {
                        titleText: null != t ? t : r("Creator.VerifiedBadgeIconAccessibilityText")
                    }))
                }, r8.I),
                nf = (0, k.withTranslations)(function(e) {
                    var t = e.titleText,
                        r = e.translate,
                        n = na(e, ["titleText", "translate"]);
                    return (0, j.jsx)(r3, ni(no({}, n), {
                        titleText: null != t ? t : r("Creator.VerifiedBadgeIconAccessibilityText")
                    }))
                }, r8.I),
                nd = (x = function() {
                    var e, t, r, n, o, i, a, c, s, l, u, f, d, p, y, h, v, m, g, b, x, w, O, S, j, A, P, T, E, I, R, B, M, N, W, z, $, _, D, V, L, H, U, K, G, F, q, Z = arguments;
                    return function(e, t) {
                        var r, n, o, i, a = {
                            label: 0,
                            sent: function() {
                                if (1 & o[0]) throw o[1];
                                return o[1]
                            },
                            trys: [],
                            ops: []
                        };
                        return i = {
                            next: c(0),
                            throw: c(1),
                            return: c(2)
                        }, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                            return this
                        }), i;

                        function c(i) {
                            return function(c) {
                                return function(i) {
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; a;) try {
                                        if (r = 1, n && (o = 2 & i[0] ? n.return : i[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, i[1])).done) return o;
                                        switch (n = 0, o && (i = [2 & i[0], o.value]), i[0]) {
                                            case 0:
                                            case 1:
                                                o = i;
                                                break;
                                            case 4:
                                                return a.label++, {
                                                    value: i[1],
                                                    done: !1
                                                };
                                            case 5:
                                                a.label++, n = i[1], i = [0];
                                                continue;
                                            case 7:
                                                i = a.ops.pop(), a.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === i[0] || 2 === i[0])) {
                                                    a = 0;
                                                    continue
                                                }
                                                if (3 === i[0] && (!o || i[1] > o[0] && i[1] < o[3])) {
                                                    a.label = i[1];
                                                    break
                                                }
                                                if (6 === i[0] && a.label < o[1]) {
                                                    a.label = o[1], o = i;
                                                    break
                                                }
                                                if (o && a.label < o[2]) {
                                                    a.label = o[2], a.ops.push(i);
                                                    break
                                                }
                                                o[2] && a.ops.pop(), a.trys.pop();
                                                continue
                                        }
                                        i = t.call(e, a)
                                    } catch (e) {
                                        i = [6, e], n = 0
                                    } finally {
                                        r = o = 0
                                    }
                                    if (5 & i[0]) throw i[1];
                                    return {
                                        value: i[0] ? i[1] : void 0,
                                        done: !0
                                    }
                                }([i, c])
                            }
                        }
                    }(this, function(X) {
                        switch (X.label) {
                            case 0:
                                return t = (e = Z.length > 0 && void 0 !== Z[0] ? Z[0] : {}).overrideIconClass, r = e.overrideContainerClass, [4, Promise.resolve()];
                            case 1:
                                X.sent();
                                try {
                                    n = document.querySelectorAll(".".concat(null != r ? r : "verified-badge-text-container")), o = document.querySelectorAll(".".concat(null != t ? t : "verified-badge-icon")), i = nt().translatedVerifiedBadgeTitleText, a = !0, c = !1, s = void 0;
                                    try {
                                        for (l = n[Symbol.iterator](); !(a = (u = l.next()).done); a = !0) {
                                            y = {
                                                size: (p = (f = u.value).dataset).size,
                                                titleText: i
                                            }, h = nl, v = !0, m = !1, g = void 0;
                                            try {
                                                for (b = Object.entries(p)[Symbol.iterator](); !(v = (x = b.next()).done); v = !0) O = (w = nc(x.value, 2))[0], S = w[1], (j = h[O]) && (y[j] = S)
                                            } catch (e) {
                                                m = !0, g = e
                                            } finally {
                                                try {
                                                    v || null == b.return || b.return()
                                                } finally {
                                                    if (m) throw g
                                                }
                                            }
                                            A = document.createElement("span"), P = (0, C.createElement)(nf, y), (0, k.renderWithErrorBoundary)(P, A), null === (d = f.parentNode) || void 0 === d || d.replaceChild(A, f)
                                        }
                                    } catch (e) {
                                        c = !0, s = e
                                    } finally {
                                        try {
                                            a || null == l.return || l.return()
                                        } finally {
                                            if (c) throw s
                                        }
                                    }
                                    T = !0, E = !1, I = void 0;
                                    try {
                                        for (R = o[Symbol.iterator](); !(T = (B = R.next()).done); T = !0) {
                                            z = {
                                                size: (W = (M = B.value).dataset).size,
                                                titleText: i
                                            }, $ = !0, _ = !1, D = void 0;
                                            try {
                                                for (V = Object.entries(W)[Symbol.iterator](); !($ = (L = V.next()).done); $ = !0) U = (H = nc(L.value, 2))[0], K = H[1], (G = ns[U]) && (z[G] = K)
                                            } catch (e) {
                                                _ = !0, D = e
                                            } finally {
                                                try {
                                                    $ || null == V.return || V.return()
                                                } finally {
                                                    if (_) throw D
                                                }
                                            }
                                            F = document.createElement("span"), q = (0, C.createElement)(rY, z), (0, k.renderWithErrorBoundary)(q, F), null === (N = M.parentNode) || void 0 === N || N.replaceChild(F, M)
                                        }
                                    } catch (e) {
                                        E = !0, I = e
                                    } finally {
                                        try {
                                            T || null == R.return || R.return()
                                        } finally {
                                            if (E) throw I
                                        }
                                    }
                                } catch (e) {
                                    console.error("Failed to initialize roblox badges:", e)
                                }
                                return [2]
                        }
                    })
                }, w = function() {
                    var e = this,
                        t = arguments;
                    return new Promise(function(r, n) {
                        var o = x.apply(e, t);

                        function i(e) {
                            nn(o, r, n, i, a, "next", e)
                        }

                        function a(e) {
                            nn(o, r, n, i, a, "throw", e)
                        }
                        i(void 0)
                    })
                }, function() {
                    return w.apply(this, arguments)
                });
            (function(t, r) {
                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : window;
                if ("string" == typeof t) n[t] = r;
                else {
                    var o = function(t) {
                            if (Array.isArray(t)) return e(t)
                        }(t) || function(e) {
                            if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(t) || function(t, r) {
                            if (t) {
                                if ("string" == typeof t) return e(t, void 0);
                                var n = Object.prototype.toString.call(t).slice(8, -1);
                                if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return e(t, r)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        i = o.pop(),
                        a = n,
                        c = !0,
                        s = !1,
                        l = void 0;
                    try {
                        for (var u, f = o[Symbol.iterator](); !(c = (u = f.next()).done); c = !0) {
                            var d, p, y = u.value;
                            null !== (p = (d = a)[y]) && void 0 !== p || (d[y] = {}), a = a[y]
                        }
                    } catch (e) {
                        s = !0, l = e
                    } finally {
                        try {
                            c || null == f.return || f.return()
                        } finally {
                            if (s) throw l
                        }
                    }
                    a[i] = r
                }
            })("RobloxBadges", {
                BadgeSizes: r$,
                initRobloxBadgesFrameworkAgnostic: nd,
                VerifiedBadgeStringContainer: nf,
                VerifiedBadgeIconContainer: nu,
                currentUserHasVerifiedBadge: function() {
                    var e, t;
                    return null !== (t = null === (e = window.Roblox.CurrentUser) || void 0 === e ? void 0 : e.hasVerifiedBadge) && void 0 !== t && t
                },
                fetchTranslations: nt
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("RobloxBadges");
//# debugId=a31df6c7-0ec4-4780-aa90-a3e3c7752db5
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/robloxBadges-8ea27eaf1ed63265.js.map