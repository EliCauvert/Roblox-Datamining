;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "36f8ed5b-8f40-96f0-def1-5d208e7eaf46")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 656350, t => {
    "use strict";
    let n, r;
    var i, a, o, s, u, l, c, d, f, h, p, v = t.i(92794),
        m = t.i(221628);
    let y = "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : window;

    function g(t) {
        return Number(t)
    }
    let b = t => () => {
        throw Error("BigInt.".concat(t, " is not supported by the BigInt polyfill"))
    };
    g.asIntN = b("asIntN"), g.asUintN = b("asUintN"), y && void 0 === y.BigInt && Object.defineProperty(y, "BigInt", {
        value: g,
        writable: !0,
        configurable: !0
    });
    let w = "change",
        x = ["capture", "once", "signal"],
        P = new WeakMap,
        R = t => {
            if ("function" == typeof t) return t;
            let n = P.get(t);
            if (n) return n;
            let r = n => t.handleEvent(n);
            return P.set(t, r), r
        },
        T = (t, n, r) => {
            n !== w && console.warn("MediaQueryList polyfill: ".concat(t, " ignored '").concat(n, "' event type."));
            let i = "boolean" == typeof r ? r ? ["capture"] : [] : r ? x.filter(t => !!r[t]) : [];
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
            T("addEventListener", t, r), t === w && null != n && this.addListener(R(n))
        },
        writable: !0,
        configurable: !0
    }), Object.defineProperty(n, "removeEventListener", {
        value: function(t, n, r) {
            T("removeEventListener", t, r), t === w && null != n && this.removeListener(R(n))
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
    var S, E, q, k, A, C, I, L, j, O, D, N, _, M, B, V, U, F, G, K, W, H, z, J, Q, X, $, Z, Y, ee, et, en, er, ei, ea, eo, es, eu, el, ec, ed, ef, eh, ep, ev, em, ey, eg, eb, ew, ex, eP, eR, eT, eS, eE, eq, ek, eA, eC, eI, eL, ej, eO, eD, eN, e_, eM, eB, eV, eU, eF, eG, eK, eW, eH, ez, eJ, eQ, eX, e$, eZ, eY, e0, e1, e2, e4, e3, e6, e8, e5, e9, e7, te, tt, tn, tr, ti, ta, to, ts, tu, tl, tc, td, tf, th, tp, tv, tm, ty, tg, tb, tw, tx, tP, tR, tT, tS, tE, tq, tk, tA, tC, tI, tL, tj, tO, tD, tN, t_, tM, tB, tV, tU, tF, tG, tK, tW, tH, tz, tJ, tQ, tX, t$, tZ, tY, t0, t1, t2, t4, t3, t6, t8, t5, t9, t7, ne, nt, nn, nr, ni, na, no, ns, nu, nl, nc, nd, nf, nh, np, nv, nm, ny, ng, nb, nw, nx, nP, nR, nT, nS, nE, nq, nk, nA, nC, nI, nL, nj, nO, nD, nN, n_, nM, nB, nV, nU, nF, nG, nK, nW, nH, nz, nJ, nQ, nX, n$, nZ, nY, n0, n1, n2, n4, n3, n6, n8, n5, n9, n7, re, rt, rn, rr, ri, ra, ro, rs, ru, rl, rc, rd, rf, rh, rp, rv, rm, ry, rg, rb, rw, rx, rP, rR, rT, rS, rE, rq, rk, rA, rC, rI, rL, rj, rO, rD, rN, r_, rM, rB, rV, rU, rF, rG, rK, rW, rH, rz, rJ, rQ, rX, r$, rZ, rY, r0, r1, r2, r4, r3, r6, r8, r5, r9, r7, ie, it, ir, ii, ia, io, is, iu, il, ic, id, ih, ip, iv, im, iy = t.i(929036),
        ig = {};

    function ib() {
        if (E) return S;
        E = 1;
        var t = function(t) {
            return t && t.Math === Math && t
        };
        return S = t("object" == typeof globalThis && globalThis) || t(window) || t("object" == typeof self && self) || t("object" == typeof iy.c && iy.c) || t("object" == typeof S && S) || function() {
            return this
        }() || Function("return this")()
    }
    var iw = {};

    function ix() {
        return k ? q : (k = 1, q = function(t) {
            try {
                return !!t()
            } catch (t) {
                return !0
            }
        })
    }

    function iP() {
        return C ? A : (C = 1, A = !ix()(function() {
            return 7 !== Object.defineProperty({}, 1, {
                get: function() {
                    return 7
                }
            })[1]
        }))
    }

    function iR() {
        return L ? I : (L = 1, I = !ix()(function() {
            var t = (function() {}).bind();
            return "function" != typeof t || t.hasOwnProperty("prototype")
        }))
    }

    function iT() {
        if (O) return j;
        O = 1;
        var t = iR(),
            n = Function.prototype.call;
        return j = t ? n.bind(n) : function() {
            return n.apply(n, arguments)
        }
    }
    var iS = {};

    function iE() {
        return _ ? N : (_ = 1, N = function(t, n) {
            return {
                enumerable: !(1 & t),
                configurable: !(2 & t),
                writable: !(4 & t),
                value: n
            }
        })
    }

    function iq() {
        if (B) return M;
        B = 1;
        var t = iR(),
            n = Function.prototype,
            r = n.call,
            i = t && n.bind.bind(r, r);
        return M = t ? i : function(t) {
            return function() {
                return r.apply(t, arguments)
            }
        }
    }

    function ik() {
        if (U) return V;
        U = 1;
        var t = iq(),
            n = t({}.toString),
            r = t("".slice);
        return V = function(t) {
            return r(n(t), 8, -1)
        }
    }

    function iA() {
        if (G) return F;
        G = 1;
        var t = iq(),
            n = ix(),
            r = ik(),
            i = Object,
            a = t("".split);
        return F = n(function() {
            return !i("z").propertyIsEnumerable(0)
        }) ? function(t) {
            return "String" === r(t) ? a(t, "") : i(t)
        } : i
    }

    function iC() {
        return W ? K : (W = 1, K = function(t) {
            return null == t
        })
    }

    function iI() {
        if (z) return H;
        z = 1;
        var t = iC(),
            n = TypeError;
        return H = function(r) {
            if (t(r)) throw new n("Can't call method on " + r);
            return r
        }
    }

    function iL() {
        if (Q) return J;
        Q = 1;
        var t = iA(),
            n = iI();
        return J = function(r) {
            return t(n(r))
        }
    }

    function ij() {
        if ($) return X;
        $ = 1;
        var t = "object" == typeof document && document.all;
        return X = void 0 === t && void 0 !== t ? function(n) {
            return "function" == typeof n || n === t
        } : function(t) {
            return "function" == typeof t
        }
    }

    function iO() {
        if (Y) return Z;
        Y = 1;
        var t = ij();
        return Z = function(n) {
            return "object" == typeof n ? null !== n : t(n)
        }
    }

    function iD() {
        if (et) return ee;
        et = 1;
        var t = ib(),
            n = ij();
        return ee = function(r, i) {
            var a;
            return arguments.length < 2 ? n(a = t[r]) ? a : void 0 : t[r] && t[r][i]
        }
    }

    function iN() {
        return er ? en : (er = 1, en = iq()({}.isPrototypeOf))
    }

    function i_() {
        if (ea) return ei;
        ea = 1;
        var t = ib().navigator,
            n = t && t.userAgent;
        return ei = n ? String(n) : ""
    }

    function iM() {
        if (es) return eo;
        es = 1;
        var t, n, r = ib(),
            i = i_(),
            a = r.process,
            o = r.Deno,
            s = a && a.versions || o && o.version,
            u = s && s.v8;
        return u && (n = (t = u.split("."))[0] > 0 && t[0] < 4 ? 1 : +(t[0] + t[1])), !n && i && (!(t = i.match(/Edge\/(\d+)/)) || t[1] >= 74) && (t = i.match(/Chrome\/(\d+)/)) && (n = +t[1]), eo = n
    }

    function iB() {
        if (el) return eu;
        el = 1;
        var t = iM(),
            n = ix(),
            r = ib().String;
        return eu = !!Object.getOwnPropertySymbols && !n(function() {
            var n = Symbol("symbol detection");
            return !r(n) || !(Object(n) instanceof Symbol) || !Symbol.sham && t && t < 41
        })
    }

    function iV() {
        return ed ? ec : (ed = 1, ec = iB() && !Symbol.sham && "symbol" == typeof Symbol.iterator)
    }

    function iU() {
        if (eh) return ef;
        eh = 1;
        var t = iD(),
            n = ij(),
            r = iN(),
            i = iV(),
            a = Object;
        return ef = i ? function(t) {
            return "symbol" == typeof t
        } : function(i) {
            var o = t("Symbol");
            return n(o) && r(o.prototype, a(i))
        }
    }

    function iF() {
        if (ev) return ep;
        ev = 1;
        var t = String;
        return ep = function(n) {
            try {
                return t(n)
            } catch (t) {
                return "Object"
            }
        }
    }

    function iG() {
        if (ey) return em;
        ey = 1;
        var t = ij(),
            n = iF(),
            r = TypeError;
        return em = function(i) {
            if (t(i)) return i;
            throw new r(n(i) + " is not a function")
        }
    }

    function iK() {
        if (eb) return eg;
        eb = 1;
        var t = iG(),
            n = iC();
        return eg = function(r, i) {
            var a = r[i];
            return n(a) ? void 0 : t(a)
        }
    }
    var iW = {
        exports: {}
    };

    function iH() {
        return eR ? eP : (eR = 1, eP = !1)
    }

    function iz() {
        if (eS) return eT;
        eS = 1;
        var t = ib(),
            n = Object.defineProperty;
        return eT = function(r, i) {
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
        if (eE) return iW.exports;
        eE = 1;
        var t = iH(),
            n = ib(),
            r = iz(),
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

    function iQ() {
        if (ek) return eq;
        ek = 1;
        var t = iJ();
        return eq = function(n, r) {
            return t[n] || (t[n] = r || {})
        }
    }

    function iX() {
        if (eC) return eA;
        eC = 1;
        var t = iI(),
            n = Object;
        return eA = function(r) {
            return n(t(r))
        }
    }

    function i$() {
        if (eL) return eI;
        eL = 1;
        var t = iq(),
            n = iX(),
            r = t({}.hasOwnProperty);
        return eI = Object.hasOwn || function(t, i) {
            return r(n(t), i)
        }
    }

    function iZ() {
        if (eO) return ej;
        eO = 1;
        var t = iq(),
            n = 0,
            r = Math.random(),
            i = t(1.1.toString);
        return ej = function(t) {
            return "Symbol(" + (void 0 === t ? "" : t) + ")_" + i(++n + r, 36)
        }
    }

    function iY() {
        if (eN) return eD;
        eN = 1;
        var t = ib(),
            n = iQ(),
            r = i$(),
            i = iZ(),
            a = iB(),
            o = iV(),
            s = t.Symbol,
            u = n("wks"),
            l = o ? s.for || s : s && s.withoutSetter || i;
        return eD = function(t) {
            return r(u, t) || (u[t] = a && r(s, t) ? s[t] : l("Symbol." + t)), u[t]
        }
    }

    function i0() {
        if (eV) return eB;
        eV = 1;
        var t = function() {
                if (eM) return e_;
                eM = 1;
                var t = iT(),
                    n = iO(),
                    r = iU(),
                    i = iK(),
                    a = function() {
                        if (ex) return ew;
                        ex = 1;
                        var t = iT(),
                            n = ij(),
                            r = iO(),
                            i = TypeError;
                        return ew = function(a, o) {
                            var s, u;
                            if ("string" === o && n(s = a.toString) && !r(u = t(s, a)) || n(s = a.valueOf) && !r(u = t(s, a)) || "string" !== o && n(s = a.toString) && !r(u = t(s, a))) return u;
                            throw new i("Can't convert object to primitive value")
                        }
                    }(),
                    o = iY(),
                    s = TypeError,
                    u = o("toPrimitive");
                return e_ = function(o, l) {
                    if (!n(o) || r(o)) return o;
                    var c, d = i(o, u);
                    if (d) {
                        if (void 0 === l && (l = "default"), !n(c = t(d, o, l)) || r(c)) return c;
                        throw new s("Can't convert object to primitive value")
                    }
                    return void 0 === l && (l = "number"), a(o, l)
                }
            }(),
            n = iU();
        return eB = function(r) {
            var i = t(r, "string");
            return n(i) ? i : i + ""
        }
    }

    function i1() {
        if (eF) return eU;
        eF = 1;
        var t = ib(),
            n = iO(),
            r = t.document,
            i = n(r) && n(r.createElement);
        return eU = function(t) {
            return i ? r.createElement(t) : {}
        }
    }

    function i2() {
        if (eK) return eG;
        eK = 1;
        var t = iP(),
            n = ix(),
            r = i1();
        return eG = !t && !n(function() {
            return 7 !== Object.defineProperty(r("div"), "a", {
                get: function() {
                    return 7
                }
            }).a
        })
    }

    function i4() {
        if (eW) return iw;
        eW = 1;
        var t = iP(),
            n = iT(),
            r = function() {
                if (D) return iS;
                D = 1;
                var t = {}.propertyIsEnumerable,
                    n = Object.getOwnPropertyDescriptor;
                return iS.f = n && !t.call({
                    1: 2
                }, 1) ? function(t) {
                    var r = n(this, t);
                    return !!r && r.enumerable
                } : t, iS
            }(),
            i = iE(),
            a = iL(),
            o = i0(),
            s = i$(),
            u = i2(),
            l = Object.getOwnPropertyDescriptor;
        return iw.f = t ? l : function(t, c) {
            if (t = a(t), c = o(c), u) try {
                return l(t, c)
            } catch (t) {}
            if (s(t, c)) return i(!n(r.f, t, c), t[c])
        }, iw
    }
    var i3 = {};

    function i6() {
        if (ez) return eH;
        ez = 1;
        var t = iP(),
            n = ix();
        return eH = t && n(function() {
            return 42 !== Object.defineProperty(function() {}, "prototype", {
                value: 42,
                writable: !1
            }).prototype
        })
    }

    function i8() {
        if (eQ) return eJ;
        eQ = 1;
        var t = iO(),
            n = String,
            r = TypeError;
        return eJ = function(i) {
            if (t(i)) return i;
            throw new r(n(i) + " is not an object")
        }
    }

    function i5() {
        if (eX) return i3;
        eX = 1;
        var t = iP(),
            n = i2(),
            r = i6(),
            i = i8(),
            a = i0(),
            o = TypeError,
            s = Object.defineProperty,
            u = Object.getOwnPropertyDescriptor,
            l = "enumerable",
            c = "configurable",
            d = "writable";
        return i3.f = t ? r ? function(t, n, r) {
            if (i(t), n = a(n), i(r), "function" == typeof t && "prototype" === n && "value" in r && d in r && !r[d]) {
                var o = u(t, n);
                o && o[d] && (t[n] = r.value, r = {
                    configurable: c in r ? r[c] : o[c],
                    enumerable: l in r ? r[l] : o[l],
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
        }, i3
    }

    function i9() {
        if (eZ) return e$;
        eZ = 1;
        var t = iP(),
            n = i5(),
            r = iE();
        return e$ = t ? function(t, i, a) {
            return n.f(t, i, r(1, a))
        } : function(t, n, r) {
            return t[n] = r, t
        }
    }
    var i7 = {
        exports: {}
    };

    function ae() {
        if (e0) return eY;
        e0 = 1;
        var t = iP(),
            n = i$(),
            r = Function.prototype,
            i = t && Object.getOwnPropertyDescriptor,
            a = n(r, "name"),
            o = a && (!t || t && i(r, "name").configurable);
        return eY = {
            EXISTS: a,
            PROPER: a && "something" === (function() {}).name,
            CONFIGURABLE: o
        }
    }

    function at() {
        if (e2) return e1;
        e2 = 1;
        var t = iq(),
            n = ij(),
            r = iJ(),
            i = t(Function.toString);
        return n(r.inspectSource) || (r.inspectSource = function(t) {
            return i(t)
        }), e1 = r.inspectSource
    }

    function an() {
        if (e8) return e6;
        e8 = 1;
        var t = iQ(),
            n = iZ(),
            r = t("keys");
        return e6 = function(t) {
            return r[t] || (r[t] = n(t))
        }
    }

    function ar() {
        return e9 ? e5 : (e9 = 1, e5 = {})
    }

    function ai() {
        if (te) return e7;
        te = 1;
        var t, n, r, i = function() {
                if (e3) return e4;
                e3 = 1;
                var t = ib(),
                    n = ij(),
                    r = t.WeakMap;
                return e4 = n(r) && /native code/.test(String(r))
            }(),
            a = ib(),
            o = iO(),
            s = i9(),
            u = i$(),
            l = iJ(),
            c = an(),
            d = ar(),
            f = "Object already initialized",
            h = a.TypeError,
            p = a.WeakMap;
        if (i || l.state) {
            var v = l.state || (l.state = new p);
            v.get = v.get, v.has = v.has, v.set = v.set, t = function(t, n) {
                if (v.has(t)) throw new h(f);
                return n.facade = t, v.set(t, n), n
            }, n = function(t) {
                return v.get(t) || {}
            }, r = function(t) {
                return v.has(t)
            }
        } else {
            var m = c("state");
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

    function aa() {
        if (tt) return i7.exports;
        tt = 1;
        var t = iq(),
            n = ix(),
            r = ij(),
            i = i$(),
            a = iP(),
            o = ae().CONFIGURABLE,
            s = at(),
            u = ai(),
            l = u.enforce,
            c = u.get,
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
                var s = l(t);
                return i(s, "source") || (s.source = v(y, "string" == typeof n ? n : "")), t
            };
        return Function.prototype.toString = g(function() {
            return r(this) && c(this).source || s(this)
        }, "toString"), i7.exports
    }

    function ao() {
        if (tr) return tn;
        tr = 1;
        var t = ij(),
            n = i5(),
            r = aa(),
            i = iz();
        return tn = function(a, o, s, u) {
            u || (u = {});
            var l = u.enumerable,
                c = void 0 !== u.name ? u.name : o;
            if (t(s) && r(s, c, u), u.global) l ? a[o] = s : i(o, s);
            else {
                try {
                    u.unsafe ? a[o] && (l = !0) : delete a[o]
                } catch (t) {}
                l ? a[o] = s : n.f(a, o, {
                    value: s,
                    enumerable: !1,
                    configurable: !u.nonConfigurable,
                    writable: !u.nonWritable
                })
            }
            return a
        }
    }
    var as = {};

    function au() {
        if (ts) return to;
        ts = 1;
        var t = function() {
            if (ta) return ti;
            ta = 1;
            var t = Math.ceil,
                n = Math.floor;
            return ti = Math.trunc || function(r) {
                var i = +r;
                return (i > 0 ? n : t)(i)
            }
        }();
        return to = function(n) {
            var r = +n;
            return r != r || 0 === r ? 0 : t(r)
        }
    }

    function al() {
        if (td) return tc;
        td = 1;
        var t = au(),
            n = Math.min;
        return tc = function(r) {
            var i = t(r);
            return i > 0 ? n(i, 0x1fffffffffffff) : 0
        }
    }

    function ac() {
        if (th) return tf;
        th = 1;
        var t = al();
        return tf = function(n) {
            return t(n.length)
        }
    }

    function ad() {
        if (ty) return tm;
        ty = 1;
        var t = iq(),
            n = i$(),
            r = iL(),
            i = function() {
                if (tv) return tp;
                tv = 1;
                var t = iL(),
                    n = function() {
                        if (tl) return tu;
                        tl = 1;
                        var t = au(),
                            n = Math.max,
                            r = Math.min;
                        return tu = function(i, a) {
                            var o = t(i);
                            return o < 0 ? n(o + a, 0) : r(o, a)
                        }
                    }(),
                    r = ac(),
                    i = function(i) {
                        return function(a, o, s) {
                            var u, l = t(a),
                                c = r(l);
                            if (0 === c) return !i && -1;
                            var d = n(s, c);
                            if (i && o != o) {
                                for (; c > d;)
                                    if ((u = l[d++]) != u) return !0
                            } else
                                for (; c > d; d++)
                                    if ((i || d in l) && l[d] === o) return i || d || 0;
                            return !i && -1
                        }
                    };
                return tp = {
                    includes: i(!0),
                    indexOf: i(!1)
                }
            }().indexOf,
            a = ar(),
            o = t([].push);
        return tm = function(t, s) {
            var u, l = r(t),
                c = 0,
                d = [];
            for (u in l) !n(a, u) && n(l, u) && o(d, u);
            for (; s.length > c;) n(l, u = s[c++]) && (~i(d, u) || o(d, u));
            return d
        }
    }

    function af() {
        return tb ? tg : (tb = 1, tg = ["constructor", "hasOwnProperty", "isPrototypeOf", "propertyIsEnumerable", "toLocaleString", "toString", "valueOf"])
    }

    function ah() {
        if (tw) return as;
        tw = 1;
        var t = ad(),
            n = af().concat("length", "prototype");
        return as.f = Object.getOwnPropertyNames || function(r) {
            return t(r, n)
        }, as
    }
    var ap = {};

    function av() {
        if (tq) return tE;
        tq = 1;
        var t = ix(),
            n = ij(),
            r = /#|\.prototype\./,
            i = function(r, i) {
                var l = o[a(r)];
                return l === u || l !== s && (n(i) ? t(i) : !!i)
            },
            a = i.normalize = function(t) {
                return String(t).replace(r, ".").toLowerCase()
            },
            o = i.data = {},
            s = i.NATIVE = "N",
            u = i.POLYFILL = "P";
        return tE = i
    }

    function am() {
        if (tA) return tk;
        tA = 1;
        var t = ib(),
            n = i4().f,
            r = i9(),
            i = ao(),
            a = iz(),
            o = function() {
                if (tS) return tT;
                tS = 1;
                var t = i$(),
                    n = function() {
                        if (tR) return tP;
                        tR = 1;
                        var t = iD(),
                            n = iq(),
                            r = ah(),
                            i = (tx || (tx = 1, ap.f = Object.getOwnPropertySymbols), ap),
                            a = i8(),
                            o = n([].concat);
                        return tP = t("Reflect", "ownKeys") || function(t) {
                            var n = r.f(a(t)),
                                s = i.f;
                            return s ? o(n, s(t)) : n
                        }
                    }(),
                    r = i4(),
                    i = i5();
                return tT = function(a, o, s) {
                    for (var u = n(o), l = i.f, c = r.f, d = 0; d < u.length; d++) {
                        var f = u[d];
                        t(a, f) || s && t(s, f) || l(a, f, c(o, f))
                    }
                }
            }(),
            s = av();
        return tk = function(u, l) {
            var c, d, f, h, p, v = u.target,
                m = u.global,
                y = u.stat;
            if (c = m ? t : y ? t[v] || a(v, {}) : t[v] && t[v].prototype)
                for (d in l) {
                    if (h = l[d], f = u.dontCallGetSet ? (p = n(c, d)) && p.value : c[d], !s(m ? d : v + (y ? "." : "#") + d, u.forced) && void 0 !== f) {
                        if (typeof h == typeof f) continue;
                        o(h, f)
                    }(u.sham || f && f.sham) && r(h, "sham", !0), i(c, d, h, u)
                }
        }
    }

    function ay() {
        if (tI) return tC;
        tI = 1;
        var t = iY()("toStringTag"),
            n = {};
        return n[t] = "z", tC = "[object z]" === String(n)
    }

    function ag() {
        if (tj) return tL;
        tj = 1;
        var t = ay(),
            n = ij(),
            r = ik(),
            i = iY()("toStringTag"),
            a = Object,
            o = "Arguments" === r(function() {
                return arguments
            }()),
            s = function(t, n) {
                try {
                    return t[n]
                } catch (t) {}
            };
        return tL = t ? r : function(t) {
            var u, l, c;
            return void 0 === t ? "Undefined" : null === t ? "Null" : "string" == typeof(l = s(u = a(t), i)) ? l : o ? r(u) : "Object" === (c = r(u)) && n(u.callee) ? "Arguments" : c
        }
    }

    function ab() {
        if (tD) return tO;
        tD = 1;
        var t = ag(),
            n = String;
        return tO = function(r) {
            if ("Symbol" === t(r)) throw TypeError("Cannot convert a Symbol value to a string");
            return n(r)
        }
    }

    function aw() {
        if (t_) return tN;
        t_ = 1;
        var t = i8();
        return tN = function() {
            var n = t(this),
                r = "";
            return n.hasIndices && (r += "d"), n.global && (r += "g"), n.ignoreCase && (r += "i"), n.multiline && (r += "m"), n.dotAll && (r += "s"), n.unicode && (r += "u"), n.unicodeSets && (r += "v"), n.sticky && (r += "y"), r
        }
    }
    var ax = {};

    function aP() {
        if (tU) return tV;
        tU = 1;
        var t = ad(),
            n = af();
        return tV = Object.keys || function(r) {
            return t(r, n)
        }
    }

    function aR() {
        if (tH) return tW;
        tH = 1;
        var t, n = i8(),
            r = function() {
                if (tF) return ax;
                tF = 1;
                var t = iP(),
                    n = i6(),
                    r = i5(),
                    i = i8(),
                    a = iL(),
                    o = aP();
                return ax.f = t && !n ? Object.defineProperties : function(t, n) {
                    i(t);
                    for (var s, u = a(n), l = o(n), c = l.length, d = 0; c > d;) r.f(t, s = l[d++], u[s]);
                    return t
                }, ax
            }(),
            i = af(),
            a = ar(),
            o = tK ? tG : (tK = 1, tG = iD()("document", "documentElement")),
            s = i1(),
            u = an(),
            l = "prototype",
            c = "script",
            d = u("IE_PROTO"),
            f = function() {},
            h = function(t) {
                return "<" + c + ">" + t + "</" + c + ">"
            },
            p = function(t) {
                t.write(h("")), t.close();
                var n = t.parentWindow.Object;
                return t = null, n
            },
            v = function() {
                var t, n = s("iframe");
                return n.style.display = "none", o.appendChild(n), n.src = String("java" + c + ":"), (t = n.contentWindow.document).open(), t.write(h("document.F=Object")), t.close(), t.F
            },
            m = function() {
                try {
                    t = new ActiveXObject("htmlfile")
                } catch (t) {}
                m = "u" > typeof document ? document.domain && t ? p(t) : v() : p(t);
                for (var n = i.length; n--;) delete m[l][i[n]];
                return m()
            };
        return a[d] = !0, tW = Object.create || function(t, i) {
            var a;
            return null !== t ? (f[l] = n(t), a = new f, f[l] = null, a[d] = t) : a = m(), void 0 === i ? a : r.f(a, i)
        }
    }

    function aT() {
        if (tZ) return t$;
        tZ = 1;
        var t, n, r = iT(),
            i = iq(),
            a = ab(),
            o = aw(),
            s = function() {
                if (tB) return tM;
                tB = 1;
                var t = ix(),
                    n = ib().RegExp,
                    r = t(function() {
                        var t = n("a", "y");
                        return t.lastIndex = 2, null !== t.exec("abcd")
                    }),
                    i = r || t(function() {
                        return !n("a", "y").sticky
                    });
                return tM = {
                    BROKEN_CARET: r || t(function() {
                        var t = n("^r", "gy");
                        return t.lastIndex = 2, null !== t.exec("str")
                    }),
                    MISSED_STICKY: i,
                    UNSUPPORTED_Y: r
                }
            }(),
            u = iQ(),
            l = aR(),
            c = ai().get,
            d = function() {
                if (tJ) return tz;
                tJ = 1;
                var t = ix(),
                    n = ib().RegExp;
                return tz = t(function() {
                    var t = n(".", "s");
                    return !(t.dotAll && t.test("\n") && "s" === t.flags)
                })
            }(),
            f = function() {
                if (tX) return tQ;
                tX = 1;
                var t = ix(),
                    n = ib().RegExp;
                return tQ = t(function() {
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
                for (var r = t.groups = l(null), i = 0; i < n.length; i++) {
                    var a = n[i];
                    r[a[0]] = t[a[1]]
                }
            };
        return (w || P || x || d || f) && (v = function(t) {
            var n, i, s, u = c(this),
                l = a(t),
                d = u.raw;
            if (d) return d.lastIndex = this.lastIndex, n = r(v, d, l), this.lastIndex = d.lastIndex, n && u.groups && R(n, u.groups), n;
            var f = u.groups,
                T = x && this.sticky,
                S = r(o, this),
                E = this.source,
                q = 0,
                k = l;
            if (T) {
                -1 === y(S = g(S, "y", ""), "g") && (S += "g"), k = b(l, this.lastIndex);
                var A = this.lastIndex > 0 && m(l, this.lastIndex - 1);
                this.lastIndex > 0 && (!this.multiline || this.multiline && "\n" !== A && "\r" !== A && "\u2028" !== A && "\u2029" !== A) && (E = "(?: (?:" + E + "))", k = " " + k, q++), i = RegExp("^(?:" + E + ")", S)
            }
            P && (i = RegExp("^" + E + "$(?!\\s)", S)), w && (s = this.lastIndex);
            var C = r(p, T ? i : this, k);
            return T ? C ? (C.input = l, C[0] = b(C[0], q), C.index = this.lastIndex, this.lastIndex += C[0].length) : this.lastIndex = 0 : w && C && (this.lastIndex = this.global ? C.index + C[0].length : s), P && C && C.length > 1 && r(h, C[0], i, function() {
                for (var t = 1; t < arguments.length - 2; t++) void 0 === arguments[t] && (C[t] = void 0)
            }), C && f && R(C, f), C
        }), t$ = v
    }

    function aS() {
        if (tY) return ig;
        tY = 1;
        var t = am(),
            n = aT();
        return t({
            target: "RegExp",
            proto: !0,
            forced: /./.exec !== n
        }, {
            exec: n
        }), ig
    }

    function aE() {
        if (t7) return t9;
        t7 = 1;
        var t = iq(),
            n = iX(),
            r = Math.floor,
            i = t("".charAt),
            a = t("".replace),
            o = t("".slice),
            s = /\$([$&'`]|\d{1,2}|<[^>]*>)/g,
            u = /\$([$&'`]|\d{1,2})/g;
        return t9 = function(t, l, c, d, f, h) {
            var p = c + t.length,
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
                        return o(l, 0, c);
                    case "'":
                        return o(l, p);
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

    function aq() {
        if (nr) return nn;
        nr = 1;
        var t = iT(),
            n = i$(),
            r = iN(),
            i = function() {
                if (nt) return ne;
                nt = 1;
                var t = ib(),
                    n = ix(),
                    r = t.RegExp;
                return ne = {
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
            a = aw(),
            o = RegExp.prototype;
        return nn = i.correct ? function(t) {
            return t.flags
        } : function(s) {
            return !i.correct && r(o, s) && !n(s, "flags") ? t(a, s) : s.flags
        }
    }

    function ak() {
        if (nd) return nc;
        nd = 1;
        var t = ib(),
            n = iq();
        return nc = function(r, i) {
            return n(t[r].prototype[i])
        }
    }

    function aA() {
        if (np) return nh;
        np = 1;
        var t = iY(),
            n = aR(),
            r = i5().f,
            i = t("unscopables"),
            a = Array.prototype;
        return void 0 === a[i] && r(a, i, {
            configurable: !0,
            value: n(null)
        }), nh = function(t) {
            a[i][t] = !0
        }
    }

    function aC() {
        if (nP) return nx;
        nP = 1;
        var t = function() {
                if (nw) return nb;
                nw = 1;
                var t = ik(),
                    n = iq();
                return nb = function(r) {
                    if ("Function" === t(r)) return n(r)
                }
            }(),
            n = iG(),
            r = iR(),
            i = t(t.bind);
        return nx = function(t, a) {
            return n(t), void 0 === a ? t : r ? i(t, a) : function() {
                return t.apply(a, arguments)
            }
        }
    }

    function aI() {
        if (nT) return nR;
        nT = 1;
        var t = aC(),
            n = iA(),
            r = iX(),
            i = ac(),
            a = function(a) {
                var o = 1 === a;
                return function(s, u, l) {
                    for (var c, d = r(s), f = n(d), h = i(f), p = t(u, l); h-- > 0;)
                        if (p(c = f[h], h, d)) switch (a) {
                            case 0:
                                return c;
                            case 1:
                                return h
                        }
                    return o ? -1 : void 0
                }
            };
        return nR = {
            findLast: a(0),
            findLastIndex: a(1)
        }
    }

    function aL() {
        if (nI) return nC;
        nI = 1;
        var t = iP(),
            n = i5(),
            r = iE();
        return nC = function(i, a, o) {
            t ? n.f(i, a, r(0, o)) : i[a] = o
        }
    }

    function aj() {
        return nj ? nL : (nj = 1, nL = {})
    }

    function aO() {
        if (n_) return nN;
        n_ = 1;
        var t = ag(),
            n = iK(),
            r = iC(),
            i = aj(),
            a = iY()("iterator");
        return nN = function(o) {
            if (!r(o)) return n(o, a) || n(o, "@@iterator") || i[t(o)]
        }
    }

    function aD() {
        if (nG) return nF;
        nG = 1;
        var t = aC(),
            n = iT(),
            r = i8(),
            i = iF(),
            a = function() {
                if (nD) return nO;
                nD = 1;
                var t = iY(),
                    n = aj(),
                    r = t("iterator"),
                    i = Array.prototype;
                return nO = function(t) {
                    return void 0 !== t && (n.Array === t || i[r] === t)
                }
            }(),
            o = ac(),
            s = iN(),
            u = function() {
                if (nB) return nM;
                nB = 1;
                var t = iT(),
                    n = iG(),
                    r = i8(),
                    i = iF(),
                    a = aO(),
                    o = TypeError;
                return nM = function(s, u) {
                    var l = arguments.length < 2 ? a(s) : u;
                    if (n(l)) return r(t(l, s));
                    throw new o(i(s) + " is not iterable")
                }
            }(),
            l = aO(),
            c = function() {
                if (nU) return nV;
                nU = 1;
                var t = iT(),
                    n = i8(),
                    r = iK();
                return nV = function(i, a, o) {
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
        return nF = function(p, v, m) {
            var y, g, b, w, x, P, R, T = m && m.that,
                S = !!(m && m.AS_ENTRIES),
                E = !!(m && m.IS_RECORD),
                q = !!(m && m.IS_ITERATOR),
                k = !!(m && m.INTERRUPTED),
                A = t(v, T),
                C = function(t) {
                    var n = y;
                    return y = void 0, n && c(n, "normal"), new f(!0, t)
                },
                I = function(t) {
                    return S ? (r(t), k ? A(t[0], t[1], C) : A(t[0], t[1])) : k ? A(t, C) : A(t)
                };
            if (E) y = p.iterator;
            else if (q) y = p;
            else {
                if (!(g = l(p))) throw new d(i(p) + " is not iterable");
                if (a(g)) {
                    for (b = 0, w = o(p); w > b; b++)
                        if ((x = I(p[b])) && s(h, x)) return x;
                    return new f(!1)
                }
                y = u(p, g)
            }
            for (P = E ? p.next : y.next; !(R = n(P, y)).done;) {
                var L = R.value;
                try {
                    x = I(L)
                } catch (t) {
                    if (y) c(y, "throw", t);
                    else throw t
                }
                if ("object" == typeof x && x && s(h, x)) return x
            }
            return new f(!1)
        }
    }

    function aN() {
        return nH ? nW : (nH = 1, nW = ib())
    }

    function a_() {
        if (nQ) return nJ;
        nQ = 1;
        var t = ab();
        return nJ = function(n, r) {
            return void 0 === n ? arguments.length < 2 ? "" : r : t(n)
        }
    }

    function aM() {
        if (n$) return nX;
        n$ = 1;
        var t = iP(),
            n = ix(),
            r = i8(),
            i = a_(),
            a = Error.prototype.toString;
        return nX = n(function() {
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

    function aB() {
        if (n2) return n1;
        n2 = 1;
        var t = i$(),
            n = ij(),
            r = iX(),
            i = an(),
            a = n0 ? nY : (n0 = 1, nY = !ix()(function() {
                function t() {}
                return t.prototype.constructor = null, Object.getPrototypeOf(new t) !== t.prototype
            })),
            o = i("IE_PROTO"),
            s = Object,
            u = s.prototype;
        return n1 = a ? s.getPrototypeOf : function(i) {
            var a = r(i);
            if (t(a, o)) return a[o];
            var l = a.constructor;
            return n(l) && a instanceof l ? l.prototype : a instanceof s ? u : null
        }
    }

    function aV() {
        if (n3) return n4;
        n3 = 1;
        var t, n, r, i = ix(),
            a = ij(),
            o = iO(),
            s = aR(),
            u = aB(),
            l = ao(),
            c = iY(),
            d = iH(),
            f = c("iterator"),
            h = !1;
        return [].keys && ("next" in (r = [].keys()) ? (n = u(u(r))) !== Object.prototype && (t = n) : h = !0), !o(t) || i(function() {
            var n = {};
            return t[f].call(n) !== n
        }) ? t = {} : d && (t = s(t)), a(t[f]) || l(t, f, function() {
            return this
        }), n4 = {
            IteratorPrototype: t,
            BUGGY_SAFARI_ITERATORS: h
        }
    }

    function aU() {
        if (n8) return n6;
        n8 = 1;
        var t = i5().f,
            n = i$(),
            r = iY()("toStringTag");
        return n6 = function(i, a, o) {
            i && !o && (i = i.prototype), i && !n(i, r) && t(i, r, {
                configurable: !0,
                value: a
            })
        }
    }

    function aF() {
        if (ro) return ra;
        ro = 1;
        var t = function() {
                if (re) return n7;
                re = 1;
                var t = iq(),
                    n = iG();
                return n7 = function(r, i, a) {
                    try {
                        return t(n(Object.getOwnPropertyDescriptor(r, i)[a]))
                    } catch (t) {}
                }
            }(),
            n = iO(),
            r = iI(),
            i = function() {
                if (ri) return rr;
                ri = 1;
                var t = function() {
                        if (rn) return rt;
                        rn = 1;
                        var t = iO();
                        return rt = function(n) {
                            return t(n) || null === n
                        }
                    }(),
                    n = String,
                    r = TypeError;
                return rr = function(i) {
                    if (t(i)) return i;
                    throw new r("Can't set " + n(i) + " as a prototype")
                }
            }();
        return ra = Object.setPrototypeOf || ("__proto__" in {} ? function() {
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

    function aG() {
        if (ru) return rs;
        ru = 1;
        var t = am(),
            n = iT(),
            r = iH(),
            i = ae(),
            a = ij(),
            o = function() {
                if (n9) return n5;
                n9 = 1;
                var t = aV().IteratorPrototype,
                    n = aR(),
                    r = iE(),
                    i = aU(),
                    a = aj(),
                    o = function() {
                        return this
                    };
                return n5 = function(s, u, l, c) {
                    var d = u + " Iterator";
                    return s.prototype = n(t, {
                        next: r(+!c, l)
                    }), i(s, d, !1, !0), a[d] = o, s
                }
            }(),
            s = aB(),
            u = aF(),
            l = aU(),
            c = i9(),
            d = ao(),
            f = iY(),
            h = aj(),
            p = aV(),
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
        return rs = function(i, f, p, T, S, E, q) {
            o(p, f, T);
            var k, A, C, I = function(t) {
                    if (t === S && N) return N;
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
                L = f + " Iterator",
                j = !1,
                O = i.prototype,
                D = O[b] || O["@@iterator"] || S && O[S],
                N = !g && D || I(S),
                _ = "Array" === f && O.entries || D;
            if (_ && (k = s(_.call(new i))) !== Object.prototype && k.next && (!r && s(k) !== y && (u ? u(k, y) : a(k[b]) || d(k, b, R)), l(k, L, !0, !0), r && (h[L] = R)), v && S === x && D && D.name !== x && (!r && m ? c(O, "name", x) : (j = !0, N = function() {
                    return n(D, this)
                })), S)
                if (A = {
                        values: I(x),
                        keys: E ? N : I(w),
                        entries: I(P)
                    }, q)
                    for (C in A) !g && !j && C in O || d(O, C, A[C]);
                else t({
                    target: f,
                    proto: !0,
                    forced: g || j
                }, A);
            return (!r || q) && O[b] !== N && d(O, b, N, {
                name: S
            }), h[f] = N, A
        }
    }

    function aK() {
        return rc ? rl : (rc = 1, rl = function(t, n) {
            return {
                value: t,
                done: n
            }
        })
    }
    nf || (nf = 1, aS(), function() {
        if (!no) {
            no = 1;
            var t = function() {
                    if (t1) return t0;
                    t1 = 1;
                    var t = iR(),
                        n = Function.prototype,
                        r = n.apply,
                        i = n.call;
                    return t0 = "object" == typeof Reflect && Reflect.apply || (t ? i.bind(r) : function() {
                        return i.apply(r, arguments)
                    })
                }(),
                n = iT(),
                r = iq(),
                i = function() {
                    if (t4) return t2;
                    t4 = 1, aS();
                    var t = iT(),
                        n = ao(),
                        r = aT(),
                        i = ix(),
                        a = iY(),
                        o = i9(),
                        s = a("species"),
                        u = RegExp.prototype;
                    return t2 = function(l, c, d, f) {
                        var h = a(l),
                            p = !i(function() {
                                var t = {};
                                return t[h] = function() {
                                    return 7
                                }, 7 !== "" [l](t)
                            }),
                            v = p && !i(function() {
                                var t = !1,
                                    n = /a/;
                                if ("split" === l) {
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
                                y = c(h, "" [l], function(n, i, a, o, s) {
                                    var l = i.exec;
                                    return l === r || l === u.exec ? p && !s ? {
                                        done: !0,
                                        value: t(m, i, a, o)
                                    } : {
                                        done: !0,
                                        value: t(n, a, i, o)
                                    } : {
                                        done: !1
                                    }
                                });
                            n(String.prototype, l, y[0]), n(u, h, y[1])
                        }
                        f && o(u[h], "sham", !0)
                    }
                }(),
                a = ix(),
                o = i8(),
                s = ij(),
                u = iO(),
                l = au(),
                c = al(),
                d = ab(),
                f = iI(),
                h = function() {
                    if (t5) return t8;
                    t5 = 1;
                    var t = function() {
                        if (t6) return t3;
                        t6 = 1;
                        var t = iq(),
                            n = au(),
                            r = ab(),
                            i = iI(),
                            a = t("".charAt),
                            o = t("".charCodeAt),
                            s = t("".slice),
                            u = function(t) {
                                return function(u, l) {
                                    var c, d, f = r(i(u)),
                                        h = n(l),
                                        p = f.length;
                                    return h < 0 || h >= p ? t ? "" : void 0 : (c = o(f, h)) < 55296 || c > 56319 || h + 1 === p || (d = o(f, h + 1)) < 56320 || d > 57343 ? t ? a(f, h) : c : t ? s(f, h, h + 2) : (c - 55296 << 10) + (d - 56320) + 65536
                                }
                            };
                        return t3 = {
                            codeAt: u(!1),
                            charAt: u(!0)
                        }
                    }().charAt;
                    return t8 = function(n, r, i) {
                        return r + (i && t(n, r).length || 1)
                    }
                }(),
                p = iK(),
                v = aE(),
                m = aq(),
                y = function() {
                    if (na) return ni;
                    na = 1;
                    var t = iT(),
                        n = i8(),
                        r = ij(),
                        i = ik(),
                        a = aT(),
                        o = TypeError;
                    return ni = function(s, u) {
                        var l = s.exec;
                        if (r(l)) {
                            var c = t(l, s, u);
                            return null !== c && n(c), c
                        }
                        if ("RegExp" === i(s)) return t(a, s, u);
                        throw new o("RegExp#exec called on incompatible receiver")
                    }
                }(),
                g = iY()("replace"),
                b = Math.max,
                w = Math.min,
                x = r([].concat),
                P = r([].push),
                R = r("".indexOf),
                T = r("".slice),
                S = "$0" === "a".replace(/./, "$0"),
                E = !!/./ [g] && "" === /./ [g]("a", "$0");
            i("replace", function(r, i, a) {
                var S = E ? "$" : "$0";
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
                    if ("string" == typeof r && !~R(r, S) && !~R(r, "$<") && !~R(g, "y")) {
                        var E = a(i, u, f, r);
                        if (E.done) return E.value
                    }
                    var q = !!~R(g, "g");
                    q && (j = !!~R(g, "u") || !!~R(g, "v"), u.lastIndex = 0);
                    for (var k = []; null !== (D = y(u, f)) && (P(k, D), q);) "" === d(D[0]) && (u.lastIndex = h(f, c(u.lastIndex), j));
                    for (var A = "", C = 0, I = 0; I < k.length; I++) {
                        for (var L, j, O, D = k[I], N = d(D[0]), _ = b(w(l(D.index), f.length), 0), M = [], B = 1; B < D.length; B++) P(M, void 0 === (L = D[B]) ? L : String(L));
                        var V = D.groups;
                        if (p) {
                            var U = x([N], M, _, f);
                            void 0 !== V && P(U, V), O = d(t(r, void 0, U))
                        } else O = v(N, f, _, M, V, r);
                        _ >= C && (A += T(f, C, _) + O, C = _ + N.length)
                    }
                    return A + T(f, C)
                }]
            }, !!a(function() {
                var t = /./;
                return t.exec = function() {
                    var t = [];
                    return t.groups = {
                        a: "7"
                    }, t
                }, "7" !== "".replace(t, "$<a>")
            }) || !S || E)
        }
    }(), function() {
        if (!nl) {
            nl = 1;
            var t = am(),
                n = iT(),
                r = iq(),
                i = iI(),
                a = ij(),
                o = iO(),
                s = function() {
                    if (nu) return ns;
                    nu = 1;
                    var t = iO(),
                        n = ik(),
                        r = iY()("match");
                    return ns = function(i) {
                        var a;
                        return t(i) && (void 0 !== (a = i[r]) ? !!a : "RegExp" === n(i))
                    }
                }(),
                u = ab(),
                l = iK(),
                c = aq(),
                d = aE(),
                f = iY(),
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
                    var f, w, x, P, R, T, S, E, q, k = i(this),
                        A = 0,
                        C = "";
                    if (o(t)) {
                        if ((f = s(t)) && !~m(u(i(c(t))), "g")) throw new v("`.replaceAll` does not allow non-global regexes");
                        if (w = l(t, p)) return n(w, t, k, r);
                        if (h && f) return y(u(k), t, r)
                    }
                    for (x = u(k), P = u(t), (R = a(r)) || (r = u(r)), S = b(1, T = P.length), E = m(x, P); - 1 !== E;) q = R ? u(r(P, E, x)) : d(P, x, E, [], void 0, r), C += g(x, A, E) + q, A = E + T, E = E + S > x.length ? -1 : m(x, P, E + S);
                    return A < x.length && (C += g(x, A)), C
                }
            })
        }
    }(), ak()("String", "replaceAll")), nm || (nm = 1, function() {
        if (!nv) {
            nv = 1;
            var t = am(),
                n = iX(),
                r = ac(),
                i = au(),
                a = aA();
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
    }(), ak()("Array", "at")), ng || (ng = 1, function() {
        if (!ny) {
            ny = 1;
            var t = am(),
                n = iq(),
                r = iI(),
                i = au(),
                a = ab(),
                o = ix(),
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
                        l = u >= 0 ? u : o + u;
                    return l < 0 || l >= o ? void 0 : s(n, l)
                }
            })
        }
    }(), ak()("String", "at")), nE || (nE = 1, function() {
        if (!nS) {
            nS = 1;
            var t = am(),
                n = aI().findLast,
                r = aA();
            t({
                target: "Array",
                proto: !0
            }, {
                findLast: function(t) {
                    return n(this, t, arguments.length > 1 ? arguments[1] : void 0)
                }
            }), r("findLast")
        }
    }(), ak()("Array", "findLast")), nk || (nk = 1, function() {
        if (!nq) {
            nq = 1;
            var t = am(),
                n = aI().findLastIndex,
                r = aA();
            t({
                target: "Array",
                proto: !0
            }, {
                findLastIndex: function(t) {
                    return n(this, t, arguments.length > 1 ? arguments[1] : void 0)
                }
            }), r("findLastIndex")
        }
    }(), ak()("Array", "findLastIndex")), nz || (nz = 1, nA || (nA = 1, am()({
        target: "Object",
        stat: !0,
        sham: !iP()
    }, {
        create: aR()
    })), function() {
        if (!nK) {
            nK = 1;
            var t = am(),
                n = aL(),
                r = iD(),
                i = iq(),
                a = iG(),
                o = iI(),
                s = i0(),
                u = aD(),
                l = ix(),
                c = Object.groupBy,
                d = r("Object", "create"),
                f = i([].push);
            t({
                target: "Object",
                stat: !0,
                forced: !c || l(function() {
                    return 1 !== c("ab", function(t) {
                        return t
                    }).a.length
                })
            }, {
                groupBy: function(t, r) {
                    o(t), a(r);
                    var i = d(null),
                        l = 0;
                    return u(t, function(t) {
                        var a = s(r(t, l++));
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

    function az() {
        if (rS) return aW.exports;
        rS = 1;
        var t = am(),
            n = iq(),
            r = ar(),
            i = iO(),
            a = i$(),
            o = i5().f,
            s = ah(),
            u = function() {
                if (rg) return aH;
                rg = 1;
                var t = ik(),
                    n = iL(),
                    r = ah().f,
                    i = ry ? rm : (ry = 1, rm = iq()([].slice)),
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
            l = function() {
                if (rP) return rx;
                rP = 1;
                var t = ix(),
                    n = iO(),
                    r = ik(),
                    i = rw ? rb : (rw = 1, rb = ix()(function() {
                        if ("function" == typeof ArrayBuffer) {
                            var t = new ArrayBuffer(8);
                            Object.isExtensible(t) && Object.defineProperty(t, "a", {
                                value: 8
                            })
                        }
                    })),
                    a = Object.isExtensible;
                return rx = t(function() {}) || i ? function(t) {
                    return !!n(t) && (!i || "ArrayBuffer" !== r(t)) && (!a || a(t))
                } : a
            }(),
            c = iZ(),
            d = rT ? rR : (rT = 1, rR = !ix()(function() {
                return Object.isExtensible(Object.preventExtensions({}))
            })),
            f = !1,
            h = c("meta"),
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
                        if (!l(t)) return "F";
                        if (!n) return "E";
                        v(t)
                    }
                    return t[h].objectID
                },
                getWeakData: function(t, n) {
                    if (!a(t, h)) {
                        if (!l(t)) return !0;
                        if (!n) return !1;
                        v(t)
                    }
                    return t[h].weakData
                },
                onFreeze: function(t) {
                    return d && f && l(t) && !a(t, h) && v(t), t
                }
            };
        return r[h] = !0, aW.exports
    }

    function aJ() {
        if (rq) return rE;
        rq = 1;
        var t = iN(),
            n = TypeError;
        return rE = function(r, i) {
            if (t(i, r)) return r;
            throw new n("Incorrect invocation")
        }
    }

    function aQ() {
        if (rI) return rC;
        rI = 1;
        var t = ij(),
            n = iO(),
            r = aF();
        return rC = function(i, a, o) {
            var s, u;
            return r && t(s = a.constructor) && s !== o && n(u = s.prototype) && u !== o.prototype && r(i, u), i
        }
    }

    function aX() {
        if (rj) return rL;
        rj = 1;
        var t = am(),
            n = ib(),
            r = iq(),
            i = av(),
            a = ao(),
            o = az(),
            s = aD(),
            u = aJ(),
            l = ij(),
            c = iC(),
            d = iO(),
            f = ix(),
            h = function() {
                if (rA) return rk;
                rA = 1;
                var t = iY()("iterator"),
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
                return rk = function(r, i) {
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
            p = aU(),
            v = aQ();
        return rL = function(m, y, g) {
            var b = -1 !== m.indexOf("Map"),
                w = -1 !== m.indexOf("Weak"),
                x = b ? "set" : "add",
                P = n[m],
                R = P && P.prototype,
                T = P,
                S = {},
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
            if (i(m, !l(P) || !(w || R.forEach && !f(function() {
                    new P().entries().next()
                })))) T = g.getConstructor(y, m, b, x), o.enable();
            else if (i(m, !0)) {
                var q = new T,
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
                C || ((T = y(function(t, n) {
                    u(t, R);
                    var r = v(new P, t, T);
                    return c(n) || s(n, r[x], {
                        that: r,
                        AS_ENTRIES: b
                    }), r
                })).prototype = R, R.constructor = T), (A || I) && (E("delete"), E("has"), b && E("get")), (I || k) && E(x), w && R.clear && delete R.clear
            }
            return S[m] = T, t({
                global: !0,
                constructor: !0,
                forced: T !== P
            }, S), p(T, m), w || g.setStrong(T, m, b), T
        }
    }

    function a$() {
        if (rD) return rO;
        rD = 1;
        var t = aa(),
            n = i5();
        return rO = function(r, i, a) {
            return a.get && t(a.get, i, {
                getter: !0
            }), a.set && t(a.set, i, {
                setter: !0
            }), n.f(r, i, a)
        }
    }

    function aZ() {
        if (rU) return rV;
        rU = 1;
        var t = aR(),
            n = a$(),
            r = function() {
                if (r_) return rN;
                r_ = 1;
                var t = ao();
                return rN = function(n, r, i) {
                    for (var a in r) t(n, a, r[a], i);
                    return n
                }
            }(),
            i = aC(),
            a = aJ(),
            o = iC(),
            s = aD(),
            u = aG(),
            l = aK(),
            c = function() {
                if (rB) return rM;
                rB = 1;
                var t = iD(),
                    n = a$(),
                    r = iY(),
                    i = iP(),
                    a = r("species");
                return rM = function(r) {
                    var o = t(r);
                    i && o && !o[a] && n(o, a, {
                        configurable: !0,
                        get: function() {
                            return this
                        }
                    })
                }
            }(),
            d = iP(),
            f = az().fastKey,
            h = ai(),
            p = h.set,
            v = h.getterFor;
        return rV = {
            getConstructor: function(u, l, c, h) {
                var m = u(function(n, r) {
                        a(n, y), p(n, {
                            type: l,
                            index: t(null),
                            first: null,
                            last: null,
                            size: 0
                        }), d || (n.size = 0), o(r) || s(r, n[h], {
                            that: n,
                            AS_ENTRIES: c
                        })
                    }),
                    y = m.prototype,
                    g = v(l),
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
                }), r(y, c ? {
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
                    return t.target && (t.last = r = r ? r.next : t.state.first) ? "keys" === n ? l(r.key, !1) : "values" === n ? l(r.value, !1) : l([r.key, r.value], !1) : (t.target = null, l(void 0, !0))
                }, r ? "entries" : "values", !r, !0), c(n)
            }
        }
    }

    function aY() {
        if (rz) return rH;
        rz = 1;
        var t = ib(),
            n = i_(),
            r = ik(),
            i = function(t) {
                return n.slice(0, t.length) === t
            };
        return rH = i("Bun/") ? "BUN" : i("Cloudflare-Workers") ? "CLOUDFLARE" : i("Deno/") ? "DENO" : i("Node.js/") ? "NODE" : t.Bun && "string" == typeof Bun.version ? "BUN" : t.Deno && "object" == typeof Deno.version ? "DENO" : "process" === r(t.process) ? "NODE" : t.window && t.document ? "BROWSER" : "REST"
    }

    function a0() {
        if (r$) return rX;
        r$ = 1;
        var t = ib(),
            n = rQ ? rJ : (rQ = 1, rJ = "NODE" === aY());
        return rX = function(r) {
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

    function a1() {
        return rY ? rZ : (rY = 1, rZ = {
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

    function a2() {
        if (r1) return r0;
        r1 = 1;
        var t = iq(),
            n = Error,
            r = t("".replace),
            i = String(new n("zxcasd").stack),
            a = /\n\s*at [^:]*:[^\n]*/,
            o = a.test(i);
        return r0 = function(t, i) {
            if (o && "string" == typeof t && !n.prepareStackTrace)
                for (; i--;) t = r(t, a, "");
            return t
        }
    }

    function a4() {
        if (ir) return it;
        ir = 1;
        var t = iq(),
            n = Set.prototype;
        return it = {
            Set: Set,
            add: t(n.add),
            has: t(n.has),
            remove: t(n.delete),
            proto: n
        }
    }

    function a3() {
        if (il) return iu;
        il = 1;
        var t = ib(),
            n = ix(),
            r = iM(),
            i = aY(),
            a = t.structuredClone;
        return iu = !!a && !n(function() {
            if ("DENO" === i && r > 92 || "NODE" === i && r > 94 || "BROWSER" === i && r > 97) return !1;
            var t = new ArrayBuffer(8),
                n = a(t, {
                    transfer: [t]
                });
            return 0 !== t.byteLength || 8 !== n.byteLength
        })
    }

    function a6(t) {
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

    function a8(t) {
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

    function a5(t, n) {
        this.name = "AggregateError", this.errors = t, this.message = n || ""
    }

    function a9(t) {
        var n = this;
        return new n(function(r, i) {
            if (!(t && void 0 !== t.length)) return i(TypeError("Promise.any accepts an array"));
            var a = Array.prototype.slice.call(t);
            if (0 === a.length) return i();
            for (var o = [], s = 0; s < a.length; s++) try {
                n.resolve(a[s]).then(r).catch(function(t) {
                    o.push(t), o.length === a.length && i(new a5(o, "All promises were rejected"))
                })
            } catch (t) {
                i(t)
            }
        })
    }
    im || (im = 1, function() {
        if (!nZ) {
            nZ = 1;
            var t = ao(),
                n = aM(),
                r = Error.prototype;
            r.toString !== n && t(r, "toString", n)
        }
    }(), function() {
        if (!rd) {
            rd = 1;
            var t = iL(),
                n = aA(),
                r = aj(),
                i = ai(),
                a = i5().f,
                o = aG(),
                s = aK(),
                u = iH(),
                l = iP(),
                c = "Array Iterator",
                d = i.set,
                f = i.getterFor(c);
            o(Array, "Array", function(n, r) {
                d(this, {
                    type: c,
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
            if (n("keys"), n("values"), n("entries"), !u && l && "values" !== h.name) try {
                a(h, "name", {
                    value: "values"
                })
            } catch (t) {}
        }
    }(), function() {
        if (!rf) {
            rf = 1;
            var t = am(),
                n = iX(),
                r = aP();
            t({
                target: "Object",
                stat: !0,
                forced: ix()(function() {
                    r(1)
                })
            }, {
                keys: function(t) {
                    return r(n(t))
                }
            })
        }
    }(), function() {
        if (!rv) {
            rv = 1;
            var t = ay(),
                n = ao(),
                r = function() {
                    if (rp) return rh;
                    rp = 1;
                    var t = ay(),
                        n = ag();
                    return rh = t ? ({}).toString : function() {
                        return "[object " + n(this) + "]"
                    }
                }();
            t || n(Object.prototype, "toString", r, {
                unsafe: !0
            })
        }
    }(), rG || (rG = 1, rF || (rF = 1, aX()("Map", function(t) {
        return function() {
            return t(this, arguments.length ? arguments[0] : void 0)
        }
    }, aZ()))), rW || (rW = 1, rK || (rK = 1, aX()("Set", function(t) {
        return function() {
            return t(this, arguments.length ? arguments[0] : void 0)
        }
    }, aZ()))), function() {
        if (!r2) {
            r2 = 1;
            var t = am(),
                n = iD(),
                r = a0(),
                i = ix(),
                a = aR(),
                o = iE(),
                s = i5().f,
                u = ao(),
                l = a$(),
                c = i$(),
                d = aJ(),
                f = i8(),
                h = aM(),
                p = a_(),
                v = a1(),
                m = a2(),
                y = ai(),
                g = iP(),
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
                T = R && R.prototype,
                S = P.prototype,
                E = y.set,
                q = y.getterFor(w),
                k = "stack" in new P(w),
                A = function(t) {
                    return c(v, t) && v[t].m ? v[t].c : 0
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
                I = C.prototype = a(S),
                L = function(t) {
                    return {
                        enumerable: !0,
                        configurable: !0,
                        get: t
                    }
                },
                j = function(t) {
                    return L(function() {
                        return q(this)[t]
                    })
                };
            g && (l(I, "code", j("code")), l(I, "message", j("message")), l(I, "name", j("name"))), s(I, "constructor", o(1, C));
            var O = i(function() {
                    return !(new R instanceof P)
                }),
                D = O || i(function() {
                    return S.toString !== h || "2: 1" !== String(new R(1, 2))
                }),
                N = O || i(function() {
                    return 25 !== new R(1, "DataCloneError").code
                }),
                _ = O || 25 !== R[x] || 25 !== T[x],
                M = b ? D || N || _ : O;
            t({
                global: !0,
                constructor: !0,
                forced: M
            }, {
                DOMException: M ? C : R
            });
            var B = n(w),
                V = B.prototype;
            for (var U in D && (b || R === B) && u(V, "toString", h), N && g && R === B && l(V, "code", L(function() {
                    return A(f(this).name)
                })), v)
                if (c(v, U)) {
                    var F = v[U],
                        G = F.s,
                        K = o(6, F.c);
                    c(B, G) || s(B, G, K), c(V, G) || s(V, G, K)
                }
        }
    }(), function() {
        if (!r4) {
            r4 = 1;
            var t = am(),
                n = ib(),
                r = iD(),
                i = iE(),
                a = i5().f,
                o = i$(),
                s = aJ(),
                u = aQ(),
                l = a_(),
                c = a1(),
                d = a2(),
                f = iP(),
                h = iH(),
                p = "DOMException",
                v = r("Error"),
                m = r(p),
                y = function() {
                    s(this, g);
                    var t = arguments.length,
                        n = l(t < 1 ? void 0 : arguments[0]),
                        r = l(t < 2 ? void 0 : arguments[1], "Error"),
                        o = new m(n, r),
                        c = new v(n);
                    return c.name = p, a(o, "stack", i(1, d(c.stack, 1))), u(o, this, y), o
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
            var T = r(p),
                S = T.prototype;
            if (S.constructor !== T) {
                for (var E in h || a(S, "constructor", i(1, T)), c)
                    if (o(c, E)) {
                        var q = c[E],
                            k = q.s;
                        o(T, k) || a(T, k, i(6, q.c))
                    }
            }
        }
    }(), function() {
        if (!r3) {
            r3 = 1;
            var t = iD(),
                n = aU(),
                r = "DOMException";
            n(t(r), r)
        }
    }(), function() {
        if (!iv) {
            iv = 1;
            var t = iH(),
                n = am(),
                r = ib(),
                i = iD(),
                a = iq(),
                o = ix(),
                s = iZ(),
                u = ij(),
                l = function() {
                    if (r8) return r6;
                    r8 = 1;
                    var t = iq(),
                        n = ix(),
                        r = ij(),
                        i = ag(),
                        a = iD(),
                        o = at(),
                        s = function() {},
                        u = a("Reflect", "construct"),
                        l = /^\s*(?:class|function)\b/,
                        c = t(l.exec),
                        d = !l.test(s),
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
                                return d || !!c(l, o(t))
                            } catch (t) {
                                return !0
                            }
                        };
                    return h.sham = !0, r6 = !u || n(function() {
                        var t;
                        return f(f.call) || !f(Object) || !f(function() {
                            t = !0
                        }) || t
                    }) ? h : f
                }(),
                c = iC(),
                d = iO(),
                f = iU(),
                h = aD(),
                p = i8(),
                v = ag(),
                m = i$(),
                y = aL(),
                g = i9(),
                b = ac(),
                w = function() {
                    if (r9) return r5;
                    r9 = 1;
                    var t = TypeError;
                    return r5 = function(n, r) {
                        if (n < r) throw new t("Not enough arguments");
                        return n
                    }
                }(),
                x = aq(),
                P = function() {
                    if (ie) return r7;
                    ie = 1;
                    var t = iq(),
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
                R = a4(),
                T = function() {
                    if (is) return io;
                    is = 1;
                    var t = iq(),
                        n = function() {
                            if (ia) return ii;
                            ia = 1;
                            var t = iT();
                            return ii = function(n, r, i) {
                                for (var a, o, s = i ? n : n.iterator, u = n.next; !(a = t(u, s)).done;)
                                    if (void 0 !== (o = r(a.value))) return o
                            }
                        }(),
                        r = a4(),
                        i = r.Set,
                        a = r.proto,
                        o = t(a.forEach),
                        s = t(a.keys),
                        u = s(new i).next;
                    return io = function(t, r, i) {
                        return i ? n({
                            iterator: s(t),
                            next: u
                        }, r) : o(t, r)
                    }
                }(),
                S = function() {
                    if (id) return ic;
                    id = 1;
                    var t, n, r, i, a = ib(),
                        o = a0(),
                        s = a3(),
                        u = a.structuredClone,
                        l = a.ArrayBuffer,
                        c = a.MessageChannel,
                        d = !1;
                    if (s) d = function(t) {
                        u(t, {
                            transfer: [t]
                        })
                    };
                    else if (l) try {
                        !c && (t = o("worker_threads")) && (c = t.MessageChannel), c && (n = new c, r = new l(2), i = function(t) {
                            n.port1.postMessage(null, [t])
                        }, 2 === r.byteLength && (i(r), 0 === r.byteLength && (d = i)))
                    } catch (t) {}
                    return ic = d
                }(),
                E = function() {
                    if (ip) return ih;
                    ip = 1;
                    var t = ix(),
                        n = iE();
                    return ih = !t(function() {
                        var t = Error("a");
                        return !("stack" in t) || (Object.defineProperty(t, "stack", n(1, 7)), 7 !== t.stack)
                    })
                }(),
                q = a3(),
                k = r.Object,
                A = r.Array,
                C = r.Date,
                I = r.Error,
                L = r.TypeError,
                j = r.PerformanceMark,
                O = i("DOMException"),
                D = P.Map,
                N = P.has,
                _ = P.get,
                M = P.set,
                B = R.Set,
                V = R.add,
                U = R.has,
                F = i("Object", "keys"),
                G = a([].push),
                K = a((!0).valueOf),
                W = a(1.1.valueOf),
                H = a("".valueOf),
                z = a(C.prototype.getTime),
                J = s("structuredClone"),
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
                    var t = Y(new r.AggregateError([1], J, {
                        cause: 3
                    }));
                    return "AggregateError" !== t.name || 1 !== t.errors[0] || t.message !== J || 3 !== t.cause
                }),
                et = !Y && $(function(t) {
                    return new j(J, {
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
                    if (N(n, t)) return _(n, t);
                    if ("SharedArrayBuffer" === (i || v(t))) a = en ? en(t) : t;
                    else {
                        var a, o, s, l, c, d, f = r.DataView;
                        f || u(t.slice) || ei("ArrayBuffer");
                        try {
                            if (u(t.slice) && !t.resizable) a = t.slice(0);
                            else
                                for (o = t.byteLength, s = ("maxByteLength" in t) ? {
                                        maxByteLength: t.maxByteLength
                                    } : void 0, a = new ArrayBuffer(o, s), l = new f(t), c = new f(a), d = 0; d < o; d++) c.setUint8(d, l.getUint8(d))
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
                el = function(t, n) {
                    if (f(t) && er("Symbol"), !d(t)) return t;
                    if (n) {
                        if (N(n, t)) return _(n, t)
                    } else n = new D;
                    var a, o, s, l, c, h, p, w, P = v(t);
                    switch (P) {
                        case "Array":
                            s = A(b(t));
                            break;
                        case "Object":
                            s = {};
                            break;
                        case "Map":
                            s = new D;
                            break;
                        case "Set":
                            s = new B;
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
                                s = new DOMQuad(el(t.p1, n), el(t.p2, n), el(t.p3, n), el(t.p4, n))
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
                            if (l = eo()) {
                                for (c = 0, h = b(t); c < h; c++) l.items.add(el(t[c], n));
                                s = l.files
                            } else s = ea(t, P);
                            break;
                        case "ImageData":
                            try {
                                s = new ImageData(el(t.data, n), t.width, t.height, {
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
                                    s = k(K(t));
                                    break;
                                case "Number":
                                    s = k(W(t));
                                    break;
                                case "String":
                                    s = k(H(t));
                                    break;
                                case "Date":
                                    s = new C(z(t));
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
                            for (c = 0, h = b(p = F(t)); c < h; c++) w = p[c], y(s, w, el(t[w], n));
                            break;
                        case "Map":
                            t.forEach(function(t, r) {
                                M(s, el(r, n), el(t, n))
                            });
                            break;
                        case "Set":
                            t.forEach(function(t) {
                                V(s, el(t, n))
                            });
                            break;
                        case "Error":
                            g(s, "message", el(t.message, n)), m(t, "cause") && g(s, "cause", el(t.cause, n)), "AggregateError" === o ? s.errors = el(t.errors, n) : "SuppressedError" === o && (s.error = el(t.error, n), s.suppressed = el(t.suppressed, n));
                        case "DOMException":
                            E && g(s, "stack", el(t.stack, n))
                    }
                    return s
                },
                ec = function(t, n) {
                    if (!d(t)) throw new L("Transfer option cannot be converted to a sequence");
                    var i, a, o, s, c, f = [];
                    h(t, function(t) {
                        G(f, p(t))
                    });
                    for (var m = 0, y = b(f), g = new B; m < y;) {
                        if (a = v(i = f[m++]), s = void 0, "ArrayBuffer" === a ? U(g, i) : N(n, i)) throw new O("Duplicate transferable", Q);
                        if ("ArrayBuffer" === a) {
                            V(g, i);
                            continue
                        }
                        if (q) s = Y(i, {
                            transfer: [i]
                        });
                        else switch (a) {
                            case "ImageBitmap":
                                l(o = r.OffscreenCanvas) || ei(a, X);
                                try {
                                    (c = new o(i.width, i.height)).getContext("bitmaprenderer").transferFromImageBitmap(i), s = c.transferToImageBitmap()
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
                    T(t, function(t) {
                        q ? Y(t, {
                            transfer: [t]
                        }) : u(t.transfer) ? t.transfer() : S ? S(t) : ei("ArrayBuffer", X)
                    })
                };
            n({
                global: !0,
                enumerable: !0,
                sham: !q,
                forced: ee
            }, {
                structuredClone: function(t) {
                    var n, r, i = w(arguments.length, 1) > 1 && !c(arguments[1]) ? p(arguments[1]) : void 0,
                        a = i ? i.transfer : void 0;
                    void 0 !== a && (r = ec(a, n = new D));
                    var o = el(t, n);
                    return r && ed(r), o
                }
            })
        }
    }(), aN().structuredClone), a5.prototype = Error.prototype;
    var a7 = setTimeout;

    function oe(t) {
        return !!(t && void 0 !== t.length)
    }

    function ot() {}

    function on(t) {
        if (!(this instanceof on)) throw TypeError("Promises must be constructed via new");
        if ("function" != typeof t) throw TypeError("not a function");
        this._state = 0, this._handled = !1, this._value = void 0, this._deferreds = [], ou(t, this)
    }

    function or(t, n) {
        for (; 3 === t._state;) t = t._value;
        0 === t._state ? t._deferreds.push(n) : (t._handled = !0, on._immediateFn(function() {
            var r, i = 1 === t._state ? n.onFulfilled : n.onRejected;
            if (null === i) return void(1 === t._state ? oi : oa)(n.promise, t._value);
            try {
                r = i(t._value)
            } catch (t) {
                oa(n.promise, t);
                return
            }
            oi(n.promise, r)
        }))
    }

    function oi(t, n) {
        try {
            if (n === t) throw TypeError("A promise cannot be resolved with itself.");
            if (n && ("object" == typeof n || "function" == typeof n)) {
                var r = n.then;
                if (n instanceof on) {
                    t._state = 3, t._value = n, oo(t);
                    return
                }
                if ("function" == typeof r) return void ou(function() {
                    r.apply(n, arguments)
                }, t)
            }
            t._state = 1, t._value = n, oo(t)
        } catch (n) {
            oa(t, n)
        }
    }

    function oa(t, n) {
        t._state = 2, t._value = n, oo(t)
    }

    function oo(t) {
        2 === t._state && 0 === t._deferreds.length && on._immediateFn(function() {
            t._handled || on._unhandledRejectionFn(t._value)
        });
        for (var n = 0, r = t._deferreds.length; n < r; n++) or(t, t._deferreds[n]);
        t._deferreds = null
    }

    function os(t, n, r) {
        this.onFulfilled = "function" == typeof t ? t : null, this.onRejected = "function" == typeof n ? n : null, this.promise = r
    }

    function ou(t, n) {
        var r = !1;
        try {
            t(function(t) {
                r || (r = !0, oi(n, t))
            }, function(t) {
                r || (r = !0, oa(n, t))
            })
        } catch (t) {
            if (r) return;
            r = !0, oa(n, t)
        }
    }
    on.prototype.catch = function(t) {
        return this.then(null, t)
    }, on.prototype.then = function(t, n) {
        var r = new this.constructor(ot);
        return or(this, new os(t, n, r)), r
    }, on.prototype.finally = a6, on.all = function(t) {
        return new on(function(n, r) {
            if (!oe(t)) return r(TypeError("Promise.all accepts an array"));
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
    }, on.any = a9, on.allSettled = a8, on.resolve = function(t) {
        return t && "object" == typeof t && t.constructor === on ? t : new on(function(n) {
            n(t)
        })
    }, on.reject = function(t) {
        return new on(function(n, r) {
            r(t)
        })
    }, on.race = function(t) {
        return new on(function(n, r) {
            if (!oe(t)) return r(TypeError("Promise.race accepts an array"));
            for (var i = 0, a = t.length; i < a; i++) on.resolve(t[i]).then(n, r)
        })
    }, on._immediateFn = "function" == typeof setImmediate && function(t) {
        setImmediate(t)
    } || function(t) {
        a7(t, 0)
    }, on._unhandledRejectionFn = function(t) {
        "u" > typeof console && console && console.warn("Possible Unhandled Promise Rejection:", t)
    };
    var ol = "u" > typeof self ? self : window;
    "function" != typeof ol.Promise ? ol.Promise = on : (ol.Promise.prototype.finally || (ol.Promise.prototype.finally = a6), ol.Promise.allSettled || (ol.Promise.allSettled = a8), ol.Promise.any || (ol.Promise.any = a9));
    var oc = t.i(416340),
        od = t.i(589624),
        of = t.i(87758),
        oh = t.i(445465),
        op = t.i(387125),
        ov = t.i(795621),
        om = t.i(458451),
        oy = t.i(260241),
        og = t.i(429884),
        ob = t.i(602635),
        ow = t.i(822092),
        ow = ow,
        ox = t.i(568599),
        ox = ox,
        oP = t.i(692734);
    t.i(725924);
    var oR = t.i(79187),
        oT = t.i(751846),
        oS = t.i(836047);
    t.i(194250);
    var oE = t.i(421225),
        oq = t.i(74927),
        ok = t.i(33106),
        oA = t.i(379666),
        oC = t.i(178349),
        oI = t.i(52301),
        oL = t.i(278908),
        oj = t.i(236603),
        oO = t.i(973764),
        oD = {},
        oN = oq.default;

    function o_(t, n, r) {
        t = t || function(t) {
            this.queue(t)
        }, n = n || function() {
            this.queue(null)
        };
        var i = !1,
            a = !1,
            o = [],
            s = !1,
            u = new oN;

        function l() {
            for (; o.length && !u.paused;) {
                var t = o.shift();
                if (null === t) return u.emit("end");
                u.emit("data", t)
            }
        }
        return u.readable = u.writable = !0, u.paused = !1, u.autoDestroy = !(r && !1 === r.autoDestroy), u.write = function(n) {
            return t.call(this, n), !u.paused
        }, u.queue = u.push = function(t) {
            return s || (null === t && (s = !0), o.push(t), l()), u
        }, u.on("end", function() {
            u.readable = !1, !u.writable && u.autoDestroy && v.default.nextTick(function() {
                u.destroy()
            })
        }), u.end = function(t) {
            if (!i) return i = !0, arguments.length && u.write(t), u.writable = !1, n.call(u), !u.readable && u.autoDestroy && u.destroy(), u
        }, u.destroy = function() {
            if (!a) return a = !0, i = !0, o.length = 0, u.writable = u.readable = !1, u.emit("close"), u
        }, u.pause = function() {
            if (!u.paused) return u.paused = !0, u
        }, u.resume = function() {
            return u.paused && (u.paused = !1, u.emit("resume")), l(), u.paused || u.emit("drain"), u
        }, u
    }({
        get exports() {
            return oD
        },
        set exports(e) {
            oD = e
        }
    }).exports = o_, o_.through = o_;
    var oM = Object.prototype.toString,
        oB = "function" == typeof oS.Buffer.alloc && "function" == typeof oS.Buffer.allocUnsafe && "function" == typeof oS.Buffer.from,
        oV = {},
        oU = Array.isArray || function(t) {
            return "[object Array]" == Object.prototype.toString.call(t)
        },
        oF = {};

    function oG(t) {
        return Object.prototype.toString.call(t)
    }
    oF.isArray = function(t) {
        return Array.isArray ? Array.isArray(t) : "[object Array]" === oG(t)
    }, oF.isBoolean = function(t) {
        return "boolean" == typeof t
    }, oF.isNull = function(t) {
        return null === t
    }, oF.isNullOrUndefined = function(t) {
        return null == t
    }, oF.isNumber = function(t) {
        return "number" == typeof t
    }, oF.isString = function(t) {
        return "string" == typeof t
    }, oF.isSymbol = function(t) {
        return "symbol" == typeof t
    }, oF.isUndefined = function(t) {
        return void 0 === t
    }, oF.isRegExp = function(t) {
        return "[object RegExp]" === oG(t)
    }, oF.isObject = function(t) {
        return "object" == typeof t && null !== t
    }, oF.isDate = function(t) {
        return "[object Date]" === oG(t)
    }, oF.isError = function(t) {
        return "[object Error]" === oG(t) || t instanceof Error
    }, oF.isFunction = function(t) {
        return "function" == typeof t
    }, oF.isPrimitive = function(t) {
        return null === t || "boolean" == typeof t || "number" == typeof t || "string" == typeof t || "symbol" == typeof t || void 0 === t
    }, oF.isBuffer = ok.default.Buffer.isBuffer;
    var oK, oW = {},
        oH = {},
        oz = {
            get exports() {
                return oH
            },
            set exports(e) {
                oH = e
            }
        },
        oJ = {
            get exports() {
                return oW
            },
            set exports(e) {
                oW = e
            }
        };
    try {
        var oQ = t.r(52301);
        if ("function" != typeof oQ.inherits) throw "";
        oJ.exports = oQ.inherits
    } catch (t) {
        oK || (oK = 1, "function" == typeof Object.create ? oz.exports = function(t, n) {
            n && (t.super_ = n, t.prototype = Object.create(n.prototype, {
                constructor: {
                    value: t,
                    enumerable: !1,
                    writable: !0,
                    configurable: !0
                }
            }))
        } : oz.exports = function(t, n) {
            if (n) {
                t.super_ = n;
                var r = function() {};
                r.prototype = n.prototype, t.prototype = new r, t.prototype.constructor = t
            }
        }), oJ.exports = oH
    }
    var oX, o$ = {};

    function oZ() {
        if (oX) return o$;
        oX = 1;
        var t = ok.default.Buffer,
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
            r = o$.StringDecoder = function(r) {
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
        }, o$
    }
    var oY = ok.default.Buffer;
    o3.ReadableState = o4;
    var o0 = oA.default.EventEmitter;
    o0.listenerCount || (o0.listenerCount = function(t, n) {
        return t.listeners(n).length
    });
    var o1, o2 = oq.default;

    function o4(t, n) {
        var r = (t = t || {}).highWaterMark;
        this.highWaterMark = r || 0 === r ? r : 16384, this.highWaterMark = ~~this.highWaterMark, this.buffer = [], this.length = 0, this.pipes = null, this.pipesCount = 0, this.flowing = !1, this.ended = !1, this.endEmitted = !1, this.reading = !1, this.calledRead = !1, this.sync = !0, this.needReadable = !1, this.emittedReadable = !1, this.readableListening = !1, this.objectMode = !!t.objectMode, this.defaultEncoding = t.defaultEncoding || "utf8", this.ranOut = !1, this.awaitDrain = 0, this.readingMore = !1, this.decoder = null, this.encoding = null, t.encoding && (o1 || (o1 = oZ().StringDecoder), this.decoder = new o1(t.encoding), this.encoding = t.encoding)
    }

    function o3(t) {
        if (!(this instanceof o3)) return new o3(t);
        this._readableState = new o4(t), this.readable = !0, o2.call(this)
    }

    function o6(t, n, r, i, a) {
        var o, s, u = (o = r, s = null, oY.isBuffer(o) || "string" == typeof o || null == o || n.objectMode || (s = TypeError("Invalid non-string/buffer chunk")), s);
        if (u) t.emit("error", u);
        else if (null == r) n.reading = !1, n.ended || function(t, n) {
            if (n.decoder && !n.ended) {
                var r = n.decoder.end();
                r && r.length && (n.buffer.push(r), n.length += n.objectMode ? 1 : r.length)
            }
            n.ended = !0, n.length > 0 ? o5(t) : sr(t)
        }(t, n);
        else if (n.objectMode || r && r.length > 0)
            if (n.ended && !a) {
                var l = Error("stream.push() after EOF");
                t.emit("error", l)
            } else n.endEmitted && a ? (l = Error("stream.unshift() after end event"), t.emit("error", l)) : (!n.decoder || a || i || (r = n.decoder.write(r)), n.length += n.objectMode ? 1 : r.length, a ? n.buffer.unshift(r) : (n.reading = !1, n.buffer.push(r)), n.needReadable && o5(t), n.readingMore || (n.readingMore = !0, v.default.nextTick(function() {
                for (var r = n.length; !n.reading && !n.flowing && !n.ended && n.length < n.highWaterMark && (t.read(0), r !== n.length);) r = n.length;
                n.readingMore = !1
            })));
        else a || (n.reading = !1);
        return !n.ended && (n.needReadable || n.length < n.highWaterMark || 0 === n.length)
    }

    function o8(t, n) {
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

    function o5(t) {
        var n = t._readableState;
        n.needReadable = !1, n.emittedReadable || (n.emittedReadable = !0, n.sync ? v.default.nextTick(function() {
            o9(t)
        }) : o9(t))
    }

    function o9(t) {
        t.emit("readable")
    }

    function o7(t) {
        var n, r = t._readableState;

        function i(t, i, a) {
            !1 === t.write(n) && r.awaitDrain++
        }
        for (r.awaitDrain = 0; r.pipesCount && null !== (n = t.read());)
            if (1 === r.pipesCount ? i(r.pipes) : si(r.pipes, i), t.emit("data", n), r.awaitDrain > 0) return;
        0 === r.pipesCount ? (r.flowing = !1, o0.listenerCount(t, "data") > 0 && st(t)) : r.ranOut = !0
    }

    function se() {
        this._readableState.ranOut && (this._readableState.ranOut = !1, o7(this))
    }

    function st(t, n) {
        if (t._readableState.flowing) throw Error("Cannot switch to old mode now.");
        var r = n || !1,
            i = !1;
        t.readable = !0, t.pipe = o2.prototype.pipe, t.on = t.addListener = o2.prototype.on, t.on("readable", function() {
            var n;
            for (i = !0; !r && null !== (n = t.read());) t.emit("data", n);
            null === n && (i = !1, t._readableState.needReadable = !0)
        }), t.pause = function() {
            r = !0, this.emit("pause")
        }, t.resume = function() {
            r = !1, i ? v.default.nextTick(function() {
                t.emit("readable")
            }) : this.read(0), this.emit("resume")
        }, t.emit("readable")
    }

    function sn(t, n) {
        var r, i = n.buffer,
            a = n.length,
            o = !!n.decoder,
            s = !!n.objectMode;
        if (0 === i.length) return null;
        if (0 === a) r = null;
        else if (s) r = i.shift();
        else if (!t || t >= a) r = o ? i.join("") : oY.concat(i, a), i.length = 0;
        else if (t < i[0].length) r = (d = i[0]).slice(0, t), i[0] = d.slice(t);
        else if (t === i[0].length) r = i.shift();
        else {
            r = o ? "" : new oY(t);
            for (var u = 0, l = 0, c = i.length; l < c && u < t; l++) {
                var d = i[0],
                    f = Math.min(t - u, d.length);
                o ? r += d.slice(0, f) : d.copy(r, u, 0, f), f < d.length ? i[0] = d.slice(f) : i.shift(), u += f
            }
        }
        return r
    }

    function sr(t) {
        var n = t._readableState;
        if (n.length > 0) throw Error("endReadable called on non-empty stream");
        !n.endEmitted && n.calledRead && (n.ended = !0, v.default.nextTick(function() {
            n.endEmitted || 0 !== n.length || (n.endEmitted = !0, t.readable = !1, t.emit("end"))
        }))
    }

    function si(t, n) {
        for (var r = 0, i = t.length; r < i; r++) n(t[r], r)
    }

    function sa() {
        if (sw) return sb;
        sw = 1, sb = r;
        var t = Object.keys || function(t) {
            var n = [];
            for (var r in t) n.push(r);
            return n
        };
        oF.inherits = oW;
        var n = so();

        function r(t) {
            if (!(this instanceof r)) return new r(t);
            o3.call(this, t), n.call(this, t), t && !1 === t.readable && (this.readable = !1), t && !1 === t.writable && (this.writable = !1), this.allowHalfOpen = !0, t && !1 === t.allowHalfOpen && (this.allowHalfOpen = !1), this.once("end", i)
        }

        function i() {
            this.allowHalfOpen || this._writableState.ended || v.default.nextTick(this.end.bind(this))
        }
        return oF.inherits(r, o3),
            function(t, n) {
                for (var r = 0, i = t.length; r < i; r++) n(t[r], r)
            }(t(n.prototype), function(t) {
                r.prototype[t] || (r.prototype[t] = n.prototype[t])
            }), sb
    }

    function so() {
        if (sP) return sx;
        sP = 1, sx = a;
        var t = ok.default.Buffer;
        a.WritableState = i, oF.inherits = oW;
        var n = oq.default;

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
                    if (r.writing = !1, r.writecb = null, r.length -= r.writelen, r.writelen = 0, n) i ? v.default.nextTick(function() {
                        a(n)
                    }) : a(n), t._writableState.errorEmitted = !0, t.emit("error", n);
                    else {
                        var l = u(t, r);
                        l || r.bufferProcessing || !r.buffer.length || function(t, n) {
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
                        }(t, r), i ? v.default.nextTick(function() {
                            s(t, r, l, a)
                        }) : s(t, r, l, a)
                    }
                }(n, t)
            }, this.writecb = null, this.writelen = 0, this.buffer = [], this.errorEmitted = !1
        }

        function a(t) {
            var r = sa();
            if (!(this instanceof a || this instanceof r)) return new a(t);
            this._writableState = new i(t, this), this.writable = !0, n.call(this)
        }

        function o(t, n, r, i, a, o) {
            n.writelen = r, n.writecb = o, n.writing = !0, n.sync = !0, t._write(i, a, n.onwrite), n.sync = !1
        }

        function s(t, n, r, i) {
            r || 0 === n.length && n.needDrain && (n.needDrain = !1, t.emit("drain")), i(), r && l(t, n)
        }

        function u(t, n) {
            return n.ending && 0 === n.length && !n.finished && !n.writing
        }

        function l(t, n) {
            var r = u(0, n);
            return r && (n.finished = !0, t.emit("finish")), r
        }
        return oF.inherits(a, n), a.prototype.pipe = function() {
            this.emit("error", Error("Cannot pipe. Not readable."))
        }, a.prototype.write = function(n, i, a) {
            var s, u, l, c, d, f, h, p, m, y = this._writableState,
                g = !1;
            return "function" == typeof i && (a = i, i = null), t.isBuffer(n) ? i = "buffer" : i || (i = y.defaultEncoding), "function" != typeof a && (a = function() {}), y.ended ? (s = a, u = Error("write after end"), this.emit("error", u), v.default.nextTick(function() {
                s(u)
            })) : function(n, r, i, a) {
                var o = !0;
                if (!t.isBuffer(i) && "string" != typeof i && null != i && !r.objectMode) {
                    var s = TypeError("Invalid non-string/buffer chunk");
                    n.emit("error", s), v.default.nextTick(function() {
                        a(s)
                    }), o = !1
                }
                return o
            }(this, y, n, a) && (l = n, c = i, d = a, f = l, h = c, y.objectMode || !1 === y.decodeStrings || "string" != typeof f || (f = new t(f, h)), l = f, t.isBuffer(l) && (c = "buffer"), p = y.objectMode ? 1 : l.length, y.length += p, (m = y.length < y.highWaterMark) || (y.needDrain = !0), y.writing ? y.buffer.push(new r(l, c, d)) : o(this, y, p, l, c, d), g = m), g
        }, a.prototype._write = function(t, n, r) {
            r(Error("not implemented"))
        }, a.prototype.end = function(t, n, r) {
            var i, a = this._writableState;
            "function" == typeof t ? (r = t, t = null, n = null) : "function" == typeof n && (r = n, n = null), null != t && this.write(t, n), a.ending || a.finished || (i = r, a.ending = !0, l(this, a), i && (a.finished ? v.default.nextTick(i) : this.once("finish", i)), a.ended = !0)
        }, sx
    }
    oF.inherits = oW, oF.inherits(o3, o2), o3.prototype.push = function(t, n) {
        var r = this._readableState;
        return "string" != typeof t || r.objectMode || (n = n || r.defaultEncoding) !== r.encoding && (t = new oY(t, n), n = ""), o6(this, r, t, n, !1)
    }, o3.prototype.unshift = function(t) {
        return o6(this, this._readableState, t, "", !0)
    }, o3.prototype.setEncoding = function(t) {
        o1 || (o1 = oZ().StringDecoder), this._readableState.decoder = new o1(t), this._readableState.encoding = t
    }, o3.prototype.read = function(t) {
        var n = this._readableState;
        n.calledRead = !0;
        var r, i = t;
        if (("number" != typeof t || t > 0) && (n.emittedReadable = !1), 0 === t && n.needReadable && (n.length >= n.highWaterMark || n.ended)) return o5(this), null;
        if (0 === (t = o8(t, n)) && n.ended) return r = null, n.length > 0 && n.decoder && (r = sn(t, n), n.length -= r.length), 0 === n.length && sr(this), r;
        var a = n.needReadable;
        return n.length - t <= n.highWaterMark && (a = !0), (n.ended || n.reading) && (a = !1), a && (n.reading = !0, n.sync = !0, 0 === n.length && (n.needReadable = !0), this._read(n.highWaterMark), n.sync = !1), a && !n.reading && (t = o8(i, n)), null === (r = t > 0 ? sn(t, n) : null) && (n.needReadable = !0, t = 0), n.length -= t, 0 !== n.length || n.ended || (n.needReadable = !0), n.ended && !n.endEmitted && 0 === n.length && sr(this), r
    }, o3.prototype._read = function(t) {
        this.emit("error", Error("not implemented"))
    }, o3.prototype.pipe = function(t, n) {
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
        var a = n && !1 === n.end || t === v.default.stdout || t === v.default.stderr ? l : s;

        function o(t) {
            t === r && l()
        }

        function s() {
            t.end()
        }
        i.endEmitted ? v.default.nextTick(a) : r.once("end", a), t.on("unpipe", o);
        var u = function() {
            var t = r._readableState;
            t.awaitDrain--, 0 === t.awaitDrain && o7(r)
        };

        function l() {
            t.removeListener("close", d), t.removeListener("finish", f), t.removeListener("drain", u), t.removeListener("error", c), t.removeListener("unpipe", o), r.removeListener("end", s), r.removeListener("end", l), t._writableState && !t._writableState.needDrain || u()
        }

        function c(n) {
            h(), t.removeListener("error", c), 0 === o0.listenerCount(t, "error") && t.emit("error", n)
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
        return t.on("drain", u), t._events && t._events.error ? oU(t._events.error) ? t._events.error.unshift(c) : t._events.error = [c, t._events.error] : t.on("error", c), t.once("close", d), t.once("finish", f), t.emit("pipe", r), i.flowing || (this.on("readable", se), i.flowing = !0, v.default.nextTick(function() {
            o7(r)
        })), t
    }, o3.prototype.unpipe = function(t) {
        var n = this._readableState;
        if (0 === n.pipesCount) return this;
        if (1 === n.pipesCount) return t && t !== n.pipes || (t || (t = n.pipes), n.pipes = null, n.pipesCount = 0, this.removeListener("readable", se), n.flowing = !1, t && t.emit("unpipe", this)), this;
        if (!t) {
            var r = n.pipes,
                i = n.pipesCount;
            n.pipes = null, n.pipesCount = 0, this.removeListener("readable", se), n.flowing = !1;
            for (var a = 0; a < i; a++) r[a].emit("unpipe", this);
            return this
        }
        return -1 === (a = function(t, n) {
            for (var r = 0, i = t.length; r < i; r++)
                if (t[r] === n) return r;
            return -1
        }(n.pipes, t)) || (n.pipes.splice(a, 1), n.pipesCount -= 1, 1 === n.pipesCount && (n.pipes = n.pipes[0]), t.emit("unpipe", this)), this
    }, o3.prototype.on = function(t, n) {
        var r = o2.prototype.on.call(this, t, n);
        if ("data" !== t || this._readableState.flowing || st(this), "readable" === t && this.readable) {
            var i = this._readableState;
            i.readableListening || (i.readableListening = !0, i.emittedReadable = !1, i.needReadable = !0, i.reading ? i.length && o5(this) : this.read(0))
        }
        return r
    }, o3.prototype.addListener = o3.prototype.on, o3.prototype.resume = function() {
        st(this), this.read(0), this.emit("resume")
    }, o3.prototype.pause = function() {
        st(this, !0), this.emit("pause")
    }, o3.prototype.wrap = function(t) {
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
        return si(["error", "close", "destroy", "pause", "resume"], function(n) {
            t.on(n, i.emit.bind(i, n))
        }), i._read = function(n) {
            r && (r = !1, t.resume())
        }, i
    }, o3._fromList = sn;
    var ss = sa();

    function su(t, n) {
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

    function sl(t) {
        if (!(this instanceof sl)) return new sl(t);
        ss.call(this, t), this._transformState = new su(t, this);
        var n = this;
        this._readableState.needReadable = !0, this._readableState.sync = !1, this.once("finish", function() {
            "function" == typeof this._flush ? this._flush(function(t) {
                sc(n, t)
            }) : sc(n)
        })
    }

    function sc(t, n) {
        if (n) return t.emit("error", n);
        var r = t._writableState;
        t._readableState;
        var i = t._transformState;
        if (r.length) throw Error("calling transform done when ws.length != 0");
        if (i.transforming) throw Error("calling transform done when still transforming");
        return t.push(null)
    }

    function sd(t) {
        if (!(this instanceof sd)) return new sd(t);
        sl.call(this, t)
    }
    oF.inherits = oW, oF.inherits(sl, ss), sl.prototype.push = function(t, n) {
        return this._transformState.needTransform = !1, ss.prototype.push.call(this, t, n)
    }, sl.prototype._transform = function(t, n, r) {
        throw Error("not implemented")
    }, sl.prototype._write = function(t, n, r) {
        var i = this._transformState;
        if (i.writecb = r, i.writechunk = t, i.writeencoding = n, !i.transforming) {
            var a = this._readableState;
            (i.needTransform || a.needReadable || a.length < a.highWaterMark) && this._read(a.highWaterMark)
        }
    }, sl.prototype._read = function(t) {
        var n = this._transformState;
        null !== n.writechunk && n.writecb && !n.transforming ? (n.transforming = !0, this._transform(n.writechunk, n.writeencoding, n.afterTransform)) : n.needTransform = !0
    }, oF.inherits = oW, oF.inherits(sd, sl), sd.prototype._transform = function(t, n, r) {
        r(null, t)
    }, sR = oV, sT = oq.default, (sR = ({
        get exports() {
            return oV
        },
        set exports(e) {
            oV = e
        }
    }).exports = o3).Stream = sT, sR.Readable = sR, sR.Writable = so(), sR.Duplex = sa(), sR.Transform = sl, sR.PassThrough = sd;
    var sf = function(t, n, r) {
            if ("number" == typeof t) throw TypeError('"value" argument must not be a number');
            return "ArrayBuffer" === oM.call(t).slice(8, -1) ? function(t, n, r) {
                n >>>= 0;
                var i = t.byteLength - n;
                if (i < 0) throw RangeError("'offset' is out of bounds");
                if (void 0 === r) r = i;
                else if ((r >>>= 0) > i) throw RangeError("'length' is out of bounds");
                return oB ? oS.Buffer.from(t.slice(n, n + r)) : new oS.Buffer(new Uint8Array(t.slice(n, n + r)))
            }(t, n, r) : "string" == typeof t ? function(t, n) {
                if ("string" == typeof n && "" !== n || (n = "utf8"), !oS.Buffer.isEncoding(n)) throw TypeError('"encoding" must be a valid string encoding');
                return oB ? oS.Buffer.from(t, n) : new oS.Buffer(t, n)
            }(t, n) : oB ? oS.Buffer.from(t) : new oS.Buffer(t)
        },
        sh = oV.Transform;
    oW(sv, sh);
    var sp = {
        endScript: sf("</script"),
        endStyle: sf("</style"),
        endTitle: sf("</title"),
        comment: sf("<!--"),
        endComment: sf("-->"),
        cdata: sf("<![CDATA["),
        endCdata: sf("]]>")
    };

    function sv() {
        if (!(this instanceof sv)) return new sv;
        sh.call(this), this._readableState.objectMode = !0, this.state = "text", this.tagState = null, this.quoteState = null, this.raw = null, this.buffers = [], this._last = []
    }

    function sm(t, n) {
        if (t.length < n.length) return !1;
        for (var r = t.length - 1, i = n.length - 1; r >= 0 && i >= 0; r--, i--)
            if (sy(t[r]) !== sy(n[i])) return !1;
        return !0
    }

    function sy(t) {
        return t >= 65 && t <= 90 ? t + 32 : t
    }

    function sg(t) {
        return 32 === t || 9 === t || 10 === t || 12 === t || 13 === t
    }
    sv.prototype._transform = function(t, n, r) {
        var i = 0,
            a = 0;
        for (this._prev && (t = oS.Buffer.concat([this._prev, t]), i = this._prev.length - 1, a = this._offset, this._prev = null, this._offset = 0); i < t.length; i++) {
            var o = t[i];
            if (this._last.push(o), this._last.length > 9 && this._last.shift(), this.raw) {
                var s = this._testRaw(t, a, i);
                s && (this.push(["text", s[0]]), this.raw === sp.endComment || this.raw === sp.endCdata ? (this.state = "text", this.buffers = [], this.push(["close", s[1]])) : (this.state = "open", this.buffers = [s[1]]), this.raw = null, a = i + 1)
            } else {
                if ("text" === this.state && 60 === o && i === t.length - 1) return this._prev = t, this._offset = a, r();
                if ("text" !== this.state || 60 !== o || sg(t[i + 1]))
                    if (1 === this.tagState && sg(o)) this.tagState = 2;
                    else if (2 === this.tagState && 61 === o) this.tagState = 3;
                else if (3 === this.tagState && sg(o));
                else if (3 === this.tagState && 62 !== o) this.tagState = 4, this.quoteState = 34 === o ? "double" : 39 === o ? "single" : null;
                else if (4 === this.tagState && !this.quoteState && sg(o)) this.tagState = 2;
                else if (4 === this.tagState && "double" === this.quoteState && 34 === o) this.quoteState = null, this.tagState = 2;
                else if (4 === this.tagState && "single" === this.quoteState && 39 === o) this.quoteState = null, this.tagState = 2;
                else if ("open" !== this.state || 62 !== o || this.quoteState) "open" === this.state && sm(this._last, sp.comment) ? (this.buffers.push(t.slice(a, i + 1)), a = i + 1, this.state = "text", this.raw = sp.endComment, this._pushState("open")) : "open" === this.state && sm(this._last, sp.cdata) && (this.buffers.push(t.slice(a, i + 1)), a = i + 1, this.state = "text", this.raw = sp.endCdata, this._pushState("open"));
                else if (this.buffers.push(t.slice(a, i + 1)), a = i + 1, this.state = "text", this.tagState = null, 47 === this._getChar(1)) this._pushState("close");
                else {
                    var u = this._getTag();
                    "script" === u && (this.raw = sp.endScript), "style" === u && (this.raw = sp.endStyle), "title" === u && (this.raw = sp.endTitle), this._pushState("open")
                } else i > 0 && i - a > 0 && this.buffers.push(t.slice(a, i)), a = i, this.state = "open", this.tagState = 1, this._pushState("text")
            }
        }
        a < t.length && this.buffers.push(t.slice(a)), r()
    }, sv.prototype._flush = function(t) {
        "text" === this.state && this._pushState("text"), this.push(null), t()
    }, sv.prototype._pushState = function(t) {
        if (0 !== this.buffers.length) {
            var n = oS.Buffer.concat(this.buffers);
            this.buffers = [], this.push([t, n])
        }
    }, sv.prototype._getChar = function(t) {
        for (var n = 0, r = 0; r < this.buffers.length; r++) {
            var i = this.buffers[r];
            if (n + i.length > t) return i[t - n];
            n += i
        }
    }, sv.prototype._getTag = function() {
        for (var t = 0, n = "", r = 0; r < this.buffers.length; r++) {
            for (var i = this.buffers[r], a = 0; a < i.length; a++)
                if (0 !== t || 0 !== a) {
                    var o = String.fromCharCode(i[a]);
                    if (/[^\w-!\[\]]/.test(o)) return n.toLowerCase();
                    n += o
                } t += i.length
        }
    }, sv.prototype._testRaw = function(t, n, r) {
        var i = this.raw;
        if (sm(this._last, i)) {
            this.buffers.push(t.slice(n, r + 1));
            var a = (t = oS.Buffer.concat(this.buffers)).length - i.length;
            return [t.slice(0, a), t.slice(a)]
        }
    };
    var sb, sw, sx, sP, sR, sT, sS, sE, sq, sk = {},
        sA = {},
        sC = {},
        sI = {
            get exports() {
                return sC
            },
            set exports(e) {
                sC = e
            }
        };

    function sL() {
        return sS || (sS = 1, void 0 !== v.default && v.default.version && 0 !== v.default.version.indexOf("v0.") && (0 !== v.default.version.indexOf("v1.") || 0 === v.default.version.indexOf("v1.8.")) ? sI.exports = v.default : sI.exports = {
            nextTick: function(t, n, r, i) {
                if ("function" != typeof t) throw TypeError('"callback" argument must be a function');
                var a, o, s = arguments.length;
                switch (s) {
                    case 0:
                    case 1:
                        return v.default.nextTick(t);
                    case 2:
                        return v.default.nextTick(function() {
                            t.call(null, n)
                        });
                    case 3:
                        return v.default.nextTick(function() {
                            t.call(null, n, r)
                        });
                    case 4:
                        return v.default.nextTick(function() {
                            t.call(null, n, r, i)
                        });
                    default:
                        for (a = Array(s - 1), o = 0; o < a.length;) a[o++] = arguments[o];
                        return v.default.nextTick(function() {
                            t.apply(null, a)
                        })
                }
            }
        }), sC
    }
    var sj, sO = {},
        sD = {
            get exports() {
                return sO
            },
            set exports(e) {
                sO = e
            }
        };

    function sN() {
        return sj || (sj = 1, sD.exports = oq.default), sO
    }
    var s_, sM = {},
        sB = {
            get exports() {
                return sM
            },
            set exports(e) {
                sM = e
            }
        };

    function sV() {
        return s_ || (s_ = 1, function(t, n) {
            var r = ok.default,
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
        }(sB, sM)), sM
    }
    var sU, sF, sG, sK, sW, sH, sz, sJ, sQ, sX = {},
        s$ = {
            get exports() {
                return sX
            },
            set exports(e) {
                sX = e
            }
        };

    function sZ() {
        if (sG) return sF;
        sG = 1;
        var t = sL();

        function n(t, n) {
            t.emit("error", n)
        }
        return sF = {
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

    function sY() {
        if (sz) return sH;
        sz = 1;
        var t = sL();

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
        sH = p;
        var r, i = t.nextTick;
        p.WritableState = h;
        var a = Object.create(oF);
        a.inherits = oW;
        var o, s = {
                deprecate: sW ? sK : (sW = 1, sK = oI.default.deprecate)
            },
            u = sN(),
            l = sV().Buffer,
            c = oC.c.Uint8Array || function() {},
            d = sZ();

        function f() {}

        function h(a, o) {
            r = r || s0(), a = a || {};
            var s = o instanceof r;
            this.objectMode = !!a.objectMode, s && (this.objectMode = this.objectMode || !!a.writableObjectMode);
            var u = a.highWaterMark,
                l = a.writableHighWaterMark,
                c = this.objectMode ? 16 : 16384;
            this.highWaterMark = u || 0 === u ? u : s && (l || 0 === l) ? l : c, this.highWaterMark = Math.floor(this.highWaterMark), this.finalCalled = !1, this.needDrain = !1, this.ending = !1, this.ended = !1, this.finished = !1, this.destroyed = !1;
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
            if (r = r || s0(), !(o.call(p, this) || this instanceof r)) return new p(t);
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
                    var l = i.chunk,
                        c = i.encoding,
                        d = i.callback;
                    if (v(t, r, !1, r.objectMode ? 1 : l.length, l, c, d), i = i.next, r.bufferedRequestCount--, r.writing) break
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
                    b = !y.objectMode && (m = n, l.isBuffer(m) || m instanceof c);
                return b && !l.isBuffer(n) && (a = n, n = l.from(a)), "function" == typeof r && (i = r, r = null), b ? r = "buffer" : r || (r = y.defaultEncoding), "function" != typeof i && (i = f), y.ended ? (o = i, s = Error("write after end"), this.emit("error", s), t.nextTick(o, s)) : (b || (u = n, d = i, h = !0, p = !1, null === u ? p = TypeError("May not write null values to stream") : "string" == typeof u || void 0 === u || y.objectMode || (p = TypeError("Invalid non-string/buffer chunk")), p && (this.emit("error", p), t.nextTick(d, p), h = !1), h)) && (y.pendingcb++, g = function(t, n, r, i, a, o) {
                    if (!r) {
                        var s, u, c = (s = i, u = a, n.objectMode || !1 === n.decodeStrings || "string" != typeof s || (s = l.from(s, u)), s);
                        i !== c && (r = !0, a = "buffer", i = c)
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
            }, sH
    }

    function s0() {
        if (sQ) return sJ;
        sQ = 1;
        var t = sL(),
            n = Object.keys || function(t) {
                var n = [];
                for (var r in t) n.push(r);
                return n
            };
        sJ = l;
        var r = Object.create(oF);
        r.inherits = oW;
        var i = ue(),
            a = sY();
        r.inherits(l, i);
        for (var o = n(a.prototype), s = 0; s < o.length; s++) {
            var u = o[s];
            l.prototype[u] || (l.prototype[u] = a.prototype[u])
        }

        function l(t) {
            if (!(this instanceof l)) return new l(t);
            i.call(this, t), a.call(this, t), t && !1 === t.readable && (this.readable = !1), t && !1 === t.writable && (this.writable = !1), this.allowHalfOpen = !0, t && !1 === t.allowHalfOpen && (this.allowHalfOpen = !1), this.once("end", c)
        }

        function c() {
            this.allowHalfOpen || this._writableState.ended || t.nextTick(d, this)
        }

        function d(t) {
            t.end()
        }
        return Object.defineProperty(l.prototype, "writableHighWaterMark", {
            enumerable: !1,
            get: function() {
                return this._writableState.highWaterMark
            }
        }), Object.defineProperty(l.prototype, "destroyed", {
            get: function() {
                return void 0 !== this._readableState && void 0 !== this._writableState && this._readableState.destroyed && this._writableState.destroyed
            },
            set: function(t) {
                void 0 !== this._readableState && void 0 !== this._writableState && (this._readableState.destroyed = t, this._writableState.destroyed = t)
            }
        }), l.prototype._destroy = function(n, r) {
            this.push(null), this.end(), t.nextTick(r, n)
        }, sJ
    }
    var s1, s2, s4, s3, s6, s8, s5, s9 = {};

    function s7() {
        if (s1) return s9;
        s1 = 1;
        var t = sV().Buffer,
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
                    this.text = u, this.end = l, i = 3;
                    break;
                default:
                    return this.write = c, void(this.end = d)
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

        function l(t) {
            var n = t && t.length ? this.write(t) : "";
            return this.lastNeed ? n + this.lastChar.toString("base64", 0, 3 - this.lastNeed) : n
        }

        function c(t) {
            return t.toString(this.encoding)
        }

        function d(t) {
            return t && t.length ? this.write(t) : ""
        }
        return s9.StringDecoder = r, r.prototype.write = function(t) {
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
        }, s9
    }

    function ue() {
        if (s4) return s2;
        s4 = 1;
        var t = sL();
        s2 = b;
        var n, r = function() {
            if (sq) return sE;
            sq = 1;
            var t = {}.toString;
            return sE = Array.isArray || function(n) {
                return "[object Array]" == t.call(n)
            }
        }();
        b.ReadableState = g, oA.default.EventEmitter;
        var i = function(t, n) {
                return t.listeners(n).length
            },
            a = sN(),
            o = sV().Buffer,
            s = oC.c.Uint8Array || function() {},
            u = Object.create(oF);
        u.inherits = oW;
        var l = oI.default,
            c = void 0;
        c = l && l.debuglog ? l.debuglog("stream") : function() {};
        var d, f, h, p = (sU || (sU = 1, d = sV().Buffer, f = oI.default, s$.exports = function() {
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
            }(), f && f.inspect && f.inspect.custom && (s$.exports.prototype[f.inspect.custom] = function() {
                var t = f.inspect({
                    length: this.length
                });
                return this.constructor.name + " " + t
            })), sX),
            m = sZ();
        u.inherits(b, a);
        var y = ["error", "close", "destroy", "pause", "resume"];

        function g(t, r) {
            t = t || {};
            var i = r instanceof(n = n || s0());
            this.objectMode = !!t.objectMode, i && (this.objectMode = this.objectMode || !!t.readableObjectMode);
            var a = t.highWaterMark,
                o = t.readableHighWaterMark,
                s = this.objectMode ? 16 : 16384;
            this.highWaterMark = a || 0 === a ? a : i && (o || 0 === o) ? o : s, this.highWaterMark = Math.floor(this.highWaterMark), this.buffer = new p, this.length = 0, this.pipes = null, this.pipesCount = 0, this.flowing = null, this.ended = !1, this.endEmitted = !1, this.reading = !1, this.sync = !0, this.needReadable = !1, this.emittedReadable = !1, this.readableListening = !1, this.resumeScheduled = !1, this.destroyed = !1, this.defaultEncoding = t.defaultEncoding || "utf8", this.awaitDrain = 0, this.readingMore = !1, this.decoder = null, this.encoding = null, t.encoding && (h || (h = s7().StringDecoder), this.decoder = new h(t.encoding), this.encoding = t.encoding)
        }

        function b(t) {
            if (n = n || s0(), !(this instanceof b)) return new b(t);
            this._readableState = new g(t, this), this.readable = !0, t && ("function" == typeof t.read && (this._read = t.read), "function" == typeof t.destroy && (this._destroy = t.destroy)), a.call(this)
        }

        function w(t, n, r, i, a) {
            var u, l, c, d, f, h = t._readableState;
            return null === n ? (h.reading = !1, function(t, n) {
                if (!n.ended) {
                    if (n.decoder) {
                        var r = n.decoder.end();
                        r && r.length && (n.buffer.push(r), n.length += n.objectMode ? 1 : r.length)
                    }
                    n.ended = !0, R(t)
                }
            }(t, h)) : (a || (u = h, l = n, o.isBuffer(l) || l instanceof s || "string" == typeof l || void 0 === l || u.objectMode || (c = TypeError("Invalid non-string/buffer chunk")), f = c), f ? t.emit("error", f) : h.objectMode || n && n.length > 0 ? ("string" == typeof n || h.objectMode || Object.getPrototypeOf(n) === o.prototype || (d = n, n = o.from(d)), i ? h.endEmitted ? t.emit("error", Error("stream.unshift() after end event")) : x(t, h, n, !0) : h.ended ? t.emit("error", Error("stream.push() after EOF")) : (h.reading = !1, h.decoder && !r ? (n = h.decoder.write(n), h.objectMode || 0 !== n.length ? x(t, h, n, !1) : S(t, h)) : x(t, h, n, !1))) : i || (h.reading = !1)), !h.ended && (h.needReadable || h.length < h.highWaterMark || 0 === h.length)
        }

        function x(t, n, r, i) {
            n.flowing && 0 === n.length && !n.sync ? (t.emit("data", r), t.read(0)) : (n.length += n.objectMode ? 1 : r.length, i ? n.buffer.unshift(r) : n.buffer.push(r), n.needReadable && R(t)), S(t, n)
        }

        function P(t, n) {
            var r;
            return t <= 0 || 0 === n.length && n.ended ? 0 : n.objectMode ? 1 : t != t ? n.flowing && n.length ? n.buffer.head.data.length : n.length : (t > n.highWaterMark && ((r = t) >= 8388608 ? r = 8388608 : (r--, r |= r >>> 1, r |= r >>> 2, r |= r >>> 4, r |= r >>> 8, r |= r >>> 16, r++), n.highWaterMark = r), t <= n.length ? t : n.ended ? n.length : (n.needReadable = !0, 0))
        }

        function R(n) {
            var r = n._readableState;
            r.needReadable = !1, r.emittedReadable || (c("emitReadable", r.flowing), r.emittedReadable = !0, r.sync ? t.nextTick(T, n) : T(n))
        }

        function T(t) {
            c("emit readable"), t.emit("readable"), A(t)
        }

        function S(n, r) {
            r.readingMore || (r.readingMore = !0, t.nextTick(E, n, r))
        }

        function E(t, n) {
            for (var r = n.length; !n.reading && !n.flowing && !n.ended && n.length < n.highWaterMark && (c("maybeReadMore read 0"), t.read(0), r !== n.length);) r = n.length;
            n.readingMore = !1
        }

        function q(t) {
            c("readable nexttick read 0"), t.read(0)
        }

        function k(t, n) {
            n.reading || (c("resume read 0"), t.read(0)), n.resumeScheduled = !1, n.awaitDrain = 0, t.emit("resume"), A(t), n.flowing && !n.reading && t.read(0)
        }

        function A(t) {
            var n = t._readableState;
            for (c("flow", n.flowing); n.flowing && null !== t.read(););
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
            r.endEmitted || (r.ended = !0, t.nextTick(L, r, n))
        }

        function L(t, n) {
            t.endEmitted || 0 !== t.length || (t.endEmitted = !0, n.readable = !1, n.emit("end"))
        }

        function j(t, n) {
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
            return h || (h = s7().StringDecoder), this._readableState.decoder = new h(t), this._readableState.encoding = t, this
        }, b.prototype.read = function(t) {
            c("read", t), t = parseInt(t, 10);
            var n = this._readableState,
                r = t;
            if (0 !== t && (n.emittedReadable = !1), 0 === t && n.needReadable && (n.length >= n.highWaterMark || n.ended)) return c("read: emitReadable", n.length, n.ended), 0 === n.length && n.ended ? I(this) : R(this), null;
            if (0 === (t = P(t, n)) && n.ended) return 0 === n.length && I(this), null;
            var i, a = n.needReadable;
            return c("need readable", a), (0 === n.length || n.length - t < n.highWaterMark) && c("length less than watermark", a = !0), n.ended || n.reading ? c("reading or ended", a = !1) : a && (c("do read"), n.reading = !0, n.sync = !0, 0 === n.length && (n.needReadable = !0), this._read(n.highWaterMark), n.sync = !1, n.reading || (t = P(r, n))), null === (i = t > 0 ? C(t, n) : null) ? (n.needReadable = !0, t = 0) : n.length -= t, 0 === n.length && (n.ended || (n.needReadable = !0), r !== t && n.ended && I(this)), null !== i && this.emit("data", i), i
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
            s.pipesCount += 1, c("pipe count=%d opts=%j", s.pipesCount, a);
            var u = a && !1 === a.end || n === v.default.stdout || n === v.default.stderr ? b : l;

            function l() {
                c("onend"), n.end()
            }
            s.endEmitted ? t.nextTick(u) : o.once("end", u), n.on("unpipe", function t(r, i) {
                c("onunpipe"), r === o && i && !1 === i.hasUnpiped && (i.hasUnpiped = !0, c("cleanup"), n.removeListener("close", y), n.removeListener("finish", g), n.removeListener("drain", d), n.removeListener("error", m), n.removeListener("unpipe", t), o.removeListener("end", l), o.removeListener("end", b), o.removeListener("data", p), f = !0, s.awaitDrain && (!n._writableState || n._writableState.needDrain) && d())
            });
            var d = function() {
                var t = o._readableState;
                c("pipeOnDrain", t.awaitDrain), t.awaitDrain && t.awaitDrain--, 0 === t.awaitDrain && i(o, "data") && (t.flowing = !0, A(o))
            };
            n.on("drain", d);
            var f = !1,
                h = !1;

            function p(t) {
                c("ondata"), h = !1, !1 !== n.write(t) || h || ((1 === s.pipesCount && s.pipes === n || s.pipesCount > 1 && -1 !== j(s.pipes, n)) && !f && (c("false write response, pause", o._readableState.awaitDrain), o._readableState.awaitDrain++, h = !0), o.pause())
            }

            function m(t) {
                c("onerror", t), b(), n.removeListener("error", m), 0 === i(n, "error") && n.emit("error", t)
            }

            function y() {
                n.removeListener("finish", g), b()
            }

            function g() {
                c("onfinish"), n.removeListener("close", y), b()
            }

            function b() {
                c("unpipe"), o.unpipe(n)
            }
            return o.on("data", p),
                function(t, n, i) {
                    if ("function" == typeof t.prependListener) return t.prependListener(n, i);
                    t._events && t._events[n] ? r(t._events[n]) ? t._events[n].unshift(i) : t._events[n] = [i, t._events[n]] : t.on(n, i)
                }(n, "error", m), n.once("close", y), n.once("finish", g), n.emit("pipe", o), s.flowing || (c("pipe resume"), o.resume()), n
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
            var s = j(n.pipes, t);
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
            return n.flowing || (c("resume"), n.flowing = !0, n.resumeScheduled || (n.resumeScheduled = !0, t.nextTick(k, this, n))), this
        }, b.prototype.pause = function() {
            return c("call pause flowing=%j", this._readableState.flowing), !1 !== this._readableState.flowing && (c("pause"), this._readableState.flowing = !1, this.emit("pause")), this
        }, b.prototype.wrap = function(t) {
            var n = this,
                r = this._readableState,
                i = !1;
            for (var a in t.on("end", function() {
                    if (c("wrapped end"), r.decoder && !r.ended) {
                        var t = r.decoder.end();
                        t && t.length && n.push(t)
                    }
                    n.push(null)
                }), t.on("data", function(a) {
                    c("wrapped data"), r.decoder && (a = r.decoder.write(a)), r.objectMode && null == a || (r.objectMode || a && a.length) && (n.push(a) || (i = !0, t.pause()))
                }), t) void 0 === this[a] && "function" == typeof t[a] && (this[a] = function(n) {
                return function() {
                    return t[n].apply(t, arguments)
                }
            }(a));
            for (var o = 0; o < y.length; o++) t.on(y[o], this.emit.bind(this, y[o]));
            return this._read = function(n) {
                c("wrapped _read", n), i && (i = !1, t.resume())
            }, this
        }, Object.defineProperty(b.prototype, "readableHighWaterMark", {
            enumerable: !1,
            get: function() {
                return this._readableState.highWaterMark
            }
        }), b._fromList = C, s2
    }

    function ut() {
        if (s6) return s3;
        s6 = 1, s3 = i;
        var t = s0(),
            n = Object.create(oF);

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
        return n.inherits = oW, n.inherits(i, t), i.prototype.push = function(n, r) {
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
        }, s3
    }
    ui = {
        get exports() {
            return sA
        },
        set exports(e) {
            sA = e
        }
    }, ua = sA, uo = oq.default, "disable" === v.default.env.READABLE_STREAM && uo ? (ui.exports = uo, (ua = ui.exports = uo.Readable).Readable = uo.Readable, ua.Writable = uo.Writable, ua.Duplex = uo.Duplex, ua.Transform = uo.Transform, ua.PassThrough = uo.PassThrough, ua.Stream = uo) : ((ua = ui.exports = ue()).Stream = uo || ua, ua.Readable = ua, ua.Writable = sY(), ua.Duplex = s0(), ua.Transform = ut(), ua.PassThrough = function() {
        if (s5) return s8;
        s5 = 1, s8 = r;
        var t = ut(),
            n = Object.create(oF);

        function r(n) {
            if (!(this instanceof r)) return new r(n);
            t.call(this, n)
        }
        return n.inherits = oW, n.inherits(r, t), r.prototype._transform = function(t, n, r) {
            r(null, t)
        }, s8
    }());
    var un = sA;

    function ur(t, n, r) {
        void 0 === r && (r = n, n = t, t = null), un.Duplex.call(this, t), "function" != typeof r.read && (r = new un.Readable(t).wrap(r)), this._writable = n, this._readable = r, this._waiting = !1;
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
    ur.prototype = Object.create(un.Duplex.prototype, {
        constructor: {
            value: ur
        }
    }), ur.prototype._write = function(t, n, r) {
        this._writable.write(t, n, r)
    }, ur.prototype._read = function() {
        for (var t, n = 0; null !== (t = this._readable.read());) this.push(t), n++;
        0 === n && (this._waiting = !0)
    }, ({
        get exports() {
            return sk
        },
        set exports(e) {
            sk = e
        }
    }).exports = function(t, n, r) {
        return new ur(t, n, r)
    }, sk.DuplexWrapper = ur, oq.default.PassThrough, oq.default.PassThrough, oL.o, [].slice;
    var ui, ua, uo, us, uu, ul, uc, ud = "web-blox-css-mui",
        uf = "web-blox-css-tss",
        uh = "u" > typeof window && void 0 !== window.document,
        up = function() {
            var t = document.querySelector('meta[name="'.concat("emotion-insertion-point-ssr", '"]')),
                n = !1;
            document.head.childNodes.forEach(function(r) {
                var i, a;
                r === t ? n = !0 : n && r.nodeType === Node.ELEMENT_NODE && ((null == (i = r.getAttribute("data-emotion")) ? void 0 : i.includes("".concat(ud, "-global"))) || (null == (a = r.getAttribute("data-emotion")) ? void 0 : a.includes("".concat(uf, "-global")))) && r.remove()
            })
        },
        uv = function(t) {
            var n = t.cache,
                r = t.children,
                i = n.muiCache,
                a = n.tssCache;
            return oc.default.createElement(oj.CacheProvider, {
                value: i
            }, oc.default.createElement(oO.T, {
                value: a
            }, r))
        },
        um = t.i(967457),
        uy = t.i(734975),
        ug = -1,
        ub = function(t) {
            "hidden" === document.visibilityState && ug > -1 && (ug = "visibilitychange" === t.type ? t.timeStamp : 0, uw())
        },
        uw = function() {
            removeEventListener("visibilitychange", ub, !0), removeEventListener("prerenderingchange", ub, !0)
        },
        ux = {
            passive: !0,
            capture: !0
        },
        uP = new Date,
        uR = function(t, n) {
            us || (us = n, uu = t, ul = new Date, uE(removeEventListener), uT())
        },
        uT = function() {
            if (uu >= 0 && uu < ul - uP) {
                var t = {
                    entryType: "first-input",
                    name: us.type,
                    target: us.target,
                    cancelable: us.cancelable,
                    startTime: us.timeStamp,
                    processingStart: us.timeStamp + uu
                };
                uc.forEach(function(n) {
                    n(t)
                }), uc = []
            }
        },
        uS = function(t) {
            if (t.cancelable) {
                var n, r, i, a = (t.timeStamp > 1e12 ? new Date : performance.now()) - t.timeStamp;
                "pointerdown" == t.type ? (n = function() {
                    uR(a, t), i()
                }, r = function() {
                    i()
                }, i = function() {
                    removeEventListener("pointerup", n, ux), removeEventListener("pointercancel", r, ux)
                }, addEventListener("pointerup", n, ux), addEventListener("pointercancel", r, ux)) : uR(a, t)
            }
        },
        uE = function(t) {
            ["mousedown", "keydown", "touchstart", "pointerdown"].forEach(function(n) {
                return t(n, uS, ux)
            })
        };
    let uq = null;
    var uk = t.i(665869),
        uA = t.i(906791),
        uC = t.i(968439),
        uI = t.i(721281),
        uL = t.i(677753),
        uj = function(t, n) {
            return (uj = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(t, n) {
                t.__proto__ = n
            } || function(t, n) {
                for (var r in n) Object.prototype.hasOwnProperty.call(n, r) && (t[r] = n[r])
            })(t, n)
        };

    function uO(t, n) {
        if ("function" != typeof n && null !== n) throw TypeError("Class extends value " + String(n) + " is not a constructor or null");

        function r() {
            this.constructor = t
        }
        uj(t, n), t.prototype = null === n ? Object.create(n) : (r.prototype = n.prototype, new r)
    }

    function uD(t, n, r, i) {
        return new(r || (r = Promise))(function(a, o) {
            function s(t) {
                try {
                    l(i.next(t))
                } catch (t) {
                    o(t)
                }
            }

            function u(t) {
                try {
                    l(i.throw(t))
                } catch (t) {
                    o(t)
                }
            }

            function l(t) {
                var n;
                t.done ? a(t.value) : ((n = t.value) instanceof r ? n : new r(function(t) {
                    t(n)
                })).then(s, u)
            }
            l((i = i.apply(t, n || [])).next())
        })
    }

    function uN(t, n) {
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
            return function(l) {
                var c = [u, l];
                if (r) throw TypeError("Generator is already executing.");
                for (; s && (s = 0, c[0] && (o = 0)), o;) try {
                    if (r = 1, i && (a = 2 & c[0] ? i.return : c[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, c[1])).done) return a;
                    switch (i = 0, a && (c = [2 & c[0], a.value]), c[0]) {
                        case 0:
                        case 1:
                            a = c;
                            break;
                        case 4:
                            return o.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            o.label++, i = c[1], c = [0];
                            continue;
                        case 7:
                            c = o.ops.pop(), o.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === c[0] && (!a || c[1] > a[0] && c[1] < a[3])) {
                                o.label = c[1];
                                break
                            }
                            if (6 === c[0] && o.label < a[1]) {
                                o.label = a[1], a = c;
                                break
                            }
                            if (a && o.label < a[2]) {
                                o.label = a[2], o.ops.push(c);
                                break
                            }
                            a[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    c = n.call(t, o)
                } catch (t) {
                    c = [6, t], i = 0
                } finally {
                    r = a = 0
                }
                if (5 & c[0]) throw c[1];
                return {
                    value: c[0] ? c[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function u_(t) {
        if (void 0 !== t) return null === t ? null : {
            LinkingPlatform: t.linkingPlatform
        }
    }

    function uM(t) {
        if (void 0 !== t) return null === t ? null : {
            pin: t.pin,
            reauthenticationToken: t.reauthenticationToken
        }
    }

    function uB(t) {
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

    function uV(t) {
        var n;
        return null == (n = t) ? n : {
            code: (0, uL.exists)(n, "Code") ? n.Code : void 0,
            message: (0, uL.exists)(n, "Message") ? n.Message : void 0
        }
    }

    function uU(t) {
        var n;
        return null == (n = t) ? n : {
            errors: (0, uL.exists)(n, "errors") ? n.errors.map(uV) : void 0,
            usernamePrefix: (0, uL.exists)(n, "usernamePrefix") ? n.usernamePrefix : void 0,
            username: (0, uL.exists)(n, "username") ? n.username : void 0,
            userId: (0, uL.exists)(n, "userId") ? n.userId : void 0,
            password: (0, uL.exists)(n, "password") ? n.password : void 0
        }
    }

    function uF(t) {
        var n;
        return null == (n = t) ? n : {
            userId: (0, uL.exists)(n, "userId") ? n.userId : void 0,
            userKey: (0, uL.exists)(n, "userKey") ? n.userKey : void 0,
            name: (0, uL.exists)(n, "name") ? n.name : void 0,
            displayName: (0, uL.exists)(n, "displayName") ? n.displayName : void 0,
            createdTime: (0, uL.exists)(n, "createdTime") ? new Date(n.createdTime) : void 0,
            updatedTime: (0, uL.exists)(n, "updatedTime") ? new Date(n.updatedTime) : void 0,
            accountCountry: (0, uL.exists)(n, "accountCountry") ? n.accountCountry : void 0
        }
    }

    function uG(t) {
        var n;
        return null == (n = t) ? n : {
            method: (0, uL.exists)(n, "method") ? n.method : void 0,
            priority: (0, uL.exists)(n, "priority") ? n.priority : void 0
        }
    }

    function uK(t) {
        if (void 0 !== t) return null === t ? null : {
            clientPublicKey: t.clientPublicKey,
            clientEpochTimestamp: t.clientEpochTimestamp,
            saiSignature: t.saiSignature,
            serverNonce: t.serverNonce
        }
    }

    function uW(t) {
        if (void 0 !== t) return null === t ? null : {
            ctype: t.ctype,
            cvalue: t.cvalue,
            password: t.password,
            userId: t.userId,
            securityQuestionSessionId: t.securityQuestionSessionId,
            securityQuestionRedemptionToken: t.securityQuestionRedemptionToken,
            secureAuthenticationIntent: uK(t.secureAuthenticationIntent),
            accountBlob: t.accountBlob,
            accountLinkParameters: u_(t.accountLinkParameters),
            captchaId: t.captchaId,
            captchaToken: t.captchaToken,
            captchaProvider: t.captchaProvider,
            challengeId: t.challengeId
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function uH(t, n) {
        var r, i;
        return null == t ? t : {
            user: (0, uL.exists)(t, "user") ? null == (r = t.user) ? r : {
                id: (0, uL.exists)(r, "id") ? r.id : void 0,
                name: (0, uL.exists)(r, "name") ? r.name : void 0,
                displayName: (0, uL.exists)(r, "displayName") ? r.displayName : void 0
            } : void 0,
            twoStepVerificationData: (0, uL.exists)(t, "twoStepVerificationData") ? null == (i = t.twoStepVerificationData) ? i : {
                mediaType: (0, uL.exists)(i, "mediaType") ? i.mediaType : void 0,
                ticket: (0, uL.exists)(i, "ticket") ? i.ticket : void 0
            } : void 0,
            identityVerificationLoginTicket: (0, uL.exists)(t, "identityVerificationLoginTicket") ? t.identityVerificationLoginTicket : void 0,
            isBanned: (0, uL.exists)(t, "isBanned") ? t.isBanned : void 0,
            accountBlob: (0, uL.exists)(t, "accountBlob") ? t.accountBlob : void 0,
            shouldUpdateEmail: (0, uL.exists)(t, "shouldUpdateEmail") ? t.shouldUpdateEmail : void 0,
            recoveryEmail: (0, uL.exists)(t, "recoveryEmail") ? t.recoveryEmail : void 0,
            passkeyRegistrationSucceeded: (0, uL.exists)(t, "passkeyRegistrationSucceeded") ? t.passkeyRegistrationSucceeded : void 0,
            shouldAutoLoginFromRecovery: (0, uL.exists)(t, "shouldAutoLoginFromRecovery") ? t.shouldAutoLoginFromRecovery : void 0,
            shouldPrompt2svRemoval: (0, uL.exists)(t, "shouldPrompt2svRemoval") ? t.shouldPrompt2svRemoval : void 0,
            shouldPromptPasskeyAddition: (0, uL.exists)(t, "shouldPromptPasskeyAddition") ? t.shouldPromptPasskeyAddition : void 0
        }
    }

    function uz(t, n) {
        return null == t ? t : {
            code: (0, uL.exists)(t, "code") ? t.code : void 0,
            message: (0, uL.exists)(t, "message") ? t.message : void 0
        }
    }

    function uJ(t) {
        if (void 0 !== t) return null === t ? null : {
            translationKey: t.translationKey,
            translationNamespace: t.translationNamespace,
            translatedSourceString: t.translatedSourceString,
            parameters: t.parameters
        }
    }

    function uQ(t) {
        if (void 0 !== t) return null === t ? null : {
            capturedAuditContent: void 0 === t.capturedAuditContent ? void 0 : (0, uL.mapValues)(t.capturedAuditContent, uJ),
            additionalAuditContent: t.additionalAuditContent
        }
    }

    function uX(t) {
        var n;
        return null == (n = t) ? n : {
            provider: (0, uL.exists)(n, "provider") ? n.provider : void 0,
            identifier: (0, uL.exists)(n, "identifier") ? n.identifier : void 0
        }
    }

    function u$(t, n) {
        return null == t ? t : {
            didGenerateNewUsername: (0, uL.exists)(t, "didGenerateNewUsername") ? t.didGenerateNewUsername : void 0,
            suggestedUsernames: (0, uL.exists)(t, "suggestedUsernames") ? t.suggestedUsernames : void 0
        }
    }

    function uZ(t) {
        var n;
        return null == (n = t) ? n : {
            nickname: (0, uL.exists)(n, "nickname") ? n.nickname : void 0
        }
    }

    function uY(t) {
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
            secureAuthenticationIntent: uK(t.secureAuthenticationIntent),
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
            accountLinkParameters: u_(t.accountLinkParameters),
            auditSystemContent: uQ(t.auditSystemContent),
            captchaId: t.captchaId,
            captchaToken: t.captchaToken,
            captchaProvider: t.captchaProvider,
            challengeId: t.challengeId
        }
    }

    function u0(t, n) {
        return null == t ? t : {
            userId: (0, uL.exists)(t, "userId") ? t.userId : void 0,
            starterPlaceId: (0, uL.exists)(t, "starterPlaceId") ? t.starterPlaceId : void 0,
            returnUrl: (0, uL.exists)(t, "returnUrl") ? t.returnUrl : void 0,
            accountBlob: (0, uL.exists)(t, "accountBlob") ? t.accountBlob : void 0
        }
    }

    function u1(t, n) {
        return null == t ? t : {
            voucher: (0, uL.exists)(t, "voucher") ? t.voucher : void 0,
            gender: (0, uL.exists)(t, "gender") ? t.gender : void 0,
            userId: (0, uL.exists)(t, "userId") ? t.userId : void 0,
            displayName: (0, uL.exists)(t, "displayName") ? t.displayName : void 0,
            openId: (0, uL.exists)(t, "openId") ? t.openId : void 0
        }
    }

    function u2(t) {
        if (void 0 !== t) return null === t ? null : {
            voucher: t.voucher,
            username: t.username,
            password: t.password
        }
    }

    function u4(t, n) {
        return null == t ? t : {
            loginPage: (0, uL.exists)(t, "loginPage") ? t.loginPage : void 0,
            realNameVerificationUrl: (0, uL.exists)(t, "realNameVerificationUrl") ? t.realNameVerificationUrl : void 0,
            isLinkingEnabled: (0, uL.exists)(t, "isLinkingEnabled") ? t.isLinkingEnabled : void 0
        }
    }

    function u3(t) {
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

    function u6(t) {
        if (void 0 !== t) return null === t ? null : {
            code: t.code,
            state: t.state,
            appType: t.appType,
            channelId: t.channelId
        }
    }

    function u8(t) {
        if (void 0 !== t) return null === t ? null : {
            voucher: t.voucher,
            username: t.username,
            ticket: t.ticket,
            code: t.code
        }
    }

    function u5(t, n) {
        return null == t ? t : {
            code: (0, uL.exists)(t, "code") ? t.code : void 0,
            message: (0, uL.exists)(t, "message") ? t.message : void 0
        }
    }

    function u9(t) {
        var n;
        return null == (n = t) ? n : {
            id: (0, uL.exists)(n, "Id") ? n.Id : void 0,
            userId: (0, uL.exists)(n, "UserId") ? n.UserId : void 0,
            username: (0, uL.exists)(n, "Username") ? n.Username : void 0
        }
    }

    function u7(t, n) {
        return null == t ? t : {
            success: (0, uL.exists)(t, "success") ? t.success : void 0
        }
    }(function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uO(n, t), n.prototype.v1AccountCreationMetadataGetRaw = function(t) {
            return uD(this, void 0, void 0, function() {
                var n, r, i;
                return uN(this, function(a) {
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
                            return i = a.sent(), [2, new uL.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    isEligibleForALSignup: (0, uL.exists)(t, "isEligibleForALSignup") ? t.isEligibleForALSignup : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1AccountCreationMetadataGet = function(t) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(n) {
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
    })(uL.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uO(n, t), n.prototype.v1AccountPinDeleteRaw = function(t, n) {
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/account/pin",
                                schemaPath: "/v1/account/pin",
                                method: "DELETE",
                                headers: i,
                                query: r,
                                body: uM(t.requestBody)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return u7(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1AccountPinDelete = function() {
            return uD(this, arguments, void 0, function(t, n) {
                return void 0 === t && (t = {}), uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var n, r, i;
                return uN(this, function(a) {
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
                            return i = a.sent(), [2, new uL.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    isEnabled: (0, uL.exists)(t, "isEnabled") ? t.isEnabled : void 0,
                                    unlockedUntil: (0, uL.exists)(t, "unlockedUntil") ? t.unlockedUntil : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1AccountPinGet = function(t) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(n) {
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
            return uD(this, void 0, void 0, function() {
                var n, r, i;
                return uN(this, function(a) {
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
                            return i = a.sent(), [2, new uL.JSONApiResponse(i, function(t) {
                                return u7(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1AccountPinLockPost = function(t) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(n) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.requestBody || void 0 === t.requestBody) throw new uL.RequiredError("requestBody", "Required parameter requestParameters.requestBody was null or undefined when calling v1AccountPinPatch.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/account/pin",
                                schemaPath: "/v1/account/pin",
                                method: "PATCH",
                                headers: i,
                                query: r,
                                body: uM(t.requestBody)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return u7(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1AccountPinPatch = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.requestBody || void 0 === t.requestBody) throw new uL.RequiredError("requestBody", "Required parameter requestParameters.requestBody was null or undefined when calling v1AccountPinPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/account/pin",
                                schemaPath: "/v1/account/pin",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: uM(t.requestBody)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return u7(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1AccountPinPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.requestBody || void 0 === t.requestBody) throw new uL.RequiredError("requestBody", "Required parameter requestParameters.requestBody was null or undefined when calling v1AccountPinUnlockPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/account/pin/unlock",
                                schemaPath: "/v1/account/pin/unlock",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: uM(t.requestBody)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    unlockedUntil: (0, uL.exists)(t, "unlockedUntil") ? t.unlockedUntil : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1AccountPinUnlockPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
    }(uL.BaseAPI);
    var le = function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        return uO(n, t), n.prototype.v1AuthMetadataGetRaw = function(t) {
            return uD(this, void 0, void 0, function() {
                var n, r, i;
                return uN(this, function(a) {
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
                            return i = a.sent(), [2, new uL.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    cookieLawNoticeTimeout: (0, uL.exists)(t, "cookieLawNoticeTimeout") ? t.cookieLawNoticeTimeout : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1AuthMetadataGet = function(t) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(n) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1LoginLinkedPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/login/linked",
                                schemaPath: "/v1/login/linked",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: uW(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return uH(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1LoginLinkedPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1LoginPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/login",
                                schemaPath: "/v1/login",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: uW(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return uH(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1LoginPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var n, r, i;
                return uN(this, function(a) {
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
                            return i = a.sent(), [2, new uL.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1LogoutPost = function(t) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(n) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1LogoutfromallsessionsandreauthenticatePost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/logoutfromallsessionsandreauthenticate",
                                schemaPath: "/v1/logoutfromallsessionsandreauthenticate",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        SecureAuthenticationIntent: uK(t.secureAuthenticationIntent)
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1LogoutfromallsessionsandreauthenticatePost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var n, r, i;
                return uN(this, function(a) {
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
                            return i = a.sent(), [2, new uL.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1SessionRefreshPost = function(t) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(n) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.userId || void 0 === t.userId) throw new uL.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdImpersonatePost.");
                            return r = {}, i = {}, [4, this.request({
                                path: "/v1/users/{userId}/impersonate".replace("{".concat("userId", "}"), encodeURIComponent(String(t.userId))),
                                schemaPath: "/v1/users/{userId}/impersonate",
                                method: "POST",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1UsersUserIdImpersonatePost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
    }(uL.BaseAPI);
    (function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uO(n, t), n.prototype.v1AuthenticationTicketPostRaw = function(t, n) {
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1AuthenticationTicketPost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1AuthenticationTicketPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.rBXAuthenticationNegotiation || void 0 === t.rBXAuthenticationNegotiation) throw new uL.RequiredError("rBXAuthenticationNegotiation", "Required parameter requestParameters.rBXAuthenticationNegotiation was null or undefined when calling v1AuthenticationTicketRedeemPost.");
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1AuthenticationTicketRedeemPost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    accountBlob: (0, uL.exists)(t, "accountBlob") ? t.accountBlob : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1AuthenticationTicketRedeemPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1AuthenticationTicketRetrieveUserPost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    userId: (0, uL.exists)(t, "UserId") ? t.UserId : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1AuthenticationTicketRetrieveUserPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var n, r, i;
                return uN(this, function(a) {
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
                            return i = a.sent(), [2, new uL.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    clientAssertion: (0, uL.exists)(t, "clientAssertion") ? t.clientAssertion : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1ClientAssertionGet = function(t) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(n) {
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
    })(uL.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uO(n, t), n.prototype.v1ExternalAccessPostRaw = function(t, n) {
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1ExternalAccessPost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    placeId: (0, uL.exists)(t, "placeId") ? t.placeId : void 0,
                                    isolationContext: (0, uL.exists)(t, "isolationContext") ? t.isolationContext : void 0,
                                    launchData: (0, uL.exists)(t, "launchData") ? t.launchData : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1ExternalAccessPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.identityProviderId || void 0 === t.identityProviderId) throw new uL.RequiredError("identityProviderId", "Required parameter requestParameters.identityProviderId was null or undefined when calling v1ExternalIdentityProviderIdSsoOauthCallbackGet.");
                            if (null === t.code || void 0 === t.code) throw new uL.RequiredError("code", "Required parameter requestParameters.code was null or undefined when calling v1ExternalIdentityProviderIdSsoOauthCallbackGet.");
                            if (null === t.state || void 0 === t.state) throw new uL.RequiredError("state", "Required parameter requestParameters.state was null or undefined when calling v1ExternalIdentityProviderIdSsoOauthCallbackGet.");
                            return r = {}, void 0 !== t.code && (r.code = t.code), void 0 !== t.state && (r.state = t.state), i = {}, [4, this.request({
                                path: "/v1/external/{identityProviderId}/sso/oauth/callback".replace("{".concat("identityProviderId", "}"), encodeURIComponent(String(t.identityProviderId))),
                                schemaPath: "/v1/external/{identityProviderId}/sso/oauth/callback",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.VoidApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1ExternalIdentityProviderIdSsoOauthCallbackGet = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1ExternalIdentityProviderIdSsoOauthCallbackGetRaw(t, n)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, n.prototype.v1ExternalIdentityProviderIdSsoOauthInitGetRaw = function(t, n) {
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.identityProviderId || void 0 === t.identityProviderId) throw new uL.RequiredError("identityProviderId", "Required parameter requestParameters.identityProviderId was null or undefined when calling v1ExternalIdentityProviderIdSsoOauthInitGet.");
                            return r = {}, i = {}, [4, this.request({
                                path: "/v1/external/{identityProviderId}/sso/oauth/init".replace("{".concat("identityProviderId", "}"), encodeURIComponent(String(t.identityProviderId))),
                                schemaPath: "/v1/external/{identityProviderId}/sso/oauth/init",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.VoidApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1ExternalIdentityProviderIdSsoOauthInitGet = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1ExternalIdentityProviderIdSsoOauthInitGetRaw(t, n)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, n.prototype.v1ExternalIdentityProviderIdSsoSamlAssertionConsumerServicePostRaw = function(t, n) {
            return uD(this, void 0, void 0, function() {
                var r, i, a, o;
                return uN(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.identityProviderId || void 0 === t.identityProviderId) throw new uL.RequiredError("identityProviderId", "Required parameter requestParameters.identityProviderId was null or undefined when calling v1ExternalIdentityProviderIdSsoSamlAssertionConsumerServicePost.");
                            return r = {}, i = {}, (0, uL.canConsumeForm)([{
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
                            return o = s.sent(), [2, new uL.VoidApiResponse(o)]
                    }
                })
            })
        }, n.prototype.v1ExternalIdentityProviderIdSsoSamlAssertionConsumerServicePost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1ExternalIdentityProviderIdSsoSamlAssertionConsumerServicePostRaw(t, n)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, n.prototype.v1ExternalLoginAndLinkPostRaw = function(t, n) {
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1ExternalLoginAndLinkPost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return uH(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1ExternalLoginAndLinkPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1ExternalLoginPost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    success: (0, uL.exists)(t, "success") ? t.success : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1ExternalLoginPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1ExternalSignupPost.");
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
                            return a = o.sent(), [2, new uL.VoidApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1ExternalSignupPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1ExternalSignupPostRaw(t, n)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, n.prototype.v1ExternalUnlinkPostRaw = function(t, n) {
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1ExternalUnlinkPost.");
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
                            return a = o.sent(), [2, new uL.VoidApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1ExternalUnlinkPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1ExternalUnlinkPostRaw(t, n)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }
    }(uL.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uO(n, t), n.prototype.v1IdentityInitializeLoginPostRaw = function(t, n) {
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.initializeLoginRequest || void 0 === t.initializeLoginRequest) throw new uL.RequiredError("initializeLoginRequest", "Required parameter requestParameters.initializeLoginRequest was null or undefined when calling v1IdentityInitializeLoginPost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    loginMethods: (0, uL.exists)(t, "loginMethods") ? t.loginMethods.map(uG) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1IdentityInitializeLoginPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
    }(uL.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uO(n, t), n.prototype.v1IdentityVerificationLoginPostRaw = function(t, n) {
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1IdentityVerificationLoginPost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1IdentityVerificationLoginPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
    }(uL.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uO(n, t), n.prototype.v1MetadataGetRaw = function(t) {
            return uD(this, void 0, void 0, function() {
                var n, r, i;
                return uN(this, function(a) {
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
                            return i = a.sent(), [2, new uL.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    isUpdateUsernameEnabled: (0, uL.exists)(t, "isUpdateUsernameEnabled") ? t.isUpdateUsernameEnabled : void 0,
                                    ftuxAvatarAssetMap: (0, uL.exists)(t, "ftuxAvatarAssetMap") ? t.ftuxAvatarAssetMap : void 0,
                                    isEmailUpsellAtLogoutEnabled: (0, uL.exists)(t, "IsEmailUpsellAtLogoutEnabled") ? t.IsEmailUpsellAtLogoutEnabled : void 0,
                                    shouldFetchEmailUpsellIXPValuesAtLogout: (0, uL.exists)(t, "ShouldFetchEmailUpsellIXPValuesAtLogout") ? t.ShouldFetchEmailUpsellIXPValuesAtLogout : void 0,
                                    isAccountRecoveryPromptEnabled: (0, uL.exists)(t, "IsAccountRecoveryPromptEnabled") ? t.IsAccountRecoveryPromptEnabled : void 0,
                                    isContactMethodRequiredAtSignup: (0, uL.exists)(t, "IsContactMethodRequiredAtSignup") ? t.IsContactMethodRequiredAtSignup : void 0,
                                    isUserAgreementsSignupIntegrationEnabled: (0, uL.exists)(t, "IsUserAgreementsSignupIntegrationEnabled") ? t.IsUserAgreementsSignupIntegrationEnabled : void 0,
                                    isPasswordRequiredForUsernameChange: (0, uL.exists)(t, "IsPasswordRequiredForUsernameChange") ? t.IsPasswordRequiredForUsernameChange : void 0,
                                    isPasskeyFeatureEnabled: (0, uL.exists)(t, "IsPasskeyFeatureEnabled") ? t.IsPasskeyFeatureEnabled : void 0,
                                    isAltBrowserTracker: (0, uL.exists)(t, "IsAltBrowserTracker") ? t.IsAltBrowserTracker : void 0,
                                    isLoginRedirectPageEnabled: (0, uL.exists)(t, "IsLoginRedirectPageEnabled") ? t.IsLoginRedirectPageEnabled : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1MetadataGet = function(t) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(n) {
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
    }(uL.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uO(n, t), n.prototype.v1PalisadesLiveConnectPostRaw = function(t, n) {
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PalisadesLiveConnectPost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return uH(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1PalisadesLiveConnectPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var n, r, i;
                return uN(this, function(a) {
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
                            return i = a.sent(), [2, new uL.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1PalisadesLiveDisconnectPost = function(t) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(n) {
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
            return uD(this, void 0, void 0, function() {
                var n, r, i;
                return uN(this, function(a) {
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
                            return i = a.sent(), this.isJsonMime(i.headers.get("content-type")) ? [2, new uL.JSONApiResponse(i)] : [2, new uL.TextApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1PalisadesLiveIsLiveGet = function(t) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(n) {
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
            return uD(this, void 0, void 0, function() {
                var n, r, i;
                return uN(this, function(a) {
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
                            return i = a.sent(), this.isJsonMime(i.headers.get("content-type")) ? [2, new uL.JSONApiResponse(i)] : [2, new uL.TextApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1PalisadesLiveLoginPost = function(t) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(n) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PalisadesLiveSignupPost.");
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
                                        auditSystemContent: uQ(t.auditSystemContent)
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), this.isJsonMime(a.headers.get("content-type")) ? [2, new uL.JSONApiResponse(a)] : [2, new uL.TextApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1PalisadesLiveSignupPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
    }(uL.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uO(n, t), n.prototype.v1PasskeyDeleteCredentialBatchPostRaw = function(t, n) {
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyDeleteCredentialBatchPost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1PasskeyDeleteCredentialBatchPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyFinishArPreauthRegistrationPost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1PasskeyFinishArPreauthRegistrationPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyFinishPreauthRegistrationPost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1PasskeyFinishPreauthRegistrationPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyFinishRegistrationPost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1PasskeyFinishRegistrationPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyListCredentialsPost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    credentials: (0, uL.exists)(t, "credentials") ? t.credentials.map(uZ) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1PasskeyListCredentialsPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyStartAuthenticationByUserPost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    authenticationOptions: (0, uL.exists)(t, "authenticationOptions") ? t.authenticationOptions : void 0,
                                    sessionId: (0, uL.exists)(t, "sessionId") ? t.sessionId : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1PasskeyStartAuthenticationByUserPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var n, r, i;
                return uN(this, function(a) {
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
                            return i = a.sent(), [2, new uL.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    authenticationOptions: (0, uL.exists)(t, "authenticationOptions") ? t.authenticationOptions : void 0,
                                    sessionId: (0, uL.exists)(t, "sessionId") ? t.sessionId : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1PasskeyStartAuthenticationPost = function(t) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(n) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyStartPreauthRegistrationPost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    creationOptions: (0, uL.exists)(t, "creationOptions") ? t.creationOptions : void 0,
                                    sessionId: (0, uL.exists)(t, "sessionId") ? t.sessionId : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1PasskeyStartPreauthRegistrationPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyStartRegistrationPost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    creationOptions: (0, uL.exists)(t, "creationOptions") ? t.creationOptions : void 0,
                                    sessionId: (0, uL.exists)(t, "sessionId") ? t.sessionId : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1PasskeyStartRegistrationPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var n, r, i;
                return uN(this, function(a) {
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
                            return i = a.sent(), [2, new uL.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    suEligibility: (0, uL.exists)(t, "suEligibility") ? t.suEligibility : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1PasskeySuEligibilityGet = function(t) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(n) {
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
    }(uL.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uO(n, t), n.prototype.v1UserPasswordsChangePostRaw = function(t, n) {
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1UserPasswordsChangePost.");
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
                                        secureAuthenticationIntent: uK(t.secureAuthenticationIntent)
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1UserPasswordsChangePost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
    }(uL.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uO(n, t), n.prototype.v1PasswordsValidateGetRaw = function(t, n) {
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.username || void 0 === t.username) throw new uL.RequiredError("username", "Required parameter requestParameters.username was null or undefined when calling v1PasswordsValidateGet.");
                            if (null === t.password || void 0 === t.password) throw new uL.RequiredError("password", "Required parameter requestParameters.password was null or undefined when calling v1PasswordsValidateGet.");
                            return r = {}, void 0 !== t.username && (r.Username = t.username), void 0 !== t.password && (r.Password = t.password), i = {}, [4, this.request({
                                path: "/v1/passwords/validate",
                                schemaPath: "/v1/passwords/validate",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return uz(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1PasswordsValidateGet = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasswordsValidatePost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return uz(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1PasswordsValidatePost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
    }(uL.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uO(n, t), n.prototype.v1QqCallbackPostRaw = function(t, n) {
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1QqCallbackPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/qq/callback",
                                schemaPath: "/v1/qq/callback",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: u6(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return u1(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1QqCallbackPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1QqConnectPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/qq/connect",
                                schemaPath: "/v1/qq/connect",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: u2(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return uH(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1QqConnectPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return u4(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1QqMetadataGet = function() {
            return uD(this, arguments, void 0, function(t, n) {
                return void 0 === t && (t = {}), uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1QqSignupwithoutpasswordPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/qq/signupwithoutpassword",
                                schemaPath: "/v1/qq/signupwithoutpassword",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: u3(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return u0(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1QqSignupwithoutpasswordPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1QqTokenAuthenticationPost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return u1(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1QqTokenAuthenticationPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1QqVerifyConnectPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/qq/verify-connect",
                                schemaPath: "/v1/qq/verify-connect",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: u8(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1QqVerifyConnectPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
    }(uL.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uO(n, t), n.prototype.v1RecoveryMetadataGetRaw = function(t) {
            return uD(this, void 0, void 0, function() {
                var n, r, i;
                return uN(this, function(a) {
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
                            return i = a.sent(), [2, new uL.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    isOnPhone: (0, uL.exists)(t, "isOnPhone") ? t.isOnPhone : void 0,
                                    codeLength: (0, uL.exists)(t, "codeLength") ? t.codeLength : void 0,
                                    isPhoneFeatureEnabledForUsername: (0, uL.exists)(t, "isPhoneFeatureEnabledForUsername") ? t.isPhoneFeatureEnabledForUsername : void 0,
                                    isPhoneFeatureEnabledForPassword: (0, uL.exists)(t, "isPhoneFeatureEnabledForPassword") ? t.isPhoneFeatureEnabledForPassword : void 0,
                                    isBedev2CaptchaEnabledForPasswordReset: (0, uL.exists)(t, "isBedev2CaptchaEnabledForPasswordReset") ? t.isBedev2CaptchaEnabledForPasswordReset : void 0,
                                    isUsernameRecoveryDeprecated: (0, uL.exists)(t, "isUsernameRecoveryDeprecated") ? t.isUsernameRecoveryDeprecated : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1RecoveryMetadataGet = function(t) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(n) {
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
    }(uL.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uO(n, t), n.prototype.v1RevertAccountGetRaw = function(t, n) {
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.ticket || void 0 === t.ticket) throw new uL.RequiredError("ticket", "Required parameter requestParameters.ticket was null or undefined when calling v1RevertAccountGet.");
                            return r = {}, void 0 !== t.ticket && (r.ticket = t.ticket), i = {}, [4, this.request({
                                path: "/v1/revert/account",
                                schemaPath: "/v1/revert/account",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    isTwoStepVerificationEnabled: (0, uL.exists)(t, "isTwoStepVerificationEnabled") ? t.isTwoStepVerificationEnabled : void 0,
                                    isEmailVerified: (0, uL.exists)(t, "isEmailVerified") ? t.isEmailVerified : void 0,
                                    isEmailChanged: (0, uL.exists)(t, "isEmailChanged") ? t.isEmailChanged : void 0,
                                    isPhoneVerified: (0, uL.exists)(t, "isPhoneVerified") ? t.isPhoneVerified : void 0,
                                    userId: (0, uL.exists)(t, "userId") ? t.userId : void 0,
                                    username: (0, uL.exists)(t, "username") ? t.username : void 0,
                                    ticket: (0, uL.exists)(t, "ticket") ? t.ticket : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1RevertAccountGet = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1RevertAccountPost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return uH(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1RevertAccountPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var n, r, i;
                return uN(this, function(a) {
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
                            return i = a.sent(), [2, new uL.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1RevertInvalidateTicketsPost = function(t) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(n) {
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
    }(uL.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uO(n, t), n.prototype.v1SignupLinkedPostRaw = function(t, n) {
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1SignupLinkedPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/signup/linked",
                                schemaPath: "/v1/signup/linked",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: uY(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return u0(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1SignupLinkedPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1SignupPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/signup",
                                schemaPath: "/v1/signup",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: uY(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return u0(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1SignupPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
    }(uL.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uO(n, t), n.prototype.v1SocialConnectedProvidersGetRaw = function(t) {
            return uD(this, void 0, void 0, function() {
                var n, r, i;
                return uN(this, function(a) {
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
                            return i = a.sent(), [2, new uL.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    providers: (0, uL.exists)(t, "providers") ? t.providers.map(uX) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1SocialConnectedProvidersGet = function(t) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(n) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.provider || void 0 === t.provider) throw new uL.RequiredError("provider", "Required parameter requestParameters.provider was null or undefined when calling v1SocialProviderDisconnectPost.");
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1SocialProviderDisconnectPost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1SocialProviderDisconnectPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
    }(uL.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uO(n, t), n.prototype.v1TestUserAuthenticateApiKeyPostRaw = function(t, n) {
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1TestUserAuthenticateApiKeyPost.");
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
                            return a = o.sent(), [2, new uL.VoidApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1TestUserAuthenticateApiKeyPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1TestUserAuthenticateApiKeyPostRaw(t, n)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, n.prototype.v1TestUserCreateBatchPostRaw = function(t, n) {
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1TestUserCreateBatchPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/test-user/create-batch",
                                schemaPath: "/v1/test-user/create-batch",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        createTestUserRequests: void 0 === t.createTestUserRequests ? void 0 : t.createTestUserRequests.map(uB)
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    createTestUserResponses: (0, uL.exists)(t, "createTestUserResponses") ? t.createTestUserResponses.map(uU) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1TestUserCreateBatchPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1TestUserExemptionAddPost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1TestUserExemptionAddPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.testUserId || void 0 === t.testUserId) throw new uL.RequiredError("testUserId", "Required parameter requestParameters.testUserId was null or undefined when calling v1TestUserExemptionListGet.");
                            return r = {}, void 0 !== t.testUserId && (r.testUserId = t.testUserId), i = {}, [4, this.request({
                                path: "/v1/test-user/exemption/list",
                                schemaPath: "/v1/test-user/exemption/list",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    exemptions: (0, uL.exists)(t, "exemptions") ? t.exemptions : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1TestUserExemptionListGet = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1TestUserExemptionRemovePost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1TestUserExemptionRemovePost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var n, r, i;
                return uN(this, function(a) {
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
                            return i = a.sent(), [2, new uL.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    testUsers: (0, uL.exists)(t, "testUsers") ? t.testUsers.map(uF) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1TestUserListGet = function(t) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(n) {
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
            return uD(this, void 0, void 0, function() {
                var n, r, i;
                return uN(this, function(a) {
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
                            return i = a.sent(), [2, new uL.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1TestUserLogoutManagerPost = function(t) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(n) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1TestUserValidateManagerPost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    managerExternalIdentifier: (0, uL.exists)(t, "managerExternalIdentifier") ? t.managerExternalIdentifier : void 0,
                                    sessionExpirationDate: (0, uL.exists)(t, "sessionExpirationDate") ? new Date(t.sessionExpirationDate) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1TestUserValidateManagerPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
    }(uL.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uO(n, t), n.prototype.v1UsernameChangePriceGetRaw = function(t) {
            return uD(this, void 0, void 0, function() {
                var n, r, i;
                return uN(this, function(a) {
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
                            return i = a.sent(), [2, new uL.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    priceInRobux: (0, uL.exists)(t, "priceInRobux") ? t.priceInRobux : void 0,
                                    basePriceInRobux: (0, uL.exists)(t, "basePriceInRobux") ? t.basePriceInRobux : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1UsernameChangePriceGet = function(t) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(n) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1UsernamePost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1UsernamePost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
    }(uL.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uO(n, t), n.prototype.v1UsernamesGetRaw = function(t, n) {
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.username || void 0 === t.username) throw new uL.RequiredError("username", "Required parameter requestParameters.username was null or undefined when calling v1UsernamesGet.");
                            return r = {}, void 0 !== t.username && (r.username = t.username), i = {}, [4, this.request({
                                path: "/v1/usernames",
                                schemaPath: "/v1/usernames",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    usernames: (0, uL.exists)(t, "usernames") ? t.usernames : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1UsernamesGet = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1UsernamesRecoverPost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    transmissionType: (0, uL.exists)(t, "transmissionType") ? t.transmissionType : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1UsernamesRecoverPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.username || void 0 === t.username) throw new uL.RequiredError("username", "Required parameter requestParameters.username was null or undefined when calling v1UsernamesValidateGet.");
                            if (null === t.birthday || void 0 === t.birthday) throw new uL.RequiredError("birthday", "Required parameter requestParameters.birthday was null or undefined when calling v1UsernamesValidateGet.");
                            if (null === t.context || void 0 === t.context) throw new uL.RequiredError("context", "Required parameter requestParameters.context was null or undefined when calling v1UsernamesValidateGet.");
                            return r = {}, void 0 !== t.username && (r.Username = t.username), void 0 !== t.birthday && (r.Birthday = t.birthday.toISOString()), void 0 !== t.context && (r.Context = t.context), i = {}, [4, this.request({
                                path: "/v1/usernames/validate",
                                schemaPath: "/v1/usernames/validate",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return u5(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1UsernamesValidateGet = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1UsernamesValidatePost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return u5(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1UsernamesValidatePost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
    }(uL.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uO(n, t), n.prototype.v1ValidatorsEmailGetRaw = function(t, n) {
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.email || void 0 === t.email) throw new uL.RequiredError("email", "Required parameter requestParameters.email was null or undefined when calling v1ValidatorsEmailGet.");
                            return r = {}, void 0 !== t.email && (r.Email = t.email), i = {}, [4, this.request({
                                path: "/v1/validators/email",
                                schemaPath: "/v1/validators/email",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    isEmailValid: (0, uL.exists)(t, "isEmailValid") ? t.isEmailValid : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1ValidatorsEmailGet = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.displayName || void 0 === t.displayName) throw new uL.RequiredError("displayName", "Required parameter requestParameters.displayName was null or undefined when calling v1ValidatorsRecommendedUsernameFromDisplayNameGet.");
                            if (null === t.birthDay || void 0 === t.birthDay) throw new uL.RequiredError("birthDay", "Required parameter requestParameters.birthDay was null or undefined when calling v1ValidatorsRecommendedUsernameFromDisplayNameGet.");
                            return r = {}, void 0 !== t.displayName && (r.DisplayName = t.displayName), void 0 !== t.birthDay && (r.BirthDay = t.birthDay.toISOString()), i = {}, [4, this.request({
                                path: "/v1/validators/recommendedUsernameFromDisplayName",
                                schemaPath: "/v1/validators/recommendedUsernameFromDisplayName",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return u$(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1ValidatorsRecommendedUsernameFromDisplayNameGet = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.requestBody || void 0 === t.requestBody) throw new uL.RequiredError("requestBody", "Required parameter requestParameters.requestBody was null or undefined when calling v1ValidatorsRecommendedUsernameFromDisplayNamePost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return u$(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1ValidatorsRecommendedUsernameFromDisplayNamePost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.username || void 0 === t.username) throw new uL.RequiredError("username", "Required parameter requestParameters.username was null or undefined when calling v1ValidatorsUsernameGet.");
                            if (null === t.birthDay || void 0 === t.birthDay) throw new uL.RequiredError("birthDay", "Required parameter requestParameters.birthDay was null or undefined when calling v1ValidatorsUsernameGet.");
                            return r = {}, void 0 !== t.username && (r.Username = t.username), void 0 !== t.birthDay && (r.BirthDay = t.birthDay.toISOString()), i = {}, [4, this.request({
                                path: "/v1/validators/username",
                                schemaPath: "/v1/validators/username",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return u$(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1ValidatorsUsernameGet = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.requestBody || void 0 === t.requestBody) throw new uL.RequiredError("requestBody", "Required parameter requestParameters.requestBody was null or undefined when calling v1ValidatorsUsernamePost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return u$(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1ValidatorsUsernamePost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
    }(uL.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uO(n, t), n.prototype.v1WechatCallbackPostRaw = function(t, n) {
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatCallbackPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wechat/callback",
                                schemaPath: "/v1/wechat/callback",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: u6(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return u1(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1WechatCallbackPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatConnectPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wechat/connect",
                                schemaPath: "/v1/wechat/connect",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: u2(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return uH(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1WechatConnectPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return u4(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1WechatMetadataGet = function() {
            return uD(this, arguments, void 0, function(t, n) {
                return void 0 === t && (t = {}), uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatMigrateLuobuRnvMappingPost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    unionId: (0, uL.exists)(t, "unionId") ? t.unionId : void 0,
                                    username: (0, uL.exists)(t, "username") ? t.username : void 0,
                                    isSuccess: (0, uL.exists)(t, "isSuccess") ? t.isSuccess : void 0,
                                    reason: (0, uL.exists)(t, "reason") ? t.reason : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1WechatMigrateLuobuRnvMappingPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatRobloxAccountCreatePost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    userId: (0, uL.exists)(t, "userId") ? t.userId : void 0,
                                    isSuccess: (0, uL.exists)(t, "isSuccess") ? t.isSuccess : void 0,
                                    reason: (0, uL.exists)(t, "reason") ? t.reason : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1WechatRobloxAccountCreatePost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatSignupwithoutpasswordPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wechat/signupwithoutpassword",
                                schemaPath: "/v1/wechat/signupwithoutpassword",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: u3(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return u0(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1WechatSignupwithoutpasswordPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var n, r, i;
                return uN(this, function(a) {
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
                            return i = a.sent(), [2, new uL.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1WechatTencentIdGet = function(t) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(n) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatTokenAuthenticationPost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return u1(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1WechatTokenAuthenticationPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatVerifyConnectPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wechat/verify-connect",
                                schemaPath: "/v1/wechat/verify-connect",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: u8(t.request)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1WechatVerifyConnectPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
    }(uL.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uO(n, t), n.prototype.v1XboxConnectionGetRaw = function(t) {
            return uD(this, void 0, void 0, function() {
                var n, r, i;
                return uN(this, function(a) {
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
                            return i = a.sent(), [2, new uL.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    hasConnectedXboxAccount: (0, uL.exists)(t, "hasConnectedXboxAccount") ? t.hasConnectedXboxAccount : void 0,
                                    gamertag: (0, uL.exists)(t, "gamertag") ? t.gamertag : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1XboxConnectionGet = function(t) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(n) {
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
            return uD(this, void 0, void 0, function() {
                var n, r, i;
                return uN(this, function(a) {
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
                            return i = a.sent(), [2, new uL.JSONApiResponse(i, function(t) {
                                return u7(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1XboxDisconnectPost = function(t) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(n) {
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
            return uD(this, void 0, void 0, function() {
                var n, r, i;
                return uN(this, function(a) {
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
                            return i = a.sent(), [2, new uL.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    count: (0, uL.exists)(t, "count") ? t.count : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1XboxGetLoginConsecutiveDaysGet = function(t) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(n) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.xboxTranslateRequest || void 0 === t.xboxTranslateRequest) throw new uL.RequiredError("xboxTranslateRequest", "Required parameter requestParameters.xboxTranslateRequest was null or undefined when calling v1XboxTranslatePost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    users: (0, uL.exists)(t, "Users") ? t.Users.map(u9) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1XboxTranslatePost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
    }(uL.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uO(n, t), n.prototype.v1XboxLiveAccountGetRaw = function(t) {
            return uD(this, void 0, void 0, function() {
                var n, r, i;
                return uN(this, function(a) {
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
                            return i = a.sent(), [2, new uL.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    userId: (0, uL.exists)(t, "userId") ? t.userId : void 0,
                                    username: (0, uL.exists)(t, "username") ? t.username : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1XboxLiveAccountGet = function(t) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(n) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1XboxLiveConnectPost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return uH(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1XboxLiveConnectPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uL.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1XboxLiveConnectVerifyPost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1XboxLiveConnectVerifyPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var n, r, i;
                return uN(this, function(a) {
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
                            return i = a.sent(), [2, new uL.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1XboxLiveDisconnectPost = function(t) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(n) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.xboxLoginRequest || void 0 === t.xboxLoginRequest) throw new uL.RequiredError("xboxLoginRequest", "Required parameter requestParameters.xboxLoginRequest was null or undefined when calling v1XboxLiveLoginPost.");
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
                            return a = o.sent(), [2, new uL.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    newDailyLogin: (0, uL.exists)(t, "newDailyLogin") ? t.newDailyLogin : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1XboxLiveLoginPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
            return uD(this, void 0, void 0, function() {
                var r, i, a;
                return uN(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.signupRequest || void 0 === t.signupRequest) throw new uL.RequiredError("signupRequest", "Required parameter requestParameters.signupRequest was null or undefined when calling v1XboxLiveSignupPost.");
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
                                        auditSystemContent: uQ(t.auditSystemContent)
                                    }
                                }(t.signupRequest)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new uL.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1XboxLiveSignupPost = function(t, n) {
            return uD(this, void 0, void 0, function() {
                return uN(this, function(r) {
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
    }(uL.BaseAPI);
    var lt = t.i(272593);
    new class {
        async logout() {
            await this.authenticationAPI.v1LogoutPost()
        }
        constructor() {
            (0, uI._)(this, "authenticationAPI", void 0), this.authenticationAPI = new le((0, lt.createClientConfiguration)("auth", "bedev1"))
        }
    };
    let ln = new le((0, lt.createClientConfiguration)("auth", "bedev1"));
    var lr = t.i(66424),
        li = t.i(790806),
        la = t.i(650502),
        lo = t.i(220311);
    let ls = [lo.default.Home, lo.default.RoadMap, lo.default.AvatarAnalytics, lo.default.ShareLinkAnalytics, lo.default.StoreAnalytics, lo.default.Community, lo.default.Notifications, lo.default.Settings, lo.default.SendrNotificationPreferences, lo.default.Preferences, lo.default.Advanced, lo.default.DataCollectionSettings, lo.default.MarketplaceOnboarding, lo.default.FiatPaidAccess, lo.default.PublicPublish, lo.default.DevEx, lo.default.Wallet, lo.default.GameTranslation, lo.default.GameStringTranslation],
        lu = t => {
            let {
                provider: n
            } = t, {
                locale: r
            } = (0, oR.useLocalization)();
            return (0, oc.useEffect)(() => {
                null != r && n.loadTranslationResources([...ls], r)
            }, [r, n]), null
        };
    var ll = t.i(921394),
        lc = t.i(814975);
    let ld = t => {
        let {
            children: n
        } = t, {
            user: r
        } = (0, lc.useAuthentication)();
        return (0, m.jsx)(ll.ThemeModeProvider, {
            bedev2BaseUrl: "https://apis.roblox.com",
            currentUser: r,
            children: n
        })
    };
    var lf = t.i(354088),
        lh = t.i(406952);
    let lp = t => {
        let {
            themeElement: n,
            children: r
        } = t, {
            themeMode: i
        } = (0, ll.useThemeMode)();
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
        }, [i, n]), (0, m.jsx)(lh.UIThemeProvider, {
            theme: i,
            children: r
        })
    };
    var lv = t.i(709337),
        lm = t.i(512229),
        ly = t.i(215955),
        lg = t.i(479236),
        lb = t.i(964956),
        lw = t.i(507742),
        lx = t.i(157700),
        lP = t.i(523426),
        lR = t.i(239328),
        lT = t.i(954119),
        lS = t.i(134731),
        lE = t.i(165136),
        lq = t.i(942100),
        lk = t.i(779433),
        lA = t.i(118413),
        lC = t.i(428993),
        lI = t.i(9436),
        lL = t.i(846130),
        lj = t.i(787617),
        lO = t.i(360894),
        lD = t.i(704211),
        lN = t.i(92174),
        l_ = t.i(926415),
        lM = t.i(426173),
        lB = t.i(242002),
        lV = t.i(224223),
        lU = t.i(967230),
        lF = t.i(82899),
        lG = t.i(199972),
        lK = t.i(477797),
        lW = t.i(100022),
        lH = t.i(494192),
        lz = t.i(378089);
    let lJ = [{
        flag: lP.enhancedAntiCheatAccess,
        metadata: {
            namespace: "anti-cheat",
            name: "enhancedAntiCheatAccess",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: lR.enableTaxonomyBasedCreatorDashboard,
        metadata: {
            namespace: "avatar-marketplace",
            name: "enableTaxonomyBasedCreatorDashboard",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lR.enableCreatorShowcases,
        metadata: {
            namespace: "avatar-marketplace",
            name: "enableCreatorShowcases",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lR.enableAvatarCreationTokenCategories,
        metadata: {
            namespace: "avatar-marketplace",
            name: "enableAvatarCreationTokenCategories",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lR.enableBulkMakeupTokenCreation,
        metadata: {
            namespace: "avatar-marketplace",
            name: "enableBulkMakeupTokenCreation",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lR.isAutoPublishPreferencesEnabled,
        metadata: {
            namespace: "avatar-marketplace",
            name: "isAutoPublishPreferencesEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lR.showTaxonomyOnAvatarItemAnalyticsTab,
        metadata: {
            namespace: "avatar-marketplace",
            name: "showTaxonomyOnAvatarItemAnalyticsTab",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lR.enableCoreContentGatedBanner,
        metadata: {
            namespace: "avatar-marketplace",
            name: "enableCoreContentGatedBanner",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lT.creatorAnalytics,
        metadata: {
            namespace: "communities",
            name: "CreatorAnalytics",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "group"
        }
    }, {
        flag: lS.isAssetPrivacyOptOutSurveyEnabled,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isAssetPrivacyOptOutSurveyEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lS.isAssetAccessRequestsEnabled,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isAssetAccessRequestsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lS.isModelCustomThumbnailUploadEnabled,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isModelCustomThumbnailUploadEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lS.isAssetDependenciesViewerEnabled,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isAssetDependenciesViewerEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lS.isCreatorStoreVideoMultipartUploadEnabled,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isCreatorStoreVideoMultipartUploadEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lS.isPricingEligibilityV2Enabled,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isPricingEligibilityV2Enabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lS.isPublishBeforeExposeEnabled,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isPublishBeforeExposeEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lE.isExperiencePreviewEnabled,
        metadata: {
            namespace: "content-licensing",
            name: "isExperiencePreviewEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: lE.enableIpPlatformLicenseRecommendations,
        metadata: {
            namespace: "content-licensing",
            name: "enableIpPlatformLicenseRecommendations",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lE.isIpLicensingEarningsEnabled,
        metadata: {
            namespace: "content-licensing",
            name: "isIpLicensingEarningsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lE.isImageAttachmentEnabledInLicenseApplication,
        metadata: {
            namespace: "content-licensing",
            name: "isImageAttachmentEnabledInLicenseApplication",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lE.isShowcaseExperiencesEnabled,
        metadata: {
            namespace: "content-licensing",
            name: "isShowcaseExperiencesEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lE.isIgnoreMatchEnabled,
        metadata: {
            namespace: "content-licensing",
            name: "isIgnoreMatchEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lE.isAvatarItemLicensingEnabled,
        metadata: {
            namespace: "content-licensing",
            name: "isAvatarItemLicensingEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lE.isInGameSalesLicensingEnabled,
        metadata: {
            namespace: "content-licensing",
            name: "isInGameSalesLicensingEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lE.maxCollectibleItemDetailsRequestCount,
        metadata: {
            namespace: "content-licensing",
            name: "maxCollectibleItemDetailsRequestCount",
            defaultValue: 30,
            valueType: "number",
            contextType: "static"
        }
    }, {
        flag: lE.isIphInGameSalesAvatarMarketplaceSalesLicenseCreationEnabled,
        metadata: {
            namespace: "content-licensing",
            name: "isIphInGameSalesAvatarMarketplaceSalesLicenseCreationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lq.isPromotionalTextEnabled,
        metadata: {
            namespace: "content-publishing",
            name: "isPromotionalTextEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lk.questionnaireV2Allowlist,
        metadata: {
            namespace: "content-suitability",
            name: "questionnaireV2Allowlist",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lk.questionnaireV2Q1Release,
        metadata: {
            namespace: "content-suitability",
            name: "questionnaireV2Q1Release",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lk.questionnaireSectionStepperEnabled,
        metadata: {
            namespace: "content-suitability",
            name: "questionnaireSectionStepperEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lA.analyticsChartLoadEventstreamEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "analyticsChartLoadEventstreamEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lA.isLimitedAnalyticsAdminMonitoringNavigationEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isLimitedAnalyticsAdminMonitoringNavigationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lA.visibleAssetIdInPersonalizationEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "visibleAssetIdInPersonalizationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lA.isExperimentationTemplatesEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isExperimentationTemplatesEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lA.isCustomMetricsBackendEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isCustomMetricsBackendEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lA.isExperimentTargetingEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isExperimentTargetingEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: lA.acquisitionMigrationMetricsEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "acquisitionMigrationMetricsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lA.isTargetingConfigsEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isTargetingConfigsEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: lA.isExperimentNullControlValueEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isExperimentNullControlValueEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: lA.isExperimentRolloutEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isExperimentRolloutEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: lA.isGeneralBreakGlassBannerEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "IsGeneralBreakGlassBannerEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lA.isMonetizationBreakGlassBannerEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "IsMonetizationBreakGlassBannerEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lA.isPlayerFeedbackExampleCommentsEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isPlayerFeedbackExampleCommentsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lA.isAnalyticsAssistantChatEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantChatEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lA.isAnalyticsAssistantStreamSilenceRecoveryEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantStreamSilenceRecoveryEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lA.isAnalyticsAssistantIssueBannerEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantIssueBannerEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lA.showCreatorRewardsReportingDisclaimer,
        metadata: {
            namespace: "creator-analytics",
            name: "showCreatorRewardsReportingDisclaimer",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lA.isRotraceMetricEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isRotraceMetricEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: lA.isTelemetryMigrationEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isTelemetryMigrationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: lA.showVideoServiceDashboard,
        metadata: {
            namespace: "creator-analytics",
            name: "showVideoServiceDashboard",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lA.isTreemapColorBySiblingProportionEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isTreemapColorBySiblingProportionEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lA.isAssistantChartOverflowMenuEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isAssistantChartOverflowMenuEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lA.isAnalyticsMetricAwareYAxisFormatterEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isAnalyticsMetricAwareYAxisFormatterEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lA.isCustomDashboardsLocalStorageEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isCustomDashboardsLocalStorageEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lA.isJourneyEventsEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isJourneyEventsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: lA.isClientSessionsEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isClientSessionsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: lA.isEhdResultsEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isEhdResultsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lA.isEhdResultsAlwaysFetched,
        metadata: {
            namespace: "creator-analytics",
            name: "isEhdResultsAlwaysFetched",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lA.isMetricVariantChartStateEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isMetricVariantChartStateEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lA.isPeriodSummaryBridgeEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isPeriodSummaryBridgeEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: lA.isExperimentSegmentationEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isExperimentSegmentationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lA.isClientSessionDetailsV2Enabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isClientSessionDetailsV2Enabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: lC.isRevenueShareAgreementsEnabled,
        metadata: {
            namespace: "creator-business",
            name: "isRevenueShareAgreementsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lC.enableVirtualTransactionsTab,
        metadata: {
            namespace: "creator-business",
            name: "enableVirtualTransactionsTab",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lC.newCreatorWallets,
        metadata: {
            namespace: "creator-business",
            name: "newCreatorWallets",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lC.creatorWalletsOverviewPreview,
        metadata: {
            namespace: "creator-business",
            name: "creatorWalletsOverviewPreview",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lC.newTransactionsFlag,
        metadata: {
            namespace: "creator-business",
            name: "newTransactionsFlag",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lI.isBadgeDefaultIconEnabled,
        metadata: {
            namespace: "creator-creations",
            name: "isBadgeDefaultIconEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lI.isMomentsUploadEnabled,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsUploadEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lI.isMomentsSitetestUrlParsingEnabled,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsSitetestUrlParsingEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lI.isTextDocumentEnabled,
        metadata: {
            namespace: "creator-creations",
            name: "isTextDocumentEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lI.isMomentsUploadLanguageSelectEnabled,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsUploadLanguageSelectEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lI.isMomentsFeedIdEnabled,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsFeedIdEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lI.isMomentsPostCreationEnabled,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsPostCreationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lL.enablePlayerSupport,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerSupport",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: lL.enablePlayerHostedEvents,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerHostedEvents",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lL.enablePlayerSupportCreatorTicketReroute,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerSupportCreatorTicketReroute",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lL.enableReachStatusBadge,
        metadata: {
            namespace: "creator-gameops",
            name: "enableReachStatusBadge",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lL.enablePlayerSupportArchive,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerSupportArchive",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lL.enablePlayerSupportCategoryChange,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerSupportCategoryChange",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lL.enableEarlyTestersUserOwnedGame,
        metadata: {
            namespace: "creator-gameops",
            name: "enableEarlyTestersUserOwnedGame",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lj.isUpdatedPublishingFlowEnabled,
        metadata: {
            namespace: "creator-platform",
            name: "isUpdatedPublishingFlowEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lO.creatorRoadmapEnabled,
        metadata: {
            namespace: "creator-roadmap",
            name: "creatorRoadmapEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lD.isCsmExtendedMetricsEnabled,
        metadata: {
            namespace: "creator-services-insights",
            name: "isCsmExtendedMetricsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lN.shouldUseWatermarkFiatCalculation,
        metadata: {
            namespace: "devex",
            name: "shouldUseWatermarkFiatCalculation",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lN.isTaxDocumentationEnabled,
        metadata: {
            namespace: "devex",
            name: "isTaxDocumentationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l_.isBandwidthNetworkTabEnabled,
        metadata: {
            namespace: "engine-networking",
            name: "isBandwidthNetworkTabEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lM.isTaxDocumentationOpenToDevexEligible,
        metadata: {
            namespace: "financial-platform",
            name: "isTaxDocumentationOpenToDevexEligible",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lM.isTaxFormDeliveryConsentEnabled,
        metadata: {
            namespace: "financial-platform",
            name: "isTaxFormDeliveryConsentEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lM.taxFormDeliveryConsentRolloutPercentage,
        metadata: {
            namespace: "financial-platform",
            name: "taxFormDeliveryConsentRolloutPercentage",
            defaultValue: 100,
            valueType: "number",
            contextType: "static"
        }
    }, {
        flag: lB.isAcquisitionThumbnailUpsellEnabled,
        metadata: {
            namespace: "game-discovery-serving",
            name: "isAcquisitionThumbnailUpsellEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: lB.isHomeAcquisitionSignalsLayoutRefreshEnabled,
        metadata: {
            namespace: "game-discovery-serving",
            name: "isHomeAcquisitionSignalsLayoutRefreshEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: lV.enableMeshTextureApiRemoveIdVerification,
        metadata: {
            namespace: "game-engine-geometry",
            name: "enableMeshTextureApiRemoveIdVerification",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: uk.enableGroupGameEarlyTesters,
        metadata: {
            namespace: "groups",
            name: "enableGroupGameEarlyTesters",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: uk.enableGroupModerationPage,
        metadata: {
            namespace: "groups",
            name: "enableGroupModerationPage",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lU.isAdsPageRedesignEnabled,
        metadata: {
            namespace: "immersive-ads",
            name: "isAdsPageRedesignEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lU.isManagedRewardedTabEnabled,
        metadata: {
            namespace: "immersive-ads",
            name: "isManagedRewardedTabEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lU.managedRewardedCtrBenchmarkLow,
        metadata: {
            namespace: "immersive-ads",
            name: "managedRewardedCtrBenchmarkLow",
            defaultValue: .01,
            valueType: "number",
            contextType: "static"
        }
    }, {
        flag: lU.managedRewardedCtrBenchmarkHigh,
        metadata: {
            namespace: "immersive-ads",
            name: "managedRewardedCtrBenchmarkHigh",
            defaultValue: .05,
            valueType: "number",
            contextType: "static"
        }
    }, {
        flag: lF.isLeaderboardConfigsEnabled,
        metadata: {
            namespace: "leaderboards",
            name: "isLeaderboardConfigsEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lG.imageLocalizationSettingsEnabled,
        metadata: {
            namespace: "localization",
            name: "imageLocalizationSettingsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lG.imageTranslationAllowlist,
        metadata: {
            namespace: "localization",
            name: "imageTranslationAllowlist",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lK.mockManagedPricingSummary,
        metadata: {
            namespace: "monetization",
            name: "mockManagedPricingSummary",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lK.mockManagedPricingEvents,
        metadata: {
            namespace: "monetization",
            name: "mockManagedPricingEvents",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lK.mockHardCodedPrices,
        metadata: {
            namespace: "monetization",
            name: "mockHardCodedPrices",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lK.mockManagedPricingProductWrites,
        metadata: {
            namespace: "monetization",
            name: "mockManagedPricingProductWrites",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lK.isProductArchiveEnabled,
        metadata: {
            namespace: "monetization",
            name: "isProductArchiveEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lK.mockShopItemsExternalEligibility,
        metadata: {
            namespace: "monetization",
            name: "mockShopItemsExternalEligibility",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lK.isExperimentEligibilityEnabled,
        metadata: {
            namespace: "monetization",
            name: "isExperimentEligibilityEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lW.enablePayoutWatermarkContributions,
        metadata: {
            namespace: "payouts",
            name: "enablePayoutWatermarkContributions",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "group"
        }
    }, {
        flag: lH.presetChatEnabled,
        metadata: {
            namespace: "preset-chat",
            name: "presetChatEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: lz.enableTalentHubV2,
        metadata: {
            namespace: "talent-hub",
            name: "enableTalentHubV2",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lz.enableTalentHubV2M2,
        metadata: {
            namespace: "talent-hub",
            name: "enableTalentHubV2M2",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }];
    var lQ = t.i(745873);
    let lX = null,
        l$ = (0, lw.default)(() => t.A(73576).then(t => {
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
        lZ = () => {
            let t = (0, od.useRouter)(),
                n = (0, lQ.useCurrentGroup)(),
                [r, i] = (0, oc.useState)(!1);
            (0, oc.useEffect)(() => {
                let t = !0;
                return async function() {
                    try {
                        null != lX || (lX = (0, lx.initFlags)({
                            applicationId: "creator-dashboard",
                            baseUrl: "https://apis.roblox.com"
                        }).enableOverrides({
                            mode: "authorized-only",
                            useDefault: !0
                        }));
                        let n = await lX;
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
            return r ? (0, m.jsx)(l$, {
                flags: lJ,
                contexts: a
            }) : null
        };
    var lY = t.i(911502);
    let l0 = t => {
        let {
            providers: n,
            children: r
        } = t, i = r;
        for (let t = n.length - 1; t >= 0; t -= 1) i = oc.default.cloneElement(n[t], {}, i);
        return (0, m.jsx)(m.Fragment, {
            children: i
        })
    };
    var l1 = t.i(893949),
        l2 = t.i(413019),
        l4 = t.i(758835),
        l3 = t.i(823062);
    let l6 = t => {
        let {
            children: n,
            unifiedLogger: r,
            pageLoggerConfig: i
        } = t, a = null != r ? r : ly.default, {
            pathname: o
        } = (0, od.useRouter)(), s = (0, oc.useMemo)(() => {
            if (o) return "".concat(window.location.origin).concat(o)
        }, [o]);
        return (0, m.jsx)(l3.UnifiedLoggerProvider, {
            unifiedLogger: a,
            pageLoggerConfig: i,
            path: s,
            children: n
        })
    };
    var l8 = t.i(681559),
        l5 = t.i(272749),
        l9 = t.i(252842);
    let l7 = ["https://vitals.vercel-insights.com/v1/vitals"];
    var ce = t.i(120654);
    let ct = t => {
        let {
            children: n
        } = t, {
            user: r
        } = (0, lc.useAuthentication)(), i = (0, oc.useRef)(window.aegis);
        (0, oc.useEffect)(() => {
            i.current && i.current.setConfig({
                beforeReport: t => !(t.msg && l7.some(n => t.msg.includes(n))),
                api: {
                    retCodeHandler(t, n, r) {
                        let i = !(r.status === l9.StatusCodes.FORBIDDEN && r.headers.has("x-csrf-token") || r.status === l9.StatusCodes.OK || r.status === l9.StatusCodes.ACCEPTED),
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
        return (0, m.jsx)(ce.default.Provider, {
            value: a,
            children: n
        })
    };
    var cn = t.i(37819),
        cr = t.i(532045),
        ci = t.i(881670);
    let ca = "".concat("".concat("https://assets.create.roblox.com/265af8e6c3890a2bee3fed8c8ea1b021c1b0d4a8/assets", "/opengraph"), "/global_og_image.png"),
        co = (0, oR.withTranslation)(t => {
            let {
                openGraphMetadata: {
                    title: n,
                    description: r,
                    defaultLocale: i
                }
            } = t, {
                translate: a
            } = (0, oR.useTranslation)(), o = new URL(ca, "https://create.roblox.com").href, s = (0, cr.useTheme)();
            return (0, m.jsxs)(cn.HubMeta, {
                seoTitle: a("Label.CreatorDashboard"),
                ogTitle: n,
                description: r,
                ogImage: o,
                children: [(0, m.jsx)("link", {
                    rel: "icon",
                    type: "image/svg+xml",
                    href: "https://cdn.foundation.".concat("roblox.com", "/current/roblox-tilt/favicon.svg")
                }), (0, m.jsx)("link", {
                    rel: "icon",
                    href: "https://cdn.foundation.".concat("roblox.com", "/current/roblox-tilt/favicon.ico"),
                    sizes: "48x48"
                }), (0, m.jsx)("link", {
                    rel: "apple-touch-icon",
                    sizes: "180x180",
                    href: "https://cdn.foundation.".concat("roblox.com", "/current/roblox-tilt/apple-touch-icon.png")
                }), (0, m.jsx)("meta", {
                    name: "theme-color",
                    content: s.palette.surface[0]
                }, "theme-color"), (0, m.jsx)("meta", {
                    name: "viewport",
                    content: "minimum-scale=1, initial-scale=1, width=device-width"
                }), (0, m.jsx)("meta", {
                    name: "zd-site-verification",
                    content: "8ou4bshfpgbc1pk5x0qqt"
                }), (0, m.jsx)("meta", {
                    property: "og:url",
                    content: "https://create.roblox.com"
                }, "og:url"), (0, m.jsx)("meta", {
                    property: "og:type",
                    content: "website"
                }, "og:type"), (0, m.jsx)("meta", {
                    property: "og:locale",
                    content: i
                }, "og:locale")]
            })
        }, [ci.TranslationNamespace.Features]);
    var cs = t.i(984656),
        cu = t.i(157310),
        cl = t.i(655831),
        cc = t.i(932471),
        cc = cc,
        cd = t.i(748089),
        cf = t.i(61856),
        ch = t.i(239523);
    t.i(490742), t.i(925633), t.i(402171);
    var cp = t.i(455162);
    let cv = cl.$constructor("ZodMiniType", (t, n) => {
            if (!t._zod) throw Error("Uninitialized schema in ZodMiniType.");
            cf.$ZodType.init(t, n), t.def = n, t.type = n.type
        }, {
            get with() {
                return this.check
            },
            set with(value) {
                cd.own(this, "with", value)
            },
            parse(t, n) {
                return cp.parse(this, t, n, {
                    callee: this.parse
                })
            },
            parseAsync(t, n) {
                return cp.parseAsync(this, t, n, {
                    callee: this.parseAsync
                })
            },
            safeParse(t, n) {
                return cp.safeParse(this, t, n)
            },
            safeParseAsync(t, n) {
                return cp.safeParseAsync(this, t, n)
            },
            check() {
                for (var t, n = arguments.length, r = Array(n), i = 0; i < n; i++) r[i] = arguments[i];
                let a = this.def;
                return this.clone({
                    ...a,
                    checks: [...null != (t = a.checks) ? t : [], ...r.map(t => "function" == typeof t ? {
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
            },
            clone(t, n) {
                return cd.clone(this, t, n)
            },
            brand() {
                return this
            },
            register(t, n) {
                return t.add(this, n), this
            },
            apply(t) {
                for (var n = arguments.length, r = Array(n > 1 ? n - 1 : 0), i = 1; i < n; i++) r[i - 1] = arguments[i];
                return 0 === r.length ? t(this) : t(this, ...r)
            }
        }),
        cm = cl.$constructor("ZodMiniString", (t, n) => {
            cf.$ZodString.init(t, n), cv.init(t, n)
        });

    function cy(t) {
        return ch._string(cm, t)
    }(t, n) => {
        cf.$ZodStringFormat.init(t, n), cm.init(t, n)
    }, (t, n) => {
        cf.$ZodBigInt.init(t, n), cv.init(t, n)
    };
    let cg = cl.$constructor("ZodMiniUnknown", (t, n) => {
            cf.$ZodUnknown.init(t, n), cv.init(t, n)
        }),
        cb = cl.$constructor("ZodMiniArray", (t, n) => {
            cf.$ZodArray.init(t, n), cv.init(t, n)
        });

    function cw(t, n) {
        return new cb({
            type: "array",
            element: t,
            ...cd.normalizeParams(n)
        })
    }
    let cx = cl.$constructor("ZodMiniObject", (t, n) => {
        cf.$ZodObject.init(t, n), cv.init(t, n), cd.installLazyProp(t, "shape", t => t._zod.def.shape, !1)
    });

    function cP(t, n) {
        return new cx({
            type: "object",
            shape: null != t ? t : {},
            ...cd.normalizeParams(n)
        })
    }
    let cR = cl.$constructor("ZodMiniUnion", (t, n) => {
            cf.$ZodUnion.init(t, n), cv.init(t, n)
        }),
        cT = cl.$constructor("ZodMiniRecord", (t, n) => {
            cf.$ZodRecord.init(t, n), cv.init(t, n)
        }),
        cS = cl.$constructor("ZodMiniLiteral", (t, n) => {
            cf.$ZodLiteral.init(t, n), cv.init(t, n)
        });

    function cE(t, n) {
        return new cS({
            type: "literal",
            values: Array.isArray(t) ? t : [t],
            ...cd.normalizeParams(n)
        })
    }
    let cq = cl.$constructor("ZodMiniOptional", (t, n) => {
        cf.$ZodOptional.init(t, n), cv.init(t, n)
    });

    function ck(t) {
        return new cq({
            type: "optional",
            innerType: t
        })
    }(t, n) => {
        cf.$ZodPipe.init(t, n), cv.init(t, n)
    };
    let cA = cl.$constructor("ZodMiniCustom", (t, n) => {
        cf.$ZodCustom.init(t, n), cv.init(t, n)
    });

    function cC(t) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        return ch._refine(cA, t, n)
    }
    ch.describe, ch.meta;
    var cI = t.i(566387),
        cL = t.i(75584),
        cj = t.i(182012),
        cO = t.i(905943),
        cD = t.i(95899),
        cN = t.i(631226),
        c_ = t.i(659332),
        cM = t.i(818170),
        cB = t.i(607895),
        cV = t.i(41466),
        cU = t.i(306607),
        cF = t.i(904451),
        cG = (0, oc.createContext)(void 0),
        cK = t => {
            let {
                config: n,
                children: r
            } = t;
            return (0, m.jsx)(cG.Provider, {
                value: n,
                children: r
            })
        },
        cW = () => {
            let t = (0, oc.useContext)(cG);
            if (!t) throw Error("useNotApprovedUIConfig must be used within a NotApprovedUIProvider");
            return t
        },
        cH = ((i = cH || {}).Default = "default", i.Kids = "kids", i.Select = "select", i),
        cz = ((a = cz || {}).AccountReactivationPageRendered = "accountReactivationPageRendered", a.PageRendered = "pageRendered", a.UnmappedViolationKey = "unmappedViolationKey", a.CheckboxChecked = "checkboxChecked", a.LogoutClicked = "logoutClicked", a.ReactivateClicked = "reactivateClicked", a.ParentVerificationClicked = "parentVerificationClicked", a.EmailVerificationClicked = "emailVerificationClicked", a.TermsOfUseClicked = "termsOfUseClicked", a.AppealsProcessClicked = "appealsProcessClicked", a.CommunityGuidelineClicked = "communityGuidelineClicked", a.UGCGuidelinesClicked = "ugcGuidelinesClicked", a.AppealsPortalClicked = "appealsPortalClicked", a.ContinueClicked = "continueClicked", a.BackClicked = "backClicked", a.SecondChanceReactivateClicked = "secondChanceReactivateClicked", a.MissingTranslation = "missingTranslation", a.Error = "error", a.VerificationRedirectRendered = "verificationRedirectRendered", a.AccountReactivationRedirectRendered = "accountReactivationRedirectRendered", a),
        cJ = ((o = cJ || {}).NotApprovedPage = "NotApprovedPageV2", o);
    cl.config(cc.en());
    var cQ = cP({
            type: cE("platform"),
            displayMeta: ck(cP({
                lowercaseKey: cy().check(cI.minLength(1)),
                capitalizedKey: cy().check(cI.minLength(1)),
                icon: cy()
            })),
            elements: ck(cw(ch._unknown(cg)))
        }),
        cX = new cR({
            type: "union",
            options: [cP({
                type: cE("text"),
                labelKey: cy(),
                text: ck(cy()),
                textKey: ck(cy()),
                textKeyParameters: ck((s = cy(), new cT((u = cy()) && u._zod ? {
                    type: "record",
                    keyType: s,
                    valueType: u,
                    ...cd.normalizeParams(void 0)
                } : {
                    type: "record",
                    keyType: cy(),
                    valueType: s,
                    ...cd.normalizeParams(u)
                })))
            }).check(cC(t => void 0 !== t.text || void 0 !== t.textKey, {
                message: "Either 'text' or 'textKey' must be provided"
            }), cC(t => !t.textKeyParameters || void 0 !== t.textKey, {
                message: "'textKeyParameters' requires 'textKey' to be provided"
            })), cP({
                type: cE("image"),
                labelKey: cy(),
                url: cy(),
                altLabelKey: ck(cy())
            })],
            ...cd.normalizeParams(void 0)
        }),
        c$ = t => {
            let n = cX.safeParse(t);
            return !!n.success || (console.warn("Failed to parse platform element: ", n.error), !1)
        },
        cZ = cP({
            ...cQ.shape,
            elements: ck(cw(cX))
        }),
        cY = t => {
            let n = t.violation;
            if (!n) return !1;
            let {
                evidence: r
            } = n;
            if (!r || !(t => {
                    if ("platform" !== t.type) return !1;
                    let n = cQ.safeParse(t);
                    return !!n.success || (console.warn("Failed to parse platform evidence: ", n.error), !1)
                })(r)) return !1;
            let i = null == (a = r.elements) ? void 0 : a.filter(t => c$(t));
            if (!i || 0 === i.length) return !1;
            var a, o = {
                ...r,
                elements: i
            };
            if ("platform" !== o.type) return !1;
            let s = cZ.safeParse(o);
            return !!s.success || (console.warn("Failed to parse platform evidence fully typed: ", s.error), !1)
        },
        c0 = "UserSafety.NotApprovedPage.UserID",
        c1 = {
            displayLabel: "Label.AbuseType.SharingPII.Kids",
            moderatorNote: "Label.AbuseType.SharingPII.Note.Kids",
            education: {
                ruleTitle: "Heading.RuleExplanation.SharingPII.Kids",
                ruleDescription: "Description.RuleExplanation.SharingPII.Kids",
                ruleDescriptionBullets: "Description.RuleExplanation.Bullets.SharingPII.Kids",
                importanceTitle: "Heading.RuleImportance.Kids",
                importanceDescriptionBullets: "Description.RuleImportance.Bullets.SharingPII.Kids",
                policyKey: "kids-sharing-pii",
                deduplicationKey: "pii"
            }
        },
        c2 = {
            "Label.AbuseType.Harassment": {
                displayLabel: "Label.AbuseType.Bullying.Kids",
                moderatorNote: "Label.AbuseType.Bullying.Note.Kids",
                education: {
                    ruleTitle: "Heading.RuleExplanation.Bullying.Kids",
                    ruleDescriptionBullets: "Description.RuleExplanation.Bullets.Bullying.Kids",
                    importanceTitle: "Heading.RuleImportance.Kids",
                    importanceDescription: "Description.RuleImportance.Bullying.Kids",
                    policyKey: "kids-bullying",
                    deduplicationKey: "bullying-harassment-discrimination"
                }
            },
            "Label.AbuseType.PrivacyAskingforPII": c1,
            "Label.AbuseType.PrivacyGivingPII": c1,
            "Label.AbuseType.SexualContent": {
                displayLabel: "Label.AbuseType.SexualContent.Kids",
                moderatorNote: "Label.AbuseType.SexualContent.Note.Kids",
                education: {
                    ruleTitle: "Heading.RuleExplanation.SexualContent.Kids",
                    ruleDescriptionBullets: "Description.RuleExplanation.Bullets.SexualContent.Kids",
                    importanceTitle: "Heading.RuleImportance.Kids",
                    importanceDescription: "Description.RuleImportance.SexualContent.Kids",
                    policyKey: "kids-sexual-content",
                    deduplicationKey: "dating"
                }
            }
        },
        c4 = (0, oc.createContext)(void 0),
        c3 = t => {
            let {
                enableIxp: n = !1,
                children: r
            } = t, {
                translate: i,
                ageExperience: a = "default"
            } = cW(), {
                data: o,
                isLoading: s,
                error: u
            } = (() => {
                let {
                    httpGet: t,
                    userModerationApiUrl: n
                } = cW();
                return (0, cu.useQuery)({
                    queryKey: ["not-approved-data"],
                    queryFn: () => t("".concat(n, "/v1/not-approved")),
                    staleTime: 1 / 0
                })
            })(), {
                data: l,
                isLoading: c,
                isFetching: d
            } = (t => {
                let {
                    enabled: n
                } = t, {
                    ageExperience: r = "default",
                    ixp: i
                } = cW(), a = (0, cu.useQuery)({
                    queryKey: ["ixp/".concat(c0)],
                    queryFn: async () => {
                        if (!i) return {};
                        try {
                            return await i.fetchLayer(c0)
                        } catch (t) {
                            return {}
                        }
                    },
                    staleTime: 1 / 0,
                    enabled: n && !!i
                }), o = a.data && "FFlagKidsNotApprovedPageTreatment2" in a.data;
                return (0, oc.useEffect)(() => {
                    "kids" === r && o && (null == i || i.logExposure(c0))
                }, [r, o, i]), a
            })({
                enabled: n
            }), {
                data: f,
                isLoading: h
            } = (() => {
                let {
                    httpGet: t,
                    apiGatewayUrl: n
                } = cW();
                return (0, cu.useQuery)({
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
            })(), p = "kids" === a && n && (null == l ? void 0 : l.FFlagKidsNotApprovedPageTreatment2) === !0, v = (null == o ? void 0 : o.punishedUserId) ? o : void 0, y = (0, oc.useMemo)(() => {
                var t;
                let n, r = new Set;
                (null == v ? void 0 : v.violation) && cY(v) ? v.violation.abuseTypeTranslationKeys.forEach(t => {
                    r.add(t)
                }) : null == v || null == (t = v.badUtterances) || t.forEach(t => {
                    r.add(t.labelTranslationKey)
                });
                let a = [...r].filter(Boolean);
                return {
                    translatedReasons: p ? (n = new Set, a.forEach(t => {
                        var r, a;
                        let o = i(null != (r = null == (a = c2[t]) ? void 0 : a.displayLabel) ? r : t);
                        o && n.add(o)
                    }), [...n]) : a.map(t => i(t)).filter(Boolean),
                    untranslatedReasons: a
                }
            }, [p, v, i]), g = (0, oc.useMemo)(() => {
                let t = (null == v ? void 0 : v.messageToUser) || i("Description.Violation", {
                    startLink: "",
                    endLink: ""
                });
                if (!p || !(null == v ? void 0 : v.labelTranslationKey)) return t;
                let n = c2[v.labelTranslationKey];
                return n && i(n.moderatorNote) || t
            }, [p, v, i]), b = s || n && c && d || h, w = (0, oc.useMemo)(() => ({
                isLoading: b,
                error: u,
                punishmentData: v,
                violationReasons: y,
                ixpData: l,
                isKidsTreatment: p,
                moderatorNote: g,
                commutationEligibility: f
            }), [b, u, v, y, l, p, g, f]);
            return (0, m.jsx)(c4.Provider, {
                value: w,
                children: r
            })
        },
        c6 = () => {
            let t = (0, oc.useContext)(c4);
            if (!t) throw Error("useNotApprovedPagePunishment must be used within a NotApprovedPagePunishmentProvider");
            return t
        };

    function c8() {
        let {
            sendAnalyticsEvent: t,
            platform: n,
            readOnly: r
        } = cW(), {
            isKidsTreatment: i,
            ixpData: a
        } = c6(), o = (null == a ? void 0 : a.FFlagKidsNotApprovedPageTreatment2) === !0;
        return (0, oc.useCallback)((a, s) => {
            var u, l;
            u = null != r && r, l = {
                ...s,
                ...o ? {
                    isKidsTreatment: i
                } : {}
            }, u || t({
                eventName: "NotApprovedPageEvent",
                context: "NotApprovedPageV2",
                properties: {
                    eventType: a,
                    timestamp: Date.now(),
                    platform: n,
                    ...l
                }
            })
        }, [t, n, r, i, o])
    }
    var c5 = ((l = c5 || {}).Warn = "Warn", l.Delete = "Delete", l.Hour1 = "Ban 1 Hour", l.Hour6 = "Ban 6 Hours", l.Day1 = "Ban 1 Day", l.Day3 = "Ban 3 Days", l.Day7 = "Ban 7 Days", l.Day14 = "Ban 14 Days", l.Day30 = "Ban 30 Days", l.Day60 = "Ban 60 Days", l.Month6 = "Ban 6 Months", l.Year1 = "Ban 1 Year", l),
        c9 = {
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
        c7 = {
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
        de = "Email";

    function dt(t, n, r) {
        if (r === de || "VPC" === r) return !0;
        let i = new Date(n) < new Date;
        return "Warn" === t || "Delete" !== t && i
    }
    var dn = (0, oc.createContext)(void 0),
        dr = t => {
            var n, r;
            let {
                pages: i,
                unmappedViolationKeys: a,
                hasEducationalPages: o,
                commutationEligibility: s,
                children: u
            } = t, [l, c] = (0, oc.useState)(0), [d, f] = (0, oc.useState)(!1), h = null != (n = null == (r = i[l]) ? void 0 : r.pageName) ? n : "unknown", p = i.length, v = 0 === l, y = l === p - 1, g = (0, oc.useMemo)(() => {
                var t;
                return null != (t = null == s ? void 0 : s.educational_pass_eligible) && t
            }, [s]), b = (0, oc.useCallback)(() => {
                l < p - 1 && (f(!0), c(t => t + 1))
            }, [l, p]), w = (0, oc.useCallback)(() => {
                l > 0 && c(t => t - 1)
            }, [l]), x = (0, oc.useCallback)(() => {
                if (p <= 1 || "second-chance-intro" === h || "intro" === h) return 0;
                let t = p - 1,
                    n = l;
                return (t -= !!g, n -= !!g, t <= 0) ? 0 : Math.round(n / t * 100)
            }, [l, p, h, g]), P = (0, oc.useMemo)(() => {
                var t, n, r;
                return {
                    currentPage: l,
                    currentPageName: h,
                    totalPages: p,
                    goToNextPage: b,
                    goToPreviousPage: w,
                    isFirstPage: v,
                    isLastPage: y,
                    getProgress: x,
                    hasEducationalPages: o,
                    currentPageConfigs: null != (t = null == (n = i[l]) ? void 0 : n.pageItems) ? t : [],
                    CurrentCtaComponent: null == (r = i[l]) ? void 0 : r.CtaComponent,
                    unmappedViolationKeys: a,
                    hasNavigatedForward: d
                }
            }, [l, h, p, b, w, v, y, x, i, o, a, d]);
            return (0, m.jsx)(dn.Provider, {
                value: P,
                children: u
            })
        },
        di = () => {
            let t = (0, oc.useContext)(dn);
            if (!t) throw Error("usePageNavigation must be used within PageNavigationProvider");
            return t
        },
        da = t => {
            let {
                punishmentData: n,
                commutationEligibility: r
            } = t, {
                isFirstPage: i,
                currentPageConfigs: a,
                currentPageName: o
            } = di(), s = a.map(t => {
                if (!t.getIsVisible(n, o, r)) return null;
                let i = t.renderComponent;
                return (0, m.jsx)("div", {
                    children: (0, m.jsx)(i, {
                        punishmentData: n
                    })
                }, t.configName)
            }).filter(Boolean);
            return (0, m.jsx)("div", {
                className: "flex flex-col ".concat(i ? "gap-xlarge" : "gap-[36px]"),
                children: s
            })
        },
        ds = () => {
            let t = cW().translate,
                {
                    onLogout: n
                } = cW(),
                r = c8(),
                [i, a] = (0, oc.useState)(!1),
                o = (0, cj.useMutation)({
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
            return (0, m.jsxs)(cO.Popover, {
                children: [(0, m.jsx)(cO.PopoverTrigger, {
                    asChild: !0,
                    children: (0, m.jsx)(c_.IconButton, {
                        icon: "icon-filled-three-dots-vertical",
                        ariaLabel: t("Label.OpenMenu"),
                        variant: "Utility",
                        size: "Medium"
                    })
                }), (0, m.jsx)(cO.PopoverContent, {
                    side: "bottom",
                    align: "end",
                    ariaLabel: t("Label.MenuContent"),
                    children: (0, m.jsx)(cD.Menu, {
                        size: "Medium",
                        children: (0, m.jsx)(cD.MenuItem, {
                            value: "one",
                            title: t("Action.LogOut"),
                            onSelect: () => {
                                o.mutate()
                            },
                            disabled: i,
                            trailing: i ? (0, m.jsx)(cN.ProgressCircle, {
                                size: "Small",
                                ariaLabel: t("Label.LogoutProgress"),
                                variant: "Indeterminate"
                            }) : void 0
                        })
                    })
                })]
            })
        },
        du = () => {
            let t = cW().translate,
                {
                    getProgress: n
                } = di(),
                r = n();
            return (0, m.jsx)(cM.ProgressBar, {
                value: r,
                ariaLabel: t("Label.PageProgress"),
                style: {
                    visibility: 0 === r ? "hidden" : "visible"
                }
            })
        },
        dl = () => {
            let t = cW().translate,
                {
                    goToPreviousPage: n
                } = di();
            return (0, m.jsx)(c_.IconButton, {
                size: "Medium",
                variant: "Utility",
                icon: "icon-filled-chevron-large-left",
                onClick: n,
                "data-testid": "back-button",
                className: "margin-left-[-12px]",
                ariaLabel: t("Action.Back")
            })
        },
        dc = t => {
            var n;
            let {
                punishmentData: r
            } = t, {
                isFirstPage: i,
                totalPages: a
            } = di(), {
                readOnly: o
            } = cW(), s = cW().translate, {
                punishmentTypeDescription: u,
                verificationCategory: l
            } = r, c = l ? s("Heading.Suspended") : s(null != (n = c9[u]) ? n : "") || s("Heading.Suspended");
            return i ? (0, m.jsx)("div", {
                "data-testid": "not-approved-dialog-header",
                children: (0, m.jsxs)("div", {
                    className: "flex justify-between items-center gap-medium",
                    children: [(0, m.jsxs)("div", {
                        className: "flex gap-small items-center padding-y-medium",
                        children: [(0, m.jsx)(cL.Icon, {
                            name: "Delete" === u ? "icon-regular-circle-slash" : "icon-regular-triangle-exclamation",
                            size: "Large",
                            className: "Warn" !== u || l ? "content-system-alert" : "content-system-warning"
                        }), (0, m.jsx)("span", {
                            className: "text-heading-small",
                            children: c
                        })]
                    }), !o && (0, m.jsx)(ds, {})]
                })
            }) : (0, m.jsx)("div", {
                "data-testid": "not-approved-dialog-header",
                children: (0, m.jsxs)("div", {
                    className: "flex flex-col gap-large items-start",
                    children: [(0, m.jsx)(dl, {}), a > 2 && (0, m.jsx)(du, {})]
                })
            })
        },
        dd = t => {
            let {
                punishmentData: n,
                setIsDialogOpen: r
            } = t, {
                CurrentCtaComponent: i,
                currentPageName: a
            } = di();
            return i ? (0, m.jsx)("div", {
                className: "flex flex-col gap-large justify-between medium:items-end",
                children: (0, m.jsx)(i, {
                    punishmentData: n,
                    setIsDialogOpen: r
                }, a)
            }) : null
        },
        df = t => {
            let {
                readOnly: n
            } = t;
            return (0, m.jsxs)("div", {
                className: "shrink-0 flex flex-row justify-between items-center gap-medium",
                children: [(0, m.jsx)("div", {
                    className: "bg-shift-100 height-[45px] width-[300px] max-width-[85%] radius-medium"
                }), !n && (0, m.jsx)("div", {
                    className: "bg-shift-100 height-[35px] width-[35px] radius-medium shrink-0"
                })]
            })
        },
        dh = () => (0, m.jsxs)("div", {
            className: "flex flex-col gap-large",
            "data-testid": "loading-skeleton-content",
            children: [(0, m.jsx)("div", {
                className: "bg-shift-100 height-[20px] width-full max-width-[450px] radius-medium"
            }), (0, m.jsxs)("div", {
                className: "flex flex-col gap-medium",
                children: [(0, m.jsx)("div", {
                    className: "bg-shift-100 height-[30px] width-[125px] radius-medium"
                }), (0, m.jsx)("div", {
                    className: "bg-shift-100 height-[120px] width-full radius-medium"
                })]
            }), (0, m.jsxs)("div", {
                className: "flex flex-col gap-medium",
                children: [(0, m.jsx)("div", {
                    className: "bg-shift-100 height-[30px] width-[200px] radius-medium"
                }), (0, m.jsx)("div", {
                    className: "bg-shift-100 height-[160px] width-full radius-medium"
                })]
            })]
        }),
        dp = () => (0, m.jsx)("div", {
            className: "shrink-0 flex width-full justify-end medium:flex-row",
            children: (0, m.jsx)("div", {
                className: "bg-shift-100 height-[40px] width-full medium:width-[90px] radius-medium"
            })
        }),
        dv = () => {
            let {
                readOnly: t
            } = cW();
            return t ? null : (0, m.jsx)("div", {
                className: "shrink-0 flex justify-end items-center",
                children: (0, m.jsx)(ds, {})
            })
        },
        dm = t => {
            let {
                error: n
            } = t, r = cW().translate;
            return n && console.error(n), (0, m.jsx)("div", {
                className: "flex flex-col height-full min-height-0",
                children: (0, m.jsxs)("div", {
                    className: "grow-1 flex flex-col items-center justify-center gap-medium padding-xxlarge radius-medium bg-surface-100 width-full min-height-[225px]",
                    children: [(0, m.jsx)(cL.Icon, {
                        name: "icon-regular-triangle-exclamation",
                        size: "XLarge"
                    }), (0, m.jsx)("span", {
                        className: "text-body-large content-emphasis margin-none",
                        children: r("Heading.Error")
                    })]
                })
            })
        },
        dy = (0, oc.createContext)(void 0),
        dg = t => {
            let {
                children: n
            } = t, {
                currentPage: r,
                currentPageName: i,
                unmappedViolationKeys: a
            } = di(), o = c8(), s = (0, oc.useRef)(Date.now()), u = (0, oc.useRef)(r), l = (0, oc.useRef)(i), c = (0, oc.useRef)(!0), d = () => Date.now() - s.current;
            (0, oc.useEffect)(() => {
                a.forEach(t => {
                    o("unmappedViolationKey", {
                        unmappedViolationKey: t
                    })
                })
            }, [a]), (0, oc.useEffect)(() => {
                if (c.current) {
                    c.current = !1;
                    return
                }
                let t = d();
                o(r > u.current ? "continueClicked" : "backClicked", {
                    pageName: l.current,
                    timeOnPageMs: t
                }), s.current = Date.now(), u.current = r, l.current = i
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
            return (0, m.jsx)(dy.Provider, {
                value: h,
                children: n
            })
        },
        db = () => {
            let t = (0, oc.useContext)(dy);
            if (!t) throw Error("usePageAnalytics must be used within PageAnalyticsProvider");
            return t
        },
        dw = {
            ruleTitle: "Heading.RuleExplanation.Dating",
            ruleSubtitle: "SubHeading.RuleExplanation.Dating",
            ruleDescription: "Description.RuleExplanation.Dating",
            importanceTitle: "Heading.RuleImportance",
            importanceDescription: "Description.RuleImportance.Dating",
            policyKey: "dating"
        },
        dx = {
            ruleTitle: "Heading.RuleExplanation.BullyingHarassmentDiscrimination",
            ruleSubtitle: "SubHeading.RuleExplanation.BullyingHarassmentDiscrimination",
            ruleDescription: "Description.RuleExplanation.BullyingHarassmentDiscrimination",
            importanceTitle: "Heading.RuleImportance",
            importanceDescription: "Description.RuleImportance.BullyingHarassmentDiscrimination",
            policyKey: "bullying-harassment-discrimination"
        },
        dP = {
            ruleTitle: "Heading.RuleExplanation.MisusingRobloxSystems",
            ruleSubtitle: "SubHeading.RuleExplanation.MisusingRobloxSystems",
            ruleDescription: "Description.RuleExplanation.MisusingRobloxSystems",
            ruleDescriptionBullets: "Description.RuleExplanation.Bullets.MisusingRobloxSystems",
            importanceTitle: "Heading.RuleImportance",
            importanceDescription: "Description.RuleImportance.MisusingRobloxSystems",
            policyKey: "misusing-roblox-systems"
        },
        dR = {
            ruleTitle: "Heading.RuleExplanation.PII",
            ruleSubtitle: "SubHeading.RuleExplanation.PII",
            ruleDescription: "Description.RuleExplanation.PII",
            ruleDescriptionBullets: "Description.RuleExplanation.Bullets.PII",
            importanceTitle: "Heading.RuleImportance",
            importanceDescription: "Description.RuleImportance.PII",
            policyKey: "pii"
        },
        dT = {
            ruleTitle: "Heading.RuleExplanation.SSHAndIllegalRegulatedActivities",
            ruleSubtitle: "SubHeading.RuleExplanation.SSHAndIllegalRegulatedActivities",
            ruleDescription: "Description.RuleExplanation.SSHAndIllegalRegulatedActivities",
            ruleDescriptionBullets: "Description.RuleExplanation.Bullets.SSHAndIllegalRegAct",
            importanceTitle: "Heading.RuleImportance",
            importanceDescription: "Description.RuleImportance.SSHAndIllegalRegulatedActivities",
            policyKey: "ssh-and-illegal-regulated-activities"
        },
        dS = {
            "Label.AbuseType.CheatandExploits": dP,
            "Label.AbuseType.ContestsandSweepstakes": dT,
            "Label.AbuseType.Dating": dw,
            "Label.AbuseType.DirectingUsersOffPlatform": {
                ruleTitle: "Heading.RuleExplanation.DirectingUsersOffPlatform",
                ruleSubtitle: "SubHeading.RuleExplanation.DirectingUsersOffPlatform",
                ruleDescription: "Description.RuleExplanation.DirectingUsersOffPlatform",
                importanceTitle: "Heading.RuleImportance",
                importanceDescription: "Description.RuleImportance.DirectingUsersOffPlatform",
                policyKey: "directing-users-off-platform"
            },
            "Label.AbuseType.DiscriminatoryContent": dx,
            "Label.AbuseType.DisruptiveAudio": dP,
            "Label.AbuseType.EncouragingDangerousBehavior": dT,
            "Label.AbuseType.ExtortionandBlackmail": dx,
            "Label.AbuseType.Harassment": dx,
            "Label.AbuseType.IllegalandRegulatedContent": dT,
            "Label.AbuseType.Impersonation": dx,
            "Label.AbuseType.IrlDangerousActivities": dT,
            "Label.AbuseType.MisusingRobloxSystems": dP,
            "Label.AbuseType.OffPlatformSpeechandBehavior": dx,
            "Label.AbuseType.PrivacyAskingforPII": dR,
            "Label.AbuseType.PrivacyGivingPII": dR,
            "Label.AbuseType.RealLifeThreats": dx,
            "Label.AbuseType.Scamming": dP,
            "Label.AbuseType.SexualContent": dw,
            "Label.AbuseType.Spam": {
                ruleTitle: "Heading.RuleExplanation.Spam",
                ruleSubtitle: "SubHeading.RuleExplanation.Spam",
                ruleDescription: "Description.RuleExplanation.Spam",
                importanceTitle: "Heading.RuleImportance",
                importanceDescription: "Description.RuleImportance.Spam",
                policyKey: "spam"
            },
            "Label.AbuseType.SuicideSelfHarm": dT,
            "Label.AbuseType.Swearing": {
                ruleTitle: "Heading.RuleExplanation.Swearing",
                ruleSubtitle: "SubHeading.RuleExplanation.Swearing",
                ruleDescription: "Description.RuleExplanation.Swearing",
                importanceTitle: "Heading.RuleImportance",
                importanceDescription: "Description.RuleImportance.Swearing",
                policyKey: "swearing"
            },
            "Label.AbuseType.ThreatsOrAbuseOfRobloxEmployeesOrAffiliates": dx,
            "Label.AbuseType.ViolentContentAndGore": {
                ruleTitle: "Heading.RuleExplanation.ViolentContentAndGore",
                ruleSubtitle: "SubHeading.RuleExplanation.ViolentContentAndGore",
                ruleDescription: "Description.RuleExplanation.ViolentContentAndGore",
                importanceTitle: "Heading.RuleImportance",
                importanceDescription: "Description.RuleImportance.ViolentContentAndGore",
                policyKey: "violent-content-and-gore"
            },
            "Label.AbuseType.VirtualCasino": dT,
            "Label.Sublabel.RealLifeEvents": {
                ruleTitle: "Heading.RuleExplanation.RealLifeEvents",
                ruleSubtitle: "SubHeading.RuleExplanation.RealLifeEvents",
                ruleDescription: "Description.RuleExplanation.RealLifeEvents",
                ruleDescriptionBullets: "Description.RuleExplanation.Bullets.RealLifeEvents",
                importanceTitle: "Heading.RuleImportance",
                importanceDescription: "Description.RuleImportance.RealLifeEvents",
                policyKey: "real-life-events"
            },
            "Label.Sublabel.RomanceOrSex": dw
        },
        dE = (t, n) => {
            if (n) {
                let n = c2[t];
                if (n) return n.education
            }
            return dS[t]
        },
        dq = t => {
            let {
                size: n = "Medium"
            } = t, r = cW().translate, i = c8();
            return (0, m.jsx)("div", {
                "data-testid": "appeals-process",
                children: (0, m.jsx)("p", {
                    children: (0, m.jsx)(cB.Link, {
                        href: "https://en.help.roblox.com/hc/en-us/articles/360000245263-Appeal-Your-Content-Moderation",
                        target: "_blank",
                        rel: "noreferrer noopener",
                        size: n,
                        color: "Standard",
                        variant: "Inline",
                        underline: "always",
                        isExternal: !1,
                        onClick: () => {
                            i("appealsProcessClicked")
                        },
                        children: r("Action.ViewAppealGuidelines")
                    })
                })
            })
        },
        dk = {
            getIsVisible: t => t.showAppealsProcessLink,
            renderComponent: dq,
            configName: "appeals-process"
        },
        dA = "{startLink}",
        dC = "{endLink}",
        dI = (t, n) => (r, i, a, o) => {
            var s;
            let [u, l] = t(r, {
                startLink: dA,
                endLink: dC,
                ...a
            }).split(dA, 2), [c, d] = null != (s = null == l ? void 0 : l.split(dC, 2)) ? s : [];
            return (0, m.jsxs)("p", {
                className: "text-body-large",
                children: [u, (0, m.jsx)("a", {
                    href: i,
                    className: "content-link",
                    rel: "noreferrer",
                    onClick: () => {
                        null != o && n && n(o)
                    },
                    children: c
                }), d]
            })
        },
        dL = {
            getIsVisible: t => [de, "VPC"].includes(t.verificationCategory),
            renderComponent: t => {
                let {
                    punishmentData: n
                } = t, r = cW().translate, {
                    websiteUrl: i
                } = cW(), a = dI(r), {
                    verificationCategory: o
                } = n, s = "".concat(i, "/"), u = a("VPC" === o ? "Label.ParentReactivationNotice" : "Label.EmailReactivationNotice", s);
                return (0, m.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    children: [(0, m.jsx)("span", {
                        className: "text-heading-medium",
                        children: r("Label.ChargebackNextSteps")
                    }), u]
                })
            },
            configName: "chargeback-steps"
        },
        dj = {
            getIsVisible: t => "Delete" !== t.punishmentTypeDescription,
            renderComponent: t => {
                let {
                    punishmentData: n
                } = t, r = cW().translate, {
                    hasEducationalPages: i
                } = di(), {
                    isKidsTreatment: a
                } = c6(), o = c8(), {
                    showUGCAvatarGuidelinesLink: s,
                    context: u
                } = n, l = null == u ? void 0 : u.IS_ALT_INFORMED;
                return (0, m.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    children: [(0, m.jsx)("span", {
                        className: "text-heading-medium",
                        children: r(a ? "Heading.WhatNext" : "Label.RuleBreakingAddsUp")
                    }), (0, m.jsxs)("div", {
                        className: "flex flex-col gap-medium",
                        children: [(0, m.jsx)("p", {
                            className: "text-body-large",
                            children: r(a ? "Description.Foreshadow.Kids" : "Description.Foreshadow")
                        }), l && (0, m.jsx)("p", {
                            className: "text-body-large",
                            children: r("Description.LinkedAccounts")
                        }), (!!s || !i) && (0, m.jsx)(cV.Button, {
                            as: "a",
                            href: s ? "https://create.roblox.com/docs/marketplace/marketplace-policy#general-creation-guidelines" : "https://en.help.roblox.com/hc/en-us/articles/203313410-Roblox-Community-Standards",
                            target: "_blank",
                            rel: "noreferrer noopener",
                            variant: "Standard",
                            size: "Small",
                            onClick: () => {
                                o(s ? "ugcGuidelinesClicked" : "communityGuidelineClicked")
                            },
                            children: r(s ? "Action.ViewRulesUGCAvatarGuidelines" : "Action.ViewRules")
                        })]
                    })]
                })
            },
            configName: "prevention-steps"
        },
        dO = function(t, n, r, i) {
            let a = arguments.length > 4 && void 0 !== arguments[4] && arguments[4],
                o = arguments.length > 5 ? arguments[5] : void 0;
            if (a) {
                if ("Warn" === r) return i("Description.WarningDescription.Kids");
                if ("Delete" === r) return i("Description.BannedDescription.Kids");
                if (o) {
                    let t = new Date(o);
                    if (!Number.isNaN(t.getTime())) return i("Description.SuspendedUntil", {
                        date: t.toLocaleDateString(void 0, {
                            year: "numeric",
                            month: "long",
                            day: "numeric"
                        }),
                        time: t.toLocaleTimeString(void 0, {
                            hour: "numeric",
                            minute: "numeric"
                        })
                    })
                }
            }
            if ("Delete" === r) return i("Description.BrokeRulesBanned");
            let s = c7[null != n ? n : ""],
                u = s ? i(s) : "";
            return t.length > 0 ? u ? i("Description.BrokeRulesTypePolicy.V2", {
                type: u,
                policy: t.join(", ").toLowerCase()
            }) : i("Description.BrokeRulesPolicy.V2", {
                policy: t.join(", ").toLowerCase()
            }) : u ? i("Description.BrokeRulesType", {
                type: u
            }) : i("Description.BrokeRulesGeneric")
        },
        dD = {
            getIsVisible: () => !0,
            renderComponent: t => {
                var n, r, i;
                let {
                    punishmentData: a
                } = t, o = cW().translate, {
                    violationReasons: s,
                    isKidsTreatment: u
                } = c6(), {
                    violation: l,
                    punishmentTypeDescription: c,
                    endDate: d
                } = a, f = null == l || null == (i = l.evidence) || null == (r = i.displayMeta) ? void 0 : r.capitalizedKey, h = dO(null != (n = null == s ? void 0 : s.translatedReasons) ? n : [], f, c, o, u, d);
                return (0, m.jsx)("span", {
                    className: "text-body-medium",
                    children: h
                })
            },
            configName: "punishment-description"
        },
        dN = "/safety-dashboard",
        d_ = function() {
            var t;
            let {
                preferViolationDetail: n = !1
            } = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}, {
                websiteUrl: r,
                platform: i,
                onAppealsRedirect: a
            } = cW(), {
                punishmentData: o
            } = c6(), s = c8(), u = n ? null == o || null == (t = o.violation) ? void 0 : t.uid : void 0;
            return {
                handleAppealsClick: (0, oc.useCallback)(() => {
                    let t;
                    if (s("appealsPortalClicked"), a) return void a(u);
                    try {
                        t = new URL(dN, r)
                    } catch (n) {
                        t = new URL(dN, "https://www.roblox.com")
                    }
                    t.searchParams.set("t_source", i), u ? t.searchParams.set("vid", u) : t.hash = "/violations", window.open(t.toString(), "_blank", "noopener,noreferrer")
                }, [s, a, u, r, i])
            }
        },
        dM = {
            getIsVisible: (t, n, r) => {
                var i;
                return !(null != (i = null == r ? void 0 : r.educational_pass_eligible) && i) || "second-chance-intro" === n
            },
            renderComponent: t => {
                let {
                    punishmentData: n
                } = t, r = cW().translate, {
                    handleAppealsClick: i
                } = d_({
                    preferViolationDetail: !0
                }), {
                    isKidsTreatment: a
                } = c6();
                return (0, m.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    "data-testid": "report-mistake",
                    children: [(0, m.jsx)("p", {
                        className: "text-body-large",
                        children: r(a ? "Description.Mistake.Kids" : "Description.Mistake.V3")
                    }), (0, m.jsx)(cV.Button, {
                        variant: "Standard",
                        size: "Small",
                        onClick: i,
                        children: r("Action.SendAppeal")
                    }), n.showAppealsProcessLink && (0, m.jsx)(dq, {
                        punishmentData: n,
                        size: "Large"
                    })]
                })
            },
            configName: "report-mistake"
        },
        dB = t => {
            let {
                url: n,
                altLabelKey: r
            } = t, i = cW().translate, [a, o] = (0, oc.useState)(!0);
            return (0, m.jsxs)("div", {
                className: "flex aspect-1-1 justify-center items-center bg-shift-200 radius-medium",
                children: [(0, m.jsx)("img", {
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
                }), (0, m.jsx)("div", {
                    "data-testid": "spinner-container",
                    className: a ? void 0 : "hidden",
                    children: (0, m.jsx)(cN.ProgressCircle, {
                        ariaLabel: i("Label.LoadingImage"),
                        size: "Medium",
                        variant: "Indeterminate"
                    })
                })]
            })
        },
        dV = t => new Date(t).toLocaleString(void 0, {
            month: "long",
            day: "numeric",
            year: "numeric",
            hour: "numeric",
            minute: "numeric"
        });

    function dU() {
        let {
            formatFullDate: t
        } = cW();
        return null != t ? t : dV
    }
    var dF = t => {
            let {
                fieldLabel: n,
                fieldValue: r,
                preline: i = !1,
                showColon: a = !0
            } = t;
            return (0, m.jsxs)("div", {
                className: "flex flex-col",
                children: [(0, m.jsx)("span", {
                    className: "text-title-medium",
                    children: a ? "".concat(n, ":") : n
                }), (0, m.jsx)("p", {
                    className: "text-body-medium",
                    style: {
                        wordBreak: "break-word",
                        whiteSpace: i ? "pre-line" : "normal"
                    },
                    children: r
                })]
            })
        },
        dG = () => {
            let t = cW().translate,
                {
                    handleAppealsClick: n
                } = d_(),
                {
                    readOnly: r
                } = cW();
            return r ? null : (0, m.jsx)(cV.Button, {
                onClick: n,
                variant: "Standard",
                size: "Small",
                children: t("Action.ViewMore")
            })
        },
        dK = {
            getIsVisible: cY,
            renderComponent: t => {
                var n, r;
                let {
                    punishmentData: i
                } = t, {
                    violation: a,
                    consequenceTransparencyMessage: o
                } = i, s = cW().translate, u = dU(), l = c8(), c = null == a || null == (r = a.evidence) ? void 0 : r.elements, d = null != (n = null == c ? void 0 : c.filter(t => c$(t))) ? n : [], f = [], h = [];
                d.forEach(t => {
                    var n;
                    "image" === t.type ? f.push((0, m.jsx)(dB, {
                        url: t.url,
                        altLabelKey: t.labelKey
                    }, t.url)) : h.push((0, m.jsx)(dF, {
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
                        })(s, t.textKey, t.textKeyParameters, l) : null != (n = t.text) ? n : ""
                    }, t.labelKey))
                });
                let p = f.length > 0;
                return (0, m.jsxs)("div", {
                    "data-testid": "violation-grid",
                    className: "flex flex-col gap-medium medium:flex-row medium:gap-large",
                    children: [p && (0, m.jsx)("div", {
                        className: "shrink-0 width-[50%] medium:width-full medium:basis-[40%]",
                        children: f[0]
                    }), (0, m.jsxs)("div", {
                        className: "flex flex-col gap-small width-full",
                        children: [h, (0, m.jsx)(dF, {
                            fieldLabel: s("Label.ReviewDate"),
                            fieldValue: u(i.beginDate)
                        }), o && (0, m.jsx)(dF, {
                            fieldLabel: s("Label.DecisionMethod"),
                            fieldValue: o
                        }), (0, m.jsx)(dG, {})]
                    })]
                })
            },
            configName: "violation-evidence"
        },
        dW = t => {
            let {
                badUtterances: n
            } = t, [r, i] = (0, oc.useState)(!1), a = cW().translate;
            return (0, m.jsxs)("div", {
                className: "flex flex-col gap-small",
                children: [(0, m.jsxs)("div", {
                    className: "flex flex-col",
                    children: [(0, m.jsxs)("span", {
                        className: "text-title-medium",
                        children: [a("Label.OffensiveItem.V2"), ":"]
                    }), (0, m.jsxs)("div", {
                        className: "flex flex-col items-start",
                        children: [n.slice(0, 4).map(t => (0, m.jsx)("p", {
                            className: "text-body-medium",
                            style: {
                                wordBreak: "break-word"
                            },
                            children: t.utteranceText
                        }, t.utteranceText)), n.slice(4).map(t => (0, m.jsx)("p", {
                            className: "text-body-medium ".concat(r ? "" : "hidden"),
                            style: {
                                wordBreak: "break-word"
                            },
                            children: t.utteranceText
                        }, t.utteranceText))]
                    })]
                }), n.length > 4 && (0, m.jsx)(cV.Button, {
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
                return !cY(t) && (null != (n = null == (r = t.badUtterances) ? void 0 : r.length) ? n : 0) > 0
            },
            renderComponent: t => {
                let {
                    punishmentData: n
                } = t, r = cW().translate, i = dU(), {
                    badUtterances: a,
                    consequenceTransparencyMessage: o
                } = n;
                return (0, m.jsxs)("div", {
                    className: "flex flex-col gap-small",
                    "data-testid": "bad-utterances",
                    children: [(0, m.jsx)(dW, {
                        badUtterances: null != a ? a : []
                    }), (0, m.jsx)(cU.Divider, {}), (0, m.jsx)(dF, {
                        fieldLabel: r("Label.ReviewDate"),
                        fieldValue: i(n.beginDate)
                    }), o && (0, m.jsx)(dF, {
                        fieldLabel: r("Label.DecisionMethod"),
                        fieldValue: o
                    }), (0, m.jsx)(dG, {})]
                })
            },
            configName: "bad-utterances"
        },
        dz = {
            getIsVisible: t => {
                var n, r;
                return !cY(t) && (null != (n = null == (r = t.badUtterances) ? void 0 : r.length) ? n : 0) === 0
            },
            renderComponent: t => {
                let n = cW().translate,
                    r = dU(),
                    {
                        punishmentData: i
                    } = t,
                    {
                        beginDate: a,
                        consequenceTransparencyMessage: o
                    } = i;
                return (0, m.jsxs)("div", {
                    className: "flex flex-col gap-small",
                    "data-testid": "simple-evidence",
                    children: [(0, m.jsx)(dF, {
                        fieldLabel: n("Label.ReviewDate"),
                        fieldValue: r(a)
                    }), o && (0, m.jsx)(dF, {
                        fieldLabel: n("Label.DecisionMethod"),
                        fieldValue: o
                    }), (0, m.jsx)(dG, {})]
                })
            },
            configName: "simple-evidence"
        },
        dJ = {
            getIsVisible: () => !0,
            renderComponent: t => {
                let {
                    punishmentData: n
                } = t, r = cW().translate, {
                    isKidsTreatment: i
                } = c6(), a = [dK, dH, dz].map(t => t.getIsVisible(n) ? (0, m.jsx)("div", {
                    children: t.renderComponent({
                        punishmentData: n
                    })
                }, t.configName) : null).filter(Boolean);
                return (0, m.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    "data-testid": "reviewed-evidence-container",
                    children: [(0, m.jsx)("span", {
                        className: "text-title-large",
                        children: r(i ? "Heading.RecentlyChecked" : "Label.LatestActivity")
                    }), (0, m.jsxs)("div", {
                        className: "flex flex-col gap-xsmall",
                        children: [(0, m.jsx)("div", {
                            className: "padding-large bg-shift-100 radius-medium",
                            children: a
                        }), (0, m.jsx)("span", {
                            className: "text-caption-medium content-muted",
                            children: n.interventionId
                        })]
                    })]
                })
            },
            configName: "rewiewed-evidence"
        },
        dQ = {
            getIsVisible: () => !0,
            renderComponent: () => {
                let t = cW().translate;
                return (0, m.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    children: [(0, m.jsx)("span", {
                        className: "text-heading-medium",
                        children: t("Heading.SecondChance.Details")
                    }), (0, m.jsx)("p", {
                        className: "text-body-large",
                        children: t("Description.SecondChance.Details")
                    })]
                })
            },
            configName: "second-chance-conclusion"
        },
        dX = {
            getIsVisible: () => !0,
            renderComponent: () => {
                let t = cW().translate;
                return (0, m.jsxs)("div", {
                    className: "flex flex-col gap-large",
                    children: [(0, m.jsx)("span", {
                        className: "text-heading-medium",
                        children: t("Heading.SecondChance")
                    }), (0, m.jsx)("p", {
                        className: "text-body-large",
                        children: t("Description.SecondChance.Second")
                    })]
                })
            },
            configName: "second-chance-intro"
        },
        d$ = {
            getIsVisible: () => !0,
            renderComponent: () => {
                var t;
                let n = cW().translate,
                    {
                        violationReasons: r,
                        isKidsTreatment: i,
                        moderatorNote: a
                    } = c6(),
                    o = (null != (t = null == r ? void 0 : r.translatedReasons) ? t : []).join(", ") || n("Label.AbuseType.Other");
                return (0, m.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    "data-testid": "what-happened",
                    children: [(0, m.jsx)("span", {
                        className: "text-title-large",
                        children: n(i ? "Heading.Why" : "Label.WhatHappened")
                    }), (0, m.jsx)("div", {
                        className: "padding-large bg-shift-100 radius-medium flex flex-col gap-small",
                        children: i ? (0, m.jsx)(dF, {
                            fieldLabel: o,
                            fieldValue: a,
                            showColon: !1,
                            preline: !0
                        }) : (0, m.jsxs)(oc.Fragment, {
                            children: [(0, m.jsx)(dF, {
                                fieldLabel: n("Label.Reason"),
                                fieldValue: o
                            }), (0, m.jsx)(dF, {
                                fieldLabel: n("Label.ModeratorNote"),
                                fieldValue: a,
                                preline: !0
                            })]
                        })
                    })]
                })
            },
            configName: "what-happened"
        },
        dZ = t => t.split("\n").map(t => t.trim()).filter(Boolean),
        dY = t => ({
            getIsVisible: () => !0,
            renderComponent: () => {
                let n = cW().translate,
                    r = t.description ? n(t.description) : void 0,
                    i = r ? dZ(r) : [],
                    a = t.descriptionBullets ? n(t.descriptionBullets) : void 0,
                    o = a ? dZ(a) : [];
                return (0, m.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    "data-testid": t.policyKey,
                    children: [(0, m.jsx)("span", {
                        className: "text-heading-medium",
                        children: n(t.title)
                    }), t.subtitle && (0, m.jsx)("span", {
                        className: "text-title-large",
                        children: n(t.subtitle)
                    }), (0, m.jsxs)("div", {
                        className: "flex flex-col gap-small",
                        children: [i.length > 0 && (0, m.jsx)("div", {
                            className: "flex flex-col gap-medium",
                            children: i.map(t => (0, m.jsx)("p", {
                                className: "text-body-large",
                                children: t
                            }, t))
                        }), o.length > 0 && (0, m.jsx)("div", {
                            className: "flex flex-col gap-xsmall padding-left-small",
                            children: o.map(t => (0, m.jsxs)("div", {
                                className: "flex flex-row gap-small",
                                children: [(0, m.jsx)("p", {
                                    className: "text-body-large",
                                    children: "•"
                                }), (0, m.jsx)("p", {
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
        d0 = t => {
            let {
                isDisabled: n = !1
            } = t, r = cW().translate, {
                goToNextPage: i
            } = di();
            return (0, m.jsx)(cV.Button, {
                variant: "Emphasis",
                size: "Medium",
                onClick: i,
                "data-testid": "continue-button",
                isDisabled: n,
                children: r("Action.Continue")
            })
        },
        d1 = t => {
            let {
                setIsDialogOpen: n
            } = t, r = cW().translate;
            return (0, m.jsx)(cV.Button, {
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
        d2 = ((c = d2 || {})[c.Reactivate = 0] = "Reactivate", c[c.Paused = 1] = "Paused", c[c.VerifyEmail = 2] = "VerifyEmail", c[c.VerifyVPC = 3] = "VerifyVPC", c),
        d4 = t => {
            let {
                onClose: n
            } = t, r = cW().translate;
            return (0, m.jsxs)("div", {
                className: "width-full flex gap-large items-center justify-between radius-medium padding-medium stroke-system-alert stroke-standard maf-error-alert",
                style: {
                    backgroundColor: "rgba(255, 0, 0, 0.1)"
                },
                "data-testid": "error-alert",
                children: [(0, m.jsxs)("div", {
                    className: "flex gap-small items-center",
                    children: [(0, m.jsx)(cL.Icon, {
                        name: "icon-filled-circle-x",
                        className: "content-system-alert"
                    }), (0, m.jsx)("span", {
                        className: "text-body-medium",
                        children: r("Heading.Error")
                    })]
                }), (0, m.jsx)(c_.IconButton, {
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
        d3 = t => {
            let n, {
                    proceedAction: r,
                    setIsDialogOpen: i,
                    isAgreed: a,
                    isDisabled: o = !1
                } = t,
                s = cW().translate,
                {
                    sendPageEvent: u
                } = db(),
                {
                    userModerationApiUrl: l,
                    httpPost: c,
                    onVerifyEmail: d,
                    onVerifyParent: f,
                    onAccountReactivated: h
                } = cW(),
                [p, v] = (0, oc.useState)(!1),
                y = (0, cj.useMutation)({
                    mutationFn: () => c("".concat(l, "/v1/not-approved/reactivate")),
                    onSuccess: async () => {
                        await new Promise(t => {
                            setTimeout(t, 2e3)
                        }), h()
                    },
                    onMutate: () => {
                        v(!0), u("reactivateClicked")
                    },
                    onError: t => {
                        console.error("reactivateMutation error", t instanceof Error ? t.message : "Unknown error"), v(!1)
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
                            namespace: "account_management/AccountManagement",
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
            return (0, m.jsxs)(oc.Fragment, {
                children: [y.isError && (0, m.jsx)(d4, {
                    onClose: () => {
                        y.reset()
                    }
                }), (0, m.jsx)(cV.Button, {
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
        d6 = function(t) {
            let {
                punishmentTypeDescription: n,
                endDate: r,
                verificationCategory: i
            } = t;
            switch (i) {
                case de:
                    return 2;
                case "VPC":
                    return 3;
                default:
                    return +!dt(n, r, i)
            }
        },
        d8 = t => {
            let {
                endDate: n
            } = t, r = cW().translate, i = ((t, n) => {
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
            return (0, m.jsxs)("div", {
                "data-testid": "suspension-duration-alert",
                className: "flex flex-wrap gap-small bg-shift-100 padding-x-medium padding-y-small stroke-standard stroke-default items-center radius-medium",
                children: [(0, m.jsx)(cL.Icon, {
                    name: "icon-filled-triangle-exclamation",
                    className: "content-system-warning"
                }), (0, m.jsx)("span", {
                    className: "text-title-medium",
                    children: r("Label.Suspension")
                }), (0, m.jsx)("p", {
                    className: "text-body-medium",
                    children: i
                })]
            })
        },
        d5 = t => {
            let {
                punishmentData: n,
                setIsDialogOpen: r
            } = t, i = cW().translate, a = c8(), {
                endDate: o,
                punishmentTypeDescription: s
            } = n, u = d6(n), [l, c] = (0, oc.useState)(!1), [d, f] = (0, oc.useState)(!1);
            return (0, oc.useEffect)(() => {
                let t;
                return Object.values(c5).includes(s) && s.startsWith("Ban") && (t = setTimeout(() => {
                    f(t => !t)
                }, 6e4)), () => {
                    clearTimeout(t)
                }
            }, [d, s]), 1 === u ? (0, m.jsxs)("div", {
                className: "flex flex-col gap-large medium:flex-row",
                children: [(0, m.jsx)(d8, {
                    endDate: o
                }), (0, m.jsx)(d3, {
                    proceedAction: u,
                    setIsDialogOpen: r,
                    isAgreed: l,
                    isDisabled: !0
                })]
            }) : (0, m.jsxs)(oc.Fragment, {
                children: [(0, m.jsx)(cF.Checkbox, {
                    label: i("Label.RuleAcknowledgment"),
                    placement: "Start",
                    size: "Small",
                    isChecked: l,
                    onCheckedChange: t => {
                        c(!0 === t), a("checkboxChecked")
                    },
                    className: "self-start",
                    "data-testid": "rule-confirmation-checkbox"
                }), (0, m.jsx)(d3, {
                    proceedAction: u,
                    setIsDialogOpen: r,
                    isAgreed: l,
                    isDisabled: !l
                })]
            })
        },
        d9 = () => {
            let t = cW().translate,
                {
                    handleAppealsClick: n
                } = d_({
                    preferViolationDetail: !0
                });
            return (0, m.jsx)(cV.Button, {
                variant: "SoftEmphasis",
                size: "Medium",
                onClick: n,
                "data-testid": "appeals-button",
                children: t("Action.ReportMistake")
            })
        },
        d7 = async (t, n) => n("".concat(t, "/moderation-appeal-service/v2/consequence-commutation"), {
            type: "EDUCATIONAL_PASS"
        }), fe = () => {
            let t = cW().translate,
                {
                    sendPageEvent: n
                } = db(),
                {
                    httpPost: r,
                    apiGatewayUrl: i,
                    onAccountReactivated: a
                } = cW(),
                {
                    handleAppealsClick: o
                } = d_({
                    preferViolationDetail: !0
                }),
                [s, u] = (0, oc.useState)(!1),
                l = (0, cj.useMutation)({
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
            return (0, m.jsxs)(oc.Fragment, {
                children: [l.isError && (0, m.jsx)(d4, {
                    onClose: () => {
                        l.reset()
                    }
                }), (0, m.jsxs)("div", {
                    className: "flex flex-col gap-small medium:flex-row-reverse",
                    children: [(0, m.jsx)(cV.Button, {
                        onClick: () => {
                            l.mutate()
                        },
                        variant: "Emphasis",
                        size: "Medium",
                        className: "min-width-2600",
                        "data-testid": "second-chance-reactivate-button",
                        isLoading: s,
                        isDisabled: s,
                        children: t("Action.OK")
                    }), (0, m.jsx)(cV.Button, {
                        onClick: o,
                        variant: "Standard",
                        size: "Medium",
                        "data-testid": "second-chance-send-appeal-button",
                        children: t("Action.SendAppeal")
                    })]
                })]
            })
        }, ft = () => {
            let t = cW().translate,
                [n, r] = (0, oc.useState)(!1);
            return (0, m.jsxs)(oc.Fragment, {
                children: [(0, m.jsx)(cF.Checkbox, {
                    label: t("Label.RuleAcknowledgment"),
                    placement: "Start",
                    size: "Small",
                    isChecked: n,
                    onCheckedChange: t => {
                        r(!0 === t)
                    },
                    className: "self-start",
                    "data-testid": "understand-continue-checkbox"
                }), (0, m.jsx)(d0, {
                    isDisabled: !n
                })]
            })
        }, fn = function(t, n, r) {
            let i = arguments.length > 3 && void 0 !== arguments[3] && arguments[3],
                a = [],
                o = new Set,
                s = [],
                u = new Map;
            return t.forEach(t => {
                var n;
                let r = dE(t, i);
                if (!r) return void o.add(t);
                let a = null != (n = r.deduplicationKey) ? n : r.policyKey,
                    l = u.get(a);
                l ? r.deduplicationKey && !l.deduplicationKey && u.set(a, r) : (s.push(a), u.set(a, r))
            }), s.forEach(t => {
                let i = u.get(t);
                if (!i) return;
                let o = n && !r ? ft : d0;
                a.push({
                    pageName: "policy-rule-".concat(i.policyKey),
                    pageItems: [dY({
                        title: i.ruleTitle,
                        subtitle: i.ruleSubtitle,
                        description: i.ruleDescription,
                        descriptionBullets: i.ruleDescriptionBullets,
                        policyKey: i.policyKey
                    })],
                    CtaComponent: o
                }), a.push({
                    pageName: "policy-importance-".concat(i.policyKey),
                    pageItems: [dY({
                        title: i.importanceTitle,
                        description: i.importanceDescription,
                        descriptionBullets: i.importanceDescriptionBullets,
                        policyKey: i.policyKey
                    })],
                    CtaComponent: o
                })
            }), {
                educationalPages: a,
                unmappedViolationKeys: [...o]
            }
        }, fr = function(t, n, r, i) {
            var a;
            let o = arguments.length > 4 && void 0 !== arguments[4] && arguments[4],
                s = [],
                u = "Delete" === t.punishmentTypeDescription,
                l = null != (a = null == r ? void 0 : r.educational_pass_eligible) && a;
            if (s.push({
                    pageName: "intro",
                    pageItems: [dD, d$, dJ, ...u ? [dk] : []],
                    CtaComponent: u ? d9 : d0
                }), u) return {
                pages: s,
                unmappedViolationKeys: []
            };
            l && !i && s.push({
                pageName: "second-chance-intro",
                pageItems: [dX, dM],
                CtaComponent: d0
            });
            let {
                educationalPages: c,
                unmappedViolationKeys: d
            } = fn(n, l, i, o);
            s.push(...c);
            let f = i ? d1 : l ? ft : d5;
            return s.push({
                pageName: "resolution",
                pageItems: [dj, dL, dM, ...i && l ? [dk] : []],
                CtaComponent: f
            }), l && !i && s.push({
                pageName: "second-chance-conclusion",
                pageItems: [dQ],
                CtaComponent: fe
            }), {
                pages: s,
                unmappedViolationKeys: d
            }
        }, fi = t => {
            let {
                onOpenChange: n,
                children: r
            } = t, {
                readOnly: i
            } = cW(), {
                punishmentData: a,
                violationReasons: o,
                isLoading: s,
                error: u,
                commutationEligibility: l,
                isKidsTreatment: c
            } = c6(), d = null == o ? void 0 : o.untranslatedReasons, f = (0, oc.useMemo)(() => (null != d ? d : []).some(t => dE(t, c)), [d, c]), {
                pages: h,
                unmappedViolationKeys: p
            } = (0, oc.useMemo)(() => a ? fr(a, null != d ? d : [], l, i, c) : {
                pages: [],
                unmappedViolationKeys: []
            }, [a, d, l, i, c]);
            return s ? r({
                header: (0, m.jsx)(df, {
                    readOnly: !!i
                }),
                body: (0, m.jsx)(dh, {}),
                ctas: (0, m.jsx)(dp, {})
            }) : u || !a ? r({
                header: (0, m.jsx)(dv, {}),
                body: (0, m.jsx)(dm, {
                    error: u
                })
            }) : (0, m.jsx)(dr, {
                pages: h,
                unmappedViolationKeys: p,
                hasEducationalPages: f,
                commutationEligibility: l,
                children: (0, m.jsx)(dg, {
                    children: r({
                        header: (0, m.jsx)(dc, {
                            punishmentData: a
                        }),
                        body: (0, m.jsx)(da, {
                            punishmentData: a,
                            commutationEligibility: l
                        }),
                        ctas: (0, m.jsx)(dd, {
                            punishmentData: a,
                            setIsDialogOpen: n
                        })
                    })
                })
            })
        }, fa = t => {
            let {
                impressionEvent: n
            } = t, {
                translate: r,
                websiteUrl: i,
                onLogout: a
            } = cW(), o = c8(), s = dI(r, o), [u, l] = (0, oc.useState)(!1);
            (0, oc.useEffect)(() => {
                o(n)
            }, [o, n]);
            let c = (0, cj.useMutation)({
                mutationFn: async () => {
                    await a()
                },
                onMutate: () => {
                    l(!0), o("logoutClicked")
                },
                onError: t => {
                    let r = t instanceof Error ? t.message : "Unknown error";
                    o("error", {
                        additionalInfo: "".concat(n, ": Error logging out - ").concat(r)
                    }), l(!1)
                },
                retry: 0
            });
            return (0, m.jsx)(cs.Dialog, {
                open: !0,
                isModal: !0,
                size: "Medium",
                hasCloseAffordance: !1,
                children: (0, m.jsxs)(cs.DialogContent, {
                    className: "[&_p]:margin-none [&_h2]:margin-none",
                    children: [(0, m.jsxs)(cs.DialogBody, {
                        className: "gap-large flex flex-col",
                        children: [(0, m.jsx)(cs.DialogTitle, {
                            className: "text-heading-large margin-none",
                            children: r("Heading.AccountIssue")
                        }), s("Description.ResolveIssue", i)]
                    }), (0, m.jsxs)(cs.DialogFooter, {
                        className: "flex justify-end gap-small flex-col-reverse medium:flex-row",
                        children: [(0, m.jsx)(cV.Button, {
                            variant: "Standard",
                            size: "Medium",
                            isLoading: u,
                            isDisabled: u,
                            onClick: () => {
                                c.mutate()
                            },
                            children: r("Action.Logout")
                        }), (0, m.jsx)(cV.Button, {
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
        }, fo = t => {
            var n;
            let {
                open: r,
                onClose: i
            } = t, [a, o] = (0, oc.useState)(!0), s = void 0 !== r, u = t => {
                s && !t ? null == i || i() : o(t)
            }, {
                translate: l,
                renderSelfServiceDeactivated: c,
                shouldShowGenericFallback: d,
                readOnly: f
            } = cW(), {
                punishmentData: h,
                isLoading: p,
                error: v
            } = c6(), y = c8(), g = !p && !v && void 0 !== h, b = !p && !v && !h;
            if ((0, oc.useEffect)(() => {
                    if (g) {
                        var t;
                        y((null == (t = h.context) ? void 0 : t.SelfServiceDeactivated) ? "accountReactivationPageRendered" : "pageRendered", {
                            interventionId: h.interventionId,
                            punishedUserId: h.punishedUserId,
                            isReactivationEligible: dt(h.punishmentTypeDescription, h.endDate, h.verificationCategory),
                            verificationCategory: h.verificationCategory
                        })
                    }
                }, [g, h]), b && !f) return null;
            if (g && (null == (n = h.context) ? void 0 : n.SelfServiceDeactivated)) return c ? (0, m.jsx)(oc.Fragment, {
                children: c()
            }) : (0, m.jsx)(fa, {
                impressionEvent: "accountReactivationRedirectRendered"
            });
            let w = g && (null == d ? void 0 : d(h));
            return w ? (0, m.jsx)(fa, {
                impressionEvent: w
            }) : (0, m.jsx)(cs.Dialog, {
                open: null != r ? r : a,
                size: "Large",
                hasCloseAffordance: !!f,
                closeLabel: l("Action.Close"),
                isModal: !0,
                onOpenChange: f ? t => {
                    t || u(!1)
                } : void 0,
                children: (0, m.jsx)(cs.DialogContent, {
                    className: "width-full [&_p]:margin-none [&_h2]:margin-none",
                    onOpenAutoFocus: t => {
                        t.preventDefault()
                    },
                    children: (0, m.jsx)(cs.DialogBody, {
                        className: "flex flex-col height-[85vh] max-height-[800px]",
                        children: (0, m.jsx)(fi, {
                            onOpenChange: u,
                            children: t => {
                                let {
                                    header: n,
                                    body: r,
                                    ctas: i
                                } = t;
                                return (0, m.jsxs)("div", {
                                    className: "flex flex-col gap-large height-full min-height-0",
                                    children: [(0, m.jsx)(cs.DialogTitle, {
                                        className: "padding-none",
                                        children: n
                                    }), (0, m.jsxs)("div", {
                                        className: "grow-1 scroll-y min-height-0",
                                        children: [r, (0, m.jsx)("div", {
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
                                    }), (0, m.jsx)("div", {
                                        className: "shrink-0",
                                        children: i
                                    })]
                                })
                            }
                        })
                    })
                })
            })
        }, fs = new op.QueryClient({
            defaultOptions: {
                queries: {
                    refetchOnWindowFocus: !1,
                    retry: !1,
                    refetchOnMount: !1,
                    staleTime: 6e4
                }
            }
        }), fu = function(t) {
            let {
                open: n,
                onClose: r
            } = t;
            return (0, m.jsx)(ov.QueryClientProvider, {
                client: fs,
                children: (0, m.jsx)(c3, {
                    enableIxp: !0,
                    children: (0, m.jsx)(fo, {
                        open: n,
                        onClose: r
                    })
                })
            })
        }, fl = t.i(894244), fc = t.i(839165);
    let fd = function() {
            let {
                translate: t
            } = (0, oR.useTranslation)(), n = (0, lc.useAuthentication)(), r = (0, od.useRouter)(), i = "https://usermoderation.".concat("roblox.com"), a = "https://apis.roblox.com", o = "https://".concat("roblox.com"), s = "CreatorHub", u = (0, oc.useCallback)(t => {
                ly.default.logHostRoutedEvent({
                    eventType: t.eventName,
                    context: t.context,
                    properties: t.properties
                })
            }, []), l = (0, oc.useCallback)(t => !!t.verificationCategory && cz.VerificationRedirectRendered, []), c = (0, oc.useCallback)(async () => {
                let t = await (0, fl.getAuthorizationEndpoint)({
                    redirectUri: "https://create.roblox.com"
                });
                await n.logout(), await r.push(t)
            }, [r, n]), d = (0, oc.useCallback)(() => {
                r.reload()
            }, [r]);
            return (0, oc.useMemo)(() => ({
                translate: t,
                httpGet: fc.authenticatedHttpGet,
                httpPost: fc.authenticatedHttpPost,
                userModerationApiUrl: i,
                apiGatewayUrl: a,
                websiteUrl: o,
                sendAnalyticsEvent: u,
                platform: s,
                shouldShowGenericFallback: l,
                onLogout: c,
                onAccountReactivated: d
            }), [t, i, a, o, u, s, l, c, d])
        },
        ff = () => {
            let t = fd();
            return (0, m.jsx)(cK, {
                config: t,
                children: (0, m.jsx)(fu, {})
            })
        },
        fh = (0, oR.withTranslation)(() => {
            let {
                themeMode: t
            } = (0, ll.useThemeMode)();
            return (0, m.jsx)(lh.UIThemeProvider, {
                theme: t,
                children: (0, m.jsx)(ff, {})
            })
        }, [ci.TranslationNamespace.NotApproved, ci.TranslationNamespace.Moderation, ci.TranslationNamespace.AppealsPortal, ci.TranslationNamespace.CommonUIControls, ci.TranslationNamespace.Error, ci.TranslationNamespace.DashboardModeration]),
        fp = () => {
            let {
                status: t
            } = (0, lc.useAuthentication)();
            return "moderated" === t ? (0, m.jsx)(fh, {}) : null
        };
    var fv = t.i(200400);
    let fm = (0, lw.default)(() => t.A(14667), {
            loadableGenerated: {
                modules: [573249]
            },
            ssr: !1
        }),
        fy = t => {
            let {
                children: n
            } = t;
            return (0, m.jsx)(fv.UniversalFeatureRestrictionsProvider, {
                Surface: fm,
                children: n
            })
        };
    var fg = t.i(336964);

    function fb(t) {
        return "object" == typeof t && null !== t && "Component" in t
    }

    function fw(t) {
        var n;
        let {
            store: r
        } = t, i = null != r ? r : fg.dialogStore, {
            render: a,
            options: o,
            isOpen: s
        } = (0, oc.useSyncExternalStore)(i.subscribe, i.getSnapshot, i.getSnapshot);
        if ((0, oc.useEffect)(() => {
                if (s || null === o || !o.shouldUnmountOnClose) return;
                let t = setTimeout(() => i.clearContent(), 150);
                return () => clearTimeout(t)
            }, [s, o, i]), null === a) return null;
        if ((null == o ? void 0 : o.mode) === "standalone" && fb(a)) return (0, oc.createElement)(a.Component, {
            ...a.props,
            open: s,
            onOpenChange: t => {
                t || i.close()
            }
        });
        let u = null != o ? o : fg.DEFAULT_RESOLVED_CONTENT_OPTIONS,
            l = fb(a) ? (0, oc.createElement)(a.Component, a.props) : a;
        return (0, m.jsx)(cs.Dialog, {
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
            children: l
        })
    }
    var fx = t.i(18685),
        fP = t.i(209534);

    function fR() {
        let {
            current: t
        } = (0, oc.useSyncExternalStore)(fP.snackbarStore.subscribe, fP.snackbarStore.getSnapshot, fP.snackbarStore.getSnapshot);
        return null === t ? null : (0, m.jsx)(fx.Snackbar, {
            ...t.props,
            onClose: () => fP.snackbarStore.dismiss()
        }, t.id)
    }
    var fT = t.i(943758);
    let fS = (0, oc.createContext)({
        primarySidebarExpanded: !1,
        setPrimarySidebarExpanded: () => {
            throw Error("Function not implemented. You may be trying to use this context outside of a provider.")
        }
    });
    fS.displayName = "LeftNavigationStateContext";
    let fE = t => {
        let {
            children: n
        } = t, [r, i] = (0, oc.useState)(!0), a = (0, oc.useMemo)(() => ({
            primarySidebarExpanded: r,
            setPrimarySidebarExpanded: i
        }), [r]);
        return (0, m.jsx)(fS.Provider, {
            value: a,
            children: n
        })
    };
    var fq = t.i(729904),
        fk = t.i(486736),
        fA = t.i(142330),
        fC = t.i(623983),
        fI = t.i(226519),
        fL = t.i(458442),
        fj = t.i(686762),
        fO = t.i(196990),
        fD = t.i(533968),
        fN = t.i(210205);
    let f_ = {
            [fA.AgreementType.ChildrenPrivacyPolicy]: "Label.ChildrenPrivacyPolicy",
            [fA.AgreementType.ConsentFlow]: "Label.ConsentFlow",
            [fA.AgreementType.LuobuThirdPartyDataUse]: "Label.LuobuThirdPartyDataUse",
            [fA.AgreementType.PersonalInformationPolicy]: "Label.PersonalInformationPolicy",
            [fA.AgreementType.PrivacyPolicy]: "Label.PrivacyPolicy",
            [fA.AgreementType.RefundTerms]: "Label.RefundTerms",
            [fA.AgreementType.RiderTerms]: "Label.RiderTerms",
            [fA.AgreementType.TermsOfService]: "Label.TermsOfService"
        },
        fM = ["/v1-studio-login"],
        fB = (0, oR.withTranslation)(() => {
            var t, n;
            let r = (0, od.useRouter)(),
                {
                    translate: i
                } = (0, oR.useTranslation)(),
                {
                    user: a,
                    logout: o
                } = (0, lc.useAuthentication)(),
                s = (0, oc.useRef)(!1),
                {
                    captureError: u,
                    error: l,
                    info: c
                } = (0, fN.useMetricsMonitoring)(),
                [d, f] = (0, oc.useState)(!1),
                [h, p] = (0, oc.useState)(!1),
                [v, y] = (0, oc.useState)([]),
                g = (0, oc.useCallback)(async t => {
                    async function n(t, r) {
                        if (r <= 0) return void l("User Agreement accept failed after retried ".concat(3, " times"));
                        try {
                            var i;
                            let a = null == (i = (await fO.userAgreementsClient.acceptUserAgreements(t)).results) ? void 0 : i.filter(t => 0 !== t.errorCode).map(t => t.agreementId);
                            a && a.length > 0 && await n(a, r - 1)
                        } catch (a) {
                            let i = (0, fD.getResponseFromError)(a);
                            (null == i ? void 0 : i.status) === l9.StatusCodes.UNAUTHORIZED ? (c("User Agreement accept failed with 401 from backend"), await od.default.push("/login")) : (l("User Agreement accept failed with status code ".concat(null == i ? void 0 : i.status)), await n(t, r - 1))
                        }
                    }
                    await n(t, 3)
                }, [l, c]),
                b = (0, oc.useCallback)(async () => {
                    try {
                        await o()
                    } catch (t) {
                        t instanceof Error && u(t), l("Logout after user reject update agreements failed")
                    } finally {
                        f(!1)
                    }
                }, [u, l, o]),
                w = (0, oc.useCallback)(async () => {
                    let t = v.map(t => t.id);
                    p(!0), await g(t), p(!1), f(!1)
                }, [g, v]),
                x = (0, oc.useCallback)(async () => {
                    try {
                        let t = fO.userAgreementsClient.getUserAgreements({
                                clientType: fA.ClientType.Studio
                            }),
                            n = await t;
                        n.length > 0 && (y([...n]), f(!0))
                    } catch (t) {
                        l("Fetch update user-agreements failed"), t instanceof Error && u(t)
                    }
                }, [u, l]);
            return (0, oc.useEffect)(() => {
                (null == a ? void 0 : a.id) === void 0 || s.current || !r.isReady || fM.some(t => r.pathname.startsWith(t)) || (x(), s.current = !0)
            }, [a, x, r.isReady, r.pathname]), (0, m.jsx)(fI.Dialog, {
                open: d,
                children: (0, m.jsx)(fL.DialogTemplate, {
                    onConfirm: w,
                    onCancel: b,
                    title: i("Heading.AgreementsUpdate"),
                    content: (0, m.jsxs)(m.Fragment, {
                        children: [(0, m.jsx)(fC.Typography, {
                            component: "p",
                            variant: "body1",
                            children: null != (t = null == (n = v.find(t => null != t.agreementBodyText)) ? void 0 : n.agreementBodyText) ? t : i("Description.AgreementsUpdate")
                        }), (0, m.jsx)("ul", {
                            children: v.map(t => {
                                var n;
                                let r;
                                return (0, m.jsx)("li", {
                                    children: (0, m.jsx)(fj.Link, {
                                        href: t.displayUrl,
                                        target: "__blank",
                                        children: (n = t.agreementType, void 0 === (r = f_[n]) ? i(r) : n)
                                    })
                                }, t.id)
                            })
                        })]
                    }),
                    confirmText: i("Button.Accept"),
                    cancelText: i("Button.Reject"),
                    loading: h
                })
            })
        }, [ci.TranslationNamespace.AgreementsUpdate]),
        {
            authenticationApi: fV
        } = {
            authenticationApi: ln
        },
        {
            discoveryApi: fU
        } = uC.ApplicationAuthorizationsClient,
        {
            usersApi: fF
        } = li.UsersClient,
        fG = (r = ly.default, t => {
            var n, i, a, o, s, u, l, c, d;
            let f, h;
            return r.logWebVitalsEvent({
                eventName: "webVitals",
                parameters: {
                    metricName: t.name,
                    metricStartTime: String(t.startTime),
                    metricValue: String(t.value),
                    metricLabel: t.label,
                    ...uq || (uq = {
                        staticAsset: void 0 === (f = null == (s = performance) || null == (o = s.getEntriesByType) || null == (a = o.call(s, "resource")) || null == (i = a.find) || null == (n = i.call(a, t => {
                            let {
                                initiatorType: n,
                                name: r
                            } = t;
                            return "script" === n && r.includes("_next/static/chunks/")
                        })) ? void 0 : n.transferSize) ? "unknown" : 0 === f ? "cached" : "network",
                        serviceWorker: (null == (u = navigator) ? void 0 : u.serviceWorker) ? navigator.serviceWorker.controller ? "controlled" : "uncontrolled" : "unsupported",
                        pageLoad: void 0 === (h = null == (d = performance) || null == (c = d.getEntriesByType) || null == (l = c.call(d, "navigation")[0]) ? void 0 : l.transferSize) ? "unknown" : 0 === h ? "cached" : "network"
                    })
                }
            })
        });
    (0, ow.c)({
        unifiedLogger: ly.default
    });
    let fK = (uh && (h = null != (d = document.querySelector('meta[name="'.concat("emotion-insertion-point-mui", '"]'))) ? d : void 0, p = null != (f = document.querySelector('meta[name="'.concat("emotion-insertion-point-tss", '"]'))) ? f : void 0), {
        muiCache: (0, oE.c)({
            key: ud,
            prepend: !0,
            insertionPoint: h
        }),
        tssCache: (0, oE.c)({
            key: uf,
            insertionPoint: p
        })
    });
    (0, oT.createThumbnailsClient)((0, la.getBEDEV1ServiceBasePath)("thumbnails"));
    let fW = {
            locale: l5.defaultLocale,
            nativeName: l5.defaultNativeName
        },
        fH = new l8.TranslationResourceProvider(fW, l5.fallbackLocale),
        fz = t => {
            let n, r, {
                children: i
            } = t;
            return n = (0, lg.useCustomDashboardService)(), r = (0, ov.useQueryClient)(), (0, oc.useEffect)(() => n.subscribe(t => {
                if ("external" === t.eventType) return void r.invalidateQueries({
                    queryKey: lb.customDashboardQueryKeys.universe(t.universeId)
                });
                if ("pin" === t.eventType || "unpin" === t.eventType) {
                    r.invalidateQueries({
                        queryKey: lb.customDashboardQueryKeys.list(t.universeId),
                        refetchType: "none"
                    }), r.invalidateQueries({
                        queryKey: lb.customDashboardQueryKeys.pinned(t.universeId)
                    }), r.invalidateQueries({
                        queryKey: lb.customDashboardQueryKeys.detail(t.universeId, t.dashboardId)
                    });
                    return
                }
                r.invalidateQueries({
                    queryKey: lb.customDashboardQueryKeys.list(t.universeId)
                }), r.invalidateQueries({
                    queryKey: lb.customDashboardQueryKeys.pinned(t.universeId)
                }), r.invalidateQueries({
                    queryKey: lb.customDashboardQueryKeys.suggestedName(t.universeId)
                }), r.invalidateQueries({
                    queryKey: lb.customDashboardQueryKeys.detail(t.universeId, t.dashboardId)
                })
            }), [n, r]), (0, m.jsx)(m.Fragment, {
                children: i
            })
        },
        fJ = {
            defaultLocale: l5.defaultLocale,
            title: l5.defaultMetadataJson["OpenGraph.Title"],
            description: l5.defaultMetadataJson["OpenGraph.Description"]
        },
        fQ = t => t,
        fX = () => ((() => {
            let {
                trackerClient: t
            } = (0, lv.useEventTrackerProvider)(), n = (0, oc.useCallback)(() => {
                let n = (0, l2.loadPageEventModel)();
                t.sendEvent(n)
            }, [t]);
            (0, l4.default)(void 0, n), (0, oc.useEffect)(() => n(), [n]), (0, oc.useEffect)(() => {
                ly.default.trackPageLoad()
            }, [])
        })(), (0, of.useReportWebVitals)(fG), null),
        f$ = {
            enabled: !0,
            isFetched: !0
        },
        fZ = t => {
            let {
                children: n
            } = t, {
                value: r
            } = (0, oP.useFlag)(uk.enableGroupModerationPage), i = (() => {
                let {
                    ready: t,
                    value: n
                } = (0, oP.useFlag)(lC.newCreatorWallets);
                return (0, oc.useMemo)(() => ({
                    visible: t && n
                }), [t, n])
            })();
            return (0, m.jsx)(ob.NavigationConfigsProvider, {
                currentProduct: "CreatorDashboard",
                environment: (0, fq.default)(),
                robloxEnvironment: "production",
                target: "global",
                drawerVariant: "belowAppBar",
                signalRCrossTab: f$,
                creatorWalletsNavigation: i,
                enableGroupModeration: null != r && r,
                children: n
            })
        },
        fY = new op.QueryClient({
            defaultOptions: {
                queries: {
                    refetchOnWindowFocus: !1,
                    retry: !1
                }
            }
        }),
        f0 = (0, om.initializeAuthStore)(),
        f1 = t => {
            var n;
            let {
                Component: r,
                pageProps: i,
                cache: a
            } = t, {
                query: o
            } = (0, od.useRouter)(), s = null != (n = r.getPageLayout) ? n : fQ, u = (0, oc.useMemo)(() => ({
                ...fJ,
                ...r.pageMetadata
            }), [r.pageMetadata]);
            return (0, og.useMaintenanceObserver)("https://create.roblox.com"), (0, oc.useEffect)(() => {
                up()
            }, []), lm.default.setUnifiedLoggerClient(ly.default), (0, m.jsx)(oh.ErrorBoundary, {
                children: (0, m.jsx)(uv, {
                    cache: null != a ? a : fK,
                    children: (0, m.jsxs)(l0, {
                        providers: [(0, m.jsx)(fT.BreadcrumbItemNameProvider, {}), (0, m.jsx)(ov.QueryClientProvider, {
                            client: fY
                        }), (0, m.jsx)(ox.C, {
                            client: lr.default
                        }), (0, m.jsx)(lg.CustomDashboardServiceProvider, {}), (0, m.jsx)(lg.UniverseFlaggedCustomDashboardProvider, {}), (0, m.jsx)(fz, {}), (0, m.jsx)(l6, {
                            pageLoggerConfig: r.loggerConfig
                        }), (0, m.jsx)(lv.EventTrackerProvider, {
                            trackerClient: lm.default
                        }), (0, m.jsx)(om.RobloxAuthenticationProvider, {
                            clientId: "4273917941353191905",
                            authenticationClient: fV,
                            discoveryClient: fU,
                            usersClient: fF,
                            store: f0
                        }), (0, m.jsx)(lQ.GroupsProvider, {}), (0, m.jsx)(ld, {}), (0, m.jsx)(lp, {
                            themeElement: "u" > typeof document ? document.documentElement : void 0
                        }), (0, m.jsx)(oR.LocalizationProvider, {
                            provider: fH
                        }), (0, m.jsx)(um.SnackbarProvider, {}), (0, m.jsx)(uy.DialogProvider, {}), (0, m.jsx)(lf.default, {}), (0, m.jsx)(oT.ThumbnailsProvider, {
                            baseUrl: lm.eventStreamBaseUrl
                        }), (0, m.jsx)(fk.SettingsProvider, {}), (0, m.jsx)(fZ, {}), (0, m.jsx)(l1.ThemeAwareStudioResourcesProvider, {}), (0, m.jsx)(ct, {}), (0, m.jsx)(lY.default, {}), (0, m.jsx)(fE, {}), (0, m.jsx)(oy.CookieConsentProvider, {
                            robloxSiteDomain: "roblox.com"
                        }), (0, m.jsx)(uA.AgeVerificationUpsellProvider, {}), (0, m.jsx)(fy, {})],
                        children: [(0, m.jsx)(fX, {}), (0, m.jsx)(lu, {
                            provider: fH
                        }), (0, m.jsx)(fR, {}), (0, m.jsx)(fw, {}), (0, m.jsx)(fp, {}), (0, m.jsx)(fB, {}), (0, m.jsx)(lZ, {}), (0, m.jsx)(co, {
                            openGraphMetadata: u
                        }), s((0, m.jsx)(r, {
                            ...i
                        }), {
                            query: o
                        })]
                    })
                })
            })
        };
    t.s(["CustomApp", 0, f1, "default", 0, f1, "reportWebVitals", 0, fG], 656350)
}, 681109, (t, n, r) => {
    let i = "/_app";
    (window.__NEXT_P = window.__NEXT_P || []).push([i, () => t.r(656350)]), n.hot && n.hot.dispose(function() {
        window.__NEXT_P.push([i])
    })
}, 733583, (t, n, r) => {
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
        }, void 0 !== t && (t.ab = "/ROOT/node_modules/.pnpm/next@16.3.0_@babel+core@7.29.0_supports-color@8.1.1__@opentelemetry+api@1.9.1_@playwrig_2bf1aa2500abc393a8e8c0b283d26d6e/node_modules/next/dist/compiled/web-vitals/");
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
                return U
            },
            LCPThresholds: function() {
                return G
            },
            TTFBThresholds: function() {
                return H
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
                return W
            },
            onTTFB: function() {
                return J
            }
        });
        var i, a, o, s, u, l = -1,
            c = function(t) {
                addEventListener("pageshow", function(n) {
                    n.persisted && (l = n.timeStamp, t(n))
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
                return l >= 0 ? i = "back-forward-cache" : r && (document.prerendering || f() > 0 ? i = "prerender" : document.wasDiscarded ? i = "restore" : r.type && (i = r.type.replace(/_/g, "-"))), {
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
            T = function() {
                return b < 0 && (b = w(), P(), c(function() {
                    setTimeout(function() {
                        b = w(), P()
                    }, 0)
                })), {
                    get firstHiddenTime() {
                        return b
                    }
                }
            },
            S = function(t) {
                document.prerendering ? addEventListener("prerenderingchange", function() {
                    return t()
                }, !0) : t()
            },
            E = [1800, 3e3],
            q = function(t, n) {
                n = n || {}, S(function() {
                    var r, i = T(),
                        a = h("FCP"),
                        o = p("paint", function(t) {
                            t.forEach(function(t) {
                                "first-contentful-paint" === t.name && (o.disconnect(), t.startTime < i.firstHiddenTime && (a.value = Math.max(t.startTime - f(), 0), a.entries.push(t), r(!0)))
                            })
                        });
                    o && (r = v(t, a, E, n.reportAllChanges), c(function(i) {
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
                    }), c(function() {
                        a = 0, r = v(t, i = h("CLS", 0), k, n.reportAllChanges), m(function() {
                            return r()
                        })
                    }), setTimeout(r, 0))
                }))
            },
            C = 0,
            I = 1 / 0,
            L = 0,
            j = function(t) {
                t.forEach(function(t) {
                    t.interactionId && (I = Math.min(I, t.interactionId), C = (L = Math.max(L, t.interactionId)) ? (L - I) / 7 + 1 : 0)
                })
            },
            O = function() {
                "interactionCount" in performance || i || (i = p("event", j, {
                    type: "event",
                    buffered: !0,
                    durationThreshold: 0
                }))
            },
            D = [],
            N = new Map,
            _ = 0,
            M = [],
            B = function(t) {
                if (M.forEach(function(n) {
                        return n(t)
                    }), t.interactionId || "first-input" === t.entryType) {
                    var n = D[D.length - 1],
                        r = N.get(t.interactionId);
                    if (r || D.length < 10 || t.duration > n.latency) {
                        if (r) t.duration > r.latency ? (r.entries = [t], r.latency = t.duration) : t.duration === r.latency && t.startTime === r.entries[0].startTime && r.entries.push(t);
                        else {
                            var i = {
                                id: t.interactionId,
                                latency: t.duration,
                                entries: [t]
                            };
                            N.set(i.id, i), D.push(i)
                        }
                        D.sort(function(t, n) {
                            return n.latency - t.latency
                        }), D.length > 10 && D.splice(10).forEach(function(t) {
                            return N.delete(t.id)
                        })
                    }
                }
            },
            V = function(t) {
                var n = self.requestIdleCallback || self.setTimeout,
                    r = -1;
                return t = g(t), "hidden" === document.visibilityState ? t() : (r = n(t), y(t)), r
            },
            U = [200, 500],
            F = function(t, n) {
                "PerformanceEventTiming" in self && "interactionId" in PerformanceEventTiming.prototype && (n = n || {}, S(function() {
                    O();
                    var r, a, o = h("INP"),
                        s = function(t) {
                            V(function() {
                                t.forEach(B);
                                var n, r = (n = Math.min(D.length - 1, Math.floor(((i ? C : performance.interactionCount || 0) - _) / 50)), D[n]);
                                r && r.latency !== o.value && (o.value = r.latency, o.entries = r.entries, a())
                            })
                        },
                        u = p("event", s, {
                            durationThreshold: null != (r = n.durationThreshold) ? r : 40
                        });
                    a = v(t, o, U, n.reportAllChanges), u && (u.observe({
                        type: "first-input",
                        buffered: !0
                    }), y(function() {
                        s(u.takeRecords()), a(!0)
                    }), c(function() {
                        _ = 0, D.length = 0, N.clear(), a = v(t, o = h("INP"), U, n.reportAllChanges)
                    }))
                }))
            },
            G = [2500, 4e3],
            K = {},
            W = function(t, n) {
                n = n || {}, S(function() {
                    var r, i = T(),
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
                            K[a.id] || (o(s.takeRecords()), s.disconnect(), K[a.id] = !0, r(!0))
                        });
                        ["keydown", "click"].forEach(function(t) {
                            addEventListener(t, function() {
                                return V(u)
                            }, !0)
                        }), y(u), c(function(i) {
                            r = v(t, a = h("LCP"), G, n.reportAllChanges), m(function() {
                                a.value = performance.now() - i.timeStamp, K[a.id] = !0, r(!0)
                            })
                        })
                    }
                })
            },
            H = [800, 1800],
            z = function t(n) {
                document.prerendering ? S(function() {
                    return t(n)
                }) : "complete" !== document.readyState ? addEventListener("load", function() {
                    return t(n)
                }, !0) : setTimeout(n, 0)
            },
            J = function(t, n) {
                n = n || {};
                var r = h("TTFB"),
                    i = v(t, r, H, n.reportAllChanges);
                z(function() {
                    var a = d();
                    a && (r.value = Math.max(a.responseStart - f(), 0), r.entries = [a], i(!0), c(function() {
                        (i = v(t, r = h("TTFB", 0), H, n.reportAllChanges))(!0)
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
                n = n || {}, S(function() {
                    var r, i = T(),
                        s = h("FID"),
                        l = function(t) {
                            t.startTime < i.firstHiddenTime && (s.value = t.processingStart - t.startTime, s.entries.push(t), r(!0))
                        },
                        d = function(t) {
                            t.forEach(l)
                        },
                        f = p("first-input", d);
                    r = v(t, s, et, n.reportAllChanges), f && (y(g(function() {
                        d(f.takeRecords()), f.disconnect()
                    })), c(function() {
                        r = v(t, s = h("FID"), et, n.reportAllChanges), u = [], o = -1, a = null, ee(addEventListener), u.push(l), Z()
                    }))
                })
            };
        n.exports = r
    }()
}, 816657, (t, n, r) => {
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
        a = t.r(733583);

    function o(t) {
        (0, i.useEffect)(() => {
            (0, a.onCLS)(t), (0, a.onFID)(t), (0, a.onLCP)(t), (0, a.onINP)(t), (0, a.onFCP)(t), (0, a.onTTFB)(t)
        }, [t])
    }("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), n.exports = r.default)
}, 87758, (t, n, r) => {
    n.exports = t.r(816657)
}]);

//# debugId=36f8ed5b-8f40-96f0-def1-5d208e7eaf46
//# sourceMappingURL=0vb7q5be7aqhr.js.map