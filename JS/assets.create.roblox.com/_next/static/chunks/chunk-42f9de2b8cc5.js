;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "6604f898-4666-561b-ca66-38e6687c75ef")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 656350, t => {
    "use strict";
    let n, r;
    var i, a, o, s, u, c, l, d, f, h, p = t.i(2226),
        v = t.i(221628);
    let m = "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : window;

    function y(t) {
        return Number(t)
    }
    let g = t => () => {
        throw Error("BigInt.".concat(t, " is not supported by the BigInt polyfill"))
    };
    y.asIntN = g("asIntN"), y.asUintN = g("asUintN"), m && void 0 === m.BigInt && Object.defineProperty(m, "BigInt", {
        value: y,
        writable: !0,
        configurable: !0
    });
    let b = "change",
        w = ["capture", "once", "signal"],
        x = new WeakMap,
        P = t => {
            if ("function" == typeof t) return t;
            let n = x.get(t);
            if (n) return n;
            let r = n => t.handleEvent(n);
            return x.set(t, r), r
        },
        R = (t, n, r) => {
            n !== b && console.warn("MediaQueryList polyfill: ".concat(t, " ignored '").concat(n, "' event type."));
            let i = "boolean" == typeof r ? r ? ["capture"] : [] : r ? w.filter(t => !!r[t]) : [];
            i.length > 0 && console.warn("MediaQueryList polyfill: ".concat(t, " ignored unsupported option(s) ").concat(i.join(", "), "."))
        };
    (n = (() => {
        if ("function" != typeof window.matchMedia) return;
        let t = window.matchMedia("all"),
            n = "function" == typeof t.addListener;
        if ("function" == typeof t.addEventListener || !n) return;
        let r = Object.getPrototypeOf(t);
        return "object" == typeof r && null !== r && r !== Object.prototype ? r : void 0
    })()) && (Object.defineProperty(n, "addEventListener", {
        value: function(t, n, r) {
            R("addEventListener", t, r), t === b && null != n && this.addListener(P(n))
        },
        writable: !0,
        configurable: !0
    }), Object.defineProperty(n, "removeEventListener", {
        value: function(t, n, r) {
            R("removeEventListener", t, r), t === b && null != n && this.removeListener(P(n))
        },
        writable: !0,
        configurable: !0
    }));
    "function" != typeof Object.hasOwn && Object.defineProperty(Object, "hasOwn", {
        value: function(t, n) {
            return Object.prototype.hasOwnProperty.call(t, n)
        },
        writable: !0,
        configurable: !0
    }), "u" > typeof crypto && "function" == typeof crypto.randomUUID || "u" > typeof crypto && Object.defineProperty(crypto, "randomUUID", {
        value: function() {
            let t = new Uint8Array(16);
            crypto.getRandomValues(t), t[6] = 15 & t[6] | 64, t[8] = 63 & t[8] | 128;
            let n = Array.from(t, t => t.toString(16).padStart(2, "0")).join("");
            return "".concat(n.slice(0, 8), "-").concat(n.slice(8, 12), "-").concat(n.slice(12, 16), "-").concat(n.slice(16, 20), "-").concat(n.slice(20))
        },
        writable: !0,
        configurable: !0
    });
    var S, T, E, q, k, A, C, I, j, L, O, N, D, _, M, U, B, V, F, G, W, H, K, J, z, Q, X, $, Z, Y, ee, et, en, er, ei, ea, eo, es, eu, ec, el, ed, ef, eh, ep, ev, em, ey, eg, eb, ew, ex, eP, eR, eS, eT, eE, eq, ek, eA, eC, eI, ej, eL, eO, eN, eD, e_, eM, eU, eB, eV, eF, eG, eW, eH, eK, eJ, ez, eQ, eX, e$, eZ, eY, e0, e1, e2, e4, e3, e6, e8, e5, e7, e9, te, tt, tn, tr, ti, ta, to, ts, tu, tc, tl, td, tf, th, tp, tv, tm, ty, tg, tb, tw, tx, tP, tR, tS, tT, tE, tq, tk, tA, tC, tI, tj, tL, tO, tN, tD, t_, tM, tU, tB, tV, tF, tG, tW, tH, tK, tJ, tz, tQ, tX, t$, tZ, tY, t0, t1, t2, t4, t3, t6, t8, t5, t7, t9, ne, nt, nn, nr, ni, na, no, ns, nu, nc, nl, nd, nf, nh, np, nv, nm, ny, ng, nb, nw, nx, nP, nR, nS, nT, nE, nq, nk, nA, nC, nI, nj, nL, nO, nN, nD, n_, nM, nU, nB, nV, nF, nG, nW, nH, nK, nJ, nz, nQ, nX, n$, nZ, nY, n0, n1, n2, n4, n3, n6, n8, n5, n7, n9, re, rt, rn, rr, ri, ra, ro, rs, ru, rc, rl, rd, rf, rh, rp, rv, rm, ry, rg, rb, rw, rx, rP, rR, rS, rT, rE, rq, rk, rA, rC, rI, rj, rL, rO, rN, rD, r_, rM, rU, rB, rV, rF, rG, rW, rH, rK, rJ, rz, rQ, rX, r$, rZ, rY, r0, r1, r2, r4, r3, r6, r8, r5, r7, r9, ie, it, ir, ii, ia, io, is, iu, ic, il, id, ih, ip, iv, im = t.i(929036),
        iy = {};

    function ig() {
        if (T) return S;
        T = 1;
        var t = function(t) {
            return t && t.Math === Math && t
        };
        return S = t("object" == typeof globalThis && globalThis) || t(window) || t("object" == typeof self && self) || t("object" == typeof im.c && im.c) || t("object" == typeof S && S) || function() {
            return this
        }() || Function("return this")()
    }
    var ib = {};

    function iw() {
        return q ? E : (q = 1, E = function(t) {
            try {
                return !!t()
            } catch (t) {
                return !0
            }
        })
    }

    function ix() {
        return A ? k : (A = 1, k = !iw()(function() {
            return 7 !== Object.defineProperty({}, 1, {
                get: function() {
                    return 7
                }
            })[1]
        }))
    }

    function iP() {
        return I ? C : (I = 1, C = !iw()(function() {
            var t = (function() {}).bind();
            return "function" != typeof t || t.hasOwnProperty("prototype")
        }))
    }

    function iR() {
        if (L) return j;
        L = 1;
        var t = iP(),
            n = Function.prototype.call;
        return j = t ? n.bind(n) : function() {
            return n.apply(n, arguments)
        }
    }
    var iS = {};

    function iT() {
        return D ? N : (D = 1, N = function(t, n) {
            return {
                enumerable: !(1 & t),
                configurable: !(2 & t),
                writable: !(4 & t),
                value: n
            }
        })
    }

    function iE() {
        if (M) return _;
        M = 1;
        var t = iP(),
            n = Function.prototype,
            r = n.call,
            i = t && n.bind.bind(r, r);
        return _ = t ? i : function(t) {
            return function() {
                return r.apply(t, arguments)
            }
        }
    }

    function iq() {
        if (B) return U;
        B = 1;
        var t = iE(),
            n = t({}.toString),
            r = t("".slice);
        return U = function(t) {
            return r(n(t), 8, -1)
        }
    }

    function ik() {
        if (F) return V;
        F = 1;
        var t = iE(),
            n = iw(),
            r = iq(),
            i = Object,
            a = t("".split);
        return V = n(function() {
            return !i("z").propertyIsEnumerable(0)
        }) ? function(t) {
            return "String" === r(t) ? a(t, "") : i(t)
        } : i
    }

    function iA() {
        return W ? G : (W = 1, G = function(t) {
            return null == t
        })
    }

    function iC() {
        if (K) return H;
        K = 1;
        var t = iA(),
            n = TypeError;
        return H = function(r) {
            if (t(r)) throw new n("Can't call method on " + r);
            return r
        }
    }

    function iI() {
        if (z) return J;
        z = 1;
        var t = ik(),
            n = iC();
        return J = function(r) {
            return t(n(r))
        }
    }

    function ij() {
        if (X) return Q;
        X = 1;
        var t = "object" == typeof document && document.all;
        return Q = void 0 === t && void 0 !== t ? function(n) {
            return "function" == typeof n || n === t
        } : function(t) {
            return "function" == typeof t
        }
    }

    function iL() {
        if (Z) return $;
        Z = 1;
        var t = ij();
        return $ = function(n) {
            return "object" == typeof n ? null !== n : t(n)
        }
    }

    function iO() {
        if (ee) return Y;
        ee = 1;
        var t = ig(),
            n = ij();
        return Y = function(r, i) {
            var a;
            return arguments.length < 2 ? n(a = t[r]) ? a : void 0 : t[r] && t[r][i]
        }
    }

    function iN() {
        return en ? et : (en = 1, et = iE()({}.isPrototypeOf))
    }

    function iD() {
        if (ei) return er;
        ei = 1;
        var t = ig().navigator,
            n = t && t.userAgent;
        return er = n ? String(n) : ""
    }

    function i_() {
        if (eo) return ea;
        eo = 1;
        var t, n, r = ig(),
            i = iD(),
            a = r.process,
            o = r.Deno,
            s = a && a.versions || o && o.version,
            u = s && s.v8;
        return u && (n = (t = u.split("."))[0] > 0 && t[0] < 4 ? 1 : +(t[0] + t[1])), !n && i && (!(t = i.match(/Edge\/(\d+)/)) || t[1] >= 74) && (t = i.match(/Chrome\/(\d+)/)) && (n = +t[1]), ea = n
    }

    function iM() {
        if (eu) return es;
        eu = 1;
        var t = i_(),
            n = iw(),
            r = ig().String;
        return es = !!Object.getOwnPropertySymbols && !n(function() {
            var n = Symbol("symbol detection");
            return !r(n) || !(Object(n) instanceof Symbol) || !Symbol.sham && t && t < 41
        })
    }

    function iU() {
        return el ? ec : (el = 1, ec = iM() && !Symbol.sham && "symbol" == typeof Symbol.iterator)
    }

    function iB() {
        if (ef) return ed;
        ef = 1;
        var t = iO(),
            n = ij(),
            r = iN(),
            i = iU(),
            a = Object;
        return ed = i ? function(t) {
            return "symbol" == typeof t
        } : function(i) {
            var o = t("Symbol");
            return n(o) && r(o.prototype, a(i))
        }
    }

    function iV() {
        if (ep) return eh;
        ep = 1;
        var t = String;
        return eh = function(n) {
            try {
                return t(n)
            } catch (t) {
                return "Object"
            }
        }
    }

    function iF() {
        if (em) return ev;
        em = 1;
        var t = ij(),
            n = iV(),
            r = TypeError;
        return ev = function(i) {
            if (t(i)) return i;
            throw new r(n(i) + " is not a function")
        }
    }

    function iG() {
        if (eg) return ey;
        eg = 1;
        var t = iF(),
            n = iA();
        return ey = function(r, i) {
            var a = r[i];
            return n(a) ? void 0 : t(a)
        }
    }
    var iW = {
        exports: {}
    };

    function iH() {
        return eP ? ex : (eP = 1, ex = !1)
    }

    function iK() {
        if (eS) return eR;
        eS = 1;
        var t = ig(),
            n = Object.defineProperty;
        return eR = function(r, i) {
            try {
                n(t, r, {
                    value: i,
                    configurable: !0,
                    writable: !0
                })
            } catch (n) {
                t[r] = i
            }
            return i
        }
    }

    function iJ() {
        if (eT) return iW.exports;
        eT = 1;
        var t = iH(),
            n = ig(),
            r = iK(),
            i = "__core-js_shared__",
            a = iW.exports = n[i] || r(i, {});
        return (a.versions || (a.versions = [])).push({
            version: "3.49.0",
            mode: t ? "pure" : "global",
            copyright: "© 2013–2025 Denis Pushkarev (zloirock.ru), 2025–2026 CoreJS Company (core-js.io). All rights reserved.",
            license: "https://github.com/zloirock/core-js/blob/v3.49.0/LICENSE",
            source: "https://github.com/zloirock/core-js"
        }), iW.exports
    }

    function iz() {
        if (eq) return eE;
        eq = 1;
        var t = iJ();
        return eE = function(n, r) {
            return t[n] || (t[n] = r || {})
        }
    }

    function iQ() {
        if (eA) return ek;
        eA = 1;
        var t = iC(),
            n = Object;
        return ek = function(r) {
            return n(t(r))
        }
    }

    function iX() {
        if (eI) return eC;
        eI = 1;
        var t = iE(),
            n = iQ(),
            r = t({}.hasOwnProperty);
        return eC = Object.hasOwn || function(t, i) {
            return r(n(t), i)
        }
    }

    function i$() {
        if (eL) return ej;
        eL = 1;
        var t = iE(),
            n = 0,
            r = Math.random(),
            i = t(1.1.toString);
        return ej = function(t) {
            return "Symbol(" + (void 0 === t ? "" : t) + ")_" + i(++n + r, 36)
        }
    }

    function iZ() {
        if (eN) return eO;
        eN = 1;
        var t = ig(),
            n = iz(),
            r = iX(),
            i = i$(),
            a = iM(),
            o = iU(),
            s = t.Symbol,
            u = n("wks"),
            c = o ? s.for || s : s && s.withoutSetter || i;
        return eO = function(t) {
            return r(u, t) || (u[t] = a && r(s, t) ? s[t] : c("Symbol." + t)), u[t]
        }
    }

    function iY() {
        if (eU) return eM;
        eU = 1;
        var t = function() {
                if (e_) return eD;
                e_ = 1;
                var t = iR(),
                    n = iL(),
                    r = iB(),
                    i = iG(),
                    a = function() {
                        if (ew) return eb;
                        ew = 1;
                        var t = iR(),
                            n = ij(),
                            r = iL(),
                            i = TypeError;
                        return eb = function(a, o) {
                            var s, u;
                            if ("string" === o && n(s = a.toString) && !r(u = t(s, a)) || n(s = a.valueOf) && !r(u = t(s, a)) || "string" !== o && n(s = a.toString) && !r(u = t(s, a))) return u;
                            throw new i("Can't convert object to primitive value")
                        }
                    }(),
                    o = iZ(),
                    s = TypeError,
                    u = o("toPrimitive");
                return eD = function(o, c) {
                    if (!n(o) || r(o)) return o;
                    var l, d = i(o, u);
                    if (d) {
                        if (void 0 === c && (c = "default"), !n(l = t(d, o, c)) || r(l)) return l;
                        throw new s("Can't convert object to primitive value")
                    }
                    return void 0 === c && (c = "number"), a(o, c)
                }
            }(),
            n = iB();
        return eM = function(r) {
            var i = t(r, "string");
            return n(i) ? i : i + ""
        }
    }

    function i0() {
        if (eV) return eB;
        eV = 1;
        var t = ig(),
            n = iL(),
            r = t.document,
            i = n(r) && n(r.createElement);
        return eB = function(t) {
            return i ? r.createElement(t) : {}
        }
    }

    function i1() {
        if (eG) return eF;
        eG = 1;
        var t = ix(),
            n = iw(),
            r = i0();
        return eF = !t && !n(function() {
            return 7 !== Object.defineProperty(r("div"), "a", {
                get: function() {
                    return 7
                }
            }).a
        })
    }

    function i2() {
        if (eW) return ib;
        eW = 1;
        var t = ix(),
            n = iR(),
            r = function() {
                if (O) return iS;
                O = 1;
                var t = {}.propertyIsEnumerable,
                    n = Object.getOwnPropertyDescriptor;
                return iS.f = n && !t.call({
                    1: 2
                }, 1) ? function(t) {
                    var r = n(this, t);
                    return !!r && r.enumerable
                } : t, iS
            }(),
            i = iT(),
            a = iI(),
            o = iY(),
            s = iX(),
            u = i1(),
            c = Object.getOwnPropertyDescriptor;
        return ib.f = t ? c : function(t, l) {
            if (t = a(t), l = o(l), u) try {
                return c(t, l)
            } catch (t) {}
            if (s(t, l)) return i(!n(r.f, t, l), t[l])
        }, ib
    }
    var i4 = {};

    function i3() {
        if (eK) return eH;
        eK = 1;
        var t = ix(),
            n = iw();
        return eH = t && n(function() {
            return 42 !== Object.defineProperty(function() {}, "prototype", {
                value: 42,
                writable: !1
            }).prototype
        })
    }

    function i6() {
        if (ez) return eJ;
        ez = 1;
        var t = iL(),
            n = String,
            r = TypeError;
        return eJ = function(i) {
            if (t(i)) return i;
            throw new r(n(i) + " is not an object")
        }
    }

    function i8() {
        if (eQ) return i4;
        eQ = 1;
        var t = ix(),
            n = i1(),
            r = i3(),
            i = i6(),
            a = iY(),
            o = TypeError,
            s = Object.defineProperty,
            u = Object.getOwnPropertyDescriptor,
            c = "enumerable",
            l = "configurable",
            d = "writable";
        return i4.f = t ? r ? function(t, n, r) {
            if (i(t), n = a(n), i(r), "function" == typeof t && "prototype" === n && "value" in r && d in r && !r[d]) {
                var o = u(t, n);
                o && o[d] && (t[n] = r.value, r = {
                    configurable: l in r ? r[l] : o[l],
                    enumerable: c in r ? r[c] : o[c],
                    writable: !1
                })
            }
            return s(t, n, r)
        } : s : function(t, r, u) {
            if (i(t), r = a(r), i(u), n) try {
                return s(t, r, u)
            } catch (t) {}
            if ("get" in u || "set" in u) throw new o("Accessors not supported");
            return "value" in u && (t[r] = u.value), t
        }, i4
    }

    function i5() {
        if (e$) return eX;
        e$ = 1;
        var t = ix(),
            n = i8(),
            r = iT();
        return eX = t ? function(t, i, a) {
            return n.f(t, i, r(1, a))
        } : function(t, n, r) {
            return t[n] = r, t
        }
    }
    var i7 = {
        exports: {}
    };

    function i9() {
        if (eY) return eZ;
        eY = 1;
        var t = ix(),
            n = iX(),
            r = Function.prototype,
            i = t && Object.getOwnPropertyDescriptor,
            a = n(r, "name"),
            o = a && (!t || t && i(r, "name").configurable);
        return eZ = {
            EXISTS: a,
            PROPER: a && "something" === (function() {}).name,
            CONFIGURABLE: o
        }
    }

    function ae() {
        if (e1) return e0;
        e1 = 1;
        var t = iE(),
            n = ij(),
            r = iJ(),
            i = t(Function.toString);
        return n(r.inspectSource) || (r.inspectSource = function(t) {
            return i(t)
        }), e0 = r.inspectSource
    }

    function at() {
        if (e6) return e3;
        e6 = 1;
        var t = iz(),
            n = i$(),
            r = t("keys");
        return e3 = function(t) {
            return r[t] || (r[t] = n(t))
        }
    }

    function an() {
        return e5 ? e8 : (e5 = 1, e8 = {})
    }

    function ar() {
        if (e9) return e7;
        e9 = 1;
        var t, n, r, i = function() {
                if (e4) return e2;
                e4 = 1;
                var t = ig(),
                    n = ij(),
                    r = t.WeakMap;
                return e2 = n(r) && /native code/.test(String(r))
            }(),
            a = ig(),
            o = iL(),
            s = i5(),
            u = iX(),
            c = iJ(),
            l = at(),
            d = an(),
            f = "Object already initialized",
            h = a.TypeError,
            p = a.WeakMap;
        if (i || c.state) {
            var v = c.state || (c.state = new p);
            v.get = v.get, v.has = v.has, v.set = v.set, t = function(t, n) {
                if (v.has(t)) throw new h(f);
                return n.facade = t, v.set(t, n), n
            }, n = function(t) {
                return v.get(t) || {}
            }, r = function(t) {
                return v.has(t)
            }
        } else {
            var m = l("state");
            d[m] = !0, t = function(t, n) {
                if (u(t, m)) throw new h(f);
                return n.facade = t, s(t, m, n), n
            }, n = function(t) {
                return u(t, m) ? t[m] : {}
            }, r = function(t) {
                return u(t, m)
            }
        }
        return e7 = {
            set: t,
            get: n,
            has: r,
            enforce: function(i) {
                return r(i) ? n(i) : t(i, {})
            },
            getterFor: function(t) {
                return function(r) {
                    var i;
                    if (!o(r) || (i = n(r)).type !== t) throw new h("Incompatible receiver, " + t + " required");
                    return i
                }
            }
        }
    }

    function ai() {
        if (te) return i7.exports;
        te = 1;
        var t = iE(),
            n = iw(),
            r = ij(),
            i = iX(),
            a = ix(),
            o = i9().CONFIGURABLE,
            s = ae(),
            u = ar(),
            c = u.enforce,
            l = u.get,
            d = String,
            f = Object.defineProperty,
            h = t("".slice),
            p = t("".replace),
            v = t([].join),
            m = a && !n(function() {
                return 8 !== f(function() {}, "length", {
                    value: 8
                }).length
            }),
            y = String(String).split("String"),
            g = i7.exports = function(t, n, r) {
                "Symbol(" === h(d(n), 0, 7) && (n = "[" + p(d(n), /^Symbol\(([^)]*)\).*$/, "$1") + "]"), r && r.getter && (n = "get " + n), r && r.setter && (n = "set " + n), (!i(t, "name") || o && t.name !== n) && (a ? f(t, "name", {
                    value: n,
                    configurable: !0
                }) : t.name = n), m && r && i(r, "arity") && t.length !== r.arity && f(t, "length", {
                    value: r.arity
                });
                try {
                    r && i(r, "constructor") && r.constructor ? a && f(t, "prototype", {
                        writable: !1
                    }) : t.prototype && (t.prototype = void 0)
                } catch (t) {}
                var s = c(t);
                return i(s, "source") || (s.source = v(y, "string" == typeof n ? n : "")), t
            };
        return Function.prototype.toString = g(function() {
            return r(this) && l(this).source || s(this)
        }, "toString"), i7.exports
    }

    function aa() {
        if (tn) return tt;
        tn = 1;
        var t = ij(),
            n = i8(),
            r = ai(),
            i = iK();
        return tt = function(a, o, s, u) {
            u || (u = {});
            var c = u.enumerable,
                l = void 0 !== u.name ? u.name : o;
            if (t(s) && r(s, l, u), u.global) c ? a[o] = s : i(o, s);
            else {
                try {
                    u.unsafe ? a[o] && (c = !0) : delete a[o]
                } catch (t) {}
                c ? a[o] = s : n.f(a, o, {
                    value: s,
                    enumerable: !1,
                    configurable: !u.nonConfigurable,
                    writable: !u.nonWritable
                })
            }
            return a
        }
    }
    var ao = {};

    function as() {
        if (to) return ta;
        to = 1;
        var t = function() {
            if (ti) return tr;
            ti = 1;
            var t = Math.ceil,
                n = Math.floor;
            return tr = Math.trunc || function(r) {
                var i = +r;
                return (i > 0 ? n : t)(i)
            }
        }();
        return ta = function(n) {
            var r = +n;
            return r != r || 0 === r ? 0 : t(r)
        }
    }

    function au() {
        if (tl) return tc;
        tl = 1;
        var t = as(),
            n = Math.min;
        return tc = function(r) {
            var i = t(r);
            return i > 0 ? n(i, 0x1fffffffffffff) : 0
        }
    }

    function ac() {
        if (tf) return td;
        tf = 1;
        var t = au();
        return td = function(n) {
            return t(n.length)
        }
    }

    function al() {
        if (tm) return tv;
        tm = 1;
        var t = iE(),
            n = iX(),
            r = iI(),
            i = function() {
                if (tp) return th;
                tp = 1;
                var t = iI(),
                    n = function() {
                        if (tu) return ts;
                        tu = 1;
                        var t = as(),
                            n = Math.max,
                            r = Math.min;
                        return ts = function(i, a) {
                            var o = t(i);
                            return o < 0 ? n(o + a, 0) : r(o, a)
                        }
                    }(),
                    r = ac(),
                    i = function(i) {
                        return function(a, o, s) {
                            var u, c = t(a),
                                l = r(c);
                            if (0 === l) return !i && -1;
                            var d = n(s, l);
                            if (i && o != o) {
                                for (; l > d;)
                                    if ((u = c[d++]) != u) return !0
                            } else
                                for (; l > d; d++)
                                    if ((i || d in c) && c[d] === o) return i || d || 0;
                            return !i && -1
                        }
                    };
                return th = {
                    includes: i(!0),
                    indexOf: i(!1)
                }
            }().indexOf,
            a = an(),
            o = t([].push);
        return tv = function(t, s) {
            var u, c = r(t),
                l = 0,
                d = [];
            for (u in c) !n(a, u) && n(c, u) && o(d, u);
            for (; s.length > l;) n(c, u = s[l++]) && (~i(d, u) || o(d, u));
            return d
        }
    }

    function ad() {
        return tg ? ty : (tg = 1, ty = ["constructor", "hasOwnProperty", "isPrototypeOf", "propertyIsEnumerable", "toLocaleString", "toString", "valueOf"])
    }

    function af() {
        if (tb) return ao;
        tb = 1;
        var t = al(),
            n = ad().concat("length", "prototype");
        return ao.f = Object.getOwnPropertyNames || function(r) {
            return t(r, n)
        }, ao
    }
    var ah = {};

    function ap() {
        if (tE) return tT;
        tE = 1;
        var t = iw(),
            n = ij(),
            r = /#|\.prototype\./,
            i = function(r, i) {
                var c = o[a(r)];
                return c === u || c !== s && (n(i) ? t(i) : !!i)
            },
            a = i.normalize = function(t) {
                return String(t).replace(r, ".").toLowerCase()
            },
            o = i.data = {},
            s = i.NATIVE = "N",
            u = i.POLYFILL = "P";
        return tT = i
    }

    function av() {
        if (tk) return tq;
        tk = 1;
        var t = ig(),
            n = i2().f,
            r = i5(),
            i = aa(),
            a = iK(),
            o = function() {
                if (tS) return tR;
                tS = 1;
                var t = iX(),
                    n = function() {
                        if (tP) return tx;
                        tP = 1;
                        var t = iO(),
                            n = iE(),
                            r = af(),
                            i = (tw || (tw = 1, ah.f = Object.getOwnPropertySymbols), ah),
                            a = i6(),
                            o = n([].concat);
                        return tx = t("Reflect", "ownKeys") || function(t) {
                            var n = r.f(a(t)),
                                s = i.f;
                            return s ? o(n, s(t)) : n
                        }
                    }(),
                    r = i2(),
                    i = i8();
                return tR = function(a, o, s) {
                    for (var u = n(o), c = i.f, l = r.f, d = 0; d < u.length; d++) {
                        var f = u[d];
                        t(a, f) || s && t(s, f) || c(a, f, l(o, f))
                    }
                }
            }(),
            s = ap();
        return tq = function(u, c) {
            var l, d, f, h, p, v = u.target,
                m = u.global,
                y = u.stat;
            if (l = m ? t : y ? t[v] || a(v, {}) : t[v] && t[v].prototype)
                for (d in c) {
                    if (h = c[d], f = u.dontCallGetSet ? (p = n(l, d)) && p.value : l[d], !s(m ? d : v + (y ? "." : "#") + d, u.forced) && void 0 !== f) {
                        if (typeof h == typeof f) continue;
                        o(h, f)
                    }(u.sham || f && f.sham) && r(h, "sham", !0), i(l, d, h, u)
                }
        }
    }

    function am() {
        if (tC) return tA;
        tC = 1;
        var t = iZ()("toStringTag"),
            n = {};
        return n[t] = "z", tA = "[object z]" === String(n)
    }

    function ay() {
        if (tj) return tI;
        tj = 1;
        var t = am(),
            n = ij(),
            r = iq(),
            i = iZ()("toStringTag"),
            a = Object,
            o = "Arguments" === r(function() {
                return arguments
            }()),
            s = function(t, n) {
                try {
                    return t[n]
                } catch (t) {}
            };
        return tI = t ? r : function(t) {
            var u, c, l;
            return void 0 === t ? "Undefined" : null === t ? "Null" : "string" == typeof(c = s(u = a(t), i)) ? c : o ? r(u) : "Object" === (l = r(u)) && n(u.callee) ? "Arguments" : l
        }
    }

    function ag() {
        if (tO) return tL;
        tO = 1;
        var t = ay(),
            n = String;
        return tL = function(r) {
            if ("Symbol" === t(r)) throw TypeError("Cannot convert a Symbol value to a string");
            return n(r)
        }
    }

    function ab() {
        if (tD) return tN;
        tD = 1;
        var t = i6();
        return tN = function() {
            var n = t(this),
                r = "";
            return n.hasIndices && (r += "d"), n.global && (r += "g"), n.ignoreCase && (r += "i"), n.multiline && (r += "m"), n.dotAll && (r += "s"), n.unicode && (r += "u"), n.unicodeSets && (r += "v"), n.sticky && (r += "y"), r
        }
    }
    var aw = {};

    function ax() {
        if (tB) return tU;
        tB = 1;
        var t = al(),
            n = ad();
        return tU = Object.keys || function(r) {
            return t(r, n)
        }
    }

    function aP() {
        if (tH) return tW;
        tH = 1;
        var t, n = i6(),
            r = function() {
                if (tV) return aw;
                tV = 1;
                var t = ix(),
                    n = i3(),
                    r = i8(),
                    i = i6(),
                    a = iI(),
                    o = ax();
                return aw.f = t && !n ? Object.defineProperties : function(t, n) {
                    i(t);
                    for (var s, u = a(n), c = o(n), l = c.length, d = 0; l > d;) r.f(t, s = c[d++], u[s]);
                    return t
                }, aw
            }(),
            i = ad(),
            a = an(),
            o = tG ? tF : (tG = 1, tF = iO()("document", "documentElement")),
            s = i0(),
            u = at(),
            c = "prototype",
            l = "script",
            d = u("IE_PROTO"),
            f = function() {},
            h = function(t) {
                return "<" + l + ">" + t + "</" + l + ">"
            },
            p = function(t) {
                t.write(h("")), t.close();
                var n = t.parentWindow.Object;
                return t = null, n
            },
            v = function() {
                var t, n = s("iframe");
                return n.style.display = "none", o.appendChild(n), n.src = String("java" + l + ":"), (t = n.contentWindow.document).open(), t.write(h("document.F=Object")), t.close(), t.F
            },
            m = function() {
                try {
                    t = new ActiveXObject("htmlfile")
                } catch (t) {}
                m = "u" > typeof document ? document.domain && t ? p(t) : v() : p(t);
                for (var n = i.length; n--;) delete m[c][i[n]];
                return m()
            };
        return a[d] = !0, tW = Object.create || function(t, i) {
            var a;
            return null !== t ? (f[c] = n(t), a = new f, f[c] = null, a[d] = t) : a = m(), void 0 === i ? a : r.f(a, i)
        }
    }

    function aR() {
        if (t$) return tX;
        t$ = 1;
        var t, n, r = iR(),
            i = iE(),
            a = ag(),
            o = ab(),
            s = function() {
                if (tM) return t_;
                tM = 1;
                var t = iw(),
                    n = ig().RegExp,
                    r = t(function() {
                        var t = n("a", "y");
                        return t.lastIndex = 2, null !== t.exec("abcd")
                    }),
                    i = r || t(function() {
                        return !n("a", "y").sticky
                    });
                return t_ = {
                    BROKEN_CARET: r || t(function() {
                        var t = n("^r", "gy");
                        return t.lastIndex = 2, null !== t.exec("str")
                    }),
                    MISSED_STICKY: i,
                    UNSUPPORTED_Y: r
                }
            }(),
            u = iz(),
            c = aP(),
            l = ar().get,
            d = function() {
                if (tJ) return tK;
                tJ = 1;
                var t = iw(),
                    n = ig().RegExp;
                return tK = t(function() {
                    var t = n(".", "s");
                    return !(t.dotAll && t.test("\n") && "s" === t.flags)
                })
            }(),
            f = function() {
                if (tQ) return tz;
                tQ = 1;
                var t = iw(),
                    n = ig().RegExp;
                return tz = t(function() {
                    var t = n("(?<a>b)", "g");
                    return "b" !== t.exec("b").groups.a || "bc" !== "b".replace(t, "$<a>c")
                })
            }(),
            h = u("native-string-replace", String.prototype.replace),
            p = RegExp.prototype.exec,
            v = p,
            m = i("".charAt),
            y = i("".indexOf),
            g = i("".replace),
            b = i("".slice),
            w = (n = /b*/g, r(p, t = /a/, "a"), r(p, n, "a"), 0 !== t.lastIndex || 0 !== n.lastIndex),
            x = s.BROKEN_CARET,
            P = void 0 !== /()??/.exec("")[1],
            R = function(t, n) {
                for (var r = t.groups = c(null), i = 0; i < n.length; i++) {
                    var a = n[i];
                    r[a[0]] = t[a[1]]
                }
            };
        return (w || P || x || d || f) && (v = function(t) {
            var n, i, s, u = l(this),
                c = a(t),
                d = u.raw;
            if (d) return d.lastIndex = this.lastIndex, n = r(v, d, c), this.lastIndex = d.lastIndex, n && u.groups && R(n, u.groups), n;
            var f = u.groups,
                S = x && this.sticky,
                T = r(o, this),
                E = this.source,
                q = 0,
                k = c;
            if (S) {
                -1 === y(T = g(T, "y", ""), "g") && (T += "g"), k = b(c, this.lastIndex);
                var A = this.lastIndex > 0 && m(c, this.lastIndex - 1);
                this.lastIndex > 0 && (!this.multiline || this.multiline && "\n" !== A && "\r" !== A && "\u2028" !== A && "\u2029" !== A) && (E = "(?: (?:" + E + "))", k = " " + k, q++), i = RegExp("^(?:" + E + ")", T)
            }
            P && (i = RegExp("^" + E + "$(?!\\s)", T)), w && (s = this.lastIndex);
            var C = r(p, S ? i : this, k);
            return S ? C ? (C.input = c, C[0] = b(C[0], q), C.index = this.lastIndex, this.lastIndex += C[0].length) : this.lastIndex = 0 : w && C && (this.lastIndex = this.global ? C.index + C[0].length : s), P && C && C.length > 1 && r(h, C[0], i, function() {
                for (var t = 1; t < arguments.length - 2; t++) void 0 === arguments[t] && (C[t] = void 0)
            }), C && f && R(C, f), C
        }), tX = v
    }

    function aS() {
        if (tZ) return iy;
        tZ = 1;
        var t = av(),
            n = aR();
        return t({
            target: "RegExp",
            proto: !0,
            forced: /./.exec !== n
        }, {
            exec: n
        }), iy
    }

    function aT() {
        if (t7) return t5;
        t7 = 1;
        var t = iE(),
            n = iQ(),
            r = Math.floor,
            i = t("".charAt),
            a = t("".replace),
            o = t("".slice),
            s = /\$([$&'`]|\d{1,2}|<[^>]*>)/g,
            u = /\$([$&'`]|\d{1,2})/g;
        return t5 = function(t, c, l, d, f, h) {
            var p = l + t.length,
                v = d.length,
                m = u;
            return void 0 !== f && (f = n(f), m = s), a(h, m, function(n, a) {
                var s;
                switch (i(a, 0)) {
                    case "$":
                        return "$";
                    case "&":
                        return t;
                    case "`":
                        return o(c, 0, l);
                    case "'":
                        return o(c, p);
                    case "<":
                        s = f[o(a, 1, -1)];
                        break;
                    default:
                        var u = +a;
                        if (0 === u) return n;
                        if (u > v) {
                            var h = r(u / 10);
                            if (0 === h) return n;
                            if (h <= v) return void 0 === d[h - 1] ? i(a, 1) : d[h - 1] + i(a, 1);
                            return n
                        }
                        s = d[u - 1]
                }
                return void 0 === s ? "" : s
            })
        }
    }

    function aE() {
        if (nn) return nt;
        nn = 1;
        var t = iR(),
            n = iX(),
            r = iN(),
            i = function() {
                if (ne) return t9;
                ne = 1;
                var t = ig(),
                    n = iw(),
                    r = t.RegExp;
                return t9 = {
                    correct: !n(function() {
                        var t = !0;
                        try {
                            r(".", "d")
                        } catch (n) {
                            t = !1
                        }
                        var n = {},
                            i = "",
                            a = t ? "dgimsy" : "gimsy",
                            o = function(t, r) {
                                Object.defineProperty(n, t, {
                                    get: function() {
                                        return i += r, !0
                                    }
                                })
                            },
                            s = {
                                dotAll: "s",
                                global: "g",
                                ignoreCase: "i",
                                multiline: "m",
                                sticky: "y"
                            };
                        for (var u in t && (s.hasIndices = "d"), s) o(u, s[u]);
                        return Object.getOwnPropertyDescriptor(r.prototype, "flags").get.call(n) !== a || i !== a
                    })
                }
            }(),
            a = ab(),
            o = RegExp.prototype;
        return nt = i.correct ? function(t) {
            return t.flags
        } : function(s) {
            return !i.correct && r(o, s) && !n(s, "flags") ? t(a, s) : s.flags
        }
    }

    function aq() {
        if (nl) return nc;
        nl = 1;
        var t = ig(),
            n = iE();
        return nc = function(r, i) {
            return n(t[r].prototype[i])
        }
    }

    function ak() {
        if (nh) return nf;
        nh = 1;
        var t = iZ(),
            n = aP(),
            r = i8().f,
            i = t("unscopables"),
            a = Array.prototype;
        return void 0 === a[i] && r(a, i, {
            configurable: !0,
            value: n(null)
        }), nf = function(t) {
            a[i][t] = !0
        }
    }

    function aA() {
        if (nx) return nw;
        nx = 1;
        var t = function() {
                if (nb) return ng;
                nb = 1;
                var t = iq(),
                    n = iE();
                return ng = function(r) {
                    if ("Function" === t(r)) return n(r)
                }
            }(),
            n = iF(),
            r = iP(),
            i = t(t.bind);
        return nw = function(t, a) {
            return n(t), void 0 === a ? t : r ? i(t, a) : function() {
                return t.apply(a, arguments)
            }
        }
    }

    function aC() {
        if (nR) return nP;
        nR = 1;
        var t = aA(),
            n = ik(),
            r = iQ(),
            i = ac(),
            a = function(a) {
                var o = 1 === a;
                return function(s, u, c) {
                    for (var l, d = r(s), f = n(d), h = i(f), p = t(u, c); h-- > 0;)
                        if (p(l = f[h], h, d)) switch (a) {
                            case 0:
                                return l;
                            case 1:
                                return h
                        }
                    return o ? -1 : void 0
                }
            };
        return nP = {
            findLast: a(0),
            findLastIndex: a(1)
        }
    }

    function aI() {
        if (nC) return nA;
        nC = 1;
        var t = ix(),
            n = i8(),
            r = iT();
        return nA = function(i, a, o) {
            t ? n.f(i, a, r(0, o)) : i[a] = o
        }
    }

    function aj() {
        return nj ? nI : (nj = 1, nI = {})
    }

    function aL() {
        if (nD) return nN;
        nD = 1;
        var t = ay(),
            n = iG(),
            r = iA(),
            i = aj(),
            a = iZ()("iterator");
        return nN = function(o) {
            if (!r(o)) return n(o, a) || n(o, "@@iterator") || i[t(o)]
        }
    }

    function aO() {
        if (nF) return nV;
        nF = 1;
        var t = aA(),
            n = iR(),
            r = i6(),
            i = iV(),
            a = function() {
                if (nO) return nL;
                nO = 1;
                var t = iZ(),
                    n = aj(),
                    r = t("iterator"),
                    i = Array.prototype;
                return nL = function(t) {
                    return void 0 !== t && (n.Array === t || i[r] === t)
                }
            }(),
            o = ac(),
            s = iN(),
            u = function() {
                if (nM) return n_;
                nM = 1;
                var t = iR(),
                    n = iF(),
                    r = i6(),
                    i = iV(),
                    a = aL(),
                    o = TypeError;
                return n_ = function(s, u) {
                    var c = arguments.length < 2 ? a(s) : u;
                    if (n(c)) return r(t(c, s));
                    throw new o(i(s) + " is not iterable")
                }
            }(),
            c = aL(),
            l = function() {
                if (nB) return nU;
                nB = 1;
                var t = iR(),
                    n = i6(),
                    r = iG();
                return nU = function(i, a, o) {
                    var s, u;
                    n(i);
                    try {
                        if (!(s = r(i, "return"))) {
                            if ("throw" === a) throw o;
                            return o
                        }
                        s = t(s, i)
                    } catch (t) {
                        u = !0, s = t
                    }
                    if ("throw" === a) throw o;
                    if (u) throw s;
                    return n(s), o
                }
            }(),
            d = TypeError,
            f = function(t, n) {
                this.stopped = t, this.result = n
            },
            h = f.prototype;
        return nV = function(p, v, m) {
            var y, g, b, w, x, P, R, S = m && m.that,
                T = !!(m && m.AS_ENTRIES),
                E = !!(m && m.IS_RECORD),
                q = !!(m && m.IS_ITERATOR),
                k = !!(m && m.INTERRUPTED),
                A = t(v, S),
                C = function(t) {
                    var n = y;
                    return y = void 0, n && l(n, "normal"), new f(!0, t)
                },
                I = function(t) {
                    return T ? (r(t), k ? A(t[0], t[1], C) : A(t[0], t[1])) : k ? A(t, C) : A(t)
                };
            if (E) y = p.iterator;
            else if (q) y = p;
            else {
                if (!(g = c(p))) throw new d(i(p) + " is not iterable");
                if (a(g)) {
                    for (b = 0, w = o(p); w > b; b++)
                        if ((x = I(p[b])) && s(h, x)) return x;
                    return new f(!1)
                }
                y = u(p, g)
            }
            for (P = E ? p.next : y.next; !(R = n(P, y)).done;) {
                var j = R.value;
                try {
                    x = I(j)
                } catch (t) {
                    if (y) l(y, "throw", t);
                    else throw t
                }
                if ("object" == typeof x && x && s(h, x)) return x
            }
            return new f(!1)
        }
    }

    function aN() {
        return nH ? nW : (nH = 1, nW = ig())
    }

    function aD() {
        if (nz) return nJ;
        nz = 1;
        var t = ag();
        return nJ = function(n, r) {
            return void 0 === n ? arguments.length < 2 ? "" : r : t(n)
        }
    }

    function a_() {
        if (nX) return nQ;
        nX = 1;
        var t = ix(),
            n = iw(),
            r = i6(),
            i = aD(),
            a = Error.prototype.toString;
        return nQ = n(function() {
            if (t) {
                var n = Object.create(Object.defineProperty({}, "name", {
                    get: function() {
                        return this === n
                    }
                }));
                if ("true" !== a.call(n)) return !0
            }
            return "2: 1" !== a.call({
                message: 1,
                name: 2
            }) || "Error" !== a.call({})
        }) ? function() {
            var t = r(this),
                n = i(t.name, "Error"),
                a = i(t.message);
            return n ? a ? n + ": " + a : n : a
        } : a
    }

    function aM() {
        if (n1) return n0;
        n1 = 1;
        var t = iX(),
            n = ij(),
            r = iQ(),
            i = at(),
            a = nY ? nZ : (nY = 1, nZ = !iw()(function() {
                function t() {}
                return t.prototype.constructor = null, Object.getPrototypeOf(new t) !== t.prototype
            })),
            o = i("IE_PROTO"),
            s = Object,
            u = s.prototype;
        return n0 = a ? s.getPrototypeOf : function(i) {
            var a = r(i);
            if (t(a, o)) return a[o];
            var c = a.constructor;
            return n(c) && a instanceof c ? c.prototype : a instanceof s ? u : null
        }
    }

    function aU() {
        if (n4) return n2;
        n4 = 1;
        var t, n, r, i = iw(),
            a = ij(),
            o = iL(),
            s = aP(),
            u = aM(),
            c = aa(),
            l = iZ(),
            d = iH(),
            f = l("iterator"),
            h = !1;
        return [].keys && ("next" in (r = [].keys()) ? (n = u(u(r))) !== Object.prototype && (t = n) : h = !0), !o(t) || i(function() {
            var n = {};
            return t[f].call(n) !== n
        }) ? t = {} : d && (t = s(t)), a(t[f]) || c(t, f, function() {
            return this
        }), n2 = {
            IteratorPrototype: t,
            BUGGY_SAFARI_ITERATORS: h
        }
    }

    function aB() {
        if (n6) return n3;
        n6 = 1;
        var t = i8().f,
            n = iX(),
            r = iZ()("toStringTag");
        return n3 = function(i, a, o) {
            i && !o && (i = i.prototype), i && !n(i, r) && t(i, r, {
                configurable: !0,
                value: a
            })
        }
    }

    function aV() {
        if (ra) return ri;
        ra = 1;
        var t = function() {
                if (n9) return n7;
                n9 = 1;
                var t = iE(),
                    n = iF();
                return n7 = function(r, i, a) {
                    try {
                        return t(n(Object.getOwnPropertyDescriptor(r, i)[a]))
                    } catch (t) {}
                }
            }(),
            n = iL(),
            r = iC(),
            i = function() {
                if (rr) return rn;
                rr = 1;
                var t = function() {
                        if (rt) return re;
                        rt = 1;
                        var t = iL();
                        return re = function(n) {
                            return t(n) || null === n
                        }
                    }(),
                    n = String,
                    r = TypeError;
                return rn = function(i) {
                    if (t(i)) return i;
                    throw new r("Can't set " + n(i) + " as a prototype")
                }
            }();
        return ri = Object.setPrototypeOf || ("__proto__" in {} ? function() {
            var a, o = !1,
                s = {};
            try {
                (a = t(Object.prototype, "__proto__", "set"))(s, []), o = s instanceof Array
            } catch (t) {}
            return function(t, s) {
                return r(t), i(s), n(t) && (o ? a(t, s) : t.__proto__ = s), t
            }
        }() : void 0)
    }

    function aF() {
        if (rs) return ro;
        rs = 1;
        var t = av(),
            n = iR(),
            r = iH(),
            i = i9(),
            a = ij(),
            o = function() {
                if (n5) return n8;
                n5 = 1;
                var t = aU().IteratorPrototype,
                    n = aP(),
                    r = iT(),
                    i = aB(),
                    a = aj(),
                    o = function() {
                        return this
                    };
                return n8 = function(s, u, c, l) {
                    var d = u + " Iterator";
                    return s.prototype = n(t, {
                        next: r(+!l, c)
                    }), i(s, d, !1, !0), a[d] = o, s
                }
            }(),
            s = aM(),
            u = aV(),
            c = aB(),
            l = i5(),
            d = aa(),
            f = iZ(),
            h = aj(),
            p = aU(),
            v = i.PROPER,
            m = i.CONFIGURABLE,
            y = p.IteratorPrototype,
            g = p.BUGGY_SAFARI_ITERATORS,
            b = f("iterator"),
            w = "keys",
            x = "values",
            P = "entries",
            R = function() {
                return this
            };
        return ro = function(i, f, p, S, T, E, q) {
            o(p, f, S);
            var k, A, C, I = function(t) {
                    if (t === T && D) return D;
                    if (!g && t && t in O) return O[t];
                    switch (t) {
                        case w:
                        case x:
                        case P:
                            return function() {
                                return new p(this, t)
                            }
                    }
                    return function() {
                        return new p(this)
                    }
                },
                j = f + " Iterator",
                L = !1,
                O = i.prototype,
                N = O[b] || O["@@iterator"] || T && O[T],
                D = !g && N || I(T),
                _ = "Array" === f && O.entries || N;
            if (_ && (k = s(_.call(new i))) !== Object.prototype && k.next && (!r && s(k) !== y && (u ? u(k, y) : a(k[b]) || d(k, b, R)), c(k, j, !0, !0), r && (h[j] = R)), v && T === x && N && N.name !== x && (!r && m ? l(O, "name", x) : (L = !0, D = function() {
                    return n(N, this)
                })), T)
                if (A = {
                        values: I(x),
                        keys: E ? D : I(w),
                        entries: I(P)
                    }, q)
                    for (C in A) !g && !L && C in O || d(O, C, A[C]);
                else t({
                    target: f,
                    proto: !0,
                    forced: g || L
                }, A);
            return (!r || q) && O[b] !== D && d(O, b, D, {
                name: T
            }), h[f] = D, A
        }
    }

    function aG() {
        return rc ? ru : (rc = 1, ru = function(t, n) {
            return {
                value: t,
                done: n
            }
        })
    }
    nd || (nd = 1, aS(), function() {
        if (!na) {
            na = 1;
            var t = function() {
                    if (t0) return tY;
                    t0 = 1;
                    var t = iP(),
                        n = Function.prototype,
                        r = n.apply,
                        i = n.call;
                    return tY = "object" == typeof Reflect && Reflect.apply || (t ? i.bind(r) : function() {
                        return i.apply(r, arguments)
                    })
                }(),
                n = iR(),
                r = iE(),
                i = function() {
                    if (t2) return t1;
                    t2 = 1, aS();
                    var t = iR(),
                        n = aa(),
                        r = aR(),
                        i = iw(),
                        a = iZ(),
                        o = i5(),
                        s = a("species"),
                        u = RegExp.prototype;
                    return t1 = function(c, l, d, f) {
                        var h = a(c),
                            p = !i(function() {
                                var t = {};
                                return t[h] = function() {
                                    return 7
                                }, 7 !== "" [c](t)
                            }),
                            v = p && !i(function() {
                                var t = !1,
                                    n = /a/;
                                if ("split" === c) {
                                    var r = {};
                                    r[s] = function() {
                                        return n
                                    }, (n = {
                                        constructor: r,
                                        flags: ""
                                    })[h] = /./ [h]
                                }
                                return n.exec = function() {
                                    return t = !0, null
                                }, n[h](""), !t
                            });
                        if (!p || !v || d) {
                            var m = /./ [h],
                                y = l(h, "" [c], function(n, i, a, o, s) {
                                    var c = i.exec;
                                    return c === r || c === u.exec ? p && !s ? {
                                        done: !0,
                                        value: t(m, i, a, o)
                                    } : {
                                        done: !0,
                                        value: t(n, a, i, o)
                                    } : {
                                        done: !1
                                    }
                                });
                            n(String.prototype, c, y[0]), n(u, h, y[1])
                        }
                        f && o(u[h], "sham", !0)
                    }
                }(),
                a = iw(),
                o = i6(),
                s = ij(),
                u = iL(),
                c = as(),
                l = au(),
                d = ag(),
                f = iC(),
                h = function() {
                    if (t8) return t6;
                    t8 = 1;
                    var t = function() {
                        if (t3) return t4;
                        t3 = 1;
                        var t = iE(),
                            n = as(),
                            r = ag(),
                            i = iC(),
                            a = t("".charAt),
                            o = t("".charCodeAt),
                            s = t("".slice),
                            u = function(t) {
                                return function(u, c) {
                                    var l, d, f = r(i(u)),
                                        h = n(c),
                                        p = f.length;
                                    return h < 0 || h >= p ? t ? "" : void 0 : (l = o(f, h)) < 55296 || l > 56319 || h + 1 === p || (d = o(f, h + 1)) < 56320 || d > 57343 ? t ? a(f, h) : l : t ? s(f, h, h + 2) : (l - 55296 << 10) + (d - 56320) + 65536
                                }
                            };
                        return t4 = {
                            codeAt: u(!1),
                            charAt: u(!0)
                        }
                    }().charAt;
                    return t6 = function(n, r, i) {
                        return r + (i && t(n, r).length || 1)
                    }
                }(),
                p = iG(),
                v = aT(),
                m = aE(),
                y = function() {
                    if (ni) return nr;
                    ni = 1;
                    var t = iR(),
                        n = i6(),
                        r = ij(),
                        i = iq(),
                        a = aR(),
                        o = TypeError;
                    return nr = function(s, u) {
                        var c = s.exec;
                        if (r(c)) {
                            var l = t(c, s, u);
                            return null !== l && n(l), l
                        }
                        if ("RegExp" === i(s)) return t(a, s, u);
                        throw new o("RegExp#exec called on incompatible receiver")
                    }
                }(),
                g = iZ()("replace"),
                b = Math.max,
                w = Math.min,
                x = r([].concat),
                P = r([].push),
                R = r("".indexOf),
                S = r("".slice),
                T = "$0" === "a".replace(/./, "$0"),
                E = !!/./ [g] && "" === /./ [g]("a", "$0");
            i("replace", function(r, i, a) {
                var T = E ? "$" : "$0";
                return [function(t, r) {
                    var a = f(this),
                        o = u(t) ? p(t, g) : void 0;
                    return o ? n(o, t, a, r) : n(i, d(a), t, r)
                }, function(n, r) {
                    var u = o(this),
                        f = d(n),
                        p = s(r);
                    p || (r = d(r));
                    var g = d(m(u));
                    if ("string" == typeof r && !~R(r, T) && !~R(r, "$<") && !~R(g, "y")) {
                        var E = a(i, u, f, r);
                        if (E.done) return E.value
                    }
                    var q = !!~R(g, "g");
                    q && (L = !!~R(g, "u") || !!~R(g, "v"), u.lastIndex = 0);
                    for (var k = []; null !== (N = y(u, f)) && (P(k, N), q);) "" === d(N[0]) && (u.lastIndex = h(f, l(u.lastIndex), L));
                    for (var A = "", C = 0, I = 0; I < k.length; I++) {
                        for (var j, L, O, N = k[I], D = d(N[0]), _ = b(w(c(N.index), f.length), 0), M = [], U = 1; U < N.length; U++) P(M, void 0 === (j = N[U]) ? j : String(j));
                        var B = N.groups;
                        if (p) {
                            var V = x([D], M, _, f);
                            void 0 !== B && P(V, B), O = d(t(r, void 0, V))
                        } else O = v(D, f, _, M, B, r);
                        _ >= C && (A += S(f, C, _) + O, C = _ + D.length)
                    }
                    return A + S(f, C)
                }]
            }, !!a(function() {
                var t = /./;
                return t.exec = function() {
                    var t = [];
                    return t.groups = {
                        a: "7"
                    }, t
                }, "7" !== "".replace(t, "$<a>")
            }) || !T || E)
        }
    }(), function() {
        if (!nu) {
            nu = 1;
            var t = av(),
                n = iR(),
                r = iE(),
                i = iC(),
                a = ij(),
                o = iL(),
                s = function() {
                    if (ns) return no;
                    ns = 1;
                    var t = iL(),
                        n = iq(),
                        r = iZ()("match");
                    return no = function(i) {
                        var a;
                        return t(i) && (void 0 !== (a = i[r]) ? !!a : "RegExp" === n(i))
                    }
                }(),
                u = ag(),
                c = iG(),
                l = aE(),
                d = aT(),
                f = iZ(),
                h = iH(),
                p = f("replace"),
                v = TypeError,
                m = r("".indexOf),
                y = r("".replace),
                g = r("".slice),
                b = Math.max;
            t({
                target: "String",
                proto: !0
            }, {
                replaceAll: function(t, r) {
                    var f, w, x, P, R, S, T, E, q, k = i(this),
                        A = 0,
                        C = "";
                    if (o(t)) {
                        if ((f = s(t)) && !~m(u(i(l(t))), "g")) throw new v("`.replaceAll` does not allow non-global regexes");
                        if (w = c(t, p)) return n(w, t, k, r);
                        if (h && f) return y(u(k), t, r)
                    }
                    for (x = u(k), P = u(t), (R = a(r)) || (r = u(r)), T = b(1, S = P.length), E = m(x, P); - 1 !== E;) q = R ? u(r(P, E, x)) : d(P, x, E, [], void 0, r), C += g(x, A, E) + q, A = E + S, E = E + T > x.length ? -1 : m(x, P, E + T);
                    return A < x.length && (C += g(x, A)), C
                }
            })
        }
    }(), aq()("String", "replaceAll")), nv || (nv = 1, function() {
        if (!np) {
            np = 1;
            var t = av(),
                n = iQ(),
                r = ac(),
                i = as(),
                a = ak();
            t({
                target: "Array",
                proto: !0
            }, {
                at: function(t) {
                    var a = n(this),
                        o = r(a),
                        s = i(t),
                        u = s >= 0 ? s : o + s;
                    return u < 0 || u >= o ? void 0 : a[u]
                }
            }), a("at")
        }
    }(), aq()("Array", "at")), ny || (ny = 1, function() {
        if (!nm) {
            nm = 1;
            var t = av(),
                n = iE(),
                r = iC(),
                i = as(),
                a = ag(),
                o = iw(),
                s = n("".charAt);
            t({
                target: "String",
                proto: !0,
                forced: o(function() {
                    return "\uD842" !== "𠮷".at(-2)
                })
            }, {
                at: function(t) {
                    var n = a(r(this)),
                        o = n.length,
                        u = i(t),
                        c = u >= 0 ? u : o + u;
                    return c < 0 || c >= o ? void 0 : s(n, c)
                }
            })
        }
    }(), aq()("String", "at")), nT || (nT = 1, function() {
        if (!nS) {
            nS = 1;
            var t = av(),
                n = aC().findLast,
                r = ak();
            t({
                target: "Array",
                proto: !0
            }, {
                findLast: function(t) {
                    return n(this, t, arguments.length > 1 ? arguments[1] : void 0)
                }
            }), r("findLast")
        }
    }(), aq()("Array", "findLast")), nq || (nq = 1, function() {
        if (!nE) {
            nE = 1;
            var t = av(),
                n = aC().findLastIndex,
                r = ak();
            t({
                target: "Array",
                proto: !0
            }, {
                findLastIndex: function(t) {
                    return n(this, t, arguments.length > 1 ? arguments[1] : void 0)
                }
            }), r("findLastIndex")
        }
    }(), aq()("Array", "findLastIndex")), nK || (nK = 1, nk || (nk = 1, av()({
        target: "Object",
        stat: !0,
        sham: !ix()
    }, {
        create: aP()
    })), function() {
        if (!nG) {
            nG = 1;
            var t = av(),
                n = aI(),
                r = iO(),
                i = iE(),
                a = iF(),
                o = iC(),
                s = iY(),
                u = aO(),
                c = iw(),
                l = Object.groupBy,
                d = r("Object", "create"),
                f = i([].push);
            t({
                target: "Object",
                stat: !0,
                forced: !l || c(function() {
                    return 1 !== l("ab", function(t) {
                        return t
                    }).a.length
                })
            }, {
                groupBy: function(t, r) {
                    o(t), a(r);
                    var i = d(null),
                        c = 0;
                    return u(t, function(t) {
                        var a = s(r(t, c++));
                        a in i ? f(i[a], t) : n(i, a, [t])
                    }), i
                }
            })
        }
    }(), aN().Object.groupBy);
    var aW = {
            exports: {}
        },
        aH = {};

    function aK() {
        if (rS) return aW.exports;
        rS = 1;
        var t = av(),
            n = iE(),
            r = an(),
            i = iL(),
            a = iX(),
            o = i8().f,
            s = af(),
            u = function() {
                if (ry) return aH;
                ry = 1;
                var t = iq(),
                    n = iI(),
                    r = af().f,
                    i = rm ? rv : (rm = 1, rv = iE()([].slice)),
                    a = window && Object.getOwnPropertyNames ? Object.getOwnPropertyNames(window) : [],
                    o = function(t) {
                        try {
                            return r(t)
                        } catch (t) {
                            return i(a)
                        }
                    };
                return aH.f = function(i) {
                    return a && "Window" === t(i) ? o(i) : r(n(i))
                }, aH
            }(),
            c = function() {
                if (rx) return rw;
                rx = 1;
                var t = iw(),
                    n = iL(),
                    r = iq(),
                    i = rb ? rg : (rb = 1, rg = iw()(function() {
                        if ("function" == typeof ArrayBuffer) {
                            var t = new ArrayBuffer(8);
                            Object.isExtensible(t) && Object.defineProperty(t, "a", {
                                value: 8
                            })
                        }
                    })),
                    a = Object.isExtensible;
                return rw = t(function() {}) || i ? function(t) {
                    return !!n(t) && (!i || "ArrayBuffer" !== r(t)) && (!a || a(t))
                } : a
            }(),
            l = i$(),
            d = rR ? rP : (rR = 1, rP = !iw()(function() {
                return Object.isExtensible(Object.preventExtensions({}))
            })),
            f = !1,
            h = l("meta"),
            p = 0,
            v = function(t) {
                o(t, h, {
                    value: {
                        objectID: "O" + p++,
                        weakData: {}
                    }
                })
            },
            m = aW.exports = {
                enable: function() {
                    m.enable = function() {}, f = !0;
                    var r = s.f,
                        i = n([].splice),
                        a = {};
                    a[h] = 1, r(a).length && (s.f = function(t) {
                        for (var n = r(t), a = 0, o = n.length; a < o; a++)
                            if (n[a] === h) {
                                i(n, a, 1);
                                break
                            } return n
                    }, t({
                        target: "Object",
                        stat: !0,
                        forced: !0
                    }, {
                        getOwnPropertyNames: u.f
                    }))
                },
                fastKey: function(t, n) {
                    if (!i(t)) return "symbol" == typeof t ? t : ("string" == typeof t ? "S" : "P") + t;
                    if (!a(t, h)) {
                        if (!c(t)) return "F";
                        if (!n) return "E";
                        v(t)
                    }
                    return t[h].objectID
                },
                getWeakData: function(t, n) {
                    if (!a(t, h)) {
                        if (!c(t)) return !0;
                        if (!n) return !1;
                        v(t)
                    }
                    return t[h].weakData
                },
                onFreeze: function(t) {
                    return d && f && c(t) && !a(t, h) && v(t), t
                }
            };
        return r[h] = !0, aW.exports
    }

    function aJ() {
        if (rE) return rT;
        rE = 1;
        var t = iN(),
            n = TypeError;
        return rT = function(r, i) {
            if (t(i, r)) return r;
            throw new n("Incorrect invocation")
        }
    }

    function az() {
        if (rC) return rA;
        rC = 1;
        var t = ij(),
            n = iL(),
            r = aV();
        return rA = function(i, a, o) {
            var s, u;
            return r && t(s = a.constructor) && s !== o && n(u = s.prototype) && u !== o.prototype && r(i, u), i
        }
    }

    function aQ() {
        if (rj) return rI;
        rj = 1;
        var t = av(),
            n = ig(),
            r = iE(),
            i = ap(),
            a = aa(),
            o = aK(),
            s = aO(),
            u = aJ(),
            c = ij(),
            l = iA(),
            d = iL(),
            f = iw(),
            h = function() {
                if (rk) return rq;
                rk = 1;
                var t = iZ()("iterator"),
                    n = !1;
                try {
                    var r = 0,
                        i = {
                            next: function() {
                                return {
                                    done: !!r++
                                }
                            },
                            return: function() {
                                n = !0
                            }
                        };
                    i[t] = function() {
                        return this
                    }, Array.from(i, function() {
                        throw 2
                    })
                } catch (t) {}
                return rq = function(r, i) {
                    try {
                        if (!i && !n) return !1
                    } catch (t) {
                        return !1
                    }
                    var a = !1;
                    try {
                        var o = {};
                        o[t] = function() {
                            return {
                                next: function() {
                                    return {
                                        done: a = !0
                                    }
                                }
                            }
                        }, r(o)
                    } catch (t) {}
                    return a
                }
            }(),
            p = aB(),
            v = az();
        return rI = function(m, y, g) {
            var b = -1 !== m.indexOf("Map"),
                w = -1 !== m.indexOf("Weak"),
                x = b ? "set" : "add",
                P = n[m],
                R = P && P.prototype,
                S = P,
                T = {},
                E = function(t) {
                    var n = r(R[t]);
                    a(R, t, "add" === t ? function(t) {
                        return n(this, 0 === t ? 0 : t), this
                    } : "delete" === t ? function(t) {
                        return (!w || !!d(t)) && n(this, 0 === t ? 0 : t)
                    } : "get" === t ? function(t) {
                        return w && !d(t) ? void 0 : n(this, 0 === t ? 0 : t)
                    } : "has" === t ? function(t) {
                        return (!w || !!d(t)) && n(this, 0 === t ? 0 : t)
                    } : function(t, r) {
                        return n(this, 0 === t ? 0 : t, r), this
                    })
                };
            if (i(m, !c(P) || !(w || R.forEach && !f(function() {
                    new P().entries().next()
                })))) S = g.getConstructor(y, m, b, x), o.enable();
            else if (i(m, !0)) {
                var q = new S,
                    k = q[x](w ? {} : -0, 1) !== q,
                    A = f(function() {
                        q.has(1)
                    }),
                    C = h(function(t) {
                        new P(t)
                    }),
                    I = !w && f(function() {
                        for (var t = new P, n = 5; n--;) t[x](n, n);
                        return !t.has(-0)
                    });
                C || ((S = y(function(t, n) {
                    u(t, R);
                    var r = v(new P, t, S);
                    return l(n) || s(n, r[x], {
                        that: r,
                        AS_ENTRIES: b
                    }), r
                })).prototype = R, R.constructor = S), (A || I) && (E("delete"), E("has"), b && E("get")), (I || k) && E(x), w && R.clear && delete R.clear
            }
            return T[m] = S, t({
                global: !0,
                constructor: !0,
                forced: S !== P
            }, T), p(S, m), w || g.setStrong(S, m, b), S
        }
    }

    function aX() {
        if (rO) return rL;
        rO = 1;
        var t = ai(),
            n = i8();
        return rL = function(r, i, a) {
            return a.get && t(a.get, i, {
                getter: !0
            }), a.set && t(a.set, i, {
                setter: !0
            }), n.f(r, i, a)
        }
    }

    function a$() {
        if (rB) return rU;
        rB = 1;
        var t = aP(),
            n = aX(),
            r = function() {
                if (rD) return rN;
                rD = 1;
                var t = aa();
                return rN = function(n, r, i) {
                    for (var a in r) t(n, a, r[a], i);
                    return n
                }
            }(),
            i = aA(),
            a = aJ(),
            o = iA(),
            s = aO(),
            u = aF(),
            c = aG(),
            l = function() {
                if (rM) return r_;
                rM = 1;
                var t = iO(),
                    n = aX(),
                    r = iZ(),
                    i = ix(),
                    a = r("species");
                return r_ = function(r) {
                    var o = t(r);
                    i && o && !o[a] && n(o, a, {
                        configurable: !0,
                        get: function() {
                            return this
                        }
                    })
                }
            }(),
            d = ix(),
            f = aK().fastKey,
            h = ar(),
            p = h.set,
            v = h.getterFor;
        return rU = {
            getConstructor: function(u, c, l, h) {
                var m = u(function(n, r) {
                        a(n, y), p(n, {
                            type: c,
                            index: t(null),
                            first: null,
                            last: null,
                            size: 0
                        }), d || (n.size = 0), o(r) || s(r, n[h], {
                            that: n,
                            AS_ENTRIES: l
                        })
                    }),
                    y = m.prototype,
                    g = v(c),
                    b = function(t, n, r) {
                        var i, a, o = g(t),
                            s = w(t, n);
                        return s ? s.value = r : (o.last = s = {
                            index: a = f(n, !0),
                            key: n,
                            value: r,
                            previous: i = o.last,
                            next: null,
                            removed: !1
                        }, o.first || (o.first = s), i && (i.next = s), d ? o.size++ : t.size++, "F" !== a && (o.index[a] = s)), t
                    },
                    w = function(t, n) {
                        var r, i = g(t),
                            a = f(n);
                        if ("F" !== a) return i.index[a];
                        for (r = i.first; r; r = r.next)
                            if (r.key === n) return r
                    };
                return r(y, {
                    clear: function() {
                        for (var n = g(this), r = n.first; r;) r.removed = !0, r.previous && (r.previous = r.previous.next = null), r = r.next;
                        n.first = n.last = null, n.index = t(null), d ? n.size = 0 : this.size = 0
                    },
                    delete: function(t) {
                        var n = g(this),
                            r = w(this, t);
                        if (r) {
                            var i = r.next,
                                a = r.previous;
                            delete n.index[r.index], r.removed = !0, a && (a.next = i), i && (i.previous = a), n.first === r && (n.first = i), n.last === r && (n.last = a), d ? n.size-- : this.size--
                        }
                        return !!r
                    },
                    forEach: function(t) {
                        for (var n, r = g(this), a = i(t, arguments.length > 1 ? arguments[1] : void 0); n = n ? n.next : r.first;)
                            for (a(n.value, n.key, this); n && n.removed;) n = n.previous
                    },
                    has: function(t) {
                        return !!w(this, t)
                    }
                }), r(y, l ? {
                    get: function(t) {
                        var n = w(this, t);
                        return n && n.value
                    },
                    set: function(t, n) {
                        return b(this, 0 === t ? 0 : t, n)
                    }
                } : {
                    add: function(t) {
                        return b(this, t = 0 === t ? 0 : t, t)
                    }
                }), d && n(y, "size", {
                    configurable: !0,
                    get: function() {
                        return g(this).size
                    }
                }), m
            },
            setStrong: function(t, n, r) {
                var i = n + " Iterator",
                    a = v(n),
                    o = v(i);
                u(t, n, function(t, n) {
                    p(this, {
                        type: i,
                        target: t,
                        state: a(t),
                        kind: n,
                        last: null
                    })
                }, function() {
                    for (var t = o(this), n = t.kind, r = t.last; r && r.removed;) r = r.previous;
                    return t.target && (t.last = r = r ? r.next : t.state.first) ? "keys" === n ? c(r.key, !1) : "values" === n ? c(r.value, !1) : c([r.key, r.value], !1) : (t.target = null, c(void 0, !0))
                }, r ? "entries" : "values", !r, !0), l(n)
            }
        }
    }

    function aZ() {
        if (rK) return rH;
        rK = 1;
        var t = ig(),
            n = iD(),
            r = iq(),
            i = function(t) {
                return n.slice(0, t.length) === t
            };
        return rH = i("Bun/") ? "BUN" : i("Cloudflare-Workers") ? "CLOUDFLARE" : i("Deno/") ? "DENO" : i("Node.js/") ? "NODE" : t.Bun && "string" == typeof Bun.version ? "BUN" : t.Deno && "object" == typeof Deno.version ? "DENO" : "process" === r(t.process) ? "NODE" : t.window && t.document ? "BROWSER" : "REST"
    }

    function aY() {
        if (rX) return rQ;
        rX = 1;
        var t = ig(),
            n = rz ? rJ : (rz = 1, rJ = "NODE" === aZ());
        return rQ = function(r) {
            if (n) {
                try {
                    return t.process.getBuiltinModule(r)
                } catch (t) {}
                try {
                    return Function('return require("' + r + '")')()
                } catch (t) {}
            }
        }
    }

    function a0() {
        return rZ ? r$ : (rZ = 1, r$ = {
            IndexSizeError: {
                s: "INDEX_SIZE_ERR",
                c: 1,
                m: 1
            },
            DOMStringSizeError: {
                s: "DOMSTRING_SIZE_ERR",
                c: 2,
                m: 0
            },
            HierarchyRequestError: {
                s: "HIERARCHY_REQUEST_ERR",
                c: 3,
                m: 1
            },
            WrongDocumentError: {
                s: "WRONG_DOCUMENT_ERR",
                c: 4,
                m: 1
            },
            InvalidCharacterError: {
                s: "INVALID_CHARACTER_ERR",
                c: 5,
                m: 1
            },
            NoDataAllowedError: {
                s: "NO_DATA_ALLOWED_ERR",
                c: 6,
                m: 0
            },
            NoModificationAllowedError: {
                s: "NO_MODIFICATION_ALLOWED_ERR",
                c: 7,
                m: 1
            },
            NotFoundError: {
                s: "NOT_FOUND_ERR",
                c: 8,
                m: 1
            },
            NotSupportedError: {
                s: "NOT_SUPPORTED_ERR",
                c: 9,
                m: 1
            },
            InUseAttributeError: {
                s: "INUSE_ATTRIBUTE_ERR",
                c: 10,
                m: 1
            },
            InvalidStateError: {
                s: "INVALID_STATE_ERR",
                c: 11,
                m: 1
            },
            SyntaxError: {
                s: "SYNTAX_ERR",
                c: 12,
                m: 1
            },
            InvalidModificationError: {
                s: "INVALID_MODIFICATION_ERR",
                c: 13,
                m: 1
            },
            NamespaceError: {
                s: "NAMESPACE_ERR",
                c: 14,
                m: 1
            },
            InvalidAccessError: {
                s: "INVALID_ACCESS_ERR",
                c: 15,
                m: 1
            },
            ValidationError: {
                s: "VALIDATION_ERR",
                c: 16,
                m: 0
            },
            TypeMismatchError: {
                s: "TYPE_MISMATCH_ERR",
                c: 17,
                m: 1
            },
            SecurityError: {
                s: "SECURITY_ERR",
                c: 18,
                m: 1
            },
            NetworkError: {
                s: "NETWORK_ERR",
                c: 19,
                m: 1
            },
            AbortError: {
                s: "ABORT_ERR",
                c: 20,
                m: 1
            },
            URLMismatchError: {
                s: "URL_MISMATCH_ERR",
                c: 21,
                m: 1
            },
            QuotaExceededError: {
                s: "QUOTA_EXCEEDED_ERR",
                c: 22,
                m: 1
            },
            TimeoutError: {
                s: "TIMEOUT_ERR",
                c: 23,
                m: 1
            },
            InvalidNodeTypeError: {
                s: "INVALID_NODE_TYPE_ERR",
                c: 24,
                m: 1
            },
            DataCloneError: {
                s: "DATA_CLONE_ERR",
                c: 25,
                m: 1
            }
        })
    }

    function a1() {
        if (r0) return rY;
        r0 = 1;
        var t = iE(),
            n = Error,
            r = t("".replace),
            i = String(new n("zxcasd").stack),
            a = /\n\s*at [^:]*:[^\n]*/,
            o = a.test(i);
        return rY = function(t, i) {
            if (o && "string" == typeof t && !n.prepareStackTrace)
                for (; i--;) t = r(t, a, "");
            return t
        }
    }

    function a2() {
        if (it) return ie;
        it = 1;
        var t = iE(),
            n = Set.prototype;
        return ie = {
            Set: Set,
            add: t(n.add),
            has: t(n.has),
            remove: t(n.delete),
            proto: n
        }
    }

    function a4() {
        if (iu) return is;
        iu = 1;
        var t = ig(),
            n = iw(),
            r = i_(),
            i = aZ(),
            a = t.structuredClone;
        return is = !!a && !n(function() {
            if ("DENO" === i && r > 92 || "NODE" === i && r > 94 || "BROWSER" === i && r > 97) return !1;
            var t = new ArrayBuffer(8),
                n = a(t, {
                    transfer: [t]
                });
            return 0 !== t.byteLength || 8 !== n.byteLength
        })
    }

    function a3(t) {
        var n = this.constructor;
        return this.then(function(r) {
            return n.resolve(t()).then(function() {
                return r
            })
        }, function(r) {
            return n.resolve(t()).then(function() {
                return n.reject(r)
            })
        })
    }

    function a6(t) {
        return new this(function(n, r) {
            if (!(t && void 0 !== t.length)) return r(TypeError(typeof t + " " + t + " is not iterable(cannot read property Symbol(Symbol.iterator))"));
            var i = Array.prototype.slice.call(t);
            if (0 === i.length) return n([]);
            for (var a = i.length, o = 0; o < i.length; o++) ! function t(r, o) {
                if (o && ("object" == typeof o || "function" == typeof o)) {
                    var s = o.then;
                    if ("function" == typeof s) return void s.call(o, function(n) {
                        t(r, n)
                    }, function(t) {
                        i[r] = {
                            status: "rejected",
                            reason: t
                        }, 0 == --a && n(i)
                    })
                }
                i[r] = {
                    status: "fulfilled",
                    value: o
                }, 0 == --a && n(i)
            }(o, i[o])
        })
    }

    function a8(t, n) {
        this.name = "AggregateError", this.errors = t, this.message = n || ""
    }

    function a5(t) {
        var n = this;
        return new n(function(r, i) {
            if (!(t && void 0 !== t.length)) return i(TypeError("Promise.any accepts an array"));
            var a = Array.prototype.slice.call(t);
            if (0 === a.length) return i();
            for (var o = [], s = 0; s < a.length; s++) try {
                n.resolve(a[s]).then(r).catch(function(t) {
                    o.push(t), o.length === a.length && i(new a8(o, "All promises were rejected"))
                })
            } catch (t) {
                i(t)
            }
        })
    }
    iv || (iv = 1, function() {
        if (!n$) {
            n$ = 1;
            var t = aa(),
                n = a_(),
                r = Error.prototype;
            r.toString !== n && t(r, "toString", n)
        }
    }(), function() {
        if (!rl) {
            rl = 1;
            var t = iI(),
                n = ak(),
                r = aj(),
                i = ar(),
                a = i8().f,
                o = aF(),
                s = aG(),
                u = iH(),
                c = ix(),
                l = "Array Iterator",
                d = i.set,
                f = i.getterFor(l);
            o(Array, "Array", function(n, r) {
                d(this, {
                    type: l,
                    target: t(n),
                    index: 0,
                    kind: r
                })
            }, function() {
                var t = f(this),
                    n = t.target,
                    r = t.index++;
                if (!n || r >= n.length) return t.target = null, s(void 0, !0);
                switch (t.kind) {
                    case "keys":
                        return s(r, !1);
                    case "values":
                        return s(n[r], !1)
                }
                return s([r, n[r]], !1)
            }, "values");
            var h = r.Arguments = r.Array;
            if (n("keys"), n("values"), n("entries"), !u && c && "values" !== h.name) try {
                a(h, "name", {
                    value: "values"
                })
            } catch (t) {}
        }
    }(), function() {
        if (!rd) {
            rd = 1;
            var t = av(),
                n = iQ(),
                r = ax();
            t({
                target: "Object",
                stat: !0,
                forced: iw()(function() {
                    r(1)
                })
            }, {
                keys: function(t) {
                    return r(n(t))
                }
            })
        }
    }(), function() {
        if (!rp) {
            rp = 1;
            var t = am(),
                n = aa(),
                r = function() {
                    if (rh) return rf;
                    rh = 1;
                    var t = am(),
                        n = ay();
                    return rf = t ? ({}).toString : function() {
                        return "[object " + n(this) + "]"
                    }
                }();
            t || n(Object.prototype, "toString", r, {
                unsafe: !0
            })
        }
    }(), rF || (rF = 1, rV || (rV = 1, aQ()("Map", function(t) {
        return function() {
            return t(this, arguments.length ? arguments[0] : void 0)
        }
    }, a$()))), rW || (rW = 1, rG || (rG = 1, aQ()("Set", function(t) {
        return function() {
            return t(this, arguments.length ? arguments[0] : void 0)
        }
    }, a$()))), function() {
        if (!r1) {
            r1 = 1;
            var t = av(),
                n = iO(),
                r = aY(),
                i = iw(),
                a = aP(),
                o = iT(),
                s = i8().f,
                u = aa(),
                c = aX(),
                l = iX(),
                d = aJ(),
                f = i6(),
                h = a_(),
                p = aD(),
                v = a0(),
                m = a1(),
                y = ar(),
                g = ix(),
                b = iH(),
                w = "DOMException",
                x = "DATA_CLONE_ERR",
                P = n("Error"),
                R = n(w) || function() {
                    try {
                        new(n("MessageChannel") || r("worker_threads").MessageChannel)().port1.postMessage(new WeakMap)
                    } catch (t) {
                        if (t.name === x && 25 === t.code) return t.constructor
                    }
                }(),
                S = R && R.prototype,
                T = P.prototype,
                E = y.set,
                q = y.getterFor(w),
                k = "stack" in new P(w),
                A = function(t) {
                    return l(v, t) && v[t].m ? v[t].c : 0
                },
                C = function() {
                    d(this, I);
                    var t = arguments.length,
                        n = p(t < 1 ? void 0 : arguments[0]),
                        r = p(t < 2 ? void 0 : arguments[1], "Error"),
                        i = A(r);
                    if (E(this, {
                            type: w,
                            name: r,
                            message: n,
                            code: i
                        }), g || (this.name = r, this.message = n, this.code = i), k) {
                        var a = new P(n);
                        a.name = w, s(this, "stack", o(1, m(a.stack, 1)))
                    }
                },
                I = C.prototype = a(T),
                j = function(t) {
                    return {
                        enumerable: !0,
                        configurable: !0,
                        get: t
                    }
                },
                L = function(t) {
                    return j(function() {
                        return q(this)[t]
                    })
                };
            g && (c(I, "code", L("code")), c(I, "message", L("message")), c(I, "name", L("name"))), s(I, "constructor", o(1, C));
            var O = i(function() {
                    return !(new R instanceof P)
                }),
                N = O || i(function() {
                    return T.toString !== h || "2: 1" !== String(new R(1, 2))
                }),
                D = O || i(function() {
                    return 25 !== new R(1, "DataCloneError").code
                }),
                _ = O || 25 !== R[x] || 25 !== S[x],
                M = b ? N || D || _ : O;
            t({
                global: !0,
                constructor: !0,
                forced: M
            }, {
                DOMException: M ? C : R
            });
            var U = n(w),
                B = U.prototype;
            for (var V in N && (b || R === U) && u(B, "toString", h), D && g && R === U && c(B, "code", j(function() {
                    return A(f(this).name)
                })), v)
                if (l(v, V)) {
                    var F = v[V],
                        G = F.s,
                        W = o(6, F.c);
                    l(U, G) || s(U, G, W), l(B, G) || s(B, G, W)
                }
        }
    }(), function() {
        if (!r2) {
            r2 = 1;
            var t = av(),
                n = ig(),
                r = iO(),
                i = iT(),
                a = i8().f,
                o = iX(),
                s = aJ(),
                u = az(),
                c = aD(),
                l = a0(),
                d = a1(),
                f = ix(),
                h = iH(),
                p = "DOMException",
                v = r("Error"),
                m = r(p),
                y = function() {
                    s(this, g);
                    var t = arguments.length,
                        n = c(t < 1 ? void 0 : arguments[0]),
                        r = c(t < 2 ? void 0 : arguments[1], "Error"),
                        o = new m(n, r),
                        l = new v(n);
                    return l.name = p, a(o, "stack", i(1, d(l.stack, 1))), u(o, this, y), o
                },
                g = y.prototype = m.prototype,
                b = "stack" in new v(p),
                w = "stack" in new m(1, 2),
                x = m && f && Object.getOwnPropertyDescriptor(n, p),
                P = !!x && !(x.writable && x.configurable),
                R = b && !P && !w;
            t({
                global: !0,
                constructor: !0,
                forced: h || R
            }, {
                DOMException: R ? y : m
            });
            var S = r(p),
                T = S.prototype;
            if (T.constructor !== S) {
                for (var E in h || a(T, "constructor", i(1, S)), l)
                    if (o(l, E)) {
                        var q = l[E],
                            k = q.s;
                        o(S, k) || a(S, k, i(6, q.c))
                    }
            }
        }
    }(), function() {
        if (!r4) {
            r4 = 1;
            var t = iO(),
                n = aB(),
                r = "DOMException";
            n(t(r), r)
        }
    }(), function() {
        if (!ip) {
            ip = 1;
            var t = iH(),
                n = av(),
                r = ig(),
                i = iO(),
                a = iE(),
                o = iw(),
                s = i$(),
                u = ij(),
                c = function() {
                    if (r6) return r3;
                    r6 = 1;
                    var t = iE(),
                        n = iw(),
                        r = ij(),
                        i = ay(),
                        a = iO(),
                        o = ae(),
                        s = function() {},
                        u = a("Reflect", "construct"),
                        c = /^\s*(?:class|function)\b/,
                        l = t(c.exec),
                        d = !c.test(s),
                        f = function(t) {
                            if (!r(t)) return !1;
                            try {
                                return u(s, [], t), !0
                            } catch (t) {
                                return !1
                            }
                        },
                        h = function(t) {
                            if (!r(t)) return !1;
                            switch (i(t)) {
                                case "AsyncFunction":
                                case "GeneratorFunction":
                                case "AsyncGeneratorFunction":
                                    return !1
                            }
                            try {
                                return d || !!l(c, o(t))
                            } catch (t) {
                                return !0
                            }
                        };
                    return h.sham = !0, r3 = !u || n(function() {
                        var t;
                        return f(f.call) || !f(Object) || !f(function() {
                            t = !0
                        }) || t
                    }) ? h : f
                }(),
                l = iA(),
                d = iL(),
                f = iB(),
                h = aO(),
                p = i6(),
                v = ay(),
                m = iX(),
                y = aI(),
                g = i5(),
                b = ac(),
                w = function() {
                    if (r5) return r8;
                    r5 = 1;
                    var t = TypeError;
                    return r8 = function(n, r) {
                        if (n < r) throw new t("Not enough arguments");
                        return n
                    }
                }(),
                x = aE(),
                P = function() {
                    if (r9) return r7;
                    r9 = 1;
                    var t = iE(),
                        n = Map.prototype;
                    return r7 = {
                        Map: Map,
                        set: t(n.set),
                        get: t(n.get),
                        has: t(n.has),
                        remove: t(n.delete),
                        proto: n
                    }
                }(),
                R = a2(),
                S = function() {
                    if (io) return ia;
                    io = 1;
                    var t = iE(),
                        n = function() {
                            if (ii) return ir;
                            ii = 1;
                            var t = iR();
                            return ir = function(n, r, i) {
                                for (var a, o, s = i ? n : n.iterator, u = n.next; !(a = t(u, s)).done;)
                                    if (void 0 !== (o = r(a.value))) return o
                            }
                        }(),
                        r = a2(),
                        i = r.Set,
                        a = r.proto,
                        o = t(a.forEach),
                        s = t(a.keys),
                        u = s(new i).next;
                    return ia = function(t, r, i) {
                        return i ? n({
                            iterator: s(t),
                            next: u
                        }, r) : o(t, r)
                    }
                }(),
                T = function() {
                    if (il) return ic;
                    il = 1;
                    var t, n, r, i, a = ig(),
                        o = aY(),
                        s = a4(),
                        u = a.structuredClone,
                        c = a.ArrayBuffer,
                        l = a.MessageChannel,
                        d = !1;
                    if (s) d = function(t) {
                        u(t, {
                            transfer: [t]
                        })
                    };
                    else if (c) try {
                        !l && (t = o("worker_threads")) && (l = t.MessageChannel), l && (n = new l, r = new c(2), i = function(t) {
                            n.port1.postMessage(null, [t])
                        }, 2 === r.byteLength && (i(r), 0 === r.byteLength && (d = i)))
                    } catch (t) {}
                    return ic = d
                }(),
                E = function() {
                    if (ih) return id;
                    ih = 1;
                    var t = iw(),
                        n = iT();
                    return id = !t(function() {
                        var t = Error("a");
                        return !("stack" in t) || (Object.defineProperty(t, "stack", n(1, 7)), 7 !== t.stack)
                    })
                }(),
                q = a4(),
                k = r.Object,
                A = r.Array,
                C = r.Date,
                I = r.Error,
                j = r.TypeError,
                L = r.PerformanceMark,
                O = i("DOMException"),
                N = P.Map,
                D = P.has,
                _ = P.get,
                M = P.set,
                U = R.Set,
                B = R.add,
                V = R.has,
                F = i("Object", "keys"),
                G = a([].push),
                W = a((!0).valueOf),
                H = a(1.1.valueOf),
                K = a("".valueOf),
                J = a(C.prototype.getTime),
                z = s("structuredClone"),
                Q = "DataCloneError",
                X = "Transferring",
                $ = function(t) {
                    return !o(function() {
                        var n = new r.Set([7]),
                            i = t(n),
                            a = t(k(7));
                        return i === n || !i.has(7) || !d(a) || 7 != +a
                    }) && t
                },
                Z = function(t, n) {
                    return !o(function() {
                        var r = new n,
                            i = t({
                                a: r,
                                b: r
                            });
                        return !(i && i.a === i.b && i.a instanceof n && i.a.stack === r.stack)
                    })
                },
                Y = r.structuredClone,
                ee = t || !Z(Y, I) || !Z(Y, O) || !!o(function() {
                    var t = Y(new r.AggregateError([1], z, {
                        cause: 3
                    }));
                    return "AggregateError" !== t.name || 1 !== t.errors[0] || t.message !== z || 3 !== t.cause
                }),
                et = !Y && $(function(t) {
                    return new L(z, {
                        detail: t
                    }).detail
                }),
                en = $(Y) || et,
                er = function(t) {
                    throw new O("Uncloneable type: " + t, Q)
                },
                ei = function(t, n) {
                    throw new O((n || "Cloning") + " of " + t + " cannot be properly polyfilled in this engine", Q)
                },
                ea = function(t, n) {
                    return en || ei(n), en(t)
                },
                eo = function() {
                    var t;
                    try {
                        t = new r.DataTransfer
                    } catch (n) {
                        try {
                            t = new r.ClipboardEvent("").clipboardData
                        } catch (t) {}
                    }
                    return t && t.items && t.files ? t : null
                },
                es = function(t, n, i) {
                    if (D(n, t)) return _(n, t);
                    if ("SharedArrayBuffer" === (i || v(t))) a = en ? en(t) : t;
                    else {
                        var a, o, s, c, l, d, f = r.DataView;
                        f || u(t.slice) || ei("ArrayBuffer");
                        try {
                            if (u(t.slice) && !t.resizable) a = t.slice(0);
                            else
                                for (o = t.byteLength, s = ("maxByteLength" in t) ? {
                                        maxByteLength: t.maxByteLength
                                    } : void 0, a = new ArrayBuffer(o, s), c = new f(t), l = new f(a), d = 0; d < o; d++) l.setUint8(d, c.getUint8(d))
                        } catch (t) {
                            throw new O("ArrayBuffer is detached", Q)
                        }
                    }
                    return M(n, t, a), a
                },
                eu = function(t, n, i, a, o) {
                    var s = r[n];
                    return d(s) || ei(n), new s(es(t.buffer, o), i, a)
                },
                ec = function(t, n) {
                    if (f(t) && er("Symbol"), !d(t)) return t;
                    if (n) {
                        if (D(n, t)) return _(n, t)
                    } else n = new N;
                    var a, o, s, c, l, h, p, w, P = v(t);
                    switch (P) {
                        case "Array":
                            s = A(b(t));
                            break;
                        case "Object":
                            s = {};
                            break;
                        case "Map":
                            s = new N;
                            break;
                        case "Set":
                            s = new U;
                            break;
                        case "RegExp":
                            s = new RegExp(t.source, x(t));
                            break;
                        case "Error":
                            switch (o = t.name) {
                                case "AggregateError":
                                    s = new(i(o))([]);
                                    break;
                                case "EvalError":
                                case "RangeError":
                                case "ReferenceError":
                                case "SuppressedError":
                                case "SyntaxError":
                                case "TypeError":
                                case "URIError":
                                    s = new(i(o));
                                    break;
                                case "CompileError":
                                case "LinkError":
                                case "RuntimeError":
                                    s = new(i("WebAssembly", o));
                                    break;
                                default:
                                    s = new I
                            }
                            break;
                        case "DOMException":
                            s = new O(t.message, t.name);
                            break;
                        case "ArrayBuffer":
                        case "SharedArrayBuffer":
                            s = es(t, n, P);
                            break;
                        case "DataView":
                        case "Int8Array":
                        case "Uint8Array":
                        case "Uint8ClampedArray":
                        case "Int16Array":
                        case "Uint16Array":
                        case "Int32Array":
                        case "Uint32Array":
                        case "Float16Array":
                        case "Float32Array":
                        case "Float64Array":
                        case "BigInt64Array":
                        case "BigUint64Array":
                            h = "DataView" === P ? t.byteLength : t.length, s = eu(t, P, t.byteOffset, h, n);
                            break;
                        case "DOMQuad":
                            try {
                                s = new DOMQuad(ec(t.p1, n), ec(t.p2, n), ec(t.p3, n), ec(t.p4, n))
                            } catch (n) {
                                s = ea(t, P)
                            }
                            break;
                        case "File":
                            if (en) try {
                                s = en(t), v(s) !== P && (s = void 0)
                            } catch (t) {}
                            if (!s) try {
                                s = new File([t], t.name, t)
                            } catch (t) {}
                            s || ei(P);
                            break;
                        case "FileList":
                            if (c = eo()) {
                                for (l = 0, h = b(t); l < h; l++) c.items.add(ec(t[l], n));
                                s = c.files
                            } else s = ea(t, P);
                            break;
                        case "ImageData":
                            try {
                                s = new ImageData(ec(t.data, n), t.width, t.height, {
                                    colorSpace: t.colorSpace
                                })
                            } catch (n) {
                                s = ea(t, P)
                            }
                            break;
                        default:
                            if (en) s = en(t);
                            else switch (P) {
                                case "BigInt":
                                    s = k(t.valueOf());
                                    break;
                                case "Boolean":
                                    s = k(W(t));
                                    break;
                                case "Number":
                                    s = k(H(t));
                                    break;
                                case "String":
                                    s = k(K(t));
                                    break;
                                case "Date":
                                    s = new C(J(t));
                                    break;
                                case "Blob":
                                    try {
                                        s = t.slice(0, t.size, t.type)
                                    } catch (t) {
                                        ei(P)
                                    }
                                    break;
                                case "DOMPoint":
                                case "DOMPointReadOnly":
                                    a = r[P];
                                    try {
                                        s = a.fromPoint ? a.fromPoint(t) : new a(t.x, t.y, t.z, t.w)
                                    } catch (t) {
                                        ei(P)
                                    }
                                    break;
                                case "DOMRect":
                                case "DOMRectReadOnly":
                                    a = r[P];
                                    try {
                                        s = a.fromRect ? a.fromRect(t) : new a(t.x, t.y, t.width, t.height)
                                    } catch (t) {
                                        ei(P)
                                    }
                                    break;
                                case "DOMMatrix":
                                case "DOMMatrixReadOnly":
                                    a = r[P];
                                    try {
                                        s = a.fromMatrix ? a.fromMatrix(t) : new a(t)
                                    } catch (t) {
                                        ei(P)
                                    }
                                    break;
                                case "AudioData":
                                case "VideoFrame":
                                    u(t.clone) || ei(P);
                                    try {
                                        s = t.clone()
                                    } catch (t) {
                                        er(P)
                                    }
                                    break;
                                case "CropTarget":
                                case "CryptoKey":
                                case "FileSystemDirectoryHandle":
                                case "FileSystemFileHandle":
                                case "FileSystemHandle":
                                case "GPUCompilationInfo":
                                case "GPUCompilationMessage":
                                case "ImageBitmap":
                                case "RTCCertificate":
                                case "WebAssembly.Module":
                                    ei(P);
                                default:
                                    er(P)
                            }
                    }
                    switch (M(n, t, s), P) {
                        case "Array":
                        case "Object":
                            for (l = 0, h = b(p = F(t)); l < h; l++) w = p[l], y(s, w, ec(t[w], n));
                            break;
                        case "Map":
                            t.forEach(function(t, r) {
                                M(s, ec(r, n), ec(t, n))
                            });
                            break;
                        case "Set":
                            t.forEach(function(t) {
                                B(s, ec(t, n))
                            });
                            break;
                        case "Error":
                            g(s, "message", ec(t.message, n)), m(t, "cause") && g(s, "cause", ec(t.cause, n)), "AggregateError" === o ? s.errors = ec(t.errors, n) : "SuppressedError" === o && (s.error = ec(t.error, n), s.suppressed = ec(t.suppressed, n));
                        case "DOMException":
                            E && g(s, "stack", ec(t.stack, n))
                    }
                    return s
                },
                el = function(t, n) {
                    if (!d(t)) throw new j("Transfer option cannot be converted to a sequence");
                    var i, a, o, s, l, f = [];
                    h(t, function(t) {
                        G(f, p(t))
                    });
                    for (var m = 0, y = b(f), g = new U; m < y;) {
                        if (a = v(i = f[m++]), s = void 0, "ArrayBuffer" === a ? V(g, i) : D(n, i)) throw new O("Duplicate transferable", Q);
                        if ("ArrayBuffer" === a) {
                            B(g, i);
                            continue
                        }
                        if (q) s = Y(i, {
                            transfer: [i]
                        });
                        else switch (a) {
                            case "ImageBitmap":
                                c(o = r.OffscreenCanvas) || ei(a, X);
                                try {
                                    (l = new o(i.width, i.height)).getContext("bitmaprenderer").transferFromImageBitmap(i), s = l.transferToImageBitmap()
                                } catch (t) {}
                                break;
                            case "AudioData":
                            case "VideoFrame":
                                u(i.clone) && u(i.close) || ei(a, X);
                                try {
                                    s = i.clone(), i.close()
                                } catch (t) {}
                                break;
                            case "MediaSourceHandle":
                            case "MessagePort":
                            case "MIDIAccess":
                            case "OffscreenCanvas":
                            case "ReadableStream":
                            case "RTCDataChannel":
                            case "TransformStream":
                            case "WebTransportReceiveStream":
                            case "WebTransportSendStream":
                            case "WritableStream":
                                ei(a, X)
                        }
                        if (void 0 === s) throw new O("This object cannot be transferred: " + a, Q);
                        M(n, i, s)
                    }
                    return g
                },
                ed = function(t) {
                    S(t, function(t) {
                        q ? Y(t, {
                            transfer: [t]
                        }) : u(t.transfer) ? t.transfer() : T ? T(t) : ei("ArrayBuffer", X)
                    })
                };
            n({
                global: !0,
                enumerable: !0,
                sham: !q,
                forced: ee
            }, {
                structuredClone: function(t) {
                    var n, r, i = w(arguments.length, 1) > 1 && !l(arguments[1]) ? p(arguments[1]) : void 0,
                        a = i ? i.transfer : void 0;
                    void 0 !== a && (r = el(a, n = new N));
                    var o = ec(t, n);
                    return r && ed(r), o
                }
            })
        }
    }(), aN().structuredClone), a8.prototype = Error.prototype;
    var a7 = setTimeout;

    function a9(t) {
        return !!(t && void 0 !== t.length)
    }

    function oe() {}

    function ot(t) {
        if (!(this instanceof ot)) throw TypeError("Promises must be constructed via new");
        if ("function" != typeof t) throw TypeError("not a function");
        this._state = 0, this._handled = !1, this._value = void 0, this._deferreds = [], os(t, this)
    }

    function on(t, n) {
        for (; 3 === t._state;) t = t._value;
        0 === t._state ? t._deferreds.push(n) : (t._handled = !0, ot._immediateFn(function() {
            var r, i = 1 === t._state ? n.onFulfilled : n.onRejected;
            if (null === i) return void(1 === t._state ? or : oi)(n.promise, t._value);
            try {
                r = i(t._value)
            } catch (t) {
                oi(n.promise, t);
                return
            }
            or(n.promise, r)
        }))
    }

    function or(t, n) {
        try {
            if (n === t) throw TypeError("A promise cannot be resolved with itself.");
            if (n && ("object" == typeof n || "function" == typeof n)) {
                var r = n.then;
                if (n instanceof ot) {
                    t._state = 3, t._value = n, oa(t);
                    return
                }
                if ("function" == typeof r) return void os(function() {
                    r.apply(n, arguments)
                }, t)
            }
            t._state = 1, t._value = n, oa(t)
        } catch (n) {
            oi(t, n)
        }
    }

    function oi(t, n) {
        t._state = 2, t._value = n, oa(t)
    }

    function oa(t) {
        2 === t._state && 0 === t._deferreds.length && ot._immediateFn(function() {
            t._handled || ot._unhandledRejectionFn(t._value)
        });
        for (var n = 0, r = t._deferreds.length; n < r; n++) on(t, t._deferreds[n]);
        t._deferreds = null
    }

    function oo(t, n, r) {
        this.onFulfilled = "function" == typeof t ? t : null, this.onRejected = "function" == typeof n ? n : null, this.promise = r
    }

    function os(t, n) {
        var r = !1;
        try {
            t(function(t) {
                r || (r = !0, or(n, t))
            }, function(t) {
                r || (r = !0, oi(n, t))
            })
        } catch (t) {
            if (r) return;
            r = !0, oi(n, t)
        }
    }
    ot.prototype.catch = function(t) {
        return this.then(null, t)
    }, ot.prototype.then = function(t, n) {
        var r = new this.constructor(oe);
        return on(this, new oo(t, n, r)), r
    }, ot.prototype.finally = a3, ot.all = function(t) {
        return new ot(function(n, r) {
            if (!a9(t)) return r(TypeError("Promise.all accepts an array"));
            var i = Array.prototype.slice.call(t);
            if (0 === i.length) return n([]);
            for (var a = i.length, o = 0; o < i.length; o++) ! function t(o, s) {
                try {
                    if (s && ("object" == typeof s || "function" == typeof s)) {
                        var u = s.then;
                        if ("function" == typeof u) return void u.call(s, function(n) {
                            t(o, n)
                        }, r)
                    }
                    i[o] = s, 0 == --a && n(i)
                } catch (t) {
                    r(t)
                }
            }(o, i[o])
        })
    }, ot.any = a5, ot.allSettled = a6, ot.resolve = function(t) {
        return t && "object" == typeof t && t.constructor === ot ? t : new ot(function(n) {
            n(t)
        })
    }, ot.reject = function(t) {
        return new ot(function(n, r) {
            r(t)
        })
    }, ot.race = function(t) {
        return new ot(function(n, r) {
            if (!a9(t)) return r(TypeError("Promise.race accepts an array"));
            for (var i = 0, a = t.length; i < a; i++) ot.resolve(t[i]).then(n, r)
        })
    }, ot._immediateFn = "function" == typeof setImmediate && function(t) {
        setImmediate(t)
    } || function(t) {
        a7(t, 0)
    }, ot._unhandledRejectionFn = function(t) {
        "u" > typeof console && console && console.warn("Possible Unhandled Promise Rejection:", t)
    };
    var ou = "u" > typeof self ? self : window;
    "function" != typeof ou.Promise ? ou.Promise = ot : (ou.Promise.prototype.finally || (ou.Promise.prototype.finally = a3), ou.Promise.allSettled || (ou.Promise.allSettled = a6), ou.Promise.any || (ou.Promise.any = a5));
    var oc = t.i(416340),
        ol = t.i(237401),
        od = t.i(68794),
        of = t.i(230242),
        oh = t.i(600496),
        op = t.i(80768),
        ov = t.i(127229);
    let om = "u" < typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__;
    var oy = t.i(489427);
    t.i(728441), t.i(823979), t.i(350941);
    let og = oy.GLOBAL_OBJ;

    function ob() {
        let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
            n = og.document,
            r = (null == n ? void 0 : n.head) || (null == n ? void 0 : n.body);
        if (!r) {
            om && oh.debug.error("[showReportDialog] Global document not defined");
            return
        }
        let i = (0, of.getCurrentScope)(),
            a = (0, of.getClient)(),
            o = null == a ? void 0 : a.getDsn();
        if (!o) {
            om && oh.debug.error("[showReportDialog] DSN not configured");
            return
        }
        let s = {
                ...t,
                user: {
                    ...i.getUser(),
                    ...t.user
                },
                eventId: t.eventId || (0, op.lastEventId)()
            },
            u = og.document.createElement("script");
        u.async = !0, u.crossOrigin = "anonymous", u.src = function(t, n) {
            let r, i, a = (0, ov.makeDsn)(t);
            if (!a) return "";
            let o = "".concat((r = a.protocol ? "".concat(a.protocol, ":") : "", i = a.port ? ":".concat(a.port) : "", "".concat(r, "//").concat(a.host).concat(i).concat(a.path ? "/".concat(a.path) : "", "/api/")), "embed/error-page/"),
                s = "dsn=".concat((0, ov.dsnToString)(a));
            for (let t in n)
                if ("dsn" !== t && "onClose" !== t)
                    if ("user" === t) {
                        let t = n.user;
                        if (!t) continue;
                        t.name && (s += "&name=".concat(encodeURIComponent(t.name))), t.email && (s += "&email=".concat(encodeURIComponent(t.email)))
                    } else s += "&".concat(encodeURIComponent(t), "=").concat(encodeURIComponent(n[t]));
            return "".concat(o, "?").concat(s)
        }(o, s);
        let {
            onLoad: c,
            onClose: l
        } = s;
        if (c && (u.onload = c), l) {
            let t = n => {
                if ("__sentry_reportdialog_closed__" === n.data) try {
                    l()
                } finally {
                    og.removeEventListener("message", t)
                }
            };
            og.addEventListener("message", t)
        }
        r.appendChild(u)
    }
    var ow = oc;
    let ox = "u" < typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__;
    var oP = t.i(379705);
    let oR = Symbol.for("react.forward_ref"),
        oS = Symbol.for("react.memo"),
        oT = {};
    oT[oR] = {
        $$typeof: !0,
        render: !0,
        defaultProps: !0,
        displayName: !0,
        propTypes: !0
    }, oT[oS] = {
        $$typeof: !0,
        compare: !0,
        defaultProps: !0,
        displayName: !0,
        propTypes: !0,
        type: !0
    }, Object.defineProperty.bind(Object), Object.getOwnPropertyNames.bind(Object), null == (o1 = Object.getOwnPropertySymbols) || o1.bind(Object), Object.getOwnPropertyDescriptor.bind(Object), Object.getPrototypeOf.bind(Object);
    let oE = {
        componentStack: null,
        error: null,
        eventId: null
    };
    class oq extends ow.Component {
        componentDidCatch(t, n) {
            let {
                componentStack: r
            } = n, {
                beforeCapture: i,
                onError: a,
                showDialog: o,
                dialogOptions: s
            } = this.props;
            (0, of.withScope)(u => {
                i && i(u, t, r);
                let c = function(t, n, r) {
                    let i, {
                        componentStack: a
                    } = n;
                    if (null !== (i = oc.version.match(/^([^.]+)/)) && parseInt(i[0]) >= 17 && (0, oP.isError)(t) && a) {
                        let n, r = Error(t.message);
                        r.name = "React ErrorBoundary ".concat(t.name), r.stack = a, n = new WeakSet,
                            function t(r, i) {
                                if (!n.has(r)) {
                                    if (r.cause) return n.add(r), t(r.cause, i);
                                    r.cause = i
                                }
                            }(t, r)
                    }
                    return (0, of.withScope)(n => (n.setContext("react", {
                        componentStack: a
                    }), (0, op.captureException)(t, r)))
                }(t, n, {
                    mechanism: {
                        handled: null != this.props.handled ? this.props.handled : !!this.props.fallback,
                        type: "auto.function.react.error_boundary"
                    }
                });
                a && a(t, r, c), o && (this._lastEventId = c, this._openFallbackReportDialog && ob({
                    ...s,
                    eventId: c
                })), this.setState({
                    error: t,
                    componentStack: r,
                    eventId: c
                })
            })
        }
        componentDidMount() {
            let {
                onMount: t
            } = this.props;
            t && t()
        }
        componentWillUnmount() {
            let {
                error: t,
                componentStack: n,
                eventId: r
            } = this.state, {
                onUnmount: i
            } = this.props;
            i && (this.state === oE ? i(null, null, null) : i(t, n, r)), this._cleanupHook && (this._cleanupHook(), this._cleanupHook = void 0)
        }
        resetErrorBoundary() {
            let {
                onReset: t
            } = this.props, {
                error: n,
                componentStack: r,
                eventId: i
            } = this.state;
            t && t(n, r, i), this.setState(oE)
        }
        render() {
            let {
                fallback: t,
                children: n
            } = this.props, r = this.state;
            if (null === r.componentStack) return "function" == typeof n ? n() : n;
            let i = "function" == typeof t ? ow.createElement(t, {
                error: r.error,
                componentStack: r.componentStack,
                resetError: () => this.resetErrorBoundary(),
                eventId: r.eventId
            }) : t;
            return ow.isValidElement(i) ? i : (t && ox && oh.debug.warn("fallback did not produce a valid ReactElement"), null)
        }
        constructor(t) {
            super(t), this.state = oE, this._openFallbackReportDialog = !0;
            const n = (0, of.getClient)();
            n && t.showDialog && (this._openFallbackReportDialog = !1, this._cleanupHook = n.on("afterSendEvent", n => {
                !n.type && this._lastEventId && n.event_id === this._lastEventId && ob({
                    ...t.dialogOptions,
                    eventId: this._lastEventId
                })
            }))
        }
    }
    var ok = t.i(387125),
        oA = t.i(795621),
        oC = t.i(458451),
        oI = t.i(260241),
        oj = t.i(429884),
        oL = t.i(602635),
        oO = t.i(79187);
    t.i(550742);
    var oN = t.i(540513),
        oD = t.i(507786);
    t.i(865800);
    var o_ = t.i(780247),
        oM = t.i(571957),
        oU = t.i(33106),
        oB = t.i(379666),
        oV = t.i(178417),
        oF = t.i(52301),
        oG = t.i(941603),
        oW = t.i(947287),
        oH = t.i(51760),
        oK = {},
        oJ = oM.default;

    function oz(t, n, r) {
        t = t || function(t) {
            this.queue(t)
        }, n = n || function() {
            this.queue(null)
        };
        var i = !1,
            a = !1,
            o = [],
            s = !1,
            u = new oJ;

        function c() {
            for (; o.length && !u.paused;) {
                var t = o.shift();
                if (null === t) return u.emit("end");
                u.emit("data", t)
            }
        }
        return u.readable = u.writable = !0, u.paused = !1, u.autoDestroy = !(r && !1 === r.autoDestroy), u.write = function(n) {
            return t.call(this, n), !u.paused
        }, u.queue = u.push = function(t) {
            return s || (null === t && (s = !0), o.push(t), c()), u
        }, u.on("end", function() {
            u.readable = !1, !u.writable && u.autoDestroy && p.default.nextTick(function() {
                u.destroy()
            })
        }), u.end = function(t) {
            if (!i) return i = !0, arguments.length && u.write(t), u.writable = !1, n.call(u), !u.readable && u.autoDestroy && u.destroy(), u
        }, u.destroy = function() {
            if (!a) return a = !0, i = !0, o.length = 0, u.writable = u.readable = !1, u.emit("close"), u
        }, u.pause = function() {
            if (!u.paused) return u.paused = !0, u
        }, u.resume = function() {
            return u.paused && (u.paused = !1, u.emit("resume")), c(), u.paused || u.emit("drain"), u
        }, u
    }({
        get exports() {
            return oK
        },
        set exports(e) {
            oK = e
        }
    }).exports = oz, oz.through = oz;
    var oQ = Object.prototype.toString,
        oX = "function" == typeof oD.Buffer.alloc && "function" == typeof oD.Buffer.allocUnsafe && "function" == typeof oD.Buffer.from,
        o$ = {},
        oZ = Array.isArray || function(t) {
            return "[object Array]" == Object.prototype.toString.call(t)
        },
        oY = {};

    function o0(t) {
        return Object.prototype.toString.call(t)
    }
    oY.isArray = function(t) {
        return Array.isArray ? Array.isArray(t) : "[object Array]" === o0(t)
    }, oY.isBoolean = function(t) {
        return "boolean" == typeof t
    }, oY.isNull = function(t) {
        return null === t
    }, oY.isNullOrUndefined = function(t) {
        return null == t
    }, oY.isNumber = function(t) {
        return "number" == typeof t
    }, oY.isString = function(t) {
        return "string" == typeof t
    }, oY.isSymbol = function(t) {
        return "symbol" == typeof t
    }, oY.isUndefined = function(t) {
        return void 0 === t
    }, oY.isRegExp = function(t) {
        return "[object RegExp]" === o0(t)
    }, oY.isObject = function(t) {
        return "object" == typeof t && null !== t
    }, oY.isDate = function(t) {
        return "[object Date]" === o0(t)
    }, oY.isError = function(t) {
        return "[object Error]" === o0(t) || t instanceof Error
    }, oY.isFunction = function(t) {
        return "function" == typeof t
    }, oY.isPrimitive = function(t) {
        return null === t || "boolean" == typeof t || "number" == typeof t || "string" == typeof t || "symbol" == typeof t || void 0 === t
    }, oY.isBuffer = oU.default.Buffer.isBuffer;
    var o1, o2, o4 = {},
        o3 = {},
        o6 = {
            get exports() {
                return o3
            },
            set exports(e) {
                o3 = e
            }
        },
        o8 = {
            get exports() {
                return o4
            },
            set exports(e) {
                o4 = e
            }
        };
    try {
        var o5 = t.r(52301);
        if ("function" != typeof o5.inherits) throw "";
        o8.exports = o5.inherits
    } catch (t) {
        o2 || (o2 = 1, "function" == typeof Object.create ? o6.exports = function(t, n) {
            n && (t.super_ = n, t.prototype = Object.create(n.prototype, {
                constructor: {
                    value: t,
                    enumerable: !1,
                    writable: !0,
                    configurable: !0
                }
            }))
        } : o6.exports = function(t, n) {
            if (n) {
                t.super_ = n;
                var r = function() {};
                r.prototype = n.prototype, t.prototype = new r, t.prototype.constructor = t
            }
        }), o8.exports = o3
    }
    var o7, o9 = {};

    function se() {
        if (o7) return o9;
        o7 = 1;
        var t = oU.default.Buffer,
            n = t.isEncoding || function(t) {
                switch (t && t.toLowerCase()) {
                    case "hex":
                    case "utf8":
                    case "utf-8":
                    case "ascii":
                    case "binary":
                    case "base64":
                    case "ucs2":
                    case "ucs-2":
                    case "utf16le":
                    case "utf-16le":
                    case "raw":
                        return !0;
                    default:
                        return !1
                }
            },
            r = o9.StringDecoder = function(r) {
                switch (this.encoding = (r || "utf8").toLowerCase().replace(/[-_]/, ""), function(t) {
                        if (t && !n(t)) throw Error("Unknown encoding: " + t)
                    }(r), this.encoding) {
                    case "utf8":
                        this.surrogateSize = 3;
                        break;
                    case "ucs2":
                    case "utf16le":
                        this.surrogateSize = 2, this.detectIncompleteChar = a;
                        break;
                    case "base64":
                        this.surrogateSize = 3, this.detectIncompleteChar = o;
                        break;
                    default:
                        return void(this.write = i)
                }
                this.charBuffer = new t(6), this.charReceived = 0, this.charLength = 0
            };

        function i(t) {
            return t.toString(this.encoding)
        }

        function a(t) {
            this.charReceived = t.length % 2, this.charLength = 2 * !!this.charReceived
        }

        function o(t) {
            this.charReceived = t.length % 3, this.charLength = 3 * !!this.charReceived
        }
        return r.prototype.write = function(t) {
            for (var n, r = ""; this.charLength;) {
                var i = t.length >= this.charLength - this.charReceived ? this.charLength - this.charReceived : t.length;
                if (t.copy(this.charBuffer, this.charReceived, 0, i), this.charReceived += i, this.charReceived < this.charLength) return "";
                if (t = t.slice(i, t.length), !((n = (r = this.charBuffer.slice(0, this.charLength).toString(this.encoding)).charCodeAt(r.length - 1)) >= 55296 && n <= 56319)) {
                    if (this.charReceived = this.charLength = 0, 0 === t.length) return r;
                    break
                }
                this.charLength += this.surrogateSize, r = ""
            }
            this.detectIncompleteChar(t);
            var a = t.length;
            if (this.charLength && (t.copy(this.charBuffer, 0, t.length - this.charReceived, a), a -= this.charReceived), a = (r += t.toString(this.encoding, 0, a)).length - 1, (n = r.charCodeAt(a)) >= 55296 && n <= 56319) {
                var o = this.surrogateSize;
                return this.charLength += o, this.charReceived += o, this.charBuffer.copy(this.charBuffer, o, 0, o), t.copy(this.charBuffer, 0, 0, o), r.substring(0, a)
            }
            return r
        }, r.prototype.detectIncompleteChar = function(t) {
            for (var n = t.length >= 3 ? 3 : t.length; n > 0; n--) {
                var r = t[t.length - n];
                if (1 == n && r >> 5 == 6) {
                    this.charLength = 2;
                    break
                }
                if (n <= 2 && r >> 4 == 14) {
                    this.charLength = 3;
                    break
                }
                if (n <= 3 && r >> 3 == 30) {
                    this.charLength = 4;
                    break
                }
            }
            this.charReceived = n
        }, r.prototype.end = function(t) {
            var n = "";
            if (t && t.length && (n = this.write(t)), this.charReceived) {
                var r = this.charReceived,
                    i = this.charBuffer,
                    a = this.encoding;
                n += i.slice(0, r).toString(a)
            }
            return n
        }, o9
    }
    var st = oU.default.Buffer;
    so.ReadableState = sa;
    var sn = oB.default.EventEmitter;
    sn.listenerCount || (sn.listenerCount = function(t, n) {
        return t.listeners(n).length
    });
    var sr, si = oM.default;

    function sa(t, n) {
        var r = (t = t || {}).highWaterMark;
        this.highWaterMark = r || 0 === r ? r : 16384, this.highWaterMark = ~~this.highWaterMark, this.buffer = [], this.length = 0, this.pipes = null, this.pipesCount = 0, this.flowing = !1, this.ended = !1, this.endEmitted = !1, this.reading = !1, this.calledRead = !1, this.sync = !0, this.needReadable = !1, this.emittedReadable = !1, this.readableListening = !1, this.objectMode = !!t.objectMode, this.defaultEncoding = t.defaultEncoding || "utf8", this.ranOut = !1, this.awaitDrain = 0, this.readingMore = !1, this.decoder = null, this.encoding = null, t.encoding && (sr || (sr = se().StringDecoder), this.decoder = new sr(t.encoding), this.encoding = t.encoding)
    }

    function so(t) {
        if (!(this instanceof so)) return new so(t);
        this._readableState = new sa(t), this.readable = !0, si.call(this)
    }

    function ss(t, n, r, i, a) {
        var o, s, u = (o = r, s = null, st.isBuffer(o) || "string" == typeof o || null == o || n.objectMode || (s = TypeError("Invalid non-string/buffer chunk")), s);
        if (u) t.emit("error", u);
        else if (null == r) n.reading = !1, n.ended || function(t, n) {
            if (n.decoder && !n.ended) {
                var r = n.decoder.end();
                r && r.length && (n.buffer.push(r), n.length += n.objectMode ? 1 : r.length)
            }
            n.ended = !0, n.length > 0 ? sc(t) : sv(t)
        }(t, n);
        else if (n.objectMode || r && r.length > 0)
            if (n.ended && !a) {
                var c = Error("stream.push() after EOF");
                t.emit("error", c)
            } else n.endEmitted && a ? (c = Error("stream.unshift() after end event"), t.emit("error", c)) : (!n.decoder || a || i || (r = n.decoder.write(r)), n.length += n.objectMode ? 1 : r.length, a ? n.buffer.unshift(r) : (n.reading = !1, n.buffer.push(r)), n.needReadable && sc(t), n.readingMore || (n.readingMore = !0, p.default.nextTick(function() {
                for (var r = n.length; !n.reading && !n.flowing && !n.ended && n.length < n.highWaterMark && (t.read(0), r !== n.length);) r = n.length;
                n.readingMore = !1
            })));
        else a || (n.reading = !1);
        return !n.ended && (n.needReadable || n.length < n.highWaterMark || 0 === n.length)
    }

    function su(t, n) {
        return 0 === n.length && n.ended ? 0 : n.objectMode ? +(0 !== t) : null === t || isNaN(t) ? n.flowing && n.buffer.length ? n.buffer[0].length : n.length : t <= 0 ? 0 : (t > n.highWaterMark && (n.highWaterMark = function(t) {
            if (t >= 8388608) t = 8388608;
            else {
                t--;
                for (var n = 1; n < 32; n <<= 1) t |= t >> n;
                t++
            }
            return t
        }(t)), t > n.length ? n.ended ? n.length : (n.needReadable = !0, 0) : t)
    }

    function sc(t) {
        var n = t._readableState;
        n.needReadable = !1, n.emittedReadable || (n.emittedReadable = !0, n.sync ? p.default.nextTick(function() {
            sl(t)
        }) : sl(t))
    }

    function sl(t) {
        t.emit("readable")
    }

    function sd(t) {
        var n, r = t._readableState;

        function i(t, i, a) {
            !1 === t.write(n) && r.awaitDrain++
        }
        for (r.awaitDrain = 0; r.pipesCount && null !== (n = t.read());)
            if (1 === r.pipesCount ? i(r.pipes) : sm(r.pipes, i), t.emit("data", n), r.awaitDrain > 0) return;
        0 === r.pipesCount ? (r.flowing = !1, sn.listenerCount(t, "data") > 0 && sh(t)) : r.ranOut = !0
    }

    function sf() {
        this._readableState.ranOut && (this._readableState.ranOut = !1, sd(this))
    }

    function sh(t, n) {
        if (t._readableState.flowing) throw Error("Cannot switch to old mode now.");
        var r = n || !1,
            i = !1;
        t.readable = !0, t.pipe = si.prototype.pipe, t.on = t.addListener = si.prototype.on, t.on("readable", function() {
            var n;
            for (i = !0; !r && null !== (n = t.read());) t.emit("data", n);
            null === n && (i = !1, t._readableState.needReadable = !0)
        }), t.pause = function() {
            r = !0, this.emit("pause")
        }, t.resume = function() {
            r = !1, i ? p.default.nextTick(function() {
                t.emit("readable")
            }) : this.read(0), this.emit("resume")
        }, t.emit("readable")
    }

    function sp(t, n) {
        var r, i = n.buffer,
            a = n.length,
            o = !!n.decoder,
            s = !!n.objectMode;
        if (0 === i.length) return null;
        if (0 === a) r = null;
        else if (s) r = i.shift();
        else if (!t || t >= a) r = o ? i.join("") : st.concat(i, a), i.length = 0;
        else if (t < i[0].length) r = (d = i[0]).slice(0, t), i[0] = d.slice(t);
        else if (t === i[0].length) r = i.shift();
        else {
            r = o ? "" : new st(t);
            for (var u = 0, c = 0, l = i.length; c < l && u < t; c++) {
                var d = i[0],
                    f = Math.min(t - u, d.length);
                o ? r += d.slice(0, f) : d.copy(r, u, 0, f), f < d.length ? i[0] = d.slice(f) : i.shift(), u += f
            }
        }
        return r
    }

    function sv(t) {
        var n = t._readableState;
        if (n.length > 0) throw Error("endReadable called on non-empty stream");
        !n.endEmitted && n.calledRead && (n.ended = !0, p.default.nextTick(function() {
            n.endEmitted || 0 !== n.length || (n.endEmitted = !0, t.readable = !1, t.emit("end"))
        }))
    }

    function sm(t, n) {
        for (var r = 0, i = t.length; r < i; r++) n(t[r], r)
    }

    function sy() {
        if (sj) return sI;
        sj = 1, sI = r;
        var t = Object.keys || function(t) {
            var n = [];
            for (var r in t) n.push(r);
            return n
        };
        oY.inherits = o4;
        var n = sg();

        function r(t) {
            if (!(this instanceof r)) return new r(t);
            so.call(this, t), n.call(this, t), t && !1 === t.readable && (this.readable = !1), t && !1 === t.writable && (this.writable = !1), this.allowHalfOpen = !0, t && !1 === t.allowHalfOpen && (this.allowHalfOpen = !1), this.once("end", i)
        }

        function i() {
            this.allowHalfOpen || this._writableState.ended || p.default.nextTick(this.end.bind(this))
        }
        return oY.inherits(r, so),
            function(t, n) {
                for (var r = 0, i = t.length; r < i; r++) n(t[r], r)
            }(t(n.prototype), function(t) {
                r.prototype[t] || (r.prototype[t] = n.prototype[t])
            }), sI
    }

    function sg() {
        if (sO) return sL;
        sO = 1, sL = a;
        var t = oU.default.Buffer;
        a.WritableState = i, oY.inherits = o4;
        var n = oM.default;

        function r(t, n, r) {
            this.chunk = t, this.encoding = n, this.callback = r
        }

        function i(t, n) {
            var r = (t = t || {}).highWaterMark;
            this.highWaterMark = r || 0 === r ? r : 16384, this.objectMode = !!t.objectMode, this.highWaterMark = ~~this.highWaterMark, this.needDrain = !1, this.ending = !1, this.ended = !1, this.finished = !1;
            var i = !1 === t.decodeStrings;
            this.decodeStrings = !i, this.defaultEncoding = t.defaultEncoding || "utf8", this.length = 0, this.writing = !1, this.sync = !0, this.bufferProcessing = !1, this.onwrite = function(t) {
                ! function(t, n) {
                    var r = t._writableState,
                        i = r.sync,
                        a = r.writecb;
                    if (r.writing = !1, r.writecb = null, r.length -= r.writelen, r.writelen = 0, n) i ? p.default.nextTick(function() {
                        a(n)
                    }) : a(n), t._writableState.errorEmitted = !0, t.emit("error", n);
                    else {
                        var c = u(t, r);
                        c || r.bufferProcessing || !r.buffer.length || function(t, n) {
                            n.bufferProcessing = !0;
                            for (var r = 0; r < n.buffer.length; r++) {
                                var i = n.buffer[r],
                                    a = i.chunk,
                                    s = i.encoding,
                                    u = i.callback;
                                if (o(t, n, n.objectMode ? 1 : a.length, a, s, u), n.writing) {
                                    r++;
                                    break
                                }
                            }
                            n.bufferProcessing = !1, r < n.buffer.length ? n.buffer = n.buffer.slice(r) : n.buffer.length = 0
                        }(t, r), i ? p.default.nextTick(function() {
                            s(t, r, c, a)
                        }) : s(t, r, c, a)
                    }
                }(n, t)
            }, this.writecb = null, this.writelen = 0, this.buffer = [], this.errorEmitted = !1
        }

        function a(t) {
            var r = sy();
            if (!(this instanceof a || this instanceof r)) return new a(t);
            this._writableState = new i(t, this), this.writable = !0, n.call(this)
        }

        function o(t, n, r, i, a, o) {
            n.writelen = r, n.writecb = o, n.writing = !0, n.sync = !0, t._write(i, a, n.onwrite), n.sync = !1
        }

        function s(t, n, r, i) {
            r || 0 === n.length && n.needDrain && (n.needDrain = !1, t.emit("drain")), i(), r && c(t, n)
        }

        function u(t, n) {
            return n.ending && 0 === n.length && !n.finished && !n.writing
        }

        function c(t, n) {
            var r = u(0, n);
            return r && (n.finished = !0, t.emit("finish")), r
        }
        return oY.inherits(a, n), a.prototype.pipe = function() {
            this.emit("error", Error("Cannot pipe. Not readable."))
        }, a.prototype.write = function(n, i, a) {
            var s, u, c, l, d, f, h, v, m, y = this._writableState,
                g = !1;
            return "function" == typeof i && (a = i, i = null), t.isBuffer(n) ? i = "buffer" : i || (i = y.defaultEncoding), "function" != typeof a && (a = function() {}), y.ended ? (s = a, u = Error("write after end"), this.emit("error", u), p.default.nextTick(function() {
                s(u)
            })) : function(n, r, i, a) {
                var o = !0;
                if (!t.isBuffer(i) && "string" != typeof i && null != i && !r.objectMode) {
                    var s = TypeError("Invalid non-string/buffer chunk");
                    n.emit("error", s), p.default.nextTick(function() {
                        a(s)
                    }), o = !1
                }
                return o
            }(this, y, n, a) && (c = n, l = i, d = a, f = c, h = l, y.objectMode || !1 === y.decodeStrings || "string" != typeof f || (f = new t(f, h)), c = f, t.isBuffer(c) && (l = "buffer"), v = y.objectMode ? 1 : c.length, y.length += v, (m = y.length < y.highWaterMark) || (y.needDrain = !0), y.writing ? y.buffer.push(new r(c, l, d)) : o(this, y, v, c, l, d), g = m), g
        }, a.prototype._write = function(t, n, r) {
            r(Error("not implemented"))
        }, a.prototype.end = function(t, n, r) {
            var i, a = this._writableState;
            "function" == typeof t ? (r = t, t = null, n = null) : "function" == typeof n && (r = n, n = null), null != t && this.write(t, n), a.ending || a.finished || (i = r, a.ending = !0, c(this, a), i && (a.finished ? p.default.nextTick(i) : this.once("finish", i)), a.ended = !0)
        }, sL
    }
    oY.inherits = o4, oY.inherits(so, si), so.prototype.push = function(t, n) {
        var r = this._readableState;
        return "string" != typeof t || r.objectMode || (n = n || r.defaultEncoding) !== r.encoding && (t = new st(t, n), n = ""), ss(this, r, t, n, !1)
    }, so.prototype.unshift = function(t) {
        return ss(this, this._readableState, t, "", !0)
    }, so.prototype.setEncoding = function(t) {
        sr || (sr = se().StringDecoder), this._readableState.decoder = new sr(t), this._readableState.encoding = t
    }, so.prototype.read = function(t) {
        var n = this._readableState;
        n.calledRead = !0;
        var r, i = t;
        if (("number" != typeof t || t > 0) && (n.emittedReadable = !1), 0 === t && n.needReadable && (n.length >= n.highWaterMark || n.ended)) return sc(this), null;
        if (0 === (t = su(t, n)) && n.ended) return r = null, n.length > 0 && n.decoder && (r = sp(t, n), n.length -= r.length), 0 === n.length && sv(this), r;
        var a = n.needReadable;
        return n.length - t <= n.highWaterMark && (a = !0), (n.ended || n.reading) && (a = !1), a && (n.reading = !0, n.sync = !0, 0 === n.length && (n.needReadable = !0), this._read(n.highWaterMark), n.sync = !1), a && !n.reading && (t = su(i, n)), null === (r = t > 0 ? sp(t, n) : null) && (n.needReadable = !0, t = 0), n.length -= t, 0 !== n.length || n.ended || (n.needReadable = !0), n.ended && !n.endEmitted && 0 === n.length && sv(this), r
    }, so.prototype._read = function(t) {
        this.emit("error", Error("not implemented"))
    }, so.prototype.pipe = function(t, n) {
        var r = this,
            i = this._readableState;
        switch (i.pipesCount) {
            case 0:
                i.pipes = t;
                break;
            case 1:
                i.pipes = [i.pipes, t];
                break;
            default:
                i.pipes.push(t)
        }
        i.pipesCount += 1;
        var a = n && !1 === n.end || t === p.default.stdout || t === p.default.stderr ? c : s;

        function o(t) {
            t === r && c()
        }

        function s() {
            t.end()
        }
        i.endEmitted ? p.default.nextTick(a) : r.once("end", a), t.on("unpipe", o);
        var u = function() {
            var t = r._readableState;
            t.awaitDrain--, 0 === t.awaitDrain && sd(r)
        };

        function c() {
            t.removeListener("close", d), t.removeListener("finish", f), t.removeListener("drain", u), t.removeListener("error", l), t.removeListener("unpipe", o), r.removeListener("end", s), r.removeListener("end", c), t._writableState && !t._writableState.needDrain || u()
        }

        function l(n) {
            h(), t.removeListener("error", l), 0 === sn.listenerCount(t, "error") && t.emit("error", n)
        }

        function d() {
            t.removeListener("finish", f), h()
        }

        function f() {
            t.removeListener("close", d), h()
        }

        function h() {
            r.unpipe(t)
        }
        return t.on("drain", u), t._events && t._events.error ? oZ(t._events.error) ? t._events.error.unshift(l) : t._events.error = [l, t._events.error] : t.on("error", l), t.once("close", d), t.once("finish", f), t.emit("pipe", r), i.flowing || (this.on("readable", sf), i.flowing = !0, p.default.nextTick(function() {
            sd(r)
        })), t
    }, so.prototype.unpipe = function(t) {
        var n = this._readableState;
        if (0 === n.pipesCount) return this;
        if (1 === n.pipesCount) return t && t !== n.pipes || (t || (t = n.pipes), n.pipes = null, n.pipesCount = 0, this.removeListener("readable", sf), n.flowing = !1, t && t.emit("unpipe", this)), this;
        if (!t) {
            var r = n.pipes,
                i = n.pipesCount;
            n.pipes = null, n.pipesCount = 0, this.removeListener("readable", sf), n.flowing = !1;
            for (var a = 0; a < i; a++) r[a].emit("unpipe", this);
            return this
        }
        return -1 === (a = function(t, n) {
            for (var r = 0, i = t.length; r < i; r++)
                if (t[r] === n) return r;
            return -1
        }(n.pipes, t)) || (n.pipes.splice(a, 1), n.pipesCount -= 1, 1 === n.pipesCount && (n.pipes = n.pipes[0]), t.emit("unpipe", this)), this
    }, so.prototype.on = function(t, n) {
        var r = si.prototype.on.call(this, t, n);
        if ("data" !== t || this._readableState.flowing || sh(this), "readable" === t && this.readable) {
            var i = this._readableState;
            i.readableListening || (i.readableListening = !0, i.emittedReadable = !1, i.needReadable = !0, i.reading ? i.length && sc(this) : this.read(0))
        }
        return r
    }, so.prototype.addListener = so.prototype.on, so.prototype.resume = function() {
        sh(this), this.read(0), this.emit("resume")
    }, so.prototype.pause = function() {
        sh(this, !0), this.emit("pause")
    }, so.prototype.wrap = function(t) {
        var n = this._readableState,
            r = !1,
            i = this;
        for (var a in t.on("end", function() {
                if (n.decoder && !n.ended) {
                    var t = n.decoder.end();
                    t && t.length && i.push(t)
                }
                i.push(null)
            }), t.on("data", function(a) {
                n.decoder && (a = n.decoder.write(a)), n.objectMode && null == a || (n.objectMode || a && a.length) && (i.push(a) || (r = !0, t.pause()))
            }), t) "function" == typeof t[a] && void 0 === this[a] && (this[a] = function(n) {
            return function() {
                return t[n].apply(t, arguments)
            }
        }(a));
        return sm(["error", "close", "destroy", "pause", "resume"], function(n) {
            t.on(n, i.emit.bind(i, n))
        }), i._read = function(n) {
            r && (r = !1, t.resume())
        }, i
    }, so._fromList = sp;
    var sb = sy();

    function sw(t, n) {
        this.afterTransform = function(t, r) {
            var i = n._transformState;
            i.transforming = !1;
            var a = i.writecb;
            if (!a) return n.emit("error", Error("no writecb in Transform class"));
            i.writechunk = null, i.writecb = null, null != r && n.push(r), a && a(t);
            var o = n._readableState;
            o.reading = !1, (o.needReadable || o.length < o.highWaterMark) && n._read(o.highWaterMark)
        }, this.needTransform = !1, this.transforming = !1, this.writecb = null, this.writechunk = null
    }

    function sx(t) {
        if (!(this instanceof sx)) return new sx(t);
        sb.call(this, t), this._transformState = new sw(t, this);
        var n = this;
        this._readableState.needReadable = !0, this._readableState.sync = !1, this.once("finish", function() {
            "function" == typeof this._flush ? this._flush(function(t) {
                sP(n, t)
            }) : sP(n)
        })
    }

    function sP(t, n) {
        if (n) return t.emit("error", n);
        var r = t._writableState;
        t._readableState;
        var i = t._transformState;
        if (r.length) throw Error("calling transform done when ws.length != 0");
        if (i.transforming) throw Error("calling transform done when still transforming");
        return t.push(null)
    }

    function sR(t) {
        if (!(this instanceof sR)) return new sR(t);
        sx.call(this, t)
    }
    oY.inherits = o4, oY.inherits(sx, sb), sx.prototype.push = function(t, n) {
        return this._transformState.needTransform = !1, sb.prototype.push.call(this, t, n)
    }, sx.prototype._transform = function(t, n, r) {
        throw Error("not implemented")
    }, sx.prototype._write = function(t, n, r) {
        var i = this._transformState;
        if (i.writecb = r, i.writechunk = t, i.writeencoding = n, !i.transforming) {
            var a = this._readableState;
            (i.needTransform || a.needReadable || a.length < a.highWaterMark) && this._read(a.highWaterMark)
        }
    }, sx.prototype._read = function(t) {
        var n = this._transformState;
        null !== n.writechunk && n.writecb && !n.transforming ? (n.transforming = !0, this._transform(n.writechunk, n.writeencoding, n.afterTransform)) : n.needTransform = !0
    }, oY.inherits = o4, oY.inherits(sR, sx), sR.prototype._transform = function(t, n, r) {
        r(null, t)
    }, sN = o$, sD = oM.default, (sN = ({
        get exports() {
            return o$
        },
        set exports(e) {
            o$ = e
        }
    }).exports = so).Stream = sD, sN.Readable = sN, sN.Writable = sg(), sN.Duplex = sy(), sN.Transform = sx, sN.PassThrough = sR;
    var sS = function(t, n, r) {
            if ("number" == typeof t) throw TypeError('"value" argument must not be a number');
            return "ArrayBuffer" === oQ.call(t).slice(8, -1) ? function(t, n, r) {
                n >>>= 0;
                var i = t.byteLength - n;
                if (i < 0) throw RangeError("'offset' is out of bounds");
                if (void 0 === r) r = i;
                else if ((r >>>= 0) > i) throw RangeError("'length' is out of bounds");
                return oX ? oD.Buffer.from(t.slice(n, n + r)) : new oD.Buffer(new Uint8Array(t.slice(n, n + r)))
            }(t, n, r) : "string" == typeof t ? function(t, n) {
                if ("string" == typeof n && "" !== n || (n = "utf8"), !oD.Buffer.isEncoding(n)) throw TypeError('"encoding" must be a valid string encoding');
                return oX ? oD.Buffer.from(t, n) : new oD.Buffer(t, n)
            }(t, n) : oX ? oD.Buffer.from(t) : new oD.Buffer(t)
        },
        sT = o$.Transform;
    o4(sq, sT);
    var sE = {
        endScript: sS("</script"),
        endStyle: sS("</style"),
        endTitle: sS("</title"),
        comment: sS("<!--"),
        endComment: sS("-->"),
        cdata: sS("<![CDATA["),
        endCdata: sS("]]>")
    };

    function sq() {
        if (!(this instanceof sq)) return new sq;
        sT.call(this), this._readableState.objectMode = !0, this.state = "text", this.tagState = null, this.quoteState = null, this.raw = null, this.buffers = [], this._last = []
    }

    function sk(t, n) {
        if (t.length < n.length) return !1;
        for (var r = t.length - 1, i = n.length - 1; r >= 0 && i >= 0; r--, i--)
            if (sA(t[r]) !== sA(n[i])) return !1;
        return !0
    }

    function sA(t) {
        return t >= 65 && t <= 90 ? t + 32 : t
    }

    function sC(t) {
        return 32 === t || 9 === t || 10 === t || 12 === t || 13 === t
    }
    sq.prototype._transform = function(t, n, r) {
        var i = 0,
            a = 0;
        for (this._prev && (t = oD.Buffer.concat([this._prev, t]), i = this._prev.length - 1, a = this._offset, this._prev = null, this._offset = 0); i < t.length; i++) {
            var o = t[i];
            if (this._last.push(o), this._last.length > 9 && this._last.shift(), this.raw) {
                var s = this._testRaw(t, a, i);
                s && (this.push(["text", s[0]]), this.raw === sE.endComment || this.raw === sE.endCdata ? (this.state = "text", this.buffers = [], this.push(["close", s[1]])) : (this.state = "open", this.buffers = [s[1]]), this.raw = null, a = i + 1)
            } else {
                if ("text" === this.state && 60 === o && i === t.length - 1) return this._prev = t, this._offset = a, r();
                if ("text" !== this.state || 60 !== o || sC(t[i + 1]))
                    if (1 === this.tagState && sC(o)) this.tagState = 2;
                    else if (2 === this.tagState && 61 === o) this.tagState = 3;
                else if (3 === this.tagState && sC(o));
                else if (3 === this.tagState && 62 !== o) this.tagState = 4, this.quoteState = 34 === o ? "double" : 39 === o ? "single" : null;
                else if (4 === this.tagState && !this.quoteState && sC(o)) this.tagState = 2;
                else if (4 === this.tagState && "double" === this.quoteState && 34 === o) this.quoteState = null, this.tagState = 2;
                else if (4 === this.tagState && "single" === this.quoteState && 39 === o) this.quoteState = null, this.tagState = 2;
                else if ("open" !== this.state || 62 !== o || this.quoteState) "open" === this.state && sk(this._last, sE.comment) ? (this.buffers.push(t.slice(a, i + 1)), a = i + 1, this.state = "text", this.raw = sE.endComment, this._pushState("open")) : "open" === this.state && sk(this._last, sE.cdata) && (this.buffers.push(t.slice(a, i + 1)), a = i + 1, this.state = "text", this.raw = sE.endCdata, this._pushState("open"));
                else if (this.buffers.push(t.slice(a, i + 1)), a = i + 1, this.state = "text", this.tagState = null, 47 === this._getChar(1)) this._pushState("close");
                else {
                    var u = this._getTag();
                    "script" === u && (this.raw = sE.endScript), "style" === u && (this.raw = sE.endStyle), "title" === u && (this.raw = sE.endTitle), this._pushState("open")
                } else i > 0 && i - a > 0 && this.buffers.push(t.slice(a, i)), a = i, this.state = "open", this.tagState = 1, this._pushState("text")
            }
        }
        a < t.length && this.buffers.push(t.slice(a)), r()
    }, sq.prototype._flush = function(t) {
        "text" === this.state && this._pushState("text"), this.push(null), t()
    }, sq.prototype._pushState = function(t) {
        if (0 !== this.buffers.length) {
            var n = oD.Buffer.concat(this.buffers);
            this.buffers = [], this.push([t, n])
        }
    }, sq.prototype._getChar = function(t) {
        for (var n = 0, r = 0; r < this.buffers.length; r++) {
            var i = this.buffers[r];
            if (n + i.length > t) return i[t - n];
            n += i
        }
    }, sq.prototype._getTag = function() {
        for (var t = 0, n = "", r = 0; r < this.buffers.length; r++) {
            for (var i = this.buffers[r], a = 0; a < i.length; a++)
                if (0 !== t || 0 !== a) {
                    var o = String.fromCharCode(i[a]);
                    if (/[^\w-!\[\]]/.test(o)) return n.toLowerCase();
                    n += o
                } t += i.length
        }
    }, sq.prototype._testRaw = function(t, n, r) {
        var i = this.raw;
        if (sk(this._last, i)) {
            this.buffers.push(t.slice(n, r + 1));
            var a = (t = oD.Buffer.concat(this.buffers)).length - i.length;
            return [t.slice(0, a), t.slice(a)]
        }
    };
    var sI, sj, sL, sO, sN, sD, s_, sM, sU, sB = {},
        sV = {},
        sF = {},
        sG = {
            get exports() {
                return sF
            },
            set exports(e) {
                sF = e
            }
        };

    function sW() {
        return s_ || (s_ = 1, void 0 !== p.default && p.default.version && 0 !== p.default.version.indexOf("v0.") && (0 !== p.default.version.indexOf("v1.") || 0 === p.default.version.indexOf("v1.8.")) ? sG.exports = p.default : sG.exports = {
            nextTick: function(t, n, r, i) {
                if ("function" != typeof t) throw TypeError('"callback" argument must be a function');
                var a, o, s = arguments.length;
                switch (s) {
                    case 0:
                    case 1:
                        return p.default.nextTick(t);
                    case 2:
                        return p.default.nextTick(function() {
                            t.call(null, n)
                        });
                    case 3:
                        return p.default.nextTick(function() {
                            t.call(null, n, r)
                        });
                    case 4:
                        return p.default.nextTick(function() {
                            t.call(null, n, r, i)
                        });
                    default:
                        for (a = Array(s - 1), o = 0; o < a.length;) a[o++] = arguments[o];
                        return p.default.nextTick(function() {
                            t.apply(null, a)
                        })
                }
            }
        }), sF
    }
    var sH, sK = {},
        sJ = {
            get exports() {
                return sK
            },
            set exports(e) {
                sK = e
            }
        };

    function sz() {
        return sH || (sH = 1, sJ.exports = oM.default), sK
    }
    var sQ, sX = {},
        s$ = {
            get exports() {
                return sX
            },
            set exports(e) {
                sX = e
            }
        };

    function sZ() {
        return sQ || (sQ = 1, function(t, n) {
            var r = oU.default,
                i = r.Buffer;

            function a(t, n) {
                for (var r in t) n[r] = t[r]
            }

            function o(t, n, r) {
                return i(t, n, r)
            }
            i.from && i.alloc && i.allocUnsafe && i.allocUnsafeSlow ? t.exports = r : (a(r, n), n.Buffer = o), a(i, o), o.from = function(t, n, r) {
                if ("number" == typeof t) throw TypeError("Argument must not be a number");
                return i(t, n, r)
            }, o.alloc = function(t, n, r) {
                if ("number" != typeof t) throw TypeError("Argument must be a number");
                var a = i(t);
                return void 0 !== n ? "string" == typeof r ? a.fill(n, r) : a.fill(n) : a.fill(0), a
            }, o.allocUnsafe = function(t) {
                if ("number" != typeof t) throw TypeError("Argument must be a number");
                return i(t)
            }, o.allocUnsafeSlow = function(t) {
                if ("number" != typeof t) throw TypeError("Argument must be a number");
                return r.SlowBuffer(t)
            }
        }(s$, sX)), sX
    }
    var sY, s0, s1, s2, s4, s3, s6, s8, s5, s7 = {},
        s9 = {
            get exports() {
                return s7
            },
            set exports(e) {
                s7 = e
            }
        };

    function ue() {
        if (s1) return s0;
        s1 = 1;
        var t = sW();

        function n(t, n) {
            t.emit("error", n)
        }
        return s0 = {
            destroy: function(r, i) {
                var a = this,
                    o = this._readableState && this._readableState.destroyed,
                    s = this._writableState && this._writableState.destroyed;
                return o || s ? i ? i(r) : !r || this._writableState && this._writableState.errorEmitted || t.nextTick(n, this, r) : (this._readableState && (this._readableState.destroyed = !0), this._writableState && (this._writableState.destroyed = !0), this._destroy(r || null, function(r) {
                    !i && r ? (t.nextTick(n, a, r), a._writableState && (a._writableState.errorEmitted = !0)) : i && i(r)
                })), this
            },
            undestroy: function() {
                this._readableState && (this._readableState.destroyed = !1, this._readableState.reading = !1, this._readableState.ended = !1, this._readableState.endEmitted = !1), this._writableState && (this._writableState.destroyed = !1, this._writableState.ended = !1, this._writableState.ending = !1, this._writableState.finished = !1, this._writableState.errorEmitted = !1)
            }
        }
    }

    function ut() {
        if (s6) return s3;
        s6 = 1;
        var t = sW();

        function n(t) {
            var n = this;
            this.next = null, this.entry = null, this.finish = function() {
                var r = n.entry;
                for (n.entry = null; r;) {
                    var i = r.callback;
                    t.pendingcb--, i(void 0), r = r.next
                }
                t.corkedRequestsFree ? t.corkedRequestsFree.next = n : t.corkedRequestsFree = n
            }
        }
        s3 = p;
        var r, i = t.nextTick;
        p.WritableState = h;
        var a = Object.create(oY);
        a.inherits = o4;
        var o, s = {
                deprecate: s4 ? s2 : (s4 = 1, s2 = oF.default.deprecate)
            },
            u = sz(),
            c = sZ().Buffer,
            l = oV.c.Uint8Array || function() {},
            d = ue();

        function f() {}

        function h(a, o) {
            r = r || un(), a = a || {};
            var s = o instanceof r;
            this.objectMode = !!a.objectMode, s && (this.objectMode = this.objectMode || !!a.writableObjectMode);
            var u = a.highWaterMark,
                c = a.writableHighWaterMark,
                l = this.objectMode ? 16 : 16384;
            this.highWaterMark = u || 0 === u ? u : s && (c || 0 === c) ? c : l, this.highWaterMark = Math.floor(this.highWaterMark), this.finalCalled = !1, this.needDrain = !1, this.ending = !1, this.ended = !1, this.finished = !1, this.destroyed = !1;
            var d = !1 === a.decodeStrings;
            this.decodeStrings = !d, this.defaultEncoding = a.defaultEncoding || "utf8", this.length = 0, this.writing = !1, this.corked = 0, this.sync = !0, this.bufferProcessing = !1, this.onwrite = function(n) {
                ! function(n, r) {
                    var a = n._writableState,
                        o = a.sync,
                        s = a.writecb;
                    if (a.writing = !1, a.writecb = null, a.length -= a.writelen, a.writelen = 0, r) --a.pendingcb, o ? (t.nextTick(s, r), t.nextTick(w, n, a), n._writableState.errorEmitted = !0, n.emit("error", r)) : (s(r), n._writableState.errorEmitted = !0, n.emit("error", r), w(n, a));
                    else {
                        var u = g(a);
                        u || a.corked || a.bufferProcessing || !a.bufferedRequest || y(n, a), o ? i(m, n, a, u, s) : m(n, a, u, s)
                    }
                }(o, n)
            }, this.writecb = null, this.writelen = 0, this.bufferedRequest = null, this.lastBufferedRequest = null, this.pendingcb = 0, this.prefinished = !1, this.errorEmitted = !1, this.bufferedRequestCount = 0, this.corkedRequestsFree = new n(this)
        }

        function p(t) {
            if (r = r || un(), !(o.call(p, this) || this instanceof r)) return new p(t);
            this._writableState = new h(t, this), this.writable = !0, t && ("function" == typeof t.write && (this._write = t.write), "function" == typeof t.writev && (this._writev = t.writev), "function" == typeof t.destroy && (this._destroy = t.destroy), "function" == typeof t.final && (this._final = t.final)), u.call(this)
        }

        function v(t, n, r, i, a, o, s) {
            n.writelen = i, n.writecb = s, n.writing = !0, n.sync = !0, r ? t._writev(a, n.onwrite) : t._write(a, o, n.onwrite), n.sync = !1
        }

        function m(t, n, r, i) {
            r || 0 === n.length && n.needDrain && (n.needDrain = !1, t.emit("drain")), n.pendingcb--, i(), w(t, n)
        }

        function y(t, r) {
            r.bufferProcessing = !0;
            var i = r.bufferedRequest;
            if (t._writev && i && i.next) {
                var a = Array(r.bufferedRequestCount),
                    o = r.corkedRequestsFree;
                o.entry = i;
                for (var s = 0, u = !0; i;) a[s] = i, i.isBuf || (u = !1), i = i.next, s += 1;
                a.allBuffers = u, v(t, r, !0, r.length, a, "", o.finish), r.pendingcb++, r.lastBufferedRequest = null, o.next ? (r.corkedRequestsFree = o.next, o.next = null) : r.corkedRequestsFree = new n(r), r.bufferedRequestCount = 0
            } else {
                for (; i;) {
                    var c = i.chunk,
                        l = i.encoding,
                        d = i.callback;
                    if (v(t, r, !1, r.objectMode ? 1 : c.length, c, l, d), i = i.next, r.bufferedRequestCount--, r.writing) break
                }
                null === i && (r.lastBufferedRequest = null)
            }
            r.bufferedRequest = i, r.bufferProcessing = !1
        }

        function g(t) {
            return t.ending && 0 === t.length && null === t.bufferedRequest && !t.finished && !t.writing
        }

        function b(t, n) {
            t._final(function(r) {
                n.pendingcb--, r && t.emit("error", r), n.prefinished = !0, t.emit("prefinish"), w(t, n)
            })
        }

        function w(n, r) {
            var i = g(r);
            return i && (r.prefinished || r.finalCalled || ("function" == typeof n._final ? (r.pendingcb++, r.finalCalled = !0, t.nextTick(b, n, r)) : (r.prefinished = !0, n.emit("prefinish"))), 0 === r.pendingcb && (r.finished = !0, n.emit("finish"))), i
        }
        return a.inherits(p, u), h.prototype.getBuffer = function() {
                for (var t = this.bufferedRequest, n = []; t;) n.push(t), t = t.next;
                return n
            },
            function() {
                try {
                    Object.defineProperty(h.prototype, "buffer", {
                        get: s.deprecate(function() {
                            return this.getBuffer()
                        }, "_writableState.buffer is deprecated. Use _writableState.getBuffer instead.", "DEP0003")
                    })
                } catch (t) {}
            }(), "function" == typeof Symbol && Symbol.hasInstance && "function" == typeof Function.prototype[Symbol.hasInstance] ? (o = Function.prototype[Symbol.hasInstance], Object.defineProperty(p, Symbol.hasInstance, {
                value: function(t) {
                    return !!o.call(this, t) || this === p && t && t._writableState instanceof h
                }
            })) : o = function(t) {
                return t instanceof this
            }, p.prototype.pipe = function() {
                this.emit("error", Error("Cannot pipe, not readable"))
            }, p.prototype.write = function(n, r, i) {
                var a, o, s, u, d, h, p, m, y = this._writableState,
                    g = !1,
                    b = !y.objectMode && (m = n, c.isBuffer(m) || m instanceof l);
                return b && !c.isBuffer(n) && (a = n, n = c.from(a)), "function" == typeof r && (i = r, r = null), b ? r = "buffer" : r || (r = y.defaultEncoding), "function" != typeof i && (i = f), y.ended ? (o = i, s = Error("write after end"), this.emit("error", s), t.nextTick(o, s)) : (b || (u = n, d = i, h = !0, p = !1, null === u ? p = TypeError("May not write null values to stream") : "string" == typeof u || void 0 === u || y.objectMode || (p = TypeError("Invalid non-string/buffer chunk")), p && (this.emit("error", p), t.nextTick(d, p), h = !1), h)) && (y.pendingcb++, g = function(t, n, r, i, a, o) {
                    if (!r) {
                        var s, u, l = (s = i, u = a, n.objectMode || !1 === n.decodeStrings || "string" != typeof s || (s = c.from(s, u)), s);
                        i !== l && (r = !0, a = "buffer", i = l)
                    }
                    var d = n.objectMode ? 1 : i.length;
                    n.length += d;
                    var f = n.length < n.highWaterMark;
                    if (f || (n.needDrain = !0), n.writing || n.corked) {
                        var h = n.lastBufferedRequest;
                        n.lastBufferedRequest = {
                            chunk: i,
                            encoding: a,
                            isBuf: r,
                            callback: o,
                            next: null
                        }, h ? h.next = n.lastBufferedRequest : n.bufferedRequest = n.lastBufferedRequest, n.bufferedRequestCount += 1
                    } else v(t, n, !1, d, i, a, o);
                    return f
                }(this, y, b, n, r, i)), g
            }, p.prototype.cork = function() {
                this._writableState.corked++
            }, p.prototype.uncork = function() {
                var t = this._writableState;
                t.corked && (t.corked--, t.writing || t.corked || t.finished || t.bufferProcessing || !t.bufferedRequest || y(this, t))
            }, p.prototype.setDefaultEncoding = function(t) {
                if ("string" == typeof t && (t = t.toLowerCase()), !(["hex", "utf8", "utf-8", "ascii", "binary", "base64", "ucs2", "ucs-2", "utf16le", "utf-16le", "raw"].indexOf((t + "").toLowerCase()) > -1)) throw TypeError("Unknown encoding: " + t);
                return this._writableState.defaultEncoding = t, this
            }, Object.defineProperty(p.prototype, "writableHighWaterMark", {
                enumerable: !1,
                get: function() {
                    return this._writableState.highWaterMark
                }
            }), p.prototype._write = function(t, n, r) {
                r(Error("_write() is not implemented"))
            }, p.prototype._writev = null, p.prototype.end = function(n, r, i) {
                var a, o = this._writableState;
                "function" == typeof n ? (i = n, n = null, r = null) : "function" == typeof r && (i = r, r = null), null != n && this.write(n, r), o.corked && (o.corked = 1, this.uncork()), o.ending || o.finished || (a = i, o.ending = !0, w(this, o), a && (o.finished ? t.nextTick(a) : this.once("finish", a)), o.ended = !0, this.writable = !1)
            }, Object.defineProperty(p.prototype, "destroyed", {
                get: function() {
                    return void 0 !== this._writableState && this._writableState.destroyed
                },
                set: function(t) {
                    this._writableState && (this._writableState.destroyed = t)
                }
            }), p.prototype.destroy = d.destroy, p.prototype._undestroy = d.undestroy, p.prototype._destroy = function(t, n) {
                this.end(), n(t)
            }, s3
    }

    function un() {
        if (s5) return s8;
        s5 = 1;
        var t = sW(),
            n = Object.keys || function(t) {
                var n = [];
                for (var r in t) n.push(r);
                return n
            };
        s8 = c;
        var r = Object.create(oY);
        r.inherits = o4;
        var i = uf(),
            a = ut();
        r.inherits(c, i);
        for (var o = n(a.prototype), s = 0; s < o.length; s++) {
            var u = o[s];
            c.prototype[u] || (c.prototype[u] = a.prototype[u])
        }

        function c(t) {
            if (!(this instanceof c)) return new c(t);
            i.call(this, t), a.call(this, t), t && !1 === t.readable && (this.readable = !1), t && !1 === t.writable && (this.writable = !1), this.allowHalfOpen = !0, t && !1 === t.allowHalfOpen && (this.allowHalfOpen = !1), this.once("end", l)
        }

        function l() {
            this.allowHalfOpen || this._writableState.ended || t.nextTick(d, this)
        }

        function d(t) {
            t.end()
        }
        return Object.defineProperty(c.prototype, "writableHighWaterMark", {
            enumerable: !1,
            get: function() {
                return this._writableState.highWaterMark
            }
        }), Object.defineProperty(c.prototype, "destroyed", {
            get: function() {
                return void 0 !== this._readableState && void 0 !== this._writableState && this._readableState.destroyed && this._writableState.destroyed
            },
            set: function(t) {
                void 0 !== this._readableState && void 0 !== this._writableState && (this._readableState.destroyed = t, this._writableState.destroyed = t)
            }
        }), c.prototype._destroy = function(n, r) {
            this.push(null), this.end(), t.nextTick(r, n)
        }, s8
    }
    var ur, ui, ua, uo, us, uu, uc, ul = {};

    function ud() {
        if (ur) return ul;
        ur = 1;
        var t = sZ().Buffer,
            n = t.isEncoding || function(t) {
                switch ((t = "" + t) && t.toLowerCase()) {
                    case "hex":
                    case "utf8":
                    case "utf-8":
                    case "ascii":
                    case "binary":
                    case "base64":
                    case "ucs2":
                    case "ucs-2":
                    case "utf16le":
                    case "utf-16le":
                    case "raw":
                        return !0;
                    default:
                        return !1
                }
            };

        function r(r) {
            var i;
            switch (this.encoding = function(r) {
                    var i = function(t) {
                        if (!t) return "utf8";
                        for (var n;;) switch (t) {
                            case "utf8":
                            case "utf-8":
                                return "utf8";
                            case "ucs2":
                            case "ucs-2":
                            case "utf16le":
                            case "utf-16le":
                                return "utf16le";
                            case "latin1":
                            case "binary":
                                return "latin1";
                            case "base64":
                            case "ascii":
                            case "hex":
                                return t;
                            default:
                                if (n) return;
                                t = ("" + t).toLowerCase(), n = !0
                        }
                    }(r);
                    if ("string" != typeof i && (t.isEncoding === n || !n(r))) throw Error("Unknown encoding: " + r);
                    return i || r
                }(r), this.encoding) {
                case "utf16le":
                    this.text = o, this.end = s, i = 4;
                    break;
                case "utf8":
                    this.fillLast = a, i = 4;
                    break;
                case "base64":
                    this.text = u, this.end = c, i = 3;
                    break;
                default:
                    return this.write = l, void(this.end = d)
            }
            this.lastNeed = 0, this.lastTotal = 0, this.lastChar = t.allocUnsafe(i)
        }

        function i(t) {
            return t <= 127 ? 0 : t >> 5 == 6 ? 2 : t >> 4 == 14 ? 3 : t >> 3 == 30 ? 4 : t >> 6 == 2 ? -1 : -2
        }

        function a(t) {
            var n = this.lastTotal - this.lastNeed,
                r = function(t, n) {
                    if (128 != (192 & n[0])) return t.lastNeed = 0, "�";
                    if (t.lastNeed > 1 && n.length > 1) {
                        if (128 != (192 & n[1])) return t.lastNeed = 1, "�";
                        if (t.lastNeed > 2 && n.length > 2 && 128 != (192 & n[2])) return t.lastNeed = 2, "�"
                    }
                }(this, t);
            return void 0 !== r ? r : this.lastNeed <= t.length ? (t.copy(this.lastChar, n, 0, this.lastNeed), this.lastChar.toString(this.encoding, 0, this.lastTotal)) : (t.copy(this.lastChar, n, 0, t.length), void(this.lastNeed -= t.length))
        }

        function o(t, n) {
            if ((t.length - n) % 2 == 0) {
                var r = t.toString("utf16le", n);
                if (r) {
                    var i = r.charCodeAt(r.length - 1);
                    if (i >= 55296 && i <= 56319) return this.lastNeed = 2, this.lastTotal = 4, this.lastChar[0] = t[t.length - 2], this.lastChar[1] = t[t.length - 1], r.slice(0, -1)
                }
                return r
            }
            return this.lastNeed = 1, this.lastTotal = 2, this.lastChar[0] = t[t.length - 1], t.toString("utf16le", n, t.length - 1)
        }

        function s(t) {
            var n = t && t.length ? this.write(t) : "";
            if (this.lastNeed) {
                var r = this.lastTotal - this.lastNeed;
                return n + this.lastChar.toString("utf16le", 0, r)
            }
            return n
        }

        function u(t, n) {
            var r = (t.length - n) % 3;
            return 0 === r ? t.toString("base64", n) : (this.lastNeed = 3 - r, this.lastTotal = 3, 1 === r ? this.lastChar[0] = t[t.length - 1] : (this.lastChar[0] = t[t.length - 2], this.lastChar[1] = t[t.length - 1]), t.toString("base64", n, t.length - r))
        }

        function c(t) {
            var n = t && t.length ? this.write(t) : "";
            return this.lastNeed ? n + this.lastChar.toString("base64", 0, 3 - this.lastNeed) : n
        }

        function l(t) {
            return t.toString(this.encoding)
        }

        function d(t) {
            return t && t.length ? this.write(t) : ""
        }
        return ul.StringDecoder = r, r.prototype.write = function(t) {
            var n, r;
            if (0 === t.length) return "";
            if (this.lastNeed) {
                if (void 0 === (n = this.fillLast(t))) return "";
                r = this.lastNeed, this.lastNeed = 0
            } else r = 0;
            return r < t.length ? n ? n + this.text(t, r) : this.text(t, r) : n || ""
        }, r.prototype.end = function(t) {
            var n = t && t.length ? this.write(t) : "";
            return this.lastNeed ? n + "�" : n
        }, r.prototype.text = function(t, n) {
            var r = function(t, n, r) {
                var a = n.length - 1;
                if (a < r) return 0;
                var o = i(n[a]);
                return o >= 0 ? (o > 0 && (t.lastNeed = o - 1), o) : --a < r || -2 === o ? 0 : (o = i(n[a])) >= 0 ? (o > 0 && (t.lastNeed = o - 2), o) : --a < r || -2 === o ? 0 : (o = i(n[a])) >= 0 ? (o > 0 && (2 === o ? o = 0 : t.lastNeed = o - 3), o) : 0
            }(this, t, n);
            if (!this.lastNeed) return t.toString("utf8", n);
            this.lastTotal = r;
            var a = t.length - (r - this.lastNeed);
            return t.copy(this.lastChar, 0, a), t.toString("utf8", n, a)
        }, r.prototype.fillLast = function(t) {
            if (this.lastNeed <= t.length) return t.copy(this.lastChar, this.lastTotal - this.lastNeed, 0, this.lastNeed), this.lastChar.toString(this.encoding, 0, this.lastTotal);
            t.copy(this.lastChar, this.lastTotal - this.lastNeed, 0, t.length), this.lastNeed -= t.length
        }, ul
    }

    function uf() {
        if (ua) return ui;
        ua = 1;
        var t = sW();
        ui = b;
        var n, r = function() {
            if (sU) return sM;
            sU = 1;
            var t = {}.toString;
            return sM = Array.isArray || function(n) {
                return "[object Array]" == t.call(n)
            }
        }();
        b.ReadableState = g, oB.default.EventEmitter;
        var i = function(t, n) {
                return t.listeners(n).length
            },
            a = sz(),
            o = sZ().Buffer,
            s = oV.c.Uint8Array || function() {},
            u = Object.create(oY);
        u.inherits = o4;
        var c = oF.default,
            l = void 0;
        l = c && c.debuglog ? c.debuglog("stream") : function() {};
        var d, f, h, v = (sY || (sY = 1, d = sZ().Buffer, f = oF.default, s9.exports = function() {
                function t() {
                    ! function(t, n) {
                        if (!(t instanceof n)) throw TypeError("Cannot call a class as a function")
                    }(this, t), this.head = null, this.tail = null, this.length = 0
                }
                return t.prototype.push = function(t) {
                    var n = {
                        data: t,
                        next: null
                    };
                    this.length > 0 ? this.tail.next = n : this.head = n, this.tail = n, ++this.length
                }, t.prototype.unshift = function(t) {
                    var n = {
                        data: t,
                        next: this.head
                    };
                    0 === this.length && (this.tail = n), this.head = n, ++this.length
                }, t.prototype.shift = function() {
                    if (0 !== this.length) {
                        var t = this.head.data;
                        return 1 === this.length ? this.head = this.tail = null : this.head = this.head.next, --this.length, t
                    }
                }, t.prototype.clear = function() {
                    this.head = this.tail = null, this.length = 0
                }, t.prototype.join = function(t) {
                    if (0 === this.length) return "";
                    for (var n = this.head, r = "" + n.data; n = n.next;) r += t + n.data;
                    return r
                }, t.prototype.concat = function(t) {
                    if (0 === this.length) return d.alloc(0);
                    if (1 === this.length) return this.head.data;
                    for (var n, r, i = d.allocUnsafe(t >>> 0), a = this.head, o = 0; a;) n = a.data, r = o, n.copy(i, r), o += a.data.length, a = a.next;
                    return i
                }, t
            }(), f && f.inspect && f.inspect.custom && (s9.exports.prototype[f.inspect.custom] = function() {
                var t = f.inspect({
                    length: this.length
                });
                return this.constructor.name + " " + t
            })), s7),
            m = ue();
        u.inherits(b, a);
        var y = ["error", "close", "destroy", "pause", "resume"];

        function g(t, r) {
            t = t || {};
            var i = r instanceof(n = n || un());
            this.objectMode = !!t.objectMode, i && (this.objectMode = this.objectMode || !!t.readableObjectMode);
            var a = t.highWaterMark,
                o = t.readableHighWaterMark,
                s = this.objectMode ? 16 : 16384;
            this.highWaterMark = a || 0 === a ? a : i && (o || 0 === o) ? o : s, this.highWaterMark = Math.floor(this.highWaterMark), this.buffer = new v, this.length = 0, this.pipes = null, this.pipesCount = 0, this.flowing = null, this.ended = !1, this.endEmitted = !1, this.reading = !1, this.sync = !0, this.needReadable = !1, this.emittedReadable = !1, this.readableListening = !1, this.resumeScheduled = !1, this.destroyed = !1, this.defaultEncoding = t.defaultEncoding || "utf8", this.awaitDrain = 0, this.readingMore = !1, this.decoder = null, this.encoding = null, t.encoding && (h || (h = ud().StringDecoder), this.decoder = new h(t.encoding), this.encoding = t.encoding)
        }

        function b(t) {
            if (n = n || un(), !(this instanceof b)) return new b(t);
            this._readableState = new g(t, this), this.readable = !0, t && ("function" == typeof t.read && (this._read = t.read), "function" == typeof t.destroy && (this._destroy = t.destroy)), a.call(this)
        }

        function w(t, n, r, i, a) {
            var u, c, l, d, f, h = t._readableState;
            return null === n ? (h.reading = !1, function(t, n) {
                if (!n.ended) {
                    if (n.decoder) {
                        var r = n.decoder.end();
                        r && r.length && (n.buffer.push(r), n.length += n.objectMode ? 1 : r.length)
                    }
                    n.ended = !0, R(t)
                }
            }(t, h)) : (a || (u = h, c = n, o.isBuffer(c) || c instanceof s || "string" == typeof c || void 0 === c || u.objectMode || (l = TypeError("Invalid non-string/buffer chunk")), f = l), f ? t.emit("error", f) : h.objectMode || n && n.length > 0 ? ("string" == typeof n || h.objectMode || Object.getPrototypeOf(n) === o.prototype || (d = n, n = o.from(d)), i ? h.endEmitted ? t.emit("error", Error("stream.unshift() after end event")) : x(t, h, n, !0) : h.ended ? t.emit("error", Error("stream.push() after EOF")) : (h.reading = !1, h.decoder && !r ? (n = h.decoder.write(n), h.objectMode || 0 !== n.length ? x(t, h, n, !1) : T(t, h)) : x(t, h, n, !1))) : i || (h.reading = !1)), !h.ended && (h.needReadable || h.length < h.highWaterMark || 0 === h.length)
        }

        function x(t, n, r, i) {
            n.flowing && 0 === n.length && !n.sync ? (t.emit("data", r), t.read(0)) : (n.length += n.objectMode ? 1 : r.length, i ? n.buffer.unshift(r) : n.buffer.push(r), n.needReadable && R(t)), T(t, n)
        }

        function P(t, n) {
            var r;
            return t <= 0 || 0 === n.length && n.ended ? 0 : n.objectMode ? 1 : t != t ? n.flowing && n.length ? n.buffer.head.data.length : n.length : (t > n.highWaterMark && ((r = t) >= 8388608 ? r = 8388608 : (r--, r |= r >>> 1, r |= r >>> 2, r |= r >>> 4, r |= r >>> 8, r |= r >>> 16, r++), n.highWaterMark = r), t <= n.length ? t : n.ended ? n.length : (n.needReadable = !0, 0))
        }

        function R(n) {
            var r = n._readableState;
            r.needReadable = !1, r.emittedReadable || (l("emitReadable", r.flowing), r.emittedReadable = !0, r.sync ? t.nextTick(S, n) : S(n))
        }

        function S(t) {
            l("emit readable"), t.emit("readable"), A(t)
        }

        function T(n, r) {
            r.readingMore || (r.readingMore = !0, t.nextTick(E, n, r))
        }

        function E(t, n) {
            for (var r = n.length; !n.reading && !n.flowing && !n.ended && n.length < n.highWaterMark && (l("maybeReadMore read 0"), t.read(0), r !== n.length);) r = n.length;
            n.readingMore = !1
        }

        function q(t) {
            l("readable nexttick read 0"), t.read(0)
        }

        function k(t, n) {
            n.reading || (l("resume read 0"), t.read(0)), n.resumeScheduled = !1, n.awaitDrain = 0, t.emit("resume"), A(t), n.flowing && !n.reading && t.read(0)
        }

        function A(t) {
            var n = t._readableState;
            for (l("flow", n.flowing); n.flowing && null !== t.read(););
        }

        function C(t, n) {
            var r, i, a, s;
            return 0 === n.length ? null : (n.objectMode ? r = n.buffer.shift() : !t || t >= n.length ? (r = n.decoder ? n.buffer.join("") : 1 === n.buffer.length ? n.buffer.head.data : n.buffer.concat(n.length), n.buffer.clear()) : (i = n.buffer, a = n.decoder, t < i.head.data.length ? (s = i.head.data.slice(0, t), i.head.data = i.head.data.slice(t)) : s = t === i.head.data.length ? i.shift() : a ? function(t, n) {
                var r = n.head,
                    i = 1,
                    a = r.data;
                for (t -= a.length; r = r.next;) {
                    var o = r.data,
                        s = t > o.length ? o.length : t;
                    if (s === o.length ? a += o : a += o.slice(0, t), 0 == (t -= s)) {
                        s === o.length ? (++i, r.next ? n.head = r.next : n.head = n.tail = null) : (n.head = r, r.data = o.slice(s));
                        break
                    }++i
                }
                return n.length -= i, a
            }(t, i) : function(t, n) {
                var r = o.allocUnsafe(t),
                    i = n.head,
                    a = 1;
                for (i.data.copy(r), t -= i.data.length; i = i.next;) {
                    var s = i.data,
                        u = t > s.length ? s.length : t;
                    if (s.copy(r, r.length - t, 0, u), 0 == (t -= u)) {
                        u === s.length ? (++a, i.next ? n.head = i.next : n.head = n.tail = null) : (n.head = i, i.data = s.slice(u));
                        break
                    }++a
                }
                return n.length -= a, r
            }(t, i), r = s), r)
        }

        function I(n) {
            var r = n._readableState;
            if (r.length > 0) throw Error('"endReadable()" called on non-empty stream');
            r.endEmitted || (r.ended = !0, t.nextTick(j, r, n))
        }

        function j(t, n) {
            t.endEmitted || 0 !== t.length || (t.endEmitted = !0, n.readable = !1, n.emit("end"))
        }

        function L(t, n) {
            for (var r = 0, i = t.length; r < i; r++)
                if (t[r] === n) return r;
            return -1
        }
        return Object.defineProperty(b.prototype, "destroyed", {
            get: function() {
                return void 0 !== this._readableState && this._readableState.destroyed
            },
            set: function(t) {
                this._readableState && (this._readableState.destroyed = t)
            }
        }), b.prototype.destroy = m.destroy, b.prototype._undestroy = m.undestroy, b.prototype._destroy = function(t, n) {
            this.push(null), n(t)
        }, b.prototype.push = function(t, n) {
            var r, i = this._readableState;
            return i.objectMode ? r = !0 : "string" == typeof t && ((n = n || i.defaultEncoding) !== i.encoding && (t = o.from(t, n), n = ""), r = !0), w(this, t, n, !1, r)
        }, b.prototype.unshift = function(t) {
            return w(this, t, null, !0, !1)
        }, b.prototype.isPaused = function() {
            return !1 === this._readableState.flowing
        }, b.prototype.setEncoding = function(t) {
            return h || (h = ud().StringDecoder), this._readableState.decoder = new h(t), this._readableState.encoding = t, this
        }, b.prototype.read = function(t) {
            l("read", t), t = parseInt(t, 10);
            var n = this._readableState,
                r = t;
            if (0 !== t && (n.emittedReadable = !1), 0 === t && n.needReadable && (n.length >= n.highWaterMark || n.ended)) return l("read: emitReadable", n.length, n.ended), 0 === n.length && n.ended ? I(this) : R(this), null;
            if (0 === (t = P(t, n)) && n.ended) return 0 === n.length && I(this), null;
            var i, a = n.needReadable;
            return l("need readable", a), (0 === n.length || n.length - t < n.highWaterMark) && l("length less than watermark", a = !0), n.ended || n.reading ? l("reading or ended", a = !1) : a && (l("do read"), n.reading = !0, n.sync = !0, 0 === n.length && (n.needReadable = !0), this._read(n.highWaterMark), n.sync = !1, n.reading || (t = P(r, n))), null === (i = t > 0 ? C(t, n) : null) ? (n.needReadable = !0, t = 0) : n.length -= t, 0 === n.length && (n.ended || (n.needReadable = !0), r !== t && n.ended && I(this)), null !== i && this.emit("data", i), i
        }, b.prototype._read = function(t) {
            this.emit("error", Error("_read() is not implemented"))
        }, b.prototype.pipe = function(n, a) {
            var o = this,
                s = this._readableState;
            switch (s.pipesCount) {
                case 0:
                    s.pipes = n;
                    break;
                case 1:
                    s.pipes = [s.pipes, n];
                    break;
                default:
                    s.pipes.push(n)
            }
            s.pipesCount += 1, l("pipe count=%d opts=%j", s.pipesCount, a);
            var u = a && !1 === a.end || n === p.default.stdout || n === p.default.stderr ? b : c;

            function c() {
                l("onend"), n.end()
            }
            s.endEmitted ? t.nextTick(u) : o.once("end", u), n.on("unpipe", function t(r, i) {
                l("onunpipe"), r === o && i && !1 === i.hasUnpiped && (i.hasUnpiped = !0, l("cleanup"), n.removeListener("close", y), n.removeListener("finish", g), n.removeListener("drain", d), n.removeListener("error", m), n.removeListener("unpipe", t), o.removeListener("end", c), o.removeListener("end", b), o.removeListener("data", v), f = !0, s.awaitDrain && (!n._writableState || n._writableState.needDrain) && d())
            });
            var d = function() {
                var t = o._readableState;
                l("pipeOnDrain", t.awaitDrain), t.awaitDrain && t.awaitDrain--, 0 === t.awaitDrain && i(o, "data") && (t.flowing = !0, A(o))
            };
            n.on("drain", d);
            var f = !1,
                h = !1;

            function v(t) {
                l("ondata"), h = !1, !1 !== n.write(t) || h || ((1 === s.pipesCount && s.pipes === n || s.pipesCount > 1 && -1 !== L(s.pipes, n)) && !f && (l("false write response, pause", o._readableState.awaitDrain), o._readableState.awaitDrain++, h = !0), o.pause())
            }

            function m(t) {
                l("onerror", t), b(), n.removeListener("error", m), 0 === i(n, "error") && n.emit("error", t)
            }

            function y() {
                n.removeListener("finish", g), b()
            }

            function g() {
                l("onfinish"), n.removeListener("close", y), b()
            }

            function b() {
                l("unpipe"), o.unpipe(n)
            }
            return o.on("data", v),
                function(t, n, i) {
                    if ("function" == typeof t.prependListener) return t.prependListener(n, i);
                    t._events && t._events[n] ? r(t._events[n]) ? t._events[n].unshift(i) : t._events[n] = [i, t._events[n]] : t.on(n, i)
                }(n, "error", m), n.once("close", y), n.once("finish", g), n.emit("pipe", o), s.flowing || (l("pipe resume"), o.resume()), n
        }, b.prototype.unpipe = function(t) {
            var n = this._readableState,
                r = {
                    hasUnpiped: !1
                };
            if (0 === n.pipesCount) return this;
            if (1 === n.pipesCount) return t && t !== n.pipes || (t || (t = n.pipes), n.pipes = null, n.pipesCount = 0, n.flowing = !1, t && t.emit("unpipe", this, r)), this;
            if (!t) {
                var i = n.pipes,
                    a = n.pipesCount;
                n.pipes = null, n.pipesCount = 0, n.flowing = !1;
                for (var o = 0; o < a; o++) i[o].emit("unpipe", this, r);
                return this
            }
            var s = L(n.pipes, t);
            return -1 === s || (n.pipes.splice(s, 1), n.pipesCount -= 1, 1 === n.pipesCount && (n.pipes = n.pipes[0]), t.emit("unpipe", this, r)), this
        }, b.prototype.on = function(n, r) {
            var i = a.prototype.on.call(this, n, r);
            if ("data" === n) !1 !== this._readableState.flowing && this.resume();
            else if ("readable" === n) {
                var o = this._readableState;
                o.endEmitted || o.readableListening || (o.readableListening = o.needReadable = !0, o.emittedReadable = !1, o.reading ? o.length && R(this) : t.nextTick(q, this))
            }
            return i
        }, b.prototype.addListener = b.prototype.on, b.prototype.resume = function() {
            var n = this._readableState;
            return n.flowing || (l("resume"), n.flowing = !0, n.resumeScheduled || (n.resumeScheduled = !0, t.nextTick(k, this, n))), this
        }, b.prototype.pause = function() {
            return l("call pause flowing=%j", this._readableState.flowing), !1 !== this._readableState.flowing && (l("pause"), this._readableState.flowing = !1, this.emit("pause")), this
        }, b.prototype.wrap = function(t) {
            var n = this,
                r = this._readableState,
                i = !1;
            for (var a in t.on("end", function() {
                    if (l("wrapped end"), r.decoder && !r.ended) {
                        var t = r.decoder.end();
                        t && t.length && n.push(t)
                    }
                    n.push(null)
                }), t.on("data", function(a) {
                    l("wrapped data"), r.decoder && (a = r.decoder.write(a)), r.objectMode && null == a || (r.objectMode || a && a.length) && (n.push(a) || (i = !0, t.pause()))
                }), t) void 0 === this[a] && "function" == typeof t[a] && (this[a] = function(n) {
                return function() {
                    return t[n].apply(t, arguments)
                }
            }(a));
            for (var o = 0; o < y.length; o++) t.on(y[o], this.emit.bind(this, y[o]));
            return this._read = function(n) {
                l("wrapped _read", n), i && (i = !1, t.resume())
            }, this
        }, Object.defineProperty(b.prototype, "readableHighWaterMark", {
            enumerable: !1,
            get: function() {
                return this._readableState.highWaterMark
            }
        }), b._fromList = C, ui
    }

    function uh() {
        if (us) return uo;
        us = 1, uo = i;
        var t = un(),
            n = Object.create(oY);

        function r(t, n) {
            var r = this._transformState;
            r.transforming = !1;
            var i = r.writecb;
            if (!i) return this.emit("error", Error("write callback called multiple times"));
            r.writechunk = null, r.writecb = null, null != n && this.push(n), i(t);
            var a = this._readableState;
            a.reading = !1, (a.needReadable || a.length < a.highWaterMark) && this._read(a.highWaterMark)
        }

        function i(n) {
            if (!(this instanceof i)) return new i(n);
            t.call(this, n), this._transformState = {
                afterTransform: r.bind(this),
                needTransform: !1,
                transforming: !1,
                writecb: null,
                writechunk: null,
                writeencoding: null
            }, this._readableState.needReadable = !0, this._readableState.sync = !1, n && ("function" == typeof n.transform && (this._transform = n.transform), "function" == typeof n.flush && (this._flush = n.flush)), this.on("prefinish", a)
        }

        function a() {
            var t = this;
            "function" == typeof this._flush ? this._flush(function(n, r) {
                o(t, n, r)
            }) : o(this, null, null)
        }

        function o(t, n, r) {
            if (n) return t.emit("error", n);
            if (null != r && t.push(r), t._writableState.length) throw Error("Calling transform done when ws.length != 0");
            if (t._transformState.transforming) throw Error("Calling transform done when still transforming");
            return t.push(null)
        }
        return n.inherits = o4, n.inherits(i, t), i.prototype.push = function(n, r) {
            return this._transformState.needTransform = !1, t.prototype.push.call(this, n, r)
        }, i.prototype._transform = function(t, n, r) {
            throw Error("_transform() is not implemented")
        }, i.prototype._write = function(t, n, r) {
            var i = this._transformState;
            if (i.writecb = r, i.writechunk = t, i.writeencoding = n, !i.transforming) {
                var a = this._readableState;
                (i.needTransform || a.needReadable || a.length < a.highWaterMark) && this._read(a.highWaterMark)
            }
        }, i.prototype._read = function(t) {
            var n = this._transformState;
            null !== n.writechunk && n.writecb && !n.transforming ? (n.transforming = !0, this._transform(n.writechunk, n.writeencoding, n.afterTransform)) : n.needTransform = !0
        }, i.prototype._destroy = function(n, r) {
            var i = this;
            t.prototype._destroy.call(this, n, function(t) {
                r(t), i.emit("close")
            })
        }, uo
    }
    um = {
        get exports() {
            return sV
        },
        set exports(e) {
            sV = e
        }
    }, uy = sV, ug = oM.default, "disable" === p.default.env.READABLE_STREAM && ug ? (um.exports = ug, (uy = um.exports = ug.Readable).Readable = ug.Readable, uy.Writable = ug.Writable, uy.Duplex = ug.Duplex, uy.Transform = ug.Transform, uy.PassThrough = ug.PassThrough, uy.Stream = ug) : ((uy = um.exports = uf()).Stream = ug || uy, uy.Readable = uy, uy.Writable = ut(), uy.Duplex = un(), uy.Transform = uh(), uy.PassThrough = function() {
        if (uc) return uu;
        uc = 1, uu = r;
        var t = uh(),
            n = Object.create(oY);

        function r(n) {
            if (!(this instanceof r)) return new r(n);
            t.call(this, n)
        }
        return n.inherits = o4, n.inherits(r, t), r.prototype._transform = function(t, n, r) {
            r(null, t)
        }, uu
    }());
    var up = sV;

    function uv(t, n, r) {
        void 0 === r && (r = n, n = t, t = null), up.Duplex.call(this, t), "function" != typeof r.read && (r = new up.Readable(t).wrap(r)), this._writable = n, this._readable = r, this._waiting = !1;
        var i = this;
        n.once("finish", function() {
            i.end()
        }), this.once("finish", function() {
            n.end()
        }), r.on("readable", function() {
            i._waiting && (i._waiting = !1, i._read())
        }), r.once("end", function() {
            i.push(null)
        }), t && void 0 !== t.bubbleErrors && !t.bubbleErrors || (n.on("error", function(t) {
            i.emit("error", t)
        }), r.on("error", function(t) {
            i.emit("error", t)
        }))
    }
    uv.prototype = Object.create(up.Duplex.prototype, {
        constructor: {
            value: uv
        }
    }), uv.prototype._write = function(t, n, r) {
        this._writable.write(t, n, r)
    }, uv.prototype._read = function() {
        for (var t, n = 0; null !== (t = this._readable.read());) this.push(t), n++;
        0 === n && (this._waiting = !0)
    }, ({
        get exports() {
            return sB
        },
        set exports(e) {
            sB = e
        }
    }).exports = function(t, n, r) {
        return new uv(t, n, r)
    }, sB.DuplexWrapper = uv, oM.default.PassThrough, oM.default.PassThrough, oG.o, [].slice;
    var um, uy, ug, ub, uw, ux, uP, uR = "web-blox-css-mui",
        uS = "web-blox-css-tss",
        uT = "u" > typeof window && void 0 !== window.document,
        uE = function() {
            var t = document.querySelector('meta[name="'.concat("emotion-insertion-point-ssr", '"]')),
                n = !1;
            document.head.childNodes.forEach(function(r) {
                var i, a;
                r === t ? n = !0 : n && r.nodeType === Node.ELEMENT_NODE && ((null == (i = r.getAttribute("data-emotion")) ? void 0 : i.includes("".concat(uR, "-global"))) || (null == (a = r.getAttribute("data-emotion")) ? void 0 : a.includes("".concat(uS, "-global")))) && r.remove()
            })
        },
        uq = function(t) {
            var n = t.cache,
                r = t.children,
                i = n.muiCache,
                a = n.tssCache;
            return oc.default.createElement(oW.CacheProvider, {
                value: i
            }, oc.default.createElement(oH.T, {
                value: a
            }, r))
        },
        uk = t.i(766324),
        uA = t.i(592171),
        uC = -1,
        uI = function(t) {
            "hidden" === document.visibilityState && uC > -1 && (uC = "visibilitychange" === t.type ? t.timeStamp : 0, uj())
        },
        uj = function() {
            removeEventListener("visibilitychange", uI, !0), removeEventListener("prerenderingchange", uI, !0)
        },
        uL = {
            passive: !0,
            capture: !0
        },
        uO = new Date,
        uN = function(t, n) {
            ub || (ub = n, uw = t, ux = new Date, uM(removeEventListener), uD())
        },
        uD = function() {
            if (uw >= 0 && uw < ux - uO) {
                var t = {
                    entryType: "first-input",
                    name: ub.type,
                    target: ub.target,
                    cancelable: ub.cancelable,
                    startTime: ub.timeStamp,
                    processingStart: ub.timeStamp + uw
                };
                uP.forEach(function(n) {
                    n(t)
                }), uP = []
            }
        },
        u_ = function(t) {
            if (t.cancelable) {
                var n, r, i, a = (t.timeStamp > 1e12 ? new Date : performance.now()) - t.timeStamp;
                "pointerdown" == t.type ? (n = function() {
                    uN(a, t), i()
                }, r = function() {
                    i()
                }, i = function() {
                    removeEventListener("pointerup", n, uL), removeEventListener("pointercancel", r, uL)
                }, addEventListener("pointerup", n, uL), addEventListener("pointercancel", r, uL)) : uN(a, t)
            }
        },
        uM = function(t) {
            ["mousedown", "keydown", "touchstart", "pointerdown"].forEach(function(n) {
                return t(n, u_, uL)
            })
        };
    let uU = null;
    var uB = t.i(906791),
        uV = t.i(968439),
        uF = t.i(721281),
        uG = t.i(677753),
        uW = function(t, n) {
            return (uW = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(t, n) {
                t.__proto__ = n
            } || function(t, n) {
                for (var r in n) Object.prototype.hasOwnProperty.call(n, r) && (t[r] = n[r])
            })(t, n)
        };

    function uH(t, n) {
        if ("function" != typeof n && null !== n) throw TypeError("Class extends value " + String(n) + " is not a constructor or null");

        function r() {
            this.constructor = t
        }
        uW(t, n), t.prototype = null === n ? Object.create(n) : (r.prototype = n.prototype, new r)
    }

    function uK(t, n, r, i) {
        return new(r || (r = Promise))(function(a, o) {
            function s(t) {
                try {
                    c(i.next(t))
                } catch (t) {
                    o(t)
                }
            }

            function u(t) {
                try {
                    c(i.throw(t))
                } catch (t) {
                    o(t)
                }
            }

            function c(t) {
                var n;
                t.done ? a(t.value) : ((n = t.value) instanceof r ? n : new r(function(t) {
                    t(n)
                })).then(s, u)
            }
            c((i = i.apply(t, n || [])).next())
        })
    }

    function uJ(t, n) {
        var r, i, a, o = {
                label: 0,
                sent: function() {
                    if (1 & a[0]) throw a[1];
                    return a[1]
                },
                trys: [],
                ops: []
            },
            s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return s.next = u(0), s.throw = u(1), s.return = u(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
            return this
        }), s;

        function u(u) {
            return function(c) {
                var l = [u, c];
                if (r) throw TypeError("Generator is already executing.");
                for (; s && (s = 0, l[0] && (o = 0)), o;) try {
                    if (r = 1, i && (a = 2 & l[0] ? i.return : l[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, l[1])).done) return a;
                    switch (i = 0, a && (l = [2 & l[0], a.value]), l[0]) {
                        case 0:
                        case 1:
                            a = l;
                            break;
                        case 4:
                            return o.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            o.label++, i = l[1], l = [0];
                            continue;
                        case 7:
                            l = o.ops.pop(), o.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === l[0] && (!a || l[1] > a[0] && l[1] < a[3])) {
                                o.label = l[1];
                                break
                            }
                            if (6 === l[0] && o.label < a[1]) {
                                o.label = a[1], a = l;
                                break
                            }
                            if (a && o.label < a[2]) {
                                o.label = a[2], o.ops.push(l);
                                break
                            }
                            a[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    l = n.call(t, o)
                } catch (t) {
                    l = [6, t], i = 0
                } finally {
                    r = a = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function uz(t) {
        if (void 0 !== t) return null === t ? null : {
            LinkingPlatform: t.linkingPlatform
        }
    }

    function uQ(t) {
        if (void 0 !== t) return null === t ? null : {
            pin: t.pin,
            reauthenticationToken: t.reauthenticationToken
        }
    }

    function uX(t) {
        if (void 0 !== t) return null === t ? null : {
            usernamePrefix: t.usernamePrefix,
            gender: t.gender,
            birthday: void 0 === t.birthday ? void 0 : t.birthday.toISOString(),
            locale: t.locale,
            password: t.password,
            authenticationMethods: function(t) {
                if (void 0 !== t) return null === t ? null : {
                    generateAndSetPassword: t.generateAndSetPassword
                }
            }(t.authenticationMethods),
            identityAttributes: function(t) {
                if (void 0 !== t) return null === t ? null : {
                    originTypes: t.originTypes,
                    accountCountry: t.accountCountry,
                    accountCountrySubDivision: t.accountCountrySubDivision
                }
            }(t.identityAttributes),
            exemptions: function(t) {
                if (void 0 !== t) return null === t ? null : {
                    bypassLoginAutomationChallenges: t.bypassLoginAutomationChallenges,
                    bypassLoginAccountSecurityChallenges: t.bypassLoginAccountSecurityChallenges,
                    allowAutomation: t.allowAutomation
                }
            }(t.exemptions),
            initialAccountSettings: function(t) {
                if (void 0 !== t) return null === t ? null : {
                    boundAuthTokenValidation: t.boundAuthTokenValidation
                }
            }(t.initialAccountSettings),
            verifications: function(t) {
                if (void 0 !== t) return null === t ? null : {
                    emailVerified: t.emailVerified,
                    idVerified: t.idVerified,
                    twoStepVerificationEmailEnabled: t.twoStepVerificationEmailEnabled,
                    faeVerified: t.faeVerified
                }
            }(t.verifications),
            group: t.group,
            hasPermanentExclusion: t.hasPermanentExclusion
        }
    }

    function u$(t) {
        var n;
        return null == (n = t) ? n : {
            code: (0, uG.exists)(n, "Code") ? n.Code : void 0,
            message: (0, uG.exists)(n, "Message") ? n.Message : void 0
        }
    }

    function uZ(t) {
        var n;
        return null == (n = t) ? n : {
            errors: (0, uG.exists)(n, "errors") ? n.errors.map(u$) : void 0,
            usernamePrefix: (0, uG.exists)(n, "usernamePrefix") ? n.usernamePrefix : void 0,
            username: (0, uG.exists)(n, "username") ? n.username : void 0,
            userId: (0, uG.exists)(n, "userId") ? n.userId : void 0,
            password: (0, uG.exists)(n, "password") ? n.password : void 0
        }
    }

    function uY(t) {
        var n;
        return null == (n = t) ? n : {
            userId: (0, uG.exists)(n, "userId") ? n.userId : void 0,
            userKey: (0, uG.exists)(n, "userKey") ? n.userKey : void 0,
            name: (0, uG.exists)(n, "name") ? n.name : void 0,
            displayName: (0, uG.exists)(n, "displayName") ? n.displayName : void 0,
            createdTime: (0, uG.exists)(n, "createdTime") ? new Date(n.createdTime) : void 0,
            updatedTime: (0, uG.exists)(n, "updatedTime") ? new Date(n.updatedTime) : void 0,
            accountCountry: (0, uG.exists)(n, "accountCountry") ? n.accountCountry : void 0
        }
    }

    function u0(t) {
        var n;
        return null == (n = t) ? n : {
            method: (0, uG.exists)(n, "method") ? n.method : void 0,
            priority: (0, uG.exists)(n, "priority") ? n.priority : void 0
        }
    }

    function u1(t) {
        if (void 0 !== t) return null === t ? null : {
            clientPublicKey: t.clientPublicKey,
            clientEpochTimestamp: t.clientEpochTimestamp,
            saiSignature: t.saiSignature,
            serverNonce: t.serverNonce
        }
    }

    function u2(t) {
        if (void 0 !== t) return null === t ? null : {
            ctype: t.ctype,
            cvalue: t.cvalue,
            password: t.password,
            userId: t.userId,
            securityQuestionSessionId: t.securityQuestionSessionId,
            securityQuestionRedemptionToken: t.securityQuestionRedemptionToken,
            secureAuthenticationIntent: u1(t.secureAuthenticationIntent),
            accountBlob: t.accountBlob,
            accountLinkParameters: uz(t.accountLinkParameters),
            captchaId: t.captchaId,
            captchaToken: t.captchaToken,
            captchaProvider: t.captchaProvider,
            challengeId: t.challengeId
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function u4(t, n) {
        var r, i;
        return null == t ? t : {
            user: (0, uG.exists)(t, "user") ? null == (r = t.user) ? r : {
                id: (0, uG.exists)(r, "id") ? r.id : void 0,
                name: (0, uG.exists)(r, "name") ? r.name : void 0,
                displayName: (0, uG.exists)(r, "displayName") ? r.displayName : void 0
            } : void 0,
            twoStepVerificationData: (0, uG.exists)(t, "twoStepVerificationData") ? null == (i = t.twoStepVerificationData) ? i : {
                mediaType: (0, uG.exists)(i, "mediaType") ? i.mediaType : void 0,
                ticket: (0, uG.exists)(i, "ticket") ? i.ticket : void 0
            } : void 0,
            identityVerificationLoginTicket: (0, uG.exists)(t, "identityVerificationLoginTicket") ? t.identityVerificationLoginTicket : void 0,
            isBanned: (0, uG.exists)(t, "isBanned") ? t.isBanned : void 0,
            accountBlob: (0, uG.exists)(t, "accountBlob") ? t.accountBlob : void 0,
            shouldUpdateEmail: (0, uG.exists)(t, "shouldUpdateEmail") ? t.shouldUpdateEmail : void 0,
            recoveryEmail: (0, uG.exists)(t, "recoveryEmail") ? t.recoveryEmail : void 0,
            passkeyRegistrationSucceeded: (0, uG.exists)(t, "passkeyRegistrationSucceeded") ? t.passkeyRegistrationSucceeded : void 0,
            shouldAutoLoginFromRecovery: (0, uG.exists)(t, "shouldAutoLoginFromRecovery") ? t.shouldAutoLoginFromRecovery : void 0,
            shouldPrompt2svRemoval: (0, uG.exists)(t, "shouldPrompt2svRemoval") ? t.shouldPrompt2svRemoval : void 0,
            shouldPromptPasskeyAddition: (0, uG.exists)(t, "shouldPromptPasskeyAddition") ? t.shouldPromptPasskeyAddition : void 0
        }
    }

    function u3(t, n) {
        return null == t ? t : {
            code: (0, uG.exists)(t, "code") ? t.code : void 0,
            message: (0, uG.exists)(t, "message") ? t.message : void 0
        }
    }

    function u6(t) {
        if (void 0 !== t) return null === t ? null : {
            translationKey: t.translationKey,
            translationNamespace: t.translationNamespace,
            translatedSourceString: t.translatedSourceString,
            parameters: t.parameters
        }
    }

    function u8(t) {
        if (void 0 !== t) return null === t ? null : {
            capturedAuditContent: void 0 === t.capturedAuditContent ? void 0 : (0, uG.mapValues)(t.capturedAuditContent, u6),
            additionalAuditContent: t.additionalAuditContent
        }
    }

    function u5(t) {
        var n;
        return null == (n = t) ? n : {
            provider: (0, uG.exists)(n, "provider") ? n.provider : void 0,
            identifier: (0, uG.exists)(n, "identifier") ? n.identifier : void 0
        }
    }

    function u7(t, n) {
        return null == t ? t : {
            didGenerateNewUsername: (0, uG.exists)(t, "didGenerateNewUsername") ? t.didGenerateNewUsername : void 0,
            suggestedUsernames: (0, uG.exists)(t, "suggestedUsernames") ? t.suggestedUsernames : void 0
        }
    }

    function u9(t) {
        var n;
        return null == (n = t) ? n : {
            nickname: (0, uG.exists)(n, "nickname") ? n.nickname : void 0
        }
    }

    function ce(t) {
        if (void 0 !== t) return null === t ? null : {
            username: t.username,
            password: t.password,
            gender: t.gender,
            birthday: void 0 === t.birthday ? void 0 : t.birthday.toISOString(),
            displayName: t.displayName,
            isTosAgreementBoxChecked: t.isTosAgreementBoxChecked,
            email: t.email,
            locale: t.locale,
            assetIds: t.assetIds,
            bodyColorId: t.bodyColorId,
            bodyTypeScale: t.bodyTypeScale,
            headScale: t.headScale,
            heightScale: t.heightScale,
            widthScale: t.widthScale,
            proportionScale: t.proportionScale,
            referralData: function(t) {
                if (void 0 !== t) return null === t ? null : {
                    acquisitionTime: void 0 === t.acquisitionTime ? void 0 : t.acquisitionTime.toISOString(),
                    acquisitionReferrer: t.acquisitionReferrer,
                    medium: t.medium,
                    source: t.source,
                    campaign: t.campaign,
                    adGroup: t.adGroup,
                    keyword: t.keyword,
                    matchType: t.matchType,
                    sendInfo: t.sendInfo,
                    requestSessionId: t.requestSessionId,
                    offerId: t.offerId
                }
            }(t.referralData),
            agreementIds: t.agreementIds,
            identityVerificationResultToken: t.identityVerificationResultToken,
            secureAuthenticationIntent: u1(t.secureAuthenticationIntent),
            otpSession: function(t) {
                if (void 0 !== t) return null === t ? null : {
                    otpSessionToken: t.otpSessionToken,
                    otpContactType: t.otpContactType
                }
            }(t.otpSession),
            dataToken: t.dataToken,
            accountBlob: t.accountBlob,
            passkeySessionId: t.passkeySessionId,
            passkeyRegistrationResponse: t.passkeyRegistrationResponse,
            accountLinkParameters: uz(t.accountLinkParameters),
            auditSystemContent: u8(t.auditSystemContent),
            captchaId: t.captchaId,
            captchaToken: t.captchaToken,
            captchaProvider: t.captchaProvider,
            challengeId: t.challengeId
        }
    }

    function ct(t, n) {
        return null == t ? t : {
            userId: (0, uG.exists)(t, "userId") ? t.userId : void 0,
            starterPlaceId: (0, uG.exists)(t, "starterPlaceId") ? t.starterPlaceId : void 0,
            returnUrl: (0, uG.exists)(t, "returnUrl") ? t.returnUrl : void 0,
            accountBlob: (0, uG.exists)(t, "accountBlob") ? t.accountBlob : void 0
        }
    }

    function cn(t, n) {
        return null == t ? t : {
            voucher: (0, uG.exists)(t, "voucher") ? t.voucher : void 0,
            gender: (0, uG.exists)(t, "gender") ? t.gender : void 0,
            userId: (0, uG.exists)(t, "userId") ? t.userId : void 0,
            displayName: (0, uG.exists)(t, "displayName") ? t.displayName : void 0,
            openId: (0, uG.exists)(t, "openId") ? t.openId : void 0
        }
    }

    function cr(t) {
        if (void 0 !== t) return null === t ? null : {
            voucher: t.voucher,
            username: t.username,
            password: t.password
        }
    }

    function ci(t, n) {
        return null == t ? t : {
            loginPage: (0, uG.exists)(t, "loginPage") ? t.loginPage : void 0,
            realNameVerificationUrl: (0, uG.exists)(t, "realNameVerificationUrl") ? t.realNameVerificationUrl : void 0,
            isLinkingEnabled: (0, uG.exists)(t, "isLinkingEnabled") ? t.isLinkingEnabled : void 0
        }
    }

    function ca(t) {
        if (void 0 !== t) return null === t ? null : {
            displayName: t.displayName,
            agreementIds: t.agreementIds,
            tencentDeveloperAppType: t.tencentDeveloperAppType,
            channelId: t.channelId,
            gender: t.gender,
            birthday: void 0 === t.birthday ? void 0 : t.birthday.toISOString(),
            voucher: t.voucher
        }
    }

    function co(t) {
        if (void 0 !== t) return null === t ? null : {
            code: t.code,
            state: t.state,
            appType: t.appType,
            channelId: t.channelId
        }
    }

    function cs(t) {
        if (void 0 !== t) return null === t ? null : {
            voucher: t.voucher,
            username: t.username,
            ticket: t.ticket,
            code: t.code
        }
    }

    function cu(t, n) {
        return null == t ? t : {
            code: (0, uG.exists)(t, "code") ? t.code : void 0,
            message: (0, uG.exists)(t, "message") ? t.message : void 0
        }
    }

    function cc(t) {
        var n;
        return null == (n = t) ? n : {
            id: (0, uG.exists)(n, "Id") ? n.Id : void 0,
            userId: (0, uG.exists)(n, "UserId") ? n.UserId : void 0,
            username: (0, uG.exists)(n, "Username") ? n.Username : void 0
        }
    }

    function cl(t, n) {
        return null == t ? t : {
            success: (0, uG.exists)(t, "success") ? t.success : void 0
        }
    }(function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uH(n, t), n.prototype.v1AccountCreationMetadataGetRaw = function(t) {
            return uK(this, void 0, void 0, function() {
                var n, r, i;
                return uJ(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/account-creation/metadata",
                                schemaPath: "/v1/account-creation/metadata",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new uG.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    isEligibleForALSignup: (0, uG.exists)(t, "isEligibleForALSignup") ? t.isEligibleForALSignup : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1AccountCreationMetadataGet = function(t) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1AccountCreationMetadataGetRaw(t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    })(uG.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uH(n, t), n.prototype.v1AccountPinDeleteRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/account/pin",
                                schemaPath: "/v1/account/pin",
                                method: "DELETE",
                                headers: i,
                                query: r,
                                body: uQ(t.requestBody)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return cl(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1AccountPinDelete = function() {
            return uK(this, arguments, void 0, function(t, n) {
                return void 0 === t && (t = {}), uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1AccountPinDeleteRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1AccountPinGetRaw = function(t) {
            return uK(this, void 0, void 0, function() {
                var n, r, i;
                return uJ(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/account/pin",
                                schemaPath: "/v1/account/pin",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new uG.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    isEnabled: (0, uG.exists)(t, "isEnabled") ? t.isEnabled : void 0,
                                    unlockedUntil: (0, uG.exists)(t, "unlockedUntil") ? t.unlockedUntil : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1AccountPinGet = function(t) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1AccountPinGetRaw(t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.v1AccountPinLockPostRaw = function(t) {
            return uK(this, void 0, void 0, function() {
                var n, r, i;
                return uJ(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/account/pin/lock",
                                schemaPath: "/v1/account/pin/lock",
                                method: "POST",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new uG.JSONApiResponse(i, function(t) {
                                return cl(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1AccountPinLockPost = function(t) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1AccountPinLockPostRaw(t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.v1AccountPinPatchRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.requestBody || void 0 === t.requestBody) throw new uG.RequiredError("requestBody", "Required parameter requestParameters.requestBody was null or undefined when calling v1AccountPinPatch.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/account/pin",
                                schemaPath: "/v1/account/pin",
                                method: "PATCH",
                                headers: i,
                                query: r,
                                body: uQ(t.requestBody)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return cl(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1AccountPinPatch = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1AccountPinPatchRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1AccountPinPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.requestBody || void 0 === t.requestBody) throw new uG.RequiredError("requestBody", "Required parameter requestParameters.requestBody was null or undefined when calling v1AccountPinPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/account/pin",
                                schemaPath: "/v1/account/pin",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: uQ(t.requestBody)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return cl(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1AccountPinPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1AccountPinPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1AccountPinUnlockPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.requestBody || void 0 === t.requestBody) throw new uG.RequiredError("requestBody", "Required parameter requestParameters.requestBody was null or undefined when calling v1AccountPinUnlockPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/account/pin/unlock",
                                schemaPath: "/v1/account/pin/unlock",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: uQ(t.requestBody)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    unlockedUntil: (0, uG.exists)(t, "unlockedUntil") ? t.unlockedUntil : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1AccountPinUnlockPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1AccountPinUnlockPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }
    }(uG.BaseAPI);
    var cd = function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        return uH(n, t), n.prototype.v1AuthMetadataGetRaw = function(t) {
            return uK(this, void 0, void 0, function() {
                var n, r, i;
                return uJ(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/auth/metadata",
                                schemaPath: "/v1/auth/metadata",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new uG.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    cookieLawNoticeTimeout: (0, uG.exists)(t, "cookieLawNoticeTimeout") ? t.cookieLawNoticeTimeout : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1AuthMetadataGet = function(t) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1AuthMetadataGetRaw(t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.v1LoginLinkedPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1LoginLinkedPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/login/linked",
                                schemaPath: "/v1/login/linked",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: u2(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return u4(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1LoginLinkedPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1LoginLinkedPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1LoginPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1LoginPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/login",
                                schemaPath: "/v1/login",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: u2(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return u4(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1LoginPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1LoginPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1LogoutPostRaw = function(t) {
            return uK(this, void 0, void 0, function() {
                var n, r, i;
                return uJ(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/logout",
                                schemaPath: "/v1/logout",
                                method: "POST",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new uG.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1LogoutPost = function(t) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1LogoutPostRaw(t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.v1LogoutfromallsessionsandreauthenticatePostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1LogoutfromallsessionsandreauthenticatePost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/logoutfromallsessionsandreauthenticate",
                                schemaPath: "/v1/logoutfromallsessionsandreauthenticate",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        SecureAuthenticationIntent: u1(t.secureAuthenticationIntent)
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1LogoutfromallsessionsandreauthenticatePost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1LogoutfromallsessionsandreauthenticatePostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1SessionRefreshPostRaw = function(t) {
            return uK(this, void 0, void 0, function() {
                var n, r, i;
                return uJ(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/session/refresh",
                                schemaPath: "/v1/session/refresh",
                                method: "POST",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new uG.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1SessionRefreshPost = function(t) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1SessionRefreshPostRaw(t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.v1UsersUserIdImpersonatePostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.userId || void 0 === t.userId) throw new uG.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdImpersonatePost.");
                            return r = {}, i = {}, [4, this.request({
                                path: "/v1/users/{userId}/impersonate".replace("{".concat("userId", "}"), encodeURIComponent(String(t.userId))),
                                schemaPath: "/v1/users/{userId}/impersonate",
                                method: "POST",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1UsersUserIdImpersonatePost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1UsersUserIdImpersonatePostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n
    }(uG.BaseAPI);
    (function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uH(n, t), n.prototype.v1AuthenticationTicketPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1AuthenticationTicketPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/authentication-ticket",
                                schemaPath: "/v1/authentication-ticket",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        clientAssertion: t.clientAssertion
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1AuthenticationTicketPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1AuthenticationTicketPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1AuthenticationTicketRedeemPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.rBXAuthenticationNegotiation || void 0 === t.rBXAuthenticationNegotiation) throw new uG.RequiredError("rBXAuthenticationNegotiation", "Required parameter requestParameters.rBXAuthenticationNegotiation was null or undefined when calling v1AuthenticationTicketRedeemPost.");
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1AuthenticationTicketRedeemPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", void 0 !== t.rBXAuthenticationNegotiation && null !== t.rBXAuthenticationNegotiation && (i.RBXAuthenticationNegotiation = String(t.rBXAuthenticationNegotiation)), [4, this.request({
                                path: "/v1/authentication-ticket/redeem",
                                schemaPath: "/v1/authentication-ticket/redeem",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        authenticationTicket: t.authenticationTicket,
                                        retainCurrentSession: t.retainCurrentSession,
                                        accountBlob: t.accountBlob,
                                        issueNewBlob: t.issueNewBlob
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    accountBlob: (0, uG.exists)(t, "accountBlob") ? t.accountBlob : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1AuthenticationTicketRedeemPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1AuthenticationTicketRedeemPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1AuthenticationTicketRetrieveUserPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1AuthenticationTicketRetrieveUserPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/authentication-ticket/retrieve-user",
                                schemaPath: "/v1/authentication-ticket/retrieve-user",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        authenticationTicket: t.authenticationTicket
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    userId: (0, uG.exists)(t, "UserId") ? t.UserId : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1AuthenticationTicketRetrieveUserPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1AuthenticationTicketRetrieveUserPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1ClientAssertionGetRaw = function(t) {
            return uK(this, void 0, void 0, function() {
                var n, r, i;
                return uJ(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/client-assertion",
                                schemaPath: "/v1/client-assertion",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new uG.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    clientAssertion: (0, uG.exists)(t, "clientAssertion") ? t.clientAssertion : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1ClientAssertionGet = function(t) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1ClientAssertionGetRaw(t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    })(uG.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uH(n, t), n.prototype.v1ExternalAccessPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1ExternalAccessPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/external/access",
                                schemaPath: "/v1/external/access",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        authenticationProof: t.authenticationProof,
                                        identityProviderPlatformType: t.identityProviderPlatformType,
                                        additionalInfoPayload: t.additionalInfoPayload
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    placeId: (0, uG.exists)(t, "placeId") ? t.placeId : void 0,
                                    isolationContext: (0, uG.exists)(t, "isolationContext") ? t.isolationContext : void 0,
                                    launchData: (0, uG.exists)(t, "launchData") ? t.launchData : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1ExternalAccessPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1ExternalAccessPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1ExternalIdentityProviderIdSsoOauthCallbackGetRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.identityProviderId || void 0 === t.identityProviderId) throw new uG.RequiredError("identityProviderId", "Required parameter requestParameters.identityProviderId was null or undefined when calling v1ExternalIdentityProviderIdSsoOauthCallbackGet.");
                            if (null === t.code || void 0 === t.code) throw new uG.RequiredError("code", "Required parameter requestParameters.code was null or undefined when calling v1ExternalIdentityProviderIdSsoOauthCallbackGet.");
                            if (null === t.state || void 0 === t.state) throw new uG.RequiredError("state", "Required parameter requestParameters.state was null or undefined when calling v1ExternalIdentityProviderIdSsoOauthCallbackGet.");
                            return r = {}, void 0 !== t.code && (r.code = t.code), void 0 !== t.state && (r.state = t.state), i = {}, [4, this.request({
                                path: "/v1/external/{identityProviderId}/sso/oauth/callback".replace("{".concat("identityProviderId", "}"), encodeURIComponent(String(t.identityProviderId))),
                                schemaPath: "/v1/external/{identityProviderId}/sso/oauth/callback",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.VoidApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1ExternalIdentityProviderIdSsoOauthCallbackGet = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1ExternalIdentityProviderIdSsoOauthCallbackGetRaw(t, n)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, n.prototype.v1ExternalIdentityProviderIdSsoOauthInitGetRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.identityProviderId || void 0 === t.identityProviderId) throw new uG.RequiredError("identityProviderId", "Required parameter requestParameters.identityProviderId was null or undefined when calling v1ExternalIdentityProviderIdSsoOauthInitGet.");
                            return r = {}, i = {}, [4, this.request({
                                path: "/v1/external/{identityProviderId}/sso/oauth/init".replace("{".concat("identityProviderId", "}"), encodeURIComponent(String(t.identityProviderId))),
                                schemaPath: "/v1/external/{identityProviderId}/sso/oauth/init",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.VoidApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1ExternalIdentityProviderIdSsoOauthInitGet = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1ExternalIdentityProviderIdSsoOauthInitGetRaw(t, n)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, n.prototype.v1ExternalIdentityProviderIdSsoSamlAssertionConsumerServicePostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a, o;
                return uJ(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.identityProviderId || void 0 === t.identityProviderId) throw new uG.RequiredError("identityProviderId", "Required parameter requestParameters.identityProviderId was null or undefined when calling v1ExternalIdentityProviderIdSsoSamlAssertionConsumerServicePost.");
                            return r = {}, i = {}, (0, uG.canConsumeForm)([{
                                contentType: "multipart/form-data"
                            }]), a = new URLSearchParams, void 0 !== t.sAMLResponse && a.append("SAMLResponse", t.sAMLResponse), void 0 !== t.relayState && a.append("RelayState", t.relayState), [4, this.request({
                                path: "/v1/external/{identityProviderId}/sso/saml/assertion-consumer-service".replace("{".concat("identityProviderId", "}"), encodeURIComponent(String(t.identityProviderId))),
                                schemaPath: "/v1/external/{identityProviderId}/sso/saml/assertion-consumer-service",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: a
                            }, n)];
                        case 1:
                            return o = s.sent(), [2, new uG.VoidApiResponse(o)]
                    }
                })
            })
        }, n.prototype.v1ExternalIdentityProviderIdSsoSamlAssertionConsumerServicePost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1ExternalIdentityProviderIdSsoSamlAssertionConsumerServicePostRaw(t, n)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, n.prototype.v1ExternalLoginAndLinkPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1ExternalLoginAndLinkPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/external/loginAndLink",
                                schemaPath: "/v1/external/loginAndLink",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        ctype: t.ctype,
                                        cvalue: t.cvalue,
                                        password: t.password,
                                        authenticationProof: t.authenticationProof,
                                        IdentityProviderPlatformType: t.identityProviderPlatformType,
                                        additionalInfoPayload: t.additionalInfoPayload
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return u4(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1ExternalLoginAndLinkPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1ExternalLoginAndLinkPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1ExternalLoginPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1ExternalLoginPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/external/login",
                                schemaPath: "/v1/external/login",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        identityProvider: t.identityProvider,
                                        additionalData: t.additionalData,
                                        authenticationProof: t.authenticationProof
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    success: (0, uG.exists)(t, "success") ? t.success : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1ExternalLoginPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1ExternalLoginPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1ExternalSignupPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1ExternalSignupPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/external/signup",
                                schemaPath: "/v1/external/signup",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        username: t.username,
                                        password: t.password,
                                        birthday: void 0 === t.birthday ? void 0 : t.birthday.toISOString(),
                                        locale: t.locale,
                                        authenticationProof: t.authenticationProof,
                                        IdentityProviderPlatformType: t.identityProviderPlatformType,
                                        additionalInfoPayload: t.additionalInfoPayload
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.VoidApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1ExternalSignupPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1ExternalSignupPostRaw(t, n)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, n.prototype.v1ExternalUnlinkPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1ExternalUnlinkPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/external/unlink",
                                schemaPath: "/v1/external/unlink",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        IdentityProviderPlatformType: t.identityProviderPlatformType,
                                        additionalInfoPayload: t.additionalInfoPayload
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.VoidApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1ExternalUnlinkPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1ExternalUnlinkPostRaw(t, n)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }
    }(uG.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uH(n, t), n.prototype.v1IdentityInitializeLoginPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.initializeLoginRequest || void 0 === t.initializeLoginRequest) throw new uG.RequiredError("initializeLoginRequest", "Required parameter requestParameters.initializeLoginRequest was null or undefined when calling v1IdentityInitializeLoginPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/identity/initialize-login",
                                schemaPath: "/v1/identity/initialize-login",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        ctype: t.ctype,
                                        cvalue: t.cvalue,
                                        captchaId: t.captchaId,
                                        captchaToken: t.captchaToken,
                                        captchaProvider: t.captchaProvider,
                                        challengeId: t.challengeId
                                    }
                                }(t.initializeLoginRequest)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    loginMethods: (0, uG.exists)(t, "loginMethods") ? t.loginMethods.map(u0) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1IdentityInitializeLoginPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1IdentityInitializeLoginPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }
    }(uG.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uH(n, t), n.prototype.v1IdentityVerificationLoginPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1IdentityVerificationLoginPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/identity-verification/login",
                                schemaPath: "/v1/identity-verification/login",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        loginTicket: t.loginTicket,
                                        resultToken: t.resultToken
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1IdentityVerificationLoginPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1IdentityVerificationLoginPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }
    }(uG.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uH(n, t), n.prototype.v1MetadataGetRaw = function(t) {
            return uK(this, void 0, void 0, function() {
                var n, r, i;
                return uJ(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/metadata",
                                schemaPath: "/v1/metadata",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new uG.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    isUpdateUsernameEnabled: (0, uG.exists)(t, "isUpdateUsernameEnabled") ? t.isUpdateUsernameEnabled : void 0,
                                    ftuxAvatarAssetMap: (0, uG.exists)(t, "ftuxAvatarAssetMap") ? t.ftuxAvatarAssetMap : void 0,
                                    isEmailUpsellAtLogoutEnabled: (0, uG.exists)(t, "IsEmailUpsellAtLogoutEnabled") ? t.IsEmailUpsellAtLogoutEnabled : void 0,
                                    shouldFetchEmailUpsellIXPValuesAtLogout: (0, uG.exists)(t, "ShouldFetchEmailUpsellIXPValuesAtLogout") ? t.ShouldFetchEmailUpsellIXPValuesAtLogout : void 0,
                                    isAccountRecoveryPromptEnabled: (0, uG.exists)(t, "IsAccountRecoveryPromptEnabled") ? t.IsAccountRecoveryPromptEnabled : void 0,
                                    isContactMethodRequiredAtSignup: (0, uG.exists)(t, "IsContactMethodRequiredAtSignup") ? t.IsContactMethodRequiredAtSignup : void 0,
                                    isUserAgreementsSignupIntegrationEnabled: (0, uG.exists)(t, "IsUserAgreementsSignupIntegrationEnabled") ? t.IsUserAgreementsSignupIntegrationEnabled : void 0,
                                    isPasswordRequiredForUsernameChange: (0, uG.exists)(t, "IsPasswordRequiredForUsernameChange") ? t.IsPasswordRequiredForUsernameChange : void 0,
                                    isPasskeyFeatureEnabled: (0, uG.exists)(t, "IsPasskeyFeatureEnabled") ? t.IsPasskeyFeatureEnabled : void 0,
                                    isAltBrowserTracker: (0, uG.exists)(t, "IsAltBrowserTracker") ? t.IsAltBrowserTracker : void 0,
                                    isLoginRedirectPageEnabled: (0, uG.exists)(t, "IsLoginRedirectPageEnabled") ? t.IsLoginRedirectPageEnabled : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1MetadataGet = function(t) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1MetadataGetRaw(t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(uG.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uH(n, t), n.prototype.v1PalisadesLiveConnectPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PalisadesLiveConnectPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/palisades-live/connect",
                                schemaPath: "/v1/palisades-live/connect",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        ctype: t.ctype,
                                        cvalue: t.cvalue,
                                        password: t.password
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return u4(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1PalisadesLiveConnectPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1PalisadesLiveConnectPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1PalisadesLiveDisconnectPostRaw = function(t) {
            return uK(this, void 0, void 0, function() {
                var n, r, i;
                return uJ(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/palisades-live/disconnect",
                                schemaPath: "/v1/palisades-live/disconnect",
                                method: "POST",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new uG.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1PalisadesLiveDisconnectPost = function(t) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1PalisadesLiveDisconnectPostRaw(t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.v1PalisadesLiveIsLiveGetRaw = function(t) {
            return uK(this, void 0, void 0, function() {
                var n, r, i;
                return uJ(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/palisades-live/is-live",
                                schemaPath: "/v1/palisades-live/is-live",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), this.isJsonMime(i.headers.get("content-type")) ? [2, new uG.JSONApiResponse(i)] : [2, new uG.TextApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1PalisadesLiveIsLiveGet = function(t) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1PalisadesLiveIsLiveGetRaw(t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.v1PalisadesLiveLoginPostRaw = function(t) {
            return uK(this, void 0, void 0, function() {
                var n, r, i;
                return uJ(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/palisades-live/login",
                                schemaPath: "/v1/palisades-live/login",
                                method: "POST",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), this.isJsonMime(i.headers.get("content-type")) ? [2, new uG.JSONApiResponse(i)] : [2, new uG.TextApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1PalisadesLiveLoginPost = function(t) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1PalisadesLiveLoginPostRaw(t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.v1PalisadesLiveSignupPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PalisadesLiveSignupPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/palisades-live/signup",
                                schemaPath: "/v1/palisades-live/signup",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        username: t.username,
                                        password: t.password,
                                        birthday: void 0 === t.birthday ? void 0 : t.birthday.toISOString(),
                                        locale: t.locale,
                                        gender: t.gender,
                                        agreementIds: t.agreementIds,
                                        auditSystemContent: u8(t.auditSystemContent)
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), this.isJsonMime(a.headers.get("content-type")) ? [2, new uG.JSONApiResponse(a)] : [2, new uG.TextApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1PalisadesLiveSignupPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1PalisadesLiveSignupPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }
    }(uG.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uH(n, t), n.prototype.v1PasskeyDeleteCredentialBatchPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyDeleteCredentialBatchPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/passkey/DeleteCredentialBatch",
                                schemaPath: "/v1/passkey/DeleteCredentialBatch",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        credentialNicknames: t.credentialNicknames
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1PasskeyDeleteCredentialBatchPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1PasskeyDeleteCredentialBatchPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1PasskeyFinishArPreauthRegistrationPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyFinishArPreauthRegistrationPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/passkey/finish-ar-preauth-registration",
                                schemaPath: "/v1/passkey/finish-ar-preauth-registration",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        recoverySession: t.recoverySession,
                                        passkeySessionId: t.passkeySessionId,
                                        passkeyRegistrationResponse: t.passkeyRegistrationResponse,
                                        userId: t.userId,
                                        isPostRecovery: t.isPostRecovery,
                                        source: t.source
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1PasskeyFinishArPreauthRegistrationPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1PasskeyFinishArPreauthRegistrationPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1PasskeyFinishPreauthRegistrationPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyFinishPreauthRegistrationPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/passkey/finish-preauth-registration",
                                schemaPath: "/v1/passkey/finish-preauth-registration",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        sessionId: t.sessionId,
                                        registrationResponse: t.registrationResponse,
                                        source: t.source
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1PasskeyFinishPreauthRegistrationPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1PasskeyFinishPreauthRegistrationPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1PasskeyFinishRegistrationPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyFinishRegistrationPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/passkey/FinishRegistration",
                                schemaPath: "/v1/passkey/FinishRegistration",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        sessionId: t.sessionId,
                                        credentialNickname: t.credentialNickname,
                                        attestationResponse: t.attestationResponse,
                                        source: t.source
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1PasskeyFinishRegistrationPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1PasskeyFinishRegistrationPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1PasskeyListCredentialsPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyListCredentialsPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/passkey/ListCredentials",
                                schemaPath: "/v1/passkey/ListCredentials",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        all: t.all
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    credentials: (0, uG.exists)(t, "credentials") ? t.credentials.map(u9) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1PasskeyListCredentialsPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1PasskeyListCredentialsPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1PasskeyStartAuthenticationByUserPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyStartAuthenticationByUserPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/passkey/start-authentication-by-user",
                                schemaPath: "/v1/passkey/start-authentication-by-user",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        ctype: t.ctype,
                                        cvalue: t.cvalue
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    authenticationOptions: (0, uG.exists)(t, "authenticationOptions") ? t.authenticationOptions : void 0,
                                    sessionId: (0, uG.exists)(t, "sessionId") ? t.sessionId : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1PasskeyStartAuthenticationByUserPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1PasskeyStartAuthenticationByUserPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1PasskeyStartAuthenticationPostRaw = function(t) {
            return uK(this, void 0, void 0, function() {
                var n, r, i;
                return uJ(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/passkey/StartAuthentication",
                                schemaPath: "/v1/passkey/StartAuthentication",
                                method: "POST",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new uG.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    authenticationOptions: (0, uG.exists)(t, "authenticationOptions") ? t.authenticationOptions : void 0,
                                    sessionId: (0, uG.exists)(t, "sessionId") ? t.sessionId : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1PasskeyStartAuthenticationPost = function(t) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1PasskeyStartAuthenticationPostRaw(t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.v1PasskeyStartPreauthRegistrationPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyStartPreauthRegistrationPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/passkey/start-preauth-registration",
                                schemaPath: "/v1/passkey/start-preauth-registration",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        username: t.username
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    creationOptions: (0, uG.exists)(t, "creationOptions") ? t.creationOptions : void 0,
                                    sessionId: (0, uG.exists)(t, "sessionId") ? t.sessionId : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1PasskeyStartPreauthRegistrationPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1PasskeyStartPreauthRegistrationPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1PasskeyStartRegistrationPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyStartRegistrationPost.");
                            return r = {}, void 0 !== t.flow && (r.flow = t.flow), (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/passkey/StartRegistration",
                                schemaPath: "/v1/passkey/StartRegistration",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        isSilentUpgrade: t.isSilentUpgrade
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    creationOptions: (0, uG.exists)(t, "creationOptions") ? t.creationOptions : void 0,
                                    sessionId: (0, uG.exists)(t, "sessionId") ? t.sessionId : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1PasskeyStartRegistrationPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1PasskeyStartRegistrationPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1PasskeySuEligibilityGetRaw = function(t) {
            return uK(this, void 0, void 0, function() {
                var n, r, i;
                return uJ(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/passkey/su-eligibility",
                                schemaPath: "/v1/passkey/su-eligibility",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new uG.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    suEligibility: (0, uG.exists)(t, "suEligibility") ? t.suEligibility : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1PasskeySuEligibilityGet = function(t) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1PasskeySuEligibilityGetRaw(t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(uG.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uH(n, t), n.prototype.v1UserPasswordsChangePostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1UserPasswordsChangePost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/user/passwords/change",
                                schemaPath: "/v1/user/passwords/change",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        currentPassword: t.currentPassword,
                                        newPassword: t.newPassword,
                                        secureAuthenticationIntent: u1(t.secureAuthenticationIntent)
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1UserPasswordsChangePost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1UserPasswordsChangePostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }
    }(uG.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uH(n, t), n.prototype.v1PasswordsValidateGetRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.username || void 0 === t.username) throw new uG.RequiredError("username", "Required parameter requestParameters.username was null or undefined when calling v1PasswordsValidateGet.");
                            if (null === t.password || void 0 === t.password) throw new uG.RequiredError("password", "Required parameter requestParameters.password was null or undefined when calling v1PasswordsValidateGet.");
                            return r = {}, void 0 !== t.username && (r.Username = t.username), void 0 !== t.password && (r.Password = t.password), i = {}, [4, this.request({
                                path: "/v1/passwords/validate",
                                schemaPath: "/v1/passwords/validate",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return u3(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1PasswordsValidateGet = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1PasswordsValidateGetRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1PasswordsValidatePostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasswordsValidatePost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/passwords/validate",
                                schemaPath: "/v1/passwords/validate",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        username: t.username,
                                        password: t.password
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return u3(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1PasswordsValidatePost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1PasswordsValidatePostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }
    }(uG.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uH(n, t), n.prototype.v1QqCallbackPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1QqCallbackPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/qq/callback",
                                schemaPath: "/v1/qq/callback",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: co(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return cn(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1QqCallbackPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1QqCallbackPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1QqConnectPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1QqConnectPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/qq/connect",
                                schemaPath: "/v1/qq/connect",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: cr(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return u4(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1QqConnectPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1QqConnectPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1QqMetadataGetRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return r = {}, void 0 !== t.apiKey && (r.apiKey = t.apiKey), void 0 !== t.getIdentifier && (r.getIdentifier = t.getIdentifier), void 0 !== t.appType && (r.appType = t.appType), i = {}, [4, this.request({
                                path: "/v1/qq/metadata",
                                schemaPath: "/v1/qq/metadata",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return ci(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1QqMetadataGet = function() {
            return uK(this, arguments, void 0, function(t, n) {
                return void 0 === t && (t = {}), uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1QqMetadataGetRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1QqSignupwithoutpasswordPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1QqSignupwithoutpasswordPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/qq/signupwithoutpassword",
                                schemaPath: "/v1/qq/signupwithoutpassword",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: ca(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return ct(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1QqSignupwithoutpasswordPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1QqSignupwithoutpasswordPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1QqTokenAuthenticationPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1QqTokenAuthenticationPost.");
                            return r = {}, void 0 !== t.apiKey && (r.apiKey = t.apiKey), (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/qq/token-authentication",
                                schemaPath: "/v1/qq/token-authentication",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        openId: t.openId,
                                        accessToken: t.accessToken,
                                        accessTokenExpiry: t.accessTokenExpiry,
                                        channelId: t.channelId
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return cn(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1QqTokenAuthenticationPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1QqTokenAuthenticationPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1QqVerifyConnectPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1QqVerifyConnectPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/qq/verify-connect",
                                schemaPath: "/v1/qq/verify-connect",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: cs(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1QqVerifyConnectPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1QqVerifyConnectPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }
    }(uG.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uH(n, t), n.prototype.v1RecoveryMetadataGetRaw = function(t) {
            return uK(this, void 0, void 0, function() {
                var n, r, i;
                return uJ(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/recovery/metadata",
                                schemaPath: "/v1/recovery/metadata",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new uG.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    isOnPhone: (0, uG.exists)(t, "isOnPhone") ? t.isOnPhone : void 0,
                                    codeLength: (0, uG.exists)(t, "codeLength") ? t.codeLength : void 0,
                                    isPhoneFeatureEnabledForUsername: (0, uG.exists)(t, "isPhoneFeatureEnabledForUsername") ? t.isPhoneFeatureEnabledForUsername : void 0,
                                    isPhoneFeatureEnabledForPassword: (0, uG.exists)(t, "isPhoneFeatureEnabledForPassword") ? t.isPhoneFeatureEnabledForPassword : void 0,
                                    isBedev2CaptchaEnabledForPasswordReset: (0, uG.exists)(t, "isBedev2CaptchaEnabledForPasswordReset") ? t.isBedev2CaptchaEnabledForPasswordReset : void 0,
                                    isUsernameRecoveryDeprecated: (0, uG.exists)(t, "isUsernameRecoveryDeprecated") ? t.isUsernameRecoveryDeprecated : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1RecoveryMetadataGet = function(t) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1RecoveryMetadataGetRaw(t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(uG.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uH(n, t), n.prototype.v1RevertAccountGetRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.ticket || void 0 === t.ticket) throw new uG.RequiredError("ticket", "Required parameter requestParameters.ticket was null or undefined when calling v1RevertAccountGet.");
                            return r = {}, void 0 !== t.ticket && (r.ticket = t.ticket), i = {}, [4, this.request({
                                path: "/v1/revert/account",
                                schemaPath: "/v1/revert/account",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    isTwoStepVerificationEnabled: (0, uG.exists)(t, "isTwoStepVerificationEnabled") ? t.isTwoStepVerificationEnabled : void 0,
                                    isEmailVerified: (0, uG.exists)(t, "isEmailVerified") ? t.isEmailVerified : void 0,
                                    isEmailChanged: (0, uG.exists)(t, "isEmailChanged") ? t.isEmailChanged : void 0,
                                    isPhoneVerified: (0, uG.exists)(t, "isPhoneVerified") ? t.isPhoneVerified : void 0,
                                    userId: (0, uG.exists)(t, "userId") ? t.userId : void 0,
                                    username: (0, uG.exists)(t, "username") ? t.username : void 0,
                                    ticket: (0, uG.exists)(t, "ticket") ? t.ticket : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1RevertAccountGet = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1RevertAccountGetRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1RevertAccountPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1RevertAccountPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/revert/account",
                                schemaPath: "/v1/revert/account",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        UserId: t.userId,
                                        NewPassword: t.newPassword,
                                        NewPasswordRepeated: t.newPasswordRepeated,
                                        Ticket: t.ticket,
                                        TwoStepVerificationChallengeId: t.twoStepVerificationChallengeId,
                                        TwoStepVerificationToken: t.twoStepVerificationToken
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return u4(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1RevertAccountPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1RevertAccountPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1RevertInvalidateTicketsPostRaw = function(t) {
            return uK(this, void 0, void 0, function() {
                var n, r, i;
                return uJ(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/revert/invalidate-tickets",
                                schemaPath: "/v1/revert/invalidate-tickets",
                                method: "POST",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new uG.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1RevertInvalidateTicketsPost = function(t) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1RevertInvalidateTicketsPostRaw(t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(uG.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uH(n, t), n.prototype.v1SignupLinkedPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1SignupLinkedPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/signup/linked",
                                schemaPath: "/v1/signup/linked",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: ce(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return ct(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1SignupLinkedPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1SignupLinkedPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1SignupPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1SignupPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/signup",
                                schemaPath: "/v1/signup",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: ce(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return ct(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1SignupPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1SignupPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }
    }(uG.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uH(n, t), n.prototype.v1SocialConnectedProvidersGetRaw = function(t) {
            return uK(this, void 0, void 0, function() {
                var n, r, i;
                return uJ(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/social/connected-providers",
                                schemaPath: "/v1/social/connected-providers",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new uG.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    providers: (0, uG.exists)(t, "providers") ? t.providers.map(u5) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1SocialConnectedProvidersGet = function(t) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1SocialConnectedProvidersGetRaw(t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.v1SocialProviderDisconnectPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.provider || void 0 === t.provider) throw new uG.RequiredError("provider", "Required parameter requestParameters.provider was null or undefined when calling v1SocialProviderDisconnectPost.");
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1SocialProviderDisconnectPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/social/{provider}/disconnect".replace("{".concat("provider", "}"), encodeURIComponent(String(t.provider))),
                                schemaPath: "/v1/social/{provider}/disconnect",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        Password: t.password
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1SocialProviderDisconnectPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1SocialProviderDisconnectPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }
    }(uG.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uH(n, t), n.prototype.v1TestUserAuthenticateApiKeyPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1TestUserAuthenticateApiKeyPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/test-user/authenticate/api-key",
                                schemaPath: "/v1/test-user/authenticate/api-key",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        userId: t.userId,
                                        redirect: t.redirect
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.VoidApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1TestUserAuthenticateApiKeyPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1TestUserAuthenticateApiKeyPostRaw(t, n)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, n.prototype.v1TestUserCreateBatchPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1TestUserCreateBatchPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/test-user/create-batch",
                                schemaPath: "/v1/test-user/create-batch",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        createTestUserRequests: void 0 === t.createTestUserRequests ? void 0 : t.createTestUserRequests.map(uX)
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    createTestUserResponses: (0, uG.exists)(t, "createTestUserResponses") ? t.createTestUserResponses.map(uZ) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1TestUserCreateBatchPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1TestUserCreateBatchPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1TestUserExemptionAddPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1TestUserExemptionAddPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/test-user/exemption/add",
                                schemaPath: "/v1/test-user/exemption/add",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        testUserId: t.testUserId,
                                        exemptionType: t.exemptionType
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1TestUserExemptionAddPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1TestUserExemptionAddPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1TestUserExemptionListGetRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.testUserId || void 0 === t.testUserId) throw new uG.RequiredError("testUserId", "Required parameter requestParameters.testUserId was null or undefined when calling v1TestUserExemptionListGet.");
                            return r = {}, void 0 !== t.testUserId && (r.testUserId = t.testUserId), i = {}, [4, this.request({
                                path: "/v1/test-user/exemption/list",
                                schemaPath: "/v1/test-user/exemption/list",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    exemptions: (0, uG.exists)(t, "exemptions") ? t.exemptions : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1TestUserExemptionListGet = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1TestUserExemptionListGetRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1TestUserExemptionRemovePostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1TestUserExemptionRemovePost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/test-user/exemption/remove",
                                schemaPath: "/v1/test-user/exemption/remove",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        testUserId: t.testUserId,
                                        exemptionType: t.exemptionType
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1TestUserExemptionRemovePost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1TestUserExemptionRemovePostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1TestUserListGetRaw = function(t) {
            return uK(this, void 0, void 0, function() {
                var n, r, i;
                return uJ(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/test-user/list",
                                schemaPath: "/v1/test-user/list",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new uG.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    testUsers: (0, uG.exists)(t, "testUsers") ? t.testUsers.map(uY) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1TestUserListGet = function(t) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1TestUserListGetRaw(t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.v1TestUserLogoutManagerPostRaw = function(t) {
            return uK(this, void 0, void 0, function() {
                var n, r, i;
                return uJ(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/test-user/logout-manager",
                                schemaPath: "/v1/test-user/logout-manager",
                                method: "POST",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new uG.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1TestUserLogoutManagerPost = function(t) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1TestUserLogoutManagerPostRaw(t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.v1TestUserValidateManagerPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1TestUserValidateManagerPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/test-user/validate-manager",
                                schemaPath: "/v1/test-user/validate-manager",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        managerApiKey: t.managerApiKey
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    managerExternalIdentifier: (0, uG.exists)(t, "managerExternalIdentifier") ? t.managerExternalIdentifier : void 0,
                                    sessionExpirationDate: (0, uG.exists)(t, "sessionExpirationDate") ? new Date(t.sessionExpirationDate) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1TestUserValidateManagerPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1TestUserValidateManagerPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }
    }(uG.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uH(n, t), n.prototype.v1UsernameChangePriceGetRaw = function(t) {
            return uK(this, void 0, void 0, function() {
                var n, r, i;
                return uJ(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/username/change/price",
                                schemaPath: "/v1/username/change/price",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new uG.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    priceInRobux: (0, uG.exists)(t, "priceInRobux") ? t.priceInRobux : void 0,
                                    basePriceInRobux: (0, uG.exists)(t, "basePriceInRobux") ? t.basePriceInRobux : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1UsernameChangePriceGet = function(t) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1UsernameChangePriceGetRaw(t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.v1UsernamePostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1UsernamePost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/username",
                                schemaPath: "/v1/username",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        username: t.username,
                                        password: t.password
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1UsernamePost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1UsernamePostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }
    }(uG.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uH(n, t), n.prototype.v1UsernamesGetRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.username || void 0 === t.username) throw new uG.RequiredError("username", "Required parameter requestParameters.username was null or undefined when calling v1UsernamesGet.");
                            return r = {}, void 0 !== t.username && (r.username = t.username), i = {}, [4, this.request({
                                path: "/v1/usernames",
                                schemaPath: "/v1/usernames",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    usernames: (0, uG.exists)(t, "usernames") ? t.usernames : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1UsernamesGet = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1UsernamesGetRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1UsernamesRecoverPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1UsernamesRecoverPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/usernames/recover",
                                schemaPath: "/v1/usernames/recover",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        targetType: t.targetType,
                                        target: t.target
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    transmissionType: (0, uG.exists)(t, "transmissionType") ? t.transmissionType : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1UsernamesRecoverPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1UsernamesRecoverPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1UsernamesValidateGetRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.username || void 0 === t.username) throw new uG.RequiredError("username", "Required parameter requestParameters.username was null or undefined when calling v1UsernamesValidateGet.");
                            if (null === t.birthday || void 0 === t.birthday) throw new uG.RequiredError("birthday", "Required parameter requestParameters.birthday was null or undefined when calling v1UsernamesValidateGet.");
                            if (null === t.context || void 0 === t.context) throw new uG.RequiredError("context", "Required parameter requestParameters.context was null or undefined when calling v1UsernamesValidateGet.");
                            return r = {}, void 0 !== t.username && (r.Username = t.username), void 0 !== t.birthday && (r.Birthday = t.birthday.toISOString()), void 0 !== t.context && (r.Context = t.context), i = {}, [4, this.request({
                                path: "/v1/usernames/validate",
                                schemaPath: "/v1/usernames/validate",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return cu(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1UsernamesValidateGet = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1UsernamesValidateGetRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1UsernamesValidatePostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1UsernamesValidatePost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/usernames/validate",
                                schemaPath: "/v1/usernames/validate",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        username: t.username,
                                        birthday: void 0 === t.birthday ? void 0 : t.birthday.toISOString(),
                                        context: t.context
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return cu(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1UsernamesValidatePost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1UsernamesValidatePostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }
    }(uG.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uH(n, t), n.prototype.v1ValidatorsEmailGetRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.email || void 0 === t.email) throw new uG.RequiredError("email", "Required parameter requestParameters.email was null or undefined when calling v1ValidatorsEmailGet.");
                            return r = {}, void 0 !== t.email && (r.Email = t.email), i = {}, [4, this.request({
                                path: "/v1/validators/email",
                                schemaPath: "/v1/validators/email",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    isEmailValid: (0, uG.exists)(t, "isEmailValid") ? t.isEmailValid : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1ValidatorsEmailGet = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1ValidatorsEmailGetRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1ValidatorsRecommendedUsernameFromDisplayNameGetRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.displayName || void 0 === t.displayName) throw new uG.RequiredError("displayName", "Required parameter requestParameters.displayName was null or undefined when calling v1ValidatorsRecommendedUsernameFromDisplayNameGet.");
                            if (null === t.birthDay || void 0 === t.birthDay) throw new uG.RequiredError("birthDay", "Required parameter requestParameters.birthDay was null or undefined when calling v1ValidatorsRecommendedUsernameFromDisplayNameGet.");
                            return r = {}, void 0 !== t.displayName && (r.DisplayName = t.displayName), void 0 !== t.birthDay && (r.BirthDay = t.birthDay.toISOString()), i = {}, [4, this.request({
                                path: "/v1/validators/recommendedUsernameFromDisplayName",
                                schemaPath: "/v1/validators/recommendedUsernameFromDisplayName",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return u7(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1ValidatorsRecommendedUsernameFromDisplayNameGet = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1ValidatorsRecommendedUsernameFromDisplayNameGetRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1ValidatorsRecommendedUsernameFromDisplayNamePostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.requestBody || void 0 === t.requestBody) throw new uG.RequiredError("requestBody", "Required parameter requestParameters.requestBody was null or undefined when calling v1ValidatorsRecommendedUsernameFromDisplayNamePost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/validators/recommendedUsernameFromDisplayName",
                                schemaPath: "/v1/validators/recommendedUsernameFromDisplayName",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        displayName: t.displayName,
                                        birthday: void 0 === t.birthday ? void 0 : t.birthday.toISOString()
                                    }
                                }(t.requestBody)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return u7(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1ValidatorsRecommendedUsernameFromDisplayNamePost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1ValidatorsRecommendedUsernameFromDisplayNamePostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1ValidatorsUsernameGetRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.username || void 0 === t.username) throw new uG.RequiredError("username", "Required parameter requestParameters.username was null or undefined when calling v1ValidatorsUsernameGet.");
                            if (null === t.birthDay || void 0 === t.birthDay) throw new uG.RequiredError("birthDay", "Required parameter requestParameters.birthDay was null or undefined when calling v1ValidatorsUsernameGet.");
                            return r = {}, void 0 !== t.username && (r.Username = t.username), void 0 !== t.birthDay && (r.BirthDay = t.birthDay.toISOString()), i = {}, [4, this.request({
                                path: "/v1/validators/username",
                                schemaPath: "/v1/validators/username",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return u7(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1ValidatorsUsernameGet = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1ValidatorsUsernameGetRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1ValidatorsUsernamePostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.requestBody || void 0 === t.requestBody) throw new uG.RequiredError("requestBody", "Required parameter requestParameters.requestBody was null or undefined when calling v1ValidatorsUsernamePost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/validators/username",
                                schemaPath: "/v1/validators/username",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        username: t.username,
                                        birthday: void 0 === t.birthday ? void 0 : t.birthday.toISOString()
                                    }
                                }(t.requestBody)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return u7(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1ValidatorsUsernamePost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1ValidatorsUsernamePostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }
    }(uG.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uH(n, t), n.prototype.v1WechatCallbackPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatCallbackPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wechat/callback",
                                schemaPath: "/v1/wechat/callback",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: co(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return cn(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1WechatCallbackPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1WechatCallbackPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1WechatConnectPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatConnectPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wechat/connect",
                                schemaPath: "/v1/wechat/connect",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: cr(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return u4(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1WechatConnectPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1WechatConnectPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1WechatMetadataGetRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return r = {}, void 0 !== t.apiKey && (r.apiKey = t.apiKey), void 0 !== t.getIdentifier && (r.getIdentifier = t.getIdentifier), void 0 !== t.appType && (r.appType = t.appType), i = {}, [4, this.request({
                                path: "/v1/wechat/metadata",
                                schemaPath: "/v1/wechat/metadata",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return ci(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1WechatMetadataGet = function() {
            return uK(this, arguments, void 0, function(t, n) {
                return void 0 === t && (t = {}), uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1WechatMetadataGetRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1WechatMigrateLuobuRnvMappingPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatMigrateLuobuRnvMappingPost.");
                            return r = {}, void 0 !== t.apiKey && (r.apiKey = t.apiKey), (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wechat/migrate-luobu-rnv-mapping",
                                schemaPath: "/v1/wechat/migrate-luobu-rnv-mapping",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        unionId: t.unionId,
                                        username: t.username
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    unionId: (0, uG.exists)(t, "unionId") ? t.unionId : void 0,
                                    username: (0, uG.exists)(t, "username") ? t.username : void 0,
                                    isSuccess: (0, uG.exists)(t, "isSuccess") ? t.isSuccess : void 0,
                                    reason: (0, uG.exists)(t, "reason") ? t.reason : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1WechatMigrateLuobuRnvMappingPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1WechatMigrateLuobuRnvMappingPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1WechatRobloxAccountCreatePostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatRobloxAccountCreatePost.");
                            return r = {}, void 0 !== t.apiKey && (r.apiKey = t.apiKey), (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wechat/roblox-account-create",
                                schemaPath: "/v1/wechat/roblox-account-create",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        unionId: t.unionId,
                                        openId: t.openId,
                                        displayName: t.displayName,
                                        birthday: void 0 === t.birthday ? void 0 : t.birthday.toISOString(),
                                        username: t.username
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    userId: (0, uG.exists)(t, "userId") ? t.userId : void 0,
                                    isSuccess: (0, uG.exists)(t, "isSuccess") ? t.isSuccess : void 0,
                                    reason: (0, uG.exists)(t, "reason") ? t.reason : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1WechatRobloxAccountCreatePost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1WechatRobloxAccountCreatePostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1WechatSignupwithoutpasswordPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatSignupwithoutpasswordPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wechat/signupwithoutpassword",
                                schemaPath: "/v1/wechat/signupwithoutpassword",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: ca(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return ct(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1WechatSignupwithoutpasswordPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1WechatSignupwithoutpasswordPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1WechatTencentIdGetRaw = function(t) {
            return uK(this, void 0, void 0, function() {
                var n, r, i;
                return uJ(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/wechat/tencent-id",
                                schemaPath: "/v1/wechat/tencent-id",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new uG.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1WechatTencentIdGet = function(t) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1WechatTencentIdGetRaw(t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.v1WechatTokenAuthenticationPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatTokenAuthenticationPost.");
                            return r = {}, void 0 !== t.apiKey && (r.apiKey = t.apiKey), (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wechat/token-authentication",
                                schemaPath: "/v1/wechat/token-authentication",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        openId: t.openId,
                                        accessToken: t.accessToken,
                                        accessTokenExpiry: t.accessTokenExpiry,
                                        refreshToken: t.refreshToken,
                                        refreshTokenExpiry: t.refreshTokenExpiry,
                                        channelId: t.channelId
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return cn(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1WechatTokenAuthenticationPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1WechatTokenAuthenticationPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1WechatVerifyConnectPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatVerifyConnectPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wechat/verify-connect",
                                schemaPath: "/v1/wechat/verify-connect",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: cs(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1WechatVerifyConnectPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1WechatVerifyConnectPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }
    }(uG.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uH(n, t), n.prototype.v1XboxConnectionGetRaw = function(t) {
            return uK(this, void 0, void 0, function() {
                var n, r, i;
                return uJ(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/xbox/connection",
                                schemaPath: "/v1/xbox/connection",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new uG.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    hasConnectedXboxAccount: (0, uG.exists)(t, "hasConnectedXboxAccount") ? t.hasConnectedXboxAccount : void 0,
                                    gamertag: (0, uG.exists)(t, "gamertag") ? t.gamertag : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1XboxConnectionGet = function(t) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1XboxConnectionGetRaw(t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.v1XboxDisconnectPostRaw = function(t) {
            return uK(this, void 0, void 0, function() {
                var n, r, i;
                return uJ(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/xbox/disconnect",
                                schemaPath: "/v1/xbox/disconnect",
                                method: "POST",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new uG.JSONApiResponse(i, function(t) {
                                return cl(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1XboxDisconnectPost = function(t) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1XboxDisconnectPostRaw(t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.v1XboxGetLoginConsecutiveDaysGetRaw = function(t) {
            return uK(this, void 0, void 0, function() {
                var n, r, i;
                return uJ(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/xbox/get-login-consecutive-days",
                                schemaPath: "/v1/xbox/get-login-consecutive-days",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new uG.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    count: (0, uG.exists)(t, "count") ? t.count : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1XboxGetLoginConsecutiveDaysGet = function(t) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1XboxGetLoginConsecutiveDaysGetRaw(t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.v1XboxTranslatePostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.xboxTranslateRequest || void 0 === t.xboxTranslateRequest) throw new uG.RequiredError("xboxTranslateRequest", "Required parameter requestParameters.xboxTranslateRequest was null or undefined when calling v1XboxTranslatePost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/xbox/translate",
                                schemaPath: "/v1/xbox/translate",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        ids: t.ids
                                    }
                                }(t.xboxTranslateRequest)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    users: (0, uG.exists)(t, "Users") ? t.Users.map(cc) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1XboxTranslatePost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1XboxTranslatePostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }
    }(uG.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uH(n, t), n.prototype.v1XboxLiveAccountGetRaw = function(t) {
            return uK(this, void 0, void 0, function() {
                var n, r, i;
                return uJ(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/xbox-live/account",
                                schemaPath: "/v1/xbox-live/account",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new uG.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    userId: (0, uG.exists)(t, "userId") ? t.userId : void 0,
                                    username: (0, uG.exists)(t, "username") ? t.username : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1XboxLiveAccountGet = function(t) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1XboxLiveAccountGetRaw(t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.v1XboxLiveConnectPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1XboxLiveConnectPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/xbox-live/connect",
                                schemaPath: "/v1/xbox-live/connect",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        ctype: t.ctype,
                                        cvalue: t.cvalue,
                                        password: t.password
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return u4(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1XboxLiveConnectPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1XboxLiveConnectPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1XboxLiveConnectVerifyPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uG.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1XboxLiveConnectVerifyPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/xbox-live/connect/verify",
                                schemaPath: "/v1/xbox-live/connect/verify",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        username: t.username,
                                        challengeId: t.challengeId,
                                        verificationToken: t.verificationToken,
                                        actionType: t.actionType
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1XboxLiveConnectVerifyPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1XboxLiveConnectVerifyPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1XboxLiveDisconnectPostRaw = function(t) {
            return uK(this, void 0, void 0, function() {
                var n, r, i;
                return uJ(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/xbox-live/disconnect",
                                schemaPath: "/v1/xbox-live/disconnect",
                                method: "POST",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new uG.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1XboxLiveDisconnectPost = function(t) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1XboxLiveDisconnectPostRaw(t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.v1XboxLiveLoginPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.xboxLoginRequest || void 0 === t.xboxLoginRequest) throw new uG.RequiredError("xboxLoginRequest", "Required parameter requestParameters.xboxLoginRequest was null or undefined when calling v1XboxLiveLoginPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/xbox-live/login",
                                schemaPath: "/v1/xbox-live/login",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        clientTimeStamp: void 0 === t.clientTimeStamp ? void 0 : t.clientTimeStamp.toISOString()
                                    }
                                }(t.xboxLoginRequest)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    newDailyLogin: (0, uG.exists)(t, "newDailyLogin") ? t.newDailyLogin : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1XboxLiveLoginPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1XboxLiveLoginPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, n.prototype.v1XboxLiveSignupPostRaw = function(t, n) {
            return uK(this, void 0, void 0, function() {
                var r, i, a;
                return uJ(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.signupRequest || void 0 === t.signupRequest) throw new uG.RequiredError("signupRequest", "Required parameter requestParameters.signupRequest was null or undefined when calling v1XboxLiveSignupPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/xbox-live/signup",
                                schemaPath: "/v1/xbox-live/signup",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        username: t.username,
                                        password: t.password,
                                        birthday: void 0 === t.birthday ? void 0 : t.birthday.toISOString(),
                                        gender: t.gender,
                                        locale: t.locale,
                                        agreementIds: t.agreementIds,
                                        auditSystemContent: u8(t.auditSystemContent)
                                    }
                                }(t.signupRequest)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uG.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1XboxLiveSignupPost = function(t, n) {
            return uK(this, void 0, void 0, function() {
                return uJ(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1XboxLiveSignupPostRaw(t, n)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }
    }(uG.BaseAPI);
    var cf = t.i(272593);
    new class {
        async logout() {
            await this.authenticationAPI.v1LogoutPost()
        }
        constructor() {
            (0, uF._)(this, "authenticationAPI", void 0), this.authenticationAPI = new cd((0, cf.createClientConfiguration)("auth", "bedev1"))
        }
    };
    let ch = new cd((0, cf.createClientConfiguration)("auth", "bedev1"));
    var cp = t.i(790806),
        cv = t.i(650502),
        cm = t.i(220311);
    let cy = [cm.default.Home, cm.default.RoadMap, cm.default.AvatarAnalytics, cm.default.ShareLinkAnalytics, cm.default.StoreAnalytics, cm.default.Community, cm.default.Notifications, cm.default.Settings, cm.default.SendrNotificationPreferences, cm.default.Preferences, cm.default.Advanced, cm.default.DataCollectionSettings, cm.default.MarketplaceOnboarding, cm.default.FiatPaidAccess, cm.default.PublicPublish, cm.default.DevEx, cm.default.GameTranslation, cm.default.GameStringTranslation],
        cg = t => {
            let {
                provider: n
            } = t, {
                locale: r
            } = (0, oO.useLocalization)();
            return (0, oc.useEffect)(() => {
                null != r && n.loadTranslationResources([...cy], r)
            }, [r, n]), null
        };
    var cb = t.i(921394),
        cw = t.i(814975);
    let cx = t => {
        let {
            children: n
        } = t, {
            user: r
        } = (0, cw.useAuthentication)();
        return (0, v.jsx)(cb.ThemeModeProvider, {
            bedev2BaseUrl: "https://apis.roblox.com",
            currentUser: r,
            children: n
        })
    };
    var cP = t.i(354088),
        cR = t.i(135174);
    let cS = t => {
        let {
            themeElement: n,
            children: r
        } = t, {
            themeMode: i
        } = (0, cb.useThemeMode)();
        return (0, oc.useEffect)(() => {
            if (null == n) return;
            let {
                classList: t
            } = n;
            switch (t.remove("light-theme", "dark-theme", "system-theme"), i) {
                case "light":
                    t.add("light-theme");
                    break;
                case "dark":
                    t.add("dark-theme");
                    break;
                case "system":
                    t.add("system-theme")
            }
        }, [i, n]), (0, v.jsx)(cR.UIThemeProvider, {
            theme: i,
            children: r
        })
    };
    var cT = t.i(709337),
        cE = t.i(512229),
        cq = t.i(215955),
        ck = t.i(692734),
        cA = t.i(118413),
        cC = t.i(479236),
        cI = t.i(964956),
        cj = t.i(109182),
        cL = t.i(157700),
        cO = t.i(523426),
        cN = t.i(239328),
        cD = t.i(954119),
        c_ = t.i(134731),
        cM = t.i(165136),
        cU = t.i(779433),
        cB = t.i(428993),
        cV = t.i(9436),
        cF = t.i(846130),
        cG = t.i(360894),
        cW = t.i(704211),
        cH = t.i(92174),
        cK = t.i(926415),
        cJ = t.i(242002);
    let cz = (0, cL.defineFlag)({
        namespace: "groups",
        name: "isUnifiedUiEnabled",
        defaultValue: !1
    });
    var cQ = t.i(967230),
        cX = t.i(82899),
        c$ = t.i(477797),
        cZ = t.i(100022),
        cY = t.i(494192);
    let c0 = [{
        flag: cO.enhancedAntiCheatAccess,
        metadata: {
            namespace: "anti-cheat",
            name: "enhancedAntiCheatAccess",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: cN.enableUgcFolders,
        metadata: {
            namespace: "avatar-marketplace",
            name: "enableUGCFolders",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cN.enableTaxonomyBasedCreatorDashboard,
        metadata: {
            namespace: "avatar-marketplace",
            name: "enableTaxonomyBasedCreatorDashboard",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cN.enableCreatorShowcases,
        metadata: {
            namespace: "avatar-marketplace",
            name: "enableCreatorShowcases",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cN.isAutoPublishPreferencesEnabled,
        metadata: {
            namespace: "avatar-marketplace",
            name: "isAutoPublishPreferencesEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cD.creatorAnalytics,
        metadata: {
            namespace: "communities",
            name: "CreatorAnalytics",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "group"
        }
    }, {
        flag: c_.isAssetPrivacyOptOutSurveyEnabled,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isAssetPrivacyOptOutSurveyEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: c_.isAssetAccessRequestsEnabled,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isAssetAccessRequestsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: c_.isModelCustomThumbnailUploadEnabled,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isModelCustomThumbnailUploadEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: c_.isAssetDependenciesViewerEnabled,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isAssetDependenciesViewerEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: c_.isCreatorStoreVideoMultipartUploadEnabled,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isCreatorStoreVideoMultipartUploadEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: c_.isPricingEligibilityV2Enabled,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isPricingEligibilityV2Enabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cM.isExperiencePreviewEnabled,
        metadata: {
            namespace: "content-licensing",
            name: "isExperiencePreviewEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: cM.enableIpPlatformLicenseRecommendations,
        metadata: {
            namespace: "content-licensing",
            name: "enableIpPlatformLicenseRecommendations",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cM.isIpLicensingEarningsEnabled,
        metadata: {
            namespace: "content-licensing",
            name: "isIpLicensingEarningsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cM.isImageAttachmentEnabledInLicenseApplication,
        metadata: {
            namespace: "content-licensing",
            name: "isImageAttachmentEnabledInLicenseApplication",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cM.isShowcaseExperiencesEnabled,
        metadata: {
            namespace: "content-licensing",
            name: "isShowcaseExperiencesEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cM.isIgnoreMatchEnabled,
        metadata: {
            namespace: "content-licensing",
            name: "isIgnoreMatchEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cM.isAvatarItemLicensingEnabled,
        metadata: {
            namespace: "content-licensing",
            name: "isAvatarItemLicensingEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cM.isInGameSalesLicensingEnabled,
        metadata: {
            namespace: "content-licensing",
            name: "isInGameSalesLicensingEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cM.isIphInGameSalesAvatarMarketplaceSalesLicenseCreationEnabled,
        metadata: {
            namespace: "content-licensing",
            name: "isIphInGameSalesAvatarMarketplaceSalesLicenseCreationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cU.questionnaireV2Allowlist,
        metadata: {
            namespace: "content-suitability",
            name: "questionnaireV2Allowlist",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cU.questionnaireV2Q1Release,
        metadata: {
            namespace: "content-suitability",
            name: "questionnaireV2Q1Release",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cU.questionnaireSectionStepperEnabled,
        metadata: {
            namespace: "content-suitability",
            name: "questionnaireSectionStepperEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cA.analyticsChartLoadEventstreamEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "analyticsChartLoadEventstreamEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cA.isLimitedAnalyticsAdminMonitoringNavigationEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isLimitedAnalyticsAdminMonitoringNavigationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cA.visibleAssetIdInPersonalizationEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "visibleAssetIdInPersonalizationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cA.isExperimentationTemplatesEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isExperimentationTemplatesEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cA.isExperimentTargetingEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isExperimentTargetingEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: cA.acquisitionMigrationMetricsEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "acquisitionMigrationMetricsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cA.isTargetingConfigsEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isTargetingConfigsEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: cA.isExperimentNullControlValueEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isExperimentNullControlValueEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: cA.isExperimentRolloutEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isExperimentRolloutEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: cA.isGeneralBreakGlassBannerEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "IsGeneralBreakGlassBannerEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cA.isMonetizationBreakGlassBannerEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "IsMonetizationBreakGlassBannerEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cA.isPlayerFeedbackExampleCommentsEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isPlayerFeedbackExampleCommentsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cA.isAnalyticsAssistantChatEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantChatEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cA.isAnalyticsAssistantIssueBannerEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantIssueBannerEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cA.showCreatorRewardsReportingDisclaimer,
        metadata: {
            namespace: "creator-analytics",
            name: "showCreatorRewardsReportingDisclaimer",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cA.isRotraceMetricEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isRotraceMetricEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: cA.isTelemetryMigrationEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isTelemetryMigrationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: cA.showVideoServiceDashboard,
        metadata: {
            namespace: "creator-analytics",
            name: "showVideoServiceDashboard",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cA.isTreemapColorBySiblingProportionEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isTreemapColorBySiblingProportionEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cA.isAssistantChartOverflowMenuEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isAssistantChartOverflowMenuEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cA.isAnalyticsMetricAwareYAxisFormatterEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isAnalyticsMetricAwareYAxisFormatterEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cA.isCustomDashboardsEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isCustomDashboardsEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: cA.isCustomDashboardsLocalStorageEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isCustomDashboardsLocalStorageEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cA.isCustomDashboardsApiBackendEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isCustomDashboardsApiBackendEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: cA.isJourneyEventsEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isJourneyEventsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cA.isClientSessionsEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isClientSessionsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: cA.isEhdResultsEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isEhdResultsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cA.isEhdResultsAlwaysFetched,
        metadata: {
            namespace: "creator-analytics",
            name: "isEhdResultsAlwaysFetched",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cA.isMetricVariantChartStateEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isMetricVariantChartStateEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cB.isRevenueShareAgreementsEnabled,
        metadata: {
            namespace: "creator-business",
            name: "isRevenueShareAgreementsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cB.enableVirtualTransactionsTab,
        metadata: {
            namespace: "creator-business",
            name: "enableVirtualTransactionsTab",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cV.isBadgeDefaultIconEnabled,
        metadata: {
            namespace: "creator-creations",
            name: "isBadgeDefaultIconEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cV.isMomentsUploadEnabled,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsUploadEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cV.isMomentsSitetestUrlParsingEnabled,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsSitetestUrlParsingEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cV.isTextDocumentEnabled,
        metadata: {
            namespace: "creator-creations",
            name: "isTextDocumentEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cV.isMomentsUploadLanguageSelectEnabled,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsUploadLanguageSelectEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cV.isMomentsFeedIdEnabled,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsFeedIdEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cF.enablePlayerSupport,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerSupport",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: cF.enablePlayerHostedEvents,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerHostedEvents",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cF.enablePlayerSupportCreatorTicketReroute,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerSupportCreatorTicketReroute",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cG.creatorRoadmapEnabled,
        metadata: {
            namespace: "creator-roadmap",
            name: "creatorRoadmapEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cW.isCsmExtendedMetricsEnabled,
        metadata: {
            namespace: "creator-services-insights",
            name: "isCsmExtendedMetricsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cH.shouldUseWatermarkFiatCalculation,
        metadata: {
            namespace: "devex",
            name: "shouldUseWatermarkFiatCalculation",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cH.isTaxDocumentationEnabled,
        metadata: {
            namespace: "devex",
            name: "isTaxDocumentationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cK.isBandwidthNetworkTabEnabled,
        metadata: {
            namespace: "engine-networking",
            name: "isBandwidthNetworkTabEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cJ.isHomeAcquisitionSignalsEnabled,
        metadata: {
            namespace: "game-discovery-serving",
            name: "isHomeAcquisitionSignalsEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: cz,
        metadata: {
            namespace: "groups",
            name: "isUnifiedUiEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cQ.isAdsPageRedesignEnabled,
        metadata: {
            namespace: "immersive-ads",
            name: "isAdsPageRedesignEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cQ.isManagedRewardedTabEnabled,
        metadata: {
            namespace: "immersive-ads",
            name: "isManagedRewardedTabEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cX.isLeaderboardConfigsEnabled,
        metadata: {
            namespace: "leaderboards",
            name: "isLeaderboardConfigsEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: c$.mockManagedPricingSummary,
        metadata: {
            namespace: "monetization",
            name: "mockManagedPricingSummary",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: c$.mockManagedPricingEvents,
        metadata: {
            namespace: "monetization",
            name: "mockManagedPricingEvents",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: c$.mockHardCodedPrices,
        metadata: {
            namespace: "monetization",
            name: "mockHardCodedPrices",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: c$.mockManagedPricingProductWrites,
        metadata: {
            namespace: "monetization",
            name: "mockManagedPricingProductWrites",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: c$.isProductArchiveEnabled,
        metadata: {
            namespace: "monetization",
            name: "isProductArchiveEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: c$.mockShopItemsExternalEligibility,
        metadata: {
            namespace: "monetization",
            name: "mockShopItemsExternalEligibility",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cZ.enablePayoutWatermarkContributions,
        metadata: {
            namespace: "payouts",
            name: "enablePayoutWatermarkContributions",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "group"
        }
    }, {
        flag: cY.presetChatEnabled,
        metadata: {
            namespace: "preset-chat",
            name: "presetChatEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }];
    var c1 = t.i(745873);
    let c2 = null,
        c4 = (0, cj.default)(() => t.A(73576).then(t => {
            let {
                FloatingDraggableWidget: n
            } = t;
            return n
        }), {
            loadableGenerated: {
                modules: [21157]
            },
            ssr: !1
        }),
        c3 = () => {
            let t = (0, ol.useRouter)(),
                n = (0, c1.useCurrentGroup)(),
                [r, i] = (0, oc.useState)(!1);
            (0, oc.useEffect)(() => {
                let t = !0;
                return async function() {
                    try {
                        null != c2 || (c2 = (0, cL.initFlags)({
                            applicationId: "creator-dashboard",
                            baseUrl: "https://apis.roblox.com"
                        }).enableOverrides({
                            mode: "authorized-only",
                            useDefault: !0
                        }));
                        let n = await c2;
                        t && i(n)
                    } catch (n) {
                        t && i(!1)
                    }
                }(), () => {
                    t = !1
                }
            }, []);
            let a = (0, oc.useMemo)(() => {
                let {
                    id: r
                } = t.query, i = "string" == typeof r ? parseInt(r, 10) : NaN;
                return {
                    ...Number.isNaN(i) ? {} : {
                        universeId: i
                    },
                    ...n ? {
                        groupId: n.id
                    } : {}
                }
            }, [n, t.query]);
            return r ? (0, v.jsx)(c4, {
                flags: c0,
                contexts: a
            }) : null
        };
    var c6 = t.i(911502);
    let c8 = t => {
        let {
            providers: n,
            children: r
        } = t, i = r;
        for (let t = n.length - 1; t >= 0; t -= 1) i = oc.default.cloneElement(n[t], {}, i);
        return (0, v.jsx)(v.Fragment, {
            children: i
        })
    };
    var c5 = t.i(893949),
        c7 = t.i(413019),
        c9 = t.i(758835),
        le = t.i(823062);
    let lt = t => {
        let {
            children: n,
            unifiedLogger: r,
            pageLoggerConfig: i
        } = t, a = null != r ? r : cq.default, {
            pathname: o
        } = (0, ol.useRouter)(), s = (0, oc.useMemo)(() => {
            if (o) return "".concat(window.location.origin).concat(o)
        }, [o]);
        return (0, v.jsx)(le.UnifiedLoggerProvider, {
            unifiedLogger: a,
            pageLoggerConfig: i,
            path: s,
            children: n
        })
    };
    var ln = t.i(681559),
        lr = t.i(272749),
        li = t.i(252842);
    let la = ["https://vitals.vercel-insights.com/v1/vitals"];
    var lo = t.i(120654);
    let ls = t => {
        let {
            children: n
        } = t, {
            user: r
        } = (0, cw.useAuthentication)(), i = (0, oc.useRef)(window.aegis);
        (0, oc.useEffect)(() => {
            i.current && i.current.setConfig({
                beforeReport: t => !(t.msg && la.some(n => t.msg.includes(n))),
                api: {
                    retCodeHandler(t, n, r) {
                        let i = !(r.status === li.StatusCodes.FORBIDDEN && r.headers.has("x-csrf-token") || r.status === li.StatusCodes.OK || r.status === li.StatusCodes.ACCEPTED),
                            a = "unknown";
                        try {
                            let n = JSON.parse(t);
                            n.errors && n.errors.length > 0 && (a = n.errors[0].code)
                        } catch (t) {
                            a = "unknown"
                        }
                        return {
                            isErr: i && 0 !== a,
                            retCode: a
                        }
                    }
                },
                uin: null == r ? void 0 : r.id
            })
        }, [r, i]);
        let a = (0, oc.useMemo)(() => ({
            info: () => {},
            error: () => {},
            captureError: () => {},
            reportEvent: () => {}
        }), [i]);
        return (0, v.jsx)(lo.default.Provider, {
            value: a,
            children: n
        })
    };
    var lu = t.i(37819),
        lc = t.i(431346),
        ll = t.i(881670);
    let ld = "".concat("".concat("https://assets.create.roblox.com/21d2de6ec5daf6e72cfbc72bcb749b555b548185/assets", "/opengraph"), "/global_og_image.png"),
        lf = (0, oO.withTranslation)(t => {
            let {
                openGraphMetadata: {
                    title: n,
                    description: r,
                    defaultLocale: i
                }
            } = t, {
                translate: a
            } = (0, oO.useTranslation)(), o = new URL(ld, "https://create.roblox.com").href, s = (0, lc.useTheme)();
            return (0, v.jsxs)(lu.HubMeta, {
                seoTitle: a("Label.CreatorDashboard"),
                ogTitle: n,
                description: r,
                ogImage: o,
                children: [(0, v.jsx)("link", {
                    rel: "icon",
                    type: "image/svg+xml",
                    href: "https://cdn.foundation.".concat("roblox.com", "/current/roblox-tilt/favicon.svg")
                }), (0, v.jsx)("link", {
                    rel: "icon",
                    href: "https://cdn.foundation.".concat("roblox.com", "/current/roblox-tilt/favicon.ico"),
                    sizes: "48x48"
                }), (0, v.jsx)("link", {
                    rel: "apple-touch-icon",
                    sizes: "180x180",
                    href: "https://cdn.foundation.".concat("roblox.com", "/current/roblox-tilt/apple-touch-icon.png")
                }), (0, v.jsx)("meta", {
                    name: "theme-color",
                    content: s.palette.surface[0]
                }, "theme-color"), (0, v.jsx)("meta", {
                    name: "viewport",
                    content: "minimum-scale=1, initial-scale=1, width=device-width"
                }), (0, v.jsx)("meta", {
                    name: "zd-site-verification",
                    content: "8ou4bshfpgbc1pk5x0qqt"
                }), (0, v.jsx)("meta", {
                    property: "og:url",
                    content: "https://create.roblox.com"
                }, "og:url"), (0, v.jsx)("meta", {
                    property: "og:type",
                    content: "website"
                }, "og:type"), (0, v.jsx)("meta", {
                    property: "og:locale",
                    content: i
                }, "og:locale")]
            })
        }, [ll.TranslationNamespace.Features]),
        lh = (0, oO.withTranslation)(t => {
            let {
                children: n
            } = t, {
                open: r,
                dialog: i
            } = (0, c5.default)();
            return (0, v.jsxs)(oL.NavigationStudioLauncherProvider, {
                openStudio: r,
                children: [n, i]
            })
        }, [ll.TranslationNamespace.Creations]);
    var lp = t.i(287184),
        lv = t.i(157310),
        lm = t.i(725074),
        ly = t.i(182012),
        lg = t.i(838775),
        lb = t.i(678547),
        lw = t.i(329781),
        lx = t.i(339724),
        lP = t.i(262695),
        lR = t.i(734341),
        lS = t.i(685104),
        lS = lS,
        lT = t.i(722380),
        lE = t.i(286840),
        lq = t.i(583555);
    t.i(427542), t.i(937793);
    var lk = t.i(133017);
    let lA = lR.$constructor("ZodMiniType", (t, n) => {
            if (!t._zod) throw Error("Uninitialized schema in ZodMiniType.");
            lT.$ZodType.init(t, n), t.def = n, t.type = n.type, t.parse = (n, r) => lk.parse(t, n, r, {
                callee: t.parse
            }), t.safeParse = (n, r) => lk.safeParse(t, n, r), t.parseAsync = async (n, r) => lk.parseAsync(t, n, r, {
                callee: t.parseAsync
            }), t.safeParseAsync = async (n, r) => lk.safeParseAsync(t, n, r), t.check = function() {
                for (var r, i = arguments.length, a = Array(i), o = 0; o < i; o++) a[o] = arguments[o];
                return t.clone({
                    ...n,
                    checks: [...null != (r = n.checks) ? r : [], ...a.map(t => "function" == typeof t ? {
                        _zod: {
                            check: t,
                            def: {
                                check: "custom"
                            },
                            onattach: []
                        }
                    } : t)]
                }, {
                    parent: !0
                })
            }, t.with = t.check, t.clone = (n, r) => lE.clone(t, n, r), t.brand = () => t, t.register = (n, r) => (n.add(t, r), t), t.apply = n => n(t)
        }),
        lC = lR.$constructor("ZodMiniString", (t, n) => {
            lT.$ZodString.init(t, n), lA.init(t, n)
        });

    function lI(t) {
        return lq._string(lC, t)
    }(t, n) => {
        lT.$ZodStringFormat.init(t, n), lC.init(t, n)
    }, (t, n) => {
        lT.$ZodBigInt.init(t, n), lA.init(t, n)
    };
    let lj = lR.$constructor("ZodMiniUnknown", (t, n) => {
            lT.$ZodUnknown.init(t, n), lA.init(t, n)
        }),
        lL = lR.$constructor("ZodMiniArray", (t, n) => {
            lT.$ZodArray.init(t, n), lA.init(t, n)
        });

    function lO(t, n) {
        return new lL({
            type: "array",
            element: t,
            ...lE.normalizeParams(n)
        })
    }
    let lN = lR.$constructor("ZodMiniObject", (t, n) => {
        lT.$ZodObject.init(t, n), lA.init(t, n), lE.defineLazy(t, "shape", () => n.shape)
    });

    function lD(t, n) {
        return new lN({
            type: "object",
            shape: null != t ? t : {},
            ...lE.normalizeParams(n)
        })
    }
    let l_ = lR.$constructor("ZodMiniUnion", (t, n) => {
            lT.$ZodUnion.init(t, n), lA.init(t, n)
        }),
        lM = lR.$constructor("ZodMiniRecord", (t, n) => {
            lT.$ZodRecord.init(t, n), lA.init(t, n)
        }),
        lU = lR.$constructor("ZodMiniLiteral", (t, n) => {
            lT.$ZodLiteral.init(t, n), lA.init(t, n)
        });

    function lB(t, n) {
        return new lU({
            type: "literal",
            values: Array.isArray(t) ? t : [t],
            ...lE.normalizeParams(n)
        })
    }
    let lV = lR.$constructor("ZodMiniOptional", (t, n) => {
        lT.$ZodOptional.init(t, n), lA.init(t, n)
    });

    function lF(t) {
        return new lV({
            type: "optional",
            innerType: t
        })
    }(t, n) => {
        lT.$ZodPipe.init(t, n), lA.init(t, n)
    };
    let lG = lR.$constructor("ZodMiniCustom", (t, n) => {
        lT.$ZodCustom.init(t, n), lA.init(t, n)
    });

    function lW(t) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        return lq._refine(lG, t, n)
    }
    lq.describe, lq.meta;
    var lH = t.i(694257),
        lK = t.i(888379),
        lJ = t.i(635710),
        lz = t.i(919448),
        lQ = (0, oc.createContext)(void 0),
        lX = t => {
            let {
                config: n,
                children: r
            } = t;
            return (0, v.jsx)(lQ.Provider, {
                value: n,
                children: r
            })
        },
        l$ = () => {
            let t = (0, oc.useContext)(lQ);
            if (!t) throw Error("useNotApprovedUIConfig must be used within a NotApprovedUIProvider");
            return t
        },
        lZ = ((i = lZ || {}).AccountReactivationPageRendered = "accountReactivationPageRendered", i.PageRendered = "pageRendered", i.UnmappedViolationKey = "unmappedViolationKey", i.CheckboxChecked = "checkboxChecked", i.LogoutClicked = "logoutClicked", i.ReactivateClicked = "reactivateClicked", i.ParentVerificationClicked = "parentVerificationClicked", i.EmailVerificationClicked = "emailVerificationClicked", i.TermsOfUseClicked = "termsOfUseClicked", i.AppealsProcessClicked = "appealsProcessClicked", i.CommunityGuidelineClicked = "communityGuidelineClicked", i.UGCGuidelinesClicked = "ugcGuidelinesClicked", i.AppealsPortalClicked = "appealsPortalClicked", i.ContinueClicked = "continueClicked", i.BackClicked = "backClicked", i.SecondChanceReactivateClicked = "secondChanceReactivateClicked", i.MissingTranslation = "missingTranslation", i.Error = "error", i.VerificationRedirectRendered = "verificationRedirectRendered", i.AccountReactivationRedirectRendered = "accountReactivationRedirectRendered", i),
        lY = ((a = lY || {}).NotApprovedPage = "NotApprovedPageV2", a);

    function l0() {
        let {
            sendAnalyticsEvent: t,
            platform: n,
            readOnly: r
        } = l$();
        return (0, oc.useCallback)((i, a) => {
            null != r && r || t({
                eventName: "NotApprovedPageEvent",
                context: "NotApprovedPageV2",
                properties: {
                    eventType: i,
                    timestamp: Date.now(),
                    platform: n,
                    ...a
                }
            })
        }, [t, n, r])
    }
    var l1 = "UserSafety.NotApprovedPage.UserID",
        l2 = ((o = l2 || {}).Warn = "Warn", o.Delete = "Delete", o.Hour1 = "Ban 1 Hour", o.Hour6 = "Ban 6 Hours", o.Day1 = "Ban 1 Day", o.Day3 = "Ban 3 Days", o.Day7 = "Ban 7 Days", o.Day14 = "Ban 14 Days", o.Day30 = "Ban 30 Days", o.Day60 = "Ban 60 Days", o.Month6 = "Ban 6 Months", o.Year1 = "Ban 1 Year", o),
        l4 = {
            "Ban 1 Hour": "Heading.SuspendedOneHour",
            "Ban 6 Hours": "Heading.SuspendedSixHours",
            "Ban 1 Day": "Heading.SuspendedOneDay",
            "Ban 3 Days": "Heading.SuspendedThreeDays",
            "Ban 7 Days": "Heading.SuspendedSevenDays",
            "Ban 14 Days": "Heading.Suspended14Days",
            "Ban 30 Days": "Heading.SuspendedThirtyDays",
            "Ban 60 Days": "Heading.SuspendedSixtyDays",
            "Ban 6 Months": "Heading.SuspendedSixMonths",
            "Ban 1 Year": "Heading.Suspended1Year",
            Warn: "Heading.Warning",
            Delete: "Heading.Banned"
        },
        l3 = {
            "Label.Type.Avatar": "Label.TypePlural.Avatar",
            "Label.Type.Audio": "Label.TypePlural.Audio",
            "Label.Type.AvatarAccessory": "Label.TypePlural.AvatarAccessory",
            "Label.Type.Bundle": "Label.TypePlural.Bundle",
            "Label.Type.Chat": "Label.TypePlural.Chat",
            "Label.Type.CommerceProduct": "Label.TypePlural.CommerceProduct",
            "Label.Type.Experience": "Label.TypePlural.Experience",
            "Label.Type.Game": "Label.TypePlural.Game",
            "Label.Type.Image": "Label.TypePlural.Image",
            "Label.Type.Look": "Label.TypePlural.Look",
            "Label.Type.Mesh": "Label.TypePlural.Mesh",
            "Label.Type.Model": "Label.TypePlural.Model",
            "Label.Type.Plugin": "Label.TypePlural.Plugin",
            "Label.Type.Video": "Label.TypePlural.Video",
            "Label.Type.Voice": "Label.TypePlural.Voice"
        },
        l6 = "Email";

    function l8(t, n, r) {
        if (r === l6 || "VPC" === r) return !0;
        let i = new Date(n) < new Date;
        return "Warn" === t || "Delete" !== t && i
    }
    var l5 = (0, oc.createContext)(void 0),
        l7 = t => {
            var n, r;
            let {
                pages: i,
                unmappedViolationKeys: a,
                hasEducationalPages: o,
                commutationEligibility: s,
                children: u
            } = t, [c, l] = (0, oc.useState)(0), [d, f] = (0, oc.useState)(!1), h = null != (n = null == (r = i[c]) ? void 0 : r.pageName) ? n : "unknown", p = i.length, m = 0 === c, y = c === p - 1, g = (0, oc.useMemo)(() => {
                var t;
                return null != (t = null == s ? void 0 : s.educational_pass_eligible) && t
            }, [s]), b = (0, oc.useCallback)(() => {
                c < p - 1 && (f(!0), l(t => t + 1))
            }, [c, p]), w = (0, oc.useCallback)(() => {
                c > 0 && l(t => t - 1)
            }, [c]), x = (0, oc.useCallback)(() => {
                if (p <= 1 || "second-chance-intro" === h || "intro" === h) return 0;
                let t = p - 1,
                    n = c;
                return (t -= !!g, n -= !!g, t <= 0) ? 0 : Math.round(n / t * 100)
            }, [c, p, h, g]), P = (0, oc.useMemo)(() => {
                var t, n, r;
                return {
                    currentPage: c,
                    currentPageName: h,
                    totalPages: p,
                    goToNextPage: b,
                    goToPreviousPage: w,
                    isFirstPage: m,
                    isLastPage: y,
                    getProgress: x,
                    hasEducationalPages: o,
                    currentPageConfigs: null != (t = null == (n = i[c]) ? void 0 : n.pageItems) ? t : [],
                    CurrentCtaComponent: null == (r = i[c]) ? void 0 : r.CtaComponent,
                    unmappedViolationKeys: a,
                    hasNavigatedForward: d
                }
            }, [c, h, p, b, w, m, y, x, i, o, a, d]);
            return (0, v.jsx)(l5.Provider, {
                value: P,
                children: u
            })
        },
        l9 = () => {
            let t = (0, oc.useContext)(l5);
            if (!t) throw Error("usePageNavigation must be used within PageNavigationProvider");
            return t
        },
        de = t => {
            let {
                punishmentData: n,
                commutationEligibility: r
            } = t, {
                isFirstPage: i,
                currentPageConfigs: a,
                currentPageName: o
            } = l9(), s = a.map(t => {
                if (!t.getIsVisible(n, o, r)) return null;
                let i = t.renderComponent;
                return (0, v.jsx)("div", {
                    children: (0, v.jsx)(i, {
                        punishmentData: n
                    })
                }, t.configName)
            }).filter(Boolean);
            return (0, v.jsx)("div", {
                className: "flex flex-col ".concat(i ? "gap-xlarge" : "gap-[36px]"),
                children: s
            })
        },
        dt = () => {
            let t = l$().translate,
                {
                    onLogout: n
                } = l$(),
                r = l0(),
                [i, a] = (0, oc.useState)(!1),
                o = (0, ly.useMutation)({
                    mutationFn: async () => {
                        await n()
                    },
                    onMutate: () => {
                        a(!0), r("logoutClicked")
                    },
                    onError: t => {
                        let n = t instanceof Error ? t.message : "Unknown error";
                        r("error", {
                            additionalInfo: "headerPopoverLogout: Error logging out - ".concat(n)
                        }), a(!1)
                    },
                    retry: 0
                });
            return (0, v.jsxs)(lg.Popover, {
                children: [(0, v.jsx)(lg.PopoverTrigger, {
                    asChild: !0,
                    children: (0, v.jsx)(lx.IconButton, {
                        icon: "icon-filled-three-dots-vertical",
                        ariaLabel: t("Label.OpenMenu"),
                        variant: "Utility",
                        size: "Medium"
                    })
                }), (0, v.jsx)(lg.PopoverContent, {
                    side: "bottom",
                    align: "end",
                    ariaLabel: t("Label.MenuContent"),
                    children: (0, v.jsx)(lb.Menu, {
                        size: "Medium",
                        children: (0, v.jsx)(lb.MenuItem, {
                            value: "one",
                            title: t("Action.LogOut"),
                            onSelect: () => {
                                o.mutate()
                            },
                            disabled: i,
                            trailing: i ? (0, v.jsx)(lw.ProgressCircle, {
                                size: "Small",
                                ariaLabel: t("Label.LogoutProgress"),
                                variant: "Indeterminate"
                            }) : void 0
                        })
                    })
                })]
            })
        },
        dn = () => {
            let t = l$().translate,
                {
                    getProgress: n
                } = l9(),
                r = n();
            return (0, v.jsx)(lP.ProgressBar, {
                value: r,
                ariaLabel: t("Label.PageProgress"),
                style: {
                    visibility: 0 === r ? "hidden" : "visible"
                }
            })
        },
        dr = () => {
            let t = l$().translate,
                {
                    goToPreviousPage: n
                } = l9();
            return (0, v.jsx)(lx.IconButton, {
                size: "Medium",
                variant: "Utility",
                icon: "icon-filled-chevron-large-left",
                onClick: n,
                "data-testid": "back-button",
                className: "margin-left-[-12px]",
                ariaLabel: t("Action.Back")
            })
        },
        di = t => {
            var n;
            let {
                punishmentData: r
            } = t, {
                isFirstPage: i,
                totalPages: a
            } = l9(), {
                readOnly: o
            } = l$(), s = l$().translate, {
                punishmentTypeDescription: u,
                verificationCategory: c
            } = r, l = c ? s("Heading.Suspended") : s(null != (n = l4[u]) ? n : "") || s("Heading.Suspended");
            return i ? (0, v.jsx)("div", {
                "data-testid": "not-approved-dialog-header",
                children: (0, v.jsxs)("div", {
                    className: "flex justify-between items-center gap-medium",
                    children: [(0, v.jsxs)("div", {
                        className: "flex gap-small items-center padding-y-medium",
                        children: [(0, v.jsx)(lm.Icon, {
                            name: "Delete" === u ? "icon-regular-circle-slash" : "icon-regular-triangle-exclamation",
                            size: "Large",
                            className: "Warn" !== u || c ? "content-system-alert" : "content-system-warning"
                        }), (0, v.jsx)("span", {
                            className: "text-heading-small",
                            children: l
                        })]
                    }), !o && (0, v.jsx)(dt, {})]
                })
            }) : (0, v.jsx)("div", {
                "data-testid": "not-approved-dialog-header",
                children: (0, v.jsxs)("div", {
                    className: "flex flex-col gap-large items-start",
                    children: [(0, v.jsx)(dr, {}), a > 2 && (0, v.jsx)(dn, {})]
                })
            })
        },
        da = t => {
            let {
                punishmentData: n,
                setIsDialogOpen: r
            } = t, {
                CurrentCtaComponent: i,
                currentPageName: a
            } = l9();
            return i ? (0, v.jsx)("div", {
                className: "flex flex-col gap-large justify-between medium:items-end",
                children: (0, v.jsx)(i, {
                    punishmentData: n,
                    setIsDialogOpen: r
                }, a)
            }) : null
        },
        ds = t => {
            let {
                readOnly: n
            } = t;
            return (0, v.jsxs)("div", {
                className: "shrink-0 flex flex-row justify-between items-center gap-medium",
                children: [(0, v.jsx)("div", {
                    className: "bg-shift-100 height-[45px] width-[300px] max-width-[85%] radius-medium"
                }), !n && (0, v.jsx)("div", {
                    className: "bg-shift-100 height-[35px] width-[35px] radius-medium shrink-0"
                })]
            })
        },
        du = () => (0, v.jsxs)("div", {
            className: "flex flex-col gap-large",
            "data-testid": "loading-skeleton-content",
            children: [(0, v.jsx)("div", {
                className: "bg-shift-100 height-[20px] width-full max-width-[450px] radius-medium"
            }), (0, v.jsxs)("div", {
                className: "flex flex-col gap-medium",
                children: [(0, v.jsx)("div", {
                    className: "bg-shift-100 height-[30px] width-[125px] radius-medium"
                }), (0, v.jsx)("div", {
                    className: "bg-shift-100 height-[120px] width-full radius-medium"
                })]
            }), (0, v.jsxs)("div", {
                className: "flex flex-col gap-medium",
                children: [(0, v.jsx)("div", {
                    className: "bg-shift-100 height-[30px] width-[200px] radius-medium"
                }), (0, v.jsx)("div", {
                    className: "bg-shift-100 height-[160px] width-full radius-medium"
                })]
            })]
        }),
        dc = () => (0, v.jsx)("div", {
            className: "shrink-0 flex width-full justify-end medium:flex-row",
            children: (0, v.jsx)("div", {
                className: "bg-shift-100 height-[40px] width-full medium:width-[90px] radius-medium"
            })
        }),
        dl = () => {
            let {
                readOnly: t
            } = l$();
            return t ? null : (0, v.jsx)("div", {
                className: "shrink-0 flex justify-end items-center",
                children: (0, v.jsx)(dt, {})
            })
        },
        dd = t => {
            let {
                error: n
            } = t, r = l$().translate;
            return n && console.error(n), (0, v.jsx)("div", {
                className: "flex flex-col height-full min-height-0",
                children: (0, v.jsxs)("div", {
                    className: "grow-1 flex flex-col items-center justify-center gap-medium padding-xxlarge radius-medium bg-surface-100 width-full min-height-[225px]",
                    children: [(0, v.jsx)(lm.Icon, {
                        name: "icon-regular-triangle-exclamation",
                        size: "XLarge"
                    }), (0, v.jsx)("span", {
                        className: "text-body-large content-emphasis margin-none",
                        children: r("Heading.Error")
                    })]
                })
            })
        };
    lR.config(lS.en());
    var df = lD({
            type: lB("platform"),
            displayMeta: lF(lD({
                lowercaseKey: lI().check(lH.minLength(1)),
                capitalizedKey: lI().check(lH.minLength(1)),
                icon: lI()
            })),
            elements: lF(lO(lq._unknown(lj)))
        }),
        dh = new l_({
            type: "union",
            options: [lD({
                type: lB("text"),
                labelKey: lI(),
                text: lF(lI()),
                textKey: lF(lI()),
                textKeyParameters: lF((s = lI(), new lM((u = lI()) && u._zod ? {
                    type: "record",
                    keyType: s,
                    valueType: u,
                    ...lE.normalizeParams(void 0)
                } : {
                    type: "record",
                    keyType: lI(),
                    valueType: s,
                    ...lE.normalizeParams(u)
                })))
            }).check(lW(t => void 0 !== t.text || void 0 !== t.textKey, {
                message: "Either 'text' or 'textKey' must be provided"
            }), lW(t => !t.textKeyParameters || void 0 !== t.textKey, {
                message: "'textKeyParameters' requires 'textKey' to be provided"
            })), lD({
                type: lB("image"),
                labelKey: lI(),
                url: lI(),
                altLabelKey: lF(lI())
            })],
            ...lE.normalizeParams(void 0)
        }),
        dp = t => {
            let n = dh.safeParse(t);
            return !!n.success || (console.warn("Failed to parse platform element: ", n.error), !1)
        },
        dv = lD({
            ...df.shape,
            elements: lF(lO(dh))
        }),
        dm = t => {
            let n = t.violation;
            if (!n) return !1;
            let {
                evidence: r
            } = n;
            if (!r || !(t => {
                    if ("platform" !== t.type) return !1;
                    let n = df.safeParse(t);
                    return !!n.success || (console.warn("Failed to parse platform evidence: ", n.error), !1)
                })(r)) return !1;
            let i = null == (a = r.elements) ? void 0 : a.filter(t => dp(t));
            if (!i || 0 === i.length) return !1;
            var a, o = {
                ...r,
                elements: i
            };
            if ("platform" !== o.type) return !1;
            let s = dv.safeParse(o);
            return !!s.success || (console.warn("Failed to parse platform evidence fully typed: ", s.error), !1)
        },
        dy = (0, oc.createContext)(void 0),
        dg = t => {
            let {
                enableIxp: n = !1,
                children: r
            } = t, i = l$().translate, {
                data: a,
                isLoading: o,
                error: s
            } = (() => {
                let {
                    httpGet: t,
                    userModerationApiUrl: n
                } = l$();
                return (0, lv.useQuery)({
                    queryKey: ["not-approved-data"],
                    queryFn: () => t("".concat(n, "/v1/not-approved")),
                    staleTime: 1 / 0
                })
            })(), {
                data: u,
                isLoading: c,
                isFetching: l
            } = (t => {
                let {
                    enabled: n
                } = t, {
                    ixp: r
                } = l$();
                return (0, lv.useQuery)({
                    queryKey: ["ixp/".concat(l1)],
                    queryFn: async () => {
                        if (!r) return {};
                        try {
                            return await r.fetchLayer(l1)
                        } catch (t) {
                            return {}
                        }
                    },
                    staleTime: 1 / 0,
                    enabled: n && !!r
                })
            })({
                enabled: n
            }), {
                data: d,
                isLoading: f
            } = (() => {
                let {
                    httpGet: t,
                    apiGatewayUrl: n
                } = l$();
                return (0, lv.useQuery)({
                    queryKey: ["commutation-eligibility"],
                    queryFn: async () => {
                        try {
                            return await t("".concat(n, "/moderation-appeal-service/v2/consequence-commutation-eligibility"))
                        } catch (t) {
                            return {
                                educational_pass_eligible: !1
                            }
                        }
                    },
                    staleTime: 3e5
                })
            })(), h = (null == a ? void 0 : a.punishedUserId) ? a : void 0, p = (0, oc.useMemo)(() => {
                let t = new Set,
                    n = new Set;
                if ((null == h ? void 0 : h.violation) && dm(h)) h.violation.abuseTypeTranslationKeys.forEach(r => {
                    t.add(i(r)), n.add(r)
                });
                else {
                    var r;
                    null == h || null == (r = h.badUtterances) || r.forEach(r => {
                        t.add(i(r.labelTranslationKey)), n.add(r.labelTranslationKey)
                    })
                }
                return {
                    translatedReasons: [...t].filter(Boolean),
                    untranslatedReasons: [...n].filter(Boolean)
                }
            }, [h, i]), m = o || n && c && l || f, y = (0, oc.useMemo)(() => ({
                isLoading: m,
                error: s,
                punishmentData: h,
                violationReasons: p,
                ixpData: u,
                commutationEligibility: d
            }), [m, s, h, p, u, d]);
            return (0, v.jsx)(dy.Provider, {
                value: y,
                children: r
            })
        },
        db = () => {
            let t = (0, oc.useContext)(dy);
            if (!t) throw Error("useNotApprovedPagePunishment must be used within a NotApprovedPagePunishmentProvider");
            return t
        },
        dw = (0, oc.createContext)(void 0),
        dx = t => {
            let {
                children: n
            } = t, {
                currentPage: r,
                currentPageName: i,
                unmappedViolationKeys: a
            } = l9(), o = l0(), s = (0, oc.useRef)(Date.now()), u = (0, oc.useRef)(r), c = (0, oc.useRef)(i), l = (0, oc.useRef)(!0), d = () => Date.now() - s.current;
            (0, oc.useEffect)(() => {
                a.forEach(t => {
                    o("unmappedViolationKey", {
                        unmappedViolationKey: t
                    })
                })
            }, [a]), (0, oc.useEffect)(() => {
                if (l.current) {
                    l.current = !1;
                    return
                }
                let t = d();
                o(r > u.current ? "continueClicked" : "backClicked", {
                    pageName: c.current,
                    timeOnPageMs: t
                }), s.current = Date.now(), u.current = r, c.current = i
            }, [r, i]);
            let f = (0, oc.useCallback)((t, n) => {
                    let r = d();
                    o(t, {
                        ...n,
                        pageName: i,
                        timeOnPageMs: r
                    })
                }, [i, o]),
                h = (0, oc.useMemo)(() => ({
                    sendPageEvent: f
                }), [f]);
            return (0, v.jsx)(dw.Provider, {
                value: h,
                children: n
            })
        },
        dP = () => {
            let t = (0, oc.useContext)(dw);
            if (!t) throw Error("usePageAnalytics must be used within PageAnalyticsProvider");
            return t
        },
        dR = {
            ruleTitle: "Heading.RuleExplanation.Dating",
            ruleSubtitle: "SubHeading.RuleExplanation.Dating",
            ruleDescription: "Description.RuleExplanation.Dating",
            importanceTitle: "Heading.RuleImportance",
            importanceDescription: "Description.RuleImportance.Dating",
            policyKey: "dating"
        },
        dS = {
            ruleTitle: "Heading.RuleExplanation.BullyingHarassmentDiscrimination",
            ruleSubtitle: "SubHeading.RuleExplanation.BullyingHarassmentDiscrimination",
            ruleDescription: "Description.RuleExplanation.BullyingHarassmentDiscrimination",
            importanceTitle: "Heading.RuleImportance",
            importanceDescription: "Description.RuleImportance.BullyingHarassmentDiscrimination",
            policyKey: "bullying-harassment-discrimination"
        },
        dT = {
            ruleTitle: "Heading.RuleExplanation.MisusingRobloxSystems",
            ruleSubtitle: "SubHeading.RuleExplanation.MisusingRobloxSystems",
            ruleDescription: "Description.RuleExplanation.MisusingRobloxSystems",
            ruleDescriptionBullets: "Description.RuleExplanation.Bullets.MisusingRobloxSystems",
            importanceTitle: "Heading.RuleImportance",
            importanceDescription: "Description.RuleImportance.MisusingRobloxSystems",
            policyKey: "misusing-roblox-systems"
        },
        dE = {
            ruleTitle: "Heading.RuleExplanation.PII",
            ruleSubtitle: "SubHeading.RuleExplanation.PII",
            ruleDescription: "Description.RuleExplanation.PII",
            ruleDescriptionBullets: "Description.RuleExplanation.Bullets.PII",
            importanceTitle: "Heading.RuleImportance",
            importanceDescription: "Description.RuleImportance.PII",
            policyKey: "pii"
        },
        dq = {
            ruleTitle: "Heading.RuleExplanation.SSHAndIllegalRegulatedActivities",
            ruleSubtitle: "SubHeading.RuleExplanation.SSHAndIllegalRegulatedActivities",
            ruleDescription: "Description.RuleExplanation.SSHAndIllegalRegulatedActivities",
            ruleDescriptionBullets: "Description.RuleExplanation.Bullets.SSHAndIllegalRegAct",
            importanceTitle: "Heading.RuleImportance",
            importanceDescription: "Description.RuleImportance.SSHAndIllegalRegulatedActivities",
            policyKey: "ssh-and-illegal-regulated-activities"
        },
        dk = {
            "Label.AbuseType.CheatandExploits": dT,
            "Label.AbuseType.ContestsandSweepstakes": dq,
            "Label.AbuseType.Dating": dR,
            "Label.AbuseType.DirectingUsersOffPlatform": {
                ruleTitle: "Heading.RuleExplanation.DirectingUsersOffPlatform",
                ruleSubtitle: "SubHeading.RuleExplanation.DirectingUsersOffPlatform",
                ruleDescription: "Description.RuleExplanation.DirectingUsersOffPlatform",
                importanceTitle: "Heading.RuleImportance",
                importanceDescription: "Description.RuleImportance.DirectingUsersOffPlatform",
                policyKey: "directing-users-off-platform"
            },
            "Label.AbuseType.DiscriminatoryContent": dS,
            "Label.AbuseType.DisruptiveAudio": dT,
            "Label.AbuseType.EncouragingDangerousBehavior": dq,
            "Label.AbuseType.ExtortionandBlackmail": dS,
            "Label.AbuseType.Harassment": dS,
            "Label.AbuseType.IllegalandRegulatedContent": dq,
            "Label.AbuseType.Impersonation": dS,
            "Label.AbuseType.IrlDangerousActivities": dq,
            "Label.AbuseType.MisusingRobloxSystems": dT,
            "Label.AbuseType.OffPlatformSpeechandBehavior": dS,
            "Label.AbuseType.PrivacyAskingforPII": dE,
            "Label.AbuseType.PrivacyGivingPII": dE,
            "Label.AbuseType.RealLifeThreats": dS,
            "Label.AbuseType.Scamming": dT,
            "Label.AbuseType.SexualContent": dR,
            "Label.AbuseType.Spam": {
                ruleTitle: "Heading.RuleExplanation.Spam",
                ruleSubtitle: "SubHeading.RuleExplanation.Spam",
                ruleDescription: "Description.RuleExplanation.Spam",
                importanceTitle: "Heading.RuleImportance",
                importanceDescription: "Description.RuleImportance.Spam",
                policyKey: "spam"
            },
            "Label.AbuseType.SuicideSelfHarm": dq,
            "Label.AbuseType.Swearing": {
                ruleTitle: "Heading.RuleExplanation.Swearing",
                ruleSubtitle: "SubHeading.RuleExplanation.Swearing",
                ruleDescription: "Description.RuleExplanation.Swearing",
                importanceTitle: "Heading.RuleImportance",
                importanceDescription: "Description.RuleImportance.Swearing",
                policyKey: "swearing"
            },
            "Label.AbuseType.ThreatsOrAbuseOfRobloxEmployeesOrAffiliates": dS,
            "Label.AbuseType.ViolentContentAndGore": {
                ruleTitle: "Heading.RuleExplanation.ViolentContentAndGore",
                ruleSubtitle: "SubHeading.RuleExplanation.ViolentContentAndGore",
                ruleDescription: "Description.RuleExplanation.ViolentContentAndGore",
                importanceTitle: "Heading.RuleImportance",
                importanceDescription: "Description.RuleImportance.ViolentContentAndGore",
                policyKey: "violent-content-and-gore"
            },
            "Label.AbuseType.VirtualCasino": dq,
            "Label.Sublabel.RealLifeEvents": {
                ruleTitle: "Heading.RuleExplanation.RealLifeEvents",
                ruleSubtitle: "SubHeading.RuleExplanation.RealLifeEvents",
                ruleDescription: "Description.RuleExplanation.RealLifeEvents",
                ruleDescriptionBullets: "Description.RuleExplanation.Bullets.RealLifeEvents",
                importanceTitle: "Heading.RuleImportance",
                importanceDescription: "Description.RuleImportance.RealLifeEvents",
                policyKey: "real-life-events"
            },
            "Label.Sublabel.RomanceOrSex": dR
        },
        dA = "{startLink}",
        dC = "{endLink}",
        dI = (t, n) => (r, i, a, o) => {
            var s;
            let [u, c] = t(r, {
                startLink: dA,
                endLink: dC,
                ...a
            }).split(dA, 2), [l, d] = null != (s = null == c ? void 0 : c.split(dC, 2)) ? s : [];
            return (0, v.jsxs)("p", {
                className: "text-body-large",
                children: [u, (0, v.jsx)("a", {
                    href: i,
                    className: "content-link",
                    rel: "noreferrer",
                    onClick: () => {
                        null != o && n && n(o)
                    },
                    children: l
                }), d]
            })
        },
        dj = {
            getIsVisible: t => [l6, "VPC"].includes(t.verificationCategory),
            renderComponent: t => {
                let {
                    punishmentData: n
                } = t, r = l$().translate, {
                    websiteUrl: i
                } = l$(), a = dI(r), {
                    verificationCategory: o
                } = n, s = "".concat(i, "/"), u = a("VPC" === o ? "Label.ParentReactivationNotice" : "Label.EmailReactivationNotice", s);
                return (0, v.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    children: [(0, v.jsx)("span", {
                        className: "text-heading-medium",
                        children: r("Label.ChargebackNextSteps")
                    }), u]
                })
            },
            configName: "chargeback-steps"
        },
        dL = {
            getIsVisible: t => "Delete" !== t.punishmentTypeDescription,
            renderComponent: t => {
                let {
                    punishmentData: n
                } = t, r = l$().translate, i = l0(), {
                    hasEducationalPages: a
                } = l9(), {
                    showUGCAvatarGuidelinesLink: o,
                    context: s
                } = n, u = null == s ? void 0 : s.IS_ALT_INFORMED;
                return (0, v.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    children: [(0, v.jsx)("span", {
                        className: "text-heading-medium",
                        children: r("Label.RuleBreakingAddsUp")
                    }), (0, v.jsxs)("div", {
                        className: "flex flex-col gap-medium",
                        children: [(0, v.jsx)("p", {
                            className: "text-body-large",
                            children: r("Description.Foreshadow")
                        }), u && (0, v.jsx)("p", {
                            className: "text-body-large",
                            children: r("Description.LinkedAccounts")
                        }), (!!o || !a) && (0, v.jsx)(lK.Button, {
                            as: "a",
                            href: o ? "https://create.roblox.com/docs/marketplace/marketplace-policy#general-creation-guidelines" : "https://en.help.roblox.com/hc/en-us/articles/203313410-Roblox-Community-Standards",
                            target: "_blank",
                            rel: "noreferrer noopener",
                            variant: "Standard",
                            size: "Small",
                            onClick: () => {
                                i(o ? "ugcGuidelinesClicked" : "communityGuidelineClicked")
                            },
                            children: r(o ? "Action.ViewRulesUGCAvatarGuidelines" : "Action.ViewRules")
                        })]
                    })]
                })
            },
            configName: "prevention-steps"
        },
        dO = function(t, n, r, i) {
            if ("Delete" === r) return i("Description.BrokeRulesBanned");
            let a = l3[null != n ? n : ""],
                o = a ? i(a) : "";
            return t.length > 0 ? o ? i("Description.BrokeRulesTypePolicy.V2", {
                type: o,
                policy: t.join(", ").toLowerCase()
            }) : i("Description.BrokeRulesPolicy.V2", {
                policy: t.join(", ").toLowerCase()
            }) : o ? i("Description.BrokeRulesType", {
                type: o
            }) : i("Description.BrokeRulesGeneric")
        },
        dN = {
            getIsVisible: () => !0,
            renderComponent: t => {
                var n, r, i;
                let {
                    punishmentData: a
                } = t, o = l$().translate, {
                    violationReasons: s
                } = db(), {
                    violation: u,
                    punishmentTypeDescription: c
                } = a, l = null == u || null == (i = u.evidence) || null == (r = i.displayMeta) ? void 0 : r.capitalizedKey, d = dO(null != (n = null == s ? void 0 : s.translatedReasons) ? n : [], l, c, o);
                return (0, v.jsx)("span", {
                    className: "text-body-medium",
                    children: d
                })
            },
            configName: "punishment-description"
        },
        dD = () => {
            let {
                websiteUrl: t,
                platform: n,
                onAppealsRedirect: r
            } = l$(), {
                ixpData: i
            } = db(), a = l0();
            return {
                handleAppealsClick: (0, oc.useCallback)(() => {
                    (a("appealsPortalClicked"), r) ? r(): i && "FFlagEnableSafetyDashboard" in i && !0 === i.FFlagEnableSafetyDashboard ? window.open("".concat(t, "/safety-dashboard?t_source=").concat(encodeURIComponent(n)), "_blank", "noopener,noreferrer") : window.open("".concat(t, "/report-appeals?t_source=nap-web"), "_blank", "noopener,noreferrer")
                }, [a, r, i, t, n])
            }
        },
        d_ = {
            getIsVisible: (t, n, r) => {
                var i;
                return !(null != (i = null == r ? void 0 : r.educational_pass_eligible) && i) || "second-chance-intro" === n
            },
            renderComponent: () => {
                let t = l$().translate,
                    {
                        handleAppealsClick: n
                    } = dD();
                return (0, v.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    children: [(0, v.jsx)("p", {
                        className: "text-body-large",
                        children: t("Description.Mistake.V3")
                    }), (0, v.jsx)(lK.Button, {
                        variant: "Standard",
                        size: "Small",
                        onClick: n,
                        children: t("Action.SendAppeal")
                    })]
                })
            },
            configName: "report-mistake"
        },
        dM = t => {
            let {
                url: n,
                altLabelKey: r
            } = t, i = l$().translate, [a, o] = (0, oc.useState)(!0);
            return (0, v.jsxs)("div", {
                className: "flex aspect-1-1 justify-center items-center bg-shift-200 radius-medium",
                children: [(0, v.jsx)("img", {
                    style: {
                        objectFit: "contain"
                    },
                    className: "size-full ".concat(a ? "hidden" : ""),
                    src: n,
                    alt: r && i(r),
                    onLoad: () => {
                        o(!1)
                    },
                    onError: () => {
                        o(!1)
                    }
                }), (0, v.jsx)("div", {
                    "data-testid": "spinner-container",
                    className: a ? void 0 : "hidden",
                    children: (0, v.jsx)(lw.ProgressCircle, {
                        ariaLabel: i("Label.LoadingImage"),
                        size: "Medium",
                        variant: "Indeterminate"
                    })
                })]
            })
        },
        dU = t => new Date(t).toLocaleString(void 0, {
            month: "long",
            day: "numeric",
            year: "numeric",
            hour: "numeric",
            minute: "numeric"
        });

    function dB() {
        let {
            formatFullDate: t
        } = l$();
        return null != t ? t : dU
    }
    var dV = t => {
            let {
                fieldLabel: n,
                fieldValue: r,
                preline: i = !1
            } = t;
            return (0, v.jsxs)("div", {
                className: "flex flex-col",
                children: [(0, v.jsx)("span", {
                    className: "text-title-medium",
                    children: "".concat(n, ":")
                }), (0, v.jsx)("p", {
                    className: "text-body-medium",
                    style: {
                        wordBreak: "break-word",
                        whiteSpace: i ? "pre-line" : "normal"
                    },
                    children: r
                })]
            })
        },
        dF = () => {
            let t = l$().translate,
                {
                    handleAppealsClick: n
                } = dD(),
                {
                    readOnly: r
                } = l$();
            return r ? null : (0, v.jsx)(lK.Button, {
                onClick: n,
                variant: "Standard",
                size: "Small",
                children: t("Action.ViewMore")
            })
        },
        dG = {
            getIsVisible: dm,
            renderComponent: t => {
                var n, r;
                let {
                    punishmentData: i
                } = t, {
                    violation: a,
                    consequenceTransparencyMessage: o
                } = i, s = l$().translate, u = dB(), c = l0(), l = null == a || null == (r = a.evidence) ? void 0 : r.elements, d = null != (n = null == l ? void 0 : l.filter(t => dp(t))) ? n : [], f = [], h = [];
                d.forEach(t => {
                    var n;
                    "image" === t.type ? f.push((0, v.jsx)(dM, {
                        url: t.url,
                        altLabelKey: t.labelKey
                    }, t.url)) : h.push((0, v.jsx)(dV, {
                        fieldLabel: s(t.labelKey),
                        fieldValue: t.textKey ? ((t, n, r, i) => {
                            if (!r) return t(n);
                            try {
                                return t(n, r)
                            } catch (a) {
                                return null == i || i("missingTranslation", {
                                    additionalInfo: JSON.stringify({
                                        key: n,
                                        params: r
                                    })
                                }), t(n)
                            }
                        })(s, t.textKey, t.textKeyParameters, c) : null != (n = t.text) ? n : ""
                    }, t.labelKey))
                });
                let p = f.length > 0;
                return (0, v.jsxs)("div", {
                    "data-testid": "violation-grid",
                    className: "flex flex-col gap-medium medium:flex-row medium:gap-large",
                    children: [p && (0, v.jsx)("div", {
                        className: "shrink-0 width-[50%] medium:width-full medium:basis-[40%]",
                        children: f[0]
                    }), (0, v.jsxs)("div", {
                        className: "flex flex-col gap-small width-full",
                        children: [h, (0, v.jsx)(dV, {
                            fieldLabel: s("Label.ReviewDate"),
                            fieldValue: u(i.beginDate)
                        }), o && (0, v.jsx)(dV, {
                            fieldLabel: s("Label.DecisionMethod"),
                            fieldValue: o
                        }), (0, v.jsx)(dF, {})]
                    })]
                })
            },
            configName: "violation-evidence"
        },
        dW = t => {
            let {
                badUtterances: n
            } = t, [r, i] = (0, oc.useState)(!1), a = l$().translate;
            return (0, v.jsxs)("div", {
                className: "flex flex-col gap-small",
                children: [(0, v.jsxs)("div", {
                    className: "flex flex-col",
                    children: [(0, v.jsxs)("span", {
                        className: "text-title-medium",
                        children: [a("Label.OffensiveItem.V2"), ":"]
                    }), (0, v.jsxs)("div", {
                        className: "flex flex-col items-start",
                        children: [n.slice(0, 4).map(t => (0, v.jsx)("p", {
                            className: "text-body-medium",
                            style: {
                                wordBreak: "break-word"
                            },
                            children: t.utteranceText
                        }, t.utteranceText)), n.slice(4).map(t => (0, v.jsx)("p", {
                            className: "text-body-medium ".concat(r ? "" : "hidden"),
                            style: {
                                wordBreak: "break-word"
                            },
                            children: t.utteranceText
                        }, t.utteranceText))]
                    })]
                }), n.length > 4 && (0, v.jsx)(lK.Button, {
                    className: "self-start margin-left-[-7px]",
                    variant: "Link",
                    size: "XSmall",
                    onClick: () => {
                        i(t => !t)
                    },
                    "data-testid": "view-toggle-button",
                    children: a(r ? "Action.ViewLess" : "Action.ViewMore")
                })]
            })
        },
        dH = {
            getIsVisible: t => {
                var n, r;
                return !dm(t) && (null != (n = null == (r = t.badUtterances) ? void 0 : r.length) ? n : 0) > 0
            },
            renderComponent: t => {
                let {
                    punishmentData: n
                } = t, r = l$().translate, i = dB(), {
                    badUtterances: a,
                    consequenceTransparencyMessage: o
                } = n;
                return (0, v.jsxs)("div", {
                    className: "flex flex-col gap-small",
                    "data-testid": "bad-utterances",
                    children: [(0, v.jsx)(dW, {
                        badUtterances: null != a ? a : []
                    }), (0, v.jsx)(lJ.Divider, {}), (0, v.jsx)(dV, {
                        fieldLabel: r("Label.ReviewDate"),
                        fieldValue: i(n.beginDate)
                    }), o && (0, v.jsx)(dV, {
                        fieldLabel: r("Label.DecisionMethod"),
                        fieldValue: o
                    }), (0, v.jsx)(dF, {})]
                })
            },
            configName: "bad-utterances"
        },
        dK = {
            getIsVisible: t => {
                var n, r;
                return !dm(t) && (null != (n = null == (r = t.badUtterances) ? void 0 : r.length) ? n : 0) === 0
            },
            renderComponent: t => {
                let n = l$().translate,
                    r = dB(),
                    {
                        punishmentData: i
                    } = t,
                    {
                        beginDate: a,
                        consequenceTransparencyMessage: o
                    } = i;
                return (0, v.jsxs)("div", {
                    className: "flex flex-col gap-small",
                    "data-testid": "simple-evidence",
                    children: [(0, v.jsx)(dV, {
                        fieldLabel: n("Label.ReviewDate"),
                        fieldValue: r(a)
                    }), o && (0, v.jsx)(dV, {
                        fieldLabel: n("Label.DecisionMethod"),
                        fieldValue: o
                    }), (0, v.jsx)(dF, {})]
                })
            },
            configName: "simple-evidence"
        },
        dJ = {
            getIsVisible: () => !0,
            renderComponent: t => {
                let {
                    punishmentData: n
                } = t, r = l$().translate, i = [dG, dH, dK].map(t => t.getIsVisible(n) ? (0, v.jsx)("div", {
                    children: t.renderComponent({
                        punishmentData: n
                    })
                }, t.configName) : null).filter(Boolean);
                return (0, v.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    "data-testid": "reviewed-evidence-container",
                    children: [(0, v.jsx)("span", {
                        className: "text-title-large",
                        children: r("Label.LatestActivity")
                    }), (0, v.jsxs)("div", {
                        className: "flex flex-col gap-xsmall",
                        children: [(0, v.jsx)("div", {
                            className: "padding-large bg-shift-100 radius-medium",
                            children: i
                        }), (0, v.jsx)("span", {
                            className: "text-caption-medium content-muted",
                            children: n.interventionId
                        })]
                    })]
                })
            },
            configName: "rewiewed-evidence"
        },
        dz = {
            getIsVisible: () => !0,
            renderComponent: () => {
                let t = l$().translate;
                return (0, v.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    children: [(0, v.jsx)("span", {
                        className: "text-heading-medium",
                        children: t("Heading.SecondChance.Details")
                    }), (0, v.jsx)("p", {
                        className: "text-body-large",
                        children: t("Description.SecondChance.Details")
                    })]
                })
            },
            configName: "second-chance-conclusion"
        },
        dQ = {
            getIsVisible: () => !0,
            renderComponent: () => {
                let t = l$().translate;
                return (0, v.jsxs)("div", {
                    className: "flex flex-col gap-large",
                    children: [(0, v.jsx)("span", {
                        className: "text-heading-medium",
                        children: t("Heading.SecondChance")
                    }), (0, v.jsx)("p", {
                        className: "text-body-large",
                        children: t("Description.SecondChance.Second")
                    })]
                })
            },
            configName: "second-chance-intro"
        },
        dX = {
            getIsVisible: () => !0,
            renderComponent: t => {
                var n;
                let r = l$().translate,
                    {
                        violationReasons: i
                    } = db(),
                    {
                        punishmentData: a
                    } = t,
                    {
                        messageToUser: o
                    } = a;
                return (0, v.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    "data-testid": "what-happened",
                    children: [(0, v.jsx)("span", {
                        className: "text-title-large",
                        children: r("Label.WhatHappened")
                    }), (0, v.jsxs)("div", {
                        className: "padding-large bg-shift-100 radius-medium flex flex-col gap-small",
                        children: [(0, v.jsx)(dV, {
                            fieldLabel: r("Label.Reason"),
                            fieldValue: (null != (n = null == i ? void 0 : i.translatedReasons) ? n : []).join(", ") || r("Label.AbuseType.Other")
                        }), (0, v.jsx)(dV, {
                            fieldLabel: r("Label.ModeratorNote"),
                            fieldValue: o || r("Description.Violation", {
                                startLink: "",
                                endLink: ""
                            }),
                            preline: !0
                        })]
                    })]
                })
            },
            configName: "what-happened"
        },
        d$ = t => t.split("\n").map(t => t.trim()).filter(Boolean),
        dZ = t => ({
            getIsVisible: () => !0,
            renderComponent: () => {
                let n = l$().translate,
                    r = d$(n(t.description)),
                    i = t.descriptionBullets ? n(t.descriptionBullets) : void 0,
                    a = i ? d$(i) : [];
                return (0, v.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    "data-testid": t.policyKey,
                    children: [(0, v.jsx)("span", {
                        className: "text-heading-medium",
                        children: n(t.title)
                    }), t.subtitle && (0, v.jsx)("span", {
                        className: "text-title-large",
                        children: n(t.subtitle)
                    }), (0, v.jsxs)("div", {
                        className: "flex flex-col gap-small",
                        children: [r.length > 0 && (0, v.jsx)("div", {
                            className: "flex flex-col gap-medium",
                            children: r.map(t => (0, v.jsx)("p", {
                                className: "text-body-large",
                                children: t
                            }, t))
                        }), a.length > 0 && (0, v.jsx)("div", {
                            className: "flex flex-col gap-xsmall padding-left-small",
                            children: a.map(t => (0, v.jsxs)("div", {
                                className: "flex flex-row gap-small",
                                children: [(0, v.jsx)("p", {
                                    className: "text-body-large",
                                    children: "•"
                                }), (0, v.jsx)("p", {
                                    className: "text-body-large",
                                    children: t
                                })]
                            }, t))
                        })]
                    })]
                })
            },
            configName: t.policyKey
        }),
        dY = t => {
            let {
                isDisabled: n = !1
            } = t, r = l$().translate, {
                goToNextPage: i
            } = l9();
            return (0, v.jsx)(lK.Button, {
                variant: "Emphasis",
                size: "Medium",
                onClick: i,
                "data-testid": "continue-button",
                isDisabled: n,
                children: r("Action.Continue")
            })
        },
        d0 = t => {
            let {
                setIsDialogOpen: n
            } = t, r = l$().translate;
            return (0, v.jsx)(lK.Button, {
                variant: "Emphasis",
                size: "Medium",
                onClick: () => {
                    n(!1)
                },
                className: "min-width-1800",
                "data-testid": "dismiss-dialog-button",
                children: r("Action.OK")
            })
        },
        d1 = ((c = d1 || {})[c.Reactivate = 0] = "Reactivate", c[c.Paused = 1] = "Paused", c[c.VerifyEmail = 2] = "VerifyEmail", c[c.VerifyVPC = 3] = "VerifyVPC", c),
        d2 = t => {
            let {
                onClose: n
            } = t, r = l$().translate;
            return (0, v.jsxs)("div", {
                className: "width-full flex gap-large items-center justify-between radius-medium padding-medium stroke-system-alert stroke-standard maf-error-alert",
                style: {
                    backgroundColor: "rgba(255, 0, 0, 0.1)"
                },
                "data-testid": "error-alert",
                children: [(0, v.jsxs)("div", {
                    className: "flex gap-small items-center",
                    children: [(0, v.jsx)(lm.Icon, {
                        name: "icon-filled-circle-x",
                        className: "content-system-alert"
                    }), (0, v.jsx)("span", {
                        className: "text-body-medium",
                        children: r("Heading.Error")
                    })]
                }), (0, v.jsx)(lx.IconButton, {
                    icon: "icon-regular-x-small",
                    ariaLabel: "Close",
                    onClick: n,
                    variant: "Utility",
                    size: "Medium",
                    className: "content-system-alert shrink-0",
                    isCircular: !0
                })]
            })
        },
        d4 = t => {
            let n, {
                    proceedAction: r,
                    setIsDialogOpen: i,
                    isAgreed: a,
                    isDisabled: o = !1
                } = t,
                s = l$().translate,
                {
                    sendPageEvent: u
                } = dP(),
                {
                    userModerationApiUrl: c,
                    httpPost: l,
                    onVerifyEmail: d,
                    onVerifyParent: f,
                    onAccountReactivated: h
                } = l$(),
                [p, m] = (0, oc.useState)(!1),
                y = (0, ly.useMutation)({
                    mutationFn: () => l("".concat(c, "/v1/not-approved/reactivate")),
                    onSuccess: async () => {
                        await new Promise(t => {
                            setTimeout(t, 2e3)
                        }), h()
                    },
                    onMutate: () => {
                        m(!0), u("reactivateClicked")
                    },
                    onError: t => {
                        console.error("reactivateMutation error", t instanceof Error ? t.message : "Unknown error"), m(!1)
                    },
                    retry: 0
                });
            switch (r) {
                case 1:
                case 0:
                    n = s("Action.Continue");
                    break;
                case 2:
                    n = s("Label.EmailVerificationButtonText");
                    break;
                case 3:
                    n = s("Label.ParentVerificationButtonText");
                    break;
                case null:
                    console.warn("proceedAction has impossible value ".concat(r)), n = ""
            }
            let g = async () => {
                switch (r) {
                    case 0:
                        return void y.mutate();
                    case 2:
                        i(!1), u("emailVerificationClicked"), await (null == d ? void 0 : d());
                        return;
                    case 3:
                        i(!1), u("parentVerificationClicked"), await (null == f ? void 0 : f({
                            featureName: "CanRequestPunishmentLifting",
                            ampRecourseData: {
                                punishmentType: "Chargeback"
                            },
                            isAsyncCall: !0,
                            usePrologue: !1
                        })), i(!0);
                        return;
                    case 1:
                        return void console.warn("cannot reactivate suspended account yet");
                    case null:
                        console.warn("proceedAction has impossible value ".concat(r))
                }
            };
            return (0, v.jsxs)(oc.Fragment, {
                children: [y.isError && (0, v.jsx)(d2, {
                    onClose: () => {
                        y.reset()
                    }
                }), (0, v.jsx)(lK.Button, {
                    onClick: () => {
                        g().catch(t => {
                            console.warn("NotApprovedProceedButton onClick error", t instanceof Error ? t.message : "unknown")
                        })
                    },
                    isDisabled: o || p || !a,
                    isLoading: p,
                    variant: "Emphasis",
                    size: "Medium",
                    "data-testid": "proceed-button",
                    children: n
                })]
            })
        },
        d3 = function(t) {
            let {
                punishmentTypeDescription: n,
                endDate: r,
                verificationCategory: i
            } = t;
            switch (i) {
                case l6:
                    return 2;
                case "VPC":
                    return 3;
                default:
                    return +!l8(n, r, i)
            }
        },
        d6 = t => {
            let {
                endDate: n
            } = t, r = l$().translate, i = ((t, n) => {
                let r = new Date(t),
                    i = Date.now();
                if (Number.isNaN(r.getTime())) return n("Label.Hours", {
                    hours: "00",
                    minutes: "00"
                });
                let a = r.getTime() - i;
                if (a < 0 && (a = 0), a > 864e5) return n("Label.Days", {
                    number: String(Math.ceil(a / 864e5))
                });
                let o = Math.floor(a / 36e5),
                    s = Math.floor(a % 36e5 / 6e4);
                return a > 0 && a < 6e4 && (s = 1), n("Label.Hours", {
                    hours: o.toString().padStart(2, "0"),
                    minutes: s.toString().padStart(2, "0")
                })
            })(n, r);
            return (0, v.jsxs)("div", {
                "data-testid": "suspension-duration-alert",
                className: "flex flex-wrap gap-small bg-shift-100 padding-x-medium padding-y-small stroke-standard stroke-default items-center radius-medium",
                children: [(0, v.jsx)(lm.Icon, {
                    name: "icon-filled-triangle-exclamation",
                    className: "content-system-warning"
                }), (0, v.jsx)("span", {
                    className: "text-title-medium",
                    children: r("Label.Suspension")
                }), (0, v.jsx)("p", {
                    className: "text-body-medium",
                    children: i
                })]
            })
        },
        d8 = t => {
            let {
                punishmentData: n,
                setIsDialogOpen: r
            } = t, i = l$().translate, a = l0(), {
                endDate: o,
                punishmentTypeDescription: s
            } = n, u = d3(n), [c, l] = (0, oc.useState)(!1), [d, f] = (0, oc.useState)(!1);
            return (0, oc.useEffect)(() => {
                let t;
                return Object.values(l2).includes(s) && s.startsWith("Ban") && (t = setTimeout(() => {
                    f(t => !t)
                }, 6e4)), () => {
                    clearTimeout(t)
                }
            }, [d, s]), 1 === u ? (0, v.jsxs)("div", {
                className: "flex flex-col gap-large medium:flex-row",
                children: [(0, v.jsx)(d6, {
                    endDate: o
                }), (0, v.jsx)(d4, {
                    proceedAction: u,
                    setIsDialogOpen: r,
                    isAgreed: c,
                    isDisabled: !0
                })]
            }) : (0, v.jsxs)(oc.Fragment, {
                children: [(0, v.jsx)(lz.Checkbox, {
                    label: i("Label.RuleAcknowledgment"),
                    placement: "Start",
                    size: "Small",
                    isChecked: c,
                    onCheckedChange: t => {
                        l(!0 === t), a("checkboxChecked")
                    },
                    className: "self-start",
                    "data-testid": "rule-confirmation-checkbox"
                }), (0, v.jsx)(d4, {
                    proceedAction: u,
                    setIsDialogOpen: r,
                    isAgreed: c,
                    isDisabled: !c
                })]
            })
        },
        d5 = () => {
            let t = l$().translate,
                {
                    handleAppealsClick: n
                } = dD();
            return (0, v.jsx)(lK.Button, {
                variant: "SoftEmphasis",
                size: "Medium",
                onClick: n,
                "data-testid": "appeals-button",
                children: t("Action.ReportMistake")
            })
        },
        d7 = async (t, n) => n("".concat(t, "/moderation-appeal-service/v2/consequence-commutation"), {
            type: "EDUCATIONAL_PASS"
        }), d9 = () => {
            let t = l$().translate,
                {
                    sendPageEvent: n
                } = dP(),
                {
                    httpPost: r,
                    apiGatewayUrl: i,
                    onAccountReactivated: a
                } = l$(),
                {
                    handleAppealsClick: o
                } = dD(),
                [s, u] = (0, oc.useState)(!1),
                c = (0, ly.useMutation)({
                    mutationFn: () => d7(i, r),
                    onMutate: () => {
                        u(!0), n("secondChanceReactivateClicked")
                    },
                    onSuccess: async () => {
                        await new Promise(t => {
                            setTimeout(t, 2e3)
                        }), a()
                    },
                    onError: t => {
                        console.error("reactivateMutation error", t instanceof Error ? t.message : "Unknown error"), u(!1)
                    },
                    retry: 0
                });
            return (0, v.jsxs)(oc.Fragment, {
                children: [c.isError && (0, v.jsx)(d2, {
                    onClose: () => {
                        c.reset()
                    }
                }), (0, v.jsxs)("div", {
                    className: "flex flex-col gap-small medium:flex-row-reverse",
                    children: [(0, v.jsx)(lK.Button, {
                        onClick: () => {
                            c.mutate()
                        },
                        variant: "Emphasis",
                        size: "Medium",
                        className: "min-width-2600",
                        "data-testid": "second-chance-reactivate-button",
                        isLoading: s,
                        isDisabled: s,
                        children: t("Action.OK")
                    }), (0, v.jsx)(lK.Button, {
                        onClick: o,
                        variant: "Standard",
                        size: "Medium",
                        "data-testid": "second-chance-send-appeal-button",
                        children: t("Action.SendAppeal")
                    })]
                })]
            })
        }, fe = () => {
            let t = l$().translate,
                [n, r] = (0, oc.useState)(!1);
            return (0, v.jsxs)(oc.Fragment, {
                children: [(0, v.jsx)(lz.Checkbox, {
                    label: t("Label.RuleAcknowledgment"),
                    placement: "Start",
                    size: "Small",
                    isChecked: n,
                    onCheckedChange: t => {
                        r(!0 === t)
                    },
                    className: "self-start",
                    "data-testid": "understand-continue-checkbox"
                }), (0, v.jsx)(dY, {
                    isDisabled: !n
                })]
            })
        }, ft = t => {
            let {
                onOpenChange: n,
                children: r
            } = t, {
                readOnly: i
            } = l$(), {
                punishmentData: a,
                violationReasons: o,
                isLoading: s,
                error: u,
                commutationEligibility: c
            } = db(), l = null == o ? void 0 : o.untranslatedReasons, d = (0, oc.useMemo)(() => (null != l ? l : []).some(t => t in dk), [l]), {
                pages: f,
                unmappedViolationKeys: h
            } = (0, oc.useMemo)(() => a ? ((t, n, r, i) => {
                var a;
                let o, s, u, c = [],
                    l = "Delete" === t.punishmentTypeDescription,
                    d = null != (a = null == r ? void 0 : r.educational_pass_eligible) && a;
                if (c.push({
                        pageName: "intro",
                        pageItems: [dN, dX, dJ],
                        CtaComponent: l ? d5 : dY
                    }), l) return {
                    pages: c,
                    unmappedViolationKeys: []
                };
                d && !i && c.push({
                    pageName: "second-chance-intro",
                    pageItems: [dQ, d_],
                    CtaComponent: dY
                });
                let {
                    educationalPages: f,
                    unmappedViolationKeys: h
                } = (o = [], s = new Set, u = new Set, n.forEach(t => {
                    let n = dk[t];
                    if (!n) return void s.add(t);
                    if (u.has(n.policyKey)) return;
                    u.add(n.policyKey);
                    let r = d && !i ? fe : dY;
                    o.push({
                        pageName: "policy-rule-".concat(n.policyKey),
                        pageItems: [dZ({
                            title: n.ruleTitle,
                            subtitle: n.ruleSubtitle,
                            description: n.ruleDescription,
                            descriptionBullets: n.ruleDescriptionBullets,
                            policyKey: n.policyKey
                        })],
                        CtaComponent: r
                    }), o.push({
                        pageName: "policy-importance-".concat(n.policyKey),
                        pageItems: [dZ({
                            title: n.importanceTitle,
                            description: n.importanceDescription,
                            policyKey: n.policyKey
                        })],
                        CtaComponent: r
                    })
                }), {
                    educationalPages: o,
                    unmappedViolationKeys: [...s]
                });
                return c.push(...f), c.push({
                    pageName: "resolution",
                    pageItems: [dL, dj, d_],
                    CtaComponent: i ? d0 : d ? fe : d8
                }), d && !i && c.push({
                    pageName: "second-chance-conclusion",
                    pageItems: [dz],
                    CtaComponent: d9
                }), {
                    pages: c,
                    unmappedViolationKeys: h
                }
            })(a, null != l ? l : [], c, i) : {
                pages: [],
                unmappedViolationKeys: []
            }, [a, l, c, i]);
            return s ? r({
                header: (0, v.jsx)(ds, {
                    readOnly: !!i
                }),
                body: (0, v.jsx)(du, {}),
                ctas: (0, v.jsx)(dc, {})
            }) : u || !a ? r({
                header: (0, v.jsx)(dl, {}),
                body: (0, v.jsx)(dd, {
                    error: u
                })
            }) : (0, v.jsx)(l7, {
                pages: f,
                unmappedViolationKeys: h,
                hasEducationalPages: d,
                commutationEligibility: c,
                children: (0, v.jsx)(dx, {
                    children: r({
                        header: (0, v.jsx)(di, {
                            punishmentData: a
                        }),
                        body: (0, v.jsx)(de, {
                            punishmentData: a,
                            commutationEligibility: c
                        }),
                        ctas: (0, v.jsx)(da, {
                            punishmentData: a,
                            setIsDialogOpen: n
                        })
                    })
                })
            })
        }, fn = t => {
            let {
                impressionEvent: n
            } = t, {
                translate: r,
                websiteUrl: i,
                onLogout: a
            } = l$(), o = l0(), s = dI(r, o), [u, c] = (0, oc.useState)(!1);
            (0, oc.useEffect)(() => {
                o(n)
            }, [o, n]);
            let l = (0, ly.useMutation)({
                mutationFn: async () => {
                    await a()
                },
                onMutate: () => {
                    c(!0), o("logoutClicked")
                },
                onError: t => {
                    let r = t instanceof Error ? t.message : "Unknown error";
                    o("error", {
                        additionalInfo: "".concat(n, ": Error logging out - ").concat(r)
                    }), c(!1)
                },
                retry: 0
            });
            return (0, v.jsx)(lp.Dialog, {
                open: !0,
                isModal: !0,
                size: "Medium",
                hasCloseAffordance: !1,
                children: (0, v.jsxs)(lp.DialogContent, {
                    className: "[&_p]:margin-none [&_h2]:margin-none",
                    children: [(0, v.jsxs)(lp.DialogBody, {
                        className: "gap-large flex flex-col",
                        children: [(0, v.jsx)(lp.DialogTitle, {
                            className: "text-heading-large margin-none",
                            children: r("Heading.AccountIssue")
                        }), s("Description.ResolveIssue", i)]
                    }), (0, v.jsxs)(lp.DialogFooter, {
                        className: "flex justify-end gap-small flex-col-reverse medium:flex-row",
                        children: [(0, v.jsx)(lK.Button, {
                            variant: "Standard",
                            size: "Medium",
                            isLoading: u,
                            isDisabled: u,
                            onClick: () => {
                                l.mutate()
                            },
                            children: r("Action.Logout")
                        }), (0, v.jsx)(lK.Button, {
                            variant: "Emphasis",
                            size: "Medium",
                            onClick: () => {
                                window.open(i, "_blank", "noopener,noreferrer")
                            },
                            children: r("Action.GoToRoblox")
                        })]
                    })]
                })
            })
        }, fr = t => {
            var n;
            let {
                open: r,
                onClose: i
            } = t, [a, o] = (0, oc.useState)(!0), s = void 0 !== r, u = t => {
                s && !t ? null == i || i() : o(t)
            }, {
                translate: c,
                renderSelfServiceDeactivated: l,
                shouldShowGenericFallback: d,
                ixp: f,
                readOnly: h
            } = l$(), p = l0(), {
                punishmentData: m,
                isLoading: y,
                error: g,
                ixpData: b
            } = db(), w = b && "FFlagEnableSafetyDashboard" in b, x = !y && !g && void 0 !== m, P = !y && !g && !m;
            if ((0, oc.useEffect)(() => {
                    if (m) {
                        var t;
                        p((null == (t = m.context) ? void 0 : t.SelfServiceDeactivated) ? "accountReactivationPageRendered" : "pageRendered", {
                            interventionId: m.interventionId,
                            punishedUserId: m.punishedUserId,
                            isReactivationEligible: l8(m.punishmentTypeDescription, m.endDate, m.verificationCategory),
                            verificationCategory: m.verificationCategory
                        })
                    }
                }, [m]), (0, oc.useEffect)(() => {
                    w && !h && m && (null == f || f.logExposure(l1))
                }, [w, h, m, f]), P && !h) return null;
            if (x && (null == (n = m.context) ? void 0 : n.SelfServiceDeactivated)) return l ? (0, v.jsx)(oc.Fragment, {
                children: l()
            }) : (0, v.jsx)(fn, {
                impressionEvent: "accountReactivationRedirectRendered"
            });
            let R = x && (null == d ? void 0 : d(m));
            return R ? (0, v.jsx)(fn, {
                impressionEvent: R
            }) : (0, v.jsx)(lp.Dialog, {
                open: null != r ? r : a,
                size: "Large",
                hasCloseAffordance: !!h,
                closeLabel: c("Action.Close"),
                isModal: !0,
                onOpenChange: h ? t => {
                    t || u(!1)
                } : void 0,
                children: (0, v.jsx)(lp.DialogContent, {
                    className: "width-full [&_p]:margin-none [&_h2]:margin-none",
                    onOpenAutoFocus: t => {
                        t.preventDefault()
                    },
                    children: (0, v.jsx)(lp.DialogBody, {
                        className: "flex flex-col height-[85vh] max-height-[800px]",
                        children: (0, v.jsx)(ft, {
                            onOpenChange: u,
                            children: t => {
                                let {
                                    header: n,
                                    body: r,
                                    ctas: i
                                } = t;
                                return (0, v.jsxs)("div", {
                                    className: "flex flex-col gap-large height-full min-height-0",
                                    children: [(0, v.jsx)(lp.DialogTitle, {
                                        className: "padding-none",
                                        children: n
                                    }), (0, v.jsxs)("div", {
                                        className: "grow-1 scroll-y min-height-0",
                                        children: [r, (0, v.jsx)("div", {
                                            className: "bg-surface-100",
                                            style: {
                                                position: "sticky",
                                                bottom: -1,
                                                left: 0,
                                                height: "40px",
                                                maskImage: "linear-gradient(to bottom, transparent 0%, var(--color-surface-100) 100%)",
                                                WebkitMaskImage: "linear-gradient(to bottom, transparent 0%, var(--color-surface-100) 100%)"
                                            }
                                        })]
                                    }), (0, v.jsx)("div", {
                                        className: "shrink-0",
                                        children: i
                                    })]
                                })
                            }
                        })
                    })
                })
            })
        }, fi = new ok.QueryClient({
            defaultOptions: {
                queries: {
                    refetchOnWindowFocus: !1,
                    retry: !1,
                    refetchOnMount: !1,
                    staleTime: 6e4
                }
            }
        }), fa = function(t) {
            let {
                open: n,
                onClose: r
            } = t;
            return (0, v.jsx)(oA.QueryClientProvider, {
                client: fi,
                children: (0, v.jsx)(dg, {
                    enableIxp: !0,
                    children: (0, v.jsx)(fr, {
                        open: n,
                        onClose: r
                    })
                })
            })
        }, fo = t.i(894244), fs = t.i(839165);
    let fu = function() {
            let {
                translate: t
            } = (0, oO.useTranslation)(), n = (0, cw.useAuthentication)(), r = (0, ol.useRouter)(), i = "https://usermoderation.".concat("roblox.com"), a = "https://apis.roblox.com", o = "https://".concat("roblox.com"), s = "CreatorHub", u = (0, oc.useCallback)(t => {
                cq.default.logHostRoutedEvent({
                    eventType: t.eventName,
                    context: t.context,
                    properties: t.properties
                })
            }, []), c = (0, oc.useCallback)(t => !!t.verificationCategory && lZ.VerificationRedirectRendered, []), l = (0, oc.useCallback)(async () => {
                let t = await (0, fo.getAuthorizationEndpoint)({
                    redirectUri: "https://create.roblox.com"
                });
                await n.logout(), await r.push(t)
            }, [r, n]), d = (0, oc.useCallback)(() => {
                r.reload()
            }, [r]);
            return (0, oc.useMemo)(() => ({
                translate: t,
                httpGet: fs.authenticatedHttpGet,
                httpPost: fs.authenticatedHttpPost,
                userModerationApiUrl: i,
                apiGatewayUrl: a,
                websiteUrl: o,
                sendAnalyticsEvent: u,
                platform: s,
                shouldShowGenericFallback: c,
                onLogout: l,
                onAccountReactivated: d
            }), [t, i, a, o, u, s, c, l, d])
        },
        fc = () => {
            let t = fu();
            return (0, v.jsx)(lX, {
                config: t,
                children: (0, v.jsx)(fa, {})
            })
        },
        fl = (0, oO.withTranslation)(() => {
            let {
                themeMode: t
            } = (0, cb.useThemeMode)();
            return (0, v.jsx)(cR.UIThemeProvider, {
                theme: t,
                children: (0, v.jsx)(fc, {})
            })
        }, [ll.TranslationNamespace.NotApproved, ll.TranslationNamespace.Moderation, ll.TranslationNamespace.AppealsPortal, ll.TranslationNamespace.CommonUIControls, ll.TranslationNamespace.Error, ll.TranslationNamespace.DashboardModeration]),
        fd = () => {
            let {
                status: t
            } = (0, cw.useAuthentication)();
            return "moderated" === t ? (0, v.jsx)(fl, {}) : null
        };
    var ff = t.i(82511);
    let fh = (0, cj.default)(() => t.A(14667), {
            loadableGenerated: {
                modules: [573249]
            },
            ssr: !1
        }),
        fp = t => {
            let {
                children: n
            } = t;
            return (0, v.jsx)(ff.UniversalFeatureRestrictionsProvider, {
                Surface: fh,
                children: n
            })
        };
    var fv = t.i(336964);

    function fm(t) {
        return "object" == typeof t && null !== t && "Component" in t
    }

    function fy(t) {
        var n;
        let {
            store: r
        } = t, i = null != r ? r : fv.dialogStore, {
            render: a,
            options: o,
            isOpen: s
        } = (0, oc.useSyncExternalStore)(i.subscribe, i.getSnapshot, i.getSnapshot);
        if ((0, oc.useEffect)(() => {
                if (s || null === o || !o.shouldUnmountOnClose) return;
                let t = setTimeout(() => i.clearContent(), 150);
                return () => clearTimeout(t)
            }, [s, o, i]), null === a) return null;
        if ((null == o ? void 0 : o.mode) === "standalone" && fm(a)) return (0, oc.createElement)(a.Component, {
            ...a.props,
            open: s,
            onOpenChange: t => {
                t || i.close()
            }
        });
        let u = null != o ? o : fv.DEFAULT_RESOLVED_CONTENT_OPTIONS,
            c = fm(a) ? (0, oc.createElement)(a.Component, a.props) : a;
        return (0, v.jsx)(lp.Dialog, {
            open: s,
            onOpenChange: t => {
                t || i.close()
            },
            size: u.size,
            isModal: u.isModal,
            hasCloseAffordance: u.hasCloseAffordance,
            closeLabel: null != (n = u.closeLabel) ? n : "",
            hasMarginTop: u.hasMarginTop,
            hasMarginBottom: u.hasMarginBottom,
            hasDescription: u.hasDescription,
            children: c
        })
    }
    var fg = t.i(318536),
        fb = t.i(209534);

    function fw() {
        let {
            current: t
        } = (0, oc.useSyncExternalStore)(fb.snackbarStore.subscribe, fb.snackbarStore.getSnapshot, fb.snackbarStore.getSnapshot);
        return null === t ? null : (0, v.jsx)(fg.Snackbar, {
            ...t.props,
            onClose: () => fb.snackbarStore.dismiss()
        }, t.id)
    }
    var fx = t.i(943758);
    let fP = (0, oc.createContext)({
        primarySidebarExpanded: !1,
        setPrimarySidebarExpanded: () => {
            throw Error("Function not implemented. You may be trying to use this context outside of a provider.")
        }
    });
    fP.displayName = "LeftNavigationStateContext";
    let fR = t => {
        let {
            children: n
        } = t, [r, i] = (0, oc.useState)(!0), a = (0, oc.useMemo)(() => ({
            primarySidebarExpanded: r,
            setPrimarySidebarExpanded: i
        }), [r]);
        return (0, v.jsx)(fP.Provider, {
            value: a,
            children: n
        })
    };
    var fS = t.i(729904),
        fT = t.i(486736),
        fE = t.i(47033),
        fq = t.i(199834),
        fk = t.i(291037),
        fA = t.i(649319),
        fC = t.i(982234),
        fI = t.i(196990),
        fj = t.i(533968),
        fL = t.i(210205);
    let fO = {
            [fE.AgreementType.ChildrenPrivacyPolicy]: "Label.ChildrenPrivacyPolicy",
            [fE.AgreementType.ConsentFlow]: "Label.ConsentFlow",
            [fE.AgreementType.LuobuThirdPartyDataUse]: "Label.LuobuThirdPartyDataUse",
            [fE.AgreementType.PersonalInformationPolicy]: "Label.PersonalInformationPolicy",
            [fE.AgreementType.PrivacyPolicy]: "Label.PrivacyPolicy",
            [fE.AgreementType.RefundTerms]: "Label.RefundTerms",
            [fE.AgreementType.RiderTerms]: "Label.RiderTerms",
            [fE.AgreementType.TermsOfService]: "Label.TermsOfService"
        },
        fN = ["/v1-studio-login"],
        fD = (0, oO.withTranslation)(() => {
            let t = (0, ol.useRouter)(),
                {
                    translate: n
                } = (0, oO.useTranslation)(),
                {
                    user: r,
                    logout: i
                } = (0, cw.useAuthentication)(),
                a = (0, oc.useRef)(!1),
                {
                    captureError: o,
                    error: s,
                    info: u
                } = (0, fL.useMetricsMonitoring)(),
                [c, l] = (0, oc.useState)(!1),
                [d, f] = (0, oc.useState)(!1),
                [h, p] = (0, oc.useState)([]),
                m = (0, oc.useCallback)(async t => {
                    async function n(t, r) {
                        if (r <= 0) return void s("User Agreement accept failed after retried ".concat(3, " times"));
                        try {
                            var i;
                            let a = null == (i = (await fI.userAgreementsClient.acceptUserAgreements(t)).results) ? void 0 : i.reduce((t, n) => 0 !== n.errorCode ? [...t, n.agreementId] : t, []);
                            a && a.length > 0 && await n(a, r - 1)
                        } catch (a) {
                            let i = (0, fj.getResponseFromError)(a);
                            (null == i ? void 0 : i.status) === li.StatusCodes.UNAUTHORIZED ? (u("User Agreement accept failed with 401 from backend"), await ol.default.push("/login")) : (s("User Agreement accept failed with status code ".concat(null == i ? void 0 : i.status)), await n(t, r - 1))
                        }
                    }
                    await n(t, 3)
                }, [s, u]),
                y = (0, oc.useCallback)(async () => {
                    try {
                        await i()
                    } catch (t) {
                        t instanceof Error && o(t), s("Logout after user reject update agreements failed")
                    } finally {
                        l(!1)
                    }
                }, [o, s, i]),
                g = (0, oc.useCallback)(async () => {
                    let t = h.map(t => t.id);
                    f(!0), await m(t), f(!1), l(!1)
                }, [m, h]),
                b = (0, oc.useCallback)(async () => {
                    try {
                        let t = fI.userAgreementsClient.getUserAgreements({
                                clientType: fE.ClientType.Studio
                            }),
                            n = await t;
                        n.length > 0 && (p([...n]), l(!0))
                    } catch (t) {
                        s("Fetch update user-agreements failed"), t instanceof Error && o(t)
                    }
                }, [o, s]);
            return (0, oc.useEffect)(() => {
                (null == r ? void 0 : r.id) === void 0 || a.current || !t.isReady || fN.some(n => t.pathname.startsWith(n)) || (b(), a.current = !0)
            }, [r, b, t.isReady, t.pathname]), (0, v.jsx)(fk.Dialog, {
                open: c,
                children: (0, v.jsx)(fA.DialogTemplate, {
                    onConfirm: g,
                    onCancel: y,
                    title: n("Heading.AgreementsUpdate"),
                    content: (0, v.jsxs)(v.Fragment, {
                        children: [(0, v.jsx)(fq.Typography, {
                            component: "p",
                            variant: "body1",
                            children: n("Description.AgreementsUpdate")
                        }), (0, v.jsx)("ul", {
                            children: h.map(t => {
                                var r;
                                let i;
                                return (0, v.jsx)("li", {
                                    children: (0, v.jsx)(fC.Link, {
                                        href: t.displayUrl,
                                        target: "__blank",
                                        children: (r = t.agreementType, void 0 === (i = fO[r]) ? n(i) : r)
                                    })
                                }, t.id)
                            })
                        })]
                    }),
                    confirmText: n("Button.Accept"),
                    cancelText: n("Button.Reject"),
                    loading: d
                })
            })
        }, [ll.TranslationNamespace.AgreementsUpdate]),
        {
            authenticationApi: f_
        } = {
            authenticationApi: ch
        },
        {
            discoveryApi: fM
        } = uV.ApplicationAuthorizationsClient,
        {
            usersApi: fU
        } = cp.UsersClient,
        fB = (r = cq.default, t => {
            var n, i, a, o, s, u, c, l, d;
            let f, h;
            return r.logWebVitalsEvent({
                eventName: "webVitals",
                parameters: {
                    metricName: t.name,
                    metricStartTime: String(t.startTime),
                    metricValue: String(t.value),
                    metricLabel: t.label,
                    ...uU || (uU = {
                        staticAsset: void 0 === (f = null == (s = performance) || null == (o = s.getEntriesByType) || null == (a = o.call(s, "resource")) || null == (i = a.find) || null == (n = i.call(a, t => {
                            let {
                                initiatorType: n,
                                name: r
                            } = t;
                            return "script" === n && r.includes("_next/static/chunks/")
                        })) ? void 0 : n.transferSize) ? "unknown" : 0 === f ? "cached" : "network",
                        serviceWorker: (null == (u = navigator) ? void 0 : u.serviceWorker) ? navigator.serviceWorker.controller ? "controlled" : "uncontrolled" : "unsupported",
                        pageLoad: void 0 === (h = null == (d = performance) || null == (l = d.getEntriesByType) || null == (c = l.call(d, "navigation")[0]) ? void 0 : c.transferSize) ? "unknown" : 0 === h ? "cached" : "network"
                    })
                }
            })
        }),
        fV = (uT && (f = null != (l = document.querySelector('meta[name="'.concat("emotion-insertion-point-mui", '"]'))) ? l : void 0, h = null != (d = document.querySelector('meta[name="'.concat("emotion-insertion-point-tss", '"]'))) ? d : void 0), {
            muiCache: (0, o_.c)({
                key: uR,
                prepend: !0,
                insertionPoint: f
            }),
            tssCache: (0, o_.c)({
                key: uS,
                insertionPoint: h
            })
        });
    (0, oN.createThumbnailsClient)((0, cv.getBEDEV1ServiceBasePath)("thumbnails"));
    let fF = {
            locale: lr.defaultLocale,
            nativeName: lr.defaultNativeName
        },
        fG = new ln.TranslationResourceProvider(fF, lr.fallbackLocale),
        fW = t => {
            let {
                children: n,
                universeId: r
            } = t;
            return ! function(t) {
                let n = (0, cC.useCustomDashboardService)(),
                    r = (0, oA.useQueryClient)(),
                    {
                        ready: i,
                        value: a
                    } = (0, ck.useFlag)(cA.isCustomDashboardsEnabled, {
                        universeId: t
                    });
                (0, oc.useEffect)(() => {
                    if (i && a) return n.subscribe(t => {
                        if ("external" === t.eventType) return void r.invalidateQueries({
                            queryKey: cI.customDashboardQueryKeys.universe(t.universeId)
                        });
                        if ("pin" === t.eventType || "unpin" === t.eventType) {
                            r.invalidateQueries({
                                queryKey: cI.customDashboardQueryKeys.list(t.universeId),
                                refetchType: "none"
                            }), r.invalidateQueries({
                                queryKey: cI.customDashboardQueryKeys.pinned(t.universeId)
                            }), r.invalidateQueries({
                                queryKey: cI.customDashboardQueryKeys.detail(t.universeId, t.dashboardId)
                            });
                            return
                        }
                        r.invalidateQueries({
                            queryKey: cI.customDashboardQueryKeys.list(t.universeId)
                        }), r.invalidateQueries({
                            queryKey: cI.customDashboardQueryKeys.pinned(t.universeId)
                        }), r.invalidateQueries({
                            queryKey: cI.customDashboardQueryKeys.suggestedName(t.universeId)
                        }), r.invalidateQueries({
                            queryKey: cI.customDashboardQueryKeys.detail(t.universeId, t.dashboardId)
                        })
                    })
                }, [a, i, n, r])
            }(r), (0, v.jsx)(v.Fragment, {
                children: n
            })
        },
        fH = {
            defaultLocale: lr.defaultLocale,
            title: lr.defaultMetadataJson["OpenGraph.Title"],
            description: lr.defaultMetadataJson["OpenGraph.Description"]
        },
        fK = t => t,
        fJ = () => ((() => {
            let {
                trackerClient: t
            } = (0, cT.useEventTrackerProvider)(), n = (0, oc.useCallback)(() => {
                let n = (0, c7.loadPageEventModel)();
                t.sendEvent(n)
            }, [t]);
            (0, c9.default)(void 0, n), (0, oc.useEffect)(() => n(), [n]), (0, oc.useEffect)(() => {
                cq.default.trackPageLoad()
            }, [])
        })(), (0, od.useReportWebVitals)(fB), null),
        fz = t => {
            let {
                children: n
            } = t, {
                settings: r,
                isFetched: i
            } = (0, fT.useSettings)();
            return (0, v.jsx)(oL.NavigationConfigsProvider, {
                currentProduct: "CreatorDashboard",
                environment: (0, fS.default)(),
                robloxEnvironment: "production",
                target: "global",
                drawerVariant: "belowAppBar",
                signalRCrossTab: {
                    enabled: r.enableSignalRCrossTab,
                    isFetched: i
                },
                enableGroupModeration: r.enableGroupModerationPage,
                children: n
            })
        },
        fQ = new ok.QueryClient({
            defaultOptions: {
                queries: {
                    refetchOnWindowFocus: !1,
                    retry: !1
                }
            }
        }),
        fX = (0, oC.initializeAuthStore)(),
        f$ = t => {
            var n;
            let {
                Component: r,
                pageProps: i,
                cache: a
            } = t, {
                query: o
            } = (0, ol.useRouter)(), s = "string" == typeof o.id ? Number(o.id) : 0, u = null != (n = r.getPageLayout) ? n : fK, c = (0, oc.useMemo)(() => ({
                ...fH,
                ...r.pageMetadata
            }), [r.pageMetadata]);
            return (0, oj.useMaintenanceObserver)("https://create.roblox.com"), (0, oc.useEffect)(() => {
                uE()
            }, []), cE.default.setUnifiedLoggerClient(cq.default), (0, v.jsx)(oq, {
                children: (0, v.jsx)(uq, {
                    cache: null != a ? a : fV,
                    children: (0, v.jsxs)(c8, {
                        providers: [(0, v.jsx)(fx.BreadcrumbItemNameProvider, {}), (0, v.jsx)(oA.QueryClientProvider, {
                            client: fQ
                        }), (0, v.jsx)(cC.CustomDashboardServiceProvider, {}), (0, v.jsx)(cC.UniverseFlaggedCustomDashboardProvider, {}), (0, v.jsx)(fW, {
                            universeId: s
                        }), (0, v.jsx)(lt, {
                            pageLoggerConfig: r.loggerConfig
                        }), (0, v.jsx)(cT.EventTrackerProvider, {
                            trackerClient: cE.default
                        }), (0, v.jsx)(oC.RobloxAuthenticationProvider, {
                            clientId: "4273917941353191905",
                            authenticationClient: f_,
                            discoveryClient: fM,
                            usersClient: fU,
                            store: fX
                        }), (0, v.jsx)(c1.GroupsProvider, {}), (0, v.jsx)(cx, {}), (0, v.jsx)(cS, {
                            themeElement: "u" > typeof document ? document.documentElement : void 0
                        }), (0, v.jsx)(oO.LocalizationProvider, {
                            provider: fG
                        }), (0, v.jsx)(uk.SnackbarProvider, {}), (0, v.jsx)(uA.DialogProvider, {}), (0, v.jsx)(cP.default, {}), (0, v.jsx)(oN.ThumbnailsProvider, {
                            baseUrl: cE.eventStreamBaseUrl
                        }), (0, v.jsx)(fT.SettingsProvider, {}), (0, v.jsx)(fz, {}), (0, v.jsx)(c5.ThemeAwareStudioResourcesProvider, {}), (0, v.jsx)(lh, {}), (0, v.jsx)(ls, {}), (0, v.jsx)(c6.default, {}), (0, v.jsx)(fR, {}), (0, v.jsx)(oI.CookieConsentProvider, {
                            robloxSiteDomain: "roblox.com"
                        }), (0, v.jsx)(uB.AgeVerificationUpsellProvider, {}), (0, v.jsx)(fp, {})],
                        children: [(0, v.jsx)(fJ, {}), (0, v.jsx)(cg, {
                            provider: fG
                        }), (0, v.jsx)(fw, {}), (0, v.jsx)(fy, {}), (0, v.jsx)(fd, {}), (0, v.jsx)(fD, {}), (0, v.jsx)(c3, {}), (0, v.jsx)(lf, {
                            openGraphMetadata: c
                        }), u((0, v.jsx)(r, {
                            ...i
                        }), {
                            query: o
                        })]
                    })
                })
            })
        };
    t.s(["CustomApp", 0, f$, "default", 0, f$, "reportWebVitals", 0, fB], 656350)
}, 681109, (t, n, r) => {
    let i = "/_app";
    (window.__NEXT_P = window.__NEXT_P || []).push([i, () => t.r(656350)]), n.hot && n.hot.dispose(function() {
        window.__NEXT_P.push([i])
    })
}, 482711, (t, n, r) => {
    ! function() {
        "use strict";
        var t = {};
        t.d = function(n, r) {
            for (var i in r) t.o(r, i) && !t.o(n, i) && Object.defineProperty(n, i, {
                enumerable: !0,
                get: r[i]
            })
        }, t.o = function(t, n) {
            return Object.prototype.hasOwnProperty.call(t, n)
        }, t.r = function(t) {
            "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(t, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(t, "__esModule", {
                value: !0
            })
        }, void 0 !== t && (t.ab = "/ROOT/node_modules/.pnpm/next@16.3.0_@babel+core@7.29.0_@opentelemetry+api@1.9.1_@playwright+test@1.61.1_@types+_379fb98fecc9fc5f7bce6eca48d1b2a5/node_modules/next/dist/compiled/web-vitals/");
        var r = {};
        t.r(r), t.d(r, {
            CLSThresholds: function() {
                return k
            },
            FCPThresholds: function() {
                return E
            },
            FIDThresholds: function() {
                return et
            },
            INPThresholds: function() {
                return V
            },
            LCPThresholds: function() {
                return G
            },
            TTFBThresholds: function() {
                return K
            },
            onCLS: function() {
                return A
            },
            onFCP: function() {
                return q
            },
            onFID: function() {
                return en
            },
            onINP: function() {
                return F
            },
            onLCP: function() {
                return H
            },
            onTTFB: function() {
                return z
            }
        });
        var i, a, o, s, u, c = -1,
            l = function(t) {
                addEventListener("pageshow", function(n) {
                    n.persisted && (c = n.timeStamp, t(n))
                }, !0)
            },
            d = function() {
                var t = self.performance && performance.getEntriesByType && performance.getEntriesByType("navigation")[0];
                if (t && t.responseStart > 0 && t.responseStart < performance.now()) return t
            },
            f = function() {
                var t = d();
                return t && t.activationStart || 0
            },
            h = function(t, n) {
                var r = d(),
                    i = "navigate";
                return c >= 0 ? i = "back-forward-cache" : r && (document.prerendering || f() > 0 ? i = "prerender" : document.wasDiscarded ? i = "restore" : r.type && (i = r.type.replace(/_/g, "-"))), {
                    name: t,
                    value: void 0 === n ? -1 : n,
                    rating: "good",
                    delta: 0,
                    entries: [],
                    id: "v4-".concat(Date.now(), "-").concat(Math.floor(0x82f79cd8fff * Math.random()) + 1e12),
                    navigationType: i
                }
            },
            p = function(t, n, r) {
                try {
                    if (PerformanceObserver.supportedEntryTypes.includes(t)) {
                        var i = new PerformanceObserver(function(t) {
                            Promise.resolve().then(function() {
                                n(t.getEntries())
                            })
                        });
                        return i.observe(Object.assign({
                            type: t,
                            buffered: !0
                        }, r || {})), i
                    }
                } catch (t) {}
            },
            v = function(t, n, r, i) {
                var a, o;
                return function(s) {
                    var u;
                    n.value >= 0 && (s || i) && ((o = n.value - (a || 0)) || void 0 === a) && (a = n.value, n.delta = o, u = n.value, n.rating = u > r[1] ? "poor" : u > r[0] ? "needs-improvement" : "good", t(n))
                }
            },
            m = function(t) {
                requestAnimationFrame(function() {
                    return requestAnimationFrame(function() {
                        return t()
                    })
                })
            },
            y = function(t) {
                document.addEventListener("visibilitychange", function() {
                    "hidden" === document.visibilityState && t()
                })
            },
            g = function(t) {
                var n = !1;
                return function() {
                    n || (t(), n = !0)
                }
            },
            b = -1,
            w = function() {
                return "hidden" !== document.visibilityState || document.prerendering ? 1 / 0 : 0
            },
            x = function(t) {
                "hidden" === document.visibilityState && b > -1 && (b = "visibilitychange" === t.type ? t.timeStamp : 0, R())
            },
            P = function() {
                addEventListener("visibilitychange", x, !0), addEventListener("prerenderingchange", x, !0)
            },
            R = function() {
                removeEventListener("visibilitychange", x, !0), removeEventListener("prerenderingchange", x, !0)
            },
            S = function() {
                return b < 0 && (b = w(), P(), l(function() {
                    setTimeout(function() {
                        b = w(), P()
                    }, 0)
                })), {
                    get firstHiddenTime() {
                        return b
                    }
                }
            },
            T = function(t) {
                document.prerendering ? addEventListener("prerenderingchange", function() {
                    return t()
                }, !0) : t()
            },
            E = [1800, 3e3],
            q = function(t, n) {
                n = n || {}, T(function() {
                    var r, i = S(),
                        a = h("FCP"),
                        o = p("paint", function(t) {
                            t.forEach(function(t) {
                                "first-contentful-paint" === t.name && (o.disconnect(), t.startTime < i.firstHiddenTime && (a.value = Math.max(t.startTime - f(), 0), a.entries.push(t), r(!0)))
                            })
                        });
                    o && (r = v(t, a, E, n.reportAllChanges), l(function(i) {
                        r = v(t, a = h("FCP"), E, n.reportAllChanges), m(function() {
                            a.value = performance.now() - i.timeStamp, r(!0)
                        })
                    }))
                })
            },
            k = [.1, .25],
            A = function(t, n) {
                n = n || {}, q(g(function() {
                    var r, i = h("CLS", 0),
                        a = 0,
                        o = [],
                        s = function(t) {
                            t.forEach(function(t) {
                                if (!t.hadRecentInput) {
                                    var n = o[0],
                                        r = o[o.length - 1];
                                    a && t.startTime - r.startTime < 1e3 && t.startTime - n.startTime < 5e3 ? (a += t.value, o.push(t)) : (a = t.value, o = [t])
                                }
                            }), a > i.value && (i.value = a, i.entries = o, r())
                        },
                        u = p("layout-shift", s);
                    u && (r = v(t, i, k, n.reportAllChanges), y(function() {
                        s(u.takeRecords()), r(!0)
                    }), l(function() {
                        a = 0, r = v(t, i = h("CLS", 0), k, n.reportAllChanges), m(function() {
                            return r()
                        })
                    }), setTimeout(r, 0))
                }))
            },
            C = 0,
            I = 1 / 0,
            j = 0,
            L = function(t) {
                t.forEach(function(t) {
                    t.interactionId && (I = Math.min(I, t.interactionId), C = (j = Math.max(j, t.interactionId)) ? (j - I) / 7 + 1 : 0)
                })
            },
            O = function() {
                "interactionCount" in performance || i || (i = p("event", L, {
                    type: "event",
                    buffered: !0,
                    durationThreshold: 0
                }))
            },
            N = [],
            D = new Map,
            _ = 0,
            M = [],
            U = function(t) {
                if (M.forEach(function(n) {
                        return n(t)
                    }), t.interactionId || "first-input" === t.entryType) {
                    var n = N[N.length - 1],
                        r = D.get(t.interactionId);
                    if (r || N.length < 10 || t.duration > n.latency) {
                        if (r) t.duration > r.latency ? (r.entries = [t], r.latency = t.duration) : t.duration === r.latency && t.startTime === r.entries[0].startTime && r.entries.push(t);
                        else {
                            var i = {
                                id: t.interactionId,
                                latency: t.duration,
                                entries: [t]
                            };
                            D.set(i.id, i), N.push(i)
                        }
                        N.sort(function(t, n) {
                            return n.latency - t.latency
                        }), N.length > 10 && N.splice(10).forEach(function(t) {
                            return D.delete(t.id)
                        })
                    }
                }
            },
            B = function(t) {
                var n = self.requestIdleCallback || self.setTimeout,
                    r = -1;
                return t = g(t), "hidden" === document.visibilityState ? t() : (r = n(t), y(t)), r
            },
            V = [200, 500],
            F = function(t, n) {
                "PerformanceEventTiming" in self && "interactionId" in PerformanceEventTiming.prototype && (n = n || {}, T(function() {
                    O();
                    var r, a, o = h("INP"),
                        s = function(t) {
                            B(function() {
                                t.forEach(U);
                                var n, r = (n = Math.min(N.length - 1, Math.floor(((i ? C : performance.interactionCount || 0) - _) / 50)), N[n]);
                                r && r.latency !== o.value && (o.value = r.latency, o.entries = r.entries, a())
                            })
                        },
                        u = p("event", s, {
                            durationThreshold: null != (r = n.durationThreshold) ? r : 40
                        });
                    a = v(t, o, V, n.reportAllChanges), u && (u.observe({
                        type: "first-input",
                        buffered: !0
                    }), y(function() {
                        s(u.takeRecords()), a(!0)
                    }), l(function() {
                        _ = 0, N.length = 0, D.clear(), a = v(t, o = h("INP"), V, n.reportAllChanges)
                    }))
                }))
            },
            G = [2500, 4e3],
            W = {},
            H = function(t, n) {
                n = n || {}, T(function() {
                    var r, i = S(),
                        a = h("LCP"),
                        o = function(t) {
                            n.reportAllChanges || (t = t.slice(-1)), t.forEach(function(t) {
                                t.startTime < i.firstHiddenTime && (a.value = Math.max(t.startTime - f(), 0), a.entries = [t], r())
                            })
                        },
                        s = p("largest-contentful-paint", o);
                    if (s) {
                        r = v(t, a, G, n.reportAllChanges);
                        var u = g(function() {
                            W[a.id] || (o(s.takeRecords()), s.disconnect(), W[a.id] = !0, r(!0))
                        });
                        ["keydown", "click"].forEach(function(t) {
                            addEventListener(t, function() {
                                return B(u)
                            }, !0)
                        }), y(u), l(function(i) {
                            r = v(t, a = h("LCP"), G, n.reportAllChanges), m(function() {
                                a.value = performance.now() - i.timeStamp, W[a.id] = !0, r(!0)
                            })
                        })
                    }
                })
            },
            K = [800, 1800],
            J = function t(n) {
                document.prerendering ? T(function() {
                    return t(n)
                }) : "complete" !== document.readyState ? addEventListener("load", function() {
                    return t(n)
                }, !0) : setTimeout(n, 0)
            },
            z = function(t, n) {
                n = n || {};
                var r = h("TTFB"),
                    i = v(t, r, K, n.reportAllChanges);
                J(function() {
                    var a = d();
                    a && (r.value = Math.max(a.responseStart - f(), 0), r.entries = [a], i(!0), l(function() {
                        (i = v(t, r = h("TTFB", 0), K, n.reportAllChanges))(!0)
                    }))
                })
            },
            Q = {
                passive: !0,
                capture: !0
            },
            X = new Date,
            $ = function(t, n) {
                a || (a = n, o = t, s = new Date, ee(removeEventListener), Z())
            },
            Z = function() {
                if (o >= 0 && o < s - X) {
                    var t = {
                        entryType: "first-input",
                        name: a.type,
                        target: a.target,
                        cancelable: a.cancelable,
                        startTime: a.timeStamp,
                        processingStart: a.timeStamp + o
                    };
                    u.forEach(function(n) {
                        n(t)
                    }), u = []
                }
            },
            Y = function(t) {
                if (t.cancelable) {
                    var n, r, i, a = (t.timeStamp > 1e12 ? new Date : performance.now()) - t.timeStamp;
                    "pointerdown" == t.type ? (n = function() {
                        $(a, t), i()
                    }, r = function() {
                        i()
                    }, i = function() {
                        removeEventListener("pointerup", n, Q), removeEventListener("pointercancel", r, Q)
                    }, addEventListener("pointerup", n, Q), addEventListener("pointercancel", r, Q)) : $(a, t)
                }
            },
            ee = function(t) {
                ["mousedown", "keydown", "touchstart", "pointerdown"].forEach(function(n) {
                    return t(n, Y, Q)
                })
            },
            et = [100, 300],
            en = function(t, n) {
                n = n || {}, T(function() {
                    var r, i = S(),
                        s = h("FID"),
                        c = function(t) {
                            t.startTime < i.firstHiddenTime && (s.value = t.processingStart - t.startTime, s.entries.push(t), r(!0))
                        },
                        d = function(t) {
                            t.forEach(c)
                        },
                        f = p("first-input", d);
                    r = v(t, s, et, n.reportAllChanges), f && (y(g(function() {
                        d(f.takeRecords()), f.disconnect()
                    })), l(function() {
                        r = v(t, s = h("FID"), et, n.reportAllChanges), u = [], o = -1, a = null, ee(addEventListener), u.push(c), Z()
                    }))
                })
            };
        n.exports = r
    }()
}, 959610, (t, n, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "useReportWebVitals", {
        enumerable: !0,
        get: function() {
            return o
        }
    });
    let i = t.r(416340),
        a = t.r(482711);

    function o(t) {
        (0, i.useEffect)(() => {
            (0, a.onCLS)(t), (0, a.onFID)(t), (0, a.onLCP)(t), (0, a.onINP)(t), (0, a.onFCP)(t), (0, a.onTTFB)(t)
        }, [t])
    }("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), n.exports = r.default)
}, 68794, (t, n, r) => {
    n.exports = t.r(959610)
}]);

//# debugId=6604f898-4666-561b-ca66-38e6687c75ef
//# sourceMappingURL=3d114s0c-ut-v.js.map